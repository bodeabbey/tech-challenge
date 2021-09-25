FROM python:3.8-slim-buster
COPY . /app
WORKDIR /app

RUN apt-get update && apt-get install -y wget gnupg2
RUN pip install -r requirements.txt

ENTRYPOINT [ "python" ]

CMD [ "run.py" ]
