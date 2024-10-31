FROM python:3.9-alpine3.13
LABEL maintainer="Mary Shermila"

#For seeing the logs without any delay
ENV PYTHONUNBUFFERED 1 

COPY ./requirements.txt /tmp/requirements.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000

#CREATE user (not advisable to run the app in root) - no pwd and no home folder
RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    rm -rf /tmp && \
    adduser \
        --disabled-password \
        --no-create-home \
        django-user

#Virtal env path
ENV PATH="/py/bin:$PATH" 
USER django-user