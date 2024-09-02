using System.ComponentModel.DataAnnotations;

namespace CustomerApp.Models
{
    public class Customer
    {
        public class CustomerItem
        {
            public int CustomerID { get; set; }

            [Required]
            [StringLength(50)]
            public string FirstName { get; set; }

            [Required]
            [StringLength(50)]
            public string LastName { get; set; }

            [Required]
            [EmailAddress]
            [StringLength(100)]
            public string Email { get; set; }

            [Phone]
            [StringLength(20)]
            public string Phone { get; set; }

            [Required]
            [StringLength(10)]
            public string Postcode { get; set; }
        }

        public class CustomerList : List<CustomerItem> { }
    }
}
