/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : yourmooc

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-03-14 21:59:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_course
-- ----------------------------
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '课程名称',
  `classify` varchar(50) NOT NULL DEFAULT '' COMMENT '一级分类',
  `classify_name` varchar(100) NOT NULL DEFAULT '' COMMENT '一级分类名称',
  `sub_classify` varchar(50) NOT NULL DEFAULT '' COMMENT '二级分类',
  `sub_classify_name` varchar(100) NOT NULL DEFAULT '' COMMENT '二级分类名称',
  `username` varchar(200) NOT NULL DEFAULT '' COMMENT '归属人',
  `level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '课程级别：1-初级，2-中级，3-高级',
  `time` varchar(50) NOT NULL DEFAULT '' COMMENT '时长',
  `brief` text COMMENT '课程描述',
  `study_count` int(11) NOT NULL DEFAULT '0' COMMENT '学习人数',
  `weight` int(11) NOT NULL DEFAULT '1' COMMENT '权重',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='课程表';

-- ----------------------------
-- Records of t_course
-- ----------------------------
INSERT INTO `t_course` VALUES ('1', '1000天Java从入门到精通', 'be', '后端开发', 'java', 'Java', '李小明', '3', '2小时25分', '安卓声音录制与播放功能实现，包括录制到文件、播放文件', '338', '1');
INSERT INTO `t_course` VALUES ('2', 'Vue.js高仿饿了么外卖App', 'fe', '前端开发', 'python', 'python', '李易峰', '1', '2小时25分', 'vue.js 兼具 angular.js 和 react.js 的优点，并剔除它们的缺点', '100', '1');
INSERT INTO `t_course` VALUES ('3', '强力django打造教育平台', 'be', '后端开发', 'php', 'PHP', '王小华', '2', '2小时25分', '全面掌握django框架,轻松应对python web开发工作', '100', '22');
INSERT INTO `t_course` VALUES ('4', '高性能高可用Yii2.0电商平台', 'be', '后端开发', 'java', 'Java', '李小明', '2', '2小时25分', '进阶更高阶的Yii2.0开发，获得2-3年Yii2.0实战经验', '900', '1');
INSERT INTO `t_course` VALUES ('5', 'JSP常用标签', 'be', '后端开发', 'python', 'python', '李易峰', '1', '2小时25分', '配置及使用常用JSTL标签，这是一项必备的基本技能', '565', '1');
INSERT INTO `t_course` VALUES ('6', 'AngularJS仿拉勾网WebApp', 'be', '后端开发', 'angular', 'AngularJS', '李易峰', '2', '2小时25分', 'AngularJS仿拉勾网WebApp  开发移动端单页应用', '100', '25');
INSERT INTO `t_course` VALUES ('7', 'Java 分页原理与实践', 'be', '后端开发', 'Java', 'Java', '李小明', '1', '2小时25分', 'Java 分页原理，用Hibernate实现下拉加载分页效果', '456', '1');
INSERT INTO `t_course` VALUES ('8', '微信授权登录', 'be', '后端开发', 'java', 'Java', '李小明', '3', '2小时25分', '教你如何用Java实现微信授权登录，最后介绍公众号和开发平台如何关联', '100', '24');
INSERT INTO `t_course` VALUES ('9', 'Dwr实现JAVA服务器端向客户端推送消息', 'be', '后端开发', 'python', 'python', '李易峰', '3', '2小时25分', 'dwr轻松帮你实现server push。', '100', '1');
INSERT INTO `t_course` VALUES ('10', 'JS+CSS3实现“粽情端午”', 'be', '后端开发', 'c', 'C语言', '朱家明', '1', '2小时25分', '用JS和CSS3技术实现3D效果粽子特效动画，掌握动画制作过程', '100', '1');
INSERT INTO `t_course` VALUES ('11', 'JS实现人机大战之五子棋（UI篇）', 'be', '后端开发', 'c', 'C语言', '朱家明', '2', '2小时25分', '利用js及canvas绘图知识，实现程序界面编写和交互逻辑处理', '100', '1');
INSERT INTO `t_course` VALUES ('12', '在Ubuntu Server下搭建LAMP环境', 'be', '后端开发', 'c', 'C语言', '朱家明', '1', '2小时25分', '想学PHP要会搭建LAMP环境，本教程为你学习PHP铺平道路', '100', '1');
INSERT INTO `t_course` VALUES ('13', 'RBAC打造通用web管理权限', 'be', '后端开发', 'c', 'C语言', '朱家明', '3', '2小时25分', 'RBAC为商业系统安全防范手段，结合理论和实战介绍RBAC', '448', '1');
INSERT INTO `t_course` VALUES ('14', '轻松学会Laravel-高级篇', 'be', '后端开发', 'php', 'PHP', '李易峰', '3', '2小时25分', 'Laravel框架高级教程，介绍Laravel提供的工具和功能，快来体验', '100', '21');
INSERT INTO `t_course` VALUES ('15', '基于SSH实现员工管理系统之框架整合篇', 'be', '后端开发', 'java', 'Java', '林琳', '1', '2小时25分', '本教程主要介绍环境搭建和SSH框架整合，逐层深入理解学习', '100', '1');
INSERT INTO `t_course` VALUES ('16', 'Spring MVC起步', 'be', '后端开发', 'java', 'Java', '李小明', '1', '2小时25分', 'Java中Spring MVC框架入门教程，快来看最易用的MVC框架', '998', '1');
INSERT INTO `t_course` VALUES ('17', 'Struts2入门', 'be', '后端开发', 'java', 'Java', '林琳', '2', '2小时25分', '本教程带你踏上Struts2学习之旅，对Struts2进行更深入讲解', '100', '1');
INSERT INTO `t_course` VALUES ('18', 'Java眼中的XML文件写入', 'be', '后端开发', 'java', 'Java', '王小华', '1', '2小时25分', '举例说明JAVA程序如何生成XML文档，多种生成方式任你选择', '100', '1');
INSERT INTO `t_course` VALUES ('19', 'Java实现邮箱验证', 'be', '后端开发', 'java', 'Java', '林琳', '1', '2小时25分', '本视频教程主要介绍如何使用JavaMail进行邮箱验证，由浅入深', '1230', '1');
INSERT INTO `t_course` VALUES ('20', 'JAVA生成二维码', 'be', '后端开发', 'java', 'Java', '王小华', '1', '2小时25分', '二维码无处不在，自己动手用Java生成二维码，三种生成方式任你选', '100', '1');
INSERT INTO `t_course` VALUES ('21', 'JSP自定义标签', 'be', '后端开发', 'java', 'Java', '林琳', '1', '2小时25分', 'JSP自定义标签应用，Java Web开发中一个重要的知识点', '66', '1');
INSERT INTO `t_course` VALUES ('22', 'Java高并发秒杀API之高并发优化', 'be', '后端开发', 'java', 'Java', '刘烨华', '1', '2小时25分', 'Java实现高并发秒杀API的第四门课，小伙伴一定可以从中受益', '100', '23');
INSERT INTO `t_course` VALUES ('23', '我的测试课程我的测试课程', 'fe', '前端开发', 'jquery', 'jquery', '刘烨华', '1', '2小时25分', '我的测试课程我的测试课程我的测试课程我的测试课程我的测试', '103', '1');
INSERT INTO `t_course` VALUES ('24', '测试批量添加', 'fe', '前端开发', 'jquery', 'jquery', '李易峰', '1', '2小时25分', '我是描述我是描述', '100', '1');
INSERT INTO `t_course` VALUES ('25', '从0到1', 'fe', '前端开发', 'jquery', 'jquery', '刘烨华', '1', '2小时25分', '我是描述我是描述', '98', '1');

-- ----------------------------
-- Table structure for t_course_classify
-- ----------------------------
DROP TABLE IF EXISTS `t_course_classify`;
CREATE TABLE `t_course_classify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `code` varchar(50) NOT NULL DEFAULT '',
  `parent_code` varchar(50) NOT NULL DEFAULT '0' COMMENT '父级别code，如果值为0则代表是一级分类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='课程类别表';

