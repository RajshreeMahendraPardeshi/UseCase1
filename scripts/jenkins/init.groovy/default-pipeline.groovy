import jenkins.model.*
import hudson.security.*

def env = System.getenv()

def jenkins = Jenkins.getInstance()
if(!(jenkins.getSecurityRealm() instanceof HudsonPrivateSecurityRealm))
    jenkins.setSecurityRealm(new HudsonPrivateSecurityRealm(false))

if(!(jenkins.getAuthorizationStrategy() instanceof GlobalMatrixAuthorizationStrategy))
    jenkins.setAuthorizationStrategy(new GlobalMatrixAuthorizationStrategy())

def user = jenkins.getSecurityRealm().createAccount(env.JENKINS_USER, env.JENKINS_PASS)
user.save()
jenkins.getAuthorizationStrategy().add(Jenkins.ADMINISTER, env.JENKINS_USER)

jenkins.save()
ubuntu@ip-10-0-14-108:~/IAC1/rajshree/jenkins_setup/ref/init.groovy.d$ cat default-pipeline.groovy
def jobDSL="""
pipeline {
  agent {
    docker {
      image 'hashicorp/terraform:light'
      args '--entrypoint='
    }
  }
  stages {
    stage('Terraform Plan') {
      steps {
        sh 'terraform plan -no-color -out=create.tfplan'
      }
    }
    // Optional wait for approval
    input 'Deploy stack?'

    stage ('Terraform Apply') {
      sh "terraform --version"
    }
  }
}


""";

def flowDefinition = new org.jenkinsci.plugins.workflow.cps.CpsFlowDefinition(jobDSL, true);
def parent = Jenkins.instance;
def job = new org.jenkinsci.plugins.workflow.job.WorkflowJob(parent, "testJob")
job.definition = flowDefinition
Jenkins.instance.reload()
