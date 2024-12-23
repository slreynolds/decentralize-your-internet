pipeline {
    agent any
    environment {
        DOCKER_COMPOSE_PATH = "/home/cloudy/infra/nextcloud"
    }
    stages {
        stage('Checkout Directory') {
            steps {
                script {
                    dir(env.DOCKER_COMPOSE_PATH) {
                        echo "Navigated to ${env.DOCKER_COMPOSE_PATH}"
                    }
                }
            }
        }
        stage('Pull Latest Containers') {
            steps {
                script {
                    dir(env.DOCKER_COMPOSE_PATH) {
                        sh 'docker-compose pull'
                    }
                }
            }
        }
        stage('Recreate and Restart Containers') {
            steps {
                script {
                    dir(env.DOCKER_COMPOSE_PATH) {
                        sh 'docker-compose down'
                        sh 'docker-compose up -d'
                    }
                }
            }
        }
    }
    post {
        success {
            echo "Pipeline completed successfully."
        }
        failure {
            echo "Pipeline failed. Please check the logs."
        }
    }
}
