node('unity3d') {
	stage('Checkout') {
		checkout scm
		bat 'git submodule update --init'
	}
	stage('Build') {
		try {
    	bat 'build.bat'
		}
		catch (error) {
			throw error
		}
		finally {
			archive "${LOCALAPPDATA}/Unity/Editor/Editor.log"
		}
	}
	stage('Archive') {
		archive 'bin'
		archive "${LOCALAPPDATA}/Unity/Editor/Editor.log"
	}
}
