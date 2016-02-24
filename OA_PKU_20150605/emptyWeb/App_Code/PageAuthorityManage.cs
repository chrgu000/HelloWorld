using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// 管理不同角色用户对不同页面的操作权限，注意：部分页面内也需要权限管理，比如部门经理只能查看本部门的相关信息
/// </summary>
public class PageAuthorityManage
{
	public PageAuthorityManage()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//        
	}
    /// <summary>
    /// 判断当前用户对本页面是否有访问权限
    /// </summary>
    /// <param name="bi"></param>
    /// <param name="pageName"></param>
    /// <returns></returns>
    public static bool hasAuthority(BasicInfo bi, string pageName)
    {
        bool result = false;

        switch (bi.Position.Trim())
        {
            case "员工": result = staffPage(pageName); break;
            case "项目经理": result = projectManagerPage(pageName); break;
            case "部门经理": result = departmentManagerPage(pageName); break;
            case "综管经理": result = integrativeManagerPage(pageName); break;
            case "财务主管": result = financeSupervisorPage(pageName); break;
            case "机构负责人": result = institutionInChargePage(pageName); break;
            case "管委会负责人": result = managementCouncilPage(pageName); break;

            case "会计": result = accountantPage(pageName); break;
            case "出纳": result = cashierPage(pageName); break;
            
        }
        return result;
    }

    private static bool cashierPage(string pageName)
    {
        bool result = false;
        switch (pageName)
        {
            case "角色管理":
            case "组织管理":
            case "用户管理":
            case "收支一览":
            case "工资表":
            //以下都可以填写
            case "费用报销":
            case "固定资产申购":
            case "固定资产报修":
            case "出差申请":
            case "出差报销":
            case "出差总结":
            case "转正申请":
            case "加班申请":
            case "调休申请":
            case "请假":
            case "离职申请":
            case "资金使用审批":
            case "合同审批":
            case "宴请申请":
            case "员工用餐申请":
            case "统一结算申请":
            case "车辆使用登记": result = true; break;
        }
        return result;
    }

    private static bool accountantPage(string pageName)
    {
        bool result = false;

        switch (pageName)
        {
            case "角色管理":
            case "组织管理":
            case "用户管理":
            case "收支一览":
            case "工资表":
            //以下都可以填写
            case "费用报销":
            case "固定资产申购":
            case "固定资产报修":
            case "出差申请":
            case "出差报销":
            case "出差总结":
            case "转正申请":
            case "加班申请":
            case "调休申请":
            case "请假":
            case "离职申请":
            case "资金使用审批":
            case "合同审批":
            case "宴请申请":
            case "员工用餐申请":
            case "统一结算申请":
            case "车辆使用登记": result = true; break;
        }
        return result;
    }

    private static bool managementCouncilPage(string pageName)
    {
        bool result = false;

        switch (pageName)
        {
            case "角色管理":
            case "组织管理":
            case "用户管理":
            case "收支一览":
            case "工资表":
            //以下都可以填写
            case "费用报销":
            case "固定资产申购":
            case "固定资产报修":
            case "出差申请":
            case "出差报销":
            case "出差总结":
            case "转正申请":
            case "加班申请":
            case "调休申请":
            case "请假":
            case "离职申请":
            case "资金使用审批":
            case "合同审批":
            case "宴请申请":
            case "员工用餐申请":
            case "统一结算申请":
            case "车辆使用登记": result = true; break;
        }
        return result;
    }

    private static bool institutionInChargePage(string pageName)
    {
        bool result = false;

        switch (pageName)
        {
            case "角色管理":
            case "组织管理":
            case "用户管理":
            case "收支一览":
            //以下都可以填写
            case "费用报销":
            case "固定资产申购":
            case "固定资产报修":
            case "出差申请":
            case "出差报销":
            case "出差总结":
            case "转正申请":
            case "加班申请":
            case "调休申请":
            case "请假":
            case "离职申请":
            case "资金使用审批":
            case "合同审批":
            case "宴请申请":
            case "员工用餐申请":
            case "统一结算申请":
            case "车辆使用登记": result = true; break;
        }
        return result;
    }

    private static bool financeSupervisorPage(string pageName)
    {
        bool result = false;

        switch (pageName)
        {
            case "角色管理":
            case "组织管理":
            case "用户管理":
            case "收支一览":
            case "工资表":
            case "新建项目":
                //以下都可以填写
            case "费用报销":
            case "固定资产申购":
            case "固定资产报修":
            case "到款分配":
            case "出差申请":
            case "出差报销":
            case "出差总结":
            case "转正申请":
            case "加班申请":
            case "调休申请":
            case "请假":
            case "离职申请":
            case "资金使用审批":
            case "合同审批":
            case "宴请申请":
            case "员工用餐申请":
            case "统一结算申请":
            case "车辆使用登记": result = true; break;
        }
        return result;
    }

    private static bool integrativeManagerPage(string pageName)
    {
        bool result = false;

        switch (pageName)
        {
            case "收支一览":
            case "考勤表":
            case "费用报销":
            case "固定资产申购":
            case "固定资产报修":
            case "出差申请":
            case "出差报销":
            case "出差总结":
            case "转正申请":
            case "加班申请":
            case "调休申请":
            case "请假":
            case "离职申请":
            case "资金使用审批":
            case "合同审批":
            case "宴请申请":
            case "员工用餐申请":
            case "统一结算申请":
            case "车辆使用登记": result = true; break;
        }
        return result;
    }

    private static bool departmentManagerPage(string pageName)
    {
        bool result = false;

        switch (pageName)
        {
            case "年度非项目成本概算":
            case "收支一览":
            case "考勤表":
            case "费用报销":
            case "固定资产申购":
            case "固定资产报修":
            case "出差申请":
            case "出差报销":
            case "出差总结":
            case "转正申请":
            case "加班申请":
            case "调休申请":
            case "请假":
            case "离职申请":
            case "资金使用审批":
            case "合同审批":
            case "宴请申请":
            case "员工用餐申请":
            case "统一结算申请":
            case "车辆使用登记": result = true; break;
        }
        return result;
    }

    private static bool projectManagerPage(string pageName)
    {
        bool result = false;

        switch (pageName)
        {
            case "年度项目成本概算":
            case "年度非项目成本概算":
            case "项目预算":
            case "到款分配":
            case "收支一览":
                //以下都有权限填写
            case "费用报销":
            case "固定资产申购":
            case "固定资产报修":
            case "出差申请":
            case "出差报销":
            case "出差总结":
            case "转正申请":
            case "加班申请":
            case "调休申请":
            case "请假":
            case "离职申请":
            case "资金使用审批":
            case "合同审批":
            case "宴请申请":
            case "员工用餐申请":
            case "统一结算申请":
            case "车辆使用登记":result = true; break;
        }
        return result;
    }

    private static bool staffPage(string pageName)
    {
        bool result = false;

        switch(pageName)
        {
            case "费用报销":
            case "固定资产申购":
            case "固定资产报修":
            case "出差申请": 
            case "出差报销": 
            case "出差总结":
            case "转正申请":
            case "加班申请": 
            case "调休申请": 
            case "请假": 
            case "离职申请":
            case "资金使用审批":
            case "合同审批":
            case "宴请申请":
            case "员工用餐申请":            
            case "统一结算申请":
            case "车辆使用登记": result = true; break;
        }
        return result;
    }











}