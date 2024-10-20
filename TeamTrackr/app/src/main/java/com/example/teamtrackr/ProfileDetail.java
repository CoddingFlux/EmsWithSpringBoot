package com.example.teamtrackr;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.firestore.DocumentChange;
import com.google.firebase.firestore.DocumentSnapshot;
import com.google.firebase.firestore.FirebaseFirestore;
import com.google.firebase.firestore.QuerySnapshot;
import com.squareup.picasso.Picasso;

import de.hdodenhof.circleimageview.CircleImageView;

public class ProfileDetail extends AppCompatActivity {

    CircleImageView profile;
    ImageView back;
    TextView fnamelname,email1,contact1,uname1,jdate1,cname1,dname1,dename1;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_profile_detail);

        profile=findViewById(R.id.cimg);
        fnamelname=findViewById(R.id.name);
        email1=findViewById(R.id.emailid);
        contact1=findViewById(R.id.contact);
        uname1=findViewById(R.id.username);
        jdate1=findViewById(R.id.joiningdate);
        cname1=findViewById(R.id.companyname);
        dname1=findViewById(R.id.department);
        dename1=findViewById(R.id.designation);
        FirebaseFirestore db=FirebaseFirestore.getInstance();

        FirebaseUser currentUser = FirebaseAuth.getInstance().getCurrentUser();
        String uid=currentUser.getUid().toString();

        db.collection("Employees").document(uid).get().addOnCompleteListener(new OnCompleteListener<DocumentSnapshot>() {
            @Override
            public void onComplete(@NonNull Task<DocumentSnapshot> task) {
           DocumentSnapshot document=task.getResult();


           if(document.exists()){
               String imageurl,fname,lname,email,contact,uname,jdate,cname,dname,dename;
                imageurl=document.getString("ImageUrl").toString();
               Picasso.get().load(imageurl).into(profile);

               fname=document.getString("FirstName").toString();
               lname=document.getString("LastName").toString();
               fnamelname.setText(fname+" "+lname);


               email=document.getString("EmailId").toString();
               email1.setText(email);

               contact=document.get("PhoneNumber").toString();
               contact1.setText(contact);

               uname=document.getString("UserName").toString();
               uname1.setText(uname);

               jdate=document.getString("JoiningDate").toString();
               jdate1.setText(jdate);

               cname=document.getString("CompanyName").toString();
               cname1.setText(cname);

               dname=document.getString("DepartmentName").toString();
               dname1.setText(dname);

               dename=document.getString("Designation").toString();
               dename1.setText(dename);
           }
            }
        });

        back=findViewById(R.id.back);
        back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent back=new Intent(getApplicationContext(), Dashboard.class);
                startActivity(back);
                finish();
            }
        });

    }
}