<%@ Page Title="" Language="C#" MasterPageFile="~/SFA/MasterPage_SFA.master" AutoEventWireup="true" CodeFile="Setting.aspx.cs" Inherits="SFA_Setting" %>
<asp:Content ID="Content2" runat="server" contentplaceholderid="MainContent">
    <asp:Label ID="Label1" runat="server" Text="计算模式："></asp:Label>
    <asp:DropDownList ID="DropDownList_CalMode" runat="server">
        <asp:ListItem Selected="True" Value="1">ERROR COMPONENTS MODEL</asp:ListItem>
        <asp:ListItem Value="2">TE EFFECTS MODEL</asp:ListItem>
    </asp:DropDownList>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Text="函数模式："></asp:Label>
    <asp:DropDownList ID="DropDownList_funMode" runat="server">
        <asp:ListItem Value="1">PRODUCTION FUNCTION</asp:ListItem>
        <asp:ListItem Value="2">COST FUNCTION</asp:ListItem>
    </asp:DropDownList>
    &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Text="是否对数化："></asp:Label>
    <asp:DropDownList ID="DropDownList_logged" runat="server" 
        onselectedindexchanged="DropDownList1_SelectedIndexChanged">
        <asp:ListItem Value="y">是</asp:ListItem>
        <asp:ListItem Value="n">否</asp:ListItem>
    </asp:DropDownList>
    &nbsp;
<asp:Label ID="Label10" runat="server" Text="初始数据搜索："></asp:Label>
<asp:DropDownList ID="DropDownList_defaltData" runat="server">
    <asp:ListItem Value="n">是</asp:ListItem>
    <asp:ListItem Value="y">否</asp:ListItem>
</asp:DropDownList>
    <br />
    <br />
    <asp:Label ID="Label4" runat="server" Text="评价体系数目："></asp:Label>
    <asp:TextBox ID="TextBox_crossSections" runat="server" Width="55px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label5" runat="server" Text="时期数目："></asp:Label>
    <asp:TextBox ID="TextBox_period" runat="server" Width="55px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;<asp:Label ID="Label6" runat="server" Text="总记录数："></asp:Label>
    <asp:TextBox ID="TextBox_observations" runat="server" Width="55px"></asp:TextBox>
    &nbsp;&nbsp;
    <asp:Label ID="Label7" runat="server" Text=" 自变量数："></asp:Label>
    <asp:TextBox ID="TextBox_varNum" runat="server" Width="55px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label8" runat="server" Text="mu为半正态分布"></asp:Label>
    <asp:DropDownList ID="DropDownList_mu" runat="server">
        <asp:ListItem Value="n">是</asp:ListItem>
        <asp:ListItem Value="y">否</asp:ListItem>
    </asp:DropDownList>
    &nbsp;&nbsp;<asp:Label ID="Label9" runat="server" Text="只有一个截面数据"></asp:Label>
    <asp:DropDownList ID="DropDownList_oneSetData" runat="server">
        <asp:ListItem Value="n">是</asp:ListItem>
        <asp:ListItem Value="y">否</asp:ListItem>
    </asp:DropDownList>
&nbsp;<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<div _designerregion="0" align="center">
    <asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="完成设置" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" Text=" 录入数据" onclick="Button1_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button2" runat="server" Text="开始计算" onclick="Button2_Click" />
    </div>
</asp:Content>


