# Weather Web App in Java

A small Java-based web application that displays weather information. The project includes HTML and JSP files and is intended to be deployed on a Java web container such as Apache Tomcat.

**Public demo:** https://weather-image-latest.onrender.com/home.html

---

## 🌦️ Screenshot & Preview

### Application Interface
![Weather Web App UI](https://github.com/subhadip2004999/Weather-Web-App-in-Java/blob/a54d76229f10fe045a847bf536a0eef8be2ad31c/images/Screenshot%20(3).png)

## Weather Interface
![Weather UI](https://github.com/subhadip2004999/Weather-Web-App-in-Java/blob/6ade2a3b52556f4510435fca75333bdd5feb11a3/images/Screenshot%20(4).png)

---

## 📋 Contents

- **home.html** — Landing page / form to enter a city or view weather
- **weather.jsp** — JSP page that displays weather results
- **WEB-INF/** — Web application configuration (web.xml, classes, libraries)
- **META-INF/** — Metadata files
- **566396.jpg** — Screenshot/preview of the application UI

---

## ✨ Features

✅ Simple and intuitive UI to search for weather by location  
✅ Server-side rendering using JSP for dynamic content  
✅ Displays real-time weather information  
✅ Responsive design suitable for various screen sizes  

---

## 🛠️ Requirements

- **Java 8** or later
- **A Java Servlet container** (e.g., Apache Tomcat 8.5+)
- **(Optional)** Internet connection for external weather API integration

---

## 🚀 Run / Deploy

### Option 1 — Deploy on Apache Tomcat (Manual)

1. **Prepare the project:**
   - Clone or download this repository
   - Navigate to the project directory

2. **Deploy to Tomcat:**
   ```bash
   cp -r /path/to/Weather-Web-App-in-Java $TOMCAT_HOME/webapps/weather
   ```
   Or package as WAR:
   ```bash
   jar cvf weather.war *
   cp weather.war $TOMCAT_HOME/webapps/
   ```

3. **Start Tomcat:**
   ```bash
   $TOMCAT_HOME/bin/startup.sh
   ```

4. **Access the application:**
   - Open your browser and visit: `http://localhost:8080/weather/home.html`

### Option 2 — Run from an IDE

#### Eclipse (Dynamic Web Project):
1. File → Import → Existing Projects into Workspace
2. Select this repository folder
3. Right-click project → Properties → Project Facets → Convert to faceted form
4. Add Apache Tomcat as Server Runtime
5. Right-click project → Run As → Run on Server

#### IntelliJ IDEA:
1. File → Open → Select this repository
2. Go to File → Project Structure → Modules → Add → Web Application
3. Configure Tomcat: Run → Edit Configurations → Add new Tomcat Server
4. Deploy the application to Tomcat
5. Click Run ▶️

---

## 📁 Project Structure

```
Weather-Web-App-in-Java/
│
├── home.html                 # Landing page and search form
├── weather.jsp               # Weather display results page
├── 566396.jpg                # UI Screenshot
├── README.md                 # This file
│
├── WEB-INF/
│   ├── web.xml              # Web application deployment descriptor
│   ├── classes/             # Compiled Java classes
│   └── lib/                 # External libraries/JARs
│
└── META-INF/
    └── MANIFEST.MF          # Application metadata
```

---

## 📸 How It Works

1. **User visits home.html** → Displays a form to enter a city name
2. **Form submission** → Sends request to weather.jsp
3. **weather.jsp processes** → Fetches weather data from API
4. **Results displayed** → Shows temperature, conditions, and other details

---

## 🤝 Contributing

Contributions are welcome! Here's how to contribute:

1. **Fork** this repository
2. **Create a new branch** for your feature:
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. **Make your changes** and commit:
   ```bash
   git commit -m "Add your descriptive message"
   ```
4. **Push to your fork** and submit a **Pull Request**

---

## 📝 License

This project is open source and available for personal and educational use.

---

## 🐛 Troubleshooting

| Issue | Solution |
|-------|----------|
| **404 Not Found** | Ensure the app is deployed correctly in Tomcat's webapps folder |
| **JSP not rendering** | Check that Tomcat version supports JSP and that WEB-INF/web.xml is present |
| **Weather data not loading** | Verify internet connection and external API availability |
| **Port already in use** | Change Tomcat port in `conf/server.xml` (default: 8080) |

---

## 📧 Contact & Support

Email: businesssubhadip@gmail.com

For issues, questions, or suggestions:
- Open an **Issue** on GitHub
- Submit a **Pull Request** with improvements

---

**Happy weather checking!** 🌞
