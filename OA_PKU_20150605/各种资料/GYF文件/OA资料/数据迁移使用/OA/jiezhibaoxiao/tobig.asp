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
numList = "��Ҽ��������½��ƾ�"
rmbList = "�ֽ�Ԫʰ��Ǫ��ʰ��Ǫ��ʰ��Ǫ��"

If num > 9999999999999.99 Then
    rmb = "������Χ�������ֵ"
    Exit Function
End If

numstr = CStr(num * 100)
numLen = Len(numstr)
n = 1
Do While n <= numLen
    numChar = CInt(Mid(numstr, n, 1))
    n1 = Mid(numList, numChar + 1, 1)
    n2 = Mid(rmbList, numLen - n + 1, 1)
    If Not n1 = "��" Then
        hz = hz + CStr(n1) + CStr(n2)
    Else
        If n2 = "��" Or n2 = "��" Or n2 = "Ԫ" Or n1 = "��" Then
            Do While Right(hz, 1) = "��"
            hz = Left(hz, Len(hz) - 1)
            Loop
        End If
        If (n2 = "��" Or (n2 = "��" And Right(hz, 1) <> "��") Or n2 = "Ԫ") Then
            hz = hz + CStr(n2)
        Else
            If Left(Right(hz, 2), 1) = "��" Or Right(hz, 1) <> "��" Then
                hz = hz + n1
            End If
        End If
    End If
    n = n + 1
Loop
Do While Right(hz, 1) = "��"
    hz = Left(hz, Len(hz) - 1)
Loop
If Right(hz, 1) = "Ԫ" Then
    hz = hz + "��"
End If
rmb = hz
End Function

%>
