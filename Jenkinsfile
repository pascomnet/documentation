node('docker') {

    def version = "${env.DOC_VERSION}"
    def target = "${env.DOC_TARGET}"
    def baseUrl
    def sedCmd
    
    switch (target) {
        case 'dev':
            baseUrl = 'https://www.dev.pascom.net/doc'
            break
        
        case 'test':
            baseUrl = 'https://www.test.pascom.net/doc'
            break
    }

    stage('Checkout') {
        checkout scm
    }

    sh "sed -i 's#baseURL.*#baseURL = \"${baseUrl}\"#' ./site/config.toml"

    stage('Build doc') {
        def hugo = docker.build("hugo:${env.BUILD_ID}")

        hugo.inside {
            sh 'cp -a /usr/share/nginx/html ./doc-container/'
            sh 'cp /usr/share/nginx/html/de/index.json ./algolia-container/index.de.json'
            sh 'cp /usr/share/nginx/html/en/index.json ./algolia-container/index.en.json'
        }
    }

    stage('Push Algolia Index') {
        def algolia = docker.build("algolia:${env.BUILD_ID}", "./algolia-container")

        algolia.inside {
            
            sh ''

        }
    }


    stage('Build container') {
   
        version = version.replaceAll('origin/','')
        def doc = docker.build("doc/${target}:${version}", "./doc-container")
        stage('Push container') {
            docker.withRegistry('https://docker-registry.in.pascom.net', '6495aa9c-a076-4ac9-89eb-a29f622667f6') {

                doc.push()

                doc.push('latest')

            }
        }

    }

}