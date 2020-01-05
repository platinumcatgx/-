/*
 Navicat Premium Data Transfer

 Source Server         : MYSQL
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : jstx

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 12/12/2019 15:02:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for friend
-- ----------------------------
DROP TABLE IF EXISTS `friend`;
CREATE TABLE `friend`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `m_id` int(11) NULL DEFAULT NULL,
  `f_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk1`(`m_id`) USING BTREE,
  INDEX `fk2`(`f_id`) USING BTREE,
  CONSTRAINT `fk1` FOREIGN KEY (`m_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk2` FOREIGN KEY (`f_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 3072 kB; (`m_id`) REFER `ljw/user`(`id`) ON UPDATE CASCADE; (`f_id`' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of friend
-- ----------------------------
INSERT INTO `friend` VALUES (1, 1, 2);
INSERT INTO `friend` VALUES (2, 1, 3);
INSERT INTO `friend` VALUES (3, 2, 3);

-- ----------------------------
-- Table structure for lt
-- ----------------------------
DROP TABLE IF EXISTS `lt`;
CREATE TABLE `lt`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `m_id` int(11) NULL DEFAULT NULL,
  `f_id` int(11) NULL DEFAULT NULL,
  `data` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk3`(`m_id`) USING BTREE,
  INDEX `fk4`(`f_id`) USING BTREE,
  CONSTRAINT `fk3` FOREIGN KEY (`m_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk4` FOREIGN KEY (`f_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 3072 kB; (`m_id`) REFER `ljw/user`(`id`) ON UPDATE CASCADE; (`f_id`' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of lt
-- ----------------------------
INSERT INTO `lt` VALUES (1, 1, 2, '测试', NULL);
INSERT INTO `lt` VALUES (2, 1, 2, '测试记录2', NULL);
INSERT INTO `lt` VALUES (3, 1, 2, 'afdljhah', '2019-12-12 12:12:08');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '1', '0');
INSERT INTO `user` VALUES (2, '2', NULL);
INSERT INTO `user` VALUES (3, '3', NULL);
INSERT INTO `user` VALUES (4, '4', NULL);
INSERT INTO `user` VALUES (5, '5', NULL);
INSERT INTO `user` VALUES (6, '6', NULL);
INSERT INTO `user` VALUES (7, '7', NULL);
INSERT INTO `user` VALUES (8, '8', NULL);
INSERT INTO `user` VALUES (9, '9', NULL);

SET FOREIGN_KEY_CHECKS = 1;
