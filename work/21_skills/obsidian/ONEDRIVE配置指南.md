# Obsidian + OneDrive 同步配置指南

> **配置时间**：2026-04-27
> **同步方式**：OneDrive 云同步（Git作为备份）
> **适用场景**：日常笔记实时同步，手机端直接访问

---

## 一、配置方案总览

### 推荐架构

```
┌─────────────────────────────────────────────┐
│            主工作区（电脑）                   │
│         /mnt/c/code/wiki                    │
│  ├─ Git 版本控制 → GitHub（完整历史）        │
│  └─ OneDrive 同步 → 云端（实时访问）         │
└─────────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────────┐
│           OneDrive 云端                      │
│    所有设备自动同步，手机可直接访问            │
└─────────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────────┐
│          手机端（只读/轻编辑）                │
│     Obsidian 打开 OneDrive/wiki 文件夹       │
└─────────────────────────────────────────────┘
```

### 方案优势

```
✅ Git：保留完整版本历史，可回退任意版本
✅ OneDrive：实时同步，手机端零配置访问
✅ 互补：Git用于版本控制，OneDrive用于日常访问
✅ 安全：云端双备份（GitHub + OneDrive）
```

---

## 二、电脑端配置

### 方案A：自动同步脚本（推荐）

#### 1. 测试同步脚本

```bash
# 手动执行一次测试
/mnt/c/code/wiki/onedrive-sync.sh
```

#### 2. 配置自动同步

**方式1：crontab（定期自动执行）**

```bash
# 编辑crontab
crontab -e

# 添加以下行（每30分钟同步一次）
*/30 * * * * /mnt/c/code/wiki/onedrive-sync.sh >> /tmp/wiki-sync.log 2>&1

# 或者（每小时整点同步）
0 * * * * /mnt/c/code/wiki/onedrive-sync.sh >> /tmp/wiki-sync.log 2>&1
```

**方式2：手动同步（按需执行）**

```bash
# 每次编辑完笔记后手动运行
/mnt/c/code/wiki/onedrive-sync.sh
```

**方式3：Git钩子（每次commit后自动同步）**

```bash
# 创建post-commit钩子
cat > /mnt/c/code/wiki/.git/hooks/post-commit << 'EOF'
#!/bin/bash
/mnt/c/code/wiki/onedrive-sync.sh
EOF

chmod +x /mnt/c/code/wiki/.git/hooks/post-commit
```

---

### 方案B：直接在OneDrive工作（简单但需迁移）

如果你希望**完全依赖OneDrive**，可以迁移工作区：

#### 步骤1：移动Wiki到OneDrive

```bash
# 备份（以防万一）
cp -r /mnt/c/code/wiki /mnt/c/code/wiki.backup

# 移动到OneDrive
mv /mnt/c/code/wiki /mnt/c/Users/fanlf/OneDrive/wiki

# 创建符号链接（可选，保持旧路径可用）
ln -s /mnt/c/Users/fanlf/OneDrive/wiki /mnt/c/code/wiki
```

#### 步骤2：更新Git配置

```bash
cd /mnt/c/Users/fanlf/OneDrive/wiki

# 更新Git仓库路径
git remote set-url origin https://github.com/fanlf1/wiki.git

# 测试推送
git push
```

#### 步骤3：配置Obsidian

```
Obsidian设置：
├── 打开旧路径会自动重定向
└── 或手动打开：/mnt/c/Users/fanlf/OneDrive/wiki
```

---

## 三、手机端配置

### iOS（iPhone/iPad）

#### 步骤1：安装OneDrive应用

```
App Store 下载 "OneDrive"
登录你的Microsoft账号
```

#### 步骤2：下载文件到本地

**方式1：OneDrive应用内下载**

```
1. 打开OneDrive应用
2. 找到 wiki 或 wiki-readonly 文件夹
3. 长按文件夹 → "保持离线"
4. 等待下载完成
```

**方式2：Obsidian直接打开OneDrive文件**

```
1. 打开Obsidian应用
2. 点击 "打开文件夹"
3. 选择 "OneDrive"
4. 找到并选择 wiki 文件夹
```

#### 步骤3：配置自动同步

