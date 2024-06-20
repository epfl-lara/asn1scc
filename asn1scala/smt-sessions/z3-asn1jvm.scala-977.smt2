; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27452 () Bool)

(assert start!27452)

(declare-fun b!141090 () Bool)

(declare-fun res!117667 () Bool)

(declare-fun e!93992 () Bool)

(assert (=> b!141090 (=> (not res!117667) (not e!93992))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6467 0))(
  ( (array!6468 (arr!3634 (Array (_ BitVec 32) (_ BitVec 8))) (size!2927 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5112 0))(
  ( (BitStream!5113 (buf!3348 array!6467) (currentByte!6208 (_ BitVec 32)) (currentBit!6203 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5112)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!141090 (= res!117667 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2927 (buf!3348 thiss!1634))) ((_ sign_extend 32) (currentByte!6208 thiss!1634)) ((_ sign_extend 32) (currentBit!6203 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun res!117666 () Bool)

(assert (=> start!27452 (=> (not res!117666) (not e!93992))))

(declare-fun arr!237 () array!6467)

(assert (=> start!27452 (= res!117666 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2927 arr!237))))))

(assert (=> start!27452 e!93992))

(assert (=> start!27452 true))

(declare-fun array_inv!2716 (array!6467) Bool)

(assert (=> start!27452 (array_inv!2716 arr!237)))

(declare-fun e!93994 () Bool)

(declare-fun inv!12 (BitStream!5112) Bool)

(assert (=> start!27452 (and (inv!12 thiss!1634) e!93994)))

(declare-datatypes ((tuple2!12442 0))(
  ( (tuple2!12443 (_1!6551 BitStream!5112) (_2!6551 BitStream!5112)) )
))
(declare-fun lt!219280 () tuple2!12442)

(declare-fun b!141091 () Bool)

(declare-datatypes ((tuple2!12444 0))(
  ( (tuple2!12445 (_1!6552 BitStream!5112) (_2!6552 (_ BitVec 8))) )
))
(declare-fun lt!219281 () tuple2!12444)

(declare-fun e!93991 () Bool)

(assert (=> b!141091 (= e!93991 (and (= (_2!6552 lt!219281) (select (arr!3634 arr!237) from!447)) (= (_1!6552 lt!219281) (_2!6551 lt!219280))))))

(declare-fun readBytePure!0 (BitStream!5112) tuple2!12444)

(assert (=> b!141091 (= lt!219281 (readBytePure!0 (_1!6551 lt!219280)))))

(declare-datatypes ((Unit!8836 0))(
  ( (Unit!8837) )
))
(declare-datatypes ((tuple2!12446 0))(
  ( (tuple2!12447 (_1!6553 Unit!8836) (_2!6553 BitStream!5112)) )
))
(declare-fun lt!219278 () tuple2!12446)

(declare-fun reader!0 (BitStream!5112 BitStream!5112) tuple2!12442)

(assert (=> b!141091 (= lt!219280 (reader!0 thiss!1634 (_2!6553 lt!219278)))))

(declare-fun b!141092 () Bool)

(declare-fun e!93993 () Bool)

(assert (=> b!141092 (= e!93993 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2927 (buf!3348 (_2!6553 lt!219278)))) ((_ sign_extend 32) (currentByte!6208 (_2!6553 lt!219278))) ((_ sign_extend 32) (currentBit!6203 (_2!6553 lt!219278))) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!141093 () Bool)

(assert (=> b!141093 (= e!93992 (not e!93993))))

(declare-fun res!117661 () Bool)

(assert (=> b!141093 (=> res!117661 e!93993)))

(assert (=> b!141093 (= res!117661 (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(assert (=> b!141093 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2927 (buf!3348 (_2!6553 lt!219278)))) ((_ sign_extend 32) (currentByte!6208 (_2!6553 lt!219278))) ((_ sign_extend 32) (currentBit!6203 (_2!6553 lt!219278))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!219279 () Unit!8836)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5112 BitStream!5112 (_ BitVec 64) (_ BitVec 32)) Unit!8836)

(assert (=> b!141093 (= lt!219279 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6553 lt!219278) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!141093 e!93991))

(declare-fun res!117660 () Bool)

(assert (=> b!141093 (=> (not res!117660) (not e!93991))))

(assert (=> b!141093 (= res!117660 (= (size!2927 (buf!3348 thiss!1634)) (size!2927 (buf!3348 (_2!6553 lt!219278)))))))

(declare-fun appendByte!0 (BitStream!5112 (_ BitVec 8)) tuple2!12446)

(assert (=> b!141093 (= lt!219278 (appendByte!0 thiss!1634 (select (arr!3634 arr!237) from!447)))))

(declare-fun b!141094 () Bool)

(declare-fun res!117665 () Bool)

(assert (=> b!141094 (=> (not res!117665) (not e!93991))))

(declare-fun isPrefixOf!0 (BitStream!5112 BitStream!5112) Bool)

(assert (=> b!141094 (= res!117665 (isPrefixOf!0 thiss!1634 (_2!6553 lt!219278)))))

(declare-fun b!141095 () Bool)

(declare-fun res!117662 () Bool)

(assert (=> b!141095 (=> (not res!117662) (not e!93992))))

(assert (=> b!141095 (= res!117662 (bvslt from!447 to!404))))

(declare-fun b!141096 () Bool)

(declare-fun res!117663 () Bool)

(assert (=> b!141096 (=> (not res!117663) (not e!93992))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!141096 (= res!117663 (invariant!0 (currentBit!6203 thiss!1634) (currentByte!6208 thiss!1634) (size!2927 (buf!3348 thiss!1634))))))

(declare-fun b!141097 () Bool)

(assert (=> b!141097 (= e!93994 (array_inv!2716 (buf!3348 thiss!1634)))))

(declare-fun b!141098 () Bool)

(declare-fun res!117664 () Bool)

(assert (=> b!141098 (=> (not res!117664) (not e!93991))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!141098 (= res!117664 (= (bitIndex!0 (size!2927 (buf!3348 (_2!6553 lt!219278))) (currentByte!6208 (_2!6553 lt!219278)) (currentBit!6203 (_2!6553 lt!219278))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2927 (buf!3348 thiss!1634)) (currentByte!6208 thiss!1634) (currentBit!6203 thiss!1634)))))))

(assert (= (and start!27452 res!117666) b!141090))

(assert (= (and b!141090 res!117667) b!141095))

(assert (= (and b!141095 res!117662) b!141096))

(assert (= (and b!141096 res!117663) b!141093))

(assert (= (and b!141093 res!117660) b!141098))

(assert (= (and b!141098 res!117664) b!141094))

(assert (= (and b!141094 res!117665) b!141091))

(assert (= (and b!141093 (not res!117661)) b!141092))

(assert (= start!27452 b!141097))

(declare-fun m!216923 () Bool)

(assert (=> b!141096 m!216923))

(declare-fun m!216925 () Bool)

(assert (=> b!141091 m!216925))

(declare-fun m!216927 () Bool)

(assert (=> b!141091 m!216927))

(declare-fun m!216929 () Bool)

(assert (=> b!141091 m!216929))

(declare-fun m!216931 () Bool)

(assert (=> b!141097 m!216931))

(declare-fun m!216933 () Bool)

(assert (=> b!141093 m!216933))

(declare-fun m!216935 () Bool)

(assert (=> b!141093 m!216935))

(assert (=> b!141093 m!216925))

(assert (=> b!141093 m!216925))

(declare-fun m!216937 () Bool)

(assert (=> b!141093 m!216937))

(declare-fun m!216939 () Bool)

(assert (=> start!27452 m!216939))

(declare-fun m!216941 () Bool)

(assert (=> start!27452 m!216941))

(declare-fun m!216943 () Bool)

(assert (=> b!141098 m!216943))

(declare-fun m!216945 () Bool)

(assert (=> b!141098 m!216945))

(declare-fun m!216947 () Bool)

(assert (=> b!141090 m!216947))

(declare-fun m!216949 () Bool)

(assert (=> b!141092 m!216949))

(declare-fun m!216951 () Bool)

(assert (=> b!141094 m!216951))

(check-sat (not b!141096) (not b!141098) (not b!141093) (not b!141090) (not start!27452) (not b!141092) (not b!141097) (not b!141091) (not b!141094))
(check-sat)
