const dotenv = require("dotenv");
const assert = require("assert");

dotenv.config();

const { PORT } = process.env;

assert(PORT, "PORT is not defined");

module.exports = {
  port: PORT,
};