```
OneDrive应用设置：
├── 打开 "相机上传" → 保持文件最新
├── wiki文件夹 → "保持离线"
└── 确保WiFi下自动下载

注意：
- 手机端建议作为"只读"使用
- 如需编辑，编辑后OneDrive会自动同步
- 避免电脑和手机同时编辑同一文件
```

---

### Android

#### 步骤1：安装OneDrive应用

```
Google Play 下载 "OneDrive"
登录Microsoft账号
```

#### 步骤2：配置同步文件夹

```
1. 打开OneDrive应用
2. 找到 wiki 文件夹
3. 点击三个点 → "保持离线"
4. 选择同步位置（默认即可）
```

#### 步骤3：在Obsidian中打开

```
1. 打开Obsidian
2. 点击 "打开文件夹作为仓库"
3. 选择 "OneDrive"
4. 选择 wiki 文件夹
```

#### 步骤4：文件管理器直接访问（备选）

```
使用文件管理器：
├── 打开 "文件"应用（MIUI/EMUI等）
├── 选择 "OneDrive"
├── 找到 wiki 文件夹
└── 用Obsidian打开
```

---

## 四、工作流程

### 日常使用流程

```
🖥️ 电脑端（主要编辑）：
├── 编辑笔记：/mnt/c/code/wiki
├── Git提交：git add . && git commit && git push
├── OneDrive同步：onedrive-sync.sh（或自动执行）
└── 结果：GitHub + OneDrive 都已更新

📱 手机端（阅读/轻编辑）：
├── 打开前：等待OneDrive自动同步
├── 阅读：Obsidian中直接查看
├── 轻编辑：修改后OneDrive自动上传
└── 注意：避免与电脑同时编辑同一文件
```

### 协同编辑注意事项

```
✅ 推荐做法：
├── 手机端：主要阅读，少量编辑
├── 电脑端：主要工作区
└── 编辑不同文件：避免冲突

⚠️ 避免：
├── 同时编辑同一文件
├── 手机编辑时电脑端未同步
└── 离线编辑后长时间不上传
```

---

## 五、冲突处理

### OneDrive冲突文件

如果同一文件在多设备同时编辑，OneDrive会创建冲突副本：

```
文件名冲突的副本 (1).md
文件名冲突的副本 (2).md
```

#### 处理步骤

1. **不要慌**：原文件和冲突文件都保留了
2. **对比内容**：用Obsidian或文本编辑器查看差异
3. **选择版本**：保留需要的版本
4. **删除副本**：删除不需要的冲突文件
5. **同步结果**：OneDrive会自动同步删除操作

#### 避免冲突的技巧

```
├── 编辑前：先确保OneDrive已同步完成
├── 编辑时：尽量在不同设备编辑不同文件
├── 编辑后：立即保存并等待同步完成
└── 换设备前：确认OneDrive显示"最新"
```

---

## 六、高级配置

### 排除不需要同步的文件

#### Windows端OneDrive设置

```
OneDrive设置 → 同步和备份 → 管理备份
├── 排除：
│   ├── .git/（Git仓库数据）
│   ├── .obsidian/workspace.json（个人工作区）
│   ├── *.tmp（临时文件）
│   └── node_modules/（如果使用npm）
```

#### 或在同步脚本中排除（已配置）

```bash
# onedrive-sync.sh 已排除：
--exclude='.git/'
--exclude='.obsidian/workspace.json'
--exclude='*.tmp'
```

---

### OneDrive 选择性同步

如果OneDrive空间有限：

```
OneDrive设置 → 账户 → 选择文件夹
├── ✅ wiki/raw/（只同步源文件摘要）
├── ✅ wiki/wiki/（同步所有wiki内容）
├── ❌ raw/papers/（大文件PDF，不同步）
└── ❌ raw/assets/（图片等，按需同步）
```

---

## 七、性能优化

### 加快同步速度

```
1. 使用5GHz WiFi（而非2.4GHz）
2. 确保OneDrive应用在后台运行
3. 关闭"节省流量"模式
4. 大文件拆分或压缩
```

### 减少冲突

```
1. 编辑前先Pull/同步最新版本
2. 短暂编辑，快速保存
3. 避免长时间离线编辑
4. 编辑完成后等待同步完成再关闭应用
```

