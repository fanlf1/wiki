---
type: research-topic
created: 2026-05-27
updated: 2026-05-27
status: 调研中
tags: [毫米波雷达, mmWave, 雷达, 可穿戴, 健康监测, 心率, 呼吸, 睡眠, FMCW, 60GHz, 生命体征]
---

# 毫米波雷达 · 穿戴健康监测

## 研究问题
> 毫米波雷达（mmWave Radar）在可穿戴设备和健康监测中的应用现状、技术成熟度、核心芯片方案，以及与PPG/ECG/IMU等传统传感模态的对比。

---

## 一、核心结论（2026-05 调研）

1. **mmWave雷达已进入穿戴可行区间**：60GHz FMCW雷达芯片功耗已降至1mW以下（Infineon BGT60TR13C），封装尺寸5x5mm级，满足智能手表/戒指的功耗和尺寸约束。
2. **生命体征监测精度接近临床级**：心率检测中位误差<14ms（vs. ECG金标准），呼吸率检测成熟度更高，睡眠分期已有Google Nest Hub商业化验证。
3. **最大差异化优势是非接触**：雷达不需要皮肤接触、不受肤色/纹身影响、可穿透衣物/被褥，这是PPG和ECG都无法实现的。
4. **穿戴集成尚处早期**：目前尚无主流消费级智能手表/戒指搭载mmWave雷达。Google Nest Hub（2021）是唯一大规模商用的Soli雷达产品（床头睡眠监测）。Google Pixel Watch尚未集成Soli。
5. **中国市场34+企业入局**：移远通信、莫之比等已有面向康养/居家的雷达健康监测方案，但均非穿戴形态。

---

## 二、健康监测能力

### 2.1 可检测的生命体征

| 体征 | 原理 | 精度 | 成熟度 |
|------|------|------|--------|
| **呼吸率** | 胸腔起伏的毫米级运动 | 误差<1次/分 | ★★★★★ 商用化 |
| **心率** | 心脏搏动引起的胸壁微振动 | 中位误差<14ms（vs. ECG） | ★★★★ 实验室/近商用 |
| **心率变异性（HRV）** | 从心跳间隔序列推导 | 60-64GHz RF系统已发表Nature论文 | ★★★ 研究阶段 |
| **血压** | 脉搏波传输时间（需多点） | 边缘辅助框架已实现高精度 | ★★ 早期研究 |
| **睡眠分期** | 呼吸模式+体动+心率综合分析 | Google Nest Hub已商用（Soli雷达） | ★★★★ 商用化 |
| **跌倒检测** | 宏观运动模式识别 | TI IWR6843已有成熟方案 | ★★★★★ 商用化 |
| **房颤检测** | 心率不规律性分析 | mCardiacDx系统已演示 | ★★ 早期研究 |

### 2.2 关键研究论文

| 论文 | 发表 | 关键成果 |
|------|------|----------|
| Contactless ECG Monitoring With mmWave Radar | IEEE Trans. Microwave 2024 | 中位时序误差<14ms，波形形态准确率>90% |
| CardioRadar (Contactless 12-lead ECG) | PMC 2025 | 基于雷达的12导联ECG恢复 |
| AirECG (清华) | 清华学报 | 跨域信号处理，接触式ECG疾病监测 |
| mmJEPA-ECG | AAAI 2025 | 跨体态鲁棒的接触式ECG |
| Long-term Cardiac Activity Monitoring | Nature Communications 2024 | 60-64GHz RF系统，临床级HRV精度 |
| Edge-assisted Multi-user BP Monitoring | AIMS Press 2025 | 边缘辅助框架，低延迟血压监测 |
| Measuring HR with Consumer UWB Radar | Google Research | UWB雷达+迁移学习实现心率检测 |
| UWB Radar HR Monitoring with Transfer Learning | arXiv 2025 | 消费级UWB硬件的心率监测 |

---

## 三、芯片方案对比

### 3.1 主流低功耗雷达芯片

