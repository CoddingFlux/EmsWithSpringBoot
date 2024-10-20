package com.example.teamtrackr;

import androidx.appcompat.app.AppCompatActivity;
import androidx.viewpager.widget.ViewPager;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;
import android.widget.Spinner;

import com.google.android.material.tabs.TabLayout;
import com.google.firebase.Firebase;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;

public class EmployeeLeave extends AppCompatActivity {

    TabLayout tl;
    ViewPager vp;
Spinner leavetype;
    ViewPagerManager adapter;
    ImageView imgback;

    public void onStart() {
        super.onStart();
        // Check if user is signed in (non-null) and update UI accordingly.
        FirebaseUser currentUser = FirebaseAuth.getInstance().getCurrentUser();
        if(currentUser == null){
            Intent start=new Intent(getApplicationContext(), LoginWithUser.class);
            startActivity(start);
            finish();
        }
    }
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_employee_leave);
        tl=findViewById(R.id.tabLayout);
        vp=findViewById(R.id.viewpager);
        imgback=findViewById(R.id.back);

        adapter=new ViewPagerManager(getSupportFragmentManager());
        vp.setAdapter(adapter);
        tl.setupWithViewPager(vp);

        imgback.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent back =new Intent(getApplicationContext(), Dashboard.class);
                startActivity(back);
                finish();
            }
        });

    }
}