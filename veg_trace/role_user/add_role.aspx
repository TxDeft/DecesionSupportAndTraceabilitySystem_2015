<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="add_role.aspx.cs" Inherits="role_user_add_role" Title="添加角色" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%; height: 90%">
        <tr>
            <td align="center" style="width: 25%">
                添加角色：</td>
            <td style="width: 40%">
                <asp:TextBox ID="txt_role" runat="server"></asp:TextBox></td>
            <td style="width: 25%" align="center">
                <asp:Button ID="Button1" runat="server" Text="确定添加" Width="50%" OnClick="Button1_Click" /></td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <asp:Label ID="lb_role" runat="server" Width="60%"></asp:Label></td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <asp:GridView ID="gvRoles" runat="server" AutoGenerateColumns="False" GridLines="None"
                    Height="60%" Width="80%">
                    <Columns>
                        <asp:TemplateField HeaderText="角色名"></asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Container.DataItem.ToString()%>'
                                    OnCommand ="linkbuttonclick"   CommandName="deleterole" ForeColor="#00C000" Height="30%" OnClientClick="return confirm('确定删除该角色吗？')"
                                    Width="25%">删除</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="3" align="center" style="height: 21px">
                <asp:Label ID="lbmessage" runat="server" ForeColor="Red" Width="60%"></asp:Label></td>
        </tr>
    </table>
</asp:Content>