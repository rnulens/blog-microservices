FROM openjdk:8u111-jre-alpine
#MAINTAINER Magnus Larsson <magnus.larsson.ml@gmail.com>

EXPOSE 8080

ADD ./build/libs/*.jar app.jar
#ADD src/main/resources/truststore.jks truststore.jks

# Regarding settings of java.security.egd, see http://wiki.apache.org/tomcat/HowTo/FasterStartUp#Entropy_Source
ENTRYPOINT ["java","-Dspring.profiles.active=docker","-jar","/app.jar"]
