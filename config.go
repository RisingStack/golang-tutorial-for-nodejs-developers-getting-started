package main

import (
	"fmt"
	"os"
	"strconv"
)

type config struct {
	port int
}

func readConfig() config {
	portString := os.Getenv("PORT")
	if portString == "" {
		portString = "8000"
	}

	port, err := strconv.Atoi(portString)

	if err != nil {
		panic(fmt.Sprintf("Could not parse %s to int", portString))
	}

	return config{
		Port: port,
	}
}
