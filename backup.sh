#!/bin/bash
backup_dir="$HOME/backup"
mkdir -p "$backup_dir"
tar -czf "$backup_dir/home_backup_$(date +%Y%m%d).tar.gz" "$HOME"
