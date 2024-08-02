
  <img src="bootcampFiles/team/img/app.png" style="width: auto; height: 500px;" >


  # Ekip ve Proje İsmi

  ### **`EcoGuardian`**

  # Ekip ve Ürün Hakkında Bilgiler

  ## Takım Üyeleri

  <table>
    <tr>
      <th></th>
      <th>İsim</th>
      <th>Başlık</th>
      <th>İletişim</th>
    </tr>
    <tr>
      <td><img src="bootcampFiles/team/img/team1.png" width="50" height="50" /></td>
      <td>Besat Arif Çıngar</td>
      <td>Product Owner</td>
      <td>
        <a href="(https://www.linkedin.com/in/besat-%C3%A7%C4%B1ngar-a63b46279?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app)" target="_blank" ><img src="bootcampFiles/team/sc/in.png" width="20" height="20" /></a>
      </td>
    </tr>
    <tr>
      <td><img src="bootcampFiles/team/img/team2.png" width="50" height="50" /></td>
      <td>Berin Irmak Arıkboğa</td>
      <td>Scrum Master</td>
      <td>
        <a href="(https://www.linkedin.com/in/berin-irmak-arıkboğa/)" target="_blank"><img src="bootcampFiles/team/sc/in.png" width="20" height="20" /></a>
      </td>
    </tr>
    <tr>
      <td><img src="bootcampFiles/team/img/team3.png" width="50" height="50" /></td>
      <td>Berivan Dağcı</td>
      <td>Developer</td>
      <td>
        <a href="(https://www.linkedin.com/in/berivan-da%C4%9Fc%C4%B1-9993a7223?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app)" target="_blank"><img src="bootcampFiles/team/sc/in.png" width="20" height="20" /></a>
      </td>
    </tr>
    <tr>
      <td><img src="bootcampFiles/team/img/team4.png" width="50" height="50" /></td>
      <td>Bilal Enes Söylemez</td>
      <td>Developer</td>
      <td>
        <a href="#" target="_blank"><img src="bootcampFiles/team/sc/in.png" width="20" height="20" /></a>
      </td>
    </tr>
    <tr>
      <td><img src="bootcampFiles/team/img/team5.png" width="50" height="50" /></td>
      <td>Azra Ece Güney</td>
      <td>Developer</td>
      <td>
       <a href="(https://www.linkedin.com/in/azraeceg%C3%BCney?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app)" target="_blank"><img src="bootcampFiles/team/sc/in.png" width="20" height="20" /></a>
      </td>
    </tr>
   
  </table>


<h1>Proje Tanıtımı ve İşleyişi</h1>
<details>
    <summary><h3>•	Giriş</h3></summary>



İlk proje için belirli bir alan gerekli. Bunun için büyük bir alan yerine küçük bir alandan başlamak ve ardından büyüyen ağaç mantığında ilerlemek istedik. Bildiğiniz gibi, AVL ağaç mantığında üstsel bir yapı düşündük. Projemizi yaparken ilk olarak sorunları tespit etmemiz gerekti. Günümüz sorunlarından bazıları şunlardır:

-	Sağlıksız gıda
-	Ürünlerin kuraklıktan zarar görmesi ve yok olması
-	Bozulan dünya ikliminde oluşan aşırı sıcaklık ve kuraklık
-	Bilinçsiz davranışlar nedeniyle (çevreyi kirletme, yangınlar) bitkilerin zarar görmesi

Bu sorunlara ek olarak Bilgisiz veya kontrolsüz yapılan yetiştirmeleri ekleyebiliriz. Projemiz nedir ve işleyişi...
</details>

<details>
    <summary><h3>•	Proje İşleyişi</h3></summary>



Projemizde ilk olarak bir bitkinin olduğunu varsayalım. Şimdi asıl soruya geçelim: Bu bitkinin sağlıklı kalmasını nasıl sağlayabiliriz?

<h3>1.	Adım: Sensör Kullanımı</h3>
Sensörler ortamın ve toprağın durumunu analiz edebilir. Bu analizler sayesinde bitkinin ihtiyaçlarını belirlemek mümkündür.

<h3>2.	Adım: Analiz ve Algoritmalar</h3>
Sensörlerden gelen verilerin bir sonuca varması gereklidir. Geliştirdiğimiz algoritmalar ve grafikler sayesinde bilgilendirmeler yapabilir ve erken önlemler alabiliriz. Örneğin, toprak kuruluğu belirli bir seviyenin altına düşerse, otomatik olarak devreye giren sulama sistemi gibi. Erken uyarı kullanıcıya bildirilir ve kullanıcı buna karşın önlem alır.

<h3>3.	Adım: Uygulama Geliştirme</h3>
Bir uygulamaya ihtiyacımız var. Bu nedenle Flutter kullanarak bir uygulama yazıyoruz. Ancak, sensörlerden ölçülen verileri Flutter uygulamasında nasıl kontrol edebiliriz? İşte burada veri tabanı devreye girer. Arduino kısmında WiFi kartlı bir sistem kullanarak verileri veri tabanına yollayabiliriz. Bu noktada ESP8266 kullanabiliriz. ESP8266, uzaktan kontrollü sistemler için kullanılan, WiFi bağlanabilen ve internet üzerinden veri yollayabilen bir modüldür.

