FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update 
RUN apt-get install -y --no-install-recommends \
    ca-certificates \
    libboost-program-options1.83.0 \
    libtbb12 \
    libpcre3 \
    libmpfr6 \
    libocct-data-exchange-7.6t64

COPY IfcConvert /usr/local/bin/IfcConvert
RUN chmod 0755 /usr/local/bin/IfcConvert \
    && ldd /usr/local/bin/IfcConvert | grep -i "not found" && exit 1 || true

WORKDIR /work

ENTRYPOINT ["/usr/local/bin/IfcConvert"]
CMD ["--help"]