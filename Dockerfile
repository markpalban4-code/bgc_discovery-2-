FROM python:3.10-slim-bullseye

LABEL maintainer="BGC Discovery Pipeline"
LABEL description="Complete Streptomyces BGC Discovery Pipeline"

WORKDIR /workspace

RUN apt-get update && apt-get install -y build-essential wget curl git unzip prodigal hmmer bedtools && rm -rf /var/lib/apt/lists/*

RUN cd /tmp && wget https://ftp.ncbi.nlm.nih.gov/pub/datasets/command-line/LATEST/linux-amd64/datasets && chmod +x datasets && mv datasets /usr/local/bin/

RUN pip install --no-cache-dir --upgrade pip && pip install --no-cache-dir numpy pandas scikit-learn tensorflow biopython matplotlib pyyaml jupyter

RUN mkdir -p /workspace/data/{raw,processed} && mkdir -p /workspace/{models,results,logs,databases,scripts}

CMD ["/bin/bash"]
