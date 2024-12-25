pipeline {
    agent any

    stages {

        stage('Docker Compose Operations') {
            steps {
                    // Perform docker-compose commands
                    sh '''
                        docker exec -u www-data cloudy_app_nextcloud php cron.php
                    '''
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution complete.'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
