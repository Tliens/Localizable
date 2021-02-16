

APP 国际化是一个头疼的问题，经常会做大量重复性工作，人工操作，还会造成文案更新不及时的问题，本方案就来解决国际化文案的痛点。

![](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/804edc35579440d2b746ce62ed07ad15~tplv-k3u1fbpfcp-watermark.image)

## Demo地址：

https://github.com/Tliens/Localizable

本方案特点：
- 支持iOS、Android
- 节省时间（文案交给产品自己整理去吧）
- 组件化、模块内的国际化
- 资源分类，我参考了：https://github.com/mac-cain13/R.swift  整理出一个国际化的资源文件
- 常规项目的国际化（推荐：[Stringz](https://github.com/mohakapt/Stringz))

Stringz 
缺点：
- 1.对组件化工程不友好;
- 2.仅支持Xcode apps 
- 优点：
有比较棒的 Mac版App ，可以满足iOS端的需求，非技术人员也可使用

## 使用方式

### 1、拉取最新文案
```
    node iOS_Localizable.js
```
### 2、切换到en语言包
```
   Language.shared.switch(.en)
```      
### 3、使用文本
```
    lb.text = R.string("login_name_placeholder")
```

具体查看Demo。

## 如何集成
### 一、Xcode 国际化配置文件
[国际化配置文件添加](https://www.jianshu.com/p/88c1b65e3ddb)

iOS的国际化通过不同语言的配置文件管理：如
- en.lproj/Localizable.strings
- zh-Hant.lproj/Localizable.strings

### 二、配置spreadsheets

参考我的：https://docs.google.com/spreadsheets/d/1P-Ncuz1iAcrPU6UzwDl44wiDm8mjUxo18m7lbjIDDLs/edit#gid=151941508

> 大家不要修改
![](https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/984ad8229d9840f0af653a6d842b1945~tplv-k3u1fbpfcp-watermark.image)

**注意**: 记得发布到网络

### 三、配置spreadsheets脚本

把Demo中的 `localize`、`iOS_Localizable.js`放到项目同级目录

修改`iOS_Localizable.js`文件
```
var Localize = require("./localize/index.js");

var transformer = Localize.fromGoogleSpreadsheet("1P-Ncuz1iAcrPU6UzwDl44wiDm8mjUxo18m7lbjIDDLs", '*');
transformer.setKeyCol('KEY');
transformer.save("LocalString/en.lproj/Localizable.strings", { valueCol: "EN", format: "ios" });
transformer.save("LocalString/ja.lproj/Localizable.strings", { valueCol: "JA", format: "ios" });
transformer.save("LocalString/zh-Hans.lproj/Localizable.strings", { valueCol: "CN", format: "ios" });

```

- "1P-Ncuz1iAcrPU6UzwDl44wiDm8mjUxo18m7lbjIDDLs"
为spreadsheets的名称
- "LocalString/xx.lproj/Localizable.strings" 为保存的路径

运行
```
node iOS_Localizable.js
```

将会得到以下结果：
![](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/5063cc817dc1476d91f0837452a3ce70~tplv-k3u1fbpfcp-watermark.image)

**公众号：独立开发者基地**
