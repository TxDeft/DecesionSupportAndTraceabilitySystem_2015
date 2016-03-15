<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="pwd_manage.aspx.cs" Inherits="longined_pwd_manage" Title="密码修改" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 110%; height: 120%">
        <tr>
            <td colspan="3">
            </td>
        </tr>
        <tr>
            <td align="left" colspan="3">
                <asp:ChangePassword ID="ChangePassword1" runat="server" Width="100%" Height="100%" BackColor="#E3EAEB" BorderColor="#E6E2D8" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em">
                    <SuccessTemplate>
                        <table border="0" cellpadding="1" cellspacing="0" style="border-collapse: collapse">
                            <tr>
                                <td style="width: 60%; height: 70%">
                                    <table border="0" cellpadding="0" style="width: 80%; height: 70%">
                                        <tr>
                                            <td align="center" colspan="2">
                                                密码更改完成</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                您的密码已更改!</td>
                                        </tr>
                                        <tr>
                                            <td align="right" colspan="2">
                                                <asp:Button ID="ContinuePushButton" runat="server" CausesValidation="False" CommandName="Continue"
                                                    Text="继续" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </SuccessTemplate>
                    <CancelButtonStyle BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid" BorderWidth="1px"
                        Font-Names="Verdana" Font-Size="0.8em" ForeColor="#1C5E55" />
                    <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                    <PasswordHintStyle Font-Italic="True" ForeColor="#1C5E55" />
                    <ChangePasswordButtonStyle BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid"
                        BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#1C5E55" />
                    <ContinueButtonStyle BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid"
                        BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#1C5E55" />
                    <TitleTextStyle BackColor="#1C5E55" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
                    <TextBoxStyle Font-Size="0.8em" />
                </asp:ChangePassword>
            </td>
        </tr>
        <tr>
            <td colspan="3">
            </td>
        </tr>
    </table>
</asp:Content>

