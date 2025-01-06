package aiwa.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletContext;

import aiwa.entity.Category;
import aiwa.entity.Item;

public class ItemModel {
	public Item findById(ServletContext context, int itemId) {

		try {

			Class.forName("org.sqlite.JDBC");

			Connection conn = DriverManager
					.getConnection("jdbc:sqlite:" + context.getRealPath("WEB-INF/internationalfoodrecipe.db"));

			String sql = "select * from InternationalFoodRecipe i inner join categories c on i.categoryid = c.categoryid where itemid = ? ";

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, itemId);

			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				Item item = new Item();
				item.setItemId(rs.getInt("itemid"));
				item.setCountryName(rs.getString("countryname"));
				item.setCapitalCity(rs.getString("capitalcity"));
				item.setNationalLanguage(rs.getString("nationallanguage"));
				item.setTraditionalFood(rs.getString("traditionalfood"));
				item.setPrice(rs.getInt("price"));
				item.setRecipe(rs.getString("recipe"));
				item.setImage(rs.getString("image"));
				item.setRating(rs.getInt("rating"));

				Category category = new Category();
				category.setCategoryId(rs.getInt("categoryid"));
				category.setCategoryName(rs.getString("categoryname"));

				item.setCategory(category);

				conn.close();

				return item;
			}

			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public ArrayList<Item> findByKeywordAndCategory(ServletContext context, String word, int categoryId) {
		ArrayList<Item> result = new ArrayList<>();

		try {

			Class.forName("org.sqlite.JDBC");

			Connection conn = DriverManager
					.getConnection("jdbc:sqlite:" + context.getRealPath("WEB-INF/internationalfoodrecipe.db"));

			String sql = "select "
					+ "* "
					+ "from "
					+ "InternationalFoodRecipe i "
					+ "inner join "
					+ "categories c "
					+ "on "
					+ "i.categoryid = c.categoryid "
					+ "where "
					+ "(countryname like ? or recipe like ?) ";

			if (categoryId > 0) {
				sql += "and c.categoryid = ? ";
			}

			sql += "order by "
					+ "itemid";

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, "%" + word + "%");
			stmt.setString(2, "%" + word + "%");

			if (categoryId > 0) {
				stmt.setInt(3, categoryId);
			}

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Item item = new Item();
				item.setItemId(rs.getInt("itemid"));
				item.setCountryName(rs.getString("countryname"));
				item.setCapitalCity(rs.getString("capitalcity"));
				item.setNationalLanguage(rs.getString("nationallanguage"));
				item.setTraditionalFood(rs.getString("traditionalfood"));
				item.setPrice(rs.getInt("price"));
				item.setRecipe(rs.getString("recipe"));
				item.setImage(rs.getString("image"));
				item.setRating(rs.getInt("rating"));

				Category category = new Category();
				category.setCategoryId(rs.getInt("categoryid"));
				category.setCategoryName(rs.getString("categoryname"));

				item.setCategory(category);

				result.add(item);
			}

			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public ArrayList<Item> findAll(ServletContext context) {

		ArrayList<Item> result = new ArrayList<>();

		try {

			Class.forName("org.sqlite.JDBC");

			Connection conn = DriverManager
					.getConnection("jdbc:sqlite:" + context.getRealPath("WEB-INF/internationalfoodrecipe.db"));

			String sql = "select * from InternationalFoodRecipe i inner join categories c on i.categoryid = c.categoryid order by itemid";

			PreparedStatement stmt = conn.prepareStatement(sql);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Item item = new Item();
				item.setItemId(rs.getInt("itemid"));
				item.setCountryName(rs.getString("countryname"));
				item.setCapitalCity(rs.getString("capitalcity"));
				item.setNationalLanguage(rs.getString("nationallanguage"));
				item.setTraditionalFood(rs.getString("traditionalfood"));
				item.setPrice(rs.getInt("price"));
				item.setRecipe(rs.getString("recipe"));
				item.setImage(rs.getString("image"));
				item.setRating(rs.getInt("rating"));

				Category category = new Category();
				category.setCategoryId(rs.getInt("categoryid"));
				category.setCategoryName(rs.getString("categoryname"));

				item.setCategory(category);

				result.add(item);
			}

			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
}
