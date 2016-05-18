<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="MyCartApp.Products" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 377px;
        }
        .auto-style3 {
            width: 181px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="catL_lbl" runat="server" Text="Categories:"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:DropDownList ID="cat_list" runat="server">
                    </asp:DropDownList>
                </td>
                <td rowspan="6">
                    <asp:GridView ID="prod_gridview" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductId" AutoGenerateSelectButton="True" OnSelectedIndexChanged="prod_gridview_SelectedIndexChanged1">
                        <Columns>
                            <asp:BoundField DataField="ProductId" HeaderText="Product_id" />
                            <asp:BoundField DataField="Name" HeaderText="Product_Name" />
                           
                        </Columns>
                    </asp:GridView>
                </td>
            </tr> 
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="name_lbl" runat="server" Text="Name:"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="name_text" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="desc_lbl" runat="server" Text="Description:"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="desc_text" runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="cost_lbl" runat="server" Text="Cost:"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="cost_text" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="minstock_lbl" runat="server" Text="Min Stock:"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="minstock_text" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="actualstock_lbl" runat="server" Text="Actual Stock:"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="actualstock_text" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style2">
                    <asp:Button ID="final_btn" runat="server" Text="Add Product" OnClientClick="return validate_form()" OnClick="final_btn_Click" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
   <script type="text/javascript">
       function validate_form() {
           var numbers = /^[0-9]+$/;
           if ((document.getElementById('<%=name_text.ClientID %>').value).length == 0) {
               alert("The name textbox should not be empty");
           }
           if ((document.getElementById('<%=desc_text.ClientID %>').value).length == 0) {
               alert("The Description textbox should not be empty");
           }
          
           if (!cost_text.value.match(numbers)) {
               alert("Please enter number1!!");
               //return false;
           }
               if ((document.getElementById('<%=cost_text.ClientID %>').value).length == 0) {
                   alert("The cost  textbox should not be empty");
               }

           if (!minstock_text.value.match(numbers)) {
               alert("Please enter number2!!");
               //return false;
           }
               if ((document.getElementById('<%=minstock_text.ClientID %>').value).length == 0) {
                   alert("The minstock textbox should not be empty");
                   var x = document.getElementById('<%=minstock_text.ClientID %>').value;
                   if (x < 0) {
                       alert("Sorry!!! you have not choosen any product..");
                       return false;
                   }
               }

           if (!actualstock_text.value.match(numbers)) {
               alert("Please enter number3!!");
               //return false;
           }
          
               if ((document.getElementById('<%=actualstock_text.ClientID %>').value).length == 0) {
                   alert("The actualstock textbox should not be empty");
                   var y = document.getElementById('<%=actualstock_text.ClientID %>').value;
                   if (y < 0) {
                       alert("Sorry!!! Product is not available ");
                       return false;
                   }
               }
           return true; 
           }
           
       
       </script>
     </table>
    </form>
</body>
</html>
