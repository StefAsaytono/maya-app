<% 
    Dim ws As New fastwin_lucky_games.WebReference.InstawinWebService
    Dim ds As New Data.DataSet
    Dim dt As New Data.DataTable
    Dim SupplierID As Integer
    Dim BranchCode As String = "ID$0"
    Dim DateFrom As DateTime
    Dim DateTo As DateTime
    Dim Result
    SupplierID = 0

    Dim params As String = Request.Form("data")
    Dim dataConvert = Decrypt(params)
    Dim resultSplit = dataConvert.ToString().Split("&")
    Dim DateFrom2 = resultSplit(0).ToString().Split("=")
    Dim DateTo2 = resultSplit(1).ToString().Split("=")

    DateFrom = DateFrom2(1)
    DateTo = DateTo2(1)
    Session("Username") = "sidlesss"

    Try
        ds = ws.GetWebAllDeposits_Per_Game_2_MAP_Player(SupplierID, BranchCode, DateFrom, DateTo, 0, Session("Username"), ConfigurationSettings.AppSettings("APP_KEY"))
        dt = ds.Tables(0)
        For i As Integer = 0 To dt.Rows.Count - 1
            Dim row As Data.DataRow = dt.Rows(i)
            Result = Result & row.Item("NetworkCode") & "$" &
            row.Item("SupplierName") & "$" &
            row.Item("DateCreated") & "$" &
            row.Item("TerminalAccount") & "$" &
            row.Item("Amount") & "$" &
            row.Item("GuestName") & "$" &
            row.Item("IsCashIn") & "$" &
            row.Item("IsPosted") & "$" &
            row.Item("TranSource") & "$" &
            row.Item("TranMode") & "%"
        Next
        dt.Clear()
        dt.Dispose()
        ds.Clear()
        ds.Dispose()
        ws.Dispose()

    Catch ex As Exception
        Result = ex.Message.ToString()
    End Try

    Response.Write(Result)
%>

<script runat="server">
    Function Decrypt(cipherText As String) As String
        Dim keybytes = Encoding.UTF8.GetBytes("8080808080808080")
        Dim iv = Encoding.UTF8.GetBytes("8080808080808080")
        Dim cipherBytes As Byte() = Convert.FromBase64String(cipherText)
        Dim decriptedFromJavascript = DecryptStringFromBytes(cipherBytes, keybytes, iv)

        Return decriptedFromJavascript
    End Function

    Function DecryptStringFromBytes(cipherText As Byte(), key As Byte(), iv As Byte()) As String
        Dim decrypted As String
        Using rijAlg = New RijndaelManaged()
            rijAlg.Mode = CipherMode.CBC
            rijAlg.Padding = PaddingMode.PKCS7
            rijAlg.FeedbackSize = 128
            rijAlg.Key = key
            rijAlg.IV = iv
            Dim decryptor = rijAlg.CreateDecryptor(rijAlg.Key, rijAlg.IV)
            Try
                Using msDecrypt As New MemoryStream(cipherText)
                    Using csDecrypt = New CryptoStream(msDecrypt, decryptor, CryptoStreamMode.Read)
                        Using srDecrypt = New StreamReader(csDecrypt)
                            decrypted = srDecrypt.ReadToEnd()
                        End Using
                    End Using
                End Using
            Catch ex As Exception
                decrypted = -1
            End Try
        End Using

        Return decrypted
    End Function
</script>