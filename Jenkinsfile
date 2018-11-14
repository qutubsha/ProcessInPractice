pipeline {
  agent {
    node {
      label 'MyNode'
    }

  }
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
    stage('Notification') {
      steps {
        emailext(subject: '$DEFAULT_SUBJECT', body: '$DEFAULT_CONTENT', from: 'kutbuddin.s@sigmainfo.net', attachLog: true, mimeType: 'HTML', to: 'kandarp.j@sigmainfo.net,kutbuddin.s@sigmainfo.net,nilesh.p@sigmainfo.net', replyTo: 'kutbuddin.s@sigmainfo.net')
      }
    }
  }
}