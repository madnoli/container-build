FROM quay.io/redhattraining/httpd-parent

RUN mkdir -p /var/www/html/ && echo “Hello container!” > /var/www/html/index.html &&  rm -rf /run/httpd  && mkdir /run/httpd

LABEL io.k8s.description="A basic Apache HTTP Server child image, uses ONBUILD" \
  io.k8s.display-name="Apache HTTP Server"  \
  io.openshift.expose-services="8080:http" \  
  io.openshift.tags="apache, httpd"


ONBUILD COPY src/ /var/www/html
