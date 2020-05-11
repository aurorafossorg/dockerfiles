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

RUN apk add --no-cache ldc ldc-runtime git make gcc build-base

WORKDIR /tmp
RUN git clone https://github.com/adamdruppe/adrdox.git adrdox-build && \
	cd adrdox-build && \
		git checkout -- . && \
		sed "s/\tldc2 -oq -O3 -m64/\tldc2 -oq -O3 --march=x86-64/g" -i Makefile && \
		make ldc && \
		mv adrdox.main ../adrdox

FROM alpine:edge AS alpine
LABEL maintainer="Aurora Free Open Source Software <contact at aurorafoss.org>"

COPY --from=0 /tmp/adrdox /usr/bin/

RUN apk add --no-cache ldc-runtime && \
	apk add --no-cache --virtual=.build-dependencies ca-certificates && \
	apk del .build-dependencies \
	rm -rf /tmp/* \
	rm -rf /var/cache/apk/*

CMD ["/usr/bin/adrdox"]

FROM scratch AS slim
LABEL maintainer="Aurora Free Open Source Software <contact at aurorafoss.org>"

COPY --from=alpine /usr/bin/adrdox /usr/bin/
COPY --from=alpine /lib/ld-musl-x86_64.so.1 /lib/
COPY --from=alpine /usr/lib/libgcc_s.so.1 /usr/lib/

CMD ["/usr/bin/adrdox"]
