<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TryWeb.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <title>GIU Job Portal</title>
    <style>
        .backimg{
        background-image:url('backgroundd.png');
        width:1900px;
        height:920px;
    }
        .newStyle1 {
            font-family: "open Sans";
        }
        .auto-style1 {
            font-family: "open Sans";
            color: #FFC453;
            font-size: large;
        }
        .newStyle2 {
            font-family: "open Sans";
        }
        .newStyle3 {
            font-family: "open Sans";
            font-size: large;
        }
        .auto-style2 {
            font-size: x-large;
            color: #FFC453;
            text-align: left;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">
        <div align ="center" style="height:356px">
            <div class =" backimg">

                <asp:Panel ID="Panel1" runat="server" Height="875px">
                    <br />
                    <asp:Button ID="Button1" runat="server" Onclick="Login" Text="Login" Height="34px" Width="110px" style="color: #FFC453; background-color: #000000" />
                    &nbsp;&nbsp;&nbsp;<br />
                    <br />
                    <span class="auto-style1">Employers with accepted profiles</span><br />
                    <br />
                    <asp:GridView ID="dtv" runat="server" AutoGenerateColumns="False" Height="204px" style="text-align: center; color: #FFC453; background-color: #0E40A7;" Width="476px" CssClass="newStyle2">
                        <Columns>
                            <asp:BoundField DataField="first_name" HeaderText="First name" />
                            <asp:BoundField DataField="middle_name" HeaderText="Middle name" />
                            <asp:BoundField DataField="last_name" HeaderText="Last name" />
                        </Columns>
                    </asp:GridView>
                    <span class="auto-style2">
                    <br />
                    Search visible jobs by required semesters or faculties:<br />
                    <br />
                    <asp:DropDownList ID="DropDownList1" runat="server"  Width="158px" style="color: #FFC453; background-color: #000000" Height="34px">
                        <asp:ListItem Text="Required semester" Value="Semester" />
                        <asp:ListItem Text="Allowed faculties" Value="faculties" />
                    </asp:DropDownList>
&nbsp;&nbsp;<asp:TextBox ID="TextBox1" runat="server" style="color: #FFC453; background-color: #000000" Height="26px" Width="216px"></asp:TextBox>
                    &nbsp;&nbsp;<asp:Button ID="Button2" Onclick="SearchB" runat="server" Text="Search" style="color: #FFC453; background-color: #000000" Height="34px" Width="100px" />
                    &nbsp;
                    <asp:Button ID="Button3" runat="server" style="color: #FFC453; background-color: #000000" OnClick="CancelB" Text="Cancel" Height="34px" Width="98px" />
                    <br />
                    <br />
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                    <br />
                    </span>
                    <asp:GridView ID="dtv0" runat="server" AutoGenerateColumns="True" CssClass="newStyle2" Height="131px" style="color: #FFC453; background-color: #0E40A7; font-size: medium;" Width="1345px">
                    </asp:GridView>
                </asp:Panel>

                </div>
            </div>
        </form>
    </body>
</html>
