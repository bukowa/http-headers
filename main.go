package main

import (
    "fmt"
    "log"
    "net/http"
    "sort"
)

func headers(w http.ResponseWriter, req *http.Request) {
    log.Printf("%v %v %v %v", req.RemoteAddr, req.URL, req.Host, req.Header)
    sortedKeys := make([]string, 0, len(req.Header))

    for name, _ := range req.Header {
        sortedKeys = append(sortedKeys, name)
    }
    sort.Strings(sortedKeys)
    for _, v := range sortedKeys {
        fmt.Fprintf(w, "%v: %v\n", v, req.Header[v])
    }
}


func main() {
    http.HandleFunc("/", headers)
    http.ListenAndServe(":8090", nil)
}