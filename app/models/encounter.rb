  def after_save
    self.add_location_obs
        
    settings = YAML.load_file("#{Rails.root}/config/dde_connection.yml")[Rails.env] rescue {}
        
    identifier = self.patient.patient_identifiers.find_by_identifier_type(PatientIdentifierType.find_by_name("National id").id).identifier rescue nil
        
    result = RestClient.post("http://#{settings["dde_username"]}:#{settings["dde_password"]}@#{settings["dde_server"]}/ajax_log", {"person"=>{"national_id"=>"#{identifier}","application"=>"#{settings["application_name"]}","site_code"=>"#{settings["site_code"]}"}}, {:accept => :json}) if !identifier.blank?
  end
