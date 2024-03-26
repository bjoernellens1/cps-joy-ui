# start with ros2 humble image and install dependencies

FROM ros:humble
# Update the package repository
RUN apt-get update && apt-get upgrade -y

# Install necessary packages
RUN apt-get install -y \
    build-essential \
    cmake \
    git \
    python3-pip \
    python3-rosdep \
    curl

# install rosbridge-suite
RUN apt-get install -y ros-humble-rosbridge-suite

# Install Node.js and npm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash \
    && export NVM_DIR="$HOME/.nvm" \
    && [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" \
    && nvm install 20 \
    && nvm use 20 \
    && node -v \
    && npm -v

    
RUN rosdep update

# Clone your project
# WORKDIR /home/bjoern/git/cps_joy_ui
# RUN git clone https://github.com/yourusername/yourproject.git .

# Install dependencies
# RUN rosdep install --from-paths src --ignore-src -r -y

# Build the project
# RUN /bin/bash -c '. /opt/ros/humble/setup.bash; colcon build'

WORKDIR /work
# add entrypint and command
CMD ["ros2", "launch", "cps_joy_ui", "cps_joy_ui.launch.py"]

