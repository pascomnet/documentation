node('docker') {

    def version = "${env.DOC_VERSION}"
    def target = "${env.DOC_TARGET}"
    def baseUrl

    switch (target) {
        case 'dev':
            baseUrl = 'https://dev.in.pascom.net/doc'
            break
    }

    withAnt {
        ant.replaceregexp(file: './site/config.toml', match: '^baseURL = .*$', replace: "baseURL = \"${baseURL}\"")
    }
    
    stage('Checkout') {
        checkout scm
    }

    stage('Build doc') {
        def hugo = docker.build("hugo:${env.BUILD_ID}")

        hugo.inside {
            sh 'cp -a /usr/share/nginx/html ./doc-container/'
        }
    }

    stage('Build container') {
   
        version = version.replaceAll('origin/','')
        def homepage = docker.build("doc/${target}:${version}", "./doc-container")
        stage('Push container') {
            docker.withRegistry('https://docker-registry.in.pascom.net', '6495aa9c-a076-4ac9-89eb-a29f622667f6') {

                homepage.push()

            }
        }

    }

}