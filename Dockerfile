#Based on Debian
FROM debian:stretch

MAINTAINER deblike@gmail.com

#Interactive mode disabled 
ENV DEBIAN_FRONTEND noninteractive

#Install Apache & php7 
RUN apt update \
&& apt -y install \
apache2 \
php7 \
php7-mysql \
php7-ldap \
php7-xmlrpc \
php7-imap \
curl \
php7-curl \
php7-gd \
php7-mbstring \
php7-xml \
php7-apcu-bc \
wget

#Copy and execute GLPI install scrip
COPY glpi-start.sh /opt/
RUN chmod +x /opt/glpi-start.sh
ENTRYPOINT ["/opt/glpi-start.sh"]

#Expose port
EXPOSE 80 443
