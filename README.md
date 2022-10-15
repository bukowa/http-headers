```bash
helm repo add bukowa https://bukowa.github.io/charts
helm install headers bukowa/http-headers
```

```bash
Instance name: example
Accept: [text/html,application/xhtml+xml,<cut>]
Accept-Encoding: [gzip, deflate]
Accept-Language: [en-US,en;q=0.5]
Host: [local.proxy]
Upgrade-Insecure-Requests: [1]
User-Agent: [Mozilla/5.0 <cut>]
X-Forwarded-For: [10.42.0.0]
X-Forwarded-Host: [http.mydev]
X-Forwarded-Port: [80]
X-Forwarded-Proto: [http]
X-Forwarded-Scheme: [http]
X-Real-Ip: [10.42.0.0]
X-Request-Id: [fadecae356e5fadf40b9b5b4419402ee]
X-Scheme: [http]
```
