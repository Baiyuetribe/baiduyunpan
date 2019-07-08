#本镜像基于最新版alpine+glibc+BaiduPCSweb
FROM alpine:edge

LABEL MAINTAINER="Azure <https://baiyue.one>"

#百度云盘Docker版，适用系统：CentOS 7、Unbutu、Debian、Fedora、Raspberry Pi等linux系统，
#也适用于windos、mac等系统
ENV GLIBC_VERSION=2.29-r0
ENV SOURCE=https://github.com/liuzhuoling2011/baidupcs-web/releases/download/3.6.7/BaiduPCS-Go-3.6.7-linux-amd64.zip
RUN apk update \
	&& apk --no-cache add ca-certificates wget libstdc++ tzdata \
	&& cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& echo 'Asia/Shanghai' >  /etc/timezone \
    && wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.29-r0/glibc-2.29-r0.apk \
    && apk --no-cache add glibc-2.29-r0.apk \ 
    && mkdir -p /BaiduPCS \ 
	&& wget -q ${SOURCE} \
	&& unzip BaiduPCS-Go-3.6.7-linux-amd64.zip && mv /BaiduPCS-Go-3.6.7-linux-amd64/BaiduPCS-Go /BaiduPCS \ 
	&& rm -rf BaiduPCS-Go-3.6.7-linux-amd64 BaiduPCS-Go-3.6.7-linux-amd64.zip \  
    && chmod a+x /BaiduPCS/BaiduPCS-Go \       
	&& apk del wget tzdata \
	&& rm -rf /glibc-${GLIBC_VERSION}.apk 
WORKDIR /root/Downloads
VOLUME ["/root/Downloads"]
EXPOSE 5299 

CMD ["sh", "-c", "/BaiduPCS/BaiduPCS-Go"]
