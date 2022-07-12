pipeline{
  agent any
  stages {
    stage ('Build') {
      steps {
        sh 'printenv'
      }
    }
    stage ('Push image into ECR') {
      steps {
        withEnv ([ "AWS_ACCESS_KEY_ID=${env.AWS_ACCESS_KEY_ID}", "AWS_SECRET_ACCESS_KEY=${env.AWS_SECRET_ACCESS_KEY}", "AWS_DEFAULT_REGION=${env.AWS_DEFAULT_REGION}" ]) {
          sh 'aws ecr get-login-password --region ap-south-1'
          sh 'docker login --username AWS --password-stdin 161146977543.dkr.ecr.ap-south-1.amazonaws.com'
          sh 'docker build -t jenkins-image .'
          sh 'docker tag jenkins-image:latest 161146977543.dkr.ecr.ap-south-1.amazonaws.com/jenkins-image:latest: ""$BUILD_ID""'
          sh 'docker push 161146977543.dkr.ecr.ap-south-1.amazonaws.com/jenkins-image:latest: ""$BUILD_ID""'
        }
      }
    }
  }
}
