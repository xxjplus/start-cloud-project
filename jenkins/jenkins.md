# Install Jenkins on Ubuntu 22.04

## Wiki
https://www.jenkins.io/doc/book/installing/linux/
https://github.com/lework/jenkins-update-center/

## Steps
```shell
apt update -y && apt install -y fontconfig openjdk-17-jdk
wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" https://pkg.jenkins.io/debian-stable binary/ | tee /etc/apt/sources.list.d/jenkins.list > /dev/null
apt update -y && apt install -y jenkins
systemctl enable jenkins
systemctl start jenkins
systemctl status jenkins
cat /var/lib/jenkins/secrets/initialAdminPassword
```

## About the VPS
- 4c4g tencent cloud server
- firewall: tcp 8080 open
- jenkins.xjplus.xyz (godaddy) > 150.158.53.13 (tencent cloud)

## Jenkins Plugins
- Credentials Binding
- Timestamper
- Workspace Cleanup
- Docker
- Pipeline
- Pipeline Graph View
- Pipeline Stage View
- Git
- Git Parameter
- GitHub

### Solutions to the Download Issue
- Visit http://{Jenkins-IP}:8080/manage/pluginManager/advanced to change the update site URL
  - Manage Jenkins > Plugins > Advanced settings > Update Site URL > https://cdn.jsdelivr.net/gh/lework/jenkins-update-center/updates/tsinghua/update-center.json
  - systemctl restart jenkins
- Or, select 'None' to bypass the installation, run
```shell
sed -i 's/https:\/\/www.google.com\//https:\/\/status.amazonaws.cn\/rss\/account.rss/g' /var/lib/jenkins/updates/default.json
sed -i 's/https:\/\/updates.jenkins.io\/download/https:\/\/mirrors.tuna.tsinghua.edu.cn\/jenkins/g' /var/lib/jenkins/updates/default.json
```

# Install on YUM
```shell
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
yum upgrade
yum install -y java-21-openjdk.x86_64 jenkins git
systemctl enable jenkins
systemctl restart jenkins
systemctl status jenkins
cat /var/lib/jenkins/secrets/initialAdminPassword
Update Site URL > https://raw.githubusercontent.com/lework/jenkins-update-center/master/updates/tsinghua/update-center.json
```

## NodeJS
```shell
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
source .bashrc
nvm install 20
node --version
npm --version
```

## Jenkins Plugin Cli
```shell
https://github.com/jenkinsci/plugin-installation-manager-tool/releases/download/2.13.2/jenkins-plugin-manager-2.13.2.jar
jenkins-plugin-cli --plugins scm-api:704.v3ce5c542825a_
```
