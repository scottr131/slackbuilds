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
        
        stage('Build spice-gtk') {
            steps {
                sh 'make spice-gtk'
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', followSymlinks: false)
                }
            }
        }   

        stage("Install spice-gtk") {
            steps {
                sh "source spice-gtk/spice-gtk.info; sudo installpkg spice-gtk-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }        


        stage('Build gtk-vnc') {
            steps {
                sh 'make gtk-vnc'
            }
            post {
                success {
                    archiveArtifacts artifacts: '*.txz', followSymlinks: false
                }
            }
        }        
        stage("Install gtk-vnc") {
            steps {
                sh "source gtk-vnc/gtk-vnc.info; sudo installpkg gtk-vnc-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }       

        stage('Build libosinfo') {
            steps {
                sh 'make libosinfo'
            }
            post {
                success {
                    archiveArtifacts artifacts: '*.txz', followSymlinks: false
                }
            }
        }        
        stage("Install libosinfo") {
            steps {
                sh "source libosinfo/libosinfo.info; sudo installpkg libosinfo-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }       

         stage('Build osinfo-db-tools') {
            steps {
                sh 'make osinfo-db-tools'
            }
            post {
                success {
                    archiveArtifacts artifacts: '*.txz', followSymlinks: false
                }
            }
        }        
        stage("Install osinfo-db-tools") {
            steps {
                sh "source osinfo-db-tools/osinfo-db-tools.info; sudo installpkg osinfo-db-tools-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }     
        
        stage('Build libvirt') {
            steps {
                sh 'make libvirt'
            }
            post {
                success {
                    archiveArtifacts artifacts: '*.txz', followSymlinks: false
                }
            }
        }        
        stage("Install libvirt") {
            steps {
                sh "source libvirt/libvirt.info; sudo installpkg libvirt-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }     


        stage('Build libvirt-glib') {
            steps {
                sh 'make libvirt-glib'
            }
            post {
                success {
                    archiveArtifacts artifacts: '*.txz', followSymlinks: false
                }
            }
        }        
        stage("Install libvirt-glib") {
            steps {
                sh "source libvirt-glib/libvirt-glib.info; sudo installpkg libvirt-glib-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }     

        stage('Build libvirt_python') {
            steps {
                sh 'make libvirt_python'
            }
            post {
                success {
                    archiveArtifacts artifacts: '*.txz', followSymlinks: false
                }
            }
        }        
        stage("Install libvirt_python") {
            steps {
                sh "source libvirt_python/libvirt_python.info; sudo installpkg libvirt_python-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }     

        stage('Build virt-manager') {
            steps {
                sh 'make virt-manager'
            }
            post {
                success {
                    archiveArtifacts artifacts: '*.txz', followSymlinks: false
                }
            }
        }        



    }
}

