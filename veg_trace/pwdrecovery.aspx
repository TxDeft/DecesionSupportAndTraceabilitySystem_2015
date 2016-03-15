<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pwdrecovery.aspx.cs" Inherits="pwdrecovery" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>取回密码</title>
</head>
<body>
    <form id="form1" runat="server">
        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
            <tr>
                <td style="width: 100%; height :100%" align="center">
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
                        <tr>
                            <td colspan="2" style="height: 20%">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                    <table style="width: 90%; height: 85%">
                        <tr>
                            <td style="width: 100%; height :70%">
                                <asp:PasswordRecovery ID="PasswordRecovery1" runat="server">
                                </asp:PasswordRecovery>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100%" rowspan="2">
                            </td>
                        </tr>
                    </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="height: 10%">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
<iframe  width=100 height=0></iframe>
