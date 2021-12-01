FROM python:3.7.3-stretch

## Step 1:
# Create a working directory
WORKDIR /app

## Step 2:
# Copy source code to working directory
COPY . main.py /app/
COPY . models.py /app/

## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
#RUN pip install --upgrade pip &&\
#	pip install --trusted-host pypi.python.org -r requirements.txt

RUN pip install --no-cache-dir -r requirements.txt


## Step 4:
# Expose port 8000
EXPOSE 8000

## Step 5:
# Run uvicorn and main.py at container launch
CMD ["uvicorn", "main:app"]
