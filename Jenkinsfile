pipeline {
    environment { 
        registry = "sart1007/newrepo" 
        registryCredential = 'dockerhub' 
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
                script {
                           docker.withRegistry( '', registryCredential ) {
                                dockerImage.push()
                           }
                }    

                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }
            
        stage('Deploy_to_docker') {
            steps {
                // Get some code from a GitHub repository
                
                script {
                           docker.withRegistry( '', registryCredential ) {
                                dockerImage.push()
                           }
                }    

                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }
            
        stage('Deploy_to_k8s') {
            steps {
                // Get some code from a GitHub repository
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

                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }
            
            
        }
    

