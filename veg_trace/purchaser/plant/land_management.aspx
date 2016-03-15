<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="land_management.aspx.cs" Inherits="pages_purchaser_land_management" Title="地块分配" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 95%; height :15%;">
        <tr>
            <td colspan="2">
                &nbsp;选择种植户：<asp:DropDownList ID="ddl1" runat="server" DataSourceID="SqlDataSource1"
                    DataTextField="farmer_name" DataValueField="farmer_name" Width="30%" AutoPostBack="True" OnDataBound="ddl1_DataBound" AppendDataBoundItems="True" OnSelectedIndexChanged="ddl1_SelectedIndexChanged" >
                </asp:DropDownList>&nbsp;
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>" SelectCommand="SELECT DISTINCT [farmer_name] FROM [farmer]"></asp:SqlDataSource>
                &nbsp; &nbsp; &nbsp;&nbsp;
            </td>
        </tr>
    </table>
    <table style ="width :95%; height :85%;">
        <tr>
            <td colspan="2" style=" height :60%; width: 512px;" align="center">
                &nbsp;<asp:GridView ID="GridView1" runat="server" AllowPaging="True"
                    AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Height="85%" Width="95%" DataKeyNames="land_id" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" PageSize="8" CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="land_id" HeaderText="地块编号" ReadOnly="True" SortExpression="land_id" />
                        <asp:BoundField DataField="farmer_name" HeaderText="种植户" SortExpression="farmer_name" />
                        <asp:BoundField DataField="area" HeaderText="面积" SortExpression="area" />
                        <asp:BoundField DataField="address" HeaderText="地块位置" SortExpression="address" />
                        <asp:BoundField DataField="well" HeaderText="灌溉来源" SortExpression="well" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                    ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>" SelectCommand="SELECT land_id, farmer_name, area, address, well FROM landmanagement WHERE (@farmer_name IS NULL) OR (farmer_name = @farmer_name)" CancelSelectOnNullParameter="False" UpdateCommand="UPDATE landmanagement SET farmer_name = @farmer_name, area = @area, address = @address, well = @well WHERE (land_id = @land_id)" DeleteCommand="DELETE FROM landmanagement WHERE (land_id = @land_id)" InsertCommand="INSERT INTO landmanagement(land_id, farmer_name, area, address, well) VALUES (@land_id, @farmer_name, @area, @address, @well)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddl1" Name="farmer_name" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="farmer_name" />
                        <asp:Parameter Name="area" />
                        <asp:Parameter Name="address" />
                        <asp:Parameter Name="well" />
                        <asp:Parameter Name="land_id" />
                    </UpdateParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="land_id" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="land_id" />
                        <asp:Parameter Name="farmer_name" />
                        <asp:Parameter Name="area" />
                        <asp:Parameter Name="address" />
                        <asp:Parameter Name="well" />
                    </InsertParameters>
                </asp:SqlDataSource>
                &nbsp; &nbsp;
                </td>
        </tr>
        <tr>
            <td style="height :40%; width: 512px;" align="center" colspan="2" >
                <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource2"
                    Width="96%" DataKeyNames="land_id" CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" GridLines="Both">
                    <HeaderTemplate>
                        地块详细基本信息：<br />
                    </HeaderTemplate>
                    <EditItemTemplate>
                        地块编号：
                        <asp:Label ID="land_idLabel1" runat="server" Text='<%# Bind("land_id") %>'></asp:Label><br />
                        种植户：<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3"
                            DataTextField="farmer_name" DataValueField="farmer_name" SelectedValue='<%# Bind("farmer_name") %>'
                            Width="45%">
                        </asp:DropDownList>
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                            SelectCommand="SELECT DISTINCT [farmer_name] FROM [farmer]"></asp:SqlDataSource>
                        <br />
                        面积：<asp:Label ID="areaLabel" runat="server" Text='<%# Bind("area") %>'></asp:Label>
                        <br />
                        地块位置：<asp:Label ID="addressLabel" runat="server" Text='<%# Bind("address") %>'></asp:Label>&nbsp;<br />
                        灌溉来源：
                        <asp:Label ID="wellLabel" runat="server" Text='<%# Bind("well") %>'></asp:Label><br />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="更新"></asp:LinkButton>
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="取消"></asp:LinkButton>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        地块编号：<asp:DropDownList ID="ddl_land" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4"
                            DataTextField="land_id" DataValueField="land_id" SelectedValue='<%# Bind("land_id") %>'
                            Width="45%">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                            SelectCommand="SELECT DISTINCT [land_id] FROM [land]"></asp:SqlDataSource>
                        <br />
                        面积：&nbsp;<asp:DropDownList ID="ddl_area" runat="server" SelectedValue='<%# Bind("area") %>'
                            Width="35%">
                        </asp:DropDownList>亩<br />
                        地块位置：<asp:DropDownList ID="ddl_address" runat="server" SelectedValue='<%# Bind("address") %>'
                            Width="50%">
                        </asp:DropDownList><br />
                        &nbsp;灌溉来源：
                        <asp:DropDownList ID="ddl_well" runat="server" SelectedValue='<%# Bind("well") %>'
                            Width="45%">
                        </asp:DropDownList>
                        <br />
                        <br />
                        种植户：<asp:DropDownList ID="ddl_farmer" runat="server" DataSourceID="SqlDataSource5"
                            DataTextField="farmer_name" DataValueField="farmer_name" SelectedValue='<%# Bind("farmer_name") %>'
                            Width="45%">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                            SelectCommand="SELECT DISTINCT [farmer_name] FROM [farmer]"></asp:SqlDataSource>
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="插入">
                        </asp:LinkButton>
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="取消">
                        </asp:LinkButton>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        地块编号：
                        <asp:Label ID="land_idLabel" runat="server" Text='<%# Eval("land_id") %>'></asp:Label><br />
                        种植户：
                        <asp:Label ID="farmer_nameLabel" runat="server" Text='<%# Bind("farmer_name") %>'></asp:Label><br />
                        面积：<asp:Label ID="areaLabel" runat="server" Text='<%# Bind("area") %>'></asp:Label><br />
                        地块位置：
                        <asp:Label ID="addressLabel" runat="server" Text='<%# Bind("address") %>'></asp:Label><br />
                        灌溉来源：<asp:Label ID="wellLabel" runat="server" Text='<%# Bind("well") %>'></asp:Label><br />
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
                </asp:FormView>
                &nbsp; &nbsp;
                &nbsp;
                &nbsp;&nbsp; &nbsp; &nbsp;
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                    SelectCommand="SELECT DISTINCT [land_id], [area], [address], [well] FROM [land] WHERE ([land_id] = @land_id)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="@land_id" Name="land_id" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
