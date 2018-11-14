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
        bat 'nuget restore ProccessInPractice.sln'
      }
    }
    stage('Initiate SonarQube Analysis') {
      steps {
        bat 'D:\\Utilities\\SonarQube\\sonar-scanner-msbuild-4.3.1.1372-net46\\SonarScanner.MSBuild.exe  begin /k:"ProcessInPractise_Key"'
      }
    }
    stage('Build') {
      steps {
        bat '"C:\\Program Files (x86)\\MSBuild\\14.0\\Bin\\MSBuild.exe" ProccessInPractice.sln /t:Build /m'
      }
    }
    stage('End SonarQube Analysis') {
      steps {
        bat 'D:\\Utilities\\SonarQube\\sonar-scanner-msbuild-4.3.1.1372-net46\\SonarScanner.MSBuild.exe  end'
      }
    }
    stage('Unit Test Execution') {
      steps {
        bat '"C:\\Program Files (x86)\\NUnit.org\\nunit-console\\nunit3-console.exe" ProccessInPractice/bin/ProccessInPractice.dll'
      }
    }
    stage('Email') {
      steps {
        mail(subject: '$DEFAULT_SUBJECT', body: '$DEFAULT_CONTENT', from: 'qutub.sha@gmail.com', replyTo: '$DEFAULT_REPLYTO', to: '$DEFAULT_RECIPIENTS', mimeType: 'text/html')
      }
    }
  }
  post {
    changed {
      script {
        if (currentBuild.currentResult == 'SUCCESS') { // Other values: SUCCESS, UNSTABLE, FAILURE
        // Send an email only if the build status has changed from green/unstable to red
        emailext subject: '$DEFAULT_SUBJECT',
        body: '$DEFAULT_CONTENT',
        recipientProviders: [
          [$class: 'CulpritsRecipientProvider'],
          [$class: 'DevelopersRecipientProvider'],
          [$class: 'RequesterRecipientProvider']
        ],
        replyTo: '$DEFAULT_REPLYTO',
        to: '$DEFAULT_RECIPIENTS'
      }
    }


  }

}
}