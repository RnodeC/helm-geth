# Berachain Helm Chart
This helm chart installs a berachain node into your kubernetes cluster.
```bash
helm repo add https://rnodec.github.io/helm-charts
helm repo update rnodec
helm upgrade --install berachain rnodec/berachain --namespace berachain --create-namespace
```
Review `values.yaml` for full config options.

## Required vars

```
berachain:
  moniker: <unique name for your node>
  
```