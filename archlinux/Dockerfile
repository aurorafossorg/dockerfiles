FROM archlinux/base
MAINTAINER Aurora Free Open Source Software <admin@aurorafoss.org>

RUN echo -e "[multilib]\nInclude = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf

RUN pacman -Syyu base-devel git --noprogressbar --needed --noconfirm