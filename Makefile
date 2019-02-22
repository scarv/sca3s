# Copyright (C) 2018 SCARV project <info@scarv.org>
#
# Use of this source code is restricted per the MIT license, a copy of which 
# can be found at https://opensource.org/licenses/MIT (or should be included 
# as LICENSE.txt within the associated archive or repository).

ifndef REPO_HOME
  $(error "execute 'source ./bin/conf.sh' to configure environment")
endif

.PHONY: doc

doc       :
	@${MAKE} -C ${REPO_HOME}/doc all

doc-clean : 
	@${MAKE} -C ${REPO_HOME}/doc clean

all      : doc

clean    : doc-clean

spotless :
	@rm -rf ${REPO_HOME}/build/*
