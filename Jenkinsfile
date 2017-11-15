pipeline {
    agent any 
	
	tools{
		maven 'apache-maven-3.5.2'
	}
    stages {
        stage('Build') { 
            steps { 
				sh 'mvn clean compile assembly:single'
				sh 'mvn package' 
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