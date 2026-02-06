# Claude Code 快速入门指南

## 5分钟上手流程

### 1. 环境检查 (1分钟)

确认所需工具已安装：
```bash
# 检查 Git
git --version

# 检查 Claude Code
claude-code --version  # 或者你使用的命令

# 推荐安装 lazygit 用于可视化
brew install lazygit  # macOS
```

### 2. 项目设置 (2分钟)

在你的项目中：
```bash
# 1. 创建功能分支
git checkout -b feature/my-new-feature

# 2. 创建对应的工作树（推荐）
git worktree add ../my-project-feature feature/my-new-feature
```

### 3. 任务定义 (1分钟)

在工作树目录中创建任务定义文件：

**TASK.md**
```markdown
# TASK.md
目标:
实现用户登录功能

约束:
- 使用现有认证库
- 不修改数据库结构
- 添加单元测试
```

**AGENT_RULES.md**
```markdown
# AGENT_RULES.md
## 操作约束
1. 只修改认证相关文件
2. 不触碰支付模块
3. 遵循安全最佳实践
```

### 4. 启动 Claude (1分钟)

```bash
# 进入工作树目录
cd ../my-project-feature

# 启动 Claude Code
claude-code

# 首先提供 AGENT_RULES.md
# 然后提供 TASK.md
# 最后描述具体需求
```

## 3个关键原则

### 原则1: 隔离
```
一个任务 = 一个工作树 = 一个终端窗口
```

### 原则2: 监控
```
始终在 lazygit 中观察 Claude 的更改
```

### 原则3: 边界
```
通过 TASK.md 和 AGENT_RULES.md 明确限制范围
```

## 快捷命令参考

### 工作树管理
```bash
# 查看所有工作树
git worktree list

# 删除工作树
git worktree remove ../path-to-worktree

# 锁定主分支（防止误操作）
git checkout main
git reset --hard origin/main  # 确保与远程一致
```

### 任务管理
```bash
# 创建新任务的工作树
git worktree add ../project-task-$(date +%s) task-branch-$(date +%s)

# 同步主分支更改到当前分支
git fetch origin
git rebase origin/main
```

### 监控和审查
```bash
# 实时监控更改
lazygit

# 查看详细差异
git diff

# 检查提交历史
git log --oneline -10
```

## 常见场景快速应对

### 场景1: Claude 跑偏了
1. 立即停止 Claude
2. 检查 `git status` 看做了什么更改
3. 如果严重跑偏，`git reset --hard` 回到原始状态
4. 重新提供更清晰的 AGENT_RULES.md

### 场景2: 需要与其他任务协调
1. 暂停当前 Claude 会话
2. 在主分支同步最新代码
3. 将当前分支 rebase 到最新主分支
4. 重启 Claude 并告知上下文更新

### 场景3: 任务完成
1. 运行测试确保一切正常
2. 代码审查
3. 提交更改
4. 关闭工作树

## 记忆口诀

**SLB 原则**:
- **S**eparation (隔离) - 每个任务一个工作树
- **L**imitation (边界) - 明确的任务和规则文件
- **B**roadcast (监控) - 实时观察所有更改

## 下一步

完成这个快速入门后，建议：
1. 阅读完整指南 (`FULL_GUIDE.md`)
2. 尝试实践示例 (`examples/practical_example.md`)
3. 了解并行工作模式 (`docs/parallel_work.md`)
4. 学习最佳实践 (`docs/best_practices.md`)

现在你已经准备好开始使用 Claude Code 了！记住，安全第一，监控第二，效率第三。