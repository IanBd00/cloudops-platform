# Estágio 1: build de dependências
FROM python:3.12-slim AS builder

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir --user -r requirements.txt

# Estágio 2: imagem final
FROM python:3.12-slim

WORKDIR /app

# Copia só as dependências instaladas do estágio anterior
COPY --from=builder /root/.local /root/.local
COPY main.py .

ENV PATH=/root/.local/bin:$PATH

EXPOSE 8000

HEALTHCHECK --interval=30s --timeout=3s CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:8000/health')" || exit 1

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]