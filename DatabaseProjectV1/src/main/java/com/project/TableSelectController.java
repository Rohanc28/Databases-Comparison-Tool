package com.project;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.ModelMap;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class TableSelectController {
    
    public String tableSelectSubmit(@RequestParam String serverName,
                                    @RequestParam String databaseName,
                                    @RequestParam int portNumber,
                                    @RequestParam String username,
                                    @RequestParam String password,
                                    Model model) {
        
        // check if all fields are filled
        if (serverName.isEmpty() || databaseName.isEmpty() || username.isEmpty() || password.isEmpty()) {
            // if not, return to the form page with an error message
            model.addAttribute("errorMessage", "All fields are required.");
            return "tableSelect";
        }
        
        // render the results in the "results" div
        String results = "Server Name: " + serverName +
                         "<br>Hostname: " + databaseName +
                         "<br>Port Number: " + portNumber +
                         "<br>Username: " + username +
                         "<br>Password: " + password;
        model.addAttribute("results", results);
        
        // return the page with the results
        return "tableSelect";
    }
    
}

