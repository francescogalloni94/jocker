type InspectRequest: void {
  	.size?: bool        //< Return container size information.
  	.id: string  		//< ID or name of the container
}
type ContainersRequest: void {
  	.all?: bool          //< Show all containers. Only running containers are shown by default
	.limit?: int        //< Show limit last created containers, include non-running ones.
  	.size?: bool        //< Show the containers sizes
  	.filters?: string {
  		.exited?: int
  		.status?: string
  		.label?: undefined
  		.isolation?: string
  		.id?: string
  		.name?: string
  		.is_task?: bool
  		.ancestor?: string
  		.before?: string
  		.since?: string
  		.volume?: string
  		.network?: string
  		.health?: string
  	}
}
type ListRunProcessesRequest: void {
	.id: string			//< ID or name of the container
	.ps_args?: string	// The arguments to pass to ps
}
type LogsRequest: void {
  	.id: string			//< ID or name of the container
  	.follow?: bool  	// return stream
  	.stdout?: bool		// show stdout log
  	.stderr?: bool		// show stderr log
  	.since?:	int		// Specifying a timestamp will only output log-entries since that timestamp
  	.timestamps?: bool	// print timestamps for every log line
  	.tail?: string		// Only return this number of log lines from the end of the logs. Specify as an integer or all to output all log lines
}
type ImagesRequest: void {
	.all?: bool			// Show all images. Only images from a final layer (no children) are shown by default.
	.filters?: string {
		.dangling?: bool
		.label?: undefined
		.before?: string
		.since?: string
		.reference?: string
	}
	.digest?: bool		// Show digest information as a RepoDigests field on each image
}
type InspectImageRequest: void {
	.name: string		// Image name or id
}
type ImageHistoryRequest: void {
	.name: string		// Image name or id
}
type ImageSearchRequest: void {
	.term: string		// Term to search
	.limit?: int 		// Maximum number of results to return
	.filters?: string {
		.stars?: int
		.is_official: bool
		.is_automated: bool
	}
}
type RemoveImageRequest: void {
	.name: string		// Image name or id
	.force?: bool		// Remove the image even if it is being used by stopped containers or has other tags
	.noprune?: bool		// Do not delete untagged parent images
}
type ExportImageRequest: void {
	.name: string 		// Image name or id
}
type ChangesRequest: void {
	.id: string 		// ID or name of the container
}
type ExportContainerRequest: void {
	.id: string			// ID or name of the container
}
type StatsContainerRequest: void {
	.id: string
	.stream?: bool
}
type Bridge: void {
	.bridge: void {
		.Aliases?: undefined
		.Links?: undefined
		.EndpointID?: string
		.Gateway?: string
		.GlobalIPv6Address?: string
		.GlobalIPv6PrefixLen?: int
		.IPAddress?: string
		.IPPrefixLen?: int
		.IPv6Gateway?: string
		.MacAddress?: string
		.IPAMConfig?: undefined
		.NetworkID?: string
	}
}
type Networks: void {
	.Networks?: Bridge
}
type Port: void {
	.PrivatePort?: int
	.PublicPort?: int
	.Type?: string
}
type Mount: void {
	.Name?: string
	.Source?: string
	.Destination?: string
	.Driver?: string
	.Mode?: string
	.Rw?: bool
	.Propagation?: string
}
type ContainerType: void {
	
}
// data-type of an ContainersResponse
type ContainersResponse: void{
	.container[0, *]: void {
		.Status?: string
		.Mounts[0, *]: Mount
		.Image?: string
		.SizeRw?: int
		.Ports[0, *]: Port
		.Labels?: undefined
		.Created?: int
		.Names[0, *]: string
		.NetworkSettings?: Networks
		.Command?: string
		.State?: string
		.ImageID?: string
		.HostConfig?: undefined
		.Id?: string
	} 
}
type Config: void {
	.Entrypoint?: undefined
	.AttachStderr?: bool
	.AttachStdin?: bool
	.AttachStdout?: bool
	.ArgsEscaped?: bool
	.Cmd[0, *]: string
	.Domainname?: string
	.Env[0, *]: string
	.Hostname?: string
	.Image?: string
	.Labels?: undefined
	.MacAddress?: string
	.NetworkDisabled?: bool
	.OpenStdin?: bool
	.StdinOnce?: bool
	.Tty?: bool
	.User?: string
	.Volumes?: undefined
	.OnBuild[0, *]: undefined
	.WorkingDir: string
	.StopSignal?: string
	.StopTimeout?: int
	.ExposedPorts?: undefined
	.PublishService?: string
}
type HostConfig: void {
	.MaximumIOps?: int
	.MaximumIOBps?: int
	.BlkioWeight?: int
	.BlkioWeightDevice[0, *]: undefined
	.BlkioDeviceReadBps[0, *]: undefined
	.BlkioDeviceWriteBps[0, *]: undefined
	.BlkioDeviceReadIOps[0, *]: undefined
	.BlkioDeviceWriteIOps[0, *]: undefined
	.Binds?: undefined
	.ContainerIDFile?: string
	.CpusetCpus?: string
	.CpusetMems?: string
	.CpuPercent?: int
	.CpuShares?: int
	.CpuPeriod?: int
	.CpuQuota?: int
	.CpuCount?: int
	.CpuRealtimePeriod?: int
	.CpuRealtimeRuntime?: int
	.CapAdd?: undefined
	.CapDrop?: undefined
	.CgroupParent?: string
	.GroupAdd?: undefined
	.Devices[0, *]: undefined
	.DiskQuota?: int
	.DnsOptions[0, *]: undefined
	.Dns[0, *]: undefined
	.DnsSearch?: undefined
	.VolumesFrom?: undefined
	.IpcMode?: string
	.Isolation?: string
	.LxcConf[0, *]: undefined
	.Memory?: int
	.MemorySwappiness?: int
	.MemorySwap?: int
	.MemoryReservation?: int
	.KernelMemory?: int
	.OomKillDisable?: bool
	.OomScoreAdj?: int
	.NetworkMode?: string
	.NanoCpus?: int
	.PidMode?: string
	.PortBindings?: undefined
	.Privileged?: bool
	.PidsLimit?: int
	.ReadonlyRootfs?: bool
	.Runtime?: string
	.PublishAllPorts?: bool
	.RestartPolicy?: undefined
	.LogConfig[0, *]: undefined
	.Sysctls?: undefined
	.Ulimits[0, *]: undefined
	.VolumeDriver?: string
	.ShmSize?: int
	.UsernsMode?: string
	.ExtraHosts?: undefined
	.UTSMode?: string
	.Cgroup?: string
	.IOMaximumIOps?: int
	.IOMaximumBandwidth?: int
	.AutoRemove?: bool
	.ConsoleSize[0, *]: int
	.Links?: undefined
	.SecurityOpt?: undefined
}
type State: void {
	.Error?: string
	.ExitCode?: int
	.FinishedAt?: string
	.OOMKilled?: bool
	.Dead?: bool
	.Paused?: bool
	.Pid?: int
	.Restarting?: bool
	.Running?: bool
	.StartedAt?: string
	.Status?: string
}
type NetworkSettings: void {
	.Bridge?: string
	.SandboxID?: string
	.HairpinMode?: bool
	.LinkLocalIPv6Address?: string
	.LinkLocalIPv6PrefixLen?: int
	.SandboxKey?: string
	.SecondaryIPAddresses?: undefined
	.SecondaryIPv6Addresses?: undefined
	.EndpointID?: string
	.Gateway?: string
	.GlobalIPv6Address?: string
	.GlobalIPv6PrefixLen?: int
	.IPAddress?: string
	.IPPrefixLen?: int
	.IPv6Gateway?: string
	.MacAddress?: string
	.Networks?: Bridge
	.Ports?: undefined
}
// data-type of an InspectResponse
type InspectResponse: void {
	.AppArmorProfile?: string
	.Args[0, *]: string
	.Config?: Config
	.Created?: string
	.Driver?: string
	.HostConfig?: HostConfig
	.HostnamePath?: string
	.HostsPath?: string
	.LogPath?: string
	.Id?: string
	.Image?: string
	.GraphDriver?: undefined
	.MountLabel?: string
	.Name?: string
	.NetworkSettings?: NetworkSettings
	.Path?: string
	.ProcessLabel?: string
	.ResolvConfPath?: string
	.RestartCount?: int
	.State?: State
	.Mounts[0, *]: Mount
	.ExecIDs?: undefined
}
// data-type of an ListRunProcessesResponse
type ListRunProcessesResponse: void {
	.Titles[0, *]: string
	.Processes[0, *]: void {
		.row[0, *]: string
	}
}
// data-type of an LogsResponse
type LogsResponse: void {
	.log: undefined
}
// data-type of an ImagesResponse
type ImagesResponse: void {
	.images[0, *]: void {
		.Id?: string
		.ParentId?: string
		.RepoTags[0, *]: string
		.RepoDigests?: undefined
		.Created?: int
		.Size?: int
		.VirtualSize?: int
		.SharedSize?: int
		.Labels?: undefined
		.Containers?: int
	}
}
// data-type of an InspectImageResponse
type InspectImageResponse: void {
	.Id?: string
	.Container?: string
	.Comment?: string
	.Os?: string
	.Architecture?: string
	.Parent?: string
	.ContainerConfig?: Config
	.DockerVersion?: string
	.VirtualSize?: int
	.Size?: int
	.Author?: string
	.Created?: string
	.GraphDriver?: undefined
	.RepoDigests[0, *]: undefined
	.RepoTags[0, *]: string
	.Config?: Config
	.RootFS?: void {
		.Type?: string
		.Layers[0, *]: string
	}
}
// data-type of an ImageHistoryResponse
type ImageHistoryResponse: void {
	.histories[0, *]: void {
		.Id: string
		.Created: int
		.CreatedBy: string
		.Tags[0, *]: string
		.Size: int
		.Comment: string 
	}
}
// data-type of an ImageSearchResponse
type ImageSearchResponse: void {
	.results[0, *]: void {
		.description?: string
		.is_official?: bool
		.is_automated?: bool
		.name?: string
		.star_count?: int
	}
	
}
// data-type of an RemoveImageResponse
type RemoveImageResponse: void {
	.Untagged?: string
	.Deleted?: string
}
// data-type of an ExportImageResponse
type ExportImageResponse: void {
	.exporting: undefined
}
// data-type of an ChangesResponse
type ChangesResponse: void {
	.changes[0, *]: void {
		.Path?: string
		.Kind?: int
	}
}
// data-type of an StatsContainerResponse
type StatsContainerResponse: void {
	.read?: string
	.pids_stats?: void {
		.current?: int
	}
	.networks?: void {
		.eth0?: void {
			.rx_bytes?: int
			.rx_dropped?: int
			.rx_errors?: int
			.rx_packets?: int
			.tx_bytes?: int
			.tx_dropped?: int
			.tx_errors?: int
			.tx_packets?: int
		}
		.eth5?: void {
			.rx_bytes?: int
			.rx_dropped?: int
			.rx_errors?: int
			.rx_packets?: int
			.tx_bytes?: int
			.tx_dropped?: int
			.tx_errors?: int
			.tx_packets?: int
		}
	}
	.memory_stats?: void {
		.stats?: void {
			.total_pgmajfault?: int
			.cache?: int
			.mapped_file?: int
			.total_inactive_file?: int
			.pgpgout?: int
			.rss?: int
			.total_mapped_file?:int
			.writeback?: int 
			.unevictable?: int
			.pgpgin?: int
			.total_unevictable?: int
			.pgmajfault?: int
			.total_rss?: int
			.total_rss_huge?: int
			.total_writeback?: int
			.total_inactive_anon?: int
			.rss_huge?: int
			.hierarchial_memory_limit?: int
			.total_pgfault?: int
			.total_active_file?: int
			.active_anon?: int
			.total_active_anon?: int
			.total_pgpgout?: int
			.total_cache?: int
			.inactive_anon?: int
			.active_file?: int
			.pgfault?: int
			.inactive_file?: int
			.total_pgpgin?: int

		}
		.max_usage?: int
		.usage?: int
		.failcnt?: int
		.limit?: int
	}
	.blkio_stats?: undefined
	.cpu_stats?: void {
		.cpu_usage: void {
			.percpu_usage[0, *]: string
			.usage_in_usermode?: int
			.total_usage?: int
			.usage_in_kernelmode?: int
		}
		.system_cpu_usage?: int
		.throttling_data?: void {
			.periods?: int
			.throttled_periods?: int
			.throttled_time?: int
		}
	}
	.precpu_stats?: void {
		.cpu_usage: void {
			.percpu_usage[0, *]: string
			.usage_in_usermode?: int
			.total_usage?: int
			.usage_in_kernelmode?: int
		}
		.system_cpu_usage?: int
		.throttling_data?: void {
			.periods?: int
			.throttled_periods?: int
			.throttled_time?: int
		}
	}

}


interface InterfaceAPI {
  RequestResponse:
  	containers( ContainersRequest )( ContainersResponse ),
    inspect( InspectRequest )( InspectResponse ),
    listRunProcesses( ListRunProcessesRequest )( ListRunProcessesResponse ),
    logs( LogsRequest )( LogsResponse ),
    images( ImagesRequest )( ImagesResponse ),
    inspectImage( InspectImageRequest )( InspectImageResponse ),
    imageHistory( ImageHistoryRequest )( ImageHistoryResponse ),
    imageSearch( ImageSearchRequest )( ImageSearchResponse ),
    removeImage( RemoveImageRequest )( RemoveImageResponse ),
    exportImage( ExportImageRequest )( ExportImageResponse ),
    changesOnCtn( ChangesRequest )( ChangesResponse ),
    exportContainer( ExportContainerRequest )( undefined ),
    statsContainer( StatsContainerRequest )( StatsContainerResponse )
}