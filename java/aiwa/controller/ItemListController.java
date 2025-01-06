package aiwa.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import aiwa.entity.Category;
import aiwa.entity.Item;
import aiwa.model.CategoryModel;
import aiwa.model.ItemModel;

@WebServlet("/ItemListController")
public class ItemListController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 1.PARAMETER
		String word = request.getParameter("keyword");
		if (word == null) {
			word = "";
		}

		String categoryId = request.getParameter("categoryid");
		if (categoryId == null) {
			categoryId = "0";
		}

		// 2.MODEL
		ItemModel im = new ItemModel();
		CategoryModel cm = new CategoryModel();

		// Check if the selected category is Antarctica
		if ("Antarctica".equalsIgnoreCase(request.getParameter("categoryname"))) {
			// If Antarctica is selected, return a message instead of items
			request.setAttribute("continentMessage", "There are no countries in this continent.");
			request.setAttribute("items", new ArrayList<Item>()); // Empty list of items
		} else {
			// Fetch items based on keyword and category
			ArrayList<Item> items = im.findByKeywordAndCategory(getServletContext(), word,
					Integer.parseInt(categoryId));
			request.setAttribute("items", items);
		}

		// Fetch all categories
		ArrayList<Category> categories = cm.findAll(getServletContext());

		// 3.VIEW
		request.setAttribute("word", word);
		request.setAttribute("categoryid", Integer.parseInt(categoryId));
		request.setAttribute("categories", categories);
		request.getRequestDispatcher("/itemListView.jsp").forward(request, response);
	}
}
