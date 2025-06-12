Last login: Wed Jun 11 01:05:29 2025 from 192.168.0.10
[alvis@nodehub ~]$
[alvis@nodehub ~]$ sudo su
[sudo] password for alvis:
[root@nodehub alvis]#
[root@nodehub alvis]# ls
awx  awx-24.6.1
[root@nodehub alvis]# cd awx
[root@nodehub awx]# ls
API_STANDARDS.md  awxkit        CONTRIBUTING.md    docs        Makefile       pyproject.toml  SECURITY.md      tox.ini
awx               _build        DATA_MIGRATION.md  INSTALL.md  manage.py      pytest.ini      setup.cfg
awx_collection    CHANGELOG.md  DCO_1_1.md         ISSUES.md   MANIFEST.in    README.md       supervisord.log
awx.egg-info      config        Dockerfile         LICENSE.md  pre-commit.sh  requirements    tools
[root@nodehub awx]#
[root@nodehub awx]# ls
API_STANDARDS.md  awxkit        CONTRIBUTING.md    docs        Makefile       pyproject.toml  SECURITY.md      tox.ini
awx               _build        DATA_MIGRATION.md  INSTALL.md  manage.py      pytest.ini      setup.cfg
awx_collection    CHANGELOG.md  DCO_1_1.md         ISSUES.md   MANIFEST.in    README.md       supervisord.log
awx.egg-info      config        Dockerfile         LICENSE.md  pre-commit.sh  requirements    tools
[root@nodehub awx]# cd tools/
ansible/                 docker-compose-minikube/ redis/                   sosreport/
data_generators/         elastic/                 rsyslog/                 test/
docker-compose/          grafana/                 scripts/
[root@nodehub awx]# cd tools/
ansible/                 docker-compose-minikube/ redis/                   sosreport/
data_generators/         elastic/                 rsyslog/                 test/
docker-compose/          grafana/                 scripts/
[root@nodehub awx]# cd tools/docker-compose/
ansible/  docs/     _sources/
[root@nodehub awx]# cd tools/docker-compose/_sources/
[root@nodehub _sources]# ls
database.py  docker-compose.yml  haproxy.cfg  local_settings.py  receptor  SECRET_KEY  secrets  websocket_secret.py
[root@nodehub _sources]# podman ps -a
CONTAINER ID  IMAGE                             COMMAND               CREATED     STATUS                    PORTS                                                                                                                                                                                                             NAMES
85385c388529  docker.io/library/redis:latest    /usr/local/etc/re...  3 days ago  Exited (0) 292 years ago  6379/tcp                                                                                                                                                                                                          tools_redis_1
c1b811e71872  docker.io/library/postgres:12     postgres -c log_d...  3 days ago  Exited (0) 292 years ago  5432/tcp                                                                                                                                                                                                          tools_postgres_1
8ea4a1320dd3  ghcr.io/ansible/awx_devel:24.6.1  launch_awx.sh         3 days ago  Exited (0) 292 years ago  0.0.0.0:2222->2222/tcp, 0.0.0.0:3000->3001/tcp, 0.0.0.0:6899->6899/tcp, 0.0.0.0:7899-7999->7899-7999/tcp, 0.0.0.0:8013->8013/tcp, 0.0.0.0:8043->8043/tcp, 0.0.0.0:8080->8080/tcp, 0.0.0.0:8888->8888/tcp, 22/tcp  tools_awx_1
0b80acdf7721  quay.io/ansible/receptor:devel    receptor --config...  3 days ago  Exited (129) 2 days ago   0.0.0.0:5555->5555/tcp, 7323/tcp                                                                                                                                                                                  tools_receptor_hop
82d7473ecb80  ghcr.io/ansible/awx_devel:24.6.1  receptor --config...  3 days ago  Exited (2) 2 days ago     22/tcp, 8013/tcp, 8043/tcp, 8080/tcp                                                                                                                                                                              tools_receptor_1
0c1730ba16d0  ghcr.io/ansible/awx_devel:24.6.1  receptor --config...  3 days ago  Exited (2) 2 days ago     22/tcp, 8013/tcp, 8043/tcp, 8080/tcp                                                                                                                                                                              tools_receptor_2
[root@nodehub _sources]# podman stop 85385c388529 c1b811e71872 8ea4a1320dd3 0b80acdf7721 82d7473ecb80 0c1730ba16d0
0b80acdf7721
82d7473ecb80
0c1730ba16d0
85385c388529
c1b811e71872
8ea4a1320dd3
[root@nodehub _sources]# podman rm 85385c388529 c1b811e71872 8ea4a1320dd3 0b80acdf7721 82d7473ecb80 0c1730ba16d0
0c1730ba16d0
82d7473ecb80
Error: container 8ea4a1320dd39e74478260aaa9effbbe3ce6de281861101d67346e230095e2df has dependent containers which must be removed before it: 0b80acdf77214be22008decc8896d357804d99c1d4c47581cac9a4fd7a021237, 82d7473ecb80971c9d6186d2a41f7a100c60cd9cb16b4a164f9d3ba9c16a2ee6, 0c1730ba16d0d641e19f563e1de91b62b91f1b7c9226d8096eb8f2031269fde5: container already exists
Error: container 85385c3885293e46f0e663d16b72a959d5fb74a68c85c69ebbcdd261e550c13d has dependent containers which must be removed before it: 8ea4a1320dd39e74478260aaa9effbbe3ce6de281861101d67346e230095e2df, 0b80acdf77214be22008decc8896d357804d99c1d4c47581cac9a4fd7a021237, 82d7473ecb80971c9d6186d2a41f7a100c60cd9cb16b4a164f9d3ba9c16a2ee6: container already exists
Error: container c1b811e71872719d0c8215a9424239bcc2995fa440ab94a4f86d2afe0ded9b4d has dependent containers which must be removed before it: 8ea4a1320dd39e74478260aaa9effbbe3ce6de281861101d67346e230095e2df, 0b80acdf77214be22008decc8896d357804d99c1d4c47581cac9a4fd7a021237, 82d7473ecb80971c9d6186d2a41f7a100c60cd9cb16b4a164f9d3ba9c16a2ee6: container already exists
Error: container 0b80acdf77214be22008decc8896d357804d99c1d4c47581cac9a4fd7a021237 has dependent containers which must be removed before it: 82d7473ecb80971c9d6186d2a41f7a100c60cd9cb16b4a164f9d3ba9c16a2ee6: container already exists
[root@nodehub _sources]# podman ps -a
CONTAINER ID  IMAGE                             COMMAND               CREATED     STATUS                    PORTS                                                                                                                                                                                                             NAMES
85385c388529  docker.io/library/redis:latest    /usr/local/etc/re...  3 days ago  Exited (0) 292 years ago  6379/tcp                                                                                                                                                                                                          tools_redis_1
c1b811e71872  docker.io/library/postgres:12     postgres -c log_d...  3 days ago  Exited (0) 292 years ago  5432/tcp                                                                                                                                                                                                          tools_postgres_1
8ea4a1320dd3  ghcr.io/ansible/awx_devel:24.6.1  launch_awx.sh         3 days ago  Exited (0) 292 years ago  0.0.0.0:2222->2222/tcp, 0.0.0.0:3000->3001/tcp, 0.0.0.0:6899->6899/tcp, 0.0.0.0:7899-7999->7899-7999/tcp, 0.0.0.0:8013->8013/tcp, 0.0.0.0:8043->8043/tcp, 0.0.0.0:8080->8080/tcp, 0.0.0.0:8888->8888/tcp, 22/tcp  tools_awx_1
0b80acdf7721  quay.io/ansible/receptor:devel    receptor --config...  3 days ago  Exited (129) 2 days ago   0.0.0.0:5555->5555/tcp, 7323/tcp                                                                                                                                                                                  tools_receptor_hop
[root@nodehub _sources]# podman rm 85385c388529 c1b811e71872 8ea4a1320dd3
Error: container c1b811e71872719d0c8215a9424239bcc2995fa440ab94a4f86d2afe0ded9b4d has dependent containers which must be removed before it: 8ea4a1320dd39e74478260aaa9effbbe3ce6de281861101d67346e230095e2df, 0b80acdf77214be22008decc8896d357804d99c1d4c47581cac9a4fd7a021237: container already exists
Error: container 85385c3885293e46f0e663d16b72a959d5fb74a68c85c69ebbcdd261e550c13d has dependent containers which must be removed before it: 8ea4a1320dd39e74478260aaa9effbbe3ce6de281861101d67346e230095e2df, 0b80acdf77214be22008decc8896d357804d99c1d4c47581cac9a4fd7a021237: container already exists
Error: container 8ea4a1320dd39e74478260aaa9effbbe3ce6de281861101d67346e230095e2df has dependent containers which must be removed before it: 0b80acdf77214be22008decc8896d357804d99c1d4c47581cac9a4fd7a021237: container already exists
[root@nodehub _sources]# podman ps -a
CONTAINER ID  IMAGE                             COMMAND               CREATED     STATUS                    PORTS                                                                                                                                                                                                             NAMES
85385c388529  docker.io/library/redis:latest    /usr/local/etc/re...  3 days ago  Exited (0) 292 years ago  6379/tcp                                                                                                                                                                                                          tools_redis_1
c1b811e71872  docker.io/library/postgres:12     postgres -c log_d...  3 days ago  Exited (0) 292 years ago  5432/tcp                                                                                                                                                                                                          tools_postgres_1
8ea4a1320dd3  ghcr.io/ansible/awx_devel:24.6.1  launch_awx.sh         3 days ago  Exited (0) 292 years ago  0.0.0.0:2222->2222/tcp, 0.0.0.0:3000->3001/tcp, 0.0.0.0:6899->6899/tcp, 0.0.0.0:7899-7999->7899-7999/tcp, 0.0.0.0:8013->8013/tcp, 0.0.0.0:8043->8043/tcp, 0.0.0.0:8080->8080/tcp, 0.0.0.0:8888->8888/tcp, 22/tcp  tools_awx_1
0b80acdf7721  quay.io/ansible/receptor:devel    receptor --config...  3 days ago  Exited (129) 2 days ago   0.0.0.0:5555->5555/tcp, 7323/tcp                                                                                                                                                                                  tools_receptor_hop
[root@nodehub _sources]# podman stop 85385c388529 c1b811e71872 8ea4a1320dd3
c1b811e71872
8ea4a1320dd3
85385c388529
[root@nodehub _sources]# podman rm 85385c388529 c1b811e71872 8ea4a1320dd3
Error: container 85385c3885293e46f0e663d16b72a959d5fb74a68c85c69ebbcdd261e550c13d has dependent containers which must be removed before it: 8ea4a1320dd39e74478260aaa9effbbe3ce6de281861101d67346e230095e2df, 0b80acdf77214be22008decc8896d357804d99c1d4c47581cac9a4fd7a021237: container already exists
Error: container c1b811e71872719d0c8215a9424239bcc2995fa440ab94a4f86d2afe0ded9b4d has dependent containers which must be removed before it: 8ea4a1320dd39e74478260aaa9effbbe3ce6de281861101d67346e230095e2df, 0b80acdf77214be22008decc8896d357804d99c1d4c47581cac9a4fd7a021237: container already exists
Error: container 8ea4a1320dd39e74478260aaa9effbbe3ce6de281861101d67346e230095e2df has dependent containers which must be removed before it: 0b80acdf77214be22008decc8896d357804d99c1d4c47581cac9a4fd7a021237: container already exists
[root@nodehub _sources]# podman ps -a
CONTAINER ID  IMAGE                             COMMAND               CREATED     STATUS                    PORTS                                                                                                                                                                                                             NAMES
85385c388529  docker.io/library/redis:latest    /usr/local/etc/re...  3 days ago  Exited (0) 292 years ago  6379/tcp                                                                                                                                                                                                          tools_redis_1
c1b811e71872  docker.io/library/postgres:12     postgres -c log_d...  3 days ago  Exited (0) 292 years ago  5432/tcp                                                                                                                                                                                                          tools_postgres_1
8ea4a1320dd3  ghcr.io/ansible/awx_devel:24.6.1  launch_awx.sh         3 days ago  Exited (0) 292 years ago  0.0.0.0:2222->2222/tcp, 0.0.0.0:3000->3001/tcp, 0.0.0.0:6899->6899/tcp, 0.0.0.0:7899-7999->7899-7999/tcp, 0.0.0.0:8013->8013/tcp, 0.0.0.0:8043->8043/tcp, 0.0.0.0:8080->8080/tcp, 0.0.0.0:8888->8888/tcp, 22/tcp  tools_awx_1
0b80acdf7721  quay.io/ansible/receptor:devel    receptor --config...  3 days ago  Exited (129) 2 days ago   0.0.0.0:5555->5555/tcp, 7323/tcp                                                                                                                                                                                  tools_receptor_hop
[root@nodehub _sources]# podman rm 0b80acdf7721
0b80acdf7721
[root@nodehub _sources]# podman ps -a
CONTAINER ID  IMAGE                             COMMAND               CREATED     STATUS                    PORTS                                                                                                                                                                                                             NAMES
85385c388529  docker.io/library/redis:latest    /usr/local/etc/re...  3 days ago  Exited (0) 292 years ago  6379/tcp                                                                                                                                                                                                          tools_redis_1
c1b811e71872  docker.io/library/postgres:12     postgres -c log_d...  3 days ago  Exited (0) 292 years ago  5432/tcp                                                                                                                                                                                                          tools_postgres_1
8ea4a1320dd3  ghcr.io/ansible/awx_devel:24.6.1  launch_awx.sh         3 days ago  Exited (0) 292 years ago  0.0.0.0:2222->2222/tcp, 0.0.0.0:3000->3001/tcp, 0.0.0.0:6899->6899/tcp, 0.0.0.0:7899-7999->7899-7999/tcp, 0.0.0.0:8013->8013/tcp, 0.0.0.0:8043->8043/tcp, 0.0.0.0:8080->8080/tcp, 0.0.0.0:8888->8888/tcp, 22/tcp  tools_awx_1
[root@nodehub _sources]# podman rm 85385c388529 c1b811e71872 8ea4a1320dd3
8ea4a1320dd3
Error: container 85385c3885293e46f0e663d16b72a959d5fb74a68c85c69ebbcdd261e550c13d has dependent containers which must be removed before it: 8ea4a1320dd39e74478260aaa9effbbe3ce6de281861101d67346e230095e2df: container already exists
Error: container c1b811e71872719d0c8215a9424239bcc2995fa440ab94a4f86d2afe0ded9b4d has dependent containers which must be removed before it: 8ea4a1320dd39e74478260aaa9effbbe3ce6de281861101d67346e230095e2df: container already exists
[root@nodehub _sources]# podman ps -a
CONTAINER ID  IMAGE                           COMMAND               CREATED     STATUS                    PORTS       NAMES
85385c388529  docker.io/library/redis:latest  /usr/local/etc/re...  3 days ago  Exited (0) 292 years ago  6379/tcp    tools_redis_1
c1b811e71872  docker.io/library/postgres:12   postgres -c log_d...  3 days ago  Exited (0) 292 years ago  5432/tcp    tools_postgres_1
[root@nodehub _sources]# podman ps -a
CONTAINER ID  IMAGE                           COMMAND               CREATED     STATUS                    PORTS       NAMES
85385c388529  docker.io/library/redis:latest  /usr/local/etc/re...  3 days ago  Exited (0) 292 years ago  6379/tcp    tools_redis_1
c1b811e71872  docker.io/library/postgres:12   postgres -c log_d...  3 days ago  Exited (0) 292 years ago  5432/tcp    tools_postgres_1
[root@nodehub _sources]# podman rm 85385c388529 c1b811e71872
c1b811e71872
85385c388529
[root@nodehub _sources]# podman ps -a
CONTAINER ID  IMAGE       COMMAND     CREATED     STATUS      PORTS       NAMES
[root@nodehub _sources]# ls
database.py  docker-compose.yml  haproxy.cfg  local_settings.py  receptor  SECRET_KEY  secrets  websocket_secret.py
[root@nodehub _sources]# pod
pod2man         pod2text        pod2usage       podman          podman-compose  podmansh
[root@nodehub _sources]# podman
podman          podman-compose  podmansh
[root@nodehub _sources]# podman-compose -f docker-compose.yml up -d
468c539918a1b88d2349ad07ac7cf892b0d1a6284775d64aab4447730acd7a64
Traceback (most recent call last):
  File "/usr/local/lib/python3.9/site-packages/podman_compose.py", line 896, in assert_cnt_nets
    await compose.podman.output([], "network", ["exists", net_name])
  File "/usr/local/lib/python3.9/site-packages/podman_compose.py", line 1510, in output
    raise subprocess.CalledProcessError(p.returncode, " ".join(cmd_ls), stderr_data)
subprocess.CalledProcessError: Command 'podman network exists _sources_default' returned non-zero exit status 1.

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/usr/local/bin/podman-compose", line 8, in <module>
    sys.exit(main())
  File "/usr/local/lib/python3.9/site-packages/podman_compose.py", line 3995, in main
    asyncio.run(async_main())
  File "/usr/lib64/python3.9/asyncio/runners.py", line 44, in run
    return loop.run_until_complete(main)
  File "/usr/lib64/python3.9/asyncio/base_events.py", line 647, in run_until_complete
    return future.result()
  File "/usr/local/lib/python3.9/site-packages/podman_compose.py", line 3991, in async_main
    await podman_compose.run()
  File "/usr/local/lib/python3.9/site-packages/podman_compose.py", line 1984, in run
    retcode = await cmd(self, args)
  File "/usr/local/lib/python3.9/site-packages/podman_compose.py", line 2923, in compose_up
    podman_args = await container_to_args(compose, cnt, detached=False, no_deps=args.no_deps)
  File "/usr/local/lib/python3.9/site-packages/podman_compose.py", line 1124, in container_to_args
    await assert_cnt_nets(compose, cnt)
  File "/usr/local/lib/python3.9/site-packages/podman_compose.py", line 901, in assert_cnt_nets
    await compose.podman.output([], "network", args)
  File "/usr/local/lib/python3.9/site-packages/podman_compose.py", line 1510, in output
    raise subprocess.CalledProcessError(p.returncode, " ".join(cmd_ls), stderr_data)
subprocess.CalledProcessError: Command 'podman network create --label io.podman.compose.project=_sources --label com.docker.compose.project=_sources _sources_default' returned non-zero exit status 125.
[root@nodehub _sources]# podman network ls
NETWORK ID    NAME           DRIVER
2f259bab93aa  podman         bridge
5e06e6d95e48  tools_default  bridge
[root@nodehub _sources]# podman network create --label io.podman.compose.project=_sources --label com.docker.compose.project=_sources _sources_default
Error: network name _sources_default invalid: names must match [a-zA-Z0-9][a-zA-Z0-9_.-]*: invalid argument
[root@nodehub _sources]# COMPOSE_PROJECT_NAME=sources podman-compose -f docker-compose.yml up -d
1376a9b7142c8021186160a8244b33d88fdb83274eedeb15432b742e49eedb8b
e03a6e4f3bece2ab3e8bea0f848dfcd9b7e738d5704e5ee67dbabf7b960f788e
tools_redis_1
e26d8dd036fedfda18c73ab15bb5f6acf91fafc81a554e4fbac54c005288ca06
tools_postgres_1
6b0bd1f309bd97aba59e7d9143dbf3a62e30e9ad972b585987b6c48fe7d07cd5
tools_awx_1
b8106c2abea5e0a32e88f43f3ab6b6027f41a50f0086fd6466f2cb3693464f4f
tools_receptor_hop
967138774b35a8beeb504232ca985569d17fe46aaba3692a0b6000f2358d6d4c
tools_receptor_1
25099b046f3366d5f5561b6385aa010be12bc4b83ed13587333fb079e35c3785
tools_receptor_2
[root@nodehub _sources]# podman ps -a
CONTAINER ID  IMAGE                             COMMAND               CREATED        STATUS        PORTS                                                                                                                                                                                                             NAMES
e03a6e4f3bec  docker.io/library/redis:latest    /usr/local/etc/re...  8 seconds ago  Up 8 seconds  6379/tcp                                                                                                                                                                                                          tools_redis_1
e26d8dd036fe  docker.io/library/postgres:12     postgres -c log_d...  7 seconds ago  Up 8 seconds  5432/tcp                                                                                                                                                                                                          tools_postgres_1
6b0bd1f309bd  ghcr.io/ansible/awx_devel:24.6.1  launch_awx.sh         7 seconds ago  Up 7 seconds  0.0.0.0:2222->2222/tcp, 0.0.0.0:3000->3001/tcp, 0.0.0.0:6899->6899/tcp, 0.0.0.0:7899-7999->7899-7999/tcp, 0.0.0.0:8013->8013/tcp, 0.0.0.0:8043->8043/tcp, 0.0.0.0:8080->8080/tcp, 0.0.0.0:8888->8888/tcp, 22/tcp  tools_awx_1
b8106c2abea5  quay.io/ansible/receptor:devel    receptor --config...  6 seconds ago  Up 7 seconds  0.0.0.0:5555->5555/tcp, 7323/tcp                                                                                                                                                                                  tools_receptor_hop
967138774b35  ghcr.io/ansible/awx_devel:24.6.1  receptor --config...  6 seconds ago  Up 7 seconds  22/tcp, 8013/tcp, 8043/tcp, 8080/tcp                                                                                                                                                                              tools_receptor_1
25099b046f33  ghcr.io/ansible/awx_devel:24.6.1  receptor --config...  6 seconds ago  Up 6 seconds  22/tcp, 8013/tcp, 8043/tcp, 8080/tcp                                                                                                                                                                              tools_receptor_2
[root@nodehub _sources]# podman ps -a
CONTAINER ID  IMAGE                             COMMAND               CREATED         STATUS         PORTS                                                                                                                                                                                                             NAMES
e03a6e4f3bec  docker.io/library/redis:latest    /usr/local/etc/re...  12 seconds ago  Up 11 seconds  6379/tcp                                                                                                                                                                                                          tools_redis_1
e26d8dd036fe  docker.io/library/postgres:12     postgres -c log_d...  11 seconds ago  Up 11 seconds  5432/tcp                                                                                                                                                                                                          tools_postgres_1
6b0bd1f309bd  ghcr.io/ansible/awx_devel:24.6.1  launch_awx.sh         11 seconds ago  Up 10 seconds  0.0.0.0:2222->2222/tcp, 0.0.0.0:3000->3001/tcp, 0.0.0.0:6899->6899/tcp, 0.0.0.0:7899-7999->7899-7999/tcp, 0.0.0.0:8013->8013/tcp, 0.0.0.0:8043->8043/tcp, 0.0.0.0:8080->8080/tcp, 0.0.0.0:8888->8888/tcp, 22/tcp  tools_awx_1
b8106c2abea5  quay.io/ansible/receptor:devel    receptor --config...  10 seconds ago  Up 10 seconds  0.0.0.0:5555->5555/tcp, 7323/tcp                                                                                                                                                                                  tools_receptor_hop
967138774b35  ghcr.io/ansible/awx_devel:24.6.1  receptor --config...  10 seconds ago  Up 10 seconds  22/tcp, 8013/tcp, 8043/tcp, 8080/tcp                                                                                                                                                                              tools_receptor_1
25099b046f33  ghcr.io/ansible/awx_devel:24.6.1  receptor --config...  9 seconds ago   Up 9 seconds   22/tcp, 8013/tcp, 8043/tcp, 8080/tcp                                                                                                                                                                              tools_receptor_2
[root@nodehub _sources]# podman ps -a
CONTAINER ID  IMAGE                             COMMAND               CREATED         STATUS         PORTS                                                                                                                                                                                                             NAMES
e03a6e4f3bec  docker.io/library/redis:latest    /usr/local/etc/re...  14 seconds ago  Up 13 seconds  6379/tcp                                                                                                                                                                                                          tools_redis_1
e26d8dd036fe  docker.io/library/postgres:12     postgres -c log_d...  13 seconds ago  Up 13 seconds  5432/tcp                                                                                                                                                                                                          tools_postgres_1
6b0bd1f309bd  ghcr.io/ansible/awx_devel:24.6.1  launch_awx.sh         12 seconds ago  Up 12 seconds  0.0.0.0:2222->2222/tcp, 0.0.0.0:3000->3001/tcp, 0.0.0.0:6899->6899/tcp, 0.0.0.0:7899-7999->7899-7999/tcp, 0.0.0.0:8013->8013/tcp, 0.0.0.0:8043->8043/tcp, 0.0.0.0:8080->8080/tcp, 0.0.0.0:8888->8888/tcp, 22/tcp  tools_awx_1
b8106c2abea5  quay.io/ansible/receptor:devel    receptor --config...  12 seconds ago  Up 12 seconds  0.0.0.0:5555->5555/tcp, 7323/tcp                                                                                                                                                                                  tools_receptor_hop
967138774b35  ghcr.io/ansible/awx_devel:24.6.1  receptor --config...  12 seconds ago  Up 12 seconds  22/tcp, 8013/tcp, 8043/tcp, 8080/tcp                                                                                                                                                                              tools_receptor_1
25099b046f33  ghcr.io/ansible/awx_devel:24.6.1  receptor --config...  11 seconds ago  Up 11 seconds  22/tcp, 8013/tcp, 8043/tcp, 8080/tcp                                                                                                                                                                              tools_receptor_2
[root@nodehub _sources]# podman ps -a
CONTAINER ID  IMAGE                             COMMAND               CREATED         STATUS         PORTS                                                                                                                                                                                                             NAMES
e03a6e4f3bec  docker.io/library/redis:latest    /usr/local/etc/re...  15 seconds ago  Up 14 seconds  6379/tcp                                                                                                                                                                                                          tools_redis_1
e26d8dd036fe  docker.io/library/postgres:12     postgres -c log_d...  14 seconds ago  Up 14 seconds  5432/tcp                                                                                                                                                                                                          tools_postgres_1
6b0bd1f309bd  ghcr.io/ansible/awx_devel:24.6.1  launch_awx.sh         14 seconds ago  Up 13 seconds  0.0.0.0:2222->2222/tcp, 0.0.0.0:3000->3001/tcp, 0.0.0.0:6899->6899/tcp, 0.0.0.0:7899-7999->7899-7999/tcp, 0.0.0.0:8013->8013/tcp, 0.0.0.0:8043->8043/tcp, 0.0.0.0:8080->8080/tcp, 0.0.0.0:8888->8888/tcp, 22/tcp  tools_awx_1
b8106c2abea5  quay.io/ansible/receptor:devel    receptor --config...  13 seconds ago  Up 13 seconds  0.0.0.0:5555->5555/tcp, 7323/tcp                                                                                                                                                                                  tools_receptor_hop
967138774b35  ghcr.io/ansible/awx_devel:24.6.1  receptor --config...  13 seconds ago  Up 13 seconds  22/tcp, 8013/tcp, 8043/tcp, 8080/tcp                                                                                                                                                                              tools_receptor_1
25099b046f33  ghcr.io/ansible/awx_devel:24.6.1  receptor --config...  12 seconds ago  Up 12 seconds  22/tcp, 8013/tcp, 8043/tcp, 8080/tcp                                                                                                                                                                              tools_receptor_2
[root@nodehub _sources]# podman ps -a
CONTAINER ID  IMAGE                             COMMAND               CREATED         STATUS         PORTS                                                                                                                                                                                                             NAMES
e03a6e4f3bec  docker.io/library/redis:latest    /usr/local/etc/re...  16 seconds ago  Up 15 seconds  6379/tcp                                                                                                                                                                                                          tools_redis_1
e26d8dd036fe  docker.io/library/postgres:12     postgres -c log_d...  15 seconds ago  Up 15 seconds  5432/tcp                                                                                                                                                                                                          tools_postgres_1
6b0bd1f309bd  ghcr.io/ansible/awx_devel:24.6.1  launch_awx.sh         15 seconds ago  Up 14 seconds  0.0.0.0:2222->2222/tcp, 0.0.0.0:3000->3001/tcp, 0.0.0.0:6899->6899/tcp, 0.0.0.0:7899-7999->7899-7999/tcp, 0.0.0.0:8013->8013/tcp, 0.0.0.0:8043->8043/tcp, 0.0.0.0:8080->8080/tcp, 0.0.0.0:8888->8888/tcp, 22/tcp  tools_awx_1
b8106c2abea5  quay.io/ansible/receptor:devel    receptor --config...  14 seconds ago  Up 14 seconds  0.0.0.0:5555->5555/tcp, 7323/tcp                                                                                                                                                                                  tools_receptor_hop
967138774b35  ghcr.io/ansible/awx_devel:24.6.1  receptor --config...  14 seconds ago  Up 14 seconds  22/tcp, 8013/tcp, 8043/tcp, 8080/tcp                                                                                                                                                                              tools_receptor_1
25099b046f33  ghcr.io/ansible/awx_devel:24.6.1  receptor --config...  13 seconds ago  Up 13 seconds  22/tcp, 8013/tcp, 8043/tcp, 8080/tcp                                                                                                                                                                              tools_receptor_2
[root@nodehub _sources]# podman logs 6b0bd1f309bd
[ -d "/awx_devel/awx.egg-info" ] || python3.9 /awx_devel/tools/scripts/egg_info_dev
cp -f /tmp/awx.egg-link /var/lib/awx/venv/awx/lib/python3.9/site-packages/awx.egg-link
mkdir -p /var/lib/awx/; \
if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
python3.9 -c "import awx; print(awx.__version__)" > /var/lib/awx/.awx_version; \

