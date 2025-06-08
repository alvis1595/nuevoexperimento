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




------------------------------------------------------------------------------
  13  git clone -b https://github.com/ansible/awx.git
   14  git clone -b 24.6.1https://github.com/ansible/awx.git
   15  git clone -b 24.6.1 https://github.com/ansible/awx.git
   16  ls
   17  cd awx/
   18  uname -r
   19  dnf install npm
   20  dnf install podman-compose
   21  python --version
   22  pip --version
   23  sudo subscription-manager repos --enable=rhel-9-appstream-rpms
   24  dnf install podman-compose
   25  python -m ensurepip --upgrade
   26* pi --version
   27  python --version
   28  python -m pip install podman-compose
   29  podman-compose --version
   30  pipewirednf install podman podman-docker
   31  dnf install podman podman-docker
   32  docker ps -a
   33  dnf install podma-compose
   34  dnf install podman-compose
   35  dnf install -y python3-pip
   36  pip3 install podman-compose
   37  podman-compose --version
   38  find /usr -name podman-compose
   39  echo 'export PATH=$PATH:/usr/local/bin' > /etc/profile.d/podman.sh
   40  chmod +x /etc/profile.d/podman.sh
   41  source /etc/profile.d/podman.sh
   42  podman-compose --version
   43  lsd
   44  ls
   45  dnf install make openssl
   46  history

---------------------------------------------------------------------------
docker compose modificacion make:

[root@container awx]# grep -n "docker-compose -f tools/docker-compose/_sources/docker-compose.yml" Makefile
483:    docker-compose -f tools/docker-compose/_sources/docker-compose.yml $(COMPOSE_OPTS) up $(COMPOSE_UP_OPTS) --remove-orphans
487:    docker-compose -f tools/docker-compose/_sources/docker-compose.yml -f tools/docker-credential-plugins-override.yml up --no-recreate awx_1 --remove-orphans
490:    docker-compose -f tools/docker-compose/_sources/docker-compose.yml run --rm --service-ports awx_1 /bin/bash
493:    docker-compose -f tools/docker-compose/_sources/docker-compose.yml run --rm --service-ports awx_1 /start_tests.sh
496:    docker-compose -f tools/docker-compose/_sources/docker-compose.yml run --rm --service-ports --no-deps awx_1 /start_tests.sh swagger
505:    docker-compose -f tools/docker-compose/_sources/docker-compose.yml rm -sf
532:    docker-compose -f tools/docker-compose/_sources/docker-compose.yml -f tools/elastic/docker-compose.logstash-link.yml -f tools/elastic/docker-compose.elastic-override.yml up --no-recreate
535:    docker-compose -f tools/docker-compose/_sources/docker-compose.yml -f tools/elastic/docker-compose.logstash-link-cluster.yml -f tools/elastic/docker-compose.elastic-override.yml up --no-recreate
[root@container awx]# vim Makefile



---------------------------------------------GUI
[root@container awx]# sdocker exec tools_awx_1 make clean-ui ui-devel
bash: sdocker: command not found
[root@container awx]# docker exec tools_awx_1 make clean-ui ui-devel
rm -rf node_modules
rm -rf awx/ui/node_modules
rm -rf awx/ui/build
rm -rf awx/ui/src/locales/_build
rm -rf awx/ui/.ui-built
NODE_OPTIONS=--max-old-space-size=6144 npm --prefix awx/ui --loglevel warn ci
npm WARN deprecated source-map-url@0.4.1: See https://github.com/lydell/source-map-url#deprecated
npm WARN deprecated source-map-resolve@0.6.0: See https://github.com/lydell/source-map-resolve#deprecated

added 1875 packages, and audited 1876 packages in 1m

121 packages are looking for funding
  run `npm fund` for details

56 vulnerabilities (5 low, 14 moderate, 33 high, 4 critical)

To address issues that do not require attention, run:
  npm audit fix

To address all issues possible (including breaking changes), run:
  npm audit fix --force

Some issues need review, and may require choosing
a different dependency.

