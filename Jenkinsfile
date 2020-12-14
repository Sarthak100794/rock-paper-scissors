pipeline {
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

                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }

            post {
                // If Maven was able to run the tests, even if some of the test
                // failed, record the test results and archive the jar file.
                success {
                    git url: 'https://github.com/viglesiasce/sample-app'
                step([$class: 'KubernetesEngineBuilder', 
                        projectId: "practical-case-298304",
                        clusterName: "cluster-1",
                        zone: "us-central1-c",
                        manifestPattern: 'src/',
                        credentialsId: "practical-case-298304",
                        verifyDeployments: false])
                    echo "Pipeline has been successfully completed"
                }
            }
        }
    }
}
