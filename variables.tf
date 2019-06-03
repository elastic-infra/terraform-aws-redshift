variable "cluster_identifier" {
  description = "Custom name of the cluster"
  type        = "string"
}

variable "cluster_version" {
  description = "Version of Redshift engine cluster"
  default     = "1.0"
  type        = "string"

  # Constraints: Only version 1.0 is currently available.
  # http://docs.aws.amazon.com/cli/latest/reference/redshift/create-cluster.html
}

variable "cluster_node_type" {
  description = "Node Type of Redshift cluster"
  type        = "string"

  # Valid Values: dc1.large | dc1.8xlarge | dc2.large | dc2.8xlarge | ds2.xlarge | ds2.8xlarge.
  # http://docs.aws.amazon.com/cli/latest/reference/redshift/create-cluster.html
}

variable "cluster_number_of_nodes" {
  description = "Number of nodes in the cluster (values greater than 1 will trigger 'cluster_type' of 'multi-node')"
  default     = 3
  type        = "number"
}

variable "cluster_database_name" {
  description = "The name of the database to create"
  type        = "string"
}

# Self-explainatory variables
variable "cluster_master_username" {
  type = "string"
}

variable "cluster_master_password" {
  type = "string"
}

variable "cluster_port" {
  default = 5439
  type    = "number"
}

# This is for a custom parameter to be passed to the DB
# We're "cloning" default ones, but we need to specify which should be copied
variable "cluster_parameter_group" {
  description = "Parameter group, depends on DB engine used"
  default     = "redshift-1.0"
  type        = "string"
}

variable "cluster_iam_roles" {
  description = "A list of IAM Role ARNs to associate with the cluster. A Maximum of 10 can be associated to the cluster at any time."
  type        = "list(string)"
  default     = []
}

variable "publicly_accessible" {
  description = "Determines if Cluster can be publicly available (NOT recommended)"
  default     = false
  type        = "string"
}

variable "redshift_subnet_group_name" {
  description = "The name of a cluster subnet group to be associated with this cluster. If not specified, new subnet will be created."
  default     = ""
  type        = "string"
}

variable "parameter_group_name" {
  description = "The name of the parameter group to be associated with this cluster. If not specified new parameter group will be created."
  default     = ""
  type        = "string"
}

variable "subnets" {
  description = "List of subnets DB should be available at. It might be one subnet."
  default     = []
  type        = "list(string)"
}

variable "vpc_security_group_ids" {
  description = "A list of Virtual Private Cloud (VPC) security groups to be associated with the cluster."
  type        = "list(string)"
}

variable "final_snapshot_identifier" {
  description = "(Optional) The identifier of the final snapshot that is to be created immediately before deleting the cluster. If this parameter is provided, 'skip_final_snapshot' must be false."
  default     = false
  type        = "bool"
}

variable "skip_final_snapshot" {
  description = "If true (default), no snapshot will be made before deleting DB"
  default     = true
  type        = "bool"
}

variable "preferred_maintenance_window" {
  description = "When AWS can run snapshot, can't overlap with maintenance window"
  default     = "sat:10:00-sat:10:30"
  type        = "string"
}

variable "automated_snapshot_retention_period" {
  description = "How long will we retain backups"
  default     = 0
  type        = "number"
}

variable "enable_logging" {
  description = "Enables logging information such as queries and connection attempts, for the specified Amazon Redshift cluster."
  default     = false
  type        = "bool"
}

variable "logging_bucket_name" {
  description = "(Optional, required when enable_logging is true) The name of an existing S3 bucket where the log files are to be stored. Must be in the same region as the cluster and the cluster must have read bucket and put object permissions."
  default     = false
  type        = "bool"
}

variable "logging_s3_key_prefix" {
  description = "(Optional) The prefix applied to the log file names."
  default     = false
  type        = "bool"
}

# parameter group config bits
# ref: https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html
variable "enable_user_activity_logging" {
  description = "Enable logging of user activity. See https://docs.aws.amazon.com/redshift/latest/mgmt/db-auditing.html"
  default     = "false"
  type        = "bool"
}

variable "require_ssl" {
  description = "Require SSL to connect to this cluster"
  default     = "false"
  type        = "bool"
}

variable "use_fips_ssl" {
  description = "Enable FIPS-compliant SSL mode only if your system is required to be FIPS compliant."
  default     = "false"
  type        = "bool"
}

variable "wlm_json_configuration" {
  description = "Configuration bits for WLM json. see https://docs.aws.amazon.com/redshift/latest/mgmt/workload-mgmt-config.html"
  default     = "[{\"query_concurrency\": 5}]"
  type        = "string"
}

variable "tags" {
  description = "A mapping of tags to assign to all resources"
  default     = {}
  type        = "map(any)"
}

variable "encrypted" {
  description = "(Optional) If true , the data in the cluster is encrypted at rest."
  default     = false
  type        = "bool"
}

variable "kms_key_id" {
  description = "(Optional) The ARN for the KMS encryption key. When specifying kms_key_id, encrypted needs to be set to true."
  default     = ""
  type        = "string"
}

variable "enhanced_vpc_routing" {
  description = "(Optional) If true, enhanced VPC routing is enabled."
  default     = false
  type        = "bool"
}

variable "allow_version_upgrade" {
  description = "(Optional) If true, major version upgrades can be applied during the maintenance window to the Amazon Redshift engine that is running on the cluster."
  default     = true
  type        = "bool"
}
