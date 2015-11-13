class { 'r10k':
  version           => '1.1.3',
  sources           => {
    'puppet' => {
      'remote'  => 'https://github.com/MansM/vagrant-skeleton-r10k.git',
      'basedir' => "${::settings::confdir}/environments",
      'prefix'  => false,
    }
  },
  #purgedirs         => ["${::settings::confdir}/environments"],
  manage_modulepath => true,
  modulepath        => "${::settings::confdir}/environments/\$environment/modules:/opt/puppet/share/puppet/modules",
}