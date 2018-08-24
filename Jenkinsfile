node('docker') {

    checkout scm

    def hugo = docker.build("hugo:${env.BUILD_ID}")

    hugo.inside {
        sh 'cp -a /usr/share/nginx/html .'
    }

}