---
title: Atlas PPG小板芯片尺寸汇总
type: topic
created: 2026-05-18
updated: 2026-05-18
sources: [GH3020官网, Lite-On 2023产品手册, Everlight 2026-2027 IR Catalogue, TI官网]
tags: [PPG, 芯片尺寸, 封装, 可穿戴, Atlas]
---

## 概述

Atlas PPG 小板上的关键芯片尺寸汇总，用于结构限高评估和布局参考。

## 芯片尺寸一览

| 器件 | 型号 | 厂商 | 功能 | 封装类型 | 长×宽×高 (mm) | 引脚 |
|------|------|------|------|----------|---------------|------|
| PPG AFE | [[GH3020]] | 汇顶 (Goodix) | 多通道PPG心率/血氧 | WLCSP | 2.6 × 2.9 × 0.46 | 42 |
| 光电二极管 | LTR-C4825P | 光宝 (Lite-On) | PD光接收器 | SMD-8 | 4.8 × 2.5 × 0.5 | 8 |
| 多色LED | IRRG1816S | 亿光 (Everlight) | IR+红+绿三色LED | SMD | 1.8 × 1.6 × 0.6 | 4 |
| 双色LED | EA2016G52N01 | 聚飞 (Jufei) | 双色LED | 推测0201级 | 待确认 | — |
| 屏蔽盖 | X3301 | — | EMI屏蔽 | — | 按1.0（结构限高0.9） | 1 (GND) |

## 详细参数

### GH3020 — PPG AFE（汇顶科技）

- 封装：WLCSP-42，0.4mm pitch
- 芯片尺寸：2.605 × 2.905 × 0.468 mm
- 8路LED驱动（最大200mA × 2），4通道AFE
- PD接口：8路单端 / 4路差分
- 24-bit ADC，SNR可达110dB
- 支持 HR、SpO₂、HRV、佩戴检测
- 通信接口：I2C / SPI

### LTR-C4825P — 光电二极管（光宝电子）

- 封装：SMD-8
- 尺寸：4.8 × 2.5 × 0.5 mm
- 响应波长：400–1100nm（硅光电二极管）
- 8 pin，支持差分/单端连接
- 同系列更小型号：LTR-C3220（3.2 × 2.0 × 0.6 mm）

> **关于差分PD**：4路差分 = PD两端分别接AFE正负输入，共占8个引脚，抗共模噪声更好，适合运动场景PPG。

### IRRG1816S — 三色LED（亿光）

- 完整型号：B-IRRG1816CW3-L885-TR8
- 封装：SMD，4 pin
- 尺寸：1.8 × 1.6 × 0.6 mm
- 三色集成：
  - IR：940nm，VF=1.8V，10 mW/sr
  - 红：660nm，VF=2.5V，13 mW/sr
  - 绿：530nm，VF=2.8V，14 mW/sr
- 视角：110°（三色一致）
- 同系列：IRRG2020（2.0 × 2.0 × 0.6mm，更大面积）

### EA2016G52N01 — 双色LED（聚飞光电）

- 关联型号：LL821ZGHW-A02T4
- 厂商：聚飞光电 (Jufei)
- 类型：双色LED
- 封装尺寸：待确认（推测为0201级超小封装）
- 公开datasheet未索引，需联系聚飞或从焊盘反推

### X3301 — 屏蔽盖

- 封装符号：WD7992A_PB_V2_A
- 仅1个Pin连接GND，典型屏蔽盖特征
- 屏蔽盖高度按 **1.0mm** 设计
- 结构限高：**0.9mm**
- ⚠️ 屏蔽盖超出结构限高 0.1mm，需结构评审确认

## 高度排序

| 器件 | 高度 (mm) | 备注 |
|------|-----------|------|
| X3301 屏蔽盖 | 1.0 | ⚠️ 超出结构限高0.9mm |
| IRRG1816S LED | 0.6 | |
| LTR-C4825P PD | 0.5 | |
| GH3020 AFE | 0.46 | |

## 待确认项

- [ ] EA2016G52N01 的精确封装尺寸
- [x] X3301 屏蔽盖高度：按1.0mm，结构限高0.9mm（⚠️ 超限）
- [ ] AFE4950 (TI) 是否也在板子上（2.6 × 2.5 mm DSBGA-36）

## 相关页面

- 概念：[[PPG]]、[[光电二极管]]
- 主题：[[无创血糖监测方案对比-睿芯微vs多感科技]]、[[方案总结]]
- 来源：[[GH3020丨健康传感器丨传感器丨汇顶科技-摘要]]

## 参考

- [GH3020 产品页](https://www.goodix.com/zh/product/sensors/health_sensors/gh3020)
- [Lite-On 光电二极管产品页](https://optoelectronics.liteon.com/en-global/Led/led-component/Detail/734)
- [Everlight 2026-2027 IR Catalogue (PDF)](https://www.everlight.com/wp-content/uploads/2026/01/2026-2027_Catalogue_IR.pdf)
- [AFE4950 产品页 (TI)](https://www.ti.com/product/AFE4950)
