---
title: "快速入门：安装 Google Cloud CLI  |  Google Cloud SDK"
source: "https://docs.cloud.google.com/sdk/docs/install-sdk?hl=zh-cn"
author:
published:
created: 2026-05-19
description: "了解如何安装 Google Cloud CLI 并运行一些核心 gcloud CLI 命令。"
tags:
  - "clippings"
---
本快速入门介绍了安装和初始化 Google Cloud CLI 的推荐方法。初始化后，运行一些核心 gcloud CLI 命令，以查看有关安装的信息并验证安装是否成功。

---

如需在 Google Cloud 控制台中直接遵循有关此任务的分步指导，请点击 **操作演示** ：

[操作演示](https://console.cloud.google.com/?walkthrough_id=sdk--cloud-cli-quickstart&hl=zh-cn)

---

## 准备工作

- 首先，创建一个 Google Cloud 账号。使用此账号，您将获得 $300 的免费赠金，并可在每月限额范围内免费使用 20 多种产品。
	[创建账号](https://console.cloud.google.com/freetrial?hl=zh-cn)
- In the Google Cloud console, on the project selector page, select or create a Google Cloud project.
	**Roles required to select or create a project**
	- **Select a project**: Selecting a project doesn't require a specific IAM role—you can select any project that you've been granted a role on.
	- **Create a project**: To create a project, you need the Project Creator role (`roles/resourcemanager.projectCreator`), which contains the `resourcemanager.projects.create` permission. [Learn how to grant roles](https://docs.cloud.google.com/iam/docs/granting-changing-revoking-access?hl=zh-cn).
	[Go to project selector](https://console.cloud.google.com/projectselector2/home/dashboard?hl=zh-cn)
- [Verify that billing is enabled for your Google Cloud project](https://docs.cloud.google.com/billing/docs/how-to/verify-billing-enabled?hl=zh-cn#confirm_billing_is_enabled_on_a_project).

- In the Google Cloud console, on the project selector page, select or create a Google Cloud project.
	**Roles required to select or create a project**
	- **Select a project**: Selecting a project doesn't require a specific IAM role—you can select any project that you've been granted a role on.
	- **Create a project**: To create a project, you need the Project Creator role (`roles/resourcemanager.projectCreator`), which contains the `resourcemanager.projects.create` permission. [Learn how to grant roles](https://docs.cloud.google.com/iam/docs/granting-changing-revoking-access?hl=zh-cn).
	[Go to project selector](https://console.cloud.google.com/projectselector2/home/dashboard?hl=zh-cn)
- [Verify that billing is enabled for your Google Cloud project](https://docs.cloud.google.com/billing/docs/how-to/verify-billing-enabled?hl=zh-cn#confirm_billing_is_enabled_on_a_project).

## 安装 gcloud CLI 版本 568.0.0

1. 确认您拥有受支持的 Python 版本。Google Cloud CLI 需要 Python 3.10 到 3.14。x86\_64 Linux 软件包中包含默认首选的捆绑式 Python 解释器。如需了解如何选择和配置 Python 解释器，请参阅 [`gcloud topic startup` 文档](https://docs.cloud.google.com/sdk/gcloud/reference/topic/startup?hl=zh-cn) 。
2. 下载以下内容之一：
	| 平台 | 软件包名称 | 大小 | SHA256 校验和 |
	| --- | --- | --- | --- |
	| Linux 64 位  (x86\_64) | [google-cloud-cli-linux-x86\_64.tar.gz](https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-linux-x86_64.tar.gz?hl=zh-cn) | 87.4 MB | 45f8fdf30d78a338218f43b1d2b05478d2d7ca8cc4b9c28f802b84a6de0fc8d9 |
	| Linux 64 位  (Arm) | [google-cloud-cli-linux-arm.tar.gz](https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-linux-arm.tar.gz?hl=zh-cn) | 60.4 MB | 0fecff8f98fe1675d843065b6f1b574d656620becb1ab9bb565b7ba2ddd4d05e |
	| Linux 32 位  (x86) | [google-cloud-cli-linux-x86.tar.gz](https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-linux-x86.tar.gz?hl=zh-cn) | 60.4 MB | 37cd5b782cc0884d549148d4961321b8c6f92e0e5358efd450dd0548c0d4cedb |
	如需下载 Linux 归档文件，请运行以下命令：
	```
	curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-linux-x86_64.tar.gz
	```
	请参阅上表并将 google-cloud-cli-linux-x86\_64.tar.gz 替换为适用于您的配置的 `*.tar.gz` 软件包名称。
3. 如需将文件内容解压缩到文件系统，请运行以下命令：
	```
	tar -xf google-cloud-cli-linux-x86_64.tar.gz
	```
	如需替换现有安装，请删除现有的 `google-cloud-sdk` 目录，然后将归档解压缩到同一位置。
4. 从解压缩到的文件夹的根目录运行安装脚本：
	```
	./google-cloud-sdk/install.sh
	```
	脚本会提示您执行以下设置操作。如要接受，请在出现提示时回答 `Y` 。
	- 将 gcloud CLI 添加到您的 `PATH` 。
		- 启用命令补全功能。
		- 选择发送 [匿名使用情况统计信息](https://docs.cloud.google.com/sdk/docs/usage-statistics?hl=zh-cn) ，以帮助改进 gcloud CLI。
	您还可以通过提供标志以非交互方式执行安装。 如需查看可用标志，请运行以下命令：
	```
	./google-cloud-sdk/install.sh --help
	```
5. 可选：如果您在上一步中更新了 `PATH` ，请打开一个新终端，让更改生效。

**软件包内容**

对于 Debian 和 Ubuntu 系统，可以通过软件包格式的 gcloud CLI 进行安装。此软件包仅包含 `gcloud` 、 `gcloud alpha` 、 `gcloud beta` 、 `gsutil` 和 `bq` 命令行工具。而不包括 `kubectl` 或使用 `gcloud` 命令部署应用所需的 App Engine 扩展程序。如果您需要这些组件，则必须 [单独安装](#deb-additional) 。

**准备工作**

在安装 gcloud CLI 之前，确保您的操作系统满足以下要求：

- 这是尚未达到 [服务终止](https://wiki.ubuntu.com/Releases) 期限的 Ubuntu 版本或尚未达到 [服务终止](https://www.debian.org/releases) 期限的 Debian 稳定版本。
- 它最近更新了其软件包：如需立即执行此操作，请运行以下命令：
	```
	sudo apt-get update
	```
- 它安装了 `ca-certificates` 、 `gnupg` 和 `curl` 。如需安装这些软件包，请运行以下命令：
	```
	sudo apt-get install ca-certificates gnupg curl
	```

**安装**

1. 导入 Google Cloud 公钥。
	- 对于较新的发行版（Debian 9+ 或 Ubuntu 18.04+），请运行以下命令：
		```
		curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
		```
		- 对于较旧的发行版，请运行以下命令：
		```
		curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
		```
		- 如果您的发行版的 apt-key 命令不支持 `--keyring` 参数，请运行以下命令：
		```
		curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
		```
		- 如果您由于密钥过期而无法获取最新更新，请 [获取最新的 apt-get.gpg 密钥文件](https://docs.cloud.google.com/compute/docs/troubleshooting/known-issues?hl=zh-cn#keyexpired) 。
2. 添加 gcloud CLI 发行版 URI 作为软件包源。
	- 对于较新的发行版（Debian 9+ 或 Ubuntu 18.04+），请运行以下命令：
		```
		echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
		```
		- 对于不支持 signed-by 选项的旧发行版，请运行以下命令：
		```
		echo "deb https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
		```
3. 更新并安装 gcloud CLI：
	```
	sudo apt-get update && sudo apt-get install google-cloud-cli
	```
	如需了解其他 `apt-get` 选项（例如停用提示或试运行），请参阅 [`apt-get` 手册页面](https://linux.die.net/man/8/apt-get) 。
	**Docker 提示** ：如果安装 Docker 映像中的 gcloud CLI，请改用单个 RUN 步骤：
	```
	RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg && apt-get update -y && apt-get install google-cloud-cli -y
	```
	对于不支持 `gpg --dearmor` 命令的旧基础映像：
	```
	RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && apt-get update -y && apt-get install google-cloud-cli -y
	```
4. 可选：安装以下任何 [其他组件](https://docs.cloud.google.com/sdk/docs/components?hl=zh-cn#additional_components) ：
	- `google-cloud-cli-anthos-auth`
		- `google-cloud-cli-app-engine-go`
		- `google-cloud-cli-app-engine-grpc`
		- `google-cloud-cli-app-engine-java`
		- `google-cloud-cli-app-engine-python`
		- `google-cloud-cli-app-engine-python-extras`
		- `google-cloud-cli-bigtable-emulator`
		- `google-cloud-cli-cbt`
		- `google-cloud-cli-cloud-build-local`
		- `google-cloud-cli-cloud-run-proxy`
		- `google-cloud-cli-config-connector`
		- `google-cloud-cli-datastore-emulator`
		- `google-cloud-cli-firestore-emulator`
		- `google-cloud-cli-gke-gcloud-auth-plugin`
		- `google-cloud-cli-kpt`
		- `google-cloud-cli-kubectl-oidc`
		- `google-cloud-cli-local-extract`
		- `google-cloud-cli-minikube`
		- `google-cloud-cli-nomos`
		- `google-cloud-cli-pubsub-emulator`
		- `google-cloud-cli-skaffold`
		- `google-cloud-cli-spanner-emulator`
		- `google-cloud-cli-terraform-tools`
		- `google-cloud-cli-tests`
		- `kubectl`
	例如， `google-cloud-cli-app-engine-java` 组件可以按以下方式安装：
	```
	sudo apt-get install google-cloud-cli-app-engine-java
	```

**降级 gcloud CLI 版本**

如需还原到特定版本的 gcloud CLI（其中 `VERSION` 为 `123.0.0` 形式），请运行以下命令：

```
sudo apt-get update && sudo apt-get install google-cloud-cli=123.0.0-0
```

仓库中始终提供最新的十个版本。对于 371.0.0 之前的版本，该软件包名称为 `google-cloud-sdk`

**软件包内容**

gcloud CLI 以软件包格式提供，可安装在 Red Hat Enterprise Linux 7、8、9 和 10、Fedora 41 和 42 以及 CentOS 7 和 8 系统上。此软件包仅包含 `gcloud` 、 `gcloud alpha` 、 `gcloud beta` 、 `gsutil` 、和 `bq` 命令，而不包括 `kubectl` 或使用 `gcloud` 命令部署应用所需的 App Engine 扩展程序，您可以按照本部分稍后所述的方法单独安装。

**安装**

1. 使用 gcloud CLI 仓库信息更新 DNF。
	- 以下示例命令适用于与 Red Hat Enterprise Linux 7、8 或 9 兼容的安装，但请务必根据您的配置的需要更新设置：
		```
		sudo tee -a /etc/yum.repos.d/google-cloud-sdk.repo << EOM
		[google-cloud-cli]
		name=Google Cloud CLI
		baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el9-x86_64
		enabled=1
		gpgcheck=1
		repo_gpgcheck=0
		gpgkey=https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
		EOM
		```
		- 对于与 RHEL 10 兼容的安装，请使用以下命令以及更新后的 `gpgkey` ：
		```
		sudo tee -a /etc/yum.repos.d/google-cloud-sdk.repo << EOM
		[google-cloud-cli]
		name=Google Cloud CLI
		baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el10-x86_64
		enabled=1
		gpgcheck=1
		repo_gpgcheck=0
		gpgkey=https://packages.cloud.google.com/yum/doc/rpm-package-key-v10.gpg
		EOM
		```
		- 对于 ARM64 (aarch64) 安装，请使用 `https://packages.cloud.google.com/yum/repos/cloud-sdk-el9-aarch64` （与 RHEL 7、8 或 9 兼容）或 `https://packages.cloud.google.com/yum/repos/cloud-sdk-el10-aarch64` （与 RHEL 10 兼容）作为 `baseurl` 值。
2. 安装 `libxcrypt-compat.x86_64` 。
	```
	sudo dnf install libxcrypt-compat.x86_64
	```
3. 安装 gcloud CLI：
	```
	sudo dnf install google-cloud-cli
	```
4. 可选：安装以下任何 [其他组件](https://docs.cloud.google.com/sdk/docs/components?hl=zh-cn#additional_components) ：
	- `google-cloud-cli-anthos-auth`
		- `google-cloud-cli-app-engine-go`
		- `google-cloud-cli-app-engine-grpc`
		- `google-cloud-cli-app-engine-java`
		- `google-cloud-cli-app-engine-python`
		- `google-cloud-cli-app-engine-python-extras`
		- `google-cloud-cli-bigtable-emulator`
		- `google-cloud-cli-cbt`
		- `google-cloud-cli-cloud-build-local`
		- `google-cloud-cli-cloud-run-proxy`
		- `google-cloud-cli-config-connector`
		- `google-cloud-cli-datastore-emulator`
		- `google-cloud-cli-firestore-emulator`
		- `google-cloud-cli-gke-gcloud-auth-plugin`
		- `google-cloud-cli-kpt`
		- `google-cloud-cli-kubectl-oidc`
		- `google-cloud-cli-local-extract`
		- `google-cloud-cli-minikube`
		- `google-cloud-cli-nomos`
		- `google-cloud-cli-pubsub-emulator`
		- `google-cloud-cli-skaffold`
		- `google-cloud-cli-spanner-emulator`
		- `google-cloud-cli-terraform-validator`
		- `google-cloud-cli-tests`
		- `kubectl`
	例如，如需安装 `google-cloud-cli-app-engine-java` 组件，请运行以下命令：
	```
	sudo dnf install google-cloud-cli-app-engine-java
	```

**降级 gcloud CLI 版本**

如需还原到特定版本的 gcloud CLI，请运行以下命令。将 `123.0.0` 替换为您要安装的版本：

```
sudo dnf downgrade google-cloud-cli-123.0.0
```

仓库中提供最新的十个版本。对于 371.0.0 之前的版本，请使用 `google-cloud-sdk` 作为软件包名称。

1. 确认您拥有受支持的 Python 版本。Google Cloud CLI 需要 Python 3.10 到 3.14。
	如需查看您的 Python 版本，请运行 `python3 -V` 或 `python -V` 。
	gcloud 安装程序默认会安装 Python v3.13 和必需的扩展模块。
	如需详细了解如何配置 Python 解释器，请参阅 [`gcloud topic startup` 文档](https://docs.cloud.google.com/sdk/gcloud/reference/topic/startup?hl=zh-cn) 。
2. 下载以下内容之一：
	| 平台 | 软件包 | 大小 | SHA256 校验和 |
	| --- | --- | --- | --- |
	| macOS 64 位  (x86\_64) | [google-cloud-cli-darwin-x86\_64.tar.gz](https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-darwin-x86_64.tar.gz?hl=zh-cn) | 60.6 MB | cab2863676bbb73bf149f20fa325076097a94485e144a1f0820d7c601adc6de2 |
	| macOS 64 位  (ARM64, Apple silicon) | [google-cloud-cli-darwin-arm.tar.gz](https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-darwin-arm.tar.gz?hl=zh-cn) | 60.5 MB | 7483864c8fa41fd7bdbbec6335d359caa52efc175c3183ecba3ba9dd326e9c58 |
	| macOS 32 位  (x86) | [google-cloud-cli-darwin-x86.tar.gz](https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-darwin-x86.tar.gz?hl=zh-cn) | 58.9 MB | c2764997e01cffc82dd4eb95815ac781cfbfab2382d5626788a5537699bef3cc |
	或者，您也可以从命令行下载归档文件。 将 `FILE_NAME` 替换为上表中您的平台的软件包名称。
	```
	curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/FILE_NAME
	```
3. 将文件内容提取到文件系统上的首选位置。常见做法是将其提取到您的主目录中。
	在 macOS 上，您可以通过打开下载到首选位置的 `.tar.gz` 文件来完成此操作。或者，从命令行中运行：
	```
	tar -xf FILE_NAME
	```
	如需替换现有安装，请删除现有的 `google-cloud-sdk` 目录，然后将归档解压缩到同一位置。
4. 从解压缩到的文件夹的根目录运行安装脚本：
	```
	./google-cloud-sdk/install.sh
	```
	脚本会提示您执行以下设置操作。如要接受，请在出现提示时回答 `Y` 。
	- 根据需要安装 Python 3.13 和推荐的模块。
		- 将 gcloud CLI 添加到您的 `PATH` 并启用命令补全功能。
		- 选择发送 [匿名使用情况统计信息](https://docs.cloud.google.com/sdk/docs/usage-statistics?hl=zh-cn) ，以帮助改进 gcloud CLI。
	您还可以通过提供标志以非交互方式执行安装。 如需查看可用标志，请运行以下命令：
	```
	./google-cloud-sdk/install.sh --help
	```
	如需在启用屏幕阅读器模式的情况下运行安装脚本，请执行以下操作：
	```
	./google-cloud-sdk/install.sh --screen-reader=true
	```
5. 可选：如果您在上一步中更新了 `PATH` ，请打开一个新终端，让更改生效。

Windows 上的 Google Cloud CLI 需要 Windows 8.1 及更高版本或 Windows Server 2012 及更高版本。

1. 下载 [Google Cloud CLI 安装程序](https://dl.google.com/dl/cloudsdk/channels/rapid/GoogleCloudSDKInstaller.exe?hl=zh-cn) 。
	或者，打开 PowerShell 终端，然后运行以下 PowerShell 命令：
	```
	(New-Object Net.WebClient).DownloadFile("https://dl.google.com/dl/cloudsdk/channels/rapid/GoogleCloudSDKInstaller.exe", "$env:Temp\GoogleCloudSDKInstaller.exe")
	& $env:Temp\GoogleCloudSDKInstaller.exe
	```
2. 启动安装程序并按提示操作。安装程序已经过 Google LLC 签名。
	- 如果您使用的是屏幕阅读器，请选中 **启用屏幕阅读器模式** 复选框。此选项会将 `gcloud` 配置为使用状态跟踪器而不是 Unicode 旋转图标，以百分比表示显示进度和展开的表。如需了解详情，请参阅 [无障碍功能指南](https://docs.cloud.google.com/sdk/docs/enabling-accessibility-features?hl=zh-cn) 。
		- Google Cloud CLI 要求安装 Python；受支持的版本是 Python 3.10 到 3.14。默认情况下，Windows 版本的 Google Cloud CLI 捆绑了 Python 3。如需使用 Google Cloud CLI，您的操作系统必须能够运行受支持的 Python 版本。
		- 安装程序会安装所有必需的依赖项（包括所需的 Python 版本）。 虽然 Google Cloud CLI 默认安装和管理 Python 3，但您可以根据需要通过 **取消选中** “安装捆绑的 Python”选项来使用现有 Python 安装。 请参阅 [`gcloud topic startup`](https://docs.cloud.google.com/sdk/gcloud/reference/topic/startup?hl=zh-cn) ，了解如何使用现有 Python 安装。
3. 安装完成后，安装程序会为您提供创建开始菜单和桌面快捷方式以及启动 Google Cloud CLI shell 的选项。取消选中用于启动 shell 的选项。您将在后续步骤中运行和配置 gcloud CLI。

**问题排查提示**

- 如果由于 `find` 命令未被识别而导致安装失败，请确保您的 `PATH` 环境变量设置为将包含 `find` 的文件夹包括在内。通常，此文件夹为 `C:\WINDOWS\system32;`。
- 如果您卸载了 gcloud CLI，则必须先重新启动系统，然后才能再次安装 gcloud CLI。
- 如果解压缩失败，请以管理员身份运行安装程序。

1. 在 Chromebook 上 [设置 Linux 开发环境](https://support.google.com/chromebook/answer/9145439?hl=zh-cn) 。
2. 添加 gcloud CLI 发行版 URI 作为软件包源。运行以下命令：
	```
	echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
	```
3. 导入 Google Cloud 公钥：
	```
	curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
	```
4. 更新并安装 gcloud CLI：
	```
	sudo apt-get update && sudo apt-get install google-cloud-cli
	```
5. 可选：安装以下任何 [其他组件](https://docs.cloud.google.com/sdk/docs/components?hl=zh-cn#additional_components) ：
	- `google-cloud-cli-anthos-auth`
		- `google-cloud-cli-app-engine-go`
		- `google-cloud-cli-app-engine-grpc`
		- `google-cloud-cli-app-engine-java`
		- `google-cloud-cli-app-engine-python`
		- `google-cloud-cli-app-engine-python-extras`
		- `google-cloud-cli-bigtable-emulator`
		- `google-cloud-cli-cbt`
		- `google-cloud-cli-cloud-build-local`
		- `google-cloud-cli-cloud-run-proxy`
		- `google-cloud-cli-config-connector`
		- `google-cloud-cli-datastore-emulator`
		- `google-cloud-cli-firestore-emulator`
		- `google-cloud-cli-gke-gcloud-auth-plugin`
		- `google-cloud-cli-kpt`
		- `google-cloud-cli-kubectl-oidc`
		- `google-cloud-cli-local-extract`
		- `google-cloud-cli-minikube`
		- `google-cloud-cli-nomos`
		- `google-cloud-cli-pubsub-emulator`
		- `google-cloud-cli-skaffold`
		- `google-cloud-cli-spanner-emulator`
		- `google-cloud-cli-terraform-validator`
		- `google-cloud-cli-tests`
		- `kubectl`
	例如，如需安装 `google-cloud-cli-app-engine-java` 组件，请运行以下命令：
	```
	sudo apt-get install google-cloud-cli-app-engine-java
	```

**降级 gcloud CLI 版本**

如需还原到特定版本的 gcloud CLI，请运行以下命令。将 `123.0.0` 替换为您要安装的版本：

```
sudo apt-get update && sudo apt-get install google-cloud-cli=123.0.0-0
```

仓库中提供最新的十个版本。对于 371.0.0 之前的版本，请使用 `google-cloud-sdk` 作为软件包名称。

## 初始化并授权 gcloud CLI

如果您使用代理或防火墙，请参阅 [代理配置](https://docs.cloud.google.com/sdk/docs/proxy-settings?hl=zh-cn#proxy_configuration) ，以启用 gcloud CLI 的网络访问权限。

安装 gcloud CLI 后，对其进行初始化，以授权访问 Google Cloud 并设置默认配置。如需了解详情，请参阅 [`gcloud init`](https://docs.cloud.google.com/sdk/gcloud/reference/init?hl=zh-cn) 。

1. 运行 `gcloud init` 以初始化 gcloud CLI：
	```
	gcloud init
	```
	默认情况下，此命令会打开一个网络浏览器以授权访问。如需改为从命令行进行授权，请添加 `--console-only` 标志。 对于非交互式授权，请在 [Google Cloud 控制台](https://console.cloud.google.com/?hl=zh-cn) 中 [创建具有适当权限范围的服务账号](https://docs.cloud.google.com/iam/docs/service-accounts-create?hl=zh-cn) ，然后搭配使用 [`gcloud auth activate-service-account`](https://docs.cloud.google.com/sdk/gcloud/reference/auth/activate-service-account?hl=zh-cn) 及其 JSON 密钥文件。
2. 按照提示进行授权和配置：
	- 当系统提示您登录时，请接受并登录浏览器中的 Google 账号。点击 **允许** 以授予访问资源的权限。
		- 从您拥有 **所有者** 、 **编辑者** 或 **查看者** 权限的项目列表中选择一个项目。如果您只有一个项目， `gcloud init` 会为您选择该项目。
		如果您有超过 200 个项目，系统会提示您输入项目 ID、创建项目或列出项目。如果您选择创建项目，还必须 [为该项目启用结算功能](https://docs.cloud.google.com/billing/docs/how-to/modify-project?hl=zh-cn) 。
		- 如果您已启用 [Compute Engine API](https://docs.cloud.google.com/compute/docs/create-linux-vm-instance?hl=zh-cn#before-you-begin) ，请选择默认的 Compute Engine 可用区。
3. 可选：如需获得更出色的屏幕阅读器体验，请使用以下命令启用 `accessibility/screen_reader` 属性：
	```
	gcloud config set accessibility/screen_reader true
	```
	如需了解详情，请参阅 [启用无障碍功能](https://docs.cloud.google.com/sdk/docs/enabling-accessibility-features?hl=zh-cn) 指南。

## 运行核心命令

运行核心命令以查看有关您的 gcloud CLI 安装的信息：

1. 列出其凭据存储在本地系统上的账号：
	```
	gcloud auth list
	```
	gcloud CLI 会显示存储了凭证的账号的列表：
	```sh
	Credentialed Accounts
	ACTIVE             ACCOUNT
	*                  example-user-1@example.com
	                   example-user-2@example.com
	```
2. 列出活跃 gcloud CLI 配置中的属性：
	```
	gcloud config list
	```
	gcloud CLI 会显示属性列表：
	```sh
	[core]
	account = example-user-1@example.com
	disable_usage_reporting = False
	project = example-project
	```
3. 查看有关 `gcloud` 命令和其他主题的信息：
	```
	gcloud help
	```
	例如，如需查看 `gcloud compute instances create` 的帮助信息，请运行以下命令：
	```
	gcloud help compute instances create
	```
	gcloud CLI 会显示一个帮助主题，其中包含该命令的说明、命令标志和参数的列表以及关于如何使用该命令的示例。

## 可选：安装其他组件

如需安装其他组件，例如 App Engine 模拟器、 `kubectl` 或处于 Alpha 版或 Beta 版发布级别的 gcloud CLI 命令，请参阅 [管理 gcloud CLI 组件](https://docs.cloud.google.com/sdk/gcloud/guide/managing-components?hl=zh-cn) 。

## 后续步骤

- 请参阅 [gcloud CLI 指南](https://docs.cloud.google.com/sdk/gcloud?hl=zh-cn) ，以大致了解 gcloud CLI，其中包括关键概念的简单介绍、命令格式约定，以及实用提示。
- 请参阅 [gcloud CLI 参考指南](https://docs.cloud.google.com/sdk/gcloud/reference?hl=zh-cn) ，以查看可用于在 Google Cloud上执行各项任务的每个 gcloud CLI 命令的详情页面，其中包括说明、标志和示例。
- 如需查看常用命令和关键概念的列表，请参阅 [gcloud CLI 备忘单](https://docs.cloud.google.com/sdk/docs/cheatsheet?hl=zh-cn) 。