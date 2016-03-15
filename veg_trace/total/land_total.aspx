<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="land_total.aspx.cs" Inherits="total_land_total" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 90%; height: 95%">
        <tr>
            <td style="width: 95%; height :15%">
                地块信息汇总：</td>
        </tr>
        <tr>
            <td style="width: 95%; height :35%">
                &nbsp;<asp:GridView ID="GridView1" runat="server" Height="95%" Width="90%" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="land_id" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="6">
                    <Columns>
                        <asp:BoundField DataField="land_id" HeaderText="地块编号" ReadOnly="True" SortExpression="land_id" />
                        <asp:BoundField DataField="area" HeaderText="面积" SortExpression="area" />
                        <asp:BoundField DataField="address" HeaderText="地块位置" SortExpression="address" />
                        <asp:BoundField DataField="well" HeaderText="地块井源" SortExpression="well" />
                    </Columns>
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#E3EAEB" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>" SelectCommand="SELECT * FROM [land]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="width: 95%; height :11%">
                种植计划汇总：</td>
        </tr>
        <tr>
            <td style="width: 95%; height: 40%">
                <asp:GridView ID="GridView2" runat="server" Height="95%" Width="90%" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="land_id" DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="6">
                    <Columns>
                        <asp:BoundField DataField="land_id" HeaderText="地块编号" ReadOnly="True" SortExpression="land_id" />
                        <asp:BoundField DataField="farmer_name" HeaderText="种植户" SortExpression="farmer_name" />
                        <asp:BoundField DataField="veg_item" HeaderText="种植品种" SortExpression="veg_item" />
                        <asp:BoundField DataField="date" HeaderText="制定计划日期" SortExpression="date" />
                    </Columns>
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#E3EAEB" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                    SelectCommand="SELECT * FROM [plantplan]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
