<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="fertilize.aspx.cs" Inherits="pages_purchaser_fertilize" Title="施肥管理" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript" src="../../js/date.js"></script>
    <table style="width: 100%; height: 70%">
        <tr>
            <td style ="height :15%" colspan="2">
                选择种植户：<asp:DropDownList ID="ddl1" runat="server" DataSourceID="SqlDataSource1" DataTextField="farmer_name"
                    DataValueField="farmer_name" Width="30%" AutoPostBack="True" OnDataBound="ddl1_DataBound" AppendDataBoundItems="True">
                </asp:DropDownList>&nbsp;&nbsp;
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                    SelectCommand="SELECT DISTINCT [farmer_name] FROM [farmer]" CancelSelectOnNullParameter="False"></asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" Width="95%" Height ="85%" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="land_id,date" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" PageSize="8" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="land_id" HeaderText="施肥地块" ReadOnly="True" SortExpression="land_id" />
                        <asp:BoundField DataField="farmer_name" HeaderText="种植户" SortExpression="farmer_name" />
                        <asp:BoundField DataField="date" HeaderText="施肥日期" ReadOnly="True" SortExpression="date" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="fertilizer" HeaderText="肥料" SortExpression="fertilizer" />
                        <asp:BoundField DataField="ferti_amount" HeaderText="施肥数量(Kg)" SortExpression="ferti_amount" />
                        <asp:BoundField DataField="ferti_origin" HeaderText="肥料来源" SortExpression="ferti_origin" />
                    </Columns>
                    <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                    ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                    DeleteCommand="DELETE FROM fertilize WHERE (land_id = @land_id) AND (date = @date)"
                    InsertCommand="INSERT INTO fertilize(land_id, farmer_name, date, fertilizer, ferti_amount, ferti_origin) VALUES (@land_id, @farmer_name, @date, @fertilizer, @ferti_amount, @ferti_origin)" SelectCommand="SELECT land_id, farmer_name, date, fertilizer, ferti_amount, ferti_origin FROM fertilize WHERE (@farmer_name IS NULL) OR (farmer_name = @farmer_name)"
                    UpdateCommand="UPDATE fertilize SET farmer_name = @farmer_name, fertilizer = @fertilizer, ferti_amount = @ferti_amount, ferti_origin = @ferti_origin WHERE (land_id = @land_id) AND (date = @date)" CancelSelectOnNullParameter="False" ProviderName="<%$ ConnectionStrings:vegetableConnectionString.ProviderName %>">
                    <DeleteParameters>
                        <asp:Parameter Name="land_id" />
                        <asp:Parameter Name="date" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="farmer_name"  />
                        <asp:Parameter Name="fertilizer"  />
                        <asp:Parameter Name="ferti_amount"  />
                        <asp:Parameter Name="ferti_origin"  />
                        <asp:Parameter Name="land_id" />
                        <asp:Parameter Name="date" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="land_id"  />
                        <asp:Parameter Name="farmer_name"  />
                        <asp:Parameter Name="date"  />
                        <asp:Parameter Name="fertilizer"  />
                        <asp:Parameter Name="ferti_amount"  />
                        <asp:Parameter Name="ferti_origin"  />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddl1" Name="farmer_name" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                &nbsp; &nbsp;&nbsp;</td>
        </tr>
    </table>
    <table style="width:100%; height :30%">
        <tr>
            <td style="width: 100%; height: 85%; vertical-align: top; text-align: left;" align="center" valign="top">
                <asp:FormView ID="FormView1" runat="server" Height="90%" DataKeyNames="land_id,date" DataSourceID="SqlDataSource2" Width="360px" OnItemCreated="FormView1_ItemCreated" CellPadding="4" ForeColor="#333333">
                    <EditItemTemplate>
                        <table border="2" style="width: 360px">
                            <tr>
                                <td style="width: 160px">
                                    施肥日期：</td>
                                <td style="width: 200px"><asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' Width="45%"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    种植户：</td>
                                <td style="width: 200px"><asp:Label ID="farmerLabel" runat="server" Text='<%# Bind("farmer_name") %>'></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    施肥地块：</td>
                                <td style="width: 200px"><asp:Label ID="land_idLabel1" runat="server" Text='<%# Eval("land_id") %>' Width="45%"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    &nbsp;肥料名称：</td>
                                <td style="width: 200px">
                        <asp:Label ID="fertilizerLabel" runat="server" Text='<%# Bind("fertilizer") %>'></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    施肥数量：</td>
                                <td style="width: 200px">
                        <asp:TextBox ID="ferti_amountTextBox" runat="server" Text='<%# Bind("ferti_amount") %>' Width="30%"></asp:TextBox>千克</td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    肥料来源：</td>
                                <td style="width: 200px">
                                <asp:Label ID="originLabel" runat="server" Text='<%# Bind("ferti_origin") %>'></asp:Label></td>
                            </tr>
                        </table>
                        <br />
                        <table border="0">
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="更新">
                        </asp:LinkButton></td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="取消">
                        </asp:LinkButton></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                        </table>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        &nbsp;<table border="2" style="width: 360px">
                            <tr>
                                <td style="width: 160px">
                                    种植户：</td>
                                <td style="width: 200px"><asp:DropDownList ID="ddlIFarmerName" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3"
                            DataTextField="farmer_name" DataValueField="farmer_name" OnDataBound="ddlIFarmerName_Bound"
                            OnSelectedIndexChanged="ddlIFarmerName_SelectedIndexChanged" SelectedValue='<%# Bind("farmer_name") %>'
                            Width="120px">
                        </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    施肥地块：</td>
                                <td style="width: 200px"><asp:DropDownList ID="ddlILandId" runat="server" SelectedValue='<%# Bind("land_id") %>'
                            Width="120px">
                            <asp:ListItem Selected="True"></asp:ListItem>
                        </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    施肥日期：</td>
                                <td style="width: 200px"><asp:TextBox ID="txtDate" runat="server" Width="140px" onfocus="SelectDate(this)(this)" onkeypress="event.returnValue = false;" Text='<%# Bind("date") %>'></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    肥料名称：</td>
                                <td style="width: 200px"><asp:DropDownList ID="ddlIFertilizer" runat="server" DataSourceID="SqlDataSource4" DataTextField="supp_item"
                            DataValueField="supp_item" SelectedValue='<%# Bind("fertilizer") %>' Width="120px" AutoPostBack="True" OnDataBound="ddlIFertilizer_Bound" OnSelectedIndexChanged="ddlIFertilizer_SelectedIndexChanged">
                        </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    施肥数量：</td>
                                <td style="width: 200px"><asp:TextBox ID="ferti_amountTextBox" runat="server" Text='<%# Bind("ferti_amount") %>' Width="120px" ToolTip="建议多施加有机肥，少使用化肥"></asp:TextBox>千克</td>
                            </tr>
                            <tr>
                                <td colspan="2">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ferti_amountTextBox"
                            ErrorMessage="施肥数量不能为空" ValidationGroup="tishi"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    肥料来源：</td>
                                <td style="width: 200px">
                        <asp:DropDownList ID="ddlIFertiOrigin" runat="server" SelectedValue='<%# Bind("ferti_origin") %>' Width="120px">
                            <asp:ListItem Selected="True"></asp:ListItem>
                        </asp:DropDownList></td>
                            </tr>
                        </table>
                        <table border="0">
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="插入" ValidationGroup="tishi"></asp:LinkButton></td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="取消">
                        </asp:LinkButton></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                            SelectCommand="SELECT DISTINCT farmer_name FROM seeding"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                            SelectCommand="SELECT DISTINCT supp_item FROM supporter WHERE (item_type = '肥料')">
                        </asp:SqlDataSource>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <table border="2">
                            <tr>
                                <td style="width: 160px">
                                    施肥地块：</td>
                                <td style="width: 200px">
                                    <asp:Label ID="land_idLabel" runat="server" Text='<%# Eval("land_id") %>' Width="45%"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    种植户：
                                </td>
                                <td style="width: 200px">
                        <asp:Label ID="farmer_nameLabel" runat="server" Text='<%# Bind("farmer_name") %>' Width="40%"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    施肥日期：</td>
                                <td style="width: 200px">
                                    <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' Width="50%"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                        肥料：</td>
                                <td style="width: 200px">
                        <asp:Label ID="fertilizerLabel" runat="server" Text='<%# Bind("fertilizer") %>' Width="45%"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    施肥数量：</td>
                                <td style="width: 200px">
                        <asp:Label ID="ferti_amountLabel" runat="server" Text='<%# Bind("ferti_amount") %>' Width="30%"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    肥料来源：</td>
                                <td style="width: 200px">
                        <asp:Label ID="ferti_originLabel" runat="server" Text='<%# Bind("ferti_origin") %>' Width="55%"></asp:Label></td>
                            </tr>
                        </table>
                        <br />
                        <table border="0">
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="编辑">
                        </asp:LinkButton></td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete"
                            Text="删除" OnClientClick="return confirm('确定删除这条数据？')"></asp:LinkButton></td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="新建">
                        </asp:LinkButton></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <HeaderTemplate>
                        选择的地块施肥信息：<br />
                        <br />
                    </HeaderTemplate>
                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                    <EditRowStyle BackColor="#999999" />
                    <RowStyle ForeColor="#333333" BackColor="#F7F6F3" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                </asp:FormView>
                &nbsp;
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                    SelectCommand="SELECT DISTINCT [supp_name], [useful], [supp_item] FROM [supporter] WHERE ([supp_item] = @supp_item)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="@fertilizer" Name="supp_item" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                &nbsp; &nbsp;&nbsp;&nbsp;</td>
        </tr>
    </table>
</asp:Content>
