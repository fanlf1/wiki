---
title: Espressif乐鑫科技
type: vendor
created: 2026-05-26
updated: 2026-05-27
status: 跟踪中
tags: [供应商, SoC, ESP32, IoT, RISC-V, 开源生态, WiFi, BLE]
---

# Espressif乐鑫科技

## 一句话定位
> 全球IoT Wi-Fi/蓝牙MCU龙头，ESP32系列以开源生态著称；ESP32-P4集成MIPI CSI接口，是连接高光谱CIS传感器的候选主控。

---

## ① 公司档案

| 项目 | 内容 |
|------|------|
| 公司全称 | 乐鑫信息科技（上海）股份有限公司 |
| 英文名 | Espressif Systems (Shanghai) Co., Ltd. |
| 成立时间 | 2008年 |
| 总部 | 上海 |
| 性质 | Fabless芯片设计 |
| 上市 | 科创板 688018 |
| 创始人 | Teo Swee Ann（张瑞安） |
| 员工规模 | 约 1,000 人 |
| 主营 | IoT Wi-Fi/蓝牙MCU + AIoT平台 |
| 官网 | https://www.espressif.com/ |

---

## ② 产品与技术体系

### 技术路线

乐鑫基于**开源 RISC-V 指令集**自研 32 位 MCU 架构，以 **"处理 + 连接"** 为核心方向：

```
连接层：Wi-Fi (4/5/6/6E)、蓝牙 (BLE 5.0)、Thread/Zigbee (IEEE 802.15.4)
处理层：RISC-V MCU + AI向量扩展 + 多媒体处理
平台层：ESP-IDF + ESP RainMaker（设备管理云）+ ESP-Matter
```

与竞品的核心差异：**无线连接内置**（不外挂）、**自研ESP-IDF生态**（非依赖第三方RTOS）、**RISC-V开源架构**（降低授权成本）。

### 产品矩阵

| 系列 | 代表型号 | 内核 | 连接 | 定位 | 状态 |
|------|----------|------|------|------|------|
| **经典** | ESP32 | Xtensa LX6 双核 | Wi-Fi 4 + BLE | 通用IoT | 量产（持续8年） |
| | ESP32-S2 | Xtensa LX7 单核 | Wi-Fi 4 | 安全IoT | 量产 |
| **次新（放量期）** | ESP32-C3 | RISC-V 单核 | Wi-Fi 4 + BLE 5 | 高性价比IoT | 量产 |
| | ESP32-C2 | RISC-V 单核 | Wi-Fi 4 + BLE | 极简IoT | 量产 |
| | ESP32-S3 | Xtensa LX7 双核 | Wi-Fi 5 + BLE 5 | 高性能+AI加速+语音 | 量产（增长主力） |
| **新（导入期）** | ESP32-C6 | RISC-V 单核 | Wi-Fi 6 + BLE 5 + Zigbee/Thread | 智能家居/Matter | 量产 |
| | ESP32-C5 | RISC-V 单核 | Wi-Fi 6 双频(2.4+5GHz) + BLE 5 | 高速IoT | 样品 |
| | ESP32-C61 | RISC-V 单核 | Wi-Fi 6 + BLE 5 | C6简化版 | 量产 |
| | ESP32-H2 | RISC-V 单核 | Thread/Zigbee + BLE | Matter over Thread | 量产 |
| | ESP32-P4 | RISC-V 双核 | **无无线** | 高性能多媒体+MIPI CSI | 样品 |
| 在研 | Wi-Fi 7路由器芯片 | — | Wi-Fi 7 | 路由器/网关 | 预研 |

### ESP32-P4（与我们的关键型号）

> 乐鑫首款**不带无线功能**的高性能SoC，标志着乐鑫从IoT通信芯片向边缘计算/多媒体处理器扩展。

| 参数 | 规格 |
|------|------|
| 内核 | 双核 RISC-V (ESP-RV32)，400MHz |
| 摄像头接口 | **MIPI CSI-2**（1/2/4 lane） |
| 显示接口 | MIPI DSI |
| 图像处理 | ISP（图像信号处理）、H.264编码 |
| AI能力 | 向量指令扩展 |
| GPIO | **55个**可编程GPIO（乐鑫管脚最多的芯片） |
| 封装 | QFN 7×7 / 8×8 |
| 发布 | 2024年2月 |

**对我们的价值**：MIPI CSI接口可直接连接高光谱CIS模组（如睿芯微），ISP可做初步图像处理，RISC-V双核跑AI推理。

### ESP32-S3（增长主力）

| 参数 | 规格 |
|------|------|
| 内核 | Xtensa LX7 双核，240MHz |
| AI加速 | 向量指令扩展 |
| 无线 | Wi-Fi 5 + BLE 5.0 |
| 语音 | 离线语音唤醒/识别，最多200条命令词 |
| 定位 | AIoT终端、语音交互、屏幕设备 |

---

## ③ 市场与生态

| 维度 | 内容 |
|------|------|
| **行业地位** | 全球Wi-Fi MCU出货量**突破10亿颗**；IoT Wi-Fi芯片全球前五 |
| **核心壁垒** | ESP-IDF自研框架 + 全球开发者社区 + 产品矩阵完整度 |
| **主要客户** | 智能家居厂商、消费电子、工业IoT（具体客户未公开） |
| **营收增长** | 2024年营收同比+40%，净利润同比+149% |
| **增长驱动** | 次新品C3/C2/S3放量 + 新品P4/C6/C5导入 |

### 竞品对比

| 维度 | 乐鑫 ESP32 | ST STM32 | Nordic nRF52 | 高通 QCS | 恒玄 BES |
|------|-----------|----------|-------------|---------|---------|
| **无线内置** | ✅ Wi-Fi+BLE | ❌ 需外挂 | ✅ BLE（无Wi-Fi） | ✅ 全集成 | ✅ BLE |
| **价格** | $1-5 | $2-15 | $3-8 | $10+ | $3-8 |
| **生态** | ESP-IDF（自研） | STM32Cube | nRF Connect | QC SDK | BES SDK |
| **开源社区** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐ | ⭐⭐ |
| **低功耗** | ⚠️ 一般 | ✅ 优秀 | ✅ 最优 | ⚠️ | ✅ |
| **AI能力** | ⚠️ 基础 | ⚠️ 基础 | — | ✅ 强 | ⚠️ |
| **工业级** | ⚠️ | ✅ 最强 | ✅ | ✅ | ⚠️ |
| **摄像头支持** | ✅ P4有MIPI CSI | ⚠️ 部分型号 | — | ✅ | — |

### 风险因素

- **低功耗是弱项**：ESP32系列功耗高于Nordic和ST，不适合纽扣电池或长期待机场景
- **工业级场景弱**：在工控、车规等高可靠性领域不如ST
- **竞争加剧**：国产Wi-Fi MCU厂商（瑞昱、联发科等）价格压力大

---

## ④ 与我们的关系

| 维度 | 内容 |
|------|------|
| **关系类型** | 潜在SoC供应商（原型开发/主控选型） |
| **关联度** | 中 |
| **关注重点** | ESP32-P4的MIPI CSI接口是连接高光谱CIS的候选方案 |
| **潜在用途** | 戒指原型开发（ESP32-S3做BLE通信）或外挂高光谱模组（ESP32-P4做图像处理） |

**具体应用场景**：
- **原型验证阶段**：ESP32-S3 + 外挂CIS模组，快速搭建血糖检测原型，利用ESP-IDF生态加速开发
- **产品化选型**：ESP32-P4 + MIPI CIS，做图像采集+边缘AI推理，但需评估功耗是否满足戒指形态
- **备选方案**：ESP32-C6做BLE+Wi-Fi双模通信，作为戒指与手机桥接

**主要顾虑**：
- ESP32系列功耗偏高（vs Nordic nRF52、恒玄BES），戒指15-22mAh电池能否支撑待疑
- ESP32-P4不带无线，需要搭配BLE芯片使用，增加BOM复杂度

---

## ⑤ 合作评估

> 当前处于跟踪阶段，未进入商务评估。

---

## 原始资料

- 乐鑫官网：https://www.espressif.com/zh-hans
- 产品里程碑：https://www.espressif.com/zh-hans/company/about-us/milestones
- ESP32-C61量产公告：https://www.espressif.com/zh-hans/News/C61_Mass_Production
- 乐鑫2025年年度报告：https://www.espressif.com/sites/default/files/financial/乐鑫科技%202025%20年年度报告.pdf
- 券商研报（东方财富）：https://pdf.dfcfw.com/pdf/H3_AP202503141644368218_1.pdf

## 相关页面

- [[../README|供应商索引]]
- [[../恒玄科技/恒玄科技|恒玄科技]]（竞品对比：BLE SoC）
- [[../高通/高通|高通]]（竞品对比：高端SoC）
- [[../../04_research/多标志物-光谱检测/|多标志物光谱检测]]（ESP32-P4 + 高光谱CIS方案）