Run `npm audit` for details.
npm notice
npm notice New major version of npm available! 8.5.0 -> 11.4.1
npm notice Changelog: <https://github.com/npm/cli/releases/tag/v11.4.1>
npm notice Run `npm install -g npm@11.4.1` to update!
npm notice
make[1]: Entering directory '/awx_devel'
make awx/ui/node_modules
make[2]: Entering directory '/awx_devel'
NODE_OPTIONS=--max-old-space-size=6144 npm --prefix awx/ui --loglevel warn ci
npm WARN deprecated source-map-url@0.4.1: See https://github.com/lydell/source-map-url#deprecated
npm WARN deprecated source-map-resolve@0.6.0: See https://github.com/lydell/source-map-resolve#deprecated

added 1875 packages, and audited 1876 packages in 38s

121 packages are looking for funding
  run `npm fund` for details

56 vulnerabilities (5 low, 14 moderate, 33 high, 4 critical)

To address issues that do not require attention, run:
  npm audit fix

To address all issues possible (including breaking changes), run:
  npm audit fix --force

Some issues need review, and may require choosing
a different dependency.

Run `npm audit` for details.
make[2]: Leaving directory '/awx_devel'
python3.9 tools/scripts/compilemessages.py
processing file django.po in /awx_devel/awx/locale/en-us/LC_MESSAGES

processing file django.po in /awx_devel/awx/locale/es/LC_MESSAGES

processing file django.po in /awx_devel/awx/locale/fr/LC_MESSAGES

processing file django.po in /awx_devel/awx/locale/ja/LC_MESSAGES

processing file django.po in /awx_devel/awx/locale/ko/LC_MESSAGES

processing file django.po in /awx_devel/awx/locale/nl/LC_MESSAGES

processing file django.po in /awx_devel/awx/locale/zh/LC_MESSAGES

npm --prefix awx/ui --loglevel warn run compile-strings

> compile-strings
> lingui compile

Compiling message catalogs…
Done!
npm --prefix awx/ui --loglevel warn run build

> build
> INLINE_RUNTIME_CHUNK=false react-scripts build

Creating an optimized production build...
Browserslist: caniuse-lite is outdated. Please run:
  npx browserslist@latest --update-db
  Why you should do it regularly: https://github.com/browserslist/browserslist#browsers-data-updating
Browserslist: caniuse-lite is outdated. Please run:
  npx browserslist@latest --update-db
  Why you should do it regularly: https://github.com/browserslist/browserslist#browsers-data-updating
Compiled with warnings.

Failed to parse source map from '/awx_devel/awx/ui/node_modules/rrule/src/cache.ts' file: Error: ENOENT: no such file or directory, open '/awx_devel/awx/ui/node_modules/rrule/src/cache.ts'

Failed to parse source map from '/awx_devel/awx/ui/node_modules/rrule/src/callbackiterresult.ts' file: Error: ENOENT: no such file or directory, open '/awx_devel/awx/ui/node_modules/rrule/src/callbackiterresult.ts'

Failed to parse source map from '/awx_devel/awx/ui/node_modules/rrule/src/datetime.ts' file: Error: ENOENT: no such file or directory, open '/awx_devel/awx/ui/node_modules/rrule/src/datetime.ts'

Failed to parse source map from '/awx_devel/awx/ui/node_modules/rrule/src/dateutil.ts' file: Error: ENOENT: no such file or directory, open '/awx_devel/awx/ui/node_modules/rrule/src/dateutil.ts'

Failed to parse source map from '/awx_devel/awx/ui/node_modules/rrule/src/datewithzone.ts' file: Error: ENOENT: no such file or directory, open '/awx_devel/awx/ui/node_modules/rrule/src/datewithzone.ts'

Failed to parse source map from '/awx_devel/awx/ui/node_modules/rrule/src/helpers.ts' file: Error: ENOENT: no such file or directory, open '/awx_devel/awx/ui/node_modules/rrule/src/helpers.ts'

