mongoose = require 'mongoose'

# User model
Turn = new mongoose.Schema(
  date: String
  specialist: String
  speciality: String
  pacient: String
  state: String
)

module.exports = mongoose.model 'User', User
