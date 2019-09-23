timestamps{
    node('maven'){
       
        stage('Checkout'){
           // checkout scm
           checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/feitais/gs-spring-boot.git']]])
        }
        stage('Cleanup'){
            sh 'kubectl delete all -l app=maven -n maven-test'
         }
        stage ('Create PVC') {
            sh 'kubectl apply -f gs-spring-boot-persistent-volume-claim.yml -n maven-test'
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
            sh 'docker build . -t k8s-images/gs-spring-boot:latest'
            //sh 'docker run -it -p 8080:8080 k8s-images/gs-spring-boot:latest'
            withDockerRegistry(credentialsId: 'nexus_oci', url: 'http://cicdtools.oracle.msdigital.pro:8081')  {
                sh 'docker push k8s-images/gs-spring-boot:latest'
            }
        }
        
        stage('Deploy oc'){
            sh 'kubectl run gs-spring-boot --image=cicdtools.oracle.msdigital.pro:8081:k8s-images/gs-spring-boot:latest --port 8080'        
        }
        stage('Expose Route'){
            //sh 'oc expose svc/maven-spring -n maven-test'
            sh 'kubectl expose deployment gs-spring-boot --type=LoadBalancer --name=gs-spring-boot'
        }
    }
}
