# Obsidian 手机端 Git 同步配置指南

> **配置完成时间**：2026-04-27
> **GitHub仓库**：https://github.com/fanlf1/wiki
> **同步方式**：Git + GitHub

---

## 一、iOS 配置（iPhone/iPad）

### 方案1：Working Copy + Obsidian（推荐）

#### 步骤1：安装应用
```
1. Working Copy - Git client（免费，功能完整）
2. Obsidian（免费，核心功能完整）
```

#### 步骤2：克隆仓库到 Working Copy

1. **打开 Working Copy**
2. **点击 "+" → "Clone Repository"**
3. **输入仓库信息**：
   ```
   URL: https://github.com/fanlf1/wiki.git
   或使用SSH（需要配置SSH密钥）：
   git@github.com:fanlf1/wiki.git
   ```
4. **选择克隆位置**：默认（Working Copy Documents）
5. **点击 "Clone"**

#### 步骤3：在 Obsidian 中打开

1. **打开 Obsidian**
2. **点击 "打开文件夹作为仓库"**
3. **选择 "从其他应用选择"**
4. **找到并选择 Working Copy 中的 wiki 文件夹**
5. **Obsidian 会加载所有笔记**

#### 步骤4：配置自动同步

**电脑 → 手机（拉取更新）**：
```
1. 打开 Working Copy
2. 找到 wiki 仓库
3. 点击 "Pull" 按钮（向下箭头）
4. 等待同步完成
5. 打开 Obsidian，内容已更新
```

**手机 → 电脑（推送更改）**：
```
1. 在 Obsidian 中编辑笔记
2. 切换到 Working Copy
3. 查看修改的文件（绿色标记）
4. 填写提交信息（如 "更新笔记"）
5. 点击 "Commit"（打勾图标）
6. 点击 "Push"（向上箭头）
```

#### 步骤5：设置快捷同步（可选）

```
Working Copy 设置：
├── 自动拉取：进入仓库时自动 Pull
├── 快捷操作：长按仓库图标快速操作
└── 小组件：主屏幕快速同步按钮
```

---

### 方案2：iSH + Git（技术向）

**适用**：熟悉命令行的用户

#### 步骤1：安装 iSH
```
App Store 搜索 "iSH"（Alpine Linux for iOS）
```

#### 步骤2：配置 Git
```bash
# 安装 Git
apk add git

# 克隆仓库
git clone https://github.com/fanlf1/wiki.git ~/wiki

# 配置用户信息
git config --global user.name "你的名字"
git config --global user.email "你的邮箱"
```

#### 步骤3：同步操作
```bash
# 拉取更新
cd ~/wiki
git pull

# 推送更改
cd ~/wiki
git add .
git commit -m "更新笔记"
git push
```

#### 步骤4：在 Obsidian 中打开
```
Obsidian → 打开文件夹 → iSH → wiki 文件夹
```

---

## 二、Android 配置

### 方案1：Termux + Obsidian（推荐）

#### 步骤1：安装应用
```
1. Termux（F-Droid或GitHub）
2. Obsidian（Google Play或官网）
```

#### 步骤2：配置 Termux

```bash
# 更新包管理器
pkg update && pkg upgrade

# 安装 Git
pkg install git

# 克隆仓库
git clone https://github.com/fanlf1/wiki.git ~/wiki

# 配置用户信息
git config --global user.name "你的名字"
git config --global user.email "你的邮箱"
```

#### 步骤3：配置同步脚本

```bash
# 创建同步脚本
cat > ~/sync-wiki.sh << 'EOF'
#!/bin/bash

cd ~/wiki

echo "选择操作："
echo "1) 拉取更新（Pull）"
echo "2) 推送更改（Push）"
echo "3) 同步（Pull + Push）"
read -p "请输入选项 (1-3): " choice

case $choice in
    1)
        echo "正在拉取更新..."
        git pull origin master
        echo "拉取完成！"
        ;;
    2)
        echo "正在推送更改..."
        git add .
        git commit -m "手机端更新 $(date +%Y-%m-%d)"
        git push origin master
        echo "推送完成！"
        ;;
    3)
        echo "正在同步..."
        git pull origin master
        git add .
        git commit -m "手机端更新 $(date +%Y-%m-%d)" || echo "没有新更改"
        git push origin master
        echo "同步完成！"
        ;;
    *)
        echo "无效选项"
        ;;
esac
EOF

# 添加执行权限
chmod +x ~/sync-wiki.sh
```

#### 步骤4：在 Obsidian 中打开
```
Obsidian → 打开文件夹 → Termux → home → wiki 文件夹
```

#### 步骤5：同步操作
```bash
# 运行同步脚本
~/sync-wiki.sh

# 或手动操作
cd ~/wiki
git pull  # 拉取更新
git add . && git commit -m "更新" && git push  # 推送更改
```

---

### 方案2：MGit + Obsidian（图形界面）

#### 步骤1：安装应用
```
1. MGit（GitHub或F-Droid）
2. Obsidian
```

#### 步骤2：克隆仓库
```
1. 打开 MGit
2. 点击 "+" → "Clone from URL"
3. 输入仓库信息：
   URL: https://github.com/fanlf1/wiki.git
   目录：/storage/emulated/0/Documents/wiki
4. 点击 "Clone"
```

