package com.project;

import com.project.FormData;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import com.project.MysqlConnection;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ServerConnectController extends HttpServlet {
	@RequestMapping(value = { "/", "/connect" }, method = RequestMethod.GET)
	public String serverConnect(Model model, HttpServletRequest request, HttpServletResponse response) {
		// create a reservation object
		FormData formData = new FormData();

		// provide reservation object to the model
		model.addAttribute("form", formData);
		return "dbconnect.jsp";
	}

	@RequestMapping("/submitForm")
	// @ModelAttribute binds form data to the object
	public String submitForm(@ModelAttribute("form") FormData formData, Model model,
			RedirectAttributes redirectAttributes, HttpServletRequest request, HttpServletResponse response) {
		try {

			// Call a MySQL Connection class with the details from the form data
			MysqlConnection connection = MysqlConnection.getInstance(formData.getServerUrl(), formData.getUsername(),
					formData.getPassword());
			Statement statement = connection.getConnection().createStatement();
			// logger.info("Connection established");

			// call DatabaseCheck to check both dbs and if they contain table
			if (connection.checkDatabases(formData.getdatabase1(), formData.getdatabase2(), formData.gettableName())) {
				// logger.info("Both databases connected and table found");
				System.out.println("Both databases connected and table found");

				// if db_1, db_2 exist + user accessible and table found in both dbs then:
				redirectAttributes.addFlashAttribute("successMsg", "Databases connected succesfully!");
				List<List<List<String>>> tables = connection.getTablesFromDatabases(formData.getdatabase1(),
						formData.getdatabase2(), formData.gettableName());
				System.out.println(tables+" <-THIS DA TABLE");
				if (tables.isEmpty()) {
					System.out.println("Empty");
				} else {
					//
					request.setAttribute("tables", tables);
				}
				// go to table-view if success
				return "confirmForm.jsp";
			}

			// in case of error display modal pop up with error alert.
		} catch (SQLException e) {
			// logger.error("An error occurred: " + e.getMessage());
			// handle exception
			redirectAttributes.addFlashAttribute("errorMsg", "An error occurred: ");
			e.printStackTrace();
			return "redirect:/connect";
		}
		return "confirmForm.jsp";

	}

}
