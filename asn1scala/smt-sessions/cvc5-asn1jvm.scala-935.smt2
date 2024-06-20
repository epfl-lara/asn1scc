; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26384 () Bool)

(assert start!26384)

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6184 0))(
  ( (array!6185 (arr!3465 (Array (_ BitVec 32) (_ BitVec 8))) (size!2800 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4864 0))(
  ( (BitStream!4865 (buf!3193 array!6184) (currentByte!5990 (_ BitVec 32)) (currentBit!5985 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!11796 0))(
  ( (tuple2!11797 (_1!6214 BitStream!4864) (_2!6214 array!6184)) )
))
(declare-fun lt!210365 () tuple2!11796)

(declare-fun b!135516 () Bool)

(declare-fun arr!237 () array!6184)

(declare-fun e!89973 () Bool)

(declare-fun arrayRangesEq!203 (array!6184 array!6184 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!135516 (= e!89973 (not (arrayRangesEq!203 arr!237 (_2!6214 lt!210365) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!135517 () Bool)

(declare-fun e!89978 () Bool)

(declare-fun e!89976 () Bool)

(assert (=> b!135517 (= e!89978 (not e!89976))))

(declare-fun res!112727 () Bool)

(assert (=> b!135517 (=> res!112727 e!89976)))

(declare-fun lt!210379 () tuple2!11796)

(declare-fun lt!210370 () tuple2!11796)

(assert (=> b!135517 (= res!112727 (not (arrayRangesEq!203 (_2!6214 lt!210379) (_2!6214 lt!210370) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!210364 () tuple2!11796)

(assert (=> b!135517 (arrayRangesEq!203 (_2!6214 lt!210379) (_2!6214 lt!210364) #b00000000000000000000000000000000 to!404)))

(declare-datatypes ((tuple2!11798 0))(
  ( (tuple2!11799 (_1!6215 BitStream!4864) (_2!6215 BitStream!4864)) )
))
(declare-fun lt!210371 () tuple2!11798)

(declare-datatypes ((Unit!8438 0))(
  ( (Unit!8439) )
))
(declare-fun lt!210374 () Unit!8438)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4864 array!6184 (_ BitVec 32) (_ BitVec 32)) Unit!8438)

(assert (=> b!135517 (= lt!210374 (readByteArrayLoopArrayPrefixLemma!0 (_1!6215 lt!210371) arr!237 from!447 to!404))))

(declare-fun lt!210382 () array!6184)

(declare-fun readByteArrayLoopPure!0 (BitStream!4864 array!6184 (_ BitVec 32) (_ BitVec 32)) tuple2!11796)

(declare-fun withMovedByteIndex!0 (BitStream!4864 (_ BitVec 32)) BitStream!4864)

(assert (=> b!135517 (= lt!210364 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6215 lt!210371) #b00000000000000000000000000000001) lt!210382 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!210383 () tuple2!11798)

(assert (=> b!135517 (= lt!210370 (readByteArrayLoopPure!0 (_1!6215 lt!210383) lt!210382 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((tuple2!11800 0))(
  ( (tuple2!11801 (_1!6216 BitStream!4864) (_2!6216 (_ BitVec 8))) )
))
(declare-fun lt!210377 () tuple2!11800)

(assert (=> b!135517 (= lt!210382 (array!6185 (store (arr!3465 arr!237) from!447 (_2!6216 lt!210377)) (size!2800 arr!237)))))

(declare-datatypes ((tuple2!11802 0))(
  ( (tuple2!11803 (_1!6217 Unit!8438) (_2!6217 BitStream!4864)) )
))
(declare-fun lt!210362 () tuple2!11802)

(declare-fun lt!210381 () tuple2!11802)

(declare-fun lt!210387 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!135517 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2800 (buf!3193 (_2!6217 lt!210362)))) ((_ sign_extend 32) (currentByte!5990 (_2!6217 lt!210381))) ((_ sign_extend 32) (currentBit!5985 (_2!6217 lt!210381))) lt!210387)))

(declare-fun lt!210367 () Unit!8438)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4864 array!6184 (_ BitVec 32)) Unit!8438)

(assert (=> b!135517 (= lt!210367 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6217 lt!210381) (buf!3193 (_2!6217 lt!210362)) lt!210387))))

(assert (=> b!135517 (= (_1!6214 lt!210379) (_2!6215 lt!210371))))

(assert (=> b!135517 (= lt!210379 (readByteArrayLoopPure!0 (_1!6215 lt!210371) arr!237 from!447 to!404))))

(declare-fun thiss!1634 () BitStream!4864)

(assert (=> b!135517 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2800 (buf!3193 (_2!6217 lt!210362)))) ((_ sign_extend 32) (currentByte!5990 thiss!1634)) ((_ sign_extend 32) (currentBit!5985 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!210388 () Unit!8438)

(assert (=> b!135517 (= lt!210388 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3193 (_2!6217 lt!210362)) (bvsub to!404 from!447)))))

(assert (=> b!135517 (= (_2!6216 lt!210377) (select (arr!3465 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!4864) tuple2!11800)

(assert (=> b!135517 (= lt!210377 (readBytePure!0 (_1!6215 lt!210371)))))

(declare-fun reader!0 (BitStream!4864 BitStream!4864) tuple2!11798)

(assert (=> b!135517 (= lt!210383 (reader!0 (_2!6217 lt!210381) (_2!6217 lt!210362)))))

(assert (=> b!135517 (= lt!210371 (reader!0 thiss!1634 (_2!6217 lt!210362)))))

(declare-fun e!89977 () Bool)

(assert (=> b!135517 e!89977))

(declare-fun res!112725 () Bool)

(assert (=> b!135517 (=> (not res!112725) (not e!89977))))

(declare-fun lt!210368 () tuple2!11800)

(declare-fun lt!210380 () tuple2!11800)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!135517 (= res!112725 (= (bitIndex!0 (size!2800 (buf!3193 (_1!6216 lt!210368))) (currentByte!5990 (_1!6216 lt!210368)) (currentBit!5985 (_1!6216 lt!210368))) (bitIndex!0 (size!2800 (buf!3193 (_1!6216 lt!210380))) (currentByte!5990 (_1!6216 lt!210380)) (currentBit!5985 (_1!6216 lt!210380)))))))

(declare-fun lt!210373 () Unit!8438)

(declare-fun lt!210385 () BitStream!4864)

(declare-fun readBytePrefixLemma!0 (BitStream!4864 BitStream!4864) Unit!8438)

(assert (=> b!135517 (= lt!210373 (readBytePrefixLemma!0 lt!210385 (_2!6217 lt!210362)))))

(assert (=> b!135517 (= lt!210380 (readBytePure!0 (BitStream!4865 (buf!3193 (_2!6217 lt!210362)) (currentByte!5990 thiss!1634) (currentBit!5985 thiss!1634))))))

(assert (=> b!135517 (= lt!210368 (readBytePure!0 lt!210385))))

(assert (=> b!135517 (= lt!210385 (BitStream!4865 (buf!3193 (_2!6217 lt!210381)) (currentByte!5990 thiss!1634) (currentBit!5985 thiss!1634)))))

(declare-fun e!89969 () Bool)

(assert (=> b!135517 e!89969))

(declare-fun res!112718 () Bool)

(assert (=> b!135517 (=> (not res!112718) (not e!89969))))

(declare-fun isPrefixOf!0 (BitStream!4864 BitStream!4864) Bool)

(assert (=> b!135517 (= res!112718 (isPrefixOf!0 thiss!1634 (_2!6217 lt!210362)))))

(declare-fun lt!210372 () Unit!8438)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4864 BitStream!4864 BitStream!4864) Unit!8438)

(assert (=> b!135517 (= lt!210372 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6217 lt!210381) (_2!6217 lt!210362)))))

(declare-fun e!89979 () Bool)

(assert (=> b!135517 e!89979))

(declare-fun res!112715 () Bool)

(assert (=> b!135517 (=> (not res!112715) (not e!89979))))

(assert (=> b!135517 (= res!112715 (= (size!2800 (buf!3193 (_2!6217 lt!210381))) (size!2800 (buf!3193 (_2!6217 lt!210362)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4864 array!6184 (_ BitVec 32) (_ BitVec 32)) tuple2!11802)

(assert (=> b!135517 (= lt!210362 (appendByteArrayLoop!0 (_2!6217 lt!210381) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!135517 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2800 (buf!3193 (_2!6217 lt!210381)))) ((_ sign_extend 32) (currentByte!5990 (_2!6217 lt!210381))) ((_ sign_extend 32) (currentBit!5985 (_2!6217 lt!210381))) lt!210387)))

(assert (=> b!135517 (= lt!210387 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!210376 () Unit!8438)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4864 BitStream!4864 (_ BitVec 64) (_ BitVec 32)) Unit!8438)

(assert (=> b!135517 (= lt!210376 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6217 lt!210381) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!89971 () Bool)

(assert (=> b!135517 e!89971))

(declare-fun res!112716 () Bool)

(assert (=> b!135517 (=> (not res!112716) (not e!89971))))

(assert (=> b!135517 (= res!112716 (= (size!2800 (buf!3193 thiss!1634)) (size!2800 (buf!3193 (_2!6217 lt!210381)))))))

(declare-fun appendByte!0 (BitStream!4864 (_ BitVec 8)) tuple2!11802)

(assert (=> b!135517 (= lt!210381 (appendByte!0 thiss!1634 (select (arr!3465 arr!237) from!447)))))

(declare-fun b!135518 () Bool)

(declare-fun res!112719 () Bool)

(assert (=> b!135518 (=> (not res!112719) (not e!89971))))

(assert (=> b!135518 (= res!112719 (= (bitIndex!0 (size!2800 (buf!3193 (_2!6217 lt!210381))) (currentByte!5990 (_2!6217 lt!210381)) (currentBit!5985 (_2!6217 lt!210381))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2800 (buf!3193 thiss!1634)) (currentByte!5990 thiss!1634) (currentBit!5985 thiss!1634)))))))

(declare-fun b!135519 () Bool)

(assert (=> b!135519 (= e!89977 (= (_2!6216 lt!210368) (_2!6216 lt!210380)))))

(declare-fun b!135520 () Bool)

(declare-fun res!112724 () Bool)

(assert (=> b!135520 (=> (not res!112724) (not e!89978))))

(assert (=> b!135520 (= res!112724 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2800 (buf!3193 thiss!1634))) ((_ sign_extend 32) (currentByte!5990 thiss!1634)) ((_ sign_extend 32) (currentBit!5985 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!135521 () Bool)

(declare-fun lt!210363 () tuple2!11798)

(declare-fun lt!210386 () tuple2!11800)

(assert (=> b!135521 (= e!89971 (and (= (_2!6216 lt!210386) (select (arr!3465 arr!237) from!447)) (= (_1!6216 lt!210386) (_2!6215 lt!210363))))))

(assert (=> b!135521 (= lt!210386 (readBytePure!0 (_1!6215 lt!210363)))))

(assert (=> b!135521 (= lt!210363 (reader!0 thiss!1634 (_2!6217 lt!210381)))))

(declare-fun b!135522 () Bool)

(declare-fun res!112717 () Bool)

(assert (=> b!135522 (=> (not res!112717) (not e!89978))))

(assert (=> b!135522 (= res!112717 (bvslt from!447 to!404))))

(declare-fun b!135523 () Bool)

(declare-fun e!89970 () Bool)

(declare-fun array_inv!2589 (array!6184) Bool)

(assert (=> b!135523 (= e!89970 (array_inv!2589 (buf!3193 thiss!1634)))))

(declare-fun b!135524 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!135524 (= e!89969 (invariant!0 (currentBit!5985 thiss!1634) (currentByte!5990 thiss!1634) (size!2800 (buf!3193 (_2!6217 lt!210381)))))))

(declare-fun b!135525 () Bool)

(declare-fun res!112722 () Bool)

(assert (=> b!135525 (=> (not res!112722) (not e!89971))))

(assert (=> b!135525 (= res!112722 (isPrefixOf!0 thiss!1634 (_2!6217 lt!210381)))))

(declare-fun b!135526 () Bool)

(declare-fun e!89972 () Bool)

(assert (=> b!135526 (= e!89972 (not e!89973))))

(declare-fun res!112721 () Bool)

(assert (=> b!135526 (=> res!112721 e!89973)))

(declare-fun lt!210366 () tuple2!11798)

(assert (=> b!135526 (= res!112721 (or (not (= (size!2800 (_2!6214 lt!210365)) (size!2800 arr!237))) (not (= (_1!6214 lt!210365) (_2!6215 lt!210366)))))))

(assert (=> b!135526 (= lt!210365 (readByteArrayLoopPure!0 (_1!6215 lt!210366) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!210375 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!135526 (validate_offset_bits!1 ((_ sign_extend 32) (size!2800 (buf!3193 (_2!6217 lt!210362)))) ((_ sign_extend 32) (currentByte!5990 (_2!6217 lt!210381))) ((_ sign_extend 32) (currentBit!5985 (_2!6217 lt!210381))) lt!210375)))

(declare-fun lt!210378 () Unit!8438)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4864 array!6184 (_ BitVec 64)) Unit!8438)

(assert (=> b!135526 (= lt!210378 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6217 lt!210381) (buf!3193 (_2!6217 lt!210362)) lt!210375))))

(assert (=> b!135526 (= lt!210366 (reader!0 (_2!6217 lt!210381) (_2!6217 lt!210362)))))

(declare-fun b!135527 () Bool)

(declare-fun res!112726 () Bool)

(assert (=> b!135527 (=> (not res!112726) (not e!89978))))

(assert (=> b!135527 (= res!112726 (invariant!0 (currentBit!5985 thiss!1634) (currentByte!5990 thiss!1634) (size!2800 (buf!3193 thiss!1634))))))

(declare-fun b!135528 () Bool)

(assert (=> b!135528 (= e!89979 e!89972)))

(declare-fun res!112723 () Bool)

(assert (=> b!135528 (=> (not res!112723) (not e!89972))))

(assert (=> b!135528 (= res!112723 (= (bitIndex!0 (size!2800 (buf!3193 (_2!6217 lt!210362))) (currentByte!5990 (_2!6217 lt!210362)) (currentBit!5985 (_2!6217 lt!210362))) (bvadd (bitIndex!0 (size!2800 (buf!3193 (_2!6217 lt!210381))) (currentByte!5990 (_2!6217 lt!210381)) (currentBit!5985 (_2!6217 lt!210381))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!210375))))))

(assert (=> b!135528 (= lt!210375 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun res!112720 () Bool)

(assert (=> start!26384 (=> (not res!112720) (not e!89978))))

(assert (=> start!26384 (= res!112720 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2800 arr!237))))))

(assert (=> start!26384 e!89978))

(assert (=> start!26384 true))

(assert (=> start!26384 (array_inv!2589 arr!237)))

(declare-fun inv!12 (BitStream!4864) Bool)

(assert (=> start!26384 (and (inv!12 thiss!1634) e!89970)))

(declare-fun b!135529 () Bool)

(assert (=> b!135529 (= e!89976 (bvsle #b00000000000000000000000000000000 to!404))))

(assert (=> b!135529 (arrayRangesEq!203 arr!237 (_2!6214 lt!210379) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!210384 () Unit!8438)

(declare-fun arrayRangesEqTransitive!5 (array!6184 array!6184 array!6184 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8438)

(assert (=> b!135529 (= lt!210384 (arrayRangesEqTransitive!5 arr!237 (_2!6214 lt!210370) (_2!6214 lt!210379) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!135529 (arrayRangesEq!203 (_2!6214 lt!210370) (_2!6214 lt!210379) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!210369 () Unit!8438)

(declare-fun arrayRangesEqSymmetricLemma!16 (array!6184 array!6184 (_ BitVec 32) (_ BitVec 32)) Unit!8438)

(assert (=> b!135529 (= lt!210369 (arrayRangesEqSymmetricLemma!16 (_2!6214 lt!210379) (_2!6214 lt!210370) #b00000000000000000000000000000000 to!404))))

(declare-fun b!135530 () Bool)

(declare-fun res!112728 () Bool)

(assert (=> b!135530 (=> (not res!112728) (not e!89972))))

(assert (=> b!135530 (= res!112728 (isPrefixOf!0 (_2!6217 lt!210381) (_2!6217 lt!210362)))))

(assert (= (and start!26384 res!112720) b!135520))

(assert (= (and b!135520 res!112724) b!135522))

(assert (= (and b!135522 res!112717) b!135527))

(assert (= (and b!135527 res!112726) b!135517))

(assert (= (and b!135517 res!112716) b!135518))

(assert (= (and b!135518 res!112719) b!135525))

(assert (= (and b!135525 res!112722) b!135521))

(assert (= (and b!135517 res!112715) b!135528))

(assert (= (and b!135528 res!112723) b!135530))

(assert (= (and b!135530 res!112728) b!135526))

(assert (= (and b!135526 (not res!112721)) b!135516))

(assert (= (and b!135517 res!112718) b!135524))

(assert (= (and b!135517 res!112725) b!135519))

(assert (= (and b!135517 (not res!112727)) b!135529))

(assert (= start!26384 b!135523))

(declare-fun m!206779 () Bool)

(assert (=> b!135526 m!206779))

(declare-fun m!206781 () Bool)

(assert (=> b!135526 m!206781))

(declare-fun m!206783 () Bool)

(assert (=> b!135526 m!206783))

(declare-fun m!206785 () Bool)

(assert (=> b!135526 m!206785))

(declare-fun m!206787 () Bool)

(assert (=> b!135521 m!206787))

(declare-fun m!206789 () Bool)

(assert (=> b!135521 m!206789))

(declare-fun m!206791 () Bool)

(assert (=> b!135521 m!206791))

(declare-fun m!206793 () Bool)

(assert (=> b!135525 m!206793))

(declare-fun m!206795 () Bool)

(assert (=> b!135523 m!206795))

(declare-fun m!206797 () Bool)

(assert (=> b!135524 m!206797))

(declare-fun m!206799 () Bool)

(assert (=> b!135517 m!206799))

(declare-fun m!206801 () Bool)

(assert (=> b!135517 m!206801))

(declare-fun m!206803 () Bool)

(assert (=> b!135517 m!206803))

(declare-fun m!206805 () Bool)

(assert (=> b!135517 m!206805))

(declare-fun m!206807 () Bool)

(assert (=> b!135517 m!206807))

(declare-fun m!206809 () Bool)

(assert (=> b!135517 m!206809))

(declare-fun m!206811 () Bool)

(assert (=> b!135517 m!206811))

(declare-fun m!206813 () Bool)

(assert (=> b!135517 m!206813))

(declare-fun m!206815 () Bool)

(assert (=> b!135517 m!206815))

(declare-fun m!206817 () Bool)

(assert (=> b!135517 m!206817))

(declare-fun m!206819 () Bool)

(assert (=> b!135517 m!206819))

(declare-fun m!206821 () Bool)

(assert (=> b!135517 m!206821))

(declare-fun m!206823 () Bool)

(assert (=> b!135517 m!206823))

(declare-fun m!206825 () Bool)

(assert (=> b!135517 m!206825))

(declare-fun m!206827 () Bool)

(assert (=> b!135517 m!206827))

(declare-fun m!206829 () Bool)

(assert (=> b!135517 m!206829))

(assert (=> b!135517 m!206785))

(declare-fun m!206831 () Bool)

(assert (=> b!135517 m!206831))

(assert (=> b!135517 m!206811))

(declare-fun m!206833 () Bool)

(assert (=> b!135517 m!206833))

(declare-fun m!206835 () Bool)

(assert (=> b!135517 m!206835))

(assert (=> b!135517 m!206787))

(declare-fun m!206837 () Bool)

(assert (=> b!135517 m!206837))

(declare-fun m!206839 () Bool)

(assert (=> b!135517 m!206839))

(declare-fun m!206841 () Bool)

(assert (=> b!135517 m!206841))

(declare-fun m!206843 () Bool)

(assert (=> b!135517 m!206843))

(declare-fun m!206845 () Bool)

(assert (=> b!135517 m!206845))

(declare-fun m!206847 () Bool)

(assert (=> b!135517 m!206847))

(assert (=> b!135517 m!206787))

(declare-fun m!206849 () Bool)

(assert (=> start!26384 m!206849))

(declare-fun m!206851 () Bool)

(assert (=> start!26384 m!206851))

(declare-fun m!206853 () Bool)

(assert (=> b!135516 m!206853))

(declare-fun m!206855 () Bool)

(assert (=> b!135530 m!206855))

(declare-fun m!206857 () Bool)

(assert (=> b!135527 m!206857))

(declare-fun m!206859 () Bool)

(assert (=> b!135518 m!206859))

(declare-fun m!206861 () Bool)

(assert (=> b!135518 m!206861))

(declare-fun m!206863 () Bool)

(assert (=> b!135528 m!206863))

(assert (=> b!135528 m!206859))

(declare-fun m!206865 () Bool)

(assert (=> b!135529 m!206865))

(declare-fun m!206867 () Bool)

(assert (=> b!135529 m!206867))

(declare-fun m!206869 () Bool)

(assert (=> b!135529 m!206869))

(declare-fun m!206871 () Bool)

(assert (=> b!135529 m!206871))

(declare-fun m!206873 () Bool)

(assert (=> b!135520 m!206873))

(push 1)

(assert (not b!135518))

(assert (not start!26384))

(assert (not b!135517))

(assert (not b!135520))

(assert (not b!135524))

(assert (not b!135516))

(assert (not b!135527))

(assert (not b!135530))

(assert (not b!135529))

(assert (not b!135528))

(assert (not b!135521))

(assert (not b!135525))

(assert (not b!135526))

(assert (not b!135523))

(check-sat)

(pop 1)

(push 1)

(check-sat)

