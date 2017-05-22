node('unity3d') {
	stage('Checkout') {
		checkout scm
		bat 'git submodule update --init'
	}
	stage('Build') {
		def r = 1
		try {
			echo 'try bat build.bat..'
			r = bat returnStatus: true, script: 'build.bat'
			echo "r: ${r}"
		}
		catch (error) {
			echo "catching error.."
		}
		finally {
			echo 'finally'
			archive "README.md"
			archive "C:/Users/Administrator/AppData/Local/Unity/Editor/Editor.log"
		}

		if (r != 0) {
			throw error
		}
	}
	stage('Archive') {
		archive "bin/**/*.zip"
	}
}
