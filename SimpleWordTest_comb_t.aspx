<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SimpleWordTest_comb_t.aspx.cs" MaintainScrollPositionOnPostback="true" Inherits="SimpleWordTest_comb_t" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:MultiView ID="CBF110034_MV1" ActiveViewIndex="0" runat="server">
        <asp:View ID="CBF110034_View1" runat="server">
            <asp:GridView ID="CBF110034_GV1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" EmptyDataText="沒有資料錄可顯示。" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
                <AlternatingRowStyle BackColor="PaleGoldenrod" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="更新"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Are U suRe ?')" Text="刪除"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="word" HeaderText="word" SortExpression="word" />
                    <asp:BoundField DataField="ch_explanation" HeaderText="ch_explanation" SortExpression="ch_explanation" />
                    <asp:BoundField DataField="sentence" HeaderText="sentence" SortExpression="sentence" />
                    <asp:BoundField DataField="sno" HeaderText="sno" SortExpression="sno" />
                    <asp:BoundField DataField="level" HeaderText="level" SortExpression="level" />
                    <asp:BoundField DataField="frequency" HeaderText="frequency" SortExpression="frequency" />
                    <asp:BoundField DataField="weight" HeaderText="weight" SortExpression="weight" />
                </Columns>
                <FooterStyle BackColor="Tan" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                <SortedAscendingCellStyle BackColor="#FAFAE7" />
                <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                <SortedDescendingCellStyle BackColor="#E1DB9C" />
                <SortedDescendingHeaderStyle BackColor="#C2A47B" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" DeleteCommand="DELETE FROM [gept_words] WHERE [Id] = @Id" InsertCommand="INSERT INTO [gept_words] ([word], [ch_explanation], [sentence], [sno], [level], [frequency], [weight]) VALUES (@word, @ch_explanation, @sentence, @sno, @level, @frequency, @weight)" SelectCommand="SELECT [Id], [word], [ch_explanation], [sentence], [sno], [level], [frequency], [weight] FROM [gept_words]" UpdateCommand="UPDATE [gept_words] SET [word] = @word, [ch_explanation] = @ch_explanation, [sentence] = @sentence, [sno] = @sno, [level] = @level, [frequency] = @frequency, [weight] = @weight WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="word" Type="String" />
                    <asp:Parameter Name="ch_explanation" Type="String" />
                    <asp:Parameter Name="sentence" Type="String" />
                    <asp:Parameter Name="sno" Type="String" />
                    <asp:Parameter Name="level" Type="Double" />
                    <asp:Parameter Name="frequency" Type="Double" />
                    <asp:Parameter Name="weight" Type="Double" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="word" Type="String" />
                    <asp:Parameter Name="ch_explanation" Type="String" />
                    <asp:Parameter Name="sentence" Type="String" />
                    <asp:Parameter Name="sno" Type="String" />
                    <asp:Parameter Name="level" Type="Double" />
                    <asp:Parameter Name="frequency" Type="Double" />
                    <asp:Parameter Name="weight" Type="Double" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            請點選單字來查閱中文解釋<br />
            <asp:DropDownList ID="CBF110034_DDL1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="word" DataValueField="ch_explanation">
            </asp:DropDownList>
            <asp:Button ID="CBF110034_PreviousButton" runat="server" Text="PreviousButton" />
            <asp:Button ID="CBF110034_NextButton" runat="server" Text="NextButton" />
            <asp:Button ID="CBF110034_testBtn" runat="server" Text="測驗去" />    
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" SelectCommand="SELECT top 10 * FROM [gept_words]"></asp:SqlDataSource>
            <br />
            <asp:Literal ID="CBF110034_cambridge" runat="server"></asp:Literal>
            <br />
            <br />
            <a href="https://github.com/wfhsiao/web_database_programming/blob/master/gept_words_reflections.html">GitHub心得</a>&nbsp; <a href="gept_words_reflections.html">本地端心得網頁</a>
        </asp:View>
        
        <asp:View ID="CBF110034_View2" runat="server">        
            <asp:Literal ID="CBF110034_ch_hint" runat="server"></asp:Literal>
            <asp:TextBox ID="CBF110034_input" runat="server" onclick="this.setSelectionRange(0,999)" onfocus="this.setSelectionRange(0,999)" AutoComplete="off"></asp:TextBox>
            <asp:Button ID="CBF110034_nextQBtn" runat="server" Text="下一題" />
            <br />
            請輸入完整單字(底線是用來提示有幾個字元, 如果消失了可以移動滑鼠至方格上來查看.)
        </asp:View>        
    </asp:MultiView>
    </div>
    </form>
</body>
</html>
