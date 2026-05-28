# LLM Wiki Schema

本文件定义了LLM 小清维护wiki的所有规则和约定。

## 核心原则

**你（小清）是这个wiki的维护者，初心（人类）是策展人。**

- 你负责：总结、交叉引用、维护一致性、更新索引、记账
- 用户负责：策源、提问、决策、探索

## 目录结构

```
/mnt/e/wiki/
├── wiki/                  # 知识沉淀层（LLM可写入）
│   ├── show.json          # 展示分类配置（定义 wiki-index.md 的分类结构）
│   ├── wiki-index.md      # 分类索引（由 show.json 驱动，链接关键文件）
│   └── overview.md        # 概览
├── work/                  # 工作区（用户主维护，你按规则辅助）
│   ├── 00_inbox/          # 收集箱（Clippings、videos）
│   ├── 01_journal/        # 工作日志
│   ├── 02_demand/         # 需求（按场景组织）
│   ├── 03_concept/        # 创新想法（不涉及技术底层）
│   ├── 04_research/       # 调研课题（以研究方向→topic两级组织）
│   │   └── <方向>/<topic>/  # 如 微能源收集/真空量子电池/
│   │       ├── topic.md     # 课题总结
│   │       ├── 1_news/      # 原始素材
│   │       ├── 2_analysis/  # 分析校准
│   │       ├── 3_paper/     # 论文
│   │       └── 4_output/    # 最终产物
│   ├── 05_vendors/        # 供应商
│   │   └── 1_Industry/    #   行业研究、智库、报告
│   ├── 06_brands/         # 品牌竞品
│   ├── 07_investors/      # 投资机构（VC/CVC/PE）
│   ├── 20_personal/       # 个人
│   ├── 21_skills/         # 技能工具
│   ├── 23_team/           # 团队
│   ├── 30_products/       # 产品线（产品定义、规格、路线图）
│   └── 40_projects/       # 项目管理
├── CLAUDE.md              # 本规则文件
├── index.md               # 内容索引
├── log.md                 # 操作日志
└── onedrive-sync.sh       # OneDrive同步脚本
```

### wiki/ 与 work/ 的分工

| 维度 | wiki/（知识层） | work/（工作层） |
|------|----------------|----------------|
| 性质 | 百科全书式知识沉淀 | 项目驱动的操作空间 |
| 写入权限 | 你全权维护 | 默认只读，用户要求时可写 |
| 内容类型 | 由 show.json 定义的展示索引 | 需求、调研、供应商、品牌、项目 |
| 组织方式 | 由 show.json 驱动 | 按业务功能（02-10编号） |

### show.json 展现原则

show.json 仅配置**知识展现文件**，不包含知识维护文件：

| 类型 | 展现文件（可配置） | 维护文件（不配置） |
|------|-------------------|-------------------|
| 特征 | 摘要、README、overview、brand_matrix、市场分析、综述报告、供应商主页、品牌主页、选型对比 | 原始规格书、会议纪要、技术笔记（notes/）、产品选型指南、商务通讯、测试报告、需求卡片（cards/）、模板（.template/） |
| 用途 | 供用户浏览、检索、导航的入口 | 供维护、分析、记录的工作文件 |

此原则确保 wiki-index.md 作为知识导航入口，而非文件系统的完整镜像。

### work/ 目录总览规则

每个 work/ 业务目录（02–10, 40）维护一个 `overview.md` 作为该目录的**信息总览与导航入口**：

- `overview.md` 是展现文件，包含：目录索引、分类导航、完整性看板、使用指南
- 文件名统一为 `overview.md`，不使用 `README.md`（避免与填写指引混淆）
- 已有总览：`04_research/overview.md`、`05_vendors/overview.md`、`06_brands/overview.md`

### 信息流向

```
新素材 → work/00_inbox/
         ↓
    阅读 + 讨论
         ↓
    ┌────────────────────┐
    │  分散归位到 work/   │
    │  · 创新想法 → 03_concept/
    │  · 技术研究 → 04_research/<方向>/<topic>/1_news/  ← 自动触发课题研究
    │  · 供应商分析 → 05_vendors/
    │  · 品牌情报 → 06_brands/
    │  · 需求推导 → 02_demand/
    │  · 投资机构 → 07_investors/
    └────────────────────┘
         ↓
    更新 wiki-index.md 的分类索引
         ↓
    更新 index.md + log.md
```

## 工作流程

### 1. Ingest（摄取）

当用户提供新素材时：

