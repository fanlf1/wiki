# LLM Wiki 操作日志

> 本日志记录wiki的演进历史。

---

## [2026-04-24] init | 创建LLM Wiki结构

**操作**：初始化wiki
**创建**：
- 目录结构：`raw/` `wiki/`
- 核心文件：`CLAUDE.md` `index.md` `log.md` `wiki/overview.md`

**备注**：
- 参考Karpathy的LLM Wiki Gist
- 适配中文环境
- 准备开始摄取源文件

**Git**：
- 初始化仓库：`git init`
- 首次提交：commit 1158e6e

---

## [2026-04-24] ingest | 批量摄取CGM技术资料库

**操作**：批量摄取39个CGM相关文件

**源文件**：
- 复制：`/mnt/c/code/health/cgm/*` → `raw/notes/`
- 文件数：39个（包含PDF、MD）

**创建页面**：
- 源文件摘要：
  - `wiki/sources/CGM方案总结-摘要.md`
  - `wiki/sources/CGM评价标准-摘要.md`
- 概念页：
  - `wiki/concepts/MARD.md`
  - `wiki/concepts/无创血糖监测.md`
- 实体页：
  - `wiki/entities/睿芯微.md`
  - `wiki/entities/多感科技.md`

**更新页面**：
- `index.md` — 更新索引（新增3概念、2实体、2源文件）
- `log.md` — 添加本条日志

**核心内容**：
- 无创血糖监测技术方案评估
- 睿芯微⭐⭐⭐⭐⭐：高光谱成像+AI，MARD 8.39%，临床验证完整
- 多感科技⭐⭐：近红外光谱，硅光工艺，仅有动物实验
- CGM评价标准：MARD <15%，ISO 15197 ZoneAB ≥95%

**备注**：
- 这是首批批量摄取，优先处理了核心文档
- 剩余30+个文件可按需逐步摄取
- 已建立知识库基础框架

---

> **说明**：每条记录格式为 `## [YYYY-MM-DD] 操作类型 | 标题`
> - 操作类型：init（初始化）、ingest（摄取）、query（查询）、lint（健康检查）
