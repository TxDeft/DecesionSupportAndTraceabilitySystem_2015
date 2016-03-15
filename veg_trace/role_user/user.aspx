<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="user.aspx.cs" Inherits="role_user_user" Title="用户管理" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 478px; height: 378px">
        <tr>
            <td align="center" colspan="3">
                <asp:GridView ID="gvUser" runat="server" Width="70%" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField HeaderText="用户名">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" ForeColor="black" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"UserName") %>'
                                    CommandName="addrole"  OnCommand ="linkbuttonclick" ForeColor=" blue" Text="添加角色"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3" rowspan="2">
                <asp:Panel ID="pllistrole" runat="server" Height="50%" Width="70%" Visible="False">
                    <asp:GridView ID="gvRole" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:TemplateField HeaderText="角色名">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text="<%# Container.DataItem.ToString() %>"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="是否分配">
                                <ItemTemplate>
                                    <asp:CheckBox ID="cbaddRoletoUser" runat="server" AutoPostBack=" true" ForeColor=" blue"
                                         OnCheckedChanged ="addroletousercheckbox_click"  ToolTip="<%# Container.DataItem.ToString() %>" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                </asp:GridView>
                </asp:Panel>
                <asp:Label ID="lbMessage" runat="server" ForeColor="Red" Width="70%"></asp:Label>
                &nbsp;
            </td>
        </tr>
        <tr>
        </tr>
        <tr>
            <td align="right" colspan="3" rowspan="1">
                <asp:LinkButton ID="LinkButton1" runat="server" Width="10%" PostBackUrl="~/role_user/role.aspx">返回</asp:LinkButton></td>
        </tr>
    </table>
</asp:Content>
