
#########################
### SETUP/CONFIGURE ####
########################

require 'aws-sdk'

#Configure with Region, access key id and secret access key
Aws.config[:credentials] = Aws::Credentials.new("your id", "your key")

#Create new database
dynamodb = Aws::DynamoDB::Client.new(region: 'us-west-2')

# puts dynamodb.methods

########################
### CREATE A TABLE ####
#######################

dynamodb.create_table({
  table_name: 'Campsites',
  attribute_definitions: [
    {attribute_name: 'section', attribute_type: 'S'},
    {attribute_name: 'site_number', attribute_type: 'N'}
  ],
  key_schema: [
    {attribute_name: 'section', key_type: 'HASH'},
    {attribute_name: 'site_number', key_type: 'RANGE'},
  ],
  provisioned_throughput: {
    read_capacity_units: 1,
    write_capacity_units: 1
  }
  })


########################
### ADD AN ITEM ####
#######################

dynamodb.put_item({
  table_name: 'Campsites',
  item: {
    'site_number' => 1,
    'section' => 'river',
    'type' => 'cabin',
    'sq_feet' => 800,
    "reservations" => [
      {
        "first_name": "Tanisha",
    "last_name": "Williams",
    "num_of_guests": 4,
     "start_date": "2018-02-15",
     "end_date": "2018-02-20"
      },
      {
       "first_name": "Miguel",
     "last_name": "Suarez",
     "num_of_guests": 2,
      "start_date": "2018-02-10",
      "end_date": "2018-02-13"
      },
      {
        "first_name": "Yael",
      "last_name": "Schmidt",
      "num_of_guests": 5,
       "start_date": "2018-02-05",
       "end_date": "2018-02-08"
      }
    ]
  }
})


# ########################
# ### UPDATE AN ITEM ####
# #######################
#
# dynamodb.update_item({
#   table_name: "Campsites",
#   key: {
#     'site_number' => 1,
#     'section' => 'river'
#   },
#   update_expression: "SET has_electricity = :has_electricity",
#   expression_attribute_values: {
#     ":has_electricity" => true
#   }
# })


#####################
### RETRIEVE DATA ##
####################

#Item by primary key
response = dynamodb.get_item({
  table_name: 'Campsites',
  key: {
    'site_number' => 1,
    'section' => 'river'
  }
})

item = response.item
puts item
