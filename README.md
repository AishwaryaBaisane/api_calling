# api_calling

## 9.1 Dummy Json API Calling:-

### 🛒 Flutter Product App

#### Description:

- The Flutter Product App is a versatile application designed to showcase and manage products efficiently. 
- It offers a seamless experience across Android and iOS platforms, making it easy for users to browse, search, and purchase products with a smooth and intuitive interface.

#### Features:

- Product Listing: View a comprehensive list of products with detailed information, including descriptions, prices, and images.

- Product Details: Access detailed information about each product, including specifications, reviews, and related items.
- Shopping Cart: Add products to the shopping cart for a streamlined checkout experience.

- Wishlist: Save favorite products to your wishlist for future reference.

#### Technologies Used:

- Flutter: For building a high-performance, cross-platform UI.
- Dart: The programming language used with Flutter for app development.

- Provider: For state management to efficiently handle data and UI updates.

<p>
  <img src = "https://github.com/user-attachments/assets/76b47842-2d0c-48d9-acd8-12a7d94fc4da" height = 25% width = 25% >
  <img src = "https://github.com/user-attachments/assets/00bf953e-1ff6-41d8-9edd-6f0b63cea0fc" height = 25% width = 25% >
  <img src = "https://github.com/user-attachments/assets/2989a4cb-3c57-4dfa-bbb8-4b84e8221fe5" height = 25% width = 25% >
</p>



<div align="center">
<video height="550" src="https://github.com/user-attachments/assets/2da4d4aa-e166-4080-b189-7364418ba3fb"/>
</div>


 ### 🍲 Flutter Recipes App 🍽️

####  Description:

- The Flutter Recipes App is a beautifully designed application that helps users discover, organize, and create recipes with ease.
 - Built using Flutter, this app offers a seamless experience across both Android and iOS platforms, making cooking and meal planning a delightful experience.

#### Features:

- Recipe Discovery: Explore a wide range of recipes with detailed instructions, ingredients, and nutritional information.

- Custom Recipe Creation: Create and edit your own recipes, complete with photos and personalized notes.

- Responsive UI: Enjoy a fluid and intuitive user interface that adapts to any screen size.

#### Technologies Used:

- Flutter: Utilized for developing a high-performance, cross-platform UI.
- Dart: The primary programming language for Flutter development.
cloud storage, and real-time database (optional).
- Provider: State management solution for efficient data handling and UI updates.


<p>
  <img src = "https://github.com/user-attachments/assets/62317dd1-87db-4f11-9dcb-4ba09ae61751" height = 25% width = 25% >
  <img src = "https://github.com/user-attachments/assets/c9e34a2b-6316-42f4-be21-3e50376556b0" height = 25% width = 25% >
  <img src = "https://github.com/user-attachments/assets/ba068993-5afb-4168-95cd-58a7318d446e" height = 25% width = 25% >
</p>


<div align="center">
<video height="550" src="https://github.com/user-attachments/assets/a5e0cbff-fabb-430b-b625-11bead923e31"/>
</div>



## 9.2 Call Pixabay API & Represent in UI.:-

<p>
  <img src = "https://github.com/user-attachments/assets/f7de51f1-a9f8-4d95-ab2a-59fd55869e89" height = 25% width = 25% >
 
</p>


<div align="center">
<video height="550" src="https://github.com/user-attachments/assets/0fb14e9f-6e7f-4b95-af84-be3a84574883"/>
</div>

## Async wallpaper  :-
```dart
dependencies:
  async_wallpaper: ^2.0.0
  flutter_cache_manager: ^3.3.3

  pub get

  import 'package:async_wallpaper/async_wallpaper.dart';

  
```

```dart
String result;
var file = await DefaultCacheManager().getSingleFile(url);
// Platform messages may fail, so we use a try/catch PlatformException.
try {
    result = await AsyncWallpaper.setWallpaperFromFile(
    filePath: file.path,
    wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
    goToHome: goToHome,
    toastDetails: ToastDetails.success(),
    errorToastDetails: ToastDetails.error(),
    )
        ? 'Wallpaper set'
        : 'Failed to get wallpaper.';
} on PlatformException {
    result = 'Failed to get wallpaper.';
}

```
<p>
  <img src = "https://github.com/user-attachments/assets/fd270040-6be1-490f-8248-2d3b297c40d1" height = 25% width = 25% >
  <img src = "https://github.com/user-attachments/assets/3cd7a6aa-2ff2-4065-9a8b-564afc77cdf6" height = 25% width = 25% >
  <img src = "https://github.com/user-attachments/assets/da472894-0bcd-4094-8878-190f97c595c6" height = 25% width = 25% >
</p>


<div align="center">
<video height="550" src="https://github.com/user-attachments/assets/a2f94761-c4bc-4b83-8e6c-7a0bac7bf80a"/>
</div>












