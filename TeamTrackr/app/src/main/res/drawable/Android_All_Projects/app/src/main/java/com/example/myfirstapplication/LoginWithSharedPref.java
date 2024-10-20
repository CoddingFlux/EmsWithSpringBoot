package com.example.myfirstapplication;

import androidx.appcompat.app.AppCompatActivity;

import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class LoginWithSharedPref extends AppCompatActivity {

    EditText p1,u1;
    Button login;

    SharedPreferences sp;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login_with_shared_pref);

        p1=findViewById(R.id.password);
        u1=findViewById(R.id.username);
        login=findViewById(R.id.login);

        sp=getSharedPreferences("FirstDb",MODE_PRIVATE);
        login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if(sp.getString("name","").equals(u1.getText().toString()) && sp.getString("password","").equals(p1.getText().toString()))
                {
                    Toast.makeText(LoginWithSharedPref.this,"Login Success",Toast.LENGTH_SHORT).show();
                }
                else {
                    Toast.makeText(LoginWithSharedPref.this,"Login Failed",Toast.LENGTH_SHORT).show();
                }
            }
        });
    }
}