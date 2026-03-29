#!/bin/bash
# Dreampowers 技能卸载脚本
# 移除 ~/.config/opencode/skills/ 下的 dp-* 软链接

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILLS_DIR="$SCRIPT_DIR/skills"
TARGET_DIR="$HOME/.config/opencode/skills"

removed=0
skipped=0

for dir in "$SKILLS_DIR"/dp-*; do
    [ -d "$dir" ] || continue
    name="$(basename "$dir")"
    target="$TARGET_DIR/$name"

    if [ -L "$target" ]; then
        rm "$target"
        echo "  移除  $name"
        removed=$((removed + 1))
    elif [ -e "$target" ]; then
        echo "  跳过  $name (不是软链接，不敢动)"
        skipped=$((skipped + 1))
    else
        echo "  跳过  $name (未安装)"
        skipped=$((skipped + 1))
    fi
done

echo ""
echo "完成: 移除 $removed 个技能, 跳过 $skipped 个"
