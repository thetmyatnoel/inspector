package com.lab5.inspector.controller;

import com.lab5.inspector.entity.IngInspectdata;
import com.lab5.inspector.entity.WaitingApart;
import com.lab5.inspector.service.IngInspectdataService;
import com.lab5.inspector.service.LoginDbService;
import com.lab5.inspector.service.WaitingApartService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Slf4j
@CrossOrigin(origins = "*")
@Controller
public class PageController {

    @Autowired
    private LoginDbService loginDbService;
    @Autowired
    private WaitingApartService waitingApartService;
    @Autowired
    private IngInspectdataService ingInspectdataService;

    @GetMapping({"/", "/index", "/home"})
    public String index(Model model) {
        List<WaitingApart> aparts = waitingApartService.findAllWaitingAparts();
        log.info("Number of WaitingAparts: " + aparts.size());
        model.addAttribute("aparts", aparts);
        return "index";  // Assuming 'index' is the name of your FreeMarker template
    }

    @RequestMapping(value = "/report", method = RequestMethod.GET)
    public String report(Model model) {
        // Implementation of report method
        return "report";
    }

    @GetMapping("/login")
    public String login(Model model, @RequestParam(required = false) String error) {
        // Add the error attribute to the model if it exists
        if (error != null && !error.isEmpty()) {
            model.addAttribute("loginError", error);
        }
        return "login";
    }

    @PostMapping("/login")
    public ModelAndView login(@RequestParam("username") String username, @RequestParam("password") String password, RedirectAttributes redirectAttributes) {
        if (loginDbService.validateLogin(username, password)) {
            redirectAttributes.addFlashAttribute("username", username);
            return new ModelAndView("redirect:/index");
        } else {
            // Redirect to the login page with an error message
            redirectAttributes.addAttribute("error", "Login failed! Try again!");
            return new ModelAndView("redirect:/login");
        }

    }
    @PostMapping("/saveInspectionData")
    public String saveInspectionData(@ModelAttribute IngInspectdata ingInspectdata) {
        ingInspectdataService.saveIngInspectdata(ingInspectdata);
        return "redirect:/index"; // Redirect as per your flow
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register(Model model) {
        // Implementation of register method
        return "register";
    }
}
