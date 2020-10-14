GOPKG ?=	moul.io/test-github-actions
DOCKER_IMAGE ?=	moul/test-github-actions
GOBINS ?=	.
NPM_PACKAGES ?=	.

include rules.mk

generate: install
	GO111MODULE=off go get github.com/campoy/embedmd
	mkdir -p .tmp
	echo 'foo@bar:~$$ test-github-actions hello world' > .tmp/usage.txt
	test-github-actions hello world 2>&1 >> .tmp/usage.txt
	embedmd -w README.md
	rm -rf .tmp
.PHONY: generate

lint:
	cd tool/lint; make
.PHONY: lint