#### 步骤3：在 Obsidian 中打开
```
Obsidian → 打开文件夹 → Documents → wiki
```

#### 步骤4：同步操作
```
拉取（更新）：
MGit → wiki → Pull 按钮

推送（上传）：
MGit → wiki → 查看更改 → Commit → Push
```

---

## 三、日常同步工作流

### 推荐工作流

```
电脑端（主工作区）：
├── 在 /mnt/c/code/wiki 编辑
├── 定期提交：git add . && git commit -m "更新" && git push
└── 习惯：每次工作结束前推送

手机端（阅读/轻量编辑）：
├── 打开前：先 Pull（拉取最新）
├── 阅读/编辑：在 Obsidian 中操作
├── 编辑后：在 Git 客户端 Commit + Push
└── 回到电脑：先 Pull（合并手机更改）
```

### 冲突处理

```
如果出现冲突：
├── 不要慌：Git 会标记冲突文件
├── 查看：<<<<<<< 和 ======= 之间的内容
├── 选择：保留需要的版本，或合并两者
├── 保存：删除 Git 标记符
└── 提交：git add . && git commit -m "解决冲突"
```

---

## 四、进阶配置

### SSH 密钥配置（免密推送）

#### 电脑端：
```bash
# 生成 SSH 密钥
ssh-keygen -t ed25519 -C "你的邮箱"

# 查看公钥
cat ~/.ssh/id_ed25519.pub

# 复制公钥到 GitHub：
# Settings → SSH and GPG keys → New SSH key
```

#### 手机端（iOS - Working Copy）：
```
1. Working Copy → Settings → Git User Identity
2. 配置 SSH 密钥（生成或导入）
3. 仓库 URL 改为：git@github.com:fanlf1/wiki.git
```

#### 手机端（Android - Termux）：
```bash
# 生成 SSH 密钥
ssh-keygen -t ed25519 -C "你的邮箱"

# 查看公钥
cat ~/.ssh/id_ed25519.pub

# 复制到 GitHub（手动或通过 clip）
# 测试连接
ssh -T git@github.com
```

---

### Git 钩子（自动提交）

电脑端创建自动推送脚本：
```bash
# 创建 ~/bin/wiki-push 脚本
cat > ~/bin/wiki-push << 'EOF'
#!/bin/bash
cd /mnt/c/code/wiki
git add .
git commit -m "自动更新 $(date +%Y-%m-%d\ %H:%M)"
git push
EOF

chmod +x ~/bin/wiki-push

# 使用：每次编辑后运行
wiki-push
```

---

## 五、故障排查

### 问题1：Push 失败（权限错误）
```
原因：本地更改被远程新提交覆盖

解决：
git pull --rebase
git push
```

### 问题2：冲突文件
```
查看冲突：
grep -r "<<<<<<< HEAD" .

手动解决后：
git add .
git commit
```

### 问题3：Obsidian 提示文件被外部修改
```
解决：点击 "重新加载文件" 按钮
原因：Git 更新了文件，Obsidian 需要刷新
```

### 问题4：大文件同步慢
```
检查大文件：
find . -size +10M -type f

处理：
1. 删除不必要的文件
2. 或使用 Git LFS（大文件存储）
```

---

## 六、最佳实践

### 1. 提交信息规范
```bash
# 好的提交信息
"添加Spectricity实体页面"
"更新睿芯微技术对比"
"修复多光谱成像概念页"

# 避免的提交信息
"更新"
"fix"
"test"
```

### 2. 频繁同步
```
建议：
├── 电脑端：每30分钟-1小时提交一次
├── 手机端：编辑完立即推送
└── 跨设备前：先 Pull 再编辑
```

### 3. 备份策略
```
GitHub 云端备份 ✅
├── 自动备份：每次 Push 即备份
└── 版本历史：可回退任意版本

本地定期备份：
├── 定期打包整个 wiki 文件夹
└── 或使用 Time Machine（Mac）等工具
```

---

## 七、快速参考卡片

### iOS（Working Copy）
```
拉取：Working Copy → wiki → Pull
推送：Working Copy → wiki → Commit → Push
```

### Android（Termux）
```bash
cd ~/wiki
git pull  # 拉取
git add . && git commit -m "更新" && git push  # 推送
```

### 电脑（WSL）
```bash
cd /mnt/c/code/wiki
git pull  # 拉取
git add . && git commit -m "更新" && git push  # 推送
```

---

## 八、链接导航

- **GitHub 仓库**：https://github.com/fanlf1/wiki
- **Obsidian 官网**：https://obsidian.md
- **Working Copy (iOS)**：https://apps.apple.com/app/working-copy/id1447178942
- **Termux (Android)**：https://termux.com
- **Git 官方文档**：https://git-scm.com/doc

---

**提示**：首次配置可能需要 10-15 分钟，配置完成后每次同步只需 1-2 分钟。

**遇到问题？** 检查：
1. 网络连接是否正常
2. GitHub 仓库 URL 是否正确
3. 是否有未提交的更改导致冲突

祝使用愉快！🎉
