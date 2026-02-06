# Claude Code 从零到一完整实战指南

## 目录
1. [简介](#简介)
2. [环境准备](#环境准备)
3. [核心概念](#核心概念)
4. [并行工作实践](#并行工作实践)
5. [实战示例](#实战示例)
6. [最佳实践与安全准则](#最佳实践与安全准则)
7. [故障排除](#故障排除)

## 简介

Claude Code 是 Anthropic 推出的命令行工具，允许你与 Claude AI 进行深度的代码协作。本指南将教你如何安全、高效地使用 Claude Code，特别是如何进行并行开发。

### 核心理念

Claude Code 不是聊天机器人，而是快速、无判断的代码编写进程。你的角色是：
- 定义任务
- 隔离环境
- 观察变化
- 决定结果

## 环境准备

### 必需工具

- **Ghostty**: 推荐的终端模拟器
- **Git**: 版本控制系统
- **Lazygit**: Git 的可视化界面
- **Claude Code**: CLI 或 Agent

### 安装 Claude Code

```bash
npm install -g @anthropic-ai/code
```

## 核心概念

### 工作树 (Worktree) 模式

这是 Claude Code 安全操作的核心:

```
核心规则: 一个代理 = 一个工作树
```

**为什么需要工作树？**
1. 物理隔离：每个任务在独立目录
2. 逻辑关联：共享仓库历史
3. 独立分支：每棵树可在不同分支工作

### 标准文件

#### TASK.md - 任务定义

```markdown
# TASK.md
目标:
[具体目标描述]

约束:
- [技术约束]
- [安全约束]
- [性能约束]
```

#### AGENT_RULES.md - 代理规则

```markdown
# AGENT_RULES.md
## 操作约束
1. [约束1]
2. [约束2]
3. [约束3]
```

## 并行工作实践

### 终端布局

```
Tab 1: main (审查/合并)
Tab 2: agent A (任务A)
Tab 3: agent B (任务B)
Tab 4: agent C (任务C)
```

**重要：绝不在一个终端标签页中混合多个代理**

### 创建工作树

```bash
# 从 main 分支创建多个独立的工作树
git worktree add ../project-feature-a feature/feature-a
git worktree add ../project-feature-b feature/feature-b
```

### 监控变更

在每个工作树中运行 `lazygit` 来实时监控差异：
- 观察实时更改
- 检测范围蔓延
- 决定提交或回滚

## 实战示例

让我们通过一个具体的项目来演示整个流程。

### 项目设置

假设我们要构建一个用户管理系统，需要并行开发认证、支付和用户管理三个模块。

#### 1. 初始化项目

```bash
mkdir user-management
cd user-management
git init
git checkout -b main
```

#### 2. 创建功能分支

```bash
# 创建认证模块分支
git checkout -b feature/auth-module
echo "# Auth Module" > src/auth/README.md
git add src/auth/README.md
git commit -m "feat: add auth module structure"

# 创建支付模块分支
git checkout main
git checkout -b feature/payment-module
echo "# Payment Module" > src/payments/README.md
git add src/payments/README.md
git commit -m "feat: add payment module structure"

# 创建用户模块分支
git checkout main
git checkout -b feature/user-module
echo "# User Module" > src/users/README.md
git add src/users/README.md
git commit -m "feat: add user module structure"

# 返回主分支
git checkout main
```

#### 3. 创建工作树

```bash
git worktree add ../user-management-auth feature/auth-module
git worktree add ../user-management-payment feature/payment-module
git worktree add ../user-management-user feature/user-module
```

#### 4. 为每个工作树设置任务文件

在 `../user-management-auth` 中：

**TASK.md**
```markdown
# TASK.md - Auth Module
目标:
实现用户认证功能

范围:
- 用户注册
- 用户登录
- JWT 令牌管理
- 认证中间件

约束:
- 不添加新依赖
- 遵循安全最佳实践
- 包含单元测试
```

**AGENT_RULES.md**
```markdown
# AGENT_RULES.md - Auth Module
## 操作约束
1. 只修改 src/auth/ 目录下的文件
2. 不要修改支付或用户相关文件
3. 遵循安全认证最佳实践
```

### 并行开发

现在你可以在不同的终端中分别进入三个工作树目录，为每个任务启动独立的 Claude Code 会话。

## 最佳实践与安全准则

### 安全规则（非协商）

- ❌ 绝不让 Claude 触碰 main 分支
- ❌ 绝不为单个代理分配多个任务
- ❌ 绝不未经审查就合并

### 质量保证

- ✅ 为每个任务创建明确的边界
- ✅ 实时监控所有更改
- ✅ 完成后彻底审查代码
- ✅ 测试验证功能正确性

## 故障排除

### 常见问题及解决方案

1. **范围蔓延**: Claude 开始修改无关文件
   - 解决: 更严格的 AGENT_RULES.md + 实时监控

2. **任务冲突**: 并行开发导致冲突
   - 解决: 清晰的模块划分 + 定期同步

3. **安全漏洞**: 引入潜在风险
   - 解决: 代码审查 + 安全扫描

### 回滚策略

好更改:
```bash
git add .
git commit -m "feat: implement feature"
```

坏更改:
```bash
git reset --hard  # 回滚所有更改
```

记住：回滚成本低，必要时大胆使用。

## 高级技巧

### 自动化脚本

我们提供了一个便捷的脚本来自动设置多工作树环境：

```bash
bash scripts/setup_worktrees.sh
```

这个脚本会:
- 创建指定数量的工作树
- 为每个工作树生成 TASK.md 和 AGENT_RULES.md 模板
- 设置清晰的任务边界

### 监控最佳实践

1. 每个工作树运行 `lazygit`
2. 保持任务范围小而明确
3. 频繁检查 Claude 的进度
4. 及时调整任务方向

---

通过遵循本指南，你将能够安全、高效地使用 Claude Code 进行并行开发，同时保持代码质量和安全性。记住，Claude Code 的力量在于正确的方法论，而不是盲目的信任。