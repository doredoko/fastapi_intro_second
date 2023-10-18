FROM python:3.11-buster

ENV PYTHONUNBUFFERED=1
WORKDIR /src
RUN pip install poetry
COPY pyproject.toml* poetry.lock* ./
RUN poetry config virtualenvs.in-project true
#ENV PATH="/src/.venv/bin:$PATH"
RUN if [ f pyproject.toml ]; then poetry install --no-root; fi
ENTRYPOINT ["poetry","run","uvicorn","api.main:app","--host","0.0.0.0","--reload"]