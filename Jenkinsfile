pipeline {
  agent any
  stages {
    stage('Checkout Code') {
      steps {
        git(url: 'https://github.com/qutubsha/ProcessInPractice.git', branch: 'master')
      }
    }
    stage('Restore Packages') {
      steps {
        bat 'bat \'nuget restore ProccessInPractice.sln\''
      }
    }
  }
}