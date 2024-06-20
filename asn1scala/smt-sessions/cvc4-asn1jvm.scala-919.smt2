; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25808 () Bool)

(assert start!25808)

(declare-fun b!131763 () Bool)

(declare-fun res!109348 () Bool)

(declare-fun e!87350 () Bool)

(assert (=> b!131763 (=> (not res!109348) (not e!87350))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!131763 (= res!109348 (bvslt from!447 to!404))))

(declare-fun b!131764 () Bool)

(declare-fun res!109343 () Bool)

(assert (=> b!131764 (=> (not res!109343) (not e!87350))))

(declare-datatypes ((array!6083 0))(
  ( (array!6084 (arr!3383 (Array (_ BitVec 32) (_ BitVec 8))) (size!2754 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4772 0))(
  ( (BitStream!4773 (buf!3121 array!6083) (currentByte!5900 (_ BitVec 32)) (currentBit!5895 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4772)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!131764 (= res!109343 (invariant!0 (currentBit!5895 thiss!1634) (currentByte!5900 thiss!1634) (size!2754 (buf!3121 thiss!1634))))))

(declare-fun b!131765 () Bool)

(declare-fun res!109344 () Bool)

(assert (=> b!131765 (=> (not res!109344) (not e!87350))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!131765 (= res!109344 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2754 (buf!3121 thiss!1634))) ((_ sign_extend 32) (currentByte!5900 thiss!1634)) ((_ sign_extend 32) (currentBit!5895 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!131766 () Bool)

(declare-fun e!87346 () Bool)

(declare-fun e!87352 () Bool)

(assert (=> b!131766 (= e!87346 e!87352)))

(declare-fun res!109342 () Bool)

(assert (=> b!131766 (=> (not res!109342) (not e!87352))))

(declare-fun lt!203283 () (_ BitVec 64))

(declare-datatypes ((Unit!8131 0))(
  ( (Unit!8132) )
))
(declare-datatypes ((tuple2!11402 0))(
  ( (tuple2!11403 (_1!6004 Unit!8131) (_2!6004 BitStream!4772)) )
))
(declare-fun lt!203292 () tuple2!11402)

(declare-fun lt!203291 () tuple2!11402)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!131766 (= res!109342 (= (bitIndex!0 (size!2754 (buf!3121 (_2!6004 lt!203292))) (currentByte!5900 (_2!6004 lt!203292)) (currentBit!5895 (_2!6004 lt!203292))) (bvadd (bitIndex!0 (size!2754 (buf!3121 (_2!6004 lt!203291))) (currentByte!5900 (_2!6004 lt!203291)) (currentBit!5895 (_2!6004 lt!203291))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!203283))))))

(assert (=> b!131766 (= lt!203283 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!131767 () Bool)

(declare-fun e!87343 () Bool)

(declare-fun array_inv!2543 (array!6083) Bool)

(assert (=> b!131767 (= e!87343 (array_inv!2543 (buf!3121 thiss!1634)))))

(declare-fun b!131768 () Bool)

(declare-fun res!109339 () Bool)

(declare-fun e!87344 () Bool)

(assert (=> b!131768 (=> (not res!109339) (not e!87344))))

(declare-fun isPrefixOf!0 (BitStream!4772 BitStream!4772) Bool)

(assert (=> b!131768 (= res!109339 (isPrefixOf!0 thiss!1634 (_2!6004 lt!203291)))))

(declare-fun b!131769 () Bool)

(declare-fun e!87347 () Bool)

(assert (=> b!131769 (= e!87352 (not e!87347))))

(declare-fun res!109338 () Bool)

(assert (=> b!131769 (=> res!109338 e!87347)))

(declare-datatypes ((tuple2!11404 0))(
  ( (tuple2!11405 (_1!6005 BitStream!4772) (_2!6005 array!6083)) )
))
(declare-fun lt!203285 () tuple2!11404)

(declare-fun arr!237 () array!6083)

(declare-datatypes ((tuple2!11406 0))(
  ( (tuple2!11407 (_1!6006 BitStream!4772) (_2!6006 BitStream!4772)) )
))
(declare-fun lt!203287 () tuple2!11406)

(assert (=> b!131769 (= res!109338 (or (not (= (size!2754 (_2!6005 lt!203285)) (size!2754 arr!237))) (not (= (_1!6005 lt!203285) (_2!6006 lt!203287)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4772 array!6083 (_ BitVec 32) (_ BitVec 32)) tuple2!11404)

(assert (=> b!131769 (= lt!203285 (readByteArrayLoopPure!0 (_1!6006 lt!203287) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!131769 (validate_offset_bits!1 ((_ sign_extend 32) (size!2754 (buf!3121 (_2!6004 lt!203292)))) ((_ sign_extend 32) (currentByte!5900 (_2!6004 lt!203291))) ((_ sign_extend 32) (currentBit!5895 (_2!6004 lt!203291))) lt!203283)))

(declare-fun lt!203281 () Unit!8131)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4772 array!6083 (_ BitVec 64)) Unit!8131)

(assert (=> b!131769 (= lt!203281 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6004 lt!203291) (buf!3121 (_2!6004 lt!203292)) lt!203283))))

(declare-fun reader!0 (BitStream!4772 BitStream!4772) tuple2!11406)

(assert (=> b!131769 (= lt!203287 (reader!0 (_2!6004 lt!203291) (_2!6004 lt!203292)))))

(declare-fun b!131770 () Bool)

(declare-fun e!87345 () Bool)

(declare-datatypes ((tuple2!11408 0))(
  ( (tuple2!11409 (_1!6007 BitStream!4772) (_2!6007 (_ BitVec 8))) )
))
(declare-fun lt!203289 () tuple2!11408)

(declare-fun lt!203288 () tuple2!11408)

(assert (=> b!131770 (= e!87345 (= (_2!6007 lt!203289) (_2!6007 lt!203288)))))

(declare-fun b!131771 () Bool)

(assert (=> b!131771 (= e!87350 (not true))))

(declare-fun e!87348 () Bool)

(assert (=> b!131771 e!87348))

(declare-fun res!109345 () Bool)

(assert (=> b!131771 (=> (not res!109345) (not e!87348))))

(assert (=> b!131771 (= res!109345 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2754 (buf!3121 (_2!6004 lt!203292)))) ((_ sign_extend 32) (currentByte!5900 thiss!1634)) ((_ sign_extend 32) (currentBit!5895 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!203280 () Unit!8131)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4772 array!6083 (_ BitVec 32)) Unit!8131)

(assert (=> b!131771 (= lt!203280 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3121 (_2!6004 lt!203292)) (bvsub to!404 from!447)))))

(declare-fun lt!203286 () tuple2!11406)

(declare-fun readBytePure!0 (BitStream!4772) tuple2!11408)

(assert (=> b!131771 (= (_2!6007 (readBytePure!0 (_1!6006 lt!203286))) (select (arr!3383 arr!237) from!447))))

(declare-fun lt!203279 () tuple2!11406)

(assert (=> b!131771 (= lt!203279 (reader!0 (_2!6004 lt!203291) (_2!6004 lt!203292)))))

(assert (=> b!131771 (= lt!203286 (reader!0 thiss!1634 (_2!6004 lt!203292)))))

(assert (=> b!131771 e!87345))

(declare-fun res!109350 () Bool)

(assert (=> b!131771 (=> (not res!109350) (not e!87345))))

(assert (=> b!131771 (= res!109350 (= (bitIndex!0 (size!2754 (buf!3121 (_1!6007 lt!203289))) (currentByte!5900 (_1!6007 lt!203289)) (currentBit!5895 (_1!6007 lt!203289))) (bitIndex!0 (size!2754 (buf!3121 (_1!6007 lt!203288))) (currentByte!5900 (_1!6007 lt!203288)) (currentBit!5895 (_1!6007 lt!203288)))))))

(declare-fun lt!203282 () Unit!8131)

(declare-fun lt!203284 () BitStream!4772)

(declare-fun readBytePrefixLemma!0 (BitStream!4772 BitStream!4772) Unit!8131)

(assert (=> b!131771 (= lt!203282 (readBytePrefixLemma!0 lt!203284 (_2!6004 lt!203292)))))

(assert (=> b!131771 (= lt!203288 (readBytePure!0 (BitStream!4773 (buf!3121 (_2!6004 lt!203292)) (currentByte!5900 thiss!1634) (currentBit!5895 thiss!1634))))))

(assert (=> b!131771 (= lt!203289 (readBytePure!0 lt!203284))))

(assert (=> b!131771 (= lt!203284 (BitStream!4773 (buf!3121 (_2!6004 lt!203291)) (currentByte!5900 thiss!1634) (currentBit!5895 thiss!1634)))))

(declare-fun e!87353 () Bool)

(assert (=> b!131771 e!87353))

(declare-fun res!109351 () Bool)

(assert (=> b!131771 (=> (not res!109351) (not e!87353))))

(assert (=> b!131771 (= res!109351 (isPrefixOf!0 thiss!1634 (_2!6004 lt!203292)))))

(declare-fun lt!203293 () Unit!8131)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4772 BitStream!4772 BitStream!4772) Unit!8131)

(assert (=> b!131771 (= lt!203293 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6004 lt!203291) (_2!6004 lt!203292)))))

(assert (=> b!131771 e!87346))

(declare-fun res!109341 () Bool)

(assert (=> b!131771 (=> (not res!109341) (not e!87346))))

(assert (=> b!131771 (= res!109341 (= (size!2754 (buf!3121 (_2!6004 lt!203291))) (size!2754 (buf!3121 (_2!6004 lt!203292)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4772 array!6083 (_ BitVec 32) (_ BitVec 32)) tuple2!11402)

(assert (=> b!131771 (= lt!203292 (appendByteArrayLoop!0 (_2!6004 lt!203291) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!131771 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2754 (buf!3121 (_2!6004 lt!203291)))) ((_ sign_extend 32) (currentByte!5900 (_2!6004 lt!203291))) ((_ sign_extend 32) (currentBit!5895 (_2!6004 lt!203291))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!203290 () Unit!8131)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4772 BitStream!4772 (_ BitVec 64) (_ BitVec 32)) Unit!8131)

(assert (=> b!131771 (= lt!203290 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6004 lt!203291) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!131771 e!87344))

(declare-fun res!109349 () Bool)

(assert (=> b!131771 (=> (not res!109349) (not e!87344))))

(assert (=> b!131771 (= res!109349 (= (size!2754 (buf!3121 thiss!1634)) (size!2754 (buf!3121 (_2!6004 lt!203291)))))))

(declare-fun appendByte!0 (BitStream!4772 (_ BitVec 8)) tuple2!11402)

(assert (=> b!131771 (= lt!203291 (appendByte!0 thiss!1634 (select (arr!3383 arr!237) from!447)))))

(declare-fun b!131772 () Bool)

(assert (=> b!131772 (= e!87348 (= (_1!6005 (readByteArrayLoopPure!0 (_1!6006 lt!203286) arr!237 from!447 to!404)) (_2!6006 lt!203286)))))

(declare-fun lt!203294 () tuple2!11406)

(declare-fun lt!203278 () tuple2!11408)

(declare-fun b!131773 () Bool)

(assert (=> b!131773 (= e!87344 (and (= (_2!6007 lt!203278) (select (arr!3383 arr!237) from!447)) (= (_1!6007 lt!203278) (_2!6006 lt!203294))))))

(assert (=> b!131773 (= lt!203278 (readBytePure!0 (_1!6006 lt!203294)))))

(assert (=> b!131773 (= lt!203294 (reader!0 thiss!1634 (_2!6004 lt!203291)))))

(declare-fun b!131775 () Bool)

(declare-fun arrayRangesEq!157 (array!6083 array!6083 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!131775 (= e!87347 (not (arrayRangesEq!157 arr!237 (_2!6005 lt!203285) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!131776 () Bool)

(assert (=> b!131776 (= e!87353 (invariant!0 (currentBit!5895 thiss!1634) (currentByte!5900 thiss!1634) (size!2754 (buf!3121 (_2!6004 lt!203291)))))))

(declare-fun b!131777 () Bool)

(declare-fun res!109340 () Bool)

(assert (=> b!131777 (=> (not res!109340) (not e!87344))))

(assert (=> b!131777 (= res!109340 (= (bitIndex!0 (size!2754 (buf!3121 (_2!6004 lt!203291))) (currentByte!5900 (_2!6004 lt!203291)) (currentBit!5895 (_2!6004 lt!203291))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2754 (buf!3121 thiss!1634)) (currentByte!5900 thiss!1634) (currentBit!5895 thiss!1634)))))))

(declare-fun res!109347 () Bool)

(assert (=> start!25808 (=> (not res!109347) (not e!87350))))

(assert (=> start!25808 (= res!109347 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2754 arr!237))))))

(assert (=> start!25808 e!87350))

(assert (=> start!25808 true))

(assert (=> start!25808 (array_inv!2543 arr!237)))

(declare-fun inv!12 (BitStream!4772) Bool)

(assert (=> start!25808 (and (inv!12 thiss!1634) e!87343)))

(declare-fun b!131774 () Bool)

(declare-fun res!109346 () Bool)

(assert (=> b!131774 (=> (not res!109346) (not e!87352))))

(assert (=> b!131774 (= res!109346 (isPrefixOf!0 (_2!6004 lt!203291) (_2!6004 lt!203292)))))

(assert (= (and start!25808 res!109347) b!131765))

(assert (= (and b!131765 res!109344) b!131763))

(assert (= (and b!131763 res!109348) b!131764))

(assert (= (and b!131764 res!109343) b!131771))

(assert (= (and b!131771 res!109349) b!131777))

(assert (= (and b!131777 res!109340) b!131768))

(assert (= (and b!131768 res!109339) b!131773))

(assert (= (and b!131771 res!109341) b!131766))

(assert (= (and b!131766 res!109342) b!131774))

(assert (= (and b!131774 res!109346) b!131769))

(assert (= (and b!131769 (not res!109338)) b!131775))

(assert (= (and b!131771 res!109351) b!131776))

(assert (= (and b!131771 res!109350) b!131770))

(assert (= (and b!131771 res!109345) b!131772))

(assert (= start!25808 b!131767))

(declare-fun m!198903 () Bool)

(assert (=> b!131767 m!198903))

(declare-fun m!198905 () Bool)

(assert (=> b!131775 m!198905))

(declare-fun m!198907 () Bool)

(assert (=> b!131765 m!198907))

(declare-fun m!198909 () Bool)

(assert (=> start!25808 m!198909))

(declare-fun m!198911 () Bool)

(assert (=> start!25808 m!198911))

(declare-fun m!198913 () Bool)

(assert (=> b!131764 m!198913))

(declare-fun m!198915 () Bool)

(assert (=> b!131771 m!198915))

(declare-fun m!198917 () Bool)

(assert (=> b!131771 m!198917))

(declare-fun m!198919 () Bool)

(assert (=> b!131771 m!198919))

(declare-fun m!198921 () Bool)

(assert (=> b!131771 m!198921))

(declare-fun m!198923 () Bool)

(assert (=> b!131771 m!198923))

(declare-fun m!198925 () Bool)

(assert (=> b!131771 m!198925))

(declare-fun m!198927 () Bool)

(assert (=> b!131771 m!198927))

(declare-fun m!198929 () Bool)

(assert (=> b!131771 m!198929))

(declare-fun m!198931 () Bool)

(assert (=> b!131771 m!198931))

(declare-fun m!198933 () Bool)

(assert (=> b!131771 m!198933))

(declare-fun m!198935 () Bool)

(assert (=> b!131771 m!198935))

(declare-fun m!198937 () Bool)

(assert (=> b!131771 m!198937))

(declare-fun m!198939 () Bool)

(assert (=> b!131771 m!198939))

(assert (=> b!131771 m!198937))

(declare-fun m!198941 () Bool)

(assert (=> b!131771 m!198941))

(declare-fun m!198943 () Bool)

(assert (=> b!131771 m!198943))

(declare-fun m!198945 () Bool)

(assert (=> b!131771 m!198945))

(declare-fun m!198947 () Bool)

(assert (=> b!131771 m!198947))

(declare-fun m!198949 () Bool)

(assert (=> b!131768 m!198949))

(declare-fun m!198951 () Bool)

(assert (=> b!131769 m!198951))

(declare-fun m!198953 () Bool)

(assert (=> b!131769 m!198953))

(declare-fun m!198955 () Bool)

(assert (=> b!131769 m!198955))

(assert (=> b!131769 m!198927))

(declare-fun m!198957 () Bool)

(assert (=> b!131774 m!198957))

(declare-fun m!198959 () Bool)

(assert (=> b!131772 m!198959))

(declare-fun m!198961 () Bool)

(assert (=> b!131776 m!198961))

(assert (=> b!131773 m!198937))

(declare-fun m!198963 () Bool)

(assert (=> b!131773 m!198963))

(declare-fun m!198965 () Bool)

(assert (=> b!131773 m!198965))

(declare-fun m!198967 () Bool)

(assert (=> b!131777 m!198967))

(declare-fun m!198969 () Bool)

(assert (=> b!131777 m!198969))

(declare-fun m!198971 () Bool)

(assert (=> b!131766 m!198971))

(assert (=> b!131766 m!198967))

(push 1)

(assert (not b!131776))

(assert (not b!131777))

(assert (not b!131772))

(assert (not b!131768))

(assert (not b!131773))

(assert (not b!131767))

(assert (not b!131765))

(assert (not b!131766))

(assert (not b!131771))

(assert (not b!131775))

(assert (not b!131769))

(assert (not b!131764))

(assert (not b!131774))

(assert (not start!25808))

(check-sat)

