package com.example.teamtrackr;

import static com.airbnb.lottie.L.TAG;

import android.app.DatePickerDialog;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;

import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.Firebase;
import com.google.firebase.FirebaseApp;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.firestore.DocumentReference;
import com.google.firebase.firestore.FirebaseFirestore;
import com.google.firebase.firestore.QueryDocumentSnapshot;
import com.google.firebase.firestore.QuerySnapshot;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;


public class Leave extends Fragment {

    Spinner leavetype;
    TextView edtfromdate,edttodate;
    Button apply;
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment



       View view= inflater.inflate(R.layout.fragment_leave, container, false);
        leavetype=(Spinner)view.findViewById(R.id.leavetype);
        String[] ltype = {"MedicalLeave", "CasualLeave","MarriageLeave","Other"};
        ArrayList<String> list = new ArrayList<String>();
        FirebaseFirestore db=FirebaseFirestore.getInstance();

        db.collection("LeaveType").get().addOnCompleteListener(new OnCompleteListener<QuerySnapshot>() {
            @Override
            public void onComplete(@NonNull Task<QuerySnapshot> task) {
           if(task.isSuccessful())
           {
               for(QueryDocumentSnapshot document:task.getResult())
               {
                   list.add(document.getString("LeaveTypeName").toString());
               }
               ArrayAdapter<String> adapter = new ArrayAdapter<>(requireContext(),android.R.layout.simple_spinner_dropdown_item, list);
               leavetype.setAdapter(adapter);
           }
            }
        });




        //From calendar
        edtfromdate=(TextView) view.findViewById(R.id.fromdatepopup);

        edtfromdate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                final Calendar cal=Calendar.getInstance();
                int year=cal.get(Calendar.YEAR);
                int month=cal.get(Calendar.MONTH);
                int day=cal.get(Calendar.DAY_OF_MONTH);

                DatePickerDialog dataPicker=new DatePickerDialog(getContext(), new DatePickerDialog.OnDateSetListener() {
                    @Override
                    public void onDateSet(DatePicker datePicker, int i, int i1, int i2) {
                    edtfromdate.setText(i2+"-"+(i1+1)+"-"+i);
                    }
                },year,month,day);
                dataPicker.show();
            }
        });


        //To calendar
        edttodate=(TextView) view.findViewById(R.id.todatepopup);

        edttodate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                final Calendar cal=Calendar.getInstance();
                int year=cal.get(Calendar.YEAR);
                int month=cal.get(Calendar.MONTH);
                int day=cal.get(Calendar.DAY_OF_MONTH);

                DatePickerDialog dataPicker=new DatePickerDialog(getContext(), new DatePickerDialog.OnDateSetListener() {
                    @Override
                    public void onDateSet(DatePicker datePicker, int i, int i1, int i2) {
                        edttodate.setText(i2+"-"+(i1+1)+"-"+i);
                    }
                },year,month,day);
                dataPicker.show();
            }
        });


        Spinner leaveType=view.findViewById(R.id.leavetype);
        TextView from=view.findViewById(R.id.fromdatepopup);
        TextView to=view.findViewById(R.id.todatepopup);
        TextView remainingleave=view.findViewById(R.id.txtremainingleave);
        EditText reason=view.findViewById(R.id.txtreason);
        FirebaseUser currentUser = FirebaseAuth.getInstance().getCurrentUser();
        apply=view.findViewById(R.id.apply);
        apply.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {


                FirebaseFirestore db=FirebaseFirestore.getInstance();
                String UId=currentUser.getUid().toString();
                String LeaveType=leaveType.getSelectedItem().toString();
                String FromDate=from.getText().toString();
                String ToDate=to.getText().toString();
                String RemainingLeaves=remainingleave.getText().toString();
                String LeaveReason=reason.getText().toString();


                if(UId!=null && LeaveType!=null && FromDate!=null && ToDate!=null && RemainingLeaves != null && LeaveReason!=null) {
                    // Create a new record in Firestore
                    Map<String, Object> leaveData = new HashMap<>();
                    leaveData.put("UserId", UId);
                    leaveData.put("LeaveType", LeaveType);
                    leaveData.put("FromDate", FromDate);
                    leaveData.put("ToDate", ToDate);
                    leaveData.put("RemainingLeaves", RemainingLeaves);
                    leaveData.put("LeaveReason", LeaveReason);
                    leaveData.put("LeaveStatus", "New");

// Add a new document with a generated ID to a "leaves" collection
                    db.collection("EmployeeLeaves")
                            .add(leaveData)
                            .addOnSuccessListener(new OnSuccessListener<DocumentReference>() {
                                @Override
                                public void onSuccess(DocumentReference documentReference) {
                                    Toast.makeText(getContext(), "Application Registered", Toast.LENGTH_SHORT).show();
                                    Log.d(TAG, "DocumentSnapshot added with ID: " + documentReference.getId());
                                    // Handle success, maybe show a Toast or navigate to another activity
                                }
                            })
                            .addOnFailureListener(new OnFailureListener() {
                                @Override
                                public void onFailure(@NonNull Exception e) {
                                    Log.w(TAG, "Error adding document", e);
                                    // Handle failure, show an error message or log the error
                                }
                            });
                }
            }
        });

        return view;
        }

}