#!/bin/bash
# OneDrive 同步脚本
# 用途：定期将Wiki快照同步到OneDrive供手机阅读

ONEDRIVE_ROOT="/mnt/c/Users/fanlf/OneDrive"
WIKI_SRC="/mnt/c/code/wiki"
WIKI_DEST="$ONEDRIVE_ROOT/wiki-readonly"
LOCK_FILE="/tmp/wiki-sync.lock"

# 检查锁文件（防止重复运行）
if [ -f "$LOCK_FILE" ]; then
    echo "同步正在进行中，跳过本次执行"
    exit 0
fi

touch "$LOCK_FILE"

echo "=== Wiki OneDrive 同步开始 $(date) ==="

# 创建目标目录
if [ ! -d "$WIKI_DEST" ]; then
    echo "创建目标目录：$WIKI_DEST"
    mkdir -p "$WIKI_DEST"
fi

# 使用rsync同步（更高效，只传输变化的文件）
echo "正在同步文件..."
rsync -av --delete \
  --exclude='.git/' \
  --exclude='.obsidian/workspace.json' \
  --exclude='node_modules/' \
  --exclude='*.tmp' \
  --exclude='.DS_Store' \
  --exclude='*.swp' \
  "$WIKI_SRC/" "$WIKI_DEST/"

# 同步完成提示
echo "✅ 同步完成"
echo "文件已复制到：$WIKI_DEST"
echo "手机可通过OneDrive访问"

# 清理锁文件
rm -f "$LOCK_FILE"

echo "=== 同步结束 $(date) ==="
