# 本地测试Claude Code未发布技能指南

## 1. 什么是Claude Code技能？

Claude Code技能是一种可扩展的功能模块，可以增强Claude Code的能力。它们可以是：

- **命令式技能**：通过斜杠命令调用（如`/learn-claude-code`）
- **自动化钩子**：在特定事件发生时自动执行
- **智能体扩展**：提供特定领域的专业能力

## 2. 技能工作原理

Claude Code从以下位置加载技能：
- `~/.claude/skills/` - 主要技能目录
- `~/.claude/agents/` - 智能体技能
- `~/.claude/rules/` - 规则类技能

当您键入以`/`开头的命令时，Claude Code会在技能目录中查找匹配的技能。

## 3. 本地测试未发布技能的方法

### 方法一：直接复制/链接到技能目录

这是最常见的方法，适用于功能完整的技能：

```bash
# 将您的技能复制到技能目录
cp -r /path/to/your/skill ~/.claude/skills/skill-name/

# 或者创建符号链接（推荐用于开发阶段）
ln -sf /path/to/your/skill ~/.claude/skills/skill-name/
```

### 方法二：使用开发模式

如果您正在开发技能，推荐使用开发模式，这样可以即时看到更改效果：

```bash
# 创建符号链接到您的开发目录
ln -sf /Users/jacobcy/Documents/skills/claude-code-tutorial ~/.claude/skills/claude-code-tutorial-dev
```

### 方法三：手动安装（单文件技能）

对于简单的技能，可以直接创建技能文件：

```bash
# 创建新的技能定义
cat > ~/.claude/skills/my-new-skill/SKILL.md << 'EOF'
# 我的新技能

## 描述
这是一个示例技能，用于演示如何创建和测试未发布的技能。

## 命令
- `/my-skill`: 执行主要功能
- `/my-skill demo`: 运行演示
- `/my-skill help`: 显示帮助信息

## 功能
- 提供有用的功能
- 简化常见任务
- 提高工作效率
EOF
```

## 4. 验证技能是否正确安装

### 检查技能是否存在

```bash
# 列出所有已安装的技能
ls -la ~/.claude/skills/

# 检查特定技能
ls -la ~/.claude/skills/claude-code-tutorial/
```

### 测试技能命令

在Claude Code会话中尝试以下命令之一：

```
/learn-claude-code
```

如果技能安装正确，Claude应该能够识别该命令并执行相应的逻辑。

## 5. 当前已安装的教程技能详解

根据检查，您当前的`claude-code-tutorial`技能已经安装在：
`~/.claude/skills/claude-code-tutorial/SKILL.md`

该技能支持以下命令：
- `/learn-claude-code`: 启动交互式教程
- `/learn-claude-advanced`: 访问高级主题
- `/learn-claude-code start`: 开始初学者教程
- `/learn-claude-code worktrees`: 学习并行开发
- `/learn-claude-code safety`: 掌握安全实践

## 6. 调试技能问题

### 常见问题及解决方案

1. **技能命令不被识别**
   - 检查技能是否在正确位置：`~/.claude/skills/`
   - 确认技能目录包含SKILL.md文件
   - 重启Claude Code会话

2. **命令语法错误**
   - 确保技能定义中的命令格式正确
   - 检查是否遵循了正确的命令模式

3. **权限问题**
   - 确保技能文件具有适当的读取权限
   - 检查是否有任何符号链接问题

### 检查技能定义

```bash
# 验证技能文件内容
cat ~/.claude/skills/claude-code-tutorial/SKILL.md
```

## 7. 为技能开发设置最佳实践

### 开发工作流

1. **在单独的目录中开发技能**
   ```bash
   mkdir -p ~/projects/my-skill-dev
   cd ~/projects/my-skill-dev
   ```

2. **创建符号链接用于测试**
   ```bash
   ln -sf ~/projects/my-skill-dev ~/.claude/skills/my-skill-dev
   ```

3. **迭代开发和测试**
   - 修改技能文件
   - 在Claude Code中测试
   - 根据需要调整

4. **完成后整理**
   - 移除开发符号链接
   - 将最终版本复制到技能目录
   - 测试最终版本

### 版本控制

推荐将技能源代码存储在版本控制系统中：

```bash
# 将技能放在Git仓库中
git init ~/projects/my-skill
cd ~/projects/my-skill
# 添加您的技能文件
git add .
git commit -m "Initial skill implementation"
```

## 8. 发布技能前的准备

在发布技能之前，请确保：

- [ ] 技能功能完整且经过充分测试
- [ ] 包含清晰的文档和使用说明
- [ ] 遵循安全最佳实践
- [ ] 兼容性测试通过
- [ ] 用户体验流畅

## 9. 实际测试步骤

现在让我们实际测试您已安装的教程技能：

1. **启动一个新的Claude Code会话**

2. **尝试使用技能命令**
   ```
   /learn-claude-code
   ```

3. **验证功能是否按预期工作**

4. **测试其他子命令**
   ```
   /learn-claude-code start
   /learn-claude-advanced
   ```

## 10. 卸载测试技能

如果需要卸载技能进行修改：

```bash
# 删除符号链接（如果是链接的话）
rm ~/.claude/skills/skill-name

# 或者删除复制的技能
rm -rf ~/.claude/skills/skill-name
```

---

**注意**：您的`claude-code-tutorial`技能已经成功安装，可以通过`/learn-claude-code`命令使用。这种本地安装方法是测试未发布技能的理想方式，允许您在发布之前完全验证功能。