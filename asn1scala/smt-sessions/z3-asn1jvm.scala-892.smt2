; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25374 () Bool)

(assert start!25374)

(declare-fun b!128104 () Bool)

(declare-fun e!84948 () Bool)

(declare-datatypes ((array!5910 0))(
  ( (array!5911 (arr!3289 (Array (_ BitVec 32) (_ BitVec 8))) (size!2672 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4608 0))(
  ( (BitStream!4609 (buf!3030 array!5910) (currentByte!5782 (_ BitVec 32)) (currentBit!5777 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4608)

(assert (=> b!128104 (= e!84948 (not (and (bvsle ((_ sign_extend 32) (size!2672 (buf!3030 thiss!1634))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!5782 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!5777 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111))))))

(declare-fun e!84950 () Bool)

(assert (=> b!128104 e!84950))

(declare-fun res!106008 () Bool)

(assert (=> b!128104 (=> (not res!106008) (not e!84950))))

(declare-datatypes ((Unit!7946 0))(
  ( (Unit!7947) )
))
(declare-datatypes ((tuple2!10792 0))(
  ( (tuple2!10793 (_1!5693 Unit!7946) (_2!5693 BitStream!4608)) )
))
(declare-fun lt!199050 () tuple2!10792)

(assert (=> b!128104 (= res!106008 (= (size!2672 (buf!3030 thiss!1634)) (size!2672 (buf!3030 (_2!5693 lt!199050)))))))

(declare-fun arr!237 () array!5910)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun appendByte!0 (BitStream!4608 (_ BitVec 8)) tuple2!10792)

(assert (=> b!128104 (= lt!199050 (appendByte!0 thiss!1634 (select (arr!3289 arr!237) from!447)))))

(declare-fun b!128105 () Bool)

(declare-fun e!84949 () Bool)

(declare-fun array_inv!2461 (array!5910) Bool)

(assert (=> b!128105 (= e!84949 (array_inv!2461 (buf!3030 thiss!1634)))))

(declare-fun b!128107 () Bool)

(declare-fun res!106006 () Bool)

(assert (=> b!128107 (=> (not res!106006) (not e!84948))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!128107 (= res!106006 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2672 (buf!3030 thiss!1634))) ((_ sign_extend 32) (currentByte!5782 thiss!1634)) ((_ sign_extend 32) (currentBit!5777 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!128108 () Bool)

(declare-fun res!106009 () Bool)

(assert (=> b!128108 (=> (not res!106009) (not e!84950))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!128108 (= res!106009 (= (bitIndex!0 (size!2672 (buf!3030 (_2!5693 lt!199050))) (currentByte!5782 (_2!5693 lt!199050)) (currentBit!5777 (_2!5693 lt!199050))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2672 (buf!3030 thiss!1634)) (currentByte!5782 thiss!1634) (currentBit!5777 thiss!1634)))))))

(declare-fun b!128109 () Bool)

(declare-fun res!106007 () Bool)

(assert (=> b!128109 (=> (not res!106007) (not e!84948))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!128109 (= res!106007 (invariant!0 (currentBit!5777 thiss!1634) (currentByte!5782 thiss!1634) (size!2672 (buf!3030 thiss!1634))))))

(declare-fun res!106004 () Bool)

(assert (=> start!25374 (=> (not res!106004) (not e!84948))))

(assert (=> start!25374 (= res!106004 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2672 arr!237))))))

(assert (=> start!25374 e!84948))

(assert (=> start!25374 true))

(assert (=> start!25374 (array_inv!2461 arr!237)))

(declare-fun inv!12 (BitStream!4608) Bool)

(assert (=> start!25374 (and (inv!12 thiss!1634) e!84949)))

(declare-fun b!128106 () Bool)

(declare-datatypes ((tuple2!10794 0))(
  ( (tuple2!10795 (_1!5694 BitStream!4608) (_2!5694 BitStream!4608)) )
))
(declare-fun lt!199052 () tuple2!10794)

(declare-datatypes ((tuple2!10796 0))(
  ( (tuple2!10797 (_1!5695 BitStream!4608) (_2!5695 (_ BitVec 8))) )
))
(declare-fun lt!199051 () tuple2!10796)

(assert (=> b!128106 (= e!84950 (and (= (_2!5695 lt!199051) (select (arr!3289 arr!237) from!447)) (= (_1!5695 lt!199051) (_2!5694 lt!199052))))))

(declare-fun readBytePure!0 (BitStream!4608) tuple2!10796)

(assert (=> b!128106 (= lt!199051 (readBytePure!0 (_1!5694 lt!199052)))))

(declare-fun reader!0 (BitStream!4608 BitStream!4608) tuple2!10794)

(assert (=> b!128106 (= lt!199052 (reader!0 thiss!1634 (_2!5693 lt!199050)))))

(declare-fun b!128110 () Bool)

(declare-fun res!106003 () Bool)

(assert (=> b!128110 (=> (not res!106003) (not e!84948))))

(assert (=> b!128110 (= res!106003 (bvslt from!447 to!404))))

(declare-fun b!128111 () Bool)

(declare-fun res!106005 () Bool)

(assert (=> b!128111 (=> (not res!106005) (not e!84950))))

(declare-fun isPrefixOf!0 (BitStream!4608 BitStream!4608) Bool)

(assert (=> b!128111 (= res!106005 (isPrefixOf!0 thiss!1634 (_2!5693 lt!199050)))))

(assert (= (and start!25374 res!106004) b!128107))

(assert (= (and b!128107 res!106006) b!128110))

(assert (= (and b!128110 res!106003) b!128109))

(assert (= (and b!128109 res!106007) b!128104))

(assert (= (and b!128104 res!106008) b!128108))

(assert (= (and b!128108 res!106009) b!128111))

(assert (= (and b!128111 res!106005) b!128106))

(assert (= start!25374 b!128105))

(declare-fun m!193867 () Bool)

(assert (=> b!128104 m!193867))

(assert (=> b!128104 m!193867))

(declare-fun m!193869 () Bool)

(assert (=> b!128104 m!193869))

(declare-fun m!193871 () Bool)

(assert (=> b!128108 m!193871))

(declare-fun m!193873 () Bool)

(assert (=> b!128108 m!193873))

(declare-fun m!193875 () Bool)

(assert (=> start!25374 m!193875))

(declare-fun m!193877 () Bool)

(assert (=> start!25374 m!193877))

(declare-fun m!193879 () Bool)

(assert (=> b!128111 m!193879))

(declare-fun m!193881 () Bool)

(assert (=> b!128109 m!193881))

(declare-fun m!193883 () Bool)

(assert (=> b!128105 m!193883))

(assert (=> b!128106 m!193867))

(declare-fun m!193885 () Bool)

(assert (=> b!128106 m!193885))

(declare-fun m!193887 () Bool)

(assert (=> b!128106 m!193887))

(declare-fun m!193889 () Bool)

(assert (=> b!128107 m!193889))

(check-sat (not b!128106) (not b!128109) (not b!128111) (not b!128108) (not b!128105) (not b!128104) (not b!128107) (not start!25374))
(check-sat)
