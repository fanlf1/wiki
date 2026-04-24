#!/bin/bash
# MCU规格书下载脚本
# 使用方法：./download_datasheets.sh

# 创建厂商目录
MCU_DIR="/mnt/c/code/health/cgm/vendor/MCU"
cd "$MCU_DIR"

# 创建子目录
mkdir -p Nordic ST TI Silicon_Labs Infineon NXP Microchip Espressif GigaDevice Huada FudanMicro Telink Realtek

echo "========================================="
echo "MCU规格书下载脚本"
echo "========================================="
echo ""
echo "注意事项："
echo "1. 部分厂商需要注册账号才能下载"
echo "2. 可以使用curl或wget下载"
echo "3. 建议使用代理访问国外网站"
echo ""
echo "========================================="
echo ""

# ============================================================================
# Nordic Semiconductor
# ============================================================================
echo "下载Nordic MCU规格书..."

# nRF5340
echo "  - nRF5340..."
curl -L "https://infocenter.nordicsemi.com/pdf/nRF5340_PS_v1.1.pdf" -o Nordic/nRF5340_Datasheet.pdf 2>/dev/null || \
wget -O Nordic/nRF5340_Datasheet.pdf "https://infocenter.nordicsemi.com/pdf/nRF5340_PS_v1.1.pdf" 2>/dev/null || \
echo "    ⚠️  自动下载失败，请手动下载："
echo "    https://www.nordicsemi.com/products/nrf5340#downloads"

# nRF52840
echo "  - nRF52840..."
curl -L "https://infocenter.nordicsemi.com/pdf/nRF52840_PS_v1.1.pdf" -o Nordic/nRF52840_Datasheet.pdf 2>/dev/null || \
wget -O Nordic/nRF52840_Datasheet.pdf "https://infocenter.nordicsemi.com/pdf/nRF52840_PS_v1.1.pdf" 2>/dev/null || \
echo "    ⚠️  自动下载失败，请手动下载"

# nRF52832
echo "  - nRF52832..."
curl -L "https://infocenter.nordicsemi.com/pdf/nRF52832_PS_v1.5.pdf" -o Nordic/nRF52832_Datasheet.pdf 2>/dev/null || \
wget -O Nordic/nRF52832_Datasheet.pdf "https://infocenter.nordicsemi.com/pdf/nRF52832_PS_v1.5.pdf" 2>/dev/null || \
echo "    ⚠️  自动下载失败，请手动下载"

# ============================================================================
# STMicroelectronics
# ============================================================================
echo ""
echo "下载ST MCU规格书..."
echo "  ⚠️  ST需要手动下载，请访问："
echo "    https://www.st.com/en/microcontrollers-microprocessors/stm32wb-series.html"
echo "    https://www.st.com/en/microcontrollers-microprocessors/stm32-ultra-low-power-mcus.html"

# ============================================================================
# Texas Instruments
# ============================================================================
echo ""
echo "下载TI MCU规格书..."

# CC2652R
echo "  - CC2652R..."
curl -L "https://www.ti.com/lit/pdf/swrs206d" -o TI/CC2652R_Datasheet.pdf 2>/dev/null || \
wget -O TI/CC2652R_Datasheet.pdf "https://www.ti.com/lit/pdf/swrs206d" 2>/dev/null || \
echo "    ⚠️  自动下载失败，请手动下载："
echo "    https://www.ti.com/product/CC2652R#technical-documents"

# CC2651R
echo "  - CC2651R..."
curl -L "https://www.ti.com/lit/pdf/swrs206b" -o TI/CC2651R_Datasheet.pdf 2>/dev/null || \
wget -O TI/CC2651R_Datasheet.pdf "https://www.ti.com/lit/pdf/swrs206b" 2>/dev/null || \
echo "    ⚠️  自动下载失败，请手动下载："
echo "    https://www.ti.com/product/CC2651R#technical-documents"

# ============================================================================
# Silicon Labs
# ============================================================================
echo ""
echo "下载Silicon Labs MCU规格书..."
echo "  ⚠️  需要注册账号，请访问："
echo "    https://www.silabs.com/wireless/blue-gecko-series-2-chips"
echo "    https://www.silabs.com/documents/public/data-sheets"

# ============================================================================
# Infineon
# ============================================================================
echo ""
echo "下载Infineon MCU规格书..."
echo "  ⚠️  需要注册账号，请访问："
echo "    https://www.infineon.com/cms/en/product/microcontroller/psoc-6-mcu/"
echo "    https://www.infineon.com/dgdl/Infineon-PSoC_6_MCU"

# ============================================================================
# NXP
# ============================================================================
echo ""
echo "下载NXP MCU规格书..."
echo "  ⚠️  请访问以下链接下载："
echo "    https://www.nxp.com/products/wireless/kw-ble-bluetooth-low-energy-connection:KWN343050"
echo "    https://www.nxp.com/docs/en/data-sheet/KW38_datasheet.pdf"

