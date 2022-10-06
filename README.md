[![Docker Repository on Quay](https://quay.io/repository/k8start/http-headers/status "Docker Repository on Quay")](https://quay.io/repository/k8start/http-headers)
```bash
helm repo add http-headers https://bukowa.github.io/http-headers/
helm install headers http-headers/http-headers
```

```bash
Instance name: example
Accept: [*/*]
User-Agent: [curl/7.81.0]
X-Forwarded-For: [10.42.0.1]
X-Forwarded-Host: [http.mydev]
X-Forwarded-Port: [80]
X-Forwarded-Proto: [http]
X-Forwarded-Scheme: [http]
X-Real-Ip: [10.42.0.1]
X-Request-Id: [dde305483c7267981143e7e6645232cb]
X-Scheme: [http]
```
