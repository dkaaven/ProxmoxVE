#!/usr/bin/env bash
<<<<<<< HEAD
source <(curl -fsSL https://raw.githubusercontent.com/dkaaven/ProxmoxVE/main/misc/build.func)
=======
source <(curl -fsSL https://raw.githubusercontent.com/dkaaven/ProxmoxVE/main/misc/build.func)
>>>>>>> 6e1d1e421 (fixing)
# Copyright (c) 2021-2026 community-scripts ORG
# License: MIT | https://github.com/community-scripts/ProxmoxVE/raw/main/LICENSE

APP="MinIO"

header_info "$APP"
variables
color

msg_error "This script is no longer available in community-scripts."
msg_error "Repository is archived. Minio is gone"
msg_warn "More info: https://community-scripts.org/scripts/minio"
exit 1
