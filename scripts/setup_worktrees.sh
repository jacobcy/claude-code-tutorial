#!/bin/bash
# script_to_setup_worktrees.sh - 快速设置 Claude Code 工作树环境

# 错误处理函数
cleanup_on_error() {
    echo "发生错误，正在清理..."
    # 清理已创建的工作树和分支（如果有的话）
    if [ -n "$current_branch_created" ] && [ -n "$current_worktree_dir" ]; then
        git worktree remove "$current_worktree_dir" 2>/dev/null || true
        git branch -D "$current_branch_created" 2>/dev/null || true
    fi
    exit 1
}

# 设置错误陷阱
trap cleanup_on_error ERR

echo "=== Claude Code 工作树设置向导 ==="

# 获取项目信息
read -p "输入项目名称: " project_name
read -p "输入项目根目录路径: " project_root
read -p "输入要创建的工作树数量: " num_worktrees

# 验证输入
if [[ ! "$num_worktrees" =~ ^[1-9][0-9]*$ ]]; then
    echo "错误: 工作树数量必须是正整数"
    exit 1
fi

if [[ "$project_name" =~ [^a-zA-Z0-9._-] ]]; then
    echo "警告: 项目名称包含特殊字符，可能影响路径创建"
fi

# 验证项目根目录存在
if [ ! -d "$project_root" ]; then
    echo "错误: 项目根目录不存在: $project_root"
    exit 1
fi

# 检查对项目根目录的写权限
if [ ! -w "$project_root" ]; then
    echo "错误: 没有写权限: $project_root"
    exit 1
fi

# 进入项目根目录
cd "$project_root"

# 使用更可靠的 Git 仓库检测方法
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "错误: $project_root 不是一个 Git 仓库"
    exit 1
fi

echo "进入项目根目录: $(pwd)"

# 为每个工作树创建分支和目录
for i in $(seq 1 $num_worktrees); do
    echo ""
    read -p "输入工作树 $i 的分支名 (例如: feature/task-$i): " branch_name

    # 验证分支名
    if [[ -z "$branch_name" ]] || [[ "$branch_name" =~ ^[-/]|[/]$|// ]]; then
        echo "错误: 分支名格式无效"
        exit 1
    fi

    # 创建新分支（如果不存在）
    if git show-ref --verify --quiet "refs/heads/$branch_name"; then
        echo "分支 $branch_name 已存在，切换到该分支"
        git checkout "$branch_name" || exit 1
    else
        echo "创建新分支 $branch_name"
        git checkout -b "$branch_name" || exit 1
    fi

    # 使用安全的方式构建工作树目录路径
    branch_safe=$(echo "$branch_name" | tr '/' '-' | tr -cd 'a-zA-Z0-9._-')
    worktree_dir="../${project_name}-${branch_safe}"

    # 检查工作树目录是否已存在
    if [ -d "$worktree_dir" ]; then
        echo "错误: 工作树目录已存在: $worktree_dir"
        exit 1
    fi

    # 检查工作树是否已在 Git 中注册
    if git worktree list | grep -q "$worktree_dir"; then
        echo "错误: 工作树已存在: $worktree_dir"
        exit 1
    fi

    # 创建工作树
    echo "创建工作树: $worktree_dir"
    current_branch_created="$branch_name"
    current_worktree_dir="$worktree_dir"
    git worktree add "$worktree_dir" "$branch_name" || exit 1

    echo "为工作树 $i 创建模板文件..."

    # 在工作树目录中创建 TASK.md 和 AGENT_RULES.md
    cd "$worktree_dir"

    # 创建默认的 TASK.md
    cat > TASK.md << EOF
# TASK.md - $branch_name

## 目标
[在此处描述 $branch_name 任务的主要目标]

## 范围
- 需要实现的具体功能
- 相关的文件/模块
- 任何特定的技术要求

## 约束条件
- 不能违反的设计约束
- 技术栈限制
- 性能要求
- 安全要求

## 成功标准
- 功能正常工作的指标
- 测试覆盖率要求
- 性能指标
- 代码质量标准

## 交付物
- 需要创建或修改的文件
- 需要编写的测试
- 需要更新的文档
EOF

    # 创建默认的 AGENT_RULES.md
    cat > AGENT_RULES.md << EOF
# AGENT_RULES.md - $branch_name

你是一个自主编码代理，在 Git 工作树内运行。

## 操作约束

1. 只修改与 $branch_name 任务直接相关的文件。
2. 不要触摸此工作树之外的文件。
3. 不要修改其他功能分支的文件。
4. 保持更改小而增量。

## 工作流程

1. 仔细阅读 TASK.md。
2. 分析当前任务需求。
3. 提出具体实现计划。
4. 实施解决方案。
5. 完成任务后停止。

## 任务焦点

专注实现: $branch_name
忽略其他功能领域。
EOF

    echo "已为 $worktree_dir 创建 TASK.md 和 AGENT_RULES.md"

    # 返回项目根目录
    cd "$project_root"

    # 重置当前工作树变量
    unset current_branch_created
    unset current_worktree_dir
done

echo ""
echo "=== 工作树设置完成 ==="
echo "在项目根目录执行 'git worktree list' 查看所有工作树:"
git worktree list

echo ""
echo "建议的终端布局:"
for i in $(seq 1 $num_worktrees); do
    echo "  Tab $((i+1)): cd ${project_name}-$(git worktree list | sed -n "${i}p" | awk '{print $2}' | xargs basename)"
done

echo ""
echo "现在你可以为每个工作树单独启动 Claude Code 会话!"