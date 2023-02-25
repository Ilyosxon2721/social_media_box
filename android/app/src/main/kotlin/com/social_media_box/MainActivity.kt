package com.social_media_box

import io.flutter.embedding.android.FlutterFragmentActivity;

class MainActivity() : FlutterFragmentActivity(), android.os.Parcelable {
    constructor(parcel: android.os.Parcel) : this() {
    }

    override fun writeToParcel(parcel: android.os.Parcel, flags: Int) {

    }

    override fun describeContents(): Int {
        return 0
    }

    companion object CREATOR : android.os.Parcelable.Creator<MainActivity> {
        override fun createFromParcel(parcel: android.os.Parcel): MainActivity {
            return MainActivity(parcel)
        }

        override fun newArray(size: Int): Array<MainActivity?> {
            return arrayOfNulls(size)
        }
    }
}
