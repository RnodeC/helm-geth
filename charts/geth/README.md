# Geth Helm Chart
```bash
helm repo add https://rnodec.github.io/helm-charts
helm repo update rnodec
helm upgrade --install geth rnodec/geth --namespace geth --create-namespace
```

This helm chart installs a geth execution layer client into your kubernetes cluster.

# Full Example
```bash
helm upgrade --install geth \
  --namespace geth \
  -f values/geth.yaml \
  ~/work/helm-charts/charts/geth
```
Where `geth-values.yaml` is:
```
---
geth:
  jwt: 796b892e93327d8e81b514d610d7005e119b123d2e81b1c276f2e30f887d226e
  p2p:
    hostPorts: true
  metrics:
    enabled: true

```