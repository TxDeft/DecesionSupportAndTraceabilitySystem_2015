<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="land.aspx.cs" Inherits="manage_land" Title="地块管理" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%; height :80%;">
        <tr>
            <td style="height: 15%;" colspan="2">
                输入地块编号： &nbsp;
                <asp:TextBox ID="txtLandId" runat="server"></asp:TextBox>
                <asp:Button ID="btnOk" runat="server" OnClick="btnOk_Click" Text="查找" Width="74px" />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="land_id" Height="85%" Width="95%" AllowSorting="True" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataSourceID="SqlDataSource2" AllowPaging="True" CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                    <Columns>
                        <asp:BoundField DataField="land_id" HeaderText="地块编号" ReadOnly="True" SortExpression="land_id" />
                        <asp:BoundField DataField="area" HeaderText="地块面积" SortExpression="area" />
                        <asp:BoundField DataField="address" HeaderText="地块地址" SortExpression="address" />
                        <asp:BoundField DataField="well" HeaderText="水源编号" SortExpression="well" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                &nbsp;&nbsp;&nbsp;<asp:SqlDataSource ID="SqlDataSource2" runat="server"
                    ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                    DeleteCommand="DELETE FROM land WHERE (land_id = @land_id) AND (area = @area) AND (address = @address) AND (well = @well)"
                    InsertCommand="INSERT INTO land(land_id,area, address, well) VALUES (@land_id,  @area, @address, @well)" SelectCommand="SELECT land_id, area, address, well FROM land WHERE (@land_id IS NULL) OR (land_id = @land_id)"
                    UpdateCommand="UPDATE land SET area = @area, address = @address, well = @well WHERE (land_id = @land_id)" CancelSelectOnNullParameter="False">
                    <DeleteParameters>
                        <asp:Parameter Name="land_id" />
                        <asp:Parameter Name="area" />
                        <asp:Parameter Name="address" />
                        <asp:Parameter Name="well" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="area" />
                        <asp:Parameter Name="address" />
                        <asp:Parameter Name="well" />
                        <asp:Parameter Name="land_id" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="land_id" />
                        <asp:Parameter Name="area" />
                        <asp:Parameter Name="address" />
                        <asp:Parameter Name="well" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtLandId" Name="land_id" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <table style ="width :100%; height :20%;">
        <tr>
            <td style="height: 6%">
                </td>
        </tr>
        <tr>
            <td style="height :75%" >
                &nbsp;&nbsp;&nbsp;
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="land_id" DataSourceID="SqlDataSource2"
                    Width="50%" CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" GridLines="Both">
                    <EditItemTemplate>
                        地块编号:
                        <asp:Label ID="land_idLabel1" runat="server" Text='<%# Eval("land_id") %>'></asp:Label><br />
                        地块面积:
                        <asp:TextBox ID="areaTextBox" runat="server" Text='<%# Bind("area") %>' Width="40%"></asp:TextBox>
                        亩<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="地块面积不能为空" ControlToValidate="areaTextBox" ValidationGroup="tishi">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="areaTextBox"
                            ErrorMessage="地块面积应大于0" Operator="GreaterThanEqual" ValidationGroup="tishi" ValueToCompare="0">*</asp:CompareValidator><br />
                        地块位置:
                        <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="地块位置不能为空" ControlToValidate="addressTextBox" ValidationGroup="tishi">*</asp:RequiredFieldValidator><br />
                        灌溉水源:
                        <asp:TextBox ID="wellTextBox" runat="server" Text='<%# Bind("well") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="灌溉来源不能为空" ControlToValidate="wellTextBox" ValidationGroup="tishi">*</asp:RequiredFieldValidator><br />
                        <asp:ValidationSummary ID="ValidationSummary2" runat="server"
                            HeaderText="带*的文本框是必填项：" ShowMessageBox="True" ValidationGroup="tishi" ShowSummary="False" />
                        <br />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="更新" ValidationGroup="tishi"></asp:LinkButton>
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="取消"></asp:LinkButton>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        地块编号:
                        <asp:TextBox ID="land_idTextBox" runat="server" Text='<%# Bind("land_id") %>' Width="139px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="land_idTextBox"
                            ErrorMessage="地块编号不能为空" ValidationGroup="tishi">*</asp:RequiredFieldValidator><br />
                        地块面积:
                        <asp:TextBox ID="areaTextBox" runat="server" Text='<%# Bind("area") %>' Width="40%"></asp:TextBox>亩<asp:RequiredFieldValidator
                            ID="RequiredFieldValidator4" runat="server" ControlToValidate="areaTextBox" ErrorMessage="地块面积不能为空"
                            ValidationGroup="tishi">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="areaTextBox"
                            ErrorMessage="CompareValidator" Operator="GreaterThan" ValidationGroup="tishi"
                            ValueToCompare="0">*</asp:CompareValidator><br />
                        地块位置:
                        <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="addressTextBox"
                            ErrorMessage="地块地址不能为空" ValidationGroup="tishi">*</asp:RequiredFieldValidator><br />
                        灌溉水源:
                        <asp:TextBox ID="wellTextBox" runat="server" Text='<%# Bind("well") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="wellTextBox"
                            ErrorMessage="灌溉水源不能为空" ValidationGroup="tishi">*</asp:RequiredFieldValidator><br />
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="带*的文本框是必填项："
                            ShowMessageBox="True" ShowSummary="False" ValidationGroup="tishi" />
                        <br />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="插入" ValidationGroup="tishi"></asp:LinkButton>
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="取消"></asp:LinkButton>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        地块编号:
                        <asp:Label ID="land_idLabel" runat="server" Text='<%# Eval("land_id") %>'></asp:Label><br />
                        地块面积:
                        <asp:Label ID="areaLabel" runat="server" Text='<%# Bind("area") %>'></asp:Label><br />
                        地块位置
                        <asp:Label ID="addressLabel" runat="server" Text='<%# Bind("address") %>'></asp:Label><br />
                        水源编号:
                        <asp:Label ID="wellLabel" runat="server" Text='<%# Bind("well") %>'></asp:Label><br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="编辑"></asp:LinkButton>
                        <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete"
                            Text="删除" OnClientClick="return confirm('确定删除这条数据？')"></asp:LinkButton>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="新建"></asp:LinkButton>
                    </ItemTemplate>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <EditRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <RowStyle ForeColor="#000066" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <HeaderTemplate>
                        &nbsp; &nbsp; &nbsp;&nbsp;选择的种植户信息：<br />
                        <br />
                    </HeaderTemplate>
                </asp:FormView>
                &nbsp;&nbsp;
            </td>
        </tr>
    </table>
</asp:Content>