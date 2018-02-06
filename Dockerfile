# Use an official Python runtime as a parent image
FROM python:slim

LABEL maintainer="avthatte@gmail.com"

# Set the working directory to /notebooks within the container
WORKDIR /notebooks

# Install the necessary libraries for graphviz
RUN apt-get update && apt-get install -y \
    graphviz \
    && rm -rf /var/lib/apt/lists/*

# Install the necessary libraries for opencv
RUN apt-get update && apt-get install -y \
    libgtk2.0-dev \
    libsm6 \
    libxext6 \
    libxrender1 \
    && rm -rf /var/lib/apt/lists/*

# Install the necessary python libraries
RUN pip3 install \
    graphviz \
    jupyter \
    keras \
    matplotlib \
    numpy \
    opencv-python \
    pandas \
    pydot \
    scipy \
    seaborn \
    sklearn \
    statsmodels \
    tensorflow \
    && rm -r /root/.cache/pip

# Start jupyter notebook
CMD jupyter-notebook --ip="*" --no-browser --allow-root
