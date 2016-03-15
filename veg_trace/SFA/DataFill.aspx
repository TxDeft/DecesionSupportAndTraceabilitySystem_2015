<%@ Page Title="" Language="C#" MasterPageFile="~/SFA/MasterPage_SFA.master" AutoEventWireup="true" CodeFile="DataFill.aspx.cs" Inherits="SFA_DataFill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Label ID="Label5" runat="server" Text="Y："></asp:Label>
<asp:TextBox ID="TextBox5" runat="server" Width="120px"></asp:TextBox>
<asp:Label ID="Label1" runat="server" Text="X1:"></asp:Label>
<asp:TextBox ID="TextBox1" runat="server" Width="120px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Label ID="Label2" runat="server" Text="X2："></asp:Label>
<asp:TextBox ID="TextBox2" runat="server" Width="120px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Label ID="Label3" runat="server" Text="X3："></asp:Label>
<asp:TextBox ID="TextBox3" runat="server" Width="120px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Label ID="Label4" runat="server" Text="X4："></asp:Label>
<asp:TextBox ID="TextBox4" runat="server" Width="120px"></asp:TextBox>
&nbsp;<asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
    Text="添加数据" />
<br />
<br />
<asp:Table ID="Table1" runat="server" HorizontalAlign="Center">
</asp:Table>
<br />
&nbsp;<div align="center">
    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="清空数据" />
&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="原始数据" />
&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button4" runat="server" onclick="Button4_Click" Text="参数设置" />
&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button5" runat="server" Text="开始计算" onclick="Button5_Click" />
</div>
</asp:Content>

