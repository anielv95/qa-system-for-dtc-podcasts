install:
	make install-uv &&\
		uv python install 3.14 &&\
		uv init &&\
		uv add -r requirements.txt &&\
		uv run gh

install-uv:
	pip install --upgrade pip &&\
		pip install uv

jupyter:
	uv run jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root

install-jupyter:
	make install-uv &&\
		make jupyter
