package com.example.teamtrackr;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.firestore.DocumentSnapshot;
import com.google.firebase.firestore.FirebaseFirestore;
import com.google.firebase.firestore.QueryDocumentSnapshot;
import com.squareup.picasso.Picasso;

import de.hdodenhof.circleimageview.CircleImageView;

public class Dashboard extends AppCompatActivity {

    FirebaseAuth firebaseAuth;
    FirebaseUser user;
    TextView logged_id,name,designame;
    ImageView logout,leave,holidays;
    CircleImageView leaveprofile;

    Button profile;

    public void onStart() {
        super.onStart();
        // Check if user is signed in (non-null) and update UI accordingly.
        FirebaseUser currentUser = firebaseAuth.getCurrentUser();
        if(currentUser == null){
            Intent start=new Intent(getApplicationContext(), LoginWithUser.class);
            startActivity(start);
            finish();
        }
    }
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_dashboard);

        firebaseAuth=FirebaseAuth.getInstance();
        user= firebaseAuth.getCurrentUser();
        //logged_id=findViewById(R.id.currentuser);
        logout=findViewById(R.id.logout);

        if(user.equals(""))
        {
            Intent main=new Intent(Dashboard.this, LoginWithUser.class);
            startActivity(main);
            finish();
        }
        else {
           // logged_id.setText(user.getEmail());
        }

        logout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                FirebaseAuth.getInstance().signOut();
                Toast.makeText(getApplicationContext(),"Logout Success",Toast.LENGTH_SHORT).show();
                Intent main=new Intent(Dashboard.this, LoginWithUser.class);
                startActivity(main);
                finish();
            }
        });

        leave=findViewById(R.id.leave);
        leave.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent leave=new Intent(getApplicationContext(), EmployeeLeave  .class);
                startActivity(leave);
                finish();
            }
        });

        holidays=findViewById(R.id.holidays);
        holidays.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent leave=new Intent(getApplicationContext(),HoliDays.class);
                startActivity(leave);
                finish();
            }
        });

        profile=findViewById(R.id.profile);
        profile.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent leave=new Intent(getApplicationContext(),ProfileDetail.class);
                startActivity(leave);
                finish();
            }
        });


        FirebaseFirestore db=FirebaseFirestore.getInstance();

        leaveprofile=findViewById(R.id.cimg);

        name=findViewById(R.id.textView7);
        designame=findViewById(R.id.textView8);
        FirebaseUser currentUser=FirebaseAuth.getInstance().getCurrentUser();
        String uid=currentUser.getUid().toString();


        db.collection("Employees").document(uid).get().addOnCompleteListener(new OnCompleteListener<DocumentSnapshot>() {
            @Override
            public void onComplete(@NonNull Task<DocumentSnapshot> task) {
                if(task.isSuccessful())
                {
                    String fname,lname,designation,imgurl="";
                        DocumentSnapshot document =task.getResult();
                        if(document.exists()) {
                            fname = (document.getString("FirstName")).toString();
                            lname = (document.getString("LastName")).toString();
                            designation= (document.getString("Designation")).toString();
                            imgurl= (document.getString("ImageUrl")).toString();

                            Picasso.get().load(imgurl).into(leaveprofile);
                            name.setText(fname+" "+lname);
                            designame.setText(designation);
                        }
                }
            }
        });
    }
}