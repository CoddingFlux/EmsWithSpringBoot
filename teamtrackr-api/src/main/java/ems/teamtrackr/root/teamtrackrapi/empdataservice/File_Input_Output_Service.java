package ems.teamtrackr.root.teamtrackrapi.empdataservice;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

import org.springframework.stereotype.Service;

@Service
public class File_Input_Output_Service {

	public void managefileDecrement(String filename) throws IOException {

		 // Read the holiday ID from the file
      File file = new File("src/main/resources/static/"+filename);
      FileInputStream fileInputStream = new FileInputStream(file);
      Scanner reader = new Scanner(fileInputStream);
      int hid = Integer.parseInt(reader.next());
      reader.close();
      fileInputStream.close();

      // Increment the holiday ID
      hid--;

      // Write the updated holiday ID back to the file
      FileOutputStream fileOutputStream = new FileOutputStream(file);
      FileWriter writer = new FileWriter(fileOutputStream.getFD());
      writer.write(String.valueOf(hid));
      writer.close();
      fileOutputStream.close();
	}
	
	public int managefileIncrement(String filename) throws IOException {

		 // Read the holiday ID from the file
     File file = new File("src/main/resources/static/"+filename);
     FileInputStream fileInputStream = new FileInputStream(file);
     Scanner reader = new Scanner(fileInputStream);
     int hid = Integer.parseInt(reader.next());
     reader.close();
     fileInputStream.close();

     // Increment the holiday ID
     hid++;

     // Write the updated holiday ID back to the file
     FileOutputStream fileOutputStream = new FileOutputStream(file);
     FileWriter writer = new FileWriter(fileOutputStream.getFD());
     writer.write(String.valueOf(hid));
     writer.close();
     fileOutputStream.close();
     
     return hid;
	}
	
}
