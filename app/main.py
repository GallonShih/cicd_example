import os
from fastapi import FastAPI
from fastapi.responses import JSONResponse

app = FastAPI()

def hello(name) -> str:
    # do somethine
    return f"Hello {name}."

@app.get("/v1/hello",
            description='Say Hello to you.',
            responses={
                        400: {"description": 'get_hello fail'},
                        500: {"description": 'Internal server error'}
            }
        )
async def get_hello(name: str):
    hello_msg = hello(name)
    return JSONResponse(status_code=200, content={"data": hello_msg})

def age():
    return 18

@app.get("/v1/age",
            description='Get age',
            responses={
                        400: {"description": 'get_age fail'},
                        500: {"description": 'Internal server error'}
            }
        )
async def get_age():
    age_value = age()
    return JSONResponse(status_code=200, content={"data": age_value})

@app.get("/v1/image",
            description='Get Image',
            responses={
                        400: {"description": 'get_image fail'},
                        500: {"description": 'Internal server error'}
            }
        )
async def get_image():
    image_env_var = os.getenv("IMAGE", "Environment variable 'IMAGE' not set.")
    return JSONResponse(status_code=200, content={"data": image_env_var})


if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app="main:app", host="0.0.0.0", port=8000, reload=False)

