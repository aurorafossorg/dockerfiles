#!/usr/bin/env bash
#                                     __
#                                    / _|
#   __ _ _   _ _ __ ___  _ __ __ _  | |_ ___  ___ ___
#  / _` | | | | '__/ _ \| '__/ _` | |  _/ _ \/ __/ __|
# | (_| | |_| | | | (_) | | | (_| | | || (_) \__ \__ \
#  \__,_|\__,_|_|  \___/|_|  \__,_| |_| \___/|___/___/
#
# Copyright (C) 2019 Aurora Free Open Source Software.
# Copyright (C) 2019 Luís Ferreira <luis@aurorafoss.org>
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


set -e

trap "git clean -fdX; exit" SIGHUP SIGINT SIGTERM

for docker_file in $(find . -mindepth 2 -maxdepth 2 -type f -iname Dockerfile); do
	docker_folder=$(dirname $docker_file)

	pushd $docker_folder > /dev/null
		docker_name=$(basename $docker_folder)
		docker_tag="aurorafossorg/$docker_name:$(cat .version || printf latest)"

		if [ -f "./bootstrap.sh" ]; then
			./bootstrap.sh
		fi

		docker build . -t "$docker_tag"
		docker push "$docker_tag"

		for docker_subfile in $(find . -mindepth 2 -maxdepth 2 -type f -iname Dockerfile); do
			docker_subfolder=$(dirname $docker_subfile)

			pushd $docker_subfolder > /dev/null
				docker_subname=$(basename $docker_subfolder)
				docker_subtag="aurorafossorg/$docker_name-$docker_subname:$(cat .version || printf latest)"

				if [ -f "./bootstrap.sh" ]; then
					./bootstrap.sh
				fi

				docker build . -t $docker_subtag
				docker push $docker_subtag
			popd > /dev/null
		done
	popd > /dev/null
done

git clean -fdX