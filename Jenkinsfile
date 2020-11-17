pipeline {

    // we need a small podman server
    agent { label "podman && t3small" }

    // Ask for BRANCH and TARGET environment before we build
    parameters {
        gitParameter(name: 'BRANCH', description: 'Select branch to build', branchFilter: 'origin/(.*)', defaultValue: 'master', type: 'PT_BRANCH')
        choice(name: 'TARGET', description: 'AWS Target account', choices: ['dev', 'test', 'productive'])
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    // fill a few variables by looking at the selected TARGET
                    switch (env.TARGET) {
                        case 'dev':
                            env.aws_key_id = "Jenkins AWS-DEV"
                            env.inventory_file = "ansible/dev.inv"
                            env.repo = '351025823571.dkr.ecr.eu-central-1.amazonaws.com'
                            env.baseUrl = 'https://www.pascom-dev.net'
                            env.mypascom = 'https://my.pascom-dev.net'
                            env.doc = 'doc-dev'
                            vault = ["vaultUrl": 'https://vault.in.pascom-dev.net:8200', "vaultCredentialId": 'vault-dev']
                            break

                        case 'test':
                            env.aws_key_id = "Jenkins AWS-TEST"
                            env.inventory_file = "ansible/test.inv"
                            env.repo = '626737757095.dkr.ecr.eu-central-1.amazonaws.com'
                            env.baseUrl = 'https://www.pascom-test.net'
                            env.mypascom = 'https://my.pascom-test.net'
                            env.doc = 'doc-test'
                            vault = ["vaultUrl": 'https://vault.in.pascom-dev.net:8200', "vaultCredentialId": 'vault-dev']
                            break

                        case 'productive':
                            env.aws_key_id = "Jenkins AWS"
                            env.inventory_file = "ansible/prod.inv"
                            env.repo = '157248286409.dkr.ecr.eu-central-1.amazonaws.com'
                            env.baseUrl = 'https://www.pascom.net'
                            env.mypascom = 'https://my.pascom.net'
                            env.doc = 'doc-productive'
                            vault = ["vaultUrl": 'https://vault.in.pascom.net:8200', "vaultCredentialId": 'vault-prod']
                            break

                        default:
                            error "unknown/no target selected"
                    }
                }

                // run a shallow clone because of huge homepage history (>450M)
                // a simple "checkout scm" would be enough for smaler repos....
                checkout scm: [
                    $class: 'GitSCM',
                    branches: [[name: "origin/${env.BRANCH}"]],
                    extensions: [
                        [
                            $class: 'CloneOption',
                            depth: 3,
                            noTags: true,
                            reference: '',
                            shallow: true
                        ],
                        [$class: 'CleanBeforeCheckout'],
                    ]
                ]
            }

        }

        stage('Build container') {
            steps {
                withVault([configuration: vault, vaultSecrets: [ [
                        path: 'kv/deploy/algolia', 
                        secretValues: [ 
                        [
                            vaultKey: 'AlgoliaKey'
                        ], 
                        ] ] ] ]) {
                    sh """
                    podman build \
                            --build-arg baseUrl=${env.baseUrl} \
                            --build-arg mypascom=${env.mypascom} \
                            --build-arg doc=${env.doc} \
                            --build-arg key=${AlgoliaKey} \
                            -t documentation:${env.BUILD_NUMBER} .
                    """
                }
            }
        }

        stage('Push container') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: env.aws_key_id, secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                    ansiColor('xterm') {
                        ansiblePlaybook(
                            inventory: env.inventory_file,
                            limit: params.DEPLOY,
                            playbook: "ansible/deploy_ecr.yml",
                            sudoUser: null,
                            colorized: true
                        )
                    }

                    sh """
                    aws ecr get-login-password --region eu-central-1 | podman login --username AWS --password-stdin ${env.repo}

                    podman push documentation:${env.BUILD_NUMBER} docker://${env.repo}/ci/documentation:${env.BUILD_NUMBER}
                    podman push documentation:${env.BUILD_NUMBER} docker://${env.repo}/ci/documentation:${env.BRANCH}
                    """
                }
            }
        }

        stage('Update ECS Task') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: env.aws_key_id, secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                    ansiColor('xterm') {
                        ansiblePlaybook(
                            inventory: env.inventory_file,
                            limit: params.DEPLOY,
                            playbook: "ansible/deploy_ecs_task.yml",
                            sudoUser: null,
                            colorized: true,
                            extraVars: [
                                image: "${env.repo}/ci/documentation:${env.BUILD_NUMBER}",
                            ]
                        )
                    }
                }
            }
        }
    }
}
