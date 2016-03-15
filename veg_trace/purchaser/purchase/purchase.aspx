<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="purchase.aspx.cs" Inherits="pages_purchaser_purchase" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript" src="../../js/date.js"></script>
    <table style="width: 100%; height: 35%">
        <tr>
            <td style="height :100%; width: 514px;" colspan="2">
                选择采购的商品：<asp:DropDownList ID="ddl1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1"
                    DataTextField="supp_item" DataValueField="supp_item" OnDataBound="ddl1_DataBound"
                    Width="30%">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                    SelectCommand="SELECT DISTINCT [supp_item] FROM [supporter]"></asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" Height="90%" Width="141%" AllowPaging="True" AutoGenerateColumns="False" AutoGenerateSelectButton="True" DataKeyNames="date,item" DataSourceID="SqlDataSource2" PageSize="8" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="date" HeaderText="采购日期" ReadOnly="True" SortExpression="date" />
                        <asp:BoundField DataField="item" HeaderText="采购物品" ReadOnly="True" SortExpression="item" />
                        <asp:BoundField DataField="supp_name" HeaderText="供应商" SortExpression="supp_name" />
                        <asp:BoundField DataField="item_amount" HeaderText="采购数量" SortExpression="item_amount" />
                        <asp:BoundField DataField="unit_name" HeaderText="单价" SortExpression="unit_name" />
                        <asp:BoundField DataField="worker_name" HeaderText="采购人" SortExpression="worker_name" />
                        <asp:BoundField DataField="worker_id" HeaderText="采购员代码" SortExpression="worker_id" />
                    </Columns>
                    <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" CancelSelectOnNullParameter="False"
                    ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                    DeleteCommand="DELETE FROM purchase WHERE (date = @date) AND (item = @item) "
                    InsertCommand="INSERT INTO purchase(date, item, supp_name, item_amount, worker_id, worker_name, unit_name) VALUES (@date, @item, @supp_name, @item_amount, @worker_id, @worker_name, @unit_name)"
                    SelectCommand="SELECT date, item, supp_name, item_amount, worker_id, worker_name, unit_name FROM purchase WHERE (@item IS NULL) OR (item = @item)"
                    UpdateCommand="UPDATE purchase SET supp_name = @supp_name, item_amount = @item_amount, worker_id = @worker_id, worker_name = @worker_name, unit_name = @unit_name WHERE (date = @date) AND (item = @item)">
                    <DeleteParameters>
                        <asp:Parameter Name="date" />
                        <asp:Parameter Name="item" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="supp_name" />
                        <asp:Parameter Name="item_amount" />
                        <asp:Parameter Name="worker_id" />
                        <asp:Parameter Name="worker_name" />
                        <asp:Parameter Name="unit_name" />
                        <asp:Parameter Name="date" />
                        <asp:Parameter Name="item" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddl1" Name="item" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="date" />
                        <asp:Parameter Name="item" />
                        <asp:Parameter Name="supp_name" />
                        <asp:Parameter Name="item_amount" />
                        <asp:Parameter Name="worker_id" />
                        <asp:Parameter Name="worker_name" />
                        <asp:Parameter Name="unit_name" />
                    </InsertParameters>
                </asp:SqlDataSource>
                &nbsp;
            </td>
        </tr>
    </table>
    <table style="width: 100%; height: 30%">
        <tr>
            <td style="width: 100%; height :25%;">
                </td>
        </tr>
        <tr>
            <td align="center" style="width: 100%; height: 70%; vertical-align: top; text-align: left;">
                <asp:FormView ID="FormView1" runat="server" Width="360px" 
                    DataKeyNames="date,item" DataSourceID="SqlDataSource2" Height="20%" 
                    OnItemCreated="FormView1_ItemCreated" CellPadding="4" ForeColor="#333333" 
                    HorizontalAlign="Center">
                    <EditItemTemplate><table border="2" style="width: 360px">
                        <tr>
                            <td style="width: 160px">
                                采购日期：</td>
                            <td style="width: 200px">
                        <asp:Label ID="dateLabel1" runat="server" Text='<%# Bind("date") %>' Width="120px"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                                采购物品：</td>
                            <td style="width: 200px">
                        <asp:Label ID="itemLabel1" runat="server" Text='<%# Bind("item") %>' Width="120px"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                                供应商：</td>
                            <td style="width: 200px"><asp:Label ID="suppLabel" runat="server" Text='<%# Eval("supp_name") %>' Width="120px"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                        采购者代码：</td>
                            <td style="width: 200px"><asp:Label ID="workeridLabel" runat="server" Text='<%# Eval("worker_id") %>' Width="120px"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                                采购人员：</td>
                            <td style="width: 200px"><asp:Label ID="workerLabel" runat="server" Text='<%# Eval("worker_name") %>' Width="120px"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                                采购数量：</td>
                            <td style="width: 200px"><asp:TextBox ID="item_amountTextBox" runat="server" Text='<%# Bind("item_amount") %>'
                            Width="120px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="item_amountTextBox"
                            ErrorMessage="采购数量不能为空！" ValidationGroup="tishi" Width="151px"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                                单价：</td>
                            <td style="width: 200px">
                                <asp:TextBox ID="unit_nameTextBox" runat="server" Text='<%# Bind("unit_name") %>'
                            Width="120px"></asp:TextBox></td>
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
                            Text="取消"></asp:LinkButton></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                        </table>
                    </EditItemTemplate>
                    <InsertItemTemplate><table border="2" style="width: 360px">
                        <tr>
                            <td style="width: 160px">
                        采购日期:
                            </td>
                            <td style="width: 200px">
                        <asp:TextBox ID="txtIDate" runat="server" Text='<%# Bind("date") %>' onfocus="SelectDate(this)(this)" onkeypress="event.returnValue = false;" Width="140px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                        采购物品:
                            </td>
                            <td style="width: 200px"><asp:DropDownList ID="ddlIItem" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3"
                            DataTextField="supp_item" DataValueField="supp_item" SelectedValue='<%# Bind("item") %>'
                            Width="125px" OnDataBound="ddlIItem_Bound" OnSelectedIndexChanged="ddlIItem_SelectedIndexChanged">
                        </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                        供应商:
                            </td>
                            <td style="width: 200px">
                        <asp:DropDownList ID="ddlISuppName" runat="server" SelectedValue='<%# Bind("supp_name") %>'
                            Width="125px">
                            <asp:ListItem Selected="True"></asp:ListItem>
                        </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                        采购数量:&nbsp;</td>
                            <td style="width: 200px">
                        <asp:TextBox ID="item_amountTextBox" runat="server" Text='<%# Bind("item_amount") %>'
                            Width="120px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="item_amountTextBox"
                            ErrorMessage="不能为空！" ValidationGroup="tishi" Width="280px"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                        单价:
                            </td>
                            <td style="width: 200px">
                        <asp:TextBox ID="unit_nameTextBox" runat="server" Text='<%# Bind("unit_name") %>'
                            Width="120px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                                采购人员：</td>
                            <td style="width: 200px"><asp:DropDownList ID="ddlIWorker" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4"
                            DataTextField="worker_name" DataValueField="worker_name" SelectedValue='<%# Bind("worker_name") %>'
                            Width="126px" OnSelectedIndexChanged="ddlIWorker_SelectedIndexChanged" OnDataBound="ddlIWorker_Bound">
                        </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                                &nbsp;采购人ID：</td>
                            <td style="width: 200px">
                        <asp:DropDownList ID="ddlIWorkerId" runat="server" SelectedValue='<%# Bind("worker_id") %>'
                            Width="127px" AutoPostBack="True" OnSelectedIndexChanged="ddlIWorkerId_SelectedIndexChanged" DataSourceID="SqlDataSource7" DataTextField="worker_id" DataValueField="worker_id" OnDataBound="ddlIWorkerId_Bound">
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList></td>
                        </tr>
                    </table>
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
                            Text="取消"></asp:LinkButton></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                            SelectCommand="SELECT DISTINCT [supp_item] FROM [supporter]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                            SelectCommand="SELECT DISTINCT [worker_name] FROM [worker] WHERE ([department] = '采购部')">
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                            SelectCommand="SELECT worker_id FROM worker WHERE (department = '采购部')"></asp:SqlDataSource>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <table border="2" style="width: 360px">
                            <tr>
                                <td style="width: 160px">
                                    采购日期：</td>
                                <td style="width: 200px"><asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' Width="120px"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    采购物品：</td>
                                <td style="width: 200px">
                        <asp:Label ID="itemLabel" runat="server" Text='<%# Eval("item") %>' Width="120px"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    供应商：</td>
                                <td style="width: 200px"><asp:Label ID="supp_nameLabel" runat="server" Text='<%# Bind("supp_name") %>' Width="120px"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    采购数量：</td>
                                <td style="width: 200px">
                        <asp:Label ID="item_amountLabel" runat="server" Text='<%# Bind("item_amount") %>' Width="120px"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                        采购人：</td>
                                <td style="width: 200px">
                        <asp:Label ID="worker_nameLabel" runat="server" Text='<%# Bind("worker_name") %>' Width="120px"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px; height: 23px;">
                        采购人代码：</td>
                                <td style="width: 200px; height: 23px;"><asp:Label ID="worker_idLabel" runat="server" Text='<%# Bind("worker_id") %>' Width="120px"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    单价：</td>
                                <td style="width: 200px"><asp:Label ID="unit_nameLabel" runat="server" Text='<%# Bind("unit_name") %>' Width="120px"></asp:Label></td>
                            </tr>
                        </table>
                        <br />
                        <table border="0">
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="编辑"></asp:LinkButton></td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete"
                            Text="删除" OnClientClick="return confirm('确定删除这条数据？')"></asp:LinkButton></td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="新建"></asp:LinkButton></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <HeaderTemplate>
                        选择的详细采购信息<br />
                        <br />
                    </HeaderTemplate>
                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                    <EditRowStyle BackColor="#999999" />
                    <RowStyle ForeColor="#333333" BackColor="#F7F6F3" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                </asp:FormView>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                    SelectCommand="SELECT DISTINCT [supp_item], [supp_name] FROM [supporter] WHERE ([supp_item] = @supp_item)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="@supp_item" Name="supp_item" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                    SelectCommand="SELECT DISTINCT [worker_id], [worker_name] FROM [worker] WHERE (([worker_name] = @worker_name) AND ([department] = @department))">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="@worker_name" Name="worker_name" Type="String" />
                        <asp:Parameter DefaultValue="采购部" Name="department" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>