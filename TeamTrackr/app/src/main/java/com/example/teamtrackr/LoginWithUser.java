package com.example.teamtrackr;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.os.Handler;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;

public class LoginWithUser extends AppCompatActivity {

    EditText email,password;
    Button login;
    FirebaseAuth firebaseAuth;
    @Override
    public void onStart() {
        super.onStart();
        // Check if user is signed in (non-null) and update UI accordingly.
        FirebaseUser currentUser = firebaseAuth.getCurrentUser();
        if(currentUser != null){
            Intent start=new Intent(LoginWithUser.this, Dashboard.class);
            startActivity(start);
            finish();

        }
    }
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login_with_user);

        email=findViewById(R.id.emailid);
        password=findViewById(R.id.password);
        login=findViewById(R.id.login);
        firebaseAuth = FirebaseAuth.getInstance();

        login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String username=email.getText().toString();
                String pass=password.getText().toString();
                if(username.equals(""))
                {
                    Toast.makeText(LoginWithUser.this, "Enter emailId...",
                            Toast.LENGTH_SHORT).show();
                }
                else if(pass.equals(""))
                {
                    Toast.makeText(LoginWithUser.this, "Enter Password...",
                            Toast.LENGTH_SHORT).show();
                }
                else {
                    loginUser(username, pass);
                }
                }
        });
    }
    private void loginUser(String username,String pass)
    {
        firebaseAuth.signInWithEmailAndPassword(username,pass)
                .addOnCompleteListener(new OnCompleteListener<AuthResult>() {
                    @Override
                    public void onComplete(@NonNull Task<AuthResult> task) {
                        if (task.isSuccessful()) {
                            // Sign in success, update UI with the signed-in user's information
                            Toast.makeText(LoginWithUser.this, "Login Success",
                                    Toast.LENGTH_SHORT).show();
                            Intent start=new Intent(LoginWithUser.this, Dashboard.class);
                            startActivity(start);
                            finish();
                        } else {
                            // If sign in fails, display a message to the user.
                            Toast.makeText(LoginWithUser.this, "Login failed.",
                                    Toast.LENGTH_SHORT).show();
                        }
                    }
                });
    }
}