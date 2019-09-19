timestamps{
    node('maven'){
       
        stage('Checkout'){
           // checkout scm
           checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/feitais/gs-spring-boot.git']]])
        }
        stage('Cleanup'){
            sh 'oc delete all -l app=maven -n maven-test'
         }
        stage ('Create PVC') {
            sh 'oc apply -f glusterfs-dyn-pvc.yaml -n maven-test'
        }
        stage('Build'){
            sh 'mvn clean install'
        }
        stage('Code Quality'){
            withSonarQubeEnv('SonarQube') { 
                sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.6.0.1398:sonar'
            }
        }
        stage('Quality gate'){
            timeout(activity: true, time: 15, unit: 'SECONDS') {
                sleep(10)
                def qg = waitForQualityGate()
                if (qg.status != 'OK') {
                    error "Pipeline aborted due to quality gate failure: ${qg.status}"
                }
            }
        }
        stage('Build oc'){
            sh 'oc new-build --name=maven-spring openshift/java --binary=true -l app=maven -n maven-test'
            sh 'oc start-build maven-spring --from-dir=target --follow -n maven-test'
        }
        stage('Deploy oc'){
            sh 'oc new-app maven-spring -n maven-test -l app=maven'
            sh 'oc set volume dc/maven-spring --add --name=volume-log -t persistentVolumeClaim --mount-path=/logs --claim-name log -n maven-test'
        }
        stage('Expose Route'){
            //sh 'oc expose svc/maven-spring -n maven-test'
            sh 'oc create route edge maven-spring --insecure-policy=Redirect --service=maven-spring -n maven-test'
        }
    }
}