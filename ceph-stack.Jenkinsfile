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

        stage("Build pyo3-subint (no package output)") {
            steps {
                sh "sudo rm -rf /tmp/SBo/pyo3-?.??.?*"
                sh "make pyo3-subint"
            }
        }
        
        stage("Build bcrypt-subint") {
            steps {
                sh "make bcrypt-subint"
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', fingerprint: true, allowEmptyArchive: true)
                }
            }
        }    
    
        stage("Install bcrypt-subint") {
            steps {
                sh "source bcrypt-subint/bcrypt-subint.info; sudo installpkg bcrypt-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }
        
        stage("Build cryptography-subint") {
            steps {
                sh "make cryptography-subint"
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', fingerprint: true, allowEmptyArchive: true)
                }
            }
        }    
    
        stage("Install cryptography-subint") {
            steps {
                sh "source cryptography-subint/cryptography-subint.info; sudo installpkg cryptography-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }
        
        stage("Install additional Python packages") {
            steps {
                // These need to be installed system-wide
                sh "sudo pip install scipy cherrypy jsonpatch python-dateutil prettytable jmespath xmltodict pyOpenSSL Routes"
            }
        }
        stage("Build rdma-core") {
            steps {
                sh "make rdma-core"
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', fingerprint: true, allowEmptyArchive: true)
                }
            }
        }    
    
        stage("Install rdma-core") {
            steps {
                sh "source rdma-core/rdma-core.info; sudo installpkg rdma-core-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }

        stage("Build libnbd") {
            steps {
                sh "make libnbd"
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', fingerprint: true, allowEmptyArchive: true)
                }
            }
        }    
    
        stage("Install libnbd") {
            steps {
                sh "source libnbd/libnbd.info; sudo installpkg libnbd-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }
        stage("Build googletest") {
            steps {
                sh "make googletest"
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', fingerprint: true, allowEmptyArchive: true)
                }
            }
        }    
    
        stage("Install googletest") {
            steps {
                sh "source googletest/googletest.info; sudo installpkg googletest-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }
        
        stage("Build benchmark") {
            steps {
                sh "make benchmark"
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', fingerprint: true, allowEmptyArchive: true)
                }
            }
        }    
    
        stage("Install benchmark") {
            steps {
                sh "source benchmark/benchmark.info; sudo installpkg benchmark-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }
        stage("Build snappy-rtti") {
            steps {
                sh "make snappy-rtti"
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', fingerprint: true, allowEmptyArchive: true)
                }
            }
        }    
    
        stage("Install snappy-rtti") {
            steps {
                sh "source snappy-rtti/snappy-rtti.info; sudo installpkg snappy-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }        
        stage("Build oath-toolkit") {
            steps {
                sh "make oath-toolkit"
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', fingerprint: true, allowEmptyArchive: true)
                }
            }
        }    
    
        stage("Install oath-toolkit") {
            steps {
                sh "source oath-toolkit/oath-toolkit.info; sudo installpkg oath-toolkit-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
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

        stage("Build lttng-ust") {
            steps {
                sh "make lttng-ust"
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', fingerprint: true, allowEmptyArchive: true)
                }
            }
        }    
    
        stage("Install lttng-ust") {
            steps {
                sh "source lttng-ust/lttng-ust.info; sudo installpkg lttng-ust-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }

        stage("Build babeltrace") {
            steps {
                sh "make babeltrace"
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', fingerprint: true, allowEmptyArchive: true)
                }
            }
        }    
    
        stage("Install babeltrace") {
            steps {
                sh "source babeltrace/babeltrace.info; sudo installpkg babeltrace-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }


        stage("Build boost") {
            steps {
                sh "make boost"
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', fingerprint: true, allowEmptyArchive: true)
                }
            }
        }    
    
        stage("Install boost") {
            steps {
                sh "source boost/boost.info; sudo installpkg boost-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }        
                stage("Build thrift") {
            steps {
                sh "make thrift"
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', fingerprint: true, allowEmptyArchive: true)
                }
            }
        }    
    
        stage("Install thrift") {
            steps {
                sh "source thrift/thrift.info; sudo installpkg thrift-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }     

        stage("Build rabbitmq-c") {
            steps {
                sh "make rabbitmq-c"
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', fingerprint: true, allowEmptyArchive: true)
                }
            }
        }    
    
        stage("Install rabbitmq-c") {
            steps {
                sh "source rabbitmq-c/rabbitmq-c.info; sudo installpkg rabbitmq-c-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }  
        stage("Build librdkafka") {
            steps {
                sh "make librdkafka"
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', fingerprint: true, allowEmptyArchive: true)
                }
            }
        }    
    
        stage("Install librdkafka") {
            steps {
                sh "source librdkafka/librdkafka.info; sudo installpkg librdkafka-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }   
    
        stage("Build ceph") {
            steps {
                sh "make ceph"
            }
            post {
                success {
                    archiveArtifacts(artifacts: '*.txz', fingerprint: true, allowEmptyArchive: true)
                }
            }
        }    
        stage("Install ceph") {
            steps {
                sh "source ceph/ceph.info; sudo installpkg ceph-\${VERSION}-\${ARCH}-\${BUILD}\${TAG}.\${PKGTYPE};"
            }
        }     
        
    }
}
