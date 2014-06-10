  
  # ------------------------------- INSTALLATION GENERATED ----------------------------------------------------
  map.clinic  '/clinic', :controller => 'dde', :action => 'index'
  map.process_result '/process_result', :controller => 'dde', :action => 'process_result'
  map.process_data '/process_data/:id', :controller => 'dde', :action => 'process_data'
  map.search '/search', :controller => 'dde', :action => 'search_name'
  map.new_patient '/new_patient', :controller => 'dde', :action => 'new_patient'
  map.ajax_process_data '/ajax_process_data', :controller => 'dde', :action => {'ajax_process_data' => [:post]}
  map.process_confirmation '/process_confirmation', :controller => 'dde', :action => {'process_confirmation' => [:post]}
  map.patient_not_found '/patient_not_found/:id', :controller => 'dde', :action => 'patient_not_found'
  map.ajax_search '/ajax_search', :controller => 'dde', :action => 'ajax_search'
  # ------------------------------- END OF INSTALLATION GENERATED ----------------------------------------------
  
