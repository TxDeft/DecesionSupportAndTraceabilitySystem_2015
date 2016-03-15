<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="plantplan.aspx.cs" Inherits="pages_purchaser_plantplan" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript" src="../../js/date.js"></script>
    <table style="width: 100%; height :35%;">
        <tr>
            <td style="height: 15%;" colspan="2">
                选择种植户：<asp:DropDownList ID="ddl1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="farmer_name" DataValueField="farmer_name" Width="25%" OnDataBound="ddl1_DataBound" >
                </asp:DropDownList>&nbsp;
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>" SelectCommand="SELECT DISTINCT [farmer_name] FROM [farmer]"></asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Height="85%" Width="95%" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataSourceID="SqlDataSource2" AllowPaging="True" DataKeyNames="land_id,date" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="land_id" HeaderText="地块编号" ReadOnly="True" SortExpression="land_id" />
                        <asp:BoundField DataField="farmer_name" HeaderText="种植户" SortExpression="farmer_name" />
                        <asp:BoundField DataField="date" HeaderText="计划日期" ReadOnly="True" SortExpression="date" />
                        <asp:BoundField DataField="veg_item" HeaderText="计划种植品种" SortExpression="veg_item" />
                        <asp:BoundField DataField="veg_origin" HeaderText="种子来源" SortExpression="veg_origin" />
                    </Columns>
                    <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                &nbsp;&nbsp;&nbsp;<asp:SqlDataSource ID="SqlDataSource2" runat="server"
                    ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                    DeleteCommand="DELETE FROM plantplan WHERE (land_id = @land_id) AND (date = @date)"
                    InsertCommand="INSERT INTO plantplan(land_id, farmer_name, date, veg_item, veg_origin) VALUES (@land_id, @farmer_name, @date, @veg_item, @veg_origin)" SelectCommand="SELECT land_id, farmer_name, date, veg_item, veg_origin FROM plantplan WHERE (@farmer_name IS NULL) OR (farmer_name = @farmer_name)"
                    UpdateCommand="UPDATE plantplan SET farmer_name = @farmer_name, veg_item = @veg_item, veg_origin = @veg_origin WHERE (date = @date) AND (land_id = @land_id)" CancelSelectOnNullParameter="False">
                    <DeleteParameters>
                        <asp:Parameter Name="land_id" />
                        <asp:Parameter Name="date" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="farmer_name" Type="String" />
                        <asp:Parameter Name="veg_item" />
                        <asp:Parameter Name="veg_origin" />
                        <asp:Parameter Name="date" />
                        <asp:Parameter Name="land_id" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="land_id" />
                        <asp:Parameter Name="farmer_name" Type="String" />
                        <asp:Parameter Name="date" />
                        <asp:Parameter Name="veg_item" />
                        <asp:Parameter Name="veg_origin" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddl1" Name="farmer_name" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <table style ="width :100%; height :30%;">
        <tr>
            <td style="height :75%; width: 511px;" align="left" valign="top" >
                &nbsp;&nbsp;&nbsp;
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="land_id,date" DataSourceID="SqlDataSource2"
                    Width="360px" OnItemCreated="FormView1_ItemCreated" CellPadding="4" ForeColor="#333333">
                    <EditItemTemplate>
                        <table border="2" cellpadding="0" cellspacing="0" style="width: 100%; text-align: left">
                            <tr>
                                <td style="width: 160px; height: 19px;">
                                    地块编号：</td>
                                <td style="width: 200px; height: 19px;">
                                    <asp:Label ID="land_idLabel1" runat="server" Text='<%# Bind("land_id") %>' Width="145px"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    种植户：</td>
                                <td style="width: 200px">
                        <asp:Label ID="farmerLabel" runat="server" Text='<%# Bind("farmer_name") %>' Width="145px"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    计划日期：</td>
                                <td style="width: 200px">
                                    <asp:Label ID="lblDate" runat="server" Text='<%# Bind("date") %>' Width="145px"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    计划种植品种：</td>
                                <td style="width: 200px">
                                    <asp:DropDownList ID="ddlEVegItem" runat="server" DataSourceID="SqlDataSource3"
                            DataTextField="supp_item" DataValueField="supp_item" OnSelectedIndexChanged="ddlEVegItem_SelectedIndexChanged"
                            SelectedValue='<%# Bind("veg_item") %>' AutoPostBack="True" Width="145px">
                        </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    种子来源：</td>
                                <td style="width: 200px">
                                    <asp:DropDownList ID="ddlEVegOrign" runat="server" 
                            Width="145px" SelectedValue='<%# Bind("veg_origin") %>' value="A种子公司" DataSourceID="SqlDataSource4" DataTextField="supp_name" DataValueField="supp_name">
                        </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td align="center" colspan="1">
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="更新"></asp:LinkButton></td>
                                <td align="center" colspan="2">
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="取消"></asp:LinkButton></td>
                            </tr>
                        </table>
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                            SelectCommand="SELECT DISTINCT supp_item FROM supporter WHERE (item_type = '种子')">
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                            SelectCommand="SELECT DISTINCT supp_name FROM supporter WHERE (item_type = '种子')">
                        </asp:SqlDataSource>
                        &nbsp;
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <table border="2" cellpadding="0" cellspacing="0" style="width: 360px; text-align: left">
                            <tr>
                                <td style="width: 160px; text-align: left">
                                    种植户：</td>
                                <td style="width: 200px">
                                    <asp:DropDownList ID="ddlEFarmerName" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource5"
                            DataTextField="farmer_name" DataValueField="farmer_name" OnSelectedIndexChanged="ddlEFarmerName_SelectedIndexChanged"
                            Width="120px" SelectedValue='<%# Bind("farmer_name") %>'>
                                        <asp:ListItem>请选择</asp:ListItem>
                        </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td style="width: 160px; height: 22px;">
                                    地块编号：</td>
                                <td style="width: 200px; height: 22px;">
                                    <asp:DropDownList ID="ddlELandId" runat="server" SelectedValue='<%# Bind("land_id") %>'
                            Width="120px">
                                        <asp:ListItem></asp:ListItem>
                        </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                        制定计划日期：</td>
                                <td style="width: 200px">
                                    <asp:TextBox ID="txtIDate" runat="server" Text='<%# Bind("date") %>' Width="140px"  onfocus="SelectDate(this)" onkeypress="event.returnValue = false;"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="width: 160px; height: 24px;">
                                    计划种植品种：
                                </td>
                                <td style="width: 200px; height: 24px;">
                                    <asp:DropDownList ID="ddlIVegItem" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource6"
                            DataTextField="supp_item" DataValueField="supp_item" SelectedValue='<%# Bind("veg_item") %>'
                            Width="120px" OnSelectedIndexChanged="ddl_veg_SelectedIndexChanged" OnDataBound="ddlIVegItem_DataBound">
                                        <asp:ListItem>请选择</asp:ListItem>
                        </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    种子来源：</td>
                                <td style="width: 200px">
                        <asp:DropDownList ID="ddlIVegOrigin" runat="server" SelectedValue='<%# Bind("veg_origin") %>'
                            Width="120px">
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                </td>
                                <td style="width: 200px">
                                    &nbsp;</td>
                            </tr>
                        </table>
                        <table border="0" cellpadding="2" cellspacing="0" style="width: 100%; text-align: center">
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="插入" Width="60px"></asp:LinkButton></td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="取消" Width="58px"></asp:LinkButton></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                            SelectCommand="SELECT farmer_name FROM farmer"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                            SelectCommand="SELECT DISTINCT [supp_item] FROM [supporter] WHERE ([item_type] = '种子')">
                        </asp:SqlDataSource>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <table border="2" cellpadding="0" cellspacing="0" style="width: 360px; text-align: left">
                            <tr>
                                <td style="width: 160px; height: 19px">
                                    地块编号：</td>
                                <td style="width: 200px; height: 19px">
                        <asp:Label ID="land_idLabel" runat="server" Text='<%# Eval("land_id") %>' Width="145px"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    种植户：</td>
                                <td style="width: 200px">
                                    <asp:Label ID="farmer_nameLabel" runat="server" Text='<%# Bind("farmer_name") %>' Width="145px"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    计划日期：</td>
                                <td style="width: 200px">
                                    <asp:Label ID="lblDate" runat="server" Text='<%# Bind("date") %>' Width="145px"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    计划种植品种：</td>
                                <td style="width: 200px">
                                    <asp:Label ID="veg_itemLabel" runat="server" Text='<%# Bind("veg_item") %>' Width="145px"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    种子来源：</td>
                                <td style="width: 200px">
                        <asp:Label ID="veg_originLabel" runat="server" Text='<%# Bind("veg_origin") %>' Width="145px"></asp:Label></td>
                            </tr>
                        </table>
                        &nbsp;
                        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; text-align: center">
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="编辑" Width="40px"></asp:LinkButton></td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete"
                            Text="删除" OnClientClick="return confirm('确定删除这条数据？')" Width="45px"></asp:LinkButton></td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="新建" Width="42px"></asp:LinkButton></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                    <EditRowStyle BackColor="#999999" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderTemplate>
                        &nbsp; 选择的种植计划信息：<br />
                        <br />
                    </HeaderTemplate>
                </asp:FormView>
                &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
        </tr>
    </table>
</asp:Content>