pipeline {
    environment { 
        registry = "sart1007/firstregistery" 
        registryCredential = 'dockerhub_id' 
        dockerImage = '' 
    }
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "M3"
    }

    stages {
        stage('Build') {
            steps {
                // Get some code from a GitHub repository
                git branch: 'patch-1', url: 'https://github.com/Sarthak100794/rock-paper-scissors'

                // Run Maven on a Unix agent.
                sh "mvn clean package"
                sh "cat /var/jenkins_home/secrets/master.key"
                script {
                     dockerImage = docker.build registry
                      }

                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }

            post {
                // If Maven was able to run the tests, even if some of the test
                // failed, record the test results and archive the jar file.
                success {
                    git branch: 'patch-1', url: 'https://github.com/Sarthak100794/rock-paper-scissors'
                step([$class: 'KubernetesEngineBuilder', 
                        projectId: "practical-case-298304",
                        clusterName: "cluster-1",
                        zone: "us-central1-c",
                        manifestPattern: 'deployment.yaml',
                        credentialsId: "gke",
                        verifyDeployments: false])
                    echo "Pipeline has been successfully completed"
                }
            }
        }
    }
}
