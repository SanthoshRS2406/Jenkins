FROM php:7.2-apache
EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]
