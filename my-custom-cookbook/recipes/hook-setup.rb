instance = search("aws_opsworks_instance", "self:true").first
log "Host #{instance['hostname']} caught a SETUP event."

include_recipe 'opsworks-utils-cookbook::hook-setup'
