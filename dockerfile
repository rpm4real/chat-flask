FROM ubuntu:16.04

RUN apt-get update -y && \
    apt-get install -y python3-pip python-dev
# need to make sure it's python 3 that's installed. 

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip3 install -r requirements.txt

COPY . /app

ENTRYPOINT [ "python3" ]

CMD [ "app.py" ]