Failed to parse source map from '/awx_devel/awx/ui/node_modules/rrule/src/index.ts' file: Error: ENOENT: no such file or directory, open '/awx_devel/awx/ui/node_modules/rrule/src/index.ts'

Failed to parse source map from '/awx_devel/awx/ui/node_modules/rrule/src/iter/index.ts' file: Error: ENOENT: no such file or directory, open '/awx_devel/awx/ui/node_modules/rrule/src/iter/index.ts'

Failed to parse source map from '/awx_devel/awx/ui/node_modules/rrule/src/iter/poslist.ts' file: Error: ENOENT: no such file or directory, open '/awx_devel/awx/ui/node_modules/rrule/src/iter/poslist.ts'

Failed to parse source map from '/awx_devel/awx/ui/node_modules/rrule/src/iterinfo/easter.ts' file: Error: ENOENT: no such file or directory, open '/awx_devel/awx/ui/node_modules/rrule/src/iterinfo/easter.ts'

Failed to parse source map from '/awx_devel/awx/ui/node_modules/rrule/src/iterinfo/index.ts' file: Error: ENOENT: no such file or directory, open '/awx_devel/awx/ui/node_modules/rrule/src/iterinfo/index.ts'

Failed to parse source map from '/awx_devel/awx/ui/node_modules/rrule/src/iterinfo/monthinfo.ts' file: Error: ENOENT: no such file or directory, open '/awx_devel/awx/ui/node_modules/rrule/src/iterinfo/monthinfo.ts'

Failed to parse source map from '/awx_devel/awx/ui/node_modules/rrule/src/iterinfo/yearinfo.ts' file: Error: ENOENT: no such file or directory, open '/awx_devel/awx/ui/node_modules/rrule/src/iterinfo/yearinfo.ts'

Failed to parse source map from '/awx_devel/awx/ui/node_modules/rrule/src/iterresult.ts' file: Error: ENOENT: no such file or directory, open '/awx_devel/awx/ui/node_modules/rrule/src/iterresult.ts'

Failed to parse source map from '/awx_devel/awx/ui/node_modules/rrule/src/iterset.ts' file: Error: ENOENT: no such file or directory, open '/awx_devel/awx/ui/node_modules/rrule/src/iterset.ts'

Failed to parse source map from '/awx_devel/awx/ui/node_modules/rrule/src/masks.ts' file: Error: ENOENT: no such file or directory, open '/awx_devel/awx/ui/node_modules/rrule/src/masks.ts'

Failed to parse source map from '/awx_devel/awx/ui/node_modules/rrule/src/nlp/index.ts' file: Error: ENOENT: no such file or directory, open '/awx_devel/awx/ui/node_modules/rrule/src/nlp/index.ts'

Failed to parse source map from '/awx_devel/awx/ui/node_modules/rrule/src/nlp/i18n.ts' file: Error: ENOENT: no such file or directory, open '/awx_devel/awx/ui/node_modules/rrule/src/nlp/i18n.ts'

Failed to parse source map from '/awx_devel/awx/ui/node_modules/rrule/src/nlp/parsetext.ts' file: Error: ENOENT: no such file or directory, open '/awx_devel/awx/ui/node_modules/rrule/src/nlp/parsetext.ts'

Failed to parse source map from '/awx_devel/awx/ui/node_modules/rrule/src/nlp/totext.ts' file: Error: ENOENT: no such file or directory, open '/awx_devel/awx/ui/node_modules/rrule/src/nlp/totext.ts'

Failed to parse source map from '/awx_devel/awx/ui/node_modules/rrule/src/optionstostring.ts' file: Error: ENOENT: no such file or directory, open '/awx_devel/awx/ui/node_modules/rrule/src/optionstostring.ts'

Failed to parse source map from '/awx_devel/awx/ui/node_modules/rrule/src/parseoptions.ts' file: Error: ENOENT: no such file or directory, open '/awx_devel/awx/ui/node_modules/rrule/src/parseoptions.ts'

