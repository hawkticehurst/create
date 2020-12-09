package main

import (
	"log"
	"net/http"
	"os"
)

func main() {
	// Get the value of the ADDR environment variable
	addr := os.Getenv("ADDR")

	// If it's blank, default to port 80 for requests
	// addressed to any host
	if len(addr) == 0 {
		addr = ":8000"
	}

	// Create a new mux (router)
	// The mux calls different functions for different
	// resource paths
	mux := http.NewServeMux()

	// Tell it to call the HomepageHandler() function when
	// someone requests the resource path '/'
	mux.HandleFunc("/", HomepageHandler)

	// Tell it to call the HelloHandler() function when
	// someone requests the resource path '/hello'
	mux.HandleFunc("/hello", HelloHandler)

	// Start the web server using the mux as the root
	// handler, and report any errors that occur.
	// The ListenAndServe() function is blocking so
	// this program will continue until killed.
	log.Printf("Server is listening at %s...", addr)
	log.Fatal(http.ListenAndServe(addr, mux))
}

// HomepageHandler handles requests for the '/' resource
func HomepageHandler(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("<!DOCTYPE html><html><head><title>Hello Go Server</title></head><body><h1>Hello Go Server!</h1><a href=\"./hello\">Hello</a></body></html>"))
}

// HelloHandler handles requests for the '/hello' resource
func HelloHandler(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("Hello, World!"))
}
