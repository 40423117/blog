<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo: http://leoeditor.com/leo_toc.html -->
<?xml-stylesheet ekr_test ?>
<leo_file xmlns:leo="http://leoeditor.com/namespaces/leo-python-editor/1.1" >
<leo_header file_format="2" tnodes="0" max_tnode_index="0" clone_windows="0"/>
<globals body_outline_ratio="0.5" body_secondary_ratio="0.5">
	<global_window_position top="50" left="50" height="500" width="700"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="amd.20160329124757.1"><vh>跳出 users 目錄</vh></v>
<v t="amd.20160329124554.2" a="E"><vh>@path ./../</vh>
<v t="amd.20160329164739.1" a="E"><vh>假如要送到 gh-pages 分支, 使用下列按鈕</vh>
<v t="amd.20160329164739.2"><vh>@button gh-pages pelican</vh></v>
</v>
<v t="leo.20160408095026.1" a="E"><vh>wordpress</vh>
<v t="leo.20160408095046.1"><vh>@button new-to-wp</vh></v>
<v t="leo.20160408095101.1"><vh>@button edit-to-wp </vh></v>
<v t="leo.20160408095102.1"><vh>@button get-from-wp</vh></v>
</v>
<v t="amd.20160329163719.1"><vh>假如要在近端檢視, 使用下列按鈕</vh>
<v t="amd.20160329163719.2"><vh>@button local pelican</vh></v>
</v>
<v t="amd.20160329162138.1" a="E"><vh>設定檔案</vh>
<v t="leo.20160401105240.1"><vh>共用檔案</vh></v>
<v t="leo.20160401105034.1"><vh>@edit pelicanconf.py</vh></v>
<v t="leo.20160401105245.1"><vh>遠端專用</vh></v>
<v t="leo.20160401105035.1"><vh>@edit publishconf.py</vh></v>
<v t="leo.20160401105246.1"><vh>近端專用</vh></v>
<v t="leo.20160401105037.1"><vh>@edit local_publishconf.py</vh></v>
</v>
<v t="amd.20160329124921.1"><vh>@edit index.html</vh></v>
<v t="amd.20160329124849.1"><vh>進入 content 目錄</vh></v>
<v t="amd.20160329124903.1" a="E"><vh>@path content</vh>
<v t="leo.20160401114622.1"><vh>@clean admin-20160401.md</vh>
<v t="leo.20160425224655.1"><vh>11</vh></v>
</v>
<v t="leo.20160429014510.1"><vh>@clean admin-20160429.md</vh>
<v t="leo.20160429022139.1"><vh>19</vh></v>
</v>
<v t="leo.20160429023401.1"><vh>@clean admin-20160428.md</vh>
<v t="leo.20160429033202.1"><vh>22</vh></v>
</v>
<v t="leo.20160429031908.1"><vh>@clean admin-20160427.md</vh>
<v t="leo.20160429033206.1"><vh>24</vh></v>
</v>
<v t="leo.20160429033514.1" a="E"><vh>@clean admin-20160426.md</vh>
<v t="leo.20160429040741.1"><vh>27</vh></v>
</v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="amd.20160329124554.2"></t>
<t tx="amd.20160329124757.1"></t>
<t tx="amd.20160329124849.1"></t>
<t tx="amd.20160329124903.1"></t>
<t tx="amd.20160329162138.1"></t>
<t tx="amd.20160329163719.1"></t>
<t tx="amd.20160329163719.2">@language python
import os
#os.system("pelican content -o output -s local_publishconf.py -t theme/pelican-bootstrap3")
os.system("pelican content -o post -s local_publishconf.py")
g.es("admin pelican 近端執行完畢")


</t>
<t tx="amd.20160329164739.1"></t>
<t tx="amd.20160329164739.2">@language python
import os
os.system("pelican content -o post -s publishconf.py")
g.es("admin pelican 執行完畢")

</t>
<t tx="leo.20160401105240.1"></t>
<t tx="leo.20160401105245.1"></t>
<t tx="leo.20160401105246.1"></t>
<t tx="leo.20160401114622.1">@language md
Title: admin-網際內容管理
Category: 規劃
Tags: CADLAB, Ｍanual, MCAD
Author: 40423117
@others
個人網際內容管理

&lt;!-- PELICAN_END_SUMMARY --&gt;