Failed to parse source map from '/awx_devel/awx/ui/node_modules/rrule/src/parsestring.ts' file: Error: ENOENT: no such file or directory, open '/awx_devel/awx/ui/node_modules/rrule/src/parsestring.ts'

Failed to parse source map from '/awx_devel/awx/ui/node_modules/rrule/src/rrule.ts' file: Error: ENOENT: no such file or directory, open '/awx_devel/awx/ui/node_modules/rrule/src/rrule.ts'

Failed to parse source map from '/awx_devel/awx/ui/node_modules/rrule/src/rruleset.ts' file: Error: ENOENT: no such file or directory, open '/awx_devel/awx/ui/node_modules/rrule/src/rruleset.ts'

Failed to parse source map from '/awx_devel/awx/ui/node_modules/rrule/src/rrulestr.ts' file: Error: ENOENT: no such file or directory, open '/awx_devel/awx/ui/node_modules/rrule/src/rrulestr.ts'

Failed to parse source map from '/awx_devel/awx/ui/node_modules/rrule/src/types.ts' file: Error: ENOENT: no such file or directory, open '/awx_devel/awx/ui/node_modules/rrule/src/types.ts'

Failed to parse source map from '/awx_devel/awx/ui/node_modules/rrule/src/weekday.ts' file: Error: ENOENT: no such file or directory, open '/awx_devel/awx/ui/node_modules/rrule/src/weekday.ts'

Search for the keywords to learn more about each warning.
To ignore, add // eslint-disable-next-line to the line before.

