<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="order.aspx.cs" Inherits="office_order" Title="订单管理" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript" src="../../js/date.js"></script>
    <table style="width: 100%; height: 70%">
        <tr>
            <td style="width: 100%; height: 15%">
                订货超市：<asp:DropDownList ID="ddl1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1"
                    DataTextField="super_name" DataValueField="super_name" OnDataBound="ddl1_DataBound"
                    Width="30%" >
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                    SelectCommand="SELECT DISTINCT [super_name] FROM [supermarket]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="width: 100%; height :85%">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4" DataKeyNames="order_id,veg_item" DataSourceID="SqlDataSource2" Height="65%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                    Width="97%" ForeColor="#333333" GridLines="None">
                    <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="order_id" HeaderText="订单号" ReadOnly="True" SortExpression="order_id" />
                        <asp:BoundField DataField="veg_item" HeaderText="订购品种" ReadOnly="True" SortExpression="veg_item" />
                        <asp:BoundField DataField="veg_amount" HeaderText="订购数量" SortExpression="veg_amount" />
                        <asp:BoundField DataField="super_name" HeaderText="订购超市" SortExpression="super_name" />
                        <asp:BoundField DataField="date" HeaderText="订购日期" SortExpression="date" />
                    </Columns>
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" CancelSelectOnNullParameter="False"
                    ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                    DeleteCommand="DELETE FROM orderby WHERE (order_id = @order_id) AND (veg_item = @veg_item)"
                    InsertCommand="INSERT INTO orderby(order_id, veg_item, veg_amount, super_name, date) VALUES (@order_id, @veg_item, @veg_amount, @super_name, @date)"
                    SelectCommand="SELECT order_id, veg_item, veg_amount, super_name, date FROM orderby WHERE (super_name = @super_name) OR (@super_name IS NULL)"
                    UpdateCommand="UPDATE orderby SET veg_amount = @veg_amount WHERE (order_id = @order_id) AND (veg_item = @veg_item) AND (super_name = @super_name) AND (date = @date)">
                    <DeleteParameters>
                        <asp:Parameter Name="order_id" />
                        <asp:Parameter Name="veg_item" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="veg_amount" />
                        <asp:Parameter Name="order_id" />
                        <asp:Parameter Name="veg_item" />
                        <asp:Parameter Name="super_name" />
                        <asp:Parameter Name="date" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddl1" Name="super_name" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="order_id" />
                        <asp:Parameter Name="veg_item" />
                        <asp:Parameter Name="veg_amount" />
                        <asp:Parameter Name="super_name" />
                        <asp:Parameter Name="date" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <table style="width: 100%; height: 30%">
        <tr>
            <td style="width: 100%; height :35%">
                <br />
            </td>
        </tr>
        <tr>
            <td style="width: 100%; height :65%; vertical-align: top; text-align: left;" align="center">
                <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataKeyNames="order_id,veg_item"
                    DataSourceID="SqlDataSource2" OnItemCreated="FormView1_ItemCreated" Width="360px" ForeColor="#333333">
                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                    <EditRowStyle BackColor="#999999" />
                    <EditItemTemplate><table border="2" style="width: 360px">
                        <tr>
                            <td style="width: 160px">
                                订&nbsp; 单&nbsp; 号：</td>
                            <td style="width: 200px">
                        <asp:Label ID="order_idLabel1" runat="server" Text='<%# Eval("order_id") %>' Width="120px"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                                订购超市：</td>
                            <td style="width: 200px"><asp:Label ID="superLabel" runat="server" Text='<%# Bind("super_name") %>' Width="120px"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                                订购日期：</td>
                            <td style="width: 200px"><asp:Label ID="dateLabel" runat="server" Text='<%# Bind("date") %>' Width="120px"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                        品 &nbsp; &nbsp; &nbsp;&nbsp; 种：</td>
                            <td style="width: 200px"><asp:Label ID="veg_itemLabel" runat="server" Text='<%# Eval("veg_item") %>' Width="120px"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                                订购数量：</td>
                            <td style="width: 200px">
                        <asp:TextBox ID="veg_amountTextBox" runat="server" Text='<%# Bind("veg_amount") %>' Width="120px"></asp:TextBox>千克</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1" runat="server" ControlToValidate="veg_amountTextBox"
                            ErrorMessage="订购数量不能为空！" ValidationGroup="tishi"></asp:RequiredFieldValidator></td>
                        </tr>
                    </table>
                        &nbsp;<table border="0">
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
                    <RowStyle ForeColor="#333333" BackColor="#F7F6F3" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <InsertItemTemplate><table border="2" style="width: 360px">
                        <tr>
                            <td style="width: 160px">
                                订购日期：</td>
                            <td style="width: 200px"><asp:TextBox ID="txtIDate" runat="server" Text='<%# Bind("date") %>' onfocus="SelectDate(this)(this)" onkeypress="event.returnValue = false;" Width="140px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                                订购超市：</td>
                            <td style="width: 200px"><asp:DropDownList ID="ddlISuperName" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4"
                            DataTextField="super_name" DataValueField="super_name" SelectedValue='<%# Bind("super_name") %>'
                            Width="126px" OnDataBound="ddlISuperName_Bound" OnSelectedIndexChanged="ddlISuperName_SelectedIndexChanged">
                        </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                                订单号：</td>
                            <td style="width: 200px"><asp:TextBox ID="txtIOrderId" runat="server" Text='<%# Bind("order_id") %>'
                            Width="120px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                                订购品种：</td>
                            <td style="width: 200px"><asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource6"
                            DataTextField="veg_item" DataValueField="veg_item" SelectedValue='<%# Bind("veg_item") %>'
                            Width="123px">
                        </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                                订购数量：</td>
                            <td style="width: 200px">
                        <asp:TextBox ID="veg_amountTextBox" runat="server" Text='<%# Bind("veg_amount") %>' Width="120px" ></asp:TextBox>千克</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="veg_amountTextBox"
                            ErrorMessage="订购数量不能为空！" ValidationGroup="tishi"></asp:RequiredFieldValidator></td>
                        </tr>
                    </table>
                        &nbsp;<table border="0">
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="插入" ValidationGroup="tishi"></asp:LinkButton></td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="取消"></asp:LinkButton></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                        </table>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                            SelectCommand="SELECT DISTINCT [super_name] FROM [supermarket]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                            SelectCommand="SELECT DISTINCT veg_item FROM seeding"></asp:SqlDataSource>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <table border="2" style="width: 360px">
                            <tr>
                                <td style="width: 160px">
                                    订单号：</td>
                                <td style="width: 200px">
                        <asp:Label ID="order_idLabel" runat="server" Text='<%# Eval("order_id") %>' Width="120px"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    订购品种：</td>
                                <td style="width: 200px"><asp:Label ID="veg_itemLabel" runat="server" Text='<%# Eval("veg_item") %>' Width="120px"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    订购数量：</td>
                                <td style="width: 200px">
                        <asp:Label ID="veg_amountLabel" runat="server" Text='<%# Bind("veg_amount") %>' Width="120px"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    订购超市：</td>
                                <td style="width: 200px">
                        <asp:Label ID="super_nameLabel" runat="server" Text='<%# Bind("super_name") %>' Width="120px"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    订购日期：</td>
                                <td style="width: 200px">
                        <asp:Label ID="dateLabel" runat="server" Text='<%# Bind("date") %>' Width="120px"></asp:Label></td>
                            </tr>
                        </table>
                        &nbsp;<table border="0">
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="编辑"></asp:LinkButton></td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete"
                            Text="删除" OnClientClick='return confirm("确定删除此数据？")'></asp:LinkButton></td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="新建"></asp:LinkButton></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderTemplate>
                        选择的详细订货信息：<br />
                        <br />
                    </HeaderTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                    SelectCommand="SELECT DISTINCT [super_name], [super] FROM [supermarket] WHERE ([super_name] = @super_name)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="@super_name" Name="super_name" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
