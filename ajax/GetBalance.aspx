<%
    Dim GameProvider_WalletBalance As New List(Of Double)()
    Session("Username") = "sidlesss"
    Session("NetworkCode") = "FWMG1T_Test"
    Dim BalObj_MaxFair = Newtonsoft.Json.JsonConvert.DeserializeObject(MaxFair_CheckBalance(Session("Username")))
    Dim BalObj_Aruze = Newtonsoft.Json.JsonConvert.DeserializeObject(Aruze_CheckBalance(Session("Username")))
    Dim BalObj_Wallet = Newtonsoft.Json.JsonConvert.DeserializeObject(Wallet_CheckBalance(Session("Username")))
    'Dim BalObj_Ortiz_Gaming = Newtonsoft.Json.JsonConvert.DeserializeObject(ORTIZ_GAMING_CheckBalance(Session("Username")))
    Dim BalObj_RedThunder = Newtonsoft.Json.JsonConvert.DeserializeObject(RDT_CheckBalance(Session("Username")))

    Dim Bal_Maxfair As Double = BalObj_MaxFair("balance")
    Dim Bal_Aruze As Double = BalObj_Aruze("balance")
    Dim Bal_Wallet As Double = BalObj_Wallet("balance")
    Dim Bal_RedThunder As Double = BalObj_RedThunder("balance")

    If BalObj_MaxFair("result") > 0 Then
        GameProvider_WalletBalance.Add(Bal_Maxfair)
    Else
        GameProvider_WalletBalance.Add(0.0)
    End If

    If BalObj_Aruze("result") > 0 Then
        GameProvider_WalletBalance.Add(Bal_Aruze)
    Else
        GameProvider_WalletBalance.Add(0.0)
    End If

    If BalObj_Wallet("result") > 0 Then
        GameProvider_WalletBalance.Add(Bal_Wallet)
    Else
        GameProvider_WalletBalance.Add(0.0)
    End If

    If BalObj_RedThunder("result") > 0 Then
        GameProvider_WalletBalance.Add(Bal_RedThunder)
    Else
        GameProvider_WalletBalance.Add(0.0)
    End If

    Dim WalletBalance As Double = 0.0

    For Each n In GameProvider_WalletBalance
        WalletBalance += n
    Next

    Response.Write(WalletBalance)
