; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25794 () Bool)

(assert start!25794)

(declare-fun b!131448 () Bool)

(declare-fun res!109053 () Bool)

(declare-fun e!87118 () Bool)

(assert (=> b!131448 (=> (not res!109053) (not e!87118))))

(declare-datatypes ((array!6069 0))(
  ( (array!6070 (arr!3376 (Array (_ BitVec 32) (_ BitVec 8))) (size!2747 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4758 0))(
  ( (BitStream!4759 (buf!3114 array!6069) (currentByte!5893 (_ BitVec 32)) (currentBit!5888 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4758)

(declare-datatypes ((Unit!8117 0))(
  ( (Unit!8118) )
))
(declare-datatypes ((tuple2!11346 0))(
  ( (tuple2!11347 (_1!5976 Unit!8117) (_2!5976 BitStream!4758)) )
))
(declare-fun lt!202928 () tuple2!11346)

(declare-fun isPrefixOf!0 (BitStream!4758 BitStream!4758) Bool)

(assert (=> b!131448 (= res!109053 (isPrefixOf!0 thiss!1634 (_2!5976 lt!202928)))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((tuple2!11348 0))(
  ( (tuple2!11349 (_1!5977 BitStream!4758) (_2!5977 array!6069)) )
))
(declare-fun lt!202937 () tuple2!11348)

(declare-fun e!87121 () Bool)

(declare-fun b!131449 () Bool)

(declare-fun arr!237 () array!6069)

(declare-fun arrayRangesEq!150 (array!6069 array!6069 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!131449 (= e!87121 (not (arrayRangesEq!150 arr!237 (_2!5977 lt!202937) #b00000000000000000000000000000000 to!404)))))

(declare-datatypes ((tuple2!11350 0))(
  ( (tuple2!11351 (_1!5978 BitStream!4758) (_2!5978 (_ BitVec 8))) )
))
(declare-fun lt!202924 () tuple2!11350)

(declare-datatypes ((tuple2!11352 0))(
  ( (tuple2!11353 (_1!5979 BitStream!4758) (_2!5979 BitStream!4758)) )
))
(declare-fun lt!202927 () tuple2!11352)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun b!131450 () Bool)

(assert (=> b!131450 (= e!87118 (and (= (_2!5978 lt!202924) (select (arr!3376 arr!237) from!447)) (= (_1!5978 lt!202924) (_2!5979 lt!202927))))))

(declare-fun readBytePure!0 (BitStream!4758) tuple2!11350)

(assert (=> b!131450 (= lt!202924 (readBytePure!0 (_1!5979 lt!202927)))))

(declare-fun reader!0 (BitStream!4758 BitStream!4758) tuple2!11352)

(assert (=> b!131450 (= lt!202927 (reader!0 thiss!1634 (_2!5976 lt!202928)))))

(declare-fun res!109049 () Bool)

(declare-fun e!87113 () Bool)

(assert (=> start!25794 (=> (not res!109049) (not e!87113))))

(assert (=> start!25794 (= res!109049 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2747 arr!237))))))

(assert (=> start!25794 e!87113))

(assert (=> start!25794 true))

(declare-fun array_inv!2536 (array!6069) Bool)

(assert (=> start!25794 (array_inv!2536 arr!237)))

(declare-fun e!87114 () Bool)

(declare-fun inv!12 (BitStream!4758) Bool)

(assert (=> start!25794 (and (inv!12 thiss!1634) e!87114)))

(declare-fun b!131451 () Bool)

(declare-fun res!109046 () Bool)

(assert (=> b!131451 (=> (not res!109046) (not e!87113))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!131451 (= res!109046 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2747 (buf!3114 thiss!1634))) ((_ sign_extend 32) (currentByte!5893 thiss!1634)) ((_ sign_extend 32) (currentBit!5888 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!131452 () Bool)

(declare-fun e!87120 () Bool)

(assert (=> b!131452 (= e!87120 (not e!87121))))

(declare-fun res!109050 () Bool)

(assert (=> b!131452 (=> res!109050 e!87121)))

(declare-fun lt!202936 () tuple2!11352)

(assert (=> b!131452 (= res!109050 (or (not (= (size!2747 (_2!5977 lt!202937)) (size!2747 arr!237))) (not (= (_1!5977 lt!202937) (_2!5979 lt!202936)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4758 array!6069 (_ BitVec 32) (_ BitVec 32)) tuple2!11348)

(assert (=> b!131452 (= lt!202937 (readByteArrayLoopPure!0 (_1!5979 lt!202936) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!202921 () tuple2!11346)

(declare-fun lt!202933 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!131452 (validate_offset_bits!1 ((_ sign_extend 32) (size!2747 (buf!3114 (_2!5976 lt!202921)))) ((_ sign_extend 32) (currentByte!5893 (_2!5976 lt!202928))) ((_ sign_extend 32) (currentBit!5888 (_2!5976 lt!202928))) lt!202933)))

(declare-fun lt!202925 () Unit!8117)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4758 array!6069 (_ BitVec 64)) Unit!8117)

(assert (=> b!131452 (= lt!202925 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5976 lt!202928) (buf!3114 (_2!5976 lt!202921)) lt!202933))))

(assert (=> b!131452 (= lt!202936 (reader!0 (_2!5976 lt!202928) (_2!5976 lt!202921)))))

(declare-fun b!131453 () Bool)

(declare-fun res!109055 () Bool)

(assert (=> b!131453 (=> (not res!109055) (not e!87113))))

(assert (=> b!131453 (= res!109055 (bvslt from!447 to!404))))

(declare-fun e!87122 () Bool)

(declare-fun b!131454 () Bool)

(declare-fun lt!202929 () tuple2!11352)

(assert (=> b!131454 (= e!87122 (= (_1!5977 (readByteArrayLoopPure!0 (_1!5979 lt!202929) arr!237 from!447 to!404)) (_2!5979 lt!202929)))))

(declare-fun b!131455 () Bool)

(declare-fun res!109054 () Bool)

(assert (=> b!131455 (=> (not res!109054) (not e!87118))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!131455 (= res!109054 (= (bitIndex!0 (size!2747 (buf!3114 (_2!5976 lt!202928))) (currentByte!5893 (_2!5976 lt!202928)) (currentBit!5888 (_2!5976 lt!202928))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2747 (buf!3114 thiss!1634)) (currentByte!5893 thiss!1634) (currentBit!5888 thiss!1634)))))))

(declare-fun b!131456 () Bool)

(declare-fun res!109051 () Bool)

(assert (=> b!131456 (=> (not res!109051) (not e!87113))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!131456 (= res!109051 (invariant!0 (currentBit!5888 thiss!1634) (currentByte!5893 thiss!1634) (size!2747 (buf!3114 thiss!1634))))))

(declare-fun b!131457 () Bool)

(assert (=> b!131457 (= e!87114 (array_inv!2536 (buf!3114 thiss!1634)))))

(declare-fun b!131458 () Bool)

(declare-fun e!87117 () Bool)

(assert (=> b!131458 (= e!87117 (invariant!0 (currentBit!5888 thiss!1634) (currentByte!5893 thiss!1634) (size!2747 (buf!3114 (_2!5976 lt!202928)))))))

(declare-fun b!131459 () Bool)

(assert (=> b!131459 (= e!87113 (not true))))

(assert (=> b!131459 e!87122))

(declare-fun res!109047 () Bool)

(assert (=> b!131459 (=> (not res!109047) (not e!87122))))

(assert (=> b!131459 (= res!109047 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2747 (buf!3114 (_2!5976 lt!202921)))) ((_ sign_extend 32) (currentByte!5893 thiss!1634)) ((_ sign_extend 32) (currentBit!5888 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!202934 () Unit!8117)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4758 array!6069 (_ BitVec 32)) Unit!8117)

(assert (=> b!131459 (= lt!202934 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3114 (_2!5976 lt!202921)) (bvsub to!404 from!447)))))

(assert (=> b!131459 (= (_2!5978 (readBytePure!0 (_1!5979 lt!202929))) (select (arr!3376 arr!237) from!447))))

(declare-fun lt!202932 () tuple2!11352)

(assert (=> b!131459 (= lt!202932 (reader!0 (_2!5976 lt!202928) (_2!5976 lt!202921)))))

(assert (=> b!131459 (= lt!202929 (reader!0 thiss!1634 (_2!5976 lt!202921)))))

(declare-fun e!87112 () Bool)

(assert (=> b!131459 e!87112))

(declare-fun res!109048 () Bool)

(assert (=> b!131459 (=> (not res!109048) (not e!87112))))

(declare-fun lt!202935 () tuple2!11350)

(declare-fun lt!202930 () tuple2!11350)

(assert (=> b!131459 (= res!109048 (= (bitIndex!0 (size!2747 (buf!3114 (_1!5978 lt!202935))) (currentByte!5893 (_1!5978 lt!202935)) (currentBit!5888 (_1!5978 lt!202935))) (bitIndex!0 (size!2747 (buf!3114 (_1!5978 lt!202930))) (currentByte!5893 (_1!5978 lt!202930)) (currentBit!5888 (_1!5978 lt!202930)))))))

(declare-fun lt!202931 () Unit!8117)

(declare-fun lt!202922 () BitStream!4758)

(declare-fun readBytePrefixLemma!0 (BitStream!4758 BitStream!4758) Unit!8117)

(assert (=> b!131459 (= lt!202931 (readBytePrefixLemma!0 lt!202922 (_2!5976 lt!202921)))))

(assert (=> b!131459 (= lt!202930 (readBytePure!0 (BitStream!4759 (buf!3114 (_2!5976 lt!202921)) (currentByte!5893 thiss!1634) (currentBit!5888 thiss!1634))))))

(assert (=> b!131459 (= lt!202935 (readBytePure!0 lt!202922))))

(assert (=> b!131459 (= lt!202922 (BitStream!4759 (buf!3114 (_2!5976 lt!202928)) (currentByte!5893 thiss!1634) (currentBit!5888 thiss!1634)))))

(assert (=> b!131459 e!87117))

(declare-fun res!109056 () Bool)

(assert (=> b!131459 (=> (not res!109056) (not e!87117))))

(assert (=> b!131459 (= res!109056 (isPrefixOf!0 thiss!1634 (_2!5976 lt!202921)))))

(declare-fun lt!202926 () Unit!8117)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4758 BitStream!4758 BitStream!4758) Unit!8117)

(assert (=> b!131459 (= lt!202926 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5976 lt!202928) (_2!5976 lt!202921)))))

(declare-fun e!87116 () Bool)

(assert (=> b!131459 e!87116))

(declare-fun res!109044 () Bool)

(assert (=> b!131459 (=> (not res!109044) (not e!87116))))

(assert (=> b!131459 (= res!109044 (= (size!2747 (buf!3114 (_2!5976 lt!202928))) (size!2747 (buf!3114 (_2!5976 lt!202921)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4758 array!6069 (_ BitVec 32) (_ BitVec 32)) tuple2!11346)

(assert (=> b!131459 (= lt!202921 (appendByteArrayLoop!0 (_2!5976 lt!202928) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!131459 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2747 (buf!3114 (_2!5976 lt!202928)))) ((_ sign_extend 32) (currentByte!5893 (_2!5976 lt!202928))) ((_ sign_extend 32) (currentBit!5888 (_2!5976 lt!202928))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!202923 () Unit!8117)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4758 BitStream!4758 (_ BitVec 64) (_ BitVec 32)) Unit!8117)

(assert (=> b!131459 (= lt!202923 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5976 lt!202928) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!131459 e!87118))

(declare-fun res!109052 () Bool)

(assert (=> b!131459 (=> (not res!109052) (not e!87118))))

(assert (=> b!131459 (= res!109052 (= (size!2747 (buf!3114 thiss!1634)) (size!2747 (buf!3114 (_2!5976 lt!202928)))))))

(declare-fun appendByte!0 (BitStream!4758 (_ BitVec 8)) tuple2!11346)

(assert (=> b!131459 (= lt!202928 (appendByte!0 thiss!1634 (select (arr!3376 arr!237) from!447)))))

(declare-fun b!131460 () Bool)

(assert (=> b!131460 (= e!87116 e!87120)))

(declare-fun res!109057 () Bool)

(assert (=> b!131460 (=> (not res!109057) (not e!87120))))

(assert (=> b!131460 (= res!109057 (= (bitIndex!0 (size!2747 (buf!3114 (_2!5976 lt!202921))) (currentByte!5893 (_2!5976 lt!202921)) (currentBit!5888 (_2!5976 lt!202921))) (bvadd (bitIndex!0 (size!2747 (buf!3114 (_2!5976 lt!202928))) (currentByte!5893 (_2!5976 lt!202928)) (currentBit!5888 (_2!5976 lt!202928))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!202933))))))

(assert (=> b!131460 (= lt!202933 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!131461 () Bool)

(declare-fun res!109045 () Bool)

(assert (=> b!131461 (=> (not res!109045) (not e!87120))))

(assert (=> b!131461 (= res!109045 (isPrefixOf!0 (_2!5976 lt!202928) (_2!5976 lt!202921)))))

(declare-fun b!131462 () Bool)

(assert (=> b!131462 (= e!87112 (= (_2!5978 lt!202935) (_2!5978 lt!202930)))))

(assert (= (and start!25794 res!109049) b!131451))

(assert (= (and b!131451 res!109046) b!131453))

(assert (= (and b!131453 res!109055) b!131456))

(assert (= (and b!131456 res!109051) b!131459))

(assert (= (and b!131459 res!109052) b!131455))

(assert (= (and b!131455 res!109054) b!131448))

(assert (= (and b!131448 res!109053) b!131450))

(assert (= (and b!131459 res!109044) b!131460))

(assert (= (and b!131460 res!109057) b!131461))

(assert (= (and b!131461 res!109045) b!131452))

(assert (= (and b!131452 (not res!109050)) b!131449))

(assert (= (and b!131459 res!109056) b!131458))

(assert (= (and b!131459 res!109048) b!131462))

(assert (= (and b!131459 res!109047) b!131454))

(assert (= start!25794 b!131457))

(declare-fun m!198413 () Bool)

(assert (=> b!131460 m!198413))

(declare-fun m!198415 () Bool)

(assert (=> b!131460 m!198415))

(declare-fun m!198417 () Bool)

(assert (=> b!131448 m!198417))

(declare-fun m!198419 () Bool)

(assert (=> b!131459 m!198419))

(declare-fun m!198421 () Bool)

(assert (=> b!131459 m!198421))

(declare-fun m!198423 () Bool)

(assert (=> b!131459 m!198423))

(declare-fun m!198425 () Bool)

(assert (=> b!131459 m!198425))

(declare-fun m!198427 () Bool)

(assert (=> b!131459 m!198427))

(declare-fun m!198429 () Bool)

(assert (=> b!131459 m!198429))

(declare-fun m!198431 () Bool)

(assert (=> b!131459 m!198431))

(declare-fun m!198433 () Bool)

(assert (=> b!131459 m!198433))

(declare-fun m!198435 () Bool)

(assert (=> b!131459 m!198435))

(declare-fun m!198437 () Bool)

(assert (=> b!131459 m!198437))

(declare-fun m!198439 () Bool)

(assert (=> b!131459 m!198439))

(declare-fun m!198441 () Bool)

(assert (=> b!131459 m!198441))

(declare-fun m!198443 () Bool)

(assert (=> b!131459 m!198443))

(assert (=> b!131459 m!198441))

(declare-fun m!198445 () Bool)

(assert (=> b!131459 m!198445))

(declare-fun m!198447 () Bool)

(assert (=> b!131459 m!198447))

(declare-fun m!198449 () Bool)

(assert (=> b!131459 m!198449))

(declare-fun m!198451 () Bool)

(assert (=> b!131459 m!198451))

(declare-fun m!198453 () Bool)

(assert (=> b!131451 m!198453))

(declare-fun m!198455 () Bool)

(assert (=> b!131454 m!198455))

(declare-fun m!198457 () Bool)

(assert (=> start!25794 m!198457))

(declare-fun m!198459 () Bool)

(assert (=> start!25794 m!198459))

(declare-fun m!198461 () Bool)

(assert (=> b!131456 m!198461))

(declare-fun m!198463 () Bool)

(assert (=> b!131457 m!198463))

(declare-fun m!198465 () Bool)

(assert (=> b!131452 m!198465))

(declare-fun m!198467 () Bool)

(assert (=> b!131452 m!198467))

(declare-fun m!198469 () Bool)

(assert (=> b!131452 m!198469))

(assert (=> b!131452 m!198421))

(declare-fun m!198471 () Bool)

(assert (=> b!131449 m!198471))

(declare-fun m!198473 () Bool)

(assert (=> b!131461 m!198473))

(declare-fun m!198475 () Bool)

(assert (=> b!131458 m!198475))

(assert (=> b!131450 m!198441))

(declare-fun m!198477 () Bool)

(assert (=> b!131450 m!198477))

(declare-fun m!198479 () Bool)

(assert (=> b!131450 m!198479))

(assert (=> b!131455 m!198415))

(declare-fun m!198481 () Bool)

(assert (=> b!131455 m!198481))

(check-sat (not b!131460) (not b!131449) (not b!131452) (not b!131456) (not b!131459) (not b!131451) (not start!25794) (not b!131454) (not b!131450) (not b!131457) (not b!131455) (not b!131461) (not b!131458) (not b!131448))
