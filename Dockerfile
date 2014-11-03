# Note:
#   I've tried 14.04, but couldn't find package: linux-libc-dev in correct version.
#   Need to investigate why
#
FROM ubuntu:13.10
MAINTAINER Michal Wrobel

RUN apt-get update
RUN apt-get --assume-yes --fix-missing install build-essential
RUN apt-get --assume-yes --fix-missing install python-dev 
RUN apt-get --assume-yes install python-pip
RUN apt-get --assume-yes install python-lxml
RUN apt-get --assume-yes install libcairo2
RUN apt-get --assume-yes install libpango1.0-0
RUN apt-get --assume-yes install libgdk-pixbuf2.0-0
RUN apt-get --assume-yes install libffi-dev
RUN apt-get --assume-yes install shared-mime-info

RUN pip install WeasyPrint
RUN pip install flask
RUN pip install tornado

COPY ./fonts/* /usr/share/fonts/
RUN fc-cache -f

ADD ./app /src

EXPOSE 5000

CMD ["python", "/src/flask_app.py"]

# alternative to test which one performs better
#CMD ["python", "/src/tornado_app.py"]
