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
        
        stage('Build') {
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

