; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25792 () Bool)

(assert start!25792)

(declare-fun b!131403 () Bool)

(declare-fun res!109013 () Bool)

(declare-fun e!87079 () Bool)

(assert (=> b!131403 (=> (not res!109013) (not e!87079))))

(declare-datatypes ((array!6067 0))(
  ( (array!6068 (arr!3375 (Array (_ BitVec 32) (_ BitVec 8))) (size!2746 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4756 0))(
  ( (BitStream!4757 (buf!3113 array!6067) (currentByte!5892 (_ BitVec 32)) (currentBit!5887 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8115 0))(
  ( (Unit!8116) )
))
(declare-datatypes ((tuple2!11338 0))(
  ( (tuple2!11339 (_1!5972 Unit!8115) (_2!5972 BitStream!4756)) )
))
(declare-fun lt!202883 () tuple2!11338)

(declare-fun thiss!1634 () BitStream!4756)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!131403 (= res!109013 (= (bitIndex!0 (size!2746 (buf!3113 (_2!5972 lt!202883))) (currentByte!5892 (_2!5972 lt!202883)) (currentBit!5887 (_2!5972 lt!202883))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2746 (buf!3113 thiss!1634)) (currentByte!5892 thiss!1634) (currentBit!5887 thiss!1634)))))))

(declare-fun b!131404 () Bool)

(declare-fun arr!237 () array!6067)

(declare-datatypes ((tuple2!11340 0))(
  ( (tuple2!11341 (_1!5973 BitStream!4756) (_2!5973 BitStream!4756)) )
))
(declare-fun lt!202884 () tuple2!11340)

(declare-datatypes ((tuple2!11342 0))(
  ( (tuple2!11343 (_1!5974 BitStream!4756) (_2!5974 (_ BitVec 8))) )
))
(declare-fun lt!202872 () tuple2!11342)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!131404 (= e!87079 (and (= (_2!5974 lt!202872) (select (arr!3375 arr!237) from!447)) (= (_1!5974 lt!202872) (_2!5973 lt!202884))))))

(declare-fun readBytePure!0 (BitStream!4756) tuple2!11342)

(assert (=> b!131404 (= lt!202872 (readBytePure!0 (_1!5973 lt!202884)))))

(declare-fun reader!0 (BitStream!4756 BitStream!4756) tuple2!11340)

(assert (=> b!131404 (= lt!202884 (reader!0 thiss!1634 (_2!5972 lt!202883)))))

(declare-fun b!131405 () Bool)

(declare-fun res!109003 () Bool)

(declare-fun e!87085 () Bool)

(assert (=> b!131405 (=> (not res!109003) (not e!87085))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!131405 (= res!109003 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2746 (buf!3113 thiss!1634))) ((_ sign_extend 32) (currentByte!5892 thiss!1634)) ((_ sign_extend 32) (currentBit!5887 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!131406 () Bool)

(assert (=> b!131406 (= e!87085 (not true))))

(declare-fun e!87081 () Bool)

(assert (=> b!131406 e!87081))

(declare-fun res!109014 () Bool)

(assert (=> b!131406 (=> (not res!109014) (not e!87081))))

(declare-fun lt!202876 () tuple2!11338)

(assert (=> b!131406 (= res!109014 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2746 (buf!3113 (_2!5972 lt!202876)))) ((_ sign_extend 32) (currentByte!5892 thiss!1634)) ((_ sign_extend 32) (currentBit!5887 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!202886 () Unit!8115)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4756 array!6067 (_ BitVec 32)) Unit!8115)

(assert (=> b!131406 (= lt!202886 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3113 (_2!5972 lt!202876)) (bvsub to!404 from!447)))))

(declare-fun lt!202885 () tuple2!11340)

(assert (=> b!131406 (= (_2!5974 (readBytePure!0 (_1!5973 lt!202885))) (select (arr!3375 arr!237) from!447))))

(declare-fun lt!202871 () tuple2!11340)

(assert (=> b!131406 (= lt!202871 (reader!0 (_2!5972 lt!202883) (_2!5972 lt!202876)))))

(assert (=> b!131406 (= lt!202885 (reader!0 thiss!1634 (_2!5972 lt!202876)))))

(declare-fun e!87087 () Bool)

(assert (=> b!131406 e!87087))

(declare-fun res!109012 () Bool)

(assert (=> b!131406 (=> (not res!109012) (not e!87087))))

(declare-fun lt!202874 () tuple2!11342)

(declare-fun lt!202875 () tuple2!11342)