# ============================================================================
# Microchip
# ============================================================================
echo ""
echo "下载Microchip MCU规格书..."
echo "  - SAM W25..."
curl -L "https://ww1.microchip.com/downloads/en/DeviceDoc/70005327a.pdf" -o Microchip/SAM_W25_Datasheet.pdf 2>/dev/null || \
wget -O Microchip/SAM_W25_Datasheet.pdf "https://ww1.microchip.com/downloads/en/DeviceDoc/70005327a.pdf" 2>/dev/null || \
echo "    ⚠️  自动下载失败，请手动下载"

# ============================================================================
# Espressif
# ============================================================================
echo ""
echo "下载Espressif MCU规格书..."

# ESP32-C3
echo "  - ESP32-C3..."
curl -L "https://www.espressif.com/sites/default/files/documentation/esp32-c3_datasheet_en.pdf" -o Espressif/ESP32-C3_Datasheet.pdf 2>/dev/null || \
wget -O Espressif/ESP32-C3_Datasheet.pdf "https://www.espressif.com/sites/default/files/documentation/esp32-c3_datasheet_en.pdf" 2>/dev/null || \
echo "    ⚠️  自动下载失败，请手动下载："
echo "    https://www.espressif.com/en/products/socs/esp32-c3/documents"

# ESP32-H2
echo "  - ESP32-H2..."
curl -L "https://www.espressif.com/sites/default/files/documentation/esp32-h2_datasheet_en.pdf" -o Espressif/ESP32-H2_Datasheet.pdf 2>/dev/null || \
wget -O Espressif/ESP32-H2_Datasheet.pdf "https://www.espressif.com/sites/default/files/documentation/esp32-h2_datasheet_en.pdf" 2>/dev/null || \
echo "    ⚠️  自动下载失败，请手动下载："
echo "    https://www.espressif.com/en/products/socs/esp32-h2/documents"

# ============================================================================
# 兆易创新（GigaDevice）
# ============================================================================
echo ""
echo "下载兆易创新MCU规格书..."
echo "  ⚠️  请访问中文官网下载："
echo "    https://www.gigadevice.com/microcontroller/gd32vw5530"
echo "    https://www.gigadevice.com/product/mcu/gd32vw5530"

# ============================================================================
# 华大半导体
# ============================================================================
echo ""
echo "下载华大MCU规格书..."
echo "  ⚠️  请访问官网下载："
echo "    http://www.huadasemi.com/channel.aspx?SID=109&id=108"

# ============================================================================
# 复旦微电子
# ============================================================================
echo ""
echo "下载复旦微MCU规格书..."
echo "  ⚠️  请访问官网下载："
echo "    http://www.fmstore.com.cn/channel.aspx?SID=109&id=108"

# ============================================================================
# 泰凌微（Telink）
# ============================================================================
echo ""
echo "下载泰凌微MCU规格书..."
echo "  ⚠️  请访问官网下载："
echo "    http://www.telink-semi.com/"

# ============================================================================
# Realtek
# ============================================================================
echo ""
echo "下载Realtek MCU规格书..."
echo "  ⚠️  请访问官网下载："
echo "    https://www.realtek.com/en/products/communications-network-ics/item/rtl8762c"

# ============================================================================
# 总结
# ============================================================================
echo ""
echo "========================================="
echo "下载完成！"
echo "========================================="
echo ""
echo "已下载的规格书保存在："
echo "  $MCU_DIR"
echo ""
echo "未自动下载的厂商需要手动访问官网下载"
echo ""
echo "快速下载链接汇总："
echo ""
echo "【Nordic】"
echo "  nRF5340: https://www.nordicsemi.com/Products/nRF5340"
echo "  nRF52840: https://www.nordicsemi.com/Products/nRF52840"
echo "  nRF52832: https://www.nordicsemi.com/Products/nRF52832"
echo ""
echo "【ST】"
echo "  STM32WB: https://www.st.com/en/microcontrollers-microprocessors/stm32-wireless-mcus.html"
echo "  STM32L4: https://www.st.com/en/microcontrollers-microprocessors/stm32l4-series.html"
echo ""
echo "【TI】"
echo "  CC2652R: https://www.ti.com/product/CC2652R"
echo "  CC2651R: https://www.ti.com/product/CC2651R"
echo ""
echo "【Silicon Labs】"
echo "  EFR32BG: https://www.silabs.com/wireless"
echo ""
echo "【Espressif】"
echo "  ESP32-C3: https://www.espressif.com/en/products/socs/esp32-c3/documents"
echo "  ESP32-H2: https://www.espressif.com/en/products/socs/esp32-h2/documents"
echo ""
echo "【兆易创新】"
echo "  GD32VW5530: https://www.gigadevice.com/microcontroller/gd32vw5530"
echo ""
echo "========================================="
