FROM nginx:latest
RUN apt-get update -y && \
	apt-get install -y vim
# cert
RUN mkdir /etc/nginx/ssl && \
 openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=localhost"
# page
COPY html/index.html /var/www/html/index.html
# config
COPY sites-available/default.conf /etc/nginx/conf.d/default.conf