(assert (=> b!131406 (= res!109012 (= (bitIndex!0 (size!2746 (buf!3113 (_1!5974 lt!202874))) (currentByte!5892 (_1!5974 lt!202874)) (currentBit!5887 (_1!5974 lt!202874))) (bitIndex!0 (size!2746 (buf!3113 (_1!5974 lt!202875))) (currentByte!5892 (_1!5974 lt!202875)) (currentBit!5887 (_1!5974 lt!202875)))))))

(declare-fun lt!202870 () Unit!8115)

(declare-fun lt!202877 () BitStream!4756)

(declare-fun readBytePrefixLemma!0 (BitStream!4756 BitStream!4756) Unit!8115)

(assert (=> b!131406 (= lt!202870 (readBytePrefixLemma!0 lt!202877 (_2!5972 lt!202876)))))

(assert (=> b!131406 (= lt!202875 (readBytePure!0 (BitStream!4757 (buf!3113 (_2!5972 lt!202876)) (currentByte!5892 thiss!1634) (currentBit!5887 thiss!1634))))))

(assert (=> b!131406 (= lt!202874 (readBytePure!0 lt!202877))))

(assert (=> b!131406 (= lt!202877 (BitStream!4757 (buf!3113 (_2!5972 lt!202883)) (currentByte!5892 thiss!1634) (currentBit!5887 thiss!1634)))))

(declare-fun e!87080 () Bool)

(assert (=> b!131406 e!87080))

(declare-fun res!109004 () Bool)

(assert (=> b!131406 (=> (not res!109004) (not e!87080))))

(declare-fun isPrefixOf!0 (BitStream!4756 BitStream!4756) Bool)

(assert (=> b!131406 (= res!109004 (isPrefixOf!0 thiss!1634 (_2!5972 lt!202876)))))

(declare-fun lt!202873 () Unit!8115)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4756 BitStream!4756 BitStream!4756) Unit!8115)

(assert (=> b!131406 (= lt!202873 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5972 lt!202883) (_2!5972 lt!202876)))))

(declare-fun e!87083 () Bool)

(assert (=> b!131406 e!87083))

(declare-fun res!109002 () Bool)

(assert (=> b!131406 (=> (not res!109002) (not e!87083))))

