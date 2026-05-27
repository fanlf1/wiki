---
title: JX-F28P CIS 规格书摘要
type: source
created: 2026-05-19
updated: 2026-05-19
sources: 1
tags: [CIS, 图像传感器, 晶相光电, SOI, 睿芯微, Demo2, STM32N675]
---

## 源文件

- 原始文件：`work/5_vendors/睿芯微/demos/demo2-stm32n675/JX-F28P 睿芯微.pdf`
- 原厂：**晶相光电（Silicon Optronics, Inc. / SOI）**，台湾
- 官网：[soinc.com.tw](https://www.soinc.com.tw/en/product/introduction)

## 概述

JX-F28P 是 SOI 设计制造的高性能 2.0MP CMOS 图像传感器，采用 SOI 2.1µm 像素技术，用于睿芯微 Demo2（STM32N675 平台）的成像模组。

## 关键规格

| 参数 | 规格 |
|------|------|
| 光学格式 | 1/4" |
| 有效像素 | 1928 x 1088 (2.0MP) |
| 像素尺寸 | 2.1 x 2.1 µm |
| 色彩滤波阵列 | RGB Bayer pattern |
| 主光线角度 | 15° linear |
| 快门类型 | 电子卷帘快门 (ERS) |
| 帧率 | FHD 1920x1080 @30fps / HDR @15fps |
| 输出接口 | DVP 并行 + MIPI CSI2 (双通道) |
| 数据格式 | 10-bit RAW RGB |
| 模拟供电 | 2.6–3.0V (2.8V 典型) |
| IO 供电 | 1.7–3.0V (1.8V 典型) |
| 功耗 | 典型 86mW (DVP 30fps) |
| 待机电流 | 典型 800µA |
| 灵敏度 | 1817 mV/lux-sec |
| 最大 SNR | 39.1 dB |
| 动态范围 | 77.3dB @8x |
| 暗电流 | 2.5 mV/sec @45°C |
| 工作温度 | -30°C ~ 85°C |
| 稳定结温 | 60°C |
| 封装 | CSP (晶圆级封装) |

## 功能特性

- 自动黑电平校准 (ABLC)
- 可编程增益、曝光、帧率、窗口裁剪
- 镜像翻转、窗口平移
- 50/60Hz 闪烁噪声消除
- HDR 模式：2帧交错输出
- 帧同步、寄存器组写、黑太阳斑消除

## 订购信息

| 型号 | 描述 |
|------|------|
| JX-F28P-C1-D3 | CSP, DVP 接口 |
| JX-F28P-C1-M3 | CSP, MIPI 接口 |

## SOI 同系列产品

| 型号 | 分辨率 | 像素尺寸 | 光学格式 | 帧率 |
|------|--------|---------|---------|------|
| JX-F22 | 1080P | 3.0µm | 1/2.7" | 60fps |
| **JX-F28P** | **1080P** | **2.1µm** | **1/4"** | **30fps** |
| JX-F37P | 1080P | 2.7µm | 1/3.2" | — |
| JX-F38P | 1080P | 2.5µm | 1/3.2" | — |

## 与睿芯微 Demo2 的关联

- Demo2 使用 STM32N675 平台
- JX-F28P 作为普通 RGB CIS 通过 MIPI 接口连接主控
- 该 CIS 为常规 RGB Bayer 传感器，非高光谱 CIS
