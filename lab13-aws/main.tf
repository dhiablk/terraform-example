locals {
  unique_teams   = distinct(var.teams)
  teams_upper    = [for t in var.teams : upper(t)]
  teams_lower    = [for t in var.teams : lower(t)]
  first_subnet   = element(var.subnet_cidrs, 0)
  last_subnet    = element(var.subnet_cidrs, length(var.subnet_cidrs) - 1)
  subnet_count   = length(var.subnet_cidrs)
  az_count       = length(var.availability_zones)
  sorted_teams   = sort(var.teams)
  joined_teams   = join(", ", distinct(var.teams))
  reversed_azs   = reverse(var.availability_zones)
  subnet_cidr_map = {
    for i, cidr in var.subnet_cidrs : "subnet-${i + 1}" => cidr
  }
}

resource "aws_s3_bucket" "functions_demo" {
  bucket = "functions-demo-${var.environment}-${local.subnet_count}-${local.joined_teams}"

  tags = {
    Name        = "Built-in Functions Demo"
    Environment = var.environment
    Teams       = local.joined_teams
    TeamCount   = tostring(length(local.unique_teams))
    FirstAZ     = var.availability_zones[0]
    LastAZ      = local.reversed_azs[0]
    FirstSubnet = local.first_subnet
    LastSubnet  = local.last_subnet
    SortedTeams = local.joined_teams
  }
}