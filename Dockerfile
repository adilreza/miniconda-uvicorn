FROM continuumio/miniconda3

WORKDIR /app

# Create environment
COPY environment.yml .
RUN conda env create -f environment.yml

# use the new environment - important
SHELL ["conda", "run", "-n", "myenv", "/bin/bash", "-c"]

# Demonstrate the environment is activated:
RUN echo "Make sure flask is installed:"

# run when container is started:
COPY main.py .
ENTRYPOINT ["conda", "run", "--no-capture-output", "-n", "myenv", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
