# helm-geth

Deploy a geth exceution client into a kubernetes cluster.

```bash
helm upgrade --install geth -n geth --create-namespace \
  --set geth.jwt=<jwt token>
```