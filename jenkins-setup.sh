# installing jenkins on Ubuntu 22.04 LTS (Droplet Digital Ocean)

You can visit https://pkg.jenkins.io/debian/

# 1. Update the package index on your server:
sudo apt update

# 2. Install the default-jdk package, which provides the Java Development Kit:
sudo apt install fontconfig openjdk-17-jre


# 3. Verify that Java is installed correctly by checking its version:
java -version

# This should output the version of Java that you just installed.

#4. Add the Jenkins repository key to your system:
# wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
 sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
    https://pkg.jenkins.io/debian/jenkins.io-2023.key

# 5. Add the Jenkins repository to your system:
# su÷do sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
    https://pkg.jenkins.io/debian binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null


#6. Update the package index on your server again:
sudo apt-get update

#7. Install Jenkins:
sudo apt-get install jenkins

#8. Start the Jenkins service:
sudo systemctl start jenkins


#9. Enable the Jenkins service to start automatically at boot:
sudo systemctl enable jenkins

#10. Verify that Jenkins is running by checking its status:
sudo systemctl status jenkins

# This should show that Jenkins is active and running.

#11. In Aws server, add new security inbound rule

Type: CustomTCP - Port: 8080 - IP: 0.0.0.0/0

#You should now be able to access the Jenkins web interface by going to
http://your_server_ip:8080 in your web browser.

#To get your administrator password, run this command to get it.
 sudo cat /var/lib/jenkins/secrets/initialAdminPassword


# Install Python
sudo apt install -y python3 python3-pip

# Install Virtualenv
sudo pip3 install virtualenv