if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
awx-manage migrate --noinput
Operations to perform:
  Apply all migrations: auth, conf, contenttypes, main, oauth2_provider, sessions, sites, social_django, sso, taggit
Running migrations:
  No migrations to apply.
Admin password: CCWIdjRTMfbXuNgAslLJ
(changed: False)
(changed: False)
Instance already registered awx_1
Instance Group already registered controlplane
Instance Group already registered default
Instance already registered receptor-hop
0 new peer links added to the database.
Instance already registered receptor-1
0 new peer links added to the database.
Instance already registered receptor-2
0 new peer links added to the database.
/usr/local/lib/python3.9/site-packages/supervisor/options.py:474: UserWarning: Supervisord is running as root and it is searching for its configuration file in default locations (including its current working directory); you probably want to specify a "-c" argument specifying an absolute path to a configuration file for improved security.
  self.warnings.warn(
2025-06-12 06:39:31,701 CRIT Supervisor is running as root.  Privileges were not dropped because no user is specified in the config file.  If you intend to run as root, you can set user=root in the config file to avoid this message.
2025-06-12 06:39:31,707 INFO RPC interface 'supervisor' initialized
2025-06-12 06:39:31,707 CRIT Server 'unix_http_server' running without any HTTP authentication checking
2025-06-12 06:39:31,707 INFO supervisord started with pid 305
2025-06-12 06:39:32,711 INFO spawned: 'stdout' with pid 306
2025-06-12 06:39:32,713 INFO spawned: 'superwatcher' with pid 307
2025-06-12 06:39:32,714 INFO spawned: 'awx-dispatcher' with pid 308
2025-06-12 06:39:32,716 INFO spawned: 'awx-receiver' with pid 309
2025-06-12 06:39:32,717 INFO spawned: 'awx-uwsgi' with pid 310
2025-06-12 06:39:32,719 INFO spawned: 'awx-daphne' with pid 311
2025-06-12 06:39:32,721 INFO spawned: 'awx-nginx' with pid 312
2025-06-12 06:39:32,723 INFO spawned: 'awx-wsbroadcast' with pid 313
2025-06-12 06:39:32,725 INFO spawned: 'awx-rsyslogd' with pid 315
2025-06-12 06:39:32,727 INFO spawned: 'awx-autoreload' with pid 316
2025-06-12 06:39:32,739 INFO spawned: 'awx-receptor' with pid 317
READY
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
2025-06-12 06:39:33,810 INFO success: stdout entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,811 INFO success: superwatcher entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,811 INFO success: awx-dispatcher entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,811 INFO success: awx-receiver entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-uwsgi entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-daphne entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-nginx entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-wsbroadcast entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-rsyslogd entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-autoreload entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-receptor entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
awx-autoreload stdout | make[1]: Entering directory '/awx_devel'
awx-autoreload stdout |
INFO 2025/06/12 06:39:34 Running control service control {"node_id":"awx_1"}
INFO 2025/06/12 06:39:34 Initialization complete
[root@nodehub _sources]# podman logs 6b0bd1f309bd
[ -d "/awx_devel/awx.egg-info" ] || python3.9 /awx_devel/tools/scripts/egg_info_dev
cp -f /tmp/awx.egg-link /var/lib/awx/venv/awx/lib/python3.9/site-packages/awx.egg-link
mkdir -p /var/lib/awx/; \
if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
python3.9 -c "import awx; print(awx.__version__)" > /var/lib/awx/.awx_version; \

if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
awx-manage migrate --noinput
Operations to perform:
  Apply all migrations: auth, conf, contenttypes, main, oauth2_provider, sessions, sites, social_django, sso, taggit
Running migrations:
  No migrations to apply.
Admin password: CCWIdjRTMfbXuNgAslLJ
(changed: False)
(changed: False)
Instance already registered awx_1
Instance Group already registered controlplane
Instance Group already registered default
Instance already registered receptor-hop
0 new peer links added to the database.
Instance already registered receptor-1
0 new peer links added to the database.
Instance already registered receptor-2
0 new peer links added to the database.
/usr/local/lib/python3.9/site-packages/supervisor/options.py:474: UserWarning: Supervisord is running as root and it is searching for its configuration file in default locations (including its current working directory); you probably want to specify a "-c" argument specifying an absolute path to a configuration file for improved security.
  self.warnings.warn(
2025-06-12 06:39:31,701 CRIT Supervisor is running as root.  Privileges were not dropped because no user is specified in the config file.  If you intend to run as root, you can set user=root in the config file to avoid this message.
2025-06-12 06:39:31,707 INFO RPC interface 'supervisor' initialized
2025-06-12 06:39:31,707 CRIT Server 'unix_http_server' running without any HTTP authentication checking
2025-06-12 06:39:31,707 INFO supervisord started with pid 305
2025-06-12 06:39:32,711 INFO spawned: 'stdout' with pid 306
2025-06-12 06:39:32,713 INFO spawned: 'superwatcher' with pid 307
2025-06-12 06:39:32,714 INFO spawned: 'awx-dispatcher' with pid 308
2025-06-12 06:39:32,716 INFO spawned: 'awx-receiver' with pid 309
2025-06-12 06:39:32,717 INFO spawned: 'awx-uwsgi' with pid 310
2025-06-12 06:39:32,719 INFO spawned: 'awx-daphne' with pid 311
2025-06-12 06:39:32,721 INFO spawned: 'awx-nginx' with pid 312
2025-06-12 06:39:32,723 INFO spawned: 'awx-wsbroadcast' with pid 313
2025-06-12 06:39:32,725 INFO spawned: 'awx-rsyslogd' with pid 315
2025-06-12 06:39:32,727 INFO spawned: 'awx-autoreload' with pid 316
2025-06-12 06:39:32,739 INFO spawned: 'awx-receptor' with pid 317
READY
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
2025-06-12 06:39:33,810 INFO success: stdout entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,811 INFO success: superwatcher entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,811 INFO success: awx-dispatcher entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,811 INFO success: awx-receiver entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-uwsgi entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-daphne entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-nginx entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-wsbroadcast entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-rsyslogd entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-autoreload entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-receptor entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
awx-autoreload stdout | make[1]: Entering directory '/awx_devel'
awx-autoreload stdout |
INFO 2025/06/12 06:39:34 Running control service control {"node_id":"awx_1"}
INFO 2025/06/12 06:39:34 Initialization complete
nginx -g "daemon off;"
[root@nodehub _sources]# podman logs 6b0bd1f309bd
[ -d "/awx_devel/awx.egg-info" ] || python3.9 /awx_devel/tools/scripts/egg_info_dev
cp -f /tmp/awx.egg-link /var/lib/awx/venv/awx/lib/python3.9/site-packages/awx.egg-link
mkdir -p /var/lib/awx/; \
if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
python3.9 -c "import awx; print(awx.__version__)" > /var/lib/awx/.awx_version; \

if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
awx-manage migrate --noinput
Operations to perform:
  Apply all migrations: auth, conf, contenttypes, main, oauth2_provider, sessions, sites, social_django, sso, taggit
Running migrations:
  No migrations to apply.
Admin password: CCWIdjRTMfbXuNgAslLJ
(changed: False)
(changed: False)
Instance already registered awx_1
Instance Group already registered controlplane
Instance Group already registered default
Instance already registered receptor-hop
0 new peer links added to the database.
Instance already registered receptor-1
0 new peer links added to the database.
Instance already registered receptor-2
0 new peer links added to the database.
/usr/local/lib/python3.9/site-packages/supervisor/options.py:474: UserWarning: Supervisord is running as root and it is searching for its configuration file in default locations (including its current working directory); you probably want to specify a "-c" argument specifying an absolute path to a configuration file for improved security.
  self.warnings.warn(
2025-06-12 06:39:31,701 CRIT Supervisor is running as root.  Privileges were not dropped because no user is specified in the config file.  If you intend to run as root, you can set user=root in the config file to avoid this message.
2025-06-12 06:39:31,707 INFO RPC interface 'supervisor' initialized
2025-06-12 06:39:31,707 CRIT Server 'unix_http_server' running without any HTTP authentication checking
2025-06-12 06:39:31,707 INFO supervisord started with pid 305
2025-06-12 06:39:32,711 INFO spawned: 'stdout' with pid 306
2025-06-12 06:39:32,713 INFO spawned: 'superwatcher' with pid 307
2025-06-12 06:39:32,714 INFO spawned: 'awx-dispatcher' with pid 308
2025-06-12 06:39:32,716 INFO spawned: 'awx-receiver' with pid 309
2025-06-12 06:39:32,717 INFO spawned: 'awx-uwsgi' with pid 310
2025-06-12 06:39:32,719 INFO spawned: 'awx-daphne' with pid 311
2025-06-12 06:39:32,721 INFO spawned: 'awx-nginx' with pid 312
2025-06-12 06:39:32,723 INFO spawned: 'awx-wsbroadcast' with pid 313
2025-06-12 06:39:32,725 INFO spawned: 'awx-rsyslogd' with pid 315
2025-06-12 06:39:32,727 INFO spawned: 'awx-autoreload' with pid 316
2025-06-12 06:39:32,739 INFO spawned: 'awx-receptor' with pid 317
READY
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
2025-06-12 06:39:33,810 INFO success: stdout entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,811 INFO success: superwatcher entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,811 INFO success: awx-dispatcher entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,811 INFO success: awx-receiver entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-uwsgi entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-daphne entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-nginx entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-wsbroadcast entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-rsyslogd entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-autoreload entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-receptor entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
awx-autoreload stdout | make[1]: Entering directory '/awx_devel'
awx-autoreload stdout |
INFO 2025/06/12 06:39:34 Running control service control {"node_id":"awx_1"}
INFO 2025/06/12 06:39:34 Initialization complete
nginx -g "daemon off;"
[root@nodehub _sources]# podman logs 6b0bd1f309bd
[ -d "/awx_devel/awx.egg-info" ] || python3.9 /awx_devel/tools/scripts/egg_info_dev
cp -f /tmp/awx.egg-link /var/lib/awx/venv/awx/lib/python3.9/site-packages/awx.egg-link
mkdir -p /var/lib/awx/; \
if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
python3.9 -c "import awx; print(awx.__version__)" > /var/lib/awx/.awx_version; \

if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
awx-manage migrate --noinput
Operations to perform:
  Apply all migrations: auth, conf, contenttypes, main, oauth2_provider, sessions, sites, social_django, sso, taggit
Running migrations:
  No migrations to apply.
Admin password: CCWIdjRTMfbXuNgAslLJ
(changed: False)
(changed: False)
Instance already registered awx_1
Instance Group already registered controlplane
Instance Group already registered default
Instance already registered receptor-hop
0 new peer links added to the database.
Instance already registered receptor-1
0 new peer links added to the database.
Instance already registered receptor-2
0 new peer links added to the database.
/usr/local/lib/python3.9/site-packages/supervisor/options.py:474: UserWarning: Supervisord is running as root and it is searching for its configuration file in default locations (including its current working directory); you probably want to specify a "-c" argument specifying an absolute path to a configuration file for improved security.
  self.warnings.warn(
2025-06-12 06:39:31,701 CRIT Supervisor is running as root.  Privileges were not dropped because no user is specified in the config file.  If you intend to run as root, you can set user=root in the config file to avoid this message.
2025-06-12 06:39:31,707 INFO RPC interface 'supervisor' initialized
2025-06-12 06:39:31,707 CRIT Server 'unix_http_server' running without any HTTP authentication checking
2025-06-12 06:39:31,707 INFO supervisord started with pid 305
2025-06-12 06:39:32,711 INFO spawned: 'stdout' with pid 306
2025-06-12 06:39:32,713 INFO spawned: 'superwatcher' with pid 307
2025-06-12 06:39:32,714 INFO spawned: 'awx-dispatcher' with pid 308
2025-06-12 06:39:32,716 INFO spawned: 'awx-receiver' with pid 309
2025-06-12 06:39:32,717 INFO spawned: 'awx-uwsgi' with pid 310
2025-06-12 06:39:32,719 INFO spawned: 'awx-daphne' with pid 311
2025-06-12 06:39:32,721 INFO spawned: 'awx-nginx' with pid 312
2025-06-12 06:39:32,723 INFO spawned: 'awx-wsbroadcast' with pid 313
2025-06-12 06:39:32,725 INFO spawned: 'awx-rsyslogd' with pid 315
2025-06-12 06:39:32,727 INFO spawned: 'awx-autoreload' with pid 316
2025-06-12 06:39:32,739 INFO spawned: 'awx-receptor' with pid 317
READY
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
2025-06-12 06:39:33,810 INFO success: stdout entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,811 INFO success: superwatcher entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,811 INFO success: awx-dispatcher entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,811 INFO success: awx-receiver entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-uwsgi entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-daphne entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-nginx entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-wsbroadcast entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-rsyslogd entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-autoreload entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-receptor entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
awx-autoreload stdout | make[1]: Entering directory '/awx_devel'
awx-autoreload stdout |
INFO 2025/06/12 06:39:34 Running control service control {"node_id":"awx_1"}
INFO 2025/06/12 06:39:34 Initialization complete
nginx -g "daemon off;"
2025-06-12 06:39:38,506 INFO     [-] daphne.cli Starting server at tcp:port=8051:interface=127.0.0.1
2025-06-12 06:39:38,506 INFO     Starting server at tcp:port=8051:interface=127.0.0.1
2025-06-12 06:39:38,512 INFO     [-] daphne.server HTTP/2 support not enabled (install the http2 and tls Twisted extras)
2025-06-12 06:39:38,512 INFO     HTTP/2 support not enabled (install the http2 and tls Twisted extras)
2025-06-12 06:39:38,512 INFO     [-] daphne.server Configuring endpoint tcp:port=8051:interface=127.0.0.1
2025-06-12 06:39:38,512 INFO     Configuring endpoint tcp:port=8051:interface=127.0.0.1
2025-06-12 06:39:38,513 INFO     [-] daphne.server Listening on TCP address 127.0.0.1:8051
2025-06-12 06:39:38,513 INFO     Listening on TCP address 127.0.0.1:8051
[root@nodehub _sources]# podman logs 6b0bd1f309bd
[ -d "/awx_devel/awx.egg-info" ] || python3.9 /awx_devel/tools/scripts/egg_info_dev
cp -f /tmp/awx.egg-link /var/lib/awx/venv/awx/lib/python3.9/site-packages/awx.egg-link
mkdir -p /var/lib/awx/; \
if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
python3.9 -c "import awx; print(awx.__version__)" > /var/lib/awx/.awx_version; \

if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
awx-manage migrate --noinput
Operations to perform:
  Apply all migrations: auth, conf, contenttypes, main, oauth2_provider, sessions, sites, social_django, sso, taggit
Running migrations:
  No migrations to apply.
Admin password: CCWIdjRTMfbXuNgAslLJ
(changed: False)
(changed: False)
Instance already registered awx_1
Instance Group already registered controlplane
Instance Group already registered default
Instance already registered receptor-hop
0 new peer links added to the database.
Instance already registered receptor-1
0 new peer links added to the database.
Instance already registered receptor-2
0 new peer links added to the database.
/usr/local/lib/python3.9/site-packages/supervisor/options.py:474: UserWarning: Supervisord is running as root and it is searching for its configuration file in default locations (including its current working directory); you probably want to specify a "-c" argument specifying an absolute path to a configuration file for improved security.
  self.warnings.warn(
2025-06-12 06:39:31,701 CRIT Supervisor is running as root.  Privileges were not dropped because no user is specified in the config file.  If you intend to run as root, you can set user=root in the config file to avoid this message.
2025-06-12 06:39:31,707 INFO RPC interface 'supervisor' initialized
2025-06-12 06:39:31,707 CRIT Server 'unix_http_server' running without any HTTP authentication checking
2025-06-12 06:39:31,707 INFO supervisord started with pid 305
2025-06-12 06:39:32,711 INFO spawned: 'stdout' with pid 306
2025-06-12 06:39:32,713 INFO spawned: 'superwatcher' with pid 307
2025-06-12 06:39:32,714 INFO spawned: 'awx-dispatcher' with pid 308
2025-06-12 06:39:32,716 INFO spawned: 'awx-receiver' with pid 309
2025-06-12 06:39:32,717 INFO spawned: 'awx-uwsgi' with pid 310
2025-06-12 06:39:32,719 INFO spawned: 'awx-daphne' with pid 311
2025-06-12 06:39:32,721 INFO spawned: 'awx-nginx' with pid 312
2025-06-12 06:39:32,723 INFO spawned: 'awx-wsbroadcast' with pid 313
2025-06-12 06:39:32,725 INFO spawned: 'awx-rsyslogd' with pid 315
2025-06-12 06:39:32,727 INFO spawned: 'awx-autoreload' with pid 316
2025-06-12 06:39:32,739 INFO spawned: 'awx-receptor' with pid 317
READY
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
2025-06-12 06:39:33,810 INFO success: stdout entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,811 INFO success: superwatcher entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,811 INFO success: awx-dispatcher entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,811 INFO success: awx-receiver entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-uwsgi entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-daphne entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-nginx entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-wsbroadcast entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-rsyslogd entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-autoreload entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-receptor entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
awx-autoreload stdout | make[1]: Entering directory '/awx_devel'
awx-autoreload stdout |
INFO 2025/06/12 06:39:34 Running control service control {"node_id":"awx_1"}
INFO 2025/06/12 06:39:34 Initialization complete
nginx -g "daemon off;"
2025-06-12 06:39:38,506 INFO     [-] daphne.cli Starting server at tcp:port=8051:interface=127.0.0.1
2025-06-12 06:39:38,506 INFO     Starting server at tcp:port=8051:interface=127.0.0.1
2025-06-12 06:39:38,512 INFO     [-] daphne.server HTTP/2 support not enabled (install the http2 and tls Twisted extras)
2025-06-12 06:39:38,512 INFO     HTTP/2 support not enabled (install the http2 and tls Twisted extras)
2025-06-12 06:39:38,512 INFO     [-] daphne.server Configuring endpoint tcp:port=8051:interface=127.0.0.1
2025-06-12 06:39:38,512 INFO     Configuring endpoint tcp:port=8051:interface=127.0.0.1
2025-06-12 06:39:38,513 INFO     [-] daphne.server Listening on TCP address 127.0.0.1:8051
2025-06-12 06:39:38,513 INFO     Listening on TCP address 127.0.0.1:8051
*** Starting uWSGI 2.0.18 (64bit) on [Thu Jun 12 06:39:39 2025] ***
compiled with version: 11.5.0 20240719 (Red Hat 11.5.0-5) on 09 June 2025 00:48:49
os: Linux-5.14.0-503.21.1.el9_5.x86_64 #1 SMP PREEMPT_DYNAMIC Thu Dec 19 09:37:00 EST 2024
nodename: awx_1
machine: x86_64
clock source: unix
detected number of CPU cores: 4
current working directory: /awx_devel
detected binary path: /var/lib/awx/venv/awx/bin/uwsgi
!!! no internal routing support, rebuild with pcre support !!!
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
chdir() to /awx_devel/
your processes number limit is 1048576
your memory page size is 4096 bytes
 *** WARNING: you have enabled harakiri without post buffering. Slow upload could be rejected on post-unbuffered webservers ***
detected max file descriptor number: 1048576
lock engine: pthread robust mutexes
thunder lock: disabled (you can enable it with --thunder-lock)
uwsgi socket 0 bound to TCP address 127.0.0.1:8050 fd 3
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
Python version: 3.9.21 (main, Feb 10 2025, 00:00:00)  [GCC 11.5.0 20240719 (Red Hat 11.5.0-5)]
PEP 405 virtualenv detected: /var/lib/awx/venv/awx
Set PythonHome to /var/lib/awx/venv/awx
*** Python threads support is disabled. You can enable it with --enable-threads ***
Python main interpreter initialized at 0x20e4b70
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
your server socket listen backlog is limited to 100 connections
your mercy for graceful operations on workers is 60 seconds
mapped 609552 bytes (595 KB) for 5 cores
*** Operational MODE: preforking ***
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
*** uWSGI is running in multiple interpreter mode ***
spawned uWSGI master process (pid: 746)
spawned uWSGI worker 1 (pid: 747, cores: 1)
spawned uWSGI worker 2 (pid: 748, cores: 1)
spawned uWSGI worker 3 (pid: 749, cores: 1)
spawned uWSGI worker 4 (pid: 750, cores: 1)
spawned uWSGI worker 5 (pid: 751, cores: 1)
*** Stats server enabled on /tmp/stats.socket fd: 17 ***
[root@nodehub _sources]# podman logs 6b0bd1f309bd
[ -d "/awx_devel/awx.egg-info" ] || python3.9 /awx_devel/tools/scripts/egg_info_dev
cp -f /tmp/awx.egg-link /var/lib/awx/venv/awx/lib/python3.9/site-packages/awx.egg-link
mkdir -p /var/lib/awx/; \
if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
python3.9 -c "import awx; print(awx.__version__)" > /var/lib/awx/.awx_version; \

if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
awx-manage migrate --noinput
Operations to perform:
  Apply all migrations: auth, conf, contenttypes, main, oauth2_provider, sessions, sites, social_django, sso, taggit
Running migrations:
  No migrations to apply.
Admin password: CCWIdjRTMfbXuNgAslLJ
(changed: False)
(changed: False)
Instance already registered awx_1
Instance Group already registered controlplane
Instance Group already registered default
Instance already registered receptor-hop
0 new peer links added to the database.
Instance already registered receptor-1
0 new peer links added to the database.
Instance already registered receptor-2
0 new peer links added to the database.
/usr/local/lib/python3.9/site-packages/supervisor/options.py:474: UserWarning: Supervisord is running as root and it is searching for its configuration file in default locations (including its current working directory); you probably want to specify a "-c" argument specifying an absolute path to a configuration file for improved security.
  self.warnings.warn(
2025-06-12 06:39:31,701 CRIT Supervisor is running as root.  Privileges were not dropped because no user is specified in the config file.  If you intend to run as root, you can set user=root in the config file to avoid this message.
2025-06-12 06:39:31,707 INFO RPC interface 'supervisor' initialized
2025-06-12 06:39:31,707 CRIT Server 'unix_http_server' running without any HTTP authentication checking
2025-06-12 06:39:31,707 INFO supervisord started with pid 305
2025-06-12 06:39:32,711 INFO spawned: 'stdout' with pid 306
2025-06-12 06:39:32,713 INFO spawned: 'superwatcher' with pid 307
2025-06-12 06:39:32,714 INFO spawned: 'awx-dispatcher' with pid 308
2025-06-12 06:39:32,716 INFO spawned: 'awx-receiver' with pid 309
2025-06-12 06:39:32,717 INFO spawned: 'awx-uwsgi' with pid 310
2025-06-12 06:39:32,719 INFO spawned: 'awx-daphne' with pid 311
2025-06-12 06:39:32,721 INFO spawned: 'awx-nginx' with pid 312
2025-06-12 06:39:32,723 INFO spawned: 'awx-wsbroadcast' with pid 313
2025-06-12 06:39:32,725 INFO spawned: 'awx-rsyslogd' with pid 315
2025-06-12 06:39:32,727 INFO spawned: 'awx-autoreload' with pid 316
2025-06-12 06:39:32,739 INFO spawned: 'awx-receptor' with pid 317
READY
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
2025-06-12 06:39:33,810 INFO success: stdout entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,811 INFO success: superwatcher entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,811 INFO success: awx-dispatcher entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,811 INFO success: awx-receiver entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-uwsgi entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-daphne entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-nginx entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-wsbroadcast entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-rsyslogd entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-autoreload entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-receptor entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
awx-autoreload stdout | make[1]: Entering directory '/awx_devel'
awx-autoreload stdout |
INFO 2025/06/12 06:39:34 Running control service control {"node_id":"awx_1"}
INFO 2025/06/12 06:39:34 Initialization complete
nginx -g "daemon off;"
2025-06-12 06:39:38,506 INFO     [-] daphne.cli Starting server at tcp:port=8051:interface=127.0.0.1
2025-06-12 06:39:38,506 INFO     Starting server at tcp:port=8051:interface=127.0.0.1
2025-06-12 06:39:38,512 INFO     [-] daphne.server HTTP/2 support not enabled (install the http2 and tls Twisted extras)
2025-06-12 06:39:38,512 INFO     HTTP/2 support not enabled (install the http2 and tls Twisted extras)
2025-06-12 06:39:38,512 INFO     [-] daphne.server Configuring endpoint tcp:port=8051:interface=127.0.0.1
2025-06-12 06:39:38,512 INFO     Configuring endpoint tcp:port=8051:interface=127.0.0.1
2025-06-12 06:39:38,513 INFO     [-] daphne.server Listening on TCP address 127.0.0.1:8051
2025-06-12 06:39:38,513 INFO     Listening on TCP address 127.0.0.1:8051
*** Starting uWSGI 2.0.18 (64bit) on [Thu Jun 12 06:39:39 2025] ***
compiled with version: 11.5.0 20240719 (Red Hat 11.5.0-5) on 09 June 2025 00:48:49
os: Linux-5.14.0-503.21.1.el9_5.x86_64 #1 SMP PREEMPT_DYNAMIC Thu Dec 19 09:37:00 EST 2024
nodename: awx_1
machine: x86_64
clock source: unix
detected number of CPU cores: 4
current working directory: /awx_devel
detected binary path: /var/lib/awx/venv/awx/bin/uwsgi
!!! no internal routing support, rebuild with pcre support !!!
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
chdir() to /awx_devel/
your processes number limit is 1048576
your memory page size is 4096 bytes
 *** WARNING: you have enabled harakiri without post buffering. Slow upload could be rejected on post-unbuffered webservers ***
detected max file descriptor number: 1048576
lock engine: pthread robust mutexes
thunder lock: disabled (you can enable it with --thunder-lock)
uwsgi socket 0 bound to TCP address 127.0.0.1:8050 fd 3
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
Python version: 3.9.21 (main, Feb 10 2025, 00:00:00)  [GCC 11.5.0 20240719 (Red Hat 11.5.0-5)]
PEP 405 virtualenv detected: /var/lib/awx/venv/awx
Set PythonHome to /var/lib/awx/venv/awx
*** Python threads support is disabled. You can enable it with --enable-threads ***
Python main interpreter initialized at 0x20e4b70
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
your server socket listen backlog is limited to 100 connections
your mercy for graceful operations on workers is 60 seconds
mapped 609552 bytes (595 KB) for 5 cores
*** Operational MODE: preforking ***
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
*** uWSGI is running in multiple interpreter mode ***
spawned uWSGI master process (pid: 746)
spawned uWSGI worker 1 (pid: 747, cores: 1)
spawned uWSGI worker 2 (pid: 748, cores: 1)
spawned uWSGI worker 3 (pid: 749, cores: 1)
spawned uWSGI worker 4 (pid: 750, cores: 1)
spawned uWSGI worker 5 (pid: 751, cores: 1)
*** Stats server enabled on /tmp/stats.socket fd: 17 ***
2025-06-12 06:39:39,951 INFO     [-] awx.main.wsbroadcast Active instance with hostname awx_1 is registered.
2025-06-12 06:39:40,472 WARNING  [-] awx.main.dispatch.periodic periodic beat started
2025-06-12 06:39:40,556 INFO     [-] awx.main.dispatch Running worker dispatcher listening to queues ['tower_broadcast_all', 'awx_1']
[root@nodehub _sources]# podman logs 6b0bd1f309bd
[ -d "/awx_devel/awx.egg-info" ] || python3.9 /awx_devel/tools/scripts/egg_info_dev
cp -f /tmp/awx.egg-link /var/lib/awx/venv/awx/lib/python3.9/site-packages/awx.egg-link
mkdir -p /var/lib/awx/; \
if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
python3.9 -c "import awx; print(awx.__version__)" > /var/lib/awx/.awx_version; \

if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
awx-manage migrate --noinput
Operations to perform:
  Apply all migrations: auth, conf, contenttypes, main, oauth2_provider, sessions, sites, social_django, sso, taggit
Running migrations:
  No migrations to apply.
Admin password: CCWIdjRTMfbXuNgAslLJ
(changed: False)
(changed: False)
Instance already registered awx_1
Instance Group already registered controlplane
Instance Group already registered default
Instance already registered receptor-hop
0 new peer links added to the database.
Instance already registered receptor-1
0 new peer links added to the database.
Instance already registered receptor-2
0 new peer links added to the database.
/usr/local/lib/python3.9/site-packages/supervisor/options.py:474: UserWarning: Supervisord is running as root and it is searching for its configuration file in default locations (including its current working directory); you probably want to specify a "-c" argument specifying an absolute path to a configuration file for improved security.
  self.warnings.warn(
2025-06-12 06:39:31,701 CRIT Supervisor is running as root.  Privileges were not dropped because no user is specified in the config file.  If you intend to run as root, you can set user=root in the config file to avoid this message.
2025-06-12 06:39:31,707 INFO RPC interface 'supervisor' initialized
2025-06-12 06:39:31,707 CRIT Server 'unix_http_server' running without any HTTP authentication checking
2025-06-12 06:39:31,707 INFO supervisord started with pid 305
2025-06-12 06:39:32,711 INFO spawned: 'stdout' with pid 306
2025-06-12 06:39:32,713 INFO spawned: 'superwatcher' with pid 307
2025-06-12 06:39:32,714 INFO spawned: 'awx-dispatcher' with pid 308
2025-06-12 06:39:32,716 INFO spawned: 'awx-receiver' with pid 309
2025-06-12 06:39:32,717 INFO spawned: 'awx-uwsgi' with pid 310
2025-06-12 06:39:32,719 INFO spawned: 'awx-daphne' with pid 311
2025-06-12 06:39:32,721 INFO spawned: 'awx-nginx' with pid 312
2025-06-12 06:39:32,723 INFO spawned: 'awx-wsbroadcast' with pid 313
2025-06-12 06:39:32,725 INFO spawned: 'awx-rsyslogd' with pid 315
2025-06-12 06:39:32,727 INFO spawned: 'awx-autoreload' with pid 316
2025-06-12 06:39:32,739 INFO spawned: 'awx-receptor' with pid 317
READY
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
2025-06-12 06:39:33,810 INFO success: stdout entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,811 INFO success: superwatcher entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,811 INFO success: awx-dispatcher entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,811 INFO success: awx-receiver entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-uwsgi entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-daphne entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-nginx entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-wsbroadcast entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-rsyslogd entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-autoreload entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-receptor entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
awx-autoreload stdout | make[1]: Entering directory '/awx_devel'
awx-autoreload stdout |
INFO 2025/06/12 06:39:34 Running control service control {"node_id":"awx_1"}
INFO 2025/06/12 06:39:34 Initialization complete
nginx -g "daemon off;"
2025-06-12 06:39:38,506 INFO     [-] daphne.cli Starting server at tcp:port=8051:interface=127.0.0.1
2025-06-12 06:39:38,506 INFO     Starting server at tcp:port=8051:interface=127.0.0.1
2025-06-12 06:39:38,512 INFO     [-] daphne.server HTTP/2 support not enabled (install the http2 and tls Twisted extras)
2025-06-12 06:39:38,512 INFO     HTTP/2 support not enabled (install the http2 and tls Twisted extras)
2025-06-12 06:39:38,512 INFO     [-] daphne.server Configuring endpoint tcp:port=8051:interface=127.0.0.1
2025-06-12 06:39:38,512 INFO     Configuring endpoint tcp:port=8051:interface=127.0.0.1
2025-06-12 06:39:38,513 INFO     [-] daphne.server Listening on TCP address 127.0.0.1:8051
2025-06-12 06:39:38,513 INFO     Listening on TCP address 127.0.0.1:8051
*** Starting uWSGI 2.0.18 (64bit) on [Thu Jun 12 06:39:39 2025] ***
compiled with version: 11.5.0 20240719 (Red Hat 11.5.0-5) on 09 June 2025 00:48:49
os: Linux-5.14.0-503.21.1.el9_5.x86_64 #1 SMP PREEMPT_DYNAMIC Thu Dec 19 09:37:00 EST 2024
nodename: awx_1
machine: x86_64
clock source: unix
detected number of CPU cores: 4
current working directory: /awx_devel
detected binary path: /var/lib/awx/venv/awx/bin/uwsgi
!!! no internal routing support, rebuild with pcre support !!!
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
chdir() to /awx_devel/
your processes number limit is 1048576
your memory page size is 4096 bytes
 *** WARNING: you have enabled harakiri without post buffering. Slow upload could be rejected on post-unbuffered webservers ***
detected max file descriptor number: 1048576
lock engine: pthread robust mutexes
thunder lock: disabled (you can enable it with --thunder-lock)
uwsgi socket 0 bound to TCP address 127.0.0.1:8050 fd 3
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
Python version: 3.9.21 (main, Feb 10 2025, 00:00:00)  [GCC 11.5.0 20240719 (Red Hat 11.5.0-5)]
PEP 405 virtualenv detected: /var/lib/awx/venv/awx
Set PythonHome to /var/lib/awx/venv/awx
*** Python threads support is disabled. You can enable it with --enable-threads ***
Python main interpreter initialized at 0x20e4b70
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
your server socket listen backlog is limited to 100 connections
your mercy for graceful operations on workers is 60 seconds
mapped 609552 bytes (595 KB) for 5 cores
*** Operational MODE: preforking ***
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
*** uWSGI is running in multiple interpreter mode ***
spawned uWSGI master process (pid: 746)
spawned uWSGI worker 1 (pid: 747, cores: 1)
spawned uWSGI worker 2 (pid: 748, cores: 1)
spawned uWSGI worker 3 (pid: 749, cores: 1)
spawned uWSGI worker 4 (pid: 750, cores: 1)
spawned uWSGI worker 5 (pid: 751, cores: 1)
*** Stats server enabled on /tmp/stats.socket fd: 17 ***
2025-06-12 06:39:39,951 INFO     [-] awx.main.wsbroadcast Active instance with hostname awx_1 is registered.
2025-06-12 06:39:40,472 WARNING  [-] awx.main.dispatch.periodic periodic beat started
2025-06-12 06:39:40,556 INFO     [-] awx.main.dispatch Running worker dispatcher listening to queues ['tower_broadcast_all', 'awx_1']
2025-06-12 06:39:40,936 WARNING  [-] awx.main.tasks.system Rejoining the cluster as instance awx_1. Prior last_seen 2025-06-09 07:01:46.584278+00:00
2025-06-12 06:39:41,410 INFO waiting for awx-rsyslogd to stop
2025-06-12 06:39:41,413 INFO stopped: awx-rsyslogd (exit status 0)
2025-06-12 06:39:41,418 INFO spawned: 'awx-rsyslogd' with pid 763
[root@nodehub _sources]# podman logs 6b0bd1f309bd
[ -d "/awx_devel/awx.egg-info" ] || python3.9 /awx_devel/tools/scripts/egg_info_dev
cp -f /tmp/awx.egg-link /var/lib/awx/venv/awx/lib/python3.9/site-packages/awx.egg-link
mkdir -p /var/lib/awx/; \
if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
python3.9 -c "import awx; print(awx.__version__)" > /var/lib/awx/.awx_version; \

if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
awx-manage migrate --noinput
Operations to perform:
  Apply all migrations: auth, conf, contenttypes, main, oauth2_provider, sessions, sites, social_django, sso, taggit
Running migrations:
  No migrations to apply.
Admin password: CCWIdjRTMfbXuNgAslLJ
(changed: False)
(changed: False)
Instance already registered awx_1
Instance Group already registered controlplane
Instance Group already registered default
Instance already registered receptor-hop
0 new peer links added to the database.
Instance already registered receptor-1
0 new peer links added to the database.
Instance already registered receptor-2
0 new peer links added to the database.
/usr/local/lib/python3.9/site-packages/supervisor/options.py:474: UserWarning: Supervisord is running as root and it is searching for its configuration file in default locations (including its current working directory); you probably want to specify a "-c" argument specifying an absolute path to a configuration file for improved security.
  self.warnings.warn(
2025-06-12 06:39:31,701 CRIT Supervisor is running as root.  Privileges were not dropped because no user is specified in the config file.  If you intend to run as root, you can set user=root in the config file to avoid this message.
2025-06-12 06:39:31,707 INFO RPC interface 'supervisor' initialized
2025-06-12 06:39:31,707 CRIT Server 'unix_http_server' running without any HTTP authentication checking
2025-06-12 06:39:31,707 INFO supervisord started with pid 305
2025-06-12 06:39:32,711 INFO spawned: 'stdout' with pid 306
2025-06-12 06:39:32,713 INFO spawned: 'superwatcher' with pid 307
2025-06-12 06:39:32,714 INFO spawned: 'awx-dispatcher' with pid 308
2025-06-12 06:39:32,716 INFO spawned: 'awx-receiver' with pid 309
2025-06-12 06:39:32,717 INFO spawned: 'awx-uwsgi' with pid 310
2025-06-12 06:39:32,719 INFO spawned: 'awx-daphne' with pid 311
2025-06-12 06:39:32,721 INFO spawned: 'awx-nginx' with pid 312
2025-06-12 06:39:32,723 INFO spawned: 'awx-wsbroadcast' with pid 313
2025-06-12 06:39:32,725 INFO spawned: 'awx-rsyslogd' with pid 315
2025-06-12 06:39:32,727 INFO spawned: 'awx-autoreload' with pid 316
2025-06-12 06:39:32,739 INFO spawned: 'awx-receptor' with pid 317
READY
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
2025-06-12 06:39:33,810 INFO success: stdout entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,811 INFO success: superwatcher entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,811 INFO success: awx-dispatcher entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,811 INFO success: awx-receiver entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-uwsgi entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-daphne entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-nginx entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-wsbroadcast entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-rsyslogd entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-autoreload entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-receptor entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
awx-autoreload stdout | make[1]: Entering directory '/awx_devel'
awx-autoreload stdout |
INFO 2025/06/12 06:39:34 Running control service control {"node_id":"awx_1"}
INFO 2025/06/12 06:39:34 Initialization complete
nginx -g "daemon off;"
2025-06-12 06:39:38,506 INFO     [-] daphne.cli Starting server at tcp:port=8051:interface=127.0.0.1
2025-06-12 06:39:38,506 INFO     Starting server at tcp:port=8051:interface=127.0.0.1
2025-06-12 06:39:38,512 INFO     [-] daphne.server HTTP/2 support not enabled (install the http2 and tls Twisted extras)
2025-06-12 06:39:38,512 INFO     HTTP/2 support not enabled (install the http2 and tls Twisted extras)
2025-06-12 06:39:38,512 INFO     [-] daphne.server Configuring endpoint tcp:port=8051:interface=127.0.0.1
2025-06-12 06:39:38,512 INFO     Configuring endpoint tcp:port=8051:interface=127.0.0.1
2025-06-12 06:39:38,513 INFO     [-] daphne.server Listening on TCP address 127.0.0.1:8051
2025-06-12 06:39:38,513 INFO     Listening on TCP address 127.0.0.1:8051
*** Starting uWSGI 2.0.18 (64bit) on [Thu Jun 12 06:39:39 2025] ***
compiled with version: 11.5.0 20240719 (Red Hat 11.5.0-5) on 09 June 2025 00:48:49
os: Linux-5.14.0-503.21.1.el9_5.x86_64 #1 SMP PREEMPT_DYNAMIC Thu Dec 19 09:37:00 EST 2024
nodename: awx_1
machine: x86_64
clock source: unix
detected number of CPU cores: 4
current working directory: /awx_devel
detected binary path: /var/lib/awx/venv/awx/bin/uwsgi
!!! no internal routing support, rebuild with pcre support !!!
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
chdir() to /awx_devel/
your processes number limit is 1048576
your memory page size is 4096 bytes
 *** WARNING: you have enabled harakiri without post buffering. Slow upload could be rejected on post-unbuffered webservers ***
detected max file descriptor number: 1048576
lock engine: pthread robust mutexes
thunder lock: disabled (you can enable it with --thunder-lock)
uwsgi socket 0 bound to TCP address 127.0.0.1:8050 fd 3
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
Python version: 3.9.21 (main, Feb 10 2025, 00:00:00)  [GCC 11.5.0 20240719 (Red Hat 11.5.0-5)]
PEP 405 virtualenv detected: /var/lib/awx/venv/awx
Set PythonHome to /var/lib/awx/venv/awx
*** Python threads support is disabled. You can enable it with --enable-threads ***
Python main interpreter initialized at 0x20e4b70
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
your server socket listen backlog is limited to 100 connections
your mercy for graceful operations on workers is 60 seconds
mapped 609552 bytes (595 KB) for 5 cores
*** Operational MODE: preforking ***
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
*** uWSGI is running in multiple interpreter mode ***
spawned uWSGI master process (pid: 746)
spawned uWSGI worker 1 (pid: 747, cores: 1)
spawned uWSGI worker 2 (pid: 748, cores: 1)
spawned uWSGI worker 3 (pid: 749, cores: 1)
spawned uWSGI worker 4 (pid: 750, cores: 1)
spawned uWSGI worker 5 (pid: 751, cores: 1)
*** Stats server enabled on /tmp/stats.socket fd: 17 ***
2025-06-12 06:39:39,951 INFO     [-] awx.main.wsbroadcast Active instance with hostname awx_1 is registered.
2025-06-12 06:39:40,472 WARNING  [-] awx.main.dispatch.periodic periodic beat started
2025-06-12 06:39:40,556 INFO     [-] awx.main.dispatch Running worker dispatcher listening to queues ['tower_broadcast_all', 'awx_1']
2025-06-12 06:39:40,936 WARNING  [-] awx.main.tasks.system Rejoining the cluster as instance awx_1. Prior last_seen 2025-06-09 07:01:46.584278+00:00
2025-06-12 06:39:41,410 INFO waiting for awx-rsyslogd to stop
2025-06-12 06:39:41,413 INFO stopped: awx-rsyslogd (exit status 0)
2025-06-12 06:39:41,418 INFO spawned: 'awx-rsyslogd' with pid 763
2025-06-12 06:39:42,425 INFO success: awx-rsyslogd entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x20e4b70 pid: 747 (default app)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x20e4b70 pid: 750 (default app)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x20e4b70 pid: 748 (default app)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x20e4b70 pid: 749 (default app)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x20e4b70 pid: 751 (default app)
[root@nodehub _sources]# podman logs 6b0bd1f309bd
[ -d "/awx_devel/awx.egg-info" ] || python3.9 /awx_devel/tools/scripts/egg_info_dev
cp -f /tmp/awx.egg-link /var/lib/awx/venv/awx/lib/python3.9/site-packages/awx.egg-link
mkdir -p /var/lib/awx/; \
if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
python3.9 -c "import awx; print(awx.__version__)" > /var/lib/awx/.awx_version; \

if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
awx-manage migrate --noinput
Operations to perform:
  Apply all migrations: auth, conf, contenttypes, main, oauth2_provider, sessions, sites, social_django, sso, taggit
Running migrations:
  No migrations to apply.
Admin password: CCWIdjRTMfbXuNgAslLJ
(changed: False)
(changed: False)
Instance already registered awx_1
Instance Group already registered controlplane
Instance Group already registered default
Instance already registered receptor-hop
0 new peer links added to the database.
Instance already registered receptor-1
0 new peer links added to the database.
Instance already registered receptor-2
0 new peer links added to the database.
/usr/local/lib/python3.9/site-packages/supervisor/options.py:474: UserWarning: Supervisord is running as root and it is searching for its configuration file in default locations (including its current working directory); you probably want to specify a "-c" argument specifying an absolute path to a configuration file for improved security.
  self.warnings.warn(
2025-06-12 06:39:31,701 CRIT Supervisor is running as root.  Privileges were not dropped because no user is specified in the config file.  If you intend to run as root, you can set user=root in the config file to avoid this message.
2025-06-12 06:39:31,707 INFO RPC interface 'supervisor' initialized
2025-06-12 06:39:31,707 CRIT Server 'unix_http_server' running without any HTTP authentication checking
2025-06-12 06:39:31,707 INFO supervisord started with pid 305
2025-06-12 06:39:32,711 INFO spawned: 'stdout' with pid 306
2025-06-12 06:39:32,713 INFO spawned: 'superwatcher' with pid 307
2025-06-12 06:39:32,714 INFO spawned: 'awx-dispatcher' with pid 308
2025-06-12 06:39:32,716 INFO spawned: 'awx-receiver' with pid 309
2025-06-12 06:39:32,717 INFO spawned: 'awx-uwsgi' with pid 310
2025-06-12 06:39:32,719 INFO spawned: 'awx-daphne' with pid 311
2025-06-12 06:39:32,721 INFO spawned: 'awx-nginx' with pid 312
2025-06-12 06:39:32,723 INFO spawned: 'awx-wsbroadcast' with pid 313
2025-06-12 06:39:32,725 INFO spawned: 'awx-rsyslogd' with pid 315
2025-06-12 06:39:32,727 INFO spawned: 'awx-autoreload' with pid 316
2025-06-12 06:39:32,739 INFO spawned: 'awx-receptor' with pid 317
READY
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
2025-06-12 06:39:33,810 INFO success: stdout entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,811 INFO success: superwatcher entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,811 INFO success: awx-dispatcher entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,811 INFO success: awx-receiver entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-uwsgi entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-daphne entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-nginx entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-wsbroadcast entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-rsyslogd entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-autoreload entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-receptor entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
awx-autoreload stdout | make[1]: Entering directory '/awx_devel'
awx-autoreload stdout |
INFO 2025/06/12 06:39:34 Running control service control {"node_id":"awx_1"}
INFO 2025/06/12 06:39:34 Initialization complete
nginx -g "daemon off;"
2025-06-12 06:39:38,506 INFO     [-] daphne.cli Starting server at tcp:port=8051:interface=127.0.0.1
2025-06-12 06:39:38,506 INFO     Starting server at tcp:port=8051:interface=127.0.0.1
2025-06-12 06:39:38,512 INFO     [-] daphne.server HTTP/2 support not enabled (install the http2 and tls Twisted extras)
2025-06-12 06:39:38,512 INFO     HTTP/2 support not enabled (install the http2 and tls Twisted extras)
2025-06-12 06:39:38,512 INFO     [-] daphne.server Configuring endpoint tcp:port=8051:interface=127.0.0.1
2025-06-12 06:39:38,512 INFO     Configuring endpoint tcp:port=8051:interface=127.0.0.1
2025-06-12 06:39:38,513 INFO     [-] daphne.server Listening on TCP address 127.0.0.1:8051
2025-06-12 06:39:38,513 INFO     Listening on TCP address 127.0.0.1:8051
*** Starting uWSGI 2.0.18 (64bit) on [Thu Jun 12 06:39:39 2025] ***
compiled with version: 11.5.0 20240719 (Red Hat 11.5.0-5) on 09 June 2025 00:48:49
os: Linux-5.14.0-503.21.1.el9_5.x86_64 #1 SMP PREEMPT_DYNAMIC Thu Dec 19 09:37:00 EST 2024
nodename: awx_1
machine: x86_64
clock source: unix
detected number of CPU cores: 4
current working directory: /awx_devel
detected binary path: /var/lib/awx/venv/awx/bin/uwsgi
!!! no internal routing support, rebuild with pcre support !!!
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
chdir() to /awx_devel/
your processes number limit is 1048576
your memory page size is 4096 bytes
 *** WARNING: you have enabled harakiri without post buffering. Slow upload could be rejected on post-unbuffered webservers ***
detected max file descriptor number: 1048576
lock engine: pthread robust mutexes
thunder lock: disabled (you can enable it with --thunder-lock)
uwsgi socket 0 bound to TCP address 127.0.0.1:8050 fd 3
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
Python version: 3.9.21 (main, Feb 10 2025, 00:00:00)  [GCC 11.5.0 20240719 (Red Hat 11.5.0-5)]
PEP 405 virtualenv detected: /var/lib/awx/venv/awx
Set PythonHome to /var/lib/awx/venv/awx
*** Python threads support is disabled. You can enable it with --enable-threads ***
Python main interpreter initialized at 0x20e4b70
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
your server socket listen backlog is limited to 100 connections
your mercy for graceful operations on workers is 60 seconds
mapped 609552 bytes (595 KB) for 5 cores
*** Operational MODE: preforking ***
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
*** uWSGI is running in multiple interpreter mode ***
spawned uWSGI master process (pid: 746)
spawned uWSGI worker 1 (pid: 747, cores: 1)
spawned uWSGI worker 2 (pid: 748, cores: 1)
spawned uWSGI worker 3 (pid: 749, cores: 1)
spawned uWSGI worker 4 (pid: 750, cores: 1)
spawned uWSGI worker 5 (pid: 751, cores: 1)
*** Stats server enabled on /tmp/stats.socket fd: 17 ***
2025-06-12 06:39:39,951 INFO     [-] awx.main.wsbroadcast Active instance with hostname awx_1 is registered.
2025-06-12 06:39:40,472 WARNING  [-] awx.main.dispatch.periodic periodic beat started
2025-06-12 06:39:40,556 INFO     [-] awx.main.dispatch Running worker dispatcher listening to queues ['tower_broadcast_all', 'awx_1']
2025-06-12 06:39:40,936 WARNING  [-] awx.main.tasks.system Rejoining the cluster as instance awx_1. Prior last_seen 2025-06-09 07:01:46.584278+00:00
2025-06-12 06:39:41,410 INFO waiting for awx-rsyslogd to stop
2025-06-12 06:39:41,413 INFO stopped: awx-rsyslogd (exit status 0)
2025-06-12 06:39:41,418 INFO spawned: 'awx-rsyslogd' with pid 763
2025-06-12 06:39:42,425 INFO success: awx-rsyslogd entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x20e4b70 pid: 747 (default app)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x20e4b70 pid: 750 (default app)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x20e4b70 pid: 748 (default app)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x20e4b70 pid: 749 (default app)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x20e4b70 pid: 751 (default app)
[root@nodehub _sources]# podman logs 6b0bd1f309bd
[ -d "/awx_devel/awx.egg-info" ] || python3.9 /awx_devel/tools/scripts/egg_info_dev
cp -f /tmp/awx.egg-link /var/lib/awx/venv/awx/lib/python3.9/site-packages/awx.egg-link
mkdir -p /var/lib/awx/; \
if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
python3.9 -c "import awx; print(awx.__version__)" > /var/lib/awx/.awx_version; \

if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
awx-manage migrate --noinput
Operations to perform:
  Apply all migrations: auth, conf, contenttypes, main, oauth2_provider, sessions, sites, social_django, sso, taggit
Running migrations:
  No migrations to apply.
Admin password: CCWIdjRTMfbXuNgAslLJ
(changed: False)
(changed: False)
Instance already registered awx_1
Instance Group already registered controlplane
Instance Group already registered default
Instance already registered receptor-hop
0 new peer links added to the database.
Instance already registered receptor-1
0 new peer links added to the database.
Instance already registered receptor-2
0 new peer links added to the database.
/usr/local/lib/python3.9/site-packages/supervisor/options.py:474: UserWarning: Supervisord is running as root and it is searching for its configuration file in default locations (including its current working directory); you probably want to specify a "-c" argument specifying an absolute path to a configuration file for improved security.
  self.warnings.warn(
2025-06-12 06:39:31,701 CRIT Supervisor is running as root.  Privileges were not dropped because no user is specified in the config file.  If you intend to run as root, you can set user=root in the config file to avoid this message.
2025-06-12 06:39:31,707 INFO RPC interface 'supervisor' initialized
2025-06-12 06:39:31,707 CRIT Server 'unix_http_server' running without any HTTP authentication checking
2025-06-12 06:39:31,707 INFO supervisord started with pid 305
2025-06-12 06:39:32,711 INFO spawned: 'stdout' with pid 306
2025-06-12 06:39:32,713 INFO spawned: 'superwatcher' with pid 307
2025-06-12 06:39:32,714 INFO spawned: 'awx-dispatcher' with pid 308
2025-06-12 06:39:32,716 INFO spawned: 'awx-receiver' with pid 309
2025-06-12 06:39:32,717 INFO spawned: 'awx-uwsgi' with pid 310
2025-06-12 06:39:32,719 INFO spawned: 'awx-daphne' with pid 311
2025-06-12 06:39:32,721 INFO spawned: 'awx-nginx' with pid 312
2025-06-12 06:39:32,723 INFO spawned: 'awx-wsbroadcast' with pid 313
2025-06-12 06:39:32,725 INFO spawned: 'awx-rsyslogd' with pid 315
2025-06-12 06:39:32,727 INFO spawned: 'awx-autoreload' with pid 316
2025-06-12 06:39:32,739 INFO spawned: 'awx-receptor' with pid 317
READY
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
2025-06-12 06:39:33,810 INFO success: stdout entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,811 INFO success: superwatcher entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,811 INFO success: awx-dispatcher entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,811 INFO success: awx-receiver entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-uwsgi entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-daphne entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-nginx entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-wsbroadcast entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-rsyslogd entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-autoreload entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-receptor entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
awx-autoreload stdout | make[1]: Entering directory '/awx_devel'
awx-autoreload stdout |
INFO 2025/06/12 06:39:34 Running control service control {"node_id":"awx_1"}
INFO 2025/06/12 06:39:34 Initialization complete
nginx -g "daemon off;"
2025-06-12 06:39:38,506 INFO     [-] daphne.cli Starting server at tcp:port=8051:interface=127.0.0.1
2025-06-12 06:39:38,506 INFO     Starting server at tcp:port=8051:interface=127.0.0.1
2025-06-12 06:39:38,512 INFO     [-] daphne.server HTTP/2 support not enabled (install the http2 and tls Twisted extras)
2025-06-12 06:39:38,512 INFO     HTTP/2 support not enabled (install the http2 and tls Twisted extras)
2025-06-12 06:39:38,512 INFO     [-] daphne.server Configuring endpoint tcp:port=8051:interface=127.0.0.1
2025-06-12 06:39:38,512 INFO     Configuring endpoint tcp:port=8051:interface=127.0.0.1
2025-06-12 06:39:38,513 INFO     [-] daphne.server Listening on TCP address 127.0.0.1:8051
2025-06-12 06:39:38,513 INFO     Listening on TCP address 127.0.0.1:8051
*** Starting uWSGI 2.0.18 (64bit) on [Thu Jun 12 06:39:39 2025] ***
compiled with version: 11.5.0 20240719 (Red Hat 11.5.0-5) on 09 June 2025 00:48:49
os: Linux-5.14.0-503.21.1.el9_5.x86_64 #1 SMP PREEMPT_DYNAMIC Thu Dec 19 09:37:00 EST 2024
nodename: awx_1
machine: x86_64
clock source: unix
detected number of CPU cores: 4
current working directory: /awx_devel
detected binary path: /var/lib/awx/venv/awx/bin/uwsgi
!!! no internal routing support, rebuild with pcre support !!!
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
chdir() to /awx_devel/
your processes number limit is 1048576
your memory page size is 4096 bytes
 *** WARNING: you have enabled harakiri without post buffering. Slow upload could be rejected on post-unbuffered webservers ***
detected max file descriptor number: 1048576
lock engine: pthread robust mutexes
thunder lock: disabled (you can enable it with --thunder-lock)
uwsgi socket 0 bound to TCP address 127.0.0.1:8050 fd 3
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
Python version: 3.9.21 (main, Feb 10 2025, 00:00:00)  [GCC 11.5.0 20240719 (Red Hat 11.5.0-5)]
PEP 405 virtualenv detected: /var/lib/awx/venv/awx
Set PythonHome to /var/lib/awx/venv/awx
*** Python threads support is disabled. You can enable it with --enable-threads ***
Python main interpreter initialized at 0x20e4b70
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
your server socket listen backlog is limited to 100 connections
your mercy for graceful operations on workers is 60 seconds
mapped 609552 bytes (595 KB) for 5 cores
*** Operational MODE: preforking ***
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
*** uWSGI is running in multiple interpreter mode ***
spawned uWSGI master process (pid: 746)
spawned uWSGI worker 1 (pid: 747, cores: 1)
spawned uWSGI worker 2 (pid: 748, cores: 1)
spawned uWSGI worker 3 (pid: 749, cores: 1)
spawned uWSGI worker 4 (pid: 750, cores: 1)
spawned uWSGI worker 5 (pid: 751, cores: 1)
*** Stats server enabled on /tmp/stats.socket fd: 17 ***
2025-06-12 06:39:39,951 INFO     [-] awx.main.wsbroadcast Active instance with hostname awx_1 is registered.
2025-06-12 06:39:40,472 WARNING  [-] awx.main.dispatch.periodic periodic beat started
2025-06-12 06:39:40,556 INFO     [-] awx.main.dispatch Running worker dispatcher listening to queues ['tower_broadcast_all', 'awx_1']
2025-06-12 06:39:40,936 WARNING  [-] awx.main.tasks.system Rejoining the cluster as instance awx_1. Prior last_seen 2025-06-09 07:01:46.584278+00:00
2025-06-12 06:39:41,410 INFO waiting for awx-rsyslogd to stop
2025-06-12 06:39:41,413 INFO stopped: awx-rsyslogd (exit status 0)
2025-06-12 06:39:41,418 INFO spawned: 'awx-rsyslogd' with pid 763
2025-06-12 06:39:42,425 INFO success: awx-rsyslogd entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x20e4b70 pid: 747 (default app)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x20e4b70 pid: 750 (default app)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x20e4b70 pid: 748 (default app)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x20e4b70 pid: 749 (default app)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x20e4b70 pid: 751 (default app)
[root@nodehub _sources]# podman logs 6b0bd1f309bd
[ -d "/awx_devel/awx.egg-info" ] || python3.9 /awx_devel/tools/scripts/egg_info_dev
cp -f /tmp/awx.egg-link /var/lib/awx/venv/awx/lib/python3.9/site-packages/awx.egg-link
mkdir -p /var/lib/awx/; \
if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
python3.9 -c "import awx; print(awx.__version__)" > /var/lib/awx/.awx_version; \

if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
awx-manage migrate --noinput
Operations to perform:
  Apply all migrations: auth, conf, contenttypes, main, oauth2_provider, sessions, sites, social_django, sso, taggit
Running migrations:
  No migrations to apply.
Admin password: CCWIdjRTMfbXuNgAslLJ
(changed: False)
(changed: False)
Instance already registered awx_1
Instance Group already registered controlplane
Instance Group already registered default
Instance already registered receptor-hop
0 new peer links added to the database.
Instance already registered receptor-1
0 new peer links added to the database.
Instance already registered receptor-2
0 new peer links added to the database.
/usr/local/lib/python3.9/site-packages/supervisor/options.py:474: UserWarning: Supervisord is running as root and it is searching for its configuration file in default locations (including its current working directory); you probably want to specify a "-c" argument specifying an absolute path to a configuration file for improved security.
  self.warnings.warn(
2025-06-12 06:39:31,701 CRIT Supervisor is running as root.  Privileges were not dropped because no user is specified in the config file.  If you intend to run as root, you can set user=root in the config file to avoid this message.
2025-06-12 06:39:31,707 INFO RPC interface 'supervisor' initialized
2025-06-12 06:39:31,707 CRIT Server 'unix_http_server' running without any HTTP authentication checking
2025-06-12 06:39:31,707 INFO supervisord started with pid 305
2025-06-12 06:39:32,711 INFO spawned: 'stdout' with pid 306
2025-06-12 06:39:32,713 INFO spawned: 'superwatcher' with pid 307
2025-06-12 06:39:32,714 INFO spawned: 'awx-dispatcher' with pid 308
2025-06-12 06:39:32,716 INFO spawned: 'awx-receiver' with pid 309
2025-06-12 06:39:32,717 INFO spawned: 'awx-uwsgi' with pid 310
2025-06-12 06:39:32,719 INFO spawned: 'awx-daphne' with pid 311
2025-06-12 06:39:32,721 INFO spawned: 'awx-nginx' with pid 312
2025-06-12 06:39:32,723 INFO spawned: 'awx-wsbroadcast' with pid 313
2025-06-12 06:39:32,725 INFO spawned: 'awx-rsyslogd' with pid 315
2025-06-12 06:39:32,727 INFO spawned: 'awx-autoreload' with pid 316
2025-06-12 06:39:32,739 INFO spawned: 'awx-receptor' with pid 317
READY
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
2025-06-12 06:39:33,810 INFO success: stdout entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,811 INFO success: superwatcher entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,811 INFO success: awx-dispatcher entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,811 INFO success: awx-receiver entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-uwsgi entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-daphne entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-nginx entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-wsbroadcast entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-rsyslogd entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-autoreload entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-receptor entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
awx-autoreload stdout | make[1]: Entering directory '/awx_devel'
awx-autoreload stdout |
INFO 2025/06/12 06:39:34 Running control service control {"node_id":"awx_1"}
INFO 2025/06/12 06:39:34 Initialization complete
nginx -g "daemon off;"
2025-06-12 06:39:38,506 INFO     [-] daphne.cli Starting server at tcp:port=8051:interface=127.0.0.1
2025-06-12 06:39:38,506 INFO     Starting server at tcp:port=8051:interface=127.0.0.1
2025-06-12 06:39:38,512 INFO     [-] daphne.server HTTP/2 support not enabled (install the http2 and tls Twisted extras)
2025-06-12 06:39:38,512 INFO     HTTP/2 support not enabled (install the http2 and tls Twisted extras)
2025-06-12 06:39:38,512 INFO     [-] daphne.server Configuring endpoint tcp:port=8051:interface=127.0.0.1
2025-06-12 06:39:38,512 INFO     Configuring endpoint tcp:port=8051:interface=127.0.0.1
2025-06-12 06:39:38,513 INFO     [-] daphne.server Listening on TCP address 127.0.0.1:8051
2025-06-12 06:39:38,513 INFO     Listening on TCP address 127.0.0.1:8051
*** Starting uWSGI 2.0.18 (64bit) on [Thu Jun 12 06:39:39 2025] ***
compiled with version: 11.5.0 20240719 (Red Hat 11.5.0-5) on 09 June 2025 00:48:49
os: Linux-5.14.0-503.21.1.el9_5.x86_64 #1 SMP PREEMPT_DYNAMIC Thu Dec 19 09:37:00 EST 2024
nodename: awx_1
machine: x86_64
clock source: unix
detected number of CPU cores: 4
current working directory: /awx_devel
detected binary path: /var/lib/awx/venv/awx/bin/uwsgi
!!! no internal routing support, rebuild with pcre support !!!
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
chdir() to /awx_devel/
your processes number limit is 1048576
your memory page size is 4096 bytes
 *** WARNING: you have enabled harakiri without post buffering. Slow upload could be rejected on post-unbuffered webservers ***
detected max file descriptor number: 1048576
lock engine: pthread robust mutexes
thunder lock: disabled (you can enable it with --thunder-lock)
uwsgi socket 0 bound to TCP address 127.0.0.1:8050 fd 3
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
Python version: 3.9.21 (main, Feb 10 2025, 00:00:00)  [GCC 11.5.0 20240719 (Red Hat 11.5.0-5)]
PEP 405 virtualenv detected: /var/lib/awx/venv/awx
Set PythonHome to /var/lib/awx/venv/awx
*** Python threads support is disabled. You can enable it with --enable-threads ***
Python main interpreter initialized at 0x20e4b70
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
your server socket listen backlog is limited to 100 connections
your mercy for graceful operations on workers is 60 seconds
mapped 609552 bytes (595 KB) for 5 cores
*** Operational MODE: preforking ***
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
*** uWSGI is running in multiple interpreter mode ***
spawned uWSGI master process (pid: 746)
spawned uWSGI worker 1 (pid: 747, cores: 1)
spawned uWSGI worker 2 (pid: 748, cores: 1)
spawned uWSGI worker 3 (pid: 749, cores: 1)
spawned uWSGI worker 4 (pid: 750, cores: 1)
spawned uWSGI worker 5 (pid: 751, cores: 1)
*** Stats server enabled on /tmp/stats.socket fd: 17 ***
2025-06-12 06:39:39,951 INFO     [-] awx.main.wsbroadcast Active instance with hostname awx_1 is registered.
2025-06-12 06:39:40,472 WARNING  [-] awx.main.dispatch.periodic periodic beat started
2025-06-12 06:39:40,556 INFO     [-] awx.main.dispatch Running worker dispatcher listening to queues ['tower_broadcast_all', 'awx_1']
2025-06-12 06:39:40,936 WARNING  [-] awx.main.tasks.system Rejoining the cluster as instance awx_1. Prior last_seen 2025-06-09 07:01:46.584278+00:00
2025-06-12 06:39:41,410 INFO waiting for awx-rsyslogd to stop
2025-06-12 06:39:41,413 INFO stopped: awx-rsyslogd (exit status 0)
2025-06-12 06:39:41,418 INFO spawned: 'awx-rsyslogd' with pid 763
2025-06-12 06:39:42,425 INFO success: awx-rsyslogd entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x20e4b70 pid: 747 (default app)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x20e4b70 pid: 750 (default app)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x20e4b70 pid: 748 (default app)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x20e4b70 pid: 749 (default app)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x20e4b70 pid: 751 (default app)
INFO 2025/06/12 06:39:46 Connection established with receptor-hop {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 06:39:46 Known Connections: {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 06:39:46    awx_1: receptor-hop(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 06:39:46    receptor-hop: awx_1(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 06:39:46 Routing Table: {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 06:39:46    receptor-hop via receptor-hop {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 06:39:46 Known Connections: {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 06:39:46    awx_1: receptor-hop(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 06:39:46    receptor-hop: awx_1(1.00) receptor-1(1.00) receptor-2(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 06:39:46 Routing Table: {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 06:39:46    receptor-hop via receptor-hop {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 06:39:46 Known Connections: {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 06:39:46    awx_1: receptor-hop(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 06:39:46    receptor-hop: receptor-1(1.00) receptor-2(1.00) awx_1(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 06:39:46    receptor-2: receptor-hop(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 06:39:46    receptor-1: receptor-hop(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 06:39:46 Routing Table: {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 06:39:46    receptor-2 via receptor-hop {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 06:39:46    receptor-1 via receptor-hop {"remote_id":"receptor-hop","node_id":"awx_1"}
INFO 2025/06/12 06:39:46    receptor-hop via receptor-hop {"remote_id":"receptor-hop","node_id":"awx_1"}
192.168.0.10 GET / - HTTP/1.1 200
192.168.0.10 GET /api/ - HTTP/1.1 200
192.168.0.10 GET /api/v2/auth/ - HTTP/1.1 200
192.168.0.10 GET /api/ - HTTP/1.1 200
192.168.0.10 GET /api/login/ - HTTP/1.1 200
2025-06-12 06:40:18,733 WARNING  [2a2035d8] awx.api.generics Login failed for user root from 192.168.0.10
2025-06-12 06:40:18,767 WARNING  [2a2035d8] django.request Unauthorized: /api/login/
2025-06-12 06:40:18,767 WARNING  [2a2035d8] django.request Unauthorized: /api/login/
192.168.0.10 POST /api/login/ - HTTP/1.1 401
[root@nodehub _sources]# podman logs 6b0bd1f309bd
[ -d "/awx_devel/awx.egg-info" ] || python3.9 /awx_devel/tools/scripts/egg_info_dev
cp -f /tmp/awx.egg-link /var/lib/awx/venv/awx/lib/python3.9/site-packages/awx.egg-link
mkdir -p /var/lib/awx/; \
if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
python3.9 -c "import awx; print(awx.__version__)" > /var/lib/awx/.awx_version; \

if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
awx-manage migrate --noinput
Operations to perform:
  Apply all migrations: auth, conf, contenttypes, main, oauth2_provider, sessions, sites, social_django, sso, taggit
Running migrations:
  No migrations to apply.
Admin password: CCWIdjRTMfbXuNgAslLJ
(changed: False)
(changed: False)
Instance already registered awx_1
Instance Group already registered controlplane
Instance Group already registered default
Instance already registered receptor-hop
0 new peer links added to the database.
Instance already registered receptor-1
0 new peer links added to the database.
Instance already registered receptor-2
0 new peer links added to the database.
/usr/local/lib/python3.9/site-packages/supervisor/options.py:474: UserWarning: Supervisord is running as root and it is searching for its configuration file in default locations (including its current working directory); you probably want to specify a "-c" argument specifying an absolute path to a configuration file for improved security.
  self.warnings.warn(
2025-06-12 06:39:31,701 CRIT Supervisor is running as root.  Privileges were not dropped because no user is specified in the config file.  If you intend to run as root, you can set user=root in the config file to avoid this message.
2025-06-12 06:39:31,707 INFO RPC interface 'supervisor' initialized
2025-06-12 06:39:31,707 CRIT Server 'unix_http_server' running without any HTTP authentication checking
2025-06-12 06:39:31,707 INFO supervisord started with pid 305
2025-06-12 06:39:32,711 INFO spawned: 'stdout' with pid 306
2025-06-12 06:39:32,713 INFO spawned: 'superwatcher' with pid 307
2025-06-12 06:39:32,714 INFO spawned: 'awx-dispatcher' with pid 308
2025-06-12 06:39:32,716 INFO spawned: 'awx-receiver' with pid 309
2025-06-12 06:39:32,717 INFO spawned: 'awx-uwsgi' with pid 310
2025-06-12 06:39:32,719 INFO spawned: 'awx-daphne' with pid 311
2025-06-12 06:39:32,721 INFO spawned: 'awx-nginx' with pid 312
2025-06-12 06:39:32,723 INFO spawned: 'awx-wsbroadcast' with pid 313
2025-06-12 06:39:32,725 INFO spawned: 'awx-rsyslogd' with pid 315
2025-06-12 06:39:32,727 INFO spawned: 'awx-autoreload' with pid 316
2025-06-12 06:39:32,739 INFO spawned: 'awx-receptor' with pid 317
READY
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
2025-06-12 06:39:33,810 INFO success: stdout entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,811 INFO success: superwatcher entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,811 INFO success: awx-dispatcher entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,811 INFO success: awx-receiver entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-uwsgi entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-daphne entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-nginx entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-wsbroadcast entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-rsyslogd entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-autoreload entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:39:33,812 INFO success: awx-receptor entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
awx-autoreload stdout | make[1]: Entering directory '/awx_devel'
awx-autoreload stdout |
INFO 2025/06/12 06:39:34 Running control service control {"node_id":"awx_1"}
INFO 2025/06/12 06:39:34 Initialization complete
nginx -g "daemon off;"
2025-06-12 06:39:38,506 INFO     [-] daphne.cli Starting server at tcp:port=8051:interface=127.0.0.1
2025-06-12 06:39:38,506 INFO     Starting server at tcp:port=8051:interface=127.0.0.1
2025-06-12 06:39:38,512 INFO     [-] daphne.server HTTP/2 support not enabled (install the http2 and tls Twisted extras)
2025-06-12 06:39:38,512 INFO     HTTP/2 support not enabled (install the http2 and tls Twisted extras)
2025-06-12 06:39:38,512 INFO     [-] daphne.server Configuring endpoint tcp:port=8051:interface=127.0.0.1
2025-06-12 06:39:38,512 INFO     Configuring endpoint tcp:port=8051:interface=127.0.0.1
2025-06-12 06:39:38,513 INFO     [-] daphne.server Listening on TCP address 127.0.0.1:8051
2025-06-12 06:39:38,513 INFO     Listening on TCP address 127.0.0.1:8051
*** Starting uWSGI 2.0.18 (64bit) on [Thu Jun 12 06:39:39 2025] ***
compiled with version: 11.5.0 20240719 (Red Hat 11.5.0-5) on 09 June 2025 00:48:49
os: Linux-5.14.0-503.21.1.el9_5.x86_64 #1 SMP PREEMPT_DYNAMIC Thu Dec 19 09:37:00 EST 2024
nodename: awx_1
machine: x86_64
clock source: unix
detected number of CPU cores: 4
current working directory: /awx_devel
detected binary path: /var/lib/awx/venv/awx/bin/uwsgi
!!! no internal routing support, rebuild with pcre support !!!
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
chdir() to /awx_devel/
your processes number limit is 1048576
your memory page size is 4096 bytes
 *** WARNING: you have enabled harakiri without post buffering. Slow upload could be rejected on post-unbuffered webservers ***
detected max file descriptor number: 1048576
lock engine: pthread robust mutexes
thunder lock: disabled (you can enable it with --thunder-lock)
uwsgi socket 0 bound to TCP address 127.0.0.1:8050 fd 3
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
Python version: 3.9.21 (main, Feb 10 2025, 00:00:00)  [GCC 11.5.0 20240719 (Red Hat 11.5.0-5)]
PEP 405 virtualenv detected: /var/lib/awx/venv/awx
Set PythonHome to /var/lib/awx/venv/awx
*** Python threads support is disabled. You can enable it with --enable-threads ***
Python main interpreter initialized at 0x20e4b70
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
your server socket listen backlog is limited to 100 connections
your mercy for graceful operations on workers is 60 seconds
mapped 609552 bytes (595 KB) for 5 cores
*** Operational MODE: preforking ***
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
*** uWSGI is running in multiple interpreter mode ***
spawned uWSGI master process (pid: 746)
spawned uWSGI worker 1 (pid: 747, cores: 1)
spawned uWSGI worker 2 (pid: 748, cores: 1)
spawned uWSGI worker 3 (pid: 749, cores: 1)
spawned uWSGI worker 4 (pid: 750, cores: 1)
spawned uWSGI worker 5 (pid: 751, cores: 1)
*** Stats server enabled on /tmp/stats.socket fd: 17 ***
2025-06-12 06:39:39,951 INFO     [-] awx.main.wsbroadcast Active instance with hostname awx_1 is registered.
2025-06-12 06:39:40,472 WARNING  [-] awx.main.dispatch.periodic periodic beat started
2025-06-12 06:39:40,556 INFO     [-] awx.main.dispatch Running worker dispatcher listening to queues ['tower_broadcast_all', 'awx_1']
2025-06-12 06:39:40,936 WARNING  [-] awx.main.tasks.system Rejoining the cluster as instance awx_1. Prior last_seen 2025-06-09 07:01:46.584278+00:00
2025-06-12 06:39:41,410 INFO waiting for awx-rsyslogd to stop
2025-06-12 06:39:41,413 INFO stopped: awx-rsyslogd (exit status 0)
2025-06-12 06:39:41,418 INFO spawned: 'awx-rsyslogd' with pid 763
2025-06-12 06:39:42,425 INFO success: awx-rsyslogd entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x20e4b70 pid: 747 (default app)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x20e4b70 pid: 750 (default app)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x20e4b70 pid: 748 (default app)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x20e4b70 pid: 749 (default app)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x20e4b70 pid: 751 (default app)
INFO 2025/06/12 06:39:46 Connection established with receptor-hop {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 06:39:46 Known Connections: {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 06:39:46    awx_1: receptor-hop(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 06:39:46    receptor-hop: awx_1(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 06:39:46 Routing Table: {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 06:39:46    receptor-hop via receptor-hop {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 06:39:46 Known Connections: {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 06:39:46    awx_1: receptor-hop(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 06:39:46    receptor-hop: awx_1(1.00) receptor-1(1.00) receptor-2(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 06:39:46 Routing Table: {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 06:39:46    receptor-hop via receptor-hop {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 06:39:46 Known Connections: {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 06:39:46    awx_1: receptor-hop(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 06:39:46    receptor-hop: receptor-1(1.00) receptor-2(1.00) awx_1(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 06:39:46    receptor-2: receptor-hop(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 06:39:46    receptor-1: receptor-hop(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 06:39:46 Routing Table: {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 06:39:46    receptor-2 via receptor-hop {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 06:39:46    receptor-1 via receptor-hop {"remote_id":"receptor-hop","node_id":"awx_1"}
INFO 2025/06/12 06:39:46    receptor-hop via receptor-hop {"remote_id":"receptor-hop","node_id":"awx_1"}
192.168.0.10 GET / - HTTP/1.1 200
192.168.0.10 GET /api/ - HTTP/1.1 200
192.168.0.10 GET /api/v2/auth/ - HTTP/1.1 200
192.168.0.10 GET /api/ - HTTP/1.1 200
192.168.0.10 GET /api/login/ - HTTP/1.1 200
2025-06-12 06:40:18,733 WARNING  [2a2035d8] awx.api.generics Login failed for user root from 192.168.0.10
2025-06-12 06:40:18,767 WARNING  [2a2035d8] django.request Unauthorized: /api/login/
2025-06-12 06:40:18,767 WARNING  [2a2035d8] django.request Unauthorized: /api/login/
192.168.0.10 POST /api/login/ - HTTP/1.1 401
[root@nodehub _sources]#
Network error: Software caused connection abort

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Session stopped
    - Press <Return> to exit tab
    - Press R to restart session
    - Press S to save terminal output to file

Network error: Connection timed out

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Session stopped
    - Press <Return> to exit tab
    - Press R to restart session
    - Press S to save terminal output to file
login as: alvis
alvis@192.168.0.16's password:
    ┌──────────────────────────────────────────────────────────────────────┐
    │                 • MobaXterm Personal Edition v24.2 •                 │
    │               (SSH client, X server and network tools)               │
    │                                                                      │
    │ ⮞ SSH session to alvis@192.168.0.16                                  │
    │   • Direct SSH      :  ✓                                             │
    │   • SSH compression :  ✓                                             │
    │   • SSH-browser     :  ✓                                             │
    │   • X11-forwarding  :  ✗  (disabled or not supported by server)      │
    │                                                                      │
    │ ⮞ For more info, ctrl+click on help or visit our website.            │
    └──────────────────────────────────────────────────────────────────────┘

Activate the web console with: systemctl enable --now cockpit.socket

Last login: Thu Jun 12 01:26:53 2025 from 192.168.0.10
[alvis@nodehub ~]$ sudo su
[sudo] password for alvis:
[root@nodehub alvis]#
[root@nodehub alvis]# "a"a^C
[root@nodehub alvis]# ^C
[root@nodehub alvis]# docker exec -ti tools_awx_1 awx-manage createsuperuser
Username: admin
Error: That username is already taken.
Username: ^[[A^H^H^H^H^[[3~^[[3~^[[3~^[[3~^[[3~^[[3~^[[3~^[[3~^[[3~^[[3~^[[3~^[[3~^C
Operation cancelled.
[root@nodehub alvis]# docker exec -ti tools_awx_1 awx-manage createsuperuser
Username: root
Error: That username is already taken.
Username:
Error: This field cannot be blank.
Username:
Error: This field cannot be blank.
Username: alis^H^Hv^[[3~^[[3~^C
Operation cancelled.
[root@nodehub alvis]# docker exec -ti tools_awx_1 awx-manage createsuperuser
Username: al
Email address:
Password:
Password (again):
Superuser created successfully.
[root@nodehub alvis]# export CONTAINER_RUNTIME=runc
[root@nodehub alvis]# podman-compose -f docker-compose.yml up -d
CRITICAL:podman_compose:missing files: ['docker-compose.yml']
[root@nodehub alvis]# pwd
/home/alvis
[root@nodehub alvis]# cd
.ansible/   awx/        awx-24.6.1/ .config/    .local/
[root@nodehub alvis]# cd awx
[root@nodehub awx]# ls
API_STANDARDS.md  awxkit        CONTRIBUTING.md    docs        Makefile       pyproject.toml  SECURITY.md      tox.ini
awx               _build        DATA_MIGRATION.md  INSTALL.md  manage.py      pytest.ini      setup.cfg
awx_collection    CHANGELOG.md  DCO_1_1.md         ISSUES.md   MANIFEST.in    README.md       supervisord.log
awx.egg-info      config        Dockerfile         LICENSE.md  pre-commit.sh  requirements    tools
[root@nodehub awx]# cd tools/
[root@nodehub tools]# cd docker-compose
[root@nodehub docker-compose]# ls
ansible         awx-manage                docs           launch_awx.sh  nginx.vh.default.conf  start_tests.sh
awx-autoreload  bootstrap_development.sh  entrypoint.sh  logstash.conf  README.md              supervisor.conf
awx.egg-link    Dockerfile-logstash       inventory      nginx.conf     _sources
[root@nodehub docker-compose]# cd _sources/
[root@nodehub _sources]# podman-compose -f docker-compose.yml up -d
Traceback (most recent call last):
  File "/usr/local/lib/python3.9/site-packages/podman_compose.py", line 896, in assert_cnt_nets
    await compose.podman.output([], "network", ["exists", net_name])
  File "/usr/local/lib/python3.9/site-packages/podman_compose.py", line 1510, in output
    raise subprocess.CalledProcessError(p.returncode, " ".join(cmd_ls), stderr_data)
subprocess.CalledProcessError: Command 'podman network exists _sources_default' returned non-zero exit status 1.

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/usr/local/bin/podman-compose", line 8, in <module>
    sys.exit(main())
  File "/usr/local/lib/python3.9/site-packages/podman_compose.py", line 3995, in main
    asyncio.run(async_main())
  File "/usr/lib64/python3.9/asyncio/runners.py", line 44, in run
    return loop.run_until_complete(main)
  File "/usr/lib64/python3.9/asyncio/base_events.py", line 647, in run_until_complete
    return future.result()
  File "/usr/local/lib/python3.9/site-packages/podman_compose.py", line 3991, in async_main
    await podman_compose.run()
  File "/usr/local/lib/python3.9/site-packages/podman_compose.py", line 1984, in run
    retcode = await cmd(self, args)
  File "/usr/local/lib/python3.9/site-packages/podman_compose.py", line 2923, in compose_up
    podman_args = await container_to_args(compose, cnt, detached=False, no_deps=args.no_deps)
  File "/usr/local/lib/python3.9/site-packages/podman_compose.py", line 1124, in container_to_args
    await assert_cnt_nets(compose, cnt)
  File "/usr/local/lib/python3.9/site-packages/podman_compose.py", line 901, in assert_cnt_nets
    await compose.podman.output([], "network", args)
  File "/usr/local/lib/python3.9/site-packages/podman_compose.py", line 1510, in output
    raise subprocess.CalledProcessError(p.returncode, " ".join(cmd_ls), stderr_data)
subprocess.CalledProcessError: Command 'podman network create --label io.podman.compose.project=_sources --label com.docker.compose.project=_sources _sources_default' returned non-zero exit status 125.
[root@nodehub _sources]# COMPOSE_PROJECT_NAME=sources podman-compose -f docker-compose.yml up -d
Error: creating container storage: the container name "tools_redis_1" is already in use by e03a6e4f3bece2ab3e8bea0f848dfcd9b7e738d5704e5ee67dbabf7b960f788e. You have to remove that container to be able to reuse that name: that name is already in use, or use --replace to instruct Podman to do so.
tools_redis_1
Error: creating container storage: the container name "tools_postgres_1" is already in use by e26d8dd036fedfda18c73ab15bb5f6acf91fafc81a554e4fbac54c005288ca06. You have to remove that container to be able to reuse that name: that name is already in use, or use --replace to instruct Podman to do so.
tools_postgres_1
Error: creating container storage: the container name "tools_awx_1" is already in use by 6b0bd1f309bd97aba59e7d9143dbf3a62e30e9ad972b585987b6c48fe7d07cd5. You have to remove that container to be able to reuse that name: that name is already in use, or use --replace to instruct Podman to do so.
tools_awx_1
Error: creating container storage: the container name "tools_receptor_hop" is already in use by b8106c2abea5e0a32e88f43f3ab6b6027f41a50f0086fd6466f2cb3693464f4f. You have to remove that container to be able to reuse that name: that name is already in use, or use --replace to instruct Podman to do so.
tools_receptor_hop
Error: creating container storage: the container name "tools_receptor_1" is already in use by 967138774b35a8beeb504232ca985569d17fe46aaba3692a0b6000f2358d6d4c. You have to remove that container to be able to reuse that name: that name is already in use, or use --replace to instruct Podman to do so.
tools_receptor_1
Error: creating container storage: the container name "tools_receptor_2" is already in use by 25099b046f3366d5f5561b6385aa010be12bc4b83ed13587333fb079e35c3785. You have to remove that container to be able to reuse that name: that name is already in use, or use --replace to instruct Podman to do so.
tools_receptor_2
[root@nodehub _sources]# podman ps -a
CONTAINER ID  IMAGE                             COMMAND               CREATED         STATUS         PORTS                                                                                                                                                                                                             NAMES
e03a6e4f3bec  docker.io/library/redis:latest    /usr/local/etc/re...  15 minutes ago  Up 15 minutes  6379/tcp                                                                                                                                                                                                          tools_redis_1
e26d8dd036fe  docker.io/library/postgres:12     postgres -c log_d...  15 minutes ago  Up 15 minutes  5432/tcp                                                                                                                                                                                                          tools_postgres_1
6b0bd1f309bd  ghcr.io/ansible/awx_devel:24.6.1  launch_awx.sh         15 minutes ago  Up 15 minutes  0.0.0.0:2222->2222/tcp, 0.0.0.0:3000->3001/tcp, 0.0.0.0:6899->6899/tcp, 0.0.0.0:7899-7999->7899-7999/tcp, 0.0.0.0:8013->8013/tcp, 0.0.0.0:8043->8043/tcp, 0.0.0.0:8080->8080/tcp, 0.0.0.0:8888->8888/tcp, 22/tcp  tools_awx_1
b8106c2abea5  quay.io/ansible/receptor:devel    receptor --config...  15 minutes ago  Up 15 minutes  0.0.0.0:5555->5555/tcp, 7323/tcp                                                                                                                                                                                  tools_receptor_hop
967138774b35  ghcr.io/ansible/awx_devel:24.6.1  receptor --config...  15 minutes ago  Up 15 minutes  22/tcp, 8013/tcp, 8043/tcp, 8080/tcp                                                                                                                                                                              tools_receptor_1
25099b046f33  ghcr.io/ansible/awx_devel:24.6.1  receptor --config...  15 minutes ago  Up 15 minutes  22/tcp, 8013/tcp, 8043/tcp, 8080/tcp                                                                                                                                                                              tools_receptor_2
[root@nodehub _sources]# COMPOSE_PROJECT_NAME=sources podman-compose --replace -f docker-compose.yml up -d
usage: podman-compose [-h] [-v] [--in-pod in_pod] [--pod-args pod_args] [--env-file env_file] [-f file] [--profile profile] [-p PROJECT_NAME]
                      [--podman-path PODMAN_PATH] [--podman-args args] [--podman-pull-args args] [--podman-push-args args]
                      [--podman-build-args args] [--podman-inspect-args args] [--podman-run-args args] [--podman-start-args args]
                      [--podman-stop-args args] [--podman-rm-args args] [--podman-volume-args args] [--no-ansi] [--no-cleanup] [--dry-run]
                      [--parallel PARALLEL] [--verbose]
                      {help,version,wait,systemd,pull,push,build,up,down,ps,run,exec,start,stop,restart,logs,config,port,pause,unpause,kill,stats,images}
                      ...
podman-compose: error: unrecognized arguments: --replace
[root@nodehub _sources]# podman rm -f tools_redis_1 tools_postgres_1 tools_awx_1 tools_receptor_hop tools_receptor_1 tools_receptor_2
tools_receptor_2
tools_receptor_1
tools_receptor_hop
Error: container e03a6e4f3bece2ab3e8bea0f848dfcd9b7e738d5704e5ee67dbabf7b960f788e has dependent containers which must be removed before it: 6b0bd1f309bd97aba59e7d9143dbf3a62e30e9ad972b585987b6c48fe7d07cd5, b8106c2abea5e0a32e88f43f3ab6b6027f41a50f0086fd6466f2cb3693464f4f, 967138774b35a8beeb504232ca985569d17fe46aaba3692a0b6000f2358d6d4c, 25099b046f3366d5f5561b6385aa010be12bc4b83ed13587333fb079e35c3785: container already exists
Error: container e26d8dd036fedfda18c73ab15bb5f6acf91fafc81a554e4fbac54c005288ca06 has dependent containers which must be removed before it: 6b0bd1f309bd97aba59e7d9143dbf3a62e30e9ad972b585987b6c48fe7d07cd5, b8106c2abea5e0a32e88f43f3ab6b6027f41a50f0086fd6466f2cb3693464f4f, 967138774b35a8beeb504232ca985569d17fe46aaba3692a0b6000f2358d6d4c: container already exists
Error: container 6b0bd1f309bd97aba59e7d9143dbf3a62e30e9ad972b585987b6c48fe7d07cd5 has dependent containers which must be removed before it: b8106c2abea5e0a32e88f43f3ab6b6027f41a50f0086fd6466f2cb3693464f4f: container already exists
[root@nodehub _sources]# podman ps -a
CONTAINER ID  IMAGE                             COMMAND               CREATED         STATUS         PORTS                                                                                                                                                                                                             NAMES
e03a6e4f3bec  docker.io/library/redis:latest    /usr/local/etc/re...  19 minutes ago  Up 19 minutes  6379/tcp                                                                                                                                                                                                          tools_redis_1
e26d8dd036fe  docker.io/library/postgres:12     postgres -c log_d...  19 minutes ago  Up 19 minutes  5432/tcp                                                                                                                                                                                                          tools_postgres_1
6b0bd1f309bd  ghcr.io/ansible/awx_devel:24.6.1  launch_awx.sh         19 minutes ago  Up 19 minutes  0.0.0.0:2222->2222/tcp, 0.0.0.0:3000->3001/tcp, 0.0.0.0:6899->6899/tcp, 0.0.0.0:7899-7999->7899-7999/tcp, 0.0.0.0:8013->8013/tcp, 0.0.0.0:8043->8043/tcp, 0.0.0.0:8080->8080/tcp, 0.0.0.0:8888->8888/tcp, 22/tcp  tools_awx_1
[root@nodehub _sources]# podman rm -f 6b0bd1f309bd e26d8dd036fe e03a6e4f3bec
6b0bd1f309bd
Error: container e03a6e4f3bece2ab3e8bea0f848dfcd9b7e738d5704e5ee67dbabf7b960f788e has dependent containers which must be removed before it: 6b0bd1f309bd97aba59e7d9143dbf3a62e30e9ad972b585987b6c48fe7d07cd5: container already exists
Error: container e26d8dd036fedfda18c73ab15bb5f6acf91fafc81a554e4fbac54c005288ca06 has dependent containers which must be removed before it: 6b0bd1f309bd97aba59e7d9143dbf3a62e30e9ad972b585987b6c48fe7d07cd5: container already exists
[root@nodehub _sources]# podman ps -a
CONTAINER ID  IMAGE                           COMMAND               CREATED         STATUS         PORTS       NAMES
e03a6e4f3bec  docker.io/library/redis:latest  /usr/local/etc/re...  19 minutes ago  Up 19 minutes  6379/tcp    tools_redis_1
e26d8dd036fe  docker.io/library/postgres:12   postgres -c log_d...  19 minutes ago  Up 19 minutes  5432/tcp    tools_postgres_1
[root@nodehub _sources]# podman stop e03a6e4f3bec e26d8dd036fe
e03a6e4f3bec
e26d8dd036fe
[root@nodehub _sources]# podman rm e03a6e4f3bec e26d8dd036fe
e26d8dd036fe
e03a6e4f3bec
[root@nodehub _sources]# podman ps -a
CONTAINER ID  IMAGE       COMMAND     CREATED     STATUS      PORTS       NAMES
[root@nodehub _sources]# COMPOSE_PROJECT_NAME=sources podman-compose -f docker-compose.yml up -d
ea4028bdb3e934246ed2fd536e1119c14eaacf701b4da8a0e7603a50367ebe18
tools_redis_1
684bbbc25c63dd2f70452ddacde23f838b8b7e6e69a0041050c2d714f8d3f434
tools_postgres_1
119721ce2c9442a0d9581e3bb0e32f2489317ca43d2efba946d0de0911ec6652
tools_awx_1
da94f04bdbc8c43b059f1859b2c739ab36b5532b1b5146f6eca8d6af26b0b774
tools_receptor_hop
f2a43f0628fcdf012dab44d9e24cee9ba41e02278160c7751a0cff3c18a324f9
tools_receptor_1
539d3a6a4241294cb15c78358c7525811d689dff30e76b3feae8213923803c12
tools_receptor_2
[root@nodehub _sources]# podman logs tools_awx_1
[ -d "/awx_devel/awx.egg-info" ] || python3.9 /awx_devel/tools/scripts/egg_info_dev
cp -f /tmp/awx.egg-link /var/lib/awx/venv/awx/lib/python3.9/site-packages/awx.egg-link
mkdir -p /var/lib/awx/; \
if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
python3.9 -c "import awx; print(awx.__version__)" > /var/lib/awx/.awx_version; \

if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
awx-manage migrate --noinput
Operations to perform:
  Apply all migrations: auth, conf, contenttypes, main, oauth2_provider, sessions, sites, social_django, sso, taggit
Running migrations:
  No migrations to apply.
Admin password: CCWIdjRTMfbXuNgAslLJ
(changed: False)
[root@nodehub _sources]# podman logs tools_awx_1
[ -d "/awx_devel/awx.egg-info" ] || python3.9 /awx_devel/tools/scripts/egg_info_dev
cp -f /tmp/awx.egg-link /var/lib/awx/venv/awx/lib/python3.9/site-packages/awx.egg-link
mkdir -p /var/lib/awx/; \
if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
python3.9 -c "import awx; print(awx.__version__)" > /var/lib/awx/.awx_version; \

if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
awx-manage migrate --noinput
Operations to perform:
  Apply all migrations: auth, conf, contenttypes, main, oauth2_provider, sessions, sites, social_django, sso, taggit
Running migrations:
  No migrations to apply.
Admin password: CCWIdjRTMfbXuNgAslLJ
(changed: False)
[root@nodehub _sources]# podman logs tools_awx_1
[ -d "/awx_devel/awx.egg-info" ] || python3.9 /awx_devel/tools/scripts/egg_info_dev
cp -f /tmp/awx.egg-link /var/lib/awx/venv/awx/lib/python3.9/site-packages/awx.egg-link
mkdir -p /var/lib/awx/; \
if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
python3.9 -c "import awx; print(awx.__version__)" > /var/lib/awx/.awx_version; \

if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
awx-manage migrate --noinput
Operations to perform:
  Apply all migrations: auth, conf, contenttypes, main, oauth2_provider, sessions, sites, social_django, sso, taggit
Running migrations:
  No migrations to apply.
Admin password: CCWIdjRTMfbXuNgAslLJ
(changed: False)
(changed: False)
[root@nodehub _sources]# podman logs tools_awx_1
[ -d "/awx_devel/awx.egg-info" ] || python3.9 /awx_devel/tools/scripts/egg_info_dev
cp -f /tmp/awx.egg-link /var/lib/awx/venv/awx/lib/python3.9/site-packages/awx.egg-link
mkdir -p /var/lib/awx/; \
if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
python3.9 -c "import awx; print(awx.__version__)" > /var/lib/awx/.awx_version; \

if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
awx-manage migrate --noinput
Operations to perform:
  Apply all migrations: auth, conf, contenttypes, main, oauth2_provider, sessions, sites, social_django, sso, taggit
Running migrations:
  No migrations to apply.
Admin password: CCWIdjRTMfbXuNgAslLJ
(changed: False)
(changed: False)
[root@nodehub _sources]# podman logs tools_awx_1
[ -d "/awx_devel/awx.egg-info" ] || python3.9 /awx_devel/tools/scripts/egg_info_dev
cp -f /tmp/awx.egg-link /var/lib/awx/venv/awx/lib/python3.9/site-packages/awx.egg-link
mkdir -p /var/lib/awx/; \
if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
python3.9 -c "import awx; print(awx.__version__)" > /var/lib/awx/.awx_version; \

if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
awx-manage migrate --noinput
Operations to perform:
  Apply all migrations: auth, conf, contenttypes, main, oauth2_provider, sessions, sites, social_django, sso, taggit
Running migrations:
  No migrations to apply.
Admin password: CCWIdjRTMfbXuNgAslLJ
(changed: False)
(changed: False)
[root@nodehub _sources]# podman logs tools_awx_1
[ -d "/awx_devel/awx.egg-info" ] || python3.9 /awx_devel/tools/scripts/egg_info_dev
cp -f /tmp/awx.egg-link /var/lib/awx/venv/awx/lib/python3.9/site-packages/awx.egg-link
mkdir -p /var/lib/awx/; \
if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
python3.9 -c "import awx; print(awx.__version__)" > /var/lib/awx/.awx_version; \

if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
awx-manage migrate --noinput
Operations to perform:
  Apply all migrations: auth, conf, contenttypes, main, oauth2_provider, sessions, sites, social_django, sso, taggit
Running migrations:
  No migrations to apply.
Admin password: CCWIdjRTMfbXuNgAslLJ
(changed: False)
(changed: False)
Instance already registered awx_1
[root@nodehub _sources]# podman logs tools_awx_1
[ -d "/awx_devel/awx.egg-info" ] || python3.9 /awx_devel/tools/scripts/egg_info_dev
cp -f /tmp/awx.egg-link /var/lib/awx/venv/awx/lib/python3.9/site-packages/awx.egg-link
mkdir -p /var/lib/awx/; \
if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
python3.9 -c "import awx; print(awx.__version__)" > /var/lib/awx/.awx_version; \

if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
awx-manage migrate --noinput
Operations to perform:
  Apply all migrations: auth, conf, contenttypes, main, oauth2_provider, sessions, sites, social_django, sso, taggit
Running migrations:
  No migrations to apply.
Admin password: CCWIdjRTMfbXuNgAslLJ
(changed: False)
(changed: False)
Instance already registered awx_1
[root@nodehub _sources]# podman logs tools_awx_1
[ -d "/awx_devel/awx.egg-info" ] || python3.9 /awx_devel/tools/scripts/egg_info_dev
cp -f /tmp/awx.egg-link /var/lib/awx/venv/awx/lib/python3.9/site-packages/awx.egg-link
mkdir -p /var/lib/awx/; \
if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
python3.9 -c "import awx; print(awx.__version__)" > /var/lib/awx/.awx_version; \

if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
awx-manage migrate --noinput
Operations to perform:
  Apply all migrations: auth, conf, contenttypes, main, oauth2_provider, sessions, sites, social_django, sso, taggit
Running migrations:
  No migrations to apply.
Admin password: CCWIdjRTMfbXuNgAslLJ
(changed: False)
(changed: False)
Instance already registered awx_1
[root@nodehub _sources]# podman logs tools_awx_1
[ -d "/awx_devel/awx.egg-info" ] || python3.9 /awx_devel/tools/scripts/egg_info_dev
cp -f /tmp/awx.egg-link /var/lib/awx/venv/awx/lib/python3.9/site-packages/awx.egg-link
mkdir -p /var/lib/awx/; \
if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
python3.9 -c "import awx; print(awx.__version__)" > /var/lib/awx/.awx_version; \

if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
awx-manage migrate --noinput
Operations to perform:
  Apply all migrations: auth, conf, contenttypes, main, oauth2_provider, sessions, sites, social_django, sso, taggit
Running migrations:
  No migrations to apply.
Admin password: CCWIdjRTMfbXuNgAslLJ
(changed: False)
(changed: False)
Instance already registered awx_1
Instance Group already registered controlplane
[root@nodehub _sources]# podman logs tools_awx_1
[ -d "/awx_devel/awx.egg-info" ] || python3.9 /awx_devel/tools/scripts/egg_info_dev
cp -f /tmp/awx.egg-link /var/lib/awx/venv/awx/lib/python3.9/site-packages/awx.egg-link
mkdir -p /var/lib/awx/; \
if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
python3.9 -c "import awx; print(awx.__version__)" > /var/lib/awx/.awx_version; \

if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
awx-manage migrate --noinput
Operations to perform:
  Apply all migrations: auth, conf, contenttypes, main, oauth2_provider, sessions, sites, social_django, sso, taggit
Running migrations:
  No migrations to apply.
Admin password: CCWIdjRTMfbXuNgAslLJ
(changed: False)
(changed: False)
Instance already registered awx_1
Instance Group already registered controlplane
[root@nodehub _sources]# podman logs tools_awx_1
[ -d "/awx_devel/awx.egg-info" ] || python3.9 /awx_devel/tools/scripts/egg_info_dev
cp -f /tmp/awx.egg-link /var/lib/awx/venv/awx/lib/python3.9/site-packages/awx.egg-link
mkdir -p /var/lib/awx/; \
if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
python3.9 -c "import awx; print(awx.__version__)" > /var/lib/awx/.awx_version; \

if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
awx-manage migrate --noinput
Operations to perform:
  Apply all migrations: auth, conf, contenttypes, main, oauth2_provider, sessions, sites, social_django, sso, taggit
Running migrations:
  No migrations to apply.
Admin password: CCWIdjRTMfbXuNgAslLJ
(changed: False)
(changed: False)
Instance already registered awx_1
Instance Group already registered controlplane
[root@nodehub _sources]# podman logs tools_awx_1
[ -d "/awx_devel/awx.egg-info" ] || python3.9 /awx_devel/tools/scripts/egg_info_dev
cp -f /tmp/awx.egg-link /var/lib/awx/venv/awx/lib/python3.9/site-packages/awx.egg-link
mkdir -p /var/lib/awx/; \
if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
python3.9 -c "import awx; print(awx.__version__)" > /var/lib/awx/.awx_version; \

if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
awx-manage migrate --noinput
Operations to perform:
  Apply all migrations: auth, conf, contenttypes, main, oauth2_provider, sessions, sites, social_django, sso, taggit
Running migrations:
  No migrations to apply.
Admin password: CCWIdjRTMfbXuNgAslLJ
(changed: False)
(changed: False)
Instance already registered awx_1
Instance Group already registered controlplane
[root@nodehub _sources]# podman logs tools_awx_1
[ -d "/awx_devel/awx.egg-info" ] || python3.9 /awx_devel/tools/scripts/egg_info_dev
cp -f /tmp/awx.egg-link /var/lib/awx/venv/awx/lib/python3.9/site-packages/awx.egg-link
mkdir -p /var/lib/awx/; \
if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
python3.9 -c "import awx; print(awx.__version__)" > /var/lib/awx/.awx_version; \

if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
awx-manage migrate --noinput
Operations to perform:
  Apply all migrations: auth, conf, contenttypes, main, oauth2_provider, sessions, sites, social_django, sso, taggit
Running migrations:
  No migrations to apply.
Admin password: CCWIdjRTMfbXuNgAslLJ
(changed: False)
(changed: False)
Instance already registered awx_1
Instance Group already registered controlplane
Instance Group already registered default
[root@nodehub _sources]# podman logs tools_awx_1
[ -d "/awx_devel/awx.egg-info" ] || python3.9 /awx_devel/tools/scripts/egg_info_dev
cp -f /tmp/awx.egg-link /var/lib/awx/venv/awx/lib/python3.9/site-packages/awx.egg-link
mkdir -p /var/lib/awx/; \
if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
python3.9 -c "import awx; print(awx.__version__)" > /var/lib/awx/.awx_version; \

if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
awx-manage migrate --noinput
Operations to perform:
  Apply all migrations: auth, conf, contenttypes, main, oauth2_provider, sessions, sites, social_django, sso, taggit
Running migrations:
  No migrations to apply.
Admin password: CCWIdjRTMfbXuNgAslLJ
(changed: False)
(changed: False)
Instance already registered awx_1
Instance Group already registered controlplane
Instance Group already registered default
[root@nodehub _sources]# podman logs tools_awx_1
[ -d "/awx_devel/awx.egg-info" ] || python3.9 /awx_devel/tools/scripts/egg_info_dev
cp -f /tmp/awx.egg-link /var/lib/awx/venv/awx/lib/python3.9/site-packages/awx.egg-link
mkdir -p /var/lib/awx/; \
if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
python3.9 -c "import awx; print(awx.__version__)" > /var/lib/awx/.awx_version; \

if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
awx-manage migrate --noinput
Operations to perform:
  Apply all migrations: auth, conf, contenttypes, main, oauth2_provider, sessions, sites, social_django, sso, taggit
Running migrations:
  No migrations to apply.
Admin password: CCWIdjRTMfbXuNgAslLJ
(changed: False)
(changed: False)
Instance already registered awx_1
Instance Group already registered controlplane
Instance Group already registered default
[root@nodehub _sources]# podman logs tools_awx_1
[ -d "/awx_devel/awx.egg-info" ] || python3.9 /awx_devel/tools/scripts/egg_info_dev
cp -f /tmp/awx.egg-link /var/lib/awx/venv/awx/lib/python3.9/site-packages/awx.egg-link
mkdir -p /var/lib/awx/; \
if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
python3.9 -c "import awx; print(awx.__version__)" > /var/lib/awx/.awx_version; \

if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
awx-manage migrate --noinput
Operations to perform:
  Apply all migrations: auth, conf, contenttypes, main, oauth2_provider, sessions, sites, social_django, sso, taggit
Running migrations:
  No migrations to apply.
Admin password: CCWIdjRTMfbXuNgAslLJ
(changed: False)
(changed: False)
Instance already registered awx_1
Instance Group already registered controlplane
Instance Group already registered default
Instance already registered receptor-hop
[root@nodehub _sources]# podman logs tools_awx_1
[ -d "/awx_devel/awx.egg-info" ] || python3.9 /awx_devel/tools/scripts/egg_info_dev
cp -f /tmp/awx.egg-link /var/lib/awx/venv/awx/lib/python3.9/site-packages/awx.egg-link
mkdir -p /var/lib/awx/; \
if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
python3.9 -c "import awx; print(awx.__version__)" > /var/lib/awx/.awx_version; \

if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
awx-manage migrate --noinput
Operations to perform:
  Apply all migrations: auth, conf, contenttypes, main, oauth2_provider, sessions, sites, social_django, sso, taggit
Running migrations:
  No migrations to apply.
Admin password: CCWIdjRTMfbXuNgAslLJ
(changed: False)
(changed: False)
Instance already registered awx_1
Instance Group already registered controlplane
Instance Group already registered default
Instance already registered receptor-hop
[root@nodehub _sources]# podman logs tools_awx_1
[ -d "/awx_devel/awx.egg-info" ] || python3.9 /awx_devel/tools/scripts/egg_info_dev
cp -f /tmp/awx.egg-link /var/lib/awx/venv/awx/lib/python3.9/site-packages/awx.egg-link
mkdir -p /var/lib/awx/; \
if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
python3.9 -c "import awx; print(awx.__version__)" > /var/lib/awx/.awx_version; \

if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
awx-manage migrate --noinput
Operations to perform:
  Apply all migrations: auth, conf, contenttypes, main, oauth2_provider, sessions, sites, social_django, sso, taggit
Running migrations:
  No migrations to apply.
Admin password: CCWIdjRTMfbXuNgAslLJ
(changed: False)
(changed: False)
Instance already registered awx_1
Instance Group already registered controlplane
Instance Group already registered default
Instance already registered receptor-hop
0 new peer links added to the database.
[root@nodehub _sources]# podman logs tools_awx_1
[ -d "/awx_devel/awx.egg-info" ] || python3.9 /awx_devel/tools/scripts/egg_info_dev
cp -f /tmp/awx.egg-link /var/lib/awx/venv/awx/lib/python3.9/site-packages/awx.egg-link
mkdir -p /var/lib/awx/; \
if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
python3.9 -c "import awx; print(awx.__version__)" > /var/lib/awx/.awx_version; \

if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
awx-manage migrate --noinput
Operations to perform:
  Apply all migrations: auth, conf, contenttypes, main, oauth2_provider, sessions, sites, social_django, sso, taggit
Running migrations:
  No migrations to apply.
Admin password: CCWIdjRTMfbXuNgAslLJ
(changed: False)
(changed: False)
Instance already registered awx_1
Instance Group already registered controlplane
Instance Group already registered default
Instance already registered receptor-hop
0 new peer links added to the database.
[root@nodehub _sources]# podman logs tools_awx_1
[ -d "/awx_devel/awx.egg-info" ] || python3.9 /awx_devel/tools/scripts/egg_info_dev
cp -f /tmp/awx.egg-link /var/lib/awx/venv/awx/lib/python3.9/site-packages/awx.egg-link
mkdir -p /var/lib/awx/; \
if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
python3.9 -c "import awx; print(awx.__version__)" > /var/lib/awx/.awx_version; \

if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
awx-manage migrate --noinput
Operations to perform:
  Apply all migrations: auth, conf, contenttypes, main, oauth2_provider, sessions, sites, social_django, sso, taggit
Running migrations:
  No migrations to apply.
Admin password: CCWIdjRTMfbXuNgAslLJ
(changed: False)
(changed: False)
Instance already registered awx_1
Instance Group already registered controlplane
Instance Group already registered default
Instance already registered receptor-hop
0 new peer links added to the database.
Instance already registered receptor-1
0 new peer links added to the database.
Instance already registered receptor-2
0 new peer links added to the database.
/usr/local/lib/python3.9/site-packages/supervisor/options.py:474: UserWarning: Supervisord is running as root and it is searching for its configuration file in default locations (including its current working directory); you probably want to specify a "-c" argument specifying an absolute path to a configuration file for improved security.
  self.warnings.warn(
2025-06-12 06:59:42,483 CRIT Supervisor is running as root.  Privileges were not dropped because no user is specified in the config file.  If you intend to run as root, you can set user=root in the config file to avoid this message.
2025-06-12 06:59:42,486 INFO RPC interface 'supervisor' initialized
2025-06-12 06:59:42,486 CRIT Server 'unix_http_server' running without any HTTP authentication checking
2025-06-12 06:59:42,486 INFO supervisord started with pid 305
2025-06-12 06:59:43,539 INFO spawned: 'stdout' with pid 306
2025-06-12 06:59:43,541 INFO spawned: 'superwatcher' with pid 307
2025-06-12 06:59:43,543 INFO spawned: 'awx-dispatcher' with pid 308
2025-06-12 06:59:43,545 INFO spawned: 'awx-receiver' with pid 309
2025-06-12 06:59:43,546 INFO spawned: 'awx-uwsgi' with pid 310
2025-06-12 06:59:43,548 INFO spawned: 'awx-daphne' with pid 311
2025-06-12 06:59:43,550 INFO spawned: 'awx-nginx' with pid 312
2025-06-12 06:59:43,552 INFO spawned: 'awx-wsbroadcast' with pid 313
2025-06-12 06:59:43,554 INFO spawned: 'awx-rsyslogd' with pid 314
2025-06-12 06:59:43,555 INFO spawned: 'awx-autoreload' with pid 316
2025-06-12 06:59:43,557 INFO spawned: 'awx-receptor' with pid 317
READY
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
2025-06-12 06:59:44,666 INFO success: stdout entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:59:44,667 INFO success: superwatcher entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:59:44,667 INFO success: awx-dispatcher entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:59:44,667 INFO success: awx-receiver entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:59:44,668 INFO success: awx-uwsgi entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:59:44,668 INFO success: awx-daphne entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:59:44,668 INFO success: awx-nginx entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:59:44,668 INFO success: awx-wsbroadcast entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:59:44,668 INFO success: awx-rsyslogd entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:59:44,668 INFO success: awx-autoreload entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:59:44,668 INFO success: awx-receptor entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
awx-autoreload stdout | make[1]: Entering directory '/awx_devel'
awx-autoreload stdout |
INFO 2025/06/12 06:59:44 Running control service control {"node_id":"awx_1"}
INFO 2025/06/12 06:59:44 Initialization complete
nginx -g "daemon off;"
2025-06-12 06:59:48,900 INFO     [-] daphne.cli Starting server at tcp:port=8051:interface=127.0.0.1
2025-06-12 06:59:48,900 INFO     Starting server at tcp:port=8051:interface=127.0.0.1
2025-06-12 06:59:48,903 INFO     [-] daphne.server HTTP/2 support not enabled (install the http2 and tls Twisted extras)
2025-06-12 06:59:48,903 INFO     HTTP/2 support not enabled (install the http2 and tls Twisted extras)
2025-06-12 06:59:48,903 INFO     [-] daphne.server Configuring endpoint tcp:port=8051:interface=127.0.0.1
2025-06-12 06:59:48,903 INFO     Configuring endpoint tcp:port=8051:interface=127.0.0.1
2025-06-12 06:59:48,904 INFO     [-] daphne.server Listening on TCP address 127.0.0.1:8051
2025-06-12 06:59:48,904 INFO     Listening on TCP address 127.0.0.1:8051
*** Starting uWSGI 2.0.18 (64bit) on [Thu Jun 12 06:59:49 2025] ***
compiled with version: 11.5.0 20240719 (Red Hat 11.5.0-5) on 09 June 2025 00:48:49
os: Linux-5.14.0-503.21.1.el9_5.x86_64 #1 SMP PREEMPT_DYNAMIC Thu Dec 19 09:37:00 EST 2024
nodename: awx_1
machine: x86_64
clock source: unix
detected number of CPU cores: 4
current working directory: /awx_devel
detected binary path: /var/lib/awx/venv/awx/bin/uwsgi
!!! no internal routing support, rebuild with pcre support !!!
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
chdir() to /awx_devel/
your processes number limit is 1048576
your memory page size is 4096 bytes
 *** WARNING: you have enabled harakiri without post buffering. Slow upload could be rejected on post-unbuffered webservers ***
detected max file descriptor number: 1048576
lock engine: pthread robust mutexes
thunder lock: disabled (you can enable it with --thunder-lock)
uwsgi socket 0 bound to TCP address 127.0.0.1:8050 fd 3
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
Python version: 3.9.21 (main, Feb 10 2025, 00:00:00)  [GCC 11.5.0 20240719 (Red Hat 11.5.0-5)]
PEP 405 virtualenv detected: /var/lib/awx/venv/awx
Set PythonHome to /var/lib/awx/venv/awx
*** Python threads support is disabled. You can enable it with --enable-threads ***
Python main interpreter initialized at 0x1dc5b70
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
your server socket listen backlog is limited to 100 connections
your mercy for graceful operations on workers is 60 seconds
mapped 609552 bytes (595 KB) for 5 cores
*** Operational MODE: preforking ***
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
*** uWSGI is running in multiple interpreter mode ***
spawned uWSGI master process (pid: 745)
spawned uWSGI worker 1 (pid: 746, cores: 1)
spawned uWSGI worker 2 (pid: 747, cores: 1)
spawned uWSGI worker 3 (pid: 748, cores: 1)
spawned uWSGI worker 4 (pid: 749, cores: 1)
spawned uWSGI worker 5 (pid: 750, cores: 1)
*** Stats server enabled on /tmp/stats.socket fd: 17 ***
2025-06-12 06:59:49,734 WARNING  [-] awx.main.dispatch.periodic periodic beat started
2025-06-12 06:59:49,784 INFO     [-] awx.main.dispatch Running worker dispatcher listening to queues ['tower_broadcast_all', 'awx_1']
2025-06-12 06:59:49,874 WARNING  [-] awx.main.tasks.system Heartbeat skew - interval=85.7913, expected=60
2025-06-12 06:59:50,324 INFO waiting for awx-rsyslogd to stop
2025-06-12 06:59:50,325 INFO stopped: awx-rsyslogd (exit status 0)
2025-06-12 06:59:50,330 INFO spawned: 'awx-rsyslogd' with pid 757
2025-06-12 06:59:50,604 INFO     [-] awx.main.wsbroadcast Active instance with hostname awx_1 is registered.
2025-06-12 06:59:51,606 INFO success: awx-rsyslogd entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
WSGI app 0 (mountpoint='') ready in 2 seconds on interpreter 0x1dc5b70 pid: 749 (default app)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x1dc5b70 pid: 747 (default app)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x1dc5b70 pid: 746 (default app)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x1dc5b70 pid: 750 (default app)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x1dc5b70 pid: 748 (default app)
INFO 2025/06/12 07:00:00 Connection established with receptor-hop {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:00:00 Known Connections: {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:00:00    receptor-hop: awx_1(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:00:00    awx_1: receptor-hop(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:00:00 Routing Table: {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:00:00    receptor-hop via receptor-hop {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:00:00 Known Connections: {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:00:00    awx_1: receptor-hop(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:00:00    receptor-hop: awx_1(1.00) receptor-1(1.00) receptor-2(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:00:00 Routing Table: {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:00:00    receptor-hop via receptor-hop {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:00:00 Known Connections: {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:00:00    awx_1: receptor-hop(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:00:00    receptor-hop: awx_1(1.00) receptor-1(1.00) receptor-2(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:00:00    receptor-1: receptor-hop(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:00:00    receptor-2: receptor-hop(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:00:00 Routing Table: {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:00:00    receptor-1 via receptor-hop {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:00:00    receptor-2 via receptor-hop {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:00:00    receptor-hop via receptor-hop {"node_id":"awx_1","remote_id":"receptor-hop"}
[root@nodehub _sources]# podman logs tools_awx_1
[ -d "/awx_devel/awx.egg-info" ] || python3.9 /awx_devel/tools/scripts/egg_info_dev
cp -f /tmp/awx.egg-link /var/lib/awx/venv/awx/lib/python3.9/site-packages/awx.egg-link
mkdir -p /var/lib/awx/; \
if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
python3.9 -c "import awx; print(awx.__version__)" > /var/lib/awx/.awx_version; \

if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
awx-manage migrate --noinput
Operations to perform:
  Apply all migrations: auth, conf, contenttypes, main, oauth2_provider, sessions, sites, social_django, sso, taggit
Running migrations:
  No migrations to apply.
Admin password: CCWIdjRTMfbXuNgAslLJ
(changed: False)
(changed: False)
Instance already registered awx_1
Instance Group already registered controlplane
Instance Group already registered default
Instance already registered receptor-hop
0 new peer links added to the database.
Instance already registered receptor-1
0 new peer links added to the database.
Instance already registered receptor-2
0 new peer links added to the database.
/usr/local/lib/python3.9/site-packages/supervisor/options.py:474: UserWarning: Supervisord is running as root and it is searching for its configuration file in default locations (including its current working directory); you probably want to specify a "-c" argument specifying an absolute path to a configuration file for improved security.
  self.warnings.warn(
2025-06-12 06:59:42,483 CRIT Supervisor is running as root.  Privileges were not dropped because no user is specified in the config file.  If you intend to run as root, you can set user=root in the config file to avoid this message.
2025-06-12 06:59:42,486 INFO RPC interface 'supervisor' initialized
2025-06-12 06:59:42,486 CRIT Server 'unix_http_server' running without any HTTP authentication checking
2025-06-12 06:59:42,486 INFO supervisord started with pid 305
2025-06-12 06:59:43,539 INFO spawned: 'stdout' with pid 306
2025-06-12 06:59:43,541 INFO spawned: 'superwatcher' with pid 307
2025-06-12 06:59:43,543 INFO spawned: 'awx-dispatcher' with pid 308
2025-06-12 06:59:43,545 INFO spawned: 'awx-receiver' with pid 309
2025-06-12 06:59:43,546 INFO spawned: 'awx-uwsgi' with pid 310
2025-06-12 06:59:43,548 INFO spawned: 'awx-daphne' with pid 311
2025-06-12 06:59:43,550 INFO spawned: 'awx-nginx' with pid 312
2025-06-12 06:59:43,552 INFO spawned: 'awx-wsbroadcast' with pid 313
2025-06-12 06:59:43,554 INFO spawned: 'awx-rsyslogd' with pid 314
2025-06-12 06:59:43,555 INFO spawned: 'awx-autoreload' with pid 316
2025-06-12 06:59:43,557 INFO spawned: 'awx-receptor' with pid 317
READY
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
2025-06-12 06:59:44,666 INFO success: stdout entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:59:44,667 INFO success: superwatcher entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:59:44,667 INFO success: awx-dispatcher entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:59:44,667 INFO success: awx-receiver entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:59:44,668 INFO success: awx-uwsgi entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:59:44,668 INFO success: awx-daphne entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:59:44,668 INFO success: awx-nginx entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:59:44,668 INFO success: awx-wsbroadcast entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:59:44,668 INFO success: awx-rsyslogd entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:59:44,668 INFO success: awx-autoreload entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 06:59:44,668 INFO success: awx-receptor entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
awx-autoreload stdout | make[1]: Entering directory '/awx_devel'
awx-autoreload stdout |
INFO 2025/06/12 06:59:44 Running control service control {"node_id":"awx_1"}
INFO 2025/06/12 06:59:44 Initialization complete
nginx -g "daemon off;"
2025-06-12 06:59:48,900 INFO     [-] daphne.cli Starting server at tcp:port=8051:interface=127.0.0.1
2025-06-12 06:59:48,900 INFO     Starting server at tcp:port=8051:interface=127.0.0.1
2025-06-12 06:59:48,903 INFO     [-] daphne.server HTTP/2 support not enabled (install the http2 and tls Twisted extras)
2025-06-12 06:59:48,903 INFO     HTTP/2 support not enabled (install the http2 and tls Twisted extras)
2025-06-12 06:59:48,903 INFO     [-] daphne.server Configuring endpoint tcp:port=8051:interface=127.0.0.1
2025-06-12 06:59:48,903 INFO     Configuring endpoint tcp:port=8051:interface=127.0.0.1
2025-06-12 06:59:48,904 INFO     [-] daphne.server Listening on TCP address 127.0.0.1:8051
2025-06-12 06:59:48,904 INFO     Listening on TCP address 127.0.0.1:8051
*** Starting uWSGI 2.0.18 (64bit) on [Thu Jun 12 06:59:49 2025] ***
compiled with version: 11.5.0 20240719 (Red Hat 11.5.0-5) on 09 June 2025 00:48:49
os: Linux-5.14.0-503.21.1.el9_5.x86_64 #1 SMP PREEMPT_DYNAMIC Thu Dec 19 09:37:00 EST 2024
nodename: awx_1
machine: x86_64
clock source: unix
detected number of CPU cores: 4
current working directory: /awx_devel
detected binary path: /var/lib/awx/venv/awx/bin/uwsgi
!!! no internal routing support, rebuild with pcre support !!!
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
chdir() to /awx_devel/
your processes number limit is 1048576
your memory page size is 4096 bytes
 *** WARNING: you have enabled harakiri without post buffering. Slow upload could be rejected on post-unbuffered webservers ***
detected max file descriptor number: 1048576
lock engine: pthread robust mutexes
thunder lock: disabled (you can enable it with --thunder-lock)
uwsgi socket 0 bound to TCP address 127.0.0.1:8050 fd 3
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
Python version: 3.9.21 (main, Feb 10 2025, 00:00:00)  [GCC 11.5.0 20240719 (Red Hat 11.5.0-5)]
PEP 405 virtualenv detected: /var/lib/awx/venv/awx
Set PythonHome to /var/lib/awx/venv/awx
*** Python threads support is disabled. You can enable it with --enable-threads ***
Python main interpreter initialized at 0x1dc5b70
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
your server socket listen backlog is limited to 100 connections
your mercy for graceful operations on workers is 60 seconds
mapped 609552 bytes (595 KB) for 5 cores
*** Operational MODE: preforking ***
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
*** uWSGI is running in multiple interpreter mode ***
spawned uWSGI master process (pid: 745)
spawned uWSGI worker 1 (pid: 746, cores: 1)
spawned uWSGI worker 2 (pid: 747, cores: 1)
spawned uWSGI worker 3 (pid: 748, cores: 1)
spawned uWSGI worker 4 (pid: 749, cores: 1)
spawned uWSGI worker 5 (pid: 750, cores: 1)
*** Stats server enabled on /tmp/stats.socket fd: 17 ***
2025-06-12 06:59:49,734 WARNING  [-] awx.main.dispatch.periodic periodic beat started
2025-06-12 06:59:49,784 INFO     [-] awx.main.dispatch Running worker dispatcher listening to queues ['tower_broadcast_all', 'awx_1']
2025-06-12 06:59:49,874 WARNING  [-] awx.main.tasks.system Heartbeat skew - interval=85.7913, expected=60
2025-06-12 06:59:50,324 INFO waiting for awx-rsyslogd to stop
2025-06-12 06:59:50,325 INFO stopped: awx-rsyslogd (exit status 0)
2025-06-12 06:59:50,330 INFO spawned: 'awx-rsyslogd' with pid 757
2025-06-12 06:59:50,604 INFO     [-] awx.main.wsbroadcast Active instance with hostname awx_1 is registered.
2025-06-12 06:59:51,606 INFO success: awx-rsyslogd entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
WSGI app 0 (mountpoint='') ready in 2 seconds on interpreter 0x1dc5b70 pid: 749 (default app)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x1dc5b70 pid: 747 (default app)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x1dc5b70 pid: 746 (default app)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x1dc5b70 pid: 750 (default app)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x1dc5b70 pid: 748 (default app)
INFO 2025/06/12 07:00:00 Connection established with receptor-hop {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:00:00 Known Connections: {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:00:00    receptor-hop: awx_1(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:00:00    awx_1: receptor-hop(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:00:00 Routing Table: {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:00:00    receptor-hop via receptor-hop {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:00:00 Known Connections: {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:00:00    awx_1: receptor-hop(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:00:00    receptor-hop: awx_1(1.00) receptor-1(1.00) receptor-2(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:00:00 Routing Table: {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:00:00    receptor-hop via receptor-hop {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:00:00 Known Connections: {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:00:00    awx_1: receptor-hop(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:00:00    receptor-hop: awx_1(1.00) receptor-1(1.00) receptor-2(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:00:00    receptor-1: receptor-hop(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:00:00    receptor-2: receptor-hop(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:00:00 Routing Table: {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:00:00    receptor-1 via receptor-hop {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:00:00    receptor-2 via receptor-hop {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:00:00    receptor-hop via receptor-hop {"node_id":"awx_1","remote_id":"receptor-hop"}
[root@nodehub _sources]# env | grep CONTAINER_RUNTIME
CONTAINER_RUNTIME=runc
[root@nodehub _sources]# podman info | grep -i runtime
  ociRuntime:
[root@nodehub _sources]# cat /etc/containers/containers.conf
cat: /etc/containers/containers.conf: No such file or directory
[root@nodehub _sources]# cat /etc/containers/
certs.d/           nodocker           policy.json        registries.conf.d/ storage.conf
networks/          oci/               registries.conf    registries.d/      systemd/
[root@nodehub _sources]# podman --log-level=debug info | grep -A5 ociRuntime
INFO[0000] podman filtering at log level debug
DEBU[0000] Called info.PersistentPreRunE(podman --log-level=debug info)
DEBU[0000] Using conmon: "/usr/bin/conmon"
INFO[0000] Using sqlite as database backend
DEBU[0000] Using graph driver overlay
DEBU[0000] Using graph root /var/lib/containers/storage
DEBU[0000] Using run root /run/containers/storage
DEBU[0000] Using static dir /var/lib/containers/storage/libpod
DEBU[0000] Using tmp dir /run/libpod
DEBU[0000] Using volume path /var/lib/containers/storage/volumes
DEBU[0000] Using transient store: false
DEBU[0000] [graphdriver] trying provided driver "overlay"
DEBU[0000] Cached value indicated that overlay is supported
DEBU[0000] Cached value indicated that overlay is supported
DEBU[0000] Cached value indicated that metacopy is being used
DEBU[0000] Cached value indicated that native-diff is not being used
INFO[0000] Not using native diff for overlay, this may cause degraded performance for building images: kernel has CONFIG_OVERLAY_FS_REDIRECT_DIR enabled
DEBU[0000] backingFs=xfs, projectQuotaSupported=false, useNativeDiff=false, usingMetacopy=true
DEBU[0000] Initializing event backend journald
DEBU[0000] Configured OCI runtime crun-wasm initialization failed: no valid executable found for OCI runtime crun-wasm: invalid argument
DEBU[0000] Configured OCI runtime kata initialization failed: no valid executable found for OCI runtime kata: invalid argument
DEBU[0000] Configured OCI runtime runsc initialization failed: no valid executable found for OCI runtime runsc: invalid argument
DEBU[0000] Configured OCI runtime youki initialization failed: no valid executable found for OCI runtime youki: invalid argument
DEBU[0000] Configured OCI runtime krun initialization failed: no valid executable found for OCI runtime krun: invalid argument
DEBU[0000] Configured OCI runtime crun-vm initialization failed: no valid executable found for OCI runtime crun-vm: invalid argument
DEBU[0000] Configured OCI runtime runc initialization failed: no valid executable found for OCI runtime runc: invalid argument
DEBU[0000] Configured OCI runtime runj initialization failed: no valid executable found for OCI runtime runj: invalid argument
DEBU[0000] Configured OCI runtime ocijail initialization failed: no valid executable found for OCI runtime ocijail: invalid argument
DEBU[0000] Using OCI runtime "/usr/bin/crun"
INFO[0000] Setting parallel job count to 13
DEBU[0000] Cached value indicated that volatile is being used
DEBU[0000] Cached value indicated that idmapped mounts for overlay are not supported
DEBU[0000] Check for idmapped mounts support
DEBU[0000] Loading registries configuration "/etc/containers/registries.conf"
DEBU[0000] Loading registries configuration "/etc/containers/registries.conf.d/000-shortnames.conf"
DEBU[0000] Loading registries configuration "/etc/containers/registries.conf.d/001-rhel-shortnames.conf"
DEBU[0000] Loading registries configuration "/etc/containers/registries.conf.d/002-rhel-shortnames-overrides.conf"
DEBU[0000] Called info.PersistentPostRunE(podman --log-level=debug info)
  ociRuntime:
    name: crun
    package: crun-1.16.1-1.el9.x86_64
    path: /usr/bin/crun
    version: |-
      crun version 1.16.1
DEBU[0000] Shutting down engines
INFO[0000] Received shutdown.Stop(), terminating!        PID=7861
[root@nodehub _sources]# dnf install runc -y
Updating Subscription Management repositories.
Last metadata expiration check: 1:07:24 ago on Thu 12 Jun 2025 12:57:45 AM EST.
Dependencies resolved.
===============================================================================================================================================
 Package                 Architecture              Version                           Repository                                           Size
===============================================================================================================================================
Installing:
 runc                    x86_64                    4:1.2.4-2.el9                     rhel-9-for-x86_64-appstream-rpms                    3.5 M

Transaction Summary
===============================================================================================================================================
Install  1 Package

Total download size: 3.5 M
Installed size: 11 M
Downloading Packages:
runc-1.2.4-2.el9.x86_64.rpm                                                                                    3.3 MB/s | 3.5 MB     00:01
-----------------------------------------------------------------------------------------------------------------------------------------------
Total                                                                                                          3.3 MB/s | 3.5 MB     00:01
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                                                                                       1/1
  Installing       : runc-4:1.2.4-2.el9.x86_64                                                                                             1/1
  Running scriptlet: runc-4:1.2.4-2.el9.x86_64                                                                                             1/1
  Verifying        : runc-4:1.2.4-2.el9.x86_64                                                                                             1/1
Installed products updated.

Installed:
  runc-4:1.2.4-2.el9.x86_64

Complete!
[root@nodehub _sources]# which runc
runc --version
/bin/runc
runc version 1.2.4
spec: 1.2.0+dev
go: go1.23.2 (Red Hat 1.23.2-1.el9)
libseccomp: 2.5.2
[root@nodehub _sources]# mkdir -p /etc/containers/
[root@nodehub _sources]# vi /etc/containers/containers.conf
[root@nodehub _sources]# systemctl restart podman
[root@nodehub _sources]# podman info | grep -A5 ociRuntime
  ociRuntime:
    name: runc
    package: runc-1.2.4-2.el9.x86_64
    path: /usr/bin/runc
    version: |-
      runc version 1.2.4
[root@nodehub _sources]# podman rm -f tools_redis_1 tools_postgres_1 tools_awx_1 tools_receptor_hop tools_receptor_1 tools_receptor_2
tools_receptor_1
tools_receptor_2
Error: container ea4028bdb3e934246ed2fd536e1119c14eaacf701b4da8a0e7603a50367ebe18 has dependent containers which must be removed before it: 119721ce2c9442a0d9581e3bb0e32f2489317ca43d2efba946d0de0911ec6652, da94f04bdbc8c43b059f1859b2c739ab36b5532b1b5146f6eca8d6af26b0b774, 539d3a6a4241294cb15c78358c7525811d689dff30e76b3feae8213923803c12: container already exists
Error: container 119721ce2c9442a0d9581e3bb0e32f2489317ca43d2efba946d0de0911ec6652 has dependent containers which must be removed before it: da94f04bdbc8c43b059f1859b2c739ab36b5532b1b5146f6eca8d6af26b0b774, 539d3a6a4241294cb15c78358c7525811d689dff30e76b3feae8213923803c12: container already exists
Error: container 684bbbc25c63dd2f70452ddacde23f838b8b7e6e69a0041050c2d714f8d3f434 has dependent containers which must be removed before it: 119721ce2c9442a0d9581e3bb0e32f2489317ca43d2efba946d0de0911ec6652, da94f04bdbc8c43b059f1859b2c739ab36b5532b1b5146f6eca8d6af26b0b774: container already exists
Error: container da94f04bdbc8c43b059f1859b2c739ab36b5532b1b5146f6eca8d6af26b0b774 has dependent containers which must be removed before it: f2a43f0628fcdf012dab44d9e24cee9ba41e02278160c7751a0cff3c18a324f9, 539d3a6a4241294cb15c78358c7525811d689dff30e76b3feae8213923803c12: container already exists
[root@nodehub _sources]# podman ps -a
CONTAINER ID  IMAGE                             COMMAND               CREATED        STATUS        PORTS                                                                                                                                                                                                             NAMES
ea4028bdb3e9  docker.io/library/redis:latest    /usr/local/etc/re...  7 minutes ago  Up 7 minutes  6379/tcp                                                                                                                                                                                                          tools_redis_1
684bbbc25c63  docker.io/library/postgres:12     postgres -c log_d...  7 minutes ago  Up 7 minutes  5432/tcp                                                                                                                                                                                                          tools_postgres_1
119721ce2c94  ghcr.io/ansible/awx_devel:24.6.1  launch_awx.sh         7 minutes ago  Up 7 minutes  0.0.0.0:2222->2222/tcp, 0.0.0.0:3000->3001/tcp, 0.0.0.0:6899->6899/tcp, 0.0.0.0:7899-7999->7899-7999/tcp, 0.0.0.0:8013->8013/tcp, 0.0.0.0:8043->8043/tcp, 0.0.0.0:8080->8080/tcp, 0.0.0.0:8888->8888/tcp, 22/tcp  tools_awx_1
da94f04bdbc8  quay.io/ansible/receptor:devel    receptor --config...  7 minutes ago  Up 7 minutes  0.0.0.0:5555->5555/tcp, 7323/tcp                                                                                                                                                                                  tools_receptor_hop
[root@nodehub _sources]# podman stop ea4028bdb3e9 684bbbc25c63 119721ce2c94
WARN[0010] StopSignal SIGTERM failed to stop container tools_awx_1 in 10 seconds, resorting to SIGKILL
ea4028bdb3e9
684bbbc25c63
119721ce2c94
[root@nodehub _sources]# podman ps -a
CONTAINER ID  IMAGE                             COMMAND               CREATED        STATUS                      PORTS                                                                                                                                                                                                             NAMES
ea4028bdb3e9  docker.io/library/redis:latest    /usr/local/etc/re...  8 minutes ago  Exited (0) 16 seconds ago   6379/tcp                                                                                                                                                                                                          tools_redis_1
684bbbc25c63  docker.io/library/postgres:12     postgres -c log_d...  8 minutes ago  Exited (0) 16 seconds ago   5432/tcp                                                                                                                                                                                                          tools_postgres_1
119721ce2c94  ghcr.io/ansible/awx_devel:24.6.1  launch_awx.sh         8 minutes ago  Exited (137) 6 seconds ago  0.0.0.0:2222->2222/tcp, 0.0.0.0:3000->3001/tcp, 0.0.0.0:6899->6899/tcp, 0.0.0.0:7899-7999->7899-7999/tcp, 0.0.0.0:8013->8013/tcp, 0.0.0.0:8043->8043/tcp, 0.0.0.0:8080->8080/tcp, 0.0.0.0:8888->8888/tcp, 22/tcp  tools_awx_1
da94f04bdbc8  quay.io/ansible/receptor:devel    receptor --config...  8 minutes ago  Up 8 minutes                0.0.0.0:5555->5555/tcp, 7323/tcp                                                                                                                                                                                  tools_receptor_hop
[root@nodehub _sources]# podman stop ea4028bdb3e9 684bbbc25c63 119721ce2c94 da94f04bdbc8
684bbbc25c63
119721ce2c94
da94f04bdbc8
ea4028bdb3e9
[root@nodehub _sources]# podman rm ea4028bdb3e9 684bbbc25c63 119721ce2c94 da94f04bdbc8
da94f04bdbc8
Error: container 119721ce2c9442a0d9581e3bb0e32f2489317ca43d2efba946d0de0911ec6652 has dependent containers which must be removed before it: da94f04bdbc8c43b059f1859b2c739ab36b5532b1b5146f6eca8d6af26b0b774: container already exists
Error: container 684bbbc25c63dd2f70452ddacde23f838b8b7e6e69a0041050c2d714f8d3f434 has dependent containers which must be removed before it: 119721ce2c9442a0d9581e3bb0e32f2489317ca43d2efba946d0de0911ec6652, da94f04bdbc8c43b059f1859b2c739ab36b5532b1b5146f6eca8d6af26b0b774: container already exists
Error: container ea4028bdb3e934246ed2fd536e1119c14eaacf701b4da8a0e7603a50367ebe18 has dependent containers which must be removed before it: 119721ce2c9442a0d9581e3bb0e32f2489317ca43d2efba946d0de0911ec6652: container already exists
[root@nodehub _sources]# podman stop ea4028bdb3e9 684bbbc25c63 119721ce2c94 da94f04bdbc8
Error: no container with name or ID "da94f04bdbc8" found: no such container
[root@nodehub _sources]# podman ps -a
CONTAINER ID  IMAGE                             COMMAND               CREATED        STATUS                       PORTS                                                                                                                                                                                                             NAMES
ea4028bdb3e9  docker.io/library/redis:latest    /usr/local/etc/re...  8 minutes ago  Exited (0) 34 seconds ago    6379/tcp                                                                                                                                                                                                          tools_redis_1
684bbbc25c63  docker.io/library/postgres:12     postgres -c log_d...  8 minutes ago  Exited (0) 34 seconds ago    5432/tcp                                                                                                                                                                                                          tools_postgres_1
119721ce2c94  ghcr.io/ansible/awx_devel:24.6.1  launch_awx.sh         8 minutes ago  Exited (137) 24 seconds ago  0.0.0.0:2222->2222/tcp, 0.0.0.0:3000->3001/tcp, 0.0.0.0:6899->6899/tcp, 0.0.0.0:7899-7999->7899-7999/tcp, 0.0.0.0:8013->8013/tcp, 0.0.0.0:8043->8043/tcp, 0.0.0.0:8080->8080/tcp, 0.0.0.0:8888->8888/tcp, 22/tcp  tools_awx_1
[root@nodehub _sources]# podman stop ea4028bdb3e9 684bbbc25c63 119721ce2c94
684bbbc25c63
119721ce2c94
ea4028bdb3e9
[root@nodehub _sources]# podman rm ea4028bdb3e9 684bbbc25c63 119721ce2c94
119721ce2c94
Error: container 684bbbc25c63dd2f70452ddacde23f838b8b7e6e69a0041050c2d714f8d3f434 has dependent containers which must be removed before it: 119721ce2c9442a0d9581e3bb0e32f2489317ca43d2efba946d0de0911ec6652: container already exists
Error: container ea4028bdb3e934246ed2fd536e1119c14eaacf701b4da8a0e7603a50367ebe18 has dependent containers which must be removed before it: 119721ce2c9442a0d9581e3bb0e32f2489317ca43d2efba946d0de0911ec6652: container already exists
[root@nodehub _sources]# podman stop ea4028bdb3e9 684bbbc25c63 119721ce2c94
Error: no container with name or ID "119721ce2c94" found: no such container
[root@nodehub _sources]# podman rm ea4028bdb3e9 684bbbc25c63 119721ce2c94
Error: no container with ID or name "119721ce2c94" found: no such container
[root@nodehub _sources]# podman ps -a
CONTAINER ID  IMAGE                           COMMAND               CREATED        STATUS                     PORTS       NAMES
ea4028bdb3e9  docker.io/library/redis:latest  /usr/local/etc/re...  8 minutes ago  Exited (0) 55 seconds ago  6379/tcp    tools_redis_1
684bbbc25c63  docker.io/library/postgres:12   postgres -c log_d...  8 minutes ago  Exited (0) 55 seconds ago  5432/tcp    tools_postgres_1
[root@nodehub _sources]# podman rm ea4028bdb3e9 684bbbc25c63
684bbbc25c63
ea4028bdb3e9
[root@nodehub _sources]# podman ps -a
CONTAINER ID  IMAGE       COMMAND     CREATED     STATUS      PORTS       NAMES
[root@nodehub _sources]# COMPOSE_PROJECT_NAME=sources podman-compose -f docker-compose.yml up -d
b7732317c15fe8aa3161a32972b792a6a29beb0829b61b0dc6ebcbb67db854f7
tools_redis_1
215c3adbd77fc9f88ec1086b91e555cadd0c0f2d1bea5a51fa26ff8f10fca67f
tools_postgres_1
e2084eab5ddd7ca32a30d594576191fdd12bb892273222e74f6fb396c9853da9
tools_awx_1
e7b5630c7285b834110b9f75289fc8725a9bd12ff7b30c43c4c87f64abf25b1e
tools_receptor_hop
29e201c072e1524dba093d93c3b7d0a3ef925f265519931cb8df6050793a13ba
tools_receptor_1
7d2d8345721e56b2f5c1d1d0c03955dcf78595e2ff8ffbb758d9a08bc50c017c
tools_receptor_2
[root@nodehub _sources]# podman logs tools_
tools_awx_1         (pod_sources)  tools_receptor_1    (pod_sources)  tools_receptor_hop  (pod_sources)
tools_postgres_1    (pod_sources)  tools_receptor_2    (pod_sources)  tools_redis_1       (pod_sources)
[root@nodehub _sources]# podman logs tools_awx_1
[ -d "/awx_devel/awx.egg-info" ] || python3.9 /awx_devel/tools/scripts/egg_info_dev
cp -f /tmp/awx.egg-link /var/lib/awx/venv/awx/lib/python3.9/site-packages/awx.egg-link
mkdir -p /var/lib/awx/; \
if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
python3.9 -c "import awx; print(awx.__version__)" > /var/lib/awx/.awx_version; \

if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
awx-manage migrate --noinput
Operations to perform:
  Apply all migrations: auth, conf, contenttypes, main, oauth2_provider, sessions, sites, social_django, sso, taggit
Running migrations:
  No migrations to apply.
Admin password: CCWIdjRTMfbXuNgAslLJ
(changed: False)
[root@nodehub _sources]# podman logs tools_awx_1
[ -d "/awx_devel/awx.egg-info" ] || python3.9 /awx_devel/tools/scripts/egg_info_dev
cp -f /tmp/awx.egg-link /var/lib/awx/venv/awx/lib/python3.9/site-packages/awx.egg-link
mkdir -p /var/lib/awx/; \
if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
python3.9 -c "import awx; print(awx.__version__)" > /var/lib/awx/.awx_version; \

if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
awx-manage migrate --noinput
Operations to perform:
  Apply all migrations: auth, conf, contenttypes, main, oauth2_provider, sessions, sites, social_django, sso, taggit
Running migrations:
  No migrations to apply.
Admin password: CCWIdjRTMfbXuNgAslLJ
(changed: False)
(changed: False)
[root@nodehub _sources]# podman logs tools_awx_1
[ -d "/awx_devel/awx.egg-info" ] || python3.9 /awx_devel/tools/scripts/egg_info_dev
cp -f /tmp/awx.egg-link /var/lib/awx/venv/awx/lib/python3.9/site-packages/awx.egg-link
mkdir -p /var/lib/awx/; \
if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
python3.9 -c "import awx; print(awx.__version__)" > /var/lib/awx/.awx_version; \

if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
awx-manage migrate --noinput
Operations to perform:
  Apply all migrations: auth, conf, contenttypes, main, oauth2_provider, sessions, sites, social_django, sso, taggit
Running migrations:
  No migrations to apply.
Admin password: CCWIdjRTMfbXuNgAslLJ
(changed: False)
(changed: False)
Instance already registered awx_1
Instance Group already registered controlplane
Instance Group already registered default
Instance already registered receptor-hop
0 new peer links added to the database.
Instance already registered receptor-1
0 new peer links added to the database.
Instance already registered receptor-2
0 new peer links added to the database.
/usr/local/lib/python3.9/site-packages/supervisor/options.py:474: UserWarning: Supervisord is running as root and it is searching for its configuration file in default locations (including its current working directory); you probably want to specify a "-c" argument specifying an absolute path to a configuration file for improved security.
  self.warnings.warn(
2025-06-12 07:08:58,454 CRIT Supervisor is running as root.  Privileges were not dropped because no user is specified in the config file.  If you intend to run as root, you can set user=root in the config file to avoid this message.
2025-06-12 07:08:58,458 INFO RPC interface 'supervisor' initialized
2025-06-12 07:08:58,458 CRIT Server 'unix_http_server' running without any HTTP authentication checking
2025-06-12 07:08:58,458 INFO supervisord started with pid 311
2025-06-12 07:08:59,461 INFO spawned: 'stdout' with pid 312
2025-06-12 07:08:59,463 INFO spawned: 'superwatcher' with pid 313
2025-06-12 07:08:59,465 INFO spawned: 'awx-dispatcher' with pid 314
2025-06-12 07:08:59,467 INFO spawned: 'awx-receiver' with pid 315
2025-06-12 07:08:59,468 INFO spawned: 'awx-uwsgi' with pid 316
2025-06-12 07:08:59,470 INFO spawned: 'awx-daphne' with pid 317
2025-06-12 07:08:59,472 INFO spawned: 'awx-nginx' with pid 318
2025-06-12 07:08:59,474 INFO spawned: 'awx-wsbroadcast' with pid 319
2025-06-12 07:08:59,476 INFO spawned: 'awx-rsyslogd' with pid 321
2025-06-12 07:08:59,478 INFO spawned: 'awx-autoreload' with pid 322
2025-06-12 07:08:59,480 INFO spawned: 'awx-receptor' with pid 323
READY
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
INFO 2025/06/12 07:09:00 Running control service control {"node_id":"awx_1"}
INFO 2025/06/12 07:09:00 Initialization complete
2025-06-12 07:09:01,406 INFO success: stdout entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 07:09:01,407 INFO success: superwatcher entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 07:09:01,407 INFO success: awx-dispatcher entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 07:09:01,408 INFO success: awx-receiver entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 07:09:01,408 INFO success: awx-uwsgi entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 07:09:01,408 INFO success: awx-daphne entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 07:09:01,408 INFO success: awx-nginx entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 07:09:01,408 INFO success: awx-wsbroadcast entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 07:09:01,408 INFO success: awx-rsyslogd entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 07:09:01,408 INFO success: awx-autoreload entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 07:09:01,409 INFO success: awx-receptor entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
awx-autoreload stdout | make[1]: Entering directory '/awx_devel'
awx-autoreload stdout |
nginx -g "daemon off;"
2025-06-12 07:09:05,040 INFO     [-] daphne.cli Starting server at tcp:port=8051:interface=127.0.0.1
2025-06-12 07:09:05,040 INFO     Starting server at tcp:port=8051:interface=127.0.0.1
2025-06-12 07:09:05,043 INFO     [-] daphne.server HTTP/2 support not enabled (install the http2 and tls Twisted extras)
2025-06-12 07:09:05,043 INFO     HTTP/2 support not enabled (install the http2 and tls Twisted extras)
2025-06-12 07:09:05,043 INFO     [-] daphne.server Configuring endpoint tcp:port=8051:interface=127.0.0.1
2025-06-12 07:09:05,043 INFO     Configuring endpoint tcp:port=8051:interface=127.0.0.1
2025-06-12 07:09:05,044 INFO     [-] daphne.server Listening on TCP address 127.0.0.1:8051
2025-06-12 07:09:05,044 INFO     Listening on TCP address 127.0.0.1:8051
*** Starting uWSGI 2.0.18 (64bit) on [Thu Jun 12 07:09:05 2025] ***
compiled with version: 11.5.0 20240719 (Red Hat 11.5.0-5) on 09 June 2025 00:48:49
os: Linux-5.14.0-503.21.1.el9_5.x86_64 #1 SMP PREEMPT_DYNAMIC Thu Dec 19 09:37:00 EST 2024
nodename: awx_1
machine: x86_64
clock source: unix
detected number of CPU cores: 4
current working directory: /awx_devel
detected binary path: /var/lib/awx/venv/awx/bin/uwsgi
!!! no internal routing support, rebuild with pcre support !!!
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
chdir() to /awx_devel/
your processes number limit is 1048576
your memory page size is 4096 bytes
 *** WARNING: you have enabled harakiri without post buffering. Slow upload could be rejected on post-unbuffered webservers ***
detected max file descriptor number: 1048576
lock engine: pthread robust mutexes
thunder lock: disabled (you can enable it with --thunder-lock)
uwsgi socket 0 bound to TCP address 127.0.0.1:8050 fd 3
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
Python version: 3.9.21 (main, Feb 10 2025, 00:00:00)  [GCC 11.5.0 20240719 (Red Hat 11.5.0-5)]
PEP 405 virtualenv detected: /var/lib/awx/venv/awx
Set PythonHome to /var/lib/awx/venv/awx
*** Python threads support is disabled. You can enable it with --enable-threads ***
Python main interpreter initialized at 0x1da0b70
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
your server socket listen backlog is limited to 100 connections
your mercy for graceful operations on workers is 60 seconds
mapped 609552 bytes (595 KB) for 5 cores
*** Operational MODE: preforking ***
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
*** uWSGI is running in multiple interpreter mode ***
spawned uWSGI master process (pid: 751)
spawned uWSGI worker 1 (pid: 752, cores: 1)
spawned uWSGI worker 2 (pid: 753, cores: 1)
spawned uWSGI worker 3 (pid: 754, cores: 1)
spawned uWSGI worker 4 (pid: 755, cores: 1)
spawned uWSGI worker 5 (pid: 756, cores: 1)
*** Stats server enabled on /tmp/stats.socket fd: 17 ***
2025-06-12 07:09:05,367 WARNING  [-] awx.main.dispatch.periodic periodic beat started
2025-06-12 07:09:05,411 INFO     [-] awx.main.dispatch Running worker dispatcher listening to queues ['tower_broadcast_all', 'awx_1']
2025-06-12 07:09:05,520 WARNING  [-] awx.main.tasks.system Rejoining the cluster as instance awx_1. Prior last_seen 2025-06-12 07:06:50.667631+00:00
2025-06-12 07:09:05,677 INFO     [-] awx.main.wsbroadcast Active instance with hostname awx_1 is registered.
2025-06-12 07:09:05,828 INFO waiting for awx-rsyslogd to stop
2025-06-12 07:09:05,830 INFO stopped: awx-rsyslogd (exit status 0)
2025-06-12 07:09:05,834 INFO spawned: 'awx-rsyslogd' with pid 768
2025-06-12 07:09:06,835 INFO success: awx-rsyslogd entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
WSGI app 0 (mountpoint='') ready in 2 seconds on interpreter 0x1da0b70 pid: 755 (default app)
WSGI app 0 (mountpoint='') ready in 2 seconds on interpreter 0x1da0b70 pid: 756 (default app)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x1da0b70 pid: 754 (default app)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x1da0b70 pid: 753 (default app)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x1da0b70 pid: 752 (default app)
INFO 2025/06/12 07:09:15 Connection established with receptor-hop {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:09:16 Known Connections: {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:09:16    awx_1: receptor-hop(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:09:16    receptor-hop: awx_1(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:09:16 Routing Table: {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:09:16    receptor-hop via receptor-hop {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:09:16 Known Connections: {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:09:16    awx_1: receptor-hop(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:09:16    receptor-hop: awx_1(1.00) receptor-1(1.00) receptor-2(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:09:16 Routing Table: {"remote_id":"receptor-hop","node_id":"awx_1"}
INFO 2025/06/12 07:09:16    receptor-hop via receptor-hop {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:09:16 Known Connections: {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:09:16    receptor-hop: awx_1(1.00) receptor-1(1.00) receptor-2(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:09:16    receptor-2: receptor-hop(1.00)  {"remote_id":"receptor-hop","node_id":"awx_1"}
INFO 2025/06/12 07:09:16    receptor-1: receptor-hop(1.00)  {"remote_id":"receptor-hop","node_id":"awx_1"}
INFO 2025/06/12 07:09:16    awx_1: receptor-hop(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:09:16 Routing Table: {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:09:16    receptor-hop via receptor-hop {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:09:16    receptor-2 via receptor-hop {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:09:16    receptor-1 via receptor-hop {"node_id":"awx_1","remote_id":"receptor-hop"}
2025-06-12 07:10:05,659 WARNING  [07cd4c6e] awx.main.tasks.system Hop node receptor-hop, has rejoined the receptor mesh
2025-06-12 07:10:05,667 WARNING  [07cd4c6e] awx.main.tasks.system Execution node attempting to rejoin as instance receptor-1.
2025-06-12 07:10:05,673 WARNING  [07cd4c6e] awx.main.tasks.system Execution node attempting to rejoin as instance receptor-2.
WARNING 2025/06/12 07:10:08 Could not read in control service: read unix /var/run/awx-receptor/receptor.sock->@: use of closed network connection {"node_id":"awx_1","remote_id":"receptor-hop"}
WARNING 2025/06/12 07:10:08 Could not close connection: close unix /var/run/awx-receptor/receptor.sock->@: use of closed network connection {"node_id":"awx_1","remote_id":"receptor-hop"}
2025-06-12 07:10:08,024 WARNING  [07cd4c6e] awx.main.models.ha Self-reported uuid of receptor-2 changed from 3e76b2a5-02c5-4b6a-9699-16017cdc35e0 to ffba93dc-22ee-44bd-8ba6-5b2ec6092a94
2025-06-12 07:10:08,030 INFO     [07cd4c6e] awx.main.tasks.system Set capacity of execution node receptor-2 to 59.00, worker info data:
{
  "errors": [],
  "transmit_timing": 0.025519132614135742,
  "run_timing": 1.0062546730041504,
  "cpu_count": 4,
  "mem_in_bytes": 8382476288,
  "runner_version": "2.4.1.dev27+g69227d2",
  "uuid": "ffba93dc-22ee-44bd-8ba6-5b2ec6092a94"
}
WARNING 2025/06/12 07:10:08 Could not read in control service: read unix /var/run/awx-receptor/receptor.sock->@: use of closed network connection {"node_id":"awx_1","remote_id":"receptor-hop"}
WARNING 2025/06/12 07:10:08 Could not close connection: close unix /var/run/awx-receptor/receptor.sock->@: use of closed network connection {"node_id":"awx_1","remote_id":"receptor-hop"}
2025-06-12 07:10:08,072 WARNING  [07cd4c6e] awx.main.models.ha Self-reported uuid of receptor-1 changed from 32d398f1-278d-40c3-a443-1d94da7df44d to 1e5dc438-f691-4be7-8879-598c92878a59
2025-06-12 07:10:08,079 INFO     [07cd4c6e] awx.main.tasks.system Set capacity of execution node receptor-1 to 59.00, worker info data:
{
  "errors": [],
  "transmit_timing": 0.031186819076538086,
  "run_timing": 0.5125110149383545,
  "cpu_count": 4,
  "mem_in_bytes": 8382476288,
  "runner_version": "2.4.1.dev27+g69227d2",
  "uuid": "1e5dc438-f691-4be7-8879-598c92878a59"
}
[root@nodehub _sources]# podman logs tools_awx_1
[ -d "/awx_devel/awx.egg-info" ] || python3.9 /awx_devel/tools/scripts/egg_info_dev
cp -f /tmp/awx.egg-link /var/lib/awx/venv/awx/lib/python3.9/site-packages/awx.egg-link
mkdir -p /var/lib/awx/; \
if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
python3.9 -c "import awx; print(awx.__version__)" > /var/lib/awx/.awx_version; \

if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
awx-manage migrate --noinput
Operations to perform:
  Apply all migrations: auth, conf, contenttypes, main, oauth2_provider, sessions, sites, social_django, sso, taggit
Running migrations:
  No migrations to apply.
Admin password: CCWIdjRTMfbXuNgAslLJ
(changed: False)
(changed: False)
Instance already registered awx_1
Instance Group already registered controlplane
Instance Group already registered default
Instance already registered receptor-hop
0 new peer links added to the database.
Instance already registered receptor-1
0 new peer links added to the database.
Instance already registered receptor-2
0 new peer links added to the database.
/usr/local/lib/python3.9/site-packages/supervisor/options.py:474: UserWarning: Supervisord is running as root and it is searching for its configuration file in default locations (including its current working directory); you probably want to specify a "-c" argument specifying an absolute path to a configuration file for improved security.
  self.warnings.warn(
2025-06-12 07:08:58,454 CRIT Supervisor is running as root.  Privileges were not dropped because no user is specified in the config file.  If you intend to run as root, you can set user=root in the config file to avoid this message.
2025-06-12 07:08:58,458 INFO RPC interface 'supervisor' initialized
2025-06-12 07:08:58,458 CRIT Server 'unix_http_server' running without any HTTP authentication checking
2025-06-12 07:08:58,458 INFO supervisord started with pid 311
2025-06-12 07:08:59,461 INFO spawned: 'stdout' with pid 312
2025-06-12 07:08:59,463 INFO spawned: 'superwatcher' with pid 313
2025-06-12 07:08:59,465 INFO spawned: 'awx-dispatcher' with pid 314
2025-06-12 07:08:59,467 INFO spawned: 'awx-receiver' with pid 315
2025-06-12 07:08:59,468 INFO spawned: 'awx-uwsgi' with pid 316
2025-06-12 07:08:59,470 INFO spawned: 'awx-daphne' with pid 317
2025-06-12 07:08:59,472 INFO spawned: 'awx-nginx' with pid 318
2025-06-12 07:08:59,474 INFO spawned: 'awx-wsbroadcast' with pid 319
2025-06-12 07:08:59,476 INFO spawned: 'awx-rsyslogd' with pid 321
2025-06-12 07:08:59,478 INFO spawned: 'awx-autoreload' with pid 322
2025-06-12 07:08:59,480 INFO spawned: 'awx-receptor' with pid 323
READY
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
INFO 2025/06/12 07:09:00 Running control service control {"node_id":"awx_1"}
INFO 2025/06/12 07:09:00 Initialization complete
2025-06-12 07:09:01,406 INFO success: stdout entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 07:09:01,407 INFO success: superwatcher entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 07:09:01,407 INFO success: awx-dispatcher entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 07:09:01,408 INFO success: awx-receiver entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 07:09:01,408 INFO success: awx-uwsgi entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 07:09:01,408 INFO success: awx-daphne entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 07:09:01,408 INFO success: awx-nginx entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 07:09:01,408 INFO success: awx-wsbroadcast entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 07:09:01,408 INFO success: awx-rsyslogd entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 07:09:01,408 INFO success: awx-autoreload entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 07:09:01,409 INFO success: awx-receptor entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
awx-autoreload stdout | make[1]: Entering directory '/awx_devel'
awx-autoreload stdout |
nginx -g "daemon off;"
2025-06-12 07:09:05,040 INFO     [-] daphne.cli Starting server at tcp:port=8051:interface=127.0.0.1
2025-06-12 07:09:05,040 INFO     Starting server at tcp:port=8051:interface=127.0.0.1
2025-06-12 07:09:05,043 INFO     [-] daphne.server HTTP/2 support not enabled (install the http2 and tls Twisted extras)
2025-06-12 07:09:05,043 INFO     HTTP/2 support not enabled (install the http2 and tls Twisted extras)
2025-06-12 07:09:05,043 INFO     [-] daphne.server Configuring endpoint tcp:port=8051:interface=127.0.0.1
2025-06-12 07:09:05,043 INFO     Configuring endpoint tcp:port=8051:interface=127.0.0.1
2025-06-12 07:09:05,044 INFO     [-] daphne.server Listening on TCP address 127.0.0.1:8051
2025-06-12 07:09:05,044 INFO     Listening on TCP address 127.0.0.1:8051
*** Starting uWSGI 2.0.18 (64bit) on [Thu Jun 12 07:09:05 2025] ***
compiled with version: 11.5.0 20240719 (Red Hat 11.5.0-5) on 09 June 2025 00:48:49
os: Linux-5.14.0-503.21.1.el9_5.x86_64 #1 SMP PREEMPT_DYNAMIC Thu Dec 19 09:37:00 EST 2024
nodename: awx_1
machine: x86_64
clock source: unix
detected number of CPU cores: 4
current working directory: /awx_devel
detected binary path: /var/lib/awx/venv/awx/bin/uwsgi
!!! no internal routing support, rebuild with pcre support !!!
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
chdir() to /awx_devel/
your processes number limit is 1048576
your memory page size is 4096 bytes
 *** WARNING: you have enabled harakiri without post buffering. Slow upload could be rejected on post-unbuffered webservers ***
detected max file descriptor number: 1048576
lock engine: pthread robust mutexes
thunder lock: disabled (you can enable it with --thunder-lock)
uwsgi socket 0 bound to TCP address 127.0.0.1:8050 fd 3
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
Python version: 3.9.21 (main, Feb 10 2025, 00:00:00)  [GCC 11.5.0 20240719 (Red Hat 11.5.0-5)]
PEP 405 virtualenv detected: /var/lib/awx/venv/awx
Set PythonHome to /var/lib/awx/venv/awx
*** Python threads support is disabled. You can enable it with --enable-threads ***
Python main interpreter initialized at 0x1da0b70
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
your server socket listen backlog is limited to 100 connections
your mercy for graceful operations on workers is 60 seconds
mapped 609552 bytes (595 KB) for 5 cores
*** Operational MODE: preforking ***
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
*** uWSGI is running in multiple interpreter mode ***
spawned uWSGI master process (pid: 751)
spawned uWSGI worker 1 (pid: 752, cores: 1)
spawned uWSGI worker 2 (pid: 753, cores: 1)
spawned uWSGI worker 3 (pid: 754, cores: 1)
spawned uWSGI worker 4 (pid: 755, cores: 1)
spawned uWSGI worker 5 (pid: 756, cores: 1)
*** Stats server enabled on /tmp/stats.socket fd: 17 ***
2025-06-12 07:09:05,367 WARNING  [-] awx.main.dispatch.periodic periodic beat started
2025-06-12 07:09:05,411 INFO     [-] awx.main.dispatch Running worker dispatcher listening to queues ['tower_broadcast_all', 'awx_1']
2025-06-12 07:09:05,520 WARNING  [-] awx.main.tasks.system Rejoining the cluster as instance awx_1. Prior last_seen 2025-06-12 07:06:50.667631+00:00
2025-06-12 07:09:05,677 INFO     [-] awx.main.wsbroadcast Active instance with hostname awx_1 is registered.
2025-06-12 07:09:05,828 INFO waiting for awx-rsyslogd to stop
2025-06-12 07:09:05,830 INFO stopped: awx-rsyslogd (exit status 0)
2025-06-12 07:09:05,834 INFO spawned: 'awx-rsyslogd' with pid 768
2025-06-12 07:09:06,835 INFO success: awx-rsyslogd entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
WSGI app 0 (mountpoint='') ready in 2 seconds on interpreter 0x1da0b70 pid: 755 (default app)
WSGI app 0 (mountpoint='') ready in 2 seconds on interpreter 0x1da0b70 pid: 756 (default app)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x1da0b70 pid: 754 (default app)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x1da0b70 pid: 753 (default app)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x1da0b70 pid: 752 (default app)
INFO 2025/06/12 07:09:15 Connection established with receptor-hop {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:09:16 Known Connections: {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:09:16    awx_1: receptor-hop(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:09:16    receptor-hop: awx_1(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:09:16 Routing Table: {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:09:16    receptor-hop via receptor-hop {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:09:16 Known Connections: {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:09:16    awx_1: receptor-hop(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:09:16    receptor-hop: awx_1(1.00) receptor-1(1.00) receptor-2(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:09:16 Routing Table: {"remote_id":"receptor-hop","node_id":"awx_1"}
INFO 2025/06/12 07:09:16    receptor-hop via receptor-hop {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:09:16 Known Connections: {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:09:16    receptor-hop: awx_1(1.00) receptor-1(1.00) receptor-2(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:09:16    receptor-2: receptor-hop(1.00)  {"remote_id":"receptor-hop","node_id":"awx_1"}
INFO 2025/06/12 07:09:16    receptor-1: receptor-hop(1.00)  {"remote_id":"receptor-hop","node_id":"awx_1"}
INFO 2025/06/12 07:09:16    awx_1: receptor-hop(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:09:16 Routing Table: {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:09:16    receptor-hop via receptor-hop {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:09:16    receptor-2 via receptor-hop {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:09:16    receptor-1 via receptor-hop {"node_id":"awx_1","remote_id":"receptor-hop"}
2025-06-12 07:10:05,659 WARNING  [07cd4c6e] awx.main.tasks.system Hop node receptor-hop, has rejoined the receptor mesh
2025-06-12 07:10:05,667 WARNING  [07cd4c6e] awx.main.tasks.system Execution node attempting to rejoin as instance receptor-1.
2025-06-12 07:10:05,673 WARNING  [07cd4c6e] awx.main.tasks.system Execution node attempting to rejoin as instance receptor-2.
WARNING 2025/06/12 07:10:08 Could not read in control service: read unix /var/run/awx-receptor/receptor.sock->@: use of closed network connection {"node_id":"awx_1","remote_id":"receptor-hop"}
WARNING 2025/06/12 07:10:08 Could not close connection: close unix /var/run/awx-receptor/receptor.sock->@: use of closed network connection {"node_id":"awx_1","remote_id":"receptor-hop"}
2025-06-12 07:10:08,024 WARNING  [07cd4c6e] awx.main.models.ha Self-reported uuid of receptor-2 changed from 3e76b2a5-02c5-4b6a-9699-16017cdc35e0 to ffba93dc-22ee-44bd-8ba6-5b2ec6092a94
2025-06-12 07:10:08,030 INFO     [07cd4c6e] awx.main.tasks.system Set capacity of execution node receptor-2 to 59.00, worker info data:
{
  "errors": [],
  "transmit_timing": 0.025519132614135742,
  "run_timing": 1.0062546730041504,
  "cpu_count": 4,
  "mem_in_bytes": 8382476288,
  "runner_version": "2.4.1.dev27+g69227d2",
  "uuid": "ffba93dc-22ee-44bd-8ba6-5b2ec6092a94"
}
WARNING 2025/06/12 07:10:08 Could not read in control service: read unix /var/run/awx-receptor/receptor.sock->@: use of closed network connection {"node_id":"awx_1","remote_id":"receptor-hop"}
WARNING 2025/06/12 07:10:08 Could not close connection: close unix /var/run/awx-receptor/receptor.sock->@: use of closed network connection {"node_id":"awx_1","remote_id":"receptor-hop"}
2025-06-12 07:10:08,072 WARNING  [07cd4c6e] awx.main.models.ha Self-reported uuid of receptor-1 changed from 32d398f1-278d-40c3-a443-1d94da7df44d to 1e5dc438-f691-4be7-8879-598c92878a59
2025-06-12 07:10:08,079 INFO     [07cd4c6e] awx.main.tasks.system Set capacity of execution node receptor-1 to 59.00, worker info data:
{
  "errors": [],
  "transmit_timing": 0.031186819076538086,
  "run_timing": 0.5125110149383545,
  "cpu_count": 4,
  "mem_in_bytes": 8382476288,
  "runner_version": "2.4.1.dev27+g69227d2",
  "uuid": "1e5dc438-f691-4be7-8879-598c92878a59"
}
[root@nodehub _sources]# podman ps -a
CONTAINER ID  IMAGE                             COMMAND               CREATED        STATUS        PORTS                                                                                                                                                                                                             NAMES
b7732317c15f  docker.io/library/redis:latest    /usr/local/etc/re...  6 minutes ago  Up 6 minutes  6379/tcp                                                                                                                                                                                                          tools_redis_1
215c3adbd77f  docker.io/library/postgres:12     postgres -c log_d...  6 minutes ago  Up 6 minutes  5432/tcp                                                                                                                                                                                                          tools_postgres_1
e2084eab5ddd  ghcr.io/ansible/awx_devel:24.6.1  launch_awx.sh         6 minutes ago  Up 6 minutes  0.0.0.0:2222->2222/tcp, 0.0.0.0:3000->3001/tcp, 0.0.0.0:6899->6899/tcp, 0.0.0.0:7899-7999->7899-7999/tcp, 0.0.0.0:8013->8013/tcp, 0.0.0.0:8043->8043/tcp, 0.0.0.0:8080->8080/tcp, 0.0.0.0:8888->8888/tcp, 22/tcp  tools_awx_1
e7b5630c7285  quay.io/ansible/receptor:devel    receptor --config...  6 minutes ago  Up 6 minutes  0.0.0.0:5555->5555/tcp, 7323/tcp                                                                                                                                                                                  tools_receptor_hop
29e201c072e1  ghcr.io/ansible/awx_devel:24.6.1  receptor --config...  6 minutes ago  Up 6 minutes  22/tcp, 8013/tcp, 8043/tcp, 8080/tcp                                                                                                                                                                              tools_receptor_1
7d2d8345721e  ghcr.io/ansible/awx_devel:24.6.1  receptor --config...  6 minutes ago  Up 6 minutes  22/tcp, 8013/tcp, 8043/tcp, 8080/tcp                                                                                                                                                                              tools_receptor_2
[root@nodehub _sources]# alias podman='podman --runtime=runc'
[root@nodehub _sources]# cat /usr/local/bin/podman-compose
#!/bin/python
# -*- coding: utf-8 -*-
import re
import sys
from podman_compose import main
if __name__ == '__main__':
    sys.argv[0] = re.sub(r'(-script\.pyw|\.exe)?$', '', sys.argv[0])
    sys.exit(main())
[root@nodehub _sources]#
[root@nodehub _sources]# vim docker-compose.yml
[root@nodehub _sources]# podman rm -f tools_redis_1 tools_postgres_1 tools_awx_1 tools_receptor_hop tools_receptor_1 tools_receptor_2
tools_receptor_2
tools_receptor_1
Error: container b7732317c15fe8aa3161a32972b792a6a29beb0829b61b0dc6ebcbb67db854f7 has dependent containers which must be removed before it: e2084eab5ddd7ca32a30d594576191fdd12bb892273222e74f6fb396c9853da9, e7b5630c7285b834110b9f75289fc8725a9bd12ff7b30c43c4c87f64abf25b1e, 29e201c072e1524dba093d93c3b7d0a3ef925f265519931cb8df6050793a13ba, 7d2d8345721e56b2f5c1d1d0c03955dcf78595e2ff8ffbb758d9a08bc50c017c: container already exists
Error: container e7b5630c7285b834110b9f75289fc8725a9bd12ff7b30c43c4c87f64abf25b1e has dependent containers which must be removed before it: 29e201c072e1524dba093d93c3b7d0a3ef925f265519931cb8df6050793a13ba: container already exists
Error: container 215c3adbd77fc9f88ec1086b91e555cadd0c0f2d1bea5a51fa26ff8f10fca67f has dependent containers which must be removed before it: e2084eab5ddd7ca32a30d594576191fdd12bb892273222e74f6fb396c9853da9, e7b5630c7285b834110b9f75289fc8725a9bd12ff7b30c43c4c87f64abf25b1e, 29e201c072e1524dba093d93c3b7d0a3ef925f265519931cb8df6050793a13ba: container already exists
Error: container e2084eab5ddd7ca32a30d594576191fdd12bb892273222e74f6fb396c9853da9 has dependent containers which must be removed before it: e7b5630c7285b834110b9f75289fc8725a9bd12ff7b30c43c4c87f64abf25b1e, 29e201c072e1524dba093d93c3b7d0a3ef925f265519931cb8df6050793a13ba, 7d2d8345721e56b2f5c1d1d0c03955dcf78595e2ff8ffbb758d9a08bc50c017c: container already exists
[root@nodehub _sources]# podman ps -a
CONTAINER ID  IMAGE                             COMMAND               CREATED        STATUS        PORTS                                                                                                                                                                                                             NAMES
b7732317c15f  docker.io/library/redis:latest    /usr/local/etc/re...  9 minutes ago  Up 9 minutes  6379/tcp                                                                                                                                                                                                          tools_redis_1
215c3adbd77f  docker.io/library/postgres:12     postgres -c log_d...  9 minutes ago  Up 9 minutes  5432/tcp                                                                                                                                                                                                          tools_postgres_1
e2084eab5ddd  ghcr.io/ansible/awx_devel:24.6.1  launch_awx.sh         9 minutes ago  Up 9 minutes  0.0.0.0:2222->2222/tcp, 0.0.0.0:3000->3001/tcp, 0.0.0.0:6899->6899/tcp, 0.0.0.0:7899-7999->7899-7999/tcp, 0.0.0.0:8013->8013/tcp, 0.0.0.0:8043->8043/tcp, 0.0.0.0:8080->8080/tcp, 0.0.0.0:8888->8888/tcp, 22/tcp  tools_awx_1
e7b5630c7285  quay.io/ansible/receptor:devel    receptor --config...  9 minutes ago  Up 9 minutes  0.0.0.0:5555->5555/tcp, 7323/tcp                                                                                                                                                                                  tools_receptor_hop
[root@nodehub _sources]# podman stop b7732317c15f 215c3adbd77f  docker.io/library/postgres:12     postgres -c log_d...  9 minutes ago  Up 9 minutes  5432/tcp                                    ^C
[root@nodehub _sources]# podman stop b7732317c15f 215c3adbd77f e2084eab5ddd e7b5630c7285
WARN[0010] StopSignal SIGTERM failed to stop container tools_awx_1 in 10 seconds, resorting to SIGKILL
b7732317c15f
215c3adbd77f
e2084eab5ddd
e7b5630c7285
[root@nodehub _sources]# podman rm{ b7732317c15f 215c3adbd77f e2084eab5ddd e7b5630c7285
Error: unrecognized command `podman rm{`

Did you mean this?
        rm
        run
        rmi

Try 'podman --help' for more information
[root@nodehub _sources]# podman rm b7732317c15f 215c3adbd77f e2084eab5ddd e7b5630c7285
b7732317c15f
e7b5630c7285
e2084eab5ddd
Error: container 215c3adbd77fc9f88ec1086b91e555cadd0c0f2d1bea5a51fa26ff8f10fca67f has dependent containers which must be removed before it: e2084eab5ddd7ca32a30d594576191fdd12bb892273222e74f6fb396c9853da9, e7b5630c7285b834110b9f75289fc8725a9bd12ff7b30c43c4c87f64abf25b1e: container already exists
[root@nodehub _sources]# podman ps -a
CONTAINER ID  IMAGE                          COMMAND               CREATED         STATUS                     PORTS       NAMES
215c3adbd77f  docker.io/library/postgres:12  postgres -c log_d...  10 minutes ago  Exited (0) 26 seconds ago  5432/tcp    tools_postgres_1
[root@nodehub _sources]# podman stop 215c3adbd77f
215c3adbd77f
[root@nodehub _sources]# podman rm 215c3adbd77f
215c3adbd77f
[root@nodehub _sources]# COMPOSE_PROJECT_NAME=sources podman-compose --replace -f docker-compose.yml up -d
usage: podman-compose [-h] [-v] [--in-pod in_pod] [--pod-args pod_args] [--env-file env_file] [-f file] [--profile profile] [-p PROJECT_NAME]
                      [--podman-path PODMAN_PATH] [--podman-args args] [--podman-pull-args args] [--podman-push-args args]
                      [--podman-build-args args] [--podman-inspect-args args] [--podman-run-args args] [--podman-start-args args]
                      [--podman-stop-args args] [--podman-rm-args args] [--podman-volume-args args] [--no-ansi] [--no-cleanup] [--dry-run]
                      [--parallel PARALLEL] [--verbose]
                      {help,version,wait,systemd,pull,push,build,up,down,ps,run,exec,start,stop,restart,logs,config,port,pause,unpause,kill,stats,images}
                      ...
podman-compose: error: unrecognized arguments: --replace
[root@nodehub _sources]# COMPOSE_PROJECT_NAME=sources podman-compose  -f docker-compose.yml up -d
3d6a6e3bd42b53a6c2157c93f6f6926de6e49df5927d0f93791b37877eca4f96
tools_redis_1
5f299c3f886ddd0042778fe813ff954787e4f4fd168125f1b0431285579c59de
tools_postgres_1
cc686b3929d4f885bd4d00427fe21cbee9fbd881a91f47a1fc44abdab62d5f5f
tools_awx_1
796b8eba88e4dbe457edf88d8a9f7989d064a340518103341d4319b9f0094a08
tools_receptor_hop
8d44e01e3d6b4cc36e2a7d3717f58c222e0567420146f0beca921859b1e21959
tools_receptor_1
a2d475d41f2fa541e319826da372888d4af0c8e6b93fde2f0d852980c62be9bf
tools_receptor_2
[root@nodehub _sources]# podman logs tools_awx_1
[ -d "/awx_devel/awx.egg-info" ] || python3.9 /awx_devel/tools/scripts/egg_info_dev
cp -f /tmp/awx.egg-link /var/lib/awx/venv/awx/lib/python3.9/site-packages/awx.egg-link
mkdir -p /var/lib/awx/; \
if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
python3.9 -c "import awx; print(awx.__version__)" > /var/lib/awx/.awx_version; \

if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
awx-manage migrate --noinput
Operations to perform:
  Apply all migrations: auth, conf, contenttypes, main, oauth2_provider, sessions, sites, social_django, sso, taggit
Running migrations:
  No migrations to apply.
Admin password: CCWIdjRTMfbXuNgAslLJ
(changed: False)
[root@nodehub _sources]# podman logs tools_awx_1
[ -d "/awx_devel/awx.egg-info" ] || python3.9 /awx_devel/tools/scripts/egg_info_dev
cp -f /tmp/awx.egg-link /var/lib/awx/venv/awx/lib/python3.9/site-packages/awx.egg-link
mkdir -p /var/lib/awx/; \
if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
python3.9 -c "import awx; print(awx.__version__)" > /var/lib/awx/.awx_version; \

if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
awx-manage migrate --noinput
Operations to perform:
  Apply all migrations: auth, conf, contenttypes, main, oauth2_provider, sessions, sites, social_django, sso, taggit
Running migrations:
  No migrations to apply.
Admin password: CCWIdjRTMfbXuNgAslLJ
(changed: False)
(changed: False)
[root@nodehub _sources]# podman logs tools_awx_1
[ -d "/awx_devel/awx.egg-info" ] || python3.9 /awx_devel/tools/scripts/egg_info_dev
cp -f /tmp/awx.egg-link /var/lib/awx/venv/awx/lib/python3.9/site-packages/awx.egg-link
mkdir -p /var/lib/awx/; \
if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
python3.9 -c "import awx; print(awx.__version__)" > /var/lib/awx/.awx_version; \

if [ "/var/lib/awx/venv" ]; then \
        . /var/lib/awx/venv/awx/bin/activate; \
fi; \
awx-manage migrate --noinput
Operations to perform:
  Apply all migrations: auth, conf, contenttypes, main, oauth2_provider, sessions, sites, social_django, sso, taggit
Running migrations:
  No migrations to apply.
Admin password: CCWIdjRTMfbXuNgAslLJ
(changed: False)
(changed: False)
Instance already registered awx_1
Instance Group already registered controlplane
Instance Group already registered default
Instance already registered receptor-hop
0 new peer links added to the database.
Instance already registered receptor-1
0 new peer links added to the database.
Instance already registered receptor-2
0 new peer links added to the database.
/usr/local/lib/python3.9/site-packages/supervisor/options.py:474: UserWarning: Supervisord is running as root and it is searching for its configuration file in default locations (including its current working directory); you probably want to specify a "-c" argument specifying an absolute path to a configuration file for improved security.
  self.warnings.warn(
2025-06-12 07:19:57,188 CRIT Supervisor is running as root.  Privileges were not dropped because no user is specified in the config file.  If you intend to run as root, you can set user=root in the config file to avoid this message.
2025-06-12 07:19:57,191 INFO RPC interface 'supervisor' initialized
2025-06-12 07:19:57,191 CRIT Server 'unix_http_server' running without any HTTP authentication checking
2025-06-12 07:19:57,192 INFO supervisord started with pid 311
2025-06-12 07:19:58,199 INFO spawned: 'stdout' with pid 312
2025-06-12 07:19:58,201 INFO spawned: 'superwatcher' with pid 313
2025-06-12 07:19:58,203 INFO spawned: 'awx-dispatcher' with pid 314
2025-06-12 07:19:58,205 INFO spawned: 'awx-receiver' with pid 315
2025-06-12 07:19:58,206 INFO spawned: 'awx-uwsgi' with pid 316
2025-06-12 07:19:58,208 INFO spawned: 'awx-daphne' with pid 317
2025-06-12 07:19:58,210 INFO spawned: 'awx-nginx' with pid 318
2025-06-12 07:19:58,212 INFO spawned: 'awx-wsbroadcast' with pid 319
2025-06-12 07:19:58,215 INFO spawned: 'awx-rsyslogd' with pid 321
2025-06-12 07:19:58,217 INFO spawned: 'awx-autoreload' with pid 322
2025-06-12 07:19:58,219 INFO spawned: 'awx-receptor' with pid 323
READY
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
make[1]: Entering directory '/awx_devel'
INFO 2025/06/12 07:19:58 Running control service control {"node_id":"awx_1"}
INFO 2025/06/12 07:19:58 Initialization complete
2025-06-12 07:19:59,607 INFO success: stdout entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 07:19:59,608 INFO success: superwatcher entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 07:19:59,608 INFO success: awx-dispatcher entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 07:19:59,609 INFO success: awx-receiver entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 07:19:59,609 INFO success: awx-uwsgi entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 07:19:59,609 INFO success: awx-daphne entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 07:19:59,609 INFO success: awx-nginx entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 07:19:59,609 INFO success: awx-wsbroadcast entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 07:19:59,610 INFO success: awx-rsyslogd entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 07:19:59,610 INFO success: awx-autoreload entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2025-06-12 07:19:59,610 INFO success: awx-receptor entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
awx-autoreload stdout | make[1]: Entering directory '/awx_devel'
awx-autoreload stdout |
nginx -g "daemon off;"
2025-06-12 07:20:04,264 INFO     [-] daphne.cli Starting server at tcp:port=8051:interface=127.0.0.1
2025-06-12 07:20:04,264 INFO     Starting server at tcp:port=8051:interface=127.0.0.1
2025-06-12 07:20:04,267 INFO     [-] daphne.server HTTP/2 support not enabled (install the http2 and tls Twisted extras)
2025-06-12 07:20:04,267 INFO     HTTP/2 support not enabled (install the http2 and tls Twisted extras)
2025-06-12 07:20:04,267 INFO     [-] daphne.server Configuring endpoint tcp:port=8051:interface=127.0.0.1
2025-06-12 07:20:04,267 INFO     Configuring endpoint tcp:port=8051:interface=127.0.0.1
2025-06-12 07:20:04,268 INFO     [-] daphne.server Listening on TCP address 127.0.0.1:8051
2025-06-12 07:20:04,268 INFO     Listening on TCP address 127.0.0.1:8051
*** Starting uWSGI 2.0.18 (64bit) on [Thu Jun 12 07:20:04 2025] ***
compiled with version: 11.5.0 20240719 (Red Hat 11.5.0-5) on 09 June 2025 00:48:49
os: Linux-5.14.0-503.21.1.el9_5.x86_64 #1 SMP PREEMPT_DYNAMIC Thu Dec 19 09:37:00 EST 2024
nodename: awx_1
machine: x86_64
clock source: unix
detected number of CPU cores: 4
current working directory: /awx_devel
detected binary path: /var/lib/awx/venv/awx/bin/uwsgi
!!! no internal routing support, rebuild with pcre support !!!
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
chdir() to /awx_devel/
your processes number limit is 1048576
your memory page size is 4096 bytes
 *** WARNING: you have enabled harakiri without post buffering. Slow upload could be rejected on post-unbuffered webservers ***
detected max file descriptor number: 1048576
lock engine: pthread robust mutexes
thunder lock: disabled (you can enable it with --thunder-lock)
uwsgi socket 0 bound to TCP address 127.0.0.1:8050 fd 3
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
Python version: 3.9.21 (main, Feb 10 2025, 00:00:00)  [GCC 11.5.0 20240719 (Red Hat 11.5.0-5)]
PEP 405 virtualenv detected: /var/lib/awx/venv/awx
Set PythonHome to /var/lib/awx/venv/awx
*** Python threads support is disabled. You can enable it with --enable-threads ***
Python main interpreter initialized at 0x596b70
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
your server socket listen backlog is limited to 100 connections
your mercy for graceful operations on workers is 60 seconds
mapped 609552 bytes (595 KB) for 5 cores
*** Operational MODE: preforking ***
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
*** uWSGI is running in multiple interpreter mode ***
spawned uWSGI master process (pid: 751)
spawned uWSGI worker 1 (pid: 752, cores: 1)
spawned uWSGI worker 2 (pid: 753, cores: 1)
spawned uWSGI worker 3 (pid: 754, cores: 1)
spawned uWSGI worker 4 (pid: 755, cores: 1)
spawned uWSGI worker 5 (pid: 756, cores: 1)
*** Stats server enabled on /tmp/stats.socket fd: 17 ***
2025-06-12 07:20:05,807 WARNING  [-] awx.main.dispatch.periodic periodic beat started
2025-06-12 07:20:05,819 INFO     [-] awx.main.dispatch Running worker dispatcher listening to queues ['tower_broadcast_all', 'awx_1']
2025-06-12 07:20:05,935 WARNING  [-] awx.main.tasks.system Heartbeat skew - interval=119.4775, expected=60
2025-06-12 07:20:05,999 INFO     [-] awx.main.wsbroadcast Active instance with hostname awx_1 is registered.
2025-06-12 07:20:06,207 INFO waiting for awx-rsyslogd to stop
2025-06-12 07:20:06,209 INFO stopped: awx-rsyslogd (exit status 0)
2025-06-12 07:20:06,213 INFO spawned: 'awx-rsyslogd' with pid 768
2025-06-12 07:20:07,215 INFO success: awx-rsyslogd entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x596b70 pid: 756 (default app)
WSGI app 0 (mountpoint='') ready in 3 seconds on interpreter 0x596b70 pid: 752 (default app)
WSGI app 0 (mountpoint='') ready in 4 seconds on interpreter 0x596b70 pid: 754 (default app)
WSGI app 0 (mountpoint='') ready in 4 seconds on interpreter 0x596b70 pid: 755 (default app)
WSGI app 0 (mountpoint='') ready in 4 seconds on interpreter 0x596b70 pid: 753 (default app)
INFO 2025/06/12 07:20:11 Connection established with receptor-hop {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:20:11 Known Connections: {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:20:11    awx_1: receptor-hop(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:20:11    receptor-hop: awx_1(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:20:11 Routing Table: {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:20:11    receptor-hop via receptor-hop {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:20:11 Known Connections: {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:20:11    awx_1: receptor-hop(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:20:11    receptor-hop: awx_1(1.00) receptor-1(1.00) receptor-2(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:20:11 Routing Table: {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:20:11    receptor-hop via receptor-hop {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:20:11 Known Connections: {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:20:11    awx_1: receptor-hop(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:20:11    receptor-hop: awx_1(1.00) receptor-1(1.00) receptor-2(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:20:11    receptor-1: receptor-hop(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:20:11    receptor-2: receptor-hop(1.00)  {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:20:11 Routing Table: {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:20:11    receptor-hop via receptor-hop {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:20:11    receptor-1 via receptor-hop {"node_id":"awx_1","remote_id":"receptor-hop"}
INFO 2025/06/12 07:20:11    receptor-2 via receptor-hop {"node_id":"awx_1","remote_id":"receptor-hop"}
2025-06-12 07:21:05,980 WARNING  [e0312f03] awx.main.tasks.system Hop node receptor-hop, has rejoined the receptor mesh
2025-06-12 07:21:05,996 WARNING  [e0312f03] awx.main.tasks.system Execution node attempting to rejoin as instance receptor-1.
2025-06-12 07:21:06,004 WARNING  [e0312f03] awx.main.tasks.system Execution node attempting to rejoin as instance receptor-2.
WARNING 2025/06/12 07:21:08 Could not read in control service: read unix /var/run/awx-receptor/receptor.sock->@: use of closed network connection {"node_id":"awx_1","remote_id":"receptor-hop"}
WARNING 2025/06/12 07:21:08 Could not close connection: close unix /var/run/awx-receptor/receptor.sock->@: use of closed network connection {"node_id":"awx_1","remote_id":"receptor-hop"}
2025-06-12 07:21:08,361 WARNING  [e0312f03] awx.main.models.ha Self-reported uuid of receptor-1 changed from 1e5dc438-f691-4be7-8879-598c92878a59 to cdf3138c-f179-4e15-85e3-c3f2d9afe998
2025-06-12 07:21:08,366 INFO     [e0312f03] awx.main.tasks.system Set capacity of execution node receptor-1 to 59.00, worker info data:
{
  "errors": [],
  "transmit_timing": 0.03586125373840332,
  "run_timing": 1.0077095031738281,
  "cpu_count": 4,
  "mem_in_bytes": 8382476288,
  "runner_version": "2.4.1.dev27+g69227d2",
  "uuid": "cdf3138c-f179-4e15-85e3-c3f2d9afe998"
}
WARNING 2025/06/12 07:21:08 Could not read in control service: read unix /var/run/awx-receptor/receptor.sock->@: use of closed network connection {"node_id":"awx_1","remote_id":"receptor-hop"}
WARNING 2025/06/12 07:21:08 Could not close connection: close unix /var/run/awx-receptor/receptor.sock->@: use of closed network connection {"node_id":"awx_1","remote_id":"receptor-hop"}
2025-06-12 07:21:08,627 WARNING  [e0312f03] awx.main.models.ha Self-reported uuid of receptor-2 changed from ffba93dc-22ee-44bd-8ba6-5b2ec6092a94 to fdc82d4d-9772-4a57-9aec-0fefeef2bbef
2025-06-12 07:21:08,632 INFO     [e0312f03] awx.main.tasks.system Set capacity of execution node receptor-2 to 59.00, worker info data:
{
  "errors": [],
  "transmit_timing": 0.04525876045227051,
  "run_timing": 1.006688117980957,
  "cpu_count": 4,
  "mem_in_bytes": 8382476288,
  "runner_version": "2.4.1.dev27+g69227d2",
  "uuid": "fdc82d4d-9772-4a57-9aec-0fefeef2bbef"
}
[root@nodehub _sources]#