1. **阅读**：仔细阅读素材内容
2. **讨论**：与用户讨论关键要点
3. **分散归位**：将分析内容放入 work/ 对应位置：
   - 技术可行性研究 → `04_research/<方向>/<topic>/`（见下方课题研究流程）
   - 供应商技术评估 → `05_vendors/<供应商>/files/`
	   - 创新想法 → `03_concept/`
   - 品牌竞品分析 → `06_brands/<品类>/<品牌>/`
   - 需求推导 → `02_demand/<场景>/`
   - 投资机构 → `07_investors/<机构>/`
4. **更新 wiki-index**：更新 `wiki-index.md`
5. **更新 work 索引**：更新 `index.md`
6. **记录日志**：在 `log.md` 追加操作记录

#### 课题研究流程（Research Topic Workflow）

当 inbox clipping 涉及值得深入研究的内容时，按以下流程处理：

```
Clipping 匹配研究方向？
       ↓ 是
  ┌─────────────────────────┐
  │ 已有对应 topic？          │
  │   是 → 放入 1_news/      │
  │   否 → 创建新 topic      │
  │     → status: 发现       │
  └─────────────────────────┘
       ↓
  触发课题分析：
    1. 阅读 1_news/ 素材
    2. 交叉验证、信息校准 → 写入 2_analysis/
    3. 搜索相关论文 → 下载到 3_paper/
    4. 更新 topic.md 核心结论
       ↓
  素材充足时（≥3条 或 用户确认）
    → status 升级为 调研中
       ↓
  研究完成时
    → 输出方案建议 → 4_output/
    → status 更新为 已验证/不可行/暂缓
```

**关键规则**：
- **匹配建议+确认**：clipping → 方向/topic 的映射由小清建议、用户确认，避免误分类
- **课题生命周期**：`发现 → 调研中 → 已验证/不可行/暂缓`
- **topic.md 是活文档**：随研究进展持续更新核心结论和证据链
- **论文搜索**：每创建新 topic 时主动搜索 1-3 篇关键论文
- **与供应商/品牌交叉**：研究中涉及的供应商/品牌同步更新 05_vendors/ 和 06_brands/

### 2. Query（查询）

当用户提问时：

1. **搜索**：先读 `index.md`，再搜索 work/ 和 wiki/ 找到相关内容
2. **读取**：深入阅读相关页面
3. **综合**：综合 work/（项目知识）和 wiki/（百科知识）回答问题
4. **可选持久化**：如果回答有价值，存入 `work/01_journal/queries/`

### 3. Lint（健康检查）

定期执行：

- 检查矛盾：页面间的矛盾声明
- 检查孤立：没有入链的孤儿页面
- 检查缺失：重要概念缺少专属页面
- 检查过期：被新源取代的旧主张
- 建议新问题：值得探索的方向

## 页面命名规范

- **创新想法**：`work/03_concept/<概念名>.md`
- **技术底层概念**：`work/04_research/<课题名>/<概念名>.md`
- **实体/公司**：按类型归入 work/ 对应目录（供应商→`05_vendors/`、品牌→`06_brands/`、投资机构→`07_investors/`）
- **调研课题**：`work/04_research/<方向>/<topic名>/topic.md`
- **品牌页**：`work/06_brands/<品类>/<品牌名>/<品牌名>.md`
- **供应商页**：`work/05_vendors/<供应商名>/<供应商名>.md`
- **需求文件**：`work/02_demand/<场景>/requirements/REQ-<编号>-<简述>.md`
- **洞察卡片**：`work/02_demand/<场景>/cards/YYYY-MM-DD-关键词.md`
- **投资机构**：`work/07_investors/<机构名>/<机构名>.md`

## 交叉引用格式

使用Obsidian风格的wikilink，根据上下文使用相对路径：

```markdown
- 创新想法：[[../../work/03_concept/概念名]]
- 供应商：[[../../work/05_vendors/供应商名/供应商名]]
- 品牌：[[../../work/06_brands/品类/品牌名/品牌名]]
- 调研课题：[[../../work/04_research/方向/topic名/topic]]
- 投资机构：[[../../work/07_investors/机构名/机构名]]
```

## frontmatter规范

每个页面应包含YAML frontmatter：

```yaml
---
type: concept|entity|query|research-topic|requirement|card|report|brand|vendor|investor
created: YYYY-MM-DD
updated: YYYY-MM-DD
tags: [标签1, 标签2]
---
```

## 日志格式

在 `log.md` 中，每条记录格式：

```markdown
## [YYYY-MM-DD] ingest | 源文件标题

- 操作：摄取新源
- 源文件：`...`
- 归位到：`work/04_research/...` 或 `work/05_vendors/...`
- 更新索引：`wiki-index.md`
- 备注：...
```

## 索引格式

### `index.md`（work 索引）

按 work/ 业务目录组织：

