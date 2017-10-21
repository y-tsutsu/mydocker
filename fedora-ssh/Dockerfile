FROM fedora

LABEL MAINTAINER tsustu <tsutsu0928@gmail.com>

EXPOSE 22 80

RUN yum -y update && yum -y install openssh-server passwd && yum clean all

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/sbin/sshd", "-D"]
