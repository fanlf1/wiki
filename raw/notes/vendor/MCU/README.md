# MCU规格书下载指南

## 目录说明

```
MCU/
├── 低功耗MCU选型对比报告-智能戒指应用.md  # 详细的MCU对比报告
├── download_datasheets.sh                 # 规格书下载脚本
├── README.md                              # 本文件
├── Nordic/                                # Nordic MCU规格书
├── ST/                                    # ST MCU规格书
├── TI/                                    # TI MCU规格书
├── Silicon_Labs/                          # Silicon Labs MCU规格书
├── Infineon/                              # Infineon MCU规格书
├── NXP/                                   # NXP MCU规格书
├── Microchip/                             # Microchip MCU规格书
├── Espressif/                             # Espressif MCU规格书
├── GigaDevice/                            # 兆易创新MCU规格书
├── Huada/                                 # 华大MCU规格书
├── FudanMicro/                            # 复旦微MCU规格书
├── Telink/                                # 泰凌微MCU规格书
└── Realtek/                               # Realtek MCU规格书
```

## 快速下载链接

### 国外厂商

#### Nordic Semiconductor（挪威）
- **nRF5340**: https://www.nordicsemi.com/products/nrf5340#downloads
  - Datasheet: https://infocenter.nordicsemi.com/pdf/nRF5340_PS_v1.1.pdf
- **nRF52840**: https://www.nordicsemi.com/products/nrf52840#downloads
  - Datasheet: https://infocenter.nordicsemi.com/pdf/nRF52840_PS_v1.1.pdf
- **nRF52832**: https://www.nordicsemi.com/products/nRF52832#downloads
  - Datasheet: https://infocenter.nordicsemi.com/pdf/nRF52832_PS_v1.5.pdf

#### STMicroelectronics（瑞士/法国）
- **STM32WB系列**: https://www.st.com/en/microcontrollers-microprocessors/stm32-wireless-mcus.html
- **STM32L系列**: https://www.st.com/en/microcontrollers-microprocessors/stm32-ultra-low-power-mcus.html
- ⚠️ 需要注册ST账号才能下载

#### Texas Instruments（美国）
- **CC2652R**: https://www.ti.com/product/CC2652R#technical-documents
  - Datasheet: https://www.ti.com/lit/pdf/swrs206d
- **CC2651R**: https://www.ti.com/product/CC2651R#technical-documents
  - Datasheet: https://www.ti.com/lit/pdf/swrs206b
- **MSP432**: https://www.ti.com/product/MSP432P401R#technical-documents

#### Silicon Labs（美国）
- **EFR32BG22**: https://www.silabs.com/wireless/blue-gecko-series-2-chips/efr32bg22
- **EFR32BG24**: https://www.silabs.com/wireless/blue-gecko-series-2-chips/efr32bg24
- **EFR32BG27**: https://www.silabs.com/wireless/blue-gecko-series-2-chips/efr32bg27
- ⚠️ 需要注册Silicon Labs账号

#### Infineon（德国）
- **PSoC 6系列**: https://www.infineon.com/cms/en/product/microcontroller/psoc-6-mcu/
- **CYW20820**: https://www.infineon.com/cms/en/product/wireless-connectivity/airoc-ble-clocks/bt-ble-wifi-combos/cyw20820/
- ⚠️ 需要注册Infineon账号

#### NXP（荷兰）
- **KW38**: https://www.nxp.com/products/wireless/kw-ble-bluetooth-low-energy-connection:KWN343050
- **KW39**: https://www.nxp.com/products/wireless/kw-ble-bluetooth-low-energy-connection:KWN343050
- Datasheet: https://www.nxp.com/docs/en/data-sheet/KW38_datasheet.pdf

#### Microchip（美国）
- **SAM W系列**: https://www.microchip.com/en-us/products/wireless-connectivity/bluetooth/bluetooth-le-devices
- **SAM L系列**: https://www.microchip.com/en-us/products/microcontrollers-and-mpus/32-bit-mcus/arm-cortex-m0-plus/sam-l0x-series

#### Espressif（中国）
- **ESP32-C3**: https://www.espressif.com/en/products/socs/esp32-c3/documents
  - Datasheet: https://www.espressif.com/sites/default/files/documentation/esp32-c3_datasheet_en.pdf
  - ✅ 可直接下载
- **ESP32-H2**: https://www.espressif.com/en/products/socs/esp32-h2/documents
  - Datasheet: https://www.espressif.com/sites/default/files/documentation/esp32-h2_datasheet_en.pdf
  - ✅ 可直接下载

### 国内厂商

#### 兆易创新（GigaDevice）
- **GD32VW5530**: https://www.gigadevice.com/microcontroller/gd32vw5530
- **GD32L系列**: https://www.gigadevice.com/microcontroller/gd32l23-series
- ⚠️ 需要访问中文官网下载

#### 华大半导体
- **HC32L系列**: http://www.huadasemi.com/product.aspx?cid=44&sid=3
- ⚠️ 需要注册账号

