#!/usr/bin/env bash

SERVICE_FILE="xlockwatch.service"
SERVICE_DIR="$HOME/.config/systemd"
BIN_DIR="$HOME/.local/bin"

SRV_INST_CMD="$(mv "/tmp/$SERVICE_FILE" "$SERVICE_DIR/user/")"
BIN_INST_CMD="$(cp xlockwatch "$BIN_DIR/xlockwatch" &&
    chmod +x "$BIN_DIR/xlockwatch")"

if [[ -d $SERVICE_DIR ]]; then
    eval "${SRV_INST_CMD}"
    echo "Service file installed to $SERVICE_DIR/user/$SERVICE_FILE"
else
    mkdir -p "$SERVICE_DIR/user"
    echo "Created \"$SERVICE_DIR/user\" for user-defined services"
    eval "${SRV_INST_CMD}"
    echo "Service file installed to $SERVICE_DIR/user/$SERVICE_FILE"
fi

if [[ -d $BIN_DIR ]]; then
    eval "${BIN_INST_CMD}"
    echo "Executable script installed to $BIN_DIR/xlockwatch"
else
    mkdir -p "$BIN_DIR"
    echo "Created \"$BIN_DIR\" for user-defined executables"
    eval "${BIN_INST_CMD}"
    echo "Executable script installed to $BIN_DIR/xlockwatch"
fi

systemctl --user enable xlockwatch.service --now
