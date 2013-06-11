IPY_VERSION = dev
EIN_MAKE = ${MAKE} --directory ein IPY_VERSION=${IPY_VERSION}

pull-and-test:
	${MAKE} pull-ipython
	${MAKE} travis

travis:
	${MAKE} upgrade-ipython
	${MAKE} test

test:
	${EIN_MAKE} travis-ci-testein

upgrade-ipython:
	${EIN_MAKE} env-ipy.${IPY_VERSION}
	ein/env/ipy.dev/bin/pip install --upgrade ./ipython/

pull-ipython:
	cd ipython && git pull
