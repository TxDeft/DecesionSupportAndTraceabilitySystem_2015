<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="supporter.aspx.cs" Inherits="manage_supporter" Title="供应商管理" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%; height: 80%;">
        <tr>
            <td style="height: 15%" colspan="2">
                &nbsp;选择供应商：
                <asp:DropDownList ID="ddl1" runat="server" Width="30%" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="supp_name" DataValueField="supp_name" OnDataBound="ddl1_DataBound">
                </asp:DropDownList>&nbsp;
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>" SelectCommand="SELECT DISTINCT [supp_name] FROM [supporter]"></asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" Height="85%" Width="98%" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="supp_name,supp_item" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="supp_name" HeaderText="供应商名称" ReadOnly="True" SortExpression="supp_name" />
                        <asp:BoundField DataField="supp_item" HeaderText="物品名称" ReadOnly="True" SortExpression="supp_item" />
                        <asp:BoundField DataField="unit_price" HeaderText="单价" SortExpression="unit_price" />
                        <asp:BoundField DataField="item_type" HeaderText="物品类别" SortExpression="item_type" />
                    </Columns>
                    <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                &nbsp;&nbsp;
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>" DeleteCommand="DELETE FROM supporter WHERE (supp_name = @supp_name) AND (supp_item = @supp_item)" InsertCommand="INSERT INTO supporter(supp_name, supp_item,unit_price,useful,item_type) VALUES (@supp_name, @supp_item,@unit_price, @useful, @item_type)" SelectCommand="SELECT supp_name, supp_item, unit_price, useful, item_type FROM supporter WHERE (@supp_name IS NULL) OR (supp_name = @supp_name)" UpdateCommand="UPDATE supporter SET unit_price = @unit_price, useful = @useful, item_type = @item_type WHERE (supp_name = @supp_name) AND (supp_item = @supp_item)" CancelSelectOnNullParameter="False">
                    <DeleteParameters>
                        <asp:Parameter Name="supp_name" />
                        <asp:Parameter Name="supp_item" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="unit_price" Type="String" />
                        <asp:Parameter Name="useful" />
                        <asp:Parameter Name="item_type" />
                        <asp:Parameter Name="supp_name" />
                        <asp:Parameter Name="supp_item" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="supp_name" Type="String" />
                        <asp:Parameter Name="supp_item" Type="String" />
                        <asp:Parameter Name="unit_price" Type="String" />
                        <asp:Parameter Name="useful" />
                        <asp:Parameter Name="item_type" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddl1" Name="supp_name" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <table style="width: 100%; height: 20%">
        <tr>
            <td>
                </td>
        </tr>
        <tr>
            <td style="height: 75%">
                &nbsp;
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="supp_name,supp_item" DataSourceID="SqlDataSource2" 
                Height="95%" Width="44%" CellPadding="4" ForeColor="#333333">
                    <EditItemTemplate><table border="2" style="width: 360px">
                        <tr>
                            <td style="width: 160px">
                                供应商:
                            </td>
                            <td style="width: 200px">
                        <asp:Label ID="supp_nameLabel1" runat="server" Text='<%# Eval("supp_name") %>'></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                                物品名称:
                            </td>
                            <td style="width: 200px">
                        <asp:Label ID="supp_itemLabel1" runat="server" Text='<%# Eval("supp_item") %>'></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                                单价:&nbsp;</td>
                            <td style="width: 200px">
                        <asp:TextBox ID="unit_priceTextBox" runat="server" Text='<%# Bind("unit_price") %>' Width="120px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="unit_priceTextBox"
                            ErrorMessage="不能为空" ValidationGroup="tishi"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                        物品种类:
                            </td>
                            <td style="width: 200px"><asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("item_type") %>'
                            Width="120px">
                            <asp:ListItem Selected="True">种子</asp:ListItem>
                            <asp:ListItem>肥料</asp:ListItem>
                            <asp:ListItem>农药</asp:ListItem>
                            <asp:ListItem>其它农资</asp:ListItem>
                        </asp:DropDownList></td>
                        </tr>
                    </table>
                        <br />
                        <table border="0">
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="更新" ValidationGroup="tishi"></asp:LinkButton></td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="取消"></asp:LinkButton></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                        </table>
                    </EditItemTemplate>
                    <InsertItemTemplate><table border="2" style="width: 360px">
                        <tr>
                            <td style="width: 160px">
                                供应商:</td>
                            <td style="width: 200px">
                        <asp:TextBox ID="supp_nameTextBox" runat="server" Text='<%# Bind("supp_name") %>' Width="120px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="supp_nameTextBox"
                            ErrorMessage="不能为空" ValidationGroup="tishi">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                                物品名称:&nbsp;</td>
                            <td style="width: 200px">
                        <asp:TextBox ID="supp_itemTextBox" runat="server" Text='<%# Bind("supp_item") %>' Width="120px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="supp_itemTextBox"
                            ErrorMessage="不能为空" ValidationGroup="tishi">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                        单价 :</td>
                            <td style="width: 200px">
                        <asp:TextBox ID="unit_priceTextBox" runat="server" Text='<%# Bind("unit_price") %>' Width="120px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="unit_priceTextBox"
                            ErrorMessage="不能为空" ValidationGroup="tishi">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 160px">
                        物品类型别:</td>
                            <td style="width: 200px">
                        <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("item_type") %>'
                            Width="120px">
                            <asp:ListItem Selected="True">种子</asp:ListItem>
                            <asp:ListItem>肥料</asp:ListItem>
                            <asp:ListItem>农药</asp:ListItem>
                            <asp:ListItem>其他农资</asp:ListItem>
                        </asp:DropDownList></td>
                        </tr>
                    </table>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="tishi" />
                        &nbsp;<table border="0">
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="插入" ValidationGroup="tishi"></asp:LinkButton></td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="取消"></asp:LinkButton></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                        </table>
                        <asp:LinkButton ID="LinkButton1" runat="server" Visible="False">国家相关规定禁用的农药</asp:LinkButton>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <table border="2" style="width: 360px">
                            <tr>
                                <td style="width: 160px">
                                    供应商:
                                </td>
                                <td style="width: 200px">
                        <asp:Label ID="supp_nameLabel" runat="server" Text='<%# Bind("supp_name") %>'></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    物品名称:
                                </td>
                                <td style="width: 200px">
                        <asp:Label ID="supp_itemLabel" runat="server" Text='<%# Bind("supp_item") %>'></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    单价:&nbsp;</td>
                                <td style="width: 200px">
                        <asp:Label ID="unit_priceLabel" runat="server" Text='<%# Bind("unit_price") %>'></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                        &nbsp;物品类别
                                </td>
                                <td style="width: 200px">
                        <asp:Label ID="item_typeLabel" runat="server" Text='<%# Bind("item_type") %>'></asp:Label></td>
                            </tr>
                        </table>
                        <br />
                        <table border="0">
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="编辑"></asp:LinkButton></td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" OnClientClick="return confirm('确定删除这条数据？')"
                            Text="删除"></asp:LinkButton></td>
                                <td style="width: 100px">
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="新建"></asp:LinkButton></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                    <EditRowStyle BackColor="#999999" />
                    <RowStyle ForeColor="#333333" BackColor="#F7F6F3" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderTemplate>
                        &nbsp; &nbsp;&nbsp;选择的供货商信息：<br />
                    </HeaderTemplate>
                </asp:FormView>
                &nbsp;&nbsp;&nbsp;&nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
