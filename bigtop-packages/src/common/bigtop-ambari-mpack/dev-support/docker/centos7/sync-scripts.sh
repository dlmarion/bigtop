#!/bin/bash

# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

echo -e "\033[32mSynchronizing script to ambari-server\033[0m"
docker exec ambari-server bash -c "mkdir -p /var/lib/ambari-agent/cache/stacks/BGTP/1.0/services/"
docker cp ../../../bgtp-ambari-mpack/src/main/resources/stacks/BGTP/1.0/services/ ambari-server:/var/lib/ambari-agent/cache/stacks/BGTP/1.0/
docker cp ../../../bgtp-ambari-mpack/src/main/resources/stacks/BGTP/1.0/services/ ambari-server:/var/lib/ambari-server/resources/mpacks/bgtp-ambari-mpack-1.0.0.0-SNAPSHOT/stacks/BGTP/1.0/

echo -e "\033[32mSynchronizing script to ambari-agent-01\033[0m"
docker exec ambari-agent-01 bash -c "mkdir -p /var/lib/ambari-agent/cache/stacks/BGTP/1.0/services/"
docker cp ../../../bgtp-ambari-mpack/src/main/resources/stacks/BGTP/1.0/services/ ambari-agent-01:/var/lib/ambari-agent/cache/stacks/BGTP/1.0/

echo -e "\033[32mSynchronizing script to ambari-agent-02\033[0m"
docker exec ambari-agent-02 bash -c "mkdir -p /var/lib/ambari-agent/cache/stacks/BGTP/1.0/services/"
docker cp ../../../bgtp-ambari-mpack/src/main/resources/stacks/BGTP/1.0/services/ ambari-agent-02:/var/lib/ambari-agent/cache/stacks/BGTP/1.0/

echo -e "\033[32mDone!\033[0m"