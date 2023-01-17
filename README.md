# Welcome aboard to Justt!

Here you can find all you need to know in order for a more comfortable onboard process (tech-wise)

we sure some staff here you know, but it's here for a references guide

## Installations
* Brew - `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
* [MongoCompass](https://www.mongodb.com/try/download/compass) 
* [Perimeter81 (VPN Agent)](https://support.perimeter81.com/docs/downloading-the-agent) - After that request configuration from IT
* [Lens](https://k8slens.dev/)
* [Vanta](https://docs.google.com/document/u/1/d/1MgeUVfOOIiSQeMsrYM97zCAuxwKGIxFkWJWYFufhdng/edit#)
* [Docker](https://www.docker.com/products/docker-desktop/)
* [Visual Code](https://code.visualstudio.com/Download) or [Webstorm](https://www.jetbrains.com/idea/download/#section=mac)
* Node - `brew install node@14` will install the latest node-14 (currently 14.21.2) which should be compatible with our project version (14.17).
* Yarn - based on node version, follow instructions: https://yarnpkg.com/getting-started/install#nodejs-1610-1 (followed by `corepack prepare yarn@1.22.19 --activate`)
* OpenApiGenerator - `brew install openapi-generator`
* K8S - `brew install kubectl`
* [Github Better PR](https://chrome.google.com/webstore/detail/better-pull-request-for-g/nfhdjopbhlggibjlimhdbogflgmbiahc)

## Code
here you will find all you need - code related
### General
* [Clean Code Book](https://thixalongmy.haugiang.gov.vn/media/1175/clean_code.pdf)

### JavaScript
* [JavaScript: Understanding the Weird Parts](https://www.youtube.com/watch?v=Bv_5Zv5c-Ts&ab_channel=TonyAlicea)
* [Async Await](https://nodejs.bootcss.com/javascript-async-await)
* [Clean Code in Javascript](https://github.com/ryanmcdermott/clean-code-javascript)

### TypeScript
* [The TypeScript Handbook](https://www.typescriptlang.org/docs/handbook/intro.html)
* [Best Practices using TypeScript with Node.js](https://www.youtube.com/watch?v=ATUvAQZaTbM&ab_channel=node.js)

### Node.js
* [Node.js Best Practices](https://github.com/goldbergyoni/nodebestpractices)

## Common Libraries
### Backend libraries
* We are using mongodb as our main DB and [mongoose](https://mongoosejs.com/docs/guide.html) as our ORM
### Frontend libraries
* We are using [tailwindui](https://tailwindui.com/) as our main CSS framework, alongside [styledcomponents](https://styled-components.com/)
* As a fetch, sync, update and cache data in the client side, we are using [Reach Query](https://react-query.tanstack.com/)

### Frameworks
* **Nest.js** framework in use in some of our backend services. here you can find [Nest.js Documentation](https://docs.nestjs.com/)
* we're using **Next.js** framework in our client service. here you can find [Next.js Documentation](https://nextjs.org/docs)


## Infrastructure
In AcroCharge we are working in a microservices' architecture for our services. And, monorepo to store our code base

### Basics
* [Docker](https://docs.docker.com/get-started/) - our services software containers
* [Kubernetes](https://kubernetes.io/docs/tutorials/) - managing our dockers deployment and etc'

### Mandatory
In order to manage our monorepo, our services, dependencies, and common libraries we are using [NX framework](https://nx.dev/latest/angular/getting-started/intro).
This tool is the one you're going to work with the most, so we advise you to learn it well.

### Tools
* [MongoDB](https://www.mongodb.com/) - Our Main DB
* [RabbitMQ](https://www.rabbitmq.com/) - Message brokers
* [Redis](https://redis.io/) - In-memory data structure store using for cache

## Conventions

### Git Branch Naming
our branches naming have a few restrictions:
* start with JIRA ticket number
* short description ( one/two words)
* All letters beside the ticket number are lowercase
* branch name characters limit to 30

Example: NANO-1111-add-xx 

### Code Style
we are using [Google TypeScript Style Guide](https://google.github.io/styleguide/tsguide.html) 

### Slack - Tool
We are using slack as a communication tool, please join that channels:
* alerts-prod
* alerts-app


