FROM alpine/git:v2.36.3 AS submodule-loader

WORKDIR /repo
ADD . /repo
RUN git submodule update --init --recursive

FROM python:3.7-slim AS main

WORKDIR /sublist3r
COPY --from=submodule-loader /repo/Sublist3r /sublist3r

RUN pip install -r ./requirements.txt

ENTRYPOINT ["/usr/local/bin/python3.7", "sublist3r.py"]
