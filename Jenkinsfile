pipeline {
    agent any 
	
	tools{
		maven 'apache-maven-3.5.2'
		jdk 'java-sdk-1.8'
	}
    stages {
        stage('Build') { 
            steps {
				sh 'cd /Tomcat'
				sh 'mvn package'
				sh 'mvn clean compile assembly:single'				
            }
        }
        stage('Test'){
            steps {
                sh 'maven test'
            }
        }
        stage('Deploy') {
            steps {
                sh 'java -jar target/lsd-app-1.0-SNAPSHOT-jar-with-dependencies.jar'
            }
        }
    }
}