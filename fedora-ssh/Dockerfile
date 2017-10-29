FROM fedora

LABEL MAINTAINER tsustu <tsutsu0928@gmail.com>

EXPOSE 22 80

RUN dnf -y update --refresh || true
RUN dnf clean packages
RUN dnf -y update --refresh && dnf -y install openssh-server passwd && dnf clean all

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/sbin/sshd", "-D"]
