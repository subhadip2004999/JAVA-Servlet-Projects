# Local Pharmacy Doctor Portal in Java

A comprehensive web application built with Java that bridges the gap between local pharmacies and doctors, enabling seamless communication and prescription management.

## 🌐 Live Site

Visit our live application: [https://pharmacyportal-image-latest.onrender.com/Home.jsp](https://pharmacyportal-image-latest.onrender.com/Home.jsp)

---

## 📋 Table of Contents

- [Project Overview](#project-overview)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Workflow](#workflow)
- [Deployment](#deployment)
- [Database Structure](#database-structure)
- [Dependencies](#dependencies)
- [Tools & Languages](#tools--languages)
- [Installation](#installation)
- [Usage](#usage)
- [Contact & Support](#contact--support)

---

## 🎯 Project Overview

The Local Pharmacy Doctor Portal is a full-stack web application that facilitates communication between healthcare professionals and pharmacies. This portal enables:

- **Doctors** to manage prescriptions and patient records
- **Pharmacies** to access and fulfill prescriptions
- **Patients** to track their medication status
- **Administrators** to manage users and system settings

This application streamlines the prescription workflow, reducing errors and improving patient care efficiency.

---

## ✨ Features

### For Doctors
- Create and manage patient prescriptions
- Track prescription fulfillment status
- Access patient medical history
- View pharmacy responses and confirmations

### For Pharmacies
- Receive and review prescriptions from doctors
- Update prescription status (pending, completed, delayed)
- Manage inventory and stock levels
- Communicate with doctors about prescriptions

### For Administrators
- User management (doctors, pharmacies, patients)
- System configuration and settings
- Generate reports and analytics
- Manage role-based access control

### General Features
- Secure user authentication and authorization
- Real-time notifications
- Comprehensive audit logs
- Responsive user interface
- Mobile-friendly design

---

## 🛠 Tech Stack

### Backend
- **Language**: Java
- **Framework**: JSP (JavaServer Pages)
- **Server**: Apache Tomcat (recommended)
- **Build Tool**: Maven

### Frontend
- **HTML5**
- **CSS3**
- **JavaScript**
- **Bootstrap** (for responsive design)

### Database
- **MySQL** (version 5.7 or higher)

### Tools & Development
- **IDE**: Eclipse / IntelliJ IDEA
- **Version Control**: Git
- **Deployment Platform**: Render

---

## 📁 Project Structure

```
Local-Pharmacy-Doctor-Portal-in-Java/
│
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── [Java source files]
│   │   │       ├── controllers/
│   │   │       ├── models/
│   │   │       ├── services/
│   │   │       ├── dao/
│   │   │       └── utils/
│   │   └── webapp/
│   │       ├── JSP files
│   │       ├── CSS/
│   │       ├── JavaScript/
│   │       └── WEB-INF/
│   │           └── web.xml
│   │
│   └── resources/
│       └── configuration files
│
├── WebContent/
│   ├── index.jsp
│   ├── Home.jsp
│   ├── css/
│   ├── js/
│   └── images/
│
├── database/
│   └── sql_structure.sql
│
├── pom.xml (Maven configuration)
├── .gitignore
└── README.md
```

---

## 🔄 Workflow

### User Authentication Flow
1. User accesses the portal via the login page
2. Credentials are validated against the database
3. Role-based authorization determines dashboard access
4. Session management via HttpSession

### Prescription Management Flow
1. **Doctor** creates a prescription and submits it
2. Prescription is stored in the database
3. **Pharmacy** receives notification of new prescription
4. **Pharmacy** reviews and updates status
5. **Doctor** and **Patient** can track the prescription status

### Request-Response Cycle
```
Client (Browser)
    ↓
JSP Pages (Frontend)
    ↓
Servlet/Controller (Business Logic)
    ↓
DAO Layer (Data Access)
    ↓
MySQL Database
    ↓
(Response flow back through the layers)
```

---

## 🚀 Deployment

### Prerequisites
- Java Development Kit (JDK) 8 or higher
- Apache Tomcat 9 or higher
- MySQL Server 5.7 or higher
- Maven 3.6 or higher

### Deployment Steps

1. **Clone the Repository**
   ```bash
   git clone https://github.com/subhadip2004999/Local-Pharmacy-Doctor-Portal-in-Java.git
   cd Local-Pharmacy-Doctor-Portal-in-Java
   ```

2. **Configure Database Connection**
   - Update database connection details in the configuration files
   - Default location: `src/main/resources/db.properties`
   ```properties
   db.url=jdbc:mysql://localhost:3306/pharmacy_portal
   db.user=root
   db.password=your_password
   ```

3. **Build the Project**
   ```bash
   mvn clean install
   ```

4. **Deploy to Tomcat**
   - Copy the WAR file from `target/` to Tomcat's `webapps/` directory
   - Restart Tomcat server

5. **Access the Application**
   - Local: `http://localhost:8080/Local-Pharmacy-Doctor-Portal-in-Java/Home.jsp`
   - Live: [https://pharmacyportal-image-latest.onrender.com/Home.jsp](https://pharmacyportal-image-latest.onrender.com/Home.jsp)

### Render Deployment Configuration
The application is deployed on Render with the following configuration:
- **Platform**: Render.com
- **Environment**: Java with Tomcat
- **Database**: MySQL (hosted separately)
- **Auto-deployment**: Enabled on main branch

---

## 🗄 Database Structure

### Main Tables

#### Users Table
```sql
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL,
    role ENUM('doctor', 'pharmacy', 'patient', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE
);
```

#### Doctors Table
```sql
CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    license_number VARCHAR(50) UNIQUE NOT NULL,
    specialization VARCHAR(100),
    clinic_name VARCHAR(100),
    phone VARCHAR(15),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
```

#### Pharmacies Table
```sql
CREATE TABLE pharmacies (
    pharmacy_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    license_number VARCHAR(50) UNIQUE NOT NULL,
    pharmacy_name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    city VARCHAR(50),
    phone VARCHAR(15),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
```

#### Patients Table
```sql
CREATE TABLE patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    date_of_birth DATE,
    blood_type VARCHAR(5),
    allergies TEXT,
    phone VARCHAR(15),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
```

#### Prescriptions Table
```sql
CREATE TABLE prescriptions (
    prescription_id INT PRIMARY KEY AUTO_INCREMENT,
    doctor_id INT NOT NULL,
    patient_id INT NOT NULL,
    pharmacy_id INT,
    medicine_name VARCHAR(100) NOT NULL,
    dosage VARCHAR(50),
    frequency VARCHAR(100),
    duration INT,
    notes TEXT,
    status ENUM('pending', 'approved', 'completed', 'cancelled') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (pharmacy_id) REFERENCES pharmacies(pharmacy_id)
);
```

#### Prescription Items Table
```sql
CREATE TABLE prescription_items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    prescription_id INT NOT NULL,
    medicine_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (prescription_id) REFERENCES prescriptions(prescription_id)
);
```

#### Medicines Table
```sql
CREATE TABLE medicines (
    medicine_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    generic_name VARCHAR(100),
    manufacturer VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stock_quantity INT DEFAULT 0
);
```

For complete SQL structure, see `database/sql_structure.sql`

---

## 📦 Dependencies

### Maven Dependencies (pom.xml)

```xml
<!-- Servlet API -->
<dependency>
    <groupId>javax.servlet</groupId>
    <artifactId>javax.servlet-api</artifactId>
    <version>4.0.1</version>
    <scope>provided</scope>
</dependency>

<!-- JSP API -->
<dependency>
    <groupId>javax.servlet.jsp</groupId>
    <artifactId>javax.servlet.jsp-api</artifactId>
    <version>2.3.3</version>
    <scope>provided</scope>
</dependency>

<!-- MySQL JDBC Driver -->
<dependency>
    <groupId>mysql</groupId>
    <artifactId>mysql-connector-java</artifactId>
    <version>8.0.33</version>
</dependency>

<!-- JSTL (JavaServer Pages Standard Tag Library) -->
<dependency>
    <groupId>javax.servlet</groupId>
    <artifactId>jstl</artifactId>
    <version>1.2</version>
</dependency>

<!-- JUnit for Testing -->
<dependency>
    <groupId>junit</groupId>
    <artifactId>junit</artifactId>
    <version>4.13.2</version>
    <scope>test</scope>
</dependency>

<!-- Log4j for Logging -->
<dependency>
    <groupId>log4j</groupId>
    <artifactId>log4j</artifactId>
    <version>1.2.17</version>
</dependency>
```

### External Libraries
- **Apache Commons Lang** - Utility functions
- **Commons DBCP** - Database connection pooling
- **Apache Struts** (optional) - MVC framework

---

## 🛠 Tools & Languages

### Languages
- **Java** - Backend development
- **JSP (JavaServer Pages)** - Server-side templating
- **HTML5** - Frontend markup
- **CSS3** - Styling
- **JavaScript** - Client-side scripting
- **SQL** - Database queries

### Tools
- **Git** - Version control
- **Maven** - Build automation and dependency management
- **Apache Tomcat** - Application server
- **MySQL** - Database management system
- **Eclipse IDE** / **IntelliJ IDEA** - Development environment
- **Postman** - API testing (if applicable)
- **Render** - Cloud hosting platform

### Development Tools
- **JDBC (Java Database Connectivity)** - Database connectivity
- **Session Management** - HTTP Session handling
- **File Upload Libraries** - For prescription documents

---

## 💻 Installation

### Prerequisites
- JDK 8 or higher
- Apache Tomcat 9+
- MySQL 5.7+
- Maven 3.6+
- Git

### Local Setup

1. **Clone the Repository**
   ```bash
   git clone https://github.com/subhadip2004999/Local-Pharmacy-Doctor-Portal-in-Java.git
   cd Local-Pharmacy-Doctor-Portal-in-Java
   ```

2. **Create Database**
   ```bash
   mysql -u root -p
   ```
   ```sql
   CREATE DATABASE pharmacy_portal;
   USE pharmacy_portal;
   SOURCE database/sql_structure.sql;
   ```

3. **Update Database Configuration**
   - Edit `src/main/resources/db.properties` or configuration file
   - Set your MySQL credentials

4. **Build Project**
   ```bash
   mvn clean package
   ```

5. **Deploy to Tomcat**
   ```bash
   cp target/Local-Pharmacy-Doctor-Portal-in-Java.war $CATALINA_HOME/webapps/
   ```

6. **Start Tomcat**
   ```bash
   $CATALINA_HOME/bin/startup.sh  # On Linux/Mac
   # or
   %CATALINA_HOME%\bin\startup.bat  # On Windows
   ```

7. **Access Application**
   - Open browser and navigate to: `http://localhost:8080/Local-Pharmacy-Doctor-Portal-in-Java/Home.jsp`

---

## 📖 Usage

### For Doctors
1. Log in with doctor credentials
2. Navigate to "Create Prescription"
3. Select patient and add medicine details
4. Submit prescription to pharmacy
5. Track prescription status in "My Prescriptions"

### For Pharmacies
1. Log in with pharmacy credentials
2. View "Pending Prescriptions"
3. Review prescription details
4. Update status (Approved/Completed)
5. Manage inventory if needed

### For Patients
1. Sign up or log in
2. View "My Prescriptions"
3. Track prescription fulfillment
4. Download prescription documents

### For Administrators
1. Access admin dashboard
2. Manage users (create, edit, delete)
3. View system reports
4. Configure system settings

---

## 🔒 Security Features

- **Password Hashing**: Passwords are hashed using industry-standard algorithms
- **Role-Based Access Control (RBAC)**: Different access levels for different user types
- **Session Management**: Secure session handling with timeout
- **SQL Injection Prevention**: Parameterized queries and prepared statements
- **Input Validation**: Client and server-side validation
- **HTTPS**: Secure data transmission on production

---

## 📄 License

This project is open source and available under the MIT License.

---

## 📞 Contact & Support

For any queries, issues, or support requests, please contact:

**Email**: [businesssubhadip@gmail.com](mailto:businesssubhadip@gmail.com)

**GitHub**: [@subhadip2004999](https://github.com/subhadip2004999)

**Live Site**: [https://pharmacyportal-image-latest.onrender.com/Home.jsp](https://pharmacyportal-image-latest.onrender.com/Home.jsp)

---

## 🚧 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📋 Roadmap

- [ ] Mobile app (Android/iOS)
- [ ] Email notifications
- [ ] SMS alerts for prescription status
- [ ] Advanced analytics and reporting
- [ ] Integration with payment gateway
- [ ] Multi-language support
- [ ] Enhanced user interface
- [ ] API documentation

---

## 🙏 Acknowledgments

- Apache Tomcat community
- MySQL community
- Java community
- Bootstrap framework

---

**Last Updated**: August 2026

For the latest updates and features, visit the [GitHub repository](https://github.com/subhadip2004999/Local-Pharmacy-Doctor-Portal-in-Java).

