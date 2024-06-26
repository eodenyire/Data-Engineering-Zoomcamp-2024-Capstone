# Define AWS CloudWatch alarms for monitoring
resource "aws_cloudwatch_metric_alarm" "zoomcamp_alarm" {
  alarm_name          = "zoomcamp_alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "zoomcamp_metric"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "This metric monitors something important."
  alarm_actions       = ["${aws_sns_topic.zoomcamp_topic.arn}"]
}

# Define AWS CloudWatch log groups
resource "aws_cloudwatch_log_group" "zoomcamp_log_group" {
  name = "/var/log/example"
}

# Provision Elasticsearch cluster for log aggregation
resource "aws_elasticsearch_domain" "zoomcamp_elasticsearch" {
  domain_name           = "zoomcamp-elasticsearch"
  elasticsearch_version = "7.9"
  cluster_config {
    instance_type = "t2.small.elasticsearch"
  }
}

# Deploy Logstash for log ingestion
resource "aws_instance" "zoomcamp_logstash" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  key_name      = "zoomcamp_keypair"
}

# Deploy Kibana for log visualization
resource "aws_instance" "zoomcamp_kibana" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  key_name      = "kibana_zoomcamp_keypair"
}

