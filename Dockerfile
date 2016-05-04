FROM djosborne/mesos-modules-dev:master
MAINTAINER Dan Osborne <daniel@projectcalico.org>

ADD ./eggs /eggs
RUN easy_install pip
RUN pip install --upgrade protobuf
RUN pip install netaddr
RUN easy_install /mesos/build/src/python/dist/mesos.interface-*.egg
RUN easy_install /mesos/build/src/python/dist/mesos.executor-*.egg
RUN easy_install /mesos/build/src/python/dist/mesos.scheduler-*.egg
RUN easy_install /mesos/build/src/python/dist/mesos.native-*.egg
RUN easy_install docopt

ADD framework /framework
ENTRYPOINT ["python", "/framework/calico_framework.py"]
