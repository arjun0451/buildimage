#FROM   registry.access.redhat.com/ubi8/ubi:8.0
FROM quay.io/redhattraining/httpd-parent

# command line options to pass to the JVM

RUN yum -y install httpd && mkdir -p /var/www/html/ && echo "Hello container!" > /var/www/html/index.html && rm -rf /run/httpd && mkdir -p /run/httpd &&  "Hello container" > /var/www/html/index.html

#RUN rm -rf /run/httpd
#RUN mkdir /run/httpd

ENV DOCROOT=/var/www/html

# Install the Java runtime, create a user for running the app, and set permissions
#RUN   yum install -y --disableplugin=subscription-manager java-1.8.0-openjdk-headless 
#RUN   yum clean all --disableplugin=subscription-manager -y && \

LABEL version="1.0" description="this is Containerfile" maintainer="Red Hat Training <training@redhat.com>"

#ONBUILD COPY src/ /var/www/html

EXPOSE 80

CMD /usr/sbin/httpd -DFOREGROUND
