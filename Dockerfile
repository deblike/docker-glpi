#Based on Debian
FROM debian:stretch

MAINTAINER deblike@gmail.com

#Interactive mode disabled 
ENV DEBIAN_FRONTEND noninteractive

#Install Apache & php7.0 
RUN apt update \
&& apt -y install \
apache2 \
php7.0 \
php7.0-mysql \
php7.0-ldap \
php7.0-xmlrpc \
php7.0-imap \
curl \
php7.0-curl \
php7.0-gd \
php7.0-mbstring \
php7.0-xml \
php-apcu-bc \
wget

#Copy and execute GLPI install scrip
COPY glpi-start.sh /opt/
RUN chmod +x /opt/glpi-start.sh
ENTRYPOINT ["/opt/glpi-start.sh"]

#Expose port
EXPOSE 80 443
