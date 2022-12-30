## mCODE Testing IG

[Current Build (Public)](https://karlnaden.github.io/mCODE-testing-ig/)  

### Prerequisites 

```bash 
# install the sushi tool
git clone https://github.com/FHIR/sushi
npm install -g fsh-sushi
sushi --help
```

### Getting the Documentation    

```shell
# get a copy of the source code
git clone https://github.com/karlnaden/mCODE-testing-ig
cd mCODE-testing-ig
```

### Compiling Documentation  

```bash 
# update the publisher
./_updatePublisher.sh

# then compile the document
./_genonce.sh

# open the documentation (assuming Mac + Chrome)
cd output
open -a "Google Chrome" index.html
```

### Contributing  

```shell
# check which branch you are on
git branch

# create a new branch
git checkout -b new-branch

# commit changes
git commit -a -m 'descriptive message'
git push origin new-branch
```

## License
Copyright 2022 The MITRE Corporation

Licensed under the Apache License, Version 2.0 (the "License"); you may not use
this file except in compliance with the License. You may obtain a copy of the
License at
```
http://www.apache.org/licenses/LICENSE-2.0
```
Unless required by applicable law or agreed to in writing, software distributed
under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
CONDITIONS OF ANY KIND, either express or implied. See the License for the
specific language governing permissions and limitations under the License.