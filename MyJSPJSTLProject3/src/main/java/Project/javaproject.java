package Project;

import jakarta.servlet.*;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

import javax.naming.*;
import javax.sql.*;
import java.sql.*;
import mydata.GetData;
import MyThread.*;
import java.util.concurrent.*;

/**
 * Application Lifecycle Listener implementation class javaproject
 *
 */
@WebListener
public class javaproject implements ServletContextListener {

    /**
     * Default constructor. 
     */
	ScheduledExecutorService se;
	Connection con;
    public javaproject() {
        // TODO Auto-generated constructor stub
    }
    
    public void contextInitialized(ServletContextEvent sce)
    {
    	ServletContext sc=sce.getServletContext();
    	try
    	{
    		InitialContext ic=new InitialContext();
    		DataSource dc=(DataSource)ic.lookup("java:/comp/env/jdbc/TestDB");
    		
    		con=dc.getConnection();
    		
    		GetData g=new GetData(con);
    		sc.setAttribute("myResults",g);
    		se=Executors.newSingleThreadScheduledExecutor();
    		se.scheduleAtFixedRate(new Reload(g), 0, 1, TimeUnit.SECONDS);
    	
    	}
    	catch(NamingException ne) {
    		ne.printStackTrace();
    	}
    	catch(SQLException se)
    	{
    		se.printStackTrace();
    	}
    }
    
	
}