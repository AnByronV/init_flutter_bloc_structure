# Flutter Clean Architecture
This project is a Flutter project that uses the Clean Architecture pattern. The project is structured in a way that is easy to understand and maintain. The project is based on the BLoC pattern and uses the GetIt package for dependency injection.

## The way to structure the project will be the combination of three design patterns:
- From the official Flutter BLoC: [url](https://bloclibrary.dev/architecture/) and one of its usage examples: [url](https://bloclibrary.dev/tutorials/flutter-infinite-list/)
- From the web Code With Andrea: [url](https://codewithandrea.com/articles/flutter-project-structure/)


## 1. Necessary packages
### Initial packages for using BLoC and application navigation:
```
flutter_bloc, bloc, equatable, get_it, go_router, hydrated_bloc, path_provider
```

### Package for [internationalization](https://docs.flutter.dev/ui/accessibility-and-internationalization/internationalization):
In this case it's necessary to add the following packages:
```
flutter pub add flutter_localizations --sdk=flutter
flutter pub add intl:any
```

And in the pubspec.yaml file add the following configuration:
```yaml
flutter:
  generate: true
```


## 2. Folder structure
```
lib
│
├───config
│   ├───helpers
│   ├───router
|       ├───app_router.dart
│   ├───theme
│       ├───app_theme.dart
│   ├───config.dart*
│
├───application
│   ├───blocs
│       ├───blocs
│       ├───service_locator.dart
│       ├───simple_bloc_observer.dart
|       ├───blocs.dart*
│   ├───presentation
│       ├───page
│           ├───blocs
│               ├───blocs.dart*
│           ├───models
│               ├───models.dart*
│           ├───view
│               ├───view_page.dart
|               ├───view.dart*
│           ├───widgets
│               ├───widgets.dart*
│           ├───page.dart*
│       ├───screens.dart*
|   ├───app.dart
│
├───data
│
├───domain
│
├───l10n
│   ├───intl_es.arb
│   ├───intl_en.arb
│   ├───l10n.dart
|
├───main.dart
```
## 3. Folder structure explanation

- **config**: Contains the application configuration.
    - **helpers**: Contains the help files.
    - **router**: Contains the route configuration file of the application.
    - **theme**: Contains the application theme configuration file.
    - **config.dart**: Contains the application configuration (It is a barrel).
- **application**: Contains the application logic.
    - **blocs**: Contains the BLoCs files of the application, these are the General blocs of the application.
    - **presentation**: Contains the presentation of the application. It can contain multiple pages.
        - **page**: Contains the pages of the application.
            - **blocs**: Contains the page BLoCs.
            - **models**: Contains the page models. It has a barrel to export the models (models.dart).
            - **view**: Contains the views of the pages. Contains a post_page.dart which is the view of the page and a barrel to export the view (view.dart).
            - **widgets**: Contains the widgets that the page has and a barrel to export the widgets (widgets.dart).
            - **page.dart**: Contains the page barrel.
        - **screens.dart**: Contains the application screens in a barrel.
    - **app.dart**: Contains the application. This file includes the application theme and makes use of RouterSimpleCubit for application navigation. And of localeProvider for application internationalization.
- **data**: Contains the application data. This layer is responsible for the repositories and the connection to the database.
- **domain**: Contains the general models of the application.
- **l10n**: Contains the application internationalization files.
    - **intl_es.arb**: Contains the translations to Spanish.
    - **intl_en.arb**: Contains the translations to English.
    - **l10n.dart**: Contains the application internationalization.
- **main.dart**: Contains the entry point of the application.

Note: The elements marked with (*) represent a barrel file.
