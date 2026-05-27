---
type: paper-note
created: 2026-05-26
paper: 多篇NIR血脂检测论文
topic: 多标志物-光谱检测
tags: [NIR, 血脂, 胆固醇, LDL, HDL, 甘油三酯, 光谱]
---

# NIR光谱检测血脂（胆固醇/LDL/HDL/TG）文献综述

## 综述范围
综合多篇关于近红外光谱（NIR）检测血脂指标的论文，评估技术可行性。

---

## 论文1：Multicomponent blood lipid analysis by means of near infrared spectroscopy

- **来源**：Talanta (2016)
- **链接**：https://real.mtak.hu/47580/1/1-s2.0-S0039914016302776-main.pdf
- **核心发现**：
  - NIR光谱可以同时检测总胆固醇（TC）、甘油三酯（TG）、HDL-C、LDL-C
  - 使用血清样本，建立了多组分NIR定量模型
  - 精度达到临床可接受水平
- **对我们的意义**：支持——证明NIR多组分血脂同时检测的可行性

## 论文2：Quantitative determination of serum LDL cholesterol by near-infrared spectroscopy

- **来源**：Vibrational Spectroscopy (2005)
- **链接**：https://www.sciencedirect.com/science/article/abs/pii/S092420310500069X
- **核心发现**：
  - NIR法测定LDL-C的RMS误差为 **0.43 mmol/L**（对比Friedewald公式）
  - 同时可测定总胆固醇
  - 使用血清透射光谱
- **对我们的意义**：支持——LDL-C的NIR定量精度已有文献基础

## 论文3：Quantification of low-density and high-density lipoproteins in human serum

- **来源**：PubMed
- **链接**：https://pubmed.ncbi.nlm.nih.gov/19903148/
- **核心发现**：
  - 使用NIR光谱评估血清中LDL和HDL含量
  - 光谱波段覆盖NIR区域
  - 多变量回归模型实现定量分析
- **对我们的意义**：支持——LDL/HDL的NIR区分是可行的

## 论文4：Reagent-free, simultaneous determination of serum cholesterol

- **来源**：Semantic Scholar (Liu & Shaw)
- **链接**：https://www.semanticscholar.org/paper/Reagent-free%2C%20simultaneous%20determination%20of%20serum-Liu-Shaw/635f8d8858f3f4fa6999c1a6390893e84d0ff2
- **核心发现**：
  - 红外光谱可无试剂同时测定LDL-C和HDL-C
  - 有潜力成为临床快速多组分血脂分析的首选方法
- **对我们的意义**：支持——无试剂（reagent-free）是我们的目标

## 论文5：ATR-FTIR spectroscopy for lipid profile prediction

- **来源**：PLOS ONE (2024)
- **链接**：https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0316522
- **核心发现**：
  - 使用ATR-FTIR（衰减全反射傅里叶变换红外光谱）
  - 线性回归模型预测LDL-C、HDL-C、TG、VLDL-C
  - 基于脂质吸收光谱特征
- **对我们的意义**：支持——FTIR波段与NIR有延续性，脂质光谱特征被系统研究

---

## 关键技术总结

### 血脂的NIR吸收波段

| 标志物 | 主要吸收波段 | 化学键基础 |
|--------|-------------|-----------|
| 胆固醇/脂质 | **~1210 nm** | C-H 2nd overtone |
| 胆固醇/脂质 | **~1700-1720 nm** | C-H combination bands（最强特征峰） |
| 胆固醇/脂质 | **~2200 nm** | C-H combination bands |
| 甘油三酯 | ~1400-1500 nm | O-H 1st overtone（与水分重叠） |
| LDL/HDL区分 | 需要多波段联合分析 | 依赖粒度引起的散射差异 |

### 精度水平

| 指标 | 文献精度 | 临床要求 | 差距 |
|------|----------|----------|------|
| LDL-C | RMS 0.43 mmol/L | ±0.5 mmol/L | **基本达标** |
| 总胆固醇 | 已有定量模型 | ±0.3 mmol/L | 接近 |
| HDL-C | 多变量回归可行 | ±0.1 mmol/L | 有差距 |
| TG | 多组分模型 | ±0.2 mmol/L | 需要更多验证 |

### 关键挑战

1. **水分干扰**：血液70%+是水，NIR中水的O-H吸收极强，容易淹没脂质信号
2. **粒度散射**：LDL/HDL的区分依赖粒子散射特性，不只是光谱吸收
3. **穿透深度**：经皮测量需要足够的光穿透到血管，1720nm波段穿透力有限
4. **浓度低**：血中尿酸浓度（200-500 μmol/L）远低于血糖（4-10 mmol/L），信号更弱

---

## 对产品的启示

1. **血脂NIR检测在血清层面已被验证**，但从血清→经皮无创是巨大的鸿沟
2. **~1700nm是血脂检测的关键波段**，需要SWIR传感器（InGaAs），普通硅基CIS（截止~1100nm）无法覆盖
3. **睿芯微的高光谱CIS**（VNIR 400-1000nm）可能无法直接用于血脂检测，需要扩展到SWIR
4. **多感科技的方案**（1300-1750nm）覆盖了血脂关键波段，理论上更适合血脂检测
5. **初期建议**：血糖先行（VNIR够用），血脂/尿酸作为二代扩展（需SWIR能力）