-- ----------------------------
-- Records of t_course_classify
-- ----------------------------
INSERT INTO `t_course_classify` VALUES ('1', '前端开发', 'fe', '0');
INSERT INTO `t_course_classify` VALUES ('2', '后端开发', 'be', '0');
INSERT INTO `t_course_classify` VALUES ('3', '移动开发', 'mobile', '0');
INSERT INTO `t_course_classify` VALUES ('4', '数据库', 'db', '0');
INSERT INTO `t_course_classify` VALUES ('5', '云计算&大数据', 'cb', '0');
INSERT INTO `t_course_classify` VALUES ('6', 'UI设计', 'ui', '0');
INSERT INTO `t_course_classify` VALUES ('7', 'jquery', 'jquery', 'fe');
INSERT INTO `t_course_classify` VALUES ('8', 'Html5', 'html5', 'fe');
INSERT INTO `t_course_classify` VALUES ('9', 'Node.js', 'node', 'fe');
INSERT INTO `t_course_classify` VALUES ('10', 'AngularJS', 'angular', 'fe');
INSERT INTO `t_course_classify` VALUES ('11', 'Bootstrap', 'bootstrap', 'fe');
INSERT INTO `t_course_classify` VALUES ('12', 'WebApp', 'webapp', 'fe');
INSERT INTO `t_course_classify` VALUES ('13', 'PHP', 'php', 'be');
INSERT INTO `t_course_classify` VALUES ('14', 'Java', 'java', 'be');
INSERT INTO `t_course_classify` VALUES ('15', 'SpringBoot', 'springboot', 'be');
INSERT INTO `t_course_classify` VALUES ('16', 'Python', 'python', 'be');
INSERT INTO `t_course_classify` VALUES ('17', 'C', 'c', 'be');
INSERT INTO `t_course_classify` VALUES ('18', 'Go', 'go', 'be');
INSERT INTO `t_course_classify` VALUES ('19', 'IOS', 'ios', 'mobile');
INSERT INTO `t_course_classify` VALUES ('20', 'Unity 3D', 'unity3d', 'mobile');
INSERT INTO `t_course_classify` VALUES ('21', 'MySQL', 'mysql', 'db');
INSERT INTO `t_course_classify` VALUES ('22', 'MongoDB', 'mongodb', 'db');
INSERT INTO `t_course_classify` VALUES ('23', 'Oracle', 'oracle', 'db');
INSERT INTO `t_course_classify` VALUES ('24', 'SQL Server', 'sqlserver', 'db');
INSERT INTO `t_course_classify` VALUES ('25', '大数据', 'bigdata', 'cb');
INSERT INTO `t_course_classify` VALUES ('26', '云计算', 'cloud', 'cb');
INSERT INTO `t_course_classify` VALUES ('27', '动画动效', 'movie', 'ui');
INSERT INTO `t_course_classify` VALUES ('28', 'APPUI设计', 'appui', 'ui');
INSERT INTO `t_course_classify` VALUES ('29', '设计基础', 'tools', 'ui');
INSERT INTO `t_course_classify` VALUES ('30', 'Android', 'android', 'mobile');

