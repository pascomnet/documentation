node('docker') {

    checkout scm

    def hugo = docker.build()

    hugo.inside {
        sh 'cp -a /usr/share/nginx/html .'
    }

}