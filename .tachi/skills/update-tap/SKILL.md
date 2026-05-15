---
name: update-tap
description: 更新 homebrew-tap 仓库中 Formula 的版本和 SHA256，通过 gh release view 获取上游最新 release 信息
tags:
  - homebrew
  - tap
  - release
---

# Update Homebrew Tap Formula

用来自动更新 homebrew-tap` 仓库中的 Homebrew Formula。

## 触发条件

用户要求更新某个 tap formula 的版本时。本仓库 Formula 遵循统一模式：

- 上游仓库的 release 发布 platform-specific 二进制文件（如 `linko-darwin-arm64`、`linko-darwin-amd64`）
- Formula 中使用 `Hardware::CPU.arch == :arm64` 区分架构，设置不同的 `url` 和 `sha256`
- version 带 `v` 前缀（如 `v0.5.2`）

## 核心流程

### Step 1: 确认目标

问清用户要更新哪个 formula，确认：

- Formula 文件名（如 `linko.rb`）
- 对应的上游 GitHub 仓库（如 `monsterxx03/linko`）

如果 Formula 文件已有 `homepage` 和 `url`，可以从中推断上游仓库。

### Step 2: 获取最新 release 信息

用 `gh release view` 一次性拿到最新版本和所有 asset 的 SHA256：

```bash
gh release view --repo <owner>/<repo> --json tagName,assets -q '
  "\(.tagName)\n" +
  (.assets[] | "\(.name)  \(.digest)\n")
'
```

这会输出类似：

```
v0.5.2
linko-darwin-amd64  sha256:7978795c...
linko-darwin-arm64  sha256:dc12590e...
```

### Step 3: 对比当前版本

读取对应 `.rb` 文件，对比当前 version 和最新 tagName：

- **如果相同**：告诉用户已是最新，无需更新
- **如果不同**：继续下一步

### Step 4: 更新 Formula 文件

Formula 中需要更新的位置：

1. **`version` 字符串** — 替换为新的 tagName
2. **`url` 中的版本号** — 注意 url 路径里也嵌入了版本号（如 `releases/download/v0.5.2/...`）
3. **`sha256` 值** — 两个架构各对应一个

**关键**：`version` 和 `url` 中可能出现多次旧版本号，需要全部替换。用 `replace_all` 可以高效完成。

### Step 5: 验证

更新后打印 diff 给用户确认，提示可以：

```bash
# 本地测试安装
brew install --build-from-source ./Formula/<name>.rb

# 提交
git add Formula/<name>.rb
git commit -m "chore: bump <name> to <new_version>"
```

## 注意事项

- GitHub API 的 asset 对象中 `digest` 字段已经是 `sha256:xxx` 格式，Formula 的 `sha256` 值只需要纯 hex 部分（去掉 `sha256:` 前缀）
- 如果上游新增了 platform asset（比如加了 linux），需要提醒用户确认 Formula 模板是否需要修改
- 替换时注意 `url` 字符串中也有版本号，不要遗漏
