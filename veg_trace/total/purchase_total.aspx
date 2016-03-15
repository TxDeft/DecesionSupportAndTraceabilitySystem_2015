<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="purchase_total.aspx.cs" Inherits="total_purchase_total" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 90%; height: 95%">
        <tr>
            <td style="width: 95%; height :20%">
                采购物品汇总：</td>
        </tr>
        <tr>
            <td style="width: 95%; height :20%">
                选择采购员姓名：<asp:DropDownList ID="ddl1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="worker_name" DataValueField="worker_name" OnDataBound="ddl1_DataBound" Width="30%">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                    SelectCommand="SELECT DISTINCT [worker_name] FROM [worker] WHERE ([department] = @department)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="采购部" Name="department" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="width: 95%; height :60%">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="date,item" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="80%">
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:BoundField DataField="date" HeaderText="采购日期" ReadOnly="True" SortExpression="date" />
                        <asp:BoundField DataField="item" HeaderText="采购物品" ReadOnly="True" SortExpression="item" />
                        <asp:BoundField DataField="supp_name" HeaderText="供应商" SortExpression="supp_name" />
                        <asp:BoundField DataField="item_amount" HeaderText="采购量" SortExpression="item_amount" />
                        <asp:BoundField DataField="worker_id" HeaderText="采购员ID" SortExpression="worker_id" />
                        <asp:BoundField DataField="worker_name" HeaderText="采购员" SortExpression="worker_name" />
                        <asp:BoundField DataField="unit_name" HeaderText="物品单价" SortExpression="unit_name" />
                    </Columns>
                    <RowStyle BackColor="#E3EAEB" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>" SelectCommand="SELECT date, item, supp_name, item_amount, worker_id, worker_name, unit_name FROM purchase WHERE (worker_name = @worker_name)or @worker_name is null" CancelSelectOnNullParameter="False">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddl1" Name="worker_name" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
