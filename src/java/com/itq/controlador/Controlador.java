package com.itq.controlador;

import com.itq.dao.ProductoMetodos;
import com.itq.dao.ClienteMetodos;
import com.itq.dao.CompraMetodos;
import com.itq.dao.DetalleCompraMetodos;
import com.itq.dao.PagoMetodos;
import com.itq.model.Carrito;
import com.itq.model.Producto;
import com.itq.model.Cliente;
import com.itq.model.Compras;
import com.itq.model.DetalleCompra;
import com.itq.model.Pago;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author paul.alvarez
 */
public class Controlador extends HttpServlet {
    ProductoMetodos pro = new ProductoMetodos();
    ClienteMetodos clim = new ClienteMetodos();
    CompraMetodos compm = new CompraMetodos();
    PagoMetodos pagom = new PagoMetodos();
    DetalleCompraMetodos detm = new DetalleCompraMetodos();
    List<Carrito> listaCarrito = new ArrayList<>();
    List<Compras> compras = new ArrayList<>();
    Producto p = new Producto();
    Cliente cliente;
    Pago pago = new Pago();
    Compras compra = new Compras();
    Carrito car;
    int pos = 0;
    int item = 0;
    int cantidad = 0;
    int sizeCarrito = 0;
    double totalPagar = 0.0;
    double iva = 0.0;
    double subTotal = 0.0;
    String idProducto = "";
    Boolean isStock;
    

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String action = request.getParameter("accion");
        switch (action) {
            case "AgregarCarrito":
                cantidad = 1;
                idProducto = request.getParameter("idProducto");
                System.out.println("ID: " + idProducto);                
                isStock = pro.stockDisponible(idProducto);
                System.out.println("STOCK: " + isStock);
                p = pro.infoProducto(idProducto);
                System.out.println("PROD: " + p);
                if(isStock){
                    p = pro.buscarPorId(idProducto);
                    if(listaCarrito.size() > 0){
                        for (int i = 0; i < listaCarrito.size(); i++) {
                            if(idProducto.equals(listaCarrito.get(i).getIdProducto())){
                                pos = i;
                            }
                        }
                        if(idProducto.equals(listaCarrito.get(pos).getIdProducto())){
                            cantidad = listaCarrito.get(pos).getCantidad() + cantidad;
                            double subtotal = listaCarrito.get(pos).getPrecioCompra() * cantidad;
                            listaCarrito.get(pos).setCantidad(cantidad);
                            listaCarrito.get(pos).setSubTotal(subtotal);
                        }else {
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
                    }else{
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
                }else {
                    System.out.println("STOCK: " + isStock);
                }
                sizeCarrito = listaCarrito.size();
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
                sizeCarrito = listaCarrito.size();
                request.setAttribute("contador", sizeCarrito);
                request.getRequestDispatcher("Detalle/carrito.jsp").forward(request, response);
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
            case "GenerarCompra":
                HttpSession objsesionUs = request.getSession(true);
                String cedula = objsesionUs.getAttribute("cedulaUsuario").toString();
                System.out.println("CEDULA: " + cedula);
                System.out.println("TOTAL: " + totalPagar);
                cliente = clim.buscarPorId(cedula);
                pago.setMonto(totalPagar);
                if(pagom.insertarPago(pago)){
                    System.out.println("PAGO INSERTADO");
                    compra.setIdPago(1);
                    compra.setCedula(cedula);
                    compra.setFechaCompra(new Date());
                    compra.setMonto(totalPagar);
                    compra.setEstado("PROCESADO");
                    if(compm.insertarCompra(compra)){
                        System.out.println("COMPRA INSERTADO");
                        Compras c = compm.buscarPorCedulaMonto(cedula, totalPagar);
                        int idCompra = c.getIdCompras();
                        System.out.println("COMPRA ID: " + idCompra);
                        for (int i = 0; i < listaCarrito.size(); i++) {
                            DetalleCompra detalle = new DetalleCompra();
                            detalle.setIdCompras(idCompra);
                            detalle.setCodProducto(listaCarrito.get(i).getIdProducto());
                            detalle.setCantidad(listaCarrito.get(i).getCantidad());
                            detalle.setPrecioUnitario(listaCarrito.get(i).getSubTotal());
                            System.out.println("DETALLE: " + idCompra);
                            System.out.println("DETALLE: " + listaCarrito.get(i).getIdProducto());
                            System.out.println("DETALLE: " + listaCarrito.get(i).getCantidad());
                            System.out.println("DETALLE: " + listaCarrito.get(i).getSubTotal());
                            if(detm.insertarDetalle(detalle)){
                                System.out.println("DETALLE AGREGADO");
                            }
                        }
                    } else {
                        System.out.println("COMPRA NO INSERTADA");
                    }
                } else {
                    System.out.println("PAGO NO INSERTADO");
                }
                listaCarrito.clear();
                sizeCarrito = listaCarrito.size();
                request.setAttribute("iva", 0);
                request.setAttribute("totalPagar", 0);
                request.setAttribute("subtotal", 0);
                request.setAttribute("contador", sizeCarrito); 
                request.getRequestDispatcher("confirmacion.jsp").forward(request, response);
                break;
            case "MisCompras":
                HttpSession objsesionData = request.getSession(true);
                String ced = objsesionData.getAttribute("cedulaUsuario").toString();
                System.out.println("CEDULA: " + ced);
                compras = compm.listaComprasPorId(ced);
                request.setAttribute("compras", compras);
                request.getRequestDispatcher("miscompras.jsp").forward(request, response);
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