<h3>4.	Adım: Verilerin İşlenmesi</h3>
ESP8266 devresi almak, Arduino kısmında Firebase ve sensörler ile ilgili kütüphaneleri yüklemek ve verileri Firebase veri tabanına yollamak gereklidir. Verileri Firebase'den çekerek Flutter uygulamamızda işleyebiliriz. Ardından, Flutter uygulamasından veri tabanına veri yollayarak ESP8266 ile bu verileri çekip işlemler yapabiliriz (örneğin su dökme, ışık kontrolleri gibi).

<h3>5.	Adım: Algoritma ve Yapay Zeka Kullanımı</h3>
Kullanıcıya özgü işlemler yapmak için algoritmalar oluşturmak gereklidir. Birkaç analiz için algoritmalar oluşturduk fakat analiz için yapay zekayı da dahil ettik. Yapay zeka, verilerin analizi ve tavsiyeler için kullanılacaktır. Ayrıca, hava durumu sistemini de entegre ederek bulunduğu yerin hava durumunu analiz edip erken uyarılar verebiliriz.
</details>

<details>
    <summary><h3>•	Özet</h3></summary>

<h3>Bu proje,</h3> sensörler, veri tabanları, yapay zeka ve hava durumu sistemleri gibi farklı teknolojileri bir araya getirerek bitkilerin sağlıklı kalmasını sağlamayı hedeflemektedir.
<br>
Bu proje, sadece ekinler için değil, bahçemizdeki küçük bir alan veya evdeki saksılar için de kullanılabilir. Bu sayede her alanda uygulama imkanı sunmaktadır.

Hedef kitle bu sayede belirlenmiş olur.
</details>





  --- 

  <img src="bootcampFiles/team/sc/sprint.png" style="width: auto; height: 400px; text-align: center; border-radius: 50%;" >




  <details>
    <summary><h1>Sprint 1</h1></summary>


  <details>
    <summary><h3>Sprint 1 - Malzemeler</h3></summary>
  <table style="width: 100%;">
    <tr>
      <td colspan="4" style="text-align: center;"><h2>ESP8266 WiFi bağlantısı sağlayan, mikrodenetleyici içeren ve geniş bir IoT uygulama yelpazesinde kullanılabilen bir entegre devredir. Bizlerde bu amaçla kullanacağız.</h2></td>
    </tr>
    <tr>
      <td style="width: 25%;"><img src="bootcampFiles/sprint_1/urun1.jpg" style="max-width: 100%; height: auto;"></td>
    </tr>
    <tr>
      <td colspan="4" style="text-align: center;"><h2>Bu sensörler ve daha pek çokları, ESP8266 platformu üzerinde çalışacak şekilde entegre edilebilir. Sensör verilerini ESP8266 üzerinde işleyerek, internete gönderebilir veya yerel ağ üzerinde diğer cihazlarla paylaşabilirsiniz. Bu da ESP8266'nın geniş bir uygulama yelpazesi ve esneklik sağlayan önemli bir özelliğidir. Bizim şuanlık aklımızdaki sensörler bunlar. 3 sensörüde denedik çalışıyor Fakat Fakat 3 sensor yerine 2 kullanmanın daha mantıklı olacağını düşünüyoruz. hangisi ile ilerleyebiliriz toplantılarımızdan sonra karar vereceğiz.</h2></td>
    </tr>
    <tr>
      <td style="width: 25%;"><img src="bootcampFiles/sprint_1/urun2.jpg" style="max-width: 100%; height: auto;"></td>
      <td style="width: 25%;"><img src="bootcampFiles/sprint_1/urun3.jpg" style="max-width: 100%; height: auto;"></td>
      <td style="width: 25%;"><img src="bootcampFiles/sprint_1/urun4.jpg" style="max-width: 100%; height: auto;"></td>
    </tr>
    <tr>
      <td colspan="4" style="text-align: center;"><h2>Örnek Olarak Diğer Malzemler</h2></td>
    </tr>
    <tr>
      <td style="width: 25%;"><img src="bootcampFiles/sprint_1/urun5.jpg" style="max-width: 100%; height: auto;"></td>
      <td style="width: 25%;"><img src="bootcampFiles/sprint_1/urun6.jpg" style="max-width: 100%; height: auto;"></td>
    </tr>
 
  </table>
   
 </details> 

