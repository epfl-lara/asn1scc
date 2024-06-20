; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!528 () Bool)

(assert start!528)

(declare-fun b!1534 () Bool)

(declare-fun e!961 () Bool)

(declare-fun e!955 () Bool)

(assert (=> b!1534 (= e!961 (not e!955))))

(declare-fun res!3589 () Bool)

(assert (=> b!1534 (=> (not res!3589) (not e!955))))

(declare-datatypes ((array!128 0))(
  ( (array!129 (arr!434 (Array (_ BitVec 32) (_ BitVec 8))) (size!47 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!78 0))(
  ( (BitStream!79 (buf!359 array!128) (currentByte!1305 (_ BitVec 32)) (currentBit!1300 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!39 0))(
  ( (Unit!40) )
))
(declare-datatypes ((tuple2!110 0))(
  ( (tuple2!111 (_1!55 Unit!39) (_2!55 BitStream!78)) )
))
(declare-fun lt!1091 () tuple2!110)

(declare-fun thiss!932 () BitStream!78)

(assert (=> b!1534 (= res!3589 (= (size!47 (buf!359 (_2!55 lt!1091))) (size!47 (buf!359 thiss!932))))))

(declare-fun e!956 () Bool)

(assert (=> b!1534 e!956))

(declare-fun res!3582 () Bool)

(assert (=> b!1534 (=> (not res!3582) (not e!956))))

(assert (=> b!1534 (= res!3582 (= (size!47 (buf!359 thiss!932)) (size!47 (buf!359 (_2!55 lt!1091)))))))

(declare-fun appendBit!0 (BitStream!78 Bool) tuple2!110)

(assert (=> b!1534 (= lt!1091 (appendBit!0 thiss!932 true))))

(declare-fun b!1535 () Bool)

(declare-fun e!960 () Bool)

(declare-datatypes ((tuple2!112 0))(
  ( (tuple2!113 (_1!56 BitStream!78) (_2!56 Bool)) )
))
(declare-fun lt!1090 () tuple2!112)

(declare-fun lt!1094 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!1535 (= e!960 (= (bitIndex!0 (size!47 (buf!359 (_1!56 lt!1090))) (currentByte!1305 (_1!56 lt!1090)) (currentBit!1300 (_1!56 lt!1090))) lt!1094))))

(declare-fun b!1536 () Bool)

(declare-fun e!954 () Bool)

(assert (=> b!1536 (= e!956 e!954)))

(declare-fun res!3585 () Bool)

(assert (=> b!1536 (=> (not res!3585) (not e!954))))

(declare-fun lt!1089 () (_ BitVec 64))

(assert (=> b!1536 (= res!3585 (= lt!1094 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!1089)))))

(assert (=> b!1536 (= lt!1094 (bitIndex!0 (size!47 (buf!359 (_2!55 lt!1091))) (currentByte!1305 (_2!55 lt!1091)) (currentBit!1300 (_2!55 lt!1091))))))

(assert (=> b!1536 (= lt!1089 (bitIndex!0 (size!47 (buf!359 thiss!932)) (currentByte!1305 thiss!932) (currentBit!1300 thiss!932)))))

(declare-fun b!1537 () Bool)

(declare-fun res!3587 () Bool)

(declare-fun e!962 () Bool)

(assert (=> b!1537 (=> (not res!3587) (not e!962))))

(declare-fun isPrefixOf!0 (BitStream!78 BitStream!78) Bool)

(assert (=> b!1537 (= res!3587 (isPrefixOf!0 thiss!932 (_2!55 lt!1091)))))

(declare-fun b!1538 () Bool)

(assert (=> b!1538 (= e!954 e!960)))

(declare-fun res!3583 () Bool)

(assert (=> b!1538 (=> (not res!3583) (not e!960))))

(assert (=> b!1538 (= res!3583 (and (_2!56 lt!1090) (= (_1!56 lt!1090) (_2!55 lt!1091))))))

(declare-fun readBitPure!0 (BitStream!78) tuple2!112)

(declare-fun readerFrom!0 (BitStream!78 (_ BitVec 32) (_ BitVec 32)) BitStream!78)

(assert (=> b!1538 (= lt!1090 (readBitPure!0 (readerFrom!0 (_2!55 lt!1091) (currentBit!1300 thiss!932) (currentByte!1305 thiss!932))))))

(declare-fun res!3584 () Bool)

(assert (=> start!528 (=> (not res!3584) (not e!961))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!528 (= res!3584 (validate_offset_bit!0 ((_ sign_extend 32) (size!47 (buf!359 thiss!932))) ((_ sign_extend 32) (currentByte!1305 thiss!932)) ((_ sign_extend 32) (currentBit!1300 thiss!932))))))

(assert (=> start!528 e!961))

(declare-fun e!959 () Bool)

(declare-fun inv!12 (BitStream!78) Bool)

(assert (=> start!528 (and (inv!12 thiss!932) e!959)))

(declare-fun b!1539 () Bool)

(declare-fun e!957 () Bool)

(declare-fun lt!1088 () tuple2!112)

(declare-fun lt!1093 () (_ BitVec 64))

(assert (=> b!1539 (= e!957 (= (bitIndex!0 (size!47 (buf!359 (_1!56 lt!1088))) (currentByte!1305 (_1!56 lt!1088)) (currentBit!1300 (_1!56 lt!1088))) lt!1093))))

(declare-fun b!1540 () Bool)

(declare-fun array_inv!44 (array!128) Bool)

(assert (=> b!1540 (= e!959 (array_inv!44 (buf!359 thiss!932)))))

(declare-fun b!1541 () Bool)

(assert (=> b!1541 (= e!962 e!957)))

(declare-fun res!3586 () Bool)

(assert (=> b!1541 (=> (not res!3586) (not e!957))))

(assert (=> b!1541 (= res!3586 (and (_2!56 lt!1088) (= (_1!56 lt!1088) (_2!55 lt!1091))))))

(assert (=> b!1541 (= lt!1088 (readBitPure!0 (readerFrom!0 (_2!55 lt!1091) (currentBit!1300 thiss!932) (currentByte!1305 thiss!932))))))

(declare-fun b!1542 () Bool)

(assert (=> b!1542 (= e!955 e!962)))

(declare-fun res!3581 () Bool)

(assert (=> b!1542 (=> (not res!3581) (not e!962))))

(declare-fun lt!1092 () (_ BitVec 64))

(assert (=> b!1542 (= res!3581 (= lt!1093 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!1092)))))

(assert (=> b!1542 (= lt!1093 (bitIndex!0 (size!47 (buf!359 (_2!55 lt!1091))) (currentByte!1305 (_2!55 lt!1091)) (currentBit!1300 (_2!55 lt!1091))))))

(assert (=> b!1542 (= lt!1092 (bitIndex!0 (size!47 (buf!359 thiss!932)) (currentByte!1305 thiss!932) (currentBit!1300 thiss!932)))))

(declare-fun b!1543 () Bool)

(declare-fun res!3588 () Bool)

(assert (=> b!1543 (=> (not res!3588) (not e!954))))

(assert (=> b!1543 (= res!3588 (isPrefixOf!0 thiss!932 (_2!55 lt!1091)))))

(assert (= (and start!528 res!3584) b!1534))

(assert (= (and b!1534 res!3582) b!1536))

(assert (= (and b!1536 res!3585) b!1543))

(assert (= (and b!1543 res!3588) b!1538))

(assert (= (and b!1538 res!3583) b!1535))

(assert (= (and b!1534 res!3589) b!1542))

(assert (= (and b!1542 res!3581) b!1537))

(assert (= (and b!1537 res!3587) b!1541))

(assert (= (and b!1541 res!3586) b!1539))

(assert (= start!528 b!1540))

(declare-fun m!1109 () Bool)

(assert (=> b!1536 m!1109))

(declare-fun m!1111 () Bool)

(assert (=> b!1536 m!1111))

(declare-fun m!1113 () Bool)

(assert (=> b!1540 m!1113))

(declare-fun m!1115 () Bool)

(assert (=> b!1534 m!1115))

(assert (=> b!1542 m!1109))

(assert (=> b!1542 m!1111))

(declare-fun m!1117 () Bool)

(assert (=> b!1537 m!1117))

(declare-fun m!1119 () Bool)

(assert (=> b!1538 m!1119))

(assert (=> b!1538 m!1119))

(declare-fun m!1121 () Bool)

(assert (=> b!1538 m!1121))

(assert (=> b!1541 m!1119))

(assert (=> b!1541 m!1119))

(assert (=> b!1541 m!1121))

(declare-fun m!1123 () Bool)

(assert (=> b!1535 m!1123))

(declare-fun m!1125 () Bool)

(assert (=> start!528 m!1125))

(declare-fun m!1127 () Bool)

(assert (=> start!528 m!1127))

(declare-fun m!1129 () Bool)

(assert (=> b!1539 m!1129))

(assert (=> b!1543 m!1117))

(check-sat (not b!1541) (not b!1537) (not b!1543) (not b!1534) (not b!1540) (not b!1538) (not b!1536) (not b!1535) (not start!528) (not b!1542) (not b!1539))
