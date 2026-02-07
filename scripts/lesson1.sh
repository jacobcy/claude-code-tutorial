#!/bin/bash
# Lesson 1: First encounter with Claude Code
# 修复版本 - 确保每个步骤都正确展示结果

echo "=========================================="
echo "  第 1 课：第一次接触 Claude Code"
echo "=========================================="
echo ""
echo "Claude Code 是 Anthropic 的官方命令行 AI 开发工具。"
echo "它能读取你的代码、编辑文件、运行命令 — 但每一步都需要你的许可。"
echo ""
echo "我们通过一个真实操作来感受它。"
echo ""
echo "=========================================="
echo ""

# Step 2: Demo - Show the file structure
echo "【步骤 2: 演示】"
echo "让我们先看看当前项目的文件结构："
echo ""
ls -la
echo ""
echo "我看到这是一个 Claude Code 教程项目，包含多个 Markdown 文档"
echo "(如 README.md、GETTING_STARTED.md)、脚本文件"
echo "(install_skills.sh、test-skill.sh) 以及几个目录 (docs、scripts、skills 等)。"
echo "这看起来是一个结构化的教程仓库。"
echo ""
read -p "按回车键继续..."
echo ""

# Step 3: Exercise
echo "【步骤 3: 练习】"
echo "现在轮到你了。请告诉我你想了解当前项目的什么信息，我来帮你查。"
echo ""
echo "选项："
echo "1. 这个项目有哪些目录？"
echo "2. 最近的 Git 提交是什么？"
echo "3. 项目里有多少个文件？"
echo ""
read -p "请选择 (1/2/3): " choice

case $choice in
    1)
        echo ""
        echo "好的，让我查看这个项目有哪些目录..."
        echo ""
        ls -d */
        echo ""
        echo "这就是 Claude Code 的工作方式 — 你提出需求，我执行操作，你看到结果。"
        ;;
    2)
        echo ""
        echo "好的，让我查看最近的 Git 提交..."
        echo ""
        git_log_output=$(git log -n 3 --oneline)
        echo "最近的 Git 提交是："
        echo "$git_log_output"
        echo ""
        echo "这就是 Claude Code 的工作方式 — 你提出需求，我执行操作，你看到结果。"
        ;;
    3)
        echo ""
        echo "好的，让我统计项目里有多少个文件..."
        echo ""
        file_count=$(find . -type f | wc -l)
        echo "项目里共有 $file_count 个文件。"
        echo ""
        echo "这就是 Claude Code 的工作方式 — 你提出需求，我执行操作，你看到结果。"
        ;;
    *)
        echo ""
        echo "无效选择。默认查看最近的 Git 提交..."
        echo ""
        git_log_output=$(git log -n 3 --oneline)
        echo "最近的 Git 提交是："
        echo "$git_log_output"
        echo ""
        echo "这就是 Claude Code 的工作方式 — 你提出需求，我执行操作，你看到结果。"
        ;;
esac
echo ""
read -p "按回车键继续..."
echo ""

# Step 4: Verify
echo "【步骤 4: 验证】"
echo "试试自己来：请直接用自然语言告诉我一个你想对这个项目做的查询操作。"
echo ""
echo "例如："
echo "1. '查看 README.md 的内容'"
echo "2. '找出所有 .sh 脚本文件'"
echo "3. '查看 .gitignore 的内容'"
echo ""
read -p "请选择 (1/2/3) 或输入其他查询: " verify_choice

case $verify_choice in
    1)
        echo ""
        echo "好的，让我查看 README.md 的内容..."
        echo ""
        cat README.md
        ;;
    2)
        echo ""
        echo "好的，让我找出所有 .sh 脚本文件..."
        echo ""
        find . -name "*.sh" -type f
        ;;
    3)
        echo ""
        echo "好的，让我查看 .gitignore 的内容..."
        echo ""
        cat .gitignore
        ;;
    *)
        echo ""
        echo "无效选择。默认查看 README.md 的内容..."
        echo ""
        cat README.md
        ;;
esac
echo ""
read -p "按回车键继续..."
echo ""

# Step 5: Quiz
echo "【步骤 5: 小测验】"
echo "Claude Code 在执行文件修改或运行命令之前，会怎么做？"
echo ""
echo "1. 直接执行，不需要确认"
echo "2. 请求你的许可后才执行"
echo "3. 发邮件通知你"
echo ""
read -p "请选择 (1/2/3): " quiz_choice

case $quiz_choice in
    1)
        echo ""
        echo "错误！Claude Code 的每一个写操作和命令执行都需要你明确同意。"
        echo "这是安全设计的核心。"
        ;;
    2)
        echo ""
        echo "正确！Claude Code 的每一个写操作和命令执行都需要你明确同意。"
        echo "这是安全设计的核心。"
        ;;
    3)
        echo ""
        echo "错误！Claude Code 的每一个写操作和命令执行都需要你明确同意。"
        echo "这是安全设计的核心。"
        ;;
    *)
        echo ""
        echo "请选择 1、2 或 3。"
        read -p "按回车键继续..."
        exit 0
        ;;
esac
echo ""
read -p "按回车键继续..."
echo ""

# Step 6: Next
echo "【步骤 6: 完成】"
echo "=========================================="
echo "  ✓ 第 1 课完成！"
echo "=========================================="
echo ""
echo "你已经知道 Claude Code 能做什么，以及它的安全机制。"
echo ""
echo "下一课: /cc-read — 学习如何让 Claude 深入读懂你的代码"
echo ""
echo "=========================================="
echo ""