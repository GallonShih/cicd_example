# GitHub CI/CD Example

This repository demonstrates a simple example of CI/CD (Continuous Integration/Continuous Deployment) using GitHub Actions. We have a basic FastAPI application that serves as an API server. The focus is on illustrating how to set up a CI/CD pipeline to automatically integrate your codebase and run unit tests for your functions.

![](./doc/images/cicd-01.png)

## :running: Workflow

![](./doc/images/workflow-01.png)

## :star: Prerequisites

Before you get started, make sure you have the following:
- Git installed on your machine.
- GitHub and Docker Hub accounts.
- Basic knowledge of Python programming.
- Configured AWS EC2 Instance (see below for setup details).
    - [Amazon Linux 2 AMI](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EC2_GetStarted.html)
    - Install docker
    ```linux
    sudo yum update
    sudo yum install docker
    sudo usermod -a -G docker ec2-user
    sudo systemctl enable docker
    sudo systemctl start docker
    sudo systemctl status docker
    ```
    - Install docker-compose
    ```linux
    sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

    sudo chmod +x /usr/local/bin/docker-compose

    sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
    ```
    - Set inbound rules
        - Type: Custom TCP
        - Protocol: TCP
        - Port Range: 8000
        - Source: Anywhere (0.0.0.0/0, ::/0)

## :rocket: Getting Started

1. **Fork or Copy the Repository**
    - Click the `Fork` button.

    ![](./doc/images/fork-01.png)

    - Set repository's name & click `Create fork` button.

    ![](./doc/images/fork-02.png)


2. **Set Secrets & enable Actions in GitHub**
    - Create secrets for CI/CD Actions

    ![](./doc/images/Set-secret-01.png)

    - Add secrets: `DOCKERHUB_USERNAME`, `DOCKERHUB_PASSWORD`, `EC2_HOST_NAME`, `EC2_USER_NAME` & `SSH_PRIVATE_KEY`

    ![](./doc/images/Set-secret-03.png)

    - Enable Actions for CI/CD

    ![](./doc/images/enable-actions-01.png)


3. **Clone to Your Local Machine**
    - Clone the repository to your local development environment using Git.

    ```linux
    git clone https://github.com/{Owner_name}/cicd_example.git
    ```


4. **Repository Description**
    - FastAPI application in [app/main.py](./app/main.py)

    - Unit-test in [tests/](./tests/)

    - CI/CD workflow [main.yaml](./.github/workflows/main.yml)


5. **Making Changes in [app/main.py](./app/main.py)**
    - **Add a New API**: You can add new API endpoints to the FastAPI application.

    ```python
    def gender():
        return 'Man'

    @app.get("/v1/gender",
                description='Get gender',
                responses={
                            400: {"description": 'get_gender fail'},
                            500: {"description": 'Internal server error'}
                }
            )
    async def get_gender():
        gender_value = gender()
        return JSONResponse(status_code=200, content={"data": gender_value})
    ```
    - **Edit an Existing API**: Be aware that editing an existing API might cause the CI/CD pipeline to fail if the changes do not pass the unit tests.

    ```python
    def age():
        return 28 # original 18
    ```


6. **Push Changes to GitHub**
    - Commit and push your changes to GitHub. This will trigger the CI/CD pipeline defined in GitHub Actions.

    ```linux
    git add .
    git commit -m "{your commit message}"
    git push
    ```


7. **Check the CI/CD Pipeline**
    - Go to the 'Actions' tab in your GitHub repository to view the status and logs of the CI/CD pipeline.

    ![](./doc/images/cicd-workflow-01.png)

8. **Check API Server in AWS EC2**
    - Go to address: http://{ Public IPv4 address }:8000/docs

    ![](./doc/images/ec2-address-01.png)


9. **Launch the API Server in Local(Optional)**
    - Docker & Docker-Compose installed on your machine.
    - Go to your [DockerHub](https://hub.docker.com/) & sign in.
    - Copy the image name with tag and paste it to [docker-compose.yaml](./docker-compose.yaml)

    ![](./doc/images/image-tag-01.png)

    ![](./doc/images/docker-compose-02.png)

    - Launch api server
    ```linux
    docker-compose up -d
    ```

    - Go to [localhost:8000/docs](http://localhost:8000/docs)

    - Close api server
    ```linux
    docker-compose down
    ```
