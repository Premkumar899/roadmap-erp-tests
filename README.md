# RoadMap ERP Test Automation Suite

This project contains the test automation suites, page object locators, common action functions, and test data for RoadMap ERP.

## Key Features

- **Dual Framework Resolution**:
  - **In-Project Local Repository (`lib/`)**: Self-contained zero-dependency setup. Works offline instantly on any computer without requiring GitHub tokens or Maven installs.
  - **GitHub Packages (`roadmap-framework`)**: Can also fetch updates from `https://maven.pkg.github.com/Premkumar899/roadmap-framework` when credentials are configured.
- **Offline M2 Installer**: Includes `install-framework-to-m2.bat` for quick 1-click installation to your local `.m2` repository and IDE cache.
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
