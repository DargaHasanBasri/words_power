import 'package:flutter/material.dart';
import 'package:words_power/route/app_routes.dart';
import 'package:words_power/ui/widgets/custom_button.dart';

import '../../services/service_locator.dart';
import '../../utils/custom_colors.dart';

class CustomPopupDialog extends StatelessWidget {
  const CustomPopupDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      elevation: 0,
      backgroundColor: CustomColors.buttonBackground,
      child: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    final AppRoutes appRoutes = locator<AppRoutes>();
    return AspectRatio(
      aspectRatio: 0.6,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  "GİZLİLİK POLİTİKASI",
                  style: TextStyle(
                    color: CustomColors.greyTextColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Son güncellenme: 13/02/2024",
                style: TextStyle(
                  color: CustomColors.greyTextColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "Güvenliğiniz bizim için önemli. Bu sebeple bizimle paylaşacağınız kişisel verileriz hassasiyetle korunmaktadır.Biz, Şirket Adı, veri sorumlusu olarak, bu gizlilik ve kişisel verilerin korunması politikası ile, hangi kişisel verilerinizin hangi amaçla işleneceği, işlenen verilerin kimlerle ve neden paylaşılabileceği, veri işleme yöntemimiz ve hukuki sebeplerimiz ile; işlenen verilerinize ilişkin haklarınızın neler olduğu hususunda sizleri aydınlatmayı amaçlıyoruz.",
                style: TextStyle(
                  color: CustomColors.greyTextColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "KİŞİSEL VERİLERİNİZİN İŞLENME AMACI",
                style: TextStyle(
                  color: CustomColors.greyTextColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "Bizimle paylaştığınız kişisel verileriniz sadece analiz yapmak suretiyle; sunduğumuz hizmetlerin gerekliliklerini en iyi şekilde yerine getirebilmek, bu hizmetlere sizin tarafınızdan ulaşılabilmesini ve maksimum düzeyde faydalanılabilmesini sağlamak, hizmetlerimizi, ihtiyaçlarınız doğrultusunda geliştirebilmek ve sizleri daha geniş kapsamlı hizmet sağlayıcıları ile yasal çerçeveler içerisinde buluşturabilmek ve kanundan doğan zorunlulukların (kişisel verilerin talep halinde adli ve idari makamlarla paylaşılması) yerine getirilebilmesi amacıyla, sözleşme ve hizmet süresince, amacına uygun ve ölçülü bir şekilde işlenecek ve güncellenecektir.",
                style: TextStyle(
                  color: CustomColors.greyTextColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  "KULLANIM ŞARTLARI",
                  style: TextStyle(
                    color: CustomColors.greyTextColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Son güncellenme: 13/02/2024",
                style: TextStyle(
                  color: CustomColors.greyTextColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "Sevgili ziyaretçimiz, lütfen https://site.com web sitemizi ziyaret etmeden önce işbu kullanım koşulları sözleşmesini dikkatlice okuyunuz. Siteye erişiminiz tamamen bu sözleşmeyi kabulünüze ve bu sözleşme ile belirlenen şartlara uymanıza bağlıdır. Şayet bu sözleşmede yazan herhangi bir koşulu kabul etmiyorsanız, lütfen siteye erişiminizi sonlandırınız. Siteye erişiminizi sürdürdüğünüz takdirde, koşulsuz ve kısıtlamasız olarak, işbu sözleşme metninin tamamını kabul ettiğinizin, tarafımızca varsayılacağını lütfen unutmayınız.",
                style: TextStyle(
                  color: CustomColors.greyTextColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "https://site.com web sitesi Şirket Adı tarafından yönetilmekte olup, bundan sonra SİTE olarak anılacaktır. İşbu siteye ilişkin Kullanım Koşulları, yayınlanmakla yürürlüğe girer. Değişiklik yapma hakkı, tek taraflı olarak SİTE'ye aittir ve SİTE üzerinden güncel olarak paylaşılacak olan bu değişiklikleri, tüm kullanıcılarımız baştan kabul etmiş sayılır.",
                style: TextStyle(
                  color: CustomColors.greyTextColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  "HİZMET KAPSAMI",
                  style: TextStyle(
                    color: CustomColors.greyTextColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Şirket Adı olarak, sunacağımız hizmetlerin kapsamını ve niteliğini, yasalar çerçevesinde belirlemekte tamamen serbest olup; hizmetlere ilişkin yapacağımız değişiklikler, SİTE'de yayınlanmakla yürürlüğe girmiş sayılacaktır.",
                style: TextStyle(
                  color: CustomColors.greyTextColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  "TELİF HAKLARI",
                  style: TextStyle(
                    color: CustomColors.greyTextColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "UYGULAMADA'de yayınlanan tüm metin, kod, grafikler, logolar, resimler, ses dosyaları ve kullanılan yazılımın sahibi (bundan böyle ve daha sonra \"içerik\" olarak anılacaktır) Şirket Adı olup, tüm hakları saklıdır. Yazılı izin olmaksızın site içeriğinin çoğaltılması veya kopyalanması kesinlikle yasaktır.",
                style: TextStyle(
                  color: CustomColors.greyTextColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  "GENEL HÜKÜMLER",
                  style: TextStyle(
                    color: CustomColors.greyTextColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Kullanıcıların tamamı, SİTE'yi yalnızca hukuka uygun ve şahsi amaçlarla kullanacaklarını ve üçüncü kişinin haklarına tecavüz teşkil edecek nitelikteki herhangi bir faaliyette bulunmayacağını taahhüt eder. SİTE dâhilinde yaptıkları işlem ve eylemlerindeki, hukuki ve cezai sorumlulukları kendilerine aittir. İşbu iş ve eylemler sebebiyle, üçüncü kişilerin uğradıkları veya uğrayabilecekleri zararlardan dolayı SİTE'nin doğrudan ve/veya dolaylı hiçbir sorumluluğu yoktur.",
                style: TextStyle(
                  color: CustomColors.greyTextColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "SİTE'de mevcut bilgilerin doğruluk ve güncelliğini sağlamak için elimizden geleni yapmaktayız. Lakin gösterdiğimiz çabaya rağmen, bu bilgiler, fiili değişikliklerin gerisinde kalabilir, birtakım farklılıklar olabilir. Bu sebeple, site içerisinde yer alan bilgilerin doğruluğu ve güncelliği ile ilgili tarafımızca, açık veya zımni, herhangi bir garanti verilmemekte, hiçbir taahhütte bulunulmamaktadır.",
                style: TextStyle(
                  color: CustomColors.greyTextColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "SİTE'de üçüncü şahıslar tarafından işletilen ve içerikleri tarafımızca bilinmeyen diğer web sitelerine, uygulamalara ve platformlara köprüler (hyperlink) bulunabilir. SİTE, işlevsellik yalnızca bu sitelere ulaşımı sağlamakta olup, içerikleri ile ilgili hiçbir sorumluluk kabul etmemekteyiz.",
                style: TextStyle(
                  color: CustomColors.greyTextColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "SİTE'yi virüslerden temizlenmiş tutmak konusunda elimizden geleni yapsak da, virüslerin tamamen bulunmadığı garantisini vermemekteyiz. Bu nedenle veri indirirken, virüslere karşı gerekli önlemi almak, kullanıcıların sorumluluğundadır. Virüs vb. kötü amaçlı programlar, kodlar veya materyallerin sebep olabileceği zararlardan dolayı sorumluluk kabul etmemekteyiz.",
                style: TextStyle(
                  color: CustomColors.greyTextColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "SİTE'de sunulan hizmetlerde, kusur veya hata olmayacağına ya da kesintisiz hizmet verileceğine dair garanti vermemekteyiz. SİTE'ye ve sitenin hizmetlerine veya herhangi bir bölümüne olan erişiminizi önceden bildirmeksizin herhangi bir zamanda sonlandırabiliriz.",
                style: TextStyle(
                  color: CustomColors.greyTextColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  "İLETİŞİM",
                  style: TextStyle(
                    color: CustomColors.greyTextColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Sizlere hizmet sunabilmek amaçlı analizler yapabilmek için, sadece gerekli olan kişisel verilerinizin, işbu gizlilik ve kişisel verilerin işlenmesi politikası uyarınca işlenmesini, kabul edip etmemek hususunda tamamen özgürsünüz. Siteyi kullanmaya devam ettiğiniz takdirde kabul etmiş olduğunuz tarafımızca varsayılacak olup, daha ayrıntılı bilgi için bizimle email@site.com e-mail adresi üzerinden iletişime geçmekten lütfen çekinmeyiniz.",
                style: TextStyle(
                  color: CustomColors.greyTextColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: CustomButton(
                  title: "Onaylıyorum",
                  backgroundColor: CustomColors.backgroundColor,
                  onClick: () => appRoutes.popIfBackStackNotEmpty(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
