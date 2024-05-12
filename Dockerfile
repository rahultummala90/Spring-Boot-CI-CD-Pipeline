# Use OpenJDK 17 on Alpine
FROM adoptopenjdk/openjdk17:alpine

# Install Maven
RUN apk update && \
    apk add --no-cache maven

# Add the JAR file to the container
ADD target/navitas-spring-boot-2.jar navitas-spring-boot-2.jar

# Expose port 80
EXPOSE 80

# Set the entrypoint to run the JAR file
ENTRYPOINT ["java", "-jar", "navitas-spring-boot-2.jar"]

# Allow Jenkins user to run sudo commands
RUN adduser -D -u 1000 jenkins && \
    echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Create Jenkins user's home directory and .bashrc file
RUN mkdir -p /home/jenkins && \
    touch /home/jenkins/.bashrc && \
    chown -R jenkins:jenkins /home/jenkins

# Add alias to .bashrc for Jenkins user
RUN echo "alias docker='sudo docker '" >> /home/jenkins/.bashrc
