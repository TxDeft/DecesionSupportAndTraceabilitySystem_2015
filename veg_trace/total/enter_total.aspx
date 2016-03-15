<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="enter_total.aspx.cs" Inherits="pages_purducer_enter_total" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:90%; height: 95%">
        <tr>
            <td colspan="3" style="width: 95%; height: 20%">
                入库信息汇总</td>
        </tr>
        <tr>
            <td colspan="3" style="width: 95%; height: 20%">
                请选择追溯码：<asp:DropDownList ID="ddl1" runat="server" AutoPostBack="True" Width="30%" DataSourceID="SqlDataSource2" DataTextField="trace_num" DataValueField="trace_num" OnDataBound="ddl1_DataBound">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                    SelectCommand="SELECT DISTINCT [trace_num] FROM [enter]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="width: 95%; height :60%">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="80%" DataKeyNames="trace_num">
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#E3EAEB" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="trace_num" HeaderText="追溯码" ReadOnly="True" SortExpression="trace_num" />
                        <asp:BoundField DataField="veg_item" HeaderText="品种" SortExpression="veg_item" />
                        <asp:BoundField DataField="enter_amount" HeaderText="入库量" SortExpression="enter_amount" />
                        <asp:BoundField DataField="date" HeaderText="入库时间" SortExpression="date" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                    SelectCommand="SELECT trace_num, veg_item, enter_amount, date, unit_price, total_price FROM enter WHERE (trace_num = @trace_num) OR (@trace_num IS NULL)" CancelSelectOnNullParameter="False">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddl1" Name="trace_num" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

