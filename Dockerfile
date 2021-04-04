FROM ros:melodic-ros-base

RUN apt-get update && apt-get install -y \
    git \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*



# RUN apt-get update && apt-get -y install \
#     gosu \
#  && apt-get clean \
#  && rm -rf /var/lib/apt/lists/*    

# # 各環境変数を設定
# ENV USER tester
# ENV HOME /home/${USER}
# ENV SHELL /bin/bash

# # 一般ユーザーアカウントを追加
# RUN useradd -m ${USER}
# # 一般ユーザーにsudo権限を付与
# RUN gpasswd -a ${USER} sudo
# # 一般ユーザーのパスワード設定
# RUN echo "${USER}:test_pass" | chpasswd

# COPY entrypoint.sh /usr/local/bin/entrypoint.sh
# RUN chmod +x /usr/local/bin/entrypoint.sh
# ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# # 以降のRUN/CMDを実行するユーザー
# USER ${USER}
# # 以降の作業ディレクトリを指定
# WORKDIR ${HOME}
WORKDIR /home
# RUN git clone https://github.com/ron0401/ndt.git

# RUN mkdir -p /home/ros_catkin_ws/src && \
# 	cd /home/ros_catkin_ws/src && \
# 	/bin/bash -c "source /opt/ros/melodic/setup.bash; catkin_init_workspace" && \
# 	cd /home/ros_catkin_ws && \
# 	/bin/bash -c "source /opt/ros/melodic/setup.bash; catkin_make" && \
# 	echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc && \
# 	echo "source /home/ndt/devel/setup.bash" >> ~/.bashrc && \
# 	echo "export ROS_PACKAGE_PATH=\${ROS_PACKAGE_PATH}:/home/ros_catkin_ws" >> ~/.bashrc && \
# 	echo "export ROS_MASTER_URI=http://172.29.176.156:11311" >> ~/.bashrc && \
# 	echo "export ROS_WORKSPACE=/home/ros_catkin_ws" >> ~/.bashrc
RUN apt-get update && apt-get install -y \
    ros-melodic-tf-conversions \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    ros-melodic-autoware-* \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    ros-melodic-jsk-rviz-plugins \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    ros-melodic-roslint \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    ros-melodic-tf\ 
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    ros-melodic-velodyne \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*


RUN apt-get update && apt-get install -y \
    ros-melodic-tf2-geometry-msgs \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# RUN apt-get update && apt-get install -y \
#     ros-melodic-tf-conversions \
#     ros-melodic-autoware-* \
#     ros-melodic-jsk-rviz-plugins \
#     ros-melodic-roslint \
#     ros-melodic-tf\ 
#     # libpcl-* \
#     ros-melodic-velodyne \
#  && apt-get clean \
#  && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/ron0401/ndt.git && \
    cd /home/ndt && \
 	/bin/bash -c "source /opt/ros/melodic/setup.bash; catkin_make" && \
	echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
	# echo "source /home/ndt/devel/setup.bash" >> ~/.bashrc
# 	echo "export ROS_PACKAGE_PATH=\${ROS_PACKAGE_PATH}:/home/ros_catkin_ws" >> ~/.bashrc && \
# 	echo "export ROS_MASTER_URI=http://172.29.176.156:11311" >> ~/.bashrc && \
	# echo "export ROS_WORKSPACE=/home/ndt" >> ~/.bashrc && \
	# /bin/bash -c "source /home/ndt/install/setup.bash"
    # rm -rf /home/ndt

######### initial position ##########
# WORKDIR /home/ndt

# ENV ROS_MASTER_URI=http://localhost:11311/

CMD /bin/bash -c "source /home/ndt/devel/setup.bash; roslaunch lidar_localizer ndt_matching.launch"
# CMD /bin/bash -c "source ros/melodic/setup.bash; roslaunch lidar_localizer ndt_matching.launch"