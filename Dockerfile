# FROM lolhens/baseimage-openjre
FROM openjdk:17-oracle
ADD target/navitas-spring-boot-2.jar navitas-spring-boot-2.jar
EXPOSE 80
ENTRYPOINT ["mvn", "clean", "install"]
ENTRYPOINT ["java", "-jar", "navitas-spring-boot-2.jar"]

## allowing jenkins user to run sudo commands
RUN echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
 ## avoid typing sudo in command line
RUN echo "alias docker='sudo docker '" >> /home/jenkins/.bashrc