  def after_save
    self.add_location_obs
        
    settings = YAML.load_file("#{Rails.root}/config/dde_connection.yml")[Rails.env] rescue {}
        
    identifier = self.patient.patient_identifiers.find_by_identifier_type(PatientIdentifierType.find_by_name("National id").id).identifier rescue nil
    
    if secure?
       url = "https://#{settings["dde_username"]}:#{settings["dde_password"]}@#{settings["dde_server"]}/ajax_log"
    else
       url = "http://#{settings["dde_username"]}:#{settings["dde_password"]}@#{settings["dde_server"]}/ajax_log"
    end
    
    result = RestClient.post(url, {"person"=>{"national_id"=>"#{identifier}","application"=>"#{settings["application_name"]}","site_code"=>"#{settings["site_code"]}"}}, {:accept => :json}) if !identifier.blank?
    
  end
  
  def secure?
    @settings = YAML.load_file("#{Rails.root}/config/dde_connection.yml")[Rails.env]
    secure = @settings["secure_connection"] rescue false
  end
