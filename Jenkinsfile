stage('Source') {
  parallel 'centos6': {
    node {
      dir('centreon-web') {
        checkout scm
      }
      stash includes: 'centreon-web/xunit-reports/centos6/**', name: 'xunit-reports-centos6'
    }
  },
  'centos7': {
    node {
      dir('centreon-web') {
        checkout scm
      }
      stash includes: 'centreon-web/xunit-reports/centos7/**', name: 'xunit-reports-centos7'
    }
  }
  node {
    unstash 'xunit-reports-centos6'
    unstash 'xunit-reports-centos7'
    script {
      def testResults = findFiles(glob: 'centreon-web/xunit-reports/**/*.xml')
      for(xml in testResults) {
        touch xml.getPath()
      }
    }
    step([
      $class: 'XUnitBuilder',
      thresholds: [
        [$class: 'FailedThreshold', failureThreshold: '0'],
        [$class: 'SkippedThreshold', failureThreshold: '0']
      ],
      tools: [[$class: 'PHPUnitJunitHudsonTestType', pattern: 'centreon-web/xunit-reports/**/*.xml']]
    ])
  }
}
if ((currentBuild.result ?: 'SUCCESS') != 'SUCCESS') {
  error('Critical tests stage failure.');
}
