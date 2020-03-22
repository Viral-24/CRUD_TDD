package TDD.Learinig.com;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;


public class DB_Connection implements IDAO {

	String url = "jdbc:h2:tcp://localhost/~/test";
	String user = "sa";
	String pwd = "";
	Connection conn;
	UserModels model;
	PreparedStatement stmt;

	@Override
	public boolean getConnection() {
		try {
			Class.forName("org.h2.Driver");
			conn = DriverManager.getConnection(url, user, pwd);
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		if (conn != null) {
			return true;
		} else {
			return false;
		}
		// return false;

	}


	public boolean insertingRecords(UserModels model) {
		int rowInserted = 0;
		if (getConnection()) {
			System.out.println("Connection is SuccessFully");
			String query = "insert into USERDETAIL  values (?,?,?,?)";
			// insert into USERDETAIL values (04,'Jay','jay@gmail.com','Nagpur')
			try {
				PreparedStatement preparestmt = conn.prepareStatement(query);
				preparestmt.setInt(1, model.getId());
				preparestmt.setString(2, model.getName());
				preparestmt.setString(3, model.getEmail());
				preparestmt.setString(4, model.getAddre());

				rowInserted = preparestmt.executeUpdate();

			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		if (rowInserted > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public int editRecords(int id,UserModels model) {
		int rowCount = 0;
		if (getConnection()) {
			System.out.println("Connection is Successfully");
			String query = "update UserDetail"+" set Name=?,Email=?,Addr=?" + " where id=?";
			try {
				stmt = conn.prepareStatement(query);
				stmt.setString(1, model.getName());
				stmt.setString(2, model.getEmail());
				stmt.setString(3, model.getAddre());
				stmt.setInt(4, model.getId());
				rowCount = stmt.executeUpdate();

			} catch (SQLException e) {
				System.out.println("EditRecords Exception" + e.getMessage());

			}
		}
		return rowCount;
	}

	@Override
	public UserModels getRecordsById(int i) {
		
		//System.out.println("INSIDE GET RECORDS METHODS");
		if (getConnection()) {
			String query = "select * from userdetail where id=?";
			try {
				PreparedStatement preparestmt = conn.prepareStatement(query);
				preparestmt.setInt(1, i);
				ResultSet resultset = preparestmt.executeQuery();
				if (resultset.next()) {
					model = new UserModels();
					model.setId(resultset.getInt("id"));
					model.setName(resultset.getString("name"));
					model.setEmail(resultset.getString("email"));
					model.setAddre(resultset.getString("Addr"));

				}

			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}

		return model;

	}

	@Override
	public int deleteRecords(int i) {
int rowCount=0;
		
		if(getConnection())
		{
			System.out.println("connection Successfully");
			
			String query= "delete USERDETAIL "
					+ "WHERE ID=?" ;
			
			try
			{
				stmt=conn.prepareStatement(query);
				stmt.setInt(1,i);
				rowCount=stmt.executeUpdate();
			} 
			catch (SQLException e)
			{	
			System.out.println("Deleted Value Exception "+e.getMessage());
			}		
			
		}
		
		return rowCount;
}

	@Override
	public List<UserModels> getRecords() {
		List<UserModels> userlist = new ArrayList();
		//System.out.println("inside records");

		if (getConnection()) {
			try {
				Statement statement = conn.createStatement();
				String query = "select * from userdetail ";
				ResultSet resultset = statement.executeQuery(query);
				while (resultset.next()) {
					model = new UserModels();
					model.setId(resultset.getInt("id"));
					model.setName(resultset.getString("name"));
					model.setEmail(resultset.getString("email"));
					model.setAddre(resultset.getString("Addr"));

					userlist.add(model);
				}
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}

		}
		return userlist;
	}

	

	}

