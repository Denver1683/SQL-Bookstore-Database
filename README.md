# 📚 SQL Bookstore Database

## 📌 Overview
This project is an **SQL-based bookstore management system** that models various business processes such as **inventory management, order processing, sales tracking, and returns management**. It includes **a relational database schema**, sample data insertion, and **key SQL queries** to analyze and retrieve information efficiently.

## 🛠️ Technologies Used
- **SQL** (Structured Query Language)
- **Relational Database Design** (Primary & Foreign Keys, Normalization)
- **Joins, Aggregation, Subqueries**
- **Data Filtering & Optimization**

## 📄 Database Schema
The database consists of multiple interlinked tables:
- **Department** - Stores department details
- **Manager** - Contains information on store managers
- **Employee** - Employee records linked to departments
- **InventoryPurchased** - Tracks inventory purchase transactions
- **Publisher** - Stores publisher details
- **Book** - Stores book details, linked to publishers
- **Purchase** - Stores purchase transactions
- **Member** - Records customer details
- **Sales** - Tracks book sales, linked to employees and members
- **Reviews** - Stores customer reviews and ratings
- **SalesReturn & PurchaseReturn** - Handles product returns

## 🔍 Key SQL Queries
This project includes **individual queries** to extract meaningful insights:

### **1️⃣ Find the Total Number of Books Ordered from Each Publisher**
```sql
SELECT SUM(Quantity) AS NumberOfBooks, Publisher.Name
FROM Purchase
INNER JOIN Book ON Purchase.ISBN = Book.ISBN
INNER JOIN Publisher ON Book.PublisherID = Publisher.PublisherID
GROUP BY Publisher.Name;
```
📌 **Description**: Retrieves the total quantity of books ordered from each publisher.

### **2️⃣ List Books Where Inventory Exceeds the Average Inventory**
```sql
SELECT ISBN, Title
FROM Book
WHERE Inventory > (SELECT AVG(Inventory) FROM Book);
```
📌 **Description**: Lists books with inventory levels higher than the average stock.

### **3️⃣ Find the Bestselling Book**
```sql
SELECT MAX(ISBN) AS BestSellingBook FROM Sales;
```
📌 **Description**: Identifies the book with the highest sales volume.

## 🚀 How to Use
1. **Run the schema script** to create the database and tables.
2. **Insert sample data** using provided SQL statements.
3. **Execute queries** to analyze bookstore operations.

## 📜 Notes
- This project was part of an **academic SQL assignment**.
- The database schema was designed to **ensure data integrity and enforce relationships** using **foreign keys**.
- The queries demonstrate **aggregation, joins, and subqueries** to retrieve insights from the bookstore data.

## 📌 Disclaimer
This project is for **educational purposes and personal portfolio only** and was developed as part of a university assignment.

---
