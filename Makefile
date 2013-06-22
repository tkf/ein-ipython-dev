IPY_VERSION = dev
EIN_MAKE = ${MAKE} --directory ein IPY_VERSION=${IPY_VERSION}
EIN_ENV = ein/env/ipy.${IPY_VERSION}

pull-and-test:
	${MAKE} pull
	${MAKE} upgrade-ipython
	${MAKE} test

test:
	${EIN_MAKE} travis-ci-testein

upgrade-ipython:
	ein/tools/makeenv.sh ${EIN_ENV} base-requirements.txt
	${EIN_ENV}/bin/pip install --quiet --upgrade ./ipython/

pull: pull-ein pull-ipython

pull-%:
	cd $* && git pull

update: pull
	git add ein ipython
	git commit -m "Update submodule(s)"
