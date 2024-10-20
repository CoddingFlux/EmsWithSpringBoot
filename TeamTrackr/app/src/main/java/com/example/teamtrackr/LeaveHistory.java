package com.example.teamtrackr;

import static com.airbnb.lottie.L.TAG;

import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.constraintlayout.widget.ConstraintSet;
import androidx.fragment.app.Fragment;

import android.text.Layout;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.firestore.FirebaseFirestore;
import com.google.firebase.firestore.QueryDocumentSnapshot;
import com.google.firebase.firestore.QuerySnapshot;

import java.util.ArrayList;


public class LeaveHistory extends Fragment {

    ListView lv;
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_leave_history, container, false);

        FirebaseFirestore db=FirebaseFirestore.getInstance();

        FirebaseUser currentUser = FirebaseAuth.getInstance().getCurrentUser();

        String Uid=currentUser.getUid().toString();
        ArrayList<String> list = new ArrayList<String>();

        db.collection("EmployeeLeaves").whereEqualTo("UserId",Uid).get().addOnCompleteListener(new OnCompleteListener<QuerySnapshot>() {
            @Override
            public void onComplete(@NonNull Task<QuerySnapshot> task) {
               if(task.isSuccessful())
               {
                   for(QueryDocumentSnapshot document : task.getResult()) {
                       list.add(document.getString("LeaveType").toString()+" "+document.getString("FromDate").toString()+" To "+document.getString("ToDate").toString()+"("+document.getString("LeaveStatus").toString()+")");
                       Log.d(TAG,list.toString());
                   }
                   lv = view.findViewById(R.id.holydaylist);

                   ArrayAdapter<String> adapter=new ArrayAdapter<String>(getActivity().getApplicationContext(),
                       android.R.layout.simple_list_item_1 ,list);
                   lv.setAdapter(adapter);

               }
               else{
                   Log.d(TAG,"Error is :",task.getException());
               }

            }

        });


        return view;
    }
}