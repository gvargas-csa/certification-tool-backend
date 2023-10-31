#! /usr/bin/env sh

 #
 # Copyright (c) 2023 Project CHIP Authors
 #
 # Licensed under the Apache License, Version 2.0 (the "License");
 # you may not use this file except in compliance with the License.
 # You may obtain a copy of the License at
 #
 # http://www.apache.org/licenses/LICENSE-2.0
 #
 # Unless required by applicable law or agreed to in writing, software
 # distributed under the License is distributed on an "AS IS" BASIS,
 # WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 # See the License for the specific language governing permissions and
 # limitations under the License.

# Let the DB start
python ./app/backend_pre_start.py

# Run migrations
alembic upgrade head

# Create initial data in DB
python ./app/initial_data.py

# Update SDK Tests (YAML and Python Tests)
./test_collections/sdk_tests/fetch_sdk_tests_and_runner.sh