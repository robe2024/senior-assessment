# Senior DevOps Assessment

# Components

## Backend

Hello world ASP .NET Core application

## Frontend

Hello world Angular application

# Assignment

Deploy the backend and frontend applications to a production-like environment.

Ideal submissions include:

- Repeatable CI/CD pipeline focused around containerization
  - Kubernetes preferred (Azure free tier, minikube, etc...)
- Easy spin up and tear down of any relevant infrastructure
- Validation of service health in deployed environment
- The backend service should only be available internally while the frontend should be publicly accessible
- Suitable instructions should be provided to run any pipelines or provision infrastructure. This includes the creation of fresh secrets

Notes:

- Any environment should be completely recreatable for validation purposes. Including both build and deployment environments.
- Any choice of build tooling is allowed (as long as it’s free or provides a suitable free tier)
- Entire assignment is able to be completed with free tools and services, there is no need to spend money to complete

Please download the code from the provided repository and provide your submission as a new private repository shared with [dwettlaufer](https://www.github.com/dwettlaufer) and [michael-baraboo](https://www.github.com/michael-baraboo).
