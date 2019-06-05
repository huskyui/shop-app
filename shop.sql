/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.7.23-log : Database - shop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`shop` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `shop`;

/*Table structure for table `carouse_info` */

DROP TABLE IF EXISTS `carouse_info`;

CREATE TABLE `carouse_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `url` varchar(255) DEFAULT NULL COMMENT '超链接地址',
  `img` varchar(255) NOT NULL COMMENT '图片地址',
  `goods_id` int(11) NOT NULL COMMENT '商品id，-1是首页轮播图',
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='录播图';

/*Data for the table `carouse_info` */

insert  into `carouse_info`(`id`,`url`,`img`,`goods_id`,`createtime`) values (1,'https://www.google.com','https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2481057399,3301365638&fm=26&gp=0.jpg',-1,'2019-05-06 10:37:22'),(2,'https://www.google.com','https://hbimg.huabanimg.com/fe57730706eea6af22d5999ac95dc3d914c7209866868-U8WEJv_fw658',-1,'2019-05-06 10:37:07'),(3,'https://www.google.com','https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=796760710,2247899927&fm=26&gp=0.jpg',-1,'2019-05-06 10:37:18'),(4,NULL,'http://demo.dtcms.net/upload/201504/20/thumb_201504200046589514.jpg',1,'2019-03-26 11:30:50'),(5,NULL,'http://demo.dtcms.net/upload/201504/20/thumb_201504200046594439.jpg',1,'2019-03-26 11:30:59');

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户id| -1为匿名用户',
  `content` text COMMENT '评论内容',
  `type` int(11) NOT NULL COMMENT '类似 ： 0：新闻评论',
  `foreign_id` int(11) NOT NULL COMMENT '外键id',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='评论';

/*Data for the table `comment` */

insert  into `comment`(`id`,`user_id`,`content`,`type`,`foreign_id`,`createtime`) values (1,-1,'评论一波',0,13,'2019-03-22 11:55:21'),(2,-1,'awsl',0,13,'2019-03-22 11:55:43'),(3,-1,'dps在此一游',0,13,'2019-03-22 11:56:22'),(4,-1,'哈哈哈',0,13,'2019-03-22 16:48:59'),(5,-1,'弟弟行为',0,13,'2019-03-22 16:53:36'),(6,-1,'哥哥从来不打弟弟',0,13,'2019-03-22 16:53:52'),(7,-1,'侬好啊',0,14,'2019-03-22 16:59:30'),(8,-1,'biubiubiu',0,14,'2019-03-22 17:00:19'),(9,-1,'3333\n',0,14,'2019-03-22 17:04:19'),(10,-1,'44444\n',0,14,'2019-03-22 17:04:25'),(11,-1,'55555',0,14,'2019-03-22 17:04:29'),(12,-1,'6666',0,14,'2019-03-22 17:04:34'),(13,-1,'hhh',0,13,'2019-03-22 18:14:59'),(14,-1,'11111',1,1,'2019-03-25 23:05:40'),(15,-1,'22222',1,1,'2019-03-25 23:05:47'),(16,-1,'333',1,1,'2019-03-26 11:33:04'),(17,-1,'华为meta20',1,1,'2019-03-26 11:34:23'),(18,-1,'12014',1,2,'2019-03-26 11:34:33'),(19,-1,'这商品真的不错',1,3,'2019-03-26 11:34:50'),(20,-1,'1222',0,13,'2019-04-01 20:47:14'),(21,1,'顶顶顶顶',0,13,'2019-04-02 16:10:41'),(22,-1,'测试',0,13,'2019-04-02 16:11:08'),(23,3,'1211',0,14,'2019-05-11 18:15:30'),(24,3,'1111',0,15,'2019-05-11 18:15:44'),(25,1,'dddd',1,1,'2019-05-12 13:47:08');

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `summary` varchar(255) DEFAULT NULL COMMENT '摘要',
  `clicktimes` int(11) DEFAULT '0' COMMENT '点击次数',
  `img_url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `sell_price` decimal(11,4) DEFAULT NULL COMMENT '出售价格',
  `market_price` decimal(11,4) DEFAULT NULL COMMENT '原价',
  `in_quality` int(11) DEFAULT '0' COMMENT '库存',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='商品';

/*Data for the table `goods` */