-- ----------------------------
-- Table structure for t_course_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_course_comment`;
CREATE TABLE `t_course_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) NOT NULL DEFAULT '' COMMENT '用户username',
  `to_username` varchar(200) NOT NULL DEFAULT '' COMMENT '评论对象username',
  `course_id` int(11) NOT NULL DEFAULT '0' COMMENT '课程id',
  `section_id` int(11) NOT NULL DEFAULT '0' COMMENT '章节id',
  `section_title` varchar(200) NOT NULL DEFAULT '' COMMENT '章节标题',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '评论内容',
  `create_time` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='课程评论表';

-- ----------------------------
-- Records of t_course_comment
-- ----------------------------
INSERT INTO `t_course_comment` VALUES ('1', 'zhangsan', '李小明', '1', '12', '1-1 使用RecyclerView优雅实现复杂布局-课程介绍', '我是评论我是评论', '0000-00-00');
INSERT INTO `t_course_comment` VALUES ('2', 'lisi', '李小明', '1', '12', '1-2 Java讲的真好', '我是评论我是评论', '0000-00-00');
INSERT INTO `t_course_comment` VALUES ('3', 'zhangsan', '李小明', '1', '12', '1-2 Java讲的真好', '我是评论我是评论', '0000-00-00');
INSERT INTO `t_course_comment` VALUES ('4', 'zhangsan', '李小明', '1', '12', '1-1 使用RecyclerView优雅实现复杂布局-课程介绍', '我是评论我是评论', '0000-00-00');
INSERT INTO `t_course_comment` VALUES ('5', 'zhangsan', '李小明', '1', '12', '1-1 使用RecyclerView优雅实现复杂布局-课程介绍', '我是评论我是评论', '0000-00-00');
INSERT INTO `t_course_comment` VALUES ('6', 'zhangsan', '李小明', '1', '12', '1-1 使用RecyclerView优雅实现复杂布局-课程介绍', '我是评论我是评论', '0000-00-00');
INSERT INTO `t_course_comment` VALUES ('7', 'zhangsan', '李小明', '1', '12', '1-1 使用RecyclerView优雅实现复杂布局-课程介绍', '我是评论我是评论', '0000-00-00');
INSERT INTO `t_course_comment` VALUES ('8', 'zhangsan', '李小明', '1', '12', '1-1 使用RecyclerView优雅实现复杂布局-课程介绍', '我是评论我是评论', '0000-00-00');
INSERT INTO `t_course_comment` VALUES ('9', 'zhangsan', '李小明', '1', '12', '1-1 使用RecyclerView优雅实现复杂布局-课程介绍', '我是评论我是评论', '0000-00-00');
INSERT INTO `t_course_comment` VALUES ('10', 'zhangsan', '李小明', '1', '12', '1-1 使用RecyclerView优雅实现复杂布局-课程介绍', '我是评论我是评论', '0000-00-00');
INSERT INTO `t_course_comment` VALUES ('11', 'zhangsan', '李小明', '1', '12', '1-1 使用RecyclerView优雅实现复杂布局-课程介绍', '我是评论我是评论', '0000-00-00');
INSERT INTO `t_course_comment` VALUES ('12', 'zhangsan', '李小明', '1', '12', '1-1 使用RecyclerView优雅实现复杂布局-课程介绍', '我是评论我是评论', '0000-00-00');
INSERT INTO `t_course_comment` VALUES ('13', 'zhangsan', '李小明', '1', '12', '1-1 使用RecyclerView优雅实现复杂布局-课程介绍', '我是评论我是评论', '0000-00-00');
INSERT INTO `t_course_comment` VALUES ('14', 'zhangsan', '李小明', '1', '12', '1-1 使用RecyclerView优雅实现复杂布局-课程介绍', '我是评论我是评论', '0000-00-00');
INSERT INTO `t_course_comment` VALUES ('15', 'zhangsan', '李小明', '1', '12', '1-1 使用RecyclerView优雅实现复杂布局-课程介绍', '我是评论我是评论', '0000-00-00');
INSERT INTO `t_course_comment` VALUES ('16', 'zhangsan', '李小明', '1', '12', '1-1 使用RecyclerView优雅实现复杂布局-课程介绍', '我是评论我是评论', '0000-00-00');
INSERT INTO `t_course_comment` VALUES ('17', 'zhangsan', '李小明', '1', '12', '1-1 使用RecyclerView优雅实现复杂布局-课程介绍', '我是评论我是评论', '0000-00-00');
INSERT INTO `t_course_comment` VALUES ('18', 'zhangsan', '李小明', '1', '12', '1-1 使用RecyclerView优雅实现复杂布局-课程介绍', '我是评论我是评论', '0000-00-00');
INSERT INTO `t_course_comment` VALUES ('19', 'zhangsan', '李小明', '1', '12', '1-1 使用RecyclerView优雅实现复杂布局-课程介绍', '我是评论我是评论', '0000-00-00');
INSERT INTO `t_course_comment` VALUES ('20', 'zhangsan', '李小明', '1', '12', '1-1 使用RecyclerView优雅实现复杂布局-课程介绍', '我是评论我是评论', '0000-00-00');
INSERT INTO `t_course_comment` VALUES ('21', 'zhangsan', '李小明', '1', '12', '1-1 使用RecyclerView优雅实现复杂布局-课程介绍', '我是评论我是评论', '0000-00-00');
INSERT INTO `t_course_comment` VALUES ('22', 'zhangsan', '李小明', '1', '12', '1-1 使用RecyclerView优雅实现复杂布局-课程介绍', '我是评论我是评论', '0000-00-00');
INSERT INTO `t_course_comment` VALUES ('23', 'zhangsan', '李小明', '1', '12', '1-1 使用RecyclerView优雅实现复杂布局-课程介绍', '我是评论我是评论', '0000-00-00');
INSERT INTO `t_course_comment` VALUES ('24', 'zhangsan', '李小明', '1', '12', '1-1 使用RecyclerView优雅实现复杂布局-课程介绍', '我是评论我是评论', '0000-00-00');
INSERT INTO `t_course_comment` VALUES ('25', 'zhangsan', '李小明', '1', '12', '1-1 使用RecyclerView优雅实现复杂布局-课程介绍', '我是评论我是评论', '0000-00-00');
INSERT INTO `t_course_comment` VALUES ('26', 'zhangsan', '李小明', '1', '12', '1-1 使用RecyclerView优雅实现复杂布局-课程介绍', '我是评论我是评论', '0000-00-00');
INSERT INTO `t_course_comment` VALUES ('27', 'zhangsan', '李小明', '1', '12', '1-1 使用RecyclerView优雅实现复杂布局-课程介绍', '我是评论我是评论', '0000-00-00');
INSERT INTO `t_course_comment` VALUES ('28', 'zhangsan', '李小明', '1', '12', '1-1 使用RecyclerView优雅实现复杂布局-课程介绍', '我是评论我是评论', '0000-00-00');
INSERT INTO `t_course_comment` VALUES ('29', 'zhangsan', '李小明', '1', '12', '1-1 使用RecyclerView优雅实现复杂布局-课程介绍', '我是评论我是评论', '0000-00-00');
INSERT INTO `t_course_comment` VALUES ('30', 'zhangsan', '李小明', '1', '12', '1-1 使用RecyclerView优雅实现复杂布局-课程介绍', '我是评论我是评论', '0000-00-00');
INSERT INTO `t_course_comment` VALUES ('31', 'zhangsan', '李小明', '1', '12', '1-1 使用RecyclerView优雅实现复杂布局-课程介绍', '我是评论我是评论', '0000-00-00');