| 参数 | Acconeer A121 (XM125) | Infineon BGT60TR13C | TI IWR6843 | imec 60GHz (研发中) |
|------|----------------------|---------------------|------------|---------------------|
| **频率** | 60 GHz | 60 GHz | 60 GHz | 60 GHz |
| **体制** | 脉冲相干雷达（PCR） | FMCW | FMCW | FMCW |
| **带宽** | 4 GHz | — | 4 GHz | 57-66 GHz |
| **功耗** | 极低（<5mW活跃） | <1-2mW（占空比模式） | 中等（45nm RFCMOS） | 超低（穿戴目标） |
| **封装尺寸** | 5.2 x 5.5 x 0.8 mm | 芯片级+集成天线 | 较大（非穿戴优化） | SoC（2TX/2RX） |
| **接口** | SPI | SPI | CSI-2/LVDS | — |
| **感测距离** | 0-20m（远距模式） | 短距（<2m） | 中远距 | 短距 |
| **穿戴适配** | ★★★★ 优 | ★★★★★ 最优（功耗最低） | ★★★ 中（功耗较高） | ★★★★ 研发中 |
| **开发板** | SparkFun Qwiic XM125 (~$49.95) | Infineon ModusToolbox | IWR6843ISK-ODS | — |
| **状态** | 量产 | 量产 | 量产 | 研发阶段 |

### 3.2 关键功耗指标

- **Infineon BGT60TR13C**：<1mW（占空比模式），SPI模式下约2mW，全速约14mW — 这是目前穿戴最优方案
- **Acconeer A121**：活跃模式数mW级，极低占空比可实现平均<1mW
- **22nm FD-SOI CMOS研究芯片**：62mW收发器 — 代表下一代工艺的功耗水平
- **NOVELIC 60GHz FMCW**：690mW — 功耗过高，不适合穿戴

### 3.3 供应商生态

| 供应商 | 定位 | 可穿戴布局 |
|--------|------|-----------|
| **Infineon** | 60GHz雷达领导者，XENSIV品牌 | BGT60TR13C专为IoT/穿戴优化，Imagimob AI/ML生态 |
| **Acconeer（瑞典）** | 脉冲相干雷达专利，超低功耗 | XM125模块+SparkFun生态，穿戴参考设计 |
| **Texas Instruments** | 77GHz/60GHz全覆盖，汽车级 | IWR6843功耗偏高，更适合床头/固定式 |
| **imec（比利时）** | 研发机构，超低功耗SoC | 面向穿戴的60GHz片上雷达研发中 |
| **NOVELIC** | 60GHz FMCW芯片设计 | 短距感知，功耗偏高 |
| **移远通信** | 模组方案商 | 毫米波雷达健康监测方案（床头形态） |
| **莫之比智能** | 国内雷达方案商 | SMH-D01呼吸心率监测雷达 |

---

## 四、已商用产品与项目

### 4.1 商用产品

| 产品 | 形态 | 雷达技术 | 功能 | 状态 |
|------|------|----------|------|------|
| **Google Nest Hub (2nd Gen)** | 床头智能屏 | Google Soli (60GHz) | 睡眠分期、呼吸检测、咳嗽/打鼾检测 | 2021年上市，已商用 |
| **Google Pixel 4** | 智能手机 | Google Soli | Motion Sense手势交互 | 2019年，后续机型已移除 |
| **莫之比 SMH-D01** | 床头雷达模块 | mmWave FMCW | 非接触心率、呼吸率、睡眠监测 | 国内商用 |

### 4.2 学术/产业演示

| 项目 | 来源 | 说明 |
|------|------|------|
| Google Research UWB心率检测 | Google Research | 消费级UWB硬件+迁移学习，无需专用雷达 |
| bitsensing健康雷达 | 韩国/Infineon合作 | 基于BGT60TR13C的实时健康分析 |
| mCardiacDx | 学术 | 雷达心房颤动（AF）无接触监测诊断 |
| VitaNet | ACM | 雷达无接触PPG波形及导数估计 |
| 移远毫米波雷达方案 | 移远通信+上海交大 | 睡眠分析报告（心率/呼吸/心动图/体动） |

### 4.3 穿戴集成进度

| 平台 | 雷达集成状态 | 说明 |
|------|-------------|------|
| **Google Pixel Watch (1-3代)** | 未集成 | 依赖传统PPG+加速度计 |
| **Apple Watch** | 未集成 | 无雷达，依赖PPG/ECG/IMU |
| **Samsung Galaxy Watch/Ring** | 未集成 | 无雷达 |
| **Oura Ring** | 未集成 | 纯PPG方案 |
| **Google Pixel Watch 4（传闻）** | 可能有Soli | Reddit讨论存在，无官方确认 |
| **未来AR眼镜** | 潜力最大 | 手势交互+健康监测双需求 |

