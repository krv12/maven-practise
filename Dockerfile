FROM amazonlinux:latest
RUN dnf install -y java-17.0.13-openjdk
RUN mkdir /opt/tomcat
WORKDIR /opt/tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.97/bin/apache-tomcat-9.0.97.zip .
RUN yum install zip -y && yum install unzip -y &&  unzip apache-tomcat-9.0.97.zip
RUN mv apache-tomcat-9.0.97 apache-tomcat
COPY target/project3.war /opt/tomcat/apache-tomcat/webapps
EXPOSE 8080
RUN chmod +x /opt/tomcat/apache-tomcat/bin/catalina.sh
ENTRYPOINT ["/opt/tomcat/apache-tomcat/bin/catalina.sh","run"]
