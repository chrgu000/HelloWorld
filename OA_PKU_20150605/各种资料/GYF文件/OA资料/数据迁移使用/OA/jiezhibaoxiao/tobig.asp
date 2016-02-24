<%
Function rmb(num)

num = FormatNumber(num, 2)
Dim numList 
Dim rmbList 
Dim numLen
Dim numChar
Dim numstr
Dim n 
Dim n1, n2 
Dim hz
numList = "零壹贰叁肆伍陆柒捌玖"
rmbList = "分角元拾佰仟万拾佰仟亿拾佰仟万"

If num > 9999999999999.99 Then
    rmb = "超出范围的人民币值"
    Exit Function
End If

numstr = CStr(num * 100)
numLen = Len(numstr)
n = 1
Do While n <= numLen
    numChar = CInt(Mid(numstr, n, 1))
    n1 = Mid(numList, numChar + 1, 1)
    n2 = Mid(rmbList, numLen - n + 1, 1)
    If Not n1 = "零" Then
        hz = hz + CStr(n1) + CStr(n2)
    Else
        If n2 = "亿" Or n2 = "万" Or n2 = "元" Or n1 = "零" Then
            Do While Right(hz, 1) = "零"
            hz = Left(hz, Len(hz) - 1)
            Loop
        End If
        If (n2 = "亿" Or (n2 = "万" And Right(hz, 1) <> "亿") Or n2 = "元") Then
            hz = hz + CStr(n2)
        Else
            If Left(Right(hz, 2), 1) = "零" Or Right(hz, 1) <> "亿" Then
                hz = hz + n1
            End If
        End If
    End If
    n = n + 1
Loop
Do While Right(hz, 1) = "零"
    hz = Left(hz, Len(hz) - 1)
Loop
If Right(hz, 1) = "元" Then
    hz = hz + "整"
End If
rmb = hz
End Function

%>
