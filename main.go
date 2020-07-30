package main

import (
    "fmt"
    "net/http"
    "sort"
)

func headers(w http.ResponseWriter, req *http.Request) {
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