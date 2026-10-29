package controlador;

import conexion.ConexionBD;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EmpleadoServlet")
public class Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Metodo GET para recibir y procesar parametros por URL
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String accion = request.getParameter("accion");

        if ("listar".equalsIgnoreCase(accion)) {
            response.sendRedirect("listar.jsp");
        } else {
            response.sendRedirect("index.html");
        }
    }

    // Metodo POST para recibir los datos del formulario
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String documento = request.getParameter("documento");
        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        String telefono = request.getParameter("telefono");
        String cargo = request.getParameter("cargo");

        try {
            Connection conexion = ConexionBD.conectar();
            String sql = "INSERT INTO empleados (documento, nombre, correo, telefono, cargo) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement statement = conexion.prepareStatement(sql);
            
            statement.setString(1, documento);
            statement.setString(2, nombre);
            statement.setString(3, correo);
            statement.setString(4, telefono);
            statement.setString(5, cargo);
            
            statement.executeUpdate();
            conexion.close();
            
            System.out.println("Empleado registrado exitosamente en la BD!");
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("listar.jsp");
    }
}