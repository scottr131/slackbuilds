pipeline {
    agent any
    environment {
        OUTPUT = "${WORKSPACE}"
        PKGTYPE = "txz"
        ARCH = "x86_64"
        TAG = "_SBo"
        BUILD = "1"
    }
    stages {
        stage('Pull build scripts') {
            steps {
                git branch: 'main', url: 'https://github.com/scottr131/slackbuilds.git'
            }
        }
        
        stage('Build ansible') {
            steps {
                sh 'make ansible'
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', followSymlinks: false)
                }
            }
        }        

        stage('Build glances') {
            steps {
                sh 'make glances'
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', followSymlinks: false)
                }
            }
        }     

        stage('Build rundeck') {
            steps {
                sh 'make rundeck'
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', followSymlinks: false)
                }
            }
        }     
        
        stage('Build opentofu') {
            steps {
                sh 'PATH=$PATH:/opt/go/bin make opentofu'
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', followSymlinks: false)
                }
            }
        }     

     }
}
