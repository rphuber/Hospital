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

end
