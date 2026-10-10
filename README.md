# RoadMap ERP Test Automation Suite

This project contains the test automation suites, page object locators, common action functions, and test data for RoadMap ERP.

## Key Features

- **Remote Framework Repository**: Consumes `roadmap-framework-1.0.0` from GitHub Packages remote repository (`https://maven.pkg.github.com/Premkumar899/roadmap-framework`).
- **Portability**: Managed cleanly via Maven central/remote repositories without local JAR dependencies.
- **Execution**: Can be executed via Eclipse TestNG runner or Maven CLI.

## Running Tests

### Via Eclipse IDE:
1. Open the `testsuites` folder.
2. Right-click on any suite file (e.g., `POM.xml`, `RoadMap.xml`, `E2E.xml`).
3. Select **Run As** > **TestNG Suite**.

### Via Command Line:
```bash
mvn clean test -DsuiteXmlFiles=testsuites/POM.xml -DplatformName=Chrome
```

For Headless mode:
```bash
mvn clean test -DsuiteXmlFiles=testsuites/POM.xml -DplatformName=headless
```
