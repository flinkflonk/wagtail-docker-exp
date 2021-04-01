FROM python:3.9.2

RUN mkdir -p /app
WORKDIR /app

COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

ENV PYTHONUNBUFFERED 1
ENV LANG en_US.UTF-8
ENV PYTHONIOENCODING utf_8

# adjust APP to your app name, my test server happens to be named www4.
# PORT is the (local) port you run your server on, which is backed
# by unicorn and fronted by a reverse proxy, either through apache's
# mod_proxy or nginx. I don't recommend exposing gunicorn directly
# to the interwebs.
# DEPLOYMENT is what kind of server this is, it's really just used
# to choose the correct wagtail (and by extension djago) settings.
ENV APPNAME www4
ENV PORT 8392
ENV DEPLOYMENT production
