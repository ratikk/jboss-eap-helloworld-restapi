# dockerfile to build image for JBoss EAP 7.4

#start from eap74-openshift
FROM swagatam04/jboss-eap-7-eap74-openjdk8-openshift-rhel7:latest

# file author / maintainer
MAINTAINER "Swagatam" "skundu012@gmail.com"

# Copy war to deployments folder
COPY target/*.war $JBOSS_HOME/standalone/deployments/

# Copy Custom standalone-openshift.xml under /opt/eap/standalone/configuration
COPY standalone-openshift.xml /opt/eap/standalone/configuration

# User root to modify war owners
USER root

# Modify owners war

RUN chown jboss:jboss $JBOSS_HOME/standalone/deployments/helloworld-html5.war

# Modify owners of standalone-openshift.xml file

RUN chown jboss:root $JBOSS_HOME/standalone/configuration/standalone-openshift.xml

ENV DISABLE_EMBEDDED_JMS_BROKER=true

# Important, use jboss user to run image
USER jboss

EXPOSE 8008
