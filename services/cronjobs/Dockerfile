FROM ubuntu:latest

ENV TZ=Europe/Helsinki
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
    apt-get -y install cron gnupg wget curl && \
    wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | apt-key add - && \
    echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.2.list && \
    apt-get update && \
    apt-get install -y mongodb-org-shell mongodb-org-tools 

# Copy cron-jobs file to the cron.d directory
COPY cron-jobs /etc/cron.d/cron-jobs
COPY scripts /scripts

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/cron-jobs
RUN chmod -R +x /scripts

# Apply cron job
RUN crontab /etc/cron.d/cron-jobs

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Run the command on container startup
CMD printenv | sed 's/^\(.*\)$/export \1/g' > "/scripts/env.variables" && cron &&  tail -f /var/log/cron.log
#CMD printenv | sed 's/^\(.*\)$/export \1/g' > "/scripts/env.variables" && cron && bash