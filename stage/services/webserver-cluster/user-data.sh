#!/bin/bash

cat > index.html <<EOF
<h1>"Hello, world"</h1>
<p style="color: green">DB Address: ${db_address}</p>
<p style="color: green>DB Port: ${db_port}</p>
EOF

nohup busybox httpd -f -p ${server_port} &