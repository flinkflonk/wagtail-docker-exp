FROM python:3.9.2

# adjust APP to your app name, my test server happens to be named www4.
# WORKERS is the number of gunicorn worers you need. This depends on
# the load and the complexity of your site's code.
# PORT is the (local) port you run your server on, which is backed
# by unicorn and fronted by a reverse proxy, either through apache's
# mod_proxy or nginx. I don't recommend exposing gunicorn directly
# to the interwebs.
# DEPLOYMENT is what kind of server this is, it's really just used
# to choose the correct wagtail (and by extension djago) settings.
ENV APPNAME www4
ENV WORKERS 3
ENV PORT 8392
ENV DEPLOYMENT production

# generic django/python stuff
ENV PYTHONUNBUFFERED 1
ENV LANG en_US.UTF-8
ENV PYTHONIOENCODING utf_8

RUN mkdir -p /app
WORKDIR /app
ADD . /app/

# set timeout up a bit, pip is impatient and pypi is slooooooooow.
RUN pip install --default-timeout=100 --no-cache-dir -r requirements.txt

RUN python manage.py migrate
RUN python manage.py collectstatic

# and now for the main event:
CMD exec gunicorn $APPNAME.wsgi:application --bind 0.0.0.0:$PORT --workers $WORKERS