timestamps{
    node('maven'){
       
        stage('Checkout'){
            checkout scm
            //checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/feitais/gs-spring-boot.git']]])
        }
        stage('Cleanup'){
            sh 'oc delete all -l app=maven -n maven-test'
        }
        stage('Compile'){
            sh 'mvn clean install'
        }
        stage('Build'){
            sh 'oc new-build --name=maven-spring openshift/java --binary=true -l app=maven -n maven-test'
            sh 'oc start-build maven-spring --from-dir=target --follow -n maven-test'
        }
        stage('Deploy'){
            sh 'oc new-app maven-spring -n maven-test -l app=maven'
        }
        stage('Expose'){
            sh 'oc expose svc/maven-spring -n maven-test'
        }
    }
}
