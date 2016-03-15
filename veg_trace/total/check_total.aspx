<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="check_total.aspx.cs" Inherits="pages_total_check_total" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 90%; height: 95%">
        <tr>
            <td style="width: 95%; height :20%">
                检测结果汇总</td>
        </tr>
        <tr>
            <td style="width: 95%; height :20%">
                选择农户姓名：<asp:DropDownList ID="ddl1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="farmer_name" DataValueField="farmer_name" OnDataBound="ddl1_DataBound" Width="30%">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                    SelectCommand="SELECT DISTINCT [farmer_name] FROM [farmer]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="width: 95%; height :60%">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="80%" DataKeyNames="land_id,veg_item">
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#E3EAEB" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="land_id" HeaderText="地块编号" ReadOnly="True" SortExpression="land_id" />
                        <asp:BoundField DataField="farmer_name" HeaderText="农户姓名" SortExpression="farmer_name" />
                        <asp:BoundField DataField="veg_item" HeaderText="检验品种" ReadOnly="True" SortExpression="veg_item" />
                        <asp:BoundField DataField="worker_id" HeaderText="检验员编号" SortExpression="worker_id" />
                        <asp:BoundField DataField="worker_name" HeaderText="检验员姓名" SortExpression="worker_name" />
                        <asp:BoundField DataField="date" HeaderText="检验日期" SortExpression="date" />
                        <asp:BoundField DataField="A0" HeaderText="A0" SortExpression="A0" />
                        <asp:BoundField DataField="A1" HeaderText="A1" SortExpression="A1" />
                        <asp:BoundField DataField="re" HeaderText="re" SortExpression="re" />
                        <asp:BoundField DataField="result" HeaderText="检验结果" SortExpression="result" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                    SelectCommand="SELECT land_id, farmer_name, veg_item, worker_id, worker_name, date, A0, A1, re, result FROM checking WHERE (farmer_name = @farmer_name) OR (@farmer_name IS NULL)" CancelSelectOnNullParameter="False">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddl1" Name="farmer_name" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
