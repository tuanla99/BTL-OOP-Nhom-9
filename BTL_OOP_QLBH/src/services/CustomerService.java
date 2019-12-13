package services;

import model.Customer;
import model.DAO.CustomerDAO;
import model.Interface.ICustomer;

import java.sql.SQLException;
import java.util.List;

public class CustomerService implements ICustomer {

    private CustomerDAO customerDAO = new CustomerDAO();

    @Override
    public List<Customer> getAllCustomer() {
        return customerDAO.getAllCustomer();
    }

    @Override
    public void addCustomer(String tenKH,String dienThoai, String email, String diaCHi)  {
        customerDAO.addCustomer(tenKH, dienThoai, email, diaCHi);
    }

    @Override
    public void editCustomer(Customer customer)  {
        customerDAO.editCustomer(customer);
    }

    @Override
    public Customer searchByPhone(String phoneNumber) {
        return customerDAO.searchByPhone(phoneNumber);
    }

    @Override
    public Customer searchByMaKH(int maKH)  {
        return customerDAO.searchByMaKH(maKH);
    }

    @Override
    public void deleteCustomer(int maKH)  {
        customerDAO.deleteCustomer(maKH);
    }
}
