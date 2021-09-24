FROM python:3.8-slim-buster
COPY . /app
WORKDIR /app

RUN apt-get update && apt-get install -y apt-utils wget gnupg gnupg2 curl

# Install mongodb
RUN wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | apt-key add -
RUN echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.2.list
RUN apt-get update
RUN apt-get install -y mongodb-org
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3 get-pip.py
RUN pip install -r requirements.txt

ENTRYPOINT ["python3 run.py"]
#ENTRYPOINT python3 run.py