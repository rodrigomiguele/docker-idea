FROM rodrigomiguele/oracle-jdk

ENV IDEA_URL 'https://d1opms6zj7jotq.cloudfront.net/idea/ideaIC-15.0.4.tar.gz'

RUN apk add --update curl libxtst libxrender && \
    ln -s /lib/ld-musl-x86_64.so.1 /usr/lib/libc.musl-x86_64.so.1 && \
    cd /opt && \
    curl -O $IDEA_URL && \
    tar -xzf idea*.tar.gz && \
    rm -f idea*.tar.gz && \
    mv idea* idea && \
    apk del --purge curl

RUN addgroup developer && adduser developer -G developer -h /home/developer -D
USER developer
WORKDIR /home/developer/

ENTRYPOINT ["/opt/idea/bin/idea.sh"]
