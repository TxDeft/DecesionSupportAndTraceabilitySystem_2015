<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="role.aspx.cs" Inherits="role_user_role" Title="角色管理" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
        <tr>
            <td colspan="2" style="height: 100%; width: 92%;">
         
                <table style="width: 100%; height: 50%">
                    <tr>
                        <td align="center"  style="height: 80%;" colspan="2">
                            <asp:GridView ID="gvUserList" runat="server" Height="90%" Width="90%" AutoGenerateColumns="False" GridLines="None" >
                                <Columns>
                                    <asp:TemplateField HeaderText="用户名">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" ForeColor="black" Text='<%#DataBinder.Eval(Container.DataItem,"UserName")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="启用">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%#DataBinder.Eval(Container.DataItem,"IsApproved") %>'
                                                ForeColor=" blue " ToolTip='<%#DataBinder.Eval(Container.DataItem,"UserName")%>' AutoPostBack="True"  OnCheckedChanged ="CheckBox_Click" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server"  OnCommand ="linkbuttonclick" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"UserName")%>'
                                                CommandName="edituser" ForeColor=" blue " Text="编辑"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton2" runat="server"  OnCommand ="linkbuttonclick"  CommandArgument='<%# DataBinder.Eval(Container.DataItem,"UserName")%>'
                                                CommandName="deleteuser" ForeColor="blue" OnClientClick="return confirm('确定删除该用户吗?') "
                                                Text="删除"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField></asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:Label ID="lbMessage" runat="server" ForeColor="Blue" Height="15%" Width="30%"></asp:Label>
                          </td>
                    </tr>
                </table>
                <table style="width: 70%; height: 50%; border-top-style: groove; border-right-style: groove; border-left-style: groove; border-bottom-style: groove;">
                    <tr>
                        <td align="center" colspan="2">
                           创建新用户</td>
                    </tr>
                    <tr>
                        <td style="width: 40%" align="right">
                            用户名：</td>
                        <td style="width: 50%" align="left">
                            <asp:TextBox ID="txt_name" runat="server" Width="50%"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width: 40%" align="right">
                            密码：</td>
                        <td style="width: 50%" align="left">
                            <asp:TextBox ID="txt_pwd" runat="server" Width="50%" TextMode="Password"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="right" colspan="2">
                            <asp:Label ID="Label3" runat="server" ForeColor="Red" Height="10%" Text="密码至少七位，并且要包含！@#等字符"
                                Width="90%"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 40%" align="right">
                            密码验证：</td>
                        <td style="width: 50%" align="left">
                            <asp:TextBox ID="txt_2" runat="server" Width="50%" TextMode="Password"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width: 40%" align="right">
                        </td>
                        <td style="width: 50%" align="left">
                            <asp:Label ID="Label1" runat="server" Width="80%"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 40%" align="right">
                            &nbsp;Emial：</td>
                        <td style="width: 50%" align="left">
                            <asp:TextBox ID="txt_email" runat="server" Width="50%"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width: 40%" align="right">
                            密码问题：</td>
                        <td style="width: 50%" align="left">
                            <asp:TextBox ID="txt_pwdquestion" runat="server" Width="50%"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width: 40%" align="right">
                            密码答案：</td>
                        <td style="width: 50%" align="left">
                            <asp:TextBox
                                ID="txt_pwdanswer" runat="server" Width="50%"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width: 40%" align="right">
                            <asp:Label ID="lblUserCreateMessage" runat="server" ForeColor="Red" Visible="False"
                                Width="70%"></asp:Label></td>
                        <td style="width: 50%" align="center">
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="确定添加" Width="40%" /></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

