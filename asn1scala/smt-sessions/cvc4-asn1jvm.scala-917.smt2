; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25796 () Bool)

(assert start!25796)

(declare-fun b!131493 () Bool)

(declare-fun e!87152 () Bool)

(declare-datatypes ((array!6071 0))(
  ( (array!6072 (arr!3377 (Array (_ BitVec 32) (_ BitVec 8))) (size!2748 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4760 0))(
  ( (BitStream!4761 (buf!3115 array!6071) (currentByte!5894 (_ BitVec 32)) (currentBit!5889 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4760)

(declare-fun array_inv!2537 (array!6071) Bool)

(assert (=> b!131493 (= e!87152 (array_inv!2537 (buf!3115 thiss!1634)))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((tuple2!11354 0))(
  ( (tuple2!11355 (_1!5980 BitStream!4760) (_2!5980 array!6071)) )
))
(declare-fun lt!202980 () tuple2!11354)

(declare-fun e!87147 () Bool)

(declare-fun b!131494 () Bool)

(declare-fun arr!237 () array!6071)

(declare-fun arrayRangesEq!151 (array!6071 array!6071 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!131494 (= e!87147 (not (arrayRangesEq!151 arr!237 (_2!5980 lt!202980) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!131495 () Bool)

(declare-fun e!87153 () Bool)

(assert (=> b!131495 (= e!87153 (not true))))

(declare-fun e!87148 () Bool)

(assert (=> b!131495 e!87148))

(declare-fun res!109091 () Bool)

(assert (=> b!131495 (=> (not res!109091) (not e!87148))))

(declare-datatypes ((Unit!8119 0))(
  ( (Unit!8120) )
))
(declare-datatypes ((tuple2!11356 0))(
  ( (tuple2!11357 (_1!5981 Unit!8119) (_2!5981 BitStream!4760)) )
))
(declare-fun lt!202985 () tuple2!11356)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!131495 (= res!109091 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2748 (buf!3115 (_2!5981 lt!202985)))) ((_ sign_extend 32) (currentByte!5894 thiss!1634)) ((_ sign_extend 32) (currentBit!5889 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!202984 () Unit!8119)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4760 array!6071 (_ BitVec 32)) Unit!8119)

(assert (=> b!131495 (= lt!202984 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3115 (_2!5981 lt!202985)) (bvsub to!404 from!447)))))

(declare-datatypes ((tuple2!11358 0))(
  ( (tuple2!11359 (_1!5982 BitStream!4760) (_2!5982 BitStream!4760)) )
))
(declare-fun lt!202974 () tuple2!11358)

(declare-datatypes ((tuple2!11360 0))(
  ( (tuple2!11361 (_1!5983 BitStream!4760) (_2!5983 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!4760) tuple2!11360)

(assert (=> b!131495 (= (_2!5983 (readBytePure!0 (_1!5982 lt!202974))) (select (arr!3377 arr!237) from!447))))

(declare-fun lt!202988 () tuple2!11358)

(declare-fun lt!202973 () tuple2!11356)

(declare-fun reader!0 (BitStream!4760 BitStream!4760) tuple2!11358)

(assert (=> b!131495 (= lt!202988 (reader!0 (_2!5981 lt!202973) (_2!5981 lt!202985)))))

(assert (=> b!131495 (= lt!202974 (reader!0 thiss!1634 (_2!5981 lt!202985)))))

(declare-fun e!87154 () Bool)

(assert (=> b!131495 e!87154))

(declare-fun res!109092 () Bool)

(assert (=> b!131495 (=> (not res!109092) (not e!87154))))

(declare-fun lt!202978 () tuple2!11360)

(declare-fun lt!202981 () tuple2!11360)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!131495 (= res!109092 (= (bitIndex!0 (size!2748 (buf!3115 (_1!5983 lt!202978))) (currentByte!5894 (_1!5983 lt!202978)) (currentBit!5889 (_1!5983 lt!202978))) (bitIndex!0 (size!2748 (buf!3115 (_1!5983 lt!202981))) (currentByte!5894 (_1!5983 lt!202981)) (currentBit!5889 (_1!5983 lt!202981)))))))

(declare-fun lt!202977 () Unit!8119)

(declare-fun lt!202976 () BitStream!4760)

(declare-fun readBytePrefixLemma!0 (BitStream!4760 BitStream!4760) Unit!8119)

(assert (=> b!131495 (= lt!202977 (readBytePrefixLemma!0 lt!202976 (_2!5981 lt!202985)))))

(assert (=> b!131495 (= lt!202981 (readBytePure!0 (BitStream!4761 (buf!3115 (_2!5981 lt!202985)) (currentByte!5894 thiss!1634) (currentBit!5889 thiss!1634))))))

(assert (=> b!131495 (= lt!202978 (readBytePure!0 lt!202976))))

(assert (=> b!131495 (= lt!202976 (BitStream!4761 (buf!3115 (_2!5981 lt!202973)) (currentByte!5894 thiss!1634) (currentBit!5889 thiss!1634)))))

(declare-fun e!87151 () Bool)

(assert (=> b!131495 e!87151))

(declare-fun res!109098 () Bool)

(assert (=> b!131495 (=> (not res!109098) (not e!87151))))

(declare-fun isPrefixOf!0 (BitStream!4760 BitStream!4760) Bool)

(assert (=> b!131495 (= res!109098 (isPrefixOf!0 thiss!1634 (_2!5981 lt!202985)))))

(declare-fun lt!202972 () Unit!8119)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4760 BitStream!4760 BitStream!4760) Unit!8119)

(assert (=> b!131495 (= lt!202972 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5981 lt!202973) (_2!5981 lt!202985)))))

(declare-fun e!87145 () Bool)

(assert (=> b!131495 e!87145))

(declare-fun res!109095 () Bool)

(assert (=> b!131495 (=> (not res!109095) (not e!87145))))

(assert (=> b!131495 (= res!109095 (= (size!2748 (buf!3115 (_2!5981 lt!202973))) (size!2748 (buf!3115 (_2!5981 lt!202985)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4760 array!6071 (_ BitVec 32) (_ BitVec 32)) tuple2!11356)

(assert (=> b!131495 (= lt!202985 (appendByteArrayLoop!0 (_2!5981 lt!202973) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!131495 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2748 (buf!3115 (_2!5981 lt!202973)))) ((_ sign_extend 32) (currentByte!5894 (_2!5981 lt!202973))) ((_ sign_extend 32) (currentBit!5889 (_2!5981 lt!202973))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!202987 () Unit!8119)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4760 BitStream!4760 (_ BitVec 64) (_ BitVec 32)) Unit!8119)

(assert (=> b!131495 (= lt!202987 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5981 lt!202973) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!87146 () Bool)

(assert (=> b!131495 e!87146))

(declare-fun res!109094 () Bool)

(assert (=> b!131495 (=> (not res!109094) (not e!87146))))

(assert (=> b!131495 (= res!109094 (= (size!2748 (buf!3115 thiss!1634)) (size!2748 (buf!3115 (_2!5981 lt!202973)))))))

(declare-fun appendByte!0 (BitStream!4760 (_ BitVec 8)) tuple2!11356)

(assert (=> b!131495 (= lt!202973 (appendByte!0 thiss!1634 (select (arr!3377 arr!237) from!447)))))

(declare-fun b!131496 () Bool)

(declare-fun e!87155 () Bool)

(assert (=> b!131496 (= e!87155 (not e!87147))))

(declare-fun res!109090 () Bool)

(assert (=> b!131496 (=> res!109090 e!87147)))

(declare-fun lt!202979 () tuple2!11358)

(assert (=> b!131496 (= res!109090 (or (not (= (size!2748 (_2!5980 lt!202980)) (size!2748 arr!237))) (not (= (_1!5980 lt!202980) (_2!5982 lt!202979)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4760 array!6071 (_ BitVec 32) (_ BitVec 32)) tuple2!11354)

(assert (=> b!131496 (= lt!202980 (readByteArrayLoopPure!0 (_1!5982 lt!202979) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!202975 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!131496 (validate_offset_bits!1 ((_ sign_extend 32) (size!2748 (buf!3115 (_2!5981 lt!202985)))) ((_ sign_extend 32) (currentByte!5894 (_2!5981 lt!202973))) ((_ sign_extend 32) (currentBit!5889 (_2!5981 lt!202973))) lt!202975)))

(declare-fun lt!202982 () Unit!8119)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4760 array!6071 (_ BitVec 64)) Unit!8119)

(assert (=> b!131496 (= lt!202982 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5981 lt!202973) (buf!3115 (_2!5981 lt!202985)) lt!202975))))

(assert (=> b!131496 (= lt!202979 (reader!0 (_2!5981 lt!202973) (_2!5981 lt!202985)))))

(declare-fun b!131497 () Bool)

(assert (=> b!131497 (= e!87145 e!87155)))

(declare-fun res!109093 () Bool)

(assert (=> b!131497 (=> (not res!109093) (not e!87155))))

(assert (=> b!131497 (= res!109093 (= (bitIndex!0 (size!2748 (buf!3115 (_2!5981 lt!202985))) (currentByte!5894 (_2!5981 lt!202985)) (currentBit!5889 (_2!5981 lt!202985))) (bvadd (bitIndex!0 (size!2748 (buf!3115 (_2!5981 lt!202973))) (currentByte!5894 (_2!5981 lt!202973)) (currentBit!5889 (_2!5981 lt!202973))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!202975))))))

(assert (=> b!131497 (= lt!202975 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!131498 () Bool)

(declare-fun res!109086 () Bool)

(assert (=> b!131498 (=> (not res!109086) (not e!87153))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!131498 (= res!109086 (invariant!0 (currentBit!5889 thiss!1634) (currentByte!5894 thiss!1634) (size!2748 (buf!3115 thiss!1634))))))

(declare-fun res!109089 () Bool)

(assert (=> start!25796 (=> (not res!109089) (not e!87153))))

(assert (=> start!25796 (= res!109089 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2748 arr!237))))))

(assert (=> start!25796 e!87153))

(assert (=> start!25796 true))

(assert (=> start!25796 (array_inv!2537 arr!237)))

(declare-fun inv!12 (BitStream!4760) Bool)

(assert (=> start!25796 (and (inv!12 thiss!1634) e!87152)))

(declare-fun b!131499 () Bool)

(declare-fun res!109097 () Bool)

(assert (=> b!131499 (=> (not res!109097) (not e!87153))))

(assert (=> b!131499 (= res!109097 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2748 (buf!3115 thiss!1634))) ((_ sign_extend 32) (currentByte!5894 thiss!1634)) ((_ sign_extend 32) (currentBit!5889 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!131500 () Bool)

(declare-fun res!109087 () Bool)

(assert (=> b!131500 (=> (not res!109087) (not e!87153))))

(assert (=> b!131500 (= res!109087 (bvslt from!447 to!404))))

(declare-fun lt!202986 () tuple2!11360)

(declare-fun b!131501 () Bool)

(declare-fun lt!202983 () tuple2!11358)

(assert (=> b!131501 (= e!87146 (and (= (_2!5983 lt!202986) (select (arr!3377 arr!237) from!447)) (= (_1!5983 lt!202986) (_2!5982 lt!202983))))))

(assert (=> b!131501 (= lt!202986 (readBytePure!0 (_1!5982 lt!202983)))))

(assert (=> b!131501 (= lt!202983 (reader!0 thiss!1634 (_2!5981 lt!202973)))))

(declare-fun b!131502 () Bool)

(assert (=> b!131502 (= e!87148 (= (_1!5980 (readByteArrayLoopPure!0 (_1!5982 lt!202974) arr!237 from!447 to!404)) (_2!5982 lt!202974)))))

(declare-fun b!131503 () Bool)

(declare-fun res!109096 () Bool)

(assert (=> b!131503 (=> (not res!109096) (not e!87146))))

(assert (=> b!131503 (= res!109096 (= (bitIndex!0 (size!2748 (buf!3115 (_2!5981 lt!202973))) (currentByte!5894 (_2!5981 lt!202973)) (currentBit!5889 (_2!5981 lt!202973))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2748 (buf!3115 thiss!1634)) (currentByte!5894 thiss!1634) (currentBit!5889 thiss!1634)))))))

(declare-fun b!131504 () Bool)

(declare-fun res!109088 () Bool)

(assert (=> b!131504 (=> (not res!109088) (not e!87155))))

(assert (=> b!131504 (= res!109088 (isPrefixOf!0 (_2!5981 lt!202973) (_2!5981 lt!202985)))))

(declare-fun b!131505 () Bool)

(assert (=> b!131505 (= e!87151 (invariant!0 (currentBit!5889 thiss!1634) (currentByte!5894 thiss!1634) (size!2748 (buf!3115 (_2!5981 lt!202973)))))))

(declare-fun b!131506 () Bool)

(declare-fun res!109099 () Bool)

(assert (=> b!131506 (=> (not res!109099) (not e!87146))))

(assert (=> b!131506 (= res!109099 (isPrefixOf!0 thiss!1634 (_2!5981 lt!202973)))))

(declare-fun b!131507 () Bool)

(assert (=> b!131507 (= e!87154 (= (_2!5983 lt!202978) (_2!5983 lt!202981)))))

(assert (= (and start!25796 res!109089) b!131499))

(assert (= (and b!131499 res!109097) b!131500))

(assert (= (and b!131500 res!109087) b!131498))

(assert (= (and b!131498 res!109086) b!131495))

(assert (= (and b!131495 res!109094) b!131503))

(assert (= (and b!131503 res!109096) b!131506))

(assert (= (and b!131506 res!109099) b!131501))

(assert (= (and b!131495 res!109095) b!131497))

(assert (= (and b!131497 res!109093) b!131504))

(assert (= (and b!131504 res!109088) b!131496))

(assert (= (and b!131496 (not res!109090)) b!131494))

(assert (= (and b!131495 res!109098) b!131505))

(assert (= (and b!131495 res!109092) b!131507))

(assert (= (and b!131495 res!109091) b!131502))

(assert (= start!25796 b!131493))

(declare-fun m!198483 () Bool)

(assert (=> b!131506 m!198483))

(declare-fun m!198485 () Bool)

(assert (=> b!131498 m!198485))

(declare-fun m!198487 () Bool)

(assert (=> b!131501 m!198487))

(declare-fun m!198489 () Bool)

(assert (=> b!131501 m!198489))

(declare-fun m!198491 () Bool)

(assert (=> b!131501 m!198491))

(declare-fun m!198493 () Bool)

(assert (=> b!131504 m!198493))

(declare-fun m!198495 () Bool)

(assert (=> b!131496 m!198495))

(declare-fun m!198497 () Bool)

(assert (=> b!131496 m!198497))

(declare-fun m!198499 () Bool)

(assert (=> b!131496 m!198499))

(declare-fun m!198501 () Bool)

(assert (=> b!131496 m!198501))

(declare-fun m!198503 () Bool)

(assert (=> b!131495 m!198503))

(declare-fun m!198505 () Bool)

(assert (=> b!131495 m!198505))

(declare-fun m!198507 () Bool)

(assert (=> b!131495 m!198507))

(declare-fun m!198509 () Bool)

(assert (=> b!131495 m!198509))

(declare-fun m!198511 () Bool)

(assert (=> b!131495 m!198511))

(declare-fun m!198513 () Bool)

(assert (=> b!131495 m!198513))

(assert (=> b!131495 m!198501))

(declare-fun m!198515 () Bool)

(assert (=> b!131495 m!198515))

(declare-fun m!198517 () Bool)

(assert (=> b!131495 m!198517))

(declare-fun m!198519 () Bool)

(assert (=> b!131495 m!198519))

(assert (=> b!131495 m!198487))

(declare-fun m!198521 () Bool)

(assert (=> b!131495 m!198521))

(declare-fun m!198523 () Bool)

(assert (=> b!131495 m!198523))

(declare-fun m!198525 () Bool)

(assert (=> b!131495 m!198525))

(declare-fun m!198527 () Bool)

(assert (=> b!131495 m!198527))

(declare-fun m!198529 () Bool)

(assert (=> b!131495 m!198529))

(declare-fun m!198531 () Bool)

(assert (=> b!131495 m!198531))

(assert (=> b!131495 m!198487))

(declare-fun m!198533 () Bool)

(assert (=> b!131497 m!198533))

(declare-fun m!198535 () Bool)

(assert (=> b!131497 m!198535))

(declare-fun m!198537 () Bool)

(assert (=> b!131494 m!198537))

(declare-fun m!198539 () Bool)

(assert (=> b!131505 m!198539))

(declare-fun m!198541 () Bool)

(assert (=> start!25796 m!198541))

(declare-fun m!198543 () Bool)

(assert (=> start!25796 m!198543))

(assert (=> b!131503 m!198535))

(declare-fun m!198545 () Bool)

(assert (=> b!131503 m!198545))

(declare-fun m!198547 () Bool)

(assert (=> b!131493 m!198547))

(declare-fun m!198549 () Bool)

(assert (=> b!131499 m!198549))

(declare-fun m!198551 () Bool)

(assert (=> b!131502 m!198551))

(push 1)

(assert (not b!131503))

(assert (not b!131498))

(assert (not b!131497))

(assert (not b!131493))

(assert (not b!131499))

(assert (not b!131505))

(assert (not b!131502))

(assert (not b!131504))

(assert (not b!131506))

(assert (not start!25796))

(assert (not b!131501))

(assert (not b!131496))

(assert (not b!131494))

(assert (not b!131495))

(check-sat)