insert  into `goods`(`id`,`title`,`summary`,`clicktimes`,`img_url`,`sell_price`,`market_price`,`in_quality`,`createtime`,`updatetime`) values (1,'华为（HUAWEI）荣耀6Plus 16G双4G版','荣耀6 Plus，该机型分为两款型号，分别为PE-',0,'http://demo.dtcms.net/upload/201504/20/thumb_201504200046589514.jpg','2195.0000','2499.0000',60,'2019-03-23 16:34:50','2019-03-23 16:34:57'),(2,'苹果Apple iPhone 6 Plus 16G 4G手机（联通三网版）','iPhone 6 Plus设计上和iPhone 6',0,'http://demo.dtcms.net/upload/201504/20/thumb_201504200059017695.jpg','5780.0000','6368.0000',200,'2019-03-23 16:36:25','2019-03-23 16:36:22'),(3,'小米（Mi）小米Note 16G双网通版','小米Note此次采用的5.7英寸夏普/JDI分辨率',0,'http://demo.dtcms.net/upload/201504/20/thumb_201504200119256512.jpg','2199.0000','2699.0000',60,'2019-03-23 16:55:53','2019-03-23 16:55:50'),(4,'佳能（Canon） EOS 700D 单反套机','◆ 佳能普及型单反新旗舰记忆的片段，偶然的相遇，铭',0,'http://demo.dtcms.net/upload/201504/20/thumb_201504200154277661.jpg','4799.0000','5099.0000',100,'2019-03-23 16:57:17','2019-03-23 16:57:20'),(5,'作为D3200的升级版，尼康D3300最大特点即是','尼康(Nikon)D3300套机（18-55mm f/3.5-5.6G VRII）（黑色）',0,'http://demo.dtcms.net/upload/201504/20/thumb_201504200214471783.jpg','3150.0000','3180.0000',10,'2019-03-23 17:09:55','2019-03-23 17:09:57'),(6,'联想（Lenovo） G510AM 15.6英寸笔记本电脑','G系列全面支持Windows 8 简体中文版，在秉',0,'http://demo.dtcms.net/upload/201504/20/thumb_201504200225107390.jpg','2999.0000','4999.0000',100,'2019-03-23 17:10:51','2019-03-23 17:10:53'),(7,'Apple iMac MF883CH/A 21.5英寸一体机电脑','—— iMac —— 锋锐设计，锋芒表现。iMac',0,'http://demo.dtcms.net/upload/201504/20/201504200341260763.jpg','7200.0000','7988.0000',10,'2019-03-23 17:12:18','2019-03-23 17:12:17'),(8,'金士顿（Kingston） DataTraveler SE9 32GB 金属U盘','品名：金士顿颜色：银色容量：32GB USB2.0',0,'http://demo.dtcms.net/upload/201504/20/thumb_201504200239192345.jpg','79.0000','99.0000',100,'2019-03-23 17:13:28','2019-03-23 17:13:25'),(9,'惠普（HP）LaserJet 2035商用黑白激光打印机（黑色）','全新hp laserjet p2035系列激光打印',0,'http://demo.dtcms.net/upload/201504/20/thumb_201504200242250674.jpg','1899.0000','2099.0000',100,'2019-03-23 17:14:21','2019-03-23 17:14:25'),(10,'惠普(HP) Officejet Pro 8610商用彩色喷墨一体机','专业彩色打印件的单页成本比激光打印机低 50%，从',0,'http://demo.dtcms.net/upload/201504/20/thumb_201504200253026047.jpg','1999.0000','2099.0000',100,'2019-03-23 17:15:18','2019-03-23 17:15:20'),(11,'mackook','13.5寸',0,'https://img.alicdn.com/imgextra/i1/2616970884/O1CN011IOub2P2Wcx3j5L_!!2616970884.jpg_430x430q90.jpg','13888.0000','14888.0000',500,'2019-03-23 17:19:42','2019-03-23 17:19:45');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content` text COMMENT '内容',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='new表';

/*Data for the table `news` */

insert  into `news`(`id`,`content`,`createtime`) values (13,'<p>\r 房企一季度销售业绩已经陆续公布，克而瑞研究中心统计数据显示，今年一季度，TOP20的房企仅6家实现业绩同比增长。\r </p>\r <p>\r <b>多家企业销售下滑</b> \r </p>\r <p>\r 记者了解到，虽然恒大、融创一季度交出了不错的答卷，但是，万科等排名靠前的房企均出现销售下滑。其中万科公布前三个月销售金额为460.6亿元，同比去年的542.3亿元减少15%，而碧桂园公布，截至2015年3月31日止三个月，集团共实现合同销售金额约177.3亿元，同比下跌44.32%。\r </p>\r <p>\r <b>此外，一季度多家企业的利润跌幅超过50%。数据显示，万科预计2015年1月至3月归属于上市公司股东的净利润为6亿~7亿元，比上年同期下降54%至61%。</b> \r </p>\r <p>\r <b>趋势</b> \r </p>\r <p>\r <b>地价占比上升及去库存压力下&nbsp;房企利润回归</b> \r </p>\r <p>\r 中原地产首席分析师张大伟称，一季度房企销售及利润普遍下滑，主要是因为企业销售节奏的变化，“大部分企业在2013年完成情况非常好，预留了大量签约结转到2014年。但2014年整体企业完成情况较差，大部分企业反而透支了2015年年初的签约，导致2015年签约不尽如人意。”\r </p>\r <p>\r 同时，张大伟表示，大多数城市住房供大于求，价格过高，未来增值不确定，已经不再是最佳投资选择，因此房地产投资需求也出现显著回落。\r </p>\r <p>\r 而易居房地产研究院研究员严跃进则表示，一季度部分房企还是坚持降价促销的策略，对此出现利润下滑也是符合预期的。随着地价占房价比例越来越高，开发商利润空间不断被挤压。同时，很多房企目前的营销费用还是比较大的，也会损耗房企利润。\r </p>\r <p>\r 此外，严跃进说，从长期看，地价占比上升与去库存压力将成为长期趋势，房企已告别高利润时代，回归正常利润成为趋势。\r </p>\r <p>\r 不过，张大伟认为，3月下半月市场告别签约淡季。部分城市出现小阳春现象，预计整体市场的走势将会继续向好，后续改善型需求的入市量将会有所增加。\r </p>\r <p>\r <b>分析：</b> \r </p>\r <p>\r <b>房企打响去库存促销战</b> \r </p>\r <p>\r “对于房地产市场来说，出现退房的原因有两种：1.收房的时候质量差。2.房价下调。无理由退房对于中国90%成交是期房的房地产市场现状来说，这的确是解决了购房者对房屋质量的担忧。”中原地产首席分析师张大伟对记者表示，后续预计也会有更多企业学习借鉴。\r </p>\r <p>\r 而亚太城市房地产研究院院长谢逸枫则表示，恒大2015年率先打出全国项目“无理由退房”计划第一枪，意味正式打响房企主动去库存的促销战。\r </p>\r <p>\r “承诺无理由退房，意味着开发商承担更多的风险，在资金方面承受更大压力，后续肯定会有企业跟风。”知名地产评论人赵卓文表示。\r </p>\r <p>\r 因此，有业内人士认为，无理由退房可能加速市场优胜劣汰。夏海钧回应称，中国房地产市场高峰时有五六万家房地产开发企业，现在还有两三万家。市场竞争、行业洗牌再洗掉两万多家，剩几百几千家很正常，“到那时行业整体素质会更高”。\r </p>\r <p>\r “在目前这个市场周期，恒大提出无理由退房，也的确更多是为了去库存营销的努力，从营销上看，对增加成交量肯定有帮助。”张大伟表示。\r </p>\r <p>\r “常规的降价促销已经无法触及购房者的神经，房企必须使出浑身解数吸引购房者。另一方面是购房者对价格敏感性在减弱，对降价没有之前那么敏感，购房者普遍存在买涨不买跌，无理由退房主要是打消购房者对房价不断下降的顾虑。目的在于制造市场 上涨 预期，引导购房者对后市乐观的态度。”谢逸枫认为。\r </p>\r <p>\r 也有部分业内人士对“无理由退房”的操作性心存疑虑。\r </p>\r <p>\r <b>相关新闻</b> \r </p>\r <p>\r <b>恒大宣布全国范围内无理由退房</b> \r </p>\r <p>\r 恒大地产集团昨日宣布，自今日起，将在全国所有楼盘住宅实施无理由退房，该措施覆盖全国147个城市的305个楼盘。恒大副总裁夏海钧表示，希望住宅“包退”成为市场新常态。\r </p>\r <p>\r <b>今日起买恒大房“包退货”</b> \r </p>\r <p>\r 昨日下午，恒大宣布，全国所有楼盘住宅从4月16日8时起正式实施无理由退房，覆盖恒大所有在售住宅，遍布全国147个城市的305个楼盘。\r </p>\r <p>\r 恒大集团承诺：凡购买恒大所有楼盘住宅的客户，若已履行《楼宇认购书》、《商品房买卖合同》的各项义务，并且无任何违约行为，则自签署《商品房买卖合同》及《无理由退房协议书》之日起至办理入住手续前的任何时间内，均可无理由退房。\r </p>\r <p>\r 最新数据显示，2015年1~3月，恒大累计合约销售金额约305.4亿元，其中3月实现合约销售额137.1亿元，&nbsp;恒大地产2014年全年销售额达1315亿元，2015年销售目标定为1500亿元，较2014年目标增36.4%\r </p>','2019-03-21 21:28:28'),(14,'<p>\r 时间稍纵即逝，转眼间2015年已经过去了4个月，在这短短的四个月，股市攀升到了4000点， 这让很多原本对股市不抱期望的人再度春心萌动。同样，在这个四个月的时间里，楼市经历了死而复活聚变，一浪高过一浪的救市政策把楼市推到风口浪尖至少，房价涨声再起。\r </p>\r <p>\r <br />\r 于是关于买房还是炒股的话题再次老生常谈。炒股好还是买房好，当一路高歌猛进的股市遇到大手笔的楼市新政，人们如何在炒股与买房之间做出选择，似乎更加困难。\r </p>\r <p>\r <br />\r 为此，湘潭365房产网购房专家表示，炒股更多是投机，而非投资，也就是趁着股市大涨行情， 捞一把；而买房，更多是一种需求或者长期投资。因此，如果你没有足够的资金，那么弃股买房是最佳选择，但是如果你不缺钱，但同时又有买房需求，那么先炒股，后买房，但宗旨是见好就收。\r </p>\r <p>\r <br />\r 需要声明的是，即便是楼市整体复苏，好的房子仍然需要购房者精挑细选，即使在亢奋的牛市行情中，满仓踏空者也不在少数，因此，无论是买房还是炒股，都应该把握规律，不能因为盲目跟风，失去了理性的判断力。\r </p>\r <p>\r <br />\r 说了这么多，湘潭365房产网购房专家还是认为，买房比炒股更有利，尤其是在当前政策如此宽松，房贷如此优惠的前期下，更是绝佳的买房时机，以下编辑整理出的2015年买房无法拒绝的5大理由，供您参考。\r </p>\r <p>\r <br />\r <strong>1，楼市政策宽松 </strong> \r </p>\r <p>\r <br />\r 首套房“认贷不认房”，二套房首付降低4成，央行两次降息，9折房贷利率、二手房交易营业税5调2，首套房住房公积金贷款首付最低2成、二套房3成....等等楼市政策是自2008年之后最宽松时期。\r </p>\r <p>\r <br />\r 对于购房者来说，不仅降低了买房门槛，更节约的买房成本，此时买房无疑是一举两得。\r </p>\r <p>\r <br />\r <strong>2，房子是固定资产</strong> \r </p>\r <p>\r <br />\r 买房相对于炒股，更具抗风险。尽管短期内炒股可能小赚一笔，但是股市风云难测，跌的时候是不见谷底；但是，买房则不同，不管房价如何变动，房子始终是你的，你想住就住，想出租就出租，你拥有足够的话语权，不至于像买股票那样提心吊胆\r </p>\r <p>\r <br />\r <strong>3，买房会强迫储蓄 </strong> \r </p>\r <p>\r <br />\r 买房最大的好处就是让不懂理财或者月光族变成理财高手。如果你能以每个月2000的价格租一套公寓，而不是月供2400元买一套，租房或许有点意义。但你会省下这400元以备未来之需吗？很多人都不会。我敢说大多数人都不会。在这里你又必须自己盘算了，不过你的贷款月供中偿还本金的部分不能算是成本。其实你的钱是给自己的，因为你积累了资产。作为一种强制性的每月储蓄，这是种很好的自律。\r </p>\r <p>\r <br />\r <strong>4，选择余地很大 </strong> \r </p>\r <p>\r <br />\r 近五年房地产市场的快速发展，导致楼市严重供过于求，尤其是经历了2014年楼市的“调整”之后，当前全国大多数地方都有充足的房源。\r </p>\r <p>\r <br />\r &nbsp;以湘潭为例，尽管年销售只有200万平米左右，但是当前库存已经超过450万平米，这相当于2年半的销售量。而且随着此次二手房交易政策放宽，还有更多的存量房不断进入市场。这种情况意味着选择多多，而且价格实惠。\r </p>\r <p>\r <br />\r <strong>5，房价反弹只是时间问题 </strong> \r </p>\r <p>\r <br />\r 房价还会下跌吗？当然会，你永远都抄不到底，但这长期来看并不重要。以目前的楼市政策以及市场环境，房价反弹只是时间问题，更何况每天都有如此之多的市民加入买房一族，楼市回暖迫在眉睫。\r </p>\r <p>\r <br />\r 结语：对于购房者来场，抄底是个梦，但是不买房永远抄不到底。在众多利好的政策和价格优势下，2015年买房应该是不错的选择。\r </p>','2019-03-21 13:45:14'),(15,'<p>\r 在SUV当道的天下，许多自主品牌相继推出了旗下多款SUV，想要在这个大市场划分一块田地。此次，作为多年生产硬派越野车的汽车企业猎豹汽车也紧随其后，即将推出量产SUV-猎豹CS10，这一越野车型会不会在市场上掀起波澜？又是否能真正帮助猎豹品牌在市场重塑地位？这一切我们不得而知，只能静静等待上海车展之后它的表现。无论怎样，先来看看这次小编抢先实拍到的量产猎豹CS10吧。\r </p>\r <p align=\"\"center\"\">\r <img class=\"\"imgborder\"\" alt=\"\"\"\" src=\"http://ofv795nmp.bkt.clouddn.com//upload/201504/16/201504161218547905.jpg\" border=\"\"1\"\" /> \r </p>\r <p>\r <strong>&nbsp;&gt;&gt;&gt;外观实拍：</strong> \r </p>\r <p>\r 外观方面，猎豹CS10采用了最新的家族式前脸设计，中网进气格栅采用蜂窝状设计，前大灯组内还配备了LED日间行车灯。此外，前保险杠下方的进气口大嘴式的造型凸显凶猛。\r </p>\r <p align=\"\"center\"\">\r <img class=\"\"imgborder\"\" alt=\"\"\"\" src=\"http://ofv795nmp.bkt.clouddn.com//upload/201504/16/201504161218550401.jpg\" border=\"\"1\"\" /> \r </p>\r <p align=\"\"center\"\">\r <img class=\"\"imgborder\"\" alt=\"\"\"\" src=\"http://ofv795nmp.bkt.clouddn.com//upload/201504/16/201504161218551181.jpg\" border=\"\"1\"\" /> \r </p>\r <p align=\"\"center\"\">\r <img class=\"\"imgborder\"\" alt=\"\"\"\" src=\"http://ofv795nmp.bkt.clouddn.com//upload/201504/16/201504161218551649.jpg\" border=\"\"1\"\" /> \r </p>\r <p align=\"\"center\"\">\r <img class=\"\"imgborder\"\" alt=\"\"\"\" src=\"http://ofv795nmp.bkt.clouddn.com//upload/201504/16/201504161218552117.jpg\" border=\"\"1\"\" /> \r </p>\r <p align=\"\"center\"\">\r <img class=\"\"imgborder\"\" alt=\"\"\"\" src=\"http://ofv795nmp.bkt.clouddn.com//upload/201504/16/201504161218552585.jpg\" border=\"\"1\"\" /> \r </p>\r <p align=\"\"center\"\">\r <img class=\"\"imgborder\"\" alt=\"\"\"\" src=\"http://ofv795nmp.bkt.clouddn.com//upload/201504/16/201504161218553053.jpg\" border=\"\"1\"\" /> \r </p>\r <p align=\"\"center\"\">\r <img class=\"\"imgborder\"\" alt=\"\"\"\" src=\"http://ofv795nmp.bkt.clouddn.com//upload/201504/16/201504161218553521.jpg\" border=\"\"1\"\" /> \r </p>\r <p align=\"\"center\"\">\r <img class=\"\"imgborder\"\" alt=\"\"\"\" src=\"http://ofv795nmp.bkt.clouddn.com//upload/201504/16/201504161218553989.jpg\" border=\"\"1\"\" /> \r </p>\r <p align=\"\"center\"\">\r <img class=\"\"imgborder\"\" alt=\"\"\"\" src=\"http://ofv795nmp.bkt.clouddn.com//upload/201504/16/201504161218554457.jpg\" border=\"\"1\"\" /> \r </p>\r <p>\r <strong>&gt;&gt;&gt;外观小结：</strong> \r </p>\r <p>\r 此次猎豹一改此之前车型硬朗的设计风格，开始主打家用与时尚牌，第一眼见到猎豹CS10时，你或许会觉得这是一款合资品牌SUV车型，整体的外观设计非常成功。从猎豹汽车对于该车外观下的功夫，我们可以给点个赞。\r </p>','2019-03-21 13:45:48'),(16,'<p>\r &emsp;&emsp;一辆豪华日系SUV是他的座驾，魏建军几乎是尾随参与试驾的媒体记者们而来。这位平素一贯喜欢一门心思扎在车间不爱应酬的长城汽车掌门人这天为何表现出少有的兴奋与热情？\r </p>\r <p>\r &emsp;&emsp;或许他是迫切地想知道，这些在道路试驾中前半段路程中试乘了保时捷卡宴、奔驰ML350、奥迪Q5、进口路虎揽胜极光、路虎第四代发现等豪华品牌SUV的记者们在后半段试乘哈弗H8后会有什么感想。而媒体记者们更想知道的是，对于一款两次推迟上市的自主品牌汽车，对于这种国内外汽车界绝无仅有的小概率事件，对于魏建军和他的长城汽车意味着什么？\r </p>\r <p>\r <br />\r </p>\r <p>\r &emsp;&emsp;4月2日，三度“重生”的哈弗H8对比验证体验会就这样在河北徐水拉开帷幕。\r </p>\r <p>\r <br />\r </p>\r <p>\r &emsp;&emsp;几乎从没有哪一款新车的命运能像哈弗H8的经历这样跌宕起伏。作为首款价格上探20元价格区间的自主品牌SUV，哈弗H8的市场使命是能将七八十万元左右的豪华品牌拉下马来。\r </p>\r <p>\r <br />\r </p>\r <p>\r &emsp;&emsp;2013年11月，哈弗H8在当年的广州车展上以20.18万元的起售价宣布上市，立刻引爆了市场关注的目光。然而两个月后，即2014年1月，长城方面突然发布公告称：“由于哈弗H8仍存在诸多问题，决定继续对H8进行完善整改，自公告刊登之日起推迟3个月上市，并暂停接受预订。”宣布新车回炉的公告一石激起千层浪，哈弗H8瞬间被推到了舆论的风口浪尖，各种质疑猜测甚嚣尘上，但长城汽车方面却不做任何进一步的解释，过起了“闭门造车”的日子。\r </p>\r <p>\r <br />\r </p>\r <p>\r &emsp;&emsp;2014年4月，哈弗H8北京车展上宣布再次上市。然而一个月后的5月8日，长城汽车再次发布了名为《关于哈弗H8延迟交付的说明》，说明中称：客户反映车辆在高速工况下，传动系统存在敲击音，影响了整车品质，达不到商品车交付的条件，公司决定将H8进行第二次整改。第二次的回炉再造，给长城汽车和哈弗H8带来了更加迅猛的质疑之声。\r </p>\r <p>\r <br />\r </p>\r <p>\r &emsp;&emsp;两度上市后的两度回炉，对长城汽车已造成重创。有消息透露，长城汽车高端工厂——徐水工厂未能如期生产哈弗H8，直接导致了长城汽车整体费用率的上升。据报道，徐水工厂与哈弗H8配套设备、人员研发过程中产生的费用已计入管理费用中，因而徐水工厂全年费用总计超过了6亿元。\r </p>\r <p>\r <br />\r </p>\r <p>\r &emsp;&emsp;长城汽车2014年财报显示，长城汽车全年营业收入625.99亿元，同比增长10％；同期净利润80.51亿元，同比下滑2.2％。而相比2012年和2013年财年，长城汽车的营业收入同比增长率分别为43.44％、31.57％，净利润同比增长率更分别高达66.14％和44.47％。\r </p>\r <p>\r <br />\r </p>\r <p>\r &emsp;&emsp;哈弗H8的经历让长城汽车见识到资本市场的冷酷无情。2013年1月14日，长城汽车宣布H8延迟上市的第二天，长城汽车A股开盘一度逼近跌停，H股跌幅亦高达12.23％；2014年5月8日，尽管长城汽车第二次宣布延期上市前紧急停牌，但在次日A股复牌后仍开盘跌停，创下长城汽车A股近16个月盘中最低价。同日，长城汽车H股跌幅高达16.92％，当日市值缩水168亿港币。\r </p>\r <p>\r <br />\r </p>\r <p>\r &emsp;&emsp;回过头来观望资本市场当初的惊涛骇浪，魏建军如今表现得相当平静，他说，“我们做产品的，不能只看资本市场的脸色行事”。\r </p>\r <p>\r <br />\r </p>\r <p>\r &emsp;&emsp;“哈弗H8现已达到上市条件，将会在上海车展期间上市，随后新车将于5月份全面到店。”魏建军说，整改后的哈弗H8与此前版本相比已有本质上的改善。“整整7个多月的密切交流，最终发现主要还是精度问题。”据介绍，在哈弗H8叫停上市后，长城汽车组织国内外专家，在配套供应商采埃孚公司的配合下，找出了问题的根源——后主减速器合格率得不到保证。\r </p>\r <p>\r <br />\r </p>\r <p>\r &emsp;&emsp;“有些技术问题在你不知道怎么解决的时候会觉得非常难，但实际上就是一层‘窗户纸’。”魏建军坦言，通过反复分析和验证，在后桥主减速器及相关传动系统进行重新匹配和优化后，长城H8整车状态总算是达到了最佳。\r </p>\r <p>\r <br />\r </p>\r <p>\r &emsp;&emsp;“长城汽车不走高端很快就会死。”魏建军说，自主向上必须突破，这是不容回避的问题。\r </p>','2019-03-21 22:03:56'),(17,'<p>\r &emsp;&emsp;国产SUV车型当中，最当红的3款非哈弗H6、比亚迪S7与长安CS75了。那么分属不同企业的3款车型，用着到底怎么样，看看车主怎么说。\r </p>\r <p>\r <br />\r </p>\r <p>\r &emsp;&emsp;月销3万已经不再是哈弗H6的新闻，随着哈弗H6 Coupe的上市，这款车的目标应该是月销5万了。在H6的口碑调查当中有5200多人参与，评价得分为4.403分。空间、外观和性价比，成为哈弗H6最为突出的三项优势。其中，空间和外观项，甚至评到了4.873和4.727的高分。那么这款车也并非十全十美，其动力得分虽然也不低，但却不像外观那样出彩，这一项得分为3.961分。\r </p>\r <div class=\"adv_style_notext\" id=\"adv_985\">\r </div>\r <p>\r <br />\r </p>\r <p>\r &emsp;&emsp;比亚迪S7是一款上市时间不长的车型，仅有500多人参与该款车的口碑调查，但得分却不低，为4.758分。在该车型上，性价比、空间、动力位列前三，性价比得分甚至高达4.98，这也无非是其高配低价的集中体现。而得分最低的油耗项目也被评到了4.51，可见这车的短板并不十分明显。\r </p>\r <p>\r <br />\r </p>\r <p>\r &emsp;&emsp;长安CS75现在已经是销量前十的SUV车型，此次有1000多名车主评价该车，口碑得分4.639，长安CS75的内饰，成为车主们最为介怀的一点，仅为4.296分。 除了性价比和空间占优之外，该车型操控性优势也不俗，获评4.776分。而CS75着力强调的安全性，在口碑榜上并未体现。\r </p>','2019-03-21 22:04:20'),(18,'<p style=\"text-indent:2em;\">\r 近年来，关于手机流量资费贵和网速慢是社会关注和领导关切的热点问题，我部一直与相关部委共同深入落实宽带中国战略，推动企业加大网络投资、降低手机流量资费。为落实李克强总理指示，我部将加大今年宽带专项行动中加快4G建设、大幅提升网速等工作的力度，使老百姓上网速度更快，价格更优惠。\r </p>\r <p style=\"text-indent:2em;\">\r 2007年，中国内地每个网民平均每月实际花费的上网费用为83.5元。统计显示，2006年中国城镇居民人均可支配收入为11759元，人均月收入979.92元；农村居民人均纯收入3587元，人均月收入298.92元。\r </p>\r <p style=\"text-indent:2em;\">\r 记者当年采访了田纳西州的一位华人朋友曼迪。她说，她家的宽带上网费本来是每月40多美元，但由于提供有线电视和上网服务的是同一家公司，她得到了每月25美元的优惠价，折合人民币约193元。曼迪说，美国电信公司竞争非常激烈，可以跟公司讨价还价。她说，她的家庭年收入约在10万美元。\r </p>\r <p style=\"text-indent:2em;\">\r 一位就职于一家旅行社的德国朋友说，给他提供无线宽带上网服务的是德国目前最便宜的电信公司，合同期两年，包月费用为31欧元，相当于322元人民币。他的月纯收入为1309欧元，算下来，“上网费占到纯收入的2.4%，不算贵。”\r </p>\r <p style=\"text-indent:2em;\">\r 根据日本总务省每年的调查结果，日本自2002年起成为世界上网费用最低廉的国家。总务省2006年的调查数据显示，占日本市场份额最大的一家网络服务公司，上网费加初装费，月均为3370日元，折合人民币210元左右。东京一家普通公司的普通职员说，这个费用大概占自己月收入的1%。\r </p>\r <p style=\"text-indent:2em;\">\r 印度媒体最近公布的一份调查报告称，印度每月平均上网费为600卢比，约合人民币120元，占到印度人均月收入的20%。\r </p>\r <p style=\"text-indent:2em;\">\r 澳大利亚人选择的上网包月费在60澳元的居多，约合人民币390元。澳大利亚人月收入在4000澳元以上的人居多，上网费占到收入的1.5%左右。\r </p>','2019-03-21 22:04:41'),(19,'<p style=\"text-indent:2em;\">\r 根据调研公司IHS的拆机分析，三星最新推出的旗舰智能手机Galaxy S6 \r Edge是目前制造和组装成本最高的主流手机。\r </p>\r <p style=\"text-indent:2em;\">\r IHS拆解了提供给美国无线运营商Verizon Wireless出售的64GB版本的Galaxy S6 \r Edge手机，估计其零件和组装成本为290美元。\r </p>\r <p style=\"text-indent:2em;\">\r 这个成本比去年发布的Galaxy S5手机高34美元，甚至高过苹果iPhone6和iPhone \r 6 Plus手机。IHS估计最高版本的iPhone6和iPhone 6 Plus手机的材料成本分别为247美元和263美元。64GB版本的Galaxy S6 \r Edge非合约机售价为699美元，而相同容量的iPhone 6 Plus非合约机官方售价为849美元。\r </p>\r <p style=\"text-indent:2em;\">\r 负责此次拆机的分析师Andrew Rassweiler说零件成本最近几年一直在稳步攀升。\r </p>\r <p style=\"text-indent:2em;\">\r “三星使用了金属外壳和其他跟苹果相似的设计元素，很明显三星已经研究过苹果的手机。结果是，这款手机的售价比iPhone手机低，但造价却更高。”\r </p>\r <p style=\"text-indent:2em;\">\r S6 Edge成本最高的部件是其曲面屏幕。Rassweiler说这块屏幕的造价为85美元。\r </p>\r <p style=\"text-indent:2em;\">\r 接下来是三星自家制造的Exynos7芯片，成本估计为29.5美元。S6 \r Edge是第一个使用14纳米芯片制造技术的手机。另一家能够制造14纳米芯片的厂商是英特尔。苹果预计会在下一代iPhone手机中使用14纳米芯片。\r </p>\r <p style=\"text-indent:2em;\">\r 这款全新的高端芯片需要搭配昂贵的高端内存。这款手机使用了三星制造的3GB的DDR4内存，其成本为27美元。Rassweiler说这是DDR4内存第一次被用在了手机上。\r </p>\r <p style=\"text-indent:2em;\">\r Rassweiler说Verizon销售的Galaxy S6 \r Edge使用了高通制造的基带芯片，成本为15美元。另外，AT&amp;T销售的该款手机使用的是三星制造的基带芯片。\r </p>','2019-03-21 22:05:00'),(20,'<p>\r 昨天，乐视发布了3款手机，乐1、乐1Pro和乐Max，定价分别为1499、2499，乐Max采用全民定价尚未披露价格。一时间，<span>乐视网</span><span id=\"sz300104_hq\">[<span class=\"Ared\">0.17%</span> 资金 研报]</span>和贾跃亭再次被推上风口。\r </p>\r <p>\r 这年头，传统的制造企业转型造手机屡见不鲜,不可否认，这是一个门槛很低的<span>行业</span>，乐视发布其手机虽是意料之中，但质疑声也颇多。百度一下乐视手机，搜索结果高达1280万个，超级手机高达1600万个，褒贬不一，由于乐视网是目前创业板第一大市值公司，是成长股的一大标杆，乐视发布会进行同时，用户和股民骂战吐槽很HIGH。\r </p>\r <p>\r <strong>吐槽一：干掉苹果疯不疯狂?</strong>\r </p>\r <p>\r 这不是第一次有国内企业宣称要干掉苹果，贾跃亭的公开信公开炮轰苹果封闭扼制创新，阻碍产业发展，长期会伤害用户利益。并宣称，只有时代的模式，没有永恒的模式，封闭的苹果已不符合时代的发展趋势，必然会衰弱。\r </p>\r <p>\r 干掉苹果为什么会引起这么大的纠纷，虽然乔帮主已逝，但精神永存。至少在果粉的心中，苹果还是时尚的象征，虽然目前仅有土豪金等少数产品能够彰显果粉的高贵身份，但没落贵族哪能轮得上土鳖地主来说道，所以干掉苹果的言论一出，首先触及了一个尊严问题，会引起一帮人的抵触。\r </p>\r <p>\r <strong>吐槽二：贾跃亭忽不忽悠?</strong>\r </p>\r <p>\r 有很多人质疑贾跃亭很会讲故事，超级电视、超级<span>汽车</span>，现在又来了超级手机，就跟当初很多人质疑雷布斯和小米一样。不过，我想说的是，这年头，哗众不一定取宠，却能增加曝光率。总理都说了，要把互联网+摆上战略高度，新常态下要有互联网思维。这年头，谈理想不犯法，不用罚款吧，吹牛逼不用交税吧。\r </p>\r <p>\r 站在股民的角度考虑，贾跃亭很够意思，上市公司的最大义务是为股东们创造价值，一是分红，来自于为公司创造的利润；一个来自于股价的上涨。乐视免费的广告费估算成5000万不算贵吧，按照创业板100倍的市盈率计算，这省去的费用就相当于贡献了50亿的市值。在发布会现场，明星和女神众多，这些都是乐视影业的直接资源，不能算是乐视网的直接资源，属于未来可能注入上市公司的资产，贾老板相当于免费贡献出来了，用专业名词讲，这是协同效应，有利于控制成本。\r </p>\r <p>\r <strong>吐槽三：第一大创业板公司值不值这个价?</strong>\r </p>\r <p>\r 乐视顶着创业板第一大市值公司的光环，值不值700亿一直看法分歧。创业板看似疯，其实到目前千亿元级别公司还没有出现，这还只是<span>人民币</span>，不是<span>美元</span>。从全球范围的手机和视频类上市公司估值看，苹果为7348亿美元，我们不和苹果比，不和三星比，看看没落的HTC和诺基亚，乐视网的估值也就是人家的1/3。\r </p>\r <p>\r 用股民的眼光和发烧友的眼光去评价乐视手机，是两码事。用股民的眼光和果粉的眼光去评价IPHONE，也是两码事。这种事情如果靠炒嘴皮子解决，律师都成了世界首富。\r </p>\r <p>\r <strong>吐槽四：乐视手机卖不卖得动?</strong>\r </p>\r <p>\r 乐视手机好不好，会不会热卖。你我说了不算，机构说了不算，最终还是市场说了算，乐视手机的核心优势是移动端的视频娱乐，也就是核心生态。小米也宣传自己卖的不是手机，而是生态，既然是生态，就得有内容，有配套，有实质的产品要客户去消费。小米宣称不通过硬件赚钱，但其实小米的主要来源仍然是硬件，由于内容的匮乏，依靠用户和数据变现难在短期实现，这也使得目前小米大量投入在内容的补充。而乐视在这方面不缺，版权和视频就是整个乐视生态的核心。\r </p>','2019-03-21 22:05:22'),(21,'<p>\r &emsp;&emsp;OFweek<span class=\"hrefStyle\">光通讯</span>网讯 宽带已经是大家日常生活必不可少的必须品，也是国民经济的基础建设。不过大家会不会经常有这样的感觉，各大商家打出来的广告十分诱人，超低的价格，超高的带宽。可是越来越多的人发现，在办理了所谓的超高带宽的<span class=\"hrefStyle\">光纤</span>宽带之后，网速却没有真正的快起来？有时这宽带让自己还挺闹心？其实这不是别的，市场上那些号称20兆、30兆、50兆的宽带并不是真正的宽带，那是蒙老百姓的。那些号称是独享带宽其实大部分都不是独享的，那么怎么能辨别这些情况，真正用上光纤宽带呢？带大家了解点常识。\r </p>\r <p>\r &emsp;&emsp;<strong>1、 看<span class=\"hrefStyle\">网络</span>的接入是光猫还是网线</strong>\r </p>\r <p>\r &emsp;&emsp;真正的<span class=\"hrefStyle\">光纤到户</span>才能提供百兆以上的带宽，这就需要通过光纤直接连接到家中，在用户的家里也必须有一个光猫，这样才能直接接入互联网。而社区LAN组网的方式，它是把网络连到一个小区，或是一个楼，组成局域网后通过网线将共享网络连接到各个家庭。如果连接进你家里的不是光猫而是网线，说明整个社区的用户共享着本该一名用户独享的带宽。为什么一定要一个光猫连结到家里呢？因为这个光猫就是将光以太信号转换成其他协议信号的收发设备。到你家里直接到光信号转成电信号，你才能保证带宽，否则就不是。\r </p>\r <p>\r &emsp;&emsp;<strong>2、 看传输的材料是铜线还是光纤</strong>\r </p>\r <p>\r &emsp;&emsp;进入我们家中的网线也是有不同，一种是光纤，一种是铜线。铜线由多根互相绝缘的导线或导体构成缆心，外部具有密封护套。铜缆是承载不了高带宽的。铜线其实我们大家都了解，里面是实心的，是一根铜丝，做得再好，也能不支持高带宽，而支持高带宽的就只有光纤了。光纤是一种由<span class=\"hrefStyle\">玻璃</span>或者塑料制成的纤维。目前通过光纤接入家庭的最大带宽可达100兆，下行速率约为11520-12800KB/S。光纤和铜线最大的不同，光纤里面其实是空心，可以传导光信号。业内有一句玩笑：“光纤无铜，偷了无用”。因为光纤里没有铜小偷偷了也卖不了钱，所以它对小偷无用，但是对我们来说用处可就大了，光纤的传输速度是铜缆没法比较的。\r </p>\r <p>\r &emsp;&emsp;<strong>3、常使用软件测速，看是否稳定</strong>\r </p>\r <p>\r &emsp;&emsp;最基本的方式，我们可以通过使用常用业务和软件来进行直观的判断，或者使用专业的测试工具进行测速。\r </p>\r <p>\r &emsp;&emsp;另外，带宽的稳定性也是鉴别真假光纤的方法之一。大部分的投诉用户家庭宽带常出现两类问题，第一类是平时网速快而节假日网速慢（白天网速快而晚上网速慢），第二类是对网络质量要求较高的游戏/在线视频等会出现卡、顿、断的现象，这种情况很有可能是使用了“假宽带”造成的。\r </p>\r <p>\r &emsp;&emsp;所以，家里是不是真正光纤宽带，能不能保证速度，不要被宣传所动，要看看到底是什么接入方式，怎么接入的，防止掉入消费陷阱。\r </p>','2019-03-21 22:05:46'),(22,'<p style=\"text-indent:2em;\">\r 北京时间4月16日消息，腾讯科技通过可靠渠道获知，58同城与赶集网将正式合并，消息最快将于今天公布。\r </p>\r <p style=\"text-indent:2em;\">\r 此前，据外媒援引消息人士称，58同城和赶集网合并后的新公司估值最高将达到100亿美元。\r </p>\r <p style=\"text-indent:2em;\">\r 58同城和赶集网都成立于2005年，分类信息平台的模式使得双方在创立后的多年里基本处于同质化的竞争。双方合并后，将有利于这两家排名第一和第二位的公司在分类信息业务下实现协同效应。\r </p>\r <p style=\"text-indent:2em;\">\r 从去年下半年开始，赶集网冲击赴美上市的消息不断。去年8月，杨浩涌微博还曾公开对外宣布，将于2015年6月左右启动IPO计划。同时，赶集网也开始在汽车、房产等领域试水新的业务模式，包括推出C2C二手车项目“赶集好车”及上门洗车项目“赶集易洗车”，在房产领域也与房产O2O平台“房多多”达成合作。\r </p>\r <p style=\"text-indent:2em;\">\r 早在2012年，赶集网就曾谋求赴美上市，但赶集网总裁杨浩然与前妻的股权之争使上市之事最终搁浅。而2013年10月58同城率先赴美上市，并引入腾讯战略投资后，领先优势逐渐拉开。作为上市公司的58同城，开始快速跑马圈地，一方面在产业链上通过投资布局，另一方面，成立了独立子公司“58到家”，发力上门经济。\r </p>\r <p style=\"text-indent:2em;\">\r 58同城与赶集网的合并，意味着两家分类信息平台多年的激烈竞争即将结束。作为该领域排名第一和第二位的公司，合并后将获得分类信息市场的绝对份额。同时，双方也会进一步在O2O方向上进行布局，深化业务模式。\r </p>','2019-03-21 22:06:36'),(23,'<p>\r &emsp;&emsp;2015年，各大电商逐鹿广袤的农村市场，一场圈地运动正在上演，焦点之战在家电市场首先展开。\r </p>\r <p>\r &emsp;&emsp;4月9日，京东公布农村电商发展的阶段性成果，其中定位于农村大家电营销、配送、安装、维修的京东帮服务店表现抢眼——4个月时间，开设了超过400家服务店，服务范围辐射超过10万个行政村。从去年11月20日在河北赵县开通第一家服务店以来，京东帮服务店展开迅猛，日均开店3家，单日开店最高55家。2015年，京东将电商下乡的目标确定为开设500家县级服务中心、招募数万名乡村推广员，建立1000家左右的京东帮服务店。\r </p>\r <p>\r &emsp;&emsp;最近，苏宁宣布在2015年计划建成1500家苏宁易购服务站，并计划在5年内建立10000家，深入全国乡村，从渠道建设层面打通“农村电商”发展壁垒。阿里巴巴则在去年10月提出“千县万村”计划，将在3至5年内投资100亿元在县级地和农村建立线下服务点，具体将建立1000个县级运营中心和10万个村级服务站。\r </p>\r <p>\r &emsp;&emsp;在电商下乡的拓展中，京东、苏宁和阿里巴巴在策略上，都是物流先行，构建起一张从县到村的线下服务点组成的地网。不同的是，京东还选择了第三方合作的方式，在每个县选择一家有经验的合作伙伴开通京东帮服务店，并通过系列服务和支持将其纳入到京东物流体系中，并基于农村的特点，承担起大家电营销、配送、安装、维修等综合职能。苏宁和阿里巴巴则整合第三方物流，构建覆盖农村的服务网络。\r </p>\r <p>\r &emsp;&emsp;京东、苏宁和阿里巴巴挺进农村，首当其冲受到影响的是苏宁。苏宁在全国拥有1400家线下店，其中很多都是在三到六线地区，就像一线城市昔日电商的发展冲击线下店一样，当电商进入农村，最先受到影响的就是线下实体店。以家电为例，以前农民买电视，基本上只有去县城的电器实体店购买一条路径，现在他们可以选择像京东帮一样的电商服务店，价格便宜、服务到家、安装售后一条龙，农民又何乐而不为呢？\r </p>\r <p>\r &emsp;&emsp;正如当年京东家电对苏宁的冲击一样，一场新的京东苏宁家电大战在农村拉开序幕，这次可能真的要革线下的命。在北京、上海、广州这样的一线城市，人们已经习惯在网上买东西，尤其在互联网环境下长大的80后也要买房装修购家电时，他们已经不再去线下实体店买东西了。苏宁现在赖以生存的就是三到六线地区的线下实体店，当京东在农村采用第三方合作的方式，快速拓店、服务到村的时候，对苏宁线下实体店的冲击将非常大。据京东披露的数据，京东帮服务店拉动的订单增长环比开店前已超过105%，其中华南区域已超过200%。\r </p>\r <p>\r &emsp;&emsp;更重要的是，京东正在将自营的管理模式运用到京东帮服务店的运营中，这与苏宁的第三方物流模式形成鲜明的对比。据了解，京东帮服务店采用第三方合作的方式，因为申请者众多，京东选择合作方非常严格，最终入选的京东帮帮主都是具有丰富的家电配送、安装、维修等方面的经验。因为每个县只有一个京东帮，加之京东提供了系统、技术、品牌、营销等方面的支持，并为京东帮提供销售返点、配送安装补贴等服务，使得京东帮与京东结成了紧密的利益共同体，形成了类京东自营的体验。相比之下，苏宁采用第三方配送与供应商安装的模式则劣势明显，无法做到类似京东的一站式服务。从这个角度来看，京东帮虽然一个县只有一个，但能实现更好的体验，少而精。苏宁和阿里巴巴虽然通过第三方加盟的方式能够快速拓点，但造成了互相之间的竞争，服务参差不齐，多而杂。\r </p>\r <p>\r &emsp;&emsp;无论是京东、苏宁，还是阿里巴巴，都在将触角伸向农村，目的很简单，就是在一线城市网购市场日渐饱和的情况下，开辟新的增长蓝海。相比京东和阿里巴巴的轻装上阵，苏宁则比较纠结为难，京东在迅速实现家电在一线地区崛起的同时，利用京东帮这样的独特模式，快速铺开，真正危机到了苏宁的根本。\r </p>\r <p>\r &emsp;&emsp;京东、苏宁与阿里巴巴，在2015年的农村，正在激发一场新的战役。“得农村者，得天下”，让我们拭目以待！\r </p>\r <p>\r &emsp;&emsp;南冥一鲨(微信公众号：southsharker)：解读行业发展的大势，揭示新闻背后的真相，总结互联网化的经验教训。关注南冥一鲨，在这里读懂互联网，因为知大势，方能赢未来。\r </p>','2019-03-21 22:06:51'),(24,'易车总裁邵京宁在艾瑞年度高峰会议上表示，汽车行业作为一个体量大且精英化的行业，与互联网的结合较其他行业相比更为缓慢。\r <p>\r 邵京宁认为，汽车作为一个拥有百年历史的重要的民用固造产业，拥有很深的制造业思维，是非常“骄傲和顽固”的，这造成了与互联网融合的缓慢。\r </p>\r <p>\r 易车对国内51家汽车企业做的调查显示，有55%的互联网营销部门设置在市场部门下面，有10%左右是在销售部下面，有12%没有设定，仅有有3%是独特的销售互联网营销部门。\r </p>\r <p>\r 邵京宁认为，汽车行业的营销和电商还处于一体化阶段，概念还没有成型，还在业务的尝试和摸索当中。可能未来几年之后这个界限会看得更清楚。而过程会经历以下三个阶段：\r </p>\r <p>\r 第一个阶段，电商只是拿来作为噱头，这也是目前的主要的阶段。电商只是噱头，产品仍以传统产品为主，4S店主要还是线下的销售渠道，汽车厂商也并没有销售的增长，它的运营的效率和成效也并没有实质性的提升。购车的环节从C端体验来看也没有获得更大的优化，用户并没有获得更好的用户体验。\r </p>\r <p>\r 第二阶段，依托4S店体系进行厂下销售，这一阶段，从消费者体验来看是最新的尝试体验。依托4S店体系进行厂下销售，经销商负责展示和服务，承担轻库存。邵京宁认为，这种方式可以解决因产定销造成的厂商批发任务刚性，一旦市场销售不出去导致的大量存货、价格下降等问题。\r </p>\r <p>\r 第三阶段是C2B模式研发与生产，即建立以消费者为中心的服务体系，用户可以深度地参与品牌研发和营销的过程。从而最终影响到最高级别的品牌层级的变化，产生互联网思维的以人为本思维的汽车品牌。邵京宁认为，这应该是目前行业可以想象和预见到的最高级阶段。\r </p>','2019-03-21 22:07:21');

/*Table structure for table `news_brief` */

DROP TABLE IF EXISTS `news_brief`;

CREATE TABLE `news_brief` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `news_id` int(11) NOT NULL COMMENT '新闻id',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `summary` varchar(255) NOT NULL COMMENT '摘要',
  `img_url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `click_times` int(10) DEFAULT '0' COMMENT '点击次数',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `content` blob COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='新闻列表';

