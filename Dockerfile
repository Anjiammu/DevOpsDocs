FROM centos
RUN yum update -y
RUN yum install wget -y
RUN yum install sudo -y
RUN yum install java -y
RUN yum install wget -y
RUN yum install git -y
RUN wget http://www-us.apache.org/dist/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz
RUN tar xvf apache-maven-3.5.4-bin.tar.gz
RUN mv apache-maven-3.5.4 /opt
RUN export M2_HOME=/opt/apache-maven-3.5.4
RUN export M2=$M2_HOME/bin
RUN export PATH=$M2:$PATH
RUN sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
RUN sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
RUN sudo yum update -y
RUN sudo yum install jenkins -y
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum -y install ansible
RUN sudo yum install ftp://bo.mirror.garr.it/1/slc/centos/7.1.1503/extras/x86_64/Packages/container-selinux-2.9-4.el7.noarch.rpm -y
RUN sudo yum update -y
RUN touch /etc/yum.repos.d/nginx.repo
WORKDIR /usr/
RUN touch /etc/yum.repos.d/docker.repo
COPY  ./docker.repo  /etc/yum.repos.d/docker.repo
RUN sudo yum install docker-engine -y
RUN sudo systemctl enable docker.service
RUN sudo yum update -y
RUN sudo yum install nginx -y 
RUN sudo systemctl enable nginx
