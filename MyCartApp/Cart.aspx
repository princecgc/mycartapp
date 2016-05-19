<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="MyCartApp.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="gridcart" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductId" OnRowDeleting="gridcart_RowDeleting" OnRowUpdating="gridcart_RowUpdating" Height="179px" Width="528px">
        <Columns>
            <asp:BoundField DataField="ProductId" HeaderText="Product ID" />
            <asp:BoundField DataField="Name" HeaderText="Name" />
            <asp:TemplateField HeaderText="Quantity">
                <ItemTemplate>
                    <asp:TextBox ID="Textquan" runat="server" Text='<%#Eval("Quantity") %>'></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Cost" HeaderText="Cost" />
            <asp:BoundField DataField="Total_cost" HeaderText="Total Cost" />
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton1" runat="server" CommandName="Update" ImageUrl="~/images/update.png" Height="25px" Width="25px"/>
                    <asp:ImageButton ID="ImageButton2" runat="server" CommandName="Delete" ImageUrl="~/images/Delete_Icon.png" Height="25px" Width="25px" />
                </ItemTemplate>
            </asp:TemplateField>
          
        </Columns>
    </asp:GridView>
    <br />
    <asp:Label ID="Label1" runat="server" Text="Add Coupon"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

    <asp:Button ID="btnapplyc" runat="server" Text="Apply Coupon" OnClick="btnapplyc_Click" />

&nbsp;&nbsp; 

    <br />
    <table style="width: 25%">
        <tr>
            <td style="height: 20px">
                <asp:Label ID="Label2" runat="server" Text="Total "></asp:Label>
            </td>
            <td style="height: 20px">
                <asp:Label ID="lbltotal" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Discount"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lbldisc" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Sub Total"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblsubt" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
    </table>

</asp:Content>
