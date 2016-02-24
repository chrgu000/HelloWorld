using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

/// <summary>
/// MoneyConvert 的摘要说明
/// 实现小写转换金额为大写金额
/// </summary>
public class MoneyConvert
{
	public MoneyConvert()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    /// <summary>
    /// 将小写金额转换为大写
    /// </summary>
    /// <param name="number"></param>
    /// <returns></returns>
    public static string convertToCapital(string number)
    {
        string result=null;
        string[] words = number.Split('.');
        string decimalPart = null ;
        string integerPart = words[0];

        string firstPart = null ;
        string secondPart = null ;

        if (words.Count() > 1)
        {
            decimalPart=words[1];
            firstPart = convertInteger(integerPart);
            secondPart = convertDecimal(decimalPart);
            result = firstPart + "点" + secondPart+"元";
        }
        else {
            firstPart = convertInteger(integerPart);
            result = firstPart + "元整";
        }
        
        return result;
    }
    /// <summary>
    /// 转换整数部分
    /// </summary>
    /// <param name="integerPart"></param>
    /// <returns></returns>
    private static string convertInteger(string integerPart)
    {
        StringBuilder result = new StringBuilder();
        int group = Convert.ToInt32(Math.Ceiling(integerPart.Length* 1.0 / 4));
        string[] part = new string[group];
        int residue = integerPart.Length % 4;
        int index = 0;
        if (residue != 0)
        {
            part[0] = integerPart.Substring(0, residue);
            integerPart = integerPart.Substring(residue, integerPart.Length - residue);
            ++index;
        }
        
        for (; index < group;++index )
        {            
            part[index] = integerPart.Substring(0,4);
            if(integerPart.Length>4)
                integerPart = integerPart.Substring(4, integerPart.Length-4);
        }
        string[] bitName = { "亿","万",""};
        int bitIndex = 0;
        if (group > 2)
            bitIndex = 0;
        else if (2 == group)
            bitIndex = 1;
        else
            bitIndex = 2;
        for (int i = 0; i < group;++i )
        {
            string temp = ConvertFour(part[i]);
            result.Append(temp);
            result.Append(bitName[bitIndex++]);
        }
        return result.ToString();
    }
    /// <summary>
    ///四位数字一组，完成转换
    /// </summary>
    /// <param name="p"></param>
    /// <returns></returns>
    private static string ConvertFour(string p)
    {
        StringBuilder result=new StringBuilder();
        string[] bitName = { "仟", "佰", "拾", "" };
        int zeroCount = 0;
        int bitIndex = 0;

        bitIndex = 4 - p.Length;
        for (int i=0; i < p.Length; ++i)
        {
            if (p[i] != '0')
            {
                if (zeroCount > 0)
                {
                    result.Append("零");
                    zeroCount = 0;
                }

                result.Append(singleConvert(p[i]));
                result.Append(bitName[bitIndex]);
            }
            else
            {
                ++zeroCount;
            }
            ++bitIndex;
        }
        return result.ToString();
    }
    /// <summary>
    /// 转换小数部分
    /// </summary>
    /// <param name="decimalPart"></param>
    /// <returns></returns>
    private static string convertDecimal(string decimalPart)
    {
        if (null == decimalPart)
            return null;
        StringBuilder result = new StringBuilder();
        foreach(char num in decimalPart)
        {
            result.Append(singleConvert(num)); 
        }
        return result.ToString();
    }
    /// <summary>
    /// 转换单个数字
    /// </summary>
    /// <param name="num"></param>
    /// <returns></returns>
    private static string singleConvert(char num)
    {
        string result = null;
        switch(num)
        {
            case '0': result = "零"; break;
            case '1': result = "壹"; break;
            case '2': result = "贰"; break;
            case '3': result = "叁"; break;
            case '4': result = "肆"; break;
            case '5': result = "伍"; break;
            case '6': result = "陆"; break;
            case '7': result = "柒"; break;
            case '8': result = "捌"; break;
            case '9': result = "玖"; break;
        }
        return result;
    }
}