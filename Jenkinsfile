pipeline {
    agent {
        dockerfile true 
    }
    stages {
        stage('Export generated site') {
            steps {
                sh 'cp -a /usr/share/nginx/html .'
            }
        }
    }
}