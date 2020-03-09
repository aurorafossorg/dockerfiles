#                                     __
#                                    / _|
#   __ _ _   _ _ __ ___  _ __ __ _  | |_ ___  ___ ___
#  / _` | | | | '__/ _ \| '__/ _` | |  _/ _ \/ __/ __|
# | (_| | |_| | | | (_) | | | (_| | | || (_) \__ \__ \
#  \__,_|\__,_|_|  \___/|_|  \__,_| |_| \___/|___/___/
#
# Copyright (C) 2018-2020 Aurora Free Open Source Software.
# Copyright (C) 2018-2020 Luís Ferreira <luis@aurorafoss.org>
#
# This file is part of the Aurora Free Open Source Software. This
# organization promote free and open source software that you can
# redistribute and/or modify under the terms of the Boost Software License
# Version 1.0 available in the package root path as 'LICENSE' file. Please
# review the following information to ensure that the license requirements
# meet the opensource guidelines at opensource.org .
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
# SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
# FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
# DEALINGS IN THE SOFTWARE.
#
# NOTE: All products, services or anything associated to trademarks and
# service marks used or referenced on this file are the property of their
# respective companies/owners or its subsidiaries. Other names and brands
# may be claimed as the property of others.
#
# For more info about intellectual property visit: aurorafoss.org or
# directly send an email to: contact (at) aurorafoss.org .


FROM alpine:edge
LABEL maintainer="Aurora Free Open Source Software <contact at aurorafoss.org>"


# Install dlang and base related packages for building
RUN set -eux; \
	apk add --no-cache build-base gcc g++ libstdc++ \
	ldc ldc-runtime gcc-gdc dub \
	git make wget curl bash binutils-gold \
	openssl-dev libevent-dev gnupg xz

# Install glibc
RUN export PKG_ALPINE_GLIBC_VERSION=2.30-r0; \
	wget -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
	wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${PKG_ALPINE_GLIBC_VERSION}/glibc-${PKG_ALPINE_GLIBC_VERSION}.apk && \
	apk add glibc-*.apk && \
	rm glibc-*.apk /etc/apk/keys/sgerrand.rsa.pub

RUN ln -s /usr/bin/ld.gold /usr/local/bin/ld

RUN apk add --no-cache --repository=http://nl.alpinelinux.org/alpine/edge/testing \
	dmd

# Cleanup
RUN rm -rf /tmp/* && \
	rm -rf /var/cache/apk/*
