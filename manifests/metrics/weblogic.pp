# Creates a jmxtrans::metrics resource specifically for WebLogic JMXBeans.
# Please note the "N" - capital N - for typeNames. This is crucial!
define jmxtrans_config::weblogic (
  $jmx,
  $graphite,
  $graphite_root_prefix = 'servers',
  $jmx_alias       = undef,
  $json_dir        = '/var/lib/jmxtrans',
  $export_resource = false,) {
  $objects = [
    {
      'name'                    => 'com.bea:Type=EJBPoolRuntime,*',
      'resultAlias'             => 'EJBPoolRuntime',
      'typeNames'               => ['Name'],
      'attrs'                   => {
        'AccessTotalCount'        => {},
        'BeansInUseCount'         => {},
        'BeansInUseCurrentCount'  => {},
        'DestroyedTotalCount'     => {},
        'IdleBeansCount'          => {},
        'MissTotalCount'          => {},
        'PooledBeansCurrentCount' => {},
        'TimeoutTotalCount'       => {},
        'WaiterCurrentCount'      => {},
        'WaiterTotalCount'        => {},

      }
    }
    ,
    {
      'name'                             => 'com.bea:Type=JDBCDataSourceRuntime,*',
      'resultAlias'                      => 'JDBCDataSourceRuntime',
      'typeNames'                        => ['Name'],
      'attrs'                            => {
        'ActiveConnectionsAverageCount'    => {},
        'ActiveConnectionsCurrentCount'    => {},
        'ActiveConnectionsHighCount'       => {},
        'ConnectionDelayTime'              => {},
        'ConnectionsTotalCount'            => {},
        'CurrCapacity'                     => {},
        'CurrCapacityHighCount'            => {},
        'FailedReserveRequestCount'        => {},
        'FailuresToReconnectCount'         => {},
        'HighestNumAvailable'              => {},
        'HighestNumUnavailable'            => {},
        'LeakedConnectionCount'            => {},
        'NumAvailable'                     => {},
        'NumUnavailable'                   => {},
        'ReserveRequestCount'              => {},
        'WaitingForConnectionCurrentCount' => {},
        'WaitingForConnectionFailureTotal' => {},
        'WaitingForConnectionHighCount'    => {},
        'WaitingForConnectionSuccessTotal' => {},
        'WaitingForConnectionTotal'        => {},
        'WaitSecondsHighCount'             => {},

      }
    }
    ,
    {
      'name'                             => 'com.bea:Type=JDBCConnectionPoolRuntime,*',
      'resultAlias'                      => 'JDBCConnectionPoolRuntime',
      'typeNames'                        => ['Name'],
      'attrs'                            => {
        'ActiveConnectionsAverageCount'    => {},
        'ActiveConnectionsCurrentCount'    => {},
        'ActiveConnectionsHighCount'       => {},
        'ConnectionDelayTime'              => {},
        'ConnectionLeakProfileCount'       => {},
        'ConnectionsTotalCount'            => {},
        'CurrCapacity'                     => {},
        'FailuresToReconnectCount'         => {},
        'HighestNumAvailable'              => {},
        'HighestNumUnavailable'            => {},
        'LeakedConnectionCount'            => {},
        'MaxCapacity'                      => {},
        'NumAvailable'                     => {},
        'NumUnavailable'                   => {},
        'StatementProfileCount'            => {},
        'WaitSecondsHighCount'             => {},
        'WaitingForConnectionCurrentCount' => {},
        'WaitingForConnectionHighCount'    => {},

      }
    }
    ,
    {
      'name'                    => 'com.bea:Type=ThreadPoolRuntime,*',
      'resultAlias'             => 'ThreadPoolRuntime',
      'typeNames'               => ['Name'],
      'attrs'                   => {
        'ExecuteThreadIdleCount'  => {},
        'ExecuteThreadTotalCount' => {},
        'QueueLength'             => {},
        'StandbyThreadCount'      => {},
        'Throughput'              => {},

      }
    }
    ,
    {
      'name'                        => 'com.bea:Type=JMSDestinationRuntime,*',
      'resultAlias'                 => 'JMSDestinationRuntime',
      'typeNames'                   => ['Name'],
      'attrs'                       => {
        'BytesCurrentCount'           => {},
        'BytesHighCount'              => {},
        'BytesPendingCount'           => {},
        'BytesReceivedCount'          => {},
        'BytesThresholdTime'          => {},
        'ConsumersCurrentCount'       => {},
        'ConsumersHighCount'          => {},
        'ConsumersTotalCount'         => {},
        'MessagesCurrentCount'        => {},
        'MessagesDeletedCurrentCount' => {},
        'MessagesHighCount'           => {},
        'MessagesMovedCurrentCount'   => {},
        'MessagesPendingCount'        => {},
        'MessagesReceivedCount'       => {},
        'MessagesThresholdTime'       => {},
      }
    }
    ]

  if $export_resource {
    @@jmxtrans::metrics { "${title}-weblogic--${jmx}":
      jmx                  => $jmx,
      jmx_alias            => $jmx_alias,
      graphite             => $graphite,
      graphite_root_prefix => $graphite_root_prefix,
      json_dir             => $json_dir,
      objects              => $objects,
    }
  } else {
    jmxtrans::metrics { "${title}-weblogic--${jmx}":
      jmx                  => $jmx,
      jmx_alias            => $jmx_alias,
      graphite             => $graphite,
      graphite_root_prefix => $graphite_root_prefix,
      json_dir             => $json_dir,
      objects              => $objects,
    }
  }
}