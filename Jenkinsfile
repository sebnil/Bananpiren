node('unity3d') {
	stage('Checkout') {
		checkout scm
		bat 'git submodule update --init'
	}
	stage('Build') {
    bat 'build.bat'
	}
	stage('Archive') {
		archive 'bin'
		archive "${LOCALAPPDATA}/Unity/Editor/Editor.log"
	}
}
