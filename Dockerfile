# Builds production version of Community App inside Docker container,
# and runs it against the specified Topcoder backend (development or
# production) when container is executed.

FROM node:8.2.1
LABEL app="Community App" version="1.0"

WORKDIR /opt/app
COPY . .

RUN npm install
RUN npm test
RUN npm run build

ARG FILESTACK_API_KEY
ARG FILESTACK_SUBMISSION_CONTAINER
ARG NODE_ENV

ENV FILESTACK_API_KEY=$FILESTACK_API_KEY
ENV FILESTACK_SUBMISSION_CONTAINER=$FILESTACK_SUBMISSION_CONTAINER
ENV NODE_ENV=$NODE_ENV

EXPOSE 3000
CMD ["npm", "start"]
