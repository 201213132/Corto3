/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Archivo;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
/**
 *
 * @author carlosdavid
 */
public class Leer_Archivo {
   
    FileReader fr=null;
    BufferedReader br = null;

    public String leer(String ruta){
        File archivo;
	try {
            String datos="";
            archivo = new File(ruta);	
            try {
		fr=new FileReader(archivo);
		br=new BufferedReader(fr);
		String linea;
		while ((linea = br.readLine())!= null) {
                    datos+= linea+ "\n";
		}	 
            } catch (IOException e) {
                System.err.println("Error al abrir el archivo "+e.toString());
            }	
            return datos;
			
	} catch (Exception e1) {
            System.err.println("Error no se pudo encontrar el archivo "+e1.toString());
	}
		
	finally{
            try {
		br.close();
            } catch (IOException e2) {
                System.err.println("Error al cerrar el archivo "+e2.toString());
            }
	}
        return null;
    }
}
