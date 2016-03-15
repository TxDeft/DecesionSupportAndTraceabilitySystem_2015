<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="prevent.aspx.cs" Inherits="pages_purchaser_prevent" Title="防治管理" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script language="javascript" type="text/javascript" src="../../js/date.js"></script>
    <table style="width: 100%; height: 60%">
        <tr>
            <td style="height :100%;" colspan="2">
                选择种植户：<asp:DropDownList ID="ddl1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1"
                    DataTextField="farmer_name" DataValueField="farmer_name" OnDataBound="ddl1_DataBound"
                    Width="30%" AppendDataBoundItems="True">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                    SelectCommand="SELECT DISTINCT [farmer_name] FROM [farmer]"></asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" PageSize="8" Width="95%" Height="95%" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" DataKeyNames="ID" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateSelectButton="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True"
                            SortExpression="ID" Visible="False" />
                        <asp:BoundField DataField="land_id" HeaderText="地块编号" SortExpression="land_id" ReadOnly="True" />
                        <asp:BoundField DataField="farmer_name" HeaderText="农户姓名" SortExpression="farmer_name" />
                        <asp:BoundField DataField="veg_item" HeaderText="种植品种" SortExpression="veg_item" />
                        <asp:BoundField DataField="reason" HeaderText="防治原因" SortExpression="reason" />
                        <asp:BoundField DataField="prevent_way" HeaderText="防治方法" SortExpression="prevent_way" />
                        <asp:BoundField DataField="prevent_amount" HeaderText="数量" SortExpression="prevent_amount" />
                        <asp:BoundField DataField="date_begin" HeaderText="开始时间" SortExpression="date_begin" />
                        <asp:BoundField DataField="date_end" HeaderText="结束时间" SortExpression="date_end" />
                    </Columns>
                    <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                &nbsp; &nbsp;<asp:SqlDataSource ID="SqlDataSource2" runat="server" CancelSelectOnNullParameter="False"
                    ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                    DeleteCommand="DELETE FROM prevention WHERE (ID = @ID)"
                    InsertCommand="INSERT INTO prevention(land_id, farmer_name, veg_item, reason, prevent_way, prevent_amount, date_begin, date_end) VALUES (@land_id, @farmer_name, @veg_item, @reason, @prevent_way, @prevent_amount, @date_begin, @date_end)"
                    SelectCommand="SELECT ID, land_id,farmer_name,veg_item,reason,prevent_way,prevent_amount,date_begin,date_end FROM prevention WHERE (@farmer_name IS NULL) OR (farmer_name = @farmer_name)"
                    UpdateCommand="UPDATE prevention SET prevent_way = @prevent_way, prevent_amount = @prevent_amount, date_end = @date_end WHERE ID = @ID">
                    <DeleteParameters>
                        <asp:Parameter Name="ID" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="prevent_way" />
                        <asp:Parameter Name="prevent_amount" />
                        <asp:Parameter Name="date_end" />
                        <asp:Parameter Name="ID" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddl1" Name="farmer_name" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="land_id" />
                        <asp:Parameter Name="farmer_name" />
                        <asp:Parameter Name="veg_item" />
                        <asp:Parameter Name="reason" />
                        <asp:Parameter Name="prevent_way" />
                        <asp:Parameter Name="prevent_amount" />
                        <asp:Parameter Name="date_begin" />
                        <asp:Parameter Name="date_end" />
                    </InsertParameters>
                </asp:SqlDataSource>
                &nbsp;
            </td>
        </tr>
    </table>
    <table style="width: 100%; height: 40%">
        <tr>
            <td style="width: 100%; height: 10%;">
                </td>
        </tr>
        <tr>
            <td align="center" style="width: 100%; height: 30%; vertical-align: top; text-align: left; top:auto">
                <asp:FormView ID="FormView1" runat="server" Height="80%" 
                    DataSourceID="SqlDataSource2" Width="360px" 
                    OnItemCreated="FormView1_ItemCreated" CellPadding="4" ForeColor="#333333" 
                    CssClass="modify">
                    <EditItemTemplate>
                        <table border="2" style="width: 360px">
                            <tr>
                                <td style="width: 160px">
                                    地块编号:
                                </td>
                                <td style="width: 200px">
                        <asp:Label ID="lblELandId" runat="server" Text='<%# Bind("land_id") %>' Width="120px"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    农户姓名:&nbsp;</td>
                                <td style="width: 200px">
                        <asp:Label ID="lblEFarmerName" runat="server" Text='<%# Bind("farmer_name") %>' Width="120px"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    种植品种:
                                </td>
                                <td style="width: 200px">
                        <asp:Label ID="lblEVegItem" runat="server" Text='<%# Bind("veg_item") %>' Width="120px"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    防治原因:
                                </td>
                                <td style="width: 200px">
                        <asp:Label ID="lblEReason" runat="server" Text='<%# Bind("reason") %>' Width="120px"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    防治方法:
                                </td>
                                <td style="width: 200px">
                        <asp:TextBox ID="txtEPreventWay" runat="server" Text='<%# Bind("prevent_way") %>'
                            Width="120px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    数量:
                                </td>
                                <td style="width: 200px">
                        <asp:TextBox ID="txtEPreventAmount" runat="server" Text='<%# Bind("prevent_amount") %>' Width="120px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    开始时间:&nbsp;</td>
                                <td style="width: 200px">
                        <asp:Label ID="lblEDateBegin" runat="server" Text='<%# Bind("date_begin") %>' Width="120px"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    结束时间:
                                </td>
                                <td style="width: 200px">
                        <asp:TextBox ID="txtEDateEnd" runat="server" Text='<%# Bind("date_end") %>' Width="120px" onfocus="SelectDate(this)(this)" onkeypress="event.returnValue = false;"></asp:TextBox></td>
                            </tr>
                        </table>
                        <br />
                        <table border="0">
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="更新"></asp:LinkButton></td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="取消"></asp:LinkButton></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                        </table>
                        <asp:Label ID="IDLabel1" runat="server" Text='<%# Bind("ID") %>' Visible="False"></asp:Label>
                    </EditItemTemplate>
                    <InsertItemTemplate><table border="2" style="width: 360px">
                        <tr>
                            <td style="width: 160px">
                                农户姓名:</td>
                            <td style="width: 200px"><asp:DropDownList ID="ddlIFarmerName" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3"
                            DataTextField="farmer_name" DataValueField="farmer_name" OnSelectedIndexChanged="ddlIFarmerName_SelectedIndexChanged"
                            SelectedValue='<%# Bind("farmer_name") %>' Width="120px" OnDataBound="ddlIFarmerName_Bound">
                            <asp:ListItem>请选择</asp:ListItem>
                        </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                                地块编号: &nbsp;</td>
                            <td style="width: 200px"><asp:DropDownList ID="ddlILandId" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlILandId_SelectedIndexChanged"
                            Width="120px" SelectedValue='<%# Bind("land_id") %>'>
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                                种植品种:
                            </td>
                            <td style="width: 200px">
                        <asp:DropDownList ID="ddlIVegItem" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlIVegItem_SelectedIndexChanged"
                            Width="120px" SelectedValue='<%# Bind("veg_item") %>'>
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                                防治原因:
                            </td>
                            <td style="width: 200px">
                        <asp:TextBox ID="txtIReason" runat="server" Text='<%# Bind("reason") %>' Width="120px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                                防治方法:</td>
                            <td style="width: 200px">
                        <asp:TextBox ID="txtIPreventWay" runat="server" Text='<%# Bind("prevent_way") %>' Width="120px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                                数量:</td>
                            <td style="width: 200px">
                        <asp:TextBox ID="txtIPreventAmount" runat="server" Text='<%# Bind("prevent_amount") %>' Width="120px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                                开始时间:
                            </td>
                            <td style="width: 200px">
                        <asp:TextBox ID="txtIDateBegin" runat="server" Text='<%# Bind("date_begin") %>' onfocus="SelectDate(this)(this)" onkeypress="event.returnValue = false;" Width="140px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                                结束时间:
                            </td>
                            <td style="width: 200px">
                        <asp:TextBox ID="txtIDateEnd" runat="server" Text='<%# Bind("date_end") %>' onfocus="SelectDate(this)(this)" onkeypress="event.returnValue = false;" Width="120px"></asp:TextBox></td>
                        </tr>
                    </table>
                        <br />
                        <table border="0">
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
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                            SelectCommand="SELECT DISTINCT farmer_name FROM seeding"></asp:SqlDataSource>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <table border="2" style="width: 360px">
                            <tr>
                                <td style="width: 160px">
                        地块编号</td>
                                <td style="width: 200px">
                        <asp:Label ID="land_idLabel" runat="server" Text='<%# Bind("land_id") %>' Width="120px"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    农户姓名:
                                </td>
                                <td style="width: 200px">
                        <asp:Label ID="farmer_nameLabel" runat="server" Text='<%# Bind("farmer_name") %>' Width="120px"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    种植品种:
                                </td>
                                <td style="width: 200px">
                        <asp:Label ID="veg_itemLabel" runat="server" Text='<%# Bind("veg_item") %>' Width="120px"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px; height: 23px;">
                                    防治原因:
                                </td>
                                <td style="width: 200px; height: 23px;">
                        <asp:Label ID="reasonLabel" runat="server" Text='<%# Bind("reason") %>' Width="120px"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    防治方法
                                </td>
                                <td style="width: 200px">
                        <asp:Label ID="prevent_wayLabel" runat="server" Text='<%# Bind("prevent_way") %>' Width="120px"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    数量:
                                </td>
                                <td style="width: 200px">
                        <asp:Label ID="prevent_amountLabel" runat="server" Text='<%# Bind("prevent_amount") %>' Width="120px"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    开始时间:
                                </td>
                                <td style="width: 200px">
                        <asp:Label ID="date_beginLabel" runat="server" Text='<%# Bind("date_begin") %>' Width="120px"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                        结束时间
                                </td>
                                <td style="width: 200px">
                        <asp:Label ID="date_endLabel" runat="server" Text='<%# Bind("date_end") %>' Width="120px"></asp:Label></td>
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
                        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="删除"></asp:LinkButton></td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="新建"></asp:LinkButton></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                        </table>
                        <asp:Label ID="IDLabel" runat="server" Text='<%# Bind("ID") %>' Visible="False"></asp:Label>
                    </ItemTemplate>
                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                    <EditRowStyle BackColor="#999999" />
                    <RowStyle ForeColor="#333333" BackColor="#F7F6F3" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderTemplate>
                        选择的病虫害防治信息：<br />
                        <br />
                    </HeaderTemplate>
                </asp:FormView>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
