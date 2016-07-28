# sets up a jmxtrans::metrics resource with objects specifically for Codahale Metrics library.
define jmxtrans_config::metrics (
  $jmx,
  $graphite,
  $graphite_root_prefix = 'servers',
  $jmx_alias       = undef,
  $json_dir        = '/var/lib/jmxtrans',
  $export_resource = false,) {
  $objects = [{
      'name'              => 'metrics:*',
      'resultAlias'       => 'Metrics',
      'typeNames'         => ['name'],
      'attrs'             => {
        'Value'             => {},
        '50thPercentile'    => {},
        '75thPercentile'    => {},
        '95thPercentile'    => {},
        '98thPercentile'    => {},
        '99thPercentile'    => {},
        '999thPercentile'   => {},
        'Count'             => {},
        'Max'               => {},
        'Mean'              => {},
        'Min'               => {},
        'StdDev'            => {},
        'FifteenMinuteRate' => {},
        'FiveMinuteRate'    => {},
        'MeanRate'          => {},
        'OneMinuteRate'     => {},
      }
    }
  ]

  if $export_resource {
    @@jmxtrans::metrics { "${title}-metrics-${jmx}":
      jmx                  => $jmx,
      jmx_alias            => $jmx_alias,
      graphite             => $graphite,
      graphite_root_prefix => $graphite_root_prefix,
      json_dir             => $json_dir,
      objects              => $objects,
    }
  } else {
    jmxtrans::metrics { "${title}-metrics-${jmx}":
      jmx                  => $jmx,
      jmx_alias            => $jmx_alias,
      graphite             => $graphite,
      graphite_root_prefix => $graphite_root_prefix,
      json_dir             => $json_dir,
      objects              => $objects,
    }
  }
}