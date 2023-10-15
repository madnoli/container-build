FROM registry.access.redhat.com/ubi8/ubi:8.0

RUN yum install -y  --disableplugin=subscription-manager httpd && \
        yum clean all --disableplugin=subscription-manager -y && \
        echo "Hello from the httpd-parent container!" > /var/www/html/index.html

LABEL io.k8s.description="A basic Apache HTTP Server child image, uses ONBUILD" \
  io.k8s.display-name="Apache HTTP Server"  \
  io.openshift.expose-services="8080:http" \
  io.openshift.tags="apache, httpd"


ONBUILD COPY src/ /var/www/html

EXPOSE 80

RUN rm -rf /run/httpd && mkdir /run/httpd

USER root

CMD /usr/sbin/httpd -DFOREGROUND
