#Changelog
## 8.2.0(2021-02-20)
## 增加
- 增加网络监控功能，选择最优Host进行上传
- 处理上传进度不准确问题
- 优化日志统计

## 8.1.2(2021-01-18)
## 增加
- 区域查询采用SingleFlight模式
- 增加网络链接状态检测

## 8.1.1(2021-01-06)
## 优化
- 优化日志统计

## 8.1.0(2020-12-29)
## 增加
- 支持分片V2
- 支持自定义meta
- 优化并发上传
- 解决一些并发分片上传的野指针问题

## 8.0.5(2020-11-24)
## 优化
- 优化无可用Host时的错误处理逻辑
- 缩短Host全局冻结默认时间


## 8.0.4(2020-11-03)
## 优化
- 优化Host冻结逻辑带来客户端上传超时问题，提高上传成功率

## 8.0.3(2020-09-23)
## 修正
- 修复内存峰值问题
- 优化日志上传统计

## 8.0.2(2020-09-14)
## 修正
- 修复日志上传失败问题
- 优化日志上传逻辑

## 8.0.1(2020-09-08)
## 优化
- 优化一些内存问题

## 8.0.0 (2020-08-13)
## 重构
8.0.0版本相对于7.x版本的改进：
- 优化上传流程
- 优化重试方案

8.0.0版本是在7.x版本基础上，在保证上传接口不变的条件下进行的升级，代码修改信息如下：
- 增加的内部使用类：QNHttpRegionRequest、QNUploadRequestState等
- 废弃类：QNHttpResponseInfo、QNUploadInfoReporter
- 修改了一些7.x内部使用类的API

如果您并未对7.x SDK 进行过深度定制，而是直接对接QNUploadManager进行上传，那么SDK版本升级只需要更换pod版本重新安装即可。

详细情况请参考：[iOS_Changes_from_7.x_to_8.0.0.md](./doc/iOS_Changes_from_7.x_to_8.0.0.md)

## 7.4.4 (2020-08-20)
## 修正
增加设备磁盘空间不足情况下写本地reporter文件NSHandle异常捕获


## 7.4.3 (2020-07-27)
## 优化
优化Dns预取的缓存方案

## 7.4.2 (2020-07-15)
## 修正
修改版本依赖：HappyDns -> 0.3.17
处理部分警告

## 7.4.1 (2020-06-29)
## 修正
处理内存泄漏

## 7.4.0 (2020-06-09)
## 增加
新增Dns预解析功能，上传请求大概率跳过Dns解析步骤，提高上传质量。

## 7.3.5 (2020-05-29)
## 增加
日志上报errorType新增prototol_error协议错误

## 7.3.4 (2020-05-20)
## 增加
QNResponse添加xClientId字段回调
添加network_loss.sh
## 修正
uplog up_time字段修改
uplog json format校正

## 7.3.3 (2020-05-12)
## 改变
* uplog v4版本更新

## 7.3.2 (2019-12-31)
## 改变
* v2 prequery 升级到 v3，支持跨区域双活切换
* 修改上传域名重试逻辑

## 7.3.0 (2019-11-18)
## 增加
* 并发分片上传

## 7.2.6 (2019-09-24)
## 修正
* PHAsset iOS 13 支持

## 7.2.5 (2018-08-16)
## 修正
* Form上传配置filename

## 7.2.4 (2018-05-11)
## 增加
* 新上传节点

## 7.2.3 (2017-12-21)
## 修正
* 修复uploadtoken 错误

## 7.2.2 (2017-12-07)
## 修正
* 进度回调重复

## 7.2.1 (2017-12-05)
## 修正
* 进度回调实现导致内存泄漏

## 7.2.0 (2017-12-02)
## 增加
* 增加codecov 展示
* **去掉AFNetworking依赖**

## 7.1.8 (2017-09-18)
## 修改
*audioZone zone访问对象排序更新
*chunkSize 默认增加为 2M
*putThreshold 默认增加为 4M

## 7.1.7 (2017-09-06)
## 增加
* 默认 Form 表单上传方式添加 CRC32 校验
* uc 接口 v1  版更新至 v2版
* 新增华东，华南上传互备

## 7.1.6 (2017-07-27)
## 增加
* 加入Pandora 打点支持

