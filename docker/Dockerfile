# base centos
FROM centos:7

# maintainer
MAINTAINER Peter Xu <peter@uskee.org>

# environments
ENV ROOT_PATH="/opt/janus"
ENV LD_LIBRARY_PATH="/opt/janus/bin"

RUN yum install -y libxml2 libuuid libsoup opus libmicrohttpd libcurl libogg openssl
RUN yum install -y libconfig glib2 jansson gupnp pcre libffi zlib
RUN yum install -y net-tools
RUN yum install -y lua lua-json
RUN yum clean all

# extra packages
ADD rpm/ /tmp/rpm/
RUN ls /tmp/rpm/*.rpm && rpm -i /tmp/rpm/*.rpm
RUN rm -rf /tmp/rpm

ADD janus/ /opt/janus/
ADD conf/ /opt/janus/conf/

# user janus
#RUN /usr/sbin/groupadd -r janus && /usr/sbin/useradd -r -g janus janus
#RUN chown -R janus:janus /opt/janus
#USER janus

# admin http: 7088, general http: 8088, general ws: 8188, 
# streaming audio: 5002, streaming video: 5004
EXPOSE 7088 8088 8188 5002 5004

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/opt/janus/bin/janus"]
