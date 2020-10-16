FROM ubuntu:19.10

# If get ImportError: xxxxxxx.xxx during building, can search for the package to install here:
# https://packages.debian.org/search?mode=filename&suite=buster&section=all&arch=i386&searchon=contents&keywords=xxxxxxx
RUN apt-get update \
    && apt-get install -y wget python3 \
    libc6 libglib2.0-0 libglapi-mesa libxext6 libxdamage1 libxfixes3 libxcb-glx0 libxcb-dri2-0 libxcb-dri3-0 libxcb-present0 libxcb-sync1 libxshmfence1 libxxf86vm1 \
    && wget https://www.dropbox.com/download?dl=packages/dropbox.py -O /usr/local/bin/dropbox-cli \
    && chmod +x /usr/local/bin/dropbox-cli

ADD bin/init.sh /init
RUN chmod +x /init

ADD bin/start.sh /start.sh
RUN chmod +x /start.sh

ADD bin/dropbox-status.sh /usr/local/bin/dropbox-status
RUN chmod +x /usr/local/bin/dropbox-status

WORKDIR /dbox

EXPOSE 17500

ENTRYPOINT ["/init"]

VOLUME ["/dbox/Dropbox", "/dbox/.dropbox"]

CMD ["/start.sh"]