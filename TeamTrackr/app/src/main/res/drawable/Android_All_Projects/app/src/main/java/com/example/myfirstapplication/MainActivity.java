package com.example.myfirstapplication;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        EditText e1;
        Button b1;
        TextView t1;

        e1=findViewById(R.id.string);
        b1=findViewById(R.id.show);
        t1=findViewById(R.id.textview);


        b1.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View view) {
                String strings = e1.getText().toString();
                if(!strings.equals("")) {
                    Toast.makeText(MainActivity.this,strings, Toast.LENGTH_SHORT).show();
                }
                else{
                    Toast.makeText(MainActivity.this,"Enter Text !", Toast.LENGTH_SHORT).show();
                }
            }
        });

        t1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                    Toast.makeText(MainActivity.this,"Enter Text",Toast.LENGTH_SHORT).show();
            }
        });
    }
}