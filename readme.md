# GitHub CI/CD Example

This repository demonstrates a simple example of CI/CD (Continuous Integration/Continuous Deployment) using GitHub Actions. We have a basic FastAPI application that serves as an API server. The focus is on illustrating how to set up a CI/CD pipeline to automatically integrate your codebase and run unit tests for your functions.

## :star: Prerequisites

Before you get started, make sure you have the following:
- Git installed on your machine.
- A GitHub account.
- A Docker Hub account.
- Basic knowledge of Python programming.

## :rocket: Getting Started

1. **Fork or Copy the Repository**
   - Fork this repository or copy the codebase to your own GitHub account.

2. **Clone to Your Local Machine**
   - Clone the repository to your local development environment using Git.

3. **Repository Description**
   - This repository contains a FastAPI application with a set of predefined APIs and unit tests.

4. **Making Changes in `app/` Directory**
   - **Add a New API**: You can add new API endpoints to the FastAPI application.
   - **Edit an Existing API**: Be aware that editing an existing API might cause the CI/CD pipeline to fail if the changes do not pass the unit tests.

5. **Push Changes to GitHub**
   - Commit and push your changes to GitHub. This will trigger the CI/CD pipeline defined in GitHub Actions.

6. **Check the CI/CD Pipeline**
   - Go to the 'Actions' tab in your GitHub repository to view the status and logs of the CI/CD pipeline.

7. **Launch the API Server(Optional)**


