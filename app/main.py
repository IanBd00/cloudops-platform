from fastapi import FastAPI
from prometheus_client import Counter, generate_latest, CONTENT_TYPE_LATEST
from fastapi.responses import Response

app = FastAPI(title="CloudOps Lab API")

REQUEST_COUNT = Counter("app_requests_total", "Total de requisições recebidas")

@app.get("/")
def read_root():
    REQUEST_COUNT.inc()
    return {"status": "ok", "message": "CloudOps Lab API rodando"}

@app.get("/health")
def health():
    return {"status": "healthy"}

@app.get("/metrics")
def metrics():
    return Response(generate_latest(), media_type=CONTENT_TYPE_LATEST)