&lt;a href="https://cms-mde40423117.rhcloud.com/"&gt;CMSimply 內容管理系統&lt;/a&gt;

&lt;a href="http://40423117.github.io/blog/post/index.html"&gt;Pelican 靜態網址&lt;/a&gt;

&lt;a href="http://wp-mde40423117.rhcloud.com"&gt;WordPress 動態網誌&lt;/a&gt;
</t>
<t tx="leo.20160408095026.1"></t>
<t tx="leo.20160408095046.1">@language python
#new-to-wp button
#coding: utf-8
import xmlrpc.client
import datetime
import os
 
def get_cat_tag_content(data):
    # 請注意, 因為 data 來自 .md 的 body pan 內容, 第1行為 @language python
    # 用跳行符號分割
    data_list = data.split("\n")
    #第2行為 title
    title= data_list[1]
    #第3行為 category
    category = data_list[2]
    #第4行為 tags
    tags = data_list[3]
    # 有多項資料的 content 型別為數列
    # 再將第7行之後的資料數列串回成以跳行隔開的資料
    content = "\n".join(data_list[6:])
    # 先將截斷摘要與內文的 pelican md 檔按符號, 換成 Wordpress 的 &lt;!---more---&gt;
    content = content.replace('&lt;!-- PELICAN_END_SUMMARY --&gt;', '&lt;!--more--&gt;')
    # 接著若內容有 ~~~python 與 ~~~ 則換成 Wordpress 格式
    content = content.replace('~~~python', '[code lang="python"]')
    content = content.replace('~~~', '[/code]')
    return title, category, tags, content
 
os.environ['TZ'] = 'Asia/Taipei'
 
#################################
filepath = "y:/tmp/password.txt"
wordpress = "wp-mde40423117.rhcloud.com"
fo = open(filepath, "r+")
data = []
for line in fo.readlines():
    data.append(line)
fo.close()
 
# 從網誌節點的 parent().h 取得 wp_url
# 從網誌節點的 parent().b 取得帳號與密碼對應的文字檔案路徑
wp_url = "https://"+wordpress+"/xmlrpc.php"
wp_username = data[0]
wp_password = data[1]
#################################
wp_blogid = "0"
 
status_draft = 0
status_published = 1
 
server = xmlrpc.client.ServerProxy(wp_url)
 
# 從目前所在節點的 body pan 中取出類別, tags 以及文章內容
title_str, category_str, tags_str, content = get_cat_tag_content(p.b)
# title 是一個單獨的字串
title = title_str.split(":")[1]
# 指定時間出版
'''
date_created = xmlrpc.client.DateTime(datetime.datetime.strptime("2013-01-01 00:00",
"%Y-%m-%d %H:%M"))
'''
# 以現在時間出版, 考慮與 Server 時間差八個小時 (480 分鐘), 因此要在 8 個小時前發表
date_created = xmlrpc.client.DateTime(datetime.datetime.strptime((datetime.datetime.now()- \
datetime.timedelta(minutes=480)).strftime('%Y-%m-%d %H:%M'),"%Y-%m-%d %H:%M"))
categories = [category_str.split(":")[1]]
# 請注意, 因為 tags 用逗點隔開, 因此必須透過 split() 再分開成為 list 資料
# 先用 : 斷開標投頭的 Tags:, 然後再透過逗點隔開, 將標註轉為數列資料
tags = tags_str.split(":")[1].split(",")
data = {'title': title, 'description': content, 'dateCreated': date_created, 'categories': categories, 'mt_keywords': tags}
 
post_id = server.metaWeblog.newPost(wp_blogid, wp_username, wp_password, data, status_published)
# 利用最後的 child 節點來儲存 post_id
to_save_post_id = p.insertAsLastChild()   
# 改為內文為空的節點, id 直接標在 head 標題 
to_save_post_id.b = ""
to_save_post_id.h = post_id
# 因為新增節點, commander 必須 redraw
c.redraw() 
 
g.es("post_id 為", post_id)
g.es("已經送出資料!")</t>
<t tx="leo.20160408095101.1">@language python
#edit-to-wp
#coding: utf-8
import xmlrpc.client
import datetime
import os
 
