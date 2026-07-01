#!/usr/bin/env bash
<<<<<<< HEAD
source <(curl -fsSL https://raw.githubusercontent.com/dkaaven/ProxmoxVE/main/misc/build.func)
=======
source <(curl -fsSL https://raw.githubusercontent.com/dkaaven/ProxmoxVE/main/misc/build.func)
>>>>>>> 6e1d1e421 (fixing)
# Copyright (c) 2021-2026 tteck
# Author: tteck (tteckster) | Migration: MickLesk (CanbiZ)
# License: MIT | https://github.com/community-scripts/ProxmoxVE/raw/main/LICENSE
# Source: https://dockge.kuma.pet/

APP="Dockge"
var_tags="${var_tags:-docker}"
var_cpu="${var_cpu:-2}"
var_ram="${var_ram:-2048}"
var_disk="${var_disk:-18}"
var_os="${var_os:-debian}"
var_version="${var_version:-13}"
var_arm64="${var_arm64:-yes}"
var_unprivileged="${var_unprivileged:-1}"

header_info "$APP"
variables
color
catch_errors

<<<<<<< HEAD
ADDON_SCRIPT="https://raw.githubusercontent.com/dkaaven/ProxmoxVE/main/tools/addon/dockge.sh"
=======
ADDON_SCRIPT="https://raw.githubusercontent.com/dkaaven/ProxmoxVE/main/tools/addon/dockge.sh"
>>>>>>> 6e1d1e421 (fixing)

function update_script() {
  header_info
  check_container_storage
  check_container_resources

  if [[ ! -d /opt/dockge ]]; then
    msg_error "No ${APP} Installation Found!"
    exit
  fi

  msg_warn "⚠️  ${APP} has been migrated to an addon script."
  echo ""
  msg_info "This is a one-time migration. After this, you can update ${APP} anytime with:"
  echo -e "${TAB}${TAB}${GN}update_dockge${CL}  or  ${GN}bash <(curl -fsSL ${ADDON_SCRIPT})${CL}"
  echo ""
  read -r -p "${TAB}Migrate update function now? [y/N]: " CONFIRM
  if [[ ! "${CONFIRM,,}" =~ ^(y|yes)$ ]]; then
    msg_warn "Migration skipped. The old update will continue to work for now."
    msg_info "Updating ${APP} (legacy)"
    cd /opt/dockge
    $STD docker compose pull
    $STD docker compose up -d
    msg_ok "Updated ${APP}"
    exit
  fi

  msg_info "Migrating update function"
  TMP_UPDATE=$(mktemp)
  cat <<'MIGRATION_EOF' >"$TMP_UPDATE"
<<<<<<< HEAD
bash -c "$(curl -fsSL https://raw.githubusercontent.com/dkaaven/ProxmoxVE/main/tools/addon/dockge.sh)"
=======
bash -c "$(curl -fsSL https://raw.githubusercontent.com/dkaaven/ProxmoxVE/main/tools/addon/dockge.sh)"
>>>>>>> 6e1d1e421 (fixing)
MIGRATION_EOF
  mv "$TMP_UPDATE" /usr/bin/update
  chmod +x /usr/bin/update

  ln -sf /usr/bin/update /usr/bin/update_dockge 2>/dev/null || true
  msg_ok "Migration complete"

  msg_info "Running addon update"
  type=update bash <(curl -fsSL "${ADDON_SCRIPT}")
  exit
}

start
build_container
description

msg_ok "Completed successfully!\n"
echo -e "${CREATING}${GN}${APP} setup has been successfully initialized!${CL}"
echo -e "${INFO}${YW}Access it using the following URL:${CL}"
echo -e "${GATEWAY}${BGN}http://${IP}:5001${CL}"
