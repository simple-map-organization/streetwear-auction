require("dotenv").config();
const jwt = require("jsonwebtoken");

module.exports = (req, res, next) => {
  const authHeader = req.headers.authorization;
  if (authHeader) {
    try {
      const jwtToken = authHeader.split(" ")[1];
      const result = jwt.verify(jwtToken, process.env.JWT_SECRET, {
        ignoreExpiration: true,
      });
      req.id = result.id;
      next();
    } catch (error) {
      //403 forbidden (got token but now valid) / no permission
      return res.sendStatus(403);
    }
  } else {
    //401 unauthorized
    return res.sendStatus(401);
  }
};
