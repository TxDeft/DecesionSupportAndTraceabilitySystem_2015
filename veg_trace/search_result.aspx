<%@ Page Language="C#" AutoEventWireup="true" CodeFile="search_result.aspx.cs" Inherits="search_result" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>查询结果页面</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
            <tr>
                <td colspan="2" style="height: 10%; width: 587px;">
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height: 80%; width: 587px;">
                    <table style="width: 100%; height: 80%">
                        <tr>
                            <td align="center"  style="width :10%; height :10%">
                                蔬菜基本信息：</td>
                        </tr>
                        <tr>
                            <td colspan="2" style="width: 3%; height:10%" >
                                蔬菜可追溯码：<asp:Label ID="lbl_code" runat="server" Width="75%"></asp:Label></td>
                            <td style="width: 100%; height :10%" rowspan="3">
                                <asp:Label ID="lbl_ding" runat="server" BorderColor="Green" Height="90%" Text="凯银特菜公司始建于1998年，是山东凯银集团股份有限公司的骨干企业之一。公司占地3000亩，拥有固定资产8千万元，职工1400余人。公司拥有1200栋高标准的日光温室，5000平方米的冷藏库、1500平方米的气调保鲜库及5000平方米的产品加工车间，实现了蔬菜生产、包装、储存、销售一条龙。"
                                    Width="90%"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 3%; height:10%" colspan="2">
                                蔬菜种植地块编号：<asp:Label ID="lbl_land" runat="server" Width="75%"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 3%; height :10%" colspan="2">
                                收获日期：<asp:Label ID="lbl_date" runat="server" Width="75%"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 3%; height :10%" colspan="2">
                                蔬菜生产企业：<br />
                                <asp:Label ID="lbl_fac" runat="server" Width="75%">山东凯银集团</asp:Label></td>
                            <td style="width: 100%; height: 10%">
                                <asp:Label ID="lbl_envir" runat="server" BorderColor="Green" Height="90%" Text="凯银特菜公司蔬菜基地是经过国家由济南农业部食品质量检测检疫中心认证的无公害（绿色、有机）生产基地。"
                                    Width="90%"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 10%; height :10%" colspan="3" align="right">
                                <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="False" Font-Underline="False">返回首页</asp:LinkButton></td>
                        </tr>
                        <tr>
                            <td style="width: 25%; height: 15%" align="right">
                                更多详细信息：&nbsp;</td>
                            <td style="width: 55%; height: 15%" align="center">
                                （请选择）&nbsp;<asp:DropDownList ID="ddl_select" runat="server" Width="55%" Height="80%">
                                <asp:ListItem>种植信息</asp:ListItem>
                                <asp:ListItem>检测信息</asp:ListItem>
                                <asp:ListItem>加工信息</asp:ListItem>
                                <asp:ListItem>出库信息</asp:ListItem>
                                </asp:DropDownList></td>
                            <td style="width: 15%; height: 15%" align="center">
                                &nbsp;<asp:Button ID="btn_look" runat="server" Text="查看" Width="70%" OnClick="btn_look_Click" /></td>
                        </tr>
                        <tr>
                            <td style="width: 30%">
                                <asp:Panel ID="Panel1" runat="server" Height="50px" Width="125px">
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="land_id,date" DataSourceID="SqlDataSource1">
                                        <Columns>
                                            <asp:BoundField DataField="date" HeaderText="施肥日期" ReadOnly="True" SortExpression="date" />
                                            <asp:BoundField DataField="fertilizer" HeaderText="肥料" SortExpression="fertilizer" />
                                            <asp:BoundField DataField="ferti_amount" HeaderText="施肥数量" SortExpression="ferti_amount" />
                                            <asp:BoundField DataField="ferti_origin" HeaderText="肥料来源" SortExpression="ferti_origin" />
                                            <asp:BoundField DataField="ferti_use" HeaderText="肥料作用" SortExpression="ferti_use" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>" SelectCommand="SELECT [land_id], [farmer_name], [date], [fertilizer], [ferti_amount], [ferti_origin], [ferti_use] FROM [fertilize] WHERE ([land_id] = @land_id)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lbl_land" Name="land_id" PropertyName="Text" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </asp:Panel>
                            </td>
                            <td style="width: 30%">
                                <asp:Panel ID="Panel2" runat="server" Height="50px" Width="125px">
                                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="land_id,date" DataSourceID="SqlDataSource2">
                                        <Columns>
                                            <asp:BoundField DataField="land_id" HeaderText="land_id" ReadOnly="True" SortExpression="land_id" />
                                            <asp:BoundField DataField="date" HeaderText="date" ReadOnly="True" SortExpression="date" />
                                            <asp:BoundField DataField="reason" HeaderText="reason" SortExpression="reason" />
                                            <asp:BoundField DataField="prevent_way" HeaderText="prevent_way" SortExpression="prevent_way" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>" SelectCommand="SELECT [land_id], [date], [reason], [prevent_way] FROM [prevention] WHERE ([land_id] = @land_id)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lbl_land" Name="land_id" PropertyName="Text" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </asp:Panel>
                            </td>
                            <td style="width: 30%">
                                <asp:Panel ID="Panel3" runat="server" Height="50px" Width="125px">
                                    <asp:GridView ID="GridView3" runat="server">
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server"></asp:SqlDataSource>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:Panel ID="Panel4" runat="server" Height="50px" Width="125px">
                                    <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="date,land_id" DataSourceID="SqlDataSource4">
                                        <Columns>
                                            <asp:BoundField DataField="veg_item" HeaderText="veg_item" SortExpression="veg_item" />
                                            <asp:BoundField DataField="worker_name" HeaderText="worker_name" SortExpression="worker_name" />
                                            <asp:BoundField DataField="date" HeaderText="date" ReadOnly="True" SortExpression="date" />
                                            <asp:BoundField DataField="A0" HeaderText="A0" SortExpression="A0" />
                                            <asp:BoundField DataField="A1" HeaderText="A1" SortExpression="A1" />
                                            <asp:BoundField DataField="re" HeaderText="re" SortExpression="re" />
                                            <asp:BoundField DataField="result" HeaderText="result" SortExpression="result" />
                                            <asp:BoundField DataField="land_id" HeaderText="land_id" ReadOnly="True" SortExpression="land_id" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>" SelectCommand="SELECT [veg_item], [worker_name], [date], [A0], [A1], [re], [result], [land_id] FROM [checking] WHERE ([land_id] = @land_id)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lbl_land" Name="land_id" PropertyName="Text" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </asp:Panel>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Panel ID="Panel5" runat="server" Height="50px" Width="125px">
                                    <asp:GridView ID="GridView5" runat="server" DataSourceID="SqlDataSource5">
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>" SelectCommand="SELECT [worker_name], [trace_num], [work_amount], [date] FROM [produce] WHERE ([trace_num] = @trace_num)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lbl_code" Name="trace_num" PropertyName="Text" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </asp:Panel>
                            </td>
                            <td style="width: 100px">
                                <asp:Panel ID="Panel7" runat="server" Height="50px" Width="125px">
                                    <asp:GridView ID="GridView6" runat="server">
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource7" runat="server"></asp:SqlDataSource>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:Panel ID="Panel6" runat="server" Height="50px" Width="125px">
                                    <asp:GridView ID="GridView7" runat="server" DataSourceID="SqlDataSource6">
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>" SelectCommand="SELECT [trace_num], [veg_item], [exit_amount], [date], [super_name] FROM [output] WHERE ([trace_num] = @trace_num)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lbl_code" Name="trace_num" PropertyName="Text" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </asp:Panel>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height: 10%; width: 587px;">
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
<iframe  width=100 height=0></iframe>
