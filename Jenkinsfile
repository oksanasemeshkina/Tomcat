pipeline {
    agent any 
	
	tools{
		maven 'apache-maven-3.5.2'
		jdk 'java-sdk-1.8'
	}
    stages {
        stage('Build') { 
            steps {
				sh 'cd Tomcat && mvn clean compile'			
            }
        }
        stage('Test'){
            steps {
                sh 'cd Tomcat && maven test'
            }
        }
        stage('Deploy') {
            steps {
                sh 'cd Tomcat && mvn assembly:single'
            }
			post {
                success {
                    archiveArtifacts(artifacts: 'Tomcat/target/*.jar', allowEmptyArchive: true)
                }
            }
        }
    }
}