import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class jdbc {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/14_jdbc";
        String user = "root";
        String password = "root";

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection
            Connection conn = DriverManager.getConnection(url, user, password);

            // Create a statement
            Statement stmt = conn.createStatement();

            // Execute a query
            String query = "SELECT * FROM students";
            ResultSet rs = stmt.executeQuery(query);

            // Process the result set
            while (rs.next()) {
                int id = rs.getInt("student_id");
                String name = rs.getString("name");
                int age = rs.getInt("age");
                String major = rs.getString("major");
                double gpa = rs.getDouble("gpa");
                System.out.println(id + ", " + name + ", " + age + ", " + major + ", " + gpa);
            }

            // Close the connection
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

//commands to run the program
//javac -cp .:mysql-connector-j_9.1.0-1ubuntu24.10_all/usr/share/java/mysql-connector-j-9.1.0.jar jdbc.java
//java -cp .:mysql-connector-j_9.1.0-1ubuntu24.10_all/usr/share/java/mysql-connector-j-9.1.0.jar jdbc