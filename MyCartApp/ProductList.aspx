<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="MyCartApp.BLL.ProductList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            margin-right: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
   <div class="row products">

                        
        <asp:Repeater ID="prod_list_rept" runat="server" OnItemCommand="prod_list_rept_ItemCommand">
            <ItemTemplate>
                <div class="col-md-4 col-sm-6">
                            <div class="product">
                                <div class="flip-container">
                                    <div class="flipper">
                                        <div class="front">
                                            <a href="ProductDetails.aspx?s=<%#Eval("ProductId") %>">
                                                <img src="img/product1.jpg" alt="" class="img-responsive">
                                            </a>
                                        &nbsp;</div>
                                       
                                    </div>
                                </div>
                               
                                <div class="text">
                                    <h3> <a href="ProductDetails.aspx?s=<%#Eval("ProductId") %>"><asp:Label ID="Label3" runat="server" Text='<%#Eval("Name") %>' ></asp:Label></a></h3>
                                    <p class="price">   <asp:Label ID="Label2" runat="server" Text='<%#Eval("Cost") %>' ></asp:Label></p>
                                   <%-- <p class="buttons">
                                         <a href="ProductList.aspx?s=<%#Eval("ProductId") %>">View detail</a>
                                         <%--<a href="ProductList.aspx?s=<%#Eval("ProductId") %>"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                    </p>--%>
                                </div>
                                <!-- /.text -->
                            </div>
                            <!-- /.product -->
                        </div>
               
               

            </ItemTemplate>
        </asp:Repeater>
   </div>
        
    </form>
</body>
</html>
