package model.DAO;

import connectionDB.ConnectionDB;
import model.Interface.IProduct;
import model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO implements IProduct {

    public ProductDAO(){}
    @Override
    public List<Product> getAllProduct()  {
        List<Product> productList = new ArrayList<>();
        Connection connection = ConnectionDB.getConnectionDB();
        String sql ="select * from SANPHAM;";
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()){
                Product product = new Product();
                product.setImei(resultSet.getString(1));
                product.setMaKH(resultSet.getInt(2));
                product.setTenSP(resultSet.getString(3));
                product.setLoaiSP(resultSet.getString(4));
                product.setNxs(resultSet.getString(5));
                product.setHanBaoHanh(resultSet.getString(6));

                product.setThongTinSP(resultSet.getString(7));
                productList.add(product);
            }
            statement.close();
            return productList;
        }catch (SQLException e){
            e.printStackTrace();
        }

        return productList;
    }

    @Override
    public void addProduct(Product product, int maKH) {
        Connection connection = ConnectionDB.getConnectionDB();
        // Thuc hien truy van tham so
        String sql = "insert into SANPHAM(IMEI, MAKH, TENSP, LOAISP,NXS,THOIGIANBAOHANH,THONGTINSP) values (?,?,?,?,?,?,?);";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);

            // Them tham so vao "?"
            statement.setString(1,product.getImei() );
            statement.setInt(2, maKH);
            statement.setString(3, product.getTenSP());
            statement.setString(4, product.getLoaiSP());
            statement.setString(5,product.getNxs());
            statement.setString(6,product.getHanBaoHanh());

            statement.setString(7,product.getThongTinSP());
            statement.executeUpdate();
            statement.close();
        }catch (SQLException e){
            e.printStackTrace();
        }

    }

    @Override
    public void editProduct(String imei, String tenSP,String loaiSP,String nxs, String thoiGianBH,String thongTinSP)  {
        Connection connection = ConnectionDB.getConnectionDB();

        // Thuc hien truy van tham so
        String sql = "update SANPHAM  set TENSP=?, LOAISP=?,NXS=?,THOIGIANBAOHANH=?,THONGTINSP=? where IMEI=?;";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);

            // Them tham so vao "?"
            statement.setString(6,imei );
            statement.setString(1, tenSP);
            statement.setString(2, loaiSP);
            statement.setString(3,nxs);
            statement.setString(4,thoiGianBH);

            statement.setString(5,thongTinSP);
            statement.executeUpdate();
            statement.close();
        }catch (SQLException e){
            e.printStackTrace();
        }



    }

    @Override
    public Product searchByImei(String imei)  {
        Product product = new Product();

        try {
            Connection connection = ConnectionDB.getConnectionDB();
            String sql = "select * from SANPHAM where IMEI = ?;";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1,imei);
            ResultSet resultSet =statement.executeQuery();
            while (resultSet.next()){
                product.setImei(resultSet.getString(1));
                product.setMaKH(resultSet.getInt(2));
                product.setTenSP(resultSet.getString(3));
                product.setLoaiSP(resultSet.getString(4));
                product.setNxs(resultSet.getString(5));
                product.setHanBaoHanh(resultSet.getString(6));
                product.setThongTinSP(resultSet.getString(7));
            }
            statement.close();
            return product;
        }catch (SQLException e){
            e.printStackTrace();
        }
        return product;
    }

    @Override
    public void deleteProduct(String imei) {
        try {
            Connection connection = ConnectionDB.getConnectionDB();
            String sql =" delete from SANPHAM where IMEI="+imei+";";
            Statement statement = connection.createStatement();
            statement.execute(sql);
            statement.close();
        }catch (SQLException e){
            e.printStackTrace();
        }

    }
}
