<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="farmer.aspx.cs" Inherits="manage_farmer" Title="农户管理" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%; height :80%;">
        <tr>
            <td style="height: 15%;" colspan="2">
                &nbsp;选择种植户：<asp:DropDownList ID="ddl1" runat="server" DataSourceID="SqlDataSource1"
                    DataTextField="farmer_name" DataValueField="farmer_name" Width="30%" AutoPostBack="True" OnDataBound="ddl1_DataBound" AppendDataBoundItems="True" >
                </asp:DropDownList>&nbsp;
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>" SelectCommand="SELECT DISTINCT [farmer_name] FROM [farmer]"></asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="farmer_id" Height="85%" Width="95%" AllowSorting="True" 
                    AutoGenerateSelectButton="True" 
                    OnSelectedIndexChanged="GridView1_SelectedIndexChanged" 
                    DataSourceID="SqlDataSource2" AllowPaging="True" CellPadding="3" 
                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                    EnableModelValidation="True">
                    <Columns>
                        <asp:BoundField DataField="farmer_id" HeaderText="farmer_id" ReadOnly="True" SortExpression="farmer_id" />
                        <asp:BoundField DataField="farmer_name" HeaderText="种植户" SortExpression="farmer_name" />
                        <asp:BoundField DataField="tel" HeaderText="联系电话" SortExpression="tel" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                &nbsp;&nbsp;&nbsp;<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues"
                    ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                    DeleteCommand="DELETE FROM [farmer] WHERE [farmer_id] = @original_farmer_id AND [farmer_name] = @original_farmer_name AND [tel] = @original_tel"
                    InsertCommand="INSERT INTO [farmer] ([farmer_id], [farmer_name], [tel]) VALUES (@farmer_id, @farmer_name, @tel)"
                    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT farmer_id, farmer_name, tel FROM farmer WHERE (@farmer_name IS NULL) OR (farmer_name = @farmer_name)"
                    
                    UpdateCommand="UPDATE farmer SET farmer_name = @farmer_name, tel = @tel WHERE (farmer_id = @original_farmer_id) AND (farmer_name = @original_farmer_name) AND (tel = @original_tel)" 
                    CancelSelectOnNullParameter="False">
                    <DeleteParameters>
                        <asp:Parameter Name="original_farmer_id" Type="String" />
                        <asp:Parameter Name="original_farmer_name" Type="String" />
                        <asp:Parameter Name="original_tel" Type="String" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="farmer_name" Type="String" />
                        <asp:Parameter Name="tel" Type="String" />
                        <asp:Parameter Name="original_farmer_id" Type="String" />
                        <asp:Parameter Name="original_farmer_name" Type="String" />
                        <asp:Parameter Name="original_tel" Type="String" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="farmer_id" Type="String" />
                        <asp:Parameter Name="farmer_name" Type="String" />
                        <asp:Parameter Name="tel" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddl1" Name="farmer_name" PropertyName="SelectedValue"
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <table style ="width :100%; height :20%;">
        <tr>
            <td style="height: 25%">
                </td>
        </tr>
        <tr>
            <td style="height :75%" >
                &nbsp;&nbsp;&nbsp; &nbsp;
                <asp:FormView ID="FormView1" runat="server" BackColor="White" BorderColor="#CCCCCC"
                    BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="farmer_id"
                    DataSourceID="SqlDataSource2" GridLines="Both" Height="80%" Width="50%" Visible="False">
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <EditRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <EditItemTemplate>
                        farmer_id:
                        <asp:Label ID="farmer_idLabel1" runat="server" Text='<%# Eval("farmer_id") %>'></asp:Label><br />
                        种植户：<asp:TextBox ID="farmer_nameTextBox" runat="server" Text='<%# Bind("farmer_name") %>' Width="106px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="farmer_nameTextBox"
                            ErrorMessage="种植户名称不能为空" ValidationGroup="tishi">*</asp:RequiredFieldValidator><br />
                        联系电话：
                        <asp:TextBox ID="telTextBox" runat="server" Text='<%# Bind("tel") %>' Width="126px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="telTextBox"
                            ErrorMessage="种植户联系电话不能为空" ValidationGroup="tishi">*</asp:RequiredFieldValidator><br />
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="带*的文本框不能为空："
                            ShowMessageBox="True" ShowSummary="False" ValidationGroup="tishi" />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="更新" ValidationGroup="tishi"></asp:LinkButton>
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="取消">
                        </asp:LinkButton>
                    </EditItemTemplate>
                    <RowStyle ForeColor="#000066" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <InsertItemTemplate>
                        farmer_id:
                        <asp:TextBox ID="farmer_idTextBox" runat="server" Text='<%# Bind("farmer_id") %>'>
                        </asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="farmer_idTextBox"
                            ErrorMessage="种植户ID不能为空" ValidationGroup="tishi">*</asp:RequiredFieldValidator><br />
                        种植户：<asp:TextBox ID="farmer_nameTextBox" runat="server" Text='<%# Bind("farmer_name") %>' Width="98px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="farmer_nameTextBox"
                            ErrorMessage="种植户姓名不能为空" ValidationGroup="tishi">*</asp:RequiredFieldValidator><br />
                        联系电话：<asp:TextBox ID="telTextBox" runat="server" Text='<%# Bind("tel") %>' Width="119px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="telTextBox"
                            ErrorMessage="种植户联系电话不能为空" ValidationGroup="tishi">*</asp:RequiredFieldValidator><br />
                        <asp:ValidationSummary ID="ValidationSummary2" runat="server" HeaderText="带*的文本框不能为空："
                            ShowMessageBox="True" ShowSummary="False" ValidationGroup="tishi" />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="插入" ValidationGroup="tishi"></asp:LinkButton>
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="取消">
                        </asp:LinkButton>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        farmer_id:
                        <asp:Label ID="farmer_idLabel" runat="server" Text='<%# Eval("farmer_id") %>'></asp:Label><br />
                        种植户：
                        <asp:Label ID="farmer_nameLabel" runat="server" Text='<%# Bind("farmer_name") %>'></asp:Label><br />
                        联系电话：
                        <asp:Label ID="telLabel" runat="server" Text='<%# Bind("tel") %>'></asp:Label><br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="编辑"></asp:LinkButton>
                        <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" 
                            Text="删除" OnClientClick="return confirm('确定删除这条数据？')"></asp:LinkButton>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="新建"></asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <HeaderTemplate>
                        &nbsp;&nbsp;选择的种植户信息：<br />
                    </HeaderTemplate>
                </asp:FormView>
            </td>
        </tr>
    </table>
</asp:Content>
