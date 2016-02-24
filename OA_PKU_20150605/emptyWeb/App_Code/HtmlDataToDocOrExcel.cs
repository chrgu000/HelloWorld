using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;

/// <summary>
/// HtmlDataToDocOrExcel 的摘要说明
/// 用于把网页中的table导出到word或excel
/// http://blog.csdn.net/wang4978/article/details/25876245
/// </summary>
public class HtmlDataToDocOrExcel
{
	public HtmlDataToDocOrExcel()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    private Page _InvokePage;
    /// <summary>  
    /// 调用的页面  
    /// </summary>  
    public Page InvokePage
    {
        get { return _InvokePage; }
        set { _InvokePage = value; }
    }

    /// <summary>  
    /// 构造函数  
    /// </summary>  
    /// <param name="invoke_page">调用的页面，参数传this.Page</param>  
    public HtmlDataToDocOrExcel(Page invoke_page)
    {
        _InvokePage = invoke_page;
    }

    /// <summary>  
    /// Table导出excel  
    /// </summary>  
    /// <param name="tab"></param>  
    /// <param name="fileName"></param> 
    public void TableDataToExcel(System.Web.UI.HtmlControls.HtmlGenericControl tab, string fileName, bool isFireFox)
    {

        if (fileName.ToLower().IndexOf(".xls") == -1)
        {
            fileName = fileName + ".xls";
        }

        TableExport(tab, fileName, "application/ms-excel", isFireFox);
        //TableExport(tab, fileName, "application/vnd.ms-excel.numberformat:+0;-0;0");//Excel文本格式  
    }

    /// <summary>  
    /// Table导出Word  
    /// </summary>  
    /// <param name="tab"></param>  
    /// <param name="fileName"></param>  
    /// <param name="styleText"></param>  
    public void TableDataToWord(System.Web.UI.HtmlControls.HtmlGenericControl tab, string fileName, bool isFireFox)
    {

        if (fileName.ToLower().IndexOf(".doc") == -1)
        {
            fileName = fileName + ".doc";
        }

        TableExport(tab, fileName, "application/ms-word", isFireFox);
    }

    /// <summary>  
    /// 导入数据，保存文档  
    /// </summary>  
    /// <param name="tab"></param>  
    /// <param name="fileName"></param>  
    /// <param name="typeName"></param>  
    /// <param name="styleText"></param>  
    private void TableExport(System.Web.UI.HtmlControls.HtmlGenericControl tab, string fileName, string typeName, bool isFireFox)
    {
        System.Web.HttpResponse httpResponse = _InvokePage.Response;
        httpResponse.Clear();
        httpResponse.Buffer = true;

        httpResponse.Charset = "gb2312";// "GB2312";  
        //Response.Charset = "UTF-8";  
        httpResponse.Write("<meta http-equiv=Content-Type content=text/html;charset=gb2312>");

        if (isFireFox == true)
        {
            fileName = "\"" + fileName + "\"";
            httpResponse.AppendHeader("Content-Disposition", "attachment;filename=" + fileName);
        }
        else
        {
            httpResponse.AppendHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(fileName, System.Text.Encoding.UTF8).ToString());
        }

        httpResponse.ContentEncoding = System.Text.Encoding.GetEncoding("gb2312");
        httpResponse.ContentType = typeName;
        _InvokePage.EnableViewState = false;
        StringWriter tw = new StringWriter();
        System.Web.UI.HtmlTextWriter hw = new System.Web.UI.HtmlTextWriter(tw);
        tab.RenderControl(hw);
        // httpResponse.Write(styleText);  
        httpResponse.Write(tw.ToString());
        httpResponse.End();
    }
    //调用
    private void test()
    {
        //string fileName = "测试-20130231.xls";
        //bool isFireFox = false;
        //if (Request.ServerVariables["http_user_agent"].ToLower().IndexOf("firefox") != -1)
        //{
        //    isFireFox = true;
        //}
        ////styleText=@"<style> td { mso-number-format:'+0.00;-0.00;0.00';text-align: center; } </style> ";  
        //HtmlDataToDocOrExcel hdtd = new HtmlDataToDocOrExcel(this.Page);

        //hdtd.TableDataToWord(test, fileName);//导出world  
    }

}