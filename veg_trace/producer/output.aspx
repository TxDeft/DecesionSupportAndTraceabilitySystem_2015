<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="output.aspx.cs" Inherits="pages_purducer_exit" Title="出库管理" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%; height: 80%">
        <tr>
            <td style="height :15%;" colspan="2">
                选择追溯码：<asp:DropDownList ID="ddl1" runat="server" Width="30%" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="trace_num" DataValueField="trace_num" OnDataBound="ddl1_DataBound" AppendDataBoundItems="True">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>" SelectCommand="SELECT DISTINCT [trace_num] FROM [enter]"></asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" Height="95%" Width="95%" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="trace_num,super_name" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="trace_num" HeaderText="追溯码" ReadOnly="True" SortExpression="trace_num" />
                        <asp:BoundField DataField="super_name" HeaderText="配送超市" ReadOnly="True" SortExpression="super_name" />
                        <asp:BoundField DataField="exit_amount" HeaderText="出库数量" SortExpression="exit_amount" />
                        <asp:BoundField DataField="date" HeaderText="出库日期" SortExpression="date" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>" DeleteCommand="DELETE FROM output WHERE (trace_num = @trace_num) AND (super_name = @super_name)" InsertCommand="INSERT INTO output(trace_num,  exit_amount, date, super_name) VALUES (@trace_num,@exit_amount, @date, @super_name)" SelectCommand="SELECT trace_num,  exit_amount, date, super_name FROM output WHERE (@trace_num IS NULL) OR (trace_num = @trace_num)" UpdateCommand="UPDATE output SET  exit_amount = @exit_amount, date = @date, super_name = @super_name WHERE (trace_num = @trace_num)">
                    <DeleteParameters>
                        <asp:Parameter Name="trace_num" />
                        <asp:Parameter Name="super_name" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="exit_amount" />
                        <asp:Parameter Name="date" />
                        <asp:Parameter Name="super_name" />
                        <asp:Parameter Name="trace_num" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddl1" Name="trace_num" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="trace_num" />
                        <asp:Parameter Name="exit_amount" />
                        <asp:Parameter Name="date" />
                        <asp:Parameter Name="super_name" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <table style="width: 100%; height: 20%">
        <tr>
            <td style="width: 100%; height :25%;">
                <asp:FormView ID="FormView1" runat="server" Height="90%" DataKeyNames="trace_num,super_name" DataSourceID="SqlDataSource2" Width="60%" OnItemCreated="FormView1_ItemCreated" CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" GridLines="Both">
                    <EditItemTemplate>
                        追溯码：
                        <asp:Label ID="trace_numLabel1" runat="server" Text='<%# Eval("trace_num") %>'></asp:Label><br />
                        配送超市：<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource4"
                            DataTextField="super_name" DataValueField="super_name" SelectedValue='<%# Bind("super_name") %>'
                            Width="93px">
                        </asp:DropDownList><br />
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                            SelectCommand="SELECT DISTINCT [super_name] FROM [supermarket]"></asp:SqlDataSource>
                        <br />
                        出库数量：
                        <asp:TextBox ID="exit_amountTextBox" runat="server" Text='<%# Bind("exit_amount") %>'
                            Width="69px"></asp:TextBox>Kg<asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                runat="server" ControlToValidate="exit_amountTextBox" ErrorMessage="不能为空" ValidationGroup="tishi"></asp:RequiredFieldValidator><br />
                        出库日期：
                        <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' Width="82px"></asp:Label><br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="更新" ValidationGroup="tishi"></asp:LinkButton>
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="取消"></asp:LinkButton>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        追溯码：
                        <asp:TextBox ID="trace_numTextBox" runat="server" Text='<%# Bind("trace_num") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="trace_numTextBox"
                            ErrorMessage="不能为空" ValidationGroup="tishi"></asp:RequiredFieldValidator><br />
                        配送超市：<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3"
                            DataTextField="super_name" DataValueField="super_name" SelectedValue='<%# Bind("super_name") %>'
                            Width="103px">
                        </asp:DropDownList><br />
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                            SelectCommand="SELECT DISTINCT [super_name] FROM [supermarket]"></asp:SqlDataSource>
                        &nbsp;<br />
                        &nbsp;
                        <br />
                        <br />
                        出库数量：
                        <asp:TextBox ID="exit_amountTextBox" runat="server" Text='<%# Bind("exit_amount") %>'
                            Width="91px"></asp:TextBox>Kg<asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                runat="server" ControlToValidate="exit_amountTextBox" ErrorMessage="不能为空" ValidationGroup="tishi"></asp:RequiredFieldValidator><br />
                        出库日期：<asp:Label ID="dateLabel" runat="server" Text='<%# Bind("date") %>' Width="90px"></asp:Label><br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="插入" ValidationGroup="tishi"></asp:LinkButton>
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="取消"></asp:LinkButton>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        追溯码：
                        <asp:Label ID="trace_numLabel" runat="server" Text='<%# Eval("trace_num") %>'></asp:Label><br />
                        出库数量：<asp:Label ID="exit_amountLabel" runat="server" Text='<%# Bind("exit_amount") %>'></asp:Label><br />
                        出库日期：
                        <asp:Label ID="dateLabel" runat="server" Text='<%# Bind("date") %>'></asp:Label><br />
                        配送超市：
                        <asp:Label ID="super_nameLabel" runat="server" Text='<%# Eval("super_name") %>'></asp:Label><br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="编辑"></asp:LinkButton>
                        <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete"
                            Text="删除" OnClientClick="return confirm('确定删除这条数据？')"></asp:LinkButton>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="新建"></asp:LinkButton>
                    </ItemTemplate>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <EditRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <RowStyle ForeColor="#000066" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <HeaderTemplate>
                选择的详细出库信息：<br />
                        <br />
                    </HeaderTemplate>
                </asp:FormView>
                </td>
        </tr>
        <tr>
            <td style="width: 60%; height: 75%" align="center">
                &nbsp; &nbsp;
                &nbsp; &nbsp;
                &nbsp; &nbsp;&nbsp;</td>
        </tr>
    </table>
</asp:Content>
