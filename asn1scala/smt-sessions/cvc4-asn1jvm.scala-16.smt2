; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!530 () Bool)

(assert start!530)

(declare-fun b!1564 () Bool)

(declare-fun res!3612 () Bool)

(declare-fun e!984 () Bool)

(assert (=> b!1564 (=> (not res!3612) (not e!984))))

(declare-datatypes ((array!130 0))(
  ( (array!131 (arr!435 (Array (_ BitVec 32) (_ BitVec 8))) (size!48 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!80 0))(
  ( (BitStream!81 (buf!360 array!130) (currentByte!1306 (_ BitVec 32)) (currentBit!1301 (_ BitVec 32))) )
))
(declare-fun thiss!932 () BitStream!80)

(declare-datatypes ((Unit!41 0))(
  ( (Unit!42) )
))
(declare-datatypes ((tuple2!114 0))(
  ( (tuple2!115 (_1!57 Unit!41) (_2!57 BitStream!80)) )
))
(declare-fun lt!1113 () tuple2!114)

(declare-fun isPrefixOf!0 (BitStream!80 BitStream!80) Bool)

(assert (=> b!1564 (= res!3612 (isPrefixOf!0 thiss!932 (_2!57 lt!1113)))))

(declare-fun b!1565 () Bool)

(declare-fun e!988 () Bool)

(declare-fun e!981 () Bool)

(assert (=> b!1565 (= e!988 e!981)))

(declare-fun res!3608 () Bool)

(assert (=> b!1565 (=> (not res!3608) (not e!981))))

(declare-datatypes ((tuple2!116 0))(
  ( (tuple2!117 (_1!58 BitStream!80) (_2!58 Bool)) )
))
(declare-fun lt!1109 () tuple2!116)

(assert (=> b!1565 (= res!3608 (and (_2!58 lt!1109) (= (_1!58 lt!1109) (_2!57 lt!1113))))))

(declare-fun readBitPure!0 (BitStream!80) tuple2!116)

(declare-fun readerFrom!0 (BitStream!80 (_ BitVec 32) (_ BitVec 32)) BitStream!80)

(assert (=> b!1565 (= lt!1109 (readBitPure!0 (readerFrom!0 (_2!57 lt!1113) (currentBit!1301 thiss!932) (currentByte!1306 thiss!932))))))

(declare-fun b!1566 () Bool)

(declare-fun e!989 () Bool)

(assert (=> b!1566 (= e!989 e!984)))

(declare-fun res!3611 () Bool)

(assert (=> b!1566 (=> (not res!3611) (not e!984))))

(declare-fun lt!1112 () (_ BitVec 64))

(declare-fun lt!1115 () (_ BitVec 64))

(assert (=> b!1566 (= res!3611 (= lt!1112 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!1115)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!1566 (= lt!1112 (bitIndex!0 (size!48 (buf!360 (_2!57 lt!1113))) (currentByte!1306 (_2!57 lt!1113)) (currentBit!1301 (_2!57 lt!1113))))))

(assert (=> b!1566 (= lt!1115 (bitIndex!0 (size!48 (buf!360 thiss!932)) (currentByte!1306 thiss!932) (currentBit!1301 thiss!932)))))

(declare-fun b!1567 () Bool)

(declare-fun e!983 () Bool)

(declare-fun e!986 () Bool)

(assert (=> b!1567 (= e!983 (not e!986))))

(declare-fun res!3613 () Bool)

(assert (=> b!1567 (=> (not res!3613) (not e!986))))

(assert (=> b!1567 (= res!3613 (= (size!48 (buf!360 (_2!57 lt!1113))) (size!48 (buf!360 thiss!932))))))

(assert (=> b!1567 e!989))

(declare-fun res!3615 () Bool)

(assert (=> b!1567 (=> (not res!3615) (not e!989))))

(assert (=> b!1567 (= res!3615 (= (size!48 (buf!360 thiss!932)) (size!48 (buf!360 (_2!57 lt!1113)))))))

(declare-fun appendBit!0 (BitStream!80 Bool) tuple2!114)

(assert (=> b!1567 (= lt!1113 (appendBit!0 thiss!932 true))))

(declare-fun res!3609 () Bool)

(assert (=> start!530 (=> (not res!3609) (not e!983))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!530 (= res!3609 (validate_offset_bit!0 ((_ sign_extend 32) (size!48 (buf!360 thiss!932))) ((_ sign_extend 32) (currentByte!1306 thiss!932)) ((_ sign_extend 32) (currentBit!1301 thiss!932))))))

(assert (=> start!530 e!983))

(declare-fun e!982 () Bool)

(declare-fun inv!12 (BitStream!80) Bool)

(assert (=> start!530 (and (inv!12 thiss!932) e!982)))

(declare-fun b!1568 () Bool)

(declare-fun array_inv!45 (array!130) Bool)

(assert (=> b!1568 (= e!982 (array_inv!45 (buf!360 thiss!932)))))

(declare-fun b!1569 () Bool)

(declare-fun e!987 () Bool)

(assert (=> b!1569 (= e!984 e!987)))

(declare-fun res!3616 () Bool)

(assert (=> b!1569 (=> (not res!3616) (not e!987))))

(declare-fun lt!1111 () tuple2!116)

(assert (=> b!1569 (= res!3616 (and (_2!58 lt!1111) (= (_1!58 lt!1111) (_2!57 lt!1113))))))

(assert (=> b!1569 (= lt!1111 (readBitPure!0 (readerFrom!0 (_2!57 lt!1113) (currentBit!1301 thiss!932) (currentByte!1306 thiss!932))))))

(declare-fun b!1570 () Bool)

(assert (=> b!1570 (= e!986 e!988)))

(declare-fun res!3610 () Bool)

(assert (=> b!1570 (=> (not res!3610) (not e!988))))

(declare-fun lt!1110 () (_ BitVec 64))

(declare-fun lt!1114 () (_ BitVec 64))

(assert (=> b!1570 (= res!3610 (= lt!1110 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!1114)))))

(assert (=> b!1570 (= lt!1110 (bitIndex!0 (size!48 (buf!360 (_2!57 lt!1113))) (currentByte!1306 (_2!57 lt!1113)) (currentBit!1301 (_2!57 lt!1113))))))

(assert (=> b!1570 (= lt!1114 (bitIndex!0 (size!48 (buf!360 thiss!932)) (currentByte!1306 thiss!932) (currentBit!1301 thiss!932)))))

(declare-fun b!1571 () Bool)

(declare-fun res!3614 () Bool)

(assert (=> b!1571 (=> (not res!3614) (not e!988))))

(assert (=> b!1571 (= res!3614 (isPrefixOf!0 thiss!932 (_2!57 lt!1113)))))

(declare-fun b!1572 () Bool)

(assert (=> b!1572 (= e!981 (= (bitIndex!0 (size!48 (buf!360 (_1!58 lt!1109))) (currentByte!1306 (_1!58 lt!1109)) (currentBit!1301 (_1!58 lt!1109))) lt!1110))))

(declare-fun b!1573 () Bool)

(assert (=> b!1573 (= e!987 (= (bitIndex!0 (size!48 (buf!360 (_1!58 lt!1111))) (currentByte!1306 (_1!58 lt!1111)) (currentBit!1301 (_1!58 lt!1111))) lt!1112))))

(assert (= (and start!530 res!3609) b!1567))

(assert (= (and b!1567 res!3615) b!1566))

(assert (= (and b!1566 res!3611) b!1564))

(assert (= (and b!1564 res!3612) b!1569))

(assert (= (and b!1569 res!3616) b!1573))

(assert (= (and b!1567 res!3613) b!1570))

(assert (= (and b!1570 res!3610) b!1571))

(assert (= (and b!1571 res!3614) b!1565))

(assert (= (and b!1565 res!3608) b!1572))

(assert (= start!530 b!1568))

(declare-fun m!1131 () Bool)

(assert (=> b!1571 m!1131))

(declare-fun m!1133 () Bool)

(assert (=> b!1573 m!1133))

(declare-fun m!1135 () Bool)

(assert (=> b!1569 m!1135))

(assert (=> b!1569 m!1135))

(declare-fun m!1137 () Bool)

(assert (=> b!1569 m!1137))

(assert (=> b!1565 m!1135))

(assert (=> b!1565 m!1135))

(assert (=> b!1565 m!1137))

(declare-fun m!1139 () Bool)

(assert (=> start!530 m!1139))

(declare-fun m!1141 () Bool)

(assert (=> start!530 m!1141))

(declare-fun m!1143 () Bool)

(assert (=> b!1570 m!1143))

(declare-fun m!1145 () Bool)

(assert (=> b!1570 m!1145))

(assert (=> b!1566 m!1143))

(assert (=> b!1566 m!1145))

(declare-fun m!1147 () Bool)

(assert (=> b!1568 m!1147))

(declare-fun m!1149 () Bool)

(assert (=> b!1572 m!1149))

(assert (=> b!1564 m!1131))

(declare-fun m!1151 () Bool)

(assert (=> b!1567 m!1151))

(push 1)

(assert (not start!530))

(assert (not b!1569))

(assert (not b!1567))

(assert (not b!1570))

(assert (not b!1572))

(assert (not b!1573))

(assert (not b!1568))

(assert (not b!1566))

(assert (not b!1571))

(assert (not b!1565))

(assert (not b!1564))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

