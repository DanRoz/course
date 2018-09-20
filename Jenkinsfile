node {
   def mvnHome
   stage('Preparation') { // for display purposes
      // Get some code from a GitHub repository
      git 'https://github.com/DanRoz/course.git'
      // Get the Maven tool.
      // ** NOTE: This 'M3' Maven tool must be configured
      // **       in the global configuration.           
      mvnHome = tool 'M3'
   }
   stage('Build') {
      // Run the maven build
      if (isUnix()) {
         sh "${mvnHome}/bin/mvn -Dmaven.test.failure.ignore clean package"
      } else {
         bat(/"${mvnHome}\bin\mvn" -Dmaven.test.failure.ignore clean package/)
      }
   }
   
   stage('Check existence') {
      sh 'ls -ltr ~/workspace/test/web/target/*.war'
      sh 'cp ~/workspace/test/web/target/*.war $(pwd)'
   }
   
   stage('Create Docker image') {
      checkout scm
      sh 'docker build -t danroz/time-tracker .'
   }
   
   stage('Ansible push image to nexus') {
      checkout scm
      sh 'ansible-playbook docker_push_playbook.yml'
   }
   
   stage('Ansible pull and run image') {
      checkout scm
      sh 'ansible-playbook docker_pull_run_playbook.yml'
   }
}
