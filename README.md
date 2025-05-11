
# VPN App - Flutter Case Study

Bu case study, bir VPN uygulamasının mock data kullanılarak geliştirilmesini içermektedir. Uygulama, kullanıcıların farklı ülkelere bağlanmalarını, bağlantı istatistiklerini görüntülemelerini ve ücretsiz lokasyonlar arasında seçim yapmalarını sağlamaktadır.

Mock data, uygulamanın işlevselliğini gerçek bir backend entegrasyonu olmadan simüle etmek için kullanılmıştır.

Uygulama her açıldığında mock data'daki 'Netherlands' ülkesine bağlı görünmektedir. Bu, geliştirme ve test aşamalarında uygulamanın işlevselliğini göstermek için tasarlanmıştır. Gerçek bir uygulamada, kullanıcı bağlantı durumu shared_preferences veya bir backend API ile saklanabilir ve geri yüklenebilir.

## ⚙️ Kurulum ve Kullanım

**Gereksinimler**
- Flutter SDK (>= 3.29.2)
- Dart SDK (>= 3.7.2)
- Android Studio veya Xcode (platforma bağlı olarak)
- Bir cihaz (fiziksel veya emülatör)

**Kurulum Adımları**

Projeyi klonlayın

```bash
  git clone https://github.com/edanurhamurcu/flutter_vpn_app.git
```

Proje dizinine gidin

```bash
  cd flutter_vpn_app
```

Gerekli paketleri yükleyin

```bash
  flutter pub get
```

Uygulamayı  çalıştırın

```bash
  flutter run
```

## 📁 Proje Yapısı 

```text
lib/
├── core/
│   ├── components/        # Ortak UI bileşenleri
│   ├── extensions/        # Extension metodlar
│   └── theme/             # Tema ve renk yapıları
├── data/
│   ├── models/             # Veri modelleri (Country,ConnectionStatus)
│   └── mock_data.dart       # Sahte veri dosyası
├── modules/                 # Mock veriler
│   ├── disconnect/          # Disconnect modülü
│   ├── home/                # Home modülü
│   │   ├── view/            # UI 
│   │   │   ├── components/  # UI bileşenleri
│   │   └── viewModel/       # ViewModel 
│   └── settings/            # Settings modülü
├── utils/
│   └── helpers/              # Yardımcı fonksiyonlar ve veri işleyici sınıflar
│       ├── country_helper.dart
│       ├── speed_helper.dart
│       └── timer_helper.dart
├── main.dar              
└── splash.dart 
```
## 🧱 Mimarinin Temelleri
Bu projede **MVVM (Model-View-ViewModel)** mimarisi ve **Riverpod** state yönetimi tercih edilmiştir. Amacım, uygulamanın farklı katmanlarını net bir şekilde ayrıştırarak daha modüler, okunabilir ve sürdürülebilir bir yapı kurmaktı.

**Modüllerin View, Component ve ViewModel Olarak Ayrılması:**

- **View:** Sadece kullanıcı arayüzüne odaklanır. UI bileşenleri burada tanımlanır. UI ile iş mantığını ayırmak, kodun okunabilirliğini ve sürdürülebilirliğini artırırken aynı zaman da UI değişikliklerinin iş mantığından etkilenmeden yapılması hedeflendi.

- **ViewModel:** İş mantığını ve state yönetimini üstlenir. ViewModel'ler, UI'dan bağımsız olduğu için kolayca test edilebilir. İş mantığı ve veri yönetimi, UI'dan izole edilerek daha temiz bir yapı sağlanması hedeflendi.

- **Component:** Tekrar kullanılabilir UI bileşenlerini içerir. Modül ve app bazlı olarak ayrıştırıldı. Sadece o modülde kullanılacak olan componentler modül altında tutulurken, uygulamanın genelinde kullanılabilir component core dosyası altında tutuldu.
Bu yaklaşım ile kodun yeniden kullanılabilirliğinin arttırılması ve UI bileşenlerinin merkezi bir yerde yönetilmesi hedeflendi.

Bu yapı sayesinde UI tarafındaki değişiklikler, diğer katmanları etkilemeden yapılabilir. Ayrıca test edilebilirlik önemli ölçüde artar.

**Riverpod**, reaktif yapısı, null güvenliği ve performans avantajları nedeniyle tercih edilmiştir. Null güvenliği, kolay test edilebilirlik ve modüler yapısı sayesinde MVVM ile uyum sağlarken yalnızca ihtiyaç duyulan widget’ları yeniden oluşturması, uygulamanın genel performansını artırır.

Bu mimari ve kullanılan araçlar, hem kullanıcı deneyimini hem de geliştirici deneyimini iyileştirmek adına tercih edilmiştir.


  
## 📦 Dependencies (Bağımlılıklar)

