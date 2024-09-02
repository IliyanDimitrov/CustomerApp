using CustomerApp.Models;
using System.Data;
using System.Data.SqlClient;

namespace CustomerApp.Services
{
    public class CustomerService
    {
        private readonly string _connectionString;

        public CustomerService(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("DefaultConnection");
        }

        public async Task<Customer.CustomerItem> GetCustomerByPostcodeAsync(string postcode)
        {
            try
            {
                using var connection = new SqlConnection(_connectionString);
                await connection.OpenAsync();

                using var command = new SqlCommand("sp_SelectCustomer", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@Postcode", postcode);

                using var reader = await command.ExecuteReaderAsync();
                if (await reader.ReadAsync())
                {
                    return new Customer.CustomerItem
                    {
                        CustomerID = reader.GetInt32(reader.GetOrdinal("CustomerID")),
                        FirstName = reader.GetString(reader.GetOrdinal("FirstName")),
                        LastName = reader.GetString(reader.GetOrdinal("LastName")),
                        Email = reader.GetString(reader.GetOrdinal("Email")),
                        Phone = reader.IsDBNull(reader.GetOrdinal("Phone")) ? null : reader.GetString(reader.GetOrdinal("Phone")),
                        Postcode = reader.GetString(reader.GetOrdinal("Postcode"))
                    };
                }

                return null;
            }
            catch (Exception ex)
            {
                // Log the exception
                Console.WriteLine($"An error occurred while getting customer by postcode: {ex.Message}");
                throw;
            }
        }

        public async Task<int> CreateCustomerAsync(Customer.CustomerItem customer)
        {
            try
            {
                using var connection = new SqlConnection(_connectionString);
                await connection.OpenAsync();

                using var command = new SqlCommand("sp_InsertCustomer", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.AddWithValue("@FirstName", customer.FirstName);
                command.Parameters.AddWithValue("@LastName", customer.LastName);
                command.Parameters.AddWithValue("@Email", customer.Email);
                command.Parameters.AddWithValue("@Phone", (object)customer.Phone ?? DBNull.Value);
                command.Parameters.AddWithValue("@Postcode", customer.Postcode);

                var result = await command.ExecuteScalarAsync();
                return Convert.ToInt32(result);
            }
            catch (Exception ex)
            {
                // Log the exception
                Console.WriteLine($"An error occurred while creating a customer: {ex.Message}");
                throw;
            }
        }
    }
    
}
