package com.mohaberabi.flutterchannels.flutter_channels

import android.content.Context
import android.content.SharedPreferences
import com.mohaberabi.flutterchannels.NamesStorage
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity(), NamesStorage {

    companion object {
        private const val NAMES_KEY = "names"
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        NamesStorage.setUp(flutterEngine.dartExecutor.binaryMessenger, this)
    }

    private fun getPrefs(): SharedPreferences {
        return applicationContext.getSharedPreferences("names", Context.MODE_PRIVATE)
    }

    override fun getNames(): List<String> {

        val names = getPrefs().getStringSet(NAMES_KEY, setOf()) ?: setOf()
        return names.toList()
    }

    override fun getName(id: String): String? {
        return getPrefs().getString("id", null)
    }

    override fun saveName(id: String, name: String) {
        getPrefs().edit().putString(id, id).apply()

    }

}
