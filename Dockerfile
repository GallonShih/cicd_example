FROM gallonshih/python-base:3.9.18-0.0.1

LABEL maintainer="gallon_shih"
LABEL Description="fastapi example"
USER root

ARG HOME=/service
WORKDIR $HOME
ENV PYTHONPATH=${HOME}:${HOME}/app

COPY app $HOME/app
COPY tests $HOME/tests

ENTRYPOINT ["python3"]

CMD ["app/main.py"]
