FROM mycentos:1

RUN curl -o /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo
RUN yum install -y python36 python3-devel gcc pcre-devel zlib-devel make net-tools
WORKDIR /opt/mynginx
COPY . .
RUN tar -zxvf nginx-1.9.4.tar.gz -C /opt && cd /opt/nginx-1.9.4 && ./configure --prefix=/usr/local/nginx  && make && make install && ln -s /usr/local/nginx/sbin/nginx /usr/bin/nginx
RUN chmod +x run.sh
RUN cp nginx.conf /usr/local/nginx/conf/nginx.conf
CMD ["./run.sh"]
EXPOSE 90
