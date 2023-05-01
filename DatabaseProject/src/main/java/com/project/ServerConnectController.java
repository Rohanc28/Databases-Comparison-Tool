package com.project;

import com.project.FormData;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ServerConnectController {
	@RequestMapping(value = "/connect", method = RequestMethod.GET)
	public String serverConnect(Model model) 
	{
		//create a reservation object   
		FormData formData = new FormData();
		
		//provide reservation object to the model   
		model.addAttribute("form", formData);
		return "serverConnect.jsp";
	}

	@RequestMapping("/submitForm")
	// @ModelAttribute binds form data to the object  
	public String submitForm(@ModelAttribute("form") FormData formdata) 
	{
		return "confirmForm.jsp";
	}
}
/*
 * @PostMapping("/tableSelect") public String tableSelectSubmit(@RequestParam
 * String serverName, @RequestParam String databaseName,
 * 
 * @RequestParam int portNumber, @RequestParam String username, @RequestParam
 * String password, Model model) {
 * 
 * // check if all fields are filled if (serverName.isEmpty() ||
 * databaseName.isEmpty() || username.isEmpty() || password.isEmpty()) { // if
 * not, return to the form page with an error message
 * model.addAttribute("errorMessage", "All fields are required."); return
 * "serverConnect"; }
 * 
 * // send POST request to /tableSelect with the form data // ...
 * 
 * // render the results in the "results" div String results = "Server Name: " +
 * serverName + "<br>Hostname: " + databaseName + "<br>Port Number: " +
 * portNumber + "<br>Username: " + username + "<br>Password: " + password;
 * model.addAttribute("results", results);
 * 
 * // return the page with the results return "tableSelect"; }
 * 
 * @RequestMapping(value = "/tableSelect", method = RequestMethod.GET) public
 * String getTable() { return "forward:/tableSelect.jsp"; } }
 */
