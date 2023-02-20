FROM python:3.7-slim

WORKDIR /sublist3r
ADD /Sublist3r /sublist3r

RUN pip install -r ./requirements.txt

ENTRYPOINT ["/usr/local/bin/python3.7", "/sublist3r/sublist3r.py"]
