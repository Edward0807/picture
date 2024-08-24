port: 7890
socks-port: 7891
allow-lan: true
mode: Rule
log-level: error
external-controller: 0.0.0.0:10086
proxies:
  - {name: 'JMS-276814@c33s1.jamjams.net:12873', server: c36s1.portablesubmarines.com, port: 12873, type: ss, cipher: aes-256-gcm, password: anrtMjqaG4knRDpk}
  - {name: 'JMS-276814@c33s2.jamjams.net:12873', server: c36s2.portablesubmarines.com, port: 12873, type: ss, cipher: aes-256-gcm, password: anrtMjqaG4knRDpk}
  - {name: 'JMS-276814@c33s3.jamjams.net:12873', server: c36s3.portablesubmarines.com, port: 12873, type: vmess, uuid: f7a608b5-f8d5-44a6-879d-970a171b6569, alterId: 0, cipher: auto, tls: false, skip-cert-verify: false}
  - {name: 'JMS-276814@c33s4.jamjams.net:12873', server: c36s4.portablesubmarines.com, port: 12873, type: vmess, uuid: f7a608b5-f8d5-44a6-879d-970a171b6569, alterId: 0, cipher: auto, tls: false, skip-cert-verify: false}
  - {name: 'JMS-276814@c33s5.jamjams.net:12873', server: c36s5.portablesubmarines.com, port: 12873, type: vmess, uuid: f7a608b5-f8d5-44a6-879d-970a171b6569, alterId: 0, cipher: auto, tls: false, skip-cert-verify: false}
  - {name: 'JMS-276814@c33s801.jamjams.net:12873', server: c36s801.portablesubmarines.com, port: 12873, type: vmess, uuid: f7a608b5-f8d5-44a6-879d-970a171b6569, alterId: 0, cipher: auto, tls: false, skip-cert-verify: false}
  - {name: 'edward1', server: c58s1.portablesubmarines.com, port: 20058, type: ss, cipher: aes-256-gcm, password: 77tqdNJYaMsoXv2J}
  - {name: 'edward2', server: c58s2.portablesubmarines.com, port: 20058, type: ss, cipher: aes-256-gcm, password: 77tqdNJYaMsoXv2J}
  - {name: 'edward3', server: c58s3.portablesubmarines.com, port: 20058, type: vmess, uuid: 3d32f35e-79b0-417b-825b-1dbc24209a7c, alterId: 0, cipher: auto, tls: false, skip-cert-verify: false}
  - {name: 'edward4', server: c58s4.portablesubmarines.com, port: 20058, type: vmess, uuid: 3d32f35e-79b0-417b-825b-1dbc24209a7c, alterId: 0, cipher: auto, tls: false, skip-cert-verify: false}
  - {name: 'edward5', server: c58s5.portablesubmarines.com, port: 20058, type: vmess, uuid: 3d32f35e-79b0-417b-825b-1dbc24209a7c, alterId: 0, cipher: auto, tls: false, skip-cert-verify: false}
  - {name: 'edward6@801', server: c58s801.portablesubmarines.com, port: 20058, type: vmess, uuid: 3d32f35e-79b0-417b-825b-1dbc24209a7c, alterId: 0, cipher: auto, tls: false, skip-cert-verify: false}
  - name: "vmess+ws+tls+web"
    type: vmess
    server: 158.247.202.22
    port: 443
    uuid: 8bf82512-3b77-11ef-b0ad-270872488bb3
    alterId: 0
    cipher: auto
    udp: true
    tls: true
    network: ws
    skip-cert-verify: true
    ws-opts:
      path: /9ffa9d24edward
      headers:
        Host: v.edwardwx.mooo.com
  - name: "vmess+ws"
    type: vmess
    server: 158.247.202.22
    port: 47980
    uuid: f63d8010-04b7-41a3-e6e3-b9a4b80b65d9
    alterId: 0
    cipher: auto
    udp: true
    network: ws
    skip-cert-verify: true
    ws-opts:
      path: /f63d8010
   
