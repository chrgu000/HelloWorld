using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_VerifyCode : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this._random = new Random();
            this._code = GetRandomCode();
            Session["VerifyCode"] = this._code;
            this.SetPageNoCache();
            this.OnPaint();
        }
    }
    private void OnPaint()
    {
        Bitmap objBitmap = null;
        Graphics g = null;
        try
        {
            objBitmap = new Bitmap(Width, Height);
            g = Graphics.FromImage(objBitmap);
            SetBrush();
            Paint_Background(g);
            Paint_Text(g);
            Paint_TextStain(objBitmap);
            Paint_Border(g);
            objBitmap.Save(Response.OutputStream, ImageFormat.Gif);
            Response.ContentType = "image/gif";
        }
        catch { }
        finally
        {
            if (objBitmap != null)
                objBitmap.Dispose();
            if (g != null)
                g.Dispose();
        }
    }

    private void SetPageNoCache()
    {
        Response.Buffer = true;
        Response.ExpiresAbsolute = System.DateTime.Now.AddSeconds(-1);
        Response.Expires = 0;
        Response.CacheControl = "no-cache";
        Response.AppendHeader("Pragma", "No-Cache");
    }

    private string GetRandomCode()
    {
        return Guid.NewGuid().ToString().Substring(0, 4);
    }

    private Font GetFont()
    {
        int fontIndex = _random.Next(0, FontItems.Length);
        FontStyle fontStyle = GetFontStyle(_random.Next(0, 4));
        return new Font(FontItems[fontIndex], 12, fontStyle);
    }

    private FontStyle GetFontStyle(int index)
    {
        switch (index)
        {
            case 0:
                return FontStyle.Bold;
            case 1:
                return FontStyle.Italic;
            case 2:
                return FontStyle.Bold | FontStyle.Italic;
            default:
                return FontStyle.Regular;
        }
    }

    private void SetBrush()
    {
        _brushIndex = _random.Next(0, BrushItems.Length);
    }

    private void Paint_Background(Graphics g)
    {
        g.Clear(BackColor);
    }

    private void Paint_Border(Graphics g)
    {
        g.DrawRectangle(BorderColor, 0, 0, Width - 1, Height - 1);
    }

    private void Paint_Text(Graphics g)
    {
        g.DrawString(_code, GetFont(), BrushItems[_brushIndex], 1, 1);
    }

    private void Paint_TextStain(Bitmap b)
    {
        for (int i = 0; i < 30; i++)
        {
            int x = _random.Next(Width);
            int y = _random.Next(Height);
            b.SetPixel(x, y, Color.FromName(BrushName[_brushIndex]));
        }
    }

    private static string[] FontItems = new string[] { "Arial", "Helvetica", "Geneva", "Verdana" };
    private static Brush[] BrushItems = new Brush[] { Brushes.OliveDrab, Brushes.ForestGreen, Brushes.DarkCyan, Brushes.LightSlateGray, Brushes.RoyalBlue, Brushes.SlateBlue, Brushes.DarkViolet, Brushes.MediumVioletRed, Brushes.IndianRed, Brushes.Firebrick, Brushes.Chocolate, Brushes.Peru, Brushes.Goldenrod };
    private static string[] BrushName = new string[] { "OliveDrab", "ForestGreen", "DarkCyan", "LightSlateGray", "RoyalBlue", "SlateBlue", "DarkViolet", "MediumVioletRed", "IndianRed", "Firebrick", "Chocolate", "Peru", "Goldenrod" };

    private static Color BackColor = Color.White;
    private static Pen BorderColor = Pens.DarkGray;
    private static int Width = 50;
    private static int Height = 20;

    private Random _random;
    private string _code;
    private int _brushIndex;
}