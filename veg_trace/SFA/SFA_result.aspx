<%@ Page Title="" Language="C#" MasterPageFile="~/SFA/MasterPage_SFA.master" AutoEventWireup="true" CodeFile="SFA_result.aspx.cs" Inherits="SFA_SFA_result" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<script type="text/javascript" src="http://cdn.hcharts.cn/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="http://cdn.hcharts.cn/highcharts/highcharts.js"></script>
<script language=javascript type="text/javascript">
    $(function () {
        $('#container').highcharts({
            title: {
                text: '随机前沿分析技术效率走势图',
                x: -20 //center
            },
            subtitle: {
                text: '1992年至2009年',
                x: -20
            },
            xAxis: {
                categories: ['1992', '1993', '1994', '1995', '1996', '1997',
                '1998', '1999', '2000', '2001', '2002', '2003', '2004', '2005', '2006', '2007', '2008', '2009']
            },
            yAxis: {
                title: {
                    text: '生产技术效率'
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
            tooltip: {
                valueSuffix: '%'
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'middle',
                borderWidth: 0
            },
            series: [{
                name: '天津市',
                data: [<%=te[0]%>, <%=te[1]%>, <%=te[2]%>, <%=te[3]%>, <%=te[4]%>, <%=te[5]%>, <%=te[6]%>, <%=te[7]%>, <%=te[8]%>, <%=te[9]%>, <%=te[10]%>,<%=te[11]%>, <%=te[12]%>, <%=te[13]%>, <%=te[14]%>, <%=te[15]%>, <%=te[16]%>, <%=te[17]%>]
            }]
        });
    });
</script>
    <asp:Label ID="Label1" runat="server" CssClass="result" Text="结果为："></asp:Label>
    <br />
    <br />
    <div id="container" style="min-width:400px;height:350px">
    </div>
    <div align="center">
    </div>
    <br />
    <asp:Label ID="Label2" runat="server"></asp:Label>
</asp:Content>