def get_cat_tag_content(data):
    # 請注意, 因為 data 來自 .md 的 body pan 內容, 第1行為 @language python
    # 用跳行符號分割
    data_list = data.split("\n")
    #第2行為 title
    title= data_list[1]
    #第3行為 category
    category = data_list[2]
    #第4行為 tags
    tags = data_list[3]
    # 有多項資料的 content 型別為數列
    # 再將第7行之後的資料數列串回成以跳行隔開的資料
    content = "\n".join(data_list[6:])
    # 先將截斷摘要與內文的 pelican md 檔按符號, 換成 Wordpress 的 &lt;!---more---&gt;
    content = content.replace('&lt;!-- PELICAN_END_SUMMARY --&gt;', '&lt;!--more--&gt;')
    # 接著若內容有 ~~~python 與 ~~~ 則換成 Wordpress 格式
    content = content.replace('~~~python', '[code lang="python"]')
    content = content.replace('~~~', '[/code]')
    return title, category, tags, content
 
os.environ['TZ'] = 'Asia/Taipei'
 
#################################
filepath = "y:/tmp/password.txt"
wordpress = "wp-mde40423117.rhcloud.com"
fo = open(filepath, "r+")
data = []
for line in fo.readlines():
    data.append(line)
fo.close()
 
wp_url = "https://"+wordpress+"/xmlrpc.php"
wp_username = data[0]
wp_password = data[1]
#################################
wp_blogid = "0"
 
status_draft = 0
status_published = 1
 
server = xmlrpc.client.ServerProxy(wp_url)
 
# 從目前所在節點的 body pan 中取出類別, tags 以及文章內容
title_str, category_str, tags_str, content = get_cat_tag_content(p.b)
# title 是一個單獨的字串
title = title_str.split(":")[1]
# 指定時間出版
'''
date_created = xmlrpc.client.DateTime(datetime.datetime.strptime("2013-01-01 00:00",
"%Y-%m-%d %H:%M"))
'''
# 以現在時間出版, 考慮與 Server 時間差八個小時 (480 分鐘), 因此要在 8 個小時前發表
date_created = xmlrpc.client.DateTime(datetime.datetime.strptime((datetime.datetime.now()- \
datetime.timedelta(minutes=480)).strftime('%Y-%m-%d %H:%M'),"%Y-%m-%d %H:%M"))
categories = [category_str.split(":")[1]]
# 請注意, 因為 tags 用逗點隔開, 因此必須透過 split() 再分開成為 list 資料
tags = tags_str.split(":")[1].split(",")
data = {'title': title, 'description': content, 'dateCreated': date_created, 'categories': categories, 'mt_keywords': tags}
 
# 設法取得原 post 的 id
origin_post = p.getLastChild()
# 直接從標題取得 post 的 id 號碼
post_id = origin_post.h
status = server.metaWeblog.editPost(post_id, wp_username, wp_password, data, status_published)
 
if status:
    g.es("資料已經更新!")
else:
    g.es("有問題, 資料沒有更新!")</t>
<t tx="leo.20160408095102.1">@language python
#get-from-wp
#coding: utf-8
import xmlrpc.client
# 導入 html 模組, 使用 html.unescape 轉換 html 特殊符號
import html
 
#################################
filepath = "y:/tmp/password.txt"
wordpress = "wp-mde40423117.rhcloud.com"
fo = open(filepath, "r+")
data = []
for line in fo.readlines():
    data.append(line)
fo.close()
 
# 從網誌節點的 parent().h 取得 wp_url
# 從網誌節點的 parent().b 取得帳號與密碼對應的文字檔案路徑
wp_url = "https://"+wordpress+"/xmlrpc.php"
wp_username = data[0]
wp_password = data[1]
#################################
 
server = xmlrpc.client.ServerProxy(wp_url)
 
# 設法透過上述網誌網址, 帳號與密碼, 以及文章 id, 取回 categories, tags, 文章標題, 文章內容等資
 
# 從最後的 child 節點來取 post_id
origin_post = p.getLastChild()
post_id = origin_post.h
# 取回與 post_id 對應的網誌文章內容
blog_content = server.metaWeblog.getPost(post_id, wp_username, wp_password)
title = blog_content["title"]
# 這裡要利用 html.unescape 轉回特殊符號
description = html.unescape(blog_content["description"])
mt_text_more = html.unescape(blog_content["mt_text_more"])
if mt_text_more != "":
    post_content = description + "\n&lt;!--more--&gt;\n"+mt_text_more
