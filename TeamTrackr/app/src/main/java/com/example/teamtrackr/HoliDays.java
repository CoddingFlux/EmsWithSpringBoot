package com.example.teamtrackr;

import static com.airbnb.lottie.L.TAG;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.ListView;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.firestore.FirebaseFirestore;
import com.google.firebase.firestore.QueryDocumentSnapshot;
import com.google.firebase.firestore.QuerySnapshot;

import java.util.ArrayList;

public class HoliDays extends AppCompatActivity {

    ListView holidays;
    ImageView imgback;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_holi_days);

        FirebaseFirestore db=FirebaseFirestore.getInstance();
        ArrayList<String> list = new ArrayList<String>();

        db.collection("HoliDays").orderBy("HolidayId").get().addOnCompleteListener(new OnCompleteListener<QuerySnapshot>() {
            @Override
            public void onComplete(@NonNull Task<QuerySnapshot> task) {
                holidays=findViewById(R.id.listholidays);
                if(task.isSuccessful())
                {
                    for(QueryDocumentSnapshot document : task.getResult()) {
                        list.add(document.get("HolidayId").toString()+"  "+document.getString("HolidayName").toString()+"  "+document.getString("HolidayDate").toString());
                        Log.d(TAG,list.toString());
                    }

                    ArrayAdapter<String> adapter=new ArrayAdapter<String>(getApplicationContext(),
                            android.R.layout.simple_list_item_1 ,list);
                    holidays.setAdapter(adapter);

                }
                else{
                    Log.d(TAG,"Error is :",task.getException());
                }

            }

        });
        imgback=findViewById(R.id.back);
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