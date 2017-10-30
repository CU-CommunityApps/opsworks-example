instance = search('aws_opsworks_instance', 'self:true').first
log "Host #{instance['hostname']} caught a SHUTDOWN event."

include_recipe 'opsworks-utils-cookbook::hook-shutdown'
