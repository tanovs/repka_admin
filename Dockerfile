FROM python:3.10

WORKDIR /opt

RUN git clone https://github.com/tanovs/repka_admin.git

WORKDIR /opt/repka_admin

ENV DJANGO_SETTINGS_MODULE 'config.settings'

RUN apt-get update \
    && apt-get install -y netcat-traditional
RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

COPY uwsgi/uwsgi.ini application/uwsgi.ini

EXPOSE 8000

RUN chmod 777 start.sh

CMD ["bash", "start.sh"]