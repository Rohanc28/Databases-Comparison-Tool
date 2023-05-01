package com.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.ui.ModelMap;

@Controller
public class HomeController
{
	@RequestMapping({"/","home"})
	public String home()	
	{
		return "forward:/index.jsp";
	}
}