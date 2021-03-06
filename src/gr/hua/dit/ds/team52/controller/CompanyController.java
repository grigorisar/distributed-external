package gr.hua.dit.ds.team52.controller;

import com.google.gson.Gson;
import gr.hua.dit.ds.team52.dao.CompanyDAO;
import gr.hua.dit.ds.team52.dao.InternshipDAO;
import gr.hua.dit.ds.team52.dao.StudentDAO;
import gr.hua.dit.ds.team52.dao.UserDAO;
import gr.hua.dit.ds.team52.entity.Company;
import gr.hua.dit.ds.team52.entity.Internship;
import gr.hua.dit.ds.team52.entity.Petition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@Controller
@RequestMapping("/company")
public class CompanyController {

    @Autowired
    private StudentDAO studentDAO;

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private InternshipDAO internshipDAO;

    @Autowired
    private CompanyDAO companyDAO;

    @RequestMapping("/")
    public String showfirstpage() {
        return "internship/startpage-rep";
    }

//    @RequestMapping("/")
//    public String showfirstpage() {
//        return "internship/internship";
//    }

    @RequestMapping("/new_internship")
    public String newInternship(Model model){
        return "internship/new_internship";
    }

    @RequestMapping("/internship/{id}")
    public String getInternshipPetitions(@PathVariable("id")int id, Model model) {

        Internship inte = companyDAO.getInternshipByID(id);

        System.out.println("Internship id:" + inte.getId());

        Gson g = new Gson();

//        System.out.println(g.toJson(inte.getPetitions()));


//        System.out.println("Petitions :" + petitions.toString());

        model.addAttribute("petitions",inte.getPetitions());

        return "internship/petition-acceptor";
    }


    @RequestMapping("/internships")
    public String getInternships(Model model){

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            String username = authentication.getName(); //get username

            Company company = companyDAO.getCompanyByUsername(username);
            model.addAttribute("username", username);
            model.addAttribute("internships", company.getInternships());
            return "internship/list-internships";
        }
        return "home/access-denied";
    }

    @RequestMapping("/accept_petitions")
    public String acceptPetitions(Model model) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentUserName = null;
        try {
            currentUserName = authentication.getName();
        } catch (Exception e) {
            System.out.println("Can't get username");
        }

        System.out.println(currentUserName);

        try {
            List<Petition> petitions= studentDAO.getPetitionsPending(currentUserName);       //return all the petitions for the table
            model.addAttribute("petitions", petitions);
        } catch (Exception e) {

        }

        return "internship/petition-acceptor";

    }

    @RequestMapping(value = "/get_bio", params = {"username"})     //get a variable through the url
    public String getBio(@RequestParam(value = "username") String username, Model model) {
        model.addAttribute("student", studentDAO.getStudent(username));            //since IDs are unique get the first one of the list
        return "internship/student-bio";

    }

    @ResponseBody
    @RequestMapping(value = "/accept_petition_process",method = RequestMethod.POST)
    public String  updatePetition(WebRequest request ) {

        String title = request.getParameter("title");

        boolean v = studentDAO.acceptPetition(title);

        if ( !v ) return "Could not accept petition";

        return "Petition accepted";
    }

    @ResponseBody
    @RequestMapping(value = "/create_internship_process", method = RequestMethod.POST)
    public String  createInternship(WebRequest request ) {
        //Wrapped with Try Catch so all errors are handled properly
        try{
            Internship internship = new Internship();
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            if (!(authentication instanceof AnonymousAuthenticationToken)) {            //not 100% sure what this if is about  TODO check this condition
                String username =authentication.getName(); //get username
                // check for user credentials, has to be either company or admin
                try {
                    //search for Company username
                    internship.setCompany(companyDAO.getCompanyByUsername(username));
                }catch(Exception e){ //Company username not found
                    //check if user is an admin
                    if (userDAO.isAdmin(username)){
                        //set a mock company
                        internship.setCompany(companyDAO.company);
                    }else{
                        return  "Sorry friend, you cannot create an internship.";
                    }
                }
                //set fields
                internship.setTitle( request.getParameter("title"));
                internship.setSalary(Integer.parseInt(request.getParameter("salary")));
                internship.setDescription( request.getParameter("description"));
                internship.setStatus("pending");

                internshipDAO.saveInternship(internship);

                return "Successfully submitted internship";
            }
        }catch(Exception e) {
            e.printStackTrace();
        }
        return "Cannot submit internship"; //Only after save failure or false authentication
    }

}
