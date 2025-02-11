import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['fr', 'en', 'ar', 'es', 'pt'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? frText = '',
    String? enText = '',
    String? arText = '',
    String? esText = '',
    String? ptText = '',
  }) =>
      [frText, enText, arText, esText, ptText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // pageAccueil
  {
    'q4nahqem': {
      'fr': 'Mes Notes',
      'ar': 'ملاحظاتي',
      'en': 'My Notes',
      'es': 'Mis notas',
      'pt': 'Minhas Anotações',
    },
    '3v5325yx': {
      'fr': 'Toutes mes notes',
      'ar': 'كل ملاحظاتي',
      'en': 'All my notes',
      'es': 'Todas mis notas',
      'pt': 'Todas as minhas notas',
    },
    'quomuazy': {
      'fr': 'Idées Vacances',
      'ar': 'أفكار للعطلة',
      'en': 'Holiday Ideas',
      'es': 'Ideas para las vacaciones',
      'pt': 'Ideias para férias',
    },
    '32secy3c': {
      'fr': 'Réserver les billets d\'avion pour...',
      'ar': 'احجز تذاكر الطيران إلى...',
      'en': 'Book flight tickets to...',
      'es': 'Reservar billetes de avión a...',
      'pt': 'Reserve passagens aéreas para...',
    },
    'am9gb85w': {
      'fr': 'Créée le 14 juin',
      'ar': 'تم إنشاؤه في 14 يونيو',
      'en': 'Created on June 14',
      'es': 'Creado el 14 de junio',
      'pt': 'Criado em 14 de junho',
    },
    'jlns05ch': {
      'fr': 'Recette Gâteau',
      'ar': 'وصفة الكيك',
      'en': 'Cake Recipe',
      'es': 'Receta de pastel',
      'pt': 'Receita de bolo',
    },
    'cqqlvi8n': {
      'fr': '200g de farine, 3 oeufs, 100g de sucre...',
      'ar': '200 غرام دقيق، 3 بيضات، 100 غرام سكر...',
      'en': '200g flour, 3 eggs, 100g sugar...',
      'es': '200g de harina, 3 huevos, 100g de azúcar...',
      'pt': '200g de farinha, 3 ovos, 100g de açúcar...',
    },
    'nj70q8s4': {
      'fr': 'Créée le 13 juin',
      'ar': 'تم إنشاؤه في 13 يونيو',
      'en': 'Created on June 13',
      'es': 'Creado el 13 de junio',
      'pt': 'Criado em 13 de junho',
    },
    'hf3mqwk1': {
      'fr': 'Réunion Projet',
      'ar': 'اجتماع المشروع',
      'en': 'Project Meeting',
      'es': 'Reunión del proyecto',
      'pt': 'Reunião do Projeto',
    },
    'zc568qjq': {
      'fr': 'Points à aborder: présentation des...',
      'ar': 'النقاط التي يجب تغطيتها: عرض ...',
      'en': 'Points to cover: presentation of...',
      'es': 'Puntos a cubrir: presentación de...',
      'pt': 'Pontos a serem abordados: apresentação de...',
    },
    'ju4w0zcf': {
      'fr': 'Créée le 12 juin',
      'ar': 'تم إنشاؤه في 12 يونيو',
      'en': 'Created on June 12',
      'es': 'Creado el 12 de junio',
      'pt': 'Criado em 12 de junho',
    },
    '3c7bjyla': {
      'fr': 'Nouvelle Note',
      'ar': 'ملاحظة جديدة',
      'en': 'New Note',
      'es': 'Nueva nota',
      'pt': 'Nova nota',
    },
  },
  // creationNotePage
  {
    'tlzf7rzp': {
      'fr': 'Créer une note',
      'ar': 'إنشاء ملاحظة',
      'en': 'Create a note',
      'es': 'Crear una nota',
      'pt': 'Criar uma nota',
    },
    'vtuio90h': {
      'fr': 'Titre de la note',
      'ar': 'عنوان المذكرة',
      'en': 'Title of the note',
      'es': 'Título de la nota',
      'pt': 'Título da nota',
    },
    't5mob75v': {
      'fr': 'Commencez à écrire...',
      'ar': 'ابدأ بالكتابة...',
      'en': 'Start writing...',
      'es': 'Empieza a escribir...',
      'pt': 'Comece a escrever...',
    },
    '3m5o4cyk': {
      'fr': 'Enregistrer',
      'ar': 'يحفظ',
      'en': 'Save',
      'es': 'Ahorrar',
      'pt': 'Salvar',
    },
    'tc1lh8xt': {
      'fr': 'Informations',
      'ar': 'معلومة',
      'en': 'Information',
      'es': 'Información',
      'pt': 'Informação',
    },
    'cjotsvyc': {
      'fr': 'Dernière modification:',
      'ar': 'آخر تعديل:',
      'en': 'Last modified:',
      'es': 'Última modificación:',
      'pt': 'Última modificação:',
    },
  },
  // readNotePage
  {
    'wwy38dp9': {
      'fr': 'Ma Note',
      'ar': 'تقييمي',
      'en': 'My Rating',
      'es': 'Mi calificación',
      'pt': 'Minha classificação',
    },
    'psc7c4ow': {
      'fr': 'Dernière modification le :',
      'ar': 'آخر تعديل في:',
      'en': 'Last modified on:',
      'es': 'Última modificación:',
      'pt': 'Última modificação em:',
    },
  },
  // updatePage
  {
    '1mafqsl4': {
      'fr': 'Modifier la note',
      'ar': 'تعديل الملاحظة',
      'en': 'Edit the note',
      'es': 'Editar la nota',
      'pt': 'Editar a nota',
    },
    'kkgnrbj3': {
      'fr': 'Enregistrer les modifications',
      'ar': 'حفظ التغييرات',
      'en': 'Save changes',
      'es': 'Guardar cambios',
      'pt': 'Salvar alterações',
    },
    'zqzu5grj': {
      'fr': 'Informations',
      'ar': 'معلومة',
      'en': 'Information',
      'es': 'Información',
      'pt': 'Informação',
    },
    'x9l4xhrf': {
      'fr': 'Dernière modification:',
      'ar': 'آخر تعديل:',
      'en': 'Last modified:',
      'es': 'Última modificación:',
      'pt': 'Última modificação:',
    },
  },
  // loginPage
  {
    'yz055035': {
      'fr':
          'Utilisez Bloc-Notes+ sans attendre. \nVos notes seront sauvegardées sur votre appareil.',
      'ar': 'استخدم Notepad+ دون تأخير.\nسيتم حفظ ملاحظاتك على جهازك.',
      'en':
          'Use Notepad+ right away.\nYour notes will be saved on your device.',
      'es':
          'Utilice Notepad+ sin demora.\nTus notas se guardarán en tu dispositivo.',
      'pt':
          'Use o Notepad+ sem demora.\nSuas notas serão salvas no seu dispositivo.',
    },
    '9qfpjhs2': {
      'fr': 'Commencer à écrire',
      'ar': 'ابدأ الكتابة',
      'en': 'Start writing',
      'es': 'Empieza a escribir',
      'pt': 'Comece a escrever',
    },
  },
  // notationPage
  {
    'ws61hobr': {
      'fr': 'Vous aimez Bloc-Notes+ ?',
      'ar': 'هل تحب Notepad+؟',
      'en': 'Do you like Notepad+?',
      'es': '¿Te gusta Notepad+?',
      'pt': 'Você gosta do Notepad+?',
    },
    'qss6m5pi': {
      'fr':
          'Votre avis compte ! En notant l\'application et en laissant un commentaire, vous nous aidez à l\'améliorer et à la faire découvrir à d\'autres utilisateurs.',
      'ar':
          'رأيك مهم! من خلال تقييم التطبيق وترك تعليق، فإنك تساعدنا على تحسينه وتقديمه للمستخدمين الآخرين.',
      'en':
          'Your opinion matters! By rating the app and leaving a comment, you help us improve it and introduce it to other users.',
      'es':
          '¡Tu opinión importa! Al calificar la aplicación y dejar un comentario, nos ayudas a mejorarla y a presentarla a otros usuarios.',
      'pt':
          'Sua opinião importa! Ao avaliar o aplicativo e deixar um comentário, você nos ajuda a melhorá-lo e apresentá-lo a outros usuários.',
    },
    'liw49jke': {
      'fr': 'Prenez un instant pour noter l\'application',
      'ar': 'خذ لحظة لتقييم التطبيق',
      'en': 'Take a moment to rate the app',
      'es': 'Tómate un momento para calificar la aplicación',
      'pt': 'Reserve um momento para avaliar o aplicativo',
    },
    'w2m67rz2': {
      'fr': 'Noter sur l\'App Store',
      'ar': 'قم بتقييم التطبيق على متجر التطبيقات',
      'en': 'Rate on the App Store',
      'es': 'Calificar en la App Store',
      'pt': 'Avalie na App Store',
    },
  },
  // Miscellaneous
  {
    '92t66fpz': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    '1mnbvb3n': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'd7hbiix7': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'p2a2v9vm': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    '4i0kojxh': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    '7adq45gn': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'mxlv4554': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    '8oaqeiga': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'j1ooxiaf': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'a0ny0i42': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    '13c5gqg3': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    '4xbwmmqa': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    '3vq6jqe9': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    '06rygyv5': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'srml40lx': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'jov0gj3o': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'ijw5ilax': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'hwz17cta': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'v09yqwnw': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'lzds3cvr': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    't9beu8e5': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'njgxjtn1': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'lg4p1u76': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    '46wb2m33': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    '5kr2ebkh': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
  },
].reduce((a, b) => a..addAll(b));
