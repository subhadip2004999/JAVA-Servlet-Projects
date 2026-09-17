# ==========================================
# STAGE 1: Build & Compile Java Servlet
# ==========================================
FROM eclipse-temurin:21-jdk AS builder

WORKDIR /build

# 1. Download Servlet API and Gson JARs needed for compilation
ADD https://repo1.maven.org/maven2/jakarta/servlet/jakarta.servlet-api/6.1.0/jakarta.servlet-api-6.1.0.jar /build/lib/servlet-api.jar
ADD https://repo1.maven.org/maven2/com/google/code/gson/gson/2.10.1/gson-2.10.1.jar /build/lib/gson.jar

# 2. Copy WEB-INF directory
COPY WEB-INF /build/WEB-INF

# 3. Create classes directory and copy Gson to WEB-INF/lib (so Tomcat has access to it at runtime)
RUN mkdir -p /build/WEB-INF/classes /build/WEB-INF/lib && \
    cp /build/lib/gson.jar /build/WEB-INF/lib/

# 4. Compile Java files using BOTH servlet-api.jar and gson.jar on the classpath
RUN javac -cp "/build/lib/servlet-api.jar:/build/lib/gson.jar" -d /build/WEB-INF/classes $(find /build/WEB-INF -name "*.java")

# ==========================================
# STAGE 2: Deployment
# ==========================================
FROM tomcat:11.0-jdk21

RUN rm -rf /usr/local/tomcat/webapps/ROOT/*

# Copy static web assets
COPY home.html /usr/local/tomcat/webapps/ROOT/
COPY weather.jsp /usr/local/tomcat/webapps/ROOT/
COPY 566396.jpg /usr/local/tomcat/webapps/ROOT/

# Copy full WEB-INF directory (includes compiled classes and gson.jar in lib/)
COPY --from=builder /build/WEB-INF /usr/local/tomcat/webapps/ROOT/WEB-INF/

EXPOSE 8080

CMD ["catalina.sh", "run"]