/*Data for the table `news_brief` */

insert  into `news_brief`(`id`,`news_id`,`title`,`summary`,`img_url`,`click_times`,`createtime`,`content`) values (13,13,'1季度多家房企利润跌幅超50% 去库存促销战打响','房企一季度销售业绩已经陆续公布，克而瑞研究中心统计','http://demo.dtcms.net/upload/201504/16/201504161149414479.jpg',45,'2019-03-21 15:46:41',NULL),(14,14,'买房还是炒股，2015年买房无法拒绝的5大理由','转眼间2015年已经过去了4个月，在这短短的四个月','http://demo.dtcms.net/upload/201504/16/201504161205596364.jpg',15,'2019-03-21 15:47:43',NULL),(15,15,'抢先实拍猎豹CS10 霸气时尚2.0T涡轮增压','在SUV当道的天下，许多自主品牌相继推出了旗下多款','http://demo.dtcms.net/upload/201504/16/201504161218505373.jpg',6,'2019-03-21 15:49:18',NULL),(16,16,'长城汽车不走高端很快就会死 哈弗H8卷土重来','&amp;emsp;&amp;emsp;一辆豪华日','http://demo.dtcms.net/upload/201504/16/201504161229442885.jpg',3,'2019-03-21 16:40:24',NULL),(19,19,'三星S6造价更高 卖得却比iPhone 6便宜','根据调研公司IHS的拆机分析，三星最新推出的旗舰智','http://demo.dtcms.net/upload/201504/16/201504161246140423.jpg',2,'2019-03-21 16:58:45',NULL),(20,20,'乐视手机遭疯狂吐槽 忽不忽悠看了再说','昨天，乐视发布了3款手机，乐1、乐1Pro和乐Ma','http://demo.dtcms.net/upload/201504/16/201504161254335201.jpg',2,'2019-03-21 18:54:59',NULL),(21,21,'假宽带频现 什么是真正的光纤宽带？','&amp;emsp;&amp;emsp;OFwee','http://demo.dtcms.net/upload/201504/16/201504161258558786.jpg',2,'2019-03-21 18:56:21',NULL),(22,22,'58同城与赶集网最快今日将宣布合并','北京时间4月16日消息，腾讯科技通过可靠渠道获知','http://demo.dtcms.net/upload/201504/16/201504161303162262.jpg',1,'2019-03-21 18:57:46',NULL),(23,23,'电商下乡，京东、苏宁、阿里农村遭遇战打响？','2015年，各大电商逐鹿广袤的农村市场，一场圈地运','http://demo.dtcms.net/upload/201504/16/201504161329185965.jpg',1,'2019-03-21 18:59:20',NULL),(24,24,'易车总裁邵京宁：汽车行业电商化的三个阶段','易车总裁邵京宁在艾瑞年度高峰会议上表示，汽车行业作','http://demo.dtcms.net/upload/201504/16/201504161336598829.jpg',0,'2019-03-21 18:59:53',NULL);

