# Use OpenJDK 17
FROM openjdk:17-oracle

# Add the JAR file to the container
ADD target/navitas-spring-boot-2.jar navitas-spring-boot-2.jar

# Expose port 80
EXPOSE 80

# Run Maven clean install
RUN mvn clean install

# Set the entrypoint to run the JAR file
ENTRYPOINT ["java", "-jar", "navitas-spring-boot-2.jar"]

# Allow Jenkins user to run sudo commands
RUN useradd -m -s /bin/bash jenkins && \
    echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Create .bashrc for Jenkins user and add alias
RUN su - jenkins -c "touch /home/jenkins/.bashrc && echo \"alias docker='sudo docker'\" >> /home/jenkins/.bashrc"
