import jwt from 'jsonwebtoken';
// import * as dotenv from 'dotenv';
// dotenv.config();

export async function authenticateToken(req, res, next) {
  // Mendapatkan token dari header Authorization
  const authHeader = req.headers['authorization']
  const token = authHeader && authHeader.split(' ')[1]
  if (token == null) return res.sendStatus(401)
  
  try {
    jwt.verify(token, process.env.JWT_TOKEN, (err, user) => {
      if (err) return res.status(401).json({ message: "Token expired" });
      req.user = user;
      next()
    })
  } catch (err){
    if (err.name === "TokenExpiredError") {
      return res.status(401).json({ message: "Token expired" });
    }
  }
}




function verifyAccessToken(token){
  try {
    const decoded = jwt.verify(token, process.env.JWT_TOKEN);
    return decoded;
  } catch (err) {
    return null;
  }
};