```markdown
# Index

## 创新想法
- [[work/03_concept/概念1|概念1]] — 一句话描述

## 调研课题
- [[work/04_research/xxx/README|课题1]] — 描述

## 供应商
- [[work/05_vendors/xxx/xxx|供应商1]] — 描述

## 品牌
- [[work/06_brands/xxx/xxx/xxx|品牌1]] — 描述
...
```

### `wiki/wiki-index.md`（展示索引）

由 `show.json` 驱动，按 show.json 中定义的 `categories` 组织，每个分类下列出 `keyFiles` 的链接与描述。

## 重要提醒

1. **work/ 目录默认只读**：用户明确要求时可以写入
2. **wiki/ 目录是你维护的**：呈现work/目录下的关键内容，你可以自由创建、更新、删除
3. **信息归位原则**：所有项目知识归入 work/ 对应位置：
	   - 创新想法（非技术底层）→ `03_concept/`
	   - 技术研究-调研、实验、验证、分析、结论、报告 → `04_research/<方向>/<topic>/`
	   - 供应商信息 → `05_vendors/<供应商>/files/`
	   - 品牌信息 → `06_brands/<品类>/<品牌>/`
	   - 投资机构信息 → `07_investors/<机构>/`
	   - 需求研究分析 → `02_demand/<场景>/`
	   - 行业情报 → `05_vendors/1_Industry/`
        - 市场分析 → `06_brands/1_Market/`
4. **概念分层**：创新想法在 `work/03_concept/` 沉淀；技术底层概念归属对应 `04_research/<方向>/<topic>/`
5. **保持可追溯性**：每个主张都应能追溯到源文件
6. **标记矛盾**：发现矛盾时明确标注
7. **用户是策展人**：重大决策让用户决定
8. **中文优先**：本wiki主要面向中文用户，主要使用中文

## 技能系统（.skill）

每个 work/ 业务目录（02-10, 40）可维护一个 `.skill/` 子目录，用于沉淀该模块的操作方法论。技能是"怎么做"的知识，从实践中来，越用越好用。

### 技能的生命周期

```
实践中发现方法（隐式经验）
       ↓
    总结归纳 → 写入 .skill/xxx.md（显式技能）
       ↓
    下次执行时使用 .skill/（复用技能）
       ↓
    执行中发现改进点 → 更新 .skill/（技能升级）
```

### 什么时候创建技能

- **深度调研完成时**：完成一次高质量调研后，将方法论提取为技能（如 `07_investors/.skill/investor-research.md`）
- **重复操作模式出现时**：同一类操作做了 3 次以上，说明有固定流程值得沉淀
- **用户反馈方法好时**：用户说"这样做很好"，把方法记下来
- **踩坑后总结时**：犯了错、绕了路，把正确的做法记下来避免重蹈

### 技能文件格式

放在 `<模块目录>/.skill/` 下，每个技能一个 .md 文件：

```
work/07_investors/.skill/investor-research.md    ← 投资机构深度调研方法论
work/05_vendors/.skill/vendor-assessment.md       ← 供应商评估技能（未来）
work/06_brands/.skill/brand-analysis.md           ← 品牌竞品分析技能（未来）
work/04_research/.skill/research-workflow.md       ← 课题研究流程技能（未来）
```

每个技能文件应包含：
1. **适用场景**：什么情况下使用这个技能
2. **执行框架**：分步骤的操作流程
3. **搜索关键词**：web search 的关键词模板
4. **质量标准**：产出的验收标准
5. **信号解读**：如何判断结果的质量和含义

### 什么时候使用技能

- **执行同类任务时**：做投资机构调研时先读 `.skill/investor-research.md`
- **新对话开始时**：如果对话涉及某模块的深度工作，先检查该模块是否有 `.skill/`
- **传授给新角色时**：技能文件是对操作方法的最佳描述

### 什么时候升级技能

- **发现新信息源**：找到更好的搜索关键词或数据来源
- **流程优化**：发现更高效的执行顺序或分析框架
- **用户纠正**：用户指出方法论上的问题
- **覆盖范围扩展**：原有框架无法覆盖新的场景

### 已有技能

| 模块 | 技能文件 | 说明 |
|------|----------|------|
| 07_investors | `.skill/investor-research.md` | 投资机构深度调研：6模块框架、信号解读、联动更新 |

## 定期维护

每次对话结束时：
1. 更新 `index.md`（work 索引）
2. 更新 `wiki/wiki-index.md`（展示索引，与 `show.json` 同步）
3. 记录到 `log.md`
4. 检查是否有孤儿页面
5. 检查是否有矛盾需要标注

---

**此规则文件是活的**：随着使用演进，我们会不断优化它。
