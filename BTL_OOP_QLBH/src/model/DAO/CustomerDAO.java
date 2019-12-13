package model.DAO;

import connectionDB.ConnectionDB;
import model.Customer;
import model.Interface.ICustomer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO implements ICustomer {

    public CustomerDAO() {
    }

    @Override
    public List<Customer> getAllCustomer() {
        List<Customer> customerList = new ArrayList<>(); // Mang chua du lieu tra ve.
        Connection connection = ConnectionDB.getConnectionDB(); // tao connection
        String sql = "select * from KHACHHANG;"; // Cau lenh truy van sql
        try {
            Statement statement = connection.createStatement(); // Thuc thi cau lenh.
            ResultSet resultSet = statement.executeQuery(sql); // Du lieu duoc tra ve.
            while (resultSet.next()) // Kiem tra du lieu tra ve con trong hay khong?
            {
                Customer customer = new Customer();
                customer.setMaKH(resultSet.getInt(1));
                customer.setTenKH(resultSet.getString(2));
                customer.setDienThoai(resultSet.getString(3));
                customer.setEmail(resultSet.getString(4));
                customer.setDiaChi(resultSet.getString(5));

                customerList.add(customer); // Them vao danh sach.
            }

            statement.close();
            return customerList;
        }catch (SQLException e){
            e.printStackTrace();
        }

        return customerList;
    }

    @Override
    public void addCustomer(String tenKH,String dienThoai, String email, String diaCHi)  {

        Connection connection = ConnectionDB.getConnectionDB();
        // Thuc hien truy van tham so
        String sql = "insert into KHACHHANG(TENKH, DIENTHOAI, EMAIL, DIACHI) values (?,?,?,?);";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);

            // Them tham so vao "?"
            statement.setString(1, tenKH);
            statement.setString(2, dienThoai);
            statement.setString(3, email);
            statement.setString(4, diaCHi);
            statement.executeUpdate();
            statement.close();
        }catch (SQLException e){
            e.printStackTrace();
        }

    }

    @Override
    public void editCustomer(Customer customer)  {
        Connection connection = ConnectionDB.getConnectionDB();
        String sql = " update KHACHHANG set TENKH=?,DIENTHOAI=?,EMAIL=?,DIACHI=? where MAKH=?;";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, customer.getTenKH());
            statement.setString(2, customer.getDienThoai());
            statement.setString(3, customer.getEmail());
            statement.setString(4, customer.getDiaChi());
            statement.setInt(5, customer.getMaKH());
            statement.executeUpdate();
            statement.close();
        }catch (SQLException e){
            e.printStackTrace();
        }

    }

    @Override
    public Customer searchByPhone(String dienThoai)  {
        Customer customer = new Customer();
        Connection connection = ConnectionDB.getConnectionDB();
        String sql = "select * from KHACHHANG where DIENTHOAI =" + dienThoai + ";";
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                customer.setMaKH(resultSet.getInt(1));
                customer.setTenKH(resultSet.getString(2));
                customer.setDienThoai(resultSet.getString(3));
                customer.setEmail(resultSet.getString(4));
                customer.setDiaChi(resultSet.getString(5));
                statement.close();
            }
            return customer;
        }catch (SQLException e){
            e.printStackTrace();
        }

        return customer;
    }

    @Override
    public Customer searchByMaKH(int maKH) {
        Customer customer = new Customer();
        Connection connection = ConnectionDB.getConnectionDB();
        String sql = "select * from KHACHHANG where MAKH=" + maKH + ";";
        try {

            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                customer.setMaKH(resultSet.getInt(1));
                customer.setTenKH(resultSet.getString(2));
                customer.setDienThoai(resultSet.getString(3));
                customer.setEmail(resultSet.getString(4));
                customer.setDiaChi(resultSet.getString(5));
            }
            statement.close();
            return customer;
        }catch (SQLException e){
            e.printStackTrace();
        }

        return customer;
    }

    @Override
    public void deleteCustomer(int maKH) {
        Connection connection = ConnectionDB.getConnectionDB();
        String sql =" delete from KHACHHANG where MAKH =? ;";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1,maKH);
            statement.executeUpdate();
            statement.close();
        }catch (SQLException e){
            e.printStackTrace();
        }

    }
}
