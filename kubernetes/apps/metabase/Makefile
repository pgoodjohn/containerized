.PHONY: install

install:
	helm install --name test -f metabase-config.yaml stable/metabase

remove:
	helm delete test
	helm del --purge test