FROM ubuntu:15.10

#Before the Docker build, run "grunt build"
#For now just use gunicorn and expose it.

# Install Nginx mm
RUN apt-get update
RUN apt-get install -y python python-pip python-dev
RUN apt-get install -y nginx nodejs

# Define working directory.
WORKDIR /var/www/apps/tool-suite/app
#CMD npm install
#CMD grunt

# Add the built files to the container image
ADD ./dist /var/www/apps/tool-suite/dist

COPY ./*.py /var/www/apps/tool-suite/
COPY core /var/www/apps/tool-suite/core


COPY ./requirements.txt /var/www/apps/tool-suite/

COPY ./tools-list.yml /var/www/apps/tool-suite/



#Install python packages

RUN pip install -r /var/www/apps/tool-suite/requirements.txt


#Add the configuration for uwsgi and nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN echo "error_log /dev/stdout info;" >> /etc/nginx/nginx.conf
#RUN rm /etc/nginx/sites-enabled/default
#RUN rm /etc/nginx/sites-available/default
COPY ./config/nginx-config /etc/nginx/sites-available/


#Remove default sites-enabled from nginx with symbolic links
RUN rm /etc/nginx/sites-enabled/default
RUN rm /etc/nginx/sites-available/default

#Add symbolic links
RUN ln -s /etc/nginx/sites-available/nginx-config /etc/nginx/sites-enabled/vups_nginx






# Build the angular app



# Define working directory.
WORKDIR /var/www/apps/tool-suite/

CMD gunicorn --bind 0.0.0.0:8000 tool-suite:app &

CMD ["nginx"]

EXPOSE 8080
