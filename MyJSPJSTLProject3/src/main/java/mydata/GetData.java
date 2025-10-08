package mydata;
import java.sql.*;

public class GetData {

	Connection con;
	public GetData(Connection con)
	{
		this.con=con;
	}
	public ResultSet returnResultSet()
	{
		ResultSet rs=null;
		try
		{
			Statement st=con.createStatement();
			rs=st.executeQuery("select * from Employees12");
		}
		catch(SQLException se)
		{
			se.printStackTrace();
		}
		return rs;
	}

}