allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

subprojects {
    project.evaluationDependsOn(":app")
}

subprojects {
    val configureAndroid = {
        val android = extensions.findByName("android")
        if (android != null) {
            // Fix namespace for isar_flutter_libs
            if (name == "isar_flutter_libs") {
                try {
                    val setNamespace = android.javaClass.getMethod("setNamespace", String::class.java)
                    setNamespace.invoke(android, "dev.isar.isar_flutter_libs")
                } catch (e: Exception) {
                    println("Failed to set namespace for ${name}: ${e.message}")
                }
            }
            
            // Force compileSdk and targetSdk to 36
            try {
                val setCompileSdkVersion = android.javaClass.getMethod("setCompileSdkVersion", Int::class.java)
                setCompileSdkVersion.invoke(android, 36)
                
                val defaultConfig = android.javaClass.getMethod("getDefaultConfig").invoke(android)
                val setTargetSdkVersion = defaultConfig.javaClass.getMethod("setTargetSdkVersion", Int::class.java)
                setTargetSdkVersion.invoke(defaultConfig, 36)
            } catch (e: Exception) {
                println("Failed to update SDK version for ${name}: ${e.message}")
            }
        }
    }

    if (state.executed) {
        configureAndroid()
    } else {
        afterEvaluate { configureAndroid() }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
