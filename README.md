# nodejs-mysql-wechat

基于 nodejs + mySQL + express 的商城后台 API 接口，同时支持微信小程序的商城 API 接口

#### 在线预览，请点击[API 文档](https://luotuo19880328.github.io/nodejs-mysql-wechat/)

## 安装 api 文档插件

```
npm i apidoc -g
```

## 进入项目

```
cd {项目目录}
```

## 安装依赖包，必须 cnpm

```
$ cnpm i
```

## 还原数据库

1. 在 mysql 中创建 wechat-mall 数据库
2. 将 wechat-mall.sql 文件还原至 wechat-mall 数据库
3. 在 config 文件夹 mysql.js 文件，配置数据库、账户、密码；

## 修改小程序配置

1. 注册小程序开发平台，获取小程序 appid、小程序密钥
2. 在 config 文件夹 wx.js 文件，修改成自己的 appid、小程序密钥

## 重新生成 API 文档

```
$ npm run api
```

## 启动

```
$ npm start
```

## 后台 API 文档地址

```
http://localhost:3003/api/
```

## 商城管理后台地址

```
http://localhost:3003/admin/
```

//注意修改
goods 的数据库的库存名字改了 其他页面可能需要修改 未修改 inventory
