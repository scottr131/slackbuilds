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


        stage("Build xrdp") {
            steps {
                sh "make xrdp"
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', fingerprint: true, allowEmptyArchive: true)
                }
            }
        }    
    
        stage("Install xrdp") {
            steps {
                sh "source xrdp/xrpd.info; sudo installpkg xrdp-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }
        
        stage("Build xorgxrdp") {
            steps {
                sh "make xorgxrdp"
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', fingerprint: true, allowEmptyArchive: true)
                }
            }
        }    
            
    }
}
