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

			// call DatabaseCheck to check both dbs and if they contain table
			// if db_1, db_2 exist + user accessible and table found in both dbs then:

			if (connection.checkDatabases(formData.getdatabase1(), formData.getdatabase2(), formData.gettableName())) {
				// System.out.println("CONNECTED // REDIRECTING TO /TABLE");

				// return "redirect:/table";

				List<List<List<String>>> tables = DatabaseDAO.getTablesData(formData.getdatabase1(),
						formData.getdatabase2(), formData.gettableName());
				System.out.println("////////////// TABLE DATA ///////////////");
				for (int tableIndex = 0; tableIndex < tables.size(); tableIndex++) {
					List<List<String>> table = tables.get(tableIndex);
					System.out.println("Table " + (tableIndex + 1) + ":");

					for (int rowIndex = 0; rowIndex < table.size(); rowIndex++) {
						List<String> row = table.get(rowIndex);

						for (int columnIndex = 0; columnIndex < row.size(); columnIndex++) {
							String cell = row.get(columnIndex);
							System.out.print(cell + "\t");
						}

						System.out.println();
					}

					System.out.println();
				}
				System.out.println("/////////////////////////////////////////////");
				if (tables.isEmpty() || tables == null) {
					System.out.println("Empty");
				} else {
					StringBuilder jsonBuilder = new StringBuilder();
					jsonBuilder.append("[");
					for (List<List<String>> table : tables) {
						jsonBuilder.append("[");
						for (List<String> row : table) {
							jsonBuilder.append("[");
							for (String cell : row) {
								jsonBuilder.append("\"").append(cell).append("\",");
							}
							jsonBuilder.deleteCharAt(jsonBuilder.length() - 1);
							jsonBuilder.append("],");
						}
						jsonBuilder.deleteCharAt(jsonBuilder.length() - 1);
						jsonBuilder.append("],");
					}
					jsonBuilder.deleteCharAt(jsonBuilder.length() - 1);
					jsonBuilder.append("]");

					String json = jsonBuilder.toString();

					// Print JSON
					System.out.println(json);
					request.setAttribute("tables", tables);
					request.setAttribute("json", json);
				}
				// Redirect to the table view if successful
				return "confirmForm.jsp";
			}

			// in case of error display modal pop up with error alert.
		} catch (SQLException e) {

			// handle exception
			model.addAttribute("errorMsg", "Invalid Details or Connection error");
			System.out.println("SQL ERROR, CONNECTION INVLAID/ FAILED");
			request.getSession().setAttribute("errorMsg", "Invalid Details or Connection error");
			e.printStackTrace();
			return "redirect:/connect";
		}
		model.addAttribute("errorMsg", "Invalid Details or Connection error");
		System.out.println("YES REDIRECTING, NO SQL ERROR, BAD FORM");
		request.getSession().setAttribute("errorMsg", "Invalid Details or Connection error");
		return "redirect:/connect";

	}

}
