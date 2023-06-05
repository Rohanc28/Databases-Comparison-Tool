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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class TableMatchComparatorController {
	@RequestMapping(value="/Compare/Match", method=RequestMethod.POST)
    public String tableCompareMatch(@ModelAttribute("form") FormData formData, Model model,HttpServletRequest request, HttpServletResponse response) {
		try {
            // Get tables data from the database using DatabaseDAO
            List<List<List<String>>> tables = DatabaseDAO.getTablesData(formData.getdatabase1(), formData.getdatabase2(), formData.gettableName());

            // Check if any table data is null or empty
            if (tables == null || tables.isEmpty()) {
                // Handle the case when tables data is empty or null
                // Add appropriate error message to the model and return the error view
                model.addAttribute("errorMessage", "No data available for comparison");
                return "TableError.jsp";
            }	

            // Get the instance of TableData
            TableData tableData = TableData.getInstance();

            // Set the tables data in the TableData instance
            tableData.setData(tables);

            // Call the compare service to get the matching rows
            CompareMatchService compareService = new CompareMatchService();
            List<List<String>> matchingRows = compareService.compareTables(tableData.getObjectData());
            System.out.println(matchingRows);
            // Add the matching rows to the model
            model.addAttribute("matchingRows", matchingRows);

            // Return the name of the JSP page to render
            return "CompareResultSet.jsp";
        } catch (Exception e) {
            // Handle any exceptions that occur during the processing
            // Add appropriate error message to the model and return the error view
            model.addAttribute("errorMessage", "An error occurred during table comparison");
            return "TableError.jsp";
        }
	}
	@RequestMapping(value="/Compare/Match", method=RequestMethod.GET)
    public String tableGETCompareMatch(@ModelAttribute("form") FormData formData, Model model,HttpServletRequest request, HttpServletResponse response) {

            // Check if any table data is null or empty
            if (!formData.isValid())           
            return "redirect:/connect";
			return "redirect:/submitForm";//
	}
	
	@RequestMapping("/Compare/Unique")
    public String tableCompareUnique(@ModelAttribute("form") FormData formData, Model model,HttpServletRequest request, HttpServletResponse response) {
		try {
            // Get tables data from the database using DatabaseDAO
            List<List<List<String>>> tables = DatabaseDAO.getTablesData(formData.getdatabase1(), formData.getdatabase2(), formData.gettableName());

            // Check if any table data is null or empty
            if (tables == null || tables.isEmpty()) {
                // Handle the case when tables data is empty or null
                // Add appropriate error message to the model and return the error view
                model.addAttribute("errorMessage", "No data available for comparison");
                return "TableError.jsp";
            }	

            // Get the instance of TableData
            TableData tableData = TableData.getInstance();

            // Set the tables data in the TableData instance
            tableData.setData(tables);

            // Call the compare service to get the matching rows
            CompareMatchService compareService = new CompareMatchService();
            List<List<String>> matchingRows = compareService.compareTables(tableData.getObjectData());
            System.out.println(matchingRows);
            // Add the matching rows to the model
            model.addAttribute("matchingRows", matchingRows);

            // Return the name of the JSP page to render
            return "CompareResultSet.jsp";
        } catch (Exception e) {
            // Handle any exceptions that occur during the processing
            // Add appropriate error message to the model and return the error view
            model.addAttribute("errorMessage", "An error occurred during table comparison");
            return "TableError.jsp";
        }
	}
}


