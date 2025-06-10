pipeline {
    agent any
    // agent { label 'amz-linux' }
    // required plugins
    //      1. git
    //      2. github
    //      3. Pipeline: Stage ViewVersion
    //      4. cross platform shell
    stages {
        stage('Stage Test1') {
            steps {
                echo 'Hello World'
                sh 'pwd'
                sh 'ls -l'

                // scripting
                script {
                    currentBuild.displayName = "The displayName."
                    currentBuild.description = "The description."
                    def aaa = "aaa"
                    echo aaa
                }
            }
        }
        stage('Stage Docker Build') {
            steps {
                sh '''
                pwd
                ls -l
                docker ps
                docker build -t xjplus/local-test:$BUILD_NUMBER .
                '''
            }
        }
    }
    post {
        always {
            echo 'always'
        }
        success {
            echo 'success'
        }
        failure {
            echo 'failure'
        }
        unstable {
            echo 'unstable'
        }
        changed {
            echo 'changed'
        }
    }
}
