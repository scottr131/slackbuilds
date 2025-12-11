pipeline {
    agent any
    environment {
        OUTPUT = "${WORKSPACE}"
        PKGTYPE = "txz"
        ARCH = "x86_64"
        TAG = "_SBo"
        BUILD = "1"
        JAVA_HOME = "/opt/java17"
    }
    stages {
        stage('Pull build scripts') {
            steps {
                git branch: 'main', url: 'https://github.com/scottr131/slackbuilds.git'
            }
        }
        
        stage('Build linstor-server') {
            steps {
                sh 'PATH=\$PATH:/opt/java17/bin make linstor-server'
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', followSymlinks: false)
                }
            }
        }        
   


        stage('Build python_linstor') {
            steps {
                sh 'make python_linstor'
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', followSymlinks: false)
                }
            }
        }        
        stage("Install python_linstor") {
            steps {
                sh "source python_linstor/python_linstor.info; sudo installpkg python_linstor-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }       


        stage('Build linstor_client') {
            steps {
                sh 'make linstor_client'
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', followSymlinks: false)
                }
            }
        }        
        


        stage('Build drbd') {
            steps {
                sh 'make drbd'
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', followSymlinks: false)
                }
            }
        }        
        
        stage('Build drbd-utils') {
            steps {
                sh 'make drbd-utils'
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', followSymlinks: false)
                }
            }
        }        

        stage('Build thin-provisioning-tools') {
            steps {
                sh 'make thin-provisioning-tools'
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', followSymlinks: false)
                }
            }
        }    



    }
}