/*Table structure for table `order_brief` */

DROP TABLE IF EXISTS `order_brief`;

CREATE TABLE `order_brief` (
  `id` varchar(255) NOT NULL COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

/*Data for the table `order_brief` */

insert  into `order_brief`(`id`,`user_id`,`createtime`) values ('20190401203947agX8797',1,'2019-04-01 20:39:48'),('201904012043054oOi145',1,'2019-04-01 20:43:05'),('20190401205612t1cU519',1,'2019-04-01 20:56:13'),('20190402151225CRui708',1,'2019-04-02 15:12:26'),('201904021604204SBl248',1,'2019-04-02 16:04:20'),('20190506102807TYcu212',1,'2019-05-06 10:28:07'),('20190506105908EKW5654',1,'2019-05-06 10:59:09'),('20190506105941eenG265',1,'2019-05-06 10:59:41'),('201905111814450jT2734',3,'2019-05-11 18:14:46'),('20190511181457lcGR023',3,'2019-05-11 18:14:57'),('201905121347178kPp072',1,'2019-05-12 13:47:17'),('20190512154730v3Zx979',1,'2019-05-12 15:47:31');

/*Table structure for table `order_detail` */

DROP TABLE IF EXISTS `order_detail`;

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` varchar(255) DEFAULT NULL COMMENT '订单id',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `count` int(11) DEFAULT NULL COMMENT '商品数量',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='商品详情';

/*Data for the table `order_detail` */

insert  into `order_detail`(`id`,`order_id`,`goods_id`,`count`,`createtime`) values (3,'20190401203947agX8797',1,2,'2019-04-01 20:39:48'),(4,'20190401203947agX8797',3,2,'2019-04-01 20:39:48'),(5,'201904012043054oOi145',2,2,'2019-04-01 20:43:05'),(6,'20190401205612t1cU519',2,2,'2019-04-01 20:56:13'),(7,'20190402151225CRui708',1,1,'2019-04-02 15:12:26'),(8,'20190402151225CRui708',6,3,'2019-04-02 15:12:26'),(9,'20190402151225CRui708',3,2,'2019-04-02 15:12:26'),(10,'20190402151225CRui708',8,1,'2019-04-02 15:12:26'),(11,'201904021604204SBl248',2,3,'2019-04-02 16:04:20'),(12,'20190506102807TYcu212',1,1,'2019-05-06 10:28:07'),(13,'20190506102807TYcu212',3,1,'2019-05-06 10:28:07'),(14,'20190506105908EKW5654',2,3,'2019-05-06 10:59:09'),(15,'20190506105908EKW5654',3,2,'2019-05-06 10:59:09'),(16,'20190506105941eenG265',1,1,'2019-05-06 10:59:41'),(17,'201905111814450jT2734',2,1,'2019-05-11 18:14:46'),(18,'201905111814450jT2734',4,1,'2019-05-11 18:14:46'),(19,'20190511181457lcGR023',1,4,'2019-05-11 18:14:57'),(20,'201905121347178kPp072',1,3,'2019-05-12 13:47:17'),(21,'20190512154730v3Zx979',1,1,'2019-05-12 15:47:31');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(20) NOT NULL,
  `birthday` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`email`,`birthday`) values (1,'huskyui','7354327d54e932a68c2bef0a56335f9b','2207019991@qq.com','2019-03-29'),(2,'husky','7354327d54e932a68c2bef0a56335f9b','13122444252@qq.com','2009-01-01'),(3,'2207019991','7354327d54e932a68c2bef0a56335f9b','2207019991@qq.com','1980-01-01');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
