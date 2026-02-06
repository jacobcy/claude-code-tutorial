#!/bin/bash
# Claude Code技能测试脚本

echo "🔍 检测Claude Code教程技能..."
echo

# 检查技能是否存在于技能目录
echo "📁 检查技能目录..."
if [ -d "$HOME/.claude/skills/claude-code-tutorial" ]; then
    echo "✅ claude-code-tutorial 技能目录存在"
    echo "📄 技能文件:"
    ls -la $HOME/.claude/skills/claude-code-tutorial/
else
    echo "❌ 技能目录不存在"
    exit 1
fi

echo

# 检查技能文件内容
echo "📋 检查技能定义..."
SKILL_FILE="$HOME/.claude/skills/claude-code-tutorial/SKILL.md"
if [ -f "$SKILL_FILE" ]; then
    echo "✅ 技能定义文件存在"
    echo
    echo "--- 技能定义内容 ---"
    cat "$SKILL_FILE"
    echo
    echo "---"
else
    echo "❌ 技能定义文件不存在"
    exit 1
fi

echo

# 显示可用命令
echo "🎮 可用命令测试:"
echo "- /learn-claude-code : 启动交互式教程"
echo "- /learn-claude-advanced : 访问高级主题"
echo "- /learn-claude-code start : 开始初学者教程"
echo "- /learn-claude-code worktrees : 学习并行开发"
echo "- /learn-claude-code safety : 掌握安全实践"
echo

# 检查Claude Code是否已安装
echo "⚙️ 检查Claude Code安装..."
if command -v claude-code &> /dev/null; then
    echo "✅ Claude Code CLI 已安装"
    echo "版本信息:"
    claude-code --version 2>/dev/null || echo "无法获取版本信息"
else
    echo "⚠️ Claude Code CLI 未安装，但技能仍可在Claude界面中使用"
fi

echo

# 检查相关教程文件
echo "📚 检查教程内容..."
TUTORIAL_DIR="/Users/jacobcy/Documents/skills/claude-code-tutorial"
if [ -d "$TUTORIAL_DIR" ]; then
    echo "✅ 教程内容目录存在"
    echo "核心教程文件:"
    ls -la "$TUTORIAL_DIR/"*.md | head -10
else
    echo "⚠️ 教程内容目录不存在于预期位置"
fi

echo

echo "🎉 技能测试完成！"
echo
echo "要测试技能，请在Claude Code会话中输入以下命令之一："
echo "  /learn-claude-code"
echo "  /learn-claude-advanced"
echo
echo "注意：技能已安装，可以在Claude界面中直接使用！"