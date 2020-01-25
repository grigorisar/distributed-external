package gr.hua.dit.ds.team52.controller;

import gr.hua.dit.ds.team52.dao.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class HomeController {

    @Autowired
    UserDAO userDAO;

    private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(16);


    @RequestMapping("/")
    public String showfirstpage() {
        return "home/startpage";
    }
/*

    @RequestMapping("/create")
    public String createUser() {
        return "home/create-user";
    }
*/

    @RequestMapping(value="/logout", method = RequestMethod.GET)
    public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/login?logout";//You can redirect wherever you want, but generally it's a good practice to show login screen again.
    }

    @RequestMapping("/access_denied")
    public  String showAccessDenied() {
        return "home/access-denied";
    }
/*

    @RequestMapping("/example")
    public String showCSSExample() {
        return "examples/example";
    }

    @RequestMapping("/showForm")
    public String showForm() {
        return "helloworld-form";
    }

    @RequestMapping("/processForm")
    public String processForm() {
        return "helloworld";
    }

    @RequestMapping("/processFormv2")
    public String processFormv2(HttpServletRequest request, Model model) {
        String theName = request.getParameter("studentUserName");
        theName = theName.toUpperCase();
        String result = "Hello " + theName;
        model.addAttribute("message", result);
        return "helloworld";
    }
*/

//    =========================================================================================
/*

    @ResponseBody
    @PostMapping(value = "/create_user_process", produces = "plain/text")
    public String createUser(WebRequest request , HttpServletResponse response , Model model) {

        String role = request.getParameter("select");

        String username = request.getParameter("username");

        String password = request.getParameter("password");

        try {
            password = encoder.encode(password);
        } catch (Exception e) {
            System.out.println(e.toString());
        }

        String firstname = request.getParameter("firstname");

        String lastname = request.getParameter("lastname");


        if (role.contentEquals("Student" ) ) {
            int failed = Integer.parseInt(request.getParameter("failed"));

            String dept = request.getParameter("dept");

            String year = request.getParameter("year");

            System.out.println("here");

            role = "ROLE_" + role.toUpperCase();

//            Student student = new Student(firstname, lastname, username);

            boolean v = userDAO.addStudent( username, password, firstname, lastname, role, failed, dept, year);

            if ( !v ) return "User Already Exists";

        } else {
            String position = request.getParameter("position");

            role = "ROLE_" + role.toUpperCase();

            boolean v = userDAO.addStaff( username, password, firstname, lastname, role, position);

            if ( !v ) return "User Already Exists";

        }

        return "Registration Successful";
    }
*/


}
