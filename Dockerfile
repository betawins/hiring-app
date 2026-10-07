FROM tomcat:8.0.20-jre8

ENV NEXUS_REPO_URL="http://172.31.9.26:8081/repository/hiring-app/"
ENV ARTIFACT_PATH="junit/hiring/0.1/hiring-0.1.war"

ADD $NEXUS_REPO_URL$ARTIFACT_PATH /usr/local/tomcat/webapps/hiring.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
