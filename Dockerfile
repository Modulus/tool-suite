FROM ubuntu:14.04

#Before the Docker build, run "grunt build"

COPY dist /var/www/apps/tools-suite/web

COPY ./tool-suite.py /var/www/apps/tools-suite/

COPY ./requirements.txt /var/www/apps/tools-suite/

COPY ./tools-list.yml /var/www/apps/tools-suite/


# Install Nginx.
RUN apt-get update && apt-get install -y nginx

RUN  apt-get update && apt-get install -y python python-pip python-dev nginx uwsgi uwsgi-plugin-python 
#supervisor

#Install python packages
# Reference
RUN pip install -r /var/www/apps/tools-suite/requirements.txt


#start the uwsgi server for the flask app
#WORKDIR /var/www/apps/tools-suite

#Add the configuration for uwsgi and nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN rm /etc/nginx/sites-enabled/default
ADD ./config/uwsgi-config.ini /etc/uwsgi/apps-available/uwsgi-config.ini
ADD ./config/nginx-config /etc/nginx/sites-available/nginx-config
#ADD ./config/superv.conf /usr/local/supervisord.conf

#Remove default sites-enabled from nginx with symbolic links
#RUN rm /etc/nginx/sites-enabled/default
#RUN rm /etc/nginx/sites-available/default

#Add symbolic links
RUN ln -s /etc/nginx/sites-available/nginx-config /etc/nginx/sites-enabled/vups_nginx
RUN ln -s /etc/uwsgi/apps-available/uwsgi-config.ini /etc/uwsgi/apps-enabled/uwsgi-config.ini



# Define working directory.
WORKDIR /var/www/apps/tools-suite/

#CMD ["supervisord", "-n"]
CMD ["nginx]

# Expose ports.
EXPOSE 8080
