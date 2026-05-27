---
title: "验证项目的结算状态  |  Cloud Billing"
source: "https://docs.cloud.google.com/billing/docs/how-to/verify-billing-enabled?hl=zh-cn#confirm_billing_is_enabled_on_a_project"
author:
published:
created: 2026-05-19
description:
tags:
  - "clippings"
---
Cloud Billing 账号定义一组指定的资源的付款方，该账号可与一个或多个项目关联。项目的使用费将计入关联的 Cloud Billing 账号名下。

本文档介绍如何验证项目的结算状态。

## 概览

如需确保项目已启用结算功能，项目必须与有效的 Cloud Billing 账号相关联。通常，在您创建项目时，项目会关联到结算账号。

如果项目关联到随后关闭或暂停的 Cloud Billing 账号，则这些项目将不再启用结算功能。如果您想继续使用这些项目，则必须重新开启结算账号，或将项目移动到其他活跃的 Cloud Billing 账号。

您可以取消项目与结算账号的关联，从而停用项目结算功能。如需继续使用该项目，您必须通过将项目关联到活跃的 Cloud Billing 账号来重新启用结算功能。

请参阅本文，以帮助您确定项目是否已启用结算功能。

### 执行此任务所需的权限

如需执行确认项目已启用结算功能所需的任务，您需要一个可提供 Cloud Billing 账号的以下 [权限](https://docs.cloud.google.com/iam/docs/roles-permissions/billing?hl=zh-cn) 的角色：

- [`billing.resourceAssociations.list`](https://docs.cloud.google.com/billing/docs/how-to/custom-roles?hl=zh-cn#resource_associations) ，用于查看结算账号的项目关联。
- [`billing.accounts.get`](https://docs.cloud.google.com/billing/docs/how-to/custom-roles?hl=zh-cn#account_management) ，用于查看有关结算账号的基本信息（例如账号名称、货币、开启/关闭状态）。

如需获得这些权限，请让您的管理员为您授予 Cloud Billing 账号的以下 [Cloud Billing IAM](https://docs.cloud.google.com/billing/docs/how-to/billing-access?hl=zh-cn) 角色之一：

- Billing Account Viewer
- Billing Account Costs Manager
- Billing Account Administrator

如需详细了解结算权限，请参阅以下内容：

- [Cloud Billing 访问权限控制概览](https://docs.cloud.google.com/billing/docs/how-to/billing-access?hl=zh-cn)
- [为 Cloud Billing 创建自定义角色](https://docs.cloud.google.com/billing/docs/how-to/custom-roles?hl=zh-cn#resource_associations)
- [了解 Cloud Billing 的预定义 IAM 角色](https://docs.cloud.google.com/iam/docs/roles-permissions/billing?hl=zh-cn)

## 检查项目是否已启用结算功能

如果存在以下情况，则项目已启用结算功能：

1. 项目与 Cloud Billing 账号相关联。
2. 关联的 Cloud Billing 账号处于活跃状态且信誉良好，也就是说，结算账号未关闭或暂停。

### 1\. 确定与项目关联的 Cloud Billing 账号

如需查看与特定项目关联的 Cloud Billing 账号，请执行以下操作：

1. 登录 Google Cloud 控制台。
	[登录 Google Cloud 控制台](https://console.cloud.google.com/?hl=zh-cn) 。
2. 在 Google Cloud 控制台页面顶部的项目下拉列表（ \[您的项目名称\] ）中，选择您的项目。
3. 打开控制台 **导航菜单** ()，然后选择 **结算** 。

**如果项目没有关联的结算账号** ：

- 如果项目没有与任何 Cloud Billing 账号相关联，您会看到包含如下所示文本的对话框：
	“此项目没有结算账号”
- 如需对项目启用结算功能，请选择 **关联结算账号** 。请注意，您需要具备足够的权限才能关联结算账号。如需了解详情，请参阅 [为现有项目启用结算功能](https://docs.cloud.google.com/billing/docs/how-to/modify-project?hl=zh-cn#enable_billing_for_an_existing_project) 。
- 如需查看贵组织的结算账号列表，请选择 **管理结算账号** 。

**如果结算账号与项目关联：**

- 如果项目与 Cloud Billing 关联，并且您只有一个 Cloud Billing 账号，系统会显示结算 **概览** 页面。
- 如果项目有关联的 Cloud Billing 账号，但您有多个 Cloud Billing 账号，则系统会显示一个包含如下所示文本的对话框：
	“结算账号 \[您的结算账号名称\] 已关联到此项目”
- 如需查看与项目关联的 Cloud Billing 账号的结算 **概览** 页面，请选择 **前往关联的结算账号** 。
- 如需查看贵组织的 Cloud Billing 账号列表，请选择 **管理结算账号** 。

如需查看项目的详细结算信息，请运行 [`gcloud beta billing projects describe`](https://docs.cloud.google.com/sdk/gcloud/reference/beta/billing/projects/describe?hl=zh-cn) 命令：

```
gcloud beta billing projects describe PROJECT_ID
```

其中：

- PROJECT\_ID 是您要查看其结算信息的项目的 ID 或编号。

示例：

如需查看项目 `my-project` 的详细结算信息，请运行以下命令：

```
gcloud beta billing projects describe my-project
```

根据返回的详细信息，您可以判断是否已启用结算功能。

---

- 如果您看到 `billingAccountName` 和 `billingEnabled: true` ，则会对 `my-project` **启用结算功能** 。 `billingAccountName` 是与项目关联的 Cloud Billing 账号的 ID。例如：

```
billingAccountName: billingAccounts/0X0X0X-0X0X0X-0X0X0X
billingEnabled: true
name: projects/my-project/billingInfo
projectId: my-project
```

---

- 如果您看到 `my-project` 为 `billingAccountName` ，但看到 `billingEnabled: false` ，则说明该项目与不活跃的 Cloud Billing 账号相关联。对于此项目， **未启用结算功能** 。例如：

```
billingAccountName: billingAccounts/0X0X0X-0X0X0X-0X0X0X
billingEnabled: false
name: projects/my-project/billingInfo
projectId: my-project
```

如果结算账号未处于活跃状态，则无法使用关联项目中的资源。了解如何 [重新开启已关闭的结算账号](https://docs.cloud.google.com/billing/docs/how-to/close-or-reopen-billing-account?hl=zh-cn#reopen_a_closed_billing_account) 或 [更改与项目关联的结算账号](https://docs.cloud.google.com/billing/docs/how-to/modify-project?hl=zh-cn#change_the_billing_account_for_a_project) 。

---

- 如果 `my-project` 的 `billingAccountName` 为空白，则项目未关联到任何 Cloud Billing 账号。对于此项目， **未启用结算功能** 。例如：

```
billingAccountName: ''
billingEnabled: false
name: projects/my-project/billingInfo
projectId: my-project
```

如需了解如何将结算账号与项目关联，请参阅 [为现有项目启用结算功能](https://docs.cloud.google.com/billing/docs/how-to/modify-project?hl=zh-cn#enable_billing_for_an_existing_project) 。

### 2\. 确认关联的 Cloud Billing 账号的状态

如需确认关联的 Cloud Billing 账号处于活跃状态，请执行以下操作：

1. 查看关联的结算账号的结算 **概览** 页面。
	您可能已在结算 **概览** 页面中。如果没有，请执行以下操作：
	1. 在 Google Cloud 控制台中，登录您的 Cloud Billing 账号。
		[登录您的 Cloud Billing 账号](https://console.cloud.google.com/billing/overview?hl=zh-cn)
		2. 在提示位置，选择您要查看的 Cloud Billing 账号。 系统会打开所选结算账号的结算 **概览** 页面。
		如果关联的结算账号处于关闭或暂停状态，您会在结算 **概览** 页面顶部看到一条消息，指出该账号的状态。例如，如果结算账号处于关闭状态，您将看到类似于以下内容的消息：“此结算账号已关闭。您可以访问账号管理页面将其重新开启，然后继续使用关联的项目。”
		如果结算账号未处于活跃状态，则无法使用关联项目中的资源。
	- [了解如何重新启动已关闭的 Cloud Billing 账号](https://docs.cloud.google.com/billing/docs/how-to/close-or-reopen-billing-account?hl=zh-cn#reopen_a_closed_billing_account) 。
		- [了解如何更改与项目关联的结算账号](https://docs.cloud.google.com/billing/docs/how-to/modify-project?hl=zh-cn#change_the_billing_account_for_a_project) 。
2. 查看关联的结算账号的“付款概览”页面。
	如果您已在结算 **概览** 页面，请选择 **付款概览** 标签页。否则，请执行以下操作以打开 **付款概览** 页面：
	1. 在 Google Cloud 控制台中，登录 Cloud Billing 账号的 **付款概览** 页面。
		[登录您的 Cloud Billing 账号](https://console.cloud.google.com/billing/payment?hl=zh-cn)
		2. 在提示位置，选择您要查看的 Cloud Billing 账号。系统会打开所选结算账号的结算 **付款概览** 页面。
		如果关联的 Cloud Billing 账号有逾期款项、未付余额或付款方式存在问题，则您的账号可能会被暂停，直到您解决任何问题并支付未结余额。
	[了解如何解决自助（自动付款）账号的付款被拒](https://docs.cloud.google.com/billing/docs/how-to/resolve-issues?hl=zh-cn#resolving_declined_payments) 。

如需查看 Cloud Billing 账号的详细信息，请运行 [`gcloud beta billing accounts describe`](https://docs.cloud.google.com/sdk/gcloud/reference/beta/billing/accounts/describe?hl=zh-cn) 命令：

```
gcloud beta billing accounts describe ACCOUNT_ID
```

其中：

- ACCOUNT\_ID 是您要查看的结算账号的 ID，格式为 0X0X0X-0X0X0X-0X0X0X。如需查看可用 ID，请运行 `$ gcloud alpha billing accounts list` 。

示例：

如需查看结算账号 `0X0X0X-0X0X0X-0X0X0X` 的详细信息，请运行以下命令：

```
gcloud beta billing accounts describe 0X0X0X-0X0X0X-0X0X0X
```

针对结算账号返回的信息包括结算账号显示名和账号的活跃状态。例如：

```
displayName: My Billing Account
masterBillingAccount: ''
name: billingAccounts/0X0X0X-0X0X0X-0X0X0X
open: true
```

- `displayName` 是您分配给结算账号的名称。
- `masterBillingAccount` 表示您要查看的结算账号是父级/顶级账号还是子账号。如果您在 `masterBillingAccount` 中看到值，则表示您正在查看的结算账号是 `masterBillingAccount` 中显示的父级结算账号的子账号。如果 `masterBillingAccount` 为空白，则表示您查看的结算账号不是子账号。
- `name` 是您正在查看的结算账号的 ID。
- `open` 指示结算账号是否处于活跃状态。如果为 `true` ，则结算账号处于开启状态。如果为 `false` ，则结算账号处于关闭或暂停状态。与关闭的结算账号关联的任何项目都未启用结算功能。

如果结算账号不是处于开启状态，则您无法使用关联项目中的资源。了解如何 [重新开启已关闭的结算账号](https://docs.cloud.google.com/billing/docs/how-to/close-or-reopen-billing-account?hl=zh-cn#reopen_a_closed_billing_account) 或 [更改与项目关联的结算账号](https://docs.cloud.google.com/billing/docs/how-to/modify-project?hl=zh-cn#change_the_billing_account_for_a_project) 。

## 相关主题

如需了解如何访问所有项目的表格视图以及与每个项目关联的 Cloud Billing 账号，请参阅 [查看与结算账号关联的项目](https://docs.cloud.google.com/billing/docs/how-to/view-linked?hl=zh-cn) 。