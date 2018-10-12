import java.sql.*;
import java.io.*;

public class Simplejdbc2 {
  public static void main(String[] args)
      throws Exception, IOException, SQLException, ClassNotFoundException {
    // Load the JDBC driver
    try {
    	 Class.forName("com.mysql.jdbc.Driver");
    } catch (ClassNotFoundException e) {
    	  System.out.println("Could not load the driver");
    }
  
    
    // Connect to a database
    Connection conn = DriverManager.getConnection
    		("jdbc:mysql://localhost:3306/University?useSSL=false" , "root", "password-deleted-for-privacy");
    System.out.println("Database connected");
    System.out.println("Connection Established Successful and the DATABASE NAME IS:"
            + conn.getMetaData().getDatabaseProductName());

    //Main Menu
    boolean done = false;
    do {
    		printMenu();
    		System.out.print("Type in your option: ");
    		System.out.flush();String ch = readLine();
    		System.out.println();
    		switch(ch.charAt(0)) {
    			case 'a': CourseTitles(conn);
    				break;
    			case'b': DepartmentList(conn);
    				break; 
    				
  				
//    			case'c': findSections(connection);
//    				break; 
//    			case'd': findMostWorked(connection);
//    				break; 
//    			case'e': findMostWorked(connection);
// 				break; 
   			case'q': done = true;
    				break;
    			default: System.out.println(" Not a valid option ");
    		}//switch
    } while(!done);
   
    // Close the connection
    conn.close();
  }

  private static void DepartmentList(Connection conn) {
	
	
}

// Create a statement
  //Statement statement = connection.createStatement();

  // Execute a statement
  //ResultSet resultSet = statement.executeQuery
        //("select first_name from customer where customer_id = 11119");
  
  
  
private static void CourseTitles(Connection conn) 
	throws SQLException, IOException {
		
		Statement stmt = conn.createStatement();
		String query = "SELECT *" + "FROM Course";
		
		ResultSet rset;
		try {
			rset = stmt.executeQuery(query);
		} catch (SQLException e) {
			System.out.println("could not execute query ");
			while (e!= null) {
				System.out.println ("Message :" + e.getMessage());
				e = e.getNextException();
			}
			stmt.close();
			return;
			
		}
		System.out.println("The Titles of All Courses");
		System.out.println("---------------------------------------\n");
		System.out.println(rset);
	
		
		
	}


private static String readLine() {
	InputStreamReader isr = new InputStreamReader(System.in);
	BufferedReader br = new BufferedReader(isr, 1);
	String line = "";
	
	try{
		line = br.readLine();
	} catch(IOException e) { 
		System.out.println("Error in SimpleIO.readLine: " +"IOException was thrown");
		System.exit(1);
	} 
	
	return line;
}


private static void printMenu() {
	System.out.println("\n        QUERY OPTIONS ");
	System.out.println("(a) Display the titles of all courses");
	System.out.println("(b) Display the list of all departments");
	System.out.println("(c) Display the section ID, course ID, and course title of all sections");
	System.out.println("(d) Display all course sections offered in Spring 2017");
	System.out.println("(e) Display names of students and their majors");
	System.out.println("(q) Quit");
	
}

}
/*static void driverLoop() 
	      throws SQLException, ClassNotFoundException {
	    Class.forName("com.mysql.jdbc.Driver");
	    System.out.println("Driver loaded");

	    // Connect to a database
	    Connection connection = DriverManager.getConnection
	      ("jdbc:mysql://localhost/University?useSSL=false" , "root", "dlee5217");
	    System.out.println("Database connected");

	    while (true) {
		  System.out.println("Query Options");
		  System.out.println("(a) Display the titles of all courses");
		  System.out.println("(b) Display the list of all departments");
		  System.out.println("(c) Display the section ID, course ID, and course title of all sections");
		  System.out.println("(d) Display all course sections offered in Spring 2017");
		  System.out.println("(e) Display names of students and their majors");
		  System.out.println("(q) Quit");

		  // Java get String from command line

		  String option = "a";
		  if (option.equals("a")) {
			    // Create a statement
			    Statement statement = connection.createStatement();
			    

			    // Execute a statement
			    ResultSet resultSet = statement.executeQuery
			          ("select first_name from customer where customer_id = 11119");

			    // Iterate through the result and print the employee names
			    while (resultSet.next())
			      System.out.println(resultSet.getString(1) + "\t");
		  } else if (option.equals("b")) {
			    // Create a statement
			    Statement statement = connection.createStatement();

			    // Execute a statement
			    ResultSet resultSet = statement.executeQuery
			          ("select first_name from customer where customer_id = 11119");

			    // Iterate through the result and print the employee names
			    while (resultSet.next())
			      System.out.println(resultSet.getString(1) + "\t");
		  }
	  }
//    connection.close();
	    
  }
}*/