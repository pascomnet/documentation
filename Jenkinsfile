node('docker') {

    stage('Checkout') {
        checkout scm
    }

    stage('Build doc with hugo') {
        def hugo = docker.build("hugo:${env.BUILD_ID}", "./hugo-container")

        hugo.inside {
            sh 'cp -a /usr/share/nginx/html .'
        }
    }

    stage('Build doc container') {
        def homepage = docker.build("doc:${env.BUILD_ID}", "./doc-container")

        docker.withRegistry('https://docker-registry.in.pascom.net', '6495aa9c-a076-4ac9-89eb-a29f622667f6') {

            homepage.push()

        }

    }

}