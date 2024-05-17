package com.example.sherif_nxt_assessment

import android.annotation.SuppressLint
import android.app.Dialog
import android.os.Bundle
import android.view.View
import android.widget.ImageView
import android.widget.TextView
import com.bumptech.glide.Glide
import com.google.android.material.bottomsheet.BottomSheetDialog
import com.google.android.material.bottomsheet.BottomSheetDialogFragment
import org.jetbrains.annotations.Nullable

class BottomSheetFragment(
    private val name: String?,
    private val image: String?,
    private val id: String?,
    private val type: String?,
    private val seat: String?,
    private val isDark: Boolean?
) :
    BottomSheetDialogFragment() {
    override fun onCreate(@Nullable savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

    @SuppressLint("RestrictedApi")
    override fun onCreateDialog(savedInstanceState: Bundle?): Dialog {
        return BottomSheetDialog(requireContext(), R.style.AppBottomSheetDialogTheme)
    }

    @SuppressLint("RestrictedApi")
    override fun setupDialog(dialog: Dialog, style: Int) {
        // to change the theme of the view and chosse the right layout
        val contentView: View = if (isDark!!) {
            View.inflate(context, R.layout.bottom_sheet_layout_dark, null) // Assuming you have a separate layout for dark mode
        } else {
            View.inflate(context, R.layout.bottom_sheet_layout, null)
        }

        // to link the text with the text view in the xml
        val textViewName = contentView.findViewById<TextView>(R.id.tv_name)
        textViewName.text = name
        // to link the text with the text view in the xml
        val textViewId = contentView.findViewById<TextView>(R.id.tv_id)
        textViewId.text = id
        // to link the text with the text view in the xml
        val textViewType = contentView.findViewById<TextView>(R.id.tv_type)
        textViewType.text = type
        // to link the text with the text view in the xml
        val textViewSeat = contentView.findViewById<TextView>(R.id.tv_seat)
        textViewSeat.text = seat
        // to link the image with the image view in the xml
        val imageView = contentView.findViewById<ImageView>(R.id.iv_transaction_status)
        Glide.with(this).load(image).into(imageView);
        dialog.setContentView(contentView)

    }
// to create new  Instance
    companion object {
        fun newInstance(
            name: String?,
            image: String?,
            id: String?,
            type: String?,
            seat: String?,
            isDark: Boolean?
        ): BottomSheetFragment {
            return BottomSheetFragment(name,image,id,type,seat,isDark)
        }
    }
}