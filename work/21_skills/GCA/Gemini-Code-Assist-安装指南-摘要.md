---
title: Gemini Code Assist 安装指南摘要
type: source
created: 2026-05-19
updated: 2026-05-19
sources: 2
tags: [Gemini, Google, AI编程, Motorola, 工具配置, 中国团队, 代理]
---

## 源文件

- 原始文件（英文）：`work/2_skills/GCA/Gemini Code Assist - Installation Guide.md`
- 原始文件（中国版）：`work/2_skills/GCA/Gemini Code Assist Installation China Guide - Living.md`
- 性质：Motorola/联想内部部署的 Google Gemini Code Assist 企业版安装指南

## 概述

Gemini Code Assist (GCA) 是 Google 的 AI 代码助手，Motorola 内部以 GCP 项目 `moto-gemini-assist` 统一部署。使用前需申请 license。

**整体流程**：申请权限 → 配置代理 → 安装 CLI/IDE → Google 账号登录

## License 权限

1. 阅读 [安全政策与最佳实践](https://docs.google.com/document/d/1kdRPKtnE9K28ryiv0_hlFNWOPUmIaATds7rL3duY6-M/edit?tab=t.0)
2. 填写 [申请表](https://docs.google.com/forms/d/e/1FAIpQLSe5-UODbfD8B0ibya6CrXPLBY-EwNtz0V79_3vkrnpp2tertQ/viewform)
3. 等待邮件通知（无 ETA，连续 10 天未使用会回收 license）
4. 验证：访问 [moto-gemini-assist 控制台](https://console.cloud.google.com/welcome?project=moto-gemini-assist) 能看到该项目

**重要规则**：
- 只能使用 **Business 版本**，不是个人版
- 只能通过 **moto-gemini-assist** 项目使用
- License 仅限本人，只能用于 Motorola/Lenovo 项目
- 连续 10 天未使用会被禁用并重新分配

## 代理配置（中国团队 — 重点）

### 代理地址

| 员工类型 | 系统代理 (PAC) | IDE/VSCode 代理 |
|---------|---------------|----------------|
| 正式员工 (Lenovo) | `https://netops.lenovo.com/download/lenovo_proxy.pac` | `http://hkhkg01proxy02.lenovo.com:3128` |
| 正式员工 (Moto) | `https://netops.lenovo.com/download/moto_proxy.pac` | `http://hkhkg01proxy02.lenovo.com:3128` |
| 正式员工 (US) | `https://netops.lenovo.com/download/lenovo_proxy.us.pac` | `http://va32proxy02.lenovo.com:3128` |
| Onsite 员工 | `https://netops.lenovo.com/download/hk_MBG_ODM_proxy.pac` | `http://hkmbgodmproxy.lenovo.com:3128` |

## 安装步骤 — WSL 环境

### 1. 安装 NodeJS（v22+）

```bash
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo bash -
sudo apt-get install -y nodejs
```

验证：`node --version`（需要 ≥ 22）

### 2. 安装 Gemini CLI

```bash
mkdir -p ~/.npm-global
npm config set prefix '~/.npm-global'
npm config set registry https://toolrepo.lenovo.com/repository/npm/
npm config set strict-ssl false
npm install -g @google/gemini-cli
```

完成后没有 error 即成功（warning 可忽略）。

### 3. 配置代理（WSL 内）

根据员工类型下载代理配置：

```bash
# 正式员工 - Lenovo
wget --no-check-certificate -O ~/gemini_proxy.conf https://work.lenovo.com/files/others/proxy/proxy_lenovo_gemini.conf

# 正式员工 - Moto
wget --no-check-certificate -O ~/gemini_proxy.conf https://work.lenovo.com/files/others/proxy/proxy_moto_gemini.conf

# 正式员工 - US
wget --no-check-certificate -O ~/gemini_proxy.conf https://work.lenovo.com/files/others/proxy/proxy_lenovo_us_gemini.conf

# Onsite 员工
wget --no-check-certificate -O ~/gemini_proxy.conf https://work.lenovo.com/files/others/proxy/proxy_hk_MBG_ODM_gemini.conf
```

写入 `.bashrc`：

```bash
echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.bashrc
echo 'source ~/gemini_proxy.conf' >> ~/.bashrc
```

关闭并重新打开 WSL 终端。

### 4. 运行 Gemini CLI

```bash
cd <项目目录>
gemini
```

首次登录选 **"Login with Google"**，用 Motorola Google 账号。登录成功后按 **R** 重启。

### 5. 配置遥测（必做，否则可能被禁用）

**5a.** Windows 侧安装 [gcloud CLI](https://docs.cloud.google.com/sdk/docs/install-sdk)

**5b.** Windows cmd 中设置代理并登录：
```cmd
set HTTPS_PROXY=http://hkhkg01proxy02.lenovo.com:3128
gcloud auth application-default login
```

**5c.** 创建 `C:\Users\<用户名>\.gemini\settings.json`：
```json
{
  "telemetry": {
    "enabled": true,
    "target": "gcp"
  }
}
```

### 6. 验证

在 Gemini CLI 中运行 `/about`，确认：
- Auth Method: **OAuth**
- User Email: **Motorola 邮箱**
- GCP Project: **moto-gemini-assist**

## 安装步骤 — Windows 本地（CMD / PowerShell）

### Gemini CLI

```cmd
:: 配置公司内部源
npm config set registry https://toolrepo.lenovo.com/repository/npm/
npm config set strict-ssl false
npm install -g @google/gemini-cli
```

**启动脚本**（已内置代理，下载后双击运行）：

| 员工类型 | CMD (.bat) | PowerShell (.ps1) |
|---------|-----------|-------------------|
| Lenovo | [start_proxy_lenovo_gemini.bat](https://work.lenovo.com/files/others/proxy/start_proxy_lenovo_gemini.bat) | [start_proxy_lenovo_gemini.ps1](https://work.lenovo.com/files/others/proxy/start_proxy_lenovo_gemini.ps1) |
| Moto | [Start_proxy_moto_gemini.bat](https://work.lenovo.com/files/others/proxy/Start_proxy_moto_gemini.bat) | [start_proxy_moto_gemini.ps1](https://work.lenovo.com/files/others/proxy/start_proxy_moto_gemini.ps1) |
| Lenovo US | [start_proxy_lenovo_us_gemini.bat](https://work.lenovo.com/files/others/proxy/start_proxy_lenovo_us_gemini.bat) | [start_proxy_lenovo_us_gemini.ps1](https://work.lenovo.com/files/others/proxy/start_proxy_lenovo_us_gemini.ps1) |
| Onsite | [start_proxy_hk_MBG_ODM_Gemini.bat](https://work.lenovo.com/files/others/proxy/start_proxy_hk_MBG_ODM_Gemini.bat) | [start_proxy_hk_MBG_ODM_gemini.ps1](https://work.lenovo.com/files/others/proxy/start_proxy_hk_MBG_ODM_gemini.ps1) |

PowerShell 如果闪退，新建 `start_gemini.ps1` 将脚本内容粘贴进去运行。

## VSCode 配置（Windows 侧）

### 1. 安装扩展
`Ctrl+Shift+X` → 搜索 **"Gemini Code Assist"** → 安装

### 2. 配置代理和项目
`F1` → 搜索 `user settings.json`，添加：

```json
{
    "geminicodeassist.project": "moto-gemini-assist",
    "http.proxy": "http://hkhkg01proxy02.lenovo.com:3128",
    "http.noProxy": [
        "main.vscode-cdn.net",
        "az764295.vo.msecnd.net",
        ".mot.com",
        ".lenovo.com",
        ".motorola.com",
        "10.0.0.0/8",
        "100.64.0.0/11",
        "127.0.0.1",
        "127.0.1.1",
        "localhost"
    ]
}
```

保存后重启 VSCode。点击左侧 Gemini 图标 → 登录 → 选择项目 **moto-gemini-assist**。

VSCode 用户还需在 GCA 设置中确认 Telemetry 已启用。

## Android Studio 配置（Windows 侧）

1. File → Settings → 搜索 **proxy**
2. 选 "Automatic proxy configuration URL"，输入系统代理 PAC 地址
3. OK → 重启 AS
4. 点击右侧 Gemini 面板 → 登录 → 选择 **Business** → 选择项目 **moto-gemini-assist**

如果 Gemini 选项不出现，退出登录并重启 IDE。

## 工作站（远程 Ubuntu 服务器）

工作站内配置方式与 WSL 类似，但代理认证方式不同。详见中国版指南原文。

## WSL 网络优化

如果 WSL 中 Gemini 长时间无响应，在 `C:\Users\<用户名>\` 创建 `.wslconfig`：

```ini
[wsl2]
networkingMode=mirrored
dnsTunneling=true
firewall=true
autoProxy=true
```

然后在 Windows cmd 执行 `wsl --shutdown`，重新打开 WSL。

## 常见问题

| 问题 | 解决方案 |
|------|----------|
| Agent Mode 不工作 | 检查 Gemini CLI 和 telemetry 配置 |
| Android Studio 无 GCA 选项 | 升级 AS 版本；退出登录后重启 IDE |
| 认证失败 | 确认用 "Login with Google"，GCP 项目为 moto-gemini-assist |
| 慢/崩溃 | 创建 `.aiexclude` 文件排除 build 输出等大目录 |
| 选不到 GCP 项目 | 确认已填申请表并收到 license 激活邮件 |
| WSL 长时间无响应 | 配置 `.wslconfig` 使用 mirrored 网络模式 |
| PowerShell 脚本闪退 | 新建 `.ps1` 文件粘贴脚本内容，或检查执行策略 |

## CLI 的优势

1. 可设置自动化任务
2. 稳定性更好，特别是 JIRA MCP
3. 可设置 Yolo 模式

## 相关资源

- [安全政策与最佳实践](https://docs.google.com/document/d/1kdRPKtnE9K28ryiv0_hlFNWOPUmIaATds7rL3duY6-M/edit?usp=sharing)
- [中国团队代理配置指南](https://docs.google.com/document/d/1iuaWcnVpudD2MW7OZPH3f2c9OBI1Iv2LuvFYjMmyzX4/edit?tab=t.0)
- [Motorola MCP Server 配置指南](https://docs.google.com/document/d/1B0wyZBLgh819eYDtpV2CssybgPc7gpOB8Q2riUOiohE/edit?usp=sharing)
- [Gemini CLI Extensions](https://docs.google.com/document/d/1Ht-0bIFOeXunz4C3OyWu25lTeLfbHBT6GhWuvcmVQas/edit?usp=sharing)
- [GCA 安装录播视频](https://lenovo-my.sharepoint.com/:v:/r/personal/shenxt3_lenovo_com/Documents/Recordings/%E4%BB%8E%E2%80%9C%E8%A3%85%E4%B8%8D%E4%B8%8A%E2%80%9D%E5%88%B0%E2%80%9C%E9%A9%AC%E4%B8%8A%E8%83%BD%E7%94%A8%E2%80%9D%EF%BC%9AGCA%20%E4%B8%80%E6%AC%A1%E9%85%8D%E5%A5%BD%E5%8D%B3%E5%BC%80%E5%86%99-20260323_110049-%E4%BC%9A%E8%AE%AE%E8%AE%B0%E5%BD%95.mp4)
- [GCA Metrics Dashboard](https://lookerstudio.google.com/reporting/c60528f2-b09c-464d-94fc-ce42bf2bcae8/page/ylVtF)
- [Exclude files from GCA scanning](https://docs.google.com/document/d/1Ht-0bIFOeXunz4C3OyWu25lTeLfbHBT6GhWuvcmVQas/edit?usp=sharing)
- 支持 CR：[Create Jira CR (AI Tools/GCA)](https://idart.mot.com/secure/CreateIssue.jspa?pid=43185&issuetype=10)
- 指南入口：[work.lenovo.com](https://work.lenovo.com) → AI
