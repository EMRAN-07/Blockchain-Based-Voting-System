#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#

#!/bin/bash


sudo apt update
sudo apt install apt-transport-https curl gnupg -y
sudo apt-get install protobuf-compiler -y
sudo apt-get install rapidjson-dev -y

curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor > bazel.gpg
sudo mv bazel.gpg /etc/apt/trusted.gpg.d/ 
echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
curl https://bazel.build/bazel-release.pub.gpg | sudo apt-key add -
sudo apt update && sudo apt install bazel=6.0.0 -y
sudo apt install clang-format -y
rm $PWD/.git/hooks/pre-push
ln -s $PWD/hooks/pre-push $PWD/.git/hooks/pre-push

bazel --version
ret=$?

if [[ $ret != "0" ]]; then

sudo apt-get install build-essential openjdk-11-jdk zip unzip -y
rm bazel-6.0.0-dist.zip
rm -rf bazel_build
wget wget https://releases.bazel.build/6.0.0/release/bazel-6.0.0-dist.zip
mkdir -p bazel_build
mv bazel-6.0.0-dist.zip bazel_build/
cd bazel_build

unzip bazel-6.0.0-dist.zip

export JAVA_HOME='/usr/lib/jvm/java-1.11.0-openjdk-arm64/'
env EXTRA_BAZEL_ARGS="--host_javabase=@local_jdk//:jdk" bash ./compile.sh
sudo cp output/bazel /usr/local/bin/
cd ..
rm -rf bazel_build

fi

# install buildifier
bazel build @com_github_bazelbuild_buildtools//buildifier:buildifier

sudo apt-get install python3.10-dev -y
sudo apt-get install python3-dev -y
