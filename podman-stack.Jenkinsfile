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
        
        stage('Build libpathrs') {
            steps {
                sh 'make libpathrs'
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', followSymlinks: false)
                }
            }
        }        
        stage("Install libpathrs") {
            steps {
                sh "source libpathrs/libpathrs.info; sudo installpkg libpathrs-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }        


        stage('Build runc') {
            steps {
                sh 'PATH=$PATH:/opt/go/bin make runc'
            }
            post {
                success {
                    archiveArtifacts artifacts: '*.txz', followSymlinks: false
                }
            }
        }        
               


        stage('Build go-md2man') {
            steps {
                sh 'PATH=$PATH:/opt/go/bin make go-md2man'
            }
            post {
                success {
                    archiveArtifacts artifacts: '*.txz', followSymlinks: false
                }
            }
        }  
        stage("Install go-md2man") {
            steps {
                sh "source go-md2man/go-md2man.info; sudo installpkg go-md2man-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }        

        stage('Build conmon') {
            steps {
                sh 'PATH=$PATH:/opt/go/bin make conmon'
            }
            post {
                success {
                    archiveArtifacts artifacts: '*.txz', followSymlinks: false
                }
            }
        }        
        
        stage('Build netavark') {
            steps {
                sh 'PATH=$PATH:/opt/go/bin make netavark'
            }
            post {
                success {
                    archiveArtifacts artifacts: '*.txz', followSymlinks: false
                }
            }
        }        
        
        stage('Build podman') {
            steps {
                sh 'PATH=$PATH:/opt/go/bin make podman'
            }
            post {
                success {
                    archiveArtifacts artifacts: '*.txz', followSymlinks: false
                }
            }
        }        
        
        stage('Build buildah') {
            steps {
                sh 'PATH=$PATH:/opt/go/bin make buildah'
            }
            post {
                success {
                    archiveArtifacts artifacts: '*.txz', followSymlinks: false
                }
            }
        }        
        

        stage("Build skopeo") {
            steps {
                sh 'PATH=$PATH:/opt/go/bin make skopeo'
            }
            post {
                success {
                    archiveArtifacts artifacts: '*.txz', followSymlinks: false
                }
            }
        }


    }
}

