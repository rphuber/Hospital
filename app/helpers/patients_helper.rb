module PatientsHelper

  def display_patient_icon(patient)
    case patient.workflow_state
      when 'waiting_room'
        image_tag 'icons/check-in.png'
      when 'checked_in'
        image_tag 'icons/check-in.png'
      when 'with_doctor' 
        image_tag 'icons/doctor.png'
      when 'in_xray'
        image_tag 'icons/xray.png'
      when 'in_surgery' 
        image_tag 'icons/surgery.png'
      when 'checked_out' 
        image_tag 'icons/check-out.png'
      else
        image_tag 'icons/bill-pay.png'
    end
  end

  def display_workflow_links(patient)
    case patient.workflow_state
      when 'waiting_room'
        link_to image_tag('icons/check-in.png'), check_in_patient_path(patient), method: :patch
      when 'checked_in'
        link_to image_tag('icons/doctor.png'), see_doctor_patient_path(patient), method: :patch
        link_to image_tag('icons/xray.png'), get_xray_patient_path(patient), method: :patch
        link_to image_tag('icons/surgery.png'), enter_surgery_patient_path(patient), method: :patch
      when 'with_doctor'
        link_to image_tag('icons/xray.png'), get_xray_patient_path(patient), method: :patch
        link_to image_tag('icons/surgery.png'), enter_surgery_patient_path(patient), method: :patch
        link_to image_tag('icons/check-out.png'), check_out_patient_path(patient), method: :patch
      when 'in_xray'
        link_to image_tag('icons/doctor.png'), see_doctor_patient_path(patient), method: :patch
        link_to image_tag('icons/surgery.png'), enter_surgery_patient_path(patient), method: :patch
        link_to image_tag('icons/check-out.png'), check_out_patient_path(patient), method: :patch
      when 'in_surgery'
        link_to image_tag('icons/xray.png'), get_xray_patient_path(patient), method: :patch
        link_to image_tag('icons/doctor.png'), see_doctor_patient_path(patient), method: :patch
        link_to image_tag('icons/check-out.png'), check_out_patient_path(patient), method: :patch
      else
        link_to image_tag('icons/bill-pay.png'), pay_bill_patient_path(patient), method: :patch
      end
  end   
      

end
