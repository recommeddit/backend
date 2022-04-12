# syntax=docker/dockerfile:1
FROM --platform=linux/amd64 pytorch/pytorch:1.11.0-cuda11.3-cudnn8-devel
WORKDIR /root
RUN python -m pip install -U pip setuptools wheel
RUN python -m pip install -U 'spacy[cuda113,transformers,lookups]'
RUN python -m spacy download en_core_web_trf
RUN python -m spacy download en_core_web_lg
RUN apt-get update -y && apt-get install vim -y && apt-get install git -y
ADD backend /root
CMD sleep infinity