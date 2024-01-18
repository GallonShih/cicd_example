from fastapi import FastAPI
from fastapi.responses import JSONResponse

app = FastAPI()

@app.get("/v1/hello",
            description='Say Hello to you.',
            responses={
                        400: {"description": 'hello fail'},
                        500: {"description": 'Internal server error'}
            }
        )
async def hello(name: str):
    return JSONResponse(status_code=200, content={"data": f"Hello {name}."})


if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app="main:app", host="0.0.0.0", port=8000, reload=False)