<!--  uygulama için altı -->


  <details>
    <summary><h3>Sprint 1 - Arduino ve Uygulama İçinden Görseller</h3></summary>
  <table style="width: 100%;">
    <tr>
      <td colspan="4" style="text-align: center;"><h2>Sıcaklık ve Nem Verisinin Arduino (esp8266) ile firebase veri yollama kısmı</h2></td>
    </tr>
    <tr>
      <td style="width: 25%;">
        
  ![image](https://github.com/AstroBesat-SoftW/BootCamp_Grup_6/assets/128177174/4f0d6920-4a85-40bb-9ead-8375f074329c)
</td>
    </tr>
    <tr>
      <td colspan="4" style="text-align: center;"><h2>Sensor ölçümlerini kod içinde kullanımı ve ayarlanması.</h2></td>
    </tr>
    <tr>
      <td style="width: 25%;">
        
  ![image](https://github.com/AstroBesat-SoftW/BootCamp_Grup_6/assets/128177174/497e7d83-2c3a-4ce0-a42f-49ac12f35f65)
</td>
    </tr>
       <tr>
      <td colspan="4" style="text-align: center;"><h2>Uygulama Ölçülen verilerin Değerlerini Veritabanından Çekip ekranda gösterme</h2></td>
    </tr>
    <tr>
      <td style="width: 25%;"><img src="bootcampFiles/sprint_1/app0.jpg" style="max-width: 100%; height: auto;"></td>
    </tr>
    <tr>
      <td colspan="4" style="text-align: center;"><h2>Sıcaklık ve Nem değerlerinin geçmiş takibi ve analizi</h2></td>
    </tr>
    <tr>
      <td style="width: 25%;"><img src="bootcampFiles/sprint_1/app2.jpg" style="max-width: 100%; height: auto;"></td>
        <td style="width: 25%;"><img src="bootcampFiles/sprint_1/app3.jpg" style="max-width: 100%; height: auto;"></td>
    </tr>
 <tr>
      <td colspan="4" style="text-align: center;"><h2>Kayıt Edilen Verilerin Verileri ve Grafikleri</h2></td>
    </tr>
    <tr>
      <td style="width: 25%;"><img src="bootcampFiles/sprint_1/app4.jpg" style="max-width: 100%; height: auto;"></td>
        <td style="width: 25%;"><img src="bootcampFiles/sprint_1/app5.jpg" style="max-width: 100%; height: auto;"></td>
      <td style="width: 25%;"><img src="bootcampFiles/sprint_1/app6.jpg" style="max-width: 100%; height: auto;"></td>
    </tr>
 
  </table>
   

<!-- uygulama son -->

</details>
  <details>
    <summary><h3>Sprint 1 - Sprint Panosu Güncelleme Ekran Görüntüleri</h3></summary>
    <img src="bootcampFiles/sprint_1/sprint_1.jpg" style="max-width: 100%; height: auto;">
   <img src="bootcampFiles/sprint_1/sprint_2.jpg" style="max-width: 100%; height: auto;">
    <img src="bootcampFiles/sprint_1/sprint_3.jpg" style="max-width: 100%; height: auto;">
    <img src="bootcampFiles/sprint_1/sprint_4.jpg" style="max-width: 100%; height: auto;">
    <img src="bootcampFiles/sprint_1/wp_1.png" style="max-width: 100%; height: auto;">
    <img src="bootcampFiles/sprint_1/wp_2.png" style="max-width: 100%; height: auto;">
    <img src="bootcampFiles/sprint_1/wp_3.png" style="max-width: 100%; height: auto;">
    <img src="bootcampFiles/sprint_1/wp_4.png" style="max-width: 100%; height: auto;">
    <img src="bootcampFiles/sprint_1/wp_5.png" style="max-width: 100%; height: auto;">
  </details>
  
 <details>
    <summary><h3>Sprint 1 - Devreler ve Deneme Aşamaları - Ek Görseller</h3></summary>
    <img src="bootcampFiles/sprint_1/1.jpg" style="max-width: 100%; height: auto;">
    <img src="bootcampFiles/sprint_1/2.jpg" style="max-width: 100%; height: auto;">
       <img src="bootcampFiles/sprint_1/3.jpg" style="max-width: 100%; height: auto;">
      <img src="bootcampFiles/sprint_1/4.jpg" style="max-width: 100%; height: auto;">
       <img src="bootcampFiles/sprint_1/5.jpg" style="max-width: 100%; height: auto;">
       
  </details>

  - **Sprint Notları**:
    - Proje yönetimi için `Jira` kullanılmasına karar verildi.

    - UI tasarımlarında `Figma` kullanılmasına karar verildi..

    - Durum yönetimi için  `Riverpod` kullanılmasına karar verildi.

    - `MVVM` yapısı kurulmuş olup, bu temelde ilerlenecektir.

    - Veri Tabanı için `Firebase` düşünüldü.

    - Giriş sistemi için `email login` kullanılmasına karar verildi.

    - Giriş sisteminin ardından  `kimlik doğrulama` yapılmasına karar verildi.

   
  - **Sprint içinde beklenen Puan tamamlama**: 145 Puan 
  - **Puan Tamamlama Mantığı**: `(95 kısmi olarak tamamlandı)` İlk sprintin hedefi 145 puan. Okullarımızda sınav dönemi olması ve takım üyelerinin çoğunun sınavlarının olması nedeniyle ilk sprint için daha düşük puan hedefi belirlendi ve bu durumun telafisi olarak B planı hazırlandı.
  - **Daily Scrum**: Dosyaya bakın
  - **Ürün İş Listesi URL'si:** İş Listesi için tıklayın <a href="https://berin-irmak.atlassian.net/jira/core/projects/YESIL/board">(Jira)</a>
  - **Sprint Review:**
    - Besat, Bilal, Berivan, arka yüz(backend) ve ön yüz (frontend) için koordineli bir çaba yürüttüler. Ekip içinde bir sonraki sprintte bu şekilde devam etme konusunda anlaştık.

     - Uİ/Ux Design kısmında Berin ve Azra'nın devam etmesinde anlaştık.

    - Bir süre uygulama adı konusunda karar vermekte zorlandık. 'bitkim'den 'FloraNabız'e geçtik ve isim için en son 'EcoGuardian: Akıllı Bitki Bakım ve Koruma' olarak kararkıldık bu konuda önemli adım daha atmış olduk.

    - Bu sprintte karşılaştığımız en büyük iki sorun Tasarım ve Esp8266 ile firebase ilişkisidi.

    - Arduino Kısmında Firebase kütüphanelerinde sorun ile karşılaştık fakat uzun uğraş ve araştırmalarımız doğruştutunsa kod geliştirdik. Bir kaç düzeltme ve çaba ile bunun üstesinden geldik.

    -Genel olarak, iyi bir sprint süreci geçirdiğimize inanıyoruz. Planladığımıza yakın bir sprint süreci yaşadık Belirttiğimiz gibi Sınav haftalarımız olduğundan ekipçe tam bir ilerleyiş için ilk sprint puanımızı düşük tuttuk.
   

  - **Sprint Review Participants:** `Besat Arif Çıngar`, `Berin Irmak Arıkboğa`, `Berivan Dağcı`, `Azra Ece`, `Bilal Enes Söylemez`
  - **Sprint Retrospective:**
    - Mobil Kısmında Besat, Bilal ve Berivan'ın devam etmesine karar verdik.

    - Uİ/Ux Design kısmında Berin ve Azra'nın devam etmesine karar verdik.

    - İsim kısmını yeni sprintte netleştirmek için çalışmalara başladık.

    - uygulama kısmında yapay zeka entegresi ve verilerin analizini ana hedeflerimiz arasına aldık.

    - esp8266 kullanarak yaptığımız projenin tamamen devresinin oluşturulmasını yetişme durumuna göre tasarımın (Örnek Ürün) bitmesini hedefledik.

    - firebase kısmında daha derin araştırma ve incelenmesini kararkaştırdık.

    - Esp8266 Kısmında su dökme ve bunun kontrollü gibi işlemleri oluşturmak için algoritma oluşturmaya karar aldık.

    - Flutter Kısmında esp8266 kısmından yolladığımız verilerin Daha işlevli kullanılması ve entegre kısmının güçlendirilmesini karar aldık.

    - Tasarımın modernleşmesi ve kullanıcı odağının yüksek olması için daha modern tasarım oluşturmak için incelemeler başlattık.

    - E-posta kimlik doğrulamasının yanı sıra ikinci sprintte Google kimlik doğrulama sisteminin eklenmesine karar verildi.



  - **Diğer Notlar**:
  <details>
    <summary><h3>Ek Dosyalar</h3></summary>
    <ul>
      <li><strong>Proje Kapsamı ve Hedefleri</strong> <a href="./bootcampFiles/sprint_1/Proje Tanıtımı ve İşleyişi.pdf">Dosyayı İncele</a></li>
   ><h3>•	Özet ve Hedef Kitle</h3>

<h3>Bu proje,</h3> Sensörler, veri tabanları, yapay zeka ve hava durumu sistemleri gibi farklı teknolojileri bir araya getirerek bitkilerin sağlıklı kalmasını sağlamayı hedeflemektedir.
<br>
Bu proje, sadece ekinler için değil, bahçemizdeki küçük bir alan veya evdeki saksılar için de kullanılabilir. Bu sayede her alanda uygulama imkanı sunmaktadır.

Hedef kitle bu sayede belirlenmiş olur.


 <li><strong>Konuşmalar</strong> Yukarıda Paylaşıldı</li>
    </ul>
  </details>

  </details>

  ---

  
  <details>
    <summary><h1>Sprint 2</h1></summary>


  <details>
    <summary><h3>Sprint 2 - Ürün ve Devre kısmı tamamlandı [Arduino - Esp8266]</h3></summary>
  <table style="width: 100%;">
    <tr>
      <td colspan="4" style="text-align: center;"><h2>Oluşturulan projede esp8266, sıcaklık, nem sensorleri ek olarak RGB led ve DC su pompası yer almaktadır. Bir bitkinin ihtiyacı olan her türlü işlem düşünülmüştür.</h2></td>
    </tr>
    <tr>
      <td style="width: 25%;"><img src="bootcampFiles/sprint_2/urun1.jpg" style="max-width: 100%; height: auto;"></td>
       <td style="width: 25%;"><img src="bootcampFiles/sprint_2/urun2.jpg" style="max-width: 100%; height: auto;"></td>
         <td style="width: 25%;"><img src="bootcampFiles/sprint_2/urun3.jpg" style="max-width: 100%; height: auto;"></td>
       <td style="width: 25%;"><img src="bootcampFiles/sprint_2/urun4.jpg" style="max-width: 100%; height: auto;"></td>
         <td style="width: 25%;"><img src="bootcampFiles/sprint_2/urun5.jpg" style="max-width: 100%; height: auto;"></td>
    </tr>
    
      
  
 
  
 
  </table>
   
 </details> 

<!--  uygulama için altı -->


  <details>
    <summary><h3>Sprint 2 - Mobil kısmı. Bu sprintte yeni eklenen sayfaların Ekran Görüntüsü var.</h3></summary>
  <table style="width: 100%;">
    <tr>
      <td colspan="4" style="text-align: center;"><h2>Yapay zeka ile bitkinin verisi entegrasyonu. Yapay zeka bitki verilerine göre yorum ve analizde bulunup öneri veriyor.</h2></td>
    </tr>
    <tr>
     <td style="width: 25%;"><img src="bootcampFiles/sprint_2/mobil1.jpg" style="max-width: 100%; height: auto;"></td>
        <td style="width: 25%;"><img src="bootcampFiles/sprint_2/mobil2.jpg" style="max-width: 100%; height: auto;"></td>
        <td style="width: 25%;"><img src="bootcampFiles/sprint_2/mobil3.jpg" style="max-width: 100%; height: auto;"></td>
    </tr>
 
   
   
 


   
 
  </table>
   

<!-- uygulama son -->

</details>
  <details>
    <summary><h3>Sprint 2 - Sprint Panosu Güncelleme Ekran Görüntüleri</h3></summary>
    <img src="bootcampFiles/sprint_2/sc1.jpg" style="max-width: 100%; height: auto;">
   <img src="bootcampFiles/sprint_2/sc2.jpg" style="max-width: 100%; height: auto;">
    <img src="bootcampFiles/sprint_2/sc3.jpg" style="max-width: 100%; height: auto;">
    <img src="bootcampFiles/sprint_2/sc4.jpg" style="max-width: 100%; height: auto;">
    <img src="bootcampFiles/sprint_2/wp1.jpg" style="max-width: 50%; height: auto;">
    <img src="bootcampFiles/sprint_2/wp2.jpg" style="max-width: 50%; height: auto;">
    <img src="bootcampFiles/sprint_2/wp3.jpg" style="max-width: 50%; height: auto;">
    <img src="bootcampFiles/sprint_2/wp4.jpg" style="max-width: 50%; height: auto;">
    <img src="bootcampFiles/sprint_2/wp5.jpg" style="max-width: 50%; height: auto;">
        <img src="bootcampFiles/sprint_2/wp6.jpg" style="max-width: 50%; height: auto;">
        <img src="bootcampFiles/sprint_2/wp7.jpg" style="max-width: 50%; height: auto;">
        <img src="bootcampFiles/sprint_2/wp8.jpg" style="max-width: 50%; height: auto;">
       
  </details>
  
 <details>
    <summary><h3>Sprint 2 - UI Tasarım</h3></summary>
    <img src="bootcampFiles/sprint_2/ui1.jpg" style="max-width: 100%; height: auto;">
    <img src="bootcampFiles/sprint_2/ui2.jpg" style="max-width: 100%; height: auto;">
       <img src="bootcampFiles/sprint_2/ui3.jpg" style="max-width: 100%; height: auto;">

       
  </details>
  

  - **Sprint Notları**:
    - Yapay zeka entegeresi için `Openai` kullanılmasına karar verildi.

    - UI tasarımlarında `Figma` kullanıldı.

    - Uygulama Menü Tasarımı Değişti  `Yeşil` Renk kullanılmasına karar verildi.

    - Uygulama ismi olarak `EcoGuardian` karar verildi.

    - Veri Tabanı için `Firebase` kısmında ilerlendi.

    - Arduino için `ESP8266` kullanılmasına karar verildi.

    - ESP8266 ile uyumlu  `sensorler` kararlaştırıldı.

   
  - **Sprint içinde beklenen Puan tamamlama**: 170 Puan 
  - **Puan Tamamlama Mantığı**: `(150 kısmi olarak tamamlandı)` İlk sprintin hedefi 145 puan, ikinci sprintin 170 puan. Okullarımızda sınav dönemi olması ve takım üyelerinin çoğunun sınavlarının olması nedeniyle ilk sprint için daha düşük puan hedefi belirlendi ve bu durumun telafisi olarak B planı hazırlanmıştı. İkinci sprint için ise bazı ekip arkadaşlarımızın projeye ilerleme konusunda yaşanılan aksaklıklar tarafından beklenenden kısmı şekilde az gerçekleşti. Bu durum için düzeltme planları hazırlandı ve uygulanmaya koyuldu.
  - **Daily Scrum**: Dosyaya bakın
  - **Ürün İş Listesi URL'si:** İş Listesi için tıklayın <a href="https://berin-irmak.atlassian.net/jira/core/projects/YESIL/board">(Jira)</a>
  - **Sprint Review:**
    - Besat, arka yüz(backend) ve ön yüz (frontend) için koordineli bir çaba yürüttü. Ekip içinde bir sonraki sprintte bu şekilde devam etme konusunda anlaşıldı.

     - Uİ/Ux Design kısmında Berin ve Azra'nın devam etmesinde anlaştık.
     
     -Berivan Araştırma kısmında devam etmesi için anlaşıldı. 

    - Yapay zeka kısmında OpenAI API'si kullanıldı ve uygulamaya entegre edildi. Her ne kadar başlangıçta yeni gelen güncellemelerden dolayı zorlansakta yinede yaptık [Görsel eklendi].

    - Bu sprintte karşılaştığımız en büyük üç sorun Yapay zeka entegresi, login kısmı ve devrenin oluşturulma kısmı oldu.

    - Arduino kısmnda sıcaklık sensoru ve RGB led kısmında kontrolsuz volt ile bir kaç sorun yaşadık ardından doğru direnç kullanımı ile sorunu çözdük.

    -Genel olarak, iyi bir sprint süreci geçirdiğimize inanıyoruz. Planladığımıza yakın bir sprint süreci yaşadık Belirttiğimiz gibi Bir kaç ekip arkadaşımızın görevleri tam yapamamasından dolayı hedefimizden hafif düşük oldu ama yeni plan ile telafi ettik.
   

  - **Sprint Review Participants:** `Besat Arif Çıngar`, `Berin Irmak Arıkboğa`, `Berivan Dağcı`, `Azra Ece`, `Bilal Enes Söylemez`
  - **Sprint Retrospective:**
    - Mobil Kısmında Besat'ın devam etmesine karar verdik.

    - Uİ/Ux Design kısmında Berin ve Azra'nın devam etmesine karar verdik.

    - Araştırma kısmında  Berivan'ın devam etmesine karar verdik.

    - Logo kısmını yeni sprintte netleştirmek için çalışmalara başladık.

    - uygulama kısmında yapay zeka entegresi ve verilerin analizini ana hedeflerimiz arasına almıştık bunun tasarımını güçlendirmek için hedef oluşturduk.

    - esp8266 devremizde Verileri yollarken nasıl tarih formatında yollayabiliriz onu araştırma ve uygulama kararı aldık.

    - firebase kısmında hatalarımızı ve eksiklerimizi araştırma kararı aldık.

    - Flutter Kısmında esp8266 kısmından yolladığımız verilerin Daha işlevli kullanılması ve entegre kısmının güçlendirilmesini karar aldık [2].

    - Tasarımın modernleşmesi ve kullanıcı odağının yüksek olması için daha modern tasarım oluşturmak için incelemeler başlattık [2].

    - E-posta kimlik doğrulamasının yanı sıra ikinci sprintte Google kimlik doğrulama sisteminin eklenmesine karar verildi [2. Sprintte kısmı bitti ama yarım kaldı].
   
    - Nasıl hava durumunu kullanıcıya haberdar edebiliriz bunun için hangi API veya ne kullanabiliriz bunu araştırma ve uygulamayı kararlaştırdık.



  - **Diğer Notlar**:
  <details>
    <summary><h3>Ek Dosyalar</h3></summary>
    <ul>
      <li><strong>Proje Kapsamı ve Hedefleri</strong> <a href="./bootcampFiles/sprint_1/Proje Tanıtımı ve İşleyişi.pdf">Dosyayı İncele</a></li>
   ><h3>•	Özet ve Hedef Kitle</h3>

<h3>Bu proje,</h3> Sensörler, veri tabanları, yapay zeka ve hava durumu sistemleri gibi farklı teknolojileri bir araya getirerek bitkilerin sağlıklı kalmasını sağlamayı hedeflemektedir.
<br>
Bu proje, sadece ekinler için değil, bahçemizdeki küçük bir alan veya evdeki saksılar için de kullanılabilir. Bu sayede her alanda uygulama imkanı sunmaktadır.

Hedef kitle bu sayede belirlenmiş olur.


 <li><strong>Konuşmalar</strong> Yukarıda Paylaşıldı</li>
    </ul>
  </details>

  </details>

  ---
  
  <details>
    <summary><h1>Sprint 3</h1></summary>


  <details>
    <summary><h3>Sprint 3 - Mobil Kısmı Güncellendi ve Son Tasarımlar Gerçekleşti.</h3></summary>
  <table style="width: 100%;">
    <tr>
      <td colspan="4" style="text-align: center;"><h2>Uygulamamızın Güncel halini görsellere ekledim. Uygulamamızın çalışma mantığı Arduino kısmında ESP8266 modulü kullanıldı ve sensorler kullanıldı. Sensörler yarmıyla ölçülen veriler veritabanına yollanıldı oradan da uygulamadan çekildi. Oluşturduğumuz algoritmalar ilede güzel bir çalışma gerçekleştirildi.</h2></td>
    </tr>
    <tr>
      <td style="width: 25%;"><img src="bootcampFiles/sprint_3/mobil1.jpg" style="max-width: 100%; height: auto;"></td>
       <td style="width: 25%;"><img src="bootcampFiles/sprint_3/mobil2.jpg" style="max-width: 100%; height: auto;"></td>
         <td style="width: 25%;"><img src="bootcampFiles/sprint_3/mobil3.jpg" style="max-width: 100%; height: auto;"></td>
       <td style="width: 25%;"><img src="bootcampFiles/sprint_3/mobil4.jpg" style="max-width: 100%; height: auto;"></td>
         <td style="width: 25%;"><img src="bootcampFiles/sprint_3/mobil5.jpg" style="max-width: 100%; height: auto;"></td>
       <td style="width: 25%;"><img src="bootcampFiles/sprint_3/mobil6.jpg" style="max-width: 100%; height: auto;"></td>
       <td style="width: 25%;"><img src="bootcampFiles/sprint_3/mobil7.jpg" style="max-width: 100%; height: auto;"></td>
       <td style="width: 25%;"><img src="bootcampFiles/sprint_3/mobil8.jpg" style="max-width: 100%; height: auto;"></td>
    </tr>
    
      
  
 
  
 
  </table>
   
 </details> 

<!--  uygulama için altı -->


  <details>
    <summary><h3>Sprint 3 - Sprint Panosu Güncelleme Ekran Görüntüleri</h3></summary>
    <img src="bootcampFiles/sprint_3/sc1.jpg" style="max-width: 100%; height: auto;">
   <img src="bootcampFiles/sprint_3/sc2.jpg" style="max-width: 100%; height: auto;">
    <img src="bootcampFiles/sprint_3/wp1.png" style="max-width: 50%; height: auto;">
    <img src="bootcampFiles/sprint_3/wp2.png" style="max-width: 50%; height: auto;">
    <img src="bootcampFiles/sprint_3/wp3.png" style="max-width: 50%; height: auto;">
    <img src="bootcampFiles/sprint_3/wp4.png" style="max-width: 50%; height: auto;">
    <img src="bootcampFiles/sprint_3/wp5.png" style="max-width: 50%; height: auto;">
        <img src="bootcampFiles/sprint_3/wp6.png" style="max-width: 50%; height: auto;">
   
       
  </details>
  

  

  - **Sprint Notları**:
    - Yapay zeka entegereli sayfamızın `Tasarım` kısmı güncellenilmesine karar verildi.

    - Uygulama için Özel videolar tasarlandı platform olarak `Canva` kullanıldı.

    - Uygulama Menü Tasarımı Değişti  `Yeşil Tonları` Renk kullanılmasına karar verildi.

    - Uygulama `Logosu` oluşturuldu ve karar verildi.

    - Veri Tabanı için `Firebase` kısmında ilerlendi.

    - Arduino için `ESP8266` kısmında ilerlendi.

    - Uygulama için  `Adobe` ile ikonlar tasarlandı.

    - Uygulama için  `Menülerde ve ikonlarda` güncellenmeye gidildi.

    - Son kontroller ve uygulama için  `Testler` Yapıldı.
   
    - Uygulamayı anlatan Yaklaşık 1 dakika `Video` Hazırlandı. 

   
  - **Sprint içinde beklenen Puan tamamlama**: 125 Puan  
  - **Puan Tamamlama Mantığı**: `(110 kısmi olarak tamamlandı)` İlk sprintin hedefi 145 puan, ikinci sprintin 170 puan ve son sprint 125 puan olarak ayarlandı. Okullarımızda sınav dönemi olması ve takım üyelerinin çoğunun sınavlarının olması nedeniyle ilk sprint için daha düşük puan hedefi belirlendi ve bu durumun telafisi olarak B planı hazırlanmıştı. İkinci sprint için ise bazı ekip arkadaşlarımızın projeye ilerleme konusunda yaşanılan aksaklıklar tarafından beklenenden kısmı şekilde az gerçekleşti. Bu durum için düzeltme planları hazırlandı ve uygulanmaya koyuldu. Son sprint yani bu sprintte ise Projemizde ekip arkadaşlarımızın çıkması göz önnünde bulundurularak yeni plan oluşturuldu ve oluşturulan yeni plan Gerçekleştirildi. Proje sağ salim bitti. NOT: Puan sisteminde bilerek olması gerekenden fazla puan hedefledik. O yüzden kısmı olarak tamamlandı yazısı sadece üst aşama için geçerli normal seviyeye göre proje normal puandan daha fazla şekilde gerçekleştirildi.
  - **Daily Scrum**: Dosyaya bakın
  - **Ürün İş Listesi URL'si:** İş Listesi için tıklayın <a href="https://berin-irmak.atlassian.net/jira/core/projects/YESIL/board">(Jira)</a>
  - **Sprint Review:**

    - Yapay zeka kısmında OpenAI API'si kullanılmıştı. Daha verimli ve gerçekci cevaplar vermesi için sensörler yardımıyla (gerçek ölçülen değerler) ile entegreli şekilde gerçekleşmesi sağlandı.

    - Bu sprintte karşılaştığımız en büyük sorun ekip arkadaşlarımızın 2-3 Tanesinin çekilmesi ve işlerinin olmasından dolayı tam verimli çalışamaması oldu.

    - Ölçülen veriler için (Sensörlerden gelen değerler) Bunun kullanıcıya daha düzgün verebilmek için algoritmalar oluşturduk. Algoritmalar analiz yapabiliyor ve kullanıyı deneyimini en iyi şekilde verimli kullanıyor.

    - Bitkimizin Uzaktan otomatik kontrol edilmesini sağlayabilen sistemler üzerine çalışıldı ve araştırmalar gerçkeleştirildi (Orn: Otomatik sulama. Kullanıcı önceden veri giriyor altına düştüğü veya üstüne çıktığı anda çalışan sistem).
   
    - Bitki sağlık yüzdesini gösteren algortima. (Ref: Nem ve Sıcaklık verileri ile aslında olması gereken arasındaki mutlak fark)
   

  - **Sprint Review Participants:** `Besat Arif Çıngar`, `Berin Irmak Arıkboğa`, `Berivan Dağcı`, `Azra Ece`, `Bilal Enes Söylemez`
  - **Sprint Retrospective:**
   - Yarışmada hedeflediğim planı gerçekleştirdik ve güzel uygulama çıkardık. Yaparken bir çok alanı tecrübe ettik (Arduino, sensörler, veritabanı, mobil uygulama, figma, ui...)
    

  - **Diğer Notlar**:
  <details>
    <summary><h3>Ek Dosyalar</h3></summary>
    <ul>
      <li><strong>Proje Kapsamı ve Hedefleri</strong> <a href="./bootcampFiles/sprint_1/Proje Tanıtımı ve İşleyişi.pdf">Dosyayı İncele</a></li>
   ><h3>•	Özet ve Hedef Kitle</h3>

<h3>Bu proje,</h3> Sensörler, veri tabanları, yapay zeka ve hava durumu sistemleri gibi farklı teknolojileri bir araya getirerek bitkilerin sağlıklı kalmasını sağlamayı hedeflemektedir.
<br>
Bu proje, sadece ekinler için değil, bahçemizdeki küçük bir alan veya evdeki saksılar için de kullanılabilir. Bu sayede her alanda uygulama imkanı sunmaktadır.

Hedef kitle bu sayede belirlenmiş olur.


 <li><strong>Konuşmalar</strong> Yukarıda Paylaşıldı</li>
    </ul>
  </details>

  </details>

  ---

  ---
  ![image](https://github.com/user-attachments/assets/bf566fa5-35ec-4535-a2b9-a5ade66c8e58)

  # Bootcamp'ın Sonu
  ## Uygulama Tanıtımı (GÖRSELE TIKLA)
  [![App Teaser](![WhatsApp Görsel 2024-08-01 saat 23 21 34_1cf7117c](https://github.com/user-attachments/assets/5bbdaabc-cba0-4feb-bb85-b53142f2b67e)
)](https://youtu.be/10zfIV3QBVA?si=8ZovOx8n5bzKVzMy)

  ## APK DOSYASI
 APK DOSYASINI GÖR


  # Referans Renkler
  **`(Kullandığımız renklerin genel hatları)`**

  | Renk             | Kodu                                                                |
  | ----------------- | ------------------------------------------------------------------ |
  | Menü Rengi | ![#8BC24A](https://via.placeholder.com/10/8BC24A?text=+) #8BC24A |
  | Yazı Renkleri [1] | ![#21631B](https://via.placeholder.com/10/21631B?text=+) #21631B |
  | Diğer Kullanılan Renkler | ![#AED582](https://via.placeholder.com/10/AED582text=+) #AED582 |
  | Diğer Kullanılan Renkler | ![#43A047](https://via.placeholder.com/10/#43A047text=+) #43A047 |
  | Diğer Kullanılan Renkler | ![#000000](https://via.placeholder.com/10/000000text=+) #000000 |
  | Diğer Kullanılan Renkler | ![#FCFEFF](https://via.placeholder.com/10/FCFEFFtext=+) #FCFEFF |
  


  # **Kullanılan Teknolojiler**
  - [x] `cupertino_icons`
  - [x] `flutter_launcher_icons`
  - [x] `firebase_database`
  - [x] `flutter_animation_progress_bar`
  - [x] `wave_progress_widget`
  - [x] `flutter_icons`
  - [x] `marquee`
  - [x] `firebase_auth`
  - [x] `charts_flutter`
  - [x] `shared_preferences`
  - [x] `intl`

  - [x] `syncfusion_flutter_charts`
  - [x] `flutter_charts`

  - [x] `animated_text_kit`
  - [x] `flutter_sparkline`
  - [x] `liquid_progress_indicator`
  - [x] `percent_indicator`
  - [x] `geolocator`
  - [x] `video_player`
  </body>
  </html>

