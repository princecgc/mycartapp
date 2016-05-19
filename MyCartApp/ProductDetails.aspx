<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="MyCartApp.ProductDetails" MasterPageFile="~/Site1.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:Image ID="Image1" runat="server" Width="16px" />
                </td>
                <td class="auto-style3">
                    <table class="auto-style4">
                        <tr>
                            <td>
                                <asp:Label ID="Product_name_lbl" runat="server" Font-Bold="True" Font-Size="Larger" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Descrip_lbl" runat="server" Font-Bold="True" Font-Size="Small" Text="Description"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Price_lbl" runat="server" Font-Bold="True" Font-Size="Small" Text="Price"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;<asp:Label ID="qty_lbl" runat="server" Font-Bold="True" Font-Size="Small" Text="Quantity"></asp:Label>
                                <asp:TextBox ID="Qty_textbox" runat="server" TextMode="Number"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="Add_to_Cart_btn" runat="server" OnClick="Button1_Click" Text="Add To Cart" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    
    </div>
   </asp:Content>