### 节省手机空间

```
1. OneDrive中设置"按需下载"
2. 不常用的文件夹设为"在线"
3. 定期清理本地缓存
4. 大文件（PDF等）只在线查看
```

---

## 八、故障排查

### 问题1：OneDrive不同步

```
检查：
├── 网络连接是否正常
├── OneDrive应用是否运行
├── 存储空间是否充足
└── 文件名是否包含特殊字符

解决：
1. 重启OneDrive应用
2. 手动触发同步
3. 检查OneDrive状态页面
```

### 问题2：Obsidian提示文件被外部修改

```
原因：OneDrive在后台更新了文件

解决：
1. 点击"重新加载文件"
2. 或关闭并重新打开笔记
3. 确保OneDrive同步完成后再编辑
```

### 问题3：同步速度慢

```
原因：文件数量多或网络慢

解决：
1. 检查网络速度
2. 减少同步文件数量
3. 使用rsync脚本（增量同步）
4. 升级网络带宽
```

### 问题4：冲突文件太多

```
原因：多设备同时编辑或长时间未同步

解决：
1. 停止编辑所有设备
2. 等待OneDrive完全同步
3. 手动合并冲突文件
4. 建立更好的编辑习惯
```

---

## 九、备份策略

### 三层备份机制

```
第一层：本地工作区
├── /mnt/c/code/wiki
└── 实时编辑

第二层：Git历史（GitHub）
├── 完整版本历史
├── 可回退任意版本
└── 灾难恢复

第三层：OneDrive云端
├── 实时快照
├── 手机快速访问
└── 自动版本历史
```

### 定期备份检查

```
每月检查：
├── GitHub仓库是否正常推送
├── OneDrive是否正常同步
├── 手机端是否能访问
└── 随机抽查几个文件确认一致性
```

---

## 十、快速参考

### 电脑端常用命令

```bash
# 同步到OneDrive
/mnt/c/code/wiki/onedrive-sync.sh

# Git提交并推送
cd /mnt/c/code/wiki
git add .
git commit -m "更新"
git push

# 同时执行Git和OneDrive同步
git add . && git commit -m "更新" && git push && /mnt/c/code/wiki/onedrive-sync.sh
```

### 手机端操作

```
iOS：
├── OneDrive应用 → 打开wiki文件夹
└── Obsidian → 打开OneDrive/wiki

Android：
├── OneDrive应用 → wiki → 保持离线
└── Obsidian → 打开 → OneDrive → wiki
```

---

## 十一、方案对比总结

| 特性 | Git + GitHub | OneDrive | 混合模式（推荐） |
|------|-------------|---------|-----------------|
| **版本历史** | ✅ 完整历史 | ❌ 有限版本 | ✅ 完整历史 |
| **实时同步** | ❌ 需手动 | ✅ 自动 | ✅ 自动 |
| **手机访问** | ⚠️ 需配置 | ✅ 零配置 | ✅ 零配置 |
| **冲突处理** | ✅ 强大工具 | ⚠️ 手动处理 | ✅ 手动但可避免 |
| **离线工作** | ✅ 完全支持 | ⚠️ 有限支持 | ✅ 完全支持 |
| **备份安全** | ✅ 云端+本地 | ✅ 云端 | ✅ 双云端 |
| **学习曲线** | ⚠️ 需学习Git | ✅ 零学习 | ⚠️ 简单Git |

---

## 十二、链接导航

- **OneDrive 官网**：https://onedrive.live.com
- **Obsidian 官网**：https://obsidian.md
- **OneDrive iOS**：https://apps.apple.com/app/onedrive/id477537958
- **OneDrive Android**：https://play.google.com/store/apps/details?id=com.microsoft.skycloud
- **GitHub 仓库**：https://github.com/fanlf1/wiki

---

**配置建议**：
- 如果你经常需要手机访问笔记 → 使用 OneDrive
- 如果你需要强大的版本控制 → 使用 Git
- 如果你两者都需要 → 使用混合模式（推荐）

**下一步**：选择方案后，按照对应章节配置即可。

祝使用愉快！🎉
