from fastapi import FastAPI
from fastapi.responses import JSONResponse

app = FastAPI()

def hello(name) -> str:
    # do somethine
    return f"Hello {name}."

@app.get("/v1/hello",
            description='Say Hello to you.',
            responses={
                        400: {"description": 'hello fail'},
                        500: {"description": 'Internal server error'}
            }
        )
async def get(name: str):
    hello_msg = hello(name)
    return JSONResponse(status_code=200, content={"data": hello_msg})


if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app="main:app", host="0.0.0.0", port=8000, reload=False)
