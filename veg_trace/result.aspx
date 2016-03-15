<%@ Page Language="C#" AutoEventWireup="true" CodeFile="result.aspx.cs" Inherits="result" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script  runat ="server">
   
 </script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>蔬菜追溯码查询结果</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
            <tr>
                <td colspan="2" style="height: 20%;">
                </td>
            </tr>
            <tr>
                <td style="width: 30%;" align="left" rowspan="2">
                              
                    <table style="width: 100%; height: 100%">
                        <tr>
                            <td colspan="2" align="center" style="height :20%">
                                蔬 菜 基 本 信 息</td>
                        </tr>
                        <tr>
                            <td style="width: 40% ; height :10%" align="right">
                                追 溯 码：</td>
                            <td style="width: 60%">
                                <asp:Label ID="lbl_code" runat="server" Height="80%" Width="70%" BorderColor="Green"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 40%; height :10%" align="right">
                                收获日期：</td>
                            <td style="width: 60%">
                                <asp:Label ID="lbl_date" runat="server" Height="80%" Width="70%" BorderColor="Green"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 40%; height :10%" align="right">
                                种植地块：</td>
                            <td style="width: 60%;">
                                <asp:Label ID="lbl_land" runat="server" Height="80%" Width="70%" BorderColor="Green"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 40%; height :10%" align="right">
                                生产企业：</td>
                            <td style="width: 60%;">
                                <asp:Label ID="lbl_company" runat="server" Text="凯银特菜公司" Height="80%" Width="70%" BorderColor="Green"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="2" style ="height :10%">
                                &nbsp;&nbsp;
                                企业简介：</td>
                        </tr>
                        <tr>
                            <td colspan="2" style=" height:1%">
                                <asp:Label ID="lbl_ding" runat="server" Text="凯银特菜公司始建于1998年，是山东凯银集团股份有限公司的骨干企业之一。公司占地3000亩，拥有固定资产8千万元，职工1400余人。公司拥有1200栋高标准的日光温室，5000平方米的冷藏库、1500平方米的气调保鲜库及5000平方米的产品加工车间，实现了蔬菜生产、包装、储存、销售一条龙。" Height="90%" Width="80%" BorderColor="Green"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="height: 1%">
                                种植环境：</td>
                        </tr>
                        <tr>
                            <td colspan="2" style="height: 1%">
                                <asp:Label ID="lbl_envir" runat="server" BorderColor="Green" Height="90%" Text="凯银特菜公司蔬菜基地是经过国家由济南农业部食品质量检测检疫中心认证的无公害（绿色、有机）生产基地。"
                                    Width="80%"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" style="height: 20%">
                                <asp:HyperLink ID="HyperLink1" runat="server" Height="90%" NavigateUrl="~/home.aspx"
                                    Width="95%">返回首页</asp:HyperLink></td>
                        </tr>
                    </table>
                    </td>
                  </tr>
                    
                 <tr>   
                <td style="width: 70%; height: 100%"> 
                    <table style="width: 90%; height:75%">
                        <tr>
                            <td style=" height :30%">
                                <asp:DropDownList ID="DropDownList1" runat="server" Width="139px">
                                </asp:DropDownList>
                                <asp:Button ID="Button1" runat="server" Text="Button" /><br />
                                蔬菜种植地块：<br />
                                <br />
                                <asp:GridView ID="GridView1" runat="server" Height="90%" Width="90%" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
                                    <Columns>
                                        <asp:BoundField DataField="land_id" HeaderText="地块编号" SortExpression="land_id" />
                                        <asp:BoundField DataField="farmer_name" HeaderText="种植户" SortExpression="farmer_name" />
                                        <asp:BoundField DataField="veg_item" HeaderText="蔬菜品种" SortExpression="veg_item" />
                                        <asp:BoundField DataField="veg_origin" HeaderText="种子来源" SortExpression="veg_origin" />
                                    </Columns>
                                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <RowStyle BackColor="#E3EAEB" />
                                    <EditRowStyle BackColor="#7C6F57" />
                                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <AlternatingRowStyle BackColor="White" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>" SelectCommand="SELECT [land_id], [farmer_name], [veg_item], [veg_origin] FROM [plantplan] WHERE ([land_id] = @land_id)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lbl_land" Name="land_id" PropertyName="Text" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td style=" height :30%">
                                <br />
                                蔬菜施肥信息：<br />
                                <br />
                                <asp:GridView ID="GridView2" runat="server" Height="90%" Width="90%" AutoGenerateColumns="False" DataKeyNames="land_id,date" DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" GridLines="None">
                                    <Columns>
                                        <asp:BoundField DataField="land_id" HeaderText="地块编号" ReadOnly="True" SortExpression="land_id" />
                                        <asp:BoundField DataField="date" HeaderText="施肥日期" ReadOnly="True" SortExpression="date" />
                                        <asp:BoundField DataField="fertilizer" HeaderText="施用肥料" SortExpression="fertilizer" />
                                        <asp:BoundField DataField="ferti_amount" HeaderText="施肥数量（千克）" SortExpression="ferti_amount" />
                                        <asp:BoundField DataField="ferti_use" HeaderText="肥料用途" SortExpression="ferti_use" />
                                    </Columns>
                                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <RowStyle BackColor="#E3EAEB" />
                                    <EditRowStyle BackColor="#7C6F57" />
                                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <AlternatingRowStyle BackColor="White" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>" SelectCommand="SELECT [land_id], [date], [fertilizer], [ferti_amount], [ferti_use] FROM [fertilize] WHERE ([land_id] = @land_id)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lbl_land" Name="land_id" PropertyName="Text" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td style=" height :30%">
                                <br />
                                蔬菜病虫害防治信息：<br />
                                <br />
                                <asp:GridView ID="GridView3" runat="server" Height="90%" Width="90%" AutoGenerateColumns="False" DataKeyNames="land_id,date" DataSourceID="SqlDataSource3" CellPadding="4" ForeColor="#333333" GridLines="None">
                                    <Columns>
                                        <asp:BoundField DataField="land_id" HeaderText="地块编号" ReadOnly="True" SortExpression="land_id" />
                                        <asp:BoundField DataField="date" HeaderText="防治时间" ReadOnly="True" SortExpression="date" />
                                        <asp:BoundField DataField="prevent_way" HeaderText="防治方法" SortExpression="prevent_way" />
                                        <asp:BoundField DataField="reason" HeaderText="病虫害原因" SortExpression="reason" />
                                    </Columns>
                                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <RowStyle BackColor="#E3EAEB" />
                                    <EditRowStyle BackColor="#7C6F57" />
                                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <AlternatingRowStyle BackColor="White" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>" SelectCommand="SELECT [land_id], [date], [prevent_way], [reason] FROM [prevention] WHERE ([land_id] = @land_id)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lbl_land" Name="land_id" PropertyName="Text" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 30%">
                                <br />
                                蔬菜检测信息：<br />
                                <br />
                                <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                    DataKeyNames="date,land_id" DataSourceID="SqlDataSource4" ForeColor="#333333"
                                    GridLines="None" Height="90%" Width="90%">
                                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="land_id" HeaderText="地块编号" ReadOnly="True" SortExpression="land_id" />
                                        <asp:BoundField DataField="veg_item" HeaderText="蔬菜品种" SortExpression="veg_item" />
                                        <asp:BoundField DataField="result" HeaderText="检测结果" SortExpression="result" />
                                        <asp:BoundField DataField="date" HeaderText="检测日期" ReadOnly="True" SortExpression="date" />
                                    </Columns>
                                    <RowStyle BackColor="#E3EAEB" />
                                    <EditRowStyle BackColor="#7C6F57" />
                                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <AlternatingRowStyle BackColor="White" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                                    SelectCommand="SELECT [result], [date], [land_id], [veg_item] FROM [checking] WHERE ([land_id] = @land_id)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lbl_land" Name="land_id" PropertyName="Text" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>                   
                   
                </td>    
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
<iframe  width=100 height=0></iframe>
