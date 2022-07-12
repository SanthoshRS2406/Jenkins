pipeline{
  agent any
  stages {
    stage ('Build') {
      steps {
        sh 'printenv'
      }
    }
    stage ('Publish ECR') {
      steps {
        withEnv ([ "AWS_ACCESS_KEY_ID=${env.AWS_ACCESS_KEY_ID}", "AWS_SECRET_ACCESS_KEY=${env.AWS_SECRET_ACCESS_KEY}", "AWS_DEFAULT_REGION=${env.AWS_DEFAULT_REGION}" ]) {
          sh 'docker login -u AWS -p $(aws ecr-public get-login-password --region ap-south-1) public.ecr.aws/p9w3f8z7'
          sh 'docker build -t jenkins-image .'
          sh 'docker tag jenkins-image:latest public.ecr.aws/p9w3f8z7/jenkins-image: ""$BUILD_ID""'
          sh 'docker push public.ecr.aws/p9w3f8z7/jenkins-image:""$BUILD_ID""latest'
        }
      }
    }
  }
}
