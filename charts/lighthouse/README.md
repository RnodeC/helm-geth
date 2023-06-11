# Lighthouse Helm Chart
```bash
helm repo add https://rnodec.github.io/helm-charts
helm upgrade --install lighthouse rnodec/lighthouse --namespace lighthouse --create-namespace
```

By default, this chart deploys a lighthouse beacon node.  To enable the validator client as well, set `lighthouse.validator.enabled=true`.

The beacon and validator clients will run as two separate containers in the same pod, sharing a common pvc.

# Example
(this example assumes you already have a geth client running in this cluster deployed via https://github.com/rnodec/helm-charts/geth)
```bash
helm upgrade --install lighthouse rnodec/lighthouse \
  --namespace lighthouse \
  -f lighthouse-values.yaml
```
Where `lighthouse-values.yaml` is:
```bash
---
lighthouse:
  network: mainnet
  metrics:
    enabled: true
  beacon:
    enabled: true
    prunePayloads: false
    checkpointSync:
      enabled: true
      url: https://mainnet.checkpoint.sigp.io
    p2p:
      hostPorts: true
    executionEndpoint:
      host: geth.geth
      port: 8551
      jwt: 796b892e93327d8e81b514d610d7005e119b123d2e81b1c276f2e30f887d226e
    enr:
      host: <external ip>
      port: <external port>
  validator:
    enabled: true
    graffiti: rnodec # use your own graffiti
    suggestedFeeRecipient: 0xdf766A7014F1F5Ff6F5f2e2C77e606528e04a8a6 # use your own address

```