else:
    post_content = description
# 所取回的 categories 為 list
categories = blog_content["categories"]
# 所取回的 tags 為以逗點隔開的字串
mt_keywords = blog_content["mt_keywords"]
# 取回文章作者
author = blog_content["wp_author_display_name"]
p.h = title
categories_str = ""
for category in categories:
    # 假如不是最後一個
    if category != categories[len(categories)-1]:
        categories_str += category + ", "
    else:
        # 這是最後一個
        categories_str += category
line1 = "@language md\n"
line2 = "Title: " +title + "\n"
line3 = "Category: " + categories_str + "\n"
line4 = "Tags: " + mt_keywords + "\n"
line5 = "Author: " + author + "\n@others\n"
post_content = post_content.replace('&lt;!--more--&gt;', '\n&lt;!-- PELICAN_END_SUMMARY --&gt;\n')
post_content = post_content.replace('[code lang="python"]', '~~~python')
post_content = post_content.replace('[/code]', '~~~')
p.b = line1 + line2 + line3 + line4 + line5 + post_content + "\n"
# 因為節點資料更新, commander 必須 redraw
c.redraw() 
g.es("資料已經取回")</t>
<t tx="leo.20160425224655.1"></t>
<t tx="leo.20160429014510.1">@language md
Title: admin-Pelican與WordPress同步設定
Category: 規劃
Tags: CADLAB, Ｍanual, MCAD
Author: 40423117
@others
Pelican與WordPress同步設定

&lt;!-- PELICAN_END_SUMMARY --&gt;

    #輸入你帳號密碼儲存的地方
    filepath = "y:/tmp/password.txt"
    #輸入你wordpress的網址
    wordpress = "wp-mde40423117.rhcloud.com"
    
再申請一隻WordPress帳號，角色設定為：編輯(Editor)

&lt;img src="http://40423117.github.io/blog_data/images/editor.PNG" width="600" alt="WordPress帳號設定"&gt;&lt;/img&gt;

    #password.txt 輸入格式為以下
    帳號
    密碼

同步WordPress時候，要點的是文章.MarkDown 而不是點@Button new-to-wp

&lt;iframe src="https://player.vimeo.com/video/164606701" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen&gt;&lt;/iframe&gt;
&lt;p&gt;&lt;a href="https://vimeo.com/164606701"&gt;pelican&amp;amp;wordpress&lt;/a&gt; from &lt;a href="https://vimeo.com/user44960495"&gt;40423117&lt;/a&gt; on &lt;a href="https://vimeo.com"&gt;Vimeo&lt;/a&gt;.&lt;/p&gt;</t>
<t tx="leo.20160429022139.1"></t>
<t tx="leo.20160429023401.1">@language md
Title: admin-畫出系上網路配置圖
Category: 規劃
Tags: CADLAB, Ｍanual, MCAD
Author: 40423117
@others
使用Python3+nwdiag畫出網路配置圖

&lt;!-- PELICAN_END_SUMMARY --&gt;

系上網路配置
------------
&lt;img src="http://40423117.github.io/blog_data/images/inter1.jpg" width="600"&gt;&lt;/img&gt;
&lt;img src="http://40423117.github.io/blog_data/images/inter2.jpg" width="600"&gt;&lt;/img&gt;
&lt;img src="http://40423117.github.io/blog_data/images/inter3.jpg" width="600"&gt;&lt;/img&gt;

