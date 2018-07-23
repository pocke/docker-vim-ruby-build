build:
	docker build -t vim-ruby-build:dev .

run:
	docker run --rm -it vim-ruby-build:dev
