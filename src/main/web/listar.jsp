<%@ page import="java.sql.*, conexion.ConexionBD" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Empleados Registrados</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; background-color: #f4f4f9; }
        .container { background: white; padding: 25px; border-radius: 8px; max-width: 900px; margin: auto; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        h2 { text-align: center; color: #333; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 12px; border: 1px solid #ddd; text-align: left; }
        th { background-color: #007bff; color: white; }
        tr:nth-child(even) { background-color: #f9f9f9; }
        .btn-volver { display: inline-block; margin-top: 20px; padding: 10px 15px; background-color: #6c757d; color: white; text-decoration: none; border-radius: 4px; }
        .btn-volver:hover { background-color: #5a6268; }
    </style>
</head>
<body>

<div class="container">
    <h2>Empleados Registrados en el Sistema</h2>
    
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Documento</th>
                <th>Nombre</th>
                <th>Correo</th>
                <th>Teléfono</th>
                <th>Cargo</th>
            </tr>
        </thead>
        <tbody>
            <%
                try {
                    Connection conn = ConexionBD.conectar();
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM empleados");
                    
                    while(rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("documento") %></td>
                <td><%= rs.getString("nombre") %></td>
                <td><%= rs.getString("correo") %></td>
                <td><%= rs.getString("telefono") %></td>
                <td><%= rs.getString("cargo") %></td>
            </tr>
            <%
                    }
                    conn.close();
                } catch(Exception e) {
            %>
            <tr>
                <td colspan="6">Error al cargar los datos: <%= e.getMessage() %></td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <a href="index.html" class="btn-volver">← Registrar Nuevo Empleado</a>
</div>

</body>
</html>
