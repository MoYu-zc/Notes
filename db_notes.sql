/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50527
 Source Host           : localhost:3306
 Source Schema         : db_notes

 Target Server Type    : MySQL
 Target Server Version : 50527
 File Encoding         : 65001

 Date: 18/02/2021 21:33:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for docs
-- ----------------------------
DROP TABLE IF EXISTS `docs`;
CREATE TABLE `docs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shortcontent` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` varchar(8000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `docpath` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tags` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uid` int(4) NOT NULL,
  `doctime` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(4) NOT NULL,
  `isdel` int(4) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of docs
-- ----------------------------
INSERT INTO `docs` VALUES (4, 'java基础知识', 'java基础知识', 'java基础知识', '202002/16/20200216172009748.txt', ',javaweb', 2, '2020-02-16 17:20:56', 1, 0);
INSERT INTO `docs` VALUES (5, '图片测试', '图片测试', '图片测试', '202002/16/20200216172443854.jpg', ',我的日记', 2, '2020-02-16 17:24:49', 1, 0);
INSERT INTO `docs` VALUES (6, 'word测试', 'word测试', 'word测试', '202002/16/20200216173715543.docx', ',我的日记', 3, '2020-02-16 17:37:18', 1, 0);
INSERT INTO `docs` VALUES (7, 'ppt测试', '测试', '测试', '202002/16/20200216182708411.pptx', ',计算机资料', 3, '2020-02-16 18:27:15', 1, 0);
INSERT INTO `docs` VALUES (8, '视频测试', '视频测试', '视频测试', '202002/16/20200216192648326.avi', ',计算机资料', 2, '2020-02-16 19:26:52', 1, 0);

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(50) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tags
-- ----------------------------
INSERT INTO `tags` VALUES (1, 'javaweb', 0);
INSERT INTO `tags` VALUES (2, '技术文章', 0);
INSERT INTO `tags` VALUES (3, '学习笔记', 0);
INSERT INTO `tags` VALUES (4, '计算机资料', 0);
INSERT INTO `tags` VALUES (6, '我的日记', 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `qq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role` int(11) NOT NULL,
  `isdel` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin', '管理员', 'admin@163.com', '11', 0, 0);
INSERT INTO `user` VALUES (2, 'user01', '123', 'zc', '11@qq.com', '1', 1, 0);
INSERT INTO `user` VALUES (3, 'user02', '123', 'zcc', '99@163.com', '1', 1, 0);

SET FOREIGN_KEY_CHECKS = 1;
