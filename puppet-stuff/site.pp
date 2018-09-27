if $::kernel == 'Windows' {
  Package { provider => 'chocolatey' }
}
if $::kernel == 'Linux' {
  class { '::rbaselines::linux::puppet_agent':
    puppet_runinterval => 120,
  }
}



