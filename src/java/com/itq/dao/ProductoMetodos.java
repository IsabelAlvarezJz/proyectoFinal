/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itq.dao;

import com.itq.configuracion.Conexion;
import com.itq.interfaces.IProducto;
import com.itq.model.Producto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Familia
 */
public class ProductoMetodos implements IProducto {

    private Connection conn;

    public ProductoMetodos() {
        if (conn == null) {
            conn = Conexion.getConnetion();
        }
    }

    private void closeConecction() {
        try {
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(ClienteMetodos.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error al cerra la conexión ... !!!");
        }
    }

    @Override
    public List<Producto> bucarProducto() {
        List<Producto> listaProducto = new ArrayList<Producto>();
        String sql = "SELECT * FROM producto";
        Statement stm = null;
        Producto obj = null;
        try {
            stm = conn.createStatement();
            ResultSet rs = stm.executeQuery(sql);

            while (rs.next()) {
                String codP = rs.getString("codProducto"); //NOMBRE CAMPO DE LA TABLA
                String nombresP = rs.getString("nombres");
                String foto = rs.getString("foto");
                String desc = rs.getString("descripcion");
                Double precio = rs.getDouble("precio");
                int stock = rs.getInt("stock");
                String ruta = rs.getString("ruta");

                obj = new Producto(codP, nombresP, foto, desc, precio, stock, ruta);
                listaProducto.add(obj);
            }
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductoMetodos.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeConecction();
        }
        return listaProducto;
    }

    @Override
    public Producto buscarPorId(String codProducto) {
        String sql = " SELECT * FROM producto WHERE codProducto = ? ";
        Producto produc = null;
        PreparedStatement ps = null;

        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, codProducto);
            ResultSet rs = ps.executeQuery();
            //diferencia entre executeQuery y executeUpdate

            while (rs.next()) {               

                String nomP = rs.getString("nombres");
                String foto = rs.getString("foto");
                String desc = rs.getString("descripcion");
                Double precio = rs.getDouble("precio");
                int stock = rs.getInt("stock");
                String ruta = rs.getString("ruta");

                produc = new Producto(codProducto, nomP, foto, desc, precio, stock, ruta);

            }
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductoMetodos.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeConecction();
        }
        return produc;
    }

    @Override
    public boolean insertarProducto(Producto prod) {
        boolean bandera = true;

        String sql = " INSERT INTO producto (codProducto, nombres, foto, descripcion, precio, stock, ruta) VALUES( ?, ?, ?, ?, ?, ?, ? )";

        PreparedStatement ps = null;

        try {
            ps = conn.prepareStatement(sql);

            //asigno valores
            ps.setString(1, prod.getCodProducto());
            ps.setString(2, prod.getNombres());
            ps.setString(3, prod.getRuta());
            ps.setString(4, prod.getDescripcion());
            ps.setDouble(5, prod.getPrecio());
            ps.setInt(6, prod.getStock());
            ps.setString(7, prod.getRuta());

            ps.executeUpdate();
            ps.close();

        } catch (SQLException ex) {
            Logger.getLogger(ProductoMetodos.class.getName()).log(Level.SEVERE, null, ex);
            bandera = false;
        } finally {
            closeConecction();
        }

        return bandera;
    }

    @Override
    public boolean actualizarProducto(Producto prod) {
        boolean bandera = true;

        String sql = " UPDATE producto SET nombres = ?, foto = ?, descripcion = ?, precio = ?, stock = ?, ruta = ? WHERE codProducto = ?";

        PreparedStatement ps = null;

        try {
            ps = conn.prepareStatement(sql);

            //asigno valores
            ps.setString(1, prod.getNombres());
            ps.setString(2, prod.getRuta());
            ps.setString(3, prod.getDescripcion());
            ps.setDouble(4, prod.getPrecio());
            ps.setInt(5, prod.getStock());
            ps.setString(6, prod.getRuta());
            ps.setString(7, prod.getCodProducto());

            ps.executeUpdate();
            ps.close();

        } catch (SQLException ex) {
            Logger.getLogger(ProductoMetodos.class.getName()).log(Level.SEVERE, null, ex);
            bandera = false;
        } finally {
            closeConecction();
        }

        return bandera;
    }

    @Override
    public boolean eliminarProducto(String codProducto) {
        boolean bandera = true;

        String sql = " DELETE FROM producto WHERE codProducto = ?";
        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, codProducto);

            ps.executeUpdate();
            ps.close();

        } catch (SQLException ex) {
            Logger.getLogger(ProductoMetodos.class.getName()).log(Level.SEVERE, null, ex);
            bandera = false;
        } finally {
            closeConecction();
        }

        return bandera;
    }

}
