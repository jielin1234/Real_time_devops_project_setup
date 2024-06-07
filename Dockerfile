FROM centos:latest

LABEL MAINTAINER="jellylow1234@gmail.com"

# Copy your repository configuration file to the image
COPY CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo

# Update the package cache and install required packages
RUN yum update -y && \
    yum install -y --disablerepo=appstream --disablerepo=baseos httpd zip unzip && \
    yum clean all

RUN ping -c 4 google.com

#RUN yum install -y --disablerepo=appstream --disablerepo=baseos httpd zip unzip
#RUN yum install -y httpd zip unzip

#download and add the zip file
#ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/

#copy the downloaded zip file into the Docker image
COPY photogenic.zip /var/www/html/

##set the working directory
#WORKDIR /var/www/html/

#unzip the downloaded file
RUN unzip /var/www/html/photogenic.zip -d /var/www/html/

#Move the contents of the photogenic directory to the current directory
#RUN cp -rvf photogenic/* .

#Clean up by removing the unnecessary directories and zip file
RUN rm -rf /var/www/html/photogenic.zip

#Set the command to start Apache in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

EXPOSE 80 22
