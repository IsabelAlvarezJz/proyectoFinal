package com.itq.controlador;

import com.itq.dao.ProductoMetodos;
import com.itq.model.Carrito;
import com.itq.model.Producto;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author paul.alvarez
 */
public class Controlador extends HttpServlet {

    ProductoMetodos pro = new ProductoMetodos();
    List<Carrito> listaCarrito = new ArrayList<>();
    Producto p = new Producto();
    Carrito car;
    int pos = 0;
    int item = 0;
    int cantidad = 1;
    int sizeCarrito = 0;
    double totalPagar = 0.0;
    double iva = 0.0;
    double subTotal = 0.0;
    String idProducto = "";
    

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String action = request.getParameter("accion");
        switch (action) {
            case "AgregarCarrito":
                idProducto = request.getParameter("idProducto");
                p = pro.buscarPorId(idProducto);
                System.out.println("PRODUCTO: " + p);
                pro = new ProductoMetodos();
                System.out.println("LISTA: " + listaCarrito.size());
                pro = new ProductoMetodos();
                boolean isStock = pro.stockDisponible(idProducto);
                if(isStock){
                    System.out.println("HAY STOCK " + isStock);
                    if(listaCarrito.size() > 0){
                        System.out.println("EVALUAO REPETIDO");
                        for (int i = 0; i < listaCarrito.size(); i++) {
                            if(idProducto.equals(listaCarrito.get(i).getIdProducto())){
                                pos = i;
                            }
                        }
                        if(idProducto.equals(listaCarrito.get(pos).getIdProducto())){
                            System.out.println("EXISTE MISMO PRODUCTO SUMO CANTIDAD");
                            cantidad = listaCarrito.get(pos).getCantidad() + cantidad;
                            double subtotal = listaCarrito.get(pos).getPrecioCompra() * cantidad;
                            listaCarrito.get(pos).setCantidad(cantidad);
                            listaCarrito.get(pos).setSubTotal(subtotal);
                            System.out.println("CANTIDAD: " + cantidad);
                            System.out.println("SUBTOTAL: " + subtotal);
                        } else {
                            System.out.println("NUEVO PRODUCTO");
                            item = item + 1;
                            car = new Carrito();
                            car.setItem(item);
                            car.setIdProducto(p.getCodProducto());
                            car.setNombres(p.getNombres());
                            car.setDescripcion(p.getDescripcion());
                            car.setPrecioCompra(p.getPrecio());
                            car.setCantidad(cantidad);
                            car.setSubTotal(cantidad * p.getPrecio());
                            car.setRuta(p.getRuta());
                            listaCarrito.add(car);
                        }
                    } else {
                        System.out.println("ADD P");
                        item = item + 1;
                        car = new Carrito();
                        car.setItem(item);
                        car.setIdProducto(p.getCodProducto());
                        car.setNombres(p.getNombres());
                        car.setDescripcion(p.getDescripcion());
                        car.setPrecioCompra(p.getPrecio());
                        car.setCantidad(cantidad);
                        car.setSubTotal(cantidad * p.getPrecio());
                        car.setRuta(p.getRuta());
                        listaCarrito.add(car);
                    }
                } else {
                    System.out.println("NO HAY STOCK " + isStock);
                }
                sizeCarrito = listaCarrito.size();
                System.out.println("TAMAÑO CARRITO " + sizeCarrito);
                request.setAttribute("contador", sizeCarrito);
                request.getRequestDispatcher("principal.jsp").forward(request, response);
                break;
            case "EliminarItem":
                idProducto = request.getParameter("idProducto");
                for (int i = 0; i < listaCarrito.size(); i++) {
                    if(listaCarrito.get(i).getIdProducto().equals(idProducto)){
                        listaCarrito.remove(i);
                    }
                }
                break;
            case "ActualizarCantidad": 
                idProducto = request.getParameter("idProducto");
                int cant = Integer.parseInt(request.getParameter("Cantidad"));
                for (int i = 0; i < listaCarrito.size(); i++) {
                    if(listaCarrito.get(i).getIdProducto().equals(idProducto)){
                        listaCarrito.get(i).setCantidad(cant);
                        double st = listaCarrito.get(i).getPrecioCompra() * cant;
                        listaCarrito.get(i).setSubTotal(st);
                    }
                }
                break;
            case "Carrito":
                totalPagar = 0.0;
                request.setAttribute("carrito", listaCarrito);
                for (int i = 0; i < listaCarrito.size(); i++) {
                    totalPagar = totalPagar + listaCarrito.get(i).getSubTotal();
                }
                iva = totalPagar * 0.12;
                subTotal = totalPagar - iva;
                sizeCarrito = listaCarrito.size();
                request.setAttribute("iva", iva);
                request.setAttribute("totalPagar", totalPagar);
                request.setAttribute("subtotal", subTotal);
                request.setAttribute("contador", sizeCarrito); 
                request.getRequestDispatcher("Detalle/carrito.jsp").forward(request, response);
                break;
            default:
                request.setAttribute("contador", sizeCarrito); 
                request.getRequestDispatcher("pricipal.jsp").forward(request, response);
        }
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Controlador.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Controlador.class.getName()).log(Level.SEVERE, null, ex);
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
