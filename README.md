# Getting Started with DyanmoDB

[Slide deck](https://docs.google.com/presentation/d/1gmMai6ZilN0N6T5tDefL2Lu6179Q8SVox_Iv5k7NQF0/edit?usp=sharing) available here.

### By the end of this Lecture, you should be able to:
  - Create a new DynamoDB table in Ruby
  - Add items to Table
  - Query a specific Item, by primary key
  - Have an idea of how to design a NoSQL table

## DYNAMODB CONSOLE
Go to the [Dynamodb online console](https://us-west-2.console.aws.amazon.com/dynamodb/home?region=us-west-2#).

Create a users table
- The table's primary key will be an email.
- Other possible attributes: name and phone number

## DESIGN A TABLE
Design a database where a campground needs to keep track of the reservations for each of their campsites.

Campsites may have the following data:
- section
- site number
- type (cabin, tent, ect.)
- sq feet

Reservations may have:
- first name
- last name
- number of guests
- checkin date
- checkout date


## IN RUBY

### Setup
#### Install Gem
In terminal, run:
`$ gem install aws-sdk`

#### Require gem
At the top of campsites.rb, add:
`require 'aws-sdk'`

#### Set Credentials and Create New DynamoDB Instance
```ruby   
Aws.config[:credentials] = Aws::Credentials.new("your_id", "your_secretkey")
#replace "your_id" and "your_secretkey" with your credentials

dynamodb = Aws::DynamoDB::Client.new(region: 'us-west-2')
```

Notable Methods:
- scan
- wait_until
- query
- build_request
- stub_data
- waiter_names
- batch_get_item
- batch_write_item
- create_table
- delete_item
- delete_table
- describe_limits
- describe_table
- describe_time_to_live
- get_item
- list_tables
- list_tags_of_resource
- put_item
- tag_resource
- untag_resource
- update_item
- update_table


### Create a Table
Use the `.create_table` method

Need to set:
- Table Name (make sure it's plural)
- Primary Key (can be string, numeric or binary)
  - Sort Key (RANGE)
  - Partition Key (HASH)
- Provisioned throughput (we won't worry about this for now. It defines throughput capacity for reads and writes)

NOTE: DynamoDB is schemaless, meaning attributes do not need to be set while creating the table. Attributes are defined at item creation.

### Add Items
Use the `.put_item` method

Need to provide:
- Name of table item is going into
- Attribute names and values


### Retrieve Data
Use the `.get_item` method

NOTE: Scan should be avoided should be avoided in production because it retrieves all items from a table. It is only good to use for small datasets.

### Vocabulary
- Nosql
- Non-relational
- Schemaless
- Sort Key
- Partition Key
- Item
- Attribute
- Denormalization

### Additional Resources
- [AWS Dynamodb Core Components](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.CoreComponents.html#HowItWorks.CoreComponents.PrimaryKey)
- [AWS From SQL to NoSQL](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/SQLtoNoSQL.html)
- [AWS Ruby and DynamoDB](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GettingStarted.Ruby.html)
- (HOWTO Access DynamoDB with Ruby)[https://readysteadycode.com/howto-access-amazon-dynamodb-with-ruby]
