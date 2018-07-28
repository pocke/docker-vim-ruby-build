docker-vim-ruby-build
====

What's this?
---

It is a Dockerfile for build Vim with if_ruby feature with each rubies (1.8.7 ~ 2.5.1).


Build docker image
---

```bash
$ git clone https://github.com/pocke/docker-vim-ruby-build
$ cd docker-vim-ruby-build
$ make
```

Build vim and run test
---

```bash
# In your computer

$ cd path/to/vim/with/your/patch
$ docker run --rm -it -v $(pwd):/vim vim-ruby-build:dev

# In docker image

# Build with a ruby
$ build-vim.sh 1.8.7-p374

# Build with all rubies
$ build-vim-all.sh
```

Supported Ruby versions
----

- 1.8.7-p374
- 1.9.3-p551
- 2.0.0-p648
- 2.1.10
- 2.2.10
- 2.3.7
- 2.4.4
- 2.5.1

Known issues
---

Vim's test fails with Ruby 1.8.7.

So you can use the following command to test without Ruby 1.8.7.

```
$ build-vim.sh 1.8.7-p374 && build-vim.sh 1.9.3-p551 && build-vim.sh 2.0.0-p648 && build-vim.sh 2.1.10 && build-vim.sh 2.2.10 && build-vim.sh 2.3.7 && build-vim.sh 2.4.4 && build-vim.sh 2.5.1
```