[lottie](https://pub.dev/packages/lottie) : Bağlantı animasyonları için kullanılmıştır.

[flutter_riverpod](https://pub.dev/packages/flutter_riverpod) : State management için kullanılmıştır.

[flutter_svg](https://pub.dev/packages/flutter_svg) : SVG formatındaki bayrak görsellerini göstermek için kullanılmıştır.

[flutter_localizations](https://pub.dev/packages/flutter_localization) , [intl](https://pub.dev/packages/intl) : Localization ve tarih/saat formatlama işlemleri için kullanılmıştır.

[flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons) : Uygulama ikonunu kolayca özelleştirmek ve hem Android hem de iOS platformlarında kullanmak için kullanılmıştr.

[shared_preferences](https://pub.dev/packages/shared_preferences) : Kullanıcının tema ve dil tercihlerini cihaza kaydetmek ve uygulama yeniden başlatıldığında bu tercihleri yüklemek için kullanılmıştır.





## 	✨ Özellikler

- Seçilen ülkeye bağlanma
- Ülke arama(search) 
- Her ülke için bayrak gösterimi
- Her ülke için mevcut bağlantı sayısı
- Bağlanma/Bağlantı kesme
- Bağlantı süresini gösterme (saat:dakika:saniye) formatında
- Aktif bağlantı indirme hızı (MB) cinsinden
- Aktif bağlantı yükleme hızı (MB) cinsinden
- Bağlantının sinyal gücü (%) cinsinden
- Açık/koyu mod geçişi
- Türkçe/İngilizce dil desteği

  
## 🧪 Testler

Testleri çalıştırmak için terminali açarak aşağıdaki komutu çalıştırın.

```bash
  flutter test
```

**Birim Testleri:**

**ViewModel Testleri:**
- HomeViewModel: Seçilen ülkeye bağlanma ve bağlantıyı kesme işlemleri, ülke sorgulama, ülke bağlantı durumunun güncellenmesi test edilmiştir.
- ThemeViewModel: Tema değişikliklerinin doğru bir şekilde kaydedildiği ve yüklendiği test edilmiştir.
- LocaleViewModel: Dil değişikliklerinin doğru bir şekilde kaydedildiği ve yüklendiği test edilmiştir.
- SharedPreferences Kullanımı: Kullanıcı tercihlerini (tema ve dil) kalıcı olarak saklama ve yükleme işlemleri test edilmiştir. 

**Edge Case Testleri:**

- Varsayılan değerlerin doğru bir şekilde yüklendiği durumlar test edilmiştir (örneğin, SharedPreferences'ta veri yoksa varsayılan tema ve dilin yüklenmesi).

**Kullanılan Araçlar**
- **flutter_test:** Flutter'ın yerleşik test çerçevesi kullanılarak birim ve widget testleri yazılmıştır.

- **shared_preferences (Mock):** SharedPreferences'ın mock versiyonu kullanılarak veri saklama ve yükleme işlemleri test edilmiştir.

## 📸 Ekran Görüntüleri

### 🌞 Açık Tema

<div style="display: flex; flex-wrap: wrap; gap: 10px;">
  <img src="https://drive.google.com/uc?export=view&id=1wBl46OUlIbHHyKf8gZabkxXTlsfjUwIP" width="150"/>
  <img src="https://drive.google.com/uc?export=view&id=14CvjSuYCivs7c6D-rxIoxadNbXXkHham" width="150"/>
  <img src="https://drive.google.com/uc?export=view&id=1aBaX6KmIPgFi2kfW9tRck825iiSEL-U4" width="150"/>
  <img src="https://drive.google.com/uc?export=view&id=136cmWk_ord9oV0gvcDFjDRjJpzB8TUoH" width="150"/>
  <img src="https://drive.google.com/uc?export=view&id=1g5nUKqS2j2xsK8977NWL14tDorkreMTs" width="150"/>
</div>

### 🌙 Koyu Tema

<div style="display: flex; flex-wrap: wrap; gap: 10px;">
  <img src="https://drive.google.com/uc?export=view&id=178sAZlV69x08iNas2vHU9GRCe5cWV3S8" width="150"/>
  <img src="https://drive.google.com/uc?export=view&id=1CEpiVWpF72eSRqLRTqV2gkg-uAQuS_Fm" width="150"/>
  <img src="https://drive.google.com/uc?export=view&id=1zpDto3aEC2MsMH2vVbXowmNef63Q79Bl" width="150"/>
  <img src="https://drive.google.com/uc?export=view&id=1tLHnKa2gy5t_F6r4Iud6L64w5MThD96v" width="150"/>
  <img src="https://drive.google.com/uc?export=view&id=1d3lJczA60HF6tTf6DQItOtNSjMHvuGR5" width="150"/>
</div>

