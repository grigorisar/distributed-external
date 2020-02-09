package gr.hua.dit.ds.team52.controller;

import gr.hua.dit.ds.team52.dao.CompanyDAO;
import gr.hua.dit.ds.team52.dao.StudentDAO;
import gr.hua.dit.ds.team52.dao.UserDAO;
import gr.hua.dit.ds.team52.entity.Company;
import gr.hua.dit.ds.team52.entity.Petition;
import gr.hua.dit.ds.team52.entity.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {

    //Inject DAO its the same for all objects
    @Autowired
    private UserDAO userDAO;

    @Autowired
    private CompanyDAO companyDAO;

    @Autowired
    private StudentDAO studentDAO;


    @RequestMapping("/")
    public String showOptions(Model model){
        return "student/startpage-student";
    }

    @RequestMapping("/new_petition")
    public String createPetitionJSP(Model model){
        List<Company> companies = companyDAO.getCompanies();
        model.addAttribute("companies",companies);
        return "student/create-petition";
    }



    @ResponseBody
    @PostMapping(value = "/create_petition_process", produces = "plain/text")
    public String createPetition(WebRequest request , HttpServletResponse response , Model model) {
        String title = request.getParameter("title");

        String description = request.getParameter("description");
        String internshipName = request.getParameter("company");

        String currentUserName = null;

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {            //not 100% sure what this if is about  TODO check this condition
            currentUserName = authentication.getName();                             //get the logged in user's username
        }

        Student student = userDAO.getStudentByUsername(currentUserName);
        if (student.canSubmit()){ //if true
            try {
                Petition p = new Petition(title, description, "pending");
                p.setStudent_username(currentUserName);
                p.setInternship(companyDAO.getInternshipByName(internshipName));
                boolean v = studentDAO.savePetition(p);
                if (v) return "Petition successfully added";
                return "Petition with the same title already exists";
            }catch (Exception E){
                return "Cannot find Company or Internship";
            }
        } else { //if false
            return "Student cannot petition!";
        }
    }



}
