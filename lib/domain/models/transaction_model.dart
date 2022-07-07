class TransactionModel {
  String? transactionId;
  String? merchantId;
  String? merchantTitle;
  double? price;
  int? createdAt;
  bool? repeatingPayment;
  String? type;
  bool? alreadySplitBefore;

  TransactionModel({
    this.transactionId,
    this.merchantId,
    this.merchantTitle,
    this.price,
    this.createdAt,
    this.repeatingPayment,
    this.type,
    this.alreadySplitBefore,
  });

  TransactionModel.fromJson(Map<String, dynamic> json) {
    transactionId = json['transactionId'];
    merchantId = json['merchantId'];
    merchantTitle = json['merchantTitle'];
    price = json['price'];
    createdAt = json['createdAt'];
    repeatingPayment = json['repeatingPayment'];
    type = json['type'];
    alreadySplitBefore = json['alreadySplitBefore'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['transactionId'] = transactionId;
    data['merchantId'] = merchantId;
    data['merchantTitle'] = merchantTitle;
    data['price'] = price;
    data['createdAt'] = createdAt;
    data['repeatingPayment'] = repeatingPayment;
    data['type'] = type;
    data['alreadySplitBefore'] = alreadySplitBefore;
    return data;
  }
}
