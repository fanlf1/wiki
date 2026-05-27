---
type: paper-note
created: 2026-05-26
paper: 多篇NIR/电化学尿酸检测论文
topic: 多标志物-光谱检测
tags: [NIR, 尿酸, uric acid, 无创, 汗液传感, 穿透检测]
---

# NIR光谱检测尿酸——文献综述

## 综述范围
评估NIR光谱无创检测尿酸的可行性，同时对比汗液电化学传感方案。

---

## 论文1：Noninvasive Uric Acid Monitoring Device using Near-Infrared Spectroscopy

- **来源**：Journal of Biosensors & Bioelectronics
- **链接**：https://www.hilarispublisher.com/open-access/noninvasive-uric-acid-monitoring-device-using-nearinfrared-spectroscopy-2155-6210-1000188.pdf
- **核心发现**：
  - 使用 **1400-1700 nm** NIR波段照射尿酸样本
  - 检测器接收未被吸收的红外光来量化尿酸浓度
  - 设备描述为"低成本、便携、快速无创读数"
  - **局限**：仅在尿酸溶液/血清样本上验证，未做经皮活体验证
- **对我们的意义**：部分支持——尿酸在1400-1700nm有特征吸收，但经皮穿透的信号极弱

## 论文2：Advances in Non-Invasive NIR-Techniques for Gout Detection

- **来源**：STM Journals (2024)
- **链接**：https://journals.stmjournals.com/article/article=2024/view=170152/
- **核心发现**：
  - 2024年的最新研究，使用光谱传感器+Raspberry Pi平台
  - 目标是无创测量血尿酸
  - 仍在概念验证阶段
- **对我们的意义**：参考——2024年仍处于早期研究，说明技术成熟度不高

## 论文3：Wearable Biosensor for Sensitive Detection of Uric Acid in Artificial Sweat

- **来源**：ScienceDirect (2021)
- **链接**：https://www.sciencedirect.com/science/article/abs/pii/S2211285521002895
- **核心发现**：
  - 柔性汗液生物传感器，纤维结构传感界面
  - 在人工汗液中精确选择性检测尿酸
  - **关键**：这是电化学方法，不是光谱方法
- **对我们的意义**：竞争路线参考——汗液电化学在尿酸检测上比NIR更成熟

## 论文4：Wearable Intelligent Sweat Platform for SERS-AI Diagnosis of Gout (2024)

- **来源**：RSC Lab on a Chip (2024)
- **链接**：https://pubs.rsc.org/en/content/articlelanding/2024/lc/d3lc01094e
- **核心发现**：
  - SERS（表面增强拉曼光谱）+ AI 的穿戴平台
  - 用于痛风诊断的尿酸检测
  - 拉曼光谱提供了比NIR更高的化学特异性
- **对我们的意义**：竞争路线——SERS+AI是另一个有前景的无创尿酸检测方案

## 论文5：Touch-Based Uric Acid Sweat Biosensor (2025)

- **来源**：ScienceDirect (2025)
- **链接**：https://www.sciencedirect.com/science/article/abs/pii/S0956566325001630
- **核心发现**：
  - 指尖触碰式汗液尿酸电化学传感器
  - 2025年最新进展，面向现场自测
- **对我们的意义**：参考——汗液路径的尿酸检测正在快速成熟

---

## 关键技术总结

### 尿酸NIR检测的波段

| 波段 | 化学键基础 | 备注 |
|------|-----------|------|
| **1400-1700 nm** | 尿酸分子O-H/N-H振动 | 论文验证有特征吸收 |
| ~1700 nm | 与脂质C-H波段重叠 | 需要算法解混 |

### NIR vs 汗液电化学对比

| 维度 | NIR经皮 | 汗液电化学 | SERS |
|------|---------|-----------|------|
| 成熟度 | 概念验证 | 原型已出 | 概念验证 |
| 特异性 | 低（水分干扰大） | 高（酶特异性） | 高（拉曼指纹） |
| 无创程度 | 完全无创 | 需要汗液 | 需要汗液 |
| 浓度相关性 | 组织间液→血 | 汗液→血（间接） | 汗液→血（间接） |
| 可集成性 | 与血糖共享传感器 | 需要额外电极 | 需要拉曼激发光 |

### 核心困难

1. **尿酸血中浓度低**：200-500 μmol/L，远低于血糖（4-10 mmol/L），信号弱1-2个数量级
2. **尿酸分子小**：在NIR波段的特征吸收不如血糖和血脂明显
3. **汗液-血液相关性不明确**：汗液中尿酸浓度与血液浓度的关系个体差异大
4. **没有大样本临床验证**：所有NIR方案都还停留在实验室阶段

---

## 对产品的启示

1. **尿酸NIR无创检测目前不可行**——信号太弱、临床验证空白
2. **如果要做尿酸**，更现实的路径是汗液电化学传感，但这改变了产品形态
3. **睿芯微路线**（高光谱CIS）短期只适合血糖，尿酸需要更高灵敏度的传感器
4. **建议尿酸作为远期目标（3-5年）**，等传感器灵敏度和AI模型都更成熟
