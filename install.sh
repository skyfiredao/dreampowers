#!/bin/bash
# Dreampowers 技能安装脚本
# 将 dp-* 技能目录通过软链接安装到 ~/.config/opencode/skills/
#
# 用法:
#   ./install.sh          安装默认技能（跳过 opt-in 技能）
#   ./install.sh --all    安装全部技能（含 opt-in）

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILLS_DIR="$SCRIPT_DIR/skills"
TARGET_DIR="$HOME/.config/opencode/skills"

# Opt-in 技能列表（默认不安装，需 --all 或手动 ln -s）
OPT_IN_SKILLS="dp-chapter-adult"

INSTALL_ALL=false
if [ "$1" = "--all" ]; then
    INSTALL_ALL=true
fi

is_opt_in() {
    local name="$1"
    for opt in $OPT_IN_SKILLS; do
        [ "$name" = "$opt" ] && return 0
    done
    return 1
}

# 确保目标目录存在
mkdir -p "$TARGET_DIR"

installed=0
skipped=0
opt_in_skipped=0

for dir in "$SKILLS_DIR"/dp-*; do
    [ -d "$dir" ] || continue
    name="$(basename "$dir")"
    target="$TARGET_DIR/$name"

    # 检查 opt-in 技能
    if is_opt_in "$name" && [ "$INSTALL_ALL" = false ]; then
        echo "  跳过  $name (opt-in 技能，使用 --all 安装)"
        opt_in_skipped=$((opt_in_skipped + 1))
        continue
    fi

    if [ -L "$target" ]; then
        # 已存在软链接，检查是否指向正确位置
        current="$(readlink "$target")"
        if [ "$current" = "$dir" ]; then
            echo "  跳过  $name (已安装)"
            skipped=$((skipped + 1))
            continue
        else
            echo "  更新  $name (旧链接 → $current)"
            rm "$target"
        fi
    elif [ -e "$target" ]; then
        echo "  警告  $name: 目标已存在且不是软链接，跳过"
        skipped=$((skipped + 1))
        continue
    fi

    ln -sf "$dir" "$target"
    echo "  安装  $name → $target"
    installed=$((installed + 1))
done

echo ""
echo "完成: 安装 $installed 个技能, 跳过 $skipped 个, opt-in 未装 $opt_in_skipped 个"
echo "技能目录: $TARGET_DIR"

if [ $opt_in_skipped -gt 0 ]; then
    echo ""
    echo "提示: 以下 opt-in 技能未安装，如需安装请使用 ./install.sh --all"
    for opt in $OPT_IN_SKILLS; do
        echo "  - $opt"
    done
fi
