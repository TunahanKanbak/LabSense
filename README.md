# LabSense
LabSense yazılımı, laboratuvar müşterilerinin deney talebi yapabileceği, daha sonra bu taleplere ait sonuçları sorgulayabileceği ve laboratuvarın açılan taleplere ait deney sonuçlarını girebileceği bir veritabanı ara yüzüdür.
## Gerekli Yazılımlar ve Kütüphaneler
Bu dizinde yer alan LabSense yazılımı paketlenmiş bir executable değildir. Dolayısıyla, projenin lokal bilgisayarda python yorumlayıcısı ile çalıştırılması gerekmektedir. Online platforma geçiş için yazılım daha sonra "Heroku" platformuna aktarılmalıdır.

LabSense yazılımının sistemde çalışabilmesi için aşağıdaki yazılımlar ***kullanılabilir***:

 - Python 3.9 ve üzeri yorumlayıcısı (Kodu çalıştırmak için)
 - WAMP Server (Veritabanı servisleri için)

LabSense yazılımının sistemde çalışabilmesi için aşağıdaki python kütüphaneleri ***kullanılmalıdır***:

 - Dash
 - Plotly
 - Dash_bootstrap_components
 - Dash_mantime_components
 - Numpy
 - Pandas
 - Datetime
 - mysql.connector
## Programın Kullanımı
LabSense yazılımını python yorumlayıcısı ile çalıştırmadan önce WAMP Server aracılığı ile *database/* dizininde yer alan l*absense.sql* dump dosyası okunarak veritabanı lokal servera yüklenir.

Daha sonra python yorumlayıcısı (veya herhangi bir IDE aracılığı ile) ana dizinde yer alan ***main.py*** çalıştırılır. 

Python yorumlayıcısı hatasız bir şekilde kodu okuduğu takdirde uygulamanın ayağa kaldırıldığı lokal server adresini kullanıcıya döner. Bu adrese tıklandığında varsayılan tarayıcıdan uygulamaya erişilmiş olunur.
