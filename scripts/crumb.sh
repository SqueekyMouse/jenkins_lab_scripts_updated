crumb=$(curl -u "jenkins:1234" -s 'http://jenkins.local:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')
# env-demo job build url!!
# curl -u "jenkins:1234" -H "$crumb" -X POST http://jenkins.local:8080/job/env-demo/build?delay=0sec

# curl -u "jenkins:1234" -H "$crumb" -X POST  http://jenkins.local:8080/job/backup-to-aws/buildWithParameters?MYSQL_HOST=db_host&DATABASE_NAME=testdb&AWS_BUCKET_NAME=jenkins-mysql-backup

# backup-to-aws job build with parameters!!
# curl -u "jenkins:1234" -H "$crumb" -X POST  http://jenkins.local:8080/job/backup-to-aws/buildWithParameters?MYSQL_HOST=db_host&DATABASE_NAME=testdb&AWS_BUCKET_NAME=jenkins-mysql-backup545

# ansible-users-db job build with parameters!!
curl -u "jenkins:1234" -H "$crumb" -X POST  http://jenkins.local:8080/job/ansible-users-db/buildWithParameters?AGE=23