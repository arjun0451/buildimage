FROM   registry.access.redhat.com/ubi8/ubi:8.0

MAINTAINER   Red Hat Training <training@redhat.com>

# command line options to pass to the JVM

RUN mkdir -p /var/www/html/
RUN echo “Hello container!” > /var/www/html/index.html

RUN rm -rf /run/httpd
RUN mkdir /run/httpd

ENV	  DOCROOT=/var/www/html

# Install the Java runtime, create a user for running the app, and set permissions
#RUN   yum install -y --disableplugin=subscription-manager java-1.8.0-openjdk-headless
#RUN   yum clean all --disableplugin=subscription-manager -y && \

LABEL version=”1.0”
LABEL description=”this is Containerfile”

ONBUILD COPY src/ /var/www/html

EXPOSE 8080

CMD [sleep 1000]
