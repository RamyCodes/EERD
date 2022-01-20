<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TryWeb.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GIU Job Portal</title>
    <style>
    .backimg{
        background-image:url('backgroundd.png');
        width:auto;
        height:878px;
    }
    </style>
    <style type="text/css">
        #form1 {
            text-align: center;
            height: 650px;
        }
        .auto-style1 {
            font-weight: normal;
            font-family: "Open Sans";
            color: #FFFF00;
            height: 58px;
        }
        .newStyle1 {
            font-family: "Open Sans";
        }
        .newStyle2 {
            font-family: "Open Sans";
        }
        .newStyle3 {
            font-family: "Open Sans";
        }
        .newStyle4 {
            font-family: "Open Sans";
        }
        .auto-style3 {
            font-family: "Open Sans";
            color: #FFFF66;
        }
        .auto-style4 {
            color: #FFFF66;
        }
        .auto-style5 {
            color: #FFC453;
            font-size: medium;
            background-color: #000000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div align ="center" style="height:449px">
            <div class =" backimg">
            <h1 class="auto-style1">
                &nbsp;</h1>
                <h1 class="auto-style1">
                <asp:Button ID="Button2" runat="server" Height="49px" OnClick="homeB" style="font-size: medium; text-align: center; color: #FFC453; background-color: #000000;" Text="Home" Width="104px" />
                </h1>
                <h1 class="auto-style1">&nbsp;Log In</h1>
                <span class="auto-style3">Email:</span><br />
            <asp:TextBox ID="email" runat="server" CssClass="auto-style5"></asp:TextBox>
            <br />
                <span class="auto-style3">Password</span><span class="auto-style4">:</span><br />
            <asp:TextBox ID="password" runat="server" CssClass="auto-style5"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="loginB" runat="server" OnClick="login" Text="Log In" Height="41px" style="color: #FFC453; font-size: medium; background-color: #000000" Width="106px" />
            <br />
            <br />
            <br />
        </div>
            </div>
        <span class="auto-style3">Not registered yet?</span><br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Signup" Text="Sign Up" CssClass="auto-style5" Height="51px" Width="126px" />

        <br />
        <br />
        <br />
        <br />
                    <asp:Label ID="Label1" runat="server" Text="" style="color: #FF0000; font-size: x-large;"></asp:Label>

    </form>
</body>
</html>
