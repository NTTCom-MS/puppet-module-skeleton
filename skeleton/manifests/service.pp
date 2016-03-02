class <%= metadata.name %>::service (
                        $manage_service=true,
                        $manage_docker_service=false,
                        $ensure ='running',
                      ) inherits <%= metadata.name %>::params {

  #
  validate_bool($manage_docker_service)
  validate_bool($manage_service)

  validate_re($ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${ensure}")

  if($::eyp_docker_iscontainer==undef or
      $::eyp_docker_iscontainer =~ /false/ or
      $manage_docker_service)
  {
    if($manage_service)
    {
      #service or exec here
    }
  }
}
