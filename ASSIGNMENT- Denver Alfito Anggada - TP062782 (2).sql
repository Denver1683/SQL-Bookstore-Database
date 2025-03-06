/*
-- Create and Use Assignment
create database Assignment;
use Assignment;

-- Create Department Table
Create Table Department
(DepartmentID nvarchar(7) Primary Key,
Name nvarchar(50) NOT NULL);

-- Insert data to Department Table
insert into Department values
('dep0001','Delivery'),
('dep0002','Customer Care'),
('dep0003','Sales'),
('dep0004','Administrative'),
('dep0005','Accounting'),
('dep0006','Marketing');

-- Create Manager Table
Create table Manager
(ManagerID nvarchar(7) Primary Key,
FirstName nvarchar(50) NOT NULL,
LastName nvarchar(50) NOT NULL,
DOB date NOT NULL,
Address nvarchar(80) NOT NULL,
DepartmentID nvarchar(7) NOT NULL foreign key references Department(DepartmentID));

-- Insert data into Manager Table
insert into Manager values
('man0001','Simon','Carter','10/11/1980','Kampung Sungai Betul, 36100, Kuala Lumpur, Perak, Malaysia','dep0005'),
('man0002','Lucy','Salazar','1/1/1981',' Taman Meng Meng,93200,Kuala Lumpur, Sarawak,  Malaysia','dep0003'),
('man0003','Maurice','Santiago','8/11/1996','Lorong Mawar (1 - 2),12300,Kuala Lumpur, Pulau Pinang,  Malaysia','dep0001'),
('man0004','Charlotte','Osborne','11/19/2002','Taman Kampung Tengah,86000,Kuala Lumpur, Johor,  Malaysia','dep0002'),
('man0005','Aiden','Wilson','8/28/2003','Kampung Sempalit,27600,Kuala Lumpur, Pahang,  Malaysia','dep0005'),
('man0006','Matt','Frank','6/10/1988','Taman Lucky,70300,Kuala Lumpur, Negeri Sembilan,  Malaysia','dep0002');

-- Create Employee Table
Create table Employee
(EmployeeID nvarchar(7)Primary Key,
FirstName nvarchar(50) NOT NULL,
LastName nvarchar(50) NOT NULL,
DOB date NOT NULL ,
Address nvarchar(80) NOT NULL,
DepartmentID nvarchar (7) NOT NULL foreign key references Department(DepartmentID));

-- Insert data into Employee Table
insert into Employee values
('emp0006','Carlos','Wong','8/8/2000','Lorong Haji Selamat,82000, Kuala Lampur, Johor,  Malaysia','dep0001'),
('emp0001','Jason','Simpson','10/11/1980','Taman Bukit Mor 1 & 2,84150,Kuala Lumpur, Johor,  Malaysia','dep0001'),
('emp0002','Lois','Capuldi','8/28/2003','Jalan Meru Indah / KU 08,42200,Kuala Lumpur, Selangor,  Malaysia','dep0005'),
('emp0003','Marge','Barack','6/10/1988','Kampung Delek,41250,Kuala Lumpur, Selangor,  Malaysia','dep0004'),
('emp0004','Homer','Johnson','8/11/1996','Lebuh King,10200,Kuala Lumpur, Pulau Pinang,  Malaysia','dep0002'),
('emp0005','Bart','Bertuv','1/1/1981','Kampung Bendang Baru,31100,Kuala Lumpur, Perak,  Malaysia','dep0003');

-- Create Inventory Purchased Table
Create table InventoryPurchased
(OrderID nvarchar(7) Primary Key,
PurchasedDate date NOT NULL,
ReceivedDate date NOT NULL,
ManagerID nvarchar(7) NOT NULL foreign key references Manager(ManagerID),
EmployeeID nvarchar(7) NOT NULL foreign key references Employee(EmployeeID),
Subtotal float NOT NULL);

-- Insert Data into InventoryPurchased Table
insert into InventoryPurchased values
('ord0001','1/1/2021','1/15/2021','man0001','emp0001','5000'),
('ord0002','6/18/2022','6/30/2022','man0005','emp0005','7500'),
('ord0003','8/4/2020','8/11/2020','man0003','emp0005','1500'),
('ord0004','2/22/2020','3/1/2020','man0004','emp0002','2000'),
('ord0005','7/8/2019','7/28/2019','man0001','emp0001','700'),
('ord0006','4/10/2022','4/18/2022','man0006','emp0006','300');

-- Create Publisher Table
Create Table Publisher
(PublisherID nvarchar(7) Primary Key NOT NULL,
Name nvarchar(50) NOT NULL,
Address nvarchar(80) NOT NULL,
ContactNo nvarchar(20) NOT NULL);

--Insert data into Publisher Table
insert into Publisher values
('pub0001','ABC Inc','Jalan Pulau Sipadan (U10/87 - U10/92),40170, Shah Alam, Selangor,  Malaysia','+60 2 170 6739'),
('pub0002','Conscious Choice','Lorong Aman,14000, Bukit Mertajam, Pulau Pinang,  Malaysia','+60 2 865 6816'),
('pub0003','Postal Center Plus LLC','Jalan Yang Kalsom,30250, Ipoh, Perak,  Malaysia','+60 2 311 2143'),
('pub0004','TCI SOftware','Jalan Melor,75150, Melaka, Melaka,  Malaysia','+60 2 965 9359'),
('pub0005','Universal Machine Company','Jalan Kelantan (Hingga Km 6),20050, Kuala Terengganu, Terengganu,  Malaysia','+60 2 965 9359'),
('pub0006','Josh Ellithorpe','Taman Bakar Arang,8000, Sungai Petani, Kedah,  Malaysia','+60 2 053 4503');

-- Create Book Table (Genre Column Blank)
Create Table Book
(ISBN nvarchar(20) Primary Key,
Title nvarchar(50) NOT NULL,
Genre nvarchar (20)NOT NULL, 
Type nvarchar (30) NOT NULL,
PublishedDate date NOT NULL,
Author nvarchar(50) NOT NULL,
Inventory int NOT NULL,
PublisherID nvarchar(7)  NOT NULL foreign key references Publisher( PublisherID),
Price float NOT NULL);

-- Insert data into book table
insert into Book values
('0-1642-0825-9','Naked Fire','Thriller','Novel','10/6/2014','Liam Bailey','11','pub0001','150'),
('0-7321-6579-2','The Delicious Abyss','Comedy','Novel','9/2/2015','Anthony Houghton','15','pub0002','115'),
('0-4212-8600-8','Winter of Flame','Romance','Novel','2/12/2016','Louie Wilson','17','pub0002','275'),
('0-2199-0357-3','How to: Science','Education','Textbook','8/14/2018','John Thompson','30','pub0004','122'),
('0-7413-1232-8','Lord in the Planet','Fantasy','Novel','5/11/2020','Sean Watson','2','pub0005','75'),
('0-9730-6842-6','101 Cambridge English Dictionary','Education','Dictionary & Encylopedia','4/22/2016','Casen Spencer','12','pub0001','229');

-- Create Purchase Table
Create Table Purchase
(PurchaseID nvarchar(7) Primary Key,
OrderID nvarchar(7) NOT NULL foreign key references InventoryPurchased(OrderID),
ISBN nvarchar(20) NOT NULL foreign key references Book(ISBN),
Quantity int NOT NULL);

-- Insert values into Purchase Table
insert into Purchase values
('pur0001','ord0001','0-1642-0825-9','15'),
('pur0002','ord0003','0-4212-8600-8','20'),
('pur0003','ord0005','0-9730-6842-6','5'),
('pur0004','ord0006','0-7413-1232-8','50'),
('pur0005','ord0001','0-9730-6842-6','25');

-- Create Member Table
Create Table Member
(MemberID nvarchar(7) Primary Key,
Name nvarchar(30) NOT NULL,
Telephone_Number nvarchar(20) NOT NULL, 
Email nvarchar (50) NOT NULL,
ShippingAddress nvarchar(80) NOT NULL,
City nvarchar(50) NOT NULL,
State nvarchar(50) NOT NULL,
Postcode nvarchar(50) NOT NULL, 
Bank nvarchar (50) NOT NULL,
Bank_AccNo nvarchar(10) NOT NULL);

-- Insert values into Member table
insert into Member values
('mem0001','Kingston Salvo','+60 11-7263 7769','k.slavo@gmail.com','Kampung Baru Manchis,28730, Bentong, Pahang,  Malaysia','Kuantan','Pahang','28730','Maybank','24019704'),
('mem0002','Lucilio Prashant','+60 11-4544 2928','l.prashant@gmail.com','Kampung Tanjung Batu Nenasi,26680, Pekan, Pahang,  Malaysia','Bentong','Pahang','26680','CIMB','41890423'),
('mem0003','Alard Lennox','+60 14-400 7330','a.lennox@gmail.com','Taman Mawar,32000, Sitiawan, Perak,  Malaysia','Ipoh','Perak','32000','Maybank','32935077'),
('mem0004','Bahdan Walton','+60 18-663 0844','b.walton@gmail.com','Taman Suri,6500, Langgar, Kedah,  Malaysia','Alor Setar','Kedah','6500','RHB','54537646'),
('mem0005','Helge Velibor','+60 14-400 5317','h.velibor@gmail.com','Lebuh Ong Chong Keng,10400, Pulau Pinang, Pulau Pinang,  Malaysia','Bayan Lepas','Pinang','10400','Affin Bank','97889672'),
('mem0006','Helmut Kyrillos','+60 10-232 0827','h.kyrillos@gmail.com','Cherok Tokun,14000, Bukit Mertajam, Pulau Pinang,  Malaysia','George Town','Pinang','14000','AmBank','52040837');

-- Create Sales Table
Create Table Sales
(SalesID nvarchar(7) Primary Key, 
ISBN nvarchar(20) NOT NULL foreign key references Book(ISBN) ,
EmployeeID nvarchar(7) NOT NULL foreign key references Employee(EmployeeID) ,
MemberID nvarchar(7) NOT NULL foreign key references Member(MemberID)  ,
Subtotal float NOT NULL,
Quantity int NOT NULL,
ShippingDate date NOT NULL,
Status nvarchar(50) NOT NULL CHECK (Status in ('processing','shipped','out for delivery')) DEFAULT 'processing');

--Insert data into Sales Table (Problem in data)
insert into Sales values
('sal0001','0-9730-6842-6','emp0001','mem0006','1500','10','6/1/2022','out for delivery'),
('sal0002','0-7321-6579-2','emp0002','mem0004','150','5','8/7/2021','shipped'),
('sal0003','0-4212-8600-8','emp0003','mem0003','225','7','12/23/2020','shipped'),
('sal0004','0-2199-0357-3','emp0004','mem0004','415','2','1/23/2022','shipped'),
('sal0005','0-7321-6579-2','emp0004','mem0004','150','1','5/18/2021','shipped'),
('sal0006','0-9730-6842-6','emp0002','mem0006','640','5','5/19/2022','processing');

-- Create Reviews Table
Create Table Reviews
(ReviewID nvarchar(7) Primary Key,
MemberID nvarchar(7) NOT NULL foreign key references Member(MemberID),
ISBN nvarchar(20) NOT NULL foreign key references Book(ISBN),
Rating int NOT NULL constraint val_lim Check  (rating in (0,1,2,3,4,5,6,7,8,9,10)) DEFAULT 0,
Comment nvarchar(100) NOT NULL DEFAULT '-');

--Insert data into Reviews Table
insert into Reviews values
('Rev0001','mem0005','0-9730-6842-6','10','Amazing! The definitions are very well organized.'),
('Rev0002','mem0004','0-4212-8600-8','3','Congratulations, this is officially the worst book I have ever read.'),
('Rev0003','mem0003','0-1642-0825-9','8','I wish I hadnt read this, because now I have no more tears left. Such a lovely tear jerker!'),
('Rev0004','mem0004','0-7321-6579-2','2','Really? Space monkeys with teleporting lazers? Its like it was written by a child.'),
('Rev0005','mem0001','0-7413-1232-8','7','Decent. Well written plot and nice character development.'),
('Rev0006','mem0002','0-2199-0357-3','9','Thank you so much!!, this literally is the reason I passed my exams');

-- Create SalesReturn Table
Create Table SalesReturn
(SalesReturnID nvarchar(7) Primary key,
Reason nvarchar(50) NOT NULL,
ReturnStatus nvarchar(50) NOT NULL,
MemberID nvarchar(7)  NOT NULL foreign key references Member(MemberID),
ISBN nvarchar(20) NOT NULL foreign key references Book(ISBN));

--Insert Data into SalesReturn Table
insert into SalesReturn values
('sar0001','Damaged Product','ACCEPTED','mem0001','0-7321-6579-2'),
('sar0002','Accidentally ordered different book','ACCEPTED','mem0002','0-7321-6579-2'),
('sar0003','The product didnt match the description','ACCEPTED','mem0003','0-4212-8600-8'),
('sar0004','Wrong amount','REJECTED','mem0004','0-2199-0357-3'),
('sar0005','Late delivery','ACCEPTED','mem0005','0-7321-6579-2'),
('sar0006','Damaged product','REJECTED','mem0006','0-9730-6842-6');

-- Create PurchaseReturn Table
Create Table PurchaseReturn
(PurchaseReturnID nvarchar(7) Primary Key,
Reason nvarchar(50) NOT NULL,
ReturnStatus nvarchar(50) NOT NULL,
Quantity int NOT NULL,
PublisherID nvarchar(7) NOT NULL Foreign Key References Publisher(PublisherID),
ISBN nvarchar(20) NOT NULL Foreign Key References Book(ISBN) ,
ManagerID nvarchar(7) NOT NULL Foreign Key References Manager(ManagerID));

-- Insert data into PurchaseReturn Table
insert into PurchaseReturn values
('pre0001','Wrong number','ACCEPTED','50','pub0004','0-7413-1232-8','man0001'),
('pre0002','Damaged','ACCEPTED','20','pub0002','0-7321-6579-2','man0004'),
('pre0003','Wrong number','ACCEPTED','15','pub0003','0-4212-8600-8','man0003'),
('pre0004','Late delivery','ACCEPTED','40','pub0004','0-9730-6842-6','man0006'),
('pre0005','Incorrect Order','REJECTED','20','pub0005','0-7413-1232-8','man0001'),
('pre0006','Damaged','ACCEPTED','5','pub0004','0-9730-6842-6','man0006');
*/
--Individual Question
--Q4
--Find the total number of books ordered by store manager from each publisher.
Select sum(Quantity) NumberOfBooks, Publisher.Name from Purchase inner join Book on Purchase.ISBN = Book.ISBN inner join Publisher on Book.PublisherID = Publisher.PublisherID group by Publisher.Name;
--Q5
--From the book table, list the books where quantity is more than the average quantity of all books. 
Select ISBN, Title from Book where Inventory > (select avg(Inventory) from Book);
--Q6
--Find the bestselling book
Select max(ISBN) as BestSellingBook from Sales;

