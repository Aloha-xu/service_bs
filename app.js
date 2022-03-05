var express = require("express");
var path = require("path");
var favicon = require("serve-favicon");
var logger = require("morgan");
var cookieParser = require("cookie-parser");
var bodyParser = require("body-parser");
const expressJwt = require("express-jwt");
const cors = require("cors");

let index = require("./routes/index");

let order = require("./routes/mall/order");
let user = require("./routes/mall/user");
let address = require("./routes/mall/address");
let goods = require("./routes/mall/goods");
let cart = require("./routes/mall/cart");
let userUpload = require("./routes/mall/upload");
let collection = require("./routes/mall/collection");
let home = require("./routes/mall/home");
let common = require("./routes/mall/common");
let foot = require("./routes/mall/foot");

let role = require("./routes/admin/role");
let banner = require("./routes/admin/banner");
let menu = require("./routes/admin/menu");
let admin = require("./routes/admin/admin");
let category = require("./routes/admin/category");
let adminGoods = require("./routes/admin/goods");
let adminUpload = require("./routes/admin/upload");
let adminOrder = require("./routes/admin/order");

var app = express();

// view engine setup
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "jade");

// uncomment after placing your favicon in /public
//app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
app.use(logger("dev"));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, "public")));

// 设置跨域资源分享CORS
app.use(cors());

// 使用中间件验证token合法性
app.use(
  expressJwt({ secret: "secret" }).unless({
    path: [
      "/",
      "/api/user/token",
      "/api/admin/register",
      "/api/admin/login",

      "/api/common/categoryList",
      "/api/goods/list",
      "/api/goods/detail",
      "/api/home/appInfo",
    ], //除了这些地址，其他的URL都需要验证
  })
);

app.use("/", index);

app.use("/api/address", address);
app.use("/api/user", user);
app.use("/api/goods", goods);
app.use("/api/cart", cart);
app.use("/api/order", order);
app.use("/api/upload", userUpload);
app.use("/api/collection", collection);
app.use("/api/home", home);
app.use("/api/common", common);
app.use("/api/foot", foot);

app.use("/api/role", role);
app.use("/api/banner", banner);
app.use("/api/menu", menu);
app.use("/api/admin", admin);
app.use("/api/category", category);
app.use("/api/admin/goods", adminGoods);
app.use("/api/upload", adminUpload);
app.use("/api/admin/order", adminOrder);

// 处理401错误 解析不到token就会UnauthorizedError
app.use(function (err, req, res, next) {
  if (err.name === "UnauthorizedError") {
    res.status(401).json({
      status: false,
      ...err,
    });
  }
});
// catch 404 and forward to error handler
app.use(function (req, res, next) {
  var err = new Error("Not Found");
  err.status = 404;
  next(err);
});

// error handler
app.use(function (err, req, res, next) {
  // render the error page
  res.status(err.status || 500);
  res.render("error");
});

module.exports = app;
