pipeline {
    agent any 
	
	tools{
		maven 'apache-maven-3.5.2'
		jdk 'java-sdk-1.8'
	}
    stages {
        stage('Build') { 
            steps {
				sh 'cd Tomcat'
				sh 'mvn clean compile assembly:single'	
				sh 'mvn package'			
            }
        }
        stage('Test'){
            steps {
				sh 'cd Tomcat'
                sh 'maven test'
            }
        }
        stage('Deploy') {
            steps {
				sh 'cd Tomcat'
                sh 'java -jar target/lsd-app-1.0-SNAPSHOT-jar-with-dependencies.jar'
            }
        }
    }
}