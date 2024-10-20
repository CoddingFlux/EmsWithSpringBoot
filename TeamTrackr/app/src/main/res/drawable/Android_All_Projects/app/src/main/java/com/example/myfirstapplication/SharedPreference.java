package com.example.myfirstapplication;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Handler;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class SharedPreference extends AppCompatActivity {

    EditText u1,p1;
    Button add;

    SharedPreferences sp;
    SharedPreferences.Editor editor;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_shared_preference);

        u1=findViewById(R.id.username);
        p1=findViewById(R.id.password);
        add=findViewById(R.id.add);

        sp=getSharedPreferences("FirstDb",MODE_PRIVATE);

        add.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View view) {
                String name=u1.getText().toString();
                String pass=p1.getText().toString();
                editor = sp.edit();
                editor.putString("name",name);
                editor.putString("password",pass);
                editor.apply();
               Toast.makeText(SharedPreference.this,"Data Added",Toast.LENGTH_SHORT).show();
                Handler hand=new Handler();
                hand.postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        Intent next = new Intent(getApplicationContext(), LoginWithSharedPref.class);
                        startActivity(next);
                        finish();
                    }
                },3000);

            }
        });

    }
}