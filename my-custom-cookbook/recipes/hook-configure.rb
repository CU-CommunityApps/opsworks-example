instance = search('aws_opsworks_instance', 'self:true').first
log "Host #{instance['hostname']} caught a CONFIGURE event."

# There is no configure hook recipe at this time in the opsworks-utils-cookbook.
# include_recipe 'opsworks-utils-cookbook::hook-configure'
