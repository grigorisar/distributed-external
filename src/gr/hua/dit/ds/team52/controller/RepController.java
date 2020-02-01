package gr.hua.dit.ds.team52.controller;

import gr.hua.dit.ds.team52.dao.StudentDAO;
import gr.hua.dit.ds.team52.dao.UserDAO;
import gr.hua.dit.ds.team52.entity.Petition;
import gr.hua.dit.ds.team52.entity.Staff;
import gr.hua.dit.ds.team52.entity.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.WebRequest;

import java.util.List;



@Controller
@RequestMapping("/rep")
public class RepController {

    @Autowired
    StudentDAO studentDAO;

    @RequestMapping("/")
    public String showfirstpage() {
        return "rep/startpage-rep";
    }

    @RequestMapping("/accept_petitions")
    public String createUser(Model model) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        String currentUserName = authentication.getName();

        List<Petition> staff = studentDAO.getPetitionsPending(currentUserName);       //return all the petitions for the table
        model.addAttribute("petitions", staff);


        return "rep/petition-acceptor";

    }

    @RequestMapping(value = "/get_bio", params = {"username"})     //get a variable through the url
    public String getBio(@RequestParam(value = "username") String username, Model model) {

        List<Student> list = studentDAO.getStudent(username);   //find the student with the username that was at the end of the url
        model.addAttribute("student", list.get(0));            //since IDs are unique get the first one of the list
        return "rep/student-bio";

    }


    @RequestMapping(value = "/accept_petition_process", produces = "plain/text", method = RequestMethod.POST)
    public @ResponseBody String  updatePetition(WebRequest request ) {

        String title = request.getParameter("title");

        boolean v = studentDAO.acceptPetition(title);

        if ( v ) return "Could not accept petition";

        return "Petition accepted";
    }

}
