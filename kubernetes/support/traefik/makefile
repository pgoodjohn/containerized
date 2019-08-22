.PHONY: install
install:
	helm install stable/traefik --name traefik --values traefik-config.yaml

.PHONY: upgrade
upgrade:
	helm upgrade traefik stable/traefik --values traefik-config.yaml

.PHONY: remove
remove:
	helm delete traefik
	helm del --purge traefik
