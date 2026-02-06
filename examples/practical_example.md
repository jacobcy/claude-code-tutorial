# Claude Code 实践示例项目

## 项目概述

这是一个简单的用户管理系统，我们将用它来演示如何使用 Claude Code 进行并行开发。

## 项目结构

```
user-management/
├── src/
│   ├── auth/           # 认证模块 (将在工作树1中开发)
│   ├── payments/       # 支付模块 (将在工作树2中开发)
│   ├── users/          # 用户模块 (将在工作树3中开发)
│   └── shared/         # 共享组件
├── tests/
├── package.json
└── README.md
```

## 开发场景

我们将并行开发三个功能：

1. **工作树1**: 实现用户认证功能
2. **工作树2**: 实现支付系统功能
3. **工作树3**: 实现用户管理功能

## 实践步骤

### 第一步: 初始化项目

首先创建基础项目结构:

```bash
mkdir user-management
cd user-management
git init
npm init -y
mkdir -p src/{auth,payments,users,shared} tests
```

### 第二步: 创建基础文件

创建基础配置文件:

**package.json** (最小化版本):
```json
{
  "name": "user-management",
  "version": "1.0.0",
  "description": "A sample user management system",
  "main": "index.js",
  "scripts": {
    "start": "node index.js",
    "test": "jest"
  },
  "keywords": ["user", "management", "auth", "payments"],
  "author": "Developer",
  "license": "MIT"
}
```

**src/shared/types.js**:
```javascript
/**
 * 共享类型定义
 */

// 用户类型
export class User {
  constructor({ id, username, email, createdAt }) {
    this.id = id;
    this.username = username;
    this.email = email;
    this.createdAt = createdAt;
  }
}

// 订单类型
export class Order {
  constructor({ id, userId, amount, status, createdAt }) {
    this.id = id;
    this.userId = userId;
    this.amount = amount;
    this.status = status;
    this.createdAt = createdAt;
  }
}
```

### 第三步: 创建功能分支

```bash
# 创建认证功能分支
git checkout -b feature/auth-module
touch src/auth/README.md
echo "# Auth Module" > src/auth/README.md
git add src/auth/README.md
git commit -m "feat: add auth module structure"

# 创建支付功能分支
git checkout main
git checkout -b feature/payment-module
touch src/payments/README.md
echo "# Payment Module" > src/payments/README.md
git add src/payments/README.md
git commit -m "feat: add payment module structure"

# 创建用户管理功能分支
git checkout main
git checkout -b feature/user-module
touch src/users/README.md
echo "# User Module" > src/users/README.md
git add src/users/README.md
git commit -m "feat: add user module structure"

# 返回主分支
git checkout main
```

### 第四步: 设置工作树

现在我们可以使用之前创建的脚本来设置工作树:

```bash
cd /path/to/user-management
bash /Users/jacobcy/Documents/skills/everything-claude-code/claude-code-tutorial/scripts/setup_worktrees.sh
```

### 第五步: 并行开发

在不同的终端窗口中:

1. **终端1** (主分支): 监控和合并
2. **终端2** (认证工作树): 实现认证功能
3. **终端3** (支付工作树): 实现支付功能
4. **终端4** (用户工作树): 实现用户功能

## Claude Code 使用技巧

### 1. 任务定义清晰

为每个工作树创建明确的 TASK.md，说明:
- 具体功能需求
- 技术要求
- 代码规范
- 测试要求

### 2. 规则限制明确

为每个工作树创建 AGENT_RULES.md，限制:
- 修改文件范围
- 代码风格要求
- 安全规范
- 性能指标

### 3. 持续监控

在每个工作树目录中运行 `lazygit` 来实时监控更改。

## 注意事项

- 每个功能开发完成后，及时合并到主分支
- 定期同步主分支到各功能分支，避免冲突
- 在合并前进行充分测试
- 保持工作树整洁，不需要时及时删除