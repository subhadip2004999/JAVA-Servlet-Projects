# Registration Login Portal (Java)

A simple Registration and Login portal implemented in Java with HTML front-end pages. This project demonstrates basic user registration, login, session handling, and account deletion using servlets and a PostgreSQL (Supabase) backend.

**🌐 Live Website:** https://myportal-image-latest.onrender.com

## Website Preview

### Welcome Page
![Welcome to My Portal](https://github.com/subhadip2004999/Registration-Login-Portal-in-Java/blob/b88987578c457461bb35d2da4006c6740c249dcc/images/Screenshot%20(5).png)

### Login Page
![Welcome Back - Login](https://github.com/subhadip2004999/Registration-Login-Portal-in-Java/blob/b88987578c457461bb35d2da4006c6740c249dcc/images/Screenshot%20(6).png)

### Registration Page
![Create an Account](https://github.com/subhadip2004999/Registration-Login-Portal-in-Java/blob/b88987578c457461bb35d2da4006c6740c249dcc/images/Screenshot%20(7).png)

### Profile Dashboard
![Profile Overview](https://github.com/subhadip2004999/Registration-Login-Portal-in-Java/blob/b88987578c457461bb35d2da4006c6740c249dcc/images/Screenshot%20(8).png)

## Quick overview

- Primary languages: Java (~81.5%), HTML (~18.5%)
- Features: user registration, login with session handling, account deletion, basic form validation, responsive UI

## Requirements

Before you build or run this project, make sure you have the following installed and available:

- Java Development Kit (JDK) 8 or newer
- A servlet container (Apache Tomcat 9+, Jetty, or similar)
- Supabase account (or any PostgreSQL-compatible database)
- PostgreSQL JDBC driver (add to `WEB-INF/lib/` or configure via your build tool)
- (Optional) IDE: Eclipse, IntelliJ IDEA, or similar
- (Optional) Git for cloning the repository

Notes:
- For production deployments, set database credentials as environment variables rather than hard-coding them.
- If deploying to a platform like Render/Heroku, ensure the platform variables are configured in the service dashboard.

## Project structure

A short, organized view of the repository layout and where things live:

- src/ — Java servlet source code (package: `myPackage`)
  - contains servlets that handle registration, login, profile, and deletion logic
- Web pages (HTML / JSP) — front-end views shown to users
  - welcome, register, login, profile, etc.
- WEB-INF/ — web application configuration
  - web.xml (servlet mappings) and `lib/` for JDBC drivers
- images/ — application screenshots and UI preview
- .classpath, .project, .settings — Eclipse project files (IDE-specific)

Suggested tree (example):

```
Registration-Login-Portal-in-Java/
├─ src/                    # Java servlet source files
├─ WebContent/             # HTML / JSP / CSS / JS assets
│  ├─ index.html
│  ├─ register.html
│  └─ login.html
├─ WEB-INF/
│  ├─ web.xml
│  └─ lib/                 # add PostgreSQL JDBC jar here
├─ images/
└─ README.md
```

## Database

This application uses Supabase (PostgreSQL) as the database. The main table used by the app is `register` with the following structure:

```sql
CREATE TABLE register (
  id SERIAL PRIMARY KEY,
  Name VARCHAR(100),
  Email VARCHAR(150) UNIQUE,
  Password VARCHAR(255),
  Gender VARCHAR(10),
  Mobile VARCHAR(20),
  City VARCHAR(100),
  created_at TIMESTAMP DEFAULT NOW()
);
```

Configuration details (set these according to your Supabase or PostgreSQL instance):

- Host: Your Supabase PostgreSQL host
- Database: Your Supabase project database name
- Username: Your Supabase database user
- Password: Your Supabase database password

For production use, store credentials in environment variables or a secure configuration store and use a connection pool (HikariCP, Apache DBCP) for better performance.

## Build & Run

1. Clone the repository:

   ```bash
   git clone https://github.com/subhadip2004999/Registration-Login-Portal-in-Java.git
   cd Registration-Login-Portal-in-Java
   ```

2. Import the project into your IDE (Eclipse: File → Import → Existing Projects into Workspace) or build with your preferred build tool.

3. Add the PostgreSQL JDBC driver to your project (place the jar in `WEB-INF/lib/` or declare it in your build tool).

4. Configure your database credentials in the application (update connection parameters in the servlet files or configuration files) or provide them as environment variables in your servlet container.

5. Deploy the project to a servlet container (Tomcat/Jetty) as a WAR or run from your IDE's server configuration.

6. Open the application in a browser and use the HTML/JSP pages to register and login.

7. For cloud deployment (e.g., Render), set the environment variables for DB credentials in the platform dashboard and deploy as a web service.

## Troubleshooting

If you run into issues, try these common fixes:

- Database connection errors (e.g., "Connection refused", "FATAL: password authentication failed")
  - Verify host, port, database name, username, and password.
  - Ensure the PostgreSQL / Supabase instance allows external connections from your host or platform.
  - Confirm the PostgreSQL JDBC driver is present in `WEB-INF/lib/`.

- Driver ClassNotFoundException
  - Add the correct PostgreSQL JDBC driver jar to the webapp's classpath (WEB-INF/lib).

- 404 / servlet mapping errors
  - Confirm `web.xml` contains correct servlet and URL mapping entries, and that files are deployed to the expected paths.

- Session not persisting
  - Make sure cookies are enabled in the browser and the servlet container is correctly configured to manage sessions.

- Password not matching / hashing issues
  - If you switch to hashed passwords, ensure your login flow verifies using the same hashing algorithm (e.g., BCrypt).

- Deployment failures on Render/Heroku
  - Check build logs and set required environment variables (DB credentials). Ensure the buildpack or container supports a servlet container.

If the error persists, capture logs from Tomcat/Render and open an issue including: steps to reproduce, Java/Tomcat versions, relevant log excerpts, and any stack traces.

## Security notes & improvements

- Passwords should be stored using a strong hashing algorithm (bcrypt, Argon2) rather than plain text.
- Sanitize and validate all user input to prevent SQL injection and XSS attacks.
- Use HTTPS in production and configure secure cookies.
- Consider adding:
  - Email verification
  - Password reset functionality
  - Two-factor authentication (2FA)
  - CSRF protection

## Troubleshooting checklist (quick)

- Is the DB reachable and credentials correct?
- Is the JDBC driver present in WEB-INF/lib?
- Are servlet mappings correct in web.xml?
- Are environment variables set for the deployment platform?
- Are logs (Tomcat/Render) showing a clear error? Copy them when filing an issue.

## Contact & support

If you need help or want to report a bug:

- Email: businesssubhadip4@gmail.com
- Open an issue in this repository: https://github.com/subhadip2004999/Registration-Login-Portal-in-Java/issues

When opening an issue, please include:
- Steps to reproduce
- Java and servlet container versions (e.g., Java 11, Tomcat 9)
- Relevant log output or stack traces
- Any configuration or environment details

For commercial support or integration help, reach out to the email above.

## Contributing

Contributions are welcome. Please open issues for bugs or feature requests and submit pull requests for proposed changes. Add unit and integration tests (JUnit, Mockito) under a `test/` directory where appropriate.

## License

No license file is included in this repository. If you want others to use or contribute to this project, consider adding an open source license (for example: MIT, Apache-2.0).

---

**Developer:** Subhadip Biswas  
**Technologies:** Java • JSP • JDBC • PostgreSQL (Supabase) • HTML • CSS
