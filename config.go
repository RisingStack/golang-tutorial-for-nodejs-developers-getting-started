package main

import (
	"github.com/kelseyhightower/envconfig"
)

type config struct {
	Port int `default:"8000"`
}

func readConfig() config {
	var c config

	err := envconfig.Process("", &c)

	if err != nil {
		panic(err)
	}

	return c
}
