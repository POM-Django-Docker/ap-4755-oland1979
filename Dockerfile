FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Копіюємо requirements.txt з коліна репозиторію
COPY requirements.txt /app/

RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Копіюємо весь проєкт (включаючи правильну папку library/) всередину контейнера
COPY . /app/

# Переключаємо робочу директорію контейнера туди, де лежить manage.py
WORKDIR /app/library

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
