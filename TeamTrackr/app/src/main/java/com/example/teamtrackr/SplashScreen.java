package com.example.teamtrackr;

import androidx.appcompat.app.AppCompatActivity;
import androidx.cardview.widget.CardView;

import android.animation.ObjectAnimator;
import android.content.Context;
import android.content.Intent;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.os.Handler;
import android.view.View;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.widget.Toast;

import com.airbnb.lottie.LottieAnimationView;

public class SplashScreen extends AppCompatActivity {

    CardView myCardView;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash_screen);
        //cardanim
        myCardView = findViewById(R.id.card);
        animateCardView();

        //lottieanim
        LottieAnimationView anim=findViewById(R.id.loading);
        Handler hand=new Handler();
        hand.postDelayed(new Runnable() {
            @Override
            public void run() {
                anim.playAnimation();
            }
        },4000);

        //gotologinactivity
        Handler hand1=new Handler();
        hand1.postDelayed(new Runnable() {
            @Override
            public void run() {
                if(isConnectedToInternet()) {
                    Intent next = new Intent(SplashScreen.this, LoginWithUser.class);
                    startActivity(next);
                    finish();
                }
                else {
                    Toast.makeText(SplashScreen.this,"No Internet Connection..",Toast.LENGTH_SHORT).show();
                    finish();
                }
            }
        },5000);

    }

    private boolean isConnectedToInternet()
    {
        ConnectivityManager connectivityManager = (ConnectivityManager) getSystemService(Context.CONNECTIVITY_SERVICE);
        if(connectivityManager != null)
        {
            NetworkInfo activeNetworkInfo=connectivityManager.getActiveNetworkInfo();
            return activeNetworkInfo != null && activeNetworkInfo.isConnectedOrConnecting();
        }
        return false;
    }

    private void animateCardView() {
        // Create an ObjectAnimator for translationX property
        ObjectAnimator animator = ObjectAnimator.ofFloat(myCardView, "translationX", 0f);

        // Set the duration and interpolator for the animation
        animator.setDuration(1000); // 1 second
        animator.setInterpolator(new AccelerateDecelerateInterpolator());

        // Start the animation
        animator.start();
    }
}