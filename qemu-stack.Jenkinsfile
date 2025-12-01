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
        
        stage("Pull build scripts") {
            steps {
                git url: "https://github.com/scottr131/slackbuilds.git", branch: "main"

                }
        }


        stage("Build usbredir") {
            steps {
                sh "make usbredir"
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', fingerprint: true, allowEmptyArchive: true)
                }
            }
        }    
    
        stage("Install usbredir") {
            steps {
                sh "source usbredir/usbredir.info; sudo installpkg usbredir-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }
        
        stage("Build spice-protocol") {
            steps {
                sh "make spice-protocol"
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', fingerprint: true, allowEmptyArchive: true)
                }
            }
        }    
    
        stage("Install spice-protocol") {
            steps {
                sh "source spice-protocol/spice-protocol.info; sudo installpkg spice-protocol-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }
        
 
        stage("Build spice") {
            steps {
                sh "make spice"
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', fingerprint: true, allowEmptyArchive: true)
                }
            }
        }    
    
        stage("Install spice") {
            steps {
                sh "source spice/spice.info; sudo installpkg spice-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }

        stage("Build libblkio") {
            steps {
                sh "make libblkio"
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', fingerprint: true, allowEmptyArchive: true)
                }
            }
        }    
    
        stage("Install libblkio") {
            steps {
                sh "source libblkio/libblkio.info; sudo installpkg libblkio-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }
        stage("Build libiscsi") {
            steps {
                sh "make libiscsi"
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', fingerprint: true, allowEmptyArchive: true)
                }
            }
        }    
    
        stage("Install libiscsi") {
            steps {
                sh "source libiscsi/libiscsi.info; sudo installpkg libiscsi-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }
        
        

        stage("Build numactl") {
            steps {
                sh "make numactl"
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', fingerprint: true, allowEmptyArchive: true)
                }
            }
        }    
    
        stage("Install numactl") {
            steps {
                sh "source numactl/numactl.info; sudo installpkg numactl-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }



        stage("Build libtpms") {
            steps {
                sh "make libtpms"
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', fingerprint: true, allowEmptyArchive: true)
                }
            }
        }    
    
        stage("Install libtpms") {
            steps {
                sh "source libtpms/libtpms.info; sudo installpkg libtpms-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }


        stage("Build swtpm") {
            steps {
                sh "make swtpm"
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', fingerprint: true, allowEmptyArchive: true)
                }
            }
        }    
    
        stage("Install swtpm") {
            steps {
                sh "source swtpm/swtpm.info; sudo installpkg swtpm-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }        
        
        stage("Build qemu") {
            steps {
                sh "make qemu"
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', fingerprint: true, allowEmptyArchive: true)
                }
            }
        }    
    
        stage("Install qemu") {
            steps {
                sh "source qemu/qemu.info; sudo installpkg qemu-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }


        
    }
}
