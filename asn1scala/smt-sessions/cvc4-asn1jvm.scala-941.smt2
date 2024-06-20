; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26720 () Bool)

(assert start!26720)

(declare-fun b!137388 () Bool)

(declare-fun e!91295 () Bool)

(declare-fun e!91299 () Bool)

(assert (=> b!137388 (= e!91295 (not e!91299))))

(declare-fun res!114416 () Bool)

(assert (=> b!137388 (=> res!114416 e!91299)))

(declare-datatypes ((array!6229 0))(
  ( (array!6230 (arr!3506 (Array (_ BitVec 32) (_ BitVec 8))) (size!2820 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4904 0))(
  ( (BitStream!4905 (buf!3227 array!6229) (currentByte!6034 (_ BitVec 32)) (currentBit!6029 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!11970 0))(
  ( (tuple2!11971 (_1!6308 BitStream!4904) (_2!6308 array!6229)) )
))
(declare-fun lt!214076 () tuple2!11970)

(declare-fun arr!237 () array!6229)

(declare-datatypes ((tuple2!11972 0))(
  ( (tuple2!11973 (_1!6309 BitStream!4904) (_2!6309 BitStream!4904)) )
))
(declare-fun lt!214062 () tuple2!11972)

(assert (=> b!137388 (= res!114416 (or (not (= (size!2820 (_2!6308 lt!214076)) (size!2820 arr!237))) (not (= (_1!6308 lt!214076) (_2!6309 lt!214062)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!4904 array!6229 (_ BitVec 32) (_ BitVec 32)) tuple2!11970)

(assert (=> b!137388 (= lt!214076 (readByteArrayLoopPure!0 (_1!6309 lt!214062) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((Unit!8587 0))(
  ( (Unit!8588) )
))
(declare-datatypes ((tuple2!11974 0))(
  ( (tuple2!11975 (_1!6310 Unit!8587) (_2!6310 BitStream!4904)) )
))
(declare-fun lt!214055 () tuple2!11974)

(declare-fun lt!214078 () tuple2!11974)

(declare-fun lt!214066 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!137388 (validate_offset_bits!1 ((_ sign_extend 32) (size!2820 (buf!3227 (_2!6310 lt!214055)))) ((_ sign_extend 32) (currentByte!6034 (_2!6310 lt!214078))) ((_ sign_extend 32) (currentBit!6029 (_2!6310 lt!214078))) lt!214066)))

(declare-fun lt!214082 () Unit!8587)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4904 array!6229 (_ BitVec 64)) Unit!8587)

(assert (=> b!137388 (= lt!214082 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6310 lt!214078) (buf!3227 (_2!6310 lt!214055)) lt!214066))))

(declare-fun reader!0 (BitStream!4904 BitStream!4904) tuple2!11972)

(assert (=> b!137388 (= lt!214062 (reader!0 (_2!6310 lt!214078) (_2!6310 lt!214055)))))

(declare-fun b!137389 () Bool)

(declare-fun res!114413 () Bool)

(assert (=> b!137389 (=> (not res!114413) (not e!91295))))

(declare-fun isPrefixOf!0 (BitStream!4904 BitStream!4904) Bool)

(assert (=> b!137389 (= res!114413 (isPrefixOf!0 (_2!6310 lt!214078) (_2!6310 lt!214055)))))

(declare-fun b!137390 () Bool)

(declare-fun res!114410 () Bool)

(declare-fun e!91294 () Bool)

(assert (=> b!137390 (=> (not res!114410) (not e!91294))))

(declare-fun thiss!1634 () BitStream!4904)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!137390 (= res!114410 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2820 (buf!3227 thiss!1634))) ((_ sign_extend 32) (currentByte!6034 thiss!1634)) ((_ sign_extend 32) (currentBit!6029 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!137391 () Bool)

(declare-fun e!91305 () Bool)

(declare-fun e!91302 () Bool)

(assert (=> b!137391 (= e!91305 e!91302)))

(declare-fun res!114407 () Bool)

(assert (=> b!137391 (=> res!114407 e!91302)))

(assert (=> b!137391 (= res!114407 (not (= (size!2820 (buf!3227 thiss!1634)) (size!2820 (buf!3227 (_2!6310 lt!214055))))))))

(declare-fun lt!214075 () tuple2!11970)

(declare-fun arrayRangesEq!223 (array!6229 array!6229 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!137391 (arrayRangesEq!223 arr!237 (_2!6308 lt!214075) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!214063 () tuple2!11970)

(declare-fun lt!214059 () Unit!8587)

(declare-fun arrayRangesEqTransitive!25 (array!6229 array!6229 array!6229 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8587)

(assert (=> b!137391 (= lt!214059 (arrayRangesEqTransitive!25 arr!237 (_2!6308 lt!214063) (_2!6308 lt!214075) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!137391 (arrayRangesEq!223 (_2!6308 lt!214063) (_2!6308 lt!214075) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!214077 () Unit!8587)

(declare-fun arrayRangesEqSymmetricLemma!36 (array!6229 array!6229 (_ BitVec 32) (_ BitVec 32)) Unit!8587)

(assert (=> b!137391 (= lt!214077 (arrayRangesEqSymmetricLemma!36 (_2!6308 lt!214075) (_2!6308 lt!214063) #b00000000000000000000000000000000 to!404))))

(declare-fun b!137392 () Bool)

(declare-fun res!114408 () Bool)

(declare-fun e!91304 () Bool)

(assert (=> b!137392 (=> (not res!114408) (not e!91304))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!137392 (= res!114408 (= (bitIndex!0 (size!2820 (buf!3227 (_2!6310 lt!214078))) (currentByte!6034 (_2!6310 lt!214078)) (currentBit!6029 (_2!6310 lt!214078))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2820 (buf!3227 thiss!1634)) (currentByte!6034 thiss!1634) (currentBit!6029 thiss!1634)))))))

(declare-fun b!137393 () Bool)

(declare-fun e!91296 () Bool)

(declare-datatypes ((tuple2!11976 0))(
  ( (tuple2!11977 (_1!6311 BitStream!4904) (_2!6311 (_ BitVec 8))) )
))
(declare-fun lt!214067 () tuple2!11976)

(declare-fun lt!214074 () tuple2!11976)

(assert (=> b!137393 (= e!91296 (= (_2!6311 lt!214067) (_2!6311 lt!214074)))))

(declare-fun b!137395 () Bool)

(assert (=> b!137395 (= e!91294 (not e!91305))))

(declare-fun res!114404 () Bool)

(assert (=> b!137395 (=> res!114404 e!91305)))

(assert (=> b!137395 (= res!114404 (not (arrayRangesEq!223 (_2!6308 lt!214075) (_2!6308 lt!214063) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!214065 () tuple2!11970)

(assert (=> b!137395 (arrayRangesEq!223 (_2!6308 lt!214075) (_2!6308 lt!214065) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!214058 () tuple2!11972)

(declare-fun lt!214060 () Unit!8587)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4904 array!6229 (_ BitVec 32) (_ BitVec 32)) Unit!8587)

(assert (=> b!137395 (= lt!214060 (readByteArrayLoopArrayPrefixLemma!0 (_1!6309 lt!214058) arr!237 from!447 to!404))))

(declare-fun lt!214069 () array!6229)

(declare-fun withMovedByteIndex!0 (BitStream!4904 (_ BitVec 32)) BitStream!4904)

(assert (=> b!137395 (= lt!214065 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6309 lt!214058) #b00000000000000000000000000000001) lt!214069 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!214070 () tuple2!11972)

(assert (=> b!137395 (= lt!214063 (readByteArrayLoopPure!0 (_1!6309 lt!214070) lt!214069 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!214072 () tuple2!11976)

(assert (=> b!137395 (= lt!214069 (array!6230 (store (arr!3506 arr!237) from!447 (_2!6311 lt!214072)) (size!2820 arr!237)))))

(declare-fun lt!214064 () (_ BitVec 32))

(assert (=> b!137395 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2820 (buf!3227 (_2!6310 lt!214055)))) ((_ sign_extend 32) (currentByte!6034 (_2!6310 lt!214078))) ((_ sign_extend 32) (currentBit!6029 (_2!6310 lt!214078))) lt!214064)))

(declare-fun lt!214083 () Unit!8587)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4904 array!6229 (_ BitVec 32)) Unit!8587)

(assert (=> b!137395 (= lt!214083 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6310 lt!214078) (buf!3227 (_2!6310 lt!214055)) lt!214064))))

(assert (=> b!137395 (= (_1!6308 lt!214075) (_2!6309 lt!214058))))

(assert (=> b!137395 (= lt!214075 (readByteArrayLoopPure!0 (_1!6309 lt!214058) arr!237 from!447 to!404))))

(assert (=> b!137395 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2820 (buf!3227 (_2!6310 lt!214055)))) ((_ sign_extend 32) (currentByte!6034 thiss!1634)) ((_ sign_extend 32) (currentBit!6029 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!214080 () Unit!8587)

(assert (=> b!137395 (= lt!214080 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3227 (_2!6310 lt!214055)) (bvsub to!404 from!447)))))

(assert (=> b!137395 (= (_2!6311 lt!214072) (select (arr!3506 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!4904) tuple2!11976)

(assert (=> b!137395 (= lt!214072 (readBytePure!0 (_1!6309 lt!214058)))))

(assert (=> b!137395 (= lt!214070 (reader!0 (_2!6310 lt!214078) (_2!6310 lt!214055)))))

(assert (=> b!137395 (= lt!214058 (reader!0 thiss!1634 (_2!6310 lt!214055)))))

(assert (=> b!137395 e!91296))

(declare-fun res!114415 () Bool)

(assert (=> b!137395 (=> (not res!114415) (not e!91296))))

(assert (=> b!137395 (= res!114415 (= (bitIndex!0 (size!2820 (buf!3227 (_1!6311 lt!214067))) (currentByte!6034 (_1!6311 lt!214067)) (currentBit!6029 (_1!6311 lt!214067))) (bitIndex!0 (size!2820 (buf!3227 (_1!6311 lt!214074))) (currentByte!6034 (_1!6311 lt!214074)) (currentBit!6029 (_1!6311 lt!214074)))))))

(declare-fun lt!214073 () Unit!8587)

(declare-fun lt!214056 () BitStream!4904)

(declare-fun readBytePrefixLemma!0 (BitStream!4904 BitStream!4904) Unit!8587)

(assert (=> b!137395 (= lt!214073 (readBytePrefixLemma!0 lt!214056 (_2!6310 lt!214055)))))

(assert (=> b!137395 (= lt!214074 (readBytePure!0 (BitStream!4905 (buf!3227 (_2!6310 lt!214055)) (currentByte!6034 thiss!1634) (currentBit!6029 thiss!1634))))))

(assert (=> b!137395 (= lt!214067 (readBytePure!0 lt!214056))))

(assert (=> b!137395 (= lt!214056 (BitStream!4905 (buf!3227 (_2!6310 lt!214078)) (currentByte!6034 thiss!1634) (currentBit!6029 thiss!1634)))))

(declare-fun e!91297 () Bool)

(assert (=> b!137395 e!91297))

(declare-fun res!114412 () Bool)

(assert (=> b!137395 (=> (not res!114412) (not e!91297))))

(assert (=> b!137395 (= res!114412 (isPrefixOf!0 thiss!1634 (_2!6310 lt!214055)))))

(declare-fun lt!214081 () Unit!8587)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4904 BitStream!4904 BitStream!4904) Unit!8587)

(assert (=> b!137395 (= lt!214081 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6310 lt!214078) (_2!6310 lt!214055)))))

(declare-fun e!91303 () Bool)

(assert (=> b!137395 e!91303))

(declare-fun res!114417 () Bool)

(assert (=> b!137395 (=> (not res!114417) (not e!91303))))

(assert (=> b!137395 (= res!114417 (= (size!2820 (buf!3227 (_2!6310 lt!214078))) (size!2820 (buf!3227 (_2!6310 lt!214055)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4904 array!6229 (_ BitVec 32) (_ BitVec 32)) tuple2!11974)

(assert (=> b!137395 (= lt!214055 (appendByteArrayLoop!0 (_2!6310 lt!214078) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!137395 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2820 (buf!3227 (_2!6310 lt!214078)))) ((_ sign_extend 32) (currentByte!6034 (_2!6310 lt!214078))) ((_ sign_extend 32) (currentBit!6029 (_2!6310 lt!214078))) lt!214064)))

(assert (=> b!137395 (= lt!214064 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!214061 () Unit!8587)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4904 BitStream!4904 (_ BitVec 64) (_ BitVec 32)) Unit!8587)

(assert (=> b!137395 (= lt!214061 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6310 lt!214078) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!137395 e!91304))

(declare-fun res!114414 () Bool)

(assert (=> b!137395 (=> (not res!114414) (not e!91304))))

(assert (=> b!137395 (= res!114414 (= (size!2820 (buf!3227 thiss!1634)) (size!2820 (buf!3227 (_2!6310 lt!214078)))))))

(declare-fun appendByte!0 (BitStream!4904 (_ BitVec 8)) tuple2!11974)

(assert (=> b!137395 (= lt!214078 (appendByte!0 thiss!1634 (select (arr!3506 arr!237) from!447)))))

(declare-fun b!137396 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!137396 (= e!91297 (invariant!0 (currentBit!6029 thiss!1634) (currentByte!6034 thiss!1634) (size!2820 (buf!3227 (_2!6310 lt!214078)))))))

(declare-fun b!137397 () Bool)

(declare-fun res!114409 () Bool)

(assert (=> b!137397 (=> (not res!114409) (not e!91294))))

(assert (=> b!137397 (= res!114409 (bvslt from!447 to!404))))

(declare-fun b!137398 () Bool)

(declare-fun res!114405 () Bool)

(assert (=> b!137398 (=> (not res!114405) (not e!91294))))

(assert (=> b!137398 (= res!114405 (invariant!0 (currentBit!6029 thiss!1634) (currentByte!6034 thiss!1634) (size!2820 (buf!3227 thiss!1634))))))

(declare-fun b!137399 () Bool)

(declare-fun res!114411 () Bool)

(assert (=> b!137399 (=> (not res!114411) (not e!91304))))

(assert (=> b!137399 (= res!114411 (isPrefixOf!0 thiss!1634 (_2!6310 lt!214078)))))

(declare-fun b!137400 () Bool)

(declare-fun lt!214079 () tuple2!11976)

(declare-fun lt!214057 () tuple2!11972)

(assert (=> b!137400 (= e!91304 (and (= (_2!6311 lt!214079) (select (arr!3506 arr!237) from!447)) (= (_1!6311 lt!214079) (_2!6309 lt!214057))))))

(assert (=> b!137400 (= lt!214079 (readBytePure!0 (_1!6309 lt!214057)))))

(assert (=> b!137400 (= lt!214057 (reader!0 thiss!1634 (_2!6310 lt!214078)))))

(declare-fun b!137401 () Bool)

(assert (=> b!137401 (= e!91302 true)))

(declare-fun lt!214068 () (_ BitVec 64))

(assert (=> b!137401 (= lt!214068 (bitIndex!0 (size!2820 (buf!3227 (_2!6310 lt!214055))) (currentByte!6034 (_2!6310 lt!214055)) (currentBit!6029 (_2!6310 lt!214055))))))

(declare-fun lt!214071 () (_ BitVec 64))

(assert (=> b!137401 (= lt!214071 (bitIndex!0 (size!2820 (buf!3227 thiss!1634)) (currentByte!6034 thiss!1634) (currentBit!6029 thiss!1634)))))

(declare-fun b!137402 () Bool)

(assert (=> b!137402 (= e!91303 e!91295)))

(declare-fun res!114406 () Bool)

(assert (=> b!137402 (=> (not res!114406) (not e!91295))))

(assert (=> b!137402 (= res!114406 (= (bitIndex!0 (size!2820 (buf!3227 (_2!6310 lt!214055))) (currentByte!6034 (_2!6310 lt!214055)) (currentBit!6029 (_2!6310 lt!214055))) (bvadd (bitIndex!0 (size!2820 (buf!3227 (_2!6310 lt!214078))) (currentByte!6034 (_2!6310 lt!214078)) (currentBit!6029 (_2!6310 lt!214078))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!214066))))))

(assert (=> b!137402 (= lt!214066 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!137403 () Bool)

(declare-fun e!91301 () Bool)

(declare-fun array_inv!2609 (array!6229) Bool)

(assert (=> b!137403 (= e!91301 (array_inv!2609 (buf!3227 thiss!1634)))))

(declare-fun res!114403 () Bool)

(assert (=> start!26720 (=> (not res!114403) (not e!91294))))

(assert (=> start!26720 (= res!114403 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2820 arr!237))))))

(assert (=> start!26720 e!91294))

(assert (=> start!26720 true))

(assert (=> start!26720 (array_inv!2609 arr!237)))

(declare-fun inv!12 (BitStream!4904) Bool)

(assert (=> start!26720 (and (inv!12 thiss!1634) e!91301)))

(declare-fun b!137394 () Bool)

(assert (=> b!137394 (= e!91299 (not (arrayRangesEq!223 arr!237 (_2!6308 lt!214076) #b00000000000000000000000000000000 to!404)))))

(assert (= (and start!26720 res!114403) b!137390))

(assert (= (and b!137390 res!114410) b!137397))

(assert (= (and b!137397 res!114409) b!137398))

(assert (= (and b!137398 res!114405) b!137395))

(assert (= (and b!137395 res!114414) b!137392))

(assert (= (and b!137392 res!114408) b!137399))

(assert (= (and b!137399 res!114411) b!137400))

(assert (= (and b!137395 res!114417) b!137402))

(assert (= (and b!137402 res!114406) b!137389))

(assert (= (and b!137389 res!114413) b!137388))

(assert (= (and b!137388 (not res!114416)) b!137394))

(assert (= (and b!137395 res!114412) b!137396))

(assert (= (and b!137395 res!114415) b!137393))

(assert (= (and b!137395 (not res!114404)) b!137391))

(assert (= (and b!137391 (not res!114407)) b!137401))

(assert (= start!26720 b!137403))

(declare-fun m!210863 () Bool)

(assert (=> start!26720 m!210863))

(declare-fun m!210865 () Bool)

(assert (=> start!26720 m!210865))

(declare-fun m!210867 () Bool)

(assert (=> b!137402 m!210867))

(declare-fun m!210869 () Bool)

(assert (=> b!137402 m!210869))

(declare-fun m!210871 () Bool)

(assert (=> b!137399 m!210871))

(declare-fun m!210873 () Bool)

(assert (=> b!137396 m!210873))

(declare-fun m!210875 () Bool)

(assert (=> b!137403 m!210875))

(declare-fun m!210877 () Bool)

(assert (=> b!137391 m!210877))

(declare-fun m!210879 () Bool)

(assert (=> b!137391 m!210879))

(declare-fun m!210881 () Bool)

(assert (=> b!137391 m!210881))

(declare-fun m!210883 () Bool)

(assert (=> b!137391 m!210883))

(declare-fun m!210885 () Bool)

(assert (=> b!137398 m!210885))

(declare-fun m!210887 () Bool)

(assert (=> b!137394 m!210887))

(declare-fun m!210889 () Bool)

(assert (=> b!137388 m!210889))

(declare-fun m!210891 () Bool)

(assert (=> b!137388 m!210891))

(declare-fun m!210893 () Bool)

(assert (=> b!137388 m!210893))

(declare-fun m!210895 () Bool)

(assert (=> b!137388 m!210895))

(assert (=> b!137392 m!210869))

(declare-fun m!210897 () Bool)

(assert (=> b!137392 m!210897))

(assert (=> b!137401 m!210867))

(assert (=> b!137401 m!210897))

(declare-fun m!210899 () Bool)

(assert (=> b!137389 m!210899))

(declare-fun m!210901 () Bool)

(assert (=> b!137400 m!210901))

(declare-fun m!210903 () Bool)

(assert (=> b!137400 m!210903))

(declare-fun m!210905 () Bool)

(assert (=> b!137400 m!210905))

(declare-fun m!210907 () Bool)

(assert (=> b!137390 m!210907))

(declare-fun m!210909 () Bool)

(assert (=> b!137395 m!210909))

(declare-fun m!210911 () Bool)

(assert (=> b!137395 m!210911))

(declare-fun m!210913 () Bool)

(assert (=> b!137395 m!210913))

(declare-fun m!210915 () Bool)

(assert (=> b!137395 m!210915))

(declare-fun m!210917 () Bool)

(assert (=> b!137395 m!210917))

(declare-fun m!210919 () Bool)

(assert (=> b!137395 m!210919))

(declare-fun m!210921 () Bool)

(assert (=> b!137395 m!210921))

(declare-fun m!210923 () Bool)

(assert (=> b!137395 m!210923))

(declare-fun m!210925 () Bool)

(assert (=> b!137395 m!210925))

(declare-fun m!210927 () Bool)

(assert (=> b!137395 m!210927))

(assert (=> b!137395 m!210901))

(declare-fun m!210929 () Bool)

(assert (=> b!137395 m!210929))

(declare-fun m!210931 () Bool)

(assert (=> b!137395 m!210931))

(declare-fun m!210933 () Bool)

(assert (=> b!137395 m!210933))

(assert (=> b!137395 m!210925))

(declare-fun m!210935 () Bool)

(assert (=> b!137395 m!210935))

(declare-fun m!210937 () Bool)

(assert (=> b!137395 m!210937))

(declare-fun m!210939 () Bool)

(assert (=> b!137395 m!210939))

(declare-fun m!210941 () Bool)

(assert (=> b!137395 m!210941))

(declare-fun m!210943 () Bool)

(assert (=> b!137395 m!210943))

(declare-fun m!210945 () Bool)

(assert (=> b!137395 m!210945))

(declare-fun m!210947 () Bool)

(assert (=> b!137395 m!210947))

(declare-fun m!210949 () Bool)

(assert (=> b!137395 m!210949))

(declare-fun m!210951 () Bool)

(assert (=> b!137395 m!210951))

(declare-fun m!210953 () Bool)

(assert (=> b!137395 m!210953))

(declare-fun m!210955 () Bool)

(assert (=> b!137395 m!210955))

(declare-fun m!210957 () Bool)

(assert (=> b!137395 m!210957))

(assert (=> b!137395 m!210895))

(assert (=> b!137395 m!210901))

(push 1)

(assert (not b!137389))

(assert (not start!26720))

(assert (not b!137402))

(assert (not b!137398))

(assert (not b!137394))

(assert (not b!137403))

(assert (not b!137401))

(assert (not b!137388))

(assert (not b!137390))

(assert (not b!137392))

(assert (not b!137391))

(assert (not b!137395))

(assert (not b!137400))

(assert (not b!137396))

(assert (not b!137399))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

