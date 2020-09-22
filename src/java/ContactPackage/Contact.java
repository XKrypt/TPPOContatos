/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ContactPackage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.io.FileWriter;
import java.util.Scanner;
/**
 *
 * @author Fhayha
 */
public class Contact {
    public String name;
    public String Number;
    public String Email;
    static String path = "C:\\Users\\Fhayha\\Documents\\contacts.txt";
    
    public static ArrayList<ContactPackage.Contact> LoadContacts(){
        System.out.println("loading");
        try{
            
            File myObj = new File(path);
            Scanner myReader = new Scanner(myObj);
             ArrayList<ContactPackage.Contact> contacts = new ArrayList<ContactPackage.Contact>();
            if(myObj.createNewFile()){
                System.out.println("loading");
                
            }else{
                System.out.println("loading");
                while(myReader.hasNextLine()){
                    String data = myReader.nextLine();
                    String contats[] = data.split("!");
                    
                    
                     ContactPackage.Contact contact = new ContactPackage.Contact();
                     contact.name = contats[0];
                     contact.Number = contats[1];
                     contact.Email = contats[2];  
                     contacts.add(contact);
                }
                
                return contacts;
            
            }
            
      
    }catch(IOException e){System.out.println("Error");}
        
        
        return null;
        
    }
    
       public static void saveContats(ArrayList<ContactPackage.Contact> contacts){
           try{
               //Mudar o Diretorio
           FileWriter file = new FileWriter(path);

           String newLine = System.getProperty("line.separator");
           for(int i = 0; i < contacts.size(); i++){
               
                String contactline = contacts.get(i).name + "!" + contacts.get(i).Number + "!" + contacts.get(i).Email;
                
                file.write(contactline + newLine);
                    
            }
           file.close();
           }catch(IOException e){ System.out.println("Error");}
    }
        
    
    
    
    
    
 
    
}
