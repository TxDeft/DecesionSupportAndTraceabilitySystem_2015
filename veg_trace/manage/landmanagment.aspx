<%@ Page Title="地块分配管理" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="landmanagment.aspx.cs" Inherits="manage_landmanagment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label2" runat="server" Text="种植户："></asp:Label>
    <asp:DropDownList ID="ddl" runat="server" DataSourceID="SqlDataSource1"
                    DataTextField="farmer_name" DataValueField="farmer_name" 
        Width="30%" AutoPostBack="True" 
        AppendDataBoundItems="True" >
                </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>" 
        SelectCommand="SELECT DISTINCT [farmer_name] FROM [farmer]" 
        >
    </asp:SqlDataSource>
    <br />
    <asp:Label ID="Label3" runat="server" Text="未分配地块："></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server" 
        DataSourceID="SqlDataSource2" DataTextField="land_id" DataValueField="land_id" 
        Height="16px" Width="280px">
        <asp:ListItem></asp:ListItem>
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>" 
        SelectCommand="SELECT land_id FROM land WHERE (land_id NOT IN (SELECT land_id FROM landmanagement))">
    </asp:SqlDataSource>
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="确定分配" />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="land_id" 
        DataSourceID="SqlDataSource5" EnableModelValidation="True" CellPadding="4" 
        ForeColor="#333333" GridLines="None" 
        onrowdatabound="GridView1_RowDataBound" onrowdeleted="GridView1_RowDeleted">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="删除" OnClientClick="javascript:return confirm('真的要删除吗？');"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="land_id" HeaderText="land_id" ReadOnly="True" 
                SortExpression="land_id" />
            <asp:BoundField DataField="farmer_id" HeaderText="farmer_id" 
                SortExpression="farmer_id" />
            <asp:BoundField DataField="farmer_name" HeaderText="farmer_name" 
                SortExpression="farmer_name" />
            <asp:BoundField DataField="area" HeaderText="area" SortExpression="area" />
            <asp:BoundField DataField="address" HeaderText="address" 
                SortExpression="address" />
            <asp:BoundField DataField="well" HeaderText="well" SortExpression="well" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
        ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>" 
        DeleteCommand="DELETE FROM [landmanagement] WHERE [land_id] = @land_id" 
        InsertCommand="INSERT INTO [landmanagement] ([land_id], [farmer_id], [farmer_name], [area], [address], [well]) VALUES (@land_id, @farmer_id, @farmer_name, @area, @address, @well)" 
        SelectCommand="SELECT * FROM [landmanagement]" 
        UpdateCommand="UPDATE [landmanagement] SET [farmer_id] = @farmer_id, [farmer_name] = @farmer_name, [area] = @area, [address] = @address, [well] = @well WHERE [land_id] = @land_id">
        <DeleteParameters>
            <asp:Parameter Name="land_id" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="land_id" Type="String" />
            <asp:Parameter Name="farmer_id" Type="String" />
            <asp:Parameter Name="farmer_name" Type="String" />
            <asp:Parameter Name="area" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="well" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="farmer_id" Type="String" />
            <asp:Parameter Name="farmer_name" Type="String" />
            <asp:Parameter Name="area" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="well" Type="String" />
            <asp:Parameter Name="land_id" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>" 
        SelectCommand="SELECT [land_id], [area], [address], [well] FROM [land] WHERE ([land_id] = @land_id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="land_id" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>" 
        SelectCommand="SELECT [farmer_id] FROM [farmer] WHERE ([farmer_name] = @farmer_name)">
        <SelectParameters>
            <asp:Parameter Name="farmer_name" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

