package main

import (
    "fmt"
    "log"
    "net/http"
    "sort"
    "flag"
    "strings"
)

func headers(w http.ResponseWriter, req *http.Request) {
    log.Println("Hello! There's a request incoming!")
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

    var host = flag.String("host", "", "host to run on")
    var port = flag.String("port", "8080", "port to run on")

    flag.Parse()

    var address = strings.Join([]string{*host, *port}, ":")

    log.Printf("Starting server at %s", address)
    http.ListenAndServe(address, nil)
}
