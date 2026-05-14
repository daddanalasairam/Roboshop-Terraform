env="dev"
domain_name = "sairamdevops.online"
zone_id = "Z0178136JFDDY8ZV87TZ"

db_instances = {
  mongodb = {
    app_port = 27017
    instance_type = "t3.small"
    volume_size = 20
  }
  redis = {
    app_port = 6379
    instance_type = "t3.small"
    volume_size = 20
  }
  rabbitmq = {
    app_port = 5672
    instance_type = "t3.small"
    volume_size = 20
  }
  mysql = {
    app_port = 3306
    instance_type = "t3.small"
    volume_size = 20
  }
}

app_instances = {
  catalogue = {
    app_port = 8080
    instance_type = "t3.small"
    volume_size = 30
  }
  cart = {
    app_port = 8080
    instance_type = "t3.small"
    volume_size = 30
  }
  user = {
    app_port = 8080
    instance_type = "t3.small"
    volume_size = 30
  }
  shipping = {
    app_port = 8080
    instance_type = "t3.small"
    volume_size = 30
  }
  payment = {
    app_port = 8080
    instance_type = "t3.small"
    volume_size = 30
  }
}

web_instances = {
  frontend = {
    app_port = 80
    instance_type = "t3.small"
  }
}