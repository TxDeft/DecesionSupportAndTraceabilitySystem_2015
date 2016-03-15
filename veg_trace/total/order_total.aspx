<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="order_total.aspx.cs" Inherits="pages_purducer_order_total" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:90%; height: 95%">
        <tr>
            <td colspan="3" style="width: 95%; height: 20%">
                订单汇总</td>
        </tr>
        <tr>
            <td colspan="3" style="width: 95%; height: 20%">
                选择订购超市：<asp:DropDownList ID="ddl1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="super_name" DataValueField="super_name" OnDataBound="ddl1_DataBound" Width="30%">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                    SelectCommand="SELECT DISTINCT [super_name] FROM [supermarket]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="width: 95%; height :60%">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="order_id,veg_item" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="80%">
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:BoundField DataField="order_id" HeaderText="订单号" ReadOnly="True" SortExpression="order_id" />
                        <asp:BoundField DataField="veg_item" HeaderText="订购品种" ReadOnly="True" SortExpression="veg_item" />
                        <asp:BoundField DataField="veg_amount" HeaderText="订购量" SortExpression="veg_amount" />
                        <asp:BoundField DataField="super_name" HeaderText="订购超市" SortExpression="super_name" />
                        <asp:BoundField DataField="date" HeaderText="订购日期" SortExpression="date" />
                    </Columns>
                    <RowStyle BackColor="#E3EAEB" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                    SelectCommand="SELECT order_id, veg_item, veg_amount, super_name, date FROM orderby WHERE (super_name = @super_name)or @super_name is null" CancelSelectOnNullParameter="False">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddl1" Name="super_name" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
