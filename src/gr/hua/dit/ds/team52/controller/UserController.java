package gr.hua.dit.ds.team52.controller;

import gr.hua.dit.ds.team52.dao.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.WebRequest;


@Controller
@RequestMapping("/user")

public class UserController {

    @Autowired
    UserDAO userDAO;

    private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(16);

    @RequestMapping("/")
    public String showMyPage() {
        return "startpage";
    }



    @RequestMapping(value = "/CreateFormProccess")
    public String showRegistrationForm(WebRequest request, Model model) {
//        UserDto userDto = new UserDto();
        System.out.println("Hello" + request.getParameter("password"));

        String username = request.getParameter("username");

        String password = request.getParameter("password");

        String firstname = request.getParameter("firstname");

        String lastname = request.getParameter("lastname");

        String role = "ROLE_" + request.getParameter("role_selection");

//        model.addAttribute("user", userDto);
//        return new ModelAndView("redirect:/");
        return "redirect:/user/";

    }
}
