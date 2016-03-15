<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home"   EnableEventValidation="false" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<script runat ="server">
 
  </script>
<head runat="server">
    <title>首页</title>
<script language="javascript" type="text/javascript">
// <!CDATA[


// ]]>
</script>
</head>


<body>
    
   
<table width="1003" height="610" border="0" cellpadding="0" cellspacing="0" background="images/bg1.jpg" align="center">

  <tr>
    <th align="center" valign="top" scope="col"><table width="100%" height="140" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <th scope="col">&nbsp;</th>
      </tr>
    </table>
    
        <form id="form1" runat="server">
    
      <table width="823" height="198" border="0" cellpadding="0" cellspacing="0" bgcolor="#05601B">
        <tr bgcolor="#05601B">
          <th width="258" align="left" valign="top" background="images/index_03.gif" scope="col"><table width="100%" height="59" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <th scope="col">&nbsp;</th>
            </tr>
          </table>
            <table width="100%" height="120" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <th width="6%" align="left" valign="top" scope="col">&nbsp;</th>
                <th width="94%" align="left" valign="top" scope="col">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="30" align="left" valign="middle" class="text1" scope="col">用户名                        </td>
                      <td align="left" valign="middle" scope="col" style="width: 183px">
                          &nbsp;<asp:TextBox ID="txt_name" runat="server" Width="137px"></asp:TextBox></td>
                    </tr>
                    <tr>
                      <td class="text1" style="height: 30px">密 &nbsp;码</td>
                      <td style="height: 30px; width: 183px;">
                          &nbsp;<asp:TextBox ID="txt_pwd" runat="server" TextMode="Password"></asp:TextBox></td>
                    </tr>
                    <tr>
                      <td colspan="2" valign="bottom" style="height: 54px"><table width="100%" height="28" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <th width="64%" align="left" valign="middle" class="link1" scope="col"><a href="#" class="link1"></a> | <a href="#" class="link1"></a>
                              <asp:HyperLink ID="HyperLink1" runat="server" Height="21px" NavigateUrl="~/pwdrecovery.aspx" Width="77px">忘记密码</asp:HyperLink>&nbsp;
                              </th>
                          <th valign="middle" scope="col" style="width: 36%">
                              &nbsp;<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/index_08.gif"
                                  OnClick="ImageButton1_Click" /></th>
                        </tr>
                      </table><asp:Label ID="lbl_result"
                                  runat="server" Width="134px" ForeColor="Red"></asp:Label>
                          </td>
                    </tr>
                  </table>
                               
                </th>
              </tr>
            </table></th>
 
          <th width="298" align="left" valign="top" background="images/index_04.gif" scope="col"><table width="100%" height="59" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <th scope="col">&nbsp;</th>
            </tr>
          </table>
          
            <table width="100%" height="86" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td height="45" align="center" valign="middle" scope="col">
                    <asp:TextBox ID="txt_code" runat="server"></asp:TextBox>&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_code"
                        ErrorMessage="请输入追溯码" ValidationGroup="baocuo"></asp:RequiredFieldValidator></td>
              </tr>
              <tr>
                <td align="center" valign="top" class="text1" style="height: 19px">请输入追溯码（10）后的15位号码</td>
              </tr>
            </table>
            
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <th align="center" valign="top" scope="col" style="height: 27px">
                
                           <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/index_11.gif" OnClick="ImageButton2_Click1" ValidationGroup="baocuo" /> 
                    <br />
                    <asp:Label ID="lbl_tishi" runat="server" ForeColor="Red" Width="144px"></asp:Label></th>
              </tr>
            </table></th>
          <th width="267" align="left" valign="top" background="images/index_05-.jpg" scope="col"><table width="100%" height="59" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <th scope="col">&nbsp;</th>
            </tr>
          </table>
            <table width="100%" height="125" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <th width="15%" scope="col">&nbsp;</th>
                <th width="85%" align="left" valign="top" scope="col"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <asp:ImageButton ID="ImageButton3" runat="server" 
                        ImageUrl="~/images/imgButton_SFA.png" onclick="ImageButton3_Click" />
                </table></th>
              </tr>
            </table></th>
   </table> 
     
        </form>
   
   
     
      <table width="823" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <th scope="col">&nbsp;</th>
        </tr>
      </table>
      
      
      
      
      <table width="823" height="240" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <th width="406" align="left" valign="top" scope="col" style="height: 248px"><table width="100%" height="24" border="0" cellpadding="0" cellspacing="0" background="images/index_10.jpg">
            <tr>
              <td align="right" valign="bottom" class="link1" style="PADDING-right: 10px" scope="col"><a href="#" class="link1">更多</a></td>
            </tr>
          </table>
            <table width="100%" height="42" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <th scope="col"><img src="images/index_14.jpg" width="406" height="42" /></th>
              </tr>
            </table>
            <table width="100%" height="174" border="0" cellpadding="0" cellspacing="0" background="images/index_16.jpg">
              <tr>
                <td align="left" valign="top" scope="col"><table width="100%" height="156" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <th width="4%" scope="col">&nbsp;</th>
                    <th width="96%" align="left" valign="top" scope="col"><table width="96%" height="24" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <th width="5%" align="left" valign="middle" scope="col"><img src="images/index_28.gif" width="8" height="8" /></th>
                        <th width="75%" align="left" valign="middle" scope="col"><a href="http://www.cnoa360.com/news/27404433.html" class="link1">新《食品安全法》通过 剧毒农药禁用于果蔬</a></th>
                        <td width="20%" align="right" valign="middle" class="link2" scope="col">2015-06-05</td>
                      </tr>
                    </table></th>
                  </tr>
                </table></td>
              </tr>
            </table></th>
          <th width="10" scope="col" style="height: 248px">&nbsp;</th>
          <th align="left" valign="top" scope="col" style="height: 248px"><table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="right" valign="bottom" background="images/index_12.jpg" scope="col" style="PADDING-right: 10px"><a href="#" class="link1">更多</a></td>
            </tr>
          </table>
            <table width="95%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <th align="left" scope="col"><img src="images/index_15.jpg" width="407" height="41" /></th>
              </tr>
            </table>
            <table width="100%" height="174" border="0" cellpadding="0" cellspacing="0" background="images/index_17.jpg">
              <tr>
                <th align="left" valign="top" scope="col"><table width="100%" height="156" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <th width="4%" scope="col">&nbsp;</th>
                    <th width="96%" align="left" valign="top" scope="col"><table width="96%" height="24" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <th width="5%" align="left" valign="middle" scope="col"><img src="images/index_28.gif" width="8" height="8" /></th>
                        <th width="75%" align="left" valign="middle" scope="col"><a href="http://economy.gmw.cn/newspaper/2015-06/02/content_107017735.htm" class="link1">蔬菜种植投保面积仅占种植面积的5‰</a></th>
                        <td width="20%" align="right" valign="middle" class="link2" scope="col">2015-06-02</td>
                      </tr>
                    </table></th>
                  </tr>
                </table></th>
              </tr>
            </table></th>
        </tr>
      </table>
 
  
    </table>  
  
</body>

</html>
<iframe  width=100 height=0></iframe>
