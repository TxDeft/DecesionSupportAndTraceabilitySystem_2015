<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="seeding.aspx.cs" Inherits="pages_purchaser_seeding" Title="播种管理" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript" src="../../js/date.js"></script>
    <table style=" width:100%; height:35%">
        <tr>
            <td style="height: 100%" colspan="2">
                &nbsp; 选择种植户： &nbsp;
                <asp:DropDownList ID="ddl1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1"
                    DataTextField="farmer_name" DataValueField="farmer_name" OnDataBound="ddl1_DataBound"
                    Width="30%" AppendDataBoundItems="True">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                    SelectCommand="SELECT DISTINCT [farmer_name] FROM [farmer]" CancelSelectOnNullParameter="False"></asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" Height="95%" Width="99%" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="land_id,date" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" PageSize="6" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="land_id" HeaderText="播种地块" ReadOnly="True" SortExpression="land_id" />
                        <asp:BoundField DataField="farmer_name" HeaderText="种植户" SortExpression="farmer_name" />
                        <asp:BoundField DataField="date" HeaderText="播种日期" ReadOnly="True" SortExpression="date" />
                        <asp:BoundField DataField="veg_item" HeaderText="播种品种" SortExpression="veg_item" />
                        <asp:BoundField DataField="seed_origin" HeaderText="种子来源" SortExpression="seed_origin" />
                        <asp:BoundField DataField="seed_amount" HeaderText="播种数量" SortExpression="seed_amount" />
                    </Columns>
                    <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                    DeleteCommand="DELETE FROM seeding WHERE (land_id = @land_id) AND (date = @date)"
                    InsertCommand="INSERT INTO seeding(land_id, farmer_name, date, veg_item, seed_origin, seed_amount) VALUES (@land_id, @farmer_name, @date, @veg_item, @seed_origin, @seed_amount)"
                    SelectCommand="SELECT land_id, farmer_name, date, veg_item, seed_origin, seed_amount FROM seeding WHERE (@farmer_name IS NULL) OR (farmer_name = @farmer_name)"
                    UpdateCommand="UPDATE seeding SET farmer_name = @farmer_name, veg_item = @veg_item, seed_origin = @seed_origin, seed_amount = @seed_amount WHERE (land_id = @land_id) AND (date = @date)" CancelSelectOnNullParameter="False">
                    <DeleteParameters>
                        <asp:Parameter Name="land_id" />
                        <asp:Parameter Name="date" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="farmer_name" />
                        <asp:Parameter Name="veg_item" />
                        <asp:Parameter Name="seed_origin" />
                        <asp:Parameter Name="seed_amount" />
                        <asp:Parameter Name="land_id" />
                        <asp:Parameter Name="date" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddl1" Name="farmer_name" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="land_id" />
                        <asp:Parameter Name="farmer_name" />
                        <asp:Parameter Name="date" />
                        <asp:Parameter Name="veg_item" />
                        <asp:Parameter Name="seed_origin" />
                        <asp:Parameter Name="seed_amount" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <table style="width: 100%; height: 30%">
        <tr>
            <td style="width: 100%; height :25%">
                </td>
        </tr>
        <tr>
            <td style="width: 100%; height: 75%; vertical-align: top; text-align: left;" align="center">
                &nbsp;<asp:FormView ID="FormView1" runat="server" Height="85%" DataKeyNames="land_id,date" DataSourceID="SqlDataSource2" Width="360px" OnItemCreated="FormView1_ItemCreated" CellPadding="4" ForeColor="#333333">
                    <EditItemTemplate>
                        <table border="2">
                            <tr>
                                <td style="width: 160px">
                                    播种地块：</td>
                                <td style="width: 200px">
                        <asp:Label ID="land_idLabel1" runat="server" Text='<%# Eval("land_id") %>'></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    种植户：</td>
                                <td style="width: 200px">
                        <asp:Label ID="farmerLabel" runat="server" Text='<%# Bind("farmer_name") %>'></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    播种日期：
                                </td>
                                <td style="width: 200px">
                        <asp:Label ID="dateLabel1" runat="server" Text='<%# Bind("date") %>'></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    播种品种：</td>
                                <td style="width: 200px">
                        <asp:Label ID="vegLabel" runat="server" Text='<%# Bind("veg_item") %>'></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    种子来源：</td>
                                <td style="width: 200px">
                                    <asp:Label ID="originLabel" runat="server" Text='<%# Bind("seed_origin") %>'></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    播种数量：</td>
                                <td style="width: 200px">
                        <asp:TextBox ID="seed_amountTextBox" runat="server" Text='<%# Bind("seed_amount") %>' Width="40%"></asp:TextBox>克</td>
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
                                <td style="width: 100px; text-align: right">
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="取消">
                        </asp:LinkButton></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                        </table>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <table border="2">
                            <tr>
                                <td style="width: 160px">
                                    种植户：</td>
                                <td style="width: 100px">
                                    <asp:DropDownList ID="ddlIFarmerName" runat="server" AutoPostBack="True" SelectedValue='<%# Bind("farmer_name") %>' DataSourceID="SqlDataSource3" DataTextField="farmer_name" DataValueField="farmer_name" OnSelectedIndexChanged="ddlIFarmerName_SelectedIndexChanged" Width="120px" OnDataBound="ddlIFarmerName_databound">
                            <asp:ListItem Selected="True">请选择</asp:ListItem>
                        </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    播种地块：</td>
                                <td style="width: 200px">
                                    <asp:DropDownList ID="ddlILandId" runat="server" SelectedValue='<%# Bind("land_id") %>'
                            Width="120px" AutoPostBack="True" OnSelectedIndexChanged="ddlILandId_SelectedIndexChanged">
                            <asp:ListItem Selected="True"></asp:ListItem>
                        </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                        播种时间：</td>
                                <td style="width: 200px">
                                    <asp:TextBox ID="txtIDate" runat="server" Text='<%# Bind("date") %>' Width="138px" onfocus="SelectDate(this)(this)" onkeypress="event.returnValue = false;"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    播种品种：</td>
                                <td style="width: 200px">
                                    <asp:Label ID="lblIVegItem" runat="server" Text='<%# Bind("veg_item") %>' Width="120px"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    种子来源：</td>
                                <td style="width: 200px">
                                    <asp:Label ID="lblISeedOrigin" runat="server" Text='<%# Bind("seed_origin") %>' Width="120px"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    播种数量：</td>
                                <td style="width: 200px">
                                    <asp:TextBox ID="seed_amountTextBox" runat="server" Text='<%# Bind("seed_amount") %>' Width="120px"></asp:TextBox>克</td>
                            </tr>
                        </table>
                        <br />
                        <table border="0">
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="插入"></asp:LinkButton></td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="取消">
                        </asp:LinkButton></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                        </table>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                            SelectCommand="SELECT DISTINCT farmer_name FROM plantplan"></asp:SqlDataSource>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <table border="2" align="left">
                            <tr>
                                <td style="width: 200px; text-align: left;">
                                    播种地块：</td>
                                <td style="width: 200px; text-align: left;">
                        <asp:Label ID="land_idLabel" runat="server" Text='<%# Eval("land_id") %>'></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 200px; text-align: left;">
                                    种植户：</td>
                                <td style="width: 200px; text-align: left;">
                                    <asp:Label ID="farmer_nameLabel" runat="server" Text='<%# Bind("farmer_name") %>'>
                        </asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 200px; text-align: left;">
                                    播种日期：</td>
                                <td style="width: 200px; text-align: left;">
                        <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>'></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 200px; text-align: left;">
                        种植品种：</td>
                                <td style="width: 200px; text-align: left;">
                        <asp:Label ID="veg_itemLabel" runat="server" Text='<%# Bind("veg_item") %>'></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 200px; text-align: left;">
                                    种子来源：</td>
                                <td style="width: 200px; text-align: left;">
                                    <asp:Label ID="seed_originLabel" runat="server" Text='<%# Bind("seed_origin") %>'>
                        </asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 200px; text-align: left;">
                                    播种数量：</td>
                                <td style="width: 200px; text-align: left;">
                                    <asp:Label ID="seed_amountLabel" runat="server" Text='<%# Bind("seed_amount") %>'>
                        </asp:Label></td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <table>
                           <tr>
                               <td style="width:33%">
                                   &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                               <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                                Text="编辑"></asp:LinkButton></td>
                               <td style="width:33.3%; text-align: center;">
                               <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete"
                            Text="删除" OnClientClick="return confirm('确定删除这条数据？')"></asp:LinkButton>&nbsp;
                               </td>
                               <td style="width:33.3%">
                               <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="新建" ToolTip="播种之前，请检查是否对该地块进行了消毒处理、基肥施加、种子的预处理？"></asp:LinkButton></td>
                           </tr>
                        </table>
                    </ItemTemplate>
                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                    <EditRowStyle BackColor="#999999" />
                    <RowStyle ForeColor="#333333" BackColor="#F7F6F3" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderTemplate>
                        选择的地块播种信息：<br />
                        <br />
                    </HeaderTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                    SelectCommand="SELECT DISTINCT [land_id], [veg_item], [veg_origin], [farmer_name] FROM [plantplan] WHERE ([farmer_name] = @farmer_name)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="@farmer_name" Name="farmer_name" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>