node('docker') {

    def version = "${env.DOC_VERSION}"
    def target = "${env.DOC_TARGET}"
    def algoliaKey = "${env.ALGOLIA_KEY}"
    def baseUrl
    def sedCmd
    
    doc = null
    
    switch (target) {
        case 'dev':
            baseUrl = 'https://www.dev.pascom.net/doc/'
            mypascom = 'https://my.dev.pascom.net'
            homepage = 'https://www.dev.pascom.net'
            doc = 'doc-dev'
            break
        
        case 'test':
            baseUrl = 'https://www.test.pascom.net/doc/'
            mypascom = 'https://my.test.pascom.net'
            homepage = 'https://www.test.pascom.net'
            doc = 'doc-test'
            break
    }

    stage('Checkout') {
        checkout scm
    }

    if (doc != null){
        
        sh "sed -i 's#baseURL.*#baseURL = \"${baseUrl}\"#' ./site/config.toml"
        sh "sed -i 's/doc-productive/${doc}/g' ./site/config.toml"
        sh "sed -i 's#https://my.pascom.net#${mypascom}#g' ./site/config.toml"
        sh "sed -i 's#https://www.pascom.net#${homepage}#g' ./site/config.toml"

    }
    stage('Build doc') {
        def hugo = docker.build("hugo:${env.BUILD_ID}")

        hugo.inside {
            sh 'cp -a /usr/share/nginx/html ./doc-container/'
            sh 'cp /usr/share/nginx/html/de/index.json ./algolia-container/index.de.json'
            sh 'cp /usr/share/nginx/html/en/index.json ./algolia-container/index.en.json'
        }
    }

    stage('Push Algolia Index') {
        def algolia = docker.build("algolia:${env.BUILD_ID}", "--build-arg TARGET=${target} --build-arg AKEY=${algoliaKey} ./algolia-container")

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