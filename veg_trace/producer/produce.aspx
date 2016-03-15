<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="produce.aspx.cs" Inherits="pages_producer_produce" Title="加工管理" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%; height: 80%">
        <tr>
            <td style="height: 100%" colspan="2">
                选择包装人员：<asp:DropDownList ID="ddl1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1"
                    DataTextField="worker_name" DataValueField="worker_name" OnDataBound="ddl1_DataBound"
                    Width="30%" AppendDataBoundItems="True">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                    SelectCommand="SELECT DISTINCT worker_name FROM worker WHERE (department = '包装车间')">
                </asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" Height="95%" Width="95%" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="trace_num" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="worker_name" HeaderText="加工人员" SortExpression="worker_name" />
                        <asp:BoundField DataField="worker_id" HeaderText="加工人员代码" SortExpression="worker_id" />
                        <asp:BoundField DataField="trace_num" HeaderText="可追溯码" ReadOnly="True" SortExpression="trace_num" />
                        <asp:BoundField DataField="work_amount" HeaderText="加工数量" SortExpression="work_amount" />
                        <asp:BoundField DataField="date" HeaderText="加工日期" SortExpression="date" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                &nbsp;
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" CancelSelectOnNullParameter="False"
                    ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                    DeleteCommand="DELETE FROM produce WHERE (trace_num = @trace_num)"
                    InsertCommand="INSERT INTO produce(worker_name, worker_id, trace_num, work_amount, date) VALUES (@worker_name, @worker_id, @trace_num, @work_amount, @date)"
                    SelectCommand="SELECT worker_name, worker_id, trace_num, work_amount, date FROM produce WHERE (@worker_name IS NULL) OR (worker_name = @worker_name)"
                    UpdateCommand="UPDATE produce SET worker_name = @worker_name, worker_id = @worker_id, work_amount = @work_amount, date = @date WHERE (trace_num = @trace_num)">
                    <DeleteParameters>
                        <asp:Parameter Name="trace_num" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="worker_name" />
                        <asp:Parameter Name="worker_id" />
                        <asp:Parameter Name="work_amount" />
                        <asp:Parameter Name="date" />
                        <asp:Parameter Name="trace_num" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddl1" Name="worker_name" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="worker_name" />
                        <asp:Parameter Name="worker_id" />
                        <asp:Parameter Name="trace_num" />
                        <asp:Parameter Name="work_amount" />
                        <asp:Parameter Name="date" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <table style="width: 100%; height: 20%">
        <tr>
            <td style="width: 100%; height :10%">
                </td>
        </tr>
        <tr>
            <td style="width: 100%; height: 30%" align="center">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="trace_num" DataSourceID="SqlDataSource2" Width="50%" OnItemCreated="FormView1_ItemCreated" CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" GridLines="Both">
                    <EditItemTemplate>
                        加工人员：
                        <asp:Label ID="workerLabel" runat="server" Text='<%# Bind("worker_name") %>' Width="40%"></asp:Label>
                        <br />
                        加工人员代码：:<asp:Label ID="widLabel" runat="server" Text='<%# Bind("worker_id") %>'
                            Width="45%"></asp:Label>
                        <br />
                        可追溯码：
                        <asp:Label ID="trace_numLabel1" runat="server" Text='<%# Eval("trace_num") %>'></asp:Label><br />
                        加工数量：
                        <asp:TextBox ID="work_amountTextBox" runat="server" Text='<%# Bind("work_amount") %>' Width="30%"></asp:TextBox>千克<asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1" runat="server" ControlToValidate="work_amountTextBox"
                            ErrorMessage="不能为空" ValidationGroup="tishi"></asp:RequiredFieldValidator><br />
                        加工日期：<asp:Label ID="dateLabel" runat="server" Text='<%# Bind("date") %>' Width="45%"></asp:Label>
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="更新" ValidationGroup="tishi"></asp:LinkButton>
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="取消">
                        </asp:LinkButton>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        追溯码：<asp:TextBox ID="trace_numTextBox" runat="server" Text='<%# Bind("trace_num") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="trace_numTextBox"
                            ErrorMessage="不能为空" ValidationGroup="tishi"></asp:RequiredFieldValidator>
                        <br />
                        加工日期：<asp:Label ID="dateLabel" runat="server" Text='<%# Bind("date") %>' Width="42%"></asp:Label><br />
                        加工人员：:
                        <asp:DropDownList ID="ddl_worker" runat="server" DataSourceID="SqlDataSource3" DataTextField="worker_name"
                            DataValueField="worker_name" SelectedValue='<%# Bind("worker_name") %>' Width="45%" AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                            SelectCommand="SELECT DISTINCT  [worker_name] FROM [worker] WHERE ([department] = @department)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="包装车间" Name="department" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                        工作人员代码：:
                        <asp:DropDownList ID="ddl_id" runat="server" SelectedValue='<%# Bind("worker_id") %>' Width="45%">
                        </asp:DropDownList><br />
                        <br />
                        加工数量：:
                        <asp:TextBox ID="work_amountTextBox" runat="server" Text='<%# Bind("work_amount") %>' Width="30%"></asp:TextBox>千克<br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="work_amountTextBox"
                            ErrorMessage="不能为空" ValidationGroup="tishi"></asp:RequiredFieldValidator><br />
                        &nbsp;<br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="插入" ValidationGroup="tishi"></asp:LinkButton>
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="取消">
                        </asp:LinkButton>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        加工人员：
                        <asp:Label ID="worker_nameLabel" runat="server" Text='<%# Bind("worker_name") %>'>
                        </asp:Label><br />
                        加工人员代码：
                        <asp:Label ID="worker_idLabel" runat="server" Text='<%# Bind("worker_id") %>'></asp:Label><br />
                        可追溯码：
                        <asp:Label ID="trace_numLabel" runat="server" Text='<%# Eval("trace_num") %>'></asp:Label><br />
                        加工数量：
                        <asp:Label ID="work_amountLabel" runat="server" Text='<%# Bind("work_amount") %>'>
                        </asp:Label><br />
                        加工日期：
                        <asp:Label ID="dateLabel" runat="server" Text='<%# Bind("date") %>'></asp:Label><br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="编辑">
                        </asp:LinkButton>
                        <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete"
                            Text="删除" OnClientClick="return confirm('确定删除这条数据？')"></asp:LinkButton>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="新建">
                        </asp:LinkButton>
                    </ItemTemplate>
                    <HeaderTemplate>
                        选择的详细加工信息<br />
                        <br />
                    </HeaderTemplate>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <EditRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <RowStyle ForeColor="#000066" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:FormView>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                    SelectCommand="SELECT DISTINCT [worker_id], [worker_name] FROM [worker] WHERE ([worker_name] = @worker_name)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="@worker_name" Name="worker_name" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                &nbsp;
                &nbsp;&nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
