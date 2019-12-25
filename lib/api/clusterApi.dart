import 'dart:convert';

import 'package:http/http.dart' as http;
import 'env.dart';

class ClusterPODO {
  String id, name, img, backgroundColor, link, createdAt, updatedAt;

  ClusterPODO.fromMap(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    img = json["id"];
    backgroundColor = json["backgroundColor"];
    link = json["link"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
  }

  @override
  String toString() {
    return """
      {
        id: $id,
        name: $name,
        img: $img,
        backgroundColor: $backgroundColor,
        link: $link
      }
      """;
  }
}

class ClusterGallery{
  String url;
  ClusterGallery(this.url);
}
class ClusterApi {
  static getClusters() async {
    List temp = jsonDecode((await http.get(clustersListURL)).body)
        .map((f) => ClusterPODO.fromMap(f))
        .toList();
    print(temp);
    return temp;
  }

  static getClusterGallery(){
    Map<String, List<ClusterGallery>> clusterGallery = new Map();
    clusterGallery["App Development"] = new List();
    clusterGallery["App Development"].add(new ClusterGallery("https://i.postimg.cc/Kvtd0yVb/IMG-20191002-155654.jpg"));
    clusterGallery["App Development"].add(new ClusterGallery("https://i.postimg.cc/V63VF7W5/IMG-20191002-155945.jpg"));
    clusterGallery["App Development"].add(new ClusterGallery("https://i.postimg.cc/BZHY0BCc/IMG-20191002-154221-LL.jpg"));
    clusterGallery["App Development"].add(new ClusterGallery("https://i.postimg.cc/9Fcpj50C/IMG-20191002-155858.jpg"));
    clusterGallery["App Development"].add(new ClusterGallery("https://i.postimg.cc/zv8n5KJ0/IMG-20191002-155647.jpg"));
    clusterGallery["App Development"].add(new ClusterGallery("https://i.postimg.cc/fRpmy6z3/IMG-20191002-155658.jpg"));
    clusterGallery["App Development"].add(new ClusterGallery("https://i.postimg.cc/cCx8PWmz/IMG-20191002-155711.jpg"));
    clusterGallery["App Development"].add(new ClusterGallery("https://i.postimg.cc/T20bgy2v/IMG-20191002-155810.jpg"));
    clusterGallery["App Development"].add(new ClusterGallery("https://i.postimg.cc/zfTbBv2M/IMG-20191002-155701.jpg"));

    clusterGallery["Web Development"] = new List();
    clusterGallery["Web Development"].add(new ClusterGallery("https://i.postimg.cc/qM2QSPKx/IMG-20190928-164334-LL.jpg"));
    clusterGallery["Web Development"].add(new ClusterGallery("https://i.postimg.cc/W12mKhTs/IMG-20190928-164339-LL.jpg"));
    clusterGallery["Web Development"].add(new ClusterGallery("https://i.postimg.cc/L8nkRGYW/IMG-20190928-164630.jpg"));
    clusterGallery["Web Development"].add(new ClusterGallery("https://i.postimg.cc/90LTHBWV/IMG-20190928-170620-LL.jpg"));
    clusterGallery["Web Development"].add(new ClusterGallery("https://i.postimg.cc/wMjy2sDr/IMG-20190928-164811.jpg"));
    clusterGallery["Web Development"].add(new ClusterGallery("https://i.postimg.cc/635pxxT2/IMG-20190928-180651.jpg"));
    clusterGallery["Web Development"].add(new ClusterGallery("https://i.postimg.cc/vmPcBZJL/IMG-20190928-180655-LL.jpg"));


    clusterGallery["Flutter"] = new List();
    clusterGallery["Flutter"].add(new ClusterGallery("https://i.postimg.cc/44H6k4sD/IMG-20190929-103134.jpg"));
    clusterGallery["Flutter"].add(new ClusterGallery("https://i.postimg.cc/MGhGySNB/IMG-20190929-145249.jpg"));
    clusterGallery["Flutter"].add(new ClusterGallery("https://i.postimg.cc/63vyS3nz/IMG-20190929-120907.jpg"));
    clusterGallery["Flutter"].add(new ClusterGallery("https://i.postimg.cc/zXSR8VMc/IMG-20190929-065327.jpg"));
    clusterGallery["Flutter"].add(new ClusterGallery("https://i.postimg.cc/gJFYxKLq/DSC-4718.jpg"));
    clusterGallery["Flutter"].add(new ClusterGallery("https://i.postimg.cc/GtzrSw7q/DSC-4723.jpg"));
    clusterGallery["Flutter"].add(new ClusterGallery("https://i.postimg.cc/qMMp6qqY/DSC-4727.jpg"));
    clusterGallery["Flutter"].add(new ClusterGallery("https://i.postimg.cc/Bv3YtLQP/IMG20190929162710.jpg"));
    clusterGallery["Flutter"].add(new ClusterGallery("https://i.postimg.cc/cCvTPfT2/IMG20190929113731.jpg"));
    clusterGallery["Flutter"].add(new ClusterGallery("https://i.postimg.cc/3Nz9hWcR/IMG20190929162701.jpg"));
    clusterGallery["Flutter"].add(new ClusterGallery("https://i.postimg.cc/9M8JxLPy/IMG-20190929-145101.jpg"));
    clusterGallery["Flutter"].add(new ClusterGallery("https://i.postimg.cc/x1Mp0yYS/IMG20190929113506.jpg"));

    clusterGallery["AR/VR"] = new List();
    clusterGallery["AR/VR"].add(new ClusterGallery(""));
    clusterGallery["AR/VR"].add(new ClusterGallery(""));
    clusterGallery["AR/VR"].add(new ClusterGallery(""));

    clusterGallery["Google Cloud Platform"] = new List();
    clusterGallery["Google Cloud Platform"].add(new ClusterGallery("https://i.postimg.cc/sgxFzfJR/IMG-20190809-090006-01.jpg"));
    clusterGallery["Google Cloud Platform"].add(new ClusterGallery("https://i.postimg.cc/GpTZBMN7/IMG-20190809-090042-01.jpg"));
    clusterGallery["Google Cloud Platform"].add(new ClusterGallery("https://i.postimg.cc/h41N7QyB/IMG-20190809-092519-02.jpg"));

    clusterGallery["Google Cloud Platform"].add(new ClusterGallery("https://i.postimg.cc/3N16Mz4R/IMG-20190809-092519-01.jpg"));
    clusterGallery["Google Cloud Platform"].add(new ClusterGallery("https://i.postimg.cc/WbpCmpCJ/IMG-20190809-104127-01.jpg"));
    clusterGallery["Google Cloud Platform"].add(new ClusterGallery("https://i.postimg.cc/Pr6cSsnV/IMG-20190809-104202-01.jpg"));
    clusterGallery["Google Cloud Platform"].add(new ClusterGallery("https://i.postimg.cc/wx2bB8Mx/IMG-20190809-120418-01.jpg"));
    clusterGallery["Google Cloud Platform"].add(new ClusterGallery("https://i.postimg.cc/K8k9Q1N4/IMG-20190809-122036-01.jpg"));

    clusterGallery["Google Cloud Platform"].add(new ClusterGallery("https://i.postimg.cc/TPntMBB6/IMG-20190809-WA0031-01.jpg"));


    clusterGallery["Machine Learning"] = new List();
    clusterGallery["Machine Learning"].add(new ClusterGallery("https://i.postimg.cc/HL5rvnQz/DSC-7012.jpg"));
    clusterGallery["Machine Learning"].add(new ClusterGallery("https://i.postimg.cc/W1qztzfV/DSC-7015.jpg"));
    clusterGallery["Machine Learning"].add(new ClusterGallery("https://i.postimg.cc/wvwgwYbF/DSC-7030.jpg"));
    clusterGallery["Machine Learning"].add(new ClusterGallery("https://i.postimg.cc/Zn0ZgsGm/DSC-7037.jpg"));
    clusterGallery["Machine Learning"].add(new ClusterGallery("https://i.postimg.cc/6pB0Vsny/MG-0679.jpg"));
    clusterGallery["Machine Learning"].add(new ClusterGallery("https://i.postimg.cc/fTtDfF7j/DSC-7060.jpg"));
    clusterGallery["Machine Learning"].add(new ClusterGallery("https://i.postimg.cc/kXmPW449/DSC-7198.jpg"));
    clusterGallery["Machine Learning"].add(new ClusterGallery("https://i.postimg.cc/3NMjdz3r/MG-0712.jpg"));
    clusterGallery["Machine Learning"].add(new ClusterGallery("https://i.postimg.cc/C1q9qTpz/DSC-7234.jpg"));
    clusterGallery["Machine Learning"].add(new ClusterGallery("https://i.postimg.cc/W19RRw7b/Whats-App-Image-2019-04-09-at-6-07-23-PM.jpg"));
    clusterGallery["Machine Learning"].add(new ClusterGallery("https://i.postimg.cc/HL5t0pjD/DSC-7219.jpg"));
    clusterGallery["Machine Learning"].add(new ClusterGallery("https://i.postimg.cc/zvPWZM3F/DSC-7175-JPG.jpg"));
    clusterGallery["Machine Learning"].add(new ClusterGallery("https://i.postimg.cc/448p9KwH/DSC-7290-JPG.jpg"));


    clusterGallery["Event Coverage"] = new List();
    clusterGallery["Event Coverage"].add(new ClusterGallery("https://i.postimg.cc/448p9KwH/DSC-7290-JPG.jpg"));
    clusterGallery["Event Coverage"].add(new ClusterGallery("https://i.postimg.cc/GtHH0n93/DSC-4580.jpg"));
    clusterGallery["Event Coverage"].add(new ClusterGallery("https://i.postimg.cc/3xgWQBrG/DSC-4582.jpg"));
    clusterGallery["Event Coverage"].add(new ClusterGallery("https://i.postimg.cc/q7wRzv3M/DSC-4583.jpg"));
    clusterGallery["Event Coverage"].add(new ClusterGallery("https://i.postimg.cc/d0f2SFq6/DSC-4625-JPG.jpg"));
    clusterGallery["Event Coverage"].add(new ClusterGallery("https://i.postimg.cc/qBysQWWc/DSC-4660-JPG.jpg"));
    clusterGallery["Event Coverage"].add(new ClusterGallery("https://i.postimg.cc/nc1vfBFC/DSC-4661-JPG.jpg"));
    clusterGallery["Event Coverage"].add(new ClusterGallery("https://i.postimg.cc/zBffWYCw/DSC-4590.jpg"));
    clusterGallery["Event Coverage"].add(new ClusterGallery("https://i.postimg.cc/P59GKsnz/DSC-4663.jpg"));
    clusterGallery["Event Coverage"].add(new ClusterGallery("https://i.postimg.cc/GhTxYZz1/DSC-4666.jpg"));
    clusterGallery["Event Coverage"].add(new ClusterGallery("https://i.postimg.cc/L8dBVN0g/DSC-4671.jpg"));
    clusterGallery["Event Coverage"].add(new ClusterGallery("https://i.postimg.cc/C53DmxJp/DSC-4695.jpg"));

    

    clusterGallery["Content writing"] = new List();
    

    clusterGallery["Marketing"] = new List();


    clusterGallery["Graphic Designing"] = new List();


    clusterGallery[""] = new List();
    clusterGallery[""].add(new ClusterGallery(""));
    clusterGallery[""].add(new ClusterGallery(""));
    clusterGallery[""].add(new ClusterGallery(""));
    clusterGallery[""].add(new ClusterGallery(""));
    clusterGallery[""].add(new ClusterGallery(""));
    clusterGallery[""].add(new ClusterGallery(""));
    clusterGallery[""].add(new ClusterGallery(""));
    clusterGallery[""].add(new ClusterGallery(""));
    clusterGallery[""].add(new ClusterGallery(""));
    clusterGallery[""].add(new ClusterGallery(""));
    clusterGallery[""].add(new ClusterGallery(""));


    clusterGallery[""] = new List();
    clusterGallery[""].add(new ClusterGallery(""));
    clusterGallery[""].add(new ClusterGallery(""));
    clusterGallery[""].add(new ClusterGallery(""));
    clusterGallery[""].add(new ClusterGallery(""));
    clusterGallery[""].add(new ClusterGallery(""));
    clusterGallery[""].add(new ClusterGallery(""));
    clusterGallery[""].add(new ClusterGallery(""));
    clusterGallery[""].add(new ClusterGallery(""));
    clusterGallery[""].add(new ClusterGallery(""));
    clusterGallery[""].add(new ClusterGallery(""));
    clusterGallery[""].add(new ClusterGallery(""));


    clusterGallery[""] = new List();
    clusterGallery[""].add(new ClusterGallery(""));
    clusterGallery[""].add(new ClusterGallery(""));
    clusterGallery[""].add(new ClusterGallery(""));
    clusterGallery[""].add(new ClusterGallery(""));
    clusterGallery[""].add(new ClusterGallery(""));
    clusterGallery[""].add(new ClusterGallery(""));
    clusterGallery[""].add(new ClusterGallery(""));
    clusterGallery[""].add(new ClusterGallery(""));
    clusterGallery[""].add(new ClusterGallery(""));
    clusterGallery[""].add(new ClusterGallery(""));
    clusterGallery[""].add(new ClusterGallery(""));

    return clusterGallery;
  }
}
