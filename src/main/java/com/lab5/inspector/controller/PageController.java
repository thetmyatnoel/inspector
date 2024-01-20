package com.lab5.inspector.controller;

import com.lab5.inspector.entity.LoginInspector;
import com.lab5.inspector.entity.WaitingApart;
import com.lab5.inspector.service.LoginDbService;
import com.lab5.inspector.service.WaitingApartService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Slf4j
@CrossOrigin(origins = "*")
@Controller
public class PageController {

    @Autowired
    private LoginDbService loginDbService;
    @Autowired
    private WaitingApartService waitingApartService;


    @GetMapping("/index")
    public String index(Model model, @AuthenticationPrincipal LoginInspector loginInspector) {

        String username = loginInspector.getUsername();

        List<WaitingApart> pendingAparts = waitingApartService.getPendingApartmentsByUsername(username);
        List<WaitingApart> progressAparts = waitingApartService.getProgressApartmentsByUsername(username);
        List<WaitingApart> completeAparts = waitingApartService.getCompleteApartmentsByUsername(username);

        log.info("Number of Pending Aparts: " + pendingAparts.size());
        log.info("Number of Progress Aparts: " + progressAparts.size());
        log.info("Number of Complete Aparts: " + completeAparts.size());

        // Add attributes to the model
        model.addAttribute("username", username);
        model.addAttribute("pendingAparts", pendingAparts);
        model.addAttribute("progressAparts", progressAparts);
        model.addAttribute("completeAparts", completeAparts);

        return "index";
    }

    @GetMapping("/report")
    public String report(Model model, @AuthenticationPrincipal LoginInspector loginInspector)
    {
        String username = loginInspector.getUsername();


        model.addAttribute("username", username);
        return "report";
    }

    @GetMapping("/login")
    public String login() {

        return "login";
    }

    /*@PostMapping("/login")
    public ModelAndView login(@RequestParam("username") String username, @RequestParam("password") String password, RedirectAttributes redirectAttributes) {
        if (loginDbService.validateLogin(username, password)) {
            redirectAttributes.addFlashAttribute("username", username);
            log.info("Username : "+  username + " , Password : " + password);
            return new ModelAndView("redirect:/index");
        } else {

            redirectAttributes.addAttribute("error", "Login failed! Try again!");
            return new ModelAndView("redirect:/login");
        }

    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register(Model model) {
        return "register";
    }

     */
}