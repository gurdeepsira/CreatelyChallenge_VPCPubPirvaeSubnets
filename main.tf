resource "aws_vpc"
{


}


resource "aws_internet_gateway"
{

}

resource "aws_eip" "lb" {
  instance = "${aws_instance.web.id}"
  vpc      = true
}

resource "aws_nat_gateway" "nat" {
  subnet_id     = "${aws_subnet.public.id}"

}


resource "aws_subnet" "main"
{
    vpc_id     = "${aws_vpc.main.id}"
    cidr_block = "10.0.1.0/24"
}

resource "aws_eip" "ElasticIp" {
vpc      = true
}

resource "aws_nat_gateway" "terraformtraining-nat-gw" {
    allocation_id = "${aws_eip.Elasticip.id}"
    subnet_id = "${aws_subnet.terraformtraining-public-1.id}"
    depends_on = ["aws_internet_gateway.terraformtraining-gw"]
}

