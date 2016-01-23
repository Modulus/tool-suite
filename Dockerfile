FROM ubuntu:15.10


#ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -y install nginx  sed python-pip python-dev uwsgi-plugin-python supervisor

RUN mkdir -p /var/log/nginx/app
RUN mkdir -p /var/log/uwsgi/app/


RUN rm /etc/nginx/sites-enabled/default
COPY nginx-app.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/nginx-app.conf /etc/nginx/sites-enabled/nginx-app.conf
COPY uwsgi.ini /var/www/app/
RUN echo "daemon off;" >> /etc/nginx/nginx.conf


RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY dist /var/www/app/static
COPY core /var/www/app

RUN pip install -r /var/www/app/requirements.txt

EXPOSE 5050

CMD ["/usr/bin/supervisord"]
