import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize = 16177216)
public class SignupServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        String user=request.getParameter("username");
        String mob=request.getParameter("mobile");
        String em=request.getParameter("email");
        String pass=request.getParameter("password");
        Part part=request.getPart("upload");
        if(part!=null)
        try
           {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/quora?useSSL=false","root","himani@123");
                String sql_query="insert into Registration values(?,?,?,?,?)";
                PreparedStatement pstmt=conn.prepareStatement(sql_query);
                InputStream is= part.getInputStream();
                pstmt.setString(1,user);
                pstmt.setString(2,mob);
                pstmt.setString(3,em);
                pstmt.setString(4,pass);
                pstmt.setBlob(5,is);
                pstmt.executeUpdate();
                out.println("<html><body>");
                out.println("<script type=\"text/javascript\">");
                out.println("window.alert(\"You have successfully registered! Now please Sign In with your username and password\")");
                out.println("window.location.href=\"index.jsp\"");
                out.println("</script>");
                out.println("</body></html>");
           }
           catch(SQLIntegrityConstraintViolationException e)
           {
               out.println("<html><body>");
               out.println("<script type=\"text/javascript\">");
               out.println("window.alert(\"You have been already registered! Please Sign In directly to proceed to your dashboaed!\")");
               out.println("window.location.href=\"index.jsp\"");
               out.println("</script>");
               out.println("</body></html>");
               //response.sendRedirect("index.html");
           }
           catch(Exception e)
           {
               out.println(e);
           }
        }
            

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SignupServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SignupServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>


}
