## Setup Instructions
### Prerequisites

Before proceeding, ensure that you're already familiar how [foss.crave.io](https://foss.crave.io) works and the original [workflow](https://github.com/sounddrill31/crave_aosp_builder).

### Steps

1. **Fork this repository.**

2. **Configure Repository Secrets:**
   - Go to `Settings -> Security -> Secrets and Variables -> Actions`.
   - Get your Crave's username and authentication token from `crave.conf` on foss.crave.io.
   - Create the following Repository Secrets:
     - `CRAVE_USERNAME`: Your crave username from `crave.conf`.
     - `CRAVE_TOKEN`: Your authentication token from `crave.conf`.

3. **Set Workflow Permissions:**
   - Go to `Settings -> Code and Automation -> Actions -> General`.
   - Set "Workflow Permissions" to **Read and Write Permissions** and save.
     - If this option is greyed out and you're working within a GitHub Organization:
       - Navigate to `Organization settings -> Code, planning, and automation -> Actions -> General -> Workflow permissions` and set it to **Read and Write Permissions**.

## Setting Up the Runner (If Not Already Done)

1. **Access the Runner Setup:**
   - In the repository's top menu bar, click on `Actions`.
   - Select `Self-Hosted Runner -> New Runner`.
   - Scroll down and copy the Runner Token.

2. **Create a Self-Hosted Runner:**
   - Go back to `Actions`, and select "Create Self-Hosted Runner".
   - Run the workflow and enter your Runner Token.
     - Ensure there are no extra spaces before or after the token.

3. **Start the Workflow:**
   - If the runner is still offline, trigger the "Start/Restart Self-Hosted Runner" workflow to force-restart the runner.

## Starting a Build

1. **Create Your Build Script:**
   - Inside the repository's `scripts` folder, create your build script with your preferred name.
   - Add all build commands in the correct order (assuming you're already familiar with AOSP compilation).

2. **Run the Workflow:**
   - In the repository's top menu bar, click on `Actions`.
   - On the left side, select "Build in Crave.io".
   - On the right side, select "Run workflow".
     - Choose the base project.
     - If your ROM isn't listed, select the closest project and `repo init` the ROM manifest within your build script (refer to existing scripts).
     - Enter your device codename and the build script to use (located in the `scripts` folder).

3. **Execute the Workflow:**
   - Run the workflow.

## Important Information

- **Dirty Builds:** If you wish to perform a dirty build after a successful one, **DO NOT CHANGE THE BASE PROJECT**! Ensure you're using the same project where the initial successful build is.
  
- **Release Limits:** Due to GitHub's 2GB per file limit on releases, if your compiled ROM zip is below 2GB, it will be uploaded to this repository's release page. If it exceeds 2GB, it will remain in your devspace for you to upload elsewhere. (Go to foss.crave.io to log in to your devspace)

- **Compiled Objects:** **DO NOT START ANOTHER BUILD WITHOUT SECURING THE COMPILED OBJECTS FROM THE PREVIOUS BUILD**! (Upload or move it out of the build directory) Compiled objects will be pulled to devspace but deleted upon starting another build to avoid clogging devspace storage.
  - Objects that will be pulled to devspace are:
    - PATH=out/target/product/device/
      - recovery.img
      - boot.img
      - changelog.txt and json (if it exists)
    - PATH=main directory of build dir
      - ROM.zip
      - ROM hash (ROM.md5sum ROM.sha256sum)
    (If you need more than that, edit the workflow)
