# Banking Management Web App

A Java Servlet and JSP-based banking management web application for administering customer accounts and basic banking operations through a single web interface.

> **Important:** This project currently contains database connection credentials directly in the servlet source files. Do not use those credentials in production. Rotate any exposed credentials and move database configuration to environment variables, container-managed resources, or a secrets manager before deploying.

## Features

The application provides the following operations from `Home.jsp`:

- Create a customer account
- Search customer details by account number
- Deposit money into an account
- Withdraw money from an account after checking the balance
- View the current account balance
- Verify customer KYC using an account number and phone number
- Reset the displayed result for each operation

## Technology Stack

- **Java**
- **Jakarta Servlet API**
- **JSP (JavaServer Pages)**
- **JDBC**
- **MySQL**
- **Apache Tomcat** or another Jakarta-compatible servlet container
- HTML and CSS for the user interface

## Project Structure

```text
Banking Management WebApp/
├── Home.jsp              # Main banking management interface
├── CreateServlet.java    # Creates customer accounts
├── SearchServlet.java    # Retrieves customer details
├── DepositServlet.java   # Deposits money into an account
├── WithdrawServlet.java  # Withdraws money after balance validation
├── BalanceServlet.java   # Retrieves the current balance
├── KycServlet.java       # Performs KYC verification
└── web.xml               # Web application deployment descriptor
```

All servlets use the `myPackage` package and are mapped with `@WebServlet` annotations.

## Database Schema

The application expects a MySQL table named `bank`. A basic schema compatible with the queries in this project is:

```sql
CREATE DATABASE banking;
USE banking;

CREATE TABLE bank (
    id INT AUTO_INCREMENT PRIMARY KEY,
    AccountNumber VARCHAR(10) NOT NULL UNIQUE,
    AccountType VARCHAR(20) NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(20) NOT NULL,
    Email VARCHAR( 이메일 255) NOT NULL,
    Balance DECIMAL(15, 2) NOT NULL DEFAULT 0.00,
    Kyc VARCHAR(20) NOT NULL DEFAULT 'Not Verified'
);
```

Replace `VARCHAR( 이메일 255)` with `VARCHAR(255)` if copying the statement directly. The corrected column definition is:

```sql
Email VARCHAR(255) NOT NULL
```

The application uses the following columns:

- `id`
- `AccountNumber`
- `AccountType`
- `Name`
- `Phone`
- `Email`
- `Balance`
- `Kyc`

## Prerequisites

Install or configure the following:

1. JDK 8 or later
2. Apache Tomcat compatible with the Jakarta Servlet API used by the project
3. MySQL Server
4. MySQL Connector/J JDBC driver
5. An IDE such as Eclipse, IntelliJ IDEA, or NetBeans, or a servlet build setup such as Maven

## Configuration

Update the JDBC connection configuration in each servlet before running the application:

- `CreateServlet.java`
- `SearchServlet.java`
- `DepositServlet.java`
- `WithdrawServlet.java`
- `BalanceServlet.java`
- `KycServlet.java`

Use your own database URL, username, and password. Prefer external configuration instead of hard-coding credentials, for example:

```java
String url = System.getenv("BANK_DB_URL");
String username = System.getenv("BANK_DB_USERNAME");
String password = System.getenv("BANK_DB_PASSWORD");
```

Also ensure that the MySQL Connector/J JAR is available on the application's classpath or in Tomcat's `lib` directory.

## Running the Application

1. Clone the repository:

   ```bash
   git clone https://github.com/subhadip2004999/JAVA-Servlet-Projects.git
   cd JAVA-Servlet-Projects/Banking\ Management\ WebApp
   ```

2. Create the MySQL database and `bank` table using the schema above.
3. Configure the JDBC connection securely.
4. Deploy the application to Tomcat as a web application.
5. Start Tomcat and open:

   ```text
   http://localhost:8080/<context-path>/Home.jsp
   ```

The exact context path depends on the name of the deployed WAR or application directory.

## Request Flow

`Home.jsp` submits form data to the corresponding servlet. Each servlet performs a JDBC query or update and stores the result in the HTTP session. The user is then redirected or forwarded back to `Home.jsp`, where JSP Expression Language displays the status and account information.

## Security and Production Considerations

This project is suitable as an educational Servlet/JSP example, but additional work is required for production use:

- Remove all hard-coded database credentials and rotate credentials that have been committed.
- Use a connection pool and close `Connection`, `PreparedStatement`, and `ResultSet` resources with try-with-resources.
- Validate and constrain monetary amounts, including rejecting zero and negative values.
- Use `BigDecimal` rather than `double` for currency calculations.
- Make deposits and withdrawals transactional and use row-level locking to prevent lost updates.
- Add authentication, authorization, CSRF protection, and secure session management.
- Avoid exposing sensitive customer information in the interface.
- Use HTTPS and secure cookie settings.
- Return user-friendly error messages without exposing stack traces.
- Store KYC data securely and follow applicable privacy and banking regulations.

## License

No license file is currently included. Add a license if you intend to distribute or reuse this project.