## 7.1.5 (2016-12-29)
## 修改
* UA 加入识别字段

## 7.1.4 (2016-11-07)
## 修改
* PHAssetResourceRequestOptions 参数类型

## 7.1.3 (2016-11-07)
## 增加
* 增加zoneNa0 北美

## 7.1.2 (2016-10-11)
## 增加
* 增加zone2 华南

## 7.1.1 (2016-09-08)
## 改变
* 修正 happydns 调用函数

## 7.1.0 (2016-07-04)
## 改变
* 依赖升级到AFNetworking 到 3.x

## 7.0.20 (2016-05-30)

### 修正
* iOS8 ipv6 问题
* 为ipv6兼容，happydns 指定为 0.3以上

## 7.0.19 (2016-05-23)

### 修正
* iOS8 ipv6 支持

## 7.0.18 (2016-05-10)

### 修正
* ipv6 支持

## 7.0.17 (2016-04-21)

### 修正
* 进度回调有时显示回退
* 隐藏GTM_Base64 类名，避免名字冲突
* 暂时去除QNStat
* 分片上传的fname

### 增加
* 从bundle 中读取 ats 配置
* 增加格式化脚本，格式化所有代码
* 增加了一个从相册选取文件上传的demo

## 7.0.16 (2015-11-21)

### 修正
* 进度回调错误

## 7.0.15 (2015-11-10)

### 修正
* 更改Reachbility的名字，避免和用户自定义的冲突

## 7.0.14 (2015-11-08)

### 增加
* 上传性能统计

## 7.0.13 (2015-10-28)

### 增加
* 禁止0字节文件上传
* ua加入idfv 便于网络诊断
* 支持PHAsset

### 修正
* HappyDns swift bridge问题
* QNHttpDelegate.h 头文件名大小写修正
* 指定AFNetworking 为2.5.＋, 因为2.6已经移除iOS 6 支持
* 变更set host 方法 
* 修正大文件上传内存泄露 
* 支持文件大小超过2G
* Fix typo in QNUploadOption constructor.

## 7.0.12 (2015-07-25)

### 增加
* 使用 happydns 进行解析
* 支持ALAsset上传，多谢 github.com/NSFish的代码

### 修正
* 当文件超过200M时，iOS上传失败

## 7.0.11.1 (2015-06-23)

### 增加
* response info 增加 user id, timestamp

## 7.0.11 (2015-06-07)

### 增加
* 上传前 检查token
* 支持指定服务器端口
* 当发现服务器不是七牛时切换到指定IP

## 7.0.10 (2015-05-23)

### 增加
* 灵活的上传设置
* 上传之前 url convert
* 域名解析失败 切换到备用IP

## 7.0.9.1 (2015-03-17)

### 修正
* cocoapods spec 增加libz

## 7.0.9 (2015-03-17)

### 修正
* dns解析函数
* 出现劫持时，非utf8 body crash

## 7.0.8 (2015-01-25)

### 增加
* QNResponseInfo 时间开销及host 记录
* 支持http代理(iOS7.0 以上)
* 代码注释
* 增加cdn 节点log
* 5xx时切换到备用服务器

## 7.0.7 (2014-12-24)

### 修正
* 上传时指定mimeType无效的问题
* 忽略上传时，value 为 空字串的key

## 7.0.6 (2014-10-31)

### 修正
* 检查因网络断开服务器返回空body或者非七牛服务器的情况
* 增加timeout

## 7.0.5 (2014-10-28)

### 修正
* ResumeUpload中httpManager weak引用造成nil
* 重构代码，更符合objc 现代方式

## 7.0.4 (2014-10-17)

### 增加
* 输入参数检查

### 废除
* 不使用undefined key

## 7.0.3 (2014-10-15)

### 增加
* 实现crc32的检查
* 上传参数检查

## 7.0.2 (2014-10-14)

### 修正
* 更新repo地址

## 7.0.1 (2014-10-13)

### 修正
* pod 安装头文件问题

## 7.0.0 (2014-10-13)

### 增加
* 简化上传接口
* 自动选择断点续上传还是直传
* 增加断点上传的记录
* 重构代码，内部结构更清晰，便于更换不同的http实现
* 项目使用Cocoapods构建，并支持Cocoapods安装
* 同时支持Mac和iOS
* 支持取消上传