%>
<script runat="server">
    Function MaxFair_CheckBalance(_Username As String) As String
        Dim myRequest As HttpWebRequest
        Dim myResponse As HttpWebResponse = Nothing
        Dim myReader As StreamReader
        Dim address As Uri
        Dim result
        Dim strRequest As String
        Dim network = Session("NetworkCode").ToString()
        Dim splitnetwork = network.Split("_")
        Dim outlet = splitnetwork(0)

        strRequest = ConfigurationSettings.AppSettings("API_MXF_CreateAccount") & "&username=" & _Username & "&outlet=" & outlet & "&cashier=" & outlet & "&pwd=" & ConfigurationSettings.AppSettings("API_MXF_FixedPassword") & "&status=1"

        ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12
        address = New Uri(strRequest)
        myRequest = DirectCast(WebRequest.Create(address), HttpWebRequest)
        myRequest.Method = "POST"
        myRequest.ContentType = "application/json"

        Try
            myResponse = DirectCast(myRequest.GetResponse(), HttpWebResponse)
            myReader = New StreamReader(myResponse.GetResponseStream())
            Dim jsonResult As String = myReader.ReadToEnd()
            Dim regRes_obj = Newtonsoft.Json.JsonConvert.DeserializeObject(jsonResult)
            Dim MXFUser = regRes_obj("name")
            Dim RegSuccess = regRes_obj("success").ToString

            If RegSuccess = True Then
                Dim myRequest2 As HttpWebRequest
                Dim myResponse2 As HttpWebResponse = Nothing
                Dim myReader2 As StreamReader
                Dim address2 As Uri
                Dim strRequest2 As String

                strRequest2 = ConfigurationSettings.AppSettings("API_MXF_BalanceInq") & "&account=" & _Username
                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12
                address2 = New Uri(strRequest2)
                myRequest2 = DirectCast(WebRequest.Create(address2), HttpWebRequest)
                myRequest2.Method = "POST"
                myRequest2.ContentType = "application/json"

                Try
                    myResponse2 = DirectCast(myRequest2.GetResponse(), HttpWebResponse)
                    myReader2 = New StreamReader(myResponse2.GetResponseStream())
                    Dim bal_json_result As String = myReader2.ReadToEnd()

                    If bal_json_result.Contains("""success:false""") Then
                        Dim DepositRes_obj = Newtonsoft.Json.JsonConvert.DeserializeObject(bal_json_result)
                        Dim error_msg = DepositRes_obj("description")
                        result = "{""result"": """ & -2 & """,""err_msg"": ""API Error : """ & error_msg & """ }"
                    Else
                        Dim DepositRes_obj = Newtonsoft.Json.JsonConvert.DeserializeObject(bal_json_result)
                        Dim Balance As Double = DepositRes_obj("balance")
                        result = "{""result"": """ & 1 & """,""balance"": """ & Balance & """ }"
                    End If
                Catch ex As Exception
                    result = "{""result"": """ & -1001 & """,""err_msg"":  ""API Error :" & ex.Message.ToString() & """ }"
                End Try
            Else
                result = "{""result"": """ & -1 & """,""err_msg"": ""API error on authentication, please contact Helpdesk"" }"
            End If
        Catch ex As Exception
            result = "{""result"": """ & -1000 & """,""err_msg"": """ & ex.Message.ToString() & """ }"
        End Try

        Return result
    End Function

    Function Aruze_CheckBalance(_Username As String) As String
        Dim myRequest As HttpWebRequest
        Dim myResponse As HttpWebResponse = Nothing
        Dim myReader As StreamReader
        Dim address As Uri
        Dim result
        Dim strRequest As String
        Dim network = Session("NetworkCode").ToString()
        Dim splitnetwork = network.Split("_")
        Dim outlet = splitnetwork(0)

        strRequest = ConfigurationSettings.AppSettings("API_ARZ_CreateAccount") & "&username=" & _Username & "&outlet=" & outlet & "&cashier=" & outlet & "&pwd=" & ConfigurationSettings.AppSettings("API_ARZ_FixedPassword") & "&status=1"

        ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12
        address = New Uri(strRequest)
        myRequest = DirectCast(WebRequest.Create(address), HttpWebRequest)
        myRequest.Method = "POST"
        myRequest.ContentType = "application/json"

        Try
            myResponse = DirectCast(myRequest.GetResponse(), HttpWebResponse)
            myReader = New StreamReader(myResponse.GetResponseStream())
            Dim jsonResult As String = myReader.ReadToEnd()
            Dim regRes_obj = Newtonsoft.Json.JsonConvert.DeserializeObject(jsonResult)
            Dim MXFUser = regRes_obj("name")
            Dim RegSuccess = regRes_obj("success").ToString

            If RegSuccess = True Then
                Dim myRequest2 As HttpWebRequest
                Dim myResponse2 As HttpWebResponse = Nothing
                Dim myReader2 As StreamReader
                Dim address2 As Uri
                Dim strRequest2 As String

                strRequest2 = ConfigurationSettings.AppSettings("API_ARZ_BalanceInq") & "&account=" & _Username
                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12
                address2 = New Uri(strRequest2)
                myRequest2 = DirectCast(WebRequest.Create(address2), HttpWebRequest)
                myRequest2.Method = "POST"
                myRequest2.ContentType = "application/json"

                Try
                    myResponse2 = DirectCast(myRequest2.GetResponse(), HttpWebResponse)
                    myReader2 = New StreamReader(myResponse2.GetResponseStream())
                    Dim bal_json_result As String = myReader2.ReadToEnd()

                    If bal_json_result.Contains("""success:false""") Then
                        Dim DepositRes_obj = Newtonsoft.Json.JsonConvert.DeserializeObject(bal_json_result)
                        Dim error_msg = DepositRes_obj("description")
                        result = "{""result"": """ & -2 & """,""err_msg"": ""API Error : """ & error_msg & """ }"
                    Else
                        Dim DepositRes_obj = Newtonsoft.Json.JsonConvert.DeserializeObject(bal_json_result)
                        Dim Balance As Double = DepositRes_obj("balance")
                        result = "{""result"": """ & 1 & """,""balance"": """ & Balance & """ }"
                    End If
                Catch ex As Exception
                    result = "{""result"": """ & -1001 & """,""err_msg"":  ""API Error :" & ex.Message.ToString() & """ }"
                End Try
            Else
                result = "{""result"": """ & -1 & """,""err_msg"": ""API error on authentication, please contact Helpdesk"" }"
            End If
        Catch ex As Exception
            result = "{""result"": """ & -1000 & """,""err_msg"": """ & ex.Message.ToString() & """ }"
        End Try

        Return result
    End Function

    Function Wallet_CheckBalance(_Username As String) As String
        Dim myRequest As HttpWebRequest
        Dim myResponse As HttpWebResponse = Nothing
        Dim myReader As StreamReader
        Dim address As Uri
        Dim guidstring As String = Guid.NewGuid().ToString.Replace("-", "").Substring(0, 15)
        Dim strRequest As String
        Dim result

        strRequest = ConfigurationSettings.AppSettings("WALLET_URL") & "/api/v1/wallet/requestBalance" & "?key=" & ConfigurationSettings.AppSettings("WALLET_KEY") & "&accountType=" & 1 & "&accountName=" & _Username
        ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12
        address = New Uri(strRequest)
        myRequest = DirectCast(WebRequest.Create(address), HttpWebRequest)
        myRequest.Method = "GET"
        myRequest.ContentType = "application/json"

        Try
            myResponse = DirectCast(myRequest.GetResponse(), HttpWebResponse)
            myReader = New StreamReader(myResponse.GetResponseStream())
            Dim RefCode As String = myReader.ReadToEnd()
            Dim jsonResult = Newtonsoft.Json.JsonConvert.DeserializeObject(RefCode)

            result = "{""result"": """ & 1 & """,""balance"": """ & jsonResult("data")("accountBalance") & """ }"
        Catch ex As Exception
            result = "{""result"": """ & -9999 & """,""err_msg"": """ & ex.Message.ToString() & """ }"
        End Try

        Return result
    End Function

    Function RDT_CheckBalance(_Username As String) As String
        Dim result
        Dim myRequest1 As HttpWebRequest
        Dim myResponse1 As HttpWebResponse = Nothing
        Dim myReader1 As StreamReader
        Dim address1 As Uri
        Dim strRequest1 As String
        Dim NCode = Session("NetworkCode").ToString()
        Dim OutletID = NCode.Split("_")(0)
        Dim guidstring1 As String = Guid.NewGuid().ToString.Replace("-", "").Substring(0, 15)
        Dim Balance As Double

        strRequest1 = ConfigurationSettings.AppSettings("API_RDT_CreateAccount") & "&account=" & _Username & "&password=" & ConfigurationSettings.AppSettings("API_RDT_Password") & "&outlet=" & OutletID & "&player_type=" & ConfigurationSettings.AppSettings("API_RDT_Player_Type")
        ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12
        address1 = New Uri(strRequest1)
        myRequest1 = DirectCast(WebRequest.Create(address1), HttpWebRequest)
        myRequest1.Method = "POST"
        myRequest1.ContentType = "application/json"
        myRequest1.ContentLength = 0

        Try
            myResponse1 = DirectCast(myRequest1.GetResponse(), HttpWebResponse)
            myReader1 = New StreamReader(myResponse1.GetResponseStream())
            Dim json_res1 As String = myReader1.ReadToEnd()

            Dim jsonResBal = Newtonsoft.Json.JsonConvert.DeserializeObject(RDT_Balance(Session("Username"), guidstring1))

            If jsonResBal("result") > 0 Then
                result = "{""result"": """ & 1 & """,""balance"": """ & jsonResBal("balance") & """ }"
            Else
                result = "{""result"": """ & -1000 & """,""err_msg"": """ & jsonResBal("err_msg") & """ }"
            End If

        Catch ex As WebException
            If ex.Status = WebExceptionStatus.ProtocolError Then
                Dim r As New StreamReader(ex.Response.GetResponseStream)
                Dim jsonResultError As String = r.ReadToEnd()
                Dim rdt_err = Newtonsoft.Json.JsonConvert.DeserializeObject(jsonResultError)

                Dim jsonResBal = Newtonsoft.Json.JsonConvert.DeserializeObject(RDT_Balance(Session("Username"), guidstring1))

                If jsonResBal("result") > 0 Then
                    result = "{""result"": """ & 1 & """,""balance"": """ & jsonResBal("balance") & """ }"
                Else
                    result = "{""result"": """ & -1000 & """,""err_msg"": """ & jsonResBal("err_msg") & """ }"
                End If

            End If
        End Try

        Return result
    End Function

    Function RDT_Balance(_Username As String, _id As String) As String
        Dim myRequest As HttpWebRequest
        Dim myResponse As HttpWebResponse = Nothing
        Dim myReader As StreamReader
        Dim address As Uri
        Dim strRequest As String
        Dim result

        strRequest = ConfigurationSettings.AppSettings("API_RDT_Balance") & "&account=" & _Username & "&auth_id=" & _id & "&player_type=" & ConfigurationSettings.AppSettings("API_RDT_Player_Type")
        ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12
        address = New Uri(strRequest)
        myRequest = DirectCast(WebRequest.Create(address), HttpWebRequest)
        myRequest.Method = "GET"
        myRequest.ContentType = "application/json"
        myRequest.ContentLength = 0

        Try
            myResponse = DirectCast(myRequest.GetResponse(), HttpWebResponse)
            myReader = New StreamReader(myResponse.GetResponseStream())
            Dim json_res As String = myReader.ReadToEnd()

            Dim rdt_res = Newtonsoft.Json.JsonConvert.DeserializeObject(json_res)

            If rdt_res("success") = True Then
                result = "{""result"": """ & 1 & """,""balance"": """ & rdt_res("terminal_balance") & """ }"
            Else
                result = "{""result"": """ & -9999 & """,""err_msg"": """ & "Error upon loading Red Thunder balance. Please contact helpdesk." & """ }"
            End If

        Catch ex As Exception
            result = "{""result"": """ & -1000 & """,""err_msg"":  ""API Error :" & ex.Message.ToString() & """ }"
        End Try

        Return result
    End Function
</script>