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
        
        stage('Build containerd') {
            steps {
                sh 'PATH=$PATH:/opt/go/bin make containerd'
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', followSymlinks: false)
                }
            }
        }        


        stage('Build cri-tools') {
            steps {
                sh 'PATH=$PATH:/opt/go/bin make cri-tools'
            }
            post {
                success {
                    archiveArtifacts artifacts: '*.txz', followSymlinks: false
                }
            }
        }        


        stage('Build cni-plugins') {
            steps {
                sh 'PATH=$PATH:/opt/go/bin make cni-plugins'
            }
            post {
                success {
                    archiveArtifacts artifacts: '*.txz', followSymlinks: false
                }
            }
        }        
        


        stage("Build runc") {
            steps {
                sh 'PATH=$PATH:/opt/go/bin make runc'
            }
            post {
                success {
                    archiveArtifacts artifacts: '*.txz', followSymlinks: false
                }
            }
        }

        stage("Build kubernetes") {
            steps {
                sh 'PATH=$PATH:/opt/go/bin make kubernetes'
            }
            post {
                success {
                    archiveArtifacts artifacts: '*.txz', followSymlinks: false
                }
            }
        }

        stage("Build nerdctl") {
            steps {
                sh 'PATH=$PATH:/opt/go/bin make nerdctl'
            }
            post {
                success {
                    archiveArtifacts artifacts: '*.txz', followSymlinks: false
                }
            }
        }



    }
}

