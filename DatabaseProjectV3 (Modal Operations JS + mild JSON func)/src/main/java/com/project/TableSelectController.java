//package com.project;
//
//import com.project.FormData;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.sql.Statement;
//import java.util.List;
//
//import com.project.MysqlConnection;
//
//import javax.servlet.http.HttpServletRequest;
//
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//@Controller
//public class TableSelectController {
//	@RequestMapping("/table")
//    public String tableSelectSubmit(@ModelAttribute("form") FormData formData, Model model,HttpServletRequest request, HttpServletResponse response) {
//		try {
//			List<List<List<String>>> tables = DatabaseDAO.getTablesData(formData.getdatabase1(),formData.getdatabase2(), formData.gettableName());
//			System.out.println( "////////////// TABLE DATA ///////////////");
//			for (int tableIndex = 0; tableIndex < tables.size(); tableIndex++) {
//			    List<List<String>> table = tables.get(tableIndex);
//			    System.out.println("Table " + (tableIndex + 1) + ":");
//
//			    for (int rowIndex = 0; rowIndex < table.size(); rowIndex++) {
//			        List<String> row = table.get(rowIndex);
//
//			        for (int columnIndex = 0; columnIndex < row.size(); columnIndex++) {
//			            String cell = row.get(columnIndex);
//			            System.out.print(cell + "\t");
//			        }
//
//			        System.out.println();
//			    }
//
//			    System.out.println();
//			}
//			System.out.println("/////////////////////////////////////////////");
//			if (tables.isEmpty() || tables == null) {
//				System.out.println("Empty");
//			} else {
//				request.setAttribute("tables", tables);
//			}
//			// Redirect to the table view if successful
//            return "confirmForm.jsp";
////		List<List<List<String>>> tables = DatabaseDAO.getTablesData(formData.getdatabase1(),formData.getdatabase2(), formData.gettableName());
////		System.out.println(tables + " <-THIS TABLE");
////		
////		if (tables.isEmpty() || tables == null) {
////			System.out.println("Empty");
////		} else {
////			request.setAttribute("tables", tables);
////		}
////		// Redirect to the table view if successful
////        return "confirmForm.jsp";
////        
//		}
//		catch(SQLException e) {
//			//redirectAttributes.addFlashAttribute("errorMsg", "An error occurred: ");
//			e.printStackTrace();
//			return "redirect:/connect";
//		}
//    }
//}
//
