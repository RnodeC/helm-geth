# Lighthouse Helm Chart
```bash
helm repo add https://rnodec.github.io/helm-charts
```

Deploy a lighthouse beacon node:+
(this example assumes you already have a geth client running in this cluster deployed via https://github.com/rnodec/helm-charts/geth)
```bash
helm upgrade --install lighthouse-validator rnodec/lighthouse \
  --namespace lighthouse \
  --set lighthouse.role=beacon \
  --set lighthouse.beacon.execution_endpoint.jwt=$(kubectl get secrets -n geth geth-jwt -ojsonpath='{.data.jwt}' | base64 -d) \
  --set lighthouse.beacon.execution_endpoint.host=geth.geth \
  --set lighthouse.beacon.execution_endpoint.port=8551
```
And/or validator node:
```bash
helm upgrade --install lighthouse-validator rnodec/lighthouse \
  --namespace lighthouse \
  --set lighthouse.role=validator \
  --set lighthouse.validator.graffiti=mygraffiti \
  --set lighthouse.validator.suggested_fee_recipient=rnodec.eth # <- thats a joke, dont use that
```

## Storage