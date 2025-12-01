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
        
        stage('Build go') {
            steps {
                sh 'make go'
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', followSymlinks: false)
                }
            }
        }        

        stage('Build temurin-jdk11') {
            steps {
                sh 'make temurin-jdk11'
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', followSymlinks: false)
                }
            }
        }     

        stage('Build temurin-jdk17') {
            steps {
                sh 'make temurin-jdk17'
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', followSymlinks: false)
                }
            }
        }     

        stage('Build temurin-jdk21') {
            steps {
                sh 'make temurin-jdk21'
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', followSymlinks: false)
                }
            }
        }     


     }
}
