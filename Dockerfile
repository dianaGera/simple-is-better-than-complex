FROM python:3.8.10
ENV PYTHONUNBUFFERED=1

RUN mkdir -p /usr/src/app/
WORKDIR . /usr/src/app/

COPY req.txt /usr/src/app/
RUN pip install --no-cache -r /usr/src/app/req.txt
COPY . /usr/src/app/

EXPOSE 8000
ENV TZ Europe/Moscow

CMD ["python", "manage.py", "runserver", "127.0.0.1:8000"]