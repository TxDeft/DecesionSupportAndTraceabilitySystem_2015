<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="enter.aspx.cs" Inherits="pages_purducer_enter" Title="入库管理" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%; height: 80%">
        <tr>
            <td colspan="2" style="height: 15%">
                选择追溯码：<asp:DropDownList ID="ddl1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1"
                    DataTextField="trace_num" DataValueField="trace_num" Height="80%" OnDataBound="ddl1_DataBound"
                    Width="30%" AppendDataBoundItems="True">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                    SelectCommand="SELECT DISTINCT [trace_num] FROM [enter]" CancelSelectOnNullParameter="False"></asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" Height="95%" Width="95%" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="trace_num" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="trace_num" HeaderText="追溯码" ReadOnly="True" SortExpression="trace_num" />
                        <asp:BoundField DataField="date" HeaderText="入库日期" SortExpression="date" />
                        <asp:BoundField DataField="veg_item" HeaderText="品种" SortExpression="veg_item" />
                        <asp:BoundField DataField="enter_amount" HeaderText="入库数量" SortExpression="enter_amount" />
                        <asp:BoundField DataField="unit_price" HeaderText="单价" SortExpression="unit_price" />
          
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
            
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" CancelSelectOnNullParameter="False"
                    ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                    DeleteCommand="DELETE FROM enter WHERE (trace_num = @trace_num)"
                    InsertCommand="INSERT INTO enter(trace_num, veg_item, enter_amount, date, unit_price) VALUES (@trace_num, @veg_item, @enter_amount, @date, @unit_price)"
                    SelectCommand="SELECT trace_num, veg_item, enter_amount, date, unit_price FROM enter WHERE (@trace_num IS NULL) OR (trace_num = @trace_num)"
                    UpdateCommand="UPDATE enter SET enter_amount = @enter_amount, unit_price = @unit_price WHERE (trace_num = @trace_num) AND (date = @date) AND (veg_item = @veg_item)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddl1" Name="trace_num" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="trace_num" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="enter_amount" />
                        <asp:Parameter Name="unit_price" />
                        <asp:Parameter Name="trace_num" />
                        <asp:Parameter Name="date" />
                        <asp:Parameter Name="veg_item" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="trace_num" />
                        <asp:Parameter Name="veg_item" />
                        <asp:Parameter Name="enter_amount" />
                        <asp:Parameter Name="date" />
                        <asp:Parameter Name="unit_price" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <table style="width: 100%; height :20%;">
        <tr>
            <td style="width: 100%; height :25%;">
                </td>
        </tr>
        <tr>
            <td align="center" style="width: 100%; height: 70%;">
                 <asp:FormView ID="FormView1" runat="server" Height="90%" Width="60%" DataKeyNames="trace_num" DataSourceID="SqlDataSource2" OnItemCreated="FormView1_ItemCreated" CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" GridLines="Both">
                    <EditItemTemplate>
                        入库日期：<asp:Label ID="dateLabel" runat="server" Width="45%" Text='<%# Bind("date") %>'></asp:Label><br />
                        追溯码：<asp:Label ID="trace_numLabel1" runat="server" Text='<%# Bind("trace_num") %>' Width="70%"></asp:Label><br />
                        品种：
                        <asp:Label ID="veg_itemLabel" runat="server" Text='<%# Bind("veg_item") %>' Width="45%"></asp:Label><br />
                        入库数量：
                        <asp:TextBox ID="enter_amountTextBox" runat="server" Text='<%# Bind("enter_amount") %>' Width="30%"></asp:TextBox>千克<br />
                        单价：<asp:TextBox ID="unit_priceTextBox" runat="server" Text='<%# Bind("unit_price") %>' Width="30%"></asp:TextBox>元<br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="更新">
                        </asp:LinkButton>
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="取消">
                        </asp:LinkButton>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        请选择地块编号：&nbsp;
                        <asp:DropDownList ID="ddl_land" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3"
                            DataTextField="land_id" DataValueField="land_id" Width="40%">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                            SelectCommand="SELECT DISTINCT [land_id] FROM [land]"></asp:SqlDataSource>
                        &nbsp;<br />
                        入库日期：
                        <asp:Label ID="dateLabel" runat="server" Text='<%# Bind("date") %>' Width="40%"></asp:Label>
                        <br />
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="确定输入" /><br />
                        <br />
                        追溯码：<asp:TextBox ID="trace_numTextBox" runat="server" Text='<%# Bind("trace_num") %>' Width="56%"></asp:TextBox><br />
                        <br />
                        品&nbsp; 种：&nbsp;<asp:DropDownList ID="ddl_veg" runat="server" SelectedValue='<%# Bind("veg_item") %>' Width="45%">
                        </asp:DropDownList><br />
                        &nbsp;<br />
                        入库数量：
                        <asp:TextBox ID="enter_amountTextBox" runat="server" Text='<%# Bind("enter_amount") %>' Width="25%"></asp:TextBox>千克<br />
                        单价：
                        <asp:TextBox ID="unit_priceTextBox" runat="server" Text='<%# Bind("unit_price") %>' Width="30%"></asp:TextBox>元/千克<br />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="插入">
                        </asp:LinkButton>
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="取消">
                        </asp:LinkButton>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        追溯码：
                        <asp:Label ID="trace_numLabel" runat="server" Text='<%# Eval("trace_num") %>'></asp:Label><br />
                        品种：
                        <asp:Label ID="veg_itemLabel" runat="server" Text='<%# Bind("veg_item") %>'></asp:Label><br />
                        入库数量：<asp:Label ID="enter_amountLabel" runat="server" Text='<%# Bind("enter_amount") %>'>
                        </asp:Label><br />
                        入库日期：
                        <asp:Label ID="dateLabel" runat="server" Text='<%# Bind("date") %>'></asp:Label><br />
                        单价：<asp:Label ID="unit_priceLabel" runat="server" Text='<%# Bind("unit_price") %>'>
                        </asp:Label><br />
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
                        选择的详细入库信息
                        <br />
                        <br />
                    </HeaderTemplate>
                     <FooterStyle BackColor="White" ForeColor="#000066" />
                     <EditRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                     <RowStyle ForeColor="#000066" />
                     <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                     <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:FormView>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                    SelectCommand="SELECT DISTINCT land_id, veg_item FROM plantplan WHERE (land_id = @land_id)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="@land_id" Name="land_id" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
               
        </tr>
    </table>
</asp:Content>
