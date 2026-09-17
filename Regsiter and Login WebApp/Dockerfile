# Stage 1: Build Java Servlets and assemble Web App
FROM eclipse-temurin:21-jdk-alpine AS builder
WORKDIR /build

# Copy web assets and source files (handles standard Eclipse 'src' or Maven structures)
COPY src/main/webapp /build/webapp
COPY src/main/java /build/src

# Create WEB-INF directory structure
RUN mkdir -p /build/webapp/WEB-INF/classes /build/webapp/WEB-INF/lib

# Download Servlet API and PostgreSQL JDBC Driver for compilation & runtime
ADD https://repo1.maven.org/maven2/jakarta/servlet/jakarta.servlet-api/6.0.0/jakarta.servlet-api-6.0.0.jar /build/lib/
ADD https://repo1.maven.org/maven2/org/postgresql/postgresql/42.7.3/postgresql-42.7.3.jar /build/webapp/WEB-INF/lib/

# Compile Java source files
RUN javac -cp "/build/lib/*:/build/webapp/WEB-INF/lib/*" -d /build/webapp/WEB-INF/classes $(find /build/src -name "*.java")

# Stage 2: Production Runtime with Tomcat 11
FROM tomcat:11.0-jdk21-openjdk-slim

# Remove default Tomcat webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy compiled app to serve as ROOT context
COPY --from=builder /build/webapp /usr/local/tomcat/webapps/ROOT

# Create startup script to bind Tomcat dynamically to Render's $PORT
RUN echo '#!/bin/sh' > /usr/local/tomcat/bin/render-start.sh && \
    echo 'PORT_TO_USE="${PORT:-8080}"' >> /usr/local/tomcat/bin/render-start.sh && \
    echo 'sed -i "s/port=\"8080\"/port=\"$PORT_TO_USE\"/g" /usr/local/tomcat/conf/server.xml' >> /usr/local/tomcat/bin/render-start.sh && \
    echo 'exec catalina.sh run' >> /usr/local/tomcat/bin/render-start.sh && \
    chmod +x /usr/local/tomcat/bin/render-start.sh

EXPOSE 8080

CMD ["/usr/local/tomcat/bin/render-start.sh"]