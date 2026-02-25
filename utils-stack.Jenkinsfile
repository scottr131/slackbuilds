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
        
        stage('Build asciinema') {
            steps {
                sh 'make asciinema'
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', followSymlinks: false)
                }
            }
        }        

        stage('Build bat') {
            steps {
                sh 'make bat'
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', followSymlinks: false)
                }
            }
        }     

        stage('Build btop') {
            steps {
                sh 'make btop'
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', followSymlinks: false)
                }
            }
        }     

        stage('Build fresh') {
            steps {
                sh 'make fresh'
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', followSymlinks: false)
                }
            }
        }     

        stage('Build ufw') {
            steps {
                sh 'make ufw'
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', followSymlinks: false)
                }
            }
        }     
        stage('Build bash-completion') {
            steps {
                sh 'make bash-completion'
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', followSymlinks: false)
                }
            }
        }     
        
        stage('Build vtm') {
            steps {
                sh 'make vtm'
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', followSymlinks: false)
                }
            }
        }     


        

     }
}
