from fastapi import FastAPI
from pydantic import BaseModel
import pandas as pd

app = FastAPI(title="data analysis service")

class DataRequest(BaseModel):
    values: list[float]

@app.get("/health")
def health():
    return {"status": "stable"}
@app.post("/summary")
def summary(req: DataRequest):
    s = pd.Series(req.values)
    result = {
        "count": int(s.count()),
        "mean": float(s.mean()),
        "std": float(s.std(ddof=1)) if s.count() > 1 else 0.0,
        "min": float(s.min()),
        "max": float(s.max()),
        "median": float(s.median())
    }
    return result