畫出網路配置圖
------------
使用 Python3 與 [http://blockdiag.com/en/](http://blockdiag.com/en/){:target="_blank"}中的 nwdiag 工具繪製機械設計工程系的網路配置圖.

    #安裝 blockdiag 模組
    pip install blockdiag
    
&lt;img src="http://40423117.github.io/blog_data/images/blockdiag.PNG" width="250" alt="blockdiag 安裝"&gt;&lt;/img&gt;

    #安裝 nwdiag 模組
    pip install nwdiag

&lt;img src="http://40423117.github.io/blog_data/images/nwdiag.png" width="250" alt="nwdiag 安裝"&gt;&lt;/img&gt;

到SciTE下貼上以下程式碼

~~~python
nwdiag {
    default_fontsize = 15;
    校主幹 [shape = cloud];
    校主幹 -- 系路由器;
 
    network 系主幹{
        address = "140.130.17.0/24";
        系路由器 [address="140.130.17.254"];
        雲端點名網路;
        八樓集線器 [address="140.130.17.82"];
        七樓集線器;
        六樓集線器;
        系伺服器群;
    }
 
    network 八樓主幹{
        address="17.10-82"
        八樓集線器 [address="140.130.17.82"];
        老師1伺服器群 [address="140.130.17.10-15"];
        老師2伺服器群 [address="140.130.17.16-25"];
        老師3伺服器群 [address="140.130.17.26-60"];
    }
 
    network CAD_CAE{
        address="17.83";
        八樓集線器 [address="140.130.17.82"];
        CAD_NAT [address="140.130.17.82"];
        CAE_NAT [address="140.130.17.83"];
    }
 
    network 電腦輔助設計室{
        address="192.168.1.0/24";
        CAD_NAT [address="192.168.1.1"];
        CAD1 [address=".2"];
        CAD2;
        CAD64 [address=".100"];
    }
 
    network 電腦輔助繪圖室{
        address="192.168.1.0/24";
        CAE_NAT [address="192.168.1.1"];
        CAE1 [address=".2"];
        CAE2;
        CAE64 [address=".100"];
    }
 
    network 七樓主幹{
        address="140.130.17.83-90"
        七樓集線器;
        老師4伺服器群 [address="140.130.17.61-63"];
        老師5伺服器群 [address="140.130.17.64-70"];
        老師6伺服器群 [address="140.130.17.71-75"];
    }
 
    network 六樓主幹{
        address="140.130.17.91-100"
        六樓集線器;
        老師7伺服器群 [address="140.130.17.76-78"];
        老師8伺服器群 [address="140.130.17.79-80"];
        老師9伺服器群 [address="140.130.17.81-95"];
    }
}
~~~

根據
~~~python
Execute nwdiag command:
$ nwdiag simple.diag
$ ls simple.png
simple.png
~~~
將上述程式碼儲存為 .diag檔後，
假設路徑在 y:\tmp 底下則輸入 
~~~python
nwdiag y:\tmp\simple.diag
~~~

&lt;img src="http://40423117.github.io/blog_data/images/diag.png" width="250" alt="diag png"&gt;&lt;/img&gt;

在該路徑底下就會有 simple 圖檔(.png)可以使用

&lt;img src="http://40423117.github.io/blog_data/images/cadlab.png" width="800" alt="cadlab png"&gt;&lt;/img&gt;
    </t>
<t tx="leo.20160429031908.1">@language md
Title: admin-網路線製作流程紀錄
Category: 規劃
Tags: CADLAB, Ｍanual, MCAD
Author: 40423117
@others
一條 568b 網路線及一條跳線

&lt;!-- PELICAN_END_SUMMARY --&gt;

網路線接法
------------
EIA/TIA 568B 的標準雙絞線 (兩端採相同色線排列) 
腳位：接頭朝前, 耳朵朝下 
接法：先排出橘、藍、綠、棕，白線排在前，排好後，藍白與綠白對調
顏色：橘白-橘-綠白-藍-藍白-綠-棕白-棕

跳線接法
------------
Cross Over (EIA/TIA 568B) 線 
(一端採標準 EIA/TIA 568B 色線排列, 另一端則將綠線與橘線對調) 
腳位：接頭朝前, 耳朵朝下 
顏色：綠白-綠-橘白-藍-藍白-橘-棕白-棕 (即將上面正常線的橘線與綠線對調)

網路線示範圖示
------------
先排出橘、藍、綠、棕

&lt;img src="http://40423117.github.io/blog_data/images/line1.jpg" width="600"&gt;&lt;/img&gt;

把線捲開，白線排在前

&lt;img src="http://40423117.github.io/blog_data/images/line2.jpg" width="600"&gt;&lt;/img&gt;

排好後，藍白與綠白對調

&lt;img src="http://40423117.github.io/blog_data/images/line3.jpg" width="600"&gt;&lt;/img&gt;

把線拉直

&lt;img src="http://40423117.github.io/blog_data/images/line4.jpg" width="600"&gt;&lt;/img&gt;

接頭耳朵要朝下！很重要！！好像都會錯在這個地方！

&lt;img src="http://40423117.github.io/blog_data/images/line5.jpg" width="600"&gt;&lt;/img&gt;
&lt;img src="http://40423117.github.io/blog_data/images/line6.jpg" width="600"&gt;&lt;/img&gt;

現在只接了一端，還好可以從另一端在塞入保護殼！記得要放保護殼

&lt;img src="http://40423117.github.io/blog_data/images/line7.jpg" width="600"&gt;&lt;/img&gt;
&lt;img src="http://40423117.github.io/blog_data/images/line8.jpg" width="600"&gt;&lt;/img&gt;

完成囉！●▽●

&lt;img src="http://40423117.github.io/blog_data/images/line9.jpg" width="600"&gt;&lt;/img&gt;
    </t>
<t tx="leo.20160429033202.1"></t>
<t tx="leo.20160429033206.1"></t>
<t tx="leo.20160429033514.1">@language md
Title: admin-跳線測試與共用網路
Category: 規劃
Tags: CADLAB, Ｍanual, MCAD
Author: 40423117
@others
使用一條跳線，對接兩台電腦使其連線共用其中一台的網路

&lt;!-- PELICAN_END_SUMMARY --&gt;

兩台電腦對接且共用網路的方法
------------
1.先停用自己的網卡(已經連上網路的)

&lt;img src="http://40423117.github.io/blog_data/images/ccproxy1.PNG" width="600"&gt;&lt;/img&gt;

2.按下要共用網路的網卡右鍵→內容→IPv4設定以下

&lt;img src="http://40423117.github.io/blog_data/images/ccproxy2.PNG" width="600"&gt;&lt;/img&gt;

3.打開OpenDHCPServer資料夾下的 RunStandAlone.bat

&lt;img src="http://40423117.github.io/blog_data/images/ccproxy3.PNG" width="600"&gt;&lt;/img&gt;

4.到欲共用網路的電腦下，設定該台電腦的網卡，以第2步驟修改成以下

&lt;img src="http://40423117.github.io/blog_data/images/ccproxy4.PNG" width="600"&gt;&lt;/img&gt;

5.接著，到自己的電腦下，查看剛剛開啟的cmd檔，會顯示以下

&lt;img src="http://40423117.github.io/blog_data/images/ccproxy10.PNG" width="600"&gt;&lt;/img&gt;

6.啟動自己的網卡(已經連上網路的)

&lt;img src="http://40423117.github.io/blog_data/images/ccproxy5.PNG" width="600"&gt;&lt;/img&gt;

7.打開CCProxy.exe

&lt;img src="http://40423117.github.io/blog_data/images/ccproxy6.PNG" width="80"&gt;&lt;/img&gt;

8.選取"選項"

&lt;img src="http://40423117.github.io/blog_data/images/ccproxy7.PNG" width="80"&gt;&lt;/img&gt;

9.全部打勾，記下port號

&lt;img src="http://40423117.github.io/blog_data/images/ccproxy8.PNG" width="600"&gt;&lt;/img&gt;

10.到欲共用網路的電腦下，打開瀏覽器設定Proxy，IP位址為自己的IP(桌機)，Port號為剛剛記錄下來的

&lt;img src="http://40423117.github.io/blog_data/images/ccproxy9.PNG" width="800"&gt;&lt;/img&gt;

設定完成後，即可共用網路。

桌機與Raspberry pi 3 model b對接且共用網路的方法
------------

與上方的操作方式雷同。
第四步驟改成

打開Xming資料夾中的XLanch.exe→One Window
→Open session via XDMCP→打IP位址(不要跟桌機一樣)→完成

其他步驟大致上都差不多。

以下影片斟酌觀看，可以單看文字表達就可以。
&lt;iframe src="https://player.vimeo.com/video/164645697" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen&gt;&lt;/iframe&gt;
&lt;p&gt;&lt;a href="https://vimeo.com/164645697"&gt;跳線測試與共用網路&lt;/a&gt; from &lt;a href="https://vimeo.com/user44960495"&gt;40423117&lt;/a&gt; on &lt;a href="https://vimeo.com"&gt;Vimeo&lt;/a&gt;.&lt;/p&gt;</t>
<t tx="leo.20160429040741.1"></t>
</tnodes>
</leo_file>
