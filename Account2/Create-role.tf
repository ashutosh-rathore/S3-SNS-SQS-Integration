
resource "aws_iam_role" "role" {
  name = "foraccount1sns"

  assume_role_policy = file("assume-policy.json")
}

resource "aws_iam_policy" "policy" {
  name        = "foraccount1"
  description = "policy needs to be attached"
  policy      = file("Policy.json")
}

resource "aws_iam_role_policy_attachment" "Policy-attach" {
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.policy.arn
}