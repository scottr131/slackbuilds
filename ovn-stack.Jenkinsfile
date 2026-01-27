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
        
        stage('Build openvswitch') {
            steps {
                sh 'make openvswitch'
            }
            post {
                success {
                    archiveArtifacts artifacts: '*.txz', followSymlinks: false
                }
            }
        }        
        stage("Install openvswitch") {
            steps {
                sh "source openvswitch/openvswitch.info; sudo installpkg openvswitch-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }        


        stage('Build protobuf-c') {
            steps {
                sh 'make protobuf-c'
            }
            post {
                success {
                    archiveArtifacts artifacts: '*.txz', followSymlinks: false
                }
            }
        }        
        stage("Install protobuf-c") {
            steps {
                sh "source protobuf-c/protobuf-c.info; sudo installpkg protobuf-c-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }       

/* Test without libyang
        stage('Build libyang') {
            steps {
                sh 'make libyang'
            }
            post {
                success {
                    archiveArtifacts artifacts: '*.txz', followSymlinks: false
                }
            }
        }        
        
        stage("Install libyang") {
            steps {
                sh "source libyang/libyang.info; sudo installpkg libyang-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }
*/
        stage('Build ovn') {
            steps {
                sh 'make ovn'
            }
            post {
                success {
                    archiveArtifacts artifacts: '*.txz', followSymlinks: false
                }
            }
        }        
        
        stage("Install ovn") {
            steps {
                sh "source ovn/ovn.info; sudo installpkg ovn-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }


    }
}

