# Dockerfile Setup Guide

1. **Create a New File**: In your terminal/text editor/IDE, make a new file named `Dockerfile`.

2. **Use Ubuntu as Base Image**: If you are using Windows Subsystem for Linux (WSL), use the following command as your first command:
    ```Dockerfile
    FROM ubuntu:latest
    ```

3. **Install Dependencies**: To install dependencies, use the following command:
    ```Dockerfile
    RUN apt-get update && \
        apt-get install -y \
        <dependency1> \
        <dependency2>
    ```

4. **Clone a Repository**: To clone a repository, use the following command (replace `<url>` with the actual URL):
    ```Dockerfile
    RUN git clone <url>
    ```

5. **Set Working Directory**: Use the `WORKDIR` command to set the working directory:
    ```Dockerfile
    WORKDIR /full/path/to/directory
    ```

6. **Run Python Files**: To run a Python file with Python 3, use the following command:
    ```Dockerfile
    RUN python3 ./<filename>
    ```

7. **Execute Commands**: Use the `RUN` directive to execute commands within the Docker container.

8. **Final Command/Layer**: For the final command or layer before the container launches, use the `CMD` directive. It can take an argument array:
    ```Dockerfile
    CMD ["command"]
    ```
9. **Building the Image**: In terminal, execute build and then :
   ```docker build -t <tag_name> .
   ```

   ```docker tag <tag_name> <dockerhub_username>/<repo>:<tag_name>
   ```
10. **Push to DockerHub**: Push to your repository:
    ```docker push <dockerhub_username>/<repo>:<tag_name>```
