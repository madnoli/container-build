FROM quay.io/redhattraining/httpd-parent

RUN mkdir -p /var/www/html/ 
RUN echo “Hello container!” > /var/www/html/index.html
RUN rm -rf /run/httpd 
RUN mkdir /run/httpd

LABEL io.k8s.description="A basic Apache HTTP Server child image, uses ONBUILD" 
LABEL io.k8s.display-name="Apache HTTP Server" 
LABEL io.openshift.expose-services="8080:http"  
LABEL io.openshift.tags="apache, httpd"


