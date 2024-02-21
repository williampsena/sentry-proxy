# About

This repository provides a proof-of-concept that uses Kong as a proxy to the remote Sentry API in order to limit application requests and prevent exceeding 🐛 Sentry quotas (300k per month).

# Stacks

This project made use of Kong and Redis to handle proxy requests.
The declarative approach 🔥 with no database was chosen since it is a lightweight manner for supporting an API Gateway.

![diagram](./assets/diagram.jpg)

## Why Redis?

Redis is required for rate-limiting by node; without this approach, we have a local rate-limit per instance.

# How to run?

```shell
docker compose up -d --build
```

# How do I send errors to Sentry?

```shell
 bash scripts/send-sentry-error.sh "YOUR_API_KEY" YOUR_PROJECT_ID
```

# Quota per project

Projects: 15
Quota per month: 300k
Quota per day: 10k
Quota project per day: 665 😢
Quota project per hour: 27 😢