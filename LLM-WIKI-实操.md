搭建 LLM Wiki Obsidian+Claude Code 实操
你需要准备： - Obsidian - Claude Code ---
Step 1: 新建 Obsidian Vault 打开 Obsidian新建一个vault Step

2: 把 Karpathy的Gist喂给Claude Code
打开终端, cd到你的vault：
```bash cd /你的路径/my-wiki claude ```
把 Karpathy的Gist链接丢给它： > 「按这篇Gist的规则, 帮我初始化整个wiki的结构」 Claude Code会帮你：
✅ 读懂Gist里的规则
✅ 创建完整文件夹和文件结构、
✅ 生成CLAUDE.md（规则）、index.md（索引）、log.md（日志） 你不需要手写配置文件，Claude Code全搞定。
--- 最终生成的结构：

my-wiki/
├── raw/ │
├── articles/ ← 文章 │
├── assets/ ← 图片等附件 │
├── notes/ ← 笔记 │
├── papers/ ← 论文 │
└── transcripts/ ← 转录文本 ├
── wiki/ │
├── concepts/ ← 概念页 │
├── entities/ ← 实体页 │
├── queries/ ← 问答记录 │
├── sources/ ← 素材摘要 │
├── topics/ ← 主题页 │
└── overview.md ← 概览 ├
── CLAUDE.md ← 规则文件 ├
── index.md ← 索引 └
── log.md ← 日志

--- 其中CLAUDE.md是最关键的文件——它就是 Karpathy 说的 Schema，定义了所有规则：怎么读原始素材、怎么提炼建页、命名规范、交叉引用格式、什么时候更新索引和日志。
这个文件 Claude Code 已经帮你写好了，后面它会严格遵守里面的规则。 #Karpathy #LLMWiki #AI知识库 #个人知识管理 #RAG #第二大脑 #人工智能 #obsidian #claudecode