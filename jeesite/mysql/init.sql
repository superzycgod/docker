/*
 Navicat Premium Data Transfer

 Source Server         : jeesite
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : docker01:3306
 Source Schema         : jeesite

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 13/04/2020 10:50:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for js_filemanager_folder
-- ----------------------------
DROP TABLE IF EXISTS `js_filemanager_folder`;
CREATE TABLE `js_filemanager_folder`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '编号',
  `parent_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '父级编号',
  `parent_codes` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '所有父级编号',
  `tree_sort` decimal(10, 0) NOT NULL COMMENT '本级排序号（升序）',
  `tree_sorts` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '所有级别排序号',
  `tree_leaf` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '是否最末级',
  `tree_level` decimal(4, 0) NOT NULL COMMENT '层次级别',
  `tree_names` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '全节点名',
  `folder_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '文件夹名',
  `group_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '文件分组类型',
  `office_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '部门编码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注信息',
  `corp_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '租户代码',
  `corp_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'JeeSite' COMMENT '租户名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_file_tree_pc`(`parent_code`) USING BTREE,
  INDEX `idx_sys_file_tree_ts`(`tree_sort`) USING BTREE,
  INDEX `idx_sys_file_tree_tss`(`tree_sorts`) USING BTREE,
  INDEX `idx_sys_file_tree_gt`(`group_type`) USING BTREE,
  INDEX `idx_sys_file_tree_oc`(`office_code`) USING BTREE,
  INDEX `idx_sys_file_tree_cb`(`create_by`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '文件管理文件夹' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of js_filemanager_folder
-- ----------------------------
INSERT INTO `js_filemanager_folder` VALUES ('1249527212992208896', '0', '0,', 40, '0000000040,', '0', 0, '公司文件', '公司文件', 'global', NULL, '0', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL, '0', 'JeeSite');
INSERT INTO `js_filemanager_folder` VALUES ('1249527213084483584', '1249527212992208896', '0,1249527212992208896,', 30, '0000000040,0000000030,', '1', 1, '公司文件/规章制度', '规章制度', 'global', NULL, '0', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL, '0', 'JeeSite');
INSERT INTO `js_filemanager_folder` VALUES ('1249527213159981056', '1249527212992208896', '0,1249527212992208896,', 40, '0000000040,0000000040,', '1', 1, '公司文件/产品资料', '产品资料', 'global', NULL, '0', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL, '0', 'JeeSite');
INSERT INTO `js_filemanager_folder` VALUES ('1249527213218701312', '0', '0,', 50, '0000000050,', '0', 0, '员工之家', '员工之家', 'global', NULL, '0', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL, '0', 'JeeSite');
INSERT INTO `js_filemanager_folder` VALUES ('1249527213248061440', '1249527213218701312', '0,1249527213218701312,', 30, '0000000050,0000000030,', '1', 1, '员工之家/企业文化', '企业文化', 'global', NULL, '0', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL, '0', 'JeeSite');
INSERT INTO `js_filemanager_folder` VALUES ('1249527213294198784', '1249527213218701312', '0,1249527213218701312,', 40, '0000000050,0000000040,', '1', 1, '员工之家/公司活动', '公司活动', 'global', NULL, '0', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL, '0', 'JeeSite');
INSERT INTO `js_filemanager_folder` VALUES ('1249527213348724736', '0', '0,', 30, '0000000030,', '1', 0, '我的文档', '我的文档', 'self', NULL, '0', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL, '0', 'JeeSite');
INSERT INTO `js_filemanager_folder` VALUES ('1249527213378084864', '0', '0,', 40, '0000000040,', '1', 0, '我的图片', '我的图片', 'self', NULL, '0', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL, '0', 'JeeSite');

-- ----------------------------
-- Table structure for js_filemanager_shared
-- ----------------------------
DROP TABLE IF EXISTS `js_filemanager_shared`;
CREATE TABLE `js_filemanager_shared`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '编号',
  `folder_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '文件夹编码',
  `file_upload_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '文件上传编码',
  `file_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '文件或文件夹名',
  `receive_user_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '接受者用户编码',
  `receive_user_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '接收者用户名称',
  `click_num` decimal(10, 0) NULL DEFAULT NULL COMMENT '点击次数',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_file_share_ruc`(`receive_user_code`) USING BTREE,
  INDEX `idx_sys_file_share_cb`(`create_by`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '文件管理共享表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for js_gen_table
-- ----------------------------
DROP TABLE IF EXISTS `js_gen_table`;
CREATE TABLE `js_gen_table`  (
  `table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '表名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '实体类名称',
  `comments` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '表说明',
  `parent_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '关联父表的表名',
  `parent_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '本表关联父表的外键名',
  `data_source_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '数据源名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '使用的模板',
  `package_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `sub_module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '生成子模块名',
  `function_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_name_simple` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '生成功能名（简写）',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_base_dir` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '生成基础路径',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`table_name`) USING BTREE,
  INDEX `idx_gen_table_ptn`(`parent_table_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '代码生成表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of js_gen_table
-- ----------------------------
INSERT INTO `js_gen_table` VALUES ('test_data', 'TestData', '测试数据', NULL, NULL, NULL, 'crud', 'com.jeesite.modules', 'test', '', '测试数据', '数据', 'ThinkGem', NULL, '{\"isHaveDelete\":\"1\",\"isFileUpload\":\"1\",\"isHaveDisableEnable\":\"1\",\"isImageUpload\":\"1\"}', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL);
INSERT INTO `js_gen_table` VALUES ('test_data_child', 'TestDataChild', '测试数据子表', 'test_data', 'test_data_id', NULL, 'crud', 'com.jeesite.modules', 'test', '', '测试子表', '数据', 'ThinkGem', NULL, NULL, 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL);
INSERT INTO `js_gen_table` VALUES ('test_tree', 'TestTree', '测试树表', NULL, NULL, NULL, 'treeGrid', 'com.jeesite.modules', 'test', '', '测试树表', '数据', 'ThinkGem', NULL, '{\"treeViewName\":\"tree_name\",\"isHaveDelete\":\"1\",\"treeViewCode\":\"tree_code\",\"isFileUpload\":\"1\",\"isHaveDisableEnable\":\"1\",\"isImageUpload\":\"1\"}', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL);

-- ----------------------------
-- Table structure for js_gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `js_gen_table_column`;
CREATE TABLE `js_gen_table_column`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '编号',
  `table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '表名',
  `column_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '列名',
  `column_sort` decimal(10, 0) NULL DEFAULT NULL COMMENT '列排序（升序）',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '类型',
  `column_label` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '列标签名',
  `comments` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '列备注说明',
  `attr_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '类的属性名',
  `attr_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '类的属性类型',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '是否主键',
  `is_null` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '是否可为空',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '是否插入字段',
  `is_update` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '是否更新字段',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '是否列表字段',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '是否查询字段',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '查询方式',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '是否编辑字段',
  `show_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '表单类型',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gen_table_column_tn`(`table_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '代码生成表列' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of js_gen_table_column
-- ----------------------------
INSERT INTO `js_gen_table_column` VALUES ('1249527211683586048', 'test_data', 'id', 10, 'varchar(64)', '编号', '编号', 'id', 'String', '1', '0', '1', NULL, NULL, NULL, NULL, '1', 'hidden', '{\"fieldValid\":\"abc\"}');
INSERT INTO `js_gen_table_column` VALUES ('1249527211696168960', 'test_data', 'test_input', 20, 'varchar(200)', '单行文本', '单行文本', 'testInput', 'String', NULL, '1', '1', '1', '1', '1', 'LIKE', '1', 'input', NULL);
INSERT INTO `js_gen_table_column` VALUES ('1249527211712946176', 'test_data', 'test_textarea', 30, 'varchar(200)', '多行文本', '多行文本', 'testTextarea', 'String', NULL, '1', '1', '1', '1', '1', 'LIKE', '1', 'textarea', '{\"isNewLine\":\"1\",\"gridRowCol\":\"12/2/10\"}');
INSERT INTO `js_gen_table_column` VALUES ('1249527211725529088', 'test_data', 'test_select', 40, 'varchar(10)', '下拉框', '下拉框', 'testSelect', 'String', NULL, '1', '1', '1', '1', '1', NULL, '1', 'select', '{\"dictName\":\"sys_menu_type\",\"dictType\":\"sys_menu_type\"}');
INSERT INTO `js_gen_table_column` VALUES ('1249527211775860736', 'test_data', 'test_select_multiple', 50, 'varchar(200)', '下拉多选', '下拉多选', 'testSelectMultiple', 'String', NULL, '1', '1', '1', '1', '1', NULL, '1', 'select_multiple', '{\"dictName\":\"sys_menu_type\",\"dictType\":\"sys_menu_type\"}');
INSERT INTO `js_gen_table_column` VALUES ('1249527211784249344', 'test_data', 'test_radio', 60, 'varchar(10)', '单选框', '单选框', 'testRadio', 'String', NULL, '1', '1', '1', '1', '1', NULL, '1', 'radio', '{\"dictName\":\"sys_menu_type\",\"dictType\":\"sys_menu_type\"}');
INSERT INTO `js_gen_table_column` VALUES ('1249527211801026560', 'test_data', 'test_checkbox', 70, 'varchar(200)', '复选框', '复选框', 'testCheckbox', 'String', NULL, '1', '1', '1', '1', '1', NULL, '1', 'checkbox', '{\"dictName\":\"sys_menu_type\",\"dictType\":\"sys_menu_type\"}');
INSERT INTO `js_gen_table_column` VALUES ('1249527211809415168', 'test_data', 'test_date', 80, 'datetime', '日期选择', '日期选择', 'testDate', 'java.util.Date', NULL, '1', '1', '1', '1', '1', 'BETWEEN', '1', 'date', NULL);
INSERT INTO `js_gen_table_column` VALUES ('1249527211821998080', 'test_data', 'test_datetime', 90, 'datetime', '日期时间', '日期时间', 'testDatetime', 'java.util.Date', NULL, '1', '1', '1', '1', '1', 'BETWEEN', '1', 'datetime', NULL);
INSERT INTO `js_gen_table_column` VALUES ('1249527211834580992', 'test_data', 'test_user_code', 100, 'varchar(64)', '用户选择', '用户选择', 'testUser', 'com.jeesite.modules.sys.entity.User', NULL, '1', '1', '1', '1', '1', NULL, '1', 'userselect', NULL);
INSERT INTO `js_gen_table_column` VALUES ('1249527211847163904', 'test_data', 'test_office_code', 110, 'varchar(64)', '机构选择', '机构选择', 'testOffice', 'com.jeesite.modules.sys.entity.Office', NULL, '1', '1', '1', '1', '1', NULL, '1', 'officeselect', NULL);
INSERT INTO `js_gen_table_column` VALUES ('1249527211855552512', 'test_data', 'test_area_code', 120, 'varchar(64)', '区域选择', '区域选择', 'testAreaCode|testAreaName', 'String', NULL, '1', '1', '1', '1', '1', NULL, '1', 'areaselect', NULL);
INSERT INTO `js_gen_table_column` VALUES ('1249527211863941120', 'test_data', 'test_area_name', 130, 'varchar(100)', '区域名称', '区域名称', 'testAreaName', 'String', NULL, '1', '1', '1', '1', '0', 'LIKE', '0', 'input', NULL);
INSERT INTO `js_gen_table_column` VALUES ('1249527211872329728', 'test_data', 'status', 140, 'char(1)', '状态', '状态（0正常 1删除 2停用）', 'status', 'String', NULL, '0', '1', '0', '1', '1', NULL, NULL, 'select', '{\"dictName\":\"sys_search_status\",\"dictType\":\"sys_search_status\"}');
INSERT INTO `js_gen_table_column` VALUES ('1249527211884912640', 'test_data', 'create_by', 150, 'varchar(64)', '创建者', '创建者', 'createBy', 'String', NULL, '0', '1', NULL, NULL, NULL, NULL, NULL, 'input', NULL);
INSERT INTO `js_gen_table_column` VALUES ('1249527211893301248', 'test_data', 'create_date', 160, 'datetime', '创建时间', '创建时间', 'createDate', 'java.util.Date', NULL, '0', '1', NULL, NULL, NULL, NULL, NULL, 'dateselect', NULL);
INSERT INTO `js_gen_table_column` VALUES ('1249527211901689856', 'test_data', 'update_by', 170, 'varchar(64)', '更新者', '更新者', 'updateBy', 'String', NULL, '0', '1', '1', NULL, NULL, NULL, NULL, 'input', NULL);
INSERT INTO `js_gen_table_column` VALUES ('1249527211910078464', 'test_data', 'update_date', 180, 'datetime', '更新时间', '更新时间', 'updateDate', 'java.util.Date', NULL, '0', '1', '1', '1', NULL, NULL, NULL, 'dateselect', NULL);
INSERT INTO `js_gen_table_column` VALUES ('1249527211922661376', 'test_data', 'remarks', 190, 'varchar(500)', '备注信息', '备注信息', 'remarks', 'String', NULL, '1', '1', '1', '1', '1', 'LIKE', '1', 'textarea', '{\"isNewLine\":\"1\",\"gridRowCol\":\"12/2/10\"}');
INSERT INTO `js_gen_table_column` VALUES ('1249527212035907584', 'test_data_child', 'id', 10, 'varchar(64)', '编号', '编号', 'id', 'String', '1', '0', '1', NULL, NULL, NULL, NULL, '1', 'hidden', '{\"fieldValid\":\"abc\"}');
INSERT INTO `js_gen_table_column` VALUES ('1249527212061073408', 'test_data_child', 'test_sort', 20, 'int(11)', '排序号', '排序号', 'testSort', 'Long', NULL, '1', '1', '1', '1', '1', NULL, '1', 'input', '{\"fieldValid\":\"digits\"}');
INSERT INTO `js_gen_table_column` VALUES ('1249527212069462016', 'test_data_child', 'test_data_id', 30, 'varchar(64)', '父表主键', '父表主键', 'testData', 'String', NULL, '1', '1', '1', '1', '1', NULL, '1', 'input', NULL);
INSERT INTO `js_gen_table_column` VALUES ('1249527212082044928', 'test_data_child', 'test_input', 40, 'varchar(200)', '单行文本', '单行文本', 'testInput', 'String', NULL, '1', '1', '1', '1', '1', 'LIKE', '1', 'input', NULL);
INSERT INTO `js_gen_table_column` VALUES ('1249527212090433536', 'test_data_child', 'test_textarea', 50, 'varchar(200)', '多行文本', '多行文本', 'testTextarea', 'String', NULL, '1', '1', '1', '1', '1', 'LIKE', '1', 'textarea', '{\"isNewLine\":\"1\",\"gridRowCol\":\"12/2/10\"}');
INSERT INTO `js_gen_table_column` VALUES ('1249527212103016448', 'test_data_child', 'test_select', 60, 'varchar(10)', '下拉框', '下拉框', 'testSelect', 'String', NULL, '1', '1', '1', '1', '1', NULL, '1', 'select', '{\"dictName\":\"sys_menu_type\",\"dictType\":\"sys_menu_type\"}');
INSERT INTO `js_gen_table_column` VALUES ('1249527212115599360', 'test_data_child', 'test_select_multiple', 70, 'varchar(200)', '下拉多选', '下拉多选', 'testSelectMultiple', 'String', NULL, '1', '1', '1', '1', '1', NULL, '1', 'select_multiple', '{\"dictName\":\"sys_menu_type\",\"dictType\":\"sys_menu_type\"}');
INSERT INTO `js_gen_table_column` VALUES ('1249527212128182272', 'test_data_child', 'test_radio', 80, 'varchar(10)', '单选框', '单选框', 'testRadio', 'String', NULL, '1', '1', '1', '1', '1', NULL, '1', 'radio', '{\"dictName\":\"sys_menu_type\",\"dictType\":\"sys_menu_type\"}');
INSERT INTO `js_gen_table_column` VALUES ('1249527212136570880', 'test_data_child', 'test_checkbox', 90, 'varchar(200)', '复选框', '复选框', 'testCheckbox', 'String', NULL, '1', '1', '1', '1', '1', NULL, '1', 'checkbox', '{\"dictName\":\"sys_menu_type\",\"dictType\":\"sys_menu_type\"}');
INSERT INTO `js_gen_table_column` VALUES ('1249527212144959488', 'test_data_child', 'test_date', 100, 'datetime', '日期选择', '日期选择', 'testDate', 'java.util.Date', NULL, '1', '1', '1', '1', '1', 'BETWEEN', '1', 'date', NULL);
INSERT INTO `js_gen_table_column` VALUES ('1249527212149153792', 'test_data_child', 'test_datetime', 110, 'datetime', '日期时间', '日期时间', 'testDatetime', 'java.util.Date', NULL, '1', '1', '1', '1', '1', 'BETWEEN', '1', 'datetime', NULL);
INSERT INTO `js_gen_table_column` VALUES ('1249527212157542400', 'test_data_child', 'test_user_code', 120, 'varchar(64)', '用户选择', '用户选择', 'testUser', 'com.jeesite.modules.sys.entity.User', NULL, '1', '1', '1', '1', '1', NULL, '1', 'userselect', NULL);
INSERT INTO `js_gen_table_column` VALUES ('1249527212170125312', 'test_data_child', 'test_office_code', 130, 'varchar(64)', '机构选择', '机构选择', 'testOffice', 'com.jeesite.modules.sys.entity.Office', NULL, '1', '1', '1', '1', '1', NULL, '1', 'officeselect', NULL);
INSERT INTO `js_gen_table_column` VALUES ('1249527212178513920', 'test_data_child', 'test_area_code', 140, 'varchar(64)', '区域选择', '区域选择', 'testAreaCode|testAreaName', 'String', NULL, '1', '1', '1', '1', '1', NULL, '1', 'areaselect', NULL);
INSERT INTO `js_gen_table_column` VALUES ('1249527212186902528', 'test_data_child', 'test_area_name', 150, 'varchar(100)', '区域名称', '区域名称', 'testAreaName', 'String', NULL, '1', '1', '1', '1', '0', 'LIKE', '0', 'input', NULL);
INSERT INTO `js_gen_table_column` VALUES ('1249527212295954432', 'test_tree', 'tree_code', 10, 'varchar(64)', '节点编码', '节点编码', 'treeCode', 'String', '1', '0', '1', NULL, NULL, NULL, NULL, '1', 'input', '{\"fieldValid\":\"abc\"}');
INSERT INTO `js_gen_table_column` VALUES ('1249527212304343040', 'test_tree', 'parent_code', 20, 'varchar(64)', '父级编号', '父级编号', 'parentCode|parentName', 'This', NULL, '0', '1', '1', NULL, NULL, NULL, NULL, 'treeselect', NULL);
INSERT INTO `js_gen_table_column` VALUES ('1249527212312731648', 'test_tree', 'parent_codes', 30, 'varchar(1000)', '所有父级编号', '所有父级编号', 'parentCodes', 'String', NULL, '0', '1', '1', NULL, NULL, 'LIKE', '0', 'input', NULL);
INSERT INTO `js_gen_table_column` VALUES ('1249527212316925952', 'test_tree', 'tree_sort', 40, 'decimal(10,0)', '本级排序号', '本级排序号（升序）', 'treeSort', 'Integer', NULL, '0', '1', '1', '1', NULL, NULL, '1', 'input', '{\"fieldValid\":\"digits\"}');
INSERT INTO `js_gen_table_column` VALUES ('1249527212325314560', 'test_tree', 'tree_sorts', 50, 'varchar(1000)', '所有级别排序号', '所有级别排序号', 'treeSorts', 'String', NULL, '0', '1', '1', '0', NULL, NULL, '0', 'input', NULL);
INSERT INTO `js_gen_table_column` VALUES ('1249527212337897472', 'test_tree', 'tree_leaf', 60, 'char(1)', '是否最末级', '是否最末级', 'treeLeaf', 'String', NULL, '0', '1', '1', NULL, NULL, NULL, NULL, 'input', NULL);
INSERT INTO `js_gen_table_column` VALUES ('1249527212346286080', 'test_tree', 'tree_level', 70, 'decimal(4,0)', '层次级别', '层次级别', 'treeLevel', 'Integer', NULL, '0', '1', '1', NULL, NULL, NULL, NULL, 'input', '{\"fieldValid\":\"digits\"}');
INSERT INTO `js_gen_table_column` VALUES ('1249527212354674688', 'test_tree', 'tree_names', 80, 'varchar(1000)', '全节点名', '全节点名', 'treeNames', 'String', NULL, '0', '1', '1', NULL, '1', 'LIKE', NULL, 'input', NULL);
INSERT INTO `js_gen_table_column` VALUES ('1249527212363063296', 'test_tree', 'tree_name', 90, 'varchar(200)', '节点名称', '节点名称', 'treeName', 'String', NULL, '0', '1', '1', '1', '1', 'LIKE', '1', 'input', NULL);
INSERT INTO `js_gen_table_column` VALUES ('1249527212371451904', 'test_tree', 'status', 100, 'char(1)', '状态', '状态（0正常 1删除 2停用）', 'status', 'String', NULL, '0', '1', '0', '1', '1', NULL, NULL, 'select', '{\"dictName\":\"sys_search_status\",\"dictType\":\"sys_search_status\"}');
INSERT INTO `js_gen_table_column` VALUES ('1249527212384034816', 'test_tree', 'create_by', 110, 'varchar(64)', '创建者', '创建者', 'createBy', 'String', NULL, '0', '1', NULL, NULL, NULL, NULL, NULL, 'input', NULL);
INSERT INTO `js_gen_table_column` VALUES ('1249527212392423424', 'test_tree', 'create_date', 120, 'datetime', '创建时间', '创建时间', 'createDate', 'java.util.Date', NULL, '0', '1', NULL, NULL, NULL, NULL, NULL, 'dateselect', NULL);
INSERT INTO `js_gen_table_column` VALUES ('1249527212400812032', 'test_tree', 'update_by', 130, 'varchar(64)', '更新者', '更新者', 'updateBy', 'String', NULL, '0', '1', '1', NULL, NULL, NULL, NULL, 'input', NULL);
INSERT INTO `js_gen_table_column` VALUES ('1249527212409200640', 'test_tree', 'update_date', 140, 'datetime', '更新时间', '更新时间', 'updateDate', 'java.util.Date', NULL, '0', '1', '1', '1', NULL, NULL, NULL, 'dateselect', NULL);
INSERT INTO `js_gen_table_column` VALUES ('1249527212417589248', 'test_tree', 'remarks', 150, 'varchar(500)', '备注信息', '备注信息', 'remarks', 'String', NULL, '1', '1', '1', '1', '1', 'LIKE', '1', 'textarea', '{\"isNewLine\":\"1\",\"gridRowCol\":\"12/2/10\"}');

-- ----------------------------
-- Table structure for js_job_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `js_job_blob_triggers`;
CREATE TABLE `js_job_blob_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `js_job_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `js_job_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for js_job_calendars
-- ----------------------------
DROP TABLE IF EXISTS `js_job_calendars`;
CREATE TABLE `js_job_calendars`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for js_job_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `js_job_cron_triggers`;
CREATE TABLE `js_job_cron_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `js_job_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `js_job_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for js_job_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `js_job_fired_triggers`;
CREATE TABLE `js_job_fired_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TRIG_INST_NAME`(`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY`(`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_FT_J_G`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_T_G`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TG`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for js_job_job_details
-- ----------------------------
DROP TABLE IF EXISTS `js_job_job_details`;
CREATE TABLE `js_job_job_details`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_J_REQ_RECOVERY`(`SCHED_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_J_GRP`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for js_job_locks
-- ----------------------------
DROP TABLE IF EXISTS `js_job_locks`;
CREATE TABLE `js_job_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for js_job_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `js_job_paused_trigger_grps`;
CREATE TABLE `js_job_paused_trigger_grps`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for js_job_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `js_job_scheduler_state`;
CREATE TABLE `js_job_scheduler_state`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for js_job_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `js_job_simple_triggers`;
CREATE TABLE `js_job_simple_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `js_job_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `js_job_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for js_job_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `js_job_simprop_triggers`;
CREATE TABLE `js_job_simprop_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `INT_PROP_1` int(11) NULL DEFAULT NULL,
  `INT_PROP_2` int(11) NULL DEFAULT NULL,
  `LONG_PROP_1` bigint(20) NULL DEFAULT NULL,
  `LONG_PROP_2` bigint(20) NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `js_job_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `js_job_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for js_job_triggers
-- ----------------------------
DROP TABLE IF EXISTS `js_job_triggers`;
CREATE TABLE `js_job_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PRIORITY` int(11) NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_J`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_C`(`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_T_G`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_STATE`(`SCHED_NAME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_STATE`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_G_STATE`(`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME`(`SCHED_NAME`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST`(`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `js_job_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `js_job_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for js_sys_area
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_area`;
CREATE TABLE `js_sys_area`  (
  `area_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '区域编码',
  `parent_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '父级编号',
  `parent_codes` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '所有父级编号',
  `tree_sort` decimal(10, 0) NOT NULL COMMENT '本级排序号（升序）',
  `tree_sorts` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '所有级别排序号',
  `tree_leaf` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '是否最末级',
  `tree_level` decimal(4, 0) NOT NULL COMMENT '层次级别',
  `tree_names` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '全节点名',
  `area_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '区域名称',
  `area_type` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '区域类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`area_code`) USING BTREE,
  INDEX `idx_sys_area_pc`(`parent_code`) USING BTREE,
  INDEX `idx_sys_area_ts`(`tree_sort`) USING BTREE,
  INDEX `idx_sys_area_status`(`status`) USING BTREE,
  INDEX `idx_sys_area_pcs`(`parent_codes`) USING BTREE,
  INDEX `idx_sys_area_tss`(`tree_sorts`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '行政区划' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of js_sys_area
-- ----------------------------
INSERT INTO `js_sys_area` VALUES ('370000', '0', '0,', 370000, '0000370000,', '0', 0, '山东省', '山东省', '1', '0', 'system', '2020-04-13 10:37:47', 'system', '2020-04-13 10:37:47', NULL);
INSERT INTO `js_sys_area` VALUES ('370100', '370000', '0,370000,', 370100, '0000370000,0000370100,', '0', 1, '山东省/济南市', '济南市', '2', '0', 'system', '2020-04-13 10:37:47', 'system', '2020-04-13 10:37:47', NULL);
INSERT INTO `js_sys_area` VALUES ('370102', '370100', '0,370000,370100,', 370102, '0000370000,0000370100,0000370102,', '1', 2, '山东省/济南市/历下区', '历下区', '3', '0', 'system', '2020-04-13 10:37:47', 'system', '2020-04-13 10:37:47', NULL);
INSERT INTO `js_sys_area` VALUES ('370103', '370100', '0,370000,370100,', 370103, '0000370000,0000370100,0000370103,', '1', 2, '山东省/济南市/市中区', '市中区', '3', '0', 'system', '2020-04-13 10:37:47', 'system', '2020-04-13 10:37:47', NULL);
INSERT INTO `js_sys_area` VALUES ('370104', '370100', '0,370000,370100,', 370104, '0000370000,0000370100,0000370104,', '1', 2, '山东省/济南市/槐荫区', '槐荫区', '3', '0', 'system', '2020-04-13 10:37:47', 'system', '2020-04-13 10:37:47', NULL);
INSERT INTO `js_sys_area` VALUES ('370105', '370100', '0,370000,370100,', 370105, '0000370000,0000370100,0000370105,', '1', 2, '山东省/济南市/天桥区', '天桥区', '3', '0', 'system', '2020-04-13 10:37:47', 'system', '2020-04-13 10:37:47', NULL);
INSERT INTO `js_sys_area` VALUES ('370112', '370100', '0,370000,370100,', 370112, '0000370000,0000370100,0000370112,', '1', 2, '山东省/济南市/历城区', '历城区', '3', '0', 'system', '2020-04-13 10:37:47', 'system', '2020-04-13 10:37:47', NULL);
INSERT INTO `js_sys_area` VALUES ('370113', '370100', '0,370000,370100,', 370113, '0000370000,0000370100,0000370113,', '1', 2, '山东省/济南市/长清区', '长清区', '3', '0', 'system', '2020-04-13 10:37:47', 'system', '2020-04-13 10:37:47', NULL);
INSERT INTO `js_sys_area` VALUES ('370114', '370100', '0,370000,370100,', 370114, '0000370000,0000370100,0000370114,', '1', 2, '山东省/济南市/章丘区', '章丘区', '3', '0', 'system', '2020-04-13 10:37:47', 'system', '2020-04-13 10:37:47', NULL);
INSERT INTO `js_sys_area` VALUES ('370124', '370100', '0,370000,370100,', 370124, '0000370000,0000370100,0000370124,', '1', 2, '山东省/济南市/平阴县', '平阴县', '3', '0', 'system', '2020-04-13 10:37:47', 'system', '2020-04-13 10:37:47', NULL);
INSERT INTO `js_sys_area` VALUES ('370125', '370100', '0,370000,370100,', 370125, '0000370000,0000370100,0000370125,', '1', 2, '山东省/济南市/济阳县', '济阳县', '3', '0', 'system', '2020-04-13 10:37:47', 'system', '2020-04-13 10:37:47', NULL);
INSERT INTO `js_sys_area` VALUES ('370126', '370100', '0,370000,370100,', 370126, '0000370000,0000370100,0000370126,', '1', 2, '山东省/济南市/商河县', '商河县', '3', '0', 'system', '2020-04-13 10:37:47', 'system', '2020-04-13 10:37:47', NULL);
INSERT INTO `js_sys_area` VALUES ('370200', '370000', '0,370000,', 370200, '0000370000,0000370200,', '0', 1, '山东省/青岛市', '青岛市', '2', '0', 'system', '2020-04-13 10:37:47', 'system', '2020-04-13 10:37:47', NULL);
INSERT INTO `js_sys_area` VALUES ('370202', '370200', '0,370000,370200,', 370202, '0000370000,0000370200,0000370202,', '1', 2, '山东省/青岛市/市南区', '市南区', '3', '0', 'system', '2020-04-13 10:37:47', 'system', '2020-04-13 10:37:47', NULL);
INSERT INTO `js_sys_area` VALUES ('370203', '370200', '0,370000,370200,', 370203, '0000370000,0000370200,0000370203,', '1', 2, '山东省/青岛市/市北区', '市北区', '3', '0', 'system', '2020-04-13 10:37:47', 'system', '2020-04-13 10:37:47', NULL);
INSERT INTO `js_sys_area` VALUES ('370211', '370200', '0,370000,370200,', 370211, '0000370000,0000370200,0000370211,', '1', 2, '山东省/青岛市/黄岛区', '黄岛区', '3', '0', 'system', '2020-04-13 10:37:47', 'system', '2020-04-13 10:37:47', NULL);
INSERT INTO `js_sys_area` VALUES ('370212', '370200', '0,370000,370200,', 370212, '0000370000,0000370200,0000370212,', '1', 2, '山东省/青岛市/崂山区', '崂山区', '3', '0', 'system', '2020-04-13 10:37:48', 'system', '2020-04-13 10:37:48', NULL);
INSERT INTO `js_sys_area` VALUES ('370213', '370200', '0,370000,370200,', 370213, '0000370000,0000370200,0000370213,', '1', 2, '山东省/青岛市/李沧区', '李沧区', '3', '0', 'system', '2020-04-13 10:37:48', 'system', '2020-04-13 10:37:48', NULL);
INSERT INTO `js_sys_area` VALUES ('370214', '370200', '0,370000,370200,', 370214, '0000370000,0000370200,0000370214,', '1', 2, '山东省/青岛市/城阳区', '城阳区', '3', '0', 'system', '2020-04-13 10:37:48', 'system', '2020-04-13 10:37:48', NULL);
INSERT INTO `js_sys_area` VALUES ('370281', '370200', '0,370000,370200,', 370281, '0000370000,0000370200,0000370281,', '1', 2, '山东省/青岛市/胶州市', '胶州市', '3', '0', 'system', '2020-04-13 10:37:48', 'system', '2020-04-13 10:37:48', NULL);
INSERT INTO `js_sys_area` VALUES ('370282', '370200', '0,370000,370200,', 370282, '0000370000,0000370200,0000370282,', '1', 2, '山东省/青岛市/即墨区', '即墨区', '3', '0', 'system', '2020-04-13 10:37:48', 'system', '2020-04-13 10:37:48', NULL);
INSERT INTO `js_sys_area` VALUES ('370283', '370200', '0,370000,370200,', 370283, '0000370000,0000370200,0000370283,', '1', 2, '山东省/青岛市/平度市', '平度市', '3', '0', 'system', '2020-04-13 10:37:48', 'system', '2020-04-13 10:37:48', NULL);
INSERT INTO `js_sys_area` VALUES ('370285', '370200', '0,370000,370200,', 370285, '0000370000,0000370200,0000370285,', '1', 2, '山东省/青岛市/莱西市', '莱西市', '3', '0', 'system', '2020-04-13 10:37:48', 'system', '2020-04-13 10:37:48', NULL);

-- ----------------------------
-- Table structure for js_sys_company
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_company`;
CREATE TABLE `js_sys_company`  (
  `company_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公司编码',
  `parent_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '父级编号',
  `parent_codes` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '所有父级编号',
  `tree_sort` decimal(10, 0) NOT NULL COMMENT '本级排序号（升序）',
  `tree_sorts` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '所有级别排序号',
  `tree_leaf` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '是否最末级',
  `tree_level` decimal(4, 0) NOT NULL COMMENT '层次级别',
  `tree_names` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '全节点名',
  `view_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公司代码',
  `company_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公司名称',
  `full_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公司全称',
  `area_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '区域编码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注信息',
  `corp_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '租户代码',
  `corp_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'JeeSite' COMMENT '租户名称',
  `extend_s1` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 1',
  `extend_s2` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 2',
  `extend_s3` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 3',
  `extend_s4` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 4',
  `extend_s5` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 5',
  `extend_s6` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 6',
  `extend_s7` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 7',
  `extend_s8` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 8',
  `extend_i1` decimal(19, 0) NULL DEFAULT NULL COMMENT '扩展 Integer 1',
  `extend_i2` decimal(19, 0) NULL DEFAULT NULL COMMENT '扩展 Integer 2',
  `extend_i3` decimal(19, 0) NULL DEFAULT NULL COMMENT '扩展 Integer 3',
  `extend_i4` decimal(19, 0) NULL DEFAULT NULL COMMENT '扩展 Integer 4',
  `extend_f1` decimal(19, 4) NULL DEFAULT NULL COMMENT '扩展 Float 1',
  `extend_f2` decimal(19, 4) NULL DEFAULT NULL COMMENT '扩展 Float 2',
  `extend_f3` decimal(19, 4) NULL DEFAULT NULL COMMENT '扩展 Float 3',
  `extend_f4` decimal(19, 4) NULL DEFAULT NULL COMMENT '扩展 Float 4',
  `extend_d1` datetime(0) NULL DEFAULT NULL COMMENT '扩展 Date 1',
  `extend_d2` datetime(0) NULL DEFAULT NULL COMMENT '扩展 Date 2',
  `extend_d3` datetime(0) NULL DEFAULT NULL COMMENT '扩展 Date 3',
  `extend_d4` datetime(0) NULL DEFAULT NULL COMMENT '扩展 Date 4',
  PRIMARY KEY (`company_code`) USING BTREE,
  INDEX `idx_sys_company_cc`(`corp_code`) USING BTREE,
  INDEX `idx_sys_company_pc`(`parent_code`) USING BTREE,
  INDEX `idx_sys_company_ts`(`tree_sort`) USING BTREE,
  INDEX `idx_sys_company_status`(`status`) USING BTREE,
  INDEX `idx_sys_company_vc`(`view_code`) USING BTREE,
  INDEX `idx_sys_company_pcs`(`parent_codes`) USING BTREE,
  INDEX `idx_sys_company_tss`(`tree_sorts`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '公司表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of js_sys_company
-- ----------------------------
INSERT INTO `js_sys_company` VALUES ('SD', '0', '0,', 40, '0000000040,', '0', 0, '山东公司', 'SD', '山东公司', '山东公司', NULL, '0', 'system', '2020-04-13 10:37:56', 'system', '2020-04-13 10:37:56', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_company` VALUES ('SDJN', 'SD', '0,SD,', 30, '0000000040,0000000030,', '1', 1, '山东公司/济南公司', 'SDJN', '济南公司', '山东济南公司', NULL, '0', 'system', '2020-04-13 10:37:56', 'system', '2020-04-13 10:37:56', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_company` VALUES ('SDQD', 'SD', '0,SD,', 40, '0000000040,0000000040,', '1', 1, '山东公司/青岛公司', 'SDQD', '青岛公司', '山东青岛公司', NULL, '0', 'system', '2020-04-13 10:37:56', 'system', '2020-04-13 10:37:56', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for js_sys_company_office
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_company_office`;
CREATE TABLE `js_sys_company_office`  (
  `company_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公司编码',
  `office_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '机构编码',
  PRIMARY KEY (`company_code`, `office_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '公司部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for js_sys_config
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_config`;
CREATE TABLE `js_sys_config`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '编号',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '参数键',
  `config_value` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '参数值',
  `is_sys` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '系统内置（1是 0否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_sys_config_key`(`config_key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of js_sys_config
-- ----------------------------
INSERT INTO `js_sys_config` VALUES ('1249527173771272192', '研发工具-代码生成默认包名', 'gen.defaultPackageName', 'com.jeesite.modules', '0', 'system', '2020-04-13 10:37:48', 'system', '2020-04-13 10:37:48', '新建项目后，修改该键值，在生成代码的时候就不要再修改了');
INSERT INTO `js_sys_config` VALUES ('1249527173964210176', '主框架页-桌面仪表盘首页地址', 'sys.index.desktopUrl', '/desktop', '0', 'system', '2020-04-13 10:37:48', 'system', '2020-04-13 10:37:48', '主页面的第一个页签首页桌面地址');
INSERT INTO `js_sys_config` VALUES ('1249527174077456384', '主框架页-主导航菜单显示风格', 'sys.index.menuStyle', '1', '0', 'system', '2020-04-13 10:37:48', 'system', '2020-04-13 10:37:48', '1：菜单全部在左侧；2：根菜单显示在顶部');
INSERT INTO `js_sys_config` VALUES ('1249527174199091200', '主框架页-侧边栏的默认显示样式', 'sys.index.sidebarStyle', '1', '0', 'system', '2020-04-13 10:37:48', 'system', '2020-04-13 10:37:48', '1：默认显示侧边栏；2：默认折叠侧边栏');
INSERT INTO `js_sys_config` VALUES ('1249527174316531712', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue-light2', '0', 'system', '2020-04-13 10:37:48', 'system', '2020-04-13 10:37:48', '蓝：skin-blue、黑：skin-black2、白：skin-black、紫：skin-purple、绿：skin-green、红：skin-red、黄：skin-yellow、蓝灰：skin-blue-light、黑灰：skin-black-light2、白灰：skin-black-light、紫灰：skin-purple-light、绿灰：skin-green-light、红灰：skin-red-light、黄灰skin-yellow-light、浅蓝：skin-blue-light2');
INSERT INTO `js_sys_config` VALUES ('1249527174433972224', '用户登录-登录失败多少次数后显示验证码', 'sys.login.failedNumAfterValidCode', '100', '0', 'system', '2020-04-13 10:37:48', 'system', '2020-04-13 10:37:48', '设置为0强制使用验证码登录');
INSERT INTO `js_sys_config` VALUES ('1249527174534635520', '用户登录-登录失败多少次数后锁定账号', 'sys.login.failedNumAfterLockAccount', '200', '0', 'system', '2020-04-13 10:37:48', 'system', '2020-04-13 10:37:48', '登录失败多少次数后锁定账号');
INSERT INTO `js_sys_config` VALUES ('1249527174639493120', '用户登录-登录失败多少次数后锁定账号的时间', 'sys.login.failedNumAfterLockMinute', '20', '0', 'system', '2020-04-13 10:37:48', 'system', '2020-04-13 10:37:48', '锁定账号的时间（单位：分钟）');
INSERT INTO `js_sys_config` VALUES ('1249527174752739328', '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', '0', 'system', '2020-04-13 10:37:48', 'system', '2020-04-13 10:37:48', '是否开启注册用户功能');
INSERT INTO `js_sys_config` VALUES ('1249527174849208320', '账号自助-允许自助注册的用户类型', 'sys.account.registerUser.userTypes', 'member', '0', 'system', '2020-04-13 10:37:48', 'system', '2020-04-13 10:37:48', '允许注册的用户类型（多个用逗号隔开，例如：employee,member）');
INSERT INTO `js_sys_config` VALUES ('1249527174983426048', '账号自助-验证码有效时间（分钟）', 'sys.account.validCodeTimeout', '10', '0', 'system', '2020-04-13 10:37:48', 'system', '2020-04-13 10:37:48', '找回密码时，短信/邮件验证码有效时间（单位：分钟，0表示不限制）');
INSERT INTO `js_sys_config` VALUES ('1249527175155392512', '用户管理-账号默认角色-员工类型', 'sys.user.defaultRoleCodes.employee', 'default', '0', 'system', '2020-04-13 10:37:48', 'system', '2020-04-13 10:37:48', '所有员工用户都拥有的角色权限（适用于菜单授权查询）');
INSERT INTO `js_sys_config` VALUES ('1249527175247667200', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', '0', 'system', '2020-04-13 10:37:48', 'system', '2020-04-13 10:37:48', '创建用户和重置密码的时候用户的密码');
INSERT INTO `js_sys_config` VALUES ('1249527175348330496', '用户管理-初始密码修改策略', 'sys.user.initPasswordModify', '1', '0', 'system', '2020-04-13 10:37:48', 'system', '2020-04-13 10:37:48', '0：初始密码修改策略关闭，没有任何提示；1：提醒用户，如果未修改初始密码，则在登录时和点击菜单就会提醒修改密码对话框；2：强制实行初始密码修改，登录后若不修改密码则不能进行系统操作');
INSERT INTO `js_sys_config` VALUES ('1249527175461576704', '用户管理-账号密码修改策略', 'sys.user.passwordModify', '1', '0', 'system', '2020-04-13 10:37:48', 'system', '2020-04-13 10:37:48', '0：密码修改策略关闭，没有任何提示；1：提醒用户，如果未修改初始密码，则在登录时和点击菜单就会提醒修改密码对话框；2：强制实行初始密码修改，登录后若不修改密码则不能进行系统操作。');
INSERT INTO `js_sys_config` VALUES ('1249527175570628608', '用户管理-账号密码修改策略验证周期', 'sys.user.passwordModifyCycle', '30', '0', 'system', '2020-04-13 10:37:48', 'system', '2020-04-13 10:37:48', '密码安全修改周期是指定时间内提醒或必须修改密码（例如设置30天）的验证时间（天），超过这个时间登录系统时需，提醒用户修改密码或强制修改密码才能继续使用系统。单位：天，如果设置30天，则第31天开始强制修改密码');
INSERT INTO `js_sys_config` VALUES ('1249527175662903296', '用户管理-密码修改多少次内不允许重复', 'sys.user.passwordModifyNotRepeatNum', '1', '0', 'system', '2020-04-13 10:37:48', 'system', '2020-04-13 10:37:48', '默认1次，表示不能与上次密码重复；若设置为3，表示并与前3次密码重复');
INSERT INTO `js_sys_config` VALUES ('1249527175767760896', '用户管理-账号密码修改最低安全等级', 'sys.user.passwordModifySecurityLevel', '0', '0', 'system', '2020-04-13 10:37:48', 'system', '2020-04-13 10:37:48', '0：不限制等级（用户在修改密码的时候不进行等级验证）\r；1：限制最低等级为很弱\r；2：限制最低等级为弱\r；3：限制最低等级为安全\r；4：限制最低等级为很安全');

-- ----------------------------
-- Table structure for js_sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_dict_data`;
CREATE TABLE `js_sys_dict_data`  (
  `dict_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '字典编码',
  `parent_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '父级编号',
  `parent_codes` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '所有父级编号',
  `tree_sort` decimal(10, 0) NOT NULL COMMENT '本级排序号（升序）',
  `tree_sorts` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '所有级别排序号',
  `tree_leaf` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '是否最末级',
  `tree_level` decimal(4, 0) NOT NULL COMMENT '层次级别',
  `tree_names` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '全节点名',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '字典类型',
  `is_sys` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '系统内置（1是 0否）',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '字典描述',
  `css_style` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'css样式（如：color:red)',
  `css_class` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'css类名（如：red）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注信息',
  `corp_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '租户代码',
  `corp_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'JeeSite' COMMENT '租户名称',
  `extend_s1` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 1',
  `extend_s2` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 2',
  `extend_s3` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 3',
  `extend_s4` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 4',
  `extend_s5` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 5',
  `extend_s6` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 6',
  `extend_s7` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 7',
  `extend_s8` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 8',
  `extend_i1` decimal(19, 0) NULL DEFAULT NULL COMMENT '扩展 Integer 1',
  `extend_i2` decimal(19, 0) NULL DEFAULT NULL COMMENT '扩展 Integer 2',
  `extend_i3` decimal(19, 0) NULL DEFAULT NULL COMMENT '扩展 Integer 3',
  `extend_i4` decimal(19, 0) NULL DEFAULT NULL COMMENT '扩展 Integer 4',
  `extend_f1` decimal(19, 4) NULL DEFAULT NULL COMMENT '扩展 Float 1',
  `extend_f2` decimal(19, 4) NULL DEFAULT NULL COMMENT '扩展 Float 2',
  `extend_f3` decimal(19, 4) NULL DEFAULT NULL COMMENT '扩展 Float 3',
  `extend_f4` decimal(19, 4) NULL DEFAULT NULL COMMENT '扩展 Float 4',
  `extend_d1` datetime(0) NULL DEFAULT NULL COMMENT '扩展 Date 1',
  `extend_d2` datetime(0) NULL DEFAULT NULL COMMENT '扩展 Date 2',
  `extend_d3` datetime(0) NULL DEFAULT NULL COMMENT '扩展 Date 3',
  `extend_d4` datetime(0) NULL DEFAULT NULL COMMENT '扩展 Date 4',
  PRIMARY KEY (`dict_code`) USING BTREE,
  INDEX `idx_sys_dict_data_cc`(`corp_code`) USING BTREE,
  INDEX `idx_sys_dict_data_dt`(`dict_type`) USING BTREE,
  INDEX `idx_sys_dict_data_pc`(`parent_code`) USING BTREE,
  INDEX `idx_sys_dict_data_status`(`status`) USING BTREE,
  INDEX `idx_sys_dict_data_pcs`(`parent_codes`) USING BTREE,
  INDEX `idx_sys_dict_data_ts`(`tree_sort`) USING BTREE,
  INDEX `idx_sys_dict_data_tss`(`tree_sorts`) USING BTREE,
  INDEX `idx_sys_dict_data_dv`(`dict_value`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of js_sys_dict_data
-- ----------------------------
INSERT INTO `js_sys_dict_data` VALUES ('1249527181019029504', '0', '0,', 30, '0000000030,', '1', 0, '是', '是', '1', 'sys_yes_no', '1', '', '', '', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527181404905472', '0', '0,', 40, '0000000040,', '1', 0, '否', '否', '0', 'sys_yes_no', '1', '', 'color:#aaa;', '', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527181501374464', '0', '0,', 20, '0000000020,', '1', 0, '正常', '正常', '0', 'sys_status', '1', '', '', '', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527181576871936', '0', '0,', 30, '0000000030,', '1', 0, '删除', '删除', '1', 'sys_status', '1', '', 'color:#f00;', '', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527181652369408', '0', '0,', 40, '0000000040,', '1', 0, '停用', '停用', '2', 'sys_status', '1', '', 'color:#f00;', '', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527181732061184', '0', '0,', 50, '0000000050,', '1', 0, '冻结', '冻结', '3', 'sys_status', '1', '', 'color:#fa0;', '', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527181824335872', '0', '0,', 60, '0000000060,', '1', 0, '待审', '待审', '4', 'sys_status', '1', '', '', '', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527181904027648', '0', '0,', 70, '0000000070,', '1', 0, '驳回', '驳回', '5', 'sys_status', '1', '', '', '', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527181979525120', '0', '0,', 80, '0000000080,', '1', 0, '草稿', '草稿', '9', 'sys_status', '1', '', 'color:#aaa;', '', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527182197628928', '0', '0,', 30, '0000000030,', '1', 0, '显示', '显示', '1', 'sys_show_hide', '1', '', '', '', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527182260543488', '0', '0,', 40, '0000000040,', '1', 0, '隐藏', '隐藏', '0', 'sys_show_hide', '1', '', 'color:#aaa;', '', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527182323458048', '0', '0,', 30, '0000000030,', '1', 0, '简体中文', '简体中文', 'zh_CN', 'sys_lang_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527182373789696', '0', '0,', 40, '0000000040,', '1', 0, 'English', 'English', 'en', 'sys_lang_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527182445092864', '0', '0,', 60, '0000000060,', '1', 0, '日本語', '日本語', 'ja_JP', 'sys_lang_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527182516396032', '0', '0,', 30, '0000000030,', '1', 0, 'PC电脑', 'PC电脑', 'pc', 'sys_device_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527182570921984', '0', '0,', 40, '0000000040,', '1', 0, '手机APP', '手机APP', 'mobileApp', 'sys_device_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527182650613760', '0', '0,', 50, '0000000050,', '1', 0, '手机Web', '手机Web', 'mobileWeb', 'sys_device_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527182709334016', '0', '0,', 60, '0000000060,', '1', 0, '微信设备', '微信设备', 'weixin', 'sys_device_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527182768054272', '0', '0,', 30, '0000000030,', '1', 0, '主导航菜单', '主导航菜单', 'default', 'sys_menu_sys_code', '1', '', '', '', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527182830968832', '0', '0,', 30, '0000000030,', '1', 0, '菜单', '菜单', '1', 'sys_menu_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527182885494784', '0', '0,', 40, '0000000040,', '1', 0, '权限', '权限', '2', 'sys_menu_type', '1', '', 'color:#c243d6;', '', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527182940020736', '0', '0,', 30, '0000000030,', '1', 0, '默认权重', '默认权重', '20', 'sys_menu_weight', '1', '', '', '', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527183015518208', '0', '0,', 40, '0000000040,', '1', 0, '二级管理员', '二级管理员', '40', 'sys_menu_weight', '1', '', '', '', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527183078432768', '0', '0,', 50, '0000000050,', '1', 0, '系统管理员', '系统管理员', '60', 'sys_menu_weight', '1', '', '', '', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527183141347328', '0', '0,', 60, '0000000060,', '1', 0, '超级管理员', '超级管理员', '80', 'sys_menu_weight', '1', '', 'color:#c243d6;', '', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527183212650496', '0', '0,', 30, '0000000030,', '1', 0, '国家', '国家', '0', 'sys_area_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527183283953664', '0', '0,', 40, '0000000040,', '1', 0, '省份直辖市', '省份直辖市', '1', 'sys_area_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527183346868224', '0', '0,', 50, '0000000050,', '1', 0, '地市', '地市', '2', 'sys_area_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527183409782784', '0', '0,', 60, '0000000060,', '1', 0, '区县', '区县', '3', 'sys_area_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527183481085952', '0', '0,', 30, '0000000030,', '1', 0, '省级公司', '省级公司', '1', 'sys_office_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527183544000512', '0', '0,', 40, '0000000040,', '1', 0, '市级公司', '市级公司', '2', 'sys_office_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527183602720768', '0', '0,', 50, '0000000050,', '1', 0, '部门', '部门', '3', 'sys_office_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527183653052416', '0', '0,', 30, '0000000030,', '1', 0, '正常', '正常', '0', 'sys_search_status', '1', '', '', '', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527183703384064', '0', '0,', 40, '0000000040,', '1', 0, '停用', '停用', '2', 'sys_search_status', '1', '', 'color:#f00;', '', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527183753715712', '0', '0,', 30, '0000000030,', '1', 0, '男', '男', '1', 'sys_user_sex', '1', '', '', '', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527183804047360', '0', '0,', 40, '0000000040,', '1', 0, '女', '女', '2', 'sys_user_sex', '1', '', '', '', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527183875350528', '0', '0,', 30, '0000000030,', '1', 0, '正常', '正常', '0', 'sys_user_status', '1', '', '', '', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527183934070784', '0', '0,', 40, '0000000040,', '1', 0, '停用', '停用', '2', 'sys_user_status', '1', '', 'color:#f00;', '', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527183992791040', '0', '0,', 50, '0000000050,', '1', 0, '冻结', '冻结', '3', 'sys_user_status', '1', '', 'color:#fa0;', '', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527184064094208', '0', '0,', 30, '0000000030,', '1', 0, '员工', '员工', 'employee', 'sys_user_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527184131203072', '0', '0,', 40, '0000000040,', '1', 0, '会员', '会员', 'member', 'sys_user_type', '1', '', '', '', '2', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527184210894848', '0', '0,', 50, '0000000050,', '1', 0, '单位', '单位', 'btype', 'sys_user_type', '1', '', '', '', '2', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527184294780928', '0', '0,', 60, '0000000060,', '1', 0, '个人', '个人', 'persion', 'sys_user_type', '1', '', '', '', '2', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527184353501184', '0', '0,', 70, '0000000070,', '1', 0, '专家', '专家', 'expert', 'sys_user_type', '1', '', '', '', '2', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527184416415744', '0', '0,', 30, '0000000030,', '1', 0, '高管', '高管', '1', 'sys_role_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527184470941696', '0', '0,', 40, '0000000040,', '1', 0, '中层', '中层', '2', 'sys_role_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527184538050560', '0', '0,', 50, '0000000050,', '1', 0, '基层', '基层', '3', 'sys_role_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527184588382208', '0', '0,', 60, '0000000060,', '1', 0, '其它', '其它', '4', 'sys_role_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527184642908160', '0', '0,', 30, '0000000030,', '1', 0, '未设置', '未设置', '0', 'sys_role_data_scope', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527184722599936', '0', '0,', 40, '0000000040,', '1', 0, '全部数据', '全部数据', '1', 'sys_role_data_scope', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527184789708800', '0', '0,', 50, '0000000050,', '1', 0, '自定义数据', '自定义数据', '2', 'sys_role_data_scope', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527184861011968', '0', '0,', 60, '0000000060,', '1', 0, '本部门数据', '本部门数据', '3', 'sys_role_data_scope', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527184953286656', '0', '0,', 70, '0000000070,', '1', 0, '本公司数据', '本公司数据', '4', 'sys_role_data_scope', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527185024589824', '0', '0,', 80, '0000000080,', '1', 0, '本部门和本公司数据', '本部门和本公司数据', '5', 'sys_role_data_scope', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527185095892992', '0', '0,', 30, '0000000030,', '1', 0, '组织管理', '组织管理', 'office_user', 'sys_role_biz_scope', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527185158807552', '0', '0,', 30, '0000000030,', '1', 0, '高管', '高管', '1', 'sys_post_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527185221722112', '0', '0,', 40, '0000000040,', '1', 0, '中层', '中层', '2', 'sys_post_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527185280442368', '0', '0,', 50, '0000000050,', '1', 0, '基层', '基层', '3', 'sys_post_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527185339162624', '0', '0,', 60, '0000000060,', '1', 0, '其它', '其它', '4', 'sys_post_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527185397882880', '0', '0,', 30, '0000000030,', '1', 0, '接入日志', '接入日志', 'access', 'sys_log_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527185460797440', '0', '0,', 40, '0000000040,', '1', 0, '修改日志', '修改日志', 'update', 'sys_log_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527185527906304', '0', '0,', 50, '0000000050,', '1', 0, '查询日志', '查询日志', 'select', 'sys_log_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527185582432256', '0', '0,', 60, '0000000060,', '1', 0, '登录登出', '登录登出', 'loginLogout', 'sys_log_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527185662124032', '0', '0,', 30, '0000000030,', '1', 0, '默认', '默认', 'DEFAULT', 'sys_job_group', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527185720844288', '0', '0,', 40, '0000000040,', '1', 0, '系统', '系统', 'SYSTEM', 'sys_job_group', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527185792147456', '0', '0,', 30, '0000000030,', '1', 0, '错过计划等待本次计划完成后立即执行一次', '错过计划等待本次计划完成后立即执行一次', '1', 'sys_job_misfire_instruction', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527185863450624', '0', '0,', 40, '0000000040,', '1', 0, '本次执行时间根据上次结束时间重新计算（时间间隔方式）', '本次执行时间根据上次结束时间重新计算（时间间隔方式）', '2', 'sys_job_misfire_instruction', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527185922170880', '0', '0,', 30, '0000000030,', '1', 0, '正常', '正常', '0', 'sys_job_status', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527185985085440', '0', '0,', 40, '0000000040,', '1', 0, '删除', '删除', '1', 'sys_job_status', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527186048000000', '0', '0,', 50, '0000000050,', '1', 0, '暂停', '暂停', '2', 'sys_job_status', '1', '', 'color:#f00;', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527186110914560', '0', '0,', 30, '0000000030,', '1', 0, '完成', '完成', '3', 'sys_job_status', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527186182217728', '0', '0,', 40, '0000000040,', '1', 0, '错误', '错误', '4', 'sys_job_status', '1', '', 'color:#f00;', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527186240937984', '0', '0,', 50, '0000000050,', '1', 0, '运行', '运行', '5', 'sys_job_status', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527186312241152', '0', '0,', 30, '0000000030,', '1', 0, '计划日志', '计划日志', 'scheduler', 'sys_job_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527186383544320', '0', '0,', 40, '0000000040,', '1', 0, '任务日志', '任务日志', 'job', 'sys_job_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527186446458880', '0', '0,', 50, '0000000050,', '1', 0, '触发日志', '触发日志', 'trigger', 'sys_job_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527186500984832', '0', '0,', 30, '0000000030,', '1', 0, '计划创建', '计划创建', 'jobScheduled', 'sys_job_event', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527186559705088', '0', '0,', 40, '0000000040,', '1', 0, '计划移除', '计划移除', 'jobUnscheduled', 'sys_job_event', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527186626813952', '0', '0,', 50, '0000000050,', '1', 0, '计划暂停', '计划暂停', 'triggerPaused', 'sys_job_event', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527186689728512', '0', '0,', 60, '0000000060,', '1', 0, '计划恢复', '计划恢复', 'triggerResumed', 'sys_job_event', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527186752643072', '0', '0,', 70, '0000000070,', '1', 0, '调度错误', '调度错误', 'schedulerError', 'sys_job_event', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527186811363328', '0', '0,', 80, '0000000080,', '1', 0, '任务执行', '任务执行', 'jobToBeExecuted', 'sys_job_event', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527186878472192', '0', '0,', 90, '0000000090,', '1', 0, '任务结束', '任务结束', 'jobWasExecuted', 'sys_job_event', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527186941386752', '0', '0,', 100, '0000000100,', '1', 0, '任务停止', '任务停止', 'jobExecutionVetoed', 'sys_job_event', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527187008495616', '0', '0,', 110, '0000000110,', '1', 0, '触发计划', '触发计划', 'triggerFired', 'sys_job_event', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527187067215872', '0', '0,', 120, '0000000120,', '1', 0, '触发验证', '触发验证', 'vetoJobExecution', 'sys_job_event', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527187138519040', '0', '0,', 130, '0000000130,', '1', 0, '触发完成', '触发完成', 'triggerComplete', 'sys_job_event', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527187201433600', '0', '0,', 140, '0000000140,', '1', 0, '触发错过', '触发错过', 'triggerMisfired', 'sys_job_event', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527187268542464', '0', '0,', 30, '0000000030,', '1', 0, 'PC', 'PC', 'pc', 'sys_msg_type', '1', '消息类型', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527187339845632', '0', '0,', 40, '0000000040,', '1', 0, 'APP', 'APP', 'app', 'sys_msg_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527187394371584', '0', '0,', 50, '0000000050,', '1', 0, '短信', '短信', 'sms', 'sys_msg_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527187465674752', '0', '0,', 60, '0000000060,', '1', 0, '邮件', '邮件', 'email', 'sys_msg_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527187536977920', '0', '0,', 70, '0000000070,', '1', 0, '微信', '微信', 'weixin', 'sys_msg_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527187591503872', '0', '0,', 30, '0000000030,', '1', 0, '待推送', '待推送', '0', 'sys_msg_push_status', '1', '推送状态', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527187646029824', '0', '0,', 30, '0000000030,', '1', 0, '成功', '成功', '1', 'sys_msg_push_status', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527187713138688', '0', '0,', 40, '0000000040,', '1', 0, '失败', '失败', '2', 'sys_msg_push_status', '1', '', 'color:#f00;', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527187784441856', '0', '0,', 30, '0000000030,', '1', 0, '未送达', '未送达', '0', 'sys_msg_read_status', '1', '读取状态', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527187843162112', '0', '0,', 40, '0000000040,', '1', 0, '已读', '已读', '1', 'sys_msg_read_status', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527187906076672', '0', '0,', 50, '0000000050,', '1', 0, '未读', '未读', '2', 'sys_msg_read_status', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527187960602624', '0', '0,', 30, '0000000030,', '1', 0, '普通', '普通', '1', 'msg_inner_content_level', '1', '内容级别', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527188036100096', '0', '0,', 40, '0000000040,', '1', 0, '一般', '一般', '2', 'msg_inner_content_level', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527188094820352', '0', '0,', 50, '0000000050,', '1', 0, '紧急', '紧急', '3', 'msg_inner_content_level', '1', '', 'color:#f00;', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527188153540608', '0', '0,', 30, '0000000030,', '1', 0, '公告', '公告', '1', 'msg_inner_content_type', '1', '内容类型', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527188216455168', '0', '0,', 40, '0000000040,', '1', 0, '新闻', '新闻', '2', 'msg_inner_content_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527188270981120', '0', '0,', 50, '0000000050,', '1', 0, '会议', '会议', '3', 'msg_inner_content_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527188333895680', '0', '0,', 60, '0000000060,', '1', 0, '其它', '其它', '4', 'msg_inner_content_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527188413587456', '0', '0,', 30, '0000000030,', '1', 0, '全部', '全部', '0', 'msg_inner_receiver_type', '1', '接受类型', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527188463919104', '0', '0,', 30, '0000000030,', '1', 0, '用户', '用户', '1', 'msg_inner_receiver_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:51', 'system', '2020-04-13 10:37:51', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527188522639360', '0', '0,', 40, '0000000040,', '1', 0, '部门', '部门', '2', 'msg_inner_receiver_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527188581359616', '0', '0,', 50, '0000000050,', '1', 0, '角色', '角色', '3', 'msg_inner_receiver_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527188640079872', '0', '0,', 60, '0000000060,', '1', 0, '岗位', '岗位', '4', 'msg_inner_receiver_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527188707188736', '0', '0,', 30, '0000000030,', '1', 0, '正常', '正常', '0', 'msg_inner_msg_status', '1', '消息状态', '', '', '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527188770103296', '0', '0,', 40, '0000000040,', '1', 0, '删除', '删除', '1', 'msg_inner_msg_status', '1', '', '', '', '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527188833017856', '0', '0,', 50, '0000000050,', '1', 0, '审核', '审核', '4', 'msg_inner_msg_status', '1', '', '', '', '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527188895932416', '0', '0,', 60, '0000000060,', '1', 0, '驳回', '驳回', '5', 'msg_inner_msg_status', '1', '', 'color:#f00;', '', '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527188958846976', '0', '0,', 70, '0000000070,', '1', 0, '草稿', '草稿', '9', 'msg_inner_msg_status', '1', '', '', '', '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527189017567232', '0', '0,', 30, '0000000030,', '1', 0, '公共文件柜', '公共文件柜', 'global', 'filemanager_group_type', '1', '文件组类型', '', '', '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527189072093184', '0', '0,', 40, '0000000040,', '1', 0, '个人文件柜', '个人文件柜', 'self', 'filemanager_group_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527189139202048', '0', '0,', 50, '0000000050,', '1', 0, '部门文件柜', '部门文件柜', 'office', 'filemanager_group_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527189189533696', '0', '0,', 30, '0000000030,', '1', 0, '活动', '活动', '1', 'bpm_def_status', '1', '', '', '', '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527189239865344', '0', '0,', 60, '0000000060,', '1', 0, '挂起', '挂起', '2', 'bpm_def_status', '1', '', 'color:#f00;', '', '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527189529272320', '0', '0,', 30, '0000000030,', '1', 0, '进行', '进行', '1', 'bpm_ins_status', '1', '', 'color:#f00;', '', '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527189596381184', '0', '0,', 60, '0000000060,', '1', 0, '结束', '结束', '2', 'bpm_ins_status', '1', '', 'color:#aaa;', '', '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527189650907136', '0', '0,', 30, '0000000030,', '1', 0, 'URL表单', 'URL表单', 'url', 'bpm_form_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527189705433088', '0', '0,', 30, '0000000030,', '1', 0, '已完成', '已完成', '0', 'bpm_biz_status', '1', '', '', '', '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527189755764736', '0', '0,', 60, '0000000060,', '1', 0, '审核中', '审核中', '4', 'bpm_biz_status', '1', '', 'color:#f00;', '', '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527189806096384', '0', '0,', 80, '0000000080,', '1', 0, '已退回', '已退回', '5', 'bpm_biz_status', '1', '', 'color:#a00;', '', '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527189864816640', '0', '0,', 120, '0000000120,', '1', 0, '已终止', '已终止', '1', 'bpm_biz_status', '1', '', 'color:#aaa;', '', '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527189931925504', '0', '0,', 260, '0000000260,', '1', 0, '草稿', '草稿', '9', 'bpm_biz_status', '1', '', 'color:#aaa;', '', '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527189994840064', '0', '0,', 30, '0000000030,', '1', 0, '一般', '一般', '50', 'bpm_task_priority', '1', '', '', '', '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527190057754624', '0', '0,', 60, '0000000060,', '1', 0, '重要', '重要', '100', 'bpm_task_priority', '1', '', 'color:#f0f;', '', '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527190120669184', '0', '0,', 90, '0000000090,', '1', 0, '紧急', '紧急', '150', 'bpm_task_priority', '1', '', 'color:#f00;', '', '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527190171000832', '0', '0,', 30, '0000000030,', '1', 0, '待办', '待办', '1', 'bpm_task_status', '1', '', 'color:#f00;', '', '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527190225526784', '0', '0,', 60, '0000000060,', '1', 0, '已办', '已办', '2', 'bpm_task_status', '1', '', 'color:#aaa;', '', '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527190280052736', '0', '0,', 30, '0000000030,', '1', 0, '流程启动', '流程启动', 'PROCESS_STARTED', 'bpm_event_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527190330384384', '0', '0,', 60, '0000000060,', '1', 0, '流程完成', '流程完成', 'PROCESS_COMPLETED', 'bpm_event_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527190376521728', '0', '0,', 90, '0000000090,', '1', 0, '流程取消', '流程取消', 'PROCESS_CANCELLED', 'bpm_event_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527190426853376', '0', '0,', 200, '0000000200,', '1', 0, '任务分配', '任务分配', 'TASK_ASSIGNED', 'bpm_event_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527190477185024', '0', '0,', 220, '0000000220,', '1', 0, '任务创建', '任务创建', 'TASK_CREATED', 'bpm_event_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527190535905280', '0', '0,', 250, '0000000250,', '1', 0, '任务完成', '任务完成', 'TASK_COMPLETED', 'bpm_event_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527190590431232', '0', '0,', 30, '0000000030,', '1', 0, 'Groovy', 'Groovy', 'groovy', 'bpm_script_lang', '1', '', '', '', '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527190640762880', '0', '0,', 60, '0000000060,', '1', 0, 'Beetl', 'Beetl', 'beetl', 'bpm_script_lang', '1', '', '', '', '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527190691094528', '0', '0,', 30, '0000000030,', '1', 0, '系统脚本', '系统脚本', 'sys', 'bpm_script_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_dict_data` VALUES ('1249527190737231872', '0', '0,', 60, '0000000060,', '1', 0, '流程脚本', '流程脚本', 'bpm', 'bpm_script_type', '1', '', '', '', '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for js_sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_dict_type`;
CREATE TABLE `js_sys_dict_type`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '编号',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '字典类型',
  `is_sys` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '是否系统字典',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_dict_type_is`(`is_sys`) USING BTREE,
  INDEX `idx_sys_dict_type_status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of js_sys_dict_type
-- ----------------------------
INSERT INTO `js_sys_dict_type` VALUES ('1249527178062045184', '是否', 'sys_yes_no', '1', '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_dict_type` VALUES ('1249527178250788864', '状态', 'sys_status', '1', '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_dict_type` VALUES ('1249527178317897728', '显示隐藏', 'sys_show_hide', '1', '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_dict_type` VALUES ('1249527178368229376', '国际化语言类型', 'sys_lang_type', '1', '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_dict_type` VALUES ('1249527178426949632', '客户端设备类型', 'sys_device_type', '1', '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_dict_type` VALUES ('1249527178473086976', '菜单归属系统', 'sys_menu_sys_code', '1', '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_dict_type` VALUES ('1249527178519224320', '菜单类型', 'sys_menu_type', '1', '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_dict_type` VALUES ('1249527178573750272', '菜单权重', 'sys_menu_weight', '1', '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_dict_type` VALUES ('1249527178624081920', '区域类型', 'sys_area_type', '1', '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_dict_type` VALUES ('1249527178666024960', '机构类型', 'sys_office_type', '1', '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_dict_type` VALUES ('1249527178716356608', '查询状态', 'sys_search_status', '1', '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_dict_type` VALUES ('1249527178762493952', '用户性别', 'sys_user_sex', '1', '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_dict_type` VALUES ('1249527178812825600', '用户状态', 'sys_user_status', '1', '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_dict_type` VALUES ('1249527178863157248', '用户类型', 'sys_user_type', '1', '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_dict_type` VALUES ('1249527178913488896', '角色分类', 'sys_role_type', '1', '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_dict_type` VALUES ('1249527178980597760', '角色数据范围', 'sys_role_data_scope', '1', '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_dict_type` VALUES ('1249527179035123712', '角色业务范围', 'sys_role_biz_scope', '1', '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_dict_type` VALUES ('1249527179081261056', '岗位分类', 'sys_post_type', '1', '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_dict_type` VALUES ('1249527179127398400', '日志类型', 'sys_log_type', '1', '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_dict_type` VALUES ('1249527179190312960', '作业分组', 'sys_job_group', '1', '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_dict_type` VALUES ('1249527179244838912', '作业错过策略', 'sys_job_misfire_instruction', '1', '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_dict_type` VALUES ('1249527179290976256', '作业状态', 'sys_job_status', '1', '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_dict_type` VALUES ('1249527179341307904', '作业任务类型', 'sys_job_type', '1', '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_dict_type` VALUES ('1249527179395833856', '作业任务事件', 'sys_job_event', '1', '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_dict_type` VALUES ('1249527179441971200', '消息类型', 'sys_msg_type', '1', '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_dict_type` VALUES ('1249527179496497152', '推送状态', 'sys_msg_push_status', '1', '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_dict_type` VALUES ('1249527179542634496', '读取状态', 'sys_msg_read_status', '1', '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_dict_type` VALUES ('1249527179588771840', '内容级别', 'msg_inner_content_level', '1', '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_dict_type` VALUES ('1249527179643297792', '内容类型', 'msg_inner_content_type', '1', '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_dict_type` VALUES ('1249527179702018048', '接受类型', 'msg_inner_receiver_type', '1', '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_dict_type` VALUES ('1249527179756544000', '消息状态', 'msg_inner_msg_status', '1', '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_dict_type` VALUES ('1249527179798487040', '文件组类型', 'filemanager_group_type', '1', '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_dict_type` VALUES ('1249527179853012992', '流程定义状态', 'bpm_def_status', '1', '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_dict_type` VALUES ('1249527179899150336', '流程实例状态', 'bpm_ins_status', '1', '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_dict_type` VALUES ('1249527179957870592', '流程表单类型', 'bpm_form_type', '1', '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_dict_type` VALUES ('1249527180004007936', '流程业务状态', 'bpm_biz_status', '1', '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_dict_type` VALUES ('1249527180054339584', '流程任务优先级', 'bpm_task_priority', '1', '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_dict_type` VALUES ('1249527180100476928', '流程任务状态', 'bpm_task_status', '1', '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_dict_type` VALUES ('1249527180150808576', '流程事件类型', 'bpm_event_type', '1', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL);
INSERT INTO `js_sys_dict_type` VALUES ('1249527180201140224', '流程脚本类型', 'bpm_script_type', '1', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL);
INSERT INTO `js_sys_dict_type` VALUES ('1249527180251471872', '流程脚本语言', 'bpm_script_lang', '1', '0', 'system', '2020-04-13 10:37:50', 'system', '2020-04-13 10:37:50', NULL);

-- ----------------------------
-- Table structure for js_sys_employee
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_employee`;
CREATE TABLE `js_sys_employee`  (
  `emp_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '员工编码',
  `emp_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '员工姓名',
  `emp_name_en` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '员工英文名',
  `emp_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '员工工号',
  `office_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '机构编码',
  `office_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '机构名称',
  `company_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '公司编码',
  `company_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '公司名称',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '状态（0在职 1删除 2离职）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注信息',
  `corp_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '租户代码',
  `corp_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'JeeSite' COMMENT '租户名称',
  PRIMARY KEY (`emp_code`) USING BTREE,
  INDEX `idx_sys_employee_cco`(`company_code`) USING BTREE,
  INDEX `idx_sys_employee_cc`(`corp_code`) USING BTREE,
  INDEX `idx_sys_employee_ud`(`update_date`) USING BTREE,
  INDEX `idx_sys_employee_oc`(`office_code`) USING BTREE,
  INDEX `idx_sys_employee_status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '员工表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of js_sys_employee
-- ----------------------------
INSERT INTO `js_sys_employee` VALUES ('user1_zuuo', '用户01', NULL, 'user1_zuuo', 'SDJN01', '企管部', 'SDJN', '济南公司', '0', 'system', '2020-04-13 10:37:56', 'system', '2020-04-13 10:37:56', NULL, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user10_xbpb', '用户10', NULL, 'user10_xbpb', 'SDJN03', '研发部', 'SDJN', '济南公司', '0', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user11_bhh4', '用户11', NULL, 'user11_bhh4', 'SDJN03', '研发部', 'SDJN', '济南公司', '0', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user12_ld7g', '用户12', NULL, 'user12_ld7g', 'SDJN03', '研发部', 'SDJN', '济南公司', '0', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user13_sist', '用户13', NULL, 'user13_sist', 'SDJN03', '研发部', 'SDJN', '济南公司', '0', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user14_vdez', '用户14', NULL, 'user14_vdez', 'SDJN03', '研发部', 'SDJN', '济南公司', '0', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user15_tcbl', '用户15', '', 'user15_tcbl', 'SDQD01', '企管部', 'SDQD', '青岛公司', '0', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:42:16', NULL, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user16_wvt0', '用户16', NULL, 'user16_wvt0', 'SDQD01', '企管部', 'SDQD', '青岛公司', '0', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user17_st6p', '用户17', NULL, 'user17_st6p', 'SDQD01', '企管部', 'SDQD', '青岛公司', '0', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user18_psfv', '用户18', NULL, 'user18_psfv', 'SDQD02', '财务部', 'SDQD', '青岛公司', '0', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user19_i3rf', '用户19', NULL, 'user19_i3rf', 'SDQD02', '财务部', 'SDQD', '青岛公司', '0', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user2_kahq', '用户02', NULL, 'user2_kahq', 'SDJN01', '企管部', 'SDJN', '济南公司', '0', 'system', '2020-04-13 10:37:56', 'system', '2020-04-13 10:37:56', NULL, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user20_sjny', '用户20', NULL, 'user20_sjny', 'SDQD02', '财务部', 'SDQD', '青岛公司', '0', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user21_5q2n', '用户21', NULL, 'user21_5q2n', 'SDQD03', '研发部', 'SDQD', '青岛公司', '0', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user22_18tp', '用户22', NULL, 'user22_18tp', 'SDQD03', '研发部', 'SDQD', '青岛公司', '0', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user23_lp52', '用户23', NULL, 'user23_lp52', 'SDQD03', '研发部', 'SDQD', '青岛公司', '0', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user3_vepf', '用户03', NULL, 'user3_vepf', 'SDJN01', '企管部', 'SDJN', '济南公司', '0', 'system', '2020-04-13 10:37:56', 'system', '2020-04-13 10:37:56', NULL, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user4_x3hb', '用户04', NULL, 'user4_x3hb', 'SDJN02', '财务部', 'SDJN', '济南公司', '0', 'system', '2020-04-13 10:37:56', 'system', '2020-04-13 10:37:56', NULL, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user5_asl8', '用户05', NULL, 'user5_asl8', 'SDJN02', '财务部', 'SDJN', '济南公司', '0', 'system', '2020-04-13 10:37:56', 'system', '2020-04-13 10:37:56', NULL, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user6_fc4r', '用户06', NULL, 'user6_fc4r', 'SDJN02', '财务部', 'SDJN', '济南公司', '0', 'system', '2020-04-13 10:37:56', 'system', '2020-04-13 10:37:56', NULL, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user7_mykw', '用户07', NULL, 'user7_mykw', 'SDJN03', '研发部', 'SDJN', '济南公司', '0', 'system', '2020-04-13 10:37:56', 'system', '2020-04-13 10:37:56', NULL, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user8_tdzz', '用户08', NULL, 'user8_tdzz', 'SDJN03', '研发部', 'SDJN', '济南公司', '0', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user9_df62', '用户09', NULL, 'user9_df62', 'SDJN03', '研发部', 'SDJN', '济南公司', '0', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL, '0', 'JeeSite');

-- ----------------------------
-- Table structure for js_sys_employee_office
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_employee_office`;
CREATE TABLE `js_sys_employee_office`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '编号',
  `emp_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '员工编码',
  `office_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '机构编码',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '岗位编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '员工附属机构关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for js_sys_employee_post
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_employee_post`;
CREATE TABLE `js_sys_employee_post`  (
  `emp_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '员工编码',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '岗位编码',
  PRIMARY KEY (`emp_code`, `post_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '员工与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of js_sys_employee_post
-- ----------------------------
INSERT INTO `js_sys_employee_post` VALUES ('user1_zuuo', 'dept');
INSERT INTO `js_sys_employee_post` VALUES ('user10_xbpb', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user11_bhh4', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user12_ld7g', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user13_sist', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user14_vdez', 'dept');
INSERT INTO `js_sys_employee_post` VALUES ('user15_tcbl', 'dept');
INSERT INTO `js_sys_employee_post` VALUES ('user16_wvt0', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user17_st6p', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user18_psfv', 'dept');
INSERT INTO `js_sys_employee_post` VALUES ('user19_i3rf', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user2_kahq', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user20_sjny', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user21_5q2n', 'dept');
INSERT INTO `js_sys_employee_post` VALUES ('user22_18tp', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user23_lp52', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user3_vepf', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user4_x3hb', 'dept');
INSERT INTO `js_sys_employee_post` VALUES ('user5_asl8', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user6_fc4r', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user7_mykw', 'dept');
INSERT INTO `js_sys_employee_post` VALUES ('user8_tdzz', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user9_df62', 'user');

-- ----------------------------
-- Table structure for js_sys_file_entity
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_file_entity`;
CREATE TABLE `js_sys_file_entity`  (
  `file_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '文件编号',
  `file_md5` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '文件MD5',
  `file_path` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '文件相对路径',
  `file_content_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '文件内容类型',
  `file_extension` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '文件后缀扩展名',
  `file_size` decimal(31, 0) NOT NULL COMMENT '文件大小(单位B)',
  `file_meta` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '文件信息(JSON格式)',
  PRIMARY KEY (`file_id`) USING BTREE,
  INDEX `idx_sys_file_entity_md5`(`file_md5`) USING BTREE,
  INDEX `idx_sys_file_entity_size`(`file_size`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '文件实体表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for js_sys_file_upload
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_file_upload`;
CREATE TABLE `js_sys_file_upload`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '编号',
  `file_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '文件编号',
  `file_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '文件名称',
  `file_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '文件分类（image、media、file）',
  `file_sort` decimal(10, 0) NULL DEFAULT NULL COMMENT '文件排序（升序）',
  `biz_key` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '业务主键',
  `biz_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '业务类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_file_biz_ft`(`file_type`) USING BTREE,
  INDEX `idx_sys_file_biz_fi`(`file_id`) USING BTREE,
  INDEX `idx_sys_file_biz_status`(`status`) USING BTREE,
  INDEX `idx_sys_file_biz_cb`(`create_by`) USING BTREE,
  INDEX `idx_sys_file_biz_ud`(`update_date`) USING BTREE,
  INDEX `idx_sys_file_biz_bt`(`biz_type`) USING BTREE,
  INDEX `idx_sys_file_biz_bk`(`biz_key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '文件上传表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for js_sys_job
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_job`;
CREATE TABLE `js_sys_job`  (
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '任务组名',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '任务描述',
  `invoke_target` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Cron执行表达式',
  `misfire_instruction` decimal(1, 0) NOT NULL COMMENT '计划执行错误策略',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '是否并发执行',
  `instance_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'JeeSiteScheduler' COMMENT '集群的实例名字',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '状态（0正常 1删除 2暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`job_name`, `job_group`) USING BTREE,
  INDEX `idx_sys_job_status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '作业调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of js_sys_job
-- ----------------------------
INSERT INTO `js_sys_job` VALUES ('MsgLocalMergePushTask', 'SYSTEM', '消息推送服务 (合并推送)', 'msgLocalMergePushTask.execute()', '0 0/30 * * * ?', 2, '0', 'JeeSiteScheduler', '2', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL);
INSERT INTO `js_sys_job` VALUES ('MsgLocalPushTask', 'SYSTEM', '消息推送服务 (实时推送)', 'msgLocalPushTask.execute()', '0/3 * * * * ?', 2, '0', 'JeeSiteScheduler', '2', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL);

-- ----------------------------
-- Table structure for js_sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_job_log`;
CREATE TABLE `js_sys_job_log`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '编号',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '任务组名',
  `job_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '日志类型',
  `job_event` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '日志事件',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '日志信息',
  `is_exception` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '是否异常',
  `exception_info` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '异常信息',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_job_log_jn`(`job_name`) USING BTREE,
  INDEX `idx_sys_job_log_jg`(`job_group`) USING BTREE,
  INDEX `idx_sys_job_log_t`(`job_type`) USING BTREE,
  INDEX `idx_sys_job_log_e`(`job_event`) USING BTREE,
  INDEX `idx_sys_job_log_ie`(`is_exception`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '作业调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for js_sys_lang
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_lang`;
CREATE TABLE `js_sys_lang`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '编号',
  `module_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '归属模块',
  `lang_code` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '语言编码',
  `lang_text` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '语言译文',
  `lang_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '语言类型',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_lang_code`(`lang_code`) USING BTREE,
  INDEX `idx_sys_lang_type`(`lang_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '国际化语言' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for js_sys_log
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_log`;
CREATE TABLE `js_sys_log`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '编号',
  `log_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '日志类型',
  `log_title` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '日志标题',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_by_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '用户名称',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `request_uri` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '请求URI',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '操作方式',
  `request_params` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '操作提交的数据',
  `diff_modify_data` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '新旧数据比较结果',
  `biz_key` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '业务主键',
  `biz_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '业务类型',
  `remote_addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '操作IP地址',
  `server_addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '请求服务器地址',
  `is_exception` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '是否异常',
  `exception_info` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '异常信息',
  `user_agent` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户代理',
  `device_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '设备名称/操作系统',
  `browser_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '浏览器名称',
  `execute_time` decimal(19, 0) NULL DEFAULT NULL COMMENT '执行时间',
  `corp_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '租户代码',
  `corp_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'JeeSite' COMMENT '租户名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_log_cb`(`create_by`) USING BTREE,
  INDEX `idx_sys_log_cc`(`corp_code`) USING BTREE,
  INDEX `idx_sys_log_lt`(`log_type`) USING BTREE,
  INDEX `idx_sys_log_bk`(`biz_key`) USING BTREE,
  INDEX `idx_sys_log_bt`(`biz_type`) USING BTREE,
  INDEX `idx_sys_log_ie`(`is_exception`) USING BTREE,
  INDEX `idx_sys_log_cd`(`create_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '操作日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of js_sys_log
-- ----------------------------
INSERT INTO `js_sys_log` VALUES ('1249528174294196224', 'loginLogout', '系统登录', 'system', '超级管理员', '2020-04-13 10:41:47', '/js/a/login', 'POST', 'username=F3EDC7D2C193E0B8DCF554C726719ED2&password=*&validCode=&__url=', NULL, NULL, NULL, '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 7', 'Chrome 8', 0, '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1249528219550736384', 'access', '系统管理/组织管理/用户管理', 'system', '超级管理员', '2020-04-13 10:41:57', '/js/a/sys/empUser/index', 'GET', '', NULL, '', 'EmpUser', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 7', 'Chrome 8', 57, '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1249528220528009216', 'select', '系统管理/组织管理/用户管理/查看', 'system', '超级管理员', '2020-04-13 10:41:58', '/js/a/sys/empUser/list', 'GET', '', NULL, '', 'EmpUser', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 7', 'Chrome 8', 185, '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1249528221970849792', 'select', '系统管理/组织管理/用户管理', 'system', '超级管理员', '2020-04-13 10:41:58', '/js/a/sys/empUser/listData', 'POST', 'ctrlPermi=2&loginCode=&userName=&refName=&mobile=&status=&employee.office.officeName=&employee.office.officeCode=&employee.company.companyName=&employee.company.companyCode=&email=&employee.postCode=&phone=&pageNo=&pageSize=&orderBy=', NULL, '', 'EmpUser', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 7', 'Chrome 8', 183, '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1249528236583804928', 'select', '系统管理/组织管理/用户管理/查看', 'system', '超级管理员', '2020-04-13 10:42:01', '/js/a/sys/empUser/form', 'GET', 'op=add', NULL, '', 'EmpUser', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 7', 'Chrome 8', 73, '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1249528283601952768', 'select', '系统管理/组织管理/用户管理/查看', 'system', '超级管理员', '2020-04-13 10:42:13', '/js/a/sys/empUser/form', 'GET', 'userCode=user15_tcbl&op=edit', NULL, 'user15_tcbl', 'EmpUser', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 7', 'Chrome 8', 98, '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1249528298361708544', 'access', '未知操作', 'system', '超级管理员', '2020-04-13 10:42:16', '/js/a/sys/user/checkLoginCode', 'GET', 'oldLoginCode=user15&loginCode=user15', NULL, NULL, NULL, '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 7', 'Chrome 8', 15, '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1249528298588200960', 'access', '系统管理/组织管理/用户管理', 'system', '超级管理员', '2020-04-13 10:42:16', '/js/a/sys/empUser/checkEmpNo', 'GET', 'oldEmpNo=user15_tcbl&employee.empNo=user15_tcbl', NULL, '', 'EmpUser', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 7', 'Chrome 8', 2, '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1249528299880046592', 'update', '系统管理/组织管理/用户管理/编辑', 'system', '超级管理员', '2020-04-13 10:42:16', '/js/a/sys/empUser/save', 'POST', 'op=edit&userType=employee&userCode=user15_tcbl&employee.office.officeName=企管部&employee.office.officeCode=SDQD01&employee.company.companyName=青岛公司&employee.company.companyCode=SDQD&oldLoginCode=user15&loginCode=user15&userName=用户15&email=user@test.com&mobile=18555555555&phone=053188888888&userWeight=0&employee.empNo=user15_tcbl&employee.empName=用户15&!employee.employeePosts=&employee.employeePosts=dept&employee.empNameEn=&remarks=&extend.extendS1=&extend.extendS2=&extend.extendS3=&extend.extendS4=&extend.extendS5=&extend.extendS6=&extend.extendS7=&extend.extendS8=&extend.extendI1=&extend.extendI2=&extend.extendI3=&extend.extendI4=&extend.extendF1=&extend.extendF2=&extend.extendF3=&extend.extendF4=&extend.extendD1=&extend.extendD2=&extend.extendD3=&extend.extendD4=', NULL, 'user15_tcbl', 'EmpUser', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 7', 'Chrome 8', 256, '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1249528300114927616', 'select', '系统管理/组织管理/用户管理', 'system', '超级管理员', '2020-04-13 10:42:17', '/js/a/sys/empUser/listData', 'POST', 'ctrlPermi=2&loginCode=&userName=&refName=&mobile=&status=&employee.office.officeName=&employee.office.officeCode=&employee.company.companyName=&employee.company.companyCode=&email=&employee.postCode=&phone=&pageNo=&pageSize=&orderBy=', NULL, '', 'EmpUser', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 7', 'Chrome 8', 41, '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1249528331958083584', 'loginLogout', '系统退出', 'system', '超级管理员', '2020-04-13 10:42:24', '/js/a/logout', 'GET', '', NULL, NULL, NULL, '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 7', 'Chrome 8', 0, '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1249529407727312896', 'loginLogout', '系统登录', 'system', '超级管理员', '2020-04-13 10:46:41', '/js/a/login', 'POST', 'username=F3EDC7D2C193E0B8DCF554C726719ED2&password=*&validCode=&rememberUserCode=on&__url=', NULL, NULL, NULL, '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 7', 'Chrome 8', 0, '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1249529427587342336', 'loginLogout', '系统退出', 'system', '超级管理员', '2020-04-13 10:46:45', '/js/a/logout', 'GET', '', NULL, NULL, NULL, '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 7', 'Chrome 8', 0, '0', 'JeeSite');

-- ----------------------------
-- Table structure for js_sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_menu`;
CREATE TABLE `js_sys_menu`  (
  `menu_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '菜单编码',
  `parent_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '父级编号',
  `parent_codes` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '所有父级编号',
  `tree_sort` decimal(10, 0) NOT NULL COMMENT '本级排序号（升序）',
  `tree_sorts` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '所有级别排序号',
  `tree_leaf` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '是否最末级',
  `tree_level` decimal(4, 0) NOT NULL COMMENT '层次级别',
  `tree_names` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '全节点名',
  `menu_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '菜单名称',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '菜单类型（1菜单 2权限 3开发）',
  `menu_href` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '链接',
  `menu_target` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '目标',
  `menu_icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '图标',
  `menu_color` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '颜色',
  `menu_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '菜单标题',
  `permission` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '权限标识',
  `weight` decimal(4, 0) NULL DEFAULT NULL COMMENT '菜单权重',
  `is_show` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '是否显示（1显示 0隐藏）',
  `sys_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '归属系统（default:主导航菜单、mobileApp:APP菜单）',
  `module_codes` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '归属模块（多个用逗号隔开）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注信息',
  `extend_s1` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 1',
  `extend_s2` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 2',
  `extend_s3` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 3',
  `extend_s4` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 4',
  `extend_s5` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 5',
  `extend_s6` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 6',
  `extend_s7` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 7',
  `extend_s8` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 8',
  `extend_i1` decimal(19, 0) NULL DEFAULT NULL COMMENT '扩展 Integer 1',
  `extend_i2` decimal(19, 0) NULL DEFAULT NULL COMMENT '扩展 Integer 2',
  `extend_i3` decimal(19, 0) NULL DEFAULT NULL COMMENT '扩展 Integer 3',
  `extend_i4` decimal(19, 0) NULL DEFAULT NULL COMMENT '扩展 Integer 4',
  `extend_f1` decimal(19, 4) NULL DEFAULT NULL COMMENT '扩展 Float 1',
  `extend_f2` decimal(19, 4) NULL DEFAULT NULL COMMENT '扩展 Float 2',
  `extend_f3` decimal(19, 4) NULL DEFAULT NULL COMMENT '扩展 Float 3',
  `extend_f4` decimal(19, 4) NULL DEFAULT NULL COMMENT '扩展 Float 4',
  `extend_d1` datetime(0) NULL DEFAULT NULL COMMENT '扩展 Date 1',
  `extend_d2` datetime(0) NULL DEFAULT NULL COMMENT '扩展 Date 2',
  `extend_d3` datetime(0) NULL DEFAULT NULL COMMENT '扩展 Date 3',
  `extend_d4` datetime(0) NULL DEFAULT NULL COMMENT '扩展 Date 4',
  PRIMARY KEY (`menu_code`) USING BTREE,
  INDEX `idx_sys_menu_pc`(`parent_code`) USING BTREE,
  INDEX `idx_sys_menu_ts`(`tree_sort`) USING BTREE,
  INDEX `idx_sys_menu_status`(`status`) USING BTREE,
  INDEX `idx_sys_menu_mt`(`menu_type`) USING BTREE,
  INDEX `idx_sys_menu_pss`(`parent_codes`) USING BTREE,
  INDEX `idx_sys_menu_tss`(`tree_sorts`) USING BTREE,
  INDEX `idx_sys_menu_sc`(`sys_code`) USING BTREE,
  INDEX `idx_sys_menu_is`(`is_show`) USING BTREE,
  INDEX `idx_sys_menu_mcs`(`module_codes`) USING BTREE,
  INDEX `idx_sys_menu_wt`(`weight`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of js_sys_menu
-- ----------------------------
INSERT INTO `js_sys_menu` VALUES ('1249527192406564864', '0', '0,', 9000, '0000009000,', '0', 0, '系统管理', '系统管理', '1', '', '', 'icon-settings', '', NULL, '', 40, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527192796635136', '1249527192406564864', '0,1249527192406564864,', 300, '0000009000,0000000300,', '0', 1, '系统管理/组织管理', '组织管理', '1', '', '', 'icon-grid', '', NULL, '', 40, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:53', 'system', '2020-04-13 10:37:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527192993767424', '1249527192796635136', '0,1249527192406564864,1249527192796635136,', 40, '0000009000,0000000300,0000000040,', '0', 2, '系统管理/组织管理/用户管理', '用户管理', '1', '/sys/empUser/index', '', 'icon-user', '', NULL, '', 40, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:53', 'system', '2020-04-13 10:37:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527193123790848', '1249527192993767424', '0,1249527192406564864,1249527192796635136,1249527192993767424,', 30, '0000009000,0000000300,0000000040,0000000030,', '1', 3, '系统管理/组织管理/用户管理/查看', '查看', '2', '', '', '', '', NULL, 'sys:empUser:view', 40, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:53', 'system', '2020-04-13 10:37:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527193249619968', '1249527192993767424', '0,1249527192406564864,1249527192796635136,1249527192993767424,', 40, '0000009000,0000000300,0000000040,0000000040,', '1', 3, '系统管理/组织管理/用户管理/编辑', '编辑', '2', '', '', '', '', NULL, 'sys:empUser:edit', 40, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:53', 'system', '2020-04-13 10:37:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527193388032000', '1249527192993767424', '0,1249527192406564864,1249527192796635136,1249527192993767424,', 60, '0000009000,0000000300,0000000040,0000000060,', '1', 3, '系统管理/组织管理/用户管理/分配角色', '分配角色', '2', '', '', '', '', NULL, 'sys:empUser:authRole', 40, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:53', 'system', '2020-04-13 10:37:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527193522249728', '1249527192993767424', '0,1249527192406564864,1249527192796635136,1249527192993767424,', 50, '0000009000,0000000300,0000000040,0000000050,', '1', 3, '系统管理/组织管理/用户管理/分配数据', '分配数据', '2', '', '', '', '', NULL, 'sys:empUser:authDataScope', 40, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:53', 'system', '2020-04-13 10:37:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527193648078848', '1249527192993767424', '0,1249527192406564864,1249527192796635136,1249527192993767424,', 60, '0000009000,0000000300,0000000040,0000000060,', '1', 3, '系统管理/组织管理/用户管理/停用启用', '停用启用', '2', '', '', '', '', NULL, 'sys:empUser:updateStatus', 40, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:53', 'system', '2020-04-13 10:37:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527193769713664', '1249527192993767424', '0,1249527192406564864,1249527192796635136,1249527192993767424,', 70, '0000009000,0000000300,0000000040,0000000070,', '1', 3, '系统管理/组织管理/用户管理/重置密码', '重置密码', '2', '', '', '', '', NULL, 'sys:empUser:resetpwd', 40, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:53', 'system', '2020-04-13 10:37:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527193882959872', '1249527192796635136', '0,1249527192406564864,1249527192796635136,', 50, '0000009000,0000000300,0000000050,', '0', 2, '系统管理/组织管理/机构管理', '机构管理', '1', '/sys/office/index', '', 'icon-grid', '', NULL, '', 60, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:53', 'system', '2020-04-13 10:37:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527194000400384', '1249527193882959872', '0,1249527192406564864,1249527192796635136,1249527193882959872,', 30, '0000009000,0000000300,0000000050,0000000030,', '1', 3, '系统管理/组织管理/机构管理/查看', '查看', '2', '', '', '', '', NULL, 'sys:office:view', 60, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:53', 'system', '2020-04-13 10:37:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527194113646592', '1249527193882959872', '0,1249527192406564864,1249527192796635136,1249527193882959872,', 40, '0000009000,0000000300,0000000050,0000000040,', '1', 3, '系统管理/组织管理/机构管理/编辑', '编辑', '2', '', '', '', '', NULL, 'sys:office:edit', 60, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:53', 'system', '2020-04-13 10:37:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527194235281408', '1249527192796635136', '0,1249527192406564864,1249527192796635136,', 70, '0000009000,0000000300,0000000070,', '0', 2, '系统管理/组织管理/公司管理', '公司管理', '1', '/sys/company/list', '', 'icon-fire', '', NULL, '', 60, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:53', 'system', '2020-04-13 10:37:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527194361110528', '1249527194235281408', '0,1249527192406564864,1249527192796635136,1249527194235281408,', 30, '0000009000,0000000300,0000000070,0000000030,', '1', 3, '系统管理/组织管理/公司管理/查看', '查看', '2', '', '', '', '', NULL, 'sys:company:view', 60, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:53', 'system', '2020-04-13 10:37:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527194461773824', '1249527194235281408', '0,1249527192406564864,1249527192796635136,1249527194235281408,', 40, '0000009000,0000000300,0000000070,0000000040,', '1', 3, '系统管理/组织管理/公司管理/编辑', '编辑', '2', '', '', '', '', NULL, 'sys:company:edit', 60, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:53', 'system', '2020-04-13 10:37:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527194591797248', '1249527192796635136', '0,1249527192406564864,1249527192796635136,', 70, '0000009000,0000000300,0000000070,', '0', 2, '系统管理/组织管理/岗位管理', '岗位管理', '1', '/sys/post/list', '', 'icon-trophy', '', NULL, '', 60, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:53', 'system', '2020-04-13 10:37:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527194709237760', '1249527194591797248', '0,1249527192406564864,1249527192796635136,1249527194591797248,', 30, '0000009000,0000000300,0000000070,0000000030,', '1', 3, '系统管理/组织管理/岗位管理/查看', '查看', '2', '', '', '', '', NULL, 'sys:post:view', 60, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:53', 'system', '2020-04-13 10:37:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527194826678272', '1249527194591797248', '0,1249527192406564864,1249527192796635136,1249527194591797248,', 40, '0000009000,0000000300,0000000070,0000000040,', '1', 3, '系统管理/组织管理/岗位管理/编辑', '编辑', '2', '', '', '', '', NULL, 'sys:post:edit', 60, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:53', 'system', '2020-04-13 10:37:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527194944118784', '1249527192406564864', '0,1249527192406564864,', 400, '0000009000,0000000400,', '0', 1, '系统管理/权限管理', '权限管理', '1', '', '', 'icon-social-dropbox', '', NULL, '', 60, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:53', 'system', '2020-04-13 10:37:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527195053170688', '1249527194944118784', '0,1249527192406564864,1249527194944118784,', 30, '0000009000,0000000400,0000000030,', '1', 2, '系统管理/权限管理/角色管理', '角色管理', '1', '/sys/role/list', '', 'icon-people', '', NULL, 'sys:role', 60, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:53', 'system', '2020-04-13 10:37:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527195162222592', '1249527194944118784', '0,1249527192406564864,1249527194944118784,', 40, '0000009000,0000000400,0000000040,', '1', 2, '系统管理/权限管理/二级管理员', '二级管理员', '1', '/sys/secAdmin/list', '', 'icon-user-female', '', NULL, 'sys:secAdmin', 60, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:53', 'system', '2020-04-13 10:37:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527195267080192', '1249527194944118784', '0,1249527192406564864,1249527194944118784,', 50, '0000009000,0000000400,0000000050,', '1', 2, '系统管理/权限管理/系统管理员', '系统管理员', '1', '/sys/corpAdmin/list', '', 'icon-badge', '', NULL, 'sys:corpAdmin', 80, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:53', 'system', '2020-04-13 10:37:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527195401297920', '1249527192406564864', '0,1249527192406564864,', 500, '0000009000,0000000500,', '0', 1, '系统管理/系统设置', '系统设置', '1', '', '', 'icon-settings', '', NULL, '', 60, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:53', 'system', '2020-04-13 10:37:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527195518738432', '1249527195401297920', '0,1249527192406564864,1249527195401297920,', 30, '0000009000,0000000500,0000000030,', '1', 2, '系统管理/系统设置/菜单管理', '菜单管理', '1', '/sys/menu/list', '', 'icon-book-open', '', NULL, 'sys:menu', 80, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:53', 'system', '2020-04-13 10:37:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527195640373248', '1249527195401297920', '0,1249527192406564864,1249527195401297920,', 40, '0000009000,0000000500,0000000040,', '1', 2, '系统管理/系统设置/模块管理', '模块管理', '1', '/sys/module/list', '', 'icon-grid', '', NULL, 'sys:module', 80, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:53', 'system', '2020-04-13 10:37:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527195749425152', '1249527195401297920', '0,1249527192406564864,1249527195401297920,', 50, '0000009000,0000000500,0000000050,', '1', 2, '系统管理/系统设置/参数设置', '参数设置', '1', '/sys/config/list', '', 'icon-wrench', '', NULL, 'sys:config', 60, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:53', 'system', '2020-04-13 10:37:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527195854282752', '1249527195401297920', '0,1249527192406564864,1249527195401297920,', 60, '0000009000,0000000500,0000000060,', '0', 2, '系统管理/系统设置/字典管理', '字典管理', '1', '/sys/dictType/list', '', 'icon-social-dropbox', '', NULL, '', 60, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:53', 'system', '2020-04-13 10:37:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527195959140352', '1249527195854282752', '0,1249527192406564864,1249527195401297920,1249527195854282752,', 30, '0000009000,0000000500,0000000060,0000000030,', '1', 3, '系统管理/系统设置/字典管理/类型查看', '类型查看', '2', '', '', '', '', NULL, 'sys:dictType:view', 60, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:53', 'system', '2020-04-13 10:37:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527196068192256', '1249527195854282752', '0,1249527192406564864,1249527195401297920,1249527195854282752,', 40, '0000009000,0000000500,0000000060,0000000040,', '1', 3, '系统管理/系统设置/字典管理/类型编辑', '类型编辑', '2', '', '', '', '', NULL, 'sys:dictType:edit', 80, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:53', 'system', '2020-04-13 10:37:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527196194021376', '1249527195854282752', '0,1249527192406564864,1249527195401297920,1249527195854282752,', 50, '0000009000,0000000500,0000000060,0000000050,', '1', 3, '系统管理/系统设置/字典管理/数据查看', '数据查看', '2', '', '', '', '', NULL, 'sys:dictData:view', 60, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:53', 'system', '2020-04-13 10:37:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527196303073280', '1249527195854282752', '0,1249527192406564864,1249527195401297920,1249527195854282752,', 60, '0000009000,0000000500,0000000060,0000000060,', '1', 3, '系统管理/系统设置/字典管理/数据编辑', '数据编辑', '2', '', '', '', '', NULL, 'sys:dictData:edit', 60, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:53', 'system', '2020-04-13 10:37:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527196412125184', '1249527195401297920', '0,1249527192406564864,1249527195401297920,', 70, '0000009000,0000000500,0000000070,', '1', 2, '系统管理/系统设置/行政区划', '行政区划', '1', '/sys/area/list', '', 'icon-map', '', NULL, 'sys:area', 60, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:53', 'system', '2020-04-13 10:37:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527196512788480', '1249527195401297920', '0,1249527192406564864,1249527195401297920,', 80, '0000009000,0000000500,0000000080,', '1', 2, '系统管理/系统设置/国际化管理', '国际化管理', '1', '/sys/lang/list', '', 'icon-globe', '', NULL, 'sys:lang', 80, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:53', 'system', '2020-04-13 10:37:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527196605063168', '1249527195401297920', '0,1249527192406564864,1249527195401297920,', 90, '0000009000,0000000500,0000000090,', '1', 2, '系统管理/系统设置/产品许可信息', '产品许可信息', '1', '//licence', '', 'icon-paper-plane', '', NULL, '', 80, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:53', 'system', '2020-04-13 10:37:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527196718309376', '1249527192406564864', '0,1249527192406564864,', 600, '0000009000,0000000600,', '0', 1, '系统管理/系统监控', '系统监控', '1', '', '', 'icon-ghost', '', NULL, '', 60, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:53', 'system', '2020-04-13 10:37:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527196818972672', '1249527196718309376', '0,1249527192406564864,1249527196718309376,', 40, '0000009000,0000000600,0000000040,', '1', 2, '系统管理/系统监控/访问日志', '访问日志', '1', '/sys/log/list', '', 'fa fa-bug', '', NULL, 'sys:log', 60, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:53', 'system', '2020-04-13 10:37:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527196915441664', '1249527196718309376', '0,1249527192406564864,1249527196718309376,', 50, '0000009000,0000000600,0000000050,', '1', 2, '系统管理/系统监控/数据监控', '数据监控', '1', '//druid/index.html', '', 'icon-disc', '', NULL, 'sys:state:druid', 80, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:54', 'system', '2020-04-13 10:37:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527197028687872', '1249527196718309376', '0,1249527192406564864,1249527196718309376,', 60, '0000009000,0000000600,0000000060,', '1', 2, '系统管理/系统监控/缓存监控', '缓存监控', '1', '/state/cache/index', '', 'icon-social-dribbble', '', NULL, 'sys:stste:cache', 80, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:54', 'system', '2020-04-13 10:37:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527197120962560', '1249527196718309376', '0,1249527192406564864,1249527196718309376,', 70, '0000009000,0000000600,0000000070,', '1', 2, '系统管理/系统监控/服务器监控', '服务器监控', '1', '/state/server/index', '', 'icon-speedometer', '', NULL, 'sys:state:server', 80, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:54', 'system', '2020-04-13 10:37:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527197238403072', '1249527196718309376', '0,1249527192406564864,1249527196718309376,', 80, '0000009000,0000000600,0000000080,', '1', 2, '系统管理/系统监控/作业监控', '作业监控', '1', '/job/list', '', 'icon-notebook', '', NULL, 'sys:job', 80, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:54', 'system', '2020-04-13 10:37:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527197381009408', '1249527196718309376', '0,1249527192406564864,1249527196718309376,', 90, '0000009000,0000000600,0000000090,', '1', 2, '系统管理/系统监控/在线用户', '在线用户', '1', '/sys/online/list', '', 'icon-social-twitter', '', NULL, 'sys:online', 60, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:54', 'system', '2020-04-13 10:37:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527197519421440', '1249527196718309376', '0,1249527192406564864,1249527196718309376,', 100, '0000009000,0000000600,0000000100,', '1', 2, '系统管理/系统监控/在线文档', '在线文档', '1', '//swagger-ui.html', '', 'icon-book-open', '', NULL, 'sys:swagger', 80, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:54', 'system', '2020-04-13 10:37:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527197649444864', '1249527192406564864', '0,1249527192406564864,', 700, '0000009000,0000000700,', '0', 1, '系统管理/消息推送', '消息推送', '1', '', '', 'icon-envelope-letter', '', NULL, '', 60, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:54', 'system', '2020-04-13 10:37:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527197771079680', '1249527197649444864', '0,1249527192406564864,1249527197649444864,', 30, '0000009000,0000000700,0000000030,', '1', 2, '系统管理/消息推送/未完成消息', '未完成消息', '1', '/msg/msgPush/list', '', '', '', NULL, 'msg:msgPush', 60, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:54', 'system', '2020-04-13 10:37:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527197871742976', '1249527197649444864', '0,1249527192406564864,1249527197649444864,', 40, '0000009000,0000000700,0000000040,', '1', 2, '系统管理/消息推送/已完成消息', '已完成消息', '1', '/msg/msgPush/list?pushed=true', '', '', '', NULL, 'msg:msgPush', 60, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:54', 'system', '2020-04-13 10:37:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527197984989184', '1249527197649444864', '0,1249527192406564864,1249527197649444864,', 50, '0000009000,0000000700,0000000050,', '1', 2, '系统管理/消息推送/消息模板管理', '消息模板管理', '1', '/msg/msgTemplate/list', '', '', '', NULL, 'msg:msgTemplate', 60, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:54', 'system', '2020-04-13 10:37:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527198127595520', '1249527192406564864', '0,1249527192406564864,', 900, '0000009000,0000000900,', '0', 1, '系统管理/研发工具', '研发工具', '1', '', '', 'fa fa-code', '', NULL, '', 80, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:54', 'system', '2020-04-13 10:37:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527198261813248', '1249527198127595520', '0,1249527192406564864,1249527198127595520,', 30, '0000009000,0000000900,0000000030,', '1', 2, '系统管理/研发工具/代码生成工具', '代码生成工具', '1', '/gen/genTable/list', '', 'fa fa-code', '', NULL, 'gen:genTable', 80, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:54', 'system', '2020-04-13 10:37:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527198379253760', '1249527198127595520', '0,1249527192406564864,1249527198127595520,', 100, '0000009000,0000000900,0000000100,', '0', 2, '系统管理/研发工具/代码生成实例', '代码生成实例', '1', '', '', 'icon-social-dropbox', '', NULL, '', 80, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:54', 'system', '2020-04-13 10:37:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527198530248704', '1249527198379253760', '0,1249527192406564864,1249527198127595520,1249527198379253760,', 30, '0000009000,0000000900,0000000100,0000000030,', '1', 3, '系统管理/研发工具/代码生成实例/单表_主子表', '单表/主子表', '1', '/test/testData/list', '', '', '', NULL, 'test:testData', 80, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:54', 'system', '2020-04-13 10:37:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527198668660736', '1249527198379253760', '0,1249527192406564864,1249527198127595520,1249527198379253760,', 40, '0000009000,0000000900,0000000100,0000000040,', '1', 3, '系统管理/研发工具/代码生成实例/树表_树结构表', '树表/树结构表', '1', '/test/testTree/list', '', '', '', NULL, 'test:testTree', 80, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:54', 'system', '2020-04-13 10:37:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527199083896832', '1249527198127595520', '0,1249527192406564864,1249527198127595520,', 200, '0000009000,0000000900,0000000200,', '0', 2, '系统管理/研发工具/数据表格实例', '数据表格实例', '1', '', '', '', '', NULL, '', 80, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:54', 'system', '2020-04-13 10:37:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527199218114560', '1249527199083896832', '0,1249527192406564864,1249527198127595520,1249527199083896832,', 30, '0000009000,0000000900,0000000200,0000000030,', '1', 3, '系统管理/研发工具/数据表格实例/多表头分组小计合计', '多表头分组小计合计', '1', '/demo/dataGrid/groupGrid', '', '', '', NULL, '', 80, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:54', 'system', '2020-04-13 10:37:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527199343943680', '1249527199083896832', '0,1249527192406564864,1249527198127595520,1249527199083896832,', 40, '0000009000,0000000900,0000000200,0000000040,', '1', 3, '系统管理/研发工具/数据表格实例/编辑表格多行编辑', '编辑表格多行编辑', '1', '/demo/dataGrid/editGrid', '', '', '', NULL, '', 80, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:54', 'system', '2020-04-13 10:37:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527199482355712', '1249527199083896832', '0,1249527192406564864,1249527198127595520,1249527199083896832,', 50, '0000009000,0000000900,0000000200,0000000050,', '1', 3, '系统管理/研发工具/数据表格实例/多表联动示例', '多表联动示例', '1', '/demo/dataGrid/multiGrid', '', '', '', NULL, '', 80, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:54', 'system', '2020-04-13 10:37:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527199595601920', '1249527198127595520', '0,1249527192406564864,1249527198127595520,', 300, '0000009000,0000000900,0000000300,', '0', 2, '系统管理/研发工具/表单组件实例', '表单组件实例', '1', '', '', '', '', NULL, '', 80, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:54', 'system', '2020-04-13 10:37:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527199721431040', '1249527199595601920', '0,1249527192406564864,1249527198127595520,1249527199595601920,', 30, '0000009000,0000000900,0000000300,0000000030,', '1', 3, '系统管理/研发工具/表单组件实例/组件应用实例', '组件应用实例', '1', '/demo/form/editForm', '', '', '', NULL, '', 80, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:54', 'system', '2020-04-13 10:37:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527199830482944', '1249527199595601920', '0,1249527192406564864,1249527198127595520,1249527199595601920,', 40, '0000009000,0000000900,0000000300,0000000040,', '1', 3, '系统管理/研发工具/表单组件实例/栅格布局实例', '栅格布局实例', '1', '/demo/form/layoutForm', '', '', '', NULL, '', 80, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:54', 'system', '2020-04-13 10:37:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527199960506368', '1249527199595601920', '0,1249527192406564864,1249527198127595520,1249527199595601920,', 50, '0000009000,0000000900,0000000300,0000000050,', '1', 3, '系统管理/研发工具/表单组件实例/表格表单实例', '表格表单实例', '1', '/demo/form/tableForm', '', '', '', NULL, '', 80, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:54', 'system', '2020-04-13 10:37:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527200086335488', '1249527199595601920', '0,1249527192406564864,1249527198127595520,1249527199595601920,', 60, '0000009000,0000000900,0000000300,0000000060,', '1', 3, '系统管理/研发工具/表单组件实例/多页签应用示例', '多页签应用示例', '1', '/demo/form/tabPage', '', '', '', NULL, '', 80, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:54', 'system', '2020-04-13 10:37:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527200216358912', '1249527198127595520', '0,1249527192406564864,1249527198127595520,', 400, '0000009000,0000000900,0000000400,', '0', 2, '系统管理/研发工具/前端界面实例', '前端界面实例', '1', '', '', '', '', NULL, '', 80, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:54', 'system', '2020-04-13 10:37:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527200350576640', '1249527200216358912', '0,1249527192406564864,1249527198127595520,1249527200216358912,', 30, '0000009000,0000000900,0000000400,0000000030,', '1', 3, '系统管理/研发工具/前端界面实例/图标样式查找', '图标样式查找', '1', '//tags/iconselect', '', '', '', NULL, '', 80, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:54', 'system', '2020-04-13 10:37:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527200480600064', '1249527192406564864', '0,1249527192406564864,', 999, '0000009000,0000000999,', '0', 1, '系统管理/JeeSite社区', 'JeeSite社区', '1', '', '', 'icon-directions', '', NULL, '', 80, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:54', 'system', '2020-04-13 10:37:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527200610623488', '1249527200480600064', '0,1249527192406564864,1249527200480600064,', 30, '0000009000,0000000999,0000000030,', '1', 2, '系统管理/JeeSite社区/官方网站', '官方网站', '1', 'http://jeesite.com', '_blank', '', '', NULL, '', 80, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:54', 'system', '2020-04-13 10:37:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527200740646912', '1249527200480600064', '0,1249527192406564864,1249527200480600064,', 50, '0000009000,0000000999,0000000050,', '1', 2, '系统管理/JeeSite社区/作者博客', '作者博客', '1', 'https://my.oschina.net/thinkgem', '_blank', '', '', NULL, '', 80, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:54', 'system', '2020-04-13 10:37:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527200870670336', '1249527200480600064', '0,1249527192406564864,1249527200480600064,', 40, '0000009000,0000000999,0000000040,', '1', 2, '系统管理/JeeSite社区/问题反馈', '问题反馈', '1', 'https://gitee.com/thinkgem/jeesite4/issues', '_blank', '', '', NULL, '', 80, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:54', 'system', '2020-04-13 10:37:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527200988110848', '1249527200480600064', '0,1249527192406564864,1249527200480600064,', 60, '0000009000,0000000999,0000000060,', '1', 2, '系统管理/JeeSite社区/开源社区', '开源社区', '1', 'http://jeesite.net', '_blank', '', '', NULL, '', 80, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:54', 'system', '2020-04-13 10:37:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527201097162752', '0', '0,', 9060, '0000009060,', '0', 0, '我的工作', '我的工作', '1', '', '', 'icon-screen-desktop', '', NULL, '', 40, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:54', 'system', '2020-04-13 10:37:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527201176854528', '1249527201097162752', '0,1249527201097162752,', 500, '0000009060,0000000500,', '0', 1, '我的工作/文件管理', '文件管理', '1', '', '', 'icon-folder', '', NULL, '', 40, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:55', 'system', '2020-04-13 10:37:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527201294295040', '1249527201176854528', '0,1249527201097162752,1249527201176854528,', 30, '0000009060,0000000500,0000000030,', '1', 2, '我的工作/文件管理/文件管理', '文件管理', '1', '/filemanager/index', '', '', '', NULL, 'filemanager', 40, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:55', 'system', '2020-04-13 10:37:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527201415929856', '1249527201176854528', '0,1249527201097162752,1249527201176854528,', 50, '0000009060,0000000500,0000000050,', '1', 2, '我的工作/文件管理/文件分享', '文件分享', '1', '/filemanager/filemanagerShared/list', '', '', '', NULL, 'filemanager', 40, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:55', 'system', '2020-04-13 10:37:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527201541758976', '1249527201097162752', '0,1249527201097162752,', 600, '0000009060,0000000600,', '0', 1, '我的工作/站内消息', '站内消息', '1', '/msg/msgInner/list', '', 'icon-speech', '', NULL, '', 40, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:55', 'system', '2020-04-13 10:37:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527201667588096', '1249527201541758976', '0,1249527201097162752,1249527201541758976,', 30, '0000009060,0000000600,0000000030,', '1', 2, '我的工作/站内消息/查看', '查看', '2', '', '', '', '', NULL, 'msg:msgInner:view', 40, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:55', 'system', '2020-04-13 10:37:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527201797611520', '1249527201541758976', '0,1249527201097162752,1249527201541758976,', 40, '0000009060,0000000600,0000000040,', '1', 2, '我的工作/站内消息/编辑', '编辑', '2', '', '', '', '', NULL, 'msg:msgInner:edit', 40, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:55', 'system', '2020-04-13 10:37:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527201931829248', '1249527201541758976', '0,1249527201097162752,1249527201541758976,', 50, '0000009060,0000000600,0000000050,', '1', 2, '我的工作/站内消息/审核', '审核', '2', '', '', '', '', NULL, 'msg:msgInner:auth', 40, '1', 'default', 'core', '0', 'system', '2020-04-13 10:37:55', 'system', '2020-04-13 10:37:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527202057658368', '0', '0,', 9090, '0000009090,', '0', 0, '业务流程', '业务流程', '1', '', '', 'icon-social-foursqare', '', NULL, '', 40, '1', 'default', 'bpm', '0', 'system', '2020-04-13 10:37:55', 'system', '2020-04-13 10:37:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527202149933056', '1249527202057658368', '0,1249527202057658368,', 90, '0000009090,0000000090,', '0', 1, '业务流程/流程办理', '流程办理', '1', '', '', 'icon-control-forward', '', NULL, '', 40, '1', 'default', 'bpm', '0', 'system', '2020-04-13 10:37:55', 'system', '2020-04-13 10:37:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527202267373568', '1249527202149933056', '0,1249527202057658368,1249527202149933056,', 30, '0000009090,0000000090,0000000030,', '1', 2, '业务流程/流程办理/待办任务', '待办任务', '1', '/bpm/bpmMyTask/todoList', '', '', '', NULL, '', 40, '1', 'default', 'bpm', '0', 'system', '2020-04-13 10:37:55', 'system', '2020-04-13 10:37:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527202393202688', '1249527202149933056', '0,1249527202057658368,1249527202149933056,', 60, '0000009090,0000000090,0000000060,', '1', 2, '业务流程/流程办理/已办任务', '已办任务', '1', '/bpm/bpmMyTask/historyList', '', '', '', NULL, '', 40, '1', 'default', 'bpm', '0', 'system', '2020-04-13 10:37:55', 'system', '2020-04-13 10:37:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527202519031808', '1249527202149933056', '0,1249527202057658368,1249527202149933056,', 90, '0000009090,0000000090,0000000090,', '1', 2, '业务流程/流程办理/与我相关流程', '与我相关流程', '1', '/bpm/bpmMyRuntime/list', '', '', '', NULL, '', 40, '1', 'default', 'bpm', '0', 'system', '2020-04-13 10:37:55', 'system', '2020-04-13 10:37:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527202640666624', '1249527202149933056', '0,1249527202057658368,1249527202149933056,', 120, '0000009090,0000000090,0000000120,', '1', 2, '业务流程/流程办理/请假单管理(示例)', '请假单管理(示例)', '1', '/oa/oaLeave/list', '', '', '', NULL, 'oa:oaLeave', 40, '1', 'default', 'bpm', '0', 'system', '2020-04-13 10:37:55', 'system', '2020-04-13 10:37:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527202770690048', '1249527202057658368', '0,1249527202057658368,', 150, '0000009090,0000000150,', '0', 1, '业务流程/流程管控', '流程管控', '1', '', '', 'icon-paypal', '', NULL, '', 40, '1', 'default', 'bpm', '0', 'system', '2020-04-13 10:37:55', 'system', '2020-04-13 10:37:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527202896519168', '1249527202770690048', '0,1249527202057658368,1249527202770690048,', 60, '0000009090,0000000150,0000000060,', '1', 2, '业务流程/流程管控/流程模型设计', '流程模型设计', '1', '//bpm/modeler/index.html', '', '', '', NULL, 'bpm:modeler', 40, '1', 'default', 'bpm', '0', 'system', '2020-04-13 10:37:55', 'system', '2020-04-13 10:37:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527203034931200', '1249527202770690048', '0,1249527202057658368,1249527202770690048,', 90, '0000009090,0000000150,0000000090,', '1', 2, '业务流程/流程管控/流程定义管理', '流程定义管理', '1', '/bpm/bpmCategory/index/process', '', '', '', NULL, 'bpm:bpmProcess', 40, '1', 'default', 'bpm', '0', 'system', '2020-04-13 10:37:55', 'system', '2020-04-13 10:37:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527203160760320', '1249527202770690048', '0,1249527202057658368,1249527202770690048,', 30, '0000009090,0000000150,0000000030,', '1', 2, '业务流程/流程管控/流程分类管理', '流程分类管理', '1', '/bpm/bpmCategory/list', '', '', '', NULL, 'bpm:bpmCategory', 40, '1', 'default', 'bpm', '0', 'system', '2020-04-13 10:37:55', 'system', '2020-04-13 10:37:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527203269812224', '1249527202770690048', '0,1249527202057658368,1249527202770690048,', 120, '0000009090,0000000150,0000000120,', '1', 2, '业务流程/流程管控/流程实例管理', '流程实例管理', '1', '/bpm/bpmRuntime/list', '', '', '', NULL, 'bpm:bpmRuntime', 40, '1', 'default', 'bpm', '0', 'system', '2020-04-13 10:37:55', 'system', '2020-04-13 10:37:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527203366281216', '1249527202770690048', '0,1249527202057658368,1249527202770690048,', 150, '0000009090,0000000150,0000000150,', '1', 2, '业务流程/流程管控/流程任务管理', '流程任务管理', '1', '/bpm/bpmTask/list', '', '', '', NULL, 'bpm:bpmTask', 40, '1', 'default', 'bpm', '0', 'system', '2020-04-13 10:37:55', 'system', '2020-04-13 10:37:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_menu` VALUES ('1249527203466944512', '1249527202770690048', '0,1249527202057658368,1249527202770690048,', 180, '0000009090,0000000150,0000000180,', '1', 2, '业务流程/流程管控/流程脚本管理', '流程脚本管理', '1', '/bpm/bpmScript/list', '', '', '', NULL, 'bpm:bpmScript', 40, '1', 'default', 'bpm', '0', 'system', '2020-04-13 10:37:55', 'system', '2020-04-13 10:37:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for js_sys_module
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_module`;
CREATE TABLE `js_sys_module`  (
  `module_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '模块编码',
  `module_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '模块名称',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '模块描述',
  `main_class_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '主类全名',
  `current_version` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '当前版本',
  `upgrade_info` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '升级信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`module_code`) USING BTREE,
  INDEX `idx_sys_module_status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '模块表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of js_sys_module
-- ----------------------------
INSERT INTO `js_sys_module` VALUES ('bpm', '业务流程', '流程设计器、流程监管控制、流程办理、流程追踪', 'com.jeesite.modules.bpm.entity.BpmEntity', '4.1.8', NULL, '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_module` VALUES ('cms', '内容管理', '网站、站点、栏目、文章、链接、评论、留言板', 'com.jeesite.modules.cms.web.CmsController', '4.0.0', NULL, '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_module` VALUES ('core', '核心模块', '用户、角色、组织、模块、菜单、字典、参数', 'com.jeesite.modules.sys.web.LoginController', '4.1.8', NULL, '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);
INSERT INTO `js_sys_module` VALUES ('filemanager', '文件管理', '公共文件柜、个人文件柜、文件分享', 'com.jeesite.modules.filemanager.web.FilemanagerController', '4.1.6', NULL, '0', 'system', '2020-04-13 10:37:49', 'system', '2020-04-13 10:37:49', NULL);

-- ----------------------------
-- Table structure for js_sys_msg_inner
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_msg_inner`;
CREATE TABLE `js_sys_msg_inner`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '编号',
  `msg_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '消息标题',
  `content_level` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '内容级别（1普通 2一般 3紧急）',
  `content_type` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '内容类型（1公告 2新闻 3会议 4其它）',
  `msg_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '消息内容',
  `receive_type` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '接受者类型（0全部 1用户 2部门 3角色 4岗位）',
  `receive_codes` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '接受者字符串',
  `receive_names` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '接受者名称字符串',
  `send_user_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '发送者用户编码',
  `send_user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '发送者用户姓名',
  `send_date` datetime(0) NULL DEFAULT NULL COMMENT '发送时间',
  `is_attac` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '是否有附件',
  `notify_types` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '通知类型（PC APP 短信 邮件 微信）多选',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '状态（0正常 1删除 4审核 5驳回 9草稿）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_msg_inner_cb`(`create_by`) USING BTREE,
  INDEX `idx_sys_msg_inner_status`(`status`) USING BTREE,
  INDEX `idx_sys_msg_inner_cl`(`content_level`) USING BTREE,
  INDEX `idx_sys_msg_inner_sc`(`send_user_code`) USING BTREE,
  INDEX `idx_sys_msg_inner_sd`(`send_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '内部消息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for js_sys_msg_inner_record
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_msg_inner_record`;
CREATE TABLE `js_sys_msg_inner_record`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '编号',
  `msg_inner_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '所属消息',
  `receive_user_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '接受者用户编码',
  `receive_user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '接受者用户姓名',
  `read_status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '读取状态（0未送达 1已读 2未读）',
  `read_date` datetime(0) NULL DEFAULT NULL COMMENT '阅读时间',
  `is_star` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '是否标星',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_msg_inner_r_mi`(`msg_inner_id`) USING BTREE,
  INDEX `idx_sys_msg_inner_r_ruc`(`receive_user_code`) USING BTREE,
  INDEX `idx_sys_msg_inner_r_stat`(`read_status`) USING BTREE,
  INDEX `idx_sys_msg_inner_r_star`(`is_star`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '内部消息发送记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for js_sys_msg_push
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_msg_push`;
CREATE TABLE `js_sys_msg_push`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '编号',
  `msg_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '消息类型（PC APP 短信 邮件 微信）',
  `msg_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '消息标题',
  `msg_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '消息内容',
  `biz_key` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '业务主键',
  `biz_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '业务类型',
  `receive_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '接受者账号',
  `receive_user_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '接受者用户编码',
  `receive_user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '接受者用户姓名',
  `send_user_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '发送者用户编码',
  `send_user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '发送者用户姓名',
  `send_date` datetime(0) NOT NULL COMMENT '发送时间',
  `is_merge_push` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '是否合并推送',
  `plan_push_date` datetime(0) NULL DEFAULT NULL COMMENT '计划推送时间',
  `push_number` int(11) NULL DEFAULT NULL COMMENT '推送尝试次数',
  `push_return_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '推送返回结果码',
  `push_return_msg_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '推送返回消息编号',
  `push_return_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '推送返回的内容信息',
  `push_status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '推送状态（0未推送 1成功  2失败）',
  `push_date` datetime(0) NULL DEFAULT NULL COMMENT '推送时间',
  `read_status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '读取状态（0未送达 1已读 2未读）',
  `read_date` datetime(0) NULL DEFAULT NULL COMMENT '读取时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_msg_push_type`(`msg_type`) USING BTREE,
  INDEX `idx_sys_msg_push_rc`(`receive_code`) USING BTREE,
  INDEX `idx_sys_msg_push_uc`(`receive_user_code`) USING BTREE,
  INDEX `idx_sys_msg_push_suc`(`send_user_code`) USING BTREE,
  INDEX `idx_sys_msg_push_pd`(`plan_push_date`) USING BTREE,
  INDEX `idx_sys_msg_push_ps`(`push_status`) USING BTREE,
  INDEX `idx_sys_msg_push_rs`(`read_status`) USING BTREE,
  INDEX `idx_sys_msg_push_bk`(`biz_key`) USING BTREE,
  INDEX `idx_sys_msg_push_bt`(`biz_type`) USING BTREE,
  INDEX `idx_sys_msg_push_imp`(`is_merge_push`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '消息推送表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for js_sys_msg_pushed
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_msg_pushed`;
CREATE TABLE `js_sys_msg_pushed`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '编号',
  `msg_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '消息类型（PC APP 短信 邮件 微信）',
  `msg_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '消息标题',
  `msg_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '消息内容',
  `biz_key` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '业务主键',
  `biz_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '业务类型',
  `receive_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '接受者账号',
  `receive_user_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '接受者用户编码',
  `receive_user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '接受者用户姓名',
  `send_user_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '发送者用户编码',
  `send_user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '发送者用户姓名',
  `send_date` datetime(0) NOT NULL COMMENT '发送时间',
  `is_merge_push` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '是否合并推送',
  `plan_push_date` datetime(0) NULL DEFAULT NULL COMMENT '计划推送时间',
  `push_number` int(11) NULL DEFAULT NULL COMMENT '推送尝试次数',
  `push_return_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '推送返回的内容信息',
  `push_return_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '推送返回结果码',
  `push_return_msg_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '推送返回消息编号',
  `push_status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '推送状态（0未推送 1成功  2失败）',
  `push_date` datetime(0) NULL DEFAULT NULL COMMENT '推送时间',
  `read_status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '读取状态（0未送达 1已读 2未读）',
  `read_date` datetime(0) NULL DEFAULT NULL COMMENT '读取时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_msg_pushed_type`(`msg_type`) USING BTREE,
  INDEX `idx_sys_msg_pushed_rc`(`receive_code`) USING BTREE,
  INDEX `idx_sys_msg_pushed_uc`(`receive_user_code`) USING BTREE,
  INDEX `idx_sys_msg_pushed_suc`(`send_user_code`) USING BTREE,
  INDEX `idx_sys_msg_pushed_pd`(`plan_push_date`) USING BTREE,
  INDEX `idx_sys_msg_pushed_ps`(`push_status`) USING BTREE,
  INDEX `idx_sys_msg_pushed_rs`(`read_status`) USING BTREE,
  INDEX `idx_sys_msg_pushed_bk`(`biz_key`) USING BTREE,
  INDEX `idx_sys_msg_pushed_bt`(`biz_type`) USING BTREE,
  INDEX `idx_sys_msg_pushed_imp`(`is_merge_push`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '消息已推送表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for js_sys_msg_template
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_msg_template`;
CREATE TABLE `js_sys_msg_template`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '编号',
  `module_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '归属模块',
  `tpl_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '模板键值',
  `tpl_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '模板名称',
  `tpl_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '模板类型',
  `tpl_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '模板内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_msg_tpl_key`(`tpl_key`) USING BTREE,
  INDEX `idx_sys_msg_tpl_type`(`tpl_type`) USING BTREE,
  INDEX `idx_sys_msg_tpl_status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '消息模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for js_sys_office
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_office`;
CREATE TABLE `js_sys_office`  (
  `office_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '机构编码',
  `parent_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '父级编号',
  `parent_codes` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '所有父级编号',
  `tree_sort` decimal(10, 0) NOT NULL COMMENT '本级排序号（升序）',
  `tree_sorts` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '所有级别排序号',
  `tree_leaf` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '是否最末级',
  `tree_level` decimal(4, 0) NOT NULL COMMENT '层次级别',
  `tree_names` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '全节点名',
  `view_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '机构代码',
  `office_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '机构名称',
  `full_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '机构全称',
  `office_type` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '机构类型',
  `leader` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '办公电话',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '联系地址',
  `zip_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '邮政编码',
  `email` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注信息',
  `corp_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '租户代码',
  `corp_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'JeeSite' COMMENT '租户名称',
  `extend_s1` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 1',
  `extend_s2` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 2',
  `extend_s3` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 3',
  `extend_s4` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 4',
  `extend_s5` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 5',
  `extend_s6` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 6',
  `extend_s7` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 7',
  `extend_s8` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 8',
  `extend_i1` decimal(19, 0) NULL DEFAULT NULL COMMENT '扩展 Integer 1',
  `extend_i2` decimal(19, 0) NULL DEFAULT NULL COMMENT '扩展 Integer 2',
  `extend_i3` decimal(19, 0) NULL DEFAULT NULL COMMENT '扩展 Integer 3',
  `extend_i4` decimal(19, 0) NULL DEFAULT NULL COMMENT '扩展 Integer 4',
  `extend_f1` decimal(19, 4) NULL DEFAULT NULL COMMENT '扩展 Float 1',
  `extend_f2` decimal(19, 4) NULL DEFAULT NULL COMMENT '扩展 Float 2',
  `extend_f3` decimal(19, 4) NULL DEFAULT NULL COMMENT '扩展 Float 3',
  `extend_f4` decimal(19, 4) NULL DEFAULT NULL COMMENT '扩展 Float 4',
  `extend_d1` datetime(0) NULL DEFAULT NULL COMMENT '扩展 Date 1',
  `extend_d2` datetime(0) NULL DEFAULT NULL COMMENT '扩展 Date 2',
  `extend_d3` datetime(0) NULL DEFAULT NULL COMMENT '扩展 Date 3',
  `extend_d4` datetime(0) NULL DEFAULT NULL COMMENT '扩展 Date 4',
  PRIMARY KEY (`office_code`) USING BTREE,
  INDEX `idx_sys_office_cc`(`corp_code`) USING BTREE,
  INDEX `idx_sys_office_pc`(`parent_code`) USING BTREE,
  INDEX `idx_sys_office_pcs`(`parent_codes`) USING BTREE,
  INDEX `idx_sys_office_status`(`status`) USING BTREE,
  INDEX `idx_sys_office_ot`(`office_type`) USING BTREE,
  INDEX `idx_sys_office_vc`(`view_code`) USING BTREE,
  INDEX `idx_sys_office_ts`(`tree_sort`) USING BTREE,
  INDEX `idx_sys_office_tss`(`tree_sorts`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '组织机构表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of js_sys_office
-- ----------------------------
INSERT INTO `js_sys_office` VALUES ('SD', '0', '0,', 40, '0000000040,', '0', 0, '山东公司', 'SD', '山东公司', '山东公司', '1', NULL, NULL, NULL, NULL, NULL, '0', 'system', '2020-04-13 10:37:56', 'system', '2020-04-13 10:37:56', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_office` VALUES ('SDJN', 'SD', '0,SD,', 30, '0000000040,0000000030,', '0', 1, '山东公司/济南公司', 'SDJN', '济南公司', '山东济南公司', '2', NULL, NULL, NULL, NULL, NULL, '0', 'system', '2020-04-13 10:37:56', 'system', '2020-04-13 10:37:56', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_office` VALUES ('SDJN01', 'SDJN', '0,SD,SDJN,', 30, '0000000040,0000000030,0000000030,', '1', 2, '山东公司/济南公司/企管部', 'SDJN01', '企管部', '山东济南企管部', '3', NULL, NULL, NULL, NULL, NULL, '0', 'system', '2020-04-13 10:37:56', 'system', '2020-04-13 10:37:56', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_office` VALUES ('SDJN02', 'SDJN', '0,SD,SDJN,', 40, '0000000040,0000000030,0000000040,', '1', 2, '山东公司/济南公司/财务部', 'SDJN02', '财务部', '山东济南财务部', '3', NULL, NULL, NULL, NULL, NULL, '0', 'system', '2020-04-13 10:37:56', 'system', '2020-04-13 10:37:56', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_office` VALUES ('SDJN03', 'SDJN', '0,SD,SDJN,', 50, '0000000040,0000000030,0000000050,', '1', 2, '山东公司/济南公司/研发部', 'SDJN03', '研发部', '山东济南研发部', '3', NULL, NULL, NULL, NULL, NULL, '0', 'system', '2020-04-13 10:37:56', 'system', '2020-04-13 10:37:56', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_office` VALUES ('SDQD', 'SD', '0,SD,', 40, '0000000040,0000000040,', '0', 1, '山东公司/青岛公司', 'SDQD', '青岛公司', '山东青岛公司', '2', NULL, NULL, NULL, NULL, NULL, '0', 'system', '2020-04-13 10:37:56', 'system', '2020-04-13 10:37:56', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_office` VALUES ('SDQD01', 'SDQD', '0,SD,SDQD,', 30, '0000000040,0000000040,0000000030,', '1', 2, '山东公司/青岛公司/企管部', 'SDQD01', '企管部', '山东青岛企管部', '3', NULL, NULL, NULL, NULL, NULL, '0', 'system', '2020-04-13 10:37:56', 'system', '2020-04-13 10:37:56', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_office` VALUES ('SDQD02', 'SDQD', '0,SD,SDQD,', 40, '0000000040,0000000040,0000000040,', '1', 2, '山东公司/青岛公司/财务部', 'SDQD02', '财务部', '山东青岛财务部', '3', NULL, NULL, NULL, NULL, NULL, '0', 'system', '2020-04-13 10:37:56', 'system', '2020-04-13 10:37:56', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_office` VALUES ('SDQD03', 'SDQD', '0,SD,SDQD,', 50, '0000000040,0000000040,0000000050,', '1', 2, '山东公司/青岛公司/研发部', 'SDQD03', '研发部', '山东青岛研发部', '3', NULL, NULL, NULL, NULL, NULL, '0', 'system', '2020-04-13 10:37:56', 'system', '2020-04-13 10:37:56', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for js_sys_post
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_post`;
CREATE TABLE `js_sys_post`  (
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '岗位名称',
  `post_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '岗位分类（高管、中层、基层）',
  `post_sort` decimal(10, 0) NULL DEFAULT NULL COMMENT '岗位排序（升序）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注信息',
  `corp_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '租户代码',
  `corp_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'JeeSite' COMMENT '租户名称',
  PRIMARY KEY (`post_code`) USING BTREE,
  INDEX `idx_sys_post_cc`(`corp_code`) USING BTREE,
  INDEX `idx_sys_post_status`(`status`) USING BTREE,
  INDEX `idx_sys_post_ps`(`post_sort`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '员工岗位表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of js_sys_post
-- ----------------------------
INSERT INTO `js_sys_post` VALUES ('ceo', '总经理', '1', 10, '0', 'system', '2020-04-13 10:37:56', 'system', '2020-04-13 10:37:56', NULL, '0', 'JeeSite');
INSERT INTO `js_sys_post` VALUES ('cfo', '财务经理', '2', 20, '0', 'system', '2020-04-13 10:37:56', 'system', '2020-04-13 10:37:56', NULL, '0', 'JeeSite');
INSERT INTO `js_sys_post` VALUES ('dept', '部门经理', '2', 40, '0', 'system', '2020-04-13 10:37:56', 'system', '2020-04-13 10:37:56', NULL, '0', 'JeeSite');
INSERT INTO `js_sys_post` VALUES ('hrm', '人力经理', '2', 30, '0', 'system', '2020-04-13 10:37:56', 'system', '2020-04-13 10:37:56', NULL, '0', 'JeeSite');
INSERT INTO `js_sys_post` VALUES ('user', '普通员工', '3', 50, '0', 'system', '2020-04-13 10:37:56', 'system', '2020-04-13 10:37:56', NULL, '0', 'JeeSite');

-- ----------------------------
-- Table structure for js_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_role`;
CREATE TABLE `js_sys_role`  (
  `role_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '角色编码',
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '角色名称',
  `role_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '角色分类（高管、中层、基层、其它）',
  `role_sort` decimal(10, 0) NULL DEFAULT NULL COMMENT '角色排序（升序）',
  `is_sys` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '系统内置（1是 0否）',
  `user_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户类型（employee员工 member会员）',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '数据范围设置（0未设置  1全部数据 2自定义数据）',
  `biz_scope` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '适应业务范围（不同的功能，不同的数据权限支持）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注信息',
  `corp_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '租户代码',
  `corp_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'JeeSite' COMMENT '租户名称',
  `extend_s1` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 1',
  `extend_s2` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 2',
  `extend_s3` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 3',
  `extend_s4` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 4',
  `extend_s5` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 5',
  `extend_s6` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 6',
  `extend_s7` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 7',
  `extend_s8` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 8',
  `extend_i1` decimal(19, 0) NULL DEFAULT NULL COMMENT '扩展 Integer 1',
  `extend_i2` decimal(19, 0) NULL DEFAULT NULL COMMENT '扩展 Integer 2',
  `extend_i3` decimal(19, 0) NULL DEFAULT NULL COMMENT '扩展 Integer 3',
  `extend_i4` decimal(19, 0) NULL DEFAULT NULL COMMENT '扩展 Integer 4',
  `extend_f1` decimal(19, 4) NULL DEFAULT NULL COMMENT '扩展 Float 1',
  `extend_f2` decimal(19, 4) NULL DEFAULT NULL COMMENT '扩展 Float 2',
  `extend_f3` decimal(19, 4) NULL DEFAULT NULL COMMENT '扩展 Float 3',
  `extend_f4` decimal(19, 4) NULL DEFAULT NULL COMMENT '扩展 Float 4',
  `extend_d1` datetime(0) NULL DEFAULT NULL COMMENT '扩展 Date 1',
  `extend_d2` datetime(0) NULL DEFAULT NULL COMMENT '扩展 Date 2',
  `extend_d3` datetime(0) NULL DEFAULT NULL COMMENT '扩展 Date 3',
  `extend_d4` datetime(0) NULL DEFAULT NULL COMMENT '扩展 Date 4',
  PRIMARY KEY (`role_code`) USING BTREE,
  INDEX `idx_sys_role_cc`(`corp_code`) USING BTREE,
  INDEX `idx_sys_role_is`(`is_sys`) USING BTREE,
  INDEX `idx_sys_role_status`(`status`) USING BTREE,
  INDEX `idx_sys_role_rs`(`role_sort`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of js_sys_role
-- ----------------------------
INSERT INTO `js_sys_role` VALUES ('corpAdmin', '系统管理员', NULL, 200, '1', 'none', '0', NULL, '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', '客户方使用的管理员角色，客户方管理员，集团管理员', '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_role` VALUES ('default', '默认角色', NULL, 100, '1', 'none', '0', NULL, '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', '非管理员用户，共有的默认角色，在参数配置里指定', '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_role` VALUES ('dept', '部门经理', NULL, 40, '0', 'employee', '0', NULL, '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', '部门经理', '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_role` VALUES ('user', '普通员工', NULL, 50, '0', 'employee', '0', NULL, '0', 'system', '2020-04-13 10:37:52', 'system', '2020-04-13 10:37:52', '普通员工', '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for js_sys_role_data_scope
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_role_data_scope`;
CREATE TABLE `js_sys_role_data_scope`  (
  `role_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '控制角色编码',
  `ctrl_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '控制类型',
  `ctrl_data` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '控制数据',
  `ctrl_permi` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '控制权限',
  PRIMARY KEY (`role_code`, `ctrl_type`, `ctrl_data`, `ctrl_permi`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '角色数据权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for js_sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_role_menu`;
CREATE TABLE `js_sys_role_menu`  (
  `role_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '角色编码',
  `menu_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '菜单编码',
  PRIMARY KEY (`role_code`, `menu_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '角色与菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of js_sys_role_menu
-- ----------------------------
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527192406564864');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527192796635136');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527192993767424');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527193123790848');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527193249619968');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527193388032000');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527193522249728');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527193648078848');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527193769713664');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527193882959872');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527194000400384');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527194113646592');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527194235281408');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527194361110528');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527194461773824');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527194591797248');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527194709237760');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527194826678272');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527194944118784');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527195053170688');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527195162222592');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527195267080192');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527195401297920');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527195518738432');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527195640373248');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527195749425152');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527195854282752');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527195959140352');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527196068192256');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527196194021376');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527196303073280');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527196412125184');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527196512788480');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527196605063168');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527196718309376');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527196818972672');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527196915441664');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527197028687872');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527197120962560');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527197238403072');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527197381009408');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527197519421440');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527197649444864');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527197771079680');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527197871742976');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527197984989184');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527198127595520');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527198261813248');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527198379253760');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527198530248704');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527198668660736');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527199083896832');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527199218114560');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527199343943680');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527199482355712');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527199595601920');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527199721431040');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527199830482944');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527199960506368');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527200086335488');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527200216358912');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527200350576640');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527200480600064');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527200610623488');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527200740646912');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527200870670336');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527200988110848');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527201097162752');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527201176854528');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527201294295040');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527201415929856');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527201541758976');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527201667588096');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527201797611520');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527201931829248');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527202057658368');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527202149933056');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527202267373568');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527202393202688');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527202519031808');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527202640666624');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527202770690048');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527202896519168');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527203034931200');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527203160760320');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527203269812224');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527203366281216');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1249527203466944512');

-- ----------------------------
-- Table structure for js_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_user`;
CREATE TABLE `js_sys_user`  (
  `user_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '用户编码',
  `login_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '用户昵称',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '登录密码',
  `email` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '手机号码',
  `phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '办公电话',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户性别',
  `avatar` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '头像路径',
  `sign` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '个性签名',
  `wx_openid` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '绑定的微信号',
  `mobile_imei` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '绑定的手机串号',
  `user_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '用户类型',
  `ref_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户类型引用编号',
  `ref_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户类型引用姓名',
  `mgr_type` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '管理员类型（0非管理员 1系统管理员  2二级管理员）',
  `pwd_security_level` decimal(1, 0) NULL DEFAULT NULL COMMENT '密码安全级别（0初始 1很弱 2弱 3安全 4很安全）',
  `pwd_update_date` datetime(0) NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `pwd_update_record` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '密码修改记录',
  `pwd_question` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '密保问题',
  `pwd_question_answer` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '密保问题答案',
  `pwd_question_2` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '密保问题2',
  `pwd_question_answer_2` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '密保问题答案2',
  `pwd_question_3` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '密保问题3',
  `pwd_question_answer_3` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '密保问题答案3',
  `pwd_quest_update_date` datetime(0) NULL DEFAULT NULL COMMENT '密码问题修改时间',
  `last_login_ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '最后登陆IP',
  `last_login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `freeze_date` datetime(0) NULL DEFAULT NULL COMMENT '冻结时间',
  `freeze_cause` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '冻结原因',
  `user_weight` decimal(8, 0) NULL DEFAULT 0 COMMENT '用户权重（降序）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '状态（0正常 1删除 2停用 3冻结）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注信息',
  `corp_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '租户代码',
  `corp_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'JeeSite' COMMENT '租户名称',
  `extend_s1` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 1',
  `extend_s2` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 2',
  `extend_s3` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 3',
  `extend_s4` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 4',
  `extend_s5` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 5',
  `extend_s6` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 6',
  `extend_s7` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 7',
  `extend_s8` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '扩展 String 8',
  `extend_i1` decimal(19, 0) NULL DEFAULT NULL COMMENT '扩展 Integer 1',
  `extend_i2` decimal(19, 0) NULL DEFAULT NULL COMMENT '扩展 Integer 2',
  `extend_i3` decimal(19, 0) NULL DEFAULT NULL COMMENT '扩展 Integer 3',
  `extend_i4` decimal(19, 0) NULL DEFAULT NULL COMMENT '扩展 Integer 4',
  `extend_f1` decimal(19, 4) NULL DEFAULT NULL COMMENT '扩展 Float 1',
  `extend_f2` decimal(19, 4) NULL DEFAULT NULL COMMENT '扩展 Float 2',
  `extend_f3` decimal(19, 4) NULL DEFAULT NULL COMMENT '扩展 Float 3',
  `extend_f4` decimal(19, 4) NULL DEFAULT NULL COMMENT '扩展 Float 4',
  `extend_d1` datetime(0) NULL DEFAULT NULL COMMENT '扩展 Date 1',
  `extend_d2` datetime(0) NULL DEFAULT NULL COMMENT '扩展 Date 2',
  `extend_d3` datetime(0) NULL DEFAULT NULL COMMENT '扩展 Date 3',
  `extend_d4` datetime(0) NULL DEFAULT NULL COMMENT '扩展 Date 4',
  PRIMARY KEY (`user_code`) USING BTREE,
  INDEX `idx_sys_user_lc`(`login_code`) USING BTREE,
  INDEX `idx_sys_user_email`(`email`) USING BTREE,
  INDEX `idx_sys_user_mobile`(`mobile`) USING BTREE,
  INDEX `idx_sys_user_wo`(`wx_openid`) USING BTREE,
  INDEX `idx_sys_user_imei`(`mobile_imei`) USING BTREE,
  INDEX `idx_sys_user_rt`(`user_type`) USING BTREE,
  INDEX `idx_sys_user_rc`(`ref_code`) USING BTREE,
  INDEX `idx_sys_user_mt`(`mgr_type`) USING BTREE,
  INDEX `idx_sys_user_us`(`user_weight`) USING BTREE,
  INDEX `idx_sys_user_ud`(`update_date`) USING BTREE,
  INDEX `idx_sys_user_status`(`status`) USING BTREE,
  INDEX `idx_sys_user_cc`(`corp_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of js_sys_user
-- ----------------------------
INSERT INTO `js_sys_user` VALUES ('admin', 'admin', '系统管理员', '96740ead887d5d69ca3bdfbb95bf0cbd4267d32e83f5e3aa428a359a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'none', NULL, NULL, '1', 1, '2020-04-13 10:37:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', 'system', '2020-04-13 10:37:55', 'system', '2020-04-13 10:37:55', '客户方使用的系统管理员，用于一些常用的基础数据配置。', '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_user` VALUES ('system', 'system', '超级管理员', 'bb4e84bda3253507b6689a778028aec6be0a0109844f45fa2105dd16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'none', NULL, NULL, '0', 1, '2020-04-13 10:37:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0:0:0:0:0:0:0:1', '2020-04-13 10:46:41', NULL, NULL, 0, '0', 'system', '2020-04-13 10:37:55', 'system', '2020-04-13 10:37:55', '开发者使用的最高级别管理员，主要用于开发和调试。', '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_user` VALUES ('user1_zuuo', 'user1', '用户01', '19961036cd1f31336edc0c82edbc549c7147def497ce53a39b16047b', 'user@test.com', '18555555555', '053188888888', NULL, NULL, NULL, NULL, NULL, 'employee', 'user1_zuuo', '用户01', '0', 0, '2020-04-13 10:37:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', 'system', '2020-04-13 10:37:56', 'system', '2020-04-13 10:37:56', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_user` VALUES ('user10_xbpb', 'user10', '用户10', '772514d77c5dda0ab609c570d921fb56fea0668fc0bec06cc061eb73', 'user@test.com', '18555555555', '053188888888', NULL, NULL, NULL, NULL, NULL, 'employee', 'user10_xbpb', '用户10', '0', 0, '2020-04-13 10:37:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_user` VALUES ('user11_bhh4', 'user11', '用户11', 'c63e683fcb353cb5841fb2c9dadbe2375bb253da419102372f5e65d7', 'user@test.com', '18555555555', '053188888888', NULL, NULL, NULL, NULL, NULL, 'employee', 'user11_bhh4', '用户11', '0', 0, '2020-04-13 10:37:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_user` VALUES ('user12_ld7g', 'user12', '用户12', '0166dec660df1bd02b4142d7ceb4b287be38a6622fea024940a95277', 'user@test.com', '18555555555', '053188888888', NULL, NULL, NULL, NULL, NULL, 'employee', 'user12_ld7g', '用户12', '0', 0, '2020-04-13 10:37:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_user` VALUES ('user13_sist', 'user13', '用户13', '1124e0e7ee56d645a2bcc45db8cdc3ec25b79fe3fed3fe2d1f62d63d', 'user@test.com', '18555555555', '053188888888', NULL, NULL, NULL, NULL, NULL, 'employee', 'user13_sist', '用户13', '0', 0, '2020-04-13 10:37:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_user` VALUES ('user14_vdez', 'user14', '用户14', '2dd10005ca8ef476d107e5e5862f2115391b0d4e0a4c4fb851c64916', 'user@test.com', '18555555555', '053188888888', NULL, NULL, NULL, NULL, NULL, 'employee', 'user14_vdez', '用户14', '0', 0, '2020-04-13 10:37:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_user` VALUES ('user15_tcbl', 'user15', '用户15', '56375ddfa24b94bdc1d7be3750fe17576a352b6d2cb2526233223bed', 'user@test.com', '18555555555', '053188888888', NULL, NULL, NULL, NULL, NULL, 'employee', 'user15_tcbl', '用户15', '0', 0, '2020-04-13 10:37:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:42:16', '', '0', 'JeeSite', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_user` VALUES ('user16_wvt0', 'user16', '用户16', 'a2c82a175bbd71c67eccd8f705ab69769948f04b966a88117dee3788', 'user@test.com', '18555555555', '053188888888', NULL, NULL, NULL, NULL, NULL, 'employee', 'user16_wvt0', '用户16', '0', 0, '2020-04-13 10:37:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_user` VALUES ('user17_st6p', 'user17', '用户17', 'bcae27ca37071681a0599481024c32fe20922a33e9e88c1127a7b088', 'user@test.com', '18555555555', '053188888888', NULL, NULL, NULL, NULL, NULL, 'employee', 'user17_st6p', '用户17', '0', 0, '2020-04-13 10:37:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_user` VALUES ('user18_psfv', 'user18', '用户18', '275a2a850864f7a8766513b17c59c2db67ddae8848f55b93caaa1665', 'user@test.com', '18555555555', '053188888888', NULL, NULL, NULL, NULL, NULL, 'employee', 'user18_psfv', '用户18', '0', 0, '2020-04-13 10:37:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_user` VALUES ('user19_i3rf', 'user19', '用户19', '2e5d87a2819e8941680f5682aa98397f7b248dcc339fe122948458eb', 'user@test.com', '18555555555', '053188888888', NULL, NULL, NULL, NULL, NULL, 'employee', 'user19_i3rf', '用户19', '0', 0, '2020-04-13 10:37:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_user` VALUES ('user2_kahq', 'user2', '用户02', '7ad6e2bfb3ab876a24b118acdaebf8c31f2725e1f6ab65f3d64f254e', 'user@test.com', '18555555555', '053188888888', NULL, NULL, NULL, NULL, NULL, 'employee', 'user2_kahq', '用户02', '0', 0, '2020-04-13 10:37:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', 'system', '2020-04-13 10:37:56', 'system', '2020-04-13 10:37:56', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_user` VALUES ('user20_sjny', 'user20', '用户20', 'c26d4e80c8989071b984a412de3d30355201b91d22fe34feacecad29', 'user@test.com', '18555555555', '053188888888', NULL, NULL, NULL, NULL, NULL, 'employee', 'user20_sjny', '用户20', '0', 0, '2020-04-13 10:37:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_user` VALUES ('user21_5q2n', 'user21', '用户21', 'f982800a0ef5ba8264668fd6908a670b3fcbf9d7b438e0c3b72ed576', 'user@test.com', '18555555555', '053188888888', NULL, NULL, NULL, NULL, NULL, 'employee', 'user21_5q2n', '用户21', '0', 0, '2020-04-13 10:37:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_user` VALUES ('user22_18tp', 'user22', '用户22', '65e10b3136d45e49c99d6e89b7d76042a774ea957e932b1a50ccfeb4', 'user@test.com', '18555555555', '053188888888', NULL, NULL, NULL, NULL, NULL, 'employee', 'user22_18tp', '用户22', '0', 0, '2020-04-13 10:37:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_user` VALUES ('user23_lp52', 'user23', '用户23', '21f374cab25ff763b6cee7544184a5430980f026dade4cd6805eb1be', 'user@test.com', '18555555555', '053188888888', NULL, NULL, NULL, NULL, NULL, 'employee', 'user23_lp52', '用户23', '0', 0, '2020-04-13 10:37:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_user` VALUES ('user3_vepf', 'user3', '用户03', 'e72b003343928d12a297dacb834ebe19d09067c3c5c728d2845d45ac', 'user@test.com', '18555555555', '053188888888', NULL, NULL, NULL, NULL, NULL, 'employee', 'user3_vepf', '用户03', '0', 0, '2020-04-13 10:37:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', 'system', '2020-04-13 10:37:56', 'system', '2020-04-13 10:37:56', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_user` VALUES ('user4_x3hb', 'user4', '用户04', 'a0105540aa8f4b1b93e1e327de15293020125d1656ffc1c68e1008f2', 'user@test.com', '18555555555', '053188888888', NULL, NULL, NULL, NULL, NULL, 'employee', 'user4_x3hb', '用户04', '0', 0, '2020-04-13 10:37:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', 'system', '2020-04-13 10:37:56', 'system', '2020-04-13 10:37:56', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_user` VALUES ('user5_asl8', 'user5', '用户05', '38aa73c4195915c1559cc38af5808c357ba723cba819ce23ac9bebba', 'user@test.com', '18555555555', '053188888888', NULL, NULL, NULL, NULL, NULL, 'employee', 'user5_asl8', '用户05', '0', 0, '2020-04-13 10:37:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', 'system', '2020-04-13 10:37:56', 'system', '2020-04-13 10:37:56', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_user` VALUES ('user6_fc4r', 'user6', '用户06', '792c6aa6bdb8529c4da49933aa883be5a8290842a8edbc6540cfc572', 'user@test.com', '18555555555', '053188888888', NULL, NULL, NULL, NULL, NULL, 'employee', 'user6_fc4r', '用户06', '0', 0, '2020-04-13 10:37:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', 'system', '2020-04-13 10:37:56', 'system', '2020-04-13 10:37:56', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_user` VALUES ('user7_mykw', 'user7', '用户07', '70480f90dae22264bbc032f0a7da4bb457555b434e643455902f1e04', 'user@test.com', '18555555555', '053188888888', NULL, NULL, NULL, NULL, NULL, 'employee', 'user7_mykw', '用户07', '0', 0, '2020-04-13 10:37:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', 'system', '2020-04-13 10:37:56', 'system', '2020-04-13 10:37:56', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_user` VALUES ('user8_tdzz', 'user8', '用户08', '0e4a7e07fcb76f31f6cf310db6a083077078741a0a9f9207b4dcf350', 'user@test.com', '18555555555', '053188888888', NULL, NULL, NULL, NULL, NULL, 'employee', 'user8_tdzz', '用户08', '0', 0, '2020-04-13 10:37:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `js_sys_user` VALUES ('user9_df62', 'user9', '用户09', 'd20cc145a38fe96ba1218c503d742d318f7164c4708e6d7ebf67f271', 'user@test.com', '18555555555', '053188888888', NULL, NULL, NULL, NULL, NULL, 'employee', 'user9_df62', '用户09', '0', 0, '2020-04-13 10:37:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', 'system', '2020-04-13 10:37:57', 'system', '2020-04-13 10:37:57', NULL, '0', 'JeeSite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for js_sys_user_data_scope
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_user_data_scope`;
CREATE TABLE `js_sys_user_data_scope`  (
  `user_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '控制用户编码',
  `ctrl_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '控制类型',
  `ctrl_data` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '控制数据',
  `ctrl_permi` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '控制权限',
  PRIMARY KEY (`user_code`, `ctrl_type`, `ctrl_data`, `ctrl_permi`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '用户数据权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for js_sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_user_role`;
CREATE TABLE `js_sys_user_role`  (
  `user_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '用户编码',
  `role_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '角色编码',
  PRIMARY KEY (`user_code`, `role_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '用户与角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of js_sys_user_role
-- ----------------------------
INSERT INTO `js_sys_user_role` VALUES ('user1_zuuo', 'dept');
INSERT INTO `js_sys_user_role` VALUES ('user10_xbpb', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user11_bhh4', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user12_ld7g', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user13_sist', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user14_vdez', 'dept');
INSERT INTO `js_sys_user_role` VALUES ('user15_tcbl', 'dept');
INSERT INTO `js_sys_user_role` VALUES ('user16_wvt0', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user17_st6p', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user18_psfv', 'dept');
INSERT INTO `js_sys_user_role` VALUES ('user19_i3rf', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user2_kahq', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user20_sjny', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user21_5q2n', 'dept');
INSERT INTO `js_sys_user_role` VALUES ('user22_18tp', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user23_lp52', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user3_vepf', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user4_x3hb', 'dept');
INSERT INTO `js_sys_user_role` VALUES ('user5_asl8', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user6_fc4r', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user7_mykw', 'dept');
INSERT INTO `js_sys_user_role` VALUES ('user8_tdzz', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user9_df62', 'user');

-- ----------------------------
-- Table structure for test_data
-- ----------------------------
DROP TABLE IF EXISTS `test_data`;
CREATE TABLE `test_data`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '编号',
  `test_input` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '单行文本',
  `test_textarea` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '多行文本',
  `test_select` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '下拉框',
  `test_select_multiple` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '下拉多选',
  `test_radio` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '单选框',
  `test_checkbox` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '复选框',
  `test_date` datetime(0) NULL DEFAULT NULL COMMENT '日期选择',
  `test_datetime` datetime(0) NULL DEFAULT NULL COMMENT '日期时间',
  `test_user_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户选择',
  `test_office_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '机构选择',
  `test_area_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '区域选择',
  `test_area_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '区域名称',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '测试数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for test_data_child
-- ----------------------------
DROP TABLE IF EXISTS `test_data_child`;
CREATE TABLE `test_data_child`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '编号',
  `test_sort` int(11) NULL DEFAULT NULL COMMENT '排序号',
  `test_data_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '父表主键',
  `test_input` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '单行文本',
  `test_textarea` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '多行文本',
  `test_select` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '下拉框',
  `test_select_multiple` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '下拉多选',
  `test_radio` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '单选框',
  `test_checkbox` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '复选框',
  `test_date` datetime(0) NULL DEFAULT NULL COMMENT '日期选择',
  `test_datetime` datetime(0) NULL DEFAULT NULL COMMENT '日期时间',
  `test_user_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户选择',
  `test_office_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '机构选择',
  `test_area_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '区域选择',
  `test_area_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '区域名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '测试数据子表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for test_tree
-- ----------------------------
DROP TABLE IF EXISTS `test_tree`;
CREATE TABLE `test_tree`  (
  `tree_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '节点编码',
  `parent_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '父级编号',
  `parent_codes` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '所有父级编号',
  `tree_sort` decimal(10, 0) NOT NULL COMMENT '本级排序号（升序）',
  `tree_sorts` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '所有级别排序号',
  `tree_leaf` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '是否最末级',
  `tree_level` decimal(4, 0) NOT NULL COMMENT '层次级别',
  `tree_names` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '全节点名',
  `tree_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '节点名称',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`tree_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '测试树表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
