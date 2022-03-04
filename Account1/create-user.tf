resource "aws_iam_user" "new-user" {
  name = "AssumeSQSAccount2"
}

resource "aws_iam_policy" "policy" {
  name        = "foraccount1"
  description = "policy needs to be attached"
  policy      = file("sts_assume-policy.json")
}

resource "aws_iam_user_policy_attachment" "attach-pol" {
  user       = aws_iam_user.new-user.name
  policy_arn = aws_iam_policy.policy.arn
}



/*
resource "aws_iam_role" "role" {
  name = "ForAccount1"

  assume_role_policy = file("assume-policy.json")
}

resource "aws_iam_policy" "policy" {
  name        = "forsns_s3"
  description = "policy needs to be attached"
  policy      = file("Policy.json")
}

resource "aws_iam_role_policy_attachment" "Policy-attach" {
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.policy.arn
}

*/
