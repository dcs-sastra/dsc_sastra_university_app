import 'dart:core';

class ResourcesPODO {
  String category, title, url, imageUrl, description;

  ResourcesPODO(
      this.category, this.title, this.url, this.imageUrl, this.description);

  /*
    category:
          Course
          References
          Community
   */
  @override
  String toString() {
    return """
       {
       $category
       $title
       $description
       $url
       $imageUrl
        }
    """;
  }
}

class ResourcesApi {
  static Future<List<ResourcesPODO>> getResourcesList() async {
    print("getResourcesList");
    List<String> category = [],
        title = [],
        url = [],
        imageUrl = [],
        description = [];
    List<ResourcesPODO> resourcesList = [];

    title.add("Codelabs");
    url.add("https://codelabs.developers.google.com/");
    imageUrl.add("https://i.postimg.cc/vB1yBRVd/codelab.png");
    description.add(
        "Google Developers Codelabs provide a guided, tutorial, hands-on coding experience. Most codelabs will step you through the process of building a small application, or adding a new feature to an existing application. They cover a wide range of topics such as Android Wear, Google Compute Engine, Project Tango, and Google APIs on iOS.");
    category.add("References");

    title.add("Tech Dev Guide");
    url.add("https://techdevguide.withgoogle.com/");
    imageUrl.add("https://i.postimg.cc/1X09y7Nx/tech-dev-guide.png");
    description.add(
        "We’ve carefully curated a collection of material from many sources, including Google, that you can use to supplement your classwork or direct your own learning.");
    category.add("References");

    title.add("Google Design");
    url.add("https://design.google/resources/");
    imageUrl.add("https://i.postimg.cc/6ptNZjPF/google-design.png");
    description.add(
        "A directory of essential design tools and resources to keep your projects moving forward");
    category.add("References");

    title.add("Firebase");
    url.add("https://firebase.google.com/");
    imageUrl.add("https://i.postimg.cc/fbSK8B4v/firebase-head-750x354.png");
    description.add(
        "Firebase is Google's mobile platform that helps you quickly develop high-quality apps and grow your business. It gives you functionality like analytics, databases, messaging and crash reporting so you can move quickly and focus on your users.Firebase is built on Google infrastructure and scales automatically, for even the largest apps.");
    category.add("References");

    title.add("Google Could Platform");
    url.add("https://cloud.google.com/");
    imageUrl.add("https://i.postimg.cc/tCnbyHHd/google-cloud.jpg");
    description.add(
        "Google Cloud Platform lets you build, deploy, and scale applications, websites, and services on the same infrastructure as Google. Helping you build what's next with secure infrastructure, developer tools, APIs, data analytics and machine learning.");
    category.add("References");

    title.add("Quicklabs");
    url.add("https://www.qwiklabs.com/");
    imageUrl.add("https://i.postimg.cc/7Z6JVhv1/quciklab.jpg");
    description.add(
        "Qwiklabs provides real cloud environments that help developers and IT professionals learn cloud platforms and software, such as Firebase, Kubernetes etc.");
    category.add("References");

    title.add("Udacity");
    url.add("https://www.udacity.com/");
    imageUrl.add("https://i.postimg.cc/15Y3yKT6/Udacity-white.png");
    description.add(
        "Learn the latest tech skills to propel your career forward! We provide both free and paid online courses of the cutting edge technologies with the leading industries. With our growing catalog of over 30 Nanodegree programs from beginner to advanced, you're sure to find one that fits your career goals");
    category.add("Course");

    title.add("Google Developers");
    url.add("https://developers.google.com/");
    imageUrl.add("https://i.postimg.cc/cLv5Gg3Z/Webp-net-resizeimage.png");
    description.add(
        "Find out all the updates about Google's Product, Events and Developer Communities.");
    category.add("Community");

    title.add("Flutter");
    url.add("https://flutter.dev/");
    imageUrl.add("https://i.postimg.cc/1z869tJR/flutter-Background.png");
    description.add(
        "Flutter is Google’s UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.");
    category.add("References");

    title.add("Google Assistant");
    url.add("https://developers.google.com/assistant");
    imageUrl.add("https://i.postimg.cc/SR1kNyZq/aog-hero-01-720.png");
    description.add(
        "Help users get things done by integrating your content and services with the Google Assistant.");
    category.add("References");

    title.add("Tensorflow");
    url.add("https://www.tensorflow.org/");
    imageUrl.add("https://i.postimg.cc/0QpPPXLY/TF-Full-Color-Horizontal.png");
    description.add(
        "The core open source library to help you develop and train ML models. Get started quickly by running Colab notebooks directly in your browser.");
    category.add("References");

    title.add("Web");
    url.add("https://developers.google.com/web");
    imageUrl.add("https://i.postimg.cc/15gZr1Cn/web-Background.jpg");
    description.add(
        "Stay up to date on new web platform features, changes to Chrome and more.");
    category.add("References");

    title.add("Android Developer Fundamentals");
    url.add(
        "https://developer.android.com/courses/fundamentals-training/overview-v2");
    imageUrl.add(
        "https://i.postimg.cc/8ztgmkdS/androiddeveloperfundamentals-logo.png");
    description.add(
        "In the Android Developer Fundamentals course, you learn basic Android programming concepts and build a variety of apps, using the Java programming language. You start with Hello World and work your way up to apps that schedule jobs, update settings, and use Android Architecture Components.");
    category.add("Course");

    title.add("Android Kotlin Fundamentals Course");
    url.add(
        "https://codelabs.developers.google.com/android-kotlin-fundamentals/");
    imageUrl.add("https://i.postimg.cc/NMrht13s/images.png");
    description.add(
        "The Android Kotlin Fundamentals course was created by the Google Developers Training team. In the course, you learn Android Kotlin programming concepts and build a variety of apps.");
    category.add("Course");

    title.add("IBM Developer");
    url.add("https://www.youtube.com/user/developerworks/playlists");
    imageUrl.add("https://i.postimg.cc/C1jBXN7t/ibm-deve.jpg");
    description.add(
        "Whatever your experience level, IBM Developer provides the best in open source tech, learning resources, and local meet-ups with our expert Developer Advocates.");
    category.add("References");

    title.add("Free Code Camp");
    url.add("https://www.youtube.com/channel/UC8butISFwT-Wl7EV0hUK0BQ");
    imageUrl.add("https://i.postimg.cc/65tPbJp5/free-code-camp.png");
    description.add(
        "We're an open source community of busy people who learn to code and build projects for nonprofits.");
    category.add("References");

    title.add("Web.dev");
    url.add("https://web.dev/");
    imageUrl.add("https://i.postimg.cc/kG631173/ezgifcom-gif-maker.png");
    description.add(
        "Get the web's modern capabilities on your own sites and apps with useful guidance and analysis from web.dev.");
    category.add("References");

    title.add("Microsoft Virtual Academy");
    url.add("https://docs.microsoft.com/en-us/learn/");
    imageUrl.add("https://i.postimg.cc/L8t0NKFF/mva.png");
    description.add(
        "Whether you're just starting or an experienced professional, our hands-on approach helps you arrive at your goals faster, with more confidence and at your own pace.");
    category.add("References");

    title.add("Codecademy");
    url.add("https://www.codecademy.com/");
    imageUrl.add("https://i.postimg.cc/9XkP9xSP/codecademy-logo.png");
    description.add(
        "From building websites to analyzing data, the choice is yours. Not sure where to start? We'll point you in the right direction.");
    category.add("References");

    title.add("Mozilla Developer Network");
    url.add("https://developer.mozilla.org/en-US/");
    imageUrl.add("https://i.postimg.cc/cLgbYgXC/mdn.jpg");
    description.add("Official developer network of Mozilla Team");
    category.add("References");

    title.add("w3schools");
    url.add("https://www.w3schools.com/");
    imageUrl.add("https://i.postimg.cc/mr9DXFm9/W3-Schools-logo1.png");
    description.add(
        "W3Schools is an educational website for learning web technologies online. Content includes tutorials and references relating to HTML, CSS, JavaScript, JSON, PHP, Python, AngularJS, React.js, SQL, Bootstrap, Sass, Node.js, jQuery, XQuery, AJAX, XML, Raspberry Pi, C++, and Java.");
    category.add("Course");

    title.add("Design Course");
    url.add("https://www.youtube.com/user/DesignCourse");
    imageUrl.add(
        "https://i.postimg.cc/SQZB0pP6/kaleidico-26-MJGn-CM0-Wc-unsplash.jpg");
    description.add(
        "They teach full stack development! Which means you will see tutorials regarding UI/UX, Frontend Dev, Backend Dev, Graphic Design and more!");
    category.add("Course");

    title.add("Nodeschool.io");
    url.add("https://nodeschool.io/");
    imageUrl.add("https://i.postimg.cc/mg0JwccK/node-io.png");
    description.add(
        "Open source workshops that teach web software skills. Do them on your own or at a workshop nearby.");
    category.add("References");

    title.add("More Resources will be added in futher updates!");
    url.add("");
    imageUrl.add("");
    description.add("Stay tuned for the next app update!");
    category.add("References");

    for (int i = 0; i < title.length; i++) {
      print(title[i]);
      resourcesList.add(ResourcesPODO(
          category[i], title[i], url[i], imageUrl[i], description[i]));
    }

    print("resourcesList");
    print(title.length);
    print(category.length);
    print(url.length);
    print(imageUrl.length);
    print(description.length);
    print(resourcesList.length);

    return resourcesList;
  }
}
