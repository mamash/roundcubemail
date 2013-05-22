#!/bin/bash

this_dir=$(dirname $0)

for type in db main; do
  cp -p /opt/local/etc/roundcube/${type}.inc.php{,.bak}

  {
  cat ${this_dir}/../config/${type}.inc.php.dist
  cat <<EOF

include_once('${type}-local.inc.php');
?>
EOF
  } >/opt/local/etc/roundcube/${type}.inc.php.new

done
