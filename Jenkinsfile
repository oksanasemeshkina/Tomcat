pipeline {
    agent any 
	
	tools{
		maven 'apache-maven-3.5.2'
		jdk 'java-sdk-1.8'
	}
    stages {
        stage('Build') { 
            steps {
				sh 'cd Tomcat && mvn clean compile assembly:single'	
				sh 'cd Tomcat && mvn package'			
            }
        }
        stage('Test'){
            steps {
                sh 'cd Tomcat && maven test'
            }
        }
        stage('Deploy') {
            steps {
                sh 'cd Tomcat && java -jar target/lsd-app-1.0-SNAPSHOT-jar-with-dependencies.jar'
            }
        }
    }
}