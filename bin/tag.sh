#!/bin/bash

# Copyright (C) 2019 SCARV project <info@scarv.org>
#
# Use of this source code is restricted per the MIT license, a copy of which
# can be found at https://opensource.org/licenses/MIT (or should be included
# as LICENSE.txt within the associated archive or repository).

if [ -z ${REPO_HOME} ] ; then
  echo "REPO_HOME environment variable undefined: aborting" ; exit
fi

while [[ ${#} -gt 0 ]] ; do
  case ${1} in
    -v|--version)
      git -C ${REPO_HOME} tag --force "v${REPO_VERSION}"
      git push origin --force --tags
      shift
      ;;
    -s|--system)
      git -C ${REPO_HOME} tag --force "sca3s"
      git push origin --force --tags
      shift
      ;;
  esac
done
