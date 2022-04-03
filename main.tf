
resource "aws_ecr_repository" "this" {
  name = var.name
  tags = var.tags
}

resource "aws_ecr_lifecycle_policy" "this" {
  repository = aws_ecr_repository.this.name

  policy = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Expire untagged images older than 14 days",
            "selection": {
                "tagStatus": "untagged",
                "countType": "sinceImagePushed",
                "countUnit": "days",
                "countNumber": 14
            },
            "action": {
                "type": "expire"
            }
        },
        {
            "rulePriority": 2,
            "description": "Keep last 5 prod images",
            "selection": {
                "tagStatus": "tagged",
                "tagPrefixList": ["prod"],
                "countType": "imageCountMoreThan",
                "countNumber": 5
            },
            "action": {
                "type": "expire"
            }
        },
        {
            "rulePriority": 3,
            "description": "Keep last 5 production images",
            "selection": {
                "tagStatus": "tagged",
                "tagPrefixList": ["production"],
                "countType": "imageCountMoreThan",
                "countNumber": 5
            },
            "action": {
                "type": "expire"
            }
        },
        {
            "rulePriority": 4,
            "description": "Keep last 5 production images",
            "selection": {
                "tagStatus": "tagged",
                "tagPrefixList": ["preproduction"],
                "countType": "imageCountMoreThan",
                "countNumber": 5
            },
            "action": {
                "type": "expire"
            }
        },
        {
            "rulePriority": 5,
            "description": "Keep last 5 production images",
            "selection": {
                "tagStatus": "tagged",
                "tagPrefixList": ["main"],
                "countType": "imageCountMoreThan",
                "countNumber": 5
            },
            "action": {
                "type": "expire"
            }
        },
        {
            "rulePriority": 6,
            "description": "Keep last 3 dev images",
            "selection": {
                "tagStatus": "tagged",
                "tagPrefixList": ["dev"],
                "countType": "imageCountMoreThan",
                "countNumber": 3
            },
            "action": {
                "type": "expire"
            }
        },
        {
            "rulePriority": 7,
            "description": "Keep last 3 dev images",
            "selection": {
                "tagStatus": "tagged",
                "tagPrefixList": ["sandbox"],
                "countType": "imageCountMoreThan",
                "countNumber": 3
            },
            "action": {
                "type": "expire"
            }
        },
        {
            "rulePriority": 8,
            "description": "Keep last 3 dev images",
            "selection": {
                "tagStatus": "tagged",
                "tagPrefixList": ["development"],
                "countType": "imageCountMoreThan",
                "countNumber": 3
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}
