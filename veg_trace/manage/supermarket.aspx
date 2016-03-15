<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="supermarket.aspx.cs" Inherits="manage_supermaket" Title="超市管理" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style=" width: 100%; height: 60%;">
        <tr>
            <td style="height: 15%;" colspan="2">
                选择超市：<asp:DropDownList ID="ddl1" runat="server" Width="30%" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="super_name" DataValueField="super_name" OnDataBound="ddl1_DataBound"  >
                </asp:DropDownList>&nbsp;
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>" SelectCommand="SELECT DISTINCT [super_name] FROM [supermarket]"></asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" Height="94%" Width="98%" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateColumns="False" DataKeyNames="super_name" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="super_name" HeaderText="超市名称" ReadOnly="True" SortExpression="super_name" />
                        <asp:BoundField DataField="sup_address" HeaderText="超市地址" SortExpression="sup_address" />
                        <asp:BoundField DataField="sup_tel" HeaderText="联系电话" SortExpression="sup_tel" />
                        <asp:BoundField DataField="super" HeaderText="超市代号" SortExpression="super" />
                    </Columns>
                    <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                &nbsp; &nbsp;&nbsp;&nbsp;
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues"
                    ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                    DeleteCommand="DELETE FROM supermarket WHERE (super_name = @original_super_name) AND (sup_address = @original_sup_address) AND (sup_tel = @original_sup_tel) AND (super = @original_super)"
                    InsertCommand="INSERT INTO supermarket(super_name, sup_address, sup_tel, super) VALUES (@super_name, @sup_address, @sup_tel, @super)"
                    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT super_name, sup_address, sup_tel, super FROM supermarket WHERE (@super_name IS NULL) OR (super_name = @super_name)"
                    UpdateCommand="UPDATE supermarket SET sup_address = @sup_address, sup_tel = @sup_tel, super = @super WHERE (super_name = @original_super_name) AND (sup_address = @original_sup_address) AND (sup_tel = @original_sup_tel) AND (super = @original_super)" CancelSelectOnNullParameter="False">
                    <DeleteParameters>
                        <asp:Parameter Name="original_super_name" Type="String" />
                        <asp:Parameter Name="original_sup_address" Type="String" />
                        <asp:Parameter Name="original_sup_tel" Type="String" />
                        <asp:Parameter Name="original_super" Type="String" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="sup_address" Type="String" />
                        <asp:Parameter Name="sup_tel" Type="String" />
                        <asp:Parameter Name="super" Type="String" />
                        <asp:Parameter Name="original_super_name" Type="String" />
                        <asp:Parameter Name="original_sup_address" Type="String" />
                        <asp:Parameter Name="original_sup_tel" Type="String" />
                        <asp:Parameter Name="original_super" Type="String" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="super_name" Type="String" />
                        <asp:Parameter Name="sup_address" Type="String" />
                        <asp:Parameter Name="sup_tel" Type="String" />
                        <asp:Parameter Name="super" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddl1" Name="super_name" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <table style ="width :100%; height :20%;">
        <tr>
            <td style="width: 100%; height: 25%;">
            </td>
        </tr>
        <tr>
            <td style="width: 100%; height: 75%;">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="super_name" DataSourceID="SqlDataSource2"
                    Height="95%" Width="44%" CellPadding="4" ForeColor="#333333">
                    <EditItemTemplate><table border="2" style="width: 360px">
                        <tr>
                            <td style="width: 160px">
                                超市名称:
                            </td>
                            <td style="width: 200px">
                        <asp:Label ID="super_nameLabel1" runat="server" Text='<%# Eval("super_name") %>'>
                        </asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                        超市位置:&nbsp;
                            </td>
                            <td style="width: 200px">
                        <asp:TextBox ID="sup_addressTextBox" runat="server" Text='<%# Bind("sup_address") %>' Width="117px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="sup_addressTextBox"
                            ErrorMessage="超市地址不能为空" ValidationGroup="tishi">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                                超市电话:&nbsp;</td>
                            <td style="width: 200px">
                        <asp:TextBox ID="sup_telTextBox" runat="server" Text='<%# Bind("sup_tel") %>' Width="118px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="sup_telTextBox"
                            ErrorMessage="超市电话不能为空" ValidationGroup="tishi">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                                超市代码:
                            </td>
                            <td style="width: 200px">
                        <asp:TextBox ID="superTextBox" runat="server" Text='<%# Bind("super") %>' Width="119px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="superTextBox"
                            ErrorMessage="超市代码不能为空" ValidationGroup="tishi">*</asp:RequiredFieldValidator></td>
                        </tr>
                    </table>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="带*的文本框不能为空："
                            ShowMessageBox="True" ShowSummary="False" ValidationGroup="tishi" />
                        <br />
                        <table border="0">
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="更新" ValidationGroup="tishi"></asp:LinkButton></td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="取消">
                        </asp:LinkButton></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                        </table>
                    </EditItemTemplate>
                    <InsertItemTemplate><table border="2" style="width: 360px">
                        <tr>
                            <td style="width: 160px">
                                超市名称:</td>
                            <td style="width: 200px">
                        <asp:TextBox ID="super_nameTextBox" runat="server" Text='<%# Bind("super_name") %>' Width="120px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="super_nameTextBox"
                            ErrorMessage="超市名称不能为空" ValidationGroup="tishi">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                                超市地址:
                            </td>
                            <td style="width: 200px">
                        <asp:TextBox ID="sup_addressTextBox" runat="server" Text='<%# Bind("sup_address") %>' Width="120px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="sup_addressTextBox"
                            ErrorMessage="超市地址不能为空" ValidationGroup="tishi">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                                超市电话:
                            </td>
                            <td style="width: 200px">
                        <asp:TextBox ID="sup_telTextBox" runat="server" Text='<%# Bind("sup_tel") %>' Width="120px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="sup_telTextBox"
                            ErrorMessage="超市电话不能为空" ValidationGroup="tishi">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                                超市代码:
                            </td>
                            <td style="width: 200px">
                        <asp:TextBox ID="superTextBox" runat="server" Text='<%# Bind("super") %>' Width="120px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="superTextBox"
                            ErrorMessage="超市代码不能为空" ValidationGroup="tishi">*</asp:RequiredFieldValidator></td>
                        </tr>
                    </table>
                        <asp:ValidationSummary ID="ValidationSummary2" runat="server" HeaderText="带*的文本框不能为空："
                            ShowMessageBox="True" ShowSummary="False" ValidationGroup="tishi" />
                        <br />
                        <table border="0">
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="插入" ValidationGroup="tishi"></asp:LinkButton></td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="取消">
                        </asp:LinkButton></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                        </table>
                        &nbsp;
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <table border="2" style="width: 360px">
                            <tr>
                                <td style="width: 160px">
                                    超市名称:
                                </td>
                                <td style="width: 200px">
                        <asp:Label ID="super_nameLabel" runat="server" Text='<%# Eval("super_name") %>'>
                        </asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    超市地址:
                                </td>
                                <td style="width: 200px">
                        <asp:Label ID="sup_addressLabel" runat="server" Text='<%# Bind("sup_address") %>'>
                        </asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    超市电话:
                                </td>
                                <td style="width: 200px">
                        <asp:Label ID="sup_telLabel" runat="server" Text='<%# Bind("sup_tel") %>'></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    超市代码:
                                    <br />
                                </td>
                                <td style="width: 200px">
                        <asp:Label ID="superLabel" runat="server" Text='<%# Bind("super") %>'></asp:Label></td>
                            </tr>
                        </table>
                        <br />
                        <table border="0">
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="编辑">
                        </asp:LinkButton></td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete"
                            Text="删除" OnClientClick="return confirm('确定删除这条数据？')"></asp:LinkButton></td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="新建">
                        </asp:LinkButton></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                    <EditRowStyle BackColor="#999999" />
                    <RowStyle ForeColor="#333333" BackColor="#F7F6F3" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderTemplate>
                        &nbsp;&nbsp;
                选择的超市信息：<br />
                    </HeaderTemplate>
                </asp:FormView>
                &nbsp;&nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
