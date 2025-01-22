# Supplier Management System

## Description
The Supplier Management System is a SQL-based project designed to manage supplier information and their relationship with the products in inventory. This system integrates seamlessly with the inventory management system, allowing users to track supplier details, products provided, pricing, and order requirements.

## Features
- **Suppliers Table**: Stores information about suppliers, such as contact details and addresses.
- **Supplier Products Table**: Links suppliers to the products they provide, including pricing and minimum order quantities.
- **Queries**:
  - List all suppliers with contact information.
  - View the products supplied by each supplier, along with prices and minimum order quantities.
  - Find the cheapest supplier for a specific product.
  - Calculate the total cost of a bulk order from a supplier.

## How to Use
1. **Set Up the Database**:
   - Use MySQL or a compatible DBMS.
   - Run the `supplier_management.sql` script to create the database and populate it with sample data.

2. **Analyze Supplier Data**:
   - Use the provided queries to gain insights into supplier relationships, pricing, and product availability.

3. **Integration**:
   - This system is designed to integrate with the `inventory_management` and `sales_management` systems created in previous projects.

## SQL Highlights
- **Foreign keys** maintain relationships between suppliers and products.
- **Aggregate functions** for calculating total costs and finding the cheapest supplier.
- Modular design for easy integration with existing systems.

## License
This project is licensed under the MIT License.

## Author
[Your Name]
