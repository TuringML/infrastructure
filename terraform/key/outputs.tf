output "key_value" {
  description = "Name of the Key generated"
  value       = "${aws_key_pair.generated_key.key_name}"
}
