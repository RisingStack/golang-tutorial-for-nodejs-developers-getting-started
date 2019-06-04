.PHONY: start
start: build
	build/server

.PHONY: build
build: server
server: $(wildcard *.go) $(wildcard **/*.go)
	mkdir -p build
	go build -o build/server	

## GIT HOOKS
GITHOOKS_SOURCE := ./githooks
RELATIVE_PATH := ../..

.PHONY: githooks
githooks: pre-commit pre-push

.PHONY: pre-commit
pre-commit: .git/hooks/pre-commit
.git/hooks/pre-commit: $(GITHOOKS_SOURCE)/pre-commit.sh
	-ln -s $(RELATIVE_PATH)/$< $@

.PHONY: pre-push
pre-push: .git/hooks/pre-push
.git/hooks/pre-push: $(GITHOOKS_SOURCE)/pre-push.sh
	-ln -s $(RELATIVE_PATH)/$< $@