---

## 五、传感模态对比

### 5.1 综合对比

| 维度 | mmWave雷达 | PPG（光学） | ECG（电学） | IMU（惯性） |
|------|-----------|-------------|-------------|-------------|
| **接触要求** | 无需接触 | 需皮肤接触 | 需电极接触 | 需佩戴 |
| **心率精度** | 中位误差<14ms | 运动干扰大，肤色敏感 | 金标准 | 无法直接测心率 |
| **呼吸率** | 优（胸腔运动直接检测） | 差（间接推导） | 差 | 中（体动推断） |
| **血氧** | 无法检测 | 可检测（SpO2） | 无法检测 | 无法检测 |
| **血压** | 早期研究（可行） | 需校准 | 需双点 | 不可行 |
| **睡眠分期** | 优（呼吸+心率+体动） | 中（心率+血氧） | 好（心率精确） | 中（体动） |
| **手势交互** | 优（Google Soli验证） | 不可行 | 不可行 | 中（加速度） |
| **运动伪影** | 有影响但可控 | 严重 | 中等 | 不适用 |
| **肤色/纹身影响** | 无影响 | 严重影响 | 无影响 | 无影响 |
| **穿透性** | 穿透衣物/被褥 | 不可穿透 | 不可穿透 | 不可穿透 |
| **隐私保护** | 优（无图像） | — | — | — |
| **功耗** | 1-14mW | 5-20mW | <1mW | <1mW |
| **芯片尺寸** | 5x5mm级 | 3x3mm级 | 5x5mm级 | 3x3mm级 |
| **成本** | 中（$5-15） | 低（$1-3） | 低（$1-5） | 低（$0.5-2） |
| **穿戴成熟度** | 早期（2024-2026） | 成熟（大规模商用） | 成熟（医疗级） | 成熟（大规模商用） |

### 5.2 雷达的独特优势场景

1. **非接触睡眠监测**：床头/枕头下部署，用户无需佩戴任何设备
2. **穿衣物健康监测**：冬天戴手套/穿长袖时仍可监测
3. **深肤色/纹身用户**：PPG精度大幅下降的人群
4. **手势交互+健康双功能**：一颗雷达芯片同时支持交互和监测（Google Soli理念）
5. **隐私优先场景**：医院、养老院等不适合摄像头的环境

---

## 六、在穿戴设备中的集成方案

### 6.1 智能手表集成

```
┌──────────────────────────────┐
│         智能手表              │
│                              │
│  ┌────────┐  ┌────────┐     │
│  │60GHz   │  │PPG     │     │  ← 雷达在表背/表侧
│  │雷达    │  │传感器  │     │
│  │(表背)  │  │(表背)  │     │
│  └────────┘  └────────┘     │
│                              │
│  雷达模式切换：              │
│  · 手腕心率 → PPG优先       │
│  · 睡眠监测 → 雷达+PPG融合  │
│  · 手势交互 → 雷达独立工作   │
│  · 脱离手腕 → 雷达桌面监测   │
└──────────────────────────────┘
```

**关键挑战**：
- 天线设计：60GHz天线在手表金属外壳中的集成
- 功耗管理：需要在<1mW占空比模式下实现有意义检测
- 信号处理：腕部微振动信噪比远低于胸腔

### 6.2 智能戒指集成

**可行性评估**：
- **尺寸约束**：Acconeer A121 (5.2x5.5mm) 接近戒指内径上限，集成困难
- **天线挑战**：60GHz波长仅5mm，戒指弧面上的天线设计极难
- **功耗预算**：戒指电池容量15-25mAh，雷达即使1mW平均功耗也占比较大
- **结论**：2026年技术条件下，智能戒指集成mmWave雷达**不现实**，手表/耳机形态更合适

### 6.3 耳机/耳穿戴集成

- **优势**：耳机腔体空间更大，且靠近头部（可监测颈动脉）
- **可行性**：中等，需要定制天线设计
- **Google Soli在Pixel Buds中的可能性**：无公开信息，但从尺寸/功耗看有潜力

---

## 七、技术路线图判断

### 7.1 短期（2026-2027）

- **床头/固定式雷达健康监测**成熟，更多厂商推出类Nest Hub产品
- **Acconeer/Infineon方案**在工业和医疗IoT领域持续渗透
- **学术成果加速**：心率/HRV雷达检测精度继续提升

