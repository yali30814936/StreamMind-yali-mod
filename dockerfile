FROM nvidia/cuda:12.2.2-cudnn8-devel-ubuntu20.04

SHELL ["/bin/bash", "-c"]

# Install basic tools
RUN apt-get update && \
    apt-get install -y \
        python3 \
        python3-pip \
        git \
		bash \
        zip \
        unzip \
        curl \
        wget && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    rm -rf /var/lib/apt/lists/* && \
    pip install --upgrade pip && \
    pip3 cache purge

# Install Miniconda
RUN wget -q https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh && \
    bash /tmp/miniconda.sh -b -u -p /root/miniconda3 && \
    rm /tmp/miniconda.sh

ENV PATH="/root/miniconda3/bin:${PATH}"

# Install AWS CLI
RUN curl -s "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update && \
    rm -rf awscliv2.zip aws

ENV HF_HOME=/workspace/huggingface

# Copy and run initialization scripts
COPY sm_init.sh /root/sm_init.sh
COPY requirements.txt /root/requirements.txt
RUN chmod +x /root/sm_init.sh && \
    bash /root/sm_init.sh && \
    source /root/miniconda3/etc/profile.d/conda.sh && \
    conda activate sm && \
    conda clean -afy && \
    pip cache purge && \
    rm -rf /root/sm_init.sh && \
    rm -rf /root/requirements.txt

# Initialize conda for bash
RUN /root/miniconda3/bin/conda init bash
RUN echo "conda activate sm" >> /root/.bashrc
