/*
Navicat SQL Server Data Transfer

Source Server         : 47-sqlserver
Source Server Version : 120000
Source Host           : 162.105.71.47,2439:1433
Source Database       : Tom_OA
Source Schema         : dbo

Target Server Type    : SQL Server
Target Server Version : 120000
File Encoding         : 65001

Date: 2015-09-25 21:33:34
*/


-- ----------------------------
-- Table structure for [dbo].[AccountList]
-- ----------------------------
DROP TABLE [dbo].[AccountList]
GO
CREATE TABLE [dbo].[AccountList] (
[RecordID] int NOT NULL IDENTITY(1,1) ,
[AccountName] nvarchar(20) NULL ,
[AccountCode] nvarchar(20) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[AccountList]', RESEED, 44)
GO

-- ----------------------------
-- Records of AccountList
-- ----------------------------
SET IDENTITY_INSERT [dbo].[AccountList] ON
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'1', N'库存现金', N'1001');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'2', N'银行存款', N'1002');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'3', N'其他货币资金', N'1015');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'4', N'交易性金融资产', N'1101');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'5', N'应收票据
', N'1121');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'6', N'应收账款
', N'1122');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'7', N'预付账款
', N'1123');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'8', N'应收股利
', N'1131');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'9', N'应收利息
', N'1132');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'10', N'其他应收款
', N'1231');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'11', N'长期股权投资
', N'1524');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'12', N'固定资产
', N'1601');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'13', N'累计折旧
', N'1602');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'14', N'应付账款
', N'2202');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'15', N'预收账款
', N'2203');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'16', N'应付职工薪酬
', N'2211');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'17', N'应交税金
', N'2221');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'18', N'应付利息
', N'2231');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'19', N'应付股利
', N'2232');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'20', N'其他应付款
', N'2241');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'21', N'实收资本
', N'4001');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'22', N'资本公积
', N'4002');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'23', N'盈余公积
', N'4101');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'24', N'本年利润
', N'4103');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'25', N'利润分配
', N'4104');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'26', N'生产成本
', N'5001');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'27', N'制造费用
', N'5101');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'28', N'劳务成本
', N'5201');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'29', N'研发成本
', N'5301');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'30', N'工程施工 
', N'5401');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'31', N'主营业务收入
', N'6001');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'32', N'其他业务收入
', N'6051');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'33', N'公允价值变动损益
', N'6101');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'34', N'投资收益
', N'6111');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'35', N'营业外收入
', N'6301');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'36', N'主营业务成本
', N'6401');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'37', N'其他业务成本
', N'6402');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'38', N'营业税金及附加
', N'6403');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'39', N'销售费用
', N'6601');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'40', N'管理费用
', N'6602');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'41', N'手续费
', N'6603');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'42', N'所得税费用
', N'6701');
GO
INSERT INTO [dbo].[AccountList] ([RecordID], [AccountName], [AccountCode]) VALUES (N'43', N'以前年度损益调整
', N'6711');
GO
SET IDENTITY_INSERT [dbo].[AccountList] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[AllApplies]
-- ----------------------------
DROP TABLE [dbo].[AllApplies]
GO
CREATE TABLE [dbo].[AllApplies] (
[ApplyID] int NOT NULL IDENTITY(1,1) ,
[RecordID] int NOT NULL ,
[ApplyStaff] nchar(10) NOT NULL ,
[ApplyDate] date NOT NULL ,
[ApplyType] nvarchar(50) NOT NULL ,
[NextApprover] nvarchar(20) NOT NULL ,
[NextPosition] nvarchar(20) NULL ,
[Result] bit NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[AllApplies]', RESEED, 2123)
GO

-- ----------------------------
-- Records of AllApplies
-- ----------------------------
SET IDENTITY_INSERT [dbo].[AllApplies] ON
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'21', N'15', N'员工乙       ', N'2015-03-30', N'费用报销', N'员工乙       ', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'23', N'17', N'员工甲       ', N'2015-03-31', N'费用报销', N'员工甲       ', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'17', N'11', N'员工甲       ', N'2015-03-30', N'费用报销', N'员工甲       ', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'18', N'12', N'员工甲       ', N'2015-03-30', N'费用报销', N'员工甲       ', null, N'1');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'19', N'13', N'员工乙       ', N'2015-03-30', N'费用报销', N'员工乙       ', null, N'1');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'20', N'14', N'员工乙       ', N'2015-03-30', N'费用报销', N'员工乙       ', null, N'1');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'22', N'16', N'员工甲       ', N'2015-03-30', N'费用报销', N'员工甲       ', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'24', N'1', N'员工甲       ', N'2015-04-02', N'统一结算申请', N'黄照强       ', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'25', N'2', N'员工甲       ', N'2015-04-02', N'统一结算申请', N'员工甲       ', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'26', N'1', N'员工甲       ', N'2015-04-02', N'资金使用审批', N'员工甲       ', null, N'1');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'27', N'2', N'员工甲       ', N'2015-04-02', N'资金使用审批', N'员工甲       ', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'28', N'1', N'员工甲       ', N'2015-04-02', N'合同审批', N'员工甲       ', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'1024', N'1', N'员工甲       ', N'2015-04-03', N'办公用品申购', N'员工甲       ', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'1025', N'2', N'员工甲       ', N'2015-04-03', N'员工用餐申请', N'员工甲       ', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'1026', N'1', N'员工甲       ', N'2015-04-04', N'出差报销', N'员工甲       ', null, N'1');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2024', N'2', N'项目经理甲     ', N'2015-04-17', N'到款分配-校外', N'项目经理甲     ', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2025', N'3', N'员工丙       ', N'2015-04-17', N'到款分配-校内', N'员工丙       ', null, N'1');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2026', N'4', N'会计甲       ', N'2015-04-17', N'到款分配-校外', N'会计甲       ', null, N'1');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2027', N'3', N'员工甲       ', N'2015-04-18', N'统一结算申请', N'管委会负责人    ', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2028', N'4', N'员工丙       ', N'2015-04-18', N'统一结算申请', N'管委会负责人    ', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2029', N'5', N'员工丙       ', N'2015-04-21', N'统一结算申请', N'员工丙       ', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2030', N'1004', N'员工乙       ', N'2015-04-21', N'费用报销', N'员工乙       ', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2031', N'1005', N'员工乙       ', N'2015-04-21', N'费用报销', N'员工乙       ', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2032', N'1', N'员工甲       ', N'2015-04-21', N'工资表', N'财务主管      ', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2033', N'2', N'员工乙       ', N'2015-04-21', N'工资表', N'财务主管      ', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2034', N'3', N'员工乙       ', N'2015-04-21', N'工资表', N'财务主管      ', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2035', N'4', N'员工丙       ', N'2015-04-22', N'工资表', N'财务主管      ', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2036', N'5', N'员工丙       ', N'2015-04-22', N'工资表', N'财务主管      ', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2037', N'6', N'员工X       ', N'2015-04-22', N'工资表', N'财务主管      ', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2038', N'7', N'会计甲       ', N'2015-04-22', N'工资表', N'财务主管      ', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2039', N'8', N'会计甲       ', N'2015-04-22', N'工资表', N'财务主管      ', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2040', N'1', N'员工甲       ', N'2015-04-23', N'岗位责任书', N'机构负责人     ', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2041', N'2', N'员工丙       ', N'2015-04-23', N'岗位责任书', N'机构负责人     ', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2042', N'3', N'员工丙       ', N'2015-04-23', N'岗位责任书', N'机构负责人     ', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2043', N'4', N'员工丙       ', N'2015-04-23', N'岗位责任书', N'员工丙', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'1027', N'2', N'员工甲       ', N'2015-04-04', N'出差报销', N'员工甲       ', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'1028', N'1', N'员工乙       ', N'2015-04-04', N'出差申请', N'员工乙', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'1029', N'2', N'员工乙       ', N'2015-04-04', N'出差申请', N'员工乙', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'1031', N'2', N'员工乙       ', N'2015-04-05', N'出差总结报告', N'项目经理乙     ', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'1032', N'2', N'员工乙       ', N'2015-04-05', N'车辆使用登记', N'员工乙', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'1033', N'3', N'员工乙       ', N'2015-04-05', N'车辆使用登记', N'员工乙', null, N'1');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'1034', N'4', N'员工乙       ', N'2015-04-05', N'车辆使用登记', N'员工乙', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'1030', N'1', N'员工乙       ', N'2015-04-04', N'固定资产保修申请', N'员工乙       ', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2044', N'1002', N'员工乙       ', N'2015-05-03', N'出差报销', N'项目经理乙     ', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2045', N'1', N'员工甲       ', N'2015-05-04', N'年度经费概算', N'员工甲       ', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2046', N'2', N'员工甲       ', N'2015-05-04', N'年度经费概算', N'员工甲       ', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2047', N'9', N'财务主管甲     ', N'2015-05-04', N'工资表', N'财务主管', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2048', N'10', N'财务主管甲     ', N'2015-05-04', N'工资表', N'财务主管', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2049', N'7', N'会计        ', N'2015-05-04', N'绩效表', N'机构负责人', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2050', N'8', N'会计        ', N'2015-05-04', N'绩效表', N'机构负责人', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2051', N'1006', N'员工丙       ', N'2015-05-04', N'费用报销', N'员工丙       ', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2058', N'1002', N'臧茜        ', N'2015-05-06', N'出差申请', N'高妍', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2064', N'1009', N'员工丙       ', N'2015-05-11', N'费用报销', N'项目经理甲', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2065', N'1010', N'新员工甲      ', N'2015-05-11', N'费用报销', N'高妍', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2052', N'11', N'臧茜        ', N'2015-05-06', N'工资表', N'财务主管', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2053', N'1007', N'臧茜        ', N'2015-05-06', N'费用报销', N'臧茜', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2054', N'3', N'臧茜        ', N'2015-05-06', N'年度经费概算', N'臧茜', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2055', N'4', N'臧茜        ', N'2015-05-06', N'年度经费概算', N'臧茜', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2056', N'5', N'臧茜        ', N'2015-05-06', N'年度经费概算', N'臧茜', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2057', N'6', N'臧茜        ', N'2015-05-06', N'年度经费概算', N'臧茜', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2059', N'2', N'臧茜        ', N'2015-05-06', N'办公用品申购', N'臧茜', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2060', N'3', N'臧茜        ', N'2015-05-06', N'办公用品申购', N'臧茜', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2061', N'4', N'臧茜        ', N'2015-05-06', N'办公用品申购', N'臧茜', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2062', N'1003', N'臧茜        ', N'2015-05-06', N'出差报销', N'臧茜', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2063', N'1008', N'臧茜        ', N'2015-05-11', N'费用报销', N'项目经理甲', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2066', N'1011', N'吴桂会       ', N'2015-05-27', N'费用报销', N'吴桂会', null, N'1');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2067', N'1003', N'吴桂会       ', N'2015-05-27', N'出差申请', N'高妍', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2068', N'12', N'籍伟丽       ', N'2015-05-27', N'工资表', N'财务主管', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2069', N'13', N'吴桂会       ', N'2015-05-27', N'工资表', N'财务主管', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2070', N'9', N'会计        ', N'2015-05-27', N'绩效表', N'机构负责人', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2071', N'10', N'会计        ', N'2015-05-27', N'绩效表', N'机构负责人', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2072', N'1002', N'吴桂会       ', N'2015-05-27', N'员工用餐申请', N'臧茜', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2073', N'11', N'会计        ', N'2015-05-27', N'绩效表', N'机构负责人', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2074', N'12', N'会计        ', N'2015-05-27', N'绩效表', N'机构负责人', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2075', N'13', N'会计        ', N'2015-05-27', N'绩效表', N'机构负责人', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2076', N'14', N'会计        ', N'2015-05-27', N'绩效表', N'机构负责人', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2077', N'15', N'会计        ', N'2015-05-27', N'绩效表', N'机构负责人', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2078', N'14', N'籍伟丽       ', N'2015-05-27', N'工资表', N'财务主管', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2079', N'5', N'籍伟丽       ', N'2015-05-27', N'车辆使用登记', N'臧茜', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2080', N'6', N'籍伟丽       ', N'2015-05-27', N'车辆使用登记', N'机构负责人', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2081', N'7', N'吴桂会       ', N'2015-05-27', N'年度经费概算', N'吴桂会', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2082', N'8', N'吴桂会       ', N'2015-05-27', N'年度经费概算', N'吴桂会', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2086', N'5', N'吴桂会       ', N'2015-05-27', N'办公用品申购', N'会计', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2087', N'6', N'吴桂会       ', N'2015-05-27', N'办公用品申购', N'臧茜', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2088', N'7', N'籍伟丽       ', N'2015-05-27', N'办公用品申购', N'会计', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2117', N'1003', N'臧茜        ', N'2015-06-26', N'资金使用审批', N'臧茜', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2121', N'10', N'臧茜        ', N'2015-07-01', N'统一结算申请', N'高妍', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2122', N'0', N'会计        ', N'2015-07-01', N'考勤表', N'机构负责人', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2123', N'23', N'会计        ', N'2015-07-01', N'绩效表', N'机构负责人', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2083', N'9', N'吴桂会       ', N'2015-05-27', N'年度经费概算', N'吴桂会', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2084', N'10', N'籍伟丽       ', N'2015-05-27', N'年度经费概算', N'籍伟丽', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2085', N'11', N'吴桂会       ', N'2015-05-27', N'年度经费概算', N'吴桂会', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2097', N'7', N'吴桂会       ', N'2015-06-05', N'车辆使用登记', N'机构负责人', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2102', N'19', N'会计        ', N'2015-06-05', N'绩效表', N'机构负责人', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2103', N'20', N'会计        ', N'2015-06-05', N'绩效表', N'机构负责人', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2107', N'0', N'会计        ', N'2015-06-05', N'考勤表', N'机构负责人', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2108', N'0', N'会计        ', N'2015-06-05', N'考勤表', N'机构负责人', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2109', N'7', N'臧茜        ', N'2015-06-05', N'统一结算申请', N'臧茜', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2110', N'8', N'员工甲       ', N'2015-06-05', N'统一结算申请', N'许琳', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2113', N'9', N'臧茜        ', N'2015-06-06', N'办公用品申购', N'刘晶', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2118', N'1013', N'吴桂会       ', N'2015-06-26', N'费用报销', N'会计', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2119', N'16', N'吴桂会       ', N'2015-07-01', N'工资表', N'财务主管', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2120', N'17', N'吴桂会       ', N'2015-07-01', N'工资表', N'财务主管', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2089', N'12', N'臧茜        ', N'2015-06-05', N'年度经费概算', N'臧茜', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2090', N'13', N'臧茜        ', N'2015-06-05', N'年度经费概算', N'臧茜', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2091', N'14', N'臧茜        ', N'2015-06-05', N'年度经费概算', N'臧茜', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2092', N'15', N'臧茜        ', N'2015-06-05', N'年度经费概算', N'臧茜', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2093', N'1003', N'臧茜        ', N'2015-06-05', N'员工用餐申请', N'臧茜', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2094', N'2', N'臧茜        ', N'2015-06-05', N'固定资产保修申请', N'臧茜', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2095', N'6', N'臧茜        ', N'2015-06-05', N'统一结算申请', N'臧茜', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2096', N'15', N'臧茜        ', N'2015-06-05', N'工资表', N'财务主管', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2098', N'16', N'会计        ', N'2015-06-05', N'绩效表', N'机构负责人', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2099', N'17', N'会计        ', N'2015-06-05', N'绩效表', N'机构负责人', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2100', N'18', N'会计        ', N'2015-06-05', N'绩效表', N'机构负责人', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2101', N'0', N'会计        ', N'2015-06-05', N'考勤表', N'机构负责人', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2104', N'21', N'会计        ', N'2015-06-05', N'绩效表', N'机构负责人', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2105', N'22', N'会计        ', N'2015-06-05', N'绩效表', N'机构负责人', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2112', N'8', N'臧茜        ', N'2015-06-06', N'办公用品申购', N'刘晶', null, N'0');
GO
INSERT INTO [dbo].[AllApplies] ([ApplyID], [RecordID], [ApplyStaff], [ApplyDate], [ApplyType], [NextApprover], [NextPosition], [Result]) VALUES (N'2114', N'5', N'臧茜        ', N'2015-06-06', N'岗位责任书', N'员工甲', null, N'0');
GO
SET IDENTITY_INSERT [dbo].[AllApplies] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[AllCashFlow]
-- ----------------------------
DROP TABLE [dbo].[AllCashFlow]
GO
CREATE TABLE [dbo].[AllCashFlow] (
[CashFlowID] int NOT NULL IDENTITY(1,1) ,
[RecordID] int NOT NULL ,
[HappenDate] date NOT NULL ,
[ProjectCode] nvarchar(20) NOT NULL ,
[ProjectAccount] nvarchar(50) NOT NULL ,
[CashType] nvarchar(20) NOT NULL ,
[Income] float(53) NOT NULL ,
[Expense] float(53) NOT NULL ,
[Department] nvarchar(20) NOT NULL ,
[Summary] nvarchar(50) NULL ,
[Remark] nvarchar(50) NULL ,
[Handler] nvarchar(50) NOT NULL ,
[VoucherID] nvarchar(50) NULL ,
[AccountID] nvarchar(50) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[AllCashFlow]', RESEED, 2005)
GO

-- ----------------------------
-- Records of AllCashFlow
-- ----------------------------
SET IDENTITY_INSERT [dbo].[AllCashFlow] ON
GO
INSERT INTO [dbo].[AllCashFlow] ([CashFlowID], [RecordID], [HappenDate], [ProjectCode], [ProjectAccount], [CashType], [Income], [Expense], [Department], [Summary], [Remark], [Handler], [VoucherID], [AccountID]) VALUES (N'4', N'15', N'2015-07-07', N'项目编号3               ', N'项目账号2                                             ', N'费用报销', N'3232', N'0', N'研究开发部', N'', N'七月份', N'员工乙       ', null, null);
GO
INSERT INTO [dbo].[AllCashFlow] ([CashFlowID], [RecordID], [HappenDate], [ProjectCode], [ProjectAccount], [CashType], [Income], [Expense], [Department], [Summary], [Remark], [Handler], [VoucherID], [AccountID]) VALUES (N'6', N'2', N'2015-04-02', N'项目编号3               ', N'无', N'统一结算', N'0', N'232312', N'交流合作部', N'', N'', N'员工甲', null, null);
GO
INSERT INTO [dbo].[AllCashFlow] ([CashFlowID], [RecordID], [HappenDate], [ProjectCode], [ProjectAccount], [CashType], [Income], [Expense], [Department], [Summary], [Remark], [Handler], [VoucherID], [AccountID]) VALUES (N'1002', N'2', N'2015-04-04', N'项目编号3               ', N'项目账号2                                             ', N'费用报销', N'0', N'15000', N'交流合作部', N'', N'', N'员工甲', null, null);
GO
INSERT INTO [dbo].[AllCashFlow] ([CashFlowID], [RecordID], [HappenDate], [ProjectCode], [ProjectAccount], [CashType], [Income], [Expense], [Department], [Summary], [Remark], [Handler], [VoucherID], [AccountID]) VALUES (N'2002', N'0', N'2015-04-17', N'项目编号1               ', N'项目账号1                                             ', N'到款分配', N'2000', N'0', N'', N'', N'', N'项目经理甲', null, null);
GO
INSERT INTO [dbo].[AllCashFlow] ([CashFlowID], [RecordID], [HappenDate], [ProjectCode], [ProjectAccount], [CashType], [Income], [Expense], [Department], [Summary], [Remark], [Handler], [VoucherID], [AccountID]) VALUES (N'2003', N'0', N'2015-04-17', N'项目编号1               ', N'项目账号1                                             ', N'到款分配-校内', N'232', N'0', N'', N'', N'', N'员工丙', null, null);
GO
INSERT INTO [dbo].[AllCashFlow] ([CashFlowID], [RecordID], [HappenDate], [ProjectCode], [ProjectAccount], [CashType], [Income], [Expense], [Department], [Summary], [Remark], [Handler], [VoucherID], [AccountID]) VALUES (N'2004', N'0', N'2015-04-17', N'项目编号1               ', N'项目账号1                                             ', N'到款分配-校外', N'323', N'0', N'', N'', N'', N'会计1', null, null);
GO
INSERT INTO [dbo].[AllCashFlow] ([CashFlowID], [RecordID], [HappenDate], [ProjectCode], [ProjectAccount], [CashType], [Income], [Expense], [Department], [Summary], [Remark], [Handler], [VoucherID], [AccountID]) VALUES (N'2005', N'1005', N'2015-04-21', N'项目编号3               ', N'项目账号3                                             ', N'费用报销', N'0', N'232', N'交流合作部', N'', N'2323', N'员工乙       ', N'NMI3232323', N'测试');
GO
INSERT INTO [dbo].[AllCashFlow] ([CashFlowID], [RecordID], [HappenDate], [ProjectCode], [ProjectAccount], [CashType], [Income], [Expense], [Department], [Summary], [Remark], [Handler], [VoucherID], [AccountID]) VALUES (N'5', N'16', N'2015-04-04', N'项目编号2               ', N'项目账号2                                             ', N'费用报销', N'23223', N'0', N'交流合作部', N'', N'四月份', N'员工甲       ', null, null);
GO
SET IDENTITY_INSERT [dbo].[AllCashFlow] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[BasicInfo]
-- ----------------------------
DROP TABLE [dbo].[BasicInfo]
GO
CREATE TABLE [dbo].[BasicInfo] (
[UserID] int NOT NULL ,
[StaffName] nvarchar(50) NOT NULL ,
[Gender] bit NULL ,
[Birthday] date NULL ,
[Race] nvarchar(50) NULL ,
[Company] nvarchar(50) NULL ,
[Department] nvarchar(50) NOT NULL ,
[Position] nvarchar(50) NOT NULL ,
[Title] nvarchar(50) NULL ,
[Contact] nvarchar(50) NULL ,
[Email] nvarchar(50) NULL ,
[Address] nvarchar(50) NULL ,
[UrgentContact] nvarchar(50) NULL ,
[UrgentPerson] nvarchar(50) NULL ,
[CardID] nvarchar(18) NULL ,
[Politics] nvarchar(50) NULL ,
[Marriage] nvarchar(50) NULL ,
[School] nvarchar(50) NULL ,
[Education] nvarchar(50) NULL ,
[Major] nvarchar(50) NULL ,
[OldName] nvarchar(50) NULL ,
[Computer] nvarchar(50) NULL ,
[ForeignLan] nvarchar(50) NULL ,
[ForeignLev] nvarchar(50) NULL ,
[EnterDate] date NULL ,
[FileAddr] nvarchar(50) NULL ,
[OnJob] bit NOT NULL 
)


GO

-- ----------------------------
-- Records of BasicInfo
-- ----------------------------
INSERT INTO [dbo].[BasicInfo] ([UserID], [StaffName], [Gender], [Birthday], [Race], [Company], [Department], [Position], [Title], [Contact], [Email], [Address], [UrgentContact], [UrgentPerson], [CardID], [Politics], [Marriage], [School], [Education], [Major], [OldName], [Computer], [ForeignLan], [ForeignLev], [EnterDate], [FileAddr], [OnJob]) VALUES (N'2', N'员工甲', N'1', N'2015-02-04', N'汉族', N'北京京元数研科技有限公司', N'业务发展部', N'员工', N'无', N'15120074232', N'tomserious@115.com', N'北京市海淀区', N'13401152233', N'你猜', N'370686199302082322', N'中共党员', N'未婚', N'北京大学', N'硕士研究生', N'计算机科学与技术', N'', N'良好', N'英语', N'六级', N'2015-02-04', N'北京', N'0');
GO
INSERT INTO [dbo].[BasicInfo] ([UserID], [StaffName], [Gender], [Birthday], [Race], [Company], [Department], [Position], [Title], [Contact], [Email], [Address], [UrgentContact], [UrgentPerson], [CardID], [Politics], [Marriage], [School], [Education], [Major], [OldName], [Computer], [ForeignLan], [ForeignLev], [EnterDate], [FileAddr], [OnJob]) VALUES (N'3', N'员工乙', N'1', N'2015-02-04', N'汉族        ', null, N'数字减灾与智慧应急工程部', N'员工        ', N'讲师        ', N'', N'', N'', N'', N'          ', N'', N'中共党员', N'未婚        ', N'', N'本科        ', N',', N'          ', N'', N'', N'          ', N'2015-02-05', N'', N'1');
GO
INSERT INTO [dbo].[BasicInfo] ([UserID], [StaffName], [Gender], [Birthday], [Race], [Company], [Department], [Position], [Title], [Contact], [Email], [Address], [UrgentContact], [UrgentPerson], [CardID], [Politics], [Marriage], [School], [Education], [Major], [OldName], [Computer], [ForeignLan], [ForeignLev], [EnterDate], [FileAddr], [OnJob]) VALUES (N'17', N'员工丙', N'1', N'2015-02-03', N'汉族', null, N'教育培训部', N'员工', N'无', N'', N'', N'', N'', N'', N'', N'中共党员', N'未婚', N'', N'本科', N'', N'', N'', N'', N'', N'2015-02-12', N'', N'0');
GO
INSERT INTO [dbo].[BasicInfo] ([UserID], [StaffName], [Gender], [Birthday], [Race], [Company], [Department], [Position], [Title], [Contact], [Email], [Address], [UrgentContact], [UrgentPerson], [CardID], [Politics], [Marriage], [School], [Education], [Major], [OldName], [Computer], [ForeignLan], [ForeignLev], [EnterDate], [FileAddr], [OnJob]) VALUES (N'5', N'项目经理甲 ', N'1', N'2015-02-02', N'汉族        ', null, N'数字流域与智慧城镇工程部', N'项目经理      ', N'工程师       ', N'', N'', N'', N'', N'          ', N'', N'中共党员', N'未婚        ', N'', N'本科        ', N',', N'          ', N'', N'', N'          ', N'2015-02-17', N'', N'1');
GO
INSERT INTO [dbo].[BasicInfo] ([UserID], [StaffName], [Gender], [Birthday], [Race], [Company], [Department], [Position], [Title], [Contact], [Email], [Address], [UrgentContact], [UrgentPerson], [CardID], [Politics], [Marriage], [School], [Education], [Major], [OldName], [Computer], [ForeignLan], [ForeignLev], [EnterDate], [FileAddr], [OnJob]) VALUES (N'6', N'项目经理乙', N'1', N'2015-02-12', N'汉族        ', null, N'数字减灾与智慧应急工程部', N'项目经理      ', N'工程师       ', N'', N'', N'', N'', N'          ', N'', N'中共党员', N'未婚        ', N'', N'本科        ', N',', N'          ', N'', N'', N'          ', N'2015-02-05', N'', N'1');
GO
INSERT INTO [dbo].[BasicInfo] ([UserID], [StaffName], [Gender], [Birthday], [Race], [Company], [Department], [Position], [Title], [Contact], [Email], [Address], [UrgentContact], [UrgentPerson], [CardID], [Politics], [Marriage], [School], [Education], [Major], [OldName], [Computer], [ForeignLan], [ForeignLev], [EnterDate], [FileAddr], [OnJob]) VALUES (N'18', N'项目经理丙', N'1', N'2015-02-12', N'汉族        ', null, N'战略规划部', N'项目经理      ', N'助理工程师     ', N'', N'', N'', N'', N'          ', N'', N'中共党员', N'未婚        ', N'', N'本科        ', N',', N'          ', N'', N'', N'          ', N'2015-02-05', N'', N'1');
GO
INSERT INTO [dbo].[BasicInfo] ([UserID], [StaffName], [Gender], [Birthday], [Race], [Company], [Department], [Position], [Title], [Contact], [Email], [Address], [UrgentContact], [UrgentPerson], [CardID], [Politics], [Marriage], [School], [Education], [Major], [OldName], [Computer], [ForeignLan], [ForeignLev], [EnterDate], [FileAddr], [OnJob]) VALUES (N'9', N'部门经理甲', N'1', N'2015-02-05', N'汉族        ', null, N'数字流域与智慧城镇工程部', N'部门经理      ', N'讲师        ', N'', N'', N'', N'', N'          ', N'', N'中共党员', N'未婚        ', N'', N'本科        ', N',', N'          ', N'', N'', N'          ', N'2015-02-12', N'', N'1');
GO
INSERT INTO [dbo].[BasicInfo] ([UserID], [StaffName], [Gender], [Birthday], [Race], [Company], [Department], [Position], [Title], [Contact], [Email], [Address], [UrgentContact], [UrgentPerson], [CardID], [Politics], [Marriage], [School], [Education], [Major], [OldName], [Computer], [ForeignLan], [ForeignLev], [EnterDate], [FileAddr], [OnJob]) VALUES (N'10', N'部门经理乙', N'1', N'2015-02-05', N'汉族        ', null, N'数字减灾与智慧应急工程部', N'部门经理      ', N'高级工程师     ', N'', N'', N'', N'', N'          ', N'', N'中共党员', N'未婚        ', N'', N'本科        ', N',', N'          ', N'', N'', N'          ', N'2015-02-04', N'', N'1');
GO
INSERT INTO [dbo].[BasicInfo] ([UserID], [StaffName], [Gender], [Birthday], [Race], [Company], [Department], [Position], [Title], [Contact], [Email], [Address], [UrgentContact], [UrgentPerson], [CardID], [Politics], [Marriage], [School], [Education], [Major], [OldName], [Computer], [ForeignLan], [ForeignLev], [EnterDate], [FileAddr], [OnJob]) VALUES (N'11', N'部门经理丙', N'1', N'2015-02-05', N'汉族        ', null, N'教育培训部', N'部门经理      ', N'高级工程师     ', N'', N'', N'', N'', N'          ', N'', N'中共党员', N'未婚        ', N'', N'本科        ', N',', N'          ', N'', N'', N'          ', N'2015-02-10', N'', N'1');
GO
INSERT INTO [dbo].[BasicInfo] ([UserID], [StaffName], [Gender], [Birthday], [Race], [Company], [Department], [Position], [Title], [Contact], [Email], [Address], [UrgentContact], [UrgentPerson], [CardID], [Politics], [Marriage], [School], [Education], [Major], [OldName], [Computer], [ForeignLan], [ForeignLev], [EnterDate], [FileAddr], [OnJob]) VALUES (N'8', N'会计甲', N'1', N'2015-02-05', N'汉族        ', null, N'数字流域与智慧城镇工程部', N'会计        ', N'技术员       ', N'', N'', N'', N'', N'          ', N'', N'中共党员', N'未婚        ', N'', N'本科        ', N',', N'          ', N'', N'', N'          ', N'2015-02-05', N'', N'1');
GO
INSERT INTO [dbo].[BasicInfo] ([UserID], [StaffName], [Gender], [Birthday], [Race], [Company], [Department], [Position], [Title], [Contact], [Email], [Address], [UrgentContact], [UrgentPerson], [CardID], [Politics], [Marriage], [School], [Education], [Major], [OldName], [Computer], [ForeignLan], [ForeignLev], [EnterDate], [FileAddr], [OnJob]) VALUES (N'7', N'出纳甲', N'1', N'2015-02-04', N'汉族        ', null, N'数字流域与智慧城镇工程部', N'出纳        ', N'工程师       ', N'', N'', N'', N'', N'          ', N'', N'中共党员', N'未婚        ', N'', N'本科        ', N',', N'          ', N'', N'', N'          ', N'2015-02-03', N'', N'1');
GO
INSERT INTO [dbo].[BasicInfo] ([UserID], [StaffName], [Gender], [Birthday], [Race], [Company], [Department], [Position], [Title], [Contact], [Email], [Address], [UrgentContact], [UrgentPerson], [CardID], [Politics], [Marriage], [School], [Education], [Major], [OldName], [Computer], [ForeignLan], [ForeignLev], [EnterDate], [FileAddr], [OnJob]) VALUES (N'12', N'综管经理甲 ', N'1', N'2015-02-10', N'汉族        ', null, N'数字流域与智慧城镇工程部', N'综管经理      ', N'高级工程师     ', N'', N'', N'', N'', N'          ', N'', N'中共党员', N'未婚        ', N'', N'本科        ', N',', N'          ', N'', N'', N'          ', N'2015-02-05', N'', N'1');
GO
INSERT INTO [dbo].[BasicInfo] ([UserID], [StaffName], [Gender], [Birthday], [Race], [Company], [Department], [Position], [Title], [Contact], [Email], [Address], [UrgentContact], [UrgentPerson], [CardID], [Politics], [Marriage], [School], [Education], [Major], [OldName], [Computer], [ForeignLan], [ForeignLev], [EnterDate], [FileAddr], [OnJob]) VALUES (N'14', N'财务主管甲 ', N'1', N'2015-02-04', N'汉族', null, N'业务发展部', N'财务主管', N'无', N'', N'', N'', N'', N'', N'', N'中共党员', N'未婚', N'', N'本科', N'', N'', N'', N'', N'', N'2015-02-04', N'', N'0');
GO
INSERT INTO [dbo].[BasicInfo] ([UserID], [StaffName], [Gender], [Birthday], [Race], [Company], [Department], [Position], [Title], [Contact], [Email], [Address], [UrgentContact], [UrgentPerson], [CardID], [Politics], [Marriage], [School], [Education], [Major], [OldName], [Computer], [ForeignLan], [ForeignLev], [EnterDate], [FileAddr], [OnJob]) VALUES (N'19', N'机构负责人甲 ', N'1', N'2015-02-03', N'汉族        ', null, N'数字流域与智慧城镇工程部', N'机构负责人     ', N'副教授       ', N'', N'', N'', N'', N'          ', N'', N'中共党员', N'未婚        ', N'', N'本科        ', N',', N'          ', N'', N'', N'          ', N'2015-02-03', N'', N'1');
GO
INSERT INTO [dbo].[BasicInfo] ([UserID], [StaffName], [Gender], [Birthday], [Race], [Company], [Department], [Position], [Title], [Contact], [Email], [Address], [UrgentContact], [UrgentPerson], [CardID], [Politics], [Marriage], [School], [Education], [Major], [OldName], [Computer], [ForeignLan], [ForeignLev], [EnterDate], [FileAddr], [OnJob]) VALUES (N'20', N'管委会负责人甲 ', N'1', N'2015-02-05', N'汉族        ', null, N'数字流域与智慧城镇工程部', N'管委会负责人    ', N'无         ', N'', N'', N'', N'', N'          ', N'', N'中共党员', N'未婚        ', N'', N'本科        ', N',', N'          ', N'', N'', N'          ', N'2015-02-05', N'', N'1');
GO
INSERT INTO [dbo].[BasicInfo] ([UserID], [StaffName], [Gender], [Birthday], [Race], [Company], [Department], [Position], [Title], [Contact], [Email], [Address], [UrgentContact], [UrgentPerson], [CardID], [Politics], [Marriage], [School], [Education], [Major], [OldName], [Computer], [ForeignLan], [ForeignLev], [EnterDate], [FileAddr], [OnJob]) VALUES (N'27', N'呵呵', N'1', N'2015-05-08', N'汉族', N'未填写', N'业务发展部', N'财务主管', N'无', N'', N'', N'', N'', N'', N'', N'中共党员', N'未婚', N'', N'本科', N'', N'', N'', N'', N'', N'2015-05-08', N'', N'0');
GO
INSERT INTO [dbo].[BasicInfo] ([UserID], [StaffName], [Gender], [Birthday], [Race], [Company], [Department], [Position], [Title], [Contact], [Email], [Address], [UrgentContact], [UrgentPerson], [CardID], [Politics], [Marriage], [School], [Education], [Major], [OldName], [Computer], [ForeignLan], [ForeignLev], [EnterDate], [FileAddr], [OnJob]) VALUES (N'28', N'臧茜', N'0', N'1969-08-17', N'汉族', N'北京京元数研科技有限公司', N'综合管理部', N'财务主管', N'无', N'13701275438', N'zangqian1969@163.com', N'北京朝阳区安慧北里逸园3号楼3单元902', N'', N'', N'650105196908170049', N'群众', N'已婚', N'新疆乌鲁木齐财政学院', N'专科', N'财会', N'', N'', N'', N'', N'2014-03-12', N'', N'1');
GO
INSERT INTO [dbo].[BasicInfo] ([UserID], [StaffName], [Gender], [Birthday], [Race], [Company], [Department], [Position], [Title], [Contact], [Email], [Address], [UrgentContact], [UrgentPerson], [CardID], [Politics], [Marriage], [School], [Education], [Major], [OldName], [Computer], [ForeignLan], [ForeignLev], [EnterDate], [FileAddr], [OnJob]) VALUES (N'30', N'新员工甲', N'1', N'1989-07-02', N'汉族', N'未填写', N'数字流域与智慧城镇工程部', N'员工', N'工程师', N'15120074909', N'mxw976235955@sina.com', N'北京市海淀区颐和园路5号北京大学46#1074', N'62799093', N'马晓伟', N'370686198907022519', N'中共党员', N'未婚', N'北京大学', N'硕士研究生', N'健身、篮球、游泳、动漫', N'曾用名甲', N'良好', N'英语', N'六级', N'2015-05-11', N'北京市海淀区颐和园路5号', N'0');
GO
INSERT INTO [dbo].[BasicInfo] ([UserID], [StaffName], [Gender], [Birthday], [Race], [Company], [Department], [Position], [Title], [Contact], [Email], [Address], [UrgentContact], [UrgentPerson], [CardID], [Politics], [Marriage], [School], [Education], [Major], [OldName], [Computer], [ForeignLan], [ForeignLev], [EnterDate], [FileAddr], [OnJob]) VALUES (N'31', N'籍伟丽', N'0', N'1991-06-28', N'汉族', null, N'综合管理部', N'员工', N'无', N'', N'', N'', N'', N'', N'', N'群众', N'未婚', N'', N'专科', N'', N'', N'', N'', N'', N'2013-09-06', N'', N'1');
GO
INSERT INTO [dbo].[BasicInfo] ([UserID], [StaffName], [Gender], [Birthday], [Race], [Company], [Department], [Position], [Title], [Contact], [Email], [Address], [UrgentContact], [UrgentPerson], [CardID], [Politics], [Marriage], [School], [Education], [Major], [OldName], [Computer], [ForeignLan], [ForeignLev], [EnterDate], [FileAddr], [OnJob]) VALUES (N'29', N'吴桂会', N'0', N'1990-09-29', N'汉族', null, N'综合管理部', N'员工', N'无', N'', N'', N'', N'', N'', N'', N'群众', N'未婚', N'', N'专科', N'跑步、听音乐', N'', N'', N'', N'', N'2014-10-10', N'', N'1');
GO
INSERT INTO [dbo].[BasicInfo] ([UserID], [StaffName], [Gender], [Birthday], [Race], [Company], [Department], [Position], [Title], [Contact], [Email], [Address], [UrgentContact], [UrgentPerson], [CardID], [Politics], [Marriage], [School], [Education], [Major], [OldName], [Computer], [ForeignLan], [ForeignLev], [EnterDate], [FileAddr], [OnJob]) VALUES (N'32', N'高妍', N'0', N'1978-06-26', N'汉族', N'北京京元数研科技有限公司', N'业务发展部', N'机构负责人', N'无', N'13718517991', N'lucky_gaoyan@126.com', N'北京昌平区', N'', N'', N'120223197806264422', N'中共党员', N'已婚', N'北京大学', N'本科', N'机械', N'', N'良好', N'英语', N'六级', N'2007-06-06', N'北京', N'1');
GO

-- ----------------------------
-- Table structure for [dbo].[BusinessTripApplies]
-- ----------------------------
DROP TABLE [dbo].[BusinessTripApplies]
GO
CREATE TABLE [dbo].[BusinessTripApplies] (
[RecordID] int NOT NULL IDENTITY(1,1) ,
[StaffName] nvarchar(20) NULL ,
[Department] nvarchar(20) NULL ,
[StartDate] date NULL ,
[EndDate] date NULL ,
[ApplyDate] date NOT NULL ,
[ProjectName] nvarchar(50) NOT NULL ,
[ProjectAccount] nvarchar(50) NOT NULL ,
[Reason] nvarchar(200) NOT NULL ,
[Traffic] nvarchar(200) NOT NULL ,
[Cars] nvarchar(200) NOT NULL ,
[Hotel] nvarchar(200) NOT NULL ,
[Meal] nvarchar(200) NOT NULL ,
[Others] nvarchar(200) NOT NULL ,
[MoneyEstimate] float(53) NOT NULL ,
[ApproveProcess] nvarchar(100) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[BusinessTripApplies]', RESEED, 1003)
GO

-- ----------------------------
-- Records of BusinessTripApplies
-- ----------------------------
SET IDENTITY_INSERT [dbo].[BusinessTripApplies] ON
GO
INSERT INTO [dbo].[BusinessTripApplies] ([RecordID], [StaffName], [Department], [StartDate], [EndDate], [ApplyDate], [ProjectName], [ProjectAccount], [Reason], [Traffic], [Cars], [Hotel], [Meal], [Others], [MoneyEstimate], [ApproveProcess]) VALUES (N'1', N'员工乙', N'研究开发部', N'2015-04-06', N'2015-04-18', N'2015-04-04', N'项目三', N'AS0000000', N'共中央总书记、国家主席、中央军委主席习近平3日上午在参加首都义务植树活动时强调', N'共中央总书记、国家主席、中央军委主席习近平3日上午在参加首都义务植树活动时强调', N'共中央总书记、国家主席、中央军委主席习近平3日上午在参加首都义务植树活动时强调', N'共中央总书记、国家主席、中央军委主席习近平3日上午在参加首都义务植树活动时强调', N'共中央总书记、国家主席、中央军委主席习近平3日上午在参加首都义务植树活动时强调', N'共中央总书记、国家主席、中央军委主席习近平3日上午在参加首都义务植树活动时强调', N'3000', N'项目经理乙-同意,部门经理乙-同意,财务主管甲-同意,机构负责人甲-同意,会计甲-同意,出纳甲-同意,');
GO
INSERT INTO [dbo].[BusinessTripApplies] ([RecordID], [StaffName], [Department], [StartDate], [EndDate], [ApplyDate], [ProjectName], [ProjectAccount], [Reason], [Traffic], [Cars], [Hotel], [Meal], [Others], [MoneyEstimate], [ApproveProcess]) VALUES (N'2', N'员工乙', N'研究开发部', N'2015-04-07', N'2015-04-18', N'2015-04-04', N'项目三', N'AS0000000', N'颜色由一个十六进制符号来定义，这个符号由红色、绿色和蓝色的值组成（RGB）。
每种颜色的最小值是0（十六进制：#00）。最大值是255（十六进制：#FF）。', N'颜色由一个十六进制符号来定义，这个符号由红色、绿色和蓝色的值组成（RGB）。
每种颜色的最小值是0（十六进制：#00）。最大值是255（十六进制：#FF）。', N'颜色由一个十六进制符号来定义，这个符号由红色、绿色和蓝色的值组成（RGB）。
每种颜色的最小值是0（十六进制：#00）。最大值是255（十六进制：#FF）。', N'颜色由一个十六进制符号来定义，这个符号由红色、绿色和蓝色的值组成（RGB）。
每种颜色的最小值是0（十六进制：#00）。最大值是255（十六进制：#FF）。', N'颜色由一个十六进制符号来定义，这个符号由红色、绿色和蓝色的值组成（RGB）。
每种颜色的最小值是0（十六进制：#00）。最大值是255（十六进制：#FF）。', N'颜色由一个十六进制符号来定义，这个符号由红色、绿色和蓝色的值组成（RGB）。
每种颜色的最小值是0（十六进制：#00）。最大值是255（十六进制：#FF）。', N'2000', N'项目经理乙-同意,部门经理乙-同意,财务主管甲-同意,机构负责人甲-同意,会计甲-同意,出纳甲-同意,');
GO
INSERT INTO [dbo].[BusinessTripApplies] ([RecordID], [StaffName], [Department], [StartDate], [EndDate], [ApplyDate], [ProjectName], [ProjectAccount], [Reason], [Traffic], [Cars], [Hotel], [Meal], [Others], [MoneyEstimate], [ApproveProcess]) VALUES (N'1002', N'臧茜', N'综合管理部', N'2015-05-06', N'2015-05-14', N'2015-05-06', N'智慧长阳总体规划', N'432402-028', N'张三', N'飞机', N'300', N'300', N'300', N'300', N'30000', N'臧茜-同意,臧茜-同意,');
GO
INSERT INTO [dbo].[BusinessTripApplies] ([RecordID], [StaffName], [Department], [StartDate], [EndDate], [ApplyDate], [ProjectName], [ProjectAccount], [Reason], [Traffic], [Cars], [Hotel], [Meal], [Others], [MoneyEstimate], [ApproveProcess]) VALUES (N'1003', N'吴桂会', N'综合管理部', N'2015-05-27', N'2015-05-29', N'2015-05-27', N'京元数研费用', N'FW0000000', N'臧茜、籍伟丽
唐山 审计', N'火车费1000元', N'出租车200元', N'三人三天两晚 200元', N'1000元', N'2000元', N'4400', N'臧茜-同意,');
GO
SET IDENTITY_INSERT [dbo].[BusinessTripApplies] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[BusinessTripRei]
-- ----------------------------
DROP TABLE [dbo].[BusinessTripRei]
GO
CREATE TABLE [dbo].[BusinessTripRei] (
[RecordID] int NOT NULL IDENTITY(1,1) ,
[StaffName] nvarchar(20) NOT NULL ,
[Department] nvarchar(20) NOT NULL ,
[StartDate] date NOT NULL ,
[EndDate] date NOT NULL ,
[ApplyDate] date NOT NULL ,
[ProjectName] nvarchar(50) NOT NULL ,
[ProjectAccount] nvarchar(50) NOT NULL ,
[Reason] nvarchar(100) NOT NULL ,
[Traffic] nvarchar(200) NOT NULL ,
[Cars] nvarchar(200) NOT NULL ,
[Hotel] nvarchar(200) NOT NULL ,
[Meal] nvarchar(200) NOT NULL ,
[Others] nvarchar(200) NOT NULL ,
[MoneyEstimate] float(53) NOT NULL ,
[MoneyRei] float(53) NOT NULL ,
[ApproveProcess] nvarchar(100) NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[BusinessTripRei]', RESEED, 1003)
GO

-- ----------------------------
-- Records of BusinessTripRei
-- ----------------------------
SET IDENTITY_INSERT [dbo].[BusinessTripRei] ON
GO
INSERT INTO [dbo].[BusinessTripRei] ([RecordID], [StaffName], [Department], [StartDate], [EndDate], [ApplyDate], [ProjectName], [ProjectAccount], [Reason], [Traffic], [Cars], [Hotel], [Meal], [Others], [MoneyEstimate], [MoneyRei], [ApproveProcess]) VALUES (N'1', N'员工甲', N'交流合作部', N'2015-04-13', N'2015-04-18', N'2015-04-03', N'项目一', N'项目账号1                                             ', N'春回大地，万象更新。上午9时30分许，党和国家领导人习近平、李克强、张德江、俞正声、刘云山、王岐山、张高丽等集体乘车', N'春回大地，万象更新。上午9时30分许，党和国家领导人习近平、李克强、张德江、俞正声、刘云山、王岐山、张高丽等集体乘车', N'春回大地，万象更新。上午9时30分许，党和国家领导人习近平、李克强、张德江、俞正声、刘云山、王岐山、张高丽等集体乘车', N'春回大地，万象更新。上午9时30分许，党和国家领导人习近平、李克强、张德江、俞正声、刘云山、王岐山、张高丽等集体乘车', N'春回大地，万象更新。上午9时30分许，党和国家领导人习近平、李克强、张德江、俞正声、刘云山、王岐山、张高丽等集体乘车', N'春回大地，万象更新。上午9时30分许，党和国家领导人习近平、李克强、张德江、俞正声、刘云山、王岐山、张高丽等集体乘车', N'0', N'0', N'项目经理甲-同意,部门经理甲-不同意,若不同意请注明理由：你猜我为什么不同意,');
GO
INSERT INTO [dbo].[BusinessTripRei] ([RecordID], [StaffName], [Department], [StartDate], [EndDate], [ApplyDate], [ProjectName], [ProjectAccount], [Reason], [Traffic], [Cars], [Hotel], [Meal], [Others], [MoneyEstimate], [MoneyRei], [ApproveProcess]) VALUES (N'2', N'员工甲', N'交流合作部', N'2015-04-13', N'2015-04-17', N'2015-04-04', N'项目三', N'项目账号2                                             ', N'春回大地，万象更新。上午9时30分许，党和国家领导人习近平、李克强、张德江、俞正声、刘云山、王岐山、张高丽等集体乘车', N'春回大地，万象更新。上午9时30分许，党和国家领导人习近平、李克强、张德江、俞正声、刘云山、王岐山、张高丽等集体乘车', N'春回大地，万象更新。上午9时30分许，党和国家领导人习近平、李克强、张德江、俞正声、刘云山、王岐山、张高丽等集体乘车', N'春回大地，万象更新。上午9时30分许，党和国家领导人习近平、李克强、张德江、俞正声、刘云山、王岐山、张高丽等集体乘车', N'春回大地，万象更新。上午9时30分许，党和国家领导人习近平、李克强、张德江、俞正声、刘云山、王岐山、张高丽等集体乘车', N'春回大地，万象更新。上午9时30分许，党和国家领导人习近平、李克强、张德江、俞正声、刘云山、王岐山、张高丽等集体乘车', N'20000', N'15000', N'项目经理乙-同意,部门经理甲-同意,财务主管甲-同意,会计甲-同意,财务主管甲-同意,出纳甲-同意,');
GO
INSERT INTO [dbo].[BusinessTripRei] ([RecordID], [StaffName], [Department], [StartDate], [EndDate], [ApplyDate], [ProjectName], [ProjectAccount], [Reason], [Traffic], [Cars], [Hotel], [Meal], [Others], [MoneyEstimate], [MoneyRei], [ApproveProcess]) VALUES (N'1002', N'员工乙', N'研究开发部', N'2015-05-10', N'2015-05-17', N'2015-05-03', N'项目三', N'项目账号3                                             ', N'不只是', N'她4图34we', N'23423绯闻绯闻', N'23', N'额度为', N'温度范围', N'5000', N'2500.2', N'');
GO
INSERT INTO [dbo].[BusinessTripRei] ([RecordID], [StaffName], [Department], [StartDate], [EndDate], [ApplyDate], [ProjectName], [ProjectAccount], [Reason], [Traffic], [Cars], [Hotel], [Meal], [Others], [MoneyEstimate], [MoneyRei], [ApproveProcess]) VALUES (N'1003', N'臧茜', N'综合管理部', N'2015-05-06', N'2015-05-13', N'2015-05-06', N'京元数研费用', N'FW0000000', N'300', N'300', N'300', N'300', N'300', N'300', N'1500', N'1500', N'');
GO
SET IDENTITY_INSERT [dbo].[BusinessTripRei] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[BusinessTripSummary]
-- ----------------------------
DROP TABLE [dbo].[BusinessTripSummary]
GO
CREATE TABLE [dbo].[BusinessTripSummary] (
[RecordID] int NOT NULL IDENTITY(1,1) ,
[StaffName] nvarchar(20) NOT NULL ,
[Department] nvarchar(20) NOT NULL ,
[StartDate] date NOT NULL ,
[EndDate] date NOT NULL ,
[ProjectName] nvarchar(50) NOT NULL ,
[Location] nvarchar(50) NOT NULL ,
[Expense] nvarchar(200) NOT NULL ,
[Travel] nvarchar(200) NOT NULL ,
[Reason] nvarchar(200) NOT NULL ,
[Finished] nvarchar(200) NOT NULL ,
[Unfinished] nvarchar(200) NOT NULL ,
[ApproveProcess] nvarchar(100) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[BusinessTripSummary]', RESEED, 1001)
GO

-- ----------------------------
-- Records of BusinessTripSummary
-- ----------------------------
SET IDENTITY_INSERT [dbo].[BusinessTripSummary] ON
GO
INSERT INTO [dbo].[BusinessTripSummary] ([RecordID], [StaffName], [Department], [StartDate], [EndDate], [ProjectName], [Location], [Expense], [Travel], [Reason], [Finished], [Unfinished], [ApproveProcess]) VALUES (N'2', N'员工乙', N'研究开发部', N'2015-04-05', N'2015-04-11', N'项目三', N'我问', N'【喝完酒后几天，最好能喝点粥】春节阖家团聚，难免举杯相贺、开怀畅饮，而酒精对消化系统有刺激作用，尤其会伤害肠胃。建议喝完酒后的几天最好能喝点粥，一碗热粥可以让肠胃得到滋养，', N'【喝完酒后几天，最好能喝点粥】春节阖家团聚，难免举杯相贺、开怀畅饮，而酒精对消化系统有刺激作用，尤其会伤害肠胃。建议喝完酒后的几天最好能喝点粥，一碗热粥可以让肠胃得到滋养，', N'【喝完酒后几天，最好能喝点粥】春节阖家团聚，难免举杯相贺、开怀畅饮，而酒精对消化系统有刺激作用，尤其会伤害肠胃。建议喝完酒后的几天最好能喝点粥，一碗热粥可以让肠胃得到滋养，', N'【喝完酒后几天，最好能喝点粥】春节阖家团聚，难免举杯相贺、开怀畅饮，而酒精对消化系统有刺激作用，尤其会伤害肠胃。建议喝完酒后的几天最好能喝点粥，一碗热粥可以让肠胃得到滋养，', N'【喝完酒后几天，最好能喝点粥】春节阖家团聚，难免举杯相贺、开怀畅饮，而酒精对消化系统有刺激作用，尤其会伤害肠胃。建议喝完酒后的几天最好能喝点粥，一碗热粥可以让肠胃得到滋养，', N'');
GO
SET IDENTITY_INSERT [dbo].[BusinessTripSummary] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[BusinessUnit]
-- ----------------------------
DROP TABLE [dbo].[BusinessUnit]
GO
CREATE TABLE [dbo].[BusinessUnit] (
[UnitID] int NOT NULL IDENTITY(1,1) ,
[UnitName] nvarchar(50) NOT NULL ,
[Responsible] nvarchar(50) NOT NULL ,
[UnitCode] nvarchar(20) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[BusinessUnit]', RESEED, 11)
GO

-- ----------------------------
-- Records of BusinessUnit
-- ----------------------------
SET IDENTITY_INSERT [dbo].[BusinessUnit] ON
GO
INSERT INTO [dbo].[BusinessUnit] ([UnitID], [UnitName], [Responsible], [UnitCode]) VALUES (N'11', N'GeoSIS实验室', N'陈秀万', N'GOS');
GO
SET IDENTITY_INSERT [dbo].[BusinessUnit] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[CarUseApplies]
-- ----------------------------
DROP TABLE [dbo].[CarUseApplies]
GO
CREATE TABLE [dbo].[CarUseApplies] (
[ApplyID] int NOT NULL IDENTITY(1,1) ,
[StaffName] nvarchar(20) NOT NULL ,
[Department] nvarchar(20) NOT NULL ,
[StartDate] date NULL ,
[EndDate] date NULL ,
[AlongCount] int NOT NULL ,
[AlongName] nvarchar(50) NOT NULL ,
[Reason] nvarchar(200) NOT NULL ,
[Destination] nvarchar(50) NOT NULL ,
[Driver] nvarchar(20) NOT NULL ,
[CarNum] nvarchar(10) NOT NULL ,
[Note] nvarchar(100) NULL ,
[ApproveProcess] nvarchar(100) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[CarUseApplies]', RESEED, 8)
GO

-- ----------------------------
-- Records of CarUseApplies
-- ----------------------------
SET IDENTITY_INSERT [dbo].[CarUseApplies] ON
GO
INSERT INTO [dbo].[CarUseApplies] ([ApplyID], [StaffName], [Department], [StartDate], [EndDate], [AlongCount], [AlongName], [Reason], [Destination], [Driver], [CarNum], [Note], [ApproveProcess]) VALUES (N'1', N'员工乙', N'研究开发部', N'2015-06-12', N'2015-06-15', N'5', N'2334她4她4她4图团委', N'范文网', N'二二', N'的访问', N'尔耳人防费', N'DFWE', null);
GO
INSERT INTO [dbo].[CarUseApplies] ([ApplyID], [StaffName], [Department], [StartDate], [EndDate], [AlongCount], [AlongName], [Reason], [Destination], [Driver], [CarNum], [Note], [ApproveProcess]) VALUES (N'2', N'员工乙', N'研究开发部', N'2015-06-13', N'2015-06-27', N'3', N'冯文蔚we额玩儿法', N'问问', N'问问', N'额外人3 ', N'如3如认为', N'', N'部门经理乙-同意,财务主管甲-同意,机构负责人甲-同意,管委会负责人甲-同意,会计甲-同意,');
GO
INSERT INTO [dbo].[CarUseApplies] ([ApplyID], [StaffName], [Department], [StartDate], [EndDate], [AlongCount], [AlongName], [Reason], [Destination], [Driver], [CarNum], [Note], [ApproveProcess]) VALUES (N'3', N'员工乙', N'研究开发部', N'2015-06-01', N'2015-07-01', N'4', N'为额2饿认为为范围', N' 为范围', N'为范围', N'玩儿微微 ', N'娃儿温柔323 ', N'', N'部门经理乙-同意,财务主管甲-不同意,若不同意请注明理由：,');
GO
INSERT INTO [dbo].[CarUseApplies] ([ApplyID], [StaffName], [Department], [StartDate], [EndDate], [AlongCount], [AlongName], [Reason], [Destination], [Driver], [CarNum], [Note], [ApproveProcess]) VALUES (N'4', N'员工乙', N'研究开发部', N'2015-07-01', N'2015-08-14', N'5', N'为违法', N'为二位', N'问问', N'额外认为', N'23如3如我', N'', N'部门经理乙-同意,财务主管甲-同意,机构负责人甲-同意,管委会负责人甲-同意,会计甲-同意,');
GO
INSERT INTO [dbo].[CarUseApplies] ([ApplyID], [StaffName], [Department], [StartDate], [EndDate], [AlongCount], [AlongName], [Reason], [Destination], [Driver], [CarNum], [Note], [ApproveProcess]) VALUES (N'5', N'籍伟丽', N'综合管理部', N'1-01-01', N'1-01-01', N'5', N'籍伟丽', N'会议租车', N'知春路', N'吴', N'京FH4678', N'', null);
GO
INSERT INTO [dbo].[CarUseApplies] ([ApplyID], [StaffName], [Department], [StartDate], [EndDate], [AlongCount], [AlongName], [Reason], [Destination], [Driver], [CarNum], [Note], [ApproveProcess]) VALUES (N'6', N'籍伟丽', N'综合管理部', N'1-01-01', N'1-01-01', N'5', N'籍伟丽', N'会议租车', N'知春路', N'吴', N'京FH4678', N'', N'臧茜-同意,');
GO
INSERT INTO [dbo].[CarUseApplies] ([ApplyID], [StaffName], [Department], [StartDate], [EndDate], [AlongCount], [AlongName], [Reason], [Destination], [Driver], [CarNum], [Note], [ApproveProcess]) VALUES (N'7', N'吴桂会', N'综合管理部', N'1-01-01', N'1-01-01', N'3', N'臧茜、籍伟丽、吴桂会', N'项目审计', N'中科院', N'张三', N'京N1234', N'', N'臧茜-同意,臧茜-同意,臧茜-同意,臧茜-同意,');
GO
INSERT INTO [dbo].[CarUseApplies] ([ApplyID], [StaffName], [Department], [StartDate], [EndDate], [AlongCount], [AlongName], [Reason], [Destination], [Driver], [CarNum], [Note], [ApproveProcess]) VALUES (N'8', N'籍伟丽', N'综合管理部', N'1-01-01', N'1-01-01', N'2', N'臧茜，籍伟丽', N'去送审计资料', N'中科院', N'张三', N'京N19V65', N'无', null);
GO
SET IDENTITY_INSERT [dbo].[CarUseApplies] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[CarUseRecord]
-- ----------------------------
DROP TABLE [dbo].[CarUseRecord]
GO
CREATE TABLE [dbo].[CarUseRecord] (
[RecordID] int NOT NULL IDENTITY(1,1) ,
[ApplyID] int NOT NULL ,
[Durings] varchar(50) NOT NULL ,
[Destination] varchar(50) NOT NULL ,
[MilesBefore] float(53) NOT NULL ,
[MilesAfter] float(53) NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[CarUseRecord]', RESEED, 1001)
GO

-- ----------------------------
-- Records of CarUseRecord
-- ----------------------------
SET IDENTITY_INSERT [dbo].[CarUseRecord] ON
GO
INSERT INTO [dbo].[CarUseRecord] ([RecordID], [ApplyID], [Durings], [Destination], [MilesBefore], [MilesAfter]) VALUES (N'1', N'4', N'A', N'B', N'10', N'20');
GO
INSERT INTO [dbo].[CarUseRecord] ([RecordID], [ApplyID], [Durings], [Destination], [MilesBefore], [MilesAfter]) VALUES (N'2', N'4', N'C', N'D', N'20', N'30');
GO
SET IDENTITY_INSERT [dbo].[CarUseRecord] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[CheckIn]
-- ----------------------------
DROP TABLE [dbo].[CheckIn]
GO
CREATE TABLE [dbo].[CheckIn] (
[RecordID] int NOT NULL IDENTITY(1,1) ,
[RecordMonth] date NOT NULL ,
[StaffName] nvarchar(20) NULL ,
[Department] nvarchar(20) NULL ,
[StartDate] date NULL ,
[ShouldBe] int NULL ,
[ActualBe] int NULL ,
[InnerTen] int NULL ,
[InnerThirty] int NULL ,
[OverThirty] int NULL ,
[Late] int NULL ,
[Funeral] int NULL ,
[Sick] int NULL ,
[Matter] int NULL ,
[Performance] int NULL ,
[Remaining] int NULL ,
[OverTime] int NULL ,
[Shift] int NULL ,
[AllRemaining] int NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[CheckIn]', RESEED, 6)
GO

-- ----------------------------
-- Records of CheckIn
-- ----------------------------
SET IDENTITY_INSERT [dbo].[CheckIn] ON
GO
INSERT INTO [dbo].[CheckIn] ([RecordID], [RecordMonth], [StaffName], [Department], [StartDate], [ShouldBe], [ActualBe], [InnerTen], [InnerThirty], [OverThirty], [Late], [Funeral], [Sick], [Matter], [Performance], [Remaining], [OverTime], [Shift], [AllRemaining]) VALUES (N'1', N'2015-04-01', N'员工甲', N'交流合作部', N'2011-04-01', N'17', N'7', N'1', N'2', N'3', N'5', N'2', N'5', N'9', N'0', N'0', N'8', N'56', N'-48');
GO
INSERT INTO [dbo].[CheckIn] ([RecordID], [RecordMonth], [StaffName], [Department], [StartDate], [ShouldBe], [ActualBe], [InnerTen], [InnerThirty], [OverThirty], [Late], [Funeral], [Sick], [Matter], [Performance], [Remaining], [OverTime], [Shift], [AllRemaining]) VALUES (N'2', N'2015-04-01', N'员工丙', N'战略规划部', N'2010-04-07', N'19', N'12', N'1', N'2', N'4', N'2', N'1', N'2', N'3', N'0', N'20', N'10', N'5', N'25');
GO
INSERT INTO [dbo].[CheckIn] ([RecordID], [RecordMonth], [StaffName], [Department], [StartDate], [ShouldBe], [ActualBe], [InnerTen], [InnerThirty], [OverThirty], [Late], [Funeral], [Sick], [Matter], [Performance], [Remaining], [OverTime], [Shift], [AllRemaining]) VALUES (N'3', N'2015-06-01', N'误会', N'业务发展部', N'2015-06-05', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'5');
GO
INSERT INTO [dbo].[CheckIn] ([RecordID], [RecordMonth], [StaffName], [Department], [StartDate], [ShouldBe], [ActualBe], [InnerTen], [InnerThirty], [OverThirty], [Late], [Funeral], [Sick], [Matter], [Performance], [Remaining], [OverTime], [Shift], [AllRemaining]) VALUES (N'4', N'2015-01-01', N'员工甲', N'业务发展部', N'2015-06-03', N'23', N'22', N'2', N'1', N'2', N'2', N'1', N'1', N'1', N'1', N'1', N'1', N'2', N'0');
GO
INSERT INTO [dbo].[CheckIn] ([RecordID], [RecordMonth], [StaffName], [Department], [StartDate], [ShouldBe], [ActualBe], [InnerTen], [InnerThirty], [OverThirty], [Late], [Funeral], [Sick], [Matter], [Performance], [Remaining], [OverTime], [Shift], [AllRemaining]) VALUES (N'5', N'2015-01-01', N'员工乙', N'业务发展部', N'2015-02-10', N'23', N'20', N'2', N'1', N'2', N'2', N'2', N'3', N'2', N'2', N'2', N'3', N'2', N'3');
GO
INSERT INTO [dbo].[CheckIn] ([RecordID], [RecordMonth], [StaffName], [Department], [StartDate], [ShouldBe], [ActualBe], [InnerTen], [InnerThirty], [OverThirty], [Late], [Funeral], [Sick], [Matter], [Performance], [Remaining], [OverTime], [Shift], [AllRemaining]) VALUES (N'6', N'2015-07-01', N'臧茜', N'综合管理部', N'2015-07-01', N'22', N'22', N'1', N'1', N'1', N'1', N'1', N'1', N'1', N'1', N'1', N'1', N'1', N'1');
GO
SET IDENTITY_INSERT [dbo].[CheckIn] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[ContractApplies]
-- ----------------------------
DROP TABLE [dbo].[ContractApplies]
GO
CREATE TABLE [dbo].[ContractApplies] (
[ApplyID] int NOT NULL IDENTITY(1,1) ,
[StaffName] nvarchar(10) NOT NULL ,
[Department] nvarchar(20) NOT NULL ,
[ContractName] nvarchar(50) NOT NULL ,
[ProjectName] nvarchar(50) NOT NULL ,
[ProjectCode] nvarchar(50) NOT NULL ,
[Money] float(53) NOT NULL ,
[PartyBName] nvarchar(50) NOT NULL ,
[PartyBAddress] nvarchar(100) NOT NULL ,
[PartyBContact] nvarchar(20) NOT NULL ,
[PartyBTelephone] nvarchar(20) NOT NULL ,
[BusinessLicense] bit NOT NULL ,
[IndustoryLicense] bit NOT NULL ,
[Others] nvarchar(50) NULL ,
[ApproveProcess] nvarchar(100) NULL 
)


GO

-- ----------------------------
-- Records of ContractApplies
-- ----------------------------
SET IDENTITY_INSERT [dbo].[ContractApplies] ON
GO
INSERT INTO [dbo].[ContractApplies] ([ApplyID], [StaffName], [Department], [ContractName], [ProjectName], [ProjectCode], [Money], [PartyBName], [PartyBAddress], [PartyBContact], [PartyBTelephone], [BusinessLicense], [IndustoryLicense], [Others], [ApproveProcess]) VALUES (N'1', N'员工甲', N'交流合作部', N'中华小当家', N'项目二', N'项目编号2               ', N'2333', N'阳泉酒家', N'秀水镇', N'嘟嘟', N'15120074909', N'1', N'1', N' 问问', N'部门经理甲-同意,财务主管甲-同意,机构负责人甲-同意,管委会负责人甲-同意,');
GO
SET IDENTITY_INSERT [dbo].[ContractApplies] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[Departments]
-- ----------------------------
DROP TABLE [dbo].[Departments]
GO
CREATE TABLE [dbo].[Departments] (
[DepartmentID] int NOT NULL IDENTITY(1,1) ,
[DepartmentName] nvarchar(50) NOT NULL ,
[Responsible] nvarchar(50) NOT NULL ,
[Parent] int NOT NULL ,
[BU_Leader] nvarchar(50) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[Departments]', RESEED, 17)
GO

-- ----------------------------
-- Records of Departments
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Departments] ON
GO
INSERT INTO [dbo].[Departments] ([DepartmentID], [DepartmentName], [Responsible], [Parent], [BU_Leader]) VALUES (N'11', N'业务发展部', N'许琳', N'11', N'高妍');
GO
INSERT INTO [dbo].[Departments] ([DepartmentID], [DepartmentName], [Responsible], [Parent], [BU_Leader]) VALUES (N'12', N'综合管理部', N'臧茜', N'11', N'高妍');
GO
INSERT INTO [dbo].[Departments] ([DepartmentID], [DepartmentName], [Responsible], [Parent], [BU_Leader]) VALUES (N'13', N'数字减灾与智慧应急工程部', N'杨凯欣', N'11', N'杨凯欣');
GO
INSERT INTO [dbo].[Departments] ([DepartmentID], [DepartmentName], [Responsible], [Parent], [BU_Leader]) VALUES (N'14', N'奥赛中心', N'刘晶', N'11', N'刘晶');
GO
INSERT INTO [dbo].[Departments] ([DepartmentID], [DepartmentName], [Responsible], [Parent], [BU_Leader]) VALUES (N'15', N'教育培训部', N'臧茜', N'11', N'刘晶');
GO
INSERT INTO [dbo].[Departments] ([DepartmentID], [DepartmentName], [Responsible], [Parent], [BU_Leader]) VALUES (N'16', N'数字流域与智慧城镇工程部', N'高妍', N'11', N'高妍');
GO
INSERT INTO [dbo].[Departments] ([DepartmentID], [DepartmentName], [Responsible], [Parent], [BU_Leader]) VALUES (N'17', N'无', N'无', N'0', N'无');
GO
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[MealApplies]
-- ----------------------------
DROP TABLE [dbo].[MealApplies]
GO
CREATE TABLE [dbo].[MealApplies] (
[ApplyID] int NOT NULL IDENTITY(1,1) ,
[StaffName] nvarchar(20) NOT NULL ,
[Department] nvarchar(20) NOT NULL ,
[Position] nvarchar(20) NOT NULL ,
[MealDate] date NOT NULL ,
[Persons] int NOT NULL ,
[Money] float(53) NOT NULL ,
[Standard] nvarchar(20) NOT NULL ,
[Reason] nvarchar(50) NOT NULL ,
[Style] bit NOT NULL ,
[Legal] bit NOT NULL ,
[ApproveProcess] nvarchar(100) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[MealApplies]', RESEED, 1003)
GO

-- ----------------------------
-- Records of MealApplies
-- ----------------------------
SET IDENTITY_INSERT [dbo].[MealApplies] ON
GO
INSERT INTO [dbo].[MealApplies] ([ApplyID], [StaffName], [Department], [Position], [MealDate], [Persons], [Money], [Standard], [Reason], [Style], [Legal], [ApproveProcess]) VALUES (N'2', N'员工甲', N'交流合作部', N'员工', N'2015-04-10', N'0', N'1200', N'你猜', N'鸿门宴', N'0', N'1', N'部门经理甲-同意,机构负责人甲-同意,机构负责人甲-同意,');
GO
INSERT INTO [dbo].[MealApplies] ([ApplyID], [StaffName], [Department], [Position], [MealDate], [Persons], [Money], [Standard], [Reason], [Style], [Legal], [ApproveProcess]) VALUES (N'1002', N'吴桂会', N'综合管理部', N'员工', N'2015-05-27', N'2', N'20', N'10', N'会议餐', N'0', N'1', N'臧茜-同意,臧茜-同意,臧茜-同意,臧茜-同意,');
GO
INSERT INTO [dbo].[MealApplies] ([ApplyID], [StaffName], [Department], [Position], [MealDate], [Persons], [Money], [Standard], [Reason], [Style], [Legal], [ApproveProcess]) VALUES (N'1003', N'臧茜', N'综合管理部', N'财务主管', N'2015-06-05', N'56', N'67', N'56', N'理由', N'1', N'1', null);
GO
SET IDENTITY_INSERT [dbo].[MealApplies] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[MoneyApplies]
-- ----------------------------
DROP TABLE [dbo].[MoneyApplies]
GO
CREATE TABLE [dbo].[MoneyApplies] (
[RecordID] int NOT NULL IDENTITY(1,1) ,
[StaffName] nvarchar(10) NOT NULL ,
[Department] nvarchar(50) NOT NULL ,
[Telephone] nvarchar(20) NOT NULL ,
[Money] float(53) NOT NULL ,
[ProjectCode] nvarchar(50) NOT NULL ,
[Style] nvarchar(10) NOT NULL ,
[Usage] nvarchar(50) NOT NULL ,
[PayPlan] nvarchar(100) NOT NULL ,
[Payee] nvarchar(20) NULL ,
[PayDate] date NOT NULL ,
[ApproveProcess] nvarchar(100) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[MoneyApplies]', RESEED, 1003)
GO

-- ----------------------------
-- Records of MoneyApplies
-- ----------------------------
SET IDENTITY_INSERT [dbo].[MoneyApplies] ON
GO
INSERT INTO [dbo].[MoneyApplies] ([RecordID], [StaffName], [Department], [Telephone], [Money], [ProjectCode], [Style], [Usage], [PayPlan], [Payee], [PayDate], [ApproveProcess]) VALUES (N'1', N'员工甲', N'交流合作部', N'15120074909', N'0', N'项目编号2               ', N'现金', N'范围', N'范围', N'暂无', N'1-01-01', N'项目经理乙-不同意,');
GO
INSERT INTO [dbo].[MoneyApplies] ([RecordID], [StaffName], [Department], [Telephone], [Money], [ProjectCode], [Style], [Usage], [PayPlan], [Payee], [PayDate], [ApproveProcess]) VALUES (N'2', N'员工甲', N'交流合作部', N'15120074909', N'232312', N'项目编号3               ', N'现金', N'飞', N'we', N'暂无', N'2015-04-02', N'项目经理乙-同意,项目经理乙-同意,项目经理乙-同意,部门经理乙-同意,财务主管甲-同意,机构负责人甲-同意,管委会负责人甲-同意,会计甲-同意,出纳甲-同意,出纳甲-同意,');
GO
INSERT INTO [dbo].[MoneyApplies] ([RecordID], [StaffName], [Department], [Telephone], [Money], [ProjectCode], [Style], [Usage], [PayPlan], [Payee], [PayDate], [ApproveProcess]) VALUES (N'1002', N'臧茜', N'综合管理部', N'13520793233', N'25000', N'AS0000000', N'现金', N'不知道', N'你猜', N'暂无', N'2015-06-05', null);
GO
INSERT INTO [dbo].[MoneyApplies] ([RecordID], [StaffName], [Department], [Telephone], [Money], [ProjectCode], [Style], [Usage], [PayPlan], [Payee], [PayDate], [ApproveProcess]) VALUES (N'1003', N'臧茜', N'综合管理部', N'', N'1000', N'FW0000000', N'现金', N'用于日常', N'以发票报销', N'暂无', N'2015-06-26', null);
GO
SET IDENTITY_INSERT [dbo].[MoneyApplies] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[OfficeSupplies]
-- ----------------------------
DROP TABLE [dbo].[OfficeSupplies]
GO
CREATE TABLE [dbo].[OfficeSupplies] (
[RecordID] int NOT NULL IDENTITY(1,1) ,
[ApplyID] int NOT NULL ,
[Name] nvarchar(50) NOT NULL ,
[Version] nvarchar(20) NOT NULL ,
[Price] float(53) NOT NULL ,
[Counter] int NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[OfficeSupplies]', RESEED, 1008)
GO

-- ----------------------------
-- Records of OfficeSupplies
-- ----------------------------
SET IDENTITY_INSERT [dbo].[OfficeSupplies] ON
GO
INSERT INTO [dbo].[OfficeSupplies] ([RecordID], [ApplyID], [Name], [Version], [Price], [Counter]) VALUES (N'1', N'1', N'月饼', N'1.0', N'2.5', N'4');
GO
INSERT INTO [dbo].[OfficeSupplies] ([RecordID], [ApplyID], [Name], [Version], [Price], [Counter]) VALUES (N'2', N'1', N'花露水', N'2.0', N'5.2', N'2');
GO
INSERT INTO [dbo].[OfficeSupplies] ([RecordID], [ApplyID], [Name], [Version], [Price], [Counter]) VALUES (N'1002', N'2', N'电脑', N'788', N'2300', N'1');
GO
INSERT INTO [dbo].[OfficeSupplies] ([RecordID], [ApplyID], [Name], [Version], [Price], [Counter]) VALUES (N'1003', N'3', N'电脑', N'788', N'2300', N'1');
GO
INSERT INTO [dbo].[OfficeSupplies] ([RecordID], [ApplyID], [Name], [Version], [Price], [Counter]) VALUES (N'1004', N'4', N'电脑', N'788', N'2300', N'1');
GO
INSERT INTO [dbo].[OfficeSupplies] ([RecordID], [ApplyID], [Name], [Version], [Price], [Counter]) VALUES (N'1005', N'5', N'笔记本', N'A', N'2', N'50');
GO
INSERT INTO [dbo].[OfficeSupplies] ([RecordID], [ApplyID], [Name], [Version], [Price], [Counter]) VALUES (N'1006', N'5', N'签字笔', N'B2', N'5', N'10');
GO
INSERT INTO [dbo].[OfficeSupplies] ([RecordID], [ApplyID], [Name], [Version], [Price], [Counter]) VALUES (N'1007', N'9', N'w232', N'2323', N'233', N'2');
GO
INSERT INTO [dbo].[OfficeSupplies] ([RecordID], [ApplyID], [Name], [Version], [Price], [Counter]) VALUES (N'1008', N'9', N'we', N'2ds', N'78', N'2');
GO
SET IDENTITY_INSERT [dbo].[OfficeSupplies] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[OfficeSupplyApplies]
-- ----------------------------
DROP TABLE [dbo].[OfficeSupplyApplies]
GO
CREATE TABLE [dbo].[OfficeSupplyApplies] (
[ApplyID] int NOT NULL IDENTITY(1,1) ,
[StaffName] nvarchar(20) NOT NULL ,
[Department] nvarchar(20) NOT NULL ,
[Money] float(53) NOT NULL ,
[Reason] nvarchar(100) NOT NULL ,
[ApplyDate] date NOT NULL ,
[ApproveProcess] nvarchar(100) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[OfficeSupplyApplies]', RESEED, 9)
GO

-- ----------------------------
-- Records of OfficeSupplyApplies
-- ----------------------------
SET IDENTITY_INSERT [dbo].[OfficeSupplyApplies] ON
GO
INSERT INTO [dbo].[OfficeSupplyApplies] ([ApplyID], [StaffName], [Department], [Money], [Reason], [ApplyDate], [ApproveProcess]) VALUES (N'1', N'员工甲', N'交流合作部', N'0', N'测试', N'2015-04-03', N'项目经理甲-同意,部门经理甲-同意,机构负责人甲-同意,');
GO
INSERT INTO [dbo].[OfficeSupplyApplies] ([ApplyID], [StaffName], [Department], [Money], [Reason], [ApplyDate], [ApproveProcess]) VALUES (N'2', N'臧茜', N'综合管理部', N'0', N'购买茶叶', N'2015-05-06', N'');
GO
INSERT INTO [dbo].[OfficeSupplyApplies] ([ApplyID], [StaffName], [Department], [Money], [Reason], [ApplyDate], [ApproveProcess]) VALUES (N'3', N'臧茜', N'综合管理部', N'0', N'购买茶叶', N'2015-05-06', N'');
GO
INSERT INTO [dbo].[OfficeSupplyApplies] ([ApplyID], [StaffName], [Department], [Money], [Reason], [ApplyDate], [ApproveProcess]) VALUES (N'4', N'臧茜', N'综合管理部', N'0', N'购买茶叶', N'2015-05-06', N'');
GO
INSERT INTO [dbo].[OfficeSupplyApplies] ([ApplyID], [StaffName], [Department], [Money], [Reason], [ApplyDate], [ApproveProcess]) VALUES (N'5', N'吴桂会', N'综合管理部', N'0', N'办公用', N'2015-05-27', N'臧茜-同意,高妍-同意,高妍-同意,');
GO
INSERT INTO [dbo].[OfficeSupplyApplies] ([ApplyID], [StaffName], [Department], [Money], [Reason], [ApplyDate], [ApproveProcess]) VALUES (N'6', N'吴桂会', N'综合管理部', N'0', N'办公用', N'2015-05-27', null);
GO
INSERT INTO [dbo].[OfficeSupplyApplies] ([ApplyID], [StaffName], [Department], [Money], [Reason], [ApplyDate], [ApproveProcess]) VALUES (N'7', N'籍伟丽', N'综合管理部', N'0', N'办公所需', N'2015-05-27', N'臧茜-同意,高妍-同意,高妍-同意,高妍-同意,');
GO
INSERT INTO [dbo].[OfficeSupplyApplies] ([ApplyID], [StaffName], [Department], [Money], [Reason], [ApplyDate], [ApproveProcess]) VALUES (N'8', N'臧茜', N'综合管理部', N'0', N'weon', N'2015-06-06', null);
GO
INSERT INTO [dbo].[OfficeSupplyApplies] ([ApplyID], [StaffName], [Department], [Money], [Reason], [ApplyDate], [ApproveProcess]) VALUES (N'9', N'臧茜', N'综合管理部', N'0', N'wewed', N'2015-06-06', N'');
GO
SET IDENTITY_INSERT [dbo].[OfficeSupplyApplies] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[PayAssigned]
-- ----------------------------
DROP TABLE [dbo].[PayAssigned]
GO
CREATE TABLE [dbo].[PayAssigned] (
[ApplyID] int NOT NULL IDENTITY(1,1) ,
[StaffName] nvarchar(20) NOT NULL ,
[School] nvarchar(50) NOT NULL ,
[ProjectName] nvarchar(50) NOT NULL ,
[Payee] nvarchar(50) NOT NULL ,
[Payed] float(53) NOT NULL ,
[Income] float(53) NOT NULL ,
[Assigned] float(53) NOT NULL ,
[Instrument] nvarchar(20) NOT NULL ,
[Hardware] nvarchar(50) NOT NULL ,
[FundingID] nvarchar(20) NOT NULL ,
[ToUniversity] float(53) NULL ,
[ToUniversityDetail] nvarchar(50) NULL ,
[ToSchool] float(53) NULL ,
[ToSchoolDetail] nvarchar(50) NULL ,
[Fundings] float(53) NULL ,
[FundingsDetail] nvarchar(50) NULL ,
[Welfare] float(53) NULL ,
[WelfareDetail] nvarchar(50) NULL ,
[Management] float(53) NULL ,
[Labor] float(53) NULL ,
[Consult] float(53) NULL ,
[BusinessTax] float(53) NULL ,
[AddedValueTax] float(53) NULL ,
[Note] nvarchar(100) NULL ,
[ApproveProcess] nvarchar(50) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[PayAssigned]', RESEED, 4)
GO

-- ----------------------------
-- Records of PayAssigned
-- ----------------------------
SET IDENTITY_INSERT [dbo].[PayAssigned] ON
GO
INSERT INTO [dbo].[PayAssigned] ([ApplyID], [StaffName], [School], [ProjectName], [Payee], [Payed], [Income], [Assigned], [Instrument], [Hardware], [FundingID], [ToUniversity], [ToUniversityDetail], [ToSchool], [ToSchoolDetail], [Fundings], [FundingsDetail], [Welfare], [WelfareDetail], [Management], [Labor], [Consult], [BusinessTax], [AddedValueTax], [Note], [ApproveProcess]) VALUES (N'1', N'出纳甲', N'地球与空间科学学院', N'项目一', N'你猜', N'300000', N'200000', N'100000', N'范文网 ', N'23 23', N'问我23', N'0.12', null, N'0.08', null, N'0.01', null, N'0', null, null, null, null, null, null, N'we', null);
GO
INSERT INTO [dbo].[PayAssigned] ([ApplyID], [StaffName], [School], [ProjectName], [Payee], [Payed], [Income], [Assigned], [Instrument], [Hardware], [FundingID], [ToUniversity], [ToUniversityDetail], [ToSchool], [ToSchoolDetail], [Fundings], [FundingsDetail], [Welfare], [WelfareDetail], [Management], [Labor], [Consult], [BusinessTax], [AddedValueTax], [Note], [ApproveProcess]) VALUES (N'2', N'项目经理甲', N'地球与空间科学学院', N'项目一', N'we', N'3000', N'2000', N'1000', N'0', N'0', N'9455324234', N'300', N'2342354354332', N'223', N'232323', N'23423', N'2323', N'3232', N'23423', null, null, null, null, null, N'测试', N'财务主管甲-同意,机构负责人甲-同意,管委会负责人甲-同意,');
GO
INSERT INTO [dbo].[PayAssigned] ([ApplyID], [StaffName], [School], [ProjectName], [Payee], [Payed], [Income], [Assigned], [Instrument], [Hardware], [FundingID], [ToUniversity], [ToUniversityDetail], [ToSchool], [ToSchoolDetail], [Fundings], [FundingsDetail], [Welfare], [WelfareDetail], [Management], [Labor], [Consult], [BusinessTax], [AddedValueTax], [Note], [ApproveProcess]) VALUES (N'3', N'员工丙', N'地球与空间科学学院', N'项目一', N'饿3', N'23', N'232', N'33', N'565', N'676', N'8767', N'0', N'', N'0', N'', N'0', N'', N'0', N'', N'232', N'232', N'232', N'232', N'222222333', N'23 范围', N'财务主管甲-同意,机构负责人甲-不同意,');
GO
INSERT INTO [dbo].[PayAssigned] ([ApplyID], [StaffName], [School], [ProjectName], [Payee], [Payed], [Income], [Assigned], [Instrument], [Hardware], [FundingID], [ToUniversity], [ToUniversityDetail], [ToSchool], [ToSchoolDetail], [Fundings], [FundingsDetail], [Welfare], [WelfareDetail], [Management], [Labor], [Consult], [BusinessTax], [AddedValueTax], [Note], [ApproveProcess]) VALUES (N'4', N'会计甲', N'地球与空间科学学院', N'项目一', N'2323', N'2323', N'323', N'323', N'2323', N'33', N'55', N'5345', N'34353452352345', N'4334', N'353453346455476', N'344', N'8675665789678', N'344', N'8556', null, null, null, null, null, N'测试一下', N'财务主管甲-同意,机构负责人甲-不同意我就不同意了,');
GO
SET IDENTITY_INSERT [dbo].[PayAssigned] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[PerformanceWeekly]
-- ----------------------------
DROP TABLE [dbo].[PerformanceWeekly]
GO
CREATE TABLE [dbo].[PerformanceWeekly] (
[RecordID] int NOT NULL IDENTITY(1,1) ,
[StaffName] nvarchar(20) NOT NULL ,
[Department] nvarchar(20) NOT NULL ,
[Year] int NOT NULL ,
[Month] int NOT NULL ,
[Week1] float(53) NULL ,
[Week2] float(53) NULL ,
[Week3] float(53) NULL ,
[Week4] float(53) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[PerformanceWeekly]', RESEED, 23)
GO

-- ----------------------------
-- Records of PerformanceWeekly
-- ----------------------------
SET IDENTITY_INSERT [dbo].[PerformanceWeekly] ON
GO
INSERT INTO [dbo].[PerformanceWeekly] ([RecordID], [StaffName], [Department], [Year], [Month], [Week1], [Week2], [Week3], [Week4]) VALUES (N'1', N'员工甲', N'交流合作部', N'2015', N'4', N'95', N'98', N'97', N'99');
GO
INSERT INTO [dbo].[PerformanceWeekly] ([RecordID], [StaffName], [Department], [Year], [Month], [Week1], [Week2], [Week3], [Week4]) VALUES (N'2', N'员工乙', N'研究开发部', N'2015', N'4', N'98', N'80', N'75', N'93');
GO
INSERT INTO [dbo].[PerformanceWeekly] ([RecordID], [StaffName], [Department], [Year], [Month], [Week1], [Week2], [Week3], [Week4]) VALUES (N'3', N'员工丙', N'战略规划部', N'2015', N'4', N'93', N'92', N'91', N'97');
GO
INSERT INTO [dbo].[PerformanceWeekly] ([RecordID], [StaffName], [Department], [Year], [Month], [Week1], [Week2], [Week3], [Week4]) VALUES (N'4', N'员工甲', N'交流合作部', N'2015', N'5', N'75', N'92', N'93', N'94');
GO
INSERT INTO [dbo].[PerformanceWeekly] ([RecordID], [StaffName], [Department], [Year], [Month], [Week1], [Week2], [Week3], [Week4]) VALUES (N'5', N'员工乙', N'研究开发部', N'2015', N'5', N'92', N'93', N'95', N'97');
GO
INSERT INTO [dbo].[PerformanceWeekly] ([RecordID], [StaffName], [Department], [Year], [Month], [Week1], [Week2], [Week3], [Week4]) VALUES (N'6', N'员工丙', N'战略规划部', N'2015', N'5', N'95', N'96', N'97', N'97');
GO
INSERT INTO [dbo].[PerformanceWeekly] ([RecordID], [StaffName], [Department], [Year], [Month], [Week1], [Week2], [Week3], [Week4]) VALUES (N'7', N'员工甲', N'交流合作部', N'2012', N'5', N'99', N'98', N'96', N'90');
GO
INSERT INTO [dbo].[PerformanceWeekly] ([RecordID], [StaffName], [Department], [Year], [Month], [Week1], [Week2], [Week3], [Week4]) VALUES (N'8', N'员工丙', N'战略规划部', N'2012', N'5', N'98', N'99', N'90', N'92');
GO
INSERT INTO [dbo].[PerformanceWeekly] ([RecordID], [StaffName], [Department], [Year], [Month], [Week1], [Week2], [Week3], [Week4]) VALUES (N'9', N'吴桂会', N'综合管理部', N'2015', N'4', N'95', N'95', N'95', N'95');
GO
INSERT INTO [dbo].[PerformanceWeekly] ([RecordID], [StaffName], [Department], [Year], [Month], [Week1], [Week2], [Week3], [Week4]) VALUES (N'10', N'吴桂会', N'综合管理部', N'2015', N'4', N'95', N'95', N'95', N'95');
GO
INSERT INTO [dbo].[PerformanceWeekly] ([RecordID], [StaffName], [Department], [Year], [Month], [Week1], [Week2], [Week3], [Week4]) VALUES (N'11', N'吴桂会', N'综合管理部', N'2015', N'4', N'95', N'95', N'95', N'95');
GO
INSERT INTO [dbo].[PerformanceWeekly] ([RecordID], [StaffName], [Department], [Year], [Month], [Week1], [Week2], [Week3], [Week4]) VALUES (N'12', N'吴桂会', N'综合管理部', N'2015', N'4', N'95', N'95', N'95', N'95');
GO
INSERT INTO [dbo].[PerformanceWeekly] ([RecordID], [StaffName], [Department], [Year], [Month], [Week1], [Week2], [Week3], [Week4]) VALUES (N'13', N'吴桂会', N'业务发展部', N'2015', N'4', N'95', N'95', N'95', N'95');
GO
INSERT INTO [dbo].[PerformanceWeekly] ([RecordID], [StaffName], [Department], [Year], [Month], [Week1], [Week2], [Week3], [Week4]) VALUES (N'14', N'吴桂会', N'业务发展部', N'2015', N'5', N'95', N'95', N'95', N'95');
GO
INSERT INTO [dbo].[PerformanceWeekly] ([RecordID], [StaffName], [Department], [Year], [Month], [Week1], [Week2], [Week3], [Week4]) VALUES (N'15', N'吴桂会', N'业务发展部', N'2015', N'5', N'95', N'96', N'94', N'96');
GO
INSERT INTO [dbo].[PerformanceWeekly] ([RecordID], [StaffName], [Department], [Year], [Month], [Week1], [Week2], [Week3], [Week4]) VALUES (N'16', N'吴会', N'综合管理部', N'2015', N'6', N'98', N'98', N'98', N'98');
GO
INSERT INTO [dbo].[PerformanceWeekly] ([RecordID], [StaffName], [Department], [Year], [Month], [Week1], [Week2], [Week3], [Week4]) VALUES (N'17', N'吴桂会', N'综合管理部', N'2015', N'6', N'98', N'98', N'98', N'98');
GO
INSERT INTO [dbo].[PerformanceWeekly] ([RecordID], [StaffName], [Department], [Year], [Month], [Week1], [Week2], [Week3], [Week4]) VALUES (N'18', N'鸡为例', N'业务发展部', N'2015', N'6', N'67', N'67', N'67', N'67');
GO
INSERT INTO [dbo].[PerformanceWeekly] ([RecordID], [StaffName], [Department], [Year], [Month], [Week1], [Week2], [Week3], [Week4]) VALUES (N'19', N'员工甲', N'业务发展部', N'2015', N'2', N'85', N'90', N'92', N'95');
GO
INSERT INTO [dbo].[PerformanceWeekly] ([RecordID], [StaffName], [Department], [Year], [Month], [Week1], [Week2], [Week3], [Week4]) VALUES (N'20', N'员工乙', N'数字减灾与智慧应急工程部', N'2015', N'2', N'99', N'98', N'96', N'94');
GO
INSERT INTO [dbo].[PerformanceWeekly] ([RecordID], [StaffName], [Department], [Year], [Month], [Week1], [Week2], [Week3], [Week4]) VALUES (N'21', N'甲', N'业务发展部', N'2015', N'8', N'88', N'89', N'90', N'91');
GO
INSERT INTO [dbo].[PerformanceWeekly] ([RecordID], [StaffName], [Department], [Year], [Month], [Week1], [Week2], [Week3], [Week4]) VALUES (N'22', N'乙', N'业务发展部', N'2015', N'8', N'98', N'99', N'98', N'97');
GO
INSERT INTO [dbo].[PerformanceWeekly] ([RecordID], [StaffName], [Department], [Year], [Month], [Week1], [Week2], [Week3], [Week4]) VALUES (N'23', N'臧茜', N'综合管理部', N'2015', N'7', N'98', N'98', N'98', N'98');
GO
SET IDENTITY_INSERT [dbo].[PerformanceWeekly] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[PositionTarget]
-- ----------------------------
DROP TABLE [dbo].[PositionTarget]
GO
CREATE TABLE [dbo].[PositionTarget] (
[RecordID] int NOT NULL IDENTITY(1,1) ,
[StaffName] nvarchar(20) NOT NULL ,
[Position] nvarchar(20) NOT NULL ,
[Department] nvarchar(30) NOT NULL ,
[FormerPosition] nvarchar(20) NULL ,
[Leader] nvarchar(20) NULL ,
[Year] int NULL ,
[NewPosition] nvarchar(20) NULL ,
[Duty] ntext NOT NULL ,
[Target] ntext NOT NULL ,
[MonthlyIncome] nvarchar(50) NULL ,
[SalaryLevel] nvarchar(20) NULL ,
[ApproveProcess] nvarchar(100) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[PositionTarget]', RESEED, 5)
GO

-- ----------------------------
-- Records of PositionTarget
-- ----------------------------
SET IDENTITY_INSERT [dbo].[PositionTarget] ON
GO
INSERT INTO [dbo].[PositionTarget] ([RecordID], [StaffName], [Position], [Department], [FormerPosition], [Leader], [Year], [NewPosition], [Duty], [Target], [MonthlyIncome], [SalaryLevel], [ApproveProcess]) VALUES (N'1', N'员工甲', N'员工', N'交流合作部', N'员工', N'财务主管甲', N'0', N'员工', N'1．	负责按照总师办“北大数研‘高端资源?智力资源’整合、协同创新与集成转化管理服务职责，制定部门年度工作计划、重点任务、收支预决算，并按工作计划组织实施。
2．负责组织部门全体员工，切实完成公司批准的本部门年度工作任务和经营指标。
3．审定本部门员工年度工作计划和各阶段（周/月/季度）工作计划，并敦促实施和组织考评。
4．审定本部门全体成员《岗位目标责任书》。
5．按照北大数研的绩效考核制度规定，组织本部门的项目、季度及年度工作考核及绩效考核，并配合综合管理部进行考核实施。
6．切实落实北大数研管理制度与绩效考核办法的有关规定，并积极参与管理体系的建设优化。
7．注重本部门任务执行力和团队综合业务能力的建设，并有效协调本部门与北大数研其他机构、部门的协作关系。
8．负责为对口联系机构提供“智慧”服务。
', N'．创建并不断优化北大数研“高端资源?智力资源”整合、协同创新与集成转化管理服务体系，以及北大数研智库平台。
2．针对2015年国家和地方科技产业规划，组织3-5次重大政策解析专题会，组织撰写3-5个政策建议报告，逐步形成北大数研高端咨询品牌产品评审。
3．针对公司重大业务部署，组织8-10次专题会(专刊、白皮书、专题报告、方案库)，建立完善领域总师项目指导机制。
4．配合项目运营部创建“北大数研科技成果资源库”，编制“北大数研高端资源整合与成果转化实施办法”并组织实施。
5．为对口联系机构提供“智慧”服务：数研交通集团、信息社会治理创新研究中心。
', N'1,2,3,4,5,6,7,8,9,10,11,12', N'你猜', N'');
GO
INSERT INTO [dbo].[PositionTarget] ([RecordID], [StaffName], [Position], [Department], [FormerPosition], [Leader], [Year], [NewPosition], [Duty], [Target], [MonthlyIncome], [SalaryLevel], [ApproveProcess]) VALUES (N'2', N'员工丙', N'员工', N'战略规划部', N'员工', N'财务主管', N'0', N'员工', N'1．	负责按照总师办“北大数研‘高端资源?智力资源’整合、协同创新与集成转化管理服务职责，制定部门年度工作计划、重点任务、收支预决算，并按工作计划组织实施。
2．负责组织部门全体员工，切实完成公司批准的本部门年度工作任务和经营指标。
3．审定本部门员工年度工作计划和各阶段（周/月/季度）工作计划，并敦促实施和组织考评。
4．审定本部门全体成员《岗位目标责任书》。
5．按照北大数研的绩效考核制度规定，组织本部门的项目、季度及年度工作考核及绩效考核，并配合综合管理部进行考核实施。
6．切实落实北大数研管理制度与绩效考核办法的有关规定，并积极参与管理体系的建设优化。
7．注重本部门任务执行力和团队综合业务能力的建设，并有效协调本部门与北大数研其他机构、部门的协作关系。
8．负责为对口联系机构提供“智慧”服务。
', N'．创建并不断优化北大数研“高端资源?智力资源”整合、协同创新与集成转化管理服务体系，以及北大数研智库平台。
2．针对2015年国家和地方科技产业规划，组织3-5次重大政策解析专题会，组织撰写3-5个政策建议报告，逐步形成北大数研高端咨询品牌产品评审。
3．针对公司重大业务部署，组织8-10次专题会(专刊、白皮书、专题报告、方案库)，建立完善领域总师项目指导机制。
4．配合项目运营部创建“北大数研科技成果资源库”，编制“北大数研高端资源整合与成果转化实施办法”并组织实施。
5．为对口联系机构提供“智慧”服务：数研交通集团、信息社会治理创新研究中心。
', N'1,2,3,4,5,6,7,8,9,10,11,12', N'你猜不猜', N'');
GO
INSERT INTO [dbo].[PositionTarget] ([RecordID], [StaffName], [Position], [Department], [FormerPosition], [Leader], [Year], [NewPosition], [Duty], [Target], [MonthlyIncome], [SalaryLevel], [ApproveProcess]) VALUES (N'3', N'员工丙', N'员工', N'战略规划部', N'员工', N'财务主管', N'0', N'员工', N'1．	负责按照总师办“北大数研‘高端资源?智力资源’整合、协同创新与集成转化管理服务职责，制定部门年度工作计划、重点任务、收支预决算，并按工作计划组织实施。
2．负责组织部门全体员工，切实完成公司批准的本部门年度工作任务和经营指标。
3．审定本部门员工年度工作计划和各阶段（周/月/季度）工作计划，并敦促实施和组织考评。
4．审定本部门全体成员《岗位目标责任书》。
5．按照北大数研的绩效考核制度规定，组织本部门的项目、季度及年度工作考核及绩效考核，并配合综合管理部进行考核实施。
6．切实落实北大数研管理制度与绩效考核办法的有关规定，并积极参与管理体系的建设优化。
7．注重本部门任务执行力和团队综合业务能力的建设，并有效协调本部门与北大数研其他机构、部门的协作关系。
8．负责为对口联系机构提供“智慧”服务。
', N'1．	负责按照总师办“北大数研‘高端资源?智力资源’整合、协同创新与集成转化管理服务职责，制定部门年度工作计划、重点任务、收支预决算，并按工作计划组织实施。
2．负责组织部门全体员工，切实完成公司批准的本部门年度工作任务和经营指标。
3．审定本部门员工年度工作计划和各阶段（周/月/季度）工作计划，并敦促实施和组织考评。
4．审定本部门全体成员《岗位目标责任书》。
5．按照北大数研的绩效考核制度规定，组织本部门的项目、季度及年度工作考核及绩效考核，并配合综合管理部进行考核实施。
6．切实落实北大数研管理制度与绩效考核办法的有关规定，并积极参与管理体系的建设优化。
7．注重本部门任务执行力和团队综合业务能力的建设，并有效协调本部门与北大数研其他机构、部门的协作关系。
8．负责为对口联系机构提供“智慧”服务。
', N'1,2,3,4,5,6,7,8,9,10,11,12', N'不猜', N'');
GO
INSERT INTO [dbo].[PositionTarget] ([RecordID], [StaffName], [Position], [Department], [FormerPosition], [Leader], [Year], [NewPosition], [Duty], [Target], [MonthlyIncome], [SalaryLevel], [ApproveProcess]) VALUES (N'4', N'员工丙', N'员工', N'战略规划部', N'员工', N'财务主管甲', N'2015', N'员工', N'1．	负责按照总师办“北大数研‘高端资源?智力资源’整合、协同创新与集成转化管理服务职责，制定部门年度工作计划、重点任务、收支预决算，并按工作计划组织实施。
2．负责组织部门全体员工，切实完成公司批准的本部门年度工作任务和经营指标。
3．审定本部门员工年度工作计划和各阶段（周/月/季度）工作计划，并敦促实施和组织考评。
4．审定本部门全体成员《岗位目标责任书》。
5．按照北大数研的绩效考核制度规定，组织本部门的项目、季度及年度工作考核及绩效考核，并配合综合管理部进行考核实施。
6．切实落实北大数研管理制度与绩效考核办法的有关规定，并积极参与管理体系的建设优化。
7．注重本部门任务执行力和团队综合业务能力的建设，并有效协调本部门与北大数研其他机构、部门的协作关系。
8．负责为对口联系机构提供“智慧”服务。
', N'1．创建并不断优化北大数研“高端资源?智力资源”整合、协同创新与集成转化管理服务体系，以及北大数研智库平台。
2．针对2015年国家和地方科技产业规划，组织3-5次重大政策解析专题会，组织撰写3-5个政策建议报告，逐步形成北大数研高端咨询品牌产品评审。
3．针对公司重大业务部署，组织8-10次专题会(专刊、白皮书、专题报告、方案库)，建立完善领域总师项目指导机制。
4．配合项目运营部创建“北大数研科技成果资源库”，编制“北大数研高端资源整合与成果转化实施办法”并组织实施。
5．为对口联系机构提供“智慧”服务：数研交通集团、信息社会治理创新研究中心。
', N'1,2,3,4,5,6,7,8,9,10,11,12', N'不知道', N'高妍-同意,高妍-同意,');
GO
INSERT INTO [dbo].[PositionTarget] ([RecordID], [StaffName], [Position], [Department], [FormerPosition], [Leader], [Year], [NewPosition], [Duty], [Target], [MonthlyIncome], [SalaryLevel], [ApproveProcess]) VALUES (N'5', N'臧茜', N'财务主管', N'综合管理部', N'we', N'员工甲', N'2015', N'we', N'无法无法嗡嗡嗡绯闻绯闻绯闻绯闻绯闻无法无法嗡嗡嗡绯闻绯闻绯闻绯闻绯闻无法无法嗡嗡嗡绯闻绯闻绯闻绯闻绯闻无法无法嗡嗡嗡绯闻绯闻绯闻绯闻绯闻无法无法嗡嗡嗡绯闻绯闻绯闻绯闻绯闻无法无法嗡嗡嗡绯闻绯闻绯闻绯闻绯闻', N'蜂王浆饿哦建瓯问我蜂王浆饿哦建瓯问我蜂王浆饿哦建瓯问我蜂王浆饿哦建瓯问我蜂王浆饿哦建瓯问我蜂王浆饿哦建瓯问我蜂王浆饿哦建瓯问我蜂王浆饿哦建瓯问我蜂王浆饿哦建瓯问我蜂王浆饿哦建瓯问我', N'3,2,5,9,9,3,4,5,8,6,9,3', N'A3', N'');
GO
SET IDENTITY_INSERT [dbo].[PositionTarget] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[Projects]
-- ----------------------------
DROP TABLE [dbo].[Projects]
GO
CREATE TABLE [dbo].[Projects] (
[ProjectID] int NOT NULL IDENTITY(1,1) ,
[ProjectCode] nvarchar(50) NOT NULL ,
[ProjectName] nvarchar(50) NOT NULL ,
[ProjectAccount] nvarchar(50) NOT NULL ,
[Manager] nvarchar(50) NOT NULL ,
[Members] nvarchar(200) NOT NULL ,
[Budget] int NOT NULL ,
[Collected] int NOT NULL ,
[ApplyDate] date NOT NULL ,
[Remark] nvarchar(200) NULL ,
[Status] bit NOT NULL ,
[Department] nvarchar(50) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[Projects]', RESEED, 45)
GO

-- ----------------------------
-- Records of Projects
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Projects] ON
GO
INSERT INTO [dbo].[Projects] ([ProjectID], [ProjectCode], [ProjectName], [ProjectAccount], [Manager], [Members], [Budget], [Collected], [ApplyDate], [Remark], [Status], [Department]) VALUES (N'26', N'AS0000000', N'奥赛中心费用', N'AS0000000', N'刘晶', N'暂无', N'10000', N'10000', N'2015-05-05', N'暂无', N'0', N'奥赛中心');
GO
INSERT INTO [dbo].[Projects] ([ProjectID], [ProjectCode], [ProjectName], [ProjectAccount], [Manager], [Members], [Budget], [Collected], [ApplyDate], [Remark], [Status], [Department]) VALUES (N'22', N'BBD14PU001', N'智慧大鹏新区总体规划编制项目', N'432402-028', N'许琳', N'暂无', N'10000', N'10000', N'2015-05-05', N'暂无', N'0', N'业务发展部');
GO
INSERT INTO [dbo].[Projects] ([ProjectID], [ProjectCode], [ProjectName], [ProjectAccount], [Manager], [Members], [Budget], [Collected], [ApplyDate], [Remark], [Status], [Department]) VALUES (N'23', N'BBD14PU002', N'智慧莱州建设规划编制项目', N'432402-028', N'许琳', N'暂无', N'10000', N'10000', N'2015-05-05', N'暂无', N'0', N'业务发展部');
GO
INSERT INTO [dbo].[Projects] ([ProjectID], [ProjectCode], [ProjectName], [ProjectAccount], [Manager], [Members], [Budget], [Collected], [ApplyDate], [Remark], [Status], [Department]) VALUES (N'25', N'BBD15PU002', N'都江堰灌区重要水源地水质水体监测自动化系统“水质水体监测”应急管理平台', N'FW0000000', N'许琳', N'暂无', N'10000', N'10000', N'2015-05-05', N'暂无', N'0', N'业务发展部');
GO
INSERT INTO [dbo].[Projects] ([ProjectID], [ProjectCode], [ProjectName], [ProjectAccount], [Manager], [Members], [Budget], [Collected], [ApplyDate], [Remark], [Status], [Department]) VALUES (N'30', N'BET15PU001', N'CSNC2013/BD-CASTIC2015（第六届北斗杯）(新增）', N'缺失', N'丘扬', N'暂无', N'10000', N'10000', N'2015-05-05', N'暂无', N'0', N'教育培训部');
GO
INSERT INTO [dbo].[Projects] ([ProjectID], [ProjectCode], [ProjectName], [ProjectAccount], [Manager], [Members], [Budget], [Collected], [ApplyDate], [Remark], [Status], [Department]) VALUES (N'34', N'FDR14PU001', N'武警警种学院ERSIS项目', N'缺失', N'杨凯欣', N'暂无', N'10000', N'10000', N'2015-05-05', N'暂无', N'0', N'数字减灾与智慧应急工程部');
GO
INSERT INTO [dbo].[Projects] ([ProjectID], [ProjectCode], [ProjectName], [ProjectAccount], [Manager], [Members], [Budget], [Collected], [ApplyDate], [Remark], [Status], [Department]) VALUES (N'13', N'FSW11PU001', N'“数字常德”总体规划', N'432402-028', N'许琳', N'暂无', N'10000', N'10000', N'2015-05-05', N'暂无', N'0', N'业务发展部');
GO
INSERT INTO [dbo].[Projects] ([ProjectID], [ProjectCode], [ProjectName], [ProjectAccount], [Manager], [Members], [Budget], [Collected], [ApplyDate], [Remark], [Status], [Department]) VALUES (N'19', N'FSW13FW001', N'广东省第一次全国水利普查数据库与管理系统建设项目', N'432402-028', N'许琳', N'暂无', N'10000', N'10000', N'2015-05-05', N'暂无', N'0', N'业务发展部');
GO
INSERT INTO [dbo].[Projects] ([ProjectID], [ProjectCode], [ProjectName], [ProjectAccount], [Manager], [Members], [Budget], [Collected], [ApplyDate], [Remark], [Status], [Department]) VALUES (N'21', N'FSW13FW007', N'实景测量数据与地震救援系统集成的模块研发项目', N'432402-028', N'许琳', N'暂无', N'10000', N'10000', N'2015-05-05', N'暂无', N'0', N'业务发展部');
GO
INSERT INTO [dbo].[Projects] ([ProjectID], [ProjectCode], [ProjectName], [ProjectAccount], [Manager], [Members], [Budget], [Collected], [ApplyDate], [Remark], [Status], [Department]) VALUES (N'18', N'FSW13PU004', N'智慧长阳总体规划', N'432402-028', N'许琳', N'暂无', N'10000', N'10000', N'2015-05-05', N'暂无', N'0', N'业务发展部');
GO
INSERT INTO [dbo].[Projects] ([ProjectID], [ProjectCode], [ProjectName], [ProjectAccount], [Manager], [Members], [Budget], [Collected], [ApplyDate], [Remark], [Status], [Department]) VALUES (N'11', N'FSW13PU005', N'智慧长阳三年咨询服务', N'432402-028', N'许琳', N'暂无', N'10000', N'10000', N'2015-05-05', N'暂无', N'0', N'业务发展部');
GO
INSERT INTO [dbo].[Projects] ([ProjectID], [ProjectCode], [ProjectName], [ProjectAccount], [Manager], [Members], [Budget], [Collected], [ApplyDate], [Remark], [Status], [Department]) VALUES (N'20', N'FSW13PU006', N'广东省第一次全国水利普查数据库与管理系统建设项目', N'432402-028', N'许琳', N'暂无', N'10000', N'10000', N'2015-05-05', N'暂无', N'0', N'业务发展部');
GO
INSERT INTO [dbo].[Projects] ([ProjectID], [ProjectCode], [ProjectName], [ProjectAccount], [Manager], [Members], [Budget], [Collected], [ApplyDate], [Remark], [Status], [Department]) VALUES (N'14', N'FSW14PU001', N'基于国产卫星应用技术的三峡库区生态环境动态监测与应急服务示范（发改委项目）', N'FW0000000', N'许琳', N'暂无', N'10000', N'10000', N'2015-05-05', N'暂无', N'0', N'业务发展部');
GO
INSERT INTO [dbo].[Projects] ([ProjectID], [ProjectCode], [ProjectName], [ProjectAccount], [Manager], [Members], [Budget], [Collected], [ApplyDate], [Remark], [Status], [Department]) VALUES (N'15', N'FSW14PU003', N'天基遥感影像数据加工处理 （北师大）', N'432402-028', N'许琳', N'暂无', N'10000', N'10000', N'2015-05-05', N'暂无', N'0', N'业务发展部');
GO
INSERT INTO [dbo].[Projects] ([ProjectID], [ProjectCode], [ProjectName], [ProjectAccount], [Manager], [Members], [Budget], [Collected], [ApplyDate], [Remark], [Status], [Department]) VALUES (N'40', N'FSW14PU004', N'三峡综合应用与决策支持系统编制项目/三峡综合应用与会商决策支持系统咨询规划项目', N'432402-028', N'田晓猛', N'暂无', N'10000', N'10000', N'2015-05-05', N'暂无', N'0', N'数字流域与智慧城镇工程部');
GO
INSERT INTO [dbo].[Projects] ([ProjectID], [ProjectCode], [ProjectName], [ProjectAccount], [Manager], [Members], [Budget], [Collected], [ApplyDate], [Remark], [Status], [Department]) VALUES (N'7', N'FSW20140302', N'“基于网格化的村镇社区服务支撑平台技术研究”国家支撑计划村镇建设领域2015年（重庆声光电)', N'FW0000000', N'许琳', N'暂无', N'10000', N'10000', N'2015-05-05', N'暂无', N'0', N'业务发展部');
GO
INSERT INTO [dbo].[Projects] ([ProjectID], [ProjectCode], [ProjectName], [ProjectAccount], [Manager], [Members], [Budget], [Collected], [ApplyDate], [Remark], [Status], [Department]) VALUES (N'41', N'FW0000000', N'京元数研费用', N'FW0000000', N'臧茜', N'暂无', N'10000', N'10000', N'2015-05-05', N'暂无', N'0', N'综合管理部');
GO
INSERT INTO [dbo].[Projects] ([ProjectID], [ProjectCode], [ProjectName], [ProjectAccount], [Manager], [Members], [Budget], [Collected], [ApplyDate], [Remark], [Status], [Department]) VALUES (N'35', N'GC05PU001', N'卫星导航应用论证平台', N'5171502(001-004)', N'杨凯欣', N'暂无', N'10000', N'10000', N'2015-05-05', N'暂无', N'0', N'数字减灾与智慧应急工程部');
GO
INSERT INTO [dbo].[Projects] ([ProjectID], [ProjectCode], [ProjectName], [ProjectAccount], [Manager], [Members], [Budget], [Collected], [ApplyDate], [Remark], [Status], [Department]) VALUES (N'8', N'GC11FW001', N'地震灾情速报系统项目（一期）', N'FW0000000', N'许琳', N'暂无', N'10000', N'10000', N'2015-05-05', N'暂无', N'0', N'业务发展部');
GO
INSERT INTO [dbo].[Projects] ([ProjectID], [ProjectCode], [ProjectName], [ProjectAccount], [Manager], [Members], [Budget], [Collected], [ApplyDate], [Remark], [Status], [Department]) VALUES (N'9', N'GC11FW002', N'地震灾情速报值守系统项目（二期）', N'FW0000000', N'许琳', N'暂无', N'10000', N'10000', N'2015-05-05', N'暂无', N'0', N'业务发展部');
GO
INSERT INTO [dbo].[Projects] ([ProjectID], [ProjectCode], [ProjectName], [ProjectAccount], [Manager], [Members], [Budget], [Collected], [ApplyDate], [Remark], [Status], [Department]) VALUES (N'36', N'GSE0000000', N'京元智慧应急费用', N'GSE0000000', N'杨凯欣', N'暂无', N'10000', N'10000', N'2015-05-05', N'暂无', N'0', N'数字减灾与智慧应急工程部');
GO
INSERT INTO [dbo].[Projects] ([ProjectID], [ProjectCode], [ProjectName], [ProjectAccount], [Manager], [Members], [Budget], [Collected], [ApplyDate], [Remark], [Status], [Department]) VALUES (N'44', N'IDC0000000', N'北大数研费用', N'IDC0000000', N'臧茜', N'暂无', N'10000', N'10000', N'2015-05-05', N'暂无', N'0', N'综合管理部');
GO
INSERT INTO [dbo].[Projects] ([ProjectID], [ProjectCode], [ProjectName], [ProjectAccount], [Manager], [Members], [Budget], [Collected], [ApplyDate], [Remark], [Status], [Department]) VALUES (N'43', N'IDC-GF', N'IDC办公室', N'432402-028', N'臧茜', N'暂无', N'10000', N'10000', N'2015-05-05', N'暂无', N'0', N'综合管理部');
GO
INSERT INTO [dbo].[Projects] ([ProjectID], [ProjectCode], [ProjectName], [ProjectAccount], [Manager], [Members], [Budget], [Collected], [ApplyDate], [Remark], [Status], [Department]) VALUES (N'29', N'JP13PU001', N'CSNC2013/BD-CASTIC2013（第四届北斗杯）', N'413-170-029', N'丘扬', N'暂无', N'10000', N'10000', N'2015-05-05', N'暂无', N'0', N'教育培训部');
GO
INSERT INTO [dbo].[Projects] ([ProjectID], [ProjectCode], [ProjectName], [ProjectAccount], [Manager], [Members], [Budget], [Collected], [ApplyDate], [Remark], [Status], [Department]) VALUES (N'27', N'JP14PU002', N'CSNC2014/BD-CASTIC2014（第五届北斗杯）', N'413-170-030', N'丘扬', N'暂无', N'10000', N'10000', N'2015-05-05', N'暂无', N'0', N'教育培训部');
GO
INSERT INTO [dbo].[Projects] ([ProjectID], [ProjectCode], [ProjectName], [ProjectAccount], [Manager], [Members], [Budget], [Collected], [ApplyDate], [Remark], [Status], [Department]) VALUES (N'32', N'YF10PU002', N'智能导航搜救终端及其区域应用示范系统（九寨沟项目）', N'452-10126-017', N'李伟', N'暂无', N'10000', N'10000', N'2015-05-05', N'暂无', N'0', N'数字减灾与智慧应急工程部');
GO
INSERT INTO [dbo].[Projects] ([ProjectID], [ProjectCode], [ProjectName], [ProjectAccount], [Manager], [Members], [Budget], [Collected], [ApplyDate], [Remark], [Status], [Department]) VALUES (N'37', N'YF10PU003', N'中科院', N'452-10176-005', N'肖汉', N'暂无', N'10000', N'10000', N'2015-05-05', N'暂无', N'0', N'数字流域与智慧城镇工程部');
GO
INSERT INTO [dbo].[Projects] ([ProjectID], [ProjectCode], [ProjectName], [ProjectAccount], [Manager], [Members], [Budget], [Collected], [ApplyDate], [Remark], [Status], [Department]) VALUES (N'31', N'YF11PU001', N'N+EOS项目(503所)', N'452-10176-010', N'李伟', N'暂无', N'10000', N'10000', N'2015-05-05', N'暂无', N'0', N'数字减灾与智慧应急工程部');
GO
INSERT INTO [dbo].[Projects] ([ProjectID], [ProjectCode], [ProjectName], [ProjectAccount], [Manager], [Members], [Budget], [Collected], [ApplyDate], [Remark], [Status], [Department]) VALUES (N'38', N'YF13PU001', N'国家自然基金项目（水经柱）', N'缺失', N'彭学峰', N'暂无', N'10000', N'10000', N'2015-05-05', N'暂无', N'0', N'数字流域与智慧城镇工程部');
GO
INSERT INTO [dbo].[Projects] ([ProjectID], [ProjectCode], [ProjectName], [ProjectAccount], [Manager], [Members], [Budget], [Collected], [ApplyDate], [Remark], [Status], [Department]) VALUES (N'33', N'YF13PU005', N'APSCO基于/APSCO', N'432402-028', N'李怀瑜', N'暂无', N'10000', N'10000', N'2015-05-05', N'暂无', N'0', N'数字减灾与智慧应急工程部');
GO
INSERT INTO [dbo].[Projects] ([ProjectID], [ProjectCode], [ProjectName], [ProjectAccount], [Manager], [Members], [Budget], [Collected], [ApplyDate], [Remark], [Status], [Department]) VALUES (N'39', N'YF13PU007', N'N+EOS土壤水+海洋', N'452-10176-011', N'肖汉', N'暂无', N'10000', N'10000', N'2015-05-05', N'暂无', N'0', N'数字流域与智慧城镇工程部');
GO
INSERT INTO [dbo].[Projects] ([ProjectID], [ProjectCode], [ProjectName], [ProjectAccount], [Manager], [Members], [Budget], [Collected], [ApplyDate], [Remark], [Status], [Department]) VALUES (N'16', N'YW08PU001', N'数字潍坊规划费', N'432402-028', N'许琳', N'暂无', N'10000', N'10000', N'2015-05-05', N'暂无', N'0', N'业务发展部');
GO
INSERT INTO [dbo].[Projects] ([ProjectID], [ProjectCode], [ProjectName], [ProjectAccount], [Manager], [Members], [Budget], [Collected], [ApplyDate], [Remark], [Status], [Department]) VALUES (N'24', N'YW11PU002', N'唐山电子政务顶层设计编制项目', N'432402-028', N'许琳', N'暂无', N'10000', N'10000', N'2015-05-05', N'暂无', N'0', N'业务发展部');
GO
INSERT INTO [dbo].[Projects] ([ProjectID], [ProjectCode], [ProjectName], [ProjectAccount], [Manager], [Members], [Budget], [Collected], [ApplyDate], [Remark], [Status], [Department]) VALUES (N'10', N'YW13PU001', N'数字大沽河', N'FW0000000', N'许琳', N'暂无', N'10000', N'10000', N'2015-05-05', N'暂无', N'0', N'业务发展部');
GO
INSERT INTO [dbo].[Projects] ([ProjectID], [ProjectCode], [ProjectName], [ProjectAccount], [Manager], [Members], [Budget], [Collected], [ApplyDate], [Remark], [Status], [Department]) VALUES (N'17', N'YW13PU002', N'唐山政务信息资源目录编制', N'432402-028', N'许琳', N'暂无', N'10000', N'10000', N'2015-05-05', N'暂无', N'0', N'业务发展部');
GO
INSERT INTO [dbo].[Projects] ([ProjectID], [ProjectCode], [ProjectName], [ProjectAccount], [Manager], [Members], [Budget], [Collected], [ApplyDate], [Remark], [Status], [Department]) VALUES (N'42', N'ZG08PU002', N'CENC简报', N'432402-028', N'臧茜', N'暂无', N'10000', N'10000', N'2015-05-05', N'暂无', N'0', N'综合管理部');
GO
INSERT INTO [dbo].[Projects] ([ProjectID], [ProjectCode], [ProjectName], [ProjectAccount], [Manager], [Members], [Budget], [Collected], [ApplyDate], [Remark], [Status], [Department]) VALUES (N'28', N'ZG12PU001', N'CSNC2012/BD-CASTIC2012（第三届北斗杯）', N'413-170-025', N'丘扬', N'暂无', N'10000', N'10000', N'2015-05-05', N'暂无', N'0', N'教育培训部');
GO
INSERT INTO [dbo].[Projects] ([ProjectID], [ProjectCode], [ProjectName], [ProjectAccount], [Manager], [Members], [Budget], [Collected], [ApplyDate], [Remark], [Status], [Department]) VALUES (N'12', N'ZG14PU001-DCDF2014', N'第十一届数字中国发展高层论坛暨信息主管峰会（DCDF2014）', N'432402-028', N'许琳', N'暂无', N'10000', N'10000', N'2015-05-05', N'暂无', N'0', N'业务发展部');
GO
INSERT INTO [dbo].[Projects] ([ProjectID], [ProjectCode], [ProjectName], [ProjectAccount], [Manager], [Members], [Budget], [Collected], [ApplyDate], [Remark], [Status], [Department]) VALUES (N'45', N'第十届北斗杯', N'肉肉肉肉肉肉', N'1111111', N'热腾腾', N'必填', N'90', N'67', N'2015-07-01', N'必填', N'0', N'业务发展部');
GO
SET IDENTITY_INSERT [dbo].[Projects] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[Reimbursements]
-- ----------------------------
DROP TABLE [dbo].[Reimbursements]
GO
CREATE TABLE [dbo].[Reimbursements] (
[ReimbursementID] int NOT NULL IDENTITY(1,1) ,
[StaffName] nvarchar(20) NULL ,
[Department] nvarchar(50) NULL ,
[Manager] nvarchar(20) NULL ,
[ProjectCode] nvarchar(50) NULL ,
[ProjectAccount] nvarchar(50) NULL ,
[HappenDate] date NULL ,
[ReimburseDate] date NULL ,
[Payee] nvarchar(20) NULL ,
[Bill] int NULL ,
[Expense] float(53) NULL ,
[AllExpense] float(53) NULL ,
[PayeeDate] date NULL ,
[Remark] nvarchar(50) NULL ,
[Note] nvarchar(50) NULL ,
[ApproveProcess] nvarchar(150) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[Reimbursements]', RESEED, 1013)
GO

-- ----------------------------
-- Records of Reimbursements
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Reimbursements] ON
GO
INSERT INTO [dbo].[Reimbursements] ([ReimbursementID], [StaffName], [Department], [Manager], [ProjectCode], [ProjectAccount], [HappenDate], [ReimburseDate], [Payee], [Bill], [Expense], [AllExpense], [PayeeDate], [Remark], [Note], [ApproveProcess]) VALUES (N'11', N'员工甲       ', N'交流合作部', N'项目经理甲     ', N'项目编号1               ', N'项目账号2                                             ', N'2015-03-04', N'2015-03-04', null, N'3', N'1323', N'13232', N'1-01-01', N'员工甲在项目一', null, N'项目经理甲-同意,财务主管甲-同意,机构负责人甲-同意,管委会负责人甲-同意,会计甲-同意,财务主管甲-同意,出纳甲-同意,');
GO
INSERT INTO [dbo].[Reimbursements] ([ReimbursementID], [StaffName], [Department], [Manager], [ProjectCode], [ProjectAccount], [HappenDate], [ReimburseDate], [Payee], [Bill], [Expense], [AllExpense], [PayeeDate], [Remark], [Note], [ApproveProcess]) VALUES (N'12', N'员工甲       ', N'交流合作部', N'项目经理乙     ', N'项目编号2               ', N'项目账号2                                             ', N'2015-03-07', N'2015-03-07', null, N'2', N'2232', N'2232', N'1-01-01', N'员工甲在项目乙', null, N'项目经理乙-不同意,');
GO
INSERT INTO [dbo].[Reimbursements] ([ReimbursementID], [StaffName], [Department], [Manager], [ProjectCode], [ProjectAccount], [HappenDate], [ReimburseDate], [Payee], [Bill], [Expense], [AllExpense], [PayeeDate], [Remark], [Note], [ApproveProcess]) VALUES (N'13', N'员工乙       ', N'研究开发部', N'项目经理甲     ', N'项目编号1               ', N'项目账号1                                             ', N'2015-03-07', N'2015-03-07', null, N'3', N'2323', N'97232', N'1-01-01', N'员工乙在项目一', null, N'项目经理甲-不同意,');
GO
INSERT INTO [dbo].[Reimbursements] ([ReimbursementID], [StaffName], [Department], [Manager], [ProjectCode], [ProjectAccount], [HappenDate], [ReimburseDate], [Payee], [Bill], [Expense], [AllExpense], [PayeeDate], [Remark], [Note], [ApproveProcess]) VALUES (N'14', N'员工乙       ', N'研究开发部', N'项目经理乙     ', N'项目编号3               ', N'项目账号1                                             ', N'2015-03-19', N'2015-03-07', null, N'5', N'2232', N'22132', N'1-01-01', N'员工乙在项目三', null, N'项目经理乙-同意,财务主管甲-同意,机构负责人甲-同意,管委会负责人甲-同意,会计甲-同意,财务主管甲-同意,出纳甲-不同意,');
GO
INSERT INTO [dbo].[Reimbursements] ([ReimbursementID], [StaffName], [Department], [Manager], [ProjectCode], [ProjectAccount], [HappenDate], [ReimburseDate], [Payee], [Bill], [Expense], [AllExpense], [PayeeDate], [Remark], [Note], [ApproveProcess]) VALUES (N'15', N'员工乙       ', N'研究开发部', N'项目经理乙     ', N'项目编号3               ', N'项目账号2                                             ', N'2015-07-07', N'2015-07-15', null, N'2', N'2332', N'3232', N'1-01-01', N'七月份', null, N'项目经理乙-同意,财务主管甲-同意,机构负责人甲-同意,会计甲-同意,财务主管甲-同意,出纳甲-同意,');
GO
INSERT INTO [dbo].[Reimbursements] ([ReimbursementID], [StaffName], [Department], [Manager], [ProjectCode], [ProjectAccount], [HappenDate], [ReimburseDate], [Payee], [Bill], [Expense], [AllExpense], [PayeeDate], [Remark], [Note], [ApproveProcess]) VALUES (N'16', N'员工甲       ', N'交流合作部', N'项目经理乙     ', N'项目编号2               ', N'项目账号2                                             ', N'2015-04-04', N'2015-04-07', null, N'6', N'2323', N'23223', N'1-01-01', N'四月份', null, N'项目经理乙-同意,财务主管甲-同意,机构负责人甲-同意,管委会负责人甲-同意,会计甲-同意,出纳甲-同意,');
GO
INSERT INTO [dbo].[Reimbursements] ([ReimbursementID], [StaffName], [Department], [Manager], [ProjectCode], [ProjectAccount], [HappenDate], [ReimburseDate], [Payee], [Bill], [Expense], [AllExpense], [PayeeDate], [Remark], [Note], [ApproveProcess]) VALUES (N'1004', N'员工乙       ', N'交流合作部', N'项目经理乙     ', N'项目编号2               ', N'项目账号2                                             ', N'2015-04-16', N'2015-04-30', null, N'23', N'3223', N'3223', N'1-01-01', N'', null, N'项目经理乙-同意,财务主管甲-同意,机构负责人甲-同意,会计甲-同意,出纳甲-同意,');
GO
INSERT INTO [dbo].[Reimbursements] ([ReimbursementID], [StaffName], [Department], [Manager], [ProjectCode], [ProjectAccount], [HappenDate], [ReimburseDate], [Payee], [Bill], [Expense], [AllExpense], [PayeeDate], [Remark], [Note], [ApproveProcess]) VALUES (N'1005', N'员工乙       ', N'交流合作部', N'项目经理乙     ', N'项目编号3               ', N'项目账号3                                             ', N'2015-04-15', N'2015-04-24', null, N'2', N'232', N'232', N'1-01-01', N'2323', null, N'项目经理乙-同意,财务主管甲-同意,机构负责人甲-同意,会计甲-同意,出纳甲-同意,');
GO
INSERT INTO [dbo].[Reimbursements] ([ReimbursementID], [StaffName], [Department], [Manager], [ProjectCode], [ProjectAccount], [HappenDate], [ReimburseDate], [Payee], [Bill], [Expense], [AllExpense], [PayeeDate], [Remark], [Note], [ApproveProcess]) VALUES (N'17', N'员工甲       ', N'交流合作部', N'项目经理乙     ', N'项目编号2               ', N'项目账号3                                             ', N'2015-10-15', N'2015-10-15', null, N'2', N'42232', N'543423', N'1-01-01', N'八月桂花开', null, N'项目经理乙-同意,财务主管甲-同意,机构负责人甲-同意,管委会负责人甲-同意,会计甲-同意,财务主管甲-同意,出纳甲-同意,');
GO
INSERT INTO [dbo].[Reimbursements] ([ReimbursementID], [StaffName], [Department], [Manager], [ProjectCode], [ProjectAccount], [HappenDate], [ReimburseDate], [Payee], [Bill], [Expense], [AllExpense], [PayeeDate], [Remark], [Note], [ApproveProcess]) VALUES (N'1006', N'员工丙       ', N'战略规划部', N'项目经理乙     ', N'项目编号2               ', N'项目账号2                                             ', N'2015-05-06', N'2015-05-04', null, N'9', N'20000', N'20000', N'1-01-01', N'上马测试', null, N'项目经理乙-同意,财务主管甲-同意,机构负责人甲-同意,管委会负责人甲-同意,会计甲-同意,出纳甲-同意,');
GO
INSERT INTO [dbo].[Reimbursements] ([ReimbursementID], [StaffName], [Department], [Manager], [ProjectCode], [ProjectAccount], [HappenDate], [ReimburseDate], [Payee], [Bill], [Expense], [AllExpense], [PayeeDate], [Remark], [Note], [ApproveProcess]) VALUES (N'1007', N'臧茜', N'综合管理部', N'臧茜', N'FW0000000', N'FW0000000', N'2015-05-06', N'2015-05-06', null, N'1', N'20', N'20', N'1-01-01', N'买410室数据线', null, null);
GO
INSERT INTO [dbo].[Reimbursements] ([ReimbursementID], [StaffName], [Department], [Manager], [ProjectCode], [ProjectAccount], [HappenDate], [ReimburseDate], [Payee], [Bill], [Expense], [AllExpense], [PayeeDate], [Remark], [Note], [ApproveProcess]) VALUES (N'1008', N'臧茜', N'综合管理部', N'杨凯欣', N'GSE0000000', N'GSE0000000', N'2015-05-11', N'2015-05-11', null, N'1', N'4500', N'4500', N'1-01-01', N'专利费', null, null);
GO
INSERT INTO [dbo].[Reimbursements] ([ReimbursementID], [StaffName], [Department], [Manager], [ProjectCode], [ProjectAccount], [HappenDate], [ReimburseDate], [Payee], [Bill], [Expense], [AllExpense], [PayeeDate], [Remark], [Note], [ApproveProcess]) VALUES (N'1009', N'员工丙       ', N'战略规划部', N'刘晶', N'AS0000000', N'AS0000000', N'2015-05-11', N'2015-05-11', null, N'5', N'30000', N'30000', N'1-01-01', N'不知道', null, null);
GO
INSERT INTO [dbo].[Reimbursements] ([ReimbursementID], [StaffName], [Department], [Manager], [ProjectCode], [ProjectAccount], [HappenDate], [ReimburseDate], [Payee], [Bill], [Expense], [AllExpense], [PayeeDate], [Remark], [Note], [ApproveProcess]) VALUES (N'1010', N'新员工甲', N'业务发展部', N'刘晶', N'AS0000000', N'AS0000000', N'2015-05-04', N'2015-05-11', null, N'5', N'350000', N'350000', N'1-01-01', N'测试', null, N'项目经理甲-同意,部门经理甲-同意,臧茜-同意,');
GO
INSERT INTO [dbo].[Reimbursements] ([ReimbursementID], [StaffName], [Department], [Manager], [ProjectCode], [ProjectAccount], [HappenDate], [ReimburseDate], [Payee], [Bill], [Expense], [AllExpense], [PayeeDate], [Remark], [Note], [ApproveProcess]) VALUES (N'1011', N'吴桂会', N'综合管理部', N'臧茜', N'FW0000000', N'FW0000000', N'2015-05-27', N'2015-05-27', null, N'2', N'40', N'40', N'1-01-01', N'去社保局事宜', null, N'臧茜-不同意,若不同意请注明理由：,');
GO
INSERT INTO [dbo].[Reimbursements] ([ReimbursementID], [StaffName], [Department], [Manager], [ProjectCode], [ProjectAccount], [HappenDate], [ReimburseDate], [Payee], [Bill], [Expense], [AllExpense], [PayeeDate], [Remark], [Note], [ApproveProcess]) VALUES (N'1012', N'臧茜', N'综合管理部', N'臧茜', N'FW0000000', N'FW0000000', N'2015-06-26', N'2015-06-26', null, N'1', N'37', N'37', N'1-01-01', N'交通费', null, null);
GO
INSERT INTO [dbo].[Reimbursements] ([ReimbursementID], [StaffName], [Department], [Manager], [ProjectCode], [ProjectAccount], [HappenDate], [ReimburseDate], [Payee], [Bill], [Expense], [AllExpense], [PayeeDate], [Remark], [Note], [ApproveProcess]) VALUES (N'1013', N'吴桂会', N'综合管理部', N'臧茜', N'FW0000000', N'FW0000000', N'2015-06-03', N'2015-06-26', null, N'2', N'50', N'50', N'1-01-01', N'办事交通费', null, N'臧茜-同意,高妍-同意,高妍-同意,');
GO
SET IDENTITY_INSERT [dbo].[Reimbursements] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[RepairApplies]
-- ----------------------------
DROP TABLE [dbo].[RepairApplies]
GO
CREATE TABLE [dbo].[RepairApplies] (
[ApplyID] int NOT NULL IDENTITY(1,1) ,
[EquipmentName] nvarchar(20) NOT NULL ,
[EquipmentType] nvarchar(20) NOT NULL ,
[StaffName] nvarchar(20) NOT NULL ,
[Department] nvarchar(20) NOT NULL ,
[BuyDate] date NOT NULL ,
[BugDate] date NOT NULL ,
[BugDetail] nvarchar(50) NOT NULL ,
[FixDate] date NOT NULL ,
[SentToRepair] date NOT NULL ,
[DuringGuarantee] bit NOT NULL ,
[RepairSelf] bit NOT NULL ,
[Budget] float(53) NOT NULL ,
[SettleType] nvarchar(20) NOT NULL ,
[ApproveProcess] nvarchar(100) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[RepairApplies]', RESEED, 2)
GO

-- ----------------------------
-- Records of RepairApplies
-- ----------------------------
SET IDENTITY_INSERT [dbo].[RepairApplies] ON
GO
INSERT INTO [dbo].[RepairApplies] ([ApplyID], [EquipmentName], [EquipmentType], [StaffName], [Department], [BuyDate], [BugDate], [BugDetail], [FixDate], [SentToRepair], [DuringGuarantee], [RepairSelf], [Budget], [SettleType], [ApproveProcess]) VALUES (N'1', N'菜刀', N'2.0', N'员工乙', N'研究开发部', N'2015-04-04', N'2015-04-04', N'某只', N'2015-04-09', N'2015-04-05', N'1', N'0', N'200', N'某司', N'部门经理乙-同意,机构负责人甲-同意,财务主管甲-同意,');
GO
INSERT INTO [dbo].[RepairApplies] ([ApplyID], [EquipmentName], [EquipmentType], [StaffName], [Department], [BuyDate], [BugDate], [BugDetail], [FixDate], [SentToRepair], [DuringGuarantee], [RepairSelf], [Budget], [SettleType], [ApproveProcess]) VALUES (N'2', N'软件', N'56', N'臧茜', N'综合管理部', N'2015-06-05', N'2015-06-05', N'退', N'2015-06-05', N'2015-06-05', N'1', N'1', N'50', N'支票', null);
GO
SET IDENTITY_INSERT [dbo].[RepairApplies] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[Roles]
-- ----------------------------
DROP TABLE [dbo].[Roles]
GO
CREATE TABLE [dbo].[Roles] (
[RoleID] int NOT NULL IDENTITY(1,1) ,
[RoleName] nvarchar(50) NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[Roles]', RESEED, 10)
GO

-- ----------------------------
-- Records of Roles
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Roles] ON
GO
INSERT INTO [dbo].[Roles] ([RoleID], [RoleName]) VALUES (N'1', N'员工');
GO
INSERT INTO [dbo].[Roles] ([RoleID], [RoleName]) VALUES (N'2', N'项目经理');
GO
INSERT INTO [dbo].[Roles] ([RoleID], [RoleName]) VALUES (N'3', N'部门经理');
GO
INSERT INTO [dbo].[Roles] ([RoleID], [RoleName]) VALUES (N'4', N'综管经理');
GO
INSERT INTO [dbo].[Roles] ([RoleID], [RoleName]) VALUES (N'5', N'财务主管');
GO
INSERT INTO [dbo].[Roles] ([RoleID], [RoleName]) VALUES (N'6', N'机构负责人');
GO
INSERT INTO [dbo].[Roles] ([RoleID], [RoleName]) VALUES (N'7', N'会计');
GO
INSERT INTO [dbo].[Roles] ([RoleID], [RoleName]) VALUES (N'8', N'出纳');
GO
INSERT INTO [dbo].[Roles] ([RoleID], [RoleName]) VALUES (N'9', N'test');
GO
INSERT INTO [dbo].[Roles] ([RoleID], [RoleName]) VALUES (N'10', N'管委会负责人');
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[SalaryDetail]
-- ----------------------------
DROP TABLE [dbo].[SalaryDetail]
GO
CREATE TABLE [dbo].[SalaryDetail] (
[RecordID] int NOT NULL IDENTITY(1,1) ,
[ApplyID] int NOT NULL ,
[StaffName] nvarchar(20) NOT NULL ,
[Department] nvarchar(20) NOT NULL ,
[SalaryDate] date NULL ,
[BasicSalary] float(53) NULL ,
[PerformanceSalary] float(53) NULL ,
[OtherWithHold] float(53) NULL ,
[OtherBonus] float(53) NULL ,
[Endowment] float(53) NULL ,
[Unemployed] float(53) NULL ,
[Medical] float(53) NULL ,
[House] float(53) NULL ,
[TaxIncome] float(53) NULL ,
[TaxRate] float(53) NULL ,
[Tax] float(53) NULL ,
[QuickMinus] float(53) NULL ,
[Income] float(53) NULL ,
[Remark] nvarchar(200) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[SalaryDetail]', RESEED, 2)
GO

-- ----------------------------
-- Records of SalaryDetail
-- ----------------------------
SET IDENTITY_INSERT [dbo].[SalaryDetail] ON
GO
INSERT INTO [dbo].[SalaryDetail] ([RecordID], [ApplyID], [StaffName], [Department], [SalaryDate], [BasicSalary], [PerformanceSalary], [OtherWithHold], [OtherBonus], [Endowment], [Unemployed], [Medical], [House], [TaxIncome], [TaxRate], [Tax], [QuickMinus], [Income], [Remark]) VALUES (N'1', N'8', N'员工甲', N'交流合作部', N'2015-04-01', N'4000', N'3000', N'200', N'300', N'150', N'100', N'200', N'300', N'5750', N'0.1', N'120', N'105', N'5630', N'雾霾');
GO
INSERT INTO [dbo].[SalaryDetail] ([RecordID], [ApplyID], [StaffName], [Department], [SalaryDate], [BasicSalary], [PerformanceSalary], [OtherWithHold], [OtherBonus], [Endowment], [Unemployed], [Medical], [House], [TaxIncome], [TaxRate], [Tax], [QuickMinus], [Income], [Remark]) VALUES (N'2', N'8', N'员工乙', N'交流合作部', N'2015-04-01', N'3000', N'2000', N'100', N'100', N'200', N'200', N'200', N'150', N'3850', N'0.03', N'10.5', N'0', N'3839.5', N'没有');
GO
SET IDENTITY_INSERT [dbo].[SalaryDetail] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[SalaryMonthly]
-- ----------------------------
DROP TABLE [dbo].[SalaryMonthly]
GO
CREATE TABLE [dbo].[SalaryMonthly] (
[ApplyID] int NOT NULL IDENTITY(1,1) ,
[StaffName] nvarchar(20) NOT NULL ,
[ApplyDate] date NOT NULL ,
[ApproveProcess] nvarchar(100) NULL ,
[ProjectAccount] nvarchar(50) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[SalaryMonthly]', RESEED, 17)
GO

-- ----------------------------
-- Records of SalaryMonthly
-- ----------------------------
SET IDENTITY_INSERT [dbo].[SalaryMonthly] ON
GO
INSERT INTO [dbo].[SalaryMonthly] ([ApplyID], [StaffName], [ApplyDate], [ApproveProcess], [ProjectAccount]) VALUES (N'1', N'员工甲', N'2015-04-21', N'', null);
GO
INSERT INTO [dbo].[SalaryMonthly] ([ApplyID], [StaffName], [ApplyDate], [ApproveProcess], [ProjectAccount]) VALUES (N'2', N'员工乙', N'2015-04-21', N'', null);
GO
INSERT INTO [dbo].[SalaryMonthly] ([ApplyID], [StaffName], [ApplyDate], [ApproveProcess], [ProjectAccount]) VALUES (N'3', N'员工乙', N'2015-09-01', N'', null);
GO
INSERT INTO [dbo].[SalaryMonthly] ([ApplyID], [StaffName], [ApplyDate], [ApproveProcess], [ProjectAccount]) VALUES (N'4', N'员工丙', N'2015-10-01', N'', null);
GO
INSERT INTO [dbo].[SalaryMonthly] ([ApplyID], [StaffName], [ApplyDate], [ApproveProcess], [ProjectAccount]) VALUES (N'5', N'员工丙', N'2015-12-01', N'', null);
GO
INSERT INTO [dbo].[SalaryMonthly] ([ApplyID], [StaffName], [ApplyDate], [ApproveProcess], [ProjectAccount]) VALUES (N'6', N'员工X', N'2015-01-01', N'', null);
GO
INSERT INTO [dbo].[SalaryMonthly] ([ApplyID], [StaffName], [ApplyDate], [ApproveProcess], [ProjectAccount]) VALUES (N'7', N'会计甲', N'2015-02-01', N'', null);
GO
INSERT INTO [dbo].[SalaryMonthly] ([ApplyID], [StaffName], [ApplyDate], [ApproveProcess], [ProjectAccount]) VALUES (N'8', N'会计甲', N'2015-04-01', N'', null);
GO
INSERT INTO [dbo].[SalaryMonthly] ([ApplyID], [StaffName], [ApplyDate], [ApproveProcess], [ProjectAccount]) VALUES (N'9', N'财务主管甲     ', N'2019-05-01', N'', null);
GO
INSERT INTO [dbo].[SalaryMonthly] ([ApplyID], [StaffName], [ApplyDate], [ApproveProcess], [ProjectAccount]) VALUES (N'10', N'财务主管甲     ', N'2010-08-01', N'', null);
GO
INSERT INTO [dbo].[SalaryMonthly] ([ApplyID], [StaffName], [ApplyDate], [ApproveProcess], [ProjectAccount]) VALUES (N'11', N'臧茜', N'2015-05-01', N'', null);
GO
INSERT INTO [dbo].[SalaryMonthly] ([ApplyID], [StaffName], [ApplyDate], [ApproveProcess], [ProjectAccount]) VALUES (N'12', N'籍伟丽', N'2015-04-01', N'', null);
GO
INSERT INTO [dbo].[SalaryMonthly] ([ApplyID], [StaffName], [ApplyDate], [ApproveProcess], [ProjectAccount]) VALUES (N'13', N'吴桂会', N'2015-05-01', N'', null);
GO
INSERT INTO [dbo].[SalaryMonthly] ([ApplyID], [StaffName], [ApplyDate], [ApproveProcess], [ProjectAccount]) VALUES (N'14', N'籍伟丽', N'2015-05-01', N'', null);
GO
INSERT INTO [dbo].[SalaryMonthly] ([ApplyID], [StaffName], [ApplyDate], [ApproveProcess], [ProjectAccount]) VALUES (N'15', N'臧茜', N'2015-06-01', N'', null);
GO
INSERT INTO [dbo].[SalaryMonthly] ([ApplyID], [StaffName], [ApplyDate], [ApproveProcess], [ProjectAccount]) VALUES (N'16', N'吴桂会', N'2015-06-01', N'', null);
GO
INSERT INTO [dbo].[SalaryMonthly] ([ApplyID], [StaffName], [ApplyDate], [ApproveProcess], [ProjectAccount]) VALUES (N'17', N'吴桂会', N'2015-07-01', N'', null);
GO
SET IDENTITY_INSERT [dbo].[SalaryMonthly] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[SettleApplies]
-- ----------------------------
DROP TABLE [dbo].[SettleApplies]
GO
CREATE TABLE [dbo].[SettleApplies] (
[RecordID] int NOT NULL IDENTITY(1,1) ,
[StaffName] nvarchar(20) NOT NULL ,
[Department] nvarchar(50) NOT NULL ,
[Position] nvarchar(20) NOT NULL ,
[Money] float(53) NOT NULL ,
[Reason] nvarchar(100) NOT NULL ,
[SettleDate] date NOT NULL ,
[Legal] bit NOT NULL ,
[InnerBudget] bit NOT NULL ,
[CheckBill] nvarchar(50) NOT NULL ,
[ApproveProcess] nvarchar(100) NULL ,
[ProjectAccount] nvarchar(50) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[SettleApplies]', RESEED, 10)
GO

-- ----------------------------
-- Records of SettleApplies
-- ----------------------------
SET IDENTITY_INSERT [dbo].[SettleApplies] ON
GO
INSERT INTO [dbo].[SettleApplies] ([RecordID], [StaffName], [Department], [Position], [Money], [Reason], [SettleDate], [Legal], [InnerBudget], [CheckBill], [ApproveProcess], [ProjectAccount]) VALUES (N'1', N'员工甲', N'交流合作部', N'员工', N'232321', N' 22323如3', N'1-01-01', N'1', N'1', N'某司', null, null);
GO
INSERT INTO [dbo].[SettleApplies] ([RecordID], [StaffName], [Department], [Position], [Money], [Reason], [SettleDate], [Legal], [InnerBudget], [CheckBill], [ApproveProcess], [ProjectAccount]) VALUES (N'2', N'员工甲', N'交流合作部', N'员工', N'23111', N'额', N'1-01-01', N'1', N'0', N'某司', N'部门经理甲-同意,机构负责人甲-同意,管委会负责人甲-同意,会计甲-同意,出纳甲-同意,出纳甲-同意,', null);
GO
INSERT INTO [dbo].[SettleApplies] ([RecordID], [StaffName], [Department], [Position], [Money], [Reason], [SettleDate], [Legal], [InnerBudget], [CheckBill], [ApproveProcess], [ProjectAccount]) VALUES (N'3', N'员工甲', N'交流合作部', N'员工', N'0', N'232如3', N'2015-04-10', N'1', N'1', N'你猜', N'部门经理甲-同意,机构负责人甲-同意,管委会负责人甲-同意,会计甲-同意,财务主管甲-同意,机构负责人甲-同意,管委会负责人甲-同意,会计甲-同意,财务主管甲-同意,机构负责人甲-同意,', N'项目账号2                                             ');
GO
INSERT INTO [dbo].[SettleApplies] ([RecordID], [StaffName], [Department], [Position], [Money], [Reason], [SettleDate], [Legal], [InnerBudget], [CheckBill], [ApproveProcess], [ProjectAccount]) VALUES (N'4', N'员工丙', N'交流合作部', N'员工', N'0', N'232', N'2015-04-04', N'1', N'0', N'你猜', N'部门经理丙-同意,机构负责人甲-同意,管委会负责人甲-同意,会计甲-同意,财务主管甲-同意,机构负责人甲-同意,', N'项目账号1                                             ');
GO
INSERT INTO [dbo].[SettleApplies] ([RecordID], [StaffName], [Department], [Position], [Money], [Reason], [SettleDate], [Legal], [InnerBudget], [CheckBill], [ApproveProcess], [ProjectAccount]) VALUES (N'5', N'员工丙', N'战略规划部', N'员工', N'0', N'2噢如 人v', N'2015-04-09', N'1', N'1', N'母鸡', N'部门经理丙-同意,机构负责人甲-同意,管委会负责人甲-同意,会计甲-同意,财务主管甲-同意,机构负责人甲-同意,管委会负责人甲-同意,会计甲-同意,出纳甲-同意,', N'项目账号1                                             ');
GO
INSERT INTO [dbo].[SettleApplies] ([RecordID], [StaffName], [Department], [Position], [Money], [Reason], [SettleDate], [Legal], [InnerBudget], [CheckBill], [ApproveProcess], [ProjectAccount]) VALUES (N'6', N'臧茜', N'综合管理部', N'财务主管', N'12', N'天宇', N'2015-06-05', N'1', N'1', N'', null, N'AS0000000');
GO
INSERT INTO [dbo].[SettleApplies] ([RecordID], [StaffName], [Department], [Position], [Money], [Reason], [SettleDate], [Legal], [InnerBudget], [CheckBill], [ApproveProcess], [ProjectAccount]) VALUES (N'7', N'臧茜', N'综合管理部', N'财务主管', N'23998', N'weo', N'2015-06-04', N'1', N'1', N'北京大学', null, N'AS0000000');
GO
INSERT INTO [dbo].[SettleApplies] ([RecordID], [StaffName], [Department], [Position], [Money], [Reason], [SettleDate], [Legal], [InnerBudget], [CheckBill], [ApproveProcess], [ProjectAccount]) VALUES (N'8', N'员工甲       ', N'业务发展部', N'员工', N'23232323', N'1111111111111111', N'2015-06-11', N'1', N'1', N'被禁的', null, N'AS0000000');
GO
INSERT INTO [dbo].[SettleApplies] ([RecordID], [StaffName], [Department], [Position], [Money], [Reason], [SettleDate], [Legal], [InnerBudget], [CheckBill], [ApproveProcess], [ProjectAccount]) VALUES (N'9', N'臧茜', N'综合管理部', N'财务主管', N'232233', N'oewfnweofwofwejfowefjweofjweofwej', N'2015-06-12', N'1', N'1', N'sdwewe', null, N'AS0000000');
GO
INSERT INTO [dbo].[SettleApplies] ([RecordID], [StaffName], [Department], [Position], [Money], [Reason], [SettleDate], [Legal], [InnerBudget], [CheckBill], [ApproveProcess], [ProjectAccount]) VALUES (N'10', N'臧茜', N'综合管理部', N'财务主管', N'400', N'餐费', N'2015-07-01', N'1', N'1', N'', null, N'AS0000000');
GO
SET IDENTITY_INSERT [dbo].[SettleApplies] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[Users]
-- ----------------------------
DROP TABLE [dbo].[Users]
GO
CREATE TABLE [dbo].[Users] (
[UserID] int NOT NULL IDENTITY(1,1) ,
[UserName] nvarchar(50) NOT NULL ,
[PasswordHash] nvarchar(50) NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[Users]', RESEED, 32)
GO

-- ----------------------------
-- Records of Users
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Users] ON
GO
INSERT INTO [dbo].[Users] ([UserID], [UserName], [PasswordHash]) VALUES (N'1', N'tomserious', N'GeJjtdRYhwoR/SOYOGyzzg==');
GO
INSERT INTO [dbo].[Users] ([UserID], [UserName], [PasswordHash]) VALUES (N'2', N'yuangong1', N'bs5P1RvBE5QmkmN9nUuGDg==');
GO
INSERT INTO [dbo].[Users] ([UserID], [UserName], [PasswordHash]) VALUES (N'3', N'yuangong2', N'bs5P1RvBE5QmkmN9nUuGDg==');
GO
INSERT INTO [dbo].[Users] ([UserID], [UserName], [PasswordHash]) VALUES (N'5', N'manager1', N'VsgrmB3RE7pPSvAFs+Jztw==');
GO
INSERT INTO [dbo].[Users] ([UserID], [UserName], [PasswordHash]) VALUES (N'6', N'manager2', N'bs5P1RvBE5QmkmN9nUuGDg==');
GO
INSERT INTO [dbo].[Users] ([UserID], [UserName], [PasswordHash]) VALUES (N'7', N'chuna1', N'bs5P1RvBE5QmkmN9nUuGDg==');
GO
INSERT INTO [dbo].[Users] ([UserID], [UserName], [PasswordHash]) VALUES (N'8', N'kuaiji1', N'bs5P1RvBE5QmkmN9nUuGDg==');
GO
INSERT INTO [dbo].[Users] ([UserID], [UserName], [PasswordHash]) VALUES (N'9', N'bumen1', N'bs5P1RvBE5QmkmN9nUuGDg==');
GO
INSERT INTO [dbo].[Users] ([UserID], [UserName], [PasswordHash]) VALUES (N'10', N'bumen2', N'bs5P1RvBE5QmkmN9nUuGDg==');
GO
INSERT INTO [dbo].[Users] ([UserID], [UserName], [PasswordHash]) VALUES (N'11', N'bumen3', N'bs5P1RvBE5QmkmN9nUuGDg==');
GO
INSERT INTO [dbo].[Users] ([UserID], [UserName], [PasswordHash]) VALUES (N'12', N'zongguan1', N'bs5P1RvBE5QmkmN9nUuGDg==');
GO
INSERT INTO [dbo].[Users] ([UserID], [UserName], [PasswordHash]) VALUES (N'13', N'zongguan2', N'bs5P1RvBE5QmkmN9nUuGDg==');
GO
INSERT INTO [dbo].[Users] ([UserID], [UserName], [PasswordHash]) VALUES (N'14', N'caiwu1', N'bs5P1RvBE5QmkmN9nUuGDg==');
GO
INSERT INTO [dbo].[Users] ([UserID], [UserName], [PasswordHash]) VALUES (N'15', N'caiwu2', N'bs5P1RvBE5QmkmN9nUuGDg==');
GO
INSERT INTO [dbo].[Users] ([UserID], [UserName], [PasswordHash]) VALUES (N'17', N'yuangong3', N'bs5P1RvBE5QmkmN9nUuGDg==');
GO
INSERT INTO [dbo].[Users] ([UserID], [UserName], [PasswordHash]) VALUES (N'18', N'manager3', N'bs5P1RvBE5QmkmN9nUuGDg==');
GO
INSERT INTO [dbo].[Users] ([UserID], [UserName], [PasswordHash]) VALUES (N'19', N'jigou1', N'bs5P1RvBE5QmkmN9nUuGDg==');
GO
INSERT INTO [dbo].[Users] ([UserID], [UserName], [PasswordHash]) VALUES (N'20', N'guanwei1', N'bs5P1RvBE5QmkmN9nUuGDg==');
GO
INSERT INTO [dbo].[Users] ([UserID], [UserName], [PasswordHash]) VALUES (N'21', N'yuangong6', N'bs5P1RvBE5QmkmN9nUuGDg==');
GO
INSERT INTO [dbo].[Users] ([UserID], [UserName], [PasswordHash]) VALUES (N'22', N'yuangong3', N'bs5P1RvBE5QmkmN9nUuGDg==');
GO
INSERT INTO [dbo].[Users] ([UserID], [UserName], [PasswordHash]) VALUES (N'23', N'yuangong5', N'bs5P1RvBE5QmkmN9nUuGDg==');
GO
INSERT INTO [dbo].[Users] ([UserID], [UserName], [PasswordHash]) VALUES (N'24', N'yuangong6', N'bs5P1RvBE5QmkmN9nUuGDg==');
GO
INSERT INTO [dbo].[Users] ([UserID], [UserName], [PasswordHash]) VALUES (N'25', N'yuangong9', N'bs5P1RvBE5QmkmN9nUuGDg==');
GO
INSERT INTO [dbo].[Users] ([UserID], [UserName], [PasswordHash]) VALUES (N'26', N'yuangong11', N'bs5P1RvBE5QmkmN9nUuGDg==');
GO
INSERT INTO [dbo].[Users] ([UserID], [UserName], [PasswordHash]) VALUES (N'27', N'yuangong12', N'VsgrmB3RE7pPSvAFs+Jztw==');
GO
INSERT INTO [dbo].[Users] ([UserID], [UserName], [PasswordHash]) VALUES (N'28', N'zangqian', N'VsgrmB3RE7pPSvAFs+Jztw==');
GO
INSERT INTO [dbo].[Users] ([UserID], [UserName], [PasswordHash]) VALUES (N'29', N'吴桂会', N'zgv9FQWbaNZ2iIhNej0+jA==');
GO
INSERT INTO [dbo].[Users] ([UserID], [UserName], [PasswordHash]) VALUES (N'30', N'yg1', N'bs5P1RvBE5QmkmN9nUuGDg==');
GO
INSERT INTO [dbo].[Users] ([UserID], [UserName], [PasswordHash]) VALUES (N'31', N'籍伟丽', N'lj4OBBtKrwmKwoLQXJb5Yg==');
GO
INSERT INTO [dbo].[Users] ([UserID], [UserName], [PasswordHash]) VALUES (N'32', N'gao_yan', N'VsgrmB3RE7pPSvAFs+Jztw==');
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[YearlyBudgetApplies]
-- ----------------------------
DROP TABLE [dbo].[YearlyBudgetApplies]
GO
CREATE TABLE [dbo].[YearlyBudgetApplies] (
[ApplyID] int NOT NULL IDENTITY(1,1) ,
[StaffName] nvarchar(20) NULL ,
[ApplyDate] date NULL ,
[ApproveProcess] nvarchar(100) NULL ,
[ProjectAccount] nvarchar(50) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[YearlyBudgetApplies]', RESEED, 16)
GO

-- ----------------------------
-- Records of YearlyBudgetApplies
-- ----------------------------
SET IDENTITY_INSERT [dbo].[YearlyBudgetApplies] ON
GO
INSERT INTO [dbo].[YearlyBudgetApplies] ([ApplyID], [StaffName], [ApplyDate], [ApproveProcess], [ProjectAccount]) VALUES (N'1', N'员工甲       ', N'2015-05-04', null, null);
GO
INSERT INTO [dbo].[YearlyBudgetApplies] ([ApplyID], [StaffName], [ApplyDate], [ApproveProcess], [ProjectAccount]) VALUES (N'2', N'员工甲       ', N'2015-05-04', null, null);
GO
INSERT INTO [dbo].[YearlyBudgetApplies] ([ApplyID], [StaffName], [ApplyDate], [ApproveProcess], [ProjectAccount]) VALUES (N'3', N'臧茜', N'2015-05-06', null, null);
GO
INSERT INTO [dbo].[YearlyBudgetApplies] ([ApplyID], [StaffName], [ApplyDate], [ApproveProcess], [ProjectAccount]) VALUES (N'4', N'臧茜', N'2015-05-06', null, null);
GO
INSERT INTO [dbo].[YearlyBudgetApplies] ([ApplyID], [StaffName], [ApplyDate], [ApproveProcess], [ProjectAccount]) VALUES (N'5', N'臧茜', N'2015-05-06', null, null);
GO
INSERT INTO [dbo].[YearlyBudgetApplies] ([ApplyID], [StaffName], [ApplyDate], [ApproveProcess], [ProjectAccount]) VALUES (N'6', N'臧茜', N'2015-05-06', null, null);
GO
INSERT INTO [dbo].[YearlyBudgetApplies] ([ApplyID], [StaffName], [ApplyDate], [ApproveProcess], [ProjectAccount]) VALUES (N'7', N'吴桂会', N'2015-05-27', null, null);
GO
INSERT INTO [dbo].[YearlyBudgetApplies] ([ApplyID], [StaffName], [ApplyDate], [ApproveProcess], [ProjectAccount]) VALUES (N'8', N'吴桂会', N'2015-05-27', null, null);
GO
INSERT INTO [dbo].[YearlyBudgetApplies] ([ApplyID], [StaffName], [ApplyDate], [ApproveProcess], [ProjectAccount]) VALUES (N'9', N'吴桂会', N'2015-05-27', null, null);
GO
INSERT INTO [dbo].[YearlyBudgetApplies] ([ApplyID], [StaffName], [ApplyDate], [ApproveProcess], [ProjectAccount]) VALUES (N'10', N'籍伟丽', N'2015-05-27', null, null);
GO
INSERT INTO [dbo].[YearlyBudgetApplies] ([ApplyID], [StaffName], [ApplyDate], [ApproveProcess], [ProjectAccount]) VALUES (N'11', N'吴桂会', N'2015-05-27', null, null);
GO
INSERT INTO [dbo].[YearlyBudgetApplies] ([ApplyID], [StaffName], [ApplyDate], [ApproveProcess], [ProjectAccount]) VALUES (N'12', N'臧茜', N'2015-06-05', null, null);
GO
INSERT INTO [dbo].[YearlyBudgetApplies] ([ApplyID], [StaffName], [ApplyDate], [ApproveProcess], [ProjectAccount]) VALUES (N'13', N'臧茜', N'2015-06-05', null, null);
GO
INSERT INTO [dbo].[YearlyBudgetApplies] ([ApplyID], [StaffName], [ApplyDate], [ApproveProcess], [ProjectAccount]) VALUES (N'14', N'臧茜', N'2015-06-05', null, null);
GO
INSERT INTO [dbo].[YearlyBudgetApplies] ([ApplyID], [StaffName], [ApplyDate], [ApproveProcess], [ProjectAccount]) VALUES (N'15', N'臧茜', N'2015-06-05', null, null);
GO
INSERT INTO [dbo].[YearlyBudgetApplies] ([ApplyID], [StaffName], [ApplyDate], [ApproveProcess], [ProjectAccount]) VALUES (N'16', N'臧茜', N'2015-06-06', null, null);
GO
SET IDENTITY_INSERT [dbo].[YearlyBudgetApplies] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[YearlyBudgetSingle]
-- ----------------------------
DROP TABLE [dbo].[YearlyBudgetSingle]
GO
CREATE TABLE [dbo].[YearlyBudgetSingle] (
[RecordID] int NOT NULL IDENTITY(1,1) ,
[ApplyID] int NOT NULL ,
[Year] int NOT NULL ,
[ItemType] nvarchar(20) NOT NULL ,
[ItemDetail] nvarchar(20) NOT NULL ,
[Budget] float(53) NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[YearlyBudgetSingle]', RESEED, 11)
GO

-- ----------------------------
-- Records of YearlyBudgetSingle
-- ----------------------------
SET IDENTITY_INSERT [dbo].[YearlyBudgetSingle] ON
GO
INSERT INTO [dbo].[YearlyBudgetSingle] ([RecordID], [ApplyID], [Year], [ItemType], [ItemDetail], [Budget]) VALUES (N'1', N'2', N'2015', N'专用费', N'设备购置费', N'120000');
GO
INSERT INTO [dbo].[YearlyBudgetSingle] ([RecordID], [ApplyID], [Year], [ItemType], [ItemDetail], [Budget]) VALUES (N'2', N'2', N'2015', N'材料费', N'数据线', N'2000');
GO
INSERT INTO [dbo].[YearlyBudgetSingle] ([RecordID], [ApplyID], [Year], [ItemType], [ItemDetail], [Budget]) VALUES (N'3', N'2', N'2015', N'材料费', N'通讯设备', N'3000');
GO
INSERT INTO [dbo].[YearlyBudgetSingle] ([RecordID], [ApplyID], [Year], [ItemType], [ItemDetail], [Budget]) VALUES (N'4', N'7', N'2015', N'设计费', N'差旅费', N'10000');
GO
INSERT INTO [dbo].[YearlyBudgetSingle] ([RecordID], [ApplyID], [Year], [ItemType], [ItemDetail], [Budget]) VALUES (N'5', N'8', N'2015', N'设计费', N'差旅费', N'10000');
GO
INSERT INTO [dbo].[YearlyBudgetSingle] ([RecordID], [ApplyID], [Year], [ItemType], [ItemDetail], [Budget]) VALUES (N'6', N'9', N'2015', N'设计费', N'差旅费', N'10000');
GO
INSERT INTO [dbo].[YearlyBudgetSingle] ([RecordID], [ApplyID], [Year], [ItemType], [ItemDetail], [Budget]) VALUES (N'7', N'11', N'2015', N'设计费', N'差旅费', N'10000');
GO
INSERT INTO [dbo].[YearlyBudgetSingle] ([RecordID], [ApplyID], [Year], [ItemType], [ItemDetail], [Budget]) VALUES (N'8', N'13', N'2015', N'设计费', N'智慧大鹏', N'50');
GO
INSERT INTO [dbo].[YearlyBudgetSingle] ([RecordID], [ApplyID], [Year], [ItemType], [ItemDetail], [Budget]) VALUES (N'9', N'14', N'2015', N'设计费', N'智慧大鹏', N'50');
GO
INSERT INTO [dbo].[YearlyBudgetSingle] ([RecordID], [ApplyID], [Year], [ItemType], [ItemDetail], [Budget]) VALUES (N'10', N'16', N'2018', N'设计费', N'we', N'232');
GO
INSERT INTO [dbo].[YearlyBudgetSingle] ([RecordID], [ApplyID], [Year], [ItemType], [ItemDetail], [Budget]) VALUES (N'11', N'16', N'2018', N'专用费', N'2323', N'5343');
GO
SET IDENTITY_INSERT [dbo].[YearlyBudgetSingle] OFF
GO

-- ----------------------------
-- Indexes structure for table BusinessUnit
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[BusinessUnit]
-- ----------------------------
ALTER TABLE [dbo].[BusinessUnit] ADD PRIMARY KEY ([UnitID])
GO

-- ----------------------------
-- Indexes structure for table Projects
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[Projects]
-- ----------------------------
ALTER TABLE [dbo].[Projects] ADD PRIMARY KEY ([ProjectCode])
GO

-- ----------------------------
-- Indexes structure for table Users
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[Users]
-- ----------------------------
ALTER TABLE [dbo].[Users] ADD PRIMARY KEY ([UserID])
GO