(assert (=> b!131406 (= res!109002 (= (size!2746 (buf!3113 (_2!5972 lt!202883))) (size!2746 (buf!3113 (_2!5972 lt!202876)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4756 array!6067 (_ BitVec 32) (_ BitVec 32)) tuple2!11338)

(assert (=> b!131406 (= lt!202876 (appendByteArrayLoop!0 (_2!5972 lt!202883) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!131406 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2746 (buf!3113 (_2!5972 lt!202883)))) ((_ sign_extend 32) (currentByte!5892 (_2!5972 lt!202883))) ((_ sign_extend 32) (currentBit!5887 (_2!5972 lt!202883))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!202878 () Unit!8115)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4756 BitStream!4756 (_ BitVec 64) (_ BitVec 32)) Unit!8115)

(assert (=> b!131406 (= lt!202878 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5972 lt!202883) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!131406 e!87079))

(declare-fun res!109010 () Bool)

(assert (=> b!131406 (=> (not res!109010) (not e!87079))))

(assert (=> b!131406 (= res!109010 (= (size!2746 (buf!3113 thiss!1634)) (size!2746 (buf!3113 (_2!5972 lt!202883)))))))

(declare-fun appendByte!0 (BitStream!4756 (_ BitVec 8)) tuple2!11338)

(assert (=> b!131406 (= lt!202883 (appendByte!0 thiss!1634 (select (arr!3375 arr!237) from!447)))))

(declare-fun b!131407 () Bool)

(declare-fun e!87082 () Bool)

(declare-fun array_inv!2535 (array!6067) Bool)

(assert (=> b!131407 (= e!87082 (array_inv!2535 (buf!3113 thiss!1634)))))

(declare-datatypes ((tuple2!11344 0))(
  ( (tuple2!11345 (_1!5975 BitStream!4756) (_2!5975 array!6067)) )
))
(declare-fun lt!202882 () tuple2!11344)

(declare-fun b!131408 () Bool)

(declare-fun e!87086 () Bool)

(declare-fun arrayRangesEq!149 (array!6067 array!6067 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!131408 (= e!87086 (not (arrayRangesEq!149 arr!237 (_2!5975 lt!202882) #b00000000000000000000000000000000 to!404)))))

(declare-fun res!109009 () Bool)

(assert (=> start!25792 (=> (not res!109009) (not e!87085))))

(assert (=> start!25792 (= res!109009 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2746 arr!237))))))

(assert (=> start!25792 e!87085))

(assert (=> start!25792 true))

(assert (=> start!25792 (array_inv!2535 arr!237)))

(declare-fun inv!12 (BitStream!4756) Bool)

(assert (=> start!25792 (and (inv!12 thiss!1634) e!87082)))

(declare-fun b!131409 () Bool)

(declare-fun e!87088 () Bool)

(assert (=> b!131409 (= e!87088 (not e!87086))))

(declare-fun res!109007 () Bool)

(assert (=> b!131409 (=> res!109007 e!87086)))

(declare-fun lt!202881 () tuple2!11340)

(assert (=> b!131409 (= res!109007 (or (not (= (size!2746 (_2!5975 lt!202882)) (size!2746 arr!237))) (not (= (_1!5975 lt!202882) (_2!5973 lt!202881)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4756 array!6067 (_ BitVec 32) (_ BitVec 32)) tuple2!11344)

(assert (=> b!131409 (= lt!202882 (readByteArrayLoopPure!0 (_1!5973 lt!202881) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!202879 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!131409 (validate_offset_bits!1 ((_ sign_extend 32) (size!2746 (buf!3113 (_2!5972 lt!202876)))) ((_ sign_extend 32) (currentByte!5892 (_2!5972 lt!202883))) ((_ sign_extend 32) (currentBit!5887 (_2!5972 lt!202883))) lt!202879)))

(declare-fun lt!202880 () Unit!8115)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4756 array!6067 (_ BitVec 64)) Unit!8115)

(assert (=> b!131409 (= lt!202880 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5972 lt!202883) (buf!3113 (_2!5972 lt!202876)) lt!202879))))

(assert (=> b!131409 (= lt!202881 (reader!0 (_2!5972 lt!202883) (_2!5972 lt!202876)))))

(declare-fun b!131410 () Bool)

(declare-fun res!109005 () Bool)

(assert (=> b!131410 (=> (not res!109005) (not e!87085))))

(assert (=> b!131410 (= res!109005 (bvslt from!447 to!404))))

(declare-fun b!131411 () Bool)

(assert (=> b!131411 (= e!87087 (= (_2!5974 lt!202874) (_2!5974 lt!202875)))))

(declare-fun b!131412 () Bool)

(assert (=> b!131412 (= e!87083 e!87088)))

(declare-fun res!109008 () Bool)

(assert (=> b!131412 (=> (not res!109008) (not e!87088))))

(assert (=> b!131412 (= res!109008 (= (bitIndex!0 (size!2746 (buf!3113 (_2!5972 lt!202876))) (currentByte!5892 (_2!5972 lt!202876)) (currentBit!5887 (_2!5972 lt!202876))) (bvadd (bitIndex!0 (size!2746 (buf!3113 (_2!5972 lt!202883))) (currentByte!5892 (_2!5972 lt!202883)) (currentBit!5887 (_2!5972 lt!202883))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!202879))))))

(assert (=> b!131412 (= lt!202879 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!131413 () Bool)

(declare-fun res!109015 () Bool)

(assert (=> b!131413 (=> (not res!109015) (not e!87079))))

(assert (=> b!131413 (= res!109015 (isPrefixOf!0 thiss!1634 (_2!5972 lt!202883)))))

(declare-fun b!131414 () Bool)

(declare-fun res!109006 () Bool)

(assert (=> b!131414 (=> (not res!109006) (not e!87088))))

(assert (=> b!131414 (= res!109006 (isPrefixOf!0 (_2!5972 lt!202883) (_2!5972 lt!202876)))))

(declare-fun b!131415 () Bool)

(assert (=> b!131415 (= e!87081 (= (_1!5975 (readByteArrayLoopPure!0 (_1!5973 lt!202885) arr!237 from!447 to!404)) (_2!5973 lt!202885)))))

(declare-fun b!131416 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!131416 (= e!87080 (invariant!0 (currentBit!5887 thiss!1634) (currentByte!5892 thiss!1634) (size!2746 (buf!3113 (_2!5972 lt!202883)))))))

(declare-fun b!131417 () Bool)

(declare-fun res!109011 () Bool)

(assert (=> b!131417 (=> (not res!109011) (not e!87085))))

(assert (=> b!131417 (= res!109011 (invariant!0 (currentBit!5887 thiss!1634) (currentByte!5892 thiss!1634) (size!2746 (buf!3113 thiss!1634))))))

(assert (= (and start!25792 res!109009) b!131405))

(assert (= (and b!131405 res!109003) b!131410))

(assert (= (and b!131410 res!109005) b!131417))

(assert (= (and b!131417 res!109011) b!131406))

(assert (= (and b!131406 res!109010) b!131403))

(assert (= (and b!131403 res!109013) b!131413))

(assert (= (and b!131413 res!109015) b!131404))

(assert (= (and b!131406 res!109002) b!131412))

(assert (= (and b!131412 res!109008) b!131414))

(assert (= (and b!131414 res!109006) b!131409))

(assert (= (and b!131409 (not res!109007)) b!131408))

(assert (= (and b!131406 res!109004) b!131416))

(assert (= (and b!131406 res!109012) b!131411))

(assert (= (and b!131406 res!109014) b!131415))

(assert (= start!25792 b!131407))

(declare-fun m!198343 () Bool)

(assert (=> b!131408 m!198343))

(declare-fun m!198345 () Bool)

(assert (=> b!131416 m!198345))

(declare-fun m!198347 () Bool)

(assert (=> b!131414 m!198347))

(declare-fun m!198349 () Bool)

(assert (=> b!131417 m!198349))

(declare-fun m!198351 () Bool)

(assert (=> b!131413 m!198351))

(declare-fun m!198353 () Bool)

(assert (=> b!131405 m!198353))

(declare-fun m!198355 () Bool)

(assert (=> b!131415 m!198355))

(declare-fun m!198357 () Bool)

(assert (=> start!25792 m!198357))

(declare-fun m!198359 () Bool)

(assert (=> start!25792 m!198359))

(declare-fun m!198361 () Bool)

(assert (=> b!131406 m!198361))

(declare-fun m!198363 () Bool)

(assert (=> b!131406 m!198363))

(declare-fun m!198365 () Bool)

(assert (=> b!131406 m!198365))

(declare-fun m!198367 () Bool)

(assert (=> b!131406 m!198367))

(declare-fun m!198369 () Bool)

(assert (=> b!131406 m!198369))

(declare-fun m!198371 () Bool)

(assert (=> b!131406 m!198371))

(declare-fun m!198373 () Bool)

(assert (=> b!131406 m!198373))

(declare-fun m!198375 () Bool)

(assert (=> b!131406 m!198375))

(declare-fun m!198377 () Bool)

(assert (=> b!131406 m!198377))

(declare-fun m!198379 () Bool)

(assert (=> b!131406 m!198379))

(declare-fun m!198381 () Bool)

(assert (=> b!131406 m!198381))

(declare-fun m!198383 () Bool)

(assert (=> b!131406 m!198383))

(declare-fun m!198385 () Bool)

(assert (=> b!131406 m!198385))

(declare-fun m!198387 () Bool)

(assert (=> b!131406 m!198387))

(declare-fun m!198389 () Bool)

(assert (=> b!131406 m!198389))

(declare-fun m!198391 () Bool)

(assert (=> b!131406 m!198391))

(declare-fun m!198393 () Bool)

(assert (=> b!131406 m!198393))

(assert (=> b!131406 m!198373))

(assert (=> b!131404 m!198373))

(declare-fun m!198395 () Bool)

(assert (=> b!131404 m!198395))

(declare-fun m!198397 () Bool)

(assert (=> b!131404 m!198397))

(declare-fun m!198399 () Bool)

(assert (=> b!131412 m!198399))

(declare-fun m!198401 () Bool)

(assert (=> b!131412 m!198401))

(assert (=> b!131403 m!198401))

(declare-fun m!198403 () Bool)

(assert (=> b!131403 m!198403))

(declare-fun m!198405 () Bool)

(assert (=> b!131409 m!198405))

(declare-fun m!198407 () Bool)

(assert (=> b!131409 m!198407))

(declare-fun m!198409 () Bool)

(assert (=> b!131409 m!198409))

(assert (=> b!131409 m!198387))

(declare-fun m!198411 () Bool)

(assert (=> b!131407 m!198411))

(push 1)

(assert (not b!131403))

(assert (not b!131409))

(assert (not start!25792))

(assert (not b!131413))

(assert (not b!131415))

(assert (not b!131407))

(assert (not b!131406))

(assert (not b!131416))

(assert (not b!131408))

(assert (not b!131405))

(assert (not b!131412))

(assert (not b!131417))

(assert (not b!131414))

(assert (not b!131404))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

