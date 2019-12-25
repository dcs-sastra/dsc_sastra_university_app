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

class ClusterGallery {
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

  static getClusterGallery() {
    List<String> MachineLearing = [
      'https://i.postimg.cc/V6NZqJrG/Whats-App-Image-2019-04-09-at-6-07-18-PM.jpg',
      'https://i.postimg.cc/Th8XNVnY/DSC-7082-JPG.jpg ',
      'https://i.postimg.cc/ZYLNpwFq/IMG-20190929-153629-LL.jpg ',
      'https://i.postimg.cc/4dQYv3c0/IMG-20190929-112427.jpg',
      'https://i.postimg.cc/C5vdt6mH/IMG-20190929-113542.jpg ',
      'https://i.postimg.cc/66z7yyt2/IMG-20190929-103630.jpg',
      'https://i.postimg.cc/Z5v07H3p/IMG-20190929-113537.jpg',
      'https://i.postimg.cc/FzKHjVNf/IMG-20190929-113052.jpg',
      'https://i.postimg.cc/NGNMQSkR/IMG-20190929-133809.jpg',
      'https://i.postimg.cc/9Frf0bLK/IMG-20190929-102851.jpg',
      'https://i.postimg.cc/BQknKFy6/IMG-20190929-112915.jpg',
      'https://i.postimg.cc/6QLWgmQ2/IMG-20190929-112921.jpg',
      'https://i.postimg.cc/kGRk32y1/IMG-20190929-133953.jpg',
      'https://i.postimg.cc/F1tw9hW9/IMG-20190929-112413.jpg',
      'https://i.postimg.cc/1RLzg6bz/IMG-20190929-111941.jpg',
      'https://i.postimg.cc/4xGNPGfk/IMG-20190929-112214.jpg',
      'https://i.postimg.cc/6pSKSNwp/IMG-20190929-134442.jpg',
      'https://i.postimg.cc/bvtPfFNH/IMG-20190929-113904.jpg',
      'https://i.postimg.cc/T1CMJzCG/IMG-20190929-113809.jpg ',
      "https://i.postimg.cc/zfZhr6Fq/IMG-20191002-144600.jpg",
      "https://i.postimg.cc/YqTG6ZVQ/IMG-20191002-144620.jpg",
    ];
    List<String> gcp = [
      'https://i.postimg.cc/sgxFzfJR/IMG-20190809-090006-01.jpg',
      'https://i.postimg.cc/GpTZBMN7/IMG-20190809-090042-01.jpg',
      'https://i.postimg.cc/3N16Mz4R/IMG-20190809-092519-01.jpg',
      'https://i.postimg.cc/h41N7QyB/IMG-20190809-092519-02.jpg',
      'https://i.postimg.cc/WbpCmpCJ/IMG-20190809-104127-01.jpg',
      'https://i.postimg.cc/Pr6cSsnV/IMG-20190809-104202-01.jpg',
      'https://i.postimg.cc/wx2bB8Mx/IMG-20190809-120418-01.jpg',
      'https://i.postimg.cc/K8k9Q1N4/IMG-20190809-122036-01.jpg',
      'https://i.postimg.cc/TPntMBB6/IMG-20190809-WA0031-01.jpg',
      'https://i.postimg.cc/jSpM1Rgc/IMG-20190809-123438-01.jpg',
      'https://i.postimg.cc/7htVn4Jg/IMG-20190809-WA0032-01.jpg',
      'https://i.postimg.cc/8c7WD6s6/IMG-20190725-175259-LL.jpg',
      'https://i.postimg.cc/t701jvLK/IMG-20190725-181901.jpg',
      'https://i.postimg.cc/dVYBR5LN/IMG-20190725-182115-1.jpg',
      'https://i.postimg.cc/wvZ51VCV/IMG-20190725-182803.jpg',
      'https://i.postimg.cc/T25qZzbH/IMG-20190725-183843.jpg',
      'https://i.postimg.cc/9FGPfyJd/IMG-20190927-WA0034.jpg',
      'https://i.postimg.cc/3JFTFbtd/IMG-20190802-174300-1.jpg',
      'https://i.postimg.cc/Gp2d2JJ9/IMG-20190802-170513.jpg',
      'https://i.postimg.cc/wj96Kd1X/IMG-20190802-170411.jpg',
      'https://i.postimg.cc/k5BP9Mqb/IMG-20190802-170545.jpg',
      'https://i.postimg.cc/7Pg8qW8m/IMG-20190802-170609.jpg',
      'https://i.postimg.cc/YqqXTnp4/IMG-20190802-170946.jpg',
      'https://i.postimg.cc/MTq0VHHc/IMG-20190802-174315-1.jpg',
      'https://i.postimg.cc/pVmF147c/DSC1-20190923-180457.jpg',
      'https://i.postimg.cc/d0RB3pvj/IMG-20190923-175601-LL.jpg',
      'https://i.postimg.cc/WtRFMpwF/IMG-20190923-174547-LL.jpg ',
      'https://i.postimg.cc/FF6jrN3Q/IMG-20190923-175613-LL.jpg'
    ];
    List<String> flutter = [
      'https://i.postimg.cc/6qQ3NJjb/IMG-20191221-101508.jpg ',
      'https://i.postimg.cc/zBZX3Hdh/IMG-20191221-094604-01.jpg',
      'https://i.postimg.cc/x89f3DVT/IMG-20191221-095804-01.jpg',
      'https://i.postimg.cc/Kc5vvztK/IMG-20191221-095900-01.jpg',
      'https://i.postimg.cc/8kX9HgSK/IMG-20191217-201007-LL.jpg ',
      'https://i.postimg.cc/zB8Z9Ctx/IMG-20191221-115541-LL-01.jpg ',
      'https://i.postimg.cc/3wp3MJKx/IMG-20191221-102305-02.jpg',
      'https://i.postimg.cc/wMWp51k0/IMG-20191221-102507-01.jpg ',
      'https://i.postimg.cc/L8JHT3wf/IMG-20191221-101820-01.jpg',
      'https://i.postimg.cc/m2DcvMKZ/IMG-20191221-095952.jpg ',
      'https://i.postimg.cc/yYtN2GFn/IMG-20191221-100028.jpg ',
      'https://i.postimg.cc/nccVsJ13/IMG-20191221-100125-01.jpg',
      'https://i.postimg.cc/XJLS3rt4/IMG20191221164816-01.jpg',
      'https://i.postimg.cc/vTmRmQd9/IMG20191221164857-01.jpg',
      'https://i.postimg.cc/CMvTQfj4/IMG20191221164922-01.jpg',
      'https://i.postimg.cc/SRR5hDWf/IMG20191221165229.jpg',
      'https://i.postimg.cc/vmyNBQrB/IMG-20191221-120623-LL.jpg',
      'https://i.postimg.cc/mD5jQRH7/IMG20191221164538.jpg',
      'https://i.postimg.cc/28hp89s0/IMG-20191221-120900-LL.jpg',
      'https://i.postimg.cc/TYrSXLbS/IMG-20191221-095529.jpg',
      'https://i.postimg.cc/DZ9C9nwn/IMG-20191221-164517.jpg',
      'https://i.postimg.cc/rwDrrW9Z/IMG20191221164533.jpg',
      'https://i.postimg.cc/m2DcvMKZ/IMG-20191221-095952.jpg'
    ];
    List<String> eventCoverage = [
      'https://i.postimg.cc/9M175Bpb/DSC-4568.jpg',
      'https://i.postimg.cc/GtHH0n93/DSC-4580.jpg',
      'https://i.postimg.cc/3xgWQBrG/DSC-4582.jpg',
      'https://i.postimg.cc/q7wRzv3M/DSC-4583.jpg',
      'https://i.postimg.cc/d0f2SFq6/DSC-4625-JPG.jpg',
      'https://i.postimg.cc/qBysQWWc/DSC-4660-JPG.jpg',
      'https://i.postimg.cc/nc1vfBFC/DSC-4661-JPG.jpg',
      'https://i.postimg.cc/zBffWYCw/DSC-4590.jpg',
      'https://i.postimg.cc/P59GKsnz/DSC-4663.jpg',
      'https://i.postimg.cc/GhTxYZz1/DSC-4666.jpg',
      'https://i.postimg.cc/L8dBVN0g/DSC-4671.jpg',
      'https://i.postimg.cc/C53DmxJp/DSC-4695.jpg',
      'https://i.postimg.cc/T3qmJGDB/DSC-4678.jpg',
      'https://i.postimg.cc/FKrSPqbz/DSC-4697.jpg',
      'https://i.postimg.cc/xd6zBRgR/DSC-4706.jpg',
      'https://i.postimg.cc/63TvKvmN/DSC-4709.jpg',
      'https://i.postimg.cc/0NynBZ7k/DSC-4711.jpg',
      'https://i.postimg.cc/KjG8PKdH/IMG-20190824-WA0035.jpg',
      'https://i.postimg.cc/QNmtXb7G/IMG-20190824-WA0037.jpg',
      'https://i.postimg.cc/SKbqL29f/IMG-20190824-WA0046.jpg',
      'https://i.postimg.cc/7ZgjkBCS/Whats-App-Image-2019-09-24-at-12-10-28-AM-1.jpg',
      'https://i.postimg.cc/gjCB9RmM/Whats-App-Image-2019-09-24-at-12-10-28-AM.jpg',
      'https://i.postimg.cc/pXQgNG5z/IMG-20191008-203140.jpg '
    ];

    Map<String, List<ClusterGallery>> clusterGallery = new Map();
    clusterGallery["App Development"] = new List();
    clusterGallery["App Development"].add(new ClusterGallery(
        "https://i.postimg.cc/Kvtd0yVb/IMG-20191002-155654.jpg"));
    clusterGallery["App Development"].add(new ClusterGallery(
        "https://i.postimg.cc/V63VF7W5/IMG-20191002-155945.jpg"));
    clusterGallery["App Development"].add(new ClusterGallery(
        "https://i.postimg.cc/BZHY0BCc/IMG-20191002-154221-LL.jpg"));
    clusterGallery["App Development"].add(new ClusterGallery(
        "https://i.postimg.cc/9Fcpj50C/IMG-20191002-155858.jpg"));
    clusterGallery["App Development"].add(new ClusterGallery(
        "https://i.postimg.cc/zv8n5KJ0/IMG-20191002-155647.jpg"));
    clusterGallery["App Development"].add(new ClusterGallery(
        "https://i.postimg.cc/fRpmy6z3/IMG-20191002-155658.jpg"));
    clusterGallery["App Development"].add(new ClusterGallery(
        "https://i.postimg.cc/cCx8PWmz/IMG-20191002-155711.jpg"));
    clusterGallery["App Development"].add(new ClusterGallery(
        "https://i.postimg.cc/T20bgy2v/IMG-20191002-155810.jpg"));
    clusterGallery["App Development"].add(new ClusterGallery(
        "https://i.postimg.cc/zfTbBv2M/IMG-20191002-155701.jpg"));

    clusterGallery["Web Development"] = new List();
    clusterGallery["Web Development"].add(new ClusterGallery(
        "https://i.postimg.cc/qM2QSPKx/IMG-20190928-164334-LL.jpg"));
    clusterGallery["Web Development"].add(new ClusterGallery(
        "https://i.postimg.cc/W12mKhTs/IMG-20190928-164339-LL.jpg"));
    clusterGallery["Web Development"].add(new ClusterGallery(
        "https://i.postimg.cc/L8nkRGYW/IMG-20190928-164630.jpg"));
    clusterGallery["Web Development"].add(new ClusterGallery(
        "https://i.postimg.cc/90LTHBWV/IMG-20190928-170620-LL.jpg"));
    clusterGallery["Web Development"].add(new ClusterGallery(
        "https://i.postimg.cc/wMjy2sDr/IMG-20190928-164811.jpg"));
    clusterGallery["Web Development"].add(new ClusterGallery(
        "https://i.postimg.cc/635pxxT2/IMG-20190928-180651.jpg"));
    clusterGallery["Web Development"].add(new ClusterGallery(
        "https://i.postimg.cc/vmPcBZJL/IMG-20190928-180655-LL.jpg"));

    clusterGallery["Flutter"] = new List();
    for (int i = 0; i < MachineLearing.length; i++) {
      clusterGallery["Flutter"].add(ClusterGallery(flutter[i]));
    }

    clusterGallery["AR/VR"] = new List();
    clusterGallery["AR/VR"].add(new ClusterGallery(""));
    clusterGallery["AR/VR"].add(new ClusterGallery(""));
    clusterGallery["AR/VR"].add(new ClusterGallery(""));

    clusterGallery["Google Cloud Platform"] = new List();

    for (int i = 0; i < MachineLearing.length; i++) {
      clusterGallery["Google Cloud Platform"].add(ClusterGallery(gcp[i]));
    }

    clusterGallery["Machine Learning"] = new List();
    for (int i = 0; i < MachineLearing.length; i++) {
      clusterGallery["Machine Learning"].add(ClusterGallery(MachineLearing[i]));
    }
    clusterGallery["Event Coverage"] = new List();
    for (int i = 0; i < MachineLearing.length; i++) {
      clusterGallery["Event Coverage"].add(ClusterGallery(eventCoverage[i]));
    }

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
