# for using curl script
FROM mongo

# Needed for wait
RUN apt-get update && apt-get install -y netcat


# wait
# RUN apt-get update; apt-get install curl

ARG MONGO_DB_NAME
ARG MONGO_TABLE_COLLECTION_NAME
ARG MONGO_USER
ARG MONGO_PASS

ENV ENV_MONGO_DB_NAME=$MONGO_DB_NAME
ENV ENV_MONGO_TABLE_COLLECTION_NAME=$MONGO_TABLE_COLLECTION_NAME
ENV ENV_MONGO_USER=$MONGO_USER
ENV ENV_MONGO_PASS=$MONGO_PASS

ENV ENV_URL = "mongodb://${ENV_MONGO_USER}:${ENV_MONGO_PASS}@mongo1:27017/admin"
WORKDIR /root
ENV PATH /root/bin:$PATH

WORKDIR /root/bin

COPY import_files/latest.csv .
COPY import_files/field_file_types.txt .

COPY scripts/wrapper.sh .
COPY scripts/wait.sh .
COPY scripts/import.sh .

RUN chmod +x wrapper.sh
RUN echo "${ENV_MONGO_DB_NAME} ${ENV_MONGO_TABLE_COLLECTION_NAME} ${MONGO_USER} ${MONGO_PASS}"


CMD sh /root/bin/wrapper.sh "${ENV_URL}" "${ENV_MONGO_DB_NAME}" "${ENV_MONGO_TABLE_COLLECTION_NAME}" "${MONGO_USER}" "${MONGO_PASS}"
