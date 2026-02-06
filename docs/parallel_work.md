# Claude Code 并行工作与 Git 工作树详解

## 工作树 (Worktree) 的优势

Git 工作树提供了一个在物理上分离的目录环境中工作的能力，但共享同一个仓库的历史记录。这种设置非常适合并行使用 Claude Code，因为：

1. **物理隔离**: 每个任务在独立的目录中
2. **逻辑关联**: 共享相同的仓库历史
3. **独立分支**: 每个工作树可以在不同分支上工作

## 实际操作演练

### 步骤 1: 初始化仓库

假设我们有一个项目:

```bash
# 创建新的项目目录
mkdir my-project
cd my-project
git init
git checkout -b main
```

### 步骤 2: 创建多个功能分支

```bash
# 创建第一个功能分支
git checkout -b feature/user-auth
echo "# User Authentication Feature" > user_auth.md
git add user_auth.md
git commit -m "feat: add user auth feature description"

# 创建第二个功能分支
git checkout main
git checkout -b feature/payment-system
echo "# Payment System Feature" > payment_system.md
git add payment_system.md
git commit -m "feat: add payment system feature description"

# 返回到主分支
git checkout main
```

### 步骤 3: 创建工作树

```bash
# 创建独立的工作树
git worktree add ../my-project-auth feature/user-auth
git worktree add ../my-project-payment feature/payment-system
```

现在我们有了三个独立的环境：
- `./my-project` - 主分支
- `../my-project-auth` - 用户认证功能
- `../my-project-payment` - 支付系统功能

## 并行使用 Claude Code

### 环境设置

```
Terminal Tab 1: 主分支环境 (审查和合并)
Terminal Tab 2: 认证功能工作树 (Claude 任务 A)
Terminal Tab 3: 支付系统工作树 (Claude 任务 B)
```

### 在认证工作树中使用 Claude

在 `../my-project-auth` 目录中:

```bash
# 创建任务定义
cat > TASK.md << 'EOF'
# TASK.md
目标:
实现用户认证功能

约束:
- 使用 JWT 进行认证
- 包含登录、注册和验证中间件
- 遵循安全最佳实践
- 包含单元测试
EOF

# 创建代理规则
cat > AGENT_RULES.md << 'EOF'
# AGENT_RULES.md
## 操作约束

1. 只修改与用户认证相关的文件
2. 不要修改支付系统相关文件
3. 遵循安全最佳实践
4. 实现时考虑错误处理
5. 编写适当的测试

## 工作流程

1. 分析当前用户认证需求
2. 设计认证模块架构
3. 实现认证功能
4. 编写单元测试
5. 提交实现结果
EOF
```

### 在支付工作树中使用 Claude

在 `../my-project-payment` 目录中:

```bash
# 创建任务定义
cat > TASK.md << 'EOF'
# TASK.md
目标:
实现支付系统功能

约束:
- 集成第三方支付服务
- 包含支付验证和回调处理
- 实现退款功能
- 包含支付安全措施
EOF

# 创建代理规则
cat > AGENT_RULES.md << 'EOF'
# AGENT_RULES.md
## 操作约束

1. 只修改与支付系统相关的文件
2. 不要修改用户认证相关文件
3. 遵循支付安全最佳实践
4. 实现支付验证机制
5. 编写适当的测试

## 工作流程

1. 分析当前支付需求
2. 设计支付模块架构
3. 实现支付功能
4. 编写单元测试
5. 提交实现结果
EOF
```

## 监控和管理并行任务

### 使用 lazygit 监控

在每个工作树目录中运行 `lazygit` 来实时监控更改:

```bash
# 在每个工作树中运行
lazygit
```

这将帮助你:
- 实时查看代码差异
- 监控任务进展
- 检测意外更改

### 任务协调

即使在并行工作，有时也需要协调:

```bash
# 当认证功能完成后，将其合并到主分支
cd ~/my-project
git merge feature/user-auth
git push origin main

# 然后支付系统可以拉取最新更改
cd ../../my-project-payment
git checkout feature/payment-system
git rebase main
```

## 安全考虑

### 工作树安全

1. **物理隔离**: 每个任务在独立的目录中，避免交叉污染
2. **分支隔离**: 每个任务在独立的分支上工作
3. **权限控制**: 通过目录权限限制访问

### Claude 使用安全

1. **明确边界**: 每个 Claude 实例有明确的任务边界
2. **规则约束**: 使用 AGENT_RULES.md 限制操作范围
3. **持续监控**: 通过 lazygit 实时监控所有更改

## 最佳实践总结

1. **始终使用工作树进行并行任务**
2. **为每个任务创建独立的终端窗口**
3. **使用 TASK.md 和 AGENT_RULES.md 明确定义边界**
4. **在每个工作树中使用 lazygit 监控**
5. **完成任务后及时清理工作树**

```bash
# 清理工作树
git worktree remove ../my-project-auth
git worktree remove ../my-project-payment
```

这种方式提供了安全、高效的并行工作能力，同时保持了良好的隔离性和可见性。