-- ----------------------------
-- Table structure for t_course_section
-- ----------------------------
DROP TABLE IF EXISTS `t_course_section`;
CREATE TABLE `t_course_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL DEFAULT '0' COMMENT '归属课程id',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父章节id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '章节名称',
  `time` varchar(50) NOT NULL DEFAULT '' COMMENT '时长',
  `video_url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='课程章节表';

-- ----------------------------
-- Records of t_course_section
-- ----------------------------
INSERT INTO `t_course_section` VALUES ('1', '1', '0', '第1章 课程介绍', '10:00', '');
INSERT INTO `t_course_section` VALUES ('2', '1', '0', '第2章 Java关键字讲解', '10:00', '');
INSERT INTO `t_course_section` VALUES ('3', '1', '0', '第3章 语法', '10:00', '');
INSERT INTO `t_course_section` VALUES ('4', '1', '0', '第4章 函数', '10:00', '');
INSERT INTO `t_course_section` VALUES ('5', '1', '0', '第5章 类', '10:00', '');
INSERT INTO `t_course_section` VALUES ('6', '1', '1', '1-1 使用RecyclerView优雅实现复杂布局-课程介绍', '10:00', 'demo.mp4');
INSERT INTO `t_course_section` VALUES ('7', '1', '1', '1-2 包括录制到文件、播放文件', '10:00', 'demo.mp4');
INSERT INTO `t_course_section` VALUES ('8', '1', '2', '2-1 使用RecyclerView优雅实现复杂布局-课程介绍', '10:00', 'demo.mp4');
INSERT INTO `t_course_section` VALUES ('9', '1', '2', '2-2 包括录制到文件、播放文件', '10:00', 'demo.mp4');
INSERT INTO `t_course_section` VALUES ('10', '1', '2', '2-3 WebGL带你走进浏览器的3D世界', '10:00', 'demo.mp4');
INSERT INTO `t_course_section` VALUES ('11', '1', '2', '2-4 WebGL带你走进浏览器的3D世界', '10:00', 'demo.mp4');
INSERT INTO `t_course_section` VALUES ('12', '1', '3', '3-1 变量的定义、赋值、运算 ', '10:00', 'demo.mp4');
INSERT INTO `t_course_section` VALUES ('13', '1', '3', '3-2 自定义对象User变量的取值 ', '10:00', 'demo.mp4');
INSERT INTO `t_course_section` VALUES ('14', '1', '3', '3-3 集合List的遍历', '10:00', 'demo.mp4');
INSERT INTO `t_course_section` VALUES ('15', '1', '3', '3-4 集合Map的遍历', '10:00', 'demo.mp4');
INSERT INTO `t_course_section` VALUES ('16', '1', '3', '3-5 if语法', '10:00', 'demo.mp4');
INSERT INTO `t_course_section` VALUES ('17', '1', '3', '3-6 switch语法', '10:00', 'demo.mp4');
INSERT INTO `t_course_section` VALUES ('18', '1', '4', '4-1 自定义函数章节简介', '10:00', 'demo.mp4');
INSERT INTO `t_course_section` VALUES ('19', '1', '4', '4-2 string基本操作指令', '10:00', 'demo.mp4');
INSERT INTO `t_course_section` VALUES ('20', '1', '4', '4-3 自定义函数', '10:00', 'demo.mp4');
INSERT INTO `t_course_section` VALUES ('21', '1', '4', '4-4 list排序内建函数、常用指令', '10:00', 'demo.mp4');
INSERT INTO `t_course_section` VALUES ('22', '1', '4', '4-5 自定义指令', '10:00', 'demo.mp4');
INSERT INTO `t_course_section` VALUES ('23', '1', '5', '5-1 类定义', '10:00', 'demo.mp4');
INSERT INTO `t_course_section` VALUES ('24', '1', '5', '5-2 类创建', '10:00', 'demo.mp4');

