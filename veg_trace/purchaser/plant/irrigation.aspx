<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="irrigation.aspx.cs" Inherits="pages_purchaser_irrigation" Title="灌溉管理" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript" src="../../js/date.js"></script>
    <table style="width: 100%; height: 70%">
        <tr>
            <td style="height: 15%" colspan="2">
                选择种植户：<asp:DropDownList ID="ddl1" runat="server" Width="30%" OnDataBound="ddl1_DataBound" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="farmer_name" DataValueField="farmer_name" AppendDataBoundItems="True">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>" SelectCommand="SELECT DISTINCT [farmer_name] FROM [farmer]" CancelSelectOnNullParameter="False"></asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" Height="95%" Width="95%" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="land_id,date" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" PageSize="8" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="land_id" HeaderText="灌溉地块" ReadOnly="True" SortExpression="land_id" />
                        <asp:BoundField DataField="farmer_name" HeaderText="种植户" SortExpression="farmer_name" />
                        <asp:BoundField DataField="date" HeaderText="灌溉日期" ReadOnly="True" SortExpression="date" />
                        <asp:BoundField DataField="well" HeaderText="灌溉来源" SortExpression="well" />
                        <asp:BoundField DataField="irrigate_amount" HeaderText="灌溉量(吨)" SortExpression="irrigate_amount" />
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
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>" DeleteCommand="DELETE FROM irrigation WHERE (land_id = @land_id) AND (date = @date)" InsertCommand="INSERT INTO irrigation(land_id, farmer_name, date, well, irrigate_amount) VALUES (@land_id, @farmer_name, @date, @well, @irrigate_amount)" SelectCommand="SELECT land_id, farmer_name, date, well, irrigate_amount FROM irrigation WHERE (@farmer_name IS NULL) OR (farmer_name = @farmer_name)" UpdateCommand="UPDATE irrigation SET farmer_name = @farmer_name, well = @well, irrigate_amount = @irrigate_amount WHERE (date = @date) AND (land_id = @land_id)" CancelSelectOnNullParameter="False" ProviderName="<%$ ConnectionStrings:vegetableConnectionString.ProviderName %>">
                    <DeleteParameters>
                        <asp:Parameter Name="land_id" />
                        <asp:Parameter Name="date" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="farmer_name" />
                        <asp:Parameter Name="well" />
                        <asp:Parameter Name="irrigate_amount" />
                        <asp:Parameter Name="date" />
                        <asp:Parameter Name="land_id" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddl1" Name="farmer_name" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="land_id" />
                        <asp:Parameter Name="farmer_name" />
                        <asp:Parameter Name="date" />
                        <asp:Parameter Name="well" />
                        <asp:Parameter Name="irrigate_amount" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <table style="width: 100%; height: 30%">
        <tr>
            <td style="height :25%">
                </td>
        </tr>
        <tr>
            <td align="center" style="width: 60%; height: 75%; vertical-align: top; text-align: left;" valign="top">
                &nbsp;<asp:FormView ID="FormView1" runat="server" Height="85%" DataKeyNames="land_id,date" DataSourceID="SqlDataSource2" Width="360px" OnItemCreated="FormView1_ItemCreated" CellPadding="4" ForeColor="#333333">
                    <EditItemTemplate><table border="2" style="width: 360px">
                        <tr>
                            <td style="width: 160px">
                                种植户：</td>
                            <td style="width: 200px"><asp:Label ID="farmerLabel" runat="server" Text='<%# Bind("farmer_name") %>'></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                                灌溉地块：</td>
                            <td style="width: 200px"><asp:Label ID="land_idLabel1" runat="server" Text='<%# Eval("land_id") %>'></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                                灌溉日期：</td>
                            <td style="width: 200px"><asp:Label ID="dateLabel1" runat="server" Text='<%# Eval("date") %>'></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                                &nbsp;灌溉来源：</td>
                            <td style="width: 200px"><asp:Label ID="wellLabel" runat="server" Text='<%# Bind("well") %>'></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                                灌溉数量：</td>
                            <td style="width: 200px">
                        <asp:TextBox ID="irrigate_amountTextBox" runat="server" Text='<%# Bind("irrigate_amount") %>' Width="120px"></asp:TextBox>吨</td>
                        </tr>
                    </table>
                        <br />
                        <table border="0">
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="更新">
                        </asp:LinkButton></td>
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
                                种植户：</td>
                            <td style="width: 200px"><asp:DropDownList ID="ddlIFarmerName" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4"
                            DataTextField="farmer_name" DataValueField="farmer_name" OnDataBound="ddlIFarmerName_Bound"
                            OnSelectedIndexChanged="ddlIFarmerName_SelectedIndexChanged" SelectedValue='<%# Bind("farmer_name") %>' Width="120px">
                        </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                                灌溉地块：</td>
                            <td style="width: 200px"><asp:DropDownList ID="ddlILandId" runat="server" SelectedValue='<%# Bind("land_id") %>'
                            Width="120px" AutoPostBack="True" OnSelectedIndexChanged="ddl_land_SelectedIndexChanged">
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                                灌溉日期：</td>
                            <td style="width: 200px"><asp:TextBox ID="txtIDate" runat="server" Text='<%# Bind("date") %>' Width="140px" onfocus="SelectDate(this)" onkeypress="event.returnValue = false;"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                                灌溉来源：</td>
                            <td style="width: 200px"><asp:Label ID="lblIWell" runat="server" Text='<%# Bind("well") %>' Width="120px"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                                灌溉水量：</td>
                            <td style="width: 200px"><asp:TextBox ID="irrigate_amountTextBox" runat="server" Text='<%# Bind("irrigate_amount") %>' Width="120px"></asp:TextBox>吨</td>
                        </tr>
                    </table>
                        &nbsp;&nbsp;<table border="0">
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="插入">
                        </asp:LinkButton></td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="取消">
                        </asp:LinkButton></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                        </table>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                            SelectCommand="SELECT DISTINCT farmer_name FROM seeding"></asp:SqlDataSource>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <table border="2" style="width: 360px">
                            <tr>
                                <td style="width: 160px">
                                    灌溉地块：</td>
                                <td style="width: 200px">
                        <asp:Label ID="land_idLabel" runat="server" Text='<%# Eval("land_id") %>'></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    种植户：</td>
                                <td style="width: 200px"><asp:Label ID="farmer_nameLabel" runat="server" Text='<%# Bind("farmer_name") %>'>
                        </asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    灌溉日期：</td>
                                <td style="width: 200px"><asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>'></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    灌溉来源：</td>
                                <td style="width: 200px">
                        <asp:Label ID="wellLabel" runat="server" Text='<%# Bind("well") %>'></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    灌溉水量：</td>
                                <td style="width: 200px"><asp:Label ID="irrigate_amountLabel" runat="server" Text='<%# Bind("irrigate_amount") %>' Width="1px" Height="17px"></asp:Label>吨</td>
                            </tr>
                        </table>
                        &nbsp;<table border="0">
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
                            Text="新建" ToolTip="灌溉前请先检验水质！"></asp:LinkButton></td>
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
                        选择的地块灌溉信息：<br />
                        <br />
                    </HeaderTemplate>
                </asp:FormView>
                &nbsp; &nbsp;&nbsp;&nbsp;
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                    SelectCommand="SELECT DISTINCT [land_id], [farmer_name], [well] FROM [landmanagement] WHERE ([farmer_name] = @farmer_name)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="@farmer_name" Name="farmer_name" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
