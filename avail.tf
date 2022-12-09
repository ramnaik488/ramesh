data "aws_subnets" "example"{
filter{
name="vpc-id"
values=["vpc-0323b17865457e337"]
}
}
output "sns"{
  value=data.aws_subnets.example.ids
  }
  data "aws_subnet" "sndetails"{
  count=length(data.aws_subnets.example.ids)
  id=data.aws_subnets.example.ids[count.index]
  }
  output "sazs"{
  value=data.aws_subnet.sndetails.*.availability_zone
  }