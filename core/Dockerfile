FROM python:3.5.1

VOLUME ["/var/www/app/"]
COPY * /var/www/app/

WORKDIR /var/www/app/
RUN pip install --upgrade pip
RUN pip install -r /var/www/app/requirements.txt

CMD gunicorn -b 0.0.0.0:5000 tool-suite:app

EXPOSE 5000
