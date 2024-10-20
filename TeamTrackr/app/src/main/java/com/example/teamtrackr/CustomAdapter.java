package com.example.teamtrackr;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.BaseAdapter;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

public class CustomAdapter extends ArrayAdapter<String> {
    private final Context context;
    private final ArrayList<String> mainItems;
    private final String[] subItems;

    public CustomAdapter(Context context, ArrayList<String> mainItems, String[] subItems) {
        super(context, R.layout.list_item_layout, mainItems);
        this.context = context;
        this.mainItems = mainItems;
        this.subItems = subItems;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        View rowView = inflater.inflate(R.layout.list_item_layout, parent, false);

        TextView mainTextView = rowView.findViewById(R.id.mainText);
        TextView subTextView = rowView.findViewById(R.id.subText);

        mainTextView.setText(mainItems.get(position));
        subTextView.setText(subItems[position]);

        return rowView;
    }
}
