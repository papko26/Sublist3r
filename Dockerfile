FROM alpine/git:v2.36.3 AS submodule-loader

WORKDIR /sublist3r
ADD /Sublist3r /sublist3r
RUN git submodule update

FROM python:3.7-slim AS main

WORKDIR /sublist3r
COPY --from=submodule-loader /sublist3r /sublist3r

RUN pip install -r ./requirements.txt

ENTRYPOINT ["/usr/local/bin/python3.7", "/sublist3r/sublist3r.py"]