### 7.2 中期（2027-2029）

- **智能手表集成雷达**的可能性出现（功耗和天线突破后）
- **Google Pixel Watch或Apple Watch**可能率先尝试
- **雷达+PPG融合算法**成为新的信号处理研究方向

### 7.3 长期（2029+）

- **AR眼镜**成为雷达穿戴的最佳载体（手势+健康双需求）
- **雷达SoC**功耗进一步降至亚mW级
- **戒指形态**雷达集成有望实现（取决于天线小型化进展）

---

## 八、对我们的产品决策启示

| 产品方向 | 雷达相关性 | 建议 |
|----------|-----------|------|
| **智能戒指（当前）** | 低 | 戒指形态不适合雷达，继续用PPG方案 |
| **智能手表（规划中）** | 中 | 可关注但非优先，等待功耗和天线突破 |
| **睡眠监测（配件）** | 高 | 床头雷达配件可行，Infineon/Acconeer方案可直接采用 |
| **手势交互** | 高 | AR眼镜场景需重点关注，与[[../../3D感知/README\|3D感知]]课题交叉 |

---

## 九、产业全景调研

> 详细产业调研报告见：[[files/毫米波雷达产业全景-2025|毫米波雷达产业全景（2025-2026）]]

涵盖：市场规模、频段技术对比、TI/Infineon/NXP/Accconeer/加特兰等厂商产品线、智能家居/可穿戴应用、中国市场格局、集成趋势。

---

## 下一步

- [ ] 深入调研Infineon BGT60TR13C开发套件和穿戴参考设计
- [ ] 评估Acconeer XM125在手腕形态的信号质量
- [ ] 调研Google Soli最新专利和Pixel Watch集成计划
- [ ] 对比雷达睡眠监测与PPG睡眠监测的实际精度差异
- [ ] 评估床头雷达配件作为独立产品的可行性

---

## 信息来源

### 芯片厂商
- [Infineon 60GHz Radar](https://www.infineon.com/products/sensor/radar-sensors/radar-sensors-for-iot/60ghz-radar)
- [Acconeer XM125](https://developer.acconeer.com/home/a121-docs-software/xm125-xe125/)
- [TI IWR6843](https://www.ti.com/lit/swra810)
- [imec 60GHz On-Chip Radar](https://www.imec-int.com/en/articles/ultra-sensitive-and-low-power-radar-enables-intuitive-human-computer-interaction)

### 关键论文
- [Contactless ECG Monitoring With mmWave Radar (IEEE 2024)](https://ui.adsabs.harvard.edu/abs/2024ITMC...23..270C/abstract)
- [Long-term Cardiac Activity Monitoring (Nature Comms 2024)](https://www.nature.com/articles/s41467-024-55061-9)
- [mCardiacDx Radar AF Monitoring (PMC 2025)](https://pmc.ncbi.nlm.nih.gov/articles/PMC13068127/)
- [CardioRadar 12-lead ECG (PMC)](https://pmc.ncbi.nlm.nih.gov/articles/PMC13055045/)
- [AirECG (清华)](https://tns.thss.tsinghua.edu.cn/~guoxuan/assets/pdf/Paper-AirECG.pdf)
- [UWB Radar HR with Transfer Learning (arXiv)](https://arxiv.org/html/2507.14195v1)
- [mmWave Remote Health Monitoring (TechRxiv)](https://www.techrxiv.org/doi/10.36227/techrxiv.174918219.92733219)

### 行业报告
- [Healthcare mmWave Radar Market 2024 ($67.2M)](https://www.marketresearchreports.com/mrrpb5/global-health-care-millimeter-wave-radar-market-research-report-2025)
- [34家抢滩康养毫米波雷达 (AgeClub)](https://www.ageclub.net/article-detail/6393)
- [移远毫米波雷达健康方案](https://www.prnasia.com/story/525167-1.shtml)

### Google Soli
- [Google Nest Hub Soli睡眠追踪](https://blog.google/products-and-platforms/devices/google/nest/new-nest-hub-soli/)
- [Google Research Enhanced Sleep Sensing](https://research.google/blog/enhanced-sleep-sensing-in-nest-hub/)
- [Google Research UWB心率](https://research.google/blog/measuring-heart-rate-with-consumer-ultra-wideband-radar/)
