<%@ Page Language="C#" AutoEventWireup="true" CodeFile="qualityInfoVegetable.aspx.cs" Inherits="qualityInfoVegetable" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>蔬菜质量安全信息查询</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table border="0" cellpadding="0" cellspacing="0" style="width: 900px; height: 800px">
        <tr>
            <td align="center" style="width: 100%; height: 160px" valign="bottom">
                <table align="center" border="0" cellpadding="0" cellspacing="0" dir="ltr" style="width: 550px;
                    height: 124px; background-color: #ccffcc;" valign="middle">
                    <tr>
                        <td align="left" colspan="1" style="height: 2px">
                        </td>
                        <td align="left" colspan="2" style="height: 2px">
                            <asp:Label ID="Label1" runat="server" Text='请将食品追溯码输入,按"查询"钮以获取食品详细信息！' Width="384px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 311px; height: 60px">
                        </td>
                        <td align="center" style="width: 311px; height: 60px">
                            <asp:TextBox ID="txtTraceCode" runat="server" BorderColor="Gray" BorderStyle="Solid"
                                BorderWidth="2px" Columns="40" Width="357px"></asp:TextBox></td>
                        <td align="center" style="width: 102px; height: 60px">
                            <asp:ImageButton ID="ibtnSearch" runat="server" ImageUrl="~/images/index_11.gif"
                                OnClick="ibtnSearch_Click" /></td>
                    </tr>
                    <tr>
                        <td style="width: 311px; height: 26px">
                        </td>
                        <td style="width: 311px; height: 26px">
                            <asp:Label ID="lblMessage" runat="server" Width="386px" ForeColor="Red"></asp:Label></td>
                        <td style="width: 102px; height: 26px">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 100%; height: 640px" valign="top">
                <table border="0" cellpadding="0" cellspacing="0" style="width: 800px; height: 620px">
                    <tr>
                        <td style="width: 800px; height: 60px" align=center valign="middle">
                            <asp:Label ID="lblWelcome" runat="server" Width="514px"></asp:Label>
                            <br />
                            <asp:Image ID="Image1" runat="server" ImageAlign="Middle" Width="181px" 
                                Height="181px" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100%;height:740px" valign=top>
                            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 90%">
                                <tr>
                                    <td style="width: 40%" valign=top align=right>
                                        <asp:DetailsView ID="dtViewProductName" runat="server" BackColor="White" BorderColor="#E7E7FF"
                                            BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" HeaderText="基本信息"
                                            Height="50px" Width="300px">
                                            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Left" />
                                            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" HorizontalAlign="Left" />
                                            <AlternatingRowStyle BackColor="#F7F7F7" />
                                        </asp:DetailsView>
                                        <asp:DetailsView ID="dtViewBaseInfo" runat="server" BackColor="White" BorderColor="#E7E7FF"
                                            BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" HeaderText="产品信息"
                                            Height="50px" Width="300px">
                                            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Left" />
                                            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" HorizontalAlign="Left" />
                                            <AlternatingRowStyle BackColor="#F7F7F7" />
                                        </asp:DetailsView>
                                        <asp:DetailsView ID="dtViewSeed" runat="server" BackColor="White" BorderColor="#E7E7FF"
                                            BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" Height="50px"
                                            Width="300px">
                                            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Left" />
                                            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                                            <AlternatingRowStyle BackColor="#F7F7F7" />
                                        </asp:DetailsView>
                                        &nbsp;
                                    </td>
                                    <td style="width: 60%" valign=top align=left>
                                        <asp:DetailsView ID="dtViewCompany" runat="server" BackColor="White" BorderColor="#E7E7FF"
                                            BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" HeaderText="生产商信息"
                                            Height="50px" Width="450px">
                                            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Left" />
                                            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" HorizontalAlign="Left" />
                                            <AlternatingRowStyle BackColor="#F7F7F7" />
                                        </asp:DetailsView>
                                        <br />
                                        <asp:GridView ID="gdViewPrevention" runat="server" BackColor="White" BorderColor="#E7E7FF"
                                            BorderStyle="None" BorderWidth="1px" Caption="病虫害防治记录" CaptionAlign="Left" CellPadding="3"
                                            GridLines="Horizontal" Width="450px">
                                            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                                            <AlternatingRowStyle BackColor="#F7F7F7" />
                                        </asp:GridView>
                                        <asp:GridView ID="gdViewIrrigation" runat="server" BackColor="White" BorderColor="#E7E7FF"
                                            BorderStyle="None" BorderWidth="1px" Caption="灌溉记录" CaptionAlign="Left" CellPadding="3"
                                            GridLines="Horizontal" Width="450px">
                                            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                                            <AlternatingRowStyle BackColor="#F7F7F7" />
                                        </asp:GridView>
                                        <asp:GridView ID="gdViewFertilize" runat="server" BackColor="White" BorderColor="#E7E7FF"
                                            BorderStyle="None" BorderWidth="1px" Caption="施肥记录" CaptionAlign="Left" CellPadding="3"
                                            GridLines="Horizontal" Width="450px">
                                            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                                            <AlternatingRowStyle BackColor="#F7F7F7" />
                                        </asp:GridView>
                                        <asp:GridView ID="gdViewWeed" runat="server" BackColor="White" BorderColor="#E7E7FF"
                                            BorderStyle="None" BorderWidth="1px" Caption="除草记录" CaptionAlign="Left" CellPadding="3"
                                            GridLines="Horizontal" Width="450px">
                                            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                                            <AlternatingRowStyle BackColor="#F7F7F7" />
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </table>
                            <br />
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
