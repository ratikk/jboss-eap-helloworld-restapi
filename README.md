# jboss-eap-docker maven build
To build the maven jboss-eap package ,in your server you should have maven and jboss EAP 7.4-GA [9990 port] installed and running.
Jboss eap can be running as a service or as a container on the server.

# Build the maven package
mvn clean package wildfly:deploy

# customized standalone-openshift.xml

change and put your own customized file under standalone-openshift.xml.Like for this applicaiton we have changed http port to 8008 [interface="bindall" port="${jboss.http.port:8008}] and expose the appliaiton with 8008 in Dockerfile as well.
![image](https://github.com/SWAGATAM04/jboss-eap-helloworld-restapi/assets/26648859/73426f40-8666-4ab1-b952-3b70c284a2b9)


# Docker build 
docker build -t jboss-helloworld-html .




# Run the docker container 

docker run -itd -p 8008:8008 -p 9990:9990 jboss-helloworld-html:latest

# How to check if jboss is installed within container ?
After Deployment jboss will be on /opt/eap/standalone/tmp/ within container.

# Access the application

http://serverexternalip:8080/helloworld-html5/



