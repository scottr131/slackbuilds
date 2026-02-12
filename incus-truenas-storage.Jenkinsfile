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
        
        stage('Build open-isns') {
            steps {
                sh 'make open-isns'
            }
            post {
                success {
                    archiveArtifacts artifacts: '*.txz', followSymlinks: false
                }
            }
        }        
        
        stage("Install open-isns") {
            steps {
                sh "source open-isns/open-isns.info; sudo installpkg open-isns-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }

        stage('Build open-iscsi') {
            steps {
                sh 'make open-iscsi'
            }
            post {
                success {
                    archiveArtifacts artifacts: '*.txz', followSymlinks: false
                }
            }
        }        
        
        stage('Build truenas_incus_ctl') {
            steps {
                sh 'make truenas_incus_ctl'
            }
            post {
                success {
                    archiveArtifacts artifacts: '*.txz', followSymlinks: false
                }
            }
        }        


        
        stage('Build zfs') {
            steps {
                sh 'make zfs'
            }
            post {
                success {
                    archiveArtifacts artifacts: '*.txz', followSymlinks: false
                }
            }
        }        
        
    }
}

