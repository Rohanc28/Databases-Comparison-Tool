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
	@RequestMapping(value = {"/","/connect"}, method = RequestMethod.GET)
	public String serverConnect(Model model) 
	{
		//create a reservation object   
		FormData formData = new FormData();
		
		//provide reservation object to the model   
		model.addAttribute("form", formData);
		return "dbconnect.jsp";
	}

	@RequestMapping("/submitForm")
	// @ModelAttribute binds form data to the object  
	public String submitForm(@ModelAttribute("form") FormData formdata) 
	{
		return "confirmForm.jsp";
	}
}