proxy-groups:
  - name: "自动选择"
    type: url-test
    url: http://www.gstatic.com/generate_204
    interval: 300
    tolerance: 50
    proxies: ["JMS-276814@c33s1.jamjams.net:12873", "JMS-276814@c33s2.jamjams.net:12873", "JMS-276814@c33s3.jamjams.net:12873", "JMS-276814@c33s4.jamjams.net:12873", "JMS-276814@c33s5.jamjams.net:12873", "JMS-276814@c33s801.jamjams.net:12873", 'edward1', 'edward2', 'edward3', 'edward4', 'edward5', 'edward6@801', "vmess+ws+tls+web","vmess+ws"]
  - name: "故障转移"
    type: fallback
    url: http://www.gstatic.com/generate_204
    interval: 180
    proxies: ["JMS-276814@c33s1.jamjams.net:12873", "JMS-276814@c33s2.jamjams.net:12873", "JMS-276814@c33s3.jamjams.net:12873", "JMS-276814@c33s4.jamjams.net:12873", "JMS-276814@c33s5.jamjams.net:12873", "JMS-276814@c33s801.jamjams.net:12873", 'edward1', 'edward2', 'edward3', 'edward4', 'edward5', 'edward6@801']

  - name: "Proxy"
    type: select
    proxies:
      - "自动选择"
      - "故障转移"
  - name: "国外媒体"
    type: select
    proxies:
      - "Proxy"
  - name: "国内媒体"
    type: select
    proxies:
      - DIRECT
  - name: "电报信息"
    type: select
    proxies:
      - "Proxy"
  - name: "Chatgpt"
    type: select
    proxies: ["JMS-276814@c33s1.jamjams.net:12873", "JMS-276814@c33s2.jamjams.net:12873", "JMS-276814@c33s3.jamjams.net:12873", "JMS-276814@c33s4.jamjams.net:12873", "JMS-276814@c33s5.jamjams.net:12873", "JMS-276814@c33s801.jamjams.net:12873", 'edward1', 'edward2', 'edward3', 'edward4', 'edward5', 'edward6@801', "vmess+ws+tls+web","vmess+ws"]