File sizes after gzip:

  881.98 kB  build/static/js/main.916de21c.js
  57.62 kB   build/static/js/6489.2da240fd.chunk.js
  48.36 kB   build/static/js/8118.a00d1061.chunk.js
  45.45 kB   build/static/js/6138.6192eeac.chunk.js
  44.07 kB   build/static/js/896.291aa6dd.chunk.js
  43.17 kB   build/static/js/2787.2704c0dc.chunk.js
  41.69 kB   build/static/js/8011.8dc134dc.chunk.js
  40.85 kB   build/static/js/2418.77ffc4cc.chunk.js
  28.61 kB   build/static/js/8311.f2a53adb.chunk.js
  7.17 kB    build/static/css/main.543ff474.css
  5.73 kB    build/static/css/94.bb3255d7.chunk.css
  5.56 kB    build/static/css/7433.2ddd7b8f.chunk.css
  4.68 kB    build/static/css/1235.e121beca.chunk.css
  3.92 kB    build/static/css/3144.f0258c3b.chunk.css
  3.87 kB    build/static/css/9992.e227afb4.chunk.css
  3.82 kB    build/static/css/3805.57dfbe02.chunk.css
  3.73 kB    build/static/css/577.a7911fdb.chunk.css
  3.73 kB    build/static/css/9170.50908477.chunk.css
  3.67 kB    build/static/css/7219.08b5cbc9.chunk.css
  3.64 kB    build/static/css/5206.c447f743.chunk.css
  3.46 kB    build/static/css/5060.adfc4999.chunk.css
  3.43 kB    build/static/css/8880.d30a89c1.chunk.css
  3.11 kB    build/static/css/7501.68c5a944.chunk.css
  3.01 kB    build/static/css/7796.fdde627c.chunk.css
  2.84 kB    build/static/css/7707.26c2b80d.chunk.css
  2.78 kB    build/static/css/5774.c45b5562.chunk.css
  2.72 kB    build/static/css/5294.f9cb5538.chunk.css
  2.29 kB    build/static/css/1177.5c08c8af.chunk.css
  2.19 kB    build/static/css/5660.a40c4a40.chunk.css
  1.95 kB    build/static/css/234.b059ec85.chunk.css
  1.86 kB    build/static/css/8237.0de0fc50.chunk.css
  1.85 kB    build/static/css/2870.44a02c6e.chunk.css
  1.79 kB    build/static/css/7263.d198c353.chunk.css
  1.72 kB    build/static/css/4851.7165dac3.chunk.css
  1.67 kB    build/static/css/6395.5989a96b.chunk.css
  1.56 kB    build/static/css/436.47e3e0b8.chunk.css
  1.44 kB    build/static/css/1382.3462f7bb.chunk.css
  1.43 kB    build/static/css/1978.f6dc1d3c.chunk.css
  1.37 kB    build/static/css/8797.7462f2dd.chunk.css
  1.37 kB    build/static/css/377.5907ec84.chunk.css
  1.2 kB     build/static/css/3793.1305608b.chunk.css
  1.14 kB    build/static/css/437.6d707dbc.chunk.css
  1.14 kB    build/static/css/1189.35d31268.chunk.css
  1.07 kB    build/static/css/3883.17cce8d7.chunk.css
  993 B      build/static/css/2932.a1258743.chunk.css
  991 B      build/static/css/2218.191329c8.chunk.css
  966 B      build/static/css/6976.021eff20.chunk.css
  952 B      build/static/css/8680.d04ca9d3.chunk.css
  922 B      build/static/css/4627.1be7086f.chunk.css
  892 B      build/static/css/1567.4f3d629d.chunk.css
  854 B      build/static/css/310.16f255c3.chunk.css
  839 B      build/static/css/8074.7dfa07cc.chunk.css
  785 B      build/static/css/9548.46973e4e.chunk.css
  755 B      build/static/css/5991.f30feda0.chunk.css
  654 B      build/static/css/9704.61534d44.chunk.css
  652 B      build/static/css/974.160fa5f7.chunk.css
  619 B      build/static/css/783.64eb7fd5.chunk.css
  616 B      build/static/css/1409.652d331c.chunk.css
  592 B      build/static/css/7838.5482409c.chunk.css
  557 B      build/static/css/9730.348dfcad.chunk.css
  554 B      build/static/css/1876.f830eaf0.chunk.css
  550 B      build/static/css/8117.6bc02540.chunk.css
  535 B      build/static/css/2258.fae2888b.chunk.css
  531 B      build/static/css/7068.f8f5badb.chunk.css
  437 B      build/static/css/4114.60344c30.chunk.css
  421 B      build/static/css/3055.e23eb83e.chunk.css
  413 B      build/static/css/9152.fa1fcf56.chunk.css
  388 B      build/static/js/3979.c41de5f3.chunk.js
  367 B      build/static/css/9954.c23a3c7f.chunk.css
  337 B      build/static/css/8035.9e711889.chunk.css
  334 B      build/static/css/8098.3d7bc12f.chunk.css
  245 B      build/static/css/8350.0f6068ad.chunk.css
  215 B      build/static/css/3846.374c7a8f.chunk.css
  174 B      build/static/css/8689.a2e27d25.chunk.css
  161 B      build/static/js/5774.98a1846b.chunk.js
  161 B      build/static/js/8680.298ffe9c.chunk.js
  160 B      build/static/js/1189.9fe9a87c.chunk.js
  160 B      build/static/js/1978.5d8e5330.chunk.js
  160 B      build/static/js/2870.80b1594f.chunk.js
  160 B      build/static/js/2932.ed40650a.chunk.js
  160 B      build/static/js/6976.8303ad1a.chunk.js
  160 B      build/static/js/7219.6ce983f0.chunk.js
  160 B      build/static/js/8797.3454301f.chunk.js
  160 B      build/static/js/234.fe4189e6.chunk.js
  159 B      build/static/js/1177.a3fb9052.chunk.js
  159 B      build/static/js/1409.da057695.chunk.js
  159 B      build/static/js/1567.ea69a3d6.chunk.js
  159 B      build/static/js/1876.96395c8b.chunk.js
  159 B      build/static/js/2218.09dade07.chunk.js
  159 B      build/static/js/2258.1f1a3887.chunk.js
  159 B      build/static/js/3055.4876c15e.chunk.js
  159 B      build/static/js/3793.88dc0e17.chunk.js
  159 B      build/static/js/3846.292dcdd4.chunk.js
  159 B      build/static/js/3883.1e02530e.chunk.js
  159 B      build/static/js/4114.680fd6fb.chunk.js
  159 B      build/static/js/4527.e69234b4.chunk.js
  159 B      build/static/js/4627.0a0d8782.chunk.js
  159 B      build/static/js/4851.6c4d4f76.chunk.js
  159 B      build/static/js/5060.323302fa.chunk.js
  159 B      build/static/js/5206.01919070.chunk.js
  159 B      build/static/js/5294.20de7455.chunk.js
  159 B      build/static/js/5660.2a7014ec.chunk.js
  159 B      build/static/js/5991.677fa8a4.chunk.js
  159 B      build/static/js/6395.265f8c3f.chunk.js
  159 B      build/static/js/7068.83eec819.chunk.js
  159 B      build/static/js/7263.e14cb8ad.chunk.js
  159 B      build/static/js/7501.89f6400f.chunk.js
  159 B      build/static/js/7796.f02f2056.chunk.js
  159 B      build/static/js/7838.4ca20063.chunk.js
  159 B      build/static/js/8035.c6bbbb99.chunk.js
  159 B      build/static/js/8074.b9b7c3d2.chunk.js
  159 B      build/static/js/8117.a545f7a2.chunk.js
  159 B      build/static/js/8237.77f6dbae.chunk.js
  159 B      build/static/js/8350.852ff2cb.chunk.js
  159 B      build/static/js/8880.b3c655f3.chunk.js
  159 B      build/static/js/9152.e9f7af2b.chunk.js
  159 B      build/static/js/9170.e183ef22.chunk.js
  159 B      build/static/js/9548.d5b3880f.chunk.js
  159 B      build/static/js/9704.293dc4ea.chunk.js
  159 B      build/static/js/9730.b05134a9.chunk.js
  159 B      build/static/js/9954.c7ab5b64.chunk.js
  159 B      build/static/js/9992.5a7cbea0.chunk.js
  159 B      build/static/js/437.8700b91b.chunk.js
  159 B      build/static/js/543.338b0348.chunk.js
  158 B      build/static/js/1382.73bfce72.chunk.js
  158 B      build/static/js/3144.088e140e.chunk.js
  158 B      build/static/js/7707.719b9a22.chunk.js
  158 B      build/static/js/8098.169f7cac.chunk.js
  158 B      build/static/js/8841.ab9c1aaa.chunk.js
  158 B      build/static/js/377.0ee01df5.chunk.js
  158 B      build/static/js/436.8e586788.chunk.js
  158 B      build/static/js/530.38e92f2e.chunk.js
  158 B      build/static/js/577.b455caa0.chunk.js
  158 B      build/static/js/783.1de66bb2.chunk.js
  158 B      build/static/js/974.bb3fb1a5.chunk.js
  157 B      build/static/js/8689.6cecbaaf.chunk.js
  156 B      build/static/js/310.e0a3e3ac.chunk.js

The bundle size is significantly larger than recommended.
Consider reducing it with code splitting: https://goo.gl/9VhYWB
You can also analyze the project dependencies: https://goo.gl/LeUzfb

The project was built assuming it is hosted at ./.
You can control this with the homepage field in your package.json.

The build folder is ready to be deployed.

Find out more about deployment here:

  https://cra.link/deployment

mkdir -p awx/public/static/css
mkdir -p awx/public/static/js
mkdir -p awx/public/static/media
cp -r awx/ui/build/static/css/* awx/public/static/css
cp -r awx/ui/build/static/js/* awx/public/static/js
cp -r awx/ui/build/static/media/* awx/public/static/media
touch awx/ui/.ui-built
make[1]: Leaving directory '/awx_devel'
[root@container awx]# docker exec -ti tools_awx_1 awx-manage createsuperuser
Username (leave blank to use 'root'): admin
Error: That username is already taken.
Username (leave blank to use 'root'):
Email address:
Password:
Password (again):
Superuser created successfully.
[root@container awx]#
