# FROM lolhens/baseimage-openjre
FROM openjdk:17-oracle
ADD target/navitas-spring-boot-2.jar navitas-spring-boot-2.jar
EXPOSE 80
ENTRYPOINT ["mvn", "clean", "install"]
ENTRYPOINT ["java", "-jar", "navitas-spring-boot-2.jar"]