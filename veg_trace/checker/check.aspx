<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="check.aspx.cs" Inherits="checker_check" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%; height: 70%">
        <tr>
            <td style="width: 100%; height: 15%;">
                选择种植户：<asp:DropDownList ID="ddl1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1"
                    DataTextField="farmer_name" DataValueField="farmer_name" Width="30%" OnDataBound="ddl1_DataBound">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                    SelectCommand="SELECT DISTINCT [farmer_name] FROM [farmer]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="width: 95%; height: 85%;">
                <asp:GridView ID="GridView1" runat="server" Height="85%" Width="95%" AllowPaging="True" AutoGenerateColumns="False" CellPadding="3" DataKeyNames="land_id,veg_item" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="land_id" HeaderText="检测地块" ReadOnly="True" SortExpression="land_id" />
                        <asp:BoundField DataField="date" HeaderText="检测日期" SortExpression="date" />
                        <asp:BoundField DataField="farmer_name" HeaderText="种植户" SortExpression="farmer_name" />
                        <asp:BoundField DataField="veg_item" HeaderText="种植品种" ReadOnly="True" SortExpression="veg_item" />
                        <asp:BoundField DataField="worker_name" HeaderText="检测人员" SortExpression="worker_name" />
                        <asp:BoundField DataField="result" HeaderText="检测结果" SortExpression="result" />
                    </Columns>
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                &nbsp;
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>" DeleteCommand="DELETE FROM checking WHERE (land_id = @land_id) AND (date = @date)" InsertCommand="INSERT INTO checking(land_id, farmer_name, veg_item, worker_id, worker_name, date, A0, A1, re, result) VALUES (@land_id, @farmer_name, @veg_item, @worker_id, @worker_name, @date, @A0, @A1, @re, @result)" SelectCommand="SELECT land_id, farmer_name, veg_item, worker_id, worker_name, date, A0, A1, re, result FROM checking WHERE (farmer_name = @farmer_name) OR (@farmer_name IS NULL)" UpdateCommand="UPDATE checking SET A0 = @A0, A1 = @A1, re = @re, result = @result WHERE (land_id = @land_id) AND (veg_item = @veg_item) AND (farmer_name = @farmer_name) AND (worker_id = @worker_id) AND (worker_name = @worker_name) AND (date = @date)">
                    <DeleteParameters>
                        <asp:Parameter Name="land_id" />
                        <asp:Parameter Name="date" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="A0" />
                        <asp:Parameter Name="A1" />
                        <asp:Parameter Name="re" />
                        <asp:Parameter Name="result" />
                        <asp:Parameter Name="land_id" />
                        <asp:Parameter Name="veg_item" />
                        <asp:Parameter Name="farmer_name" />
                        <asp:Parameter Name="worker_id" />
                        <asp:Parameter Name="worker_name" />
                        <asp:Parameter Name="date" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddl1" Name="farmer_name" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="land_id" />
                        <asp:Parameter Name="farmer_name" />
                        <asp:Parameter Name="veg_item" />
                        <asp:Parameter Name="worker_id" />
                        <asp:Parameter Name="worker_name" />
                        <asp:Parameter Name="date" />
                        <asp:Parameter Name="A0" />
                        <asp:Parameter Name="A1" />
                        <asp:Parameter Name="re" />
                        <asp:Parameter Name="result" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <table style="width: 100%; height: 30%">
        <tr>
            <td style="width: 100%; height :25%">
            </td>
        </tr>
        <tr>
            <td style="width: 100%; height :75%" align="center">
                <asp:FormView ID="FormView1" runat="server" CellPadding="3" DataKeyNames="land_id,date"
                    DataSourceID="SqlDataSource2"
                    OnItemCreated="FormView1_ItemCreated" Width="68%" Height="308px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" GridLines="Both">
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <EditRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <EditItemTemplate>
                        检测地块：
                        <asp:Label ID="land_idLabel1" runat="server" Text='<%# Eval("land_id") %>'></asp:Label><br />
                        种植户：&nbsp;
                        <asp:Label ID="farmer_nameLabel" runat="server" Text='<%# Bind("farmer_name") %>'
                            Width="78px"></asp:Label><br />
                        种植品种：<asp:Label ID="veg_itemLabel" runat="server" Text='<%# Bind("veg_item") %>'></asp:Label>
                        <br />
                        检测人员：<asp:Label ID="worker_nameLabel" runat="server" Text='<%# Bind("worker_name") %>'></asp:Label>&nbsp;<br />
                        检测人员代码：
                        <asp:Label ID="worker_idLabel" runat="server" Text='<%# Bind("worker_id") %>'></asp:Label><br />
                        <br />
                        检测日期：<asp:Label ID="dateLabel1" runat="server" Text='<%# Eval("date") %>'></asp:Label><br />
                        A0:
                        <asp:TextBox ID="A0TextBox" runat="server" Text='<%# Bind("A0") %>' Width="95px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="不能为空"
                            ValidationGroup="tishi" ControlToValidate="A0TextBox"></asp:RequiredFieldValidator><br />
                        A1:
                        <asp:TextBox ID="A1TextBox" runat="server" Text='<%# Bind("A1") %>' Width="101px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="A1TextBox"
                            ErrorMessage="不能为空" ValidationGroup="tishi"></asp:RequiredFieldValidator><br />
                        抑制率
                        <asp:TextBox ID="reTextBox" runat="server" Text='<%# Bind("re") %>' Width="95px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="不能为空"
                            ValidationGroup="tishi" ControlToValidate="reTextBox"></asp:RequiredFieldValidator><br />
                        检测结果：<asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("result") %>'
                            Width="109px">
                            <asp:ListItem>合格</asp:ListItem>
                            <asp:ListItem>不合格</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="更新" ValidationGroup="tishi"></asp:LinkButton>
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="取消"></asp:LinkButton>
                    </EditItemTemplate>
                    <RowStyle ForeColor="#000066" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <InsertItemTemplate>
                        检测时间：<asp:Label ID="dateLabel" runat="server" Text='<%# Bind("date") %>' Width="76px"></asp:Label>&nbsp;<br />
                        种植户：<asp:TextBox ID="farmer_nameTextBox" runat="server" Text='<%# Bind("farmer_name") %>'
                            Width="87px" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="farmer_name" DataValueField="farmer_name"></asp:TextBox>&nbsp;
                        <br />
                        <br />
                        种植地块：<asp:DropDownList ID="ddl_land" runat="server" SelectedValue='<%# Bind("land_id") %>'
                            Width="99px" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource7" DataTextField="land_id" DataValueField="land_id">
                        </asp:DropDownList><br />
                        检测品种：
                        <asp:TextBox ID="veg_itemTextBox" runat="server" Text='<%# Bind("veg_item") %>' Width="83px"></asp:TextBox><br />
                        <br />
                        检测人员：<asp:DropDownList ID="ddl_worker" runat="server" SelectedValue='<%# Bind("worker_name") %>'
                            Width="105px" AutoPostBack="True" DataSourceID="SqlDataSource5" DataTextField="worker_name" DataValueField="worker_name">
                        </asp:DropDownList><br />
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                            SelectCommand="SELECT DISTINCT [worker_name] FROM [worker] WHERE ([department] = @department)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="检测部" Name="department" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                        检测人员ID：<asp:DropDownList ID="ddl_wid" runat="server" SelectedValue='<%# Bind("worker_id") %>'
                            Width="99px">
                        </asp:DropDownList><br />
                        A0:
                        <asp:TextBox ID="A0TextBox" runat="server" Text='<%# Bind("A0") %>' Width="117px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="A0TextBox"
                            ErrorMessage="不能为空" ValidationGroup="tishi"></asp:RequiredFieldValidator><br />
                        A1:
                        <asp:TextBox ID="A1TextBox" runat="server" Text='<%# Bind("A1") %>' Width="113px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="A1TextBox"
                            ErrorMessage="不能为空" ValidationGroup="tishi"></asp:RequiredFieldValidator><br />
                        re:
                        <asp:TextBox ID="reTextBox" runat="server" Text='<%# Bind("re") %>' Width="111px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="reTextBox"
                            ErrorMessage="不能为空" ValidationGroup="tishi"></asp:RequiredFieldValidator><br />
                        检测结果：&nbsp;<asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("result") %>'
                            Width="97px">
                            <asp:ListItem>合格</asp:ListItem>
                            <asp:ListItem>不合格</asp:ListItem>
                        </asp:DropDownList><br />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="插入" ValidationGroup="tishi" OnClientClick='return confirm("确定添加数据？")'></asp:LinkButton>
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="取消"></asp:LinkButton>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        检测地块：
                        <asp:Label ID="land_idLabel" runat="server" Text='<%# Eval("land_id") %>'></asp:Label><br />
                        种植户：
                        <asp:Label ID="farmer_nameLabel" runat="server" Text='<%# Bind("farmer_name") %>'></asp:Label><br />
                        种植品种：
                        <asp:Label ID="veg_itemLabel" runat="server" Text='<%# Bind("veg_item") %>'></asp:Label><br />
                        检测人员代码：
                        <asp:Label ID="worker_idLabel" runat="server" Text='<%# Bind("worker_id") %>'></asp:Label><br />
                        检测人员：<asp:Label ID="worker_nameLabel" runat="server" Text='<%# Bind("worker_name") %>'></asp:Label><br />
                        检测日期：<asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>'></asp:Label><br />
                        A0:
                        <asp:Label ID="A0Label" runat="server" Text='<%# Bind("A0") %>'></asp:Label><br />
                        A1:
                        <asp:Label ID="A1Label" runat="server" Text='<%# Bind("A1") %>'></asp:Label><br />
                        抑制率：
                        <asp:Label ID="reLabel" runat="server" Text='<%# Bind("re") %>'></asp:Label><br />
                        检测结果：
                        <asp:Label ID="resultLabel" runat="server" Text='<%# Bind("result") %>'></asp:Label><br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="编辑"></asp:LinkButton>
                        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                            OnClientClick="return confirm('确定删除这条数据？')" Text="删除"></asp:LinkButton>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="新建"></asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <HeaderTemplate>
                        <br />
                        选择的详细检测信息：<br />
                        <br />
                    </HeaderTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>" 
                    SelectCommand="SELECT [land_id], [farmer_id], [farmer_name] FROM [landmanagement]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                    SelectCommand="SELECT DISTINCT [land_id], [veg_item] FROM [plantplan] WHERE ([land_id] = @land_id)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="@land_id" Name="land_id" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:vegetableConnectionString %>"
                    SelectCommand="SELECT DISTINCT [worker_id], [worker_name] FROM [worker] WHERE (([worker_name] = @worker_name) AND ([department] = @department))">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="@worker_name" Name="worker_name" Type="String" />
                        <asp:Parameter DefaultValue="检测部" Name="department" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