-- ----------------------------
-- Table structure for t_site_carousel
-- ----------------------------
DROP TABLE IF EXISTS `t_site_carousel`;
CREATE TABLE `t_site_carousel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `picture` varchar(100) NOT NULL DEFAULT '' COMMENT '图片URL',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '链接URL',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT '权重',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='首页轮播表';

-- ----------------------------
-- Records of t_site_carousel
-- ----------------------------
INSERT INTO `t_site_carousel` VALUES ('1', 'React.js入门与实战', 'c1.jpg', 'http://www.baidu.com', '5');
INSERT INTO `t_site_carousel` VALUES ('2', 'AngularJS模仿拉钩网', 'c2.jpg', 'http://www.baidu.com', '4');
INSERT INTO `t_site_carousel` VALUES ('3', '成为更高级的android工程师', 'c3.jpg', 'http://www.baidu.com', '3');
INSERT INTO `t_site_carousel` VALUES ('4', '玩转算法面试', 'c4.jpg', 'http://www.baidu.com', '2');
INSERT INTO `t_site_carousel` VALUES ('5', 'React Native开发跨平台App', 'c5.jpg', 'http://www.baidu.com', '1');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `gender` tinyint(1) NOT NULL DEFAULT '1' COMMENT '性别: 0-女；1-男',
  `header` varchar(128) NOT NULL DEFAULT '' COMMENT '头像',
  `phone` varchar(15) NOT NULL DEFAULT '' COMMENT '手机号码',
  `education` varchar(20) NOT NULL DEFAULT '' COMMENT '学历：大专及其以下、本科、硕士、博士、博士后',
  `college_name` varchar(100) NOT NULL DEFAULT '' COMMENT '大学名称',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '头衔',
  `sign` varchar(500) NOT NULL DEFAULT '' COMMENT '签名',
  `province` varchar(16) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(16) NOT NULL DEFAULT '' COMMENT '所在城市',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT '权重',
  PRIMARY KEY (`id`),
  UNIQUE KEY `T_USER_USERNAME_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='用户表(学生和教师同属于这一张表)';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '李小明', '96E79218965EB72C92A549DD5A330112', '0', 'header.jpg', '18001584130', '硕士', '中山大学', '高级讲师', '擅长人工智能', '广东省', '中山市', '20');
INSERT INTO `t_user` VALUES ('2', '王小华', '96E79218965EB72C92A549DD5A330112', '1', 'header.jpg', '18001584131', '本科', '广州大学', '中级讲师', '擅长数据挖掘', '广东省', '中山市', '19');
INSERT INTO `t_user` VALUES ('3', '朱家明', '96E79218965EB72C92A549DD5A330112', '1', 'header.jpg', '18001584132', '硕士', '广东药科大学', '特级讲师', '擅长C语言', '广东省', '中山市', '18');
INSERT INTO `t_user` VALUES ('4', '刘烨华', '96E79218965EB72C92A549DD5A330112', '0', 'header.jpg', '18001584137', '硕士', '华南理工大学', '特级讲师', '擅长C++', '广东省', '中山市', '17');
INSERT INTO `t_user` VALUES ('5', '林琳', '96E79218965EB72C92A549DD5A330112', '1', 'header.jpg', '18001584134', '本科', '武汉大学', '特级讲师', '擅长Java', '广东省', '中山市', '16');
INSERT INTO `t_user` VALUES ('6', '李易峰', '96E79218965EB72C92A549DD5A330112', '1', 'header.jpg', '18001584135', '博士后', '清华大学', '高级讲师', '擅长Web前端', '广东省', '中山市', '1');
INSERT INTO `t_user` VALUES ('7', '123456', '123456', '0', '', '', '', '', '', '', '', '', '0');
INSERT INTO `t_user` VALUES ('8', '12345uu', '12345uu', '0', '', '', '', '', '', '', '', '', '0');
INSERT INTO `t_user` VALUES ('9', 'lizhiji', 'lizhiji', '0', '', '', '', '', '', '', '', '', '0');
INSERT INTO `t_user` VALUES ('10', 'kite3', '123456', '0', '', '', '', '', '', '', '', '', '0');
INSERT INTO `t_user` VALUES ('11', 'ggg', 'gggggggg', '0', '', '', '', '', '', '', '', '', '0');

