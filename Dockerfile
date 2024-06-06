FROM centos:latest

LABEL MAINTAINER="jellylow1234@gmail.com"

RUN yum install -y httpd zip unzip

#download and add the zip file
#ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/

#copy the downloaded zip file into the Docker image
COPY photogenic.zip /var/www/html/

#set the working directory
WORKDIR /var/www/html/

#unzip the downloaded file
RUN unzip photogenic.zip

#Move the contents of the photogenic directory to the current directory
RUN cp -rvf photogenic/* .

#Clean up by removing the unnecessary directories and zip file
RUN rm -rf photogenic photogenic.zip

#Set the command to start Apache in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

EXPOSE 80 22
