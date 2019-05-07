<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="TemperatureConverter._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Temperature Convertor</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/style.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar -->
        <nav class="navbar navbar-light bg-light">
            <a class="navbar-brand" href="#">
                <img src="Images/appIcon.png" width="30" height="30" class="d-inline-block align-top" alt="Application logo" />
                Temperature Convertor
            </a>
        </nav>
        <div class="container topMargin">
            <div class="row">
                <div class="col centerText">
                    <img class="responsiveImage" src="Images/tempImage.png" alt="Thermometer image" />
                </div>
                <div class="col-8 centerDiv">
                    <div class="form-group">
                        <asp:Label ID="LabelFrom" runat="server" Text="From"></asp:Label>
                        <asp:DropDownList class="form-control" ID="DropDownListFrom" runat="server">
                            <asp:ListItem Selected="True" Value="C">Celsius</asp:ListItem>
                            <asp:ListItem Value="F">Fahrenheit</asp:ListItem>
                            <asp:ListItem Value="K">Kelvin</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LabelTo" runat="server" Text="To"></asp:Label>
                        <asp:DropDownList class="form-control" ID="DropDownListTo" runat="server">
                            <asp:ListItem Value="C">Celsius</asp:ListItem>
                            <asp:ListItem Selected="True" Value="F">Fahrenheit</asp:ListItem>
                            <asp:ListItem Value="K">Kelvin</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LabelInput" runat="server" Text="Input Temperature"></asp:Label>
                        <asp:TextBox class="form-control" ID="TextBoxInput" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTextBoxInput" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBoxInput" Display="Dynamic" ForeColor="Red">Input value is required</asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidatorTextBoxInput" runat="server" ErrorMessage="RangeValidator" ControlToValidate="TextBoxInput" ForeColor="Red" MaximumValue="1000" MinimumValue="-1000" Type="Integer">Range should be between -1000 to 1000</asp:RangeValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LabelOutput" runat="server" Text="Output Tempreature"></asp:Label>
                        <h6><asp:Label ID="LabelResult" runat="server"></asp:Label></h6>
                    </div>
                    <div class="form-group">
                        <asp:Button class="btn btn-outline-primary btn-lg" ID="ButtonConvert" runat="server" Text="Convert" OnClick="ButtonConvert_Click" />
                        <asp:Button class="btn btn-outline-secondary btn-lg" ID="ButtonClear" runat="server" Text="Clear" CausesValidation="False" OnClick="ButtonClear_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
