# испытание! ("ispitanye!") - test

испытание is a demo of Go support for Unicode in a wide variety of ways. Go boasts solid support for Unicode strings, but this project tests (испытание!) that Go is compatible with Unicode in other aspects projects:

* strings ✓
* import paths ✓
* package names ✓
* source filenames ✓
* test filenames ✓
* function names ✓
* executable names ✓
* type names ✓
* local go docs ✓
* godoc.org ✗

However, other development tools like git and WLS bash, may feature varying degrees of Unicode support.

# EXAMPLE

```console
$ испытание
Испытание!
```

# BUILDTIME REQUIREMENTS

* [Go](http://golang.org/) 1.11+

## Recommended

* [Mage](https://magefile.org/) (e.g., `go get github.com/magefile/mage`)
* [goimports](https://godoc.org/golang.org/x/tools/cmd/goimports) (e.g. `go get golang.org/x/tools/cmd/goimports`)
* [golint](https://github.com/golang/lint) (e.g. `go get github.com/golang/lint/golint`)
* [errcheck](https://github.com/kisielk/errcheck) (e.g. `go get github.com/kisielk/errcheck`)
* [nakedret](https://github.com/alexkohler/nakedret) (e.g. `go get github.com/alexkohler/nakedret`)
* [shadow](golang.org/x/tools/go/analysis/passes/shadow/cmd/shadow) (e.g. `go get -u golang.org/x/tools/go/analysis/passes/shadow/cmd/shadow`)

# INSTALL FROM REMOTE GIT REPOSITORY

```console
$ go get github.com/mcandre/toys/system/go/uniq/...
```

(Yes, include the ellipsis as well, it's the magic Go syntax for downloading, building, and installing all components of a package, including any libraries and command line tools.)

# INSTALL FROM LOCAL GIT REPOSITORY

```console
$ mkdir -p "$GOPATH/src/github.com/mcandre"
$ git clone https://github.com/mcandre/toys.git "$GOPATH/src/github.com/mcandre/toys"
$ cd "$GOPATH/src/github.com/mcandre/toys/system/go/испытание"
$ git submodule update --init --recursive
$ go install ./...
```

# TEST

```console
$ mage test
```

# LINT

Keep the code tidy:

```console
$ mage lint
```
