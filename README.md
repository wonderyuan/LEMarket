# 乐享手机商城 LEMarket
### 基于Spring+Spring MVC+Mybatis+layui框架构建的手机商城系统
### 实现功能
* 前台
  * 登陆 注册 注销
  * 查看商品详情、商品评论、热销商品
  * 按照关键词搜索商品
  * 收藏、取消收藏商品
  * 加入购物车、下单
  * 购物车增删改查
  * 收藏中心
  * 分状态查看所有订单,已发货可查看快递单号
  * 支付宝付款、确认收货、删除已完成订单
  * 收货地址的增删改查
  * 修改登陆密码
  * 按照商品点击量定制猜你喜欢
  * 修改个人资料，修改头像
  * 评价已确认收货商品，带评分以及多图上传
* 后台
  * 所有后台管理展示均使用带条件查询的分页
  * 利用Echarts图表框架展示销量排行、月销售额和订单量趋势、商品浏览量和待办事件等
  * 商品管理：商品的增删改查，按照名称查找、批量删除
  * 订单管理：所有订单查看、删除、修改收货信息、发货，带日期和订单状态等的条件查询
  * 用户管理：所有用户信息的查看、删除、修改、禁用、条件查找及批量删除
  * 轮播图管理：增加、删除、修改、查看轮播图，禁用轮播以及批量删除等
  * 评论管理：查看、删除、批量删除、关键词搜索评价功能
  * 商品分类管理：增加、删除、修改、禁用、批量删除、条件搜索功能
  * 账户管理：更新管理员资料、修改密码功能
## 环境及框架
  * jdk1.8
  * tomcat8.0
  * mysql5.0
  * Spring4.2
  * Spring MVC4.2
  * Mybatis3.2.8
  * Echarts4.0
  * Redis2.9
  * layui2.3 <br/>
>本项目展示部分主要使用layui小型轻巧的前端框架构建，主要使用到layui的动态数据表格分页渲染、弹出层模块、轮播模块、评分模块、文件上传模块、laydate日期选择模块、表单验证等等，layui比bootstrap感觉更易上手，功能也更加切合项目的需求。<br/>
>项目前端展示使用Redis来进行缓存商品的详细信息以及评价，缓解数据库负载，项目运行需要在spring配置文件中配置好redis的连接信息。<br/>
>支付模块采用调用支付宝接口进行支付，需要在com.phonemarket.util.alipayconfig文件中配置应用id以及公钥私钥等配置信息，才能够正确调用支付模块，可以自行去支付宝开发平台申请开发者账户应用进行配置即可。<br/>
>本系统提供远程安装部署、问题解答等全程有偿知识服务，有意可联系QQ528290695，加Q备注《乐商城》,服务包你满意。

### 数据库设计预览

![Image text](https://github.com/wonderyuan/Image-Storage/blob/master/sql.png)

### 前台预览
![Image text](https://github.com/wonderyuan/Image-Storage/blob/master/qian1.png)
![Image text](https://github.com/wonderyuan/Image-Storage/blob/master/qian2.png)
![Image text](https://github.com/wonderyuan/Image-Storage/blob/master/qian3.png)
![Image text](https://github.com/wonderyuan/Image-Storage/blob/master/qian4.png)
![Image text](https://github.com/wonderyuan/Image-Storage/blob/master/qian5.png)
![Image text](https://github.com/wonderyuan/Image-Storage/blob/master/qian6.png)
![Image text](https://github.com/wonderyuan/Image-Storage/blob/master/qian7.png)
![Image text](https://github.com/wonderyuan/Image-Storage/blob/master/qian8.png)
![Image text](https://github.com/wonderyuan/Image-Storage/blob/master/qian9.png)
### 后台预览
![Image text](https://github.com/wonderyuan/Image-Storage/blob/master/hou1.png)
![Image text](https://github.com/wonderyuan/Image-Storage/blob/master/hou2.png)
![Image text](https://github.com/wonderyuan/Image-Storage/blob/master/hou3.png)
![Image text](https://github.com/wonderyuan/Image-Storage/blob/master/hou4.png)
![Image text](https://github.com/wonderyuan/Image-Storage/blob/master/hou5.png)
![Image text](https://github.com/wonderyuan/Image-Storage/blob/master/hou6.png)
![Image text](https://github.com/wonderyuan/Image-Storage/blob/master/hou7.png)
![Image text](https://github.com/wonderyuan/Image-Storage/blob/master/hou8.png)
