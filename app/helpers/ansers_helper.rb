module AnsersHelper
  def anser_choose_new_or_edit
    if action_name == 'new'
      recruitment_ansers_path
    elsif action_name == 'edit'
      recruitment_anser_path
    end
  end
end
