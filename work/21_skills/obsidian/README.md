# LLM Wiki - 个人知识库

> 由小清维护，初心策展的持久化知识库

## 📖 什么是LLM Wiki？

这是一个基于[Andrej Karpathy的LLM Wiki理念](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)构建的知识管理系统。

**核心理念**：
- ❌ 传统RAG：每次查询时重新检索和综合
- ✅ LLM Wiki：增量构建持久wiki，知识编译一次，持续演进

## 🗂️ 目录结构

```
.
├── CLAUDE.md          # 规则文件（LLM遵守的约定）
├── index.md           # 内容索引
├── log.md             # 操作日志
├── raw/               # 原始素材（不可变）
│   ├── articles/      # 文章
│   ├── assets/        # 图片附件
│   ├── notes/         # 笔记
│   ├── papers/        # 论文
│   └── transcripts/   # 转录文本
└── wiki/              # LLM生成（自动维护）
    ├── concepts/      # 概念页
    ├── entities/      # 实体页
    ├── queries/       # 查询记录
    ├── sources/       # 源文件摘要
    ├── topics/        # 主题页
    └── overview.md    # 概览
```

## 🚀 快速开始

### 1. 摄取新源

```bash
# 将文件放到对应目录
cp your-article.md raw/articles/

# 在Claude Code中说：
"摄取 raw/articles/your-article.md"
```

LLM会自动：
- 阅读并讨论关键要点
- 创建源文件摘要
- 更新相关概念/实体页
- 更新索引和日志

### 2. 查询知识

直接提问：
- "解释一下RAG和LLM Wiki的区别"
- "关于Andrej Karpathy都知道什么？"
- "总结所有关于知识管理的源文件"

LLM会：
1. 搜索索引找到相关页面
2. 深入阅读相关内容
3. 综合回答并引用来源

### 3. 定期维护

定期告诉LLM：
- "执行一次lint检查"
- "检查wiki的健康状况"

LLM会检查：
- 页面间的矛盾
- 孤儿页面（无入链）
- 缺失的重要概念
- 需要更新的过期内容

## 🛠️ 技术栈

- **LLM**：小清 (via Claude Code)
- **编辑器**：Obsidian（可选，用于可视化）
- **版本控制**：Git
- **格式**：Markdown + YAML frontmatter

## 📊 当前状态

- 创建日期：2026-04-24
- 源文件：2
- Wiki页面：1
- 概念：0
- 实体：1
- 主题：0

## 🔗 相关链接

- [wiki/overview.md](wiki/overview.md) — Wiki概览
- [index.md](index.md) — 完整索引
- [log.md](log.md) — 操作日志
- [CLAUDE.md](CLAUDE.md) — 规则文件

## 📄 许可

本知识库为个人使用，内容请勿外传。

---

**维护者**：小清
**策展人**：初心
**最后更新**：2026-04-24
