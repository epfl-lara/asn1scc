; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25482 () Bool)

(assert start!25482)

(declare-fun b!128929 () Bool)

(declare-fun res!106732 () Bool)

(declare-fun e!85465 () Bool)

(assert (=> b!128929 (=> (not res!106732) (not e!85465))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!128929 (= res!106732 (bvslt from!447 to!404))))

(declare-fun b!128930 () Bool)

(assert (=> b!128930 (= e!85465 (not true))))

(declare-datatypes ((array!5967 0))(
  ( (array!5968 (arr!3316 (Array (_ BitVec 32) (_ BitVec 8))) (size!2699 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4662 0))(
  ( (BitStream!4663 (buf!3057 array!5967) (currentByte!5818 (_ BitVec 32)) (currentBit!5813 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8003 0))(
  ( (Unit!8004) )
))
(declare-datatypes ((tuple2!10960 0))(
  ( (tuple2!10961 (_1!5777 Unit!8003) (_2!5777 BitStream!4662)) )
))
(declare-fun lt!199651 () tuple2!10960)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!128930 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2699 (buf!3057 (_2!5777 lt!199651)))) ((_ sign_extend 32) (currentByte!5818 (_2!5777 lt!199651))) ((_ sign_extend 32) (currentBit!5813 (_2!5777 lt!199651))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun thiss!1634 () BitStream!4662)

(declare-fun lt!199652 () Unit!8003)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4662 BitStream!4662 (_ BitVec 64) (_ BitVec 32)) Unit!8003)

(assert (=> b!128930 (= lt!199652 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5777 lt!199651) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!85462 () Bool)

(assert (=> b!128930 e!85462))

(declare-fun res!106733 () Bool)

(assert (=> b!128930 (=> (not res!106733) (not e!85462))))

(assert (=> b!128930 (= res!106733 (= (size!2699 (buf!3057 thiss!1634)) (size!2699 (buf!3057 (_2!5777 lt!199651)))))))

(declare-fun arr!237 () array!5967)

(declare-fun appendByte!0 (BitStream!4662 (_ BitVec 8)) tuple2!10960)

(assert (=> b!128930 (= lt!199651 (appendByte!0 thiss!1634 (select (arr!3316 arr!237) from!447)))))

(declare-fun b!128931 () Bool)

(declare-fun e!85466 () Bool)

(declare-fun array_inv!2488 (array!5967) Bool)

(assert (=> b!128931 (= e!85466 (array_inv!2488 (buf!3057 thiss!1634)))))

(declare-fun b!128933 () Bool)

(declare-fun res!106731 () Bool)

(assert (=> b!128933 (=> (not res!106731) (not e!85462))))

(declare-fun isPrefixOf!0 (BitStream!4662 BitStream!4662) Bool)

(assert (=> b!128933 (= res!106731 (isPrefixOf!0 thiss!1634 (_2!5777 lt!199651)))))

(declare-fun b!128934 () Bool)

(declare-fun res!106734 () Bool)

(assert (=> b!128934 (=> (not res!106734) (not e!85465))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!128934 (= res!106734 (invariant!0 (currentBit!5813 thiss!1634) (currentByte!5818 thiss!1634) (size!2699 (buf!3057 thiss!1634))))))

(declare-fun b!128935 () Bool)

(declare-fun res!106730 () Bool)

(assert (=> b!128935 (=> (not res!106730) (not e!85465))))

(assert (=> b!128935 (= res!106730 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2699 (buf!3057 thiss!1634))) ((_ sign_extend 32) (currentByte!5818 thiss!1634)) ((_ sign_extend 32) (currentBit!5813 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!128936 () Bool)

(declare-fun res!106735 () Bool)

(assert (=> b!128936 (=> (not res!106735) (not e!85462))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!128936 (= res!106735 (= (bitIndex!0 (size!2699 (buf!3057 (_2!5777 lt!199651))) (currentByte!5818 (_2!5777 lt!199651)) (currentBit!5813 (_2!5777 lt!199651))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2699 (buf!3057 thiss!1634)) (currentByte!5818 thiss!1634) (currentBit!5813 thiss!1634)))))))

(declare-fun res!106729 () Bool)

(assert (=> start!25482 (=> (not res!106729) (not e!85465))))

(assert (=> start!25482 (= res!106729 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2699 arr!237))))))

(assert (=> start!25482 e!85465))

(assert (=> start!25482 true))

(assert (=> start!25482 (array_inv!2488 arr!237)))

(declare-fun inv!12 (BitStream!4662) Bool)

(assert (=> start!25482 (and (inv!12 thiss!1634) e!85466)))

(declare-datatypes ((tuple2!10962 0))(
  ( (tuple2!10963 (_1!5778 BitStream!4662) (_2!5778 (_ BitVec 8))) )
))
(declare-fun lt!199649 () tuple2!10962)

(declare-fun b!128932 () Bool)

(declare-datatypes ((tuple2!10964 0))(
  ( (tuple2!10965 (_1!5779 BitStream!4662) (_2!5779 BitStream!4662)) )
))
(declare-fun lt!199650 () tuple2!10964)

(assert (=> b!128932 (= e!85462 (and (= (_2!5778 lt!199649) (select (arr!3316 arr!237) from!447)) (= (_1!5778 lt!199649) (_2!5779 lt!199650))))))

(declare-fun readBytePure!0 (BitStream!4662) tuple2!10962)

(assert (=> b!128932 (= lt!199649 (readBytePure!0 (_1!5779 lt!199650)))))

(declare-fun reader!0 (BitStream!4662 BitStream!4662) tuple2!10964)

(assert (=> b!128932 (= lt!199650 (reader!0 thiss!1634 (_2!5777 lt!199651)))))

(assert (= (and start!25482 res!106729) b!128935))

(assert (= (and b!128935 res!106730) b!128929))

(assert (= (and b!128929 res!106732) b!128934))

(assert (= (and b!128934 res!106734) b!128930))

(assert (= (and b!128930 res!106733) b!128936))

(assert (= (and b!128936 res!106735) b!128933))

(assert (= (and b!128933 res!106731) b!128932))

(assert (= start!25482 b!128931))

(declare-fun m!194681 () Bool)

(assert (=> start!25482 m!194681))

(declare-fun m!194683 () Bool)

(assert (=> start!25482 m!194683))

(declare-fun m!194685 () Bool)

(assert (=> b!128933 m!194685))

(declare-fun m!194687 () Bool)

(assert (=> b!128931 m!194687))

(declare-fun m!194689 () Bool)

(assert (=> b!128936 m!194689))

(declare-fun m!194691 () Bool)

(assert (=> b!128936 m!194691))

(declare-fun m!194693 () Bool)

(assert (=> b!128934 m!194693))

(declare-fun m!194695 () Bool)

(assert (=> b!128932 m!194695))

(declare-fun m!194697 () Bool)

(assert (=> b!128932 m!194697))

(declare-fun m!194699 () Bool)

(assert (=> b!128932 m!194699))

(declare-fun m!194701 () Bool)

(assert (=> b!128930 m!194701))

(declare-fun m!194703 () Bool)

(assert (=> b!128930 m!194703))

(assert (=> b!128930 m!194695))

(assert (=> b!128930 m!194695))

(declare-fun m!194705 () Bool)

(assert (=> b!128930 m!194705))

(declare-fun m!194707 () Bool)

(assert (=> b!128935 m!194707))

(check-sat (not b!128936) (not b!128930) (not b!128933) (not b!128932) (not start!25482) (not b!128931) (not b!128935) (not b!128934))
