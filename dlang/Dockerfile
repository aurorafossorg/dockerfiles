#                                     __
#                                    / _|
#   __ _ _   _ _ __ ___  _ __ __ _  | |_ ___  ___ ___
#  / _` | | | | '__/ _ \| '__/ _` | |  _/ _ \/ __/ __|
# | (_| | |_| | | | (_) | | | (_| | | || (_) \__ \__ \
#  \__,_|\__,_|_|  \___/|_|  \__,_| |_| \___/|___/___/
#
# Copyright (C) 2018-2019 Aurora Free Open Source Software.
# Copyright (C) 2018-2019 Luís Ferreira <luis@aurorafoss.org>
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


FROM aurorafossorg/archlinux
LABEL maintainer="Aurora Free Open Source Software <contact at aurorafoss.org>"

# Install dlang group
RUN pacman -Sy dlang --noprogressbar --noconfirm

# Remove cache and update trusted certs
RUN rm -rf /var/cache/pacman/pkg/* && \
    rm -rf /tmp && \
    trust extract-compat