<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="worker.aspx.cs" Inherits="manage_worker" Title="工作人员管理" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%; height: 80%">
        <tr>
            <td style="height: 15%;" colspan="2">
                &nbsp; 选择工作人员：
                <asp:DropDownList ID="ddl1" runat="server" DataSourceID="SqlDataSource1" DataTextField="worker_name"
                    DataValueField="worker_name" Width="30%" AutoPostBack="True" OnDataBound="ddl1_DataBound">
                </asp:DropDownList>&nbsp;
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>" SelectCommand="SELECT DISTINCT [worker_name] FROM [worker]"></asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" Height="85%" Width="95%" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" AutoGenerateSelectButton="True" DataKeyNames="worker_id" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                    <Columns>
                        <asp:BoundField DataField="worker_id" HeaderText="worker_id" ReadOnly="True" SortExpression="worker_id" />
                        <asp:BoundField DataField="worker_name" HeaderText="worker_name" SortExpression="worker_name" />
                        <asp:BoundField DataField="sex" HeaderText="sex" SortExpression="sex" />
                        <asp:BoundField DataField="department" HeaderText="department" SortExpression="department" />
                        <asp:BoundField DataField="birthday" HeaderText="birthday" SortExpression="birthday" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="job" HeaderText="job" SortExpression="job" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                &nbsp;&nbsp;
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues"
                    ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                    DeleteCommand="DELETE FROM [worker] WHERE [worker_id] = @original_worker_id AND [worker_name] = @original_worker_name AND [sex] = @original_sex AND [department] = @original_department AND [birthday] = @original_birthday AND [job] = @original_job"
                    InsertCommand="INSERT INTO [worker] ([worker_id], [worker_name], [sex], [department], [birthday], [job]) VALUES (@worker_id, @worker_name, @sex, @department, @birthday, @job)"
                    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT worker_id, worker_name, sex, department, birthday, job FROM worker WHERE (@worker_name IS NULL) OR (worker_name = @worker_name)"
                    UpdateCommand="UPDATE [worker] SET [worker_name] = @worker_name, [sex] = @sex, [department] = @department, [birthday] = @birthday, [job] = @job WHERE [worker_id] = @original_worker_id AND [worker_name] = @original_worker_name AND [sex] = @original_sex AND [department] = @original_department AND [birthday] = @original_birthday AND [job] = @original_job" CancelSelectOnNullParameter="False" ProviderName="<%$ ConnectionStrings:vegetableConnectionString.ProviderName %>">
                    <DeleteParameters>
                        <asp:Parameter Name="original_worker_id" Type="String" />
                        <asp:Parameter Name="original_worker_name" Type="String" />
                        <asp:Parameter Name="original_sex" Type="String" />
                        <asp:Parameter Name="original_department" Type="String" />
                        <asp:Parameter Name="original_birthday" Type="DateTime" />
                        <asp:Parameter Name="original_job" Type="String" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="worker_name" Type="String" />
                        <asp:Parameter Name="sex" Type="String" />
                        <asp:Parameter Name="department" Type="String" />
                        <asp:Parameter Name="birthday" Type="DateTime" />
                        <asp:Parameter Name="job" Type="String" />
                        <asp:Parameter Name="original_worker_id" Type="String" />
                        <asp:Parameter Name="original_worker_name" Type="String" />
                        <asp:Parameter Name="original_sex" Type="String" />
                        <asp:Parameter Name="original_department" Type="String" />
                        <asp:Parameter Name="original_birthday" Type="DateTime" />
                        <asp:Parameter Name="original_job" Type="String" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="worker_id" Type="String" />
                        <asp:Parameter Name="worker_name" Type="String" />
                        <asp:Parameter Name="sex" Type="String" />
                        <asp:Parameter Name="department" Type="String" />
                        <asp:Parameter Name="birthday" Type="DateTime" />
                        <asp:Parameter Name="job" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddl1" Name="worker_name" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <table style="width: 100%; height: 20%">
        <tr>
            <td style="height: 15%">
            </td>
        </tr>
        <tr>
            <td style="height: 85%">
                &nbsp;
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="worker_id" DataSourceID="SqlDataSource2" Width="60%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Both" Height="65%" Visible="False">
                    <EditItemTemplate>
                        worker_id:
                        <asp:Label ID="worker_idLabel1" runat="server" Text='<%# Eval("worker_id") %>'></asp:Label><br />
                        worker_name:
                        <asp:TextBox ID="worker_nameTextBox" runat="server" Text='<%# Bind("worker_name") %>'>
                        </asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="worker_nameTextBox"
                            ErrorMessage="姓名不能为空" ValidationGroup="tishi">*</asp:RequiredFieldValidator><br />
                        sex:
                        <asp:dropdownlist ID="ddl_sex" runat="server" Text='<%# Bind("sex") %>' Width="20%">
                            <asp:ListItem Selected="True">男</asp:ListItem>
                            <asp:ListItem>女</asp:ListItem>
                        </asp:dropdownlist><br />
                        department:
                        <asp:dropdownlist ID="ddl_department" runat="server" Text='<%# Bind("department") %>' Width="40%">
                            <asp:ListItem Selected="True">采购部</asp:ListItem>
                            <asp:ListItem>包装车间</asp:ListItem>
                            <asp:ListItem>检测部</asp:ListItem>
                            <asp:ListItem>财务部</asp:ListItem>
                            <asp:ListItem>办公室</asp:ListItem>
                        </asp:dropdownlist><br />
                        birthday:
                        <asp:TextBox ID="birthdayTextBox" runat="server" Text='<%# Bind("birthday", "{0:d}") %>'></asp:TextBox>
                        <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="日期格式为2008-08-08"></asp:Label>&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="birthdayTextBox"
                            ErrorMessage="出生日期不能为空" ValidationGroup="tishi">*</asp:RequiredFieldValidator><br />
                        job:
                        <asp:TextBox ID="jobTextBox" runat="server" Text='<%# Bind("job") %>'>
                        </asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="jobTextBox"
                            ErrorMessage="职位不能为空" ValidationGroup="tishi">*</asp:RequiredFieldValidator><br />
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="带*的文本框为必填项："
                            ShowMessageBox="True" ShowSummary="False" ValidationGroup="tishi" />
                        <br />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="更新">
                        </asp:LinkButton>
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="取消">
                        </asp:LinkButton>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        worker_id:
                        <asp:TextBox ID="worker_idTextBox" runat="server" Text='<%# Bind("worker_id") %>'>
                        </asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="worker_idTextBox"
                            ErrorMessage="工作人员代码不能为空" ValidationGroup="tishi">*</asp:RequiredFieldValidator><br />
                        worker_name:
                        <asp:TextBox ID="worker_nameTextBox" runat="server" Text='<%# Bind("worker_name") %>'>
                        </asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="worker_nameTextBox"
                            ErrorMessage="姓名不能为空" ValidationGroup="tishi">*</asp:RequiredFieldValidator><br />
                        sex:
                       <asp:dropdownlist ID="ddl_sex" runat="server" Text='<%# Bind("sex") %>' Width="20%">
                            <asp:ListItem Selected="True">男</asp:ListItem>
                            <asp:ListItem>女</asp:ListItem>
                        </asp:dropdownlist><br />
                        department:
                        <asp:dropdownlist ID="ddl_department" runat="server" Text='<%# Bind("department") %>' Width="40%">
                            <asp:ListItem Selected="True">加工车间</asp:ListItem>
                            <asp:ListItem>采购部</asp:ListItem>
                            <asp:ListItem>检测部</asp:ListItem>
                            <asp:ListItem>办公室</asp:ListItem>
                        </asp:dropdownlist><br />
                        birthday:
                        <asp:TextBox ID="birthdayTextBox" runat="server" Text='<%# Bind("birthday", "{0:d}") %>'></asp:TextBox>
                        <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="日期格式为2008-08-08"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="birthdayTextBox"
                            ErrorMessage="出生日期不能为空" ValidationGroup="tishi">*</asp:RequiredFieldValidator><br />
                        job:
                        <asp:TextBox ID="jobTextBox" runat="server" Text='<%# Bind("job") %>'>
                        </asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="jobTextBox"
                            ErrorMessage="职位不能为空" ValidationGroup="tishi">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:ValidationSummary ID="ValidationSummary2" runat="server" HeaderText="带*的文本框不能为空"
                            ShowMessageBox="True" ShowSummary="False" ValidationGroup="tishi" />
                        <br />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="插入" ValidationGroup="tishi"></asp:LinkButton>
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="取消">
                        </asp:LinkButton>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        worker_id:
                        <asp:Label ID="worker_idLabel" runat="server" Text='<%# Eval("worker_id") %>'></asp:Label><br />
                        worker_name:
                        <asp:Label ID="worker_nameLabel" runat="server" Text='<%# Bind("worker_name") %>'>
                        </asp:Label><br />
                        sex:
                        <asp:Label ID="sexLabel" runat="server" Text='<%# Bind("sex") %>'></asp:Label><br />
                        department:
                        <asp:Label ID="departmentLabel" runat="server" Text='<%# Bind("department") %>'>
                        </asp:Label><br />
                        birthday:
                        <asp:Label ID="birthdayLabel" runat="server" Text='<%# Bind("birthday", "{0:d}") %>'></asp:Label><br />
                        job:
                        <asp:Label ID="jobLabel" runat="server" Text='<%# Bind("job") %>'></asp:Label><br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="编辑">
                        </asp:LinkButton>
                        <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete"
                            Text="删除" OnClientClick="return confirm('确定删除这条数据？')"></asp:LinkButton>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="新建">
                        </asp:LinkButton>
                    </ItemTemplate>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <EditRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <RowStyle ForeColor="#000066" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <HeaderTemplate>
                        &nbsp; &nbsp; &nbsp;选择的工作人员信息：
                    </HeaderTemplate>
                </asp:FormView>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
