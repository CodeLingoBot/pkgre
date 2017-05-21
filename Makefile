########################################################################################

# This Makefile generated by GoMakeGen 0.6.0 using next command:
# gomakegen --metalinter .

########################################################################################

.PHONY = fmt all clean deps metalinter

########################################################################################

all: morpher-librato morpher-server

morpher-librato:
	go build morpher-librato.go

morpher-server:
	go build morpher-server.go

deps:
	git config --global http.https://pkg.re.followRedirects true
	go get -d -v github.com/valyala/fasthttp
	go get -d -v pkg.re/essentialkaos/ek.v9
	go get -d -v pkg.re/essentialkaos/librato.v7

fmt:
	find . -name "*.go" -exec gofmt -s -w {} \;

metalinter:
	test -s $(GOPATH)/bin/gometalinter || (go get -u github.com/alecthomas/gometalinter ; $(GOPATH)/bin/gometalinter --install)
	$(GOPATH)/bin/gometalinter --deadline 30s

clean:
	rm -f morpher-librato
	rm -f morpher-server

########################################################################################
