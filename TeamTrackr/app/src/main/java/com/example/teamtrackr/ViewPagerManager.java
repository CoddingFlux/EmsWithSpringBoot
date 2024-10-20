package com.example.teamtrackr;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentPagerAdapter;

public class ViewPagerManager extends FragmentPagerAdapter {

    public ViewPagerManager(@NonNull FragmentManager fm) {
        super(fm);
    }

    @NonNull
    @Override
    public Fragment getItem(int p) {
        if(p==0)
        {
            return new Leave();
        }
        else {
            return new LeaveHistory();
        }
    }

    @Override
    public int getCount() {
        return 2;
    }

    @Nullable
    @Override
    public CharSequence getPageTitle(int p) {
        if(p==0)
        {
            return "Leave";
        }
        else {
            return "LeaveHistory";
        }
    }
}