#### 复旦微电子
- **FM33LE0系列**: http://www.fmstore.com.cn/
- ⚠️ 需要联系销售或注册账号

#### 泰凌微电子（Telink）
- **TLSR825x系列**: http://www.telink-semi.com/
- ⚠️ 需要联系销售

#### 杰发科技（Atek）
- **ATEK60系列**: http://www.atek.com.cn/
- ⚠️ 需要联系销售

#### 中颖电子
- **SH79系列**: http://www.sinowealth.com/
- ⚠️ 需要联系销售

## 自动下载脚本

使用方法：

```bash
# 进入MCU目录
cd /mnt/c/code/health/cgm/vendor/MCU

# 运行下载脚本
./download_datasheets.sh
```

脚本会尝试自动下载部分可公开下载的规格书。

## 手动下载建议

### 对于需要注册的厂商

1. **STMicroelectronics**:
   - 注册地址：https://my.st.com/
   - 注册免费，只需邮箱
   - 建议使用工作邮箱

2. **Texas Instruments**:
   - 注册地址：https://www.ti.com/login/
   - 注册免费，可下载数据手册
   - 建议使用工作邮箱

3. **Silicon Labs**:
   - 注册地址：https://www.silabs.com/register
   - 注册免费，可下载数据手册
   - 建议使用工作邮箱

4. **Infineon**:
   - 注册地址：https://www.infineon.com/en/login.html
   - 注册免费，可下载数据手册
   - 建议使用工作邮箱

5. **NXP**:
   - 注册地址：https://www.nxp.com/signup
   - 注册免费，可下载数据手册
   - 建议使用工作邮箱

### 对于国内厂商

建议直接联系销售或访问官网：

1. **兆易创新**: https://www.gigadevice.com/
   - 电话：+86-755-28643188
   - 邮箱：sales@gigadevice.com

2. **华大半导体**: http://www.huadasemi.com/
   - 需要通过代理商获取

3. **复旦微电子**: http://www.fmstore.com.cn/
   - 需要通过代理商获取

4. **泰凌微**: http://www.telink-semi.com/
   - 电话：+86-21-50275800
   - 邮箱：sales@telink-semi.com

## 推荐下载优先级

### 第一优先级（首选方案）

1. **Nordic nRF5340**
   - 智能戒指首选
   - 功耗+性能最佳平衡
   - 文档完善

2. **TI CC2652R**
   - 功耗最低
   - 性价比高
   - 封装小

3. **Silicon Labs EFR32BG27**
   - 超小封装
   - 适合女款戒指

### 第二优先级（备选方案）

4. **STM32WB6**
   - ST生态好
   - 国产替代多

5. **GD32VW5530**
   - 国产化首选
   - RISC-V架构

6. **ESP32-H2**
   - 极致成本
   - 快速原型

## 常用下载工具

### 浏览器下载
直接点击链接，使用浏览器下载

### 命令行工具

```bash
# 使用curl
curl -O [URL]

# 使用wget
wget [URL]

# 示例
curl -O https://www.espressif.com/sites/default/files/documentation/esp32-c3_datasheet_en.pdf
```

### 下载工具

- **Windows**: Internet Download Manager (IDM)
- **Linux/Mac**: wget, curl
- **跨平台**: Free Download Manager

## 注意事项

1. **文件大小**: MCU规格书通常1-10 MB
2. **下载时间**: 视网络情况，通常几秒到几分钟
3. **版本**: 优先下载最新版本的规格书
4. **格式**: 通常为PDF格式
5. **语言**: 英文为主，部分有中文版本

## 已成功下载的规格书

运行下载脚本后，以下规格书可能会自动下载：

- ✅ ESP32-C3 Datasheet (Espressif)
- ✅ ESP32-H2 Datasheet (Espressif)
- ✅ SAM W25 Datasheet (Microchip)

需要手动下载的厂商：

- ⚠️ Nordic (需要访问InfoCenter)
- ⚠️ ST (需要注册账号)
- ⚠️ TI (部分需要登录)
- ⚠️ Silicon Labs (需要注册账号)
- ⚠️ Infineon (需要注册账号)
- ⚠️ NXP (可直接下载部分)
- ⚠️ 国内厂商 (需要联系销售)

## 下载后验证

下载完成后，可以检查文件：

```bash
# 查看已下载的文件
ls -lh */*Datasheet.pdf

# 统计文件数量
find . -name "*Datasheet.pdf" | wc -l

# 查看文件总大小
du -sh .
```

## 问题排查

### 下载失败

1. **网络问题**:
   - 使用代理或VPN
   - 尝试在不同时间段下载

2. **权限问题**:
   ```bash
   chmod +w ./厂商目录
   ```

3. **空间不足**:
   ```bash
   df -h  # 查看磁盘空间
   ```

### 文件损坏

重新下载损坏的文件即可。

---

**最后更新**: 2026-04-15
**维护者**: 小清
