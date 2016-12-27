# Wilddog APIs for iOS

Wilddog 是一家实时云平台，使用野狗 SDK，只需简单调用 API 接口，就可以实现实时通信、身份验证等功能。
更多信息请参考 [https://www.wilddog.com](https://www.wilddog.com).

## 使用 CocoaPods 来安装 Wilddog SDK

Wilddog SDK 都发布在 CocoaPods。

在 OS X 系统上，你可以在终端运行下面命令来安装 CocoaPods。更多信息请参考 CocoaPods [Getting Started
guide](https://guides.cocoapods.org/using/getting-started.html#getting-started).

```
$ sudo gem install cocoapods
```


## 安装 Wilddog SDK


1. 新建一个项目并保存.
2. 在工程目录下新建一个 `Podfile` 文件。
3. 打开 `Podfile`，输入以下内容。
     
	   platform :ios, '7.0'
       pod 'Wilddog'
4. 保存 `Podfile` 文件。
5. 打开终端，输入下面命令进入工程文件目录。
   
       $ cd <path-to-project>/project/
  
 
    
6. 运行 `pod install` 命令。等待 Pod 安装 SDK。

	  $ pod install
	  
	  
7. 安装完成后找到 `.xcwordspace｀ 文件来打开项目。
8. 安装 Wilddog 其它 SDK 可在 Podfile 文件中增加以下 Pod：

	```
	pod 'Wilddog/Auth'
	pod 'Wilddog/Sync'
	```
