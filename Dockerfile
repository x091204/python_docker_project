FROM python:3.10-slim   
#for a linux python env

WORKDIR /app  
#setting app as working dir

RUN apt-get update && apt-get install -y \
    gcc \
    default-libmysqlclient-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/* 
##system dependencies for mysqlclient and psycopg2

COPY requirements.txt .   
## copying requirement files for the images

RUN pip install --no-cache-dir -r requirements.txt 
##python dependencies

COPY . . 
## copying the application code

EXPOSE 8000 
## exposing django port

CMD ["python","manage.py","runserver","0.0.0.0:8000"] 
## start the application





