<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="MyCartApp.Categories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="grdalldata" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="grdalldata_RowCancelingEdit" OnRowDeleting="grdalldata_RowDeleting" OnRowEditing="grdalldata_RowEditing" OnRowUpdating="grdalldata_RowUpdating" DataKeyNames="id">
        <Columns>
            <asp:TemplateField HeaderText="id">
                <ItemTemplate >
                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("id") %>'></asp:Label>

                </ItemTemplate>
               
            </asp:TemplateField>
            <asp:TemplateField HeaderText="name">
                <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%#Eval("category_name ") %>'></asp:Label>
                    </ItemTemplate>
                <EditItemTemplate>

                    <asp:TextBox ID="TextBox1" runat="server" Text='<%#Eval("category_name ") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="actions">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" Text="Edit" CommandName="Edit" CommandArgument="Edit"/>
                    <asp:Button ID="Button2" runat="server" Text="Delete" CommandName="Delete" CommandArgument="Delete"/>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Button ID="Button3" runat="server" Text="Update" CommandName="Update" CommandArgument="Update"/>
                    <asp:Button ID="Button4" runat="server" Text="Cancel" CommandName="Cancel" CommandArgument="Cancel"/>
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>


