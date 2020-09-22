<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page import="ContactPackage.Contact"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>


<%
    Contact contato = null;
    String toDelete = null;
    boolean dontSave = false;
    try {
        String nome = request.getParameter("nome");
        String numero = request.getParameter("numero");
        String email = request.getParameter("email");
        toDelete = request.getParameter("toDelete");
        if (nome == null || numero == null || email == null) {
            dontSave = true;
        } else {
            contato = new Contact();
            contato.name = nome;
            contato.Number = numero;
            contato.Email = email;
        }

    } catch (Exception e) {
        dontSave = true;

    }
%>



<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>


    <body>
        <table border="1">
            <tr>
                <th>Nome</th>
                <th>Numero</th>
                <th>Email</th>
                <th> posicao </th>
            </tr>
            <%
                ArrayList<Contact> contacts = new ArrayList<Contact>();

                contacts = Contact.LoadContacts();
                if (!dontSave) {
                    contacts.add(contato);
                    Contact.saveContats(contacts);
                    contacts = Contact.LoadContacts();
                }

                if (toDelete != null && toDelete != "") {
                    try {
                        contacts.remove(contacts.get(Integer.parseInt(toDelete)));
                        Contact.saveContats(contacts);
                        contacts = Contact.LoadContacts();
                    } catch (Exception e) {
                    }
                }

                for (int i = 0; i < contacts.size(); i++) {
                    String Name = contacts.get(i).name;
                    String Email = contacts.get(i).Email;
                    String Numero = contacts.get(i).Number;

            %>



            <tr>
                <td><% out.println(Name); %></td>
                <td><% out.println(Numero); %></td>
                <td><% out.println(Email); %></td>
                <td> <% out.println(i); %> </td>
            </tr>







            <%
                }

            %>
        </table>
        <form> 
            <input type="text" name = "nome" required/>
            <input type="text" name="numero" required/>
            <input type="text" name="email" required/>
            <input type="submit" />
        </form>


        <form> 
            <input type="number" name = "toDelete" required/>
            <input type="submit" value="Delete"/>
        </form>

    </body>
</html>
