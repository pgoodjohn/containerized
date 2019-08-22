.PHONY: install

install:
	helm install --name metabase -f metabase-config.yaml stable/metabase

remove:
	helm delete metabase
	helm del --purge metabase
