; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!526 () Bool)

(assert start!526)

(declare-fun b!1505 () Bool)

(declare-fun e!932 () Bool)

(declare-datatypes ((array!126 0))(
  ( (array!127 (arr!433 (Array (_ BitVec 32) (_ BitVec 8))) (size!46 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!76 0))(
  ( (BitStream!77 (buf!358 array!126) (currentByte!1304 (_ BitVec 32)) (currentBit!1299 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!106 0))(
  ( (tuple2!107 (_1!53 BitStream!76) (_2!53 Bool)) )
))
(declare-fun lt!1073 () tuple2!106)

(declare-fun lt!1069 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!1505 (= e!932 (= (bitIndex!0 (size!46 (buf!358 (_1!53 lt!1073))) (currentByte!1304 (_1!53 lt!1073)) (currentBit!1299 (_1!53 lt!1073))) lt!1069))))

(declare-fun b!1506 () Bool)

(declare-fun e!933 () Bool)

(declare-fun thiss!932 () BitStream!76)

(declare-fun array_inv!43 (array!126) Bool)

(assert (=> b!1506 (= e!933 (array_inv!43 (buf!358 thiss!932)))))

(declare-fun b!1507 () Bool)

(declare-fun e!934 () Bool)

(declare-fun e!935 () Bool)

(assert (=> b!1507 (= e!934 e!935)))

(declare-fun res!3561 () Bool)

(assert (=> b!1507 (=> (not res!3561) (not e!935))))

(declare-fun lt!1072 () (_ BitVec 64))

(declare-fun lt!1070 () (_ BitVec 64))

(assert (=> b!1507 (= res!3561 (= lt!1072 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!1070)))))

(declare-datatypes ((Unit!37 0))(
  ( (Unit!38) )
))
(declare-datatypes ((tuple2!108 0))(
  ( (tuple2!109 (_1!54 Unit!37) (_2!54 BitStream!76)) )
))
(declare-fun lt!1071 () tuple2!108)

(assert (=> b!1507 (= lt!1072 (bitIndex!0 (size!46 (buf!358 (_2!54 lt!1071))) (currentByte!1304 (_2!54 lt!1071)) (currentBit!1299 (_2!54 lt!1071))))))

(assert (=> b!1507 (= lt!1070 (bitIndex!0 (size!46 (buf!358 thiss!932)) (currentByte!1304 thiss!932) (currentBit!1299 thiss!932)))))

(declare-fun b!1508 () Bool)

(declare-fun e!931 () Bool)

(declare-fun e!930 () Bool)

(assert (=> b!1508 (= e!931 e!930)))

(declare-fun res!3556 () Bool)

(assert (=> b!1508 (=> (not res!3556) (not e!930))))

(declare-fun lt!1067 () (_ BitVec 64))

(assert (=> b!1508 (= res!3556 (= lt!1069 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!1067)))))

(assert (=> b!1508 (= lt!1069 (bitIndex!0 (size!46 (buf!358 (_2!54 lt!1071))) (currentByte!1304 (_2!54 lt!1071)) (currentBit!1299 (_2!54 lt!1071))))))

(assert (=> b!1508 (= lt!1067 (bitIndex!0 (size!46 (buf!358 thiss!932)) (currentByte!1304 thiss!932) (currentBit!1299 thiss!932)))))

(declare-fun b!1509 () Bool)

(declare-fun res!3555 () Bool)

(assert (=> b!1509 (=> (not res!3555) (not e!935))))

(declare-fun isPrefixOf!0 (BitStream!76 BitStream!76) Bool)

(assert (=> b!1509 (= res!3555 (isPrefixOf!0 thiss!932 (_2!54 lt!1071)))))

(declare-fun b!1510 () Bool)

(declare-fun e!928 () Bool)

(declare-fun lt!1068 () tuple2!106)

(assert (=> b!1510 (= e!928 (= (bitIndex!0 (size!46 (buf!358 (_1!53 lt!1068))) (currentByte!1304 (_1!53 lt!1068)) (currentBit!1299 (_1!53 lt!1068))) lt!1072))))

(declare-fun b!1511 () Bool)

(declare-fun res!3559 () Bool)

(assert (=> b!1511 (=> (not res!3559) (not e!930))))

(assert (=> b!1511 (= res!3559 (isPrefixOf!0 thiss!932 (_2!54 lt!1071)))))

(declare-fun res!3560 () Bool)

(declare-fun e!929 () Bool)

(assert (=> start!526 (=> (not res!3560) (not e!929))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!526 (= res!3560 (validate_offset_bit!0 ((_ sign_extend 32) (size!46 (buf!358 thiss!932))) ((_ sign_extend 32) (currentByte!1304 thiss!932)) ((_ sign_extend 32) (currentBit!1299 thiss!932))))))

(assert (=> start!526 e!929))

(declare-fun inv!12 (BitStream!76) Bool)

(assert (=> start!526 (and (inv!12 thiss!932) e!933)))

(declare-fun b!1504 () Bool)

(assert (=> b!1504 (= e!935 e!928)))

(declare-fun res!3554 () Bool)

(assert (=> b!1504 (=> (not res!3554) (not e!928))))

(assert (=> b!1504 (= res!3554 (and (_2!53 lt!1068) (= (_1!53 lt!1068) (_2!54 lt!1071))))))

(declare-fun readBitPure!0 (BitStream!76) tuple2!106)

(declare-fun readerFrom!0 (BitStream!76 (_ BitVec 32) (_ BitVec 32)) BitStream!76)

(assert (=> b!1504 (= lt!1068 (readBitPure!0 (readerFrom!0 (_2!54 lt!1071) (currentBit!1299 thiss!932) (currentByte!1304 thiss!932))))))

(declare-fun b!1512 () Bool)

(assert (=> b!1512 (= e!930 e!932)))

(declare-fun res!3562 () Bool)

(assert (=> b!1512 (=> (not res!3562) (not e!932))))

(assert (=> b!1512 (= res!3562 (and (_2!53 lt!1073) (= (_1!53 lt!1073) (_2!54 lt!1071))))))

(assert (=> b!1512 (= lt!1073 (readBitPure!0 (readerFrom!0 (_2!54 lt!1071) (currentBit!1299 thiss!932) (currentByte!1304 thiss!932))))))

(declare-fun b!1513 () Bool)

(assert (=> b!1513 (= e!929 (not e!931))))

(declare-fun res!3557 () Bool)

(assert (=> b!1513 (=> (not res!3557) (not e!931))))

(assert (=> b!1513 (= res!3557 (= (size!46 (buf!358 (_2!54 lt!1071))) (size!46 (buf!358 thiss!932))))))

(assert (=> b!1513 e!934))

(declare-fun res!3558 () Bool)

(assert (=> b!1513 (=> (not res!3558) (not e!934))))

(assert (=> b!1513 (= res!3558 (= (size!46 (buf!358 thiss!932)) (size!46 (buf!358 (_2!54 lt!1071)))))))

(declare-fun appendBit!0 (BitStream!76 Bool) tuple2!108)

(assert (=> b!1513 (= lt!1071 (appendBit!0 thiss!932 true))))

(assert (= (and start!526 res!3560) b!1513))

(assert (= (and b!1513 res!3558) b!1507))

(assert (= (and b!1507 res!3561) b!1509))

(assert (= (and b!1509 res!3555) b!1504))

(assert (= (and b!1504 res!3554) b!1510))

(assert (= (and b!1513 res!3557) b!1508))

(assert (= (and b!1508 res!3556) b!1511))

(assert (= (and b!1511 res!3559) b!1512))

(assert (= (and b!1512 res!3562) b!1505))

(assert (= start!526 b!1506))

(declare-fun m!1087 () Bool)

(assert (=> b!1509 m!1087))

(declare-fun m!1089 () Bool)

(assert (=> b!1508 m!1089))

(declare-fun m!1091 () Bool)

(assert (=> b!1508 m!1091))

(declare-fun m!1093 () Bool)

(assert (=> b!1513 m!1093))

(assert (=> b!1511 m!1087))

(declare-fun m!1095 () Bool)

(assert (=> b!1512 m!1095))

(assert (=> b!1512 m!1095))

(declare-fun m!1097 () Bool)

(assert (=> b!1512 m!1097))

(declare-fun m!1099 () Bool)

(assert (=> b!1510 m!1099))

(declare-fun m!1101 () Bool)

(assert (=> start!526 m!1101))

(declare-fun m!1103 () Bool)

(assert (=> start!526 m!1103))

(declare-fun m!1105 () Bool)

(assert (=> b!1506 m!1105))

(declare-fun m!1107 () Bool)

(assert (=> b!1505 m!1107))

(assert (=> b!1504 m!1095))

(assert (=> b!1504 m!1095))

(assert (=> b!1504 m!1097))

(assert (=> b!1507 m!1089))

(assert (=> b!1507 m!1091))

(push 1)

(assert (not b!1511))

(assert (not b!1504))

(assert (not b!1510))

(assert (not b!1505))

(assert (not b!1513))

(assert (not b!1507))

(assert (not b!1508))

(assert (not start!526))

(assert (not b!1506))

(assert (not b!1509))

(assert (not b!1512))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

