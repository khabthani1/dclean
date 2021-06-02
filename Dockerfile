FROM prestashop/prestashop-git:latest
RUN mkdir -p /var/www/html/amanipresta
# To run files with the same group as your primary user
COPY .     /var/www/html/amanipresta
