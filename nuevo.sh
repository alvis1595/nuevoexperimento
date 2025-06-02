 git clone -b 24.3.0 https://github.com/ansible/awx.git
  107  cd awx/tools/docker-compose
  108  ls
  109  dnf install make
  110  make docker-compose-build
  111  ls
  112  cd ../../../
  113  ls Makefile
  114  ls
  115  cd awx/
  116  ls
  117  make docker-compose-build
  118  pip install ansible docker jinja2
  119  pip install ansible docker jinja2
  120  pip3 install ansible docker jinja2
  121  ansible-playbook tools/docker-compose/ansible/build.yml
  122  ls
  123  cat tools/docker-compose/ansible/sources.yml
  124  ansible-playbook tools/docker-compose/ansible/sources.yml
  125  cd /tesawx/awx/tools/docker-compose/ansible/../../../
  126  ls
  127  echo "24.3.0" > VERSION
  128  ansible-playbook tools/docker-compose/ansible/sources.yml
  129  ansible-playbook tools/docker-compose/ansible/sources.yml -e "execution_node_count=1 control_plane_node_count=1"
  130  ansible-playbook tools/docker-compose/ansible/sources.yml -e "execution_node_count=1 control_plane_node_count=1"
  131  ansible-playbook tools/docker-compose/ansible/sources.yml   -e "execution_node_count=1 control_plane_node_count=1 enable_tacacs=false enable_vault=false enable_ldap=false enable_keycloak=false enable_splunk=false"
  132  make docker-compose-build
  133  docker ps -a
  134  ls
  135  ls
  136  vim requirements/requirements.in
  137  vim requirements/requirements.txt
  138  ls
  139  tree requirements/
  140  grep -Rn "sqlparse" requirements/
  141  vim requirements/requirements.txt +470
  142  grep -Rn "sqlparse" requirements/
  143  vim requirements/requirements.in
  144  make docker-compose-build
  145  grep -Rn "pip" requirements/
  146  grep -Rn "django" requirements/
  147  vim requirements/requirements.in
  148  cd requirements/
  149  pip-compile requirements.in > requirements.txt
  150  pip3-compile requirements.in > requirements.txt
  151  pip3 install pip-tools
  152  pip-compile requirements.in > requirements.txt
  153  pip3-compile requirements.in > requirements.txt
  154  find / -name pip-compile 2>/dev/null
  155  /usr/local/bin/pip-compile requirements.in > requirements.txt
  156  pip index versions cryptography
  157  pip3 index versions cryptography
  158  vim requirements.in
  159  /usr/local/bin/pip-compile requirements.in > requirements.txt
  160  pip install Django==4.2.16 --dry-run
  161  pip3 install Django==4.2.16 --dry-run
  162  grep django requirements.in
  163  vim requirements.in
  164  /usr/local/bin/pip-compile requirements.in > requirements.txt
  165  vim requirements.in
  166  /usr/local/bin/pip-compile requirements.in > requirements.txt
  167  pip install -r requirements.txt
  168  pip3 install -r requirements.txt
  169  python3 -m pip install -r requirements.txt
  170  /usr/local/bin/pip-compile requirements.in > requirements.txt
  171  python3 -m pip install -r requirements.in
  172  vim requirements.in
  173  python3 -m pip install -r requirements.in
  174  dnf update
  175  history
[root@dbcontainer requirements]#



source venv-awx/bin/activate