-- ----------------------------
-- Table structure for t_user_collections
-- ----------------------------
DROP TABLE IF EXISTS `t_user_collections`;
CREATE TABLE `t_user_collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `course_id` int(11) NOT NULL DEFAULT '0' COMMENT '收藏课程id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户收藏表';

-- ----------------------------
-- Records of t_user_collections
-- ----------------------------
INSERT INTO `t_user_collections` VALUES ('1', '1', '1');
INSERT INTO `t_user_collections` VALUES ('2', '1', '1');

-- ----------------------------
-- Table structure for t_user_follows
-- ----------------------------
DROP TABLE IF EXISTS `t_user_follows`;
CREATE TABLE `t_user_follows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `follow_id` int(11) NOT NULL DEFAULT '0' COMMENT '关注的用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户关注表';

-- ----------------------------
-- Records of t_user_follows
-- ----------------------------
INSERT INTO `t_user_follows` VALUES ('1', '1', '2');
INSERT INTO `t_user_follows` VALUES ('2', '1', '3');
INSERT INTO `t_user_follows` VALUES ('3', '1', '4');
INSERT INTO `t_user_follows` VALUES ('4', '1', '5');

-- ----------------------------
-- Table structure for t_user_course_section
-- ----------------------------
DROP TABLE IF EXISTS `t_user_course_section`;
CREATE TABLE `t_user_course_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `course_id` int(11) NOT NULL DEFAULT '0' COMMENT '课程id',
  `section_id` int(11) NOT NULL DEFAULT '0' COMMENT '章节id',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态：0-学习中；1-学习结束',
  `rate` int(11) NOT NULL DEFAULT '0' COMMENT '学习进度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='用户学习表，记录用户所学的课程及其课程章节';

-- ----------------------------
-- Records of t_user_study
-- ----------------------------
INSERT INTO `t_user_course_section` VALUES ('1', '1', '1', '7', '1', '50');
INSERT INTO `t_user_course_section` VALUES ('2', '1', '1', '8', '1', '60');
INSERT INTO `t_user_course_section` VALUES ('3', '1', '1', '12', '0', '0');
INSERT INTO `t_user_course_section` VALUES ('4', '1', '1', '23', '0', '0');
INSERT INTO `t_user_course_section` VALUES ('5', '2', '1', '24', '0', '0');
INSERT INTO `t_user_course_section` VALUES ('6', '2', '1', '6', '0', '0');
INSERT INTO `t_user_course_section` VALUES ('7', '3', '1', '13', '0', '0');
INSERT INTO `t_user_course_section` VALUES ('8', '3', '1', '14', '0', '0');
INSERT INTO `t_user_course_section` VALUES ('9', '1', '1', '15', '0', '0');
INSERT INTO `t_user_course_section` VALUES ('10', '4', '1', '21', '0', '0');
INSERT INTO `t_user_course_section` VALUES ('11', '4', '1', '9', '0', '0');
INSERT INTO `t_user_course_section` VALUES ('12', '1', '1', '9', '0', '0');

-- ----------------------------
-- Table structure for uu
-- ----------------------------
DROP TABLE IF EXISTS `uu`;
CREATE TABLE `uu` (
  `tid` int(11) NOT NULL AUTO_INCREMENT COMMENT '测试ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '测试名称',
  `age` tinyint(4) NOT NULL DEFAULT '0' COMMENT '测试名称',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='测试SSM框架的整合';

-- ----------------------------
-- Records of uu
-- ----------------------------
INSERT INTO `uu` VALUES ('1', '张三', '2');
INSERT INTO `uu` VALUES ('2', '李四', '3');
INSERT INTO `uu` VALUES ('3', '王五', '54');
INSERT INTO `uu` VALUES ('4', '小明', '23');
INSERT INTO `uu` VALUES ('5', '小白', '16');
INSERT INTO `uu` VALUES ('6', '小红', '34');
INSERT INTO `uu` VALUES ('7', '小小', '33');
