package com.lab5.inspector.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * packageName : com.lab5.inspector.controller
 * fileName : PageController
 * author : goodhyoju
 * date : 11/21/23 5:23 PM
 * description :
 */
@Slf4j
@CrossOrigin(origins = "*")
@Controller
public class PageController {

    @RequestMapping(value = {"/", "/index" ,"/home"}, method = RequestMethod.GET)
    public String index(Model model) {
        return "index";
    }

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String login(Model model) {
        return "login";
    }

    @RequestMapping(value = "register", method = RequestMethod.GET)
    public String register(Model model) {
        return "register";
    }
}