rules:
  # chatgpt
  - "DOMAIN-SUFFIX,chatgpt,Chatgpt"
  - "DOMAIN-KEYWORD,chatgpt,Chatgpt"
  # YouTube
  - "DOMAIN,youtubei.googleapis.com,Proxy"
  - "DOMAIN-SUFFIX,youtube.com,Proxy"
  - "DOMAIN-SUFFIX,googlevideo.com,Proxy"
  - "DOMAIN-SUFFIX,youtube-nocookie.com,Proxy"
  - "DOMAIN-SUFFIX,youtu.be,Proxy"
  # Youtube Music
  - "DOMAIN-SUFFIX,music.youtube.com,Proxy"
  # Luminary
  - "DOMAIN-SUFFIX,t.me,Proxy"
  - "DOMAIN-SUFFIX,tdesktop.com,Proxy"
  - "DOMAIN-SUFFIX,telegra.ph,Proxy"
  - "DOMAIN-SUFFIX,telegram.me,Proxy"
  - "DOMAIN-SUFFIX,telegram.org,Proxy"
  - "IP-CIDR,91.108.4.0/22,Proxy,no-resolve"
  - "IP-CIDR,91.108.8.0/22,Proxy,no-resolve"
  - "IP-CIDR,91.108.12.0/22,Proxy,no-resolve"
  - "IP-CIDR,91.108.16.0/22,Proxy,no-resolve"
  - "IP-CIDR,91.108.56.0/22,Proxy,no-resolve"
  - "IP-CIDR,149.154.160.0/20,Proxy,no-resolve"
  - "IP-CIDR6,2001:b28:f23d::/48,Proxy,no-resolve"
  - "IP-CIDR6,2001:b28:f23f::/48,Proxy,no-resolve"
  - "IP-CIDR6,2001:67c:4e8::/48,Proxy,no-resolve"
  # 可能被屏蔽
  - "DOMAIN-KEYWORD,evernote,Proxy"
  # Bloombeg
  # Taiwan
  - "DOMAIN-SUFFIX,tw,Proxy"
  - "DOMAIN-KEYWORD,bitly,Proxy"
  - "DOMAIN-KEYWORD,blogspot,Proxy"
  - "DOMAIN-KEYWORD,dropbox,Proxy"
  - "DOMAIN-KEYWORD,facebook,Proxy"
  - "DOMAIN-KEYWORD,gmail,Proxy"
  - "DOMAIN-KEYWORD,google,Proxy"
  - "DOMAIN-KEYWORD,instagram,Proxy"
  - "DOMAIN-KEYWORD,oculus,Proxy"
  - "DOMAIN-KEYWORD,twitter,Proxy"
  - "DOMAIN-KEYWORD,whatsapp,Proxy"
  - "DOMAIN-KEYWORD,youtube,Proxy"
  - "DOMAIN-SUFFIX,fb.com,Proxy"
  - "DOMAIN-SUFFIX,fb.me,Proxy"
  - "DOMAIN-SUFFIX,fbcdn.net,Proxy"
  - "DOMAIN-SUFFIX,gstatic.com,Proxy"
  - "DOMAIN-SUFFIX,scdn.co,Proxy"
  - "DOMAIN-SUFFIX,t.co,Proxy"
  - "DOMAIN-SUFFIX,telegra.ph,Proxy"
  - "DOMAIN-SUFFIX,twimg.co,Proxy"
  - "DOMAIN-SUFFIX,twimg.com,Proxy"
  - "DOMAIN-SUFFIX,twitpic.com,Proxy"
  - "DOMAIN-SUFFIX,youtu.be,Proxy"
  - "DOMAIN-SUFFIX,ytimg.com,Proxy"
  # 国外媒体
  - "DOMAIN-SUFFIX,youtube.com,国外媒体"
  - "DOMAIN-SUFFIX,googlevideo.com,国外媒体"
  - "DOMAIN,youtubei.googleapis.com,国外媒体"
  # > Netflix
  - "DOMAIN-SUFFIX,netflix.com,国外媒体"
  - "DOMAIN-SUFFIX,netflix.net,国外媒体"
  - "DOMAIN-SUFFIX,nflxext.com,国外媒体"
  - "DOMAIN-SUFFIX,nflximg.com,国外媒体"
  - "DOMAIN-SUFFIX,nflximg.net,国外媒体"
  - "DOMAIN-SUFFIX,nflxso.net,国外媒体"
  - "DOMAIN-SUFFIX,nflxvideo.net,国外媒体"
  - "DOMAIN-SUFFIX,netflixdnstest0.com,国外媒体"
  - "DOMAIN-SUFFIX,netflixdnstest1.com,国外媒体"
  - "DOMAIN-SUFFIX,netflixdnstest2.com,国外媒体"
  - "DOMAIN-SUFFIX,netflixdnstest3.com,国外媒体"
  - "DOMAIN-SUFFIX,netflixdnstest4.com,国外媒体"
  - "DOMAIN-SUFFIX,netflixdnstest5.com,国外媒体"
  - "DOMAIN-SUFFIX,netflixdnstest6.com,国外媒体"
  - "DOMAIN-SUFFIX,netflixdnstest7.com,国外媒体"
  - "DOMAIN-SUFFIX,netflixdnstest8.com,国外媒体"
  - "DOMAIN-SUFFIX,netflixdnstest9.com,国外媒体"
  - "IP-CIDR,23.246.0.0/18,国外媒体,no-resolve"
  - "IP-CIDR,37.77.184.0/21,国外媒体,no-resolve"
  - "IP-CIDR,45.57.0.0/17,国外媒体,no-resolve"
  - "IP-CIDR,64.120.128.0/17,国外媒体,no-resolve"
  - "IP-CIDR,66.197.128.0/17,国外媒体,no-resolve"
  - "IP-CIDR,108.175.32.0/20,国外媒体,no-resolve"
  - "IP-CIDR,192.173.64.0/18,国外媒体,no-resolve"
  - "IP-CIDR,198.38.96.0/19,国外媒体,no-resolve"
  - "IP-CIDR,198.45.48.0/20,国外媒体,no-resolve"
  # 🌏 国内媒体
  - "DOMAIN-SUFFIX,acg.tv,国内媒体"
  - "DOMAIN-SUFFIX,acgvideo.com,国内媒体"
  - "DOMAIN-SUFFIX,b23.tv,国内媒体"
  - "DOMAIN-SUFFIX,biliapi.com,国内媒体"
  - "DOMAIN-SUFFIX,biliapi.net,国内媒体"
  - "DOMAIN-SUFFIX,bilibili.com,国内媒体"
  - "DOMAIN-SUFFIX,biligame.com,国内媒体"
  - "DOMAIN-SUFFIX,biligame.net,国内媒体"
  - "DOMAIN-SUFFIX,bilivideo.com,国内媒体"
  - "DOMAIN-SUFFIX,hdslb.com,国内媒体"
  - "DOMAIN-SUFFIX,im9.com,国内媒体"
  - "DOMAIN-SUFFIX,smtcdns.net,国内媒体"
  - "DOMAIN-KEYWORD,qiyi,国内媒体"
  - "DOMAIN-SUFFIX,qy.net,国内媒体"
  - "IP-CIDR,101.227.0.0/16,国内媒体,no-resolve"
  - "IP-CIDR,101.224.0.0/13,国内媒体,no-resolve"
  - "IP-CIDR,119.176.0.0/12,国内媒体,no-resolve"
  - "DOMAIN-SUFFIX,api.mob.app.letv.com,国内媒体"
  - "DOMAIN-SUFFIX,v.smtcdns.com,国内媒体"
  - "DOMAIN-SUFFIX,vv.video.qq.com,国内媒体"
  - "IP-CIDR,106.11.0.0/16,国内媒体,no-resolve"
  - "DOMAIN-KEYWORD,aria2,国内媒体"
  - "DOMAIN-KEYWORD,xunlei,国内媒体"
  - "DOMAIN-KEYWORD,yunpan,国内媒体"
  - "DOMAIN-KEYWORD,Thunder,国内媒体"
  - "DOMAIN-KEYWORD,XLLiveUD,国内媒体"
  # 电报信息
  - "DOMAIN-SUFFIX,t.me,电报信息"
  - "DOMAIN-SUFFIX,tdesktop.com,电报信息"
  - "DOMAIN-SUFFIX,telegra.ph,电报信息"
  - "DOMAIN-SUFFIX,telegram.me,电报信息"
  - "DOMAIN-SUFFIX,telegram.org,电报信息"
  - "DOMAIN-SUFFIX,telesco.pe,电报信息"
  - "IP-CIDR,91.108.4.0/22,电报信息,no-resolve"
  - "IP-CIDR,91.108.8.0/22,电报信息,no-resolve"
  - "IP-CIDR,91.108.12.0/22,电报信息,no-resolve"
  - "IP-CIDR,91.108.16.0/22,电报信息,no-resolve"
  - "IP-CIDR,91.108.56.0/22,电报信息,no-resolve"
  - "IP-CIDR,149.154.160.0/20,电报信息,no-resolve"
  - "IP-CIDR6,2001:b28:f23d::/48,电报信息,no-resolve"
  - "IP-CIDR6,2001:b28:f23f::/48,电报信息,no-resolve"
  - "IP-CIDR6,2001:67c:4e8::/48,电报信息,no-resolve"
  # Alibaba
  - DOMAIN-KEYWORD,alibaba-inc,DIRECT
  - DOMAIN-KEYWORD,alibaba,DIRECT
  - DOMAIN-KEYWORD,alipay-inc,DIRECT
  - DOMAIN-KEYWORD,aliyuncs,DIRECT
  - DOMAIN-KEYWORD,alipay,DIRECT
  - DOMAIN-KEYWORD,taobao,DIRECT
  - DOMAIN-KEYWORD,alicdn,DIRECT
  - DOMAIN-KEYWORD,aliyun,DIRECT
  - DOMAIN-KEYWORD,9game,DIRECT
  - DOMAIN-KEYWORD,ucweb,DIRECT
  # Battle.net
  - DOMAIN-SUFFIX,blizzard.com,DIRECT
  - DOMAIN-SUFFIX,battle.net,DIRECT
  # P2P
  - DOMAIN-KEYWORD,tracker,DIRECT
  # Booking
  - DOMAIN-SUFFIX,booking.com,DIRECT
  - DOMAIN-SUFFIX,booking.cn,DIRECT
  # Misc
  # iStat Menu IP Test
  - DOMAIN,ip.bjango.com,DIRECT
  - DOMAIN-SUFFIX,biquge.com.tw,DIRECT
  - DOMAIN-SUFFIX,maoyun.tv,DIRECT
  - DOMAIN-SUFFIX,moke.com,DIRECT
  - DOMAIN-SUFFIX,test-ipv6.com,DIRECT
  - DOMAIN-SUFFIX,zimuzu.tv,DIRECT
  - DOMAIN-SUFFIX,zmzapi.com,DIRECT
  - DOMAIN-SUFFIX,zmzapi.net,DIRECT
  - DOMAIN-SUFFIX,zmzfile.com,DIRECT
  # China Apps
  - DOMAIN-SUFFIX,cn,DIRECT
  - DOMAIN-KEYWORD,-cn,DIRECT
  - DOMAIN-KEYWORD,alicdn,DIRECT
  - DOMAIN-SUFFIX,126.com,DIRECT
  - DOMAIN-SUFFIX,126.net,DIRECT
  - DOMAIN-SUFFIX,127.net,DIRECT
  - DOMAIN-SUFFIX,163.com,DIRECT
  - DOMAIN-SUFFIX,360buyimg.com,DIRECT
  - DOMAIN-SUFFIX,36kr.com,DIRECT
  - DOMAIN-SUFFIX,acfun.tv,DIRECT
  - DOMAIN-SUFFIX,air-matters.com,DIRECT
  - DOMAIN-SUFFIX,aixifan.com,DIRECT
  - DOMAIN-SUFFIX,weibo.com,DIRECT
  - DOMAIN-SUFFIX,alipayobjects.com,DIRECT
  - DOMAIN-SUFFIX,amap.com,DIRECT
  - DOMAIN-SUFFIX,autonavi.com,DIRECT
  - DOMAIN-SUFFIX,baidu.com,DIRECT
  - DOMAIN-SUFFIX,baidupcs.com,DIRECT
  - DOMAIN-SUFFIX,bdimg.com,DIRECT
  - DOMAIN-SUFFIX,bdstatic.com,DIRECT
  - DOMAIN-SUFFIX,bilibili.com,DIRECT
  - DOMAIN-SUFFIX,caiyunapp.com,DIRECT
  - DOMAIN-SUFFIX,clouddn.com,DIRECT
  - DOMAIN-SUFFIX,cnbeta.com,DIRECT
  - DOMAIN-SUFFIX,cnbetacdn.com,DIRECT
  - DOMAIN-SUFFIX,cootekservice.com,DIRECT
  - DOMAIN-SUFFIX,csdn.net,DIRECT
  - DOMAIN-SUFFIX,ctrip.com,DIRECT
  - DOMAIN-SUFFIX,dgtle.com,DIRECT
  - DOMAIN-SUFFIX,dianping.com,DIRECT
  - DOMAIN-SUFFIX,douban.com,DIRECT
  - DOMAIN-SUFFIX,doubanio.com,DIRECT
  - DOMAIN-SUFFIX,duokan.com,DIRECT
  - DOMAIN-SUFFIX,easou.com,DIRECT
  - DOMAIN-SUFFIX,ele.me,DIRECT
  - DOMAIN-SUFFIX,fast.com,DIRECT
  - DOMAIN-SUFFIX,feng.com,DIRECT
  - DOMAIN-SUFFIX,fir.im,DIRECT
  - DOMAIN-SUFFIX,frdic.com,DIRECT
  - DOMAIN-SUFFIX,g-cores.com,DIRECT
  - DOMAIN-SUFFIX,godic.net,DIRECT
  - DOMAIN-SUFFIX,gtimg.com,DIRECT
  - DOMAIN-SUFFIX,hongxiu.com,DIRECT
  - DOMAIN-SUFFIX,hxcdn.net,DIRECT
  - DOMAIN-SUFFIX,iciba.com,DIRECT
  - DOMAIN-SUFFIX,ifeng.com,DIRECT
  - DOMAIN-SUFFIX,ifengimg.com,DIRECT
  - DOMAIN-SUFFIX,images-amazon.com,DIRECT
  - DOMAIN-SUFFIX,ipip.net,DIRECT
  - DOMAIN-SUFFIX,iqiyi.com,DIRECT
  - DOMAIN-SUFFIX,jd.com,DIRECT
  - DOMAIN-SUFFIX,jianshu.com,DIRECT
  - DOMAIN-SUFFIX,knewone.com,DIRECT
  - DOMAIN-SUFFIX,le.com,DIRECT
  - DOMAIN-SUFFIX,lecloud.com,DIRECT
  - DOMAIN-SUFFIX,lemicp.com,DIRECT
  - DOMAIN-SUFFIX,luoo.net,DIRECT
  - DOMAIN-SUFFIX,meituan.com,DIRECT
  - DOMAIN-SUFFIX,meituan.net,DIRECT
  - DOMAIN-SUFFIX,mi.com,DIRECT
  - DOMAIN-SUFFIX,miaopai.com,DIRECT
  - DOMAIN-SUFFIX,miui.com,DIRECT
  - DOMAIN-SUFFIX,miwifi.com,DIRECT
  - DOMAIN-SUFFIX,mob.com,DIRECT
  - DOMAIN-SUFFIX,netease.com,DIRECT
  - DOMAIN-SUFFIX,oschina.net,DIRECT
  - DOMAIN-SUFFIX,ppsimg.com,DIRECT
  - DOMAIN-SUFFIX,pstatp.com,DIRECT
  - DOMAIN-SUFFIX,qcloud.com,DIRECT
  - DOMAIN-SUFFIX,qdaily.com,DIRECT
  - DOMAIN-SUFFIX,qdmm.com,DIRECT
  - DOMAIN-SUFFIX,qhimg.com,DIRECT
  - DOMAIN-SUFFIX,qidian.com,DIRECT
  - DOMAIN-SUFFIX,qihucdn.com,DIRECT
  - DOMAIN-SUFFIX,qiniu.com,DIRECT
  - DOMAIN-SUFFIX,qiniucdn.com,DIRECT
  - DOMAIN-SUFFIX,qiyipic.com,DIRECT
  - DOMAIN-SUFFIX,qq.com,DIRECT
  - DOMAIN-SUFFIX,qqurl.com,DIRECT
  - DOMAIN-SUFFIX,rarbg.is,DIRECT
  - DOMAIN-SUFFIX,rr.tv,DIRECT
  - DOMAIN-SUFFIX,ruguoapp.com,DIRECT
  - DOMAIN-SUFFIX,segmentfault.com,DIRECT
  - DOMAIN-SUFFIX,sinaapp.com,DIRECT
  - DOMAIN-SUFFIX,sogou.com,DIRECT
  - DOMAIN-SUFFIX,sogoucdn.com,DIRECT
  - DOMAIN-SUFFIX,sohu.com,DIRECT
  - DOMAIN-SUFFIX,soku.com,DIRECT
  - DOMAIN-SUFFIX,speedtest.net,DIRECT
  - DOMAIN-SUFFIX,sspai.com,DIRECT
  - DOMAIN-SUFFIX,suning.com,DIRECT
  - DOMAIN-SUFFIX,tenpay.com,DIRECT
  - DOMAIN-SUFFIX,tmall.com,DIRECT
  - DOMAIN-SUFFIX,tudou.com,DIRECT
  - DOMAIN-SUFFIX,umetrip.com,DIRECT
  - DOMAIN-SUFFIX,upaiyun.com,DIRECT
  - DOMAIN,update.microsoft.com,DIRECT
  - DOMAIN-SUFFIX,upyun.com,DIRECT
  - DOMAIN-SUFFIX,veryzhun.com,DIRECT
  - DOMAIN-SUFFIX,weibo.com,DIRECT
  - DOMAIN-SUFFIX,xiami.com,DIRECT
  - DOMAIN-SUFFIX,xiami.net,DIRECT
  - DOMAIN-SUFFIX,xiaomicp.com,DIRECT
  - DOMAIN-SUFFIX,ximalaya.com,DIRECT
  - DOMAIN-SUFFIX,xmcdn.com,DIRECT
  - DOMAIN-SUFFIX,xunlei.com,DIRECT
  - DOMAIN-SUFFIX,yhd.com,DIRECT
  - DOMAIN-SUFFIX,yihaodianimg.com,DIRECT
  - DOMAIN-SUFFIX,yinxiang.com,DIRECT
  - DOMAIN-SUFFIX,ykimg.com,DIRECT
  - DOMAIN-SUFFIX,youdao.com,DIRECT
  - DOMAIN-SUFFIX,youku.com,DIRECT
  - DOMAIN-SUFFIX,zealer.com,DIRECT
  - DOMAIN-SUFFIX,zhihu.com,DIRECT
  - DOMAIN-SUFFIX,zhimg.com,DIRECT
  - DOMAIN-SUFFIX,chinacloudapi.cn,DIRECT
  - DOMAIN-SUFFIX,mymm.com,DIRECT
  - DOMAIN-SUFFIX,akadns.net,DIRECT
  # LAN
  - DOMAIN-SUFFIX,local,DIRECT
  - IP-CIDR,127.0.0.0/8,DIRECT
  - IP-CIDR,172.16.0.0/12,DIRECT
  - IP-CIDR,192.168.0.0/16,DIRECT
  - IP-CIDR,10.0.0.0/8,DIRECT
  - IP-CIDR,17.0.0.0/8,DIRECT
  - IP-CIDR,100.64.0.0/10,DIRECT
  # Final
  - GEOIP,CN,DIRECT
  - "MATCH,Proxy"
secret: Huawei@123
redir-port: 7892
external-ui: /opt/app/clash/clash_webs/
dns:
  enable: true
  ipv6: false
  listen: 0.0.0.0:8053
  enhanced-mode: redir-host
  nameserver:
    - 202.106.46.151
    - 202.106.195.68
    - 223.5.5.5
  fallback:
    - tcp://8.8.8.8:53
    - tcp://8.8.4.4:53
    - tcp://208.67.222.222:443
    - tcp://208.67.220.220:443
    - https://dns.google/dns-query
    - https://1.1.1.1/dns-query
  fallback-filter:
    geoip: true
    ipcidr:
      - 240.0.0.0/4
    domain:
      - '+.google.com'
      - '+.youtube.com'
      - '+.appspot.com'
      - '+.telegram.com'
      - '+.facebook.com'
      - '+.twitter.com'
      - '+.blogger.com'
      - '+.gmail.com'
      - '+.gvt1.com'
