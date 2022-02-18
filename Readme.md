
# Index File
```bash
helm repo index --url https://schmitzis.github.io/helm-charts .
```

# Lint
```bash
helm lint helm-chart-sources/*
```

# Package
```bash
helm package helm-chart-sources/*
```

# Helm Repo Add
```bash
helm repo add schmitzs https://schmitzis.github.io/helm-charts/
```

# Helm Repo Add incremental
```bash
helm repo index --url https://schmitzis.github.io/helm-charts/ --merge index.yaml .
```
