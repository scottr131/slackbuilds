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
        
        stage('Build raft') {
            steps {
                sh 'make raft'
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', followSymlinks: false)
                }
            }
        }        
        stage("Install raft") {
            steps {
                sh "source raft/raft.info; sudo installpkg raft-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }        


        stage('Build cowsql') {
            steps {
                sh 'make cowsql'
            }
            post {
                success {
                    archiveArtifacts artifacts: '*.txz', followSymlinks: false
                }
            }
        }        
        stage("Install cowsql") {
            steps {
                sh "source cowsql/cowsql.info; sudo installpkg cowsql-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }       


        stage('Build incus') {
            steps {
                sh 'PATH=$PATH:/opt/go/bin make incus'
            }
            post {
                success {
                    archiveArtifacts artifacts: '*.txz', followSymlinks: false
                }
            }
        }        

        stage('Build incus-ui-canonical') {
            steps {
                sh 'make incus-ui-canonical'
            }
            post {
                success {
                    archiveArtifacts artifacts: '*.txz', followSymlinks: false
                }
            }
        }        
        


        stage("Build skopeo") {
            steps {
                sh 'make skopeo'
            }
            post {
                success {
                    archiveArtifacts artifacts: '*.txz', followSymlinks: false
                }
            }
        }


    }
}

