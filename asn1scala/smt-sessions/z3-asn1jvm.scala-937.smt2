; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26606 () Bool)

(assert start!26606)

(declare-datatypes ((array!6201 0))(
  ( (array!6202 (arr!3487 (Array (_ BitVec 32) (_ BitVec 8))) (size!2807 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4878 0))(
  ( (BitStream!4879 (buf!3210 array!6201) (currentByte!6013 (_ BitVec 32)) (currentBit!6008 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!11862 0))(
  ( (tuple2!11863 (_1!6252 BitStream!4878) (_2!6252 (_ BitVec 8))) )
))
(declare-fun lt!212486 () tuple2!11862)

(declare-datatypes ((tuple2!11864 0))(
  ( (tuple2!11865 (_1!6253 BitStream!4878) (_2!6253 BitStream!4878)) )
))
(declare-fun lt!212479 () tuple2!11864)

(declare-fun b!136581 () Bool)

(declare-fun arr!237 () array!6201)

(declare-fun e!90722 () Bool)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!136581 (= e!90722 (and (= (_2!6252 lt!212486) (select (arr!3487 arr!237) from!447)) (= (_1!6252 lt!212486) (_2!6253 lt!212479))))))

(declare-fun readBytePure!0 (BitStream!4878) tuple2!11862)

(assert (=> b!136581 (= lt!212486 (readBytePure!0 (_1!6253 lt!212479)))))

(declare-fun thiss!1634 () BitStream!4878)

(declare-datatypes ((Unit!8555 0))(
  ( (Unit!8556) )
))
(declare-datatypes ((tuple2!11866 0))(
  ( (tuple2!11867 (_1!6254 Unit!8555) (_2!6254 BitStream!4878)) )
))
(declare-fun lt!212490 () tuple2!11866)

(declare-fun reader!0 (BitStream!4878 BitStream!4878) tuple2!11864)

(assert (=> b!136581 (= lt!212479 (reader!0 thiss!1634 (_2!6254 lt!212490)))))

(declare-fun b!136582 () Bool)

(declare-fun res!113667 () Bool)

(declare-fun e!90729 () Bool)

(assert (=> b!136582 (=> (not res!113667) (not e!90729))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!136582 (= res!113667 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2807 (buf!3210 thiss!1634))) ((_ sign_extend 32) (currentByte!6013 thiss!1634)) ((_ sign_extend 32) (currentBit!6008 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!136583 () Bool)

(declare-fun e!90731 () Bool)

(declare-fun e!90721 () Bool)

(assert (=> b!136583 (= e!90731 e!90721)))

(declare-fun res!113661 () Bool)

(assert (=> b!136583 (=> (not res!113661) (not e!90721))))

(declare-fun lt!212494 () tuple2!11866)

(declare-fun lt!212488 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!136583 (= res!113661 (= (bitIndex!0 (size!2807 (buf!3210 (_2!6254 lt!212494))) (currentByte!6013 (_2!6254 lt!212494)) (currentBit!6008 (_2!6254 lt!212494))) (bvadd (bitIndex!0 (size!2807 (buf!3210 (_2!6254 lt!212490))) (currentByte!6013 (_2!6254 lt!212490)) (currentBit!6008 (_2!6254 lt!212490))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!212488))))))

(assert (=> b!136583 (= lt!212488 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!136584 () Bool)

(declare-fun e!90728 () Bool)

(declare-fun array_inv!2596 (array!6201) Bool)

(assert (=> b!136584 (= e!90728 (array_inv!2596 (buf!3210 thiss!1634)))))

(declare-fun b!136585 () Bool)

(declare-fun e!90727 () Bool)

(declare-fun lt!212483 () tuple2!11862)

(declare-fun lt!212480 () tuple2!11862)

(assert (=> b!136585 (= e!90727 (= (_2!6252 lt!212483) (_2!6252 lt!212480)))))

(declare-fun b!136587 () Bool)

(declare-fun e!90723 () Bool)

(assert (=> b!136587 (= e!90729 (not e!90723))))

(declare-fun res!113660 () Bool)

(assert (=> b!136587 (=> res!113660 e!90723)))

(declare-datatypes ((tuple2!11868 0))(
  ( (tuple2!11869 (_1!6255 BitStream!4878) (_2!6255 array!6201)) )
))
(declare-fun lt!212498 () tuple2!11868)

(declare-fun lt!212481 () tuple2!11868)

(declare-fun arrayRangesEq!210 (array!6201 array!6201 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!136587 (= res!113660 (not (arrayRangesEq!210 (_2!6255 lt!212481) (_2!6255 lt!212498) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!212487 () tuple2!11868)

(assert (=> b!136587 (arrayRangesEq!210 (_2!6255 lt!212481) (_2!6255 lt!212487) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!212499 () Unit!8555)

(declare-fun lt!212489 () tuple2!11864)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4878 array!6201 (_ BitVec 32) (_ BitVec 32)) Unit!8555)

(assert (=> b!136587 (= lt!212499 (readByteArrayLoopArrayPrefixLemma!0 (_1!6253 lt!212489) arr!237 from!447 to!404))))

(declare-fun lt!212502 () array!6201)

(declare-fun readByteArrayLoopPure!0 (BitStream!4878 array!6201 (_ BitVec 32) (_ BitVec 32)) tuple2!11868)

(declare-fun withMovedByteIndex!0 (BitStream!4878 (_ BitVec 32)) BitStream!4878)

(assert (=> b!136587 (= lt!212487 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6253 lt!212489) #b00000000000000000000000000000001) lt!212502 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!212495 () tuple2!11864)

(assert (=> b!136587 (= lt!212498 (readByteArrayLoopPure!0 (_1!6253 lt!212495) lt!212502 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!212504 () tuple2!11862)

(assert (=> b!136587 (= lt!212502 (array!6202 (store (arr!3487 arr!237) from!447 (_2!6252 lt!212504)) (size!2807 arr!237)))))

(declare-fun lt!212503 () (_ BitVec 32))

(assert (=> b!136587 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2807 (buf!3210 (_2!6254 lt!212494)))) ((_ sign_extend 32) (currentByte!6013 (_2!6254 lt!212490))) ((_ sign_extend 32) (currentBit!6008 (_2!6254 lt!212490))) lt!212503)))

(declare-fun lt!212485 () Unit!8555)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4878 array!6201 (_ BitVec 32)) Unit!8555)

(assert (=> b!136587 (= lt!212485 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6254 lt!212490) (buf!3210 (_2!6254 lt!212494)) lt!212503))))

(assert (=> b!136587 (= (_1!6255 lt!212481) (_2!6253 lt!212489))))

(assert (=> b!136587 (= lt!212481 (readByteArrayLoopPure!0 (_1!6253 lt!212489) arr!237 from!447 to!404))))

(assert (=> b!136587 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2807 (buf!3210 (_2!6254 lt!212494)))) ((_ sign_extend 32) (currentByte!6013 thiss!1634)) ((_ sign_extend 32) (currentBit!6008 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!212493 () Unit!8555)

(assert (=> b!136587 (= lt!212493 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3210 (_2!6254 lt!212494)) (bvsub to!404 from!447)))))

(assert (=> b!136587 (= (_2!6252 lt!212504) (select (arr!3487 arr!237) from!447))))

(assert (=> b!136587 (= lt!212504 (readBytePure!0 (_1!6253 lt!212489)))))

(assert (=> b!136587 (= lt!212495 (reader!0 (_2!6254 lt!212490) (_2!6254 lt!212494)))))

(assert (=> b!136587 (= lt!212489 (reader!0 thiss!1634 (_2!6254 lt!212494)))))

(assert (=> b!136587 e!90727))

(declare-fun res!113668 () Bool)

(assert (=> b!136587 (=> (not res!113668) (not e!90727))))

(assert (=> b!136587 (= res!113668 (= (bitIndex!0 (size!2807 (buf!3210 (_1!6252 lt!212483))) (currentByte!6013 (_1!6252 lt!212483)) (currentBit!6008 (_1!6252 lt!212483))) (bitIndex!0 (size!2807 (buf!3210 (_1!6252 lt!212480))) (currentByte!6013 (_1!6252 lt!212480)) (currentBit!6008 (_1!6252 lt!212480)))))))

(declare-fun lt!212482 () Unit!8555)

(declare-fun lt!212484 () BitStream!4878)

(declare-fun readBytePrefixLemma!0 (BitStream!4878 BitStream!4878) Unit!8555)

(assert (=> b!136587 (= lt!212482 (readBytePrefixLemma!0 lt!212484 (_2!6254 lt!212494)))))

(assert (=> b!136587 (= lt!212480 (readBytePure!0 (BitStream!4879 (buf!3210 (_2!6254 lt!212494)) (currentByte!6013 thiss!1634) (currentBit!6008 thiss!1634))))))

(assert (=> b!136587 (= lt!212483 (readBytePure!0 lt!212484))))

(assert (=> b!136587 (= lt!212484 (BitStream!4879 (buf!3210 (_2!6254 lt!212490)) (currentByte!6013 thiss!1634) (currentBit!6008 thiss!1634)))))

(declare-fun e!90724 () Bool)

(assert (=> b!136587 e!90724))

(declare-fun res!113662 () Bool)

(assert (=> b!136587 (=> (not res!113662) (not e!90724))))

(declare-fun isPrefixOf!0 (BitStream!4878 BitStream!4878) Bool)

(assert (=> b!136587 (= res!113662 (isPrefixOf!0 thiss!1634 (_2!6254 lt!212494)))))

(declare-fun lt!212496 () Unit!8555)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4878 BitStream!4878 BitStream!4878) Unit!8555)

(assert (=> b!136587 (= lt!212496 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6254 lt!212490) (_2!6254 lt!212494)))))

(assert (=> b!136587 e!90731))

(declare-fun res!113655 () Bool)

(assert (=> b!136587 (=> (not res!113655) (not e!90731))))

(assert (=> b!136587 (= res!113655 (= (size!2807 (buf!3210 (_2!6254 lt!212490))) (size!2807 (buf!3210 (_2!6254 lt!212494)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4878 array!6201 (_ BitVec 32) (_ BitVec 32)) tuple2!11866)

(assert (=> b!136587 (= lt!212494 (appendByteArrayLoop!0 (_2!6254 lt!212490) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!136587 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2807 (buf!3210 (_2!6254 lt!212490)))) ((_ sign_extend 32) (currentByte!6013 (_2!6254 lt!212490))) ((_ sign_extend 32) (currentBit!6008 (_2!6254 lt!212490))) lt!212503)))

(assert (=> b!136587 (= lt!212503 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!212497 () Unit!8555)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4878 BitStream!4878 (_ BitVec 64) (_ BitVec 32)) Unit!8555)

(assert (=> b!136587 (= lt!212497 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6254 lt!212490) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!136587 e!90722))

(declare-fun res!113656 () Bool)

(assert (=> b!136587 (=> (not res!113656) (not e!90722))))

(assert (=> b!136587 (= res!113656 (= (size!2807 (buf!3210 thiss!1634)) (size!2807 (buf!3210 (_2!6254 lt!212490)))))))

(declare-fun appendByte!0 (BitStream!4878 (_ BitVec 8)) tuple2!11866)

(assert (=> b!136587 (= lt!212490 (appendByte!0 thiss!1634 (select (arr!3487 arr!237) from!447)))))

(declare-fun b!136588 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!136588 (= e!90724 (invariant!0 (currentBit!6008 thiss!1634) (currentByte!6013 thiss!1634) (size!2807 (buf!3210 (_2!6254 lt!212490)))))))

(declare-fun b!136589 () Bool)

(declare-fun res!113666 () Bool)

(assert (=> b!136589 (=> (not res!113666) (not e!90729))))

(assert (=> b!136589 (= res!113666 (invariant!0 (currentBit!6008 thiss!1634) (currentByte!6013 thiss!1634) (size!2807 (buf!3210 thiss!1634))))))

(declare-fun res!113657 () Bool)

(assert (=> start!26606 (=> (not res!113657) (not e!90729))))

(assert (=> start!26606 (= res!113657 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2807 arr!237))))))

(assert (=> start!26606 e!90729))

(assert (=> start!26606 true))

(assert (=> start!26606 (array_inv!2596 arr!237)))

(declare-fun inv!12 (BitStream!4878) Bool)

(assert (=> start!26606 (and (inv!12 thiss!1634) e!90728)))

(declare-fun b!136586 () Bool)

(declare-fun res!113658 () Bool)

(assert (=> b!136586 (=> (not res!113658) (not e!90722))))

(assert (=> b!136586 (= res!113658 (= (bitIndex!0 (size!2807 (buf!3210 (_2!6254 lt!212490))) (currentByte!6013 (_2!6254 lt!212490)) (currentBit!6008 (_2!6254 lt!212490))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2807 (buf!3210 thiss!1634)) (currentByte!6013 thiss!1634) (currentBit!6008 thiss!1634)))))))

(declare-fun lt!212500 () tuple2!11868)

(declare-fun e!90726 () Bool)

(declare-fun b!136590 () Bool)

(assert (=> b!136590 (= e!90726 (not (arrayRangesEq!210 arr!237 (_2!6255 lt!212500) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!136591 () Bool)

(declare-fun res!113664 () Bool)

(assert (=> b!136591 (=> (not res!113664) (not e!90729))))

(assert (=> b!136591 (= res!113664 (bvslt from!447 to!404))))

(declare-fun b!136592 () Bool)

(assert (=> b!136592 (= e!90721 (not e!90726))))

(declare-fun res!113663 () Bool)

(assert (=> b!136592 (=> res!113663 e!90726)))

(declare-fun lt!212501 () tuple2!11864)

(assert (=> b!136592 (= res!113663 (or (not (= (size!2807 (_2!6255 lt!212500)) (size!2807 arr!237))) (not (= (_1!6255 lt!212500) (_2!6253 lt!212501)))))))

(assert (=> b!136592 (= lt!212500 (readByteArrayLoopPure!0 (_1!6253 lt!212501) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!136592 (validate_offset_bits!1 ((_ sign_extend 32) (size!2807 (buf!3210 (_2!6254 lt!212494)))) ((_ sign_extend 32) (currentByte!6013 (_2!6254 lt!212490))) ((_ sign_extend 32) (currentBit!6008 (_2!6254 lt!212490))) lt!212488)))

(declare-fun lt!212478 () Unit!8555)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4878 array!6201 (_ BitVec 64)) Unit!8555)

(assert (=> b!136592 (= lt!212478 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6254 lt!212490) (buf!3210 (_2!6254 lt!212494)) lt!212488))))

(assert (=> b!136592 (= lt!212501 (reader!0 (_2!6254 lt!212490) (_2!6254 lt!212494)))))

(declare-fun b!136593 () Bool)

(assert (=> b!136593 (= e!90723 true)))

(assert (=> b!136593 (arrayRangesEq!210 arr!237 (_2!6255 lt!212481) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!212492 () Unit!8555)

(declare-fun arrayRangesEqTransitive!12 (array!6201 array!6201 array!6201 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8555)

(assert (=> b!136593 (= lt!212492 (arrayRangesEqTransitive!12 arr!237 (_2!6255 lt!212498) (_2!6255 lt!212481) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!136593 (arrayRangesEq!210 (_2!6255 lt!212498) (_2!6255 lt!212481) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!212491 () Unit!8555)

(declare-fun arrayRangesEqSymmetricLemma!23 (array!6201 array!6201 (_ BitVec 32) (_ BitVec 32)) Unit!8555)

(assert (=> b!136593 (= lt!212491 (arrayRangesEqSymmetricLemma!23 (_2!6255 lt!212481) (_2!6255 lt!212498) #b00000000000000000000000000000000 to!404))))

(declare-fun b!136594 () Bool)

(declare-fun res!113659 () Bool)

(assert (=> b!136594 (=> (not res!113659) (not e!90722))))

(assert (=> b!136594 (= res!113659 (isPrefixOf!0 thiss!1634 (_2!6254 lt!212490)))))

(declare-fun b!136595 () Bool)

(declare-fun res!113665 () Bool)

(assert (=> b!136595 (=> (not res!113665) (not e!90721))))

(assert (=> b!136595 (= res!113665 (isPrefixOf!0 (_2!6254 lt!212490) (_2!6254 lt!212494)))))

(assert (= (and start!26606 res!113657) b!136582))

(assert (= (and b!136582 res!113667) b!136591))

(assert (= (and b!136591 res!113664) b!136589))

(assert (= (and b!136589 res!113666) b!136587))

(assert (= (and b!136587 res!113656) b!136586))

(assert (= (and b!136586 res!113658) b!136594))

(assert (= (and b!136594 res!113659) b!136581))

(assert (= (and b!136587 res!113655) b!136583))

(assert (= (and b!136583 res!113661) b!136595))

(assert (= (and b!136595 res!113665) b!136592))

(assert (= (and b!136592 (not res!113663)) b!136590))

(assert (= (and b!136587 res!113662) b!136588))

(assert (= (and b!136587 res!113668) b!136585))

(assert (= (and b!136587 (not res!113660)) b!136593))

(assert (= start!26606 b!136584))

(declare-fun m!209201 () Bool)

(assert (=> b!136581 m!209201))

(declare-fun m!209203 () Bool)

(assert (=> b!136581 m!209203))

(declare-fun m!209205 () Bool)

(assert (=> b!136581 m!209205))

(declare-fun m!209207 () Bool)

(assert (=> b!136587 m!209207))

(declare-fun m!209209 () Bool)

(assert (=> b!136587 m!209209))

(declare-fun m!209211 () Bool)

(assert (=> b!136587 m!209211))

(declare-fun m!209213 () Bool)

(assert (=> b!136587 m!209213))

(declare-fun m!209215 () Bool)

(assert (=> b!136587 m!209215))

(declare-fun m!209217 () Bool)

(assert (=> b!136587 m!209217))

(declare-fun m!209219 () Bool)

(assert (=> b!136587 m!209219))

(declare-fun m!209221 () Bool)

(assert (=> b!136587 m!209221))

(declare-fun m!209223 () Bool)

(assert (=> b!136587 m!209223))

(declare-fun m!209225 () Bool)

(assert (=> b!136587 m!209225))

(declare-fun m!209227 () Bool)

(assert (=> b!136587 m!209227))

(declare-fun m!209229 () Bool)

(assert (=> b!136587 m!209229))

(declare-fun m!209231 () Bool)

(assert (=> b!136587 m!209231))

(assert (=> b!136587 m!209227))

(declare-fun m!209233 () Bool)

(assert (=> b!136587 m!209233))

(declare-fun m!209235 () Bool)

(assert (=> b!136587 m!209235))

(declare-fun m!209237 () Bool)

(assert (=> b!136587 m!209237))

(declare-fun m!209239 () Bool)

(assert (=> b!136587 m!209239))

(declare-fun m!209241 () Bool)

(assert (=> b!136587 m!209241))

(declare-fun m!209243 () Bool)

(assert (=> b!136587 m!209243))

(declare-fun m!209245 () Bool)

(assert (=> b!136587 m!209245))

(declare-fun m!209247 () Bool)

(assert (=> b!136587 m!209247))

(declare-fun m!209249 () Bool)

(assert (=> b!136587 m!209249))

(declare-fun m!209251 () Bool)

(assert (=> b!136587 m!209251))

(declare-fun m!209253 () Bool)

(assert (=> b!136587 m!209253))

(assert (=> b!136587 m!209201))

(declare-fun m!209255 () Bool)

(assert (=> b!136587 m!209255))

(declare-fun m!209257 () Bool)

(assert (=> b!136587 m!209257))

(assert (=> b!136587 m!209201))

(declare-fun m!209259 () Bool)

(assert (=> b!136594 m!209259))

(declare-fun m!209261 () Bool)

(assert (=> b!136586 m!209261))

(declare-fun m!209263 () Bool)

(assert (=> b!136586 m!209263))

(declare-fun m!209265 () Bool)

(assert (=> b!136590 m!209265))

(declare-fun m!209267 () Bool)

(assert (=> b!136582 m!209267))

(declare-fun m!209269 () Bool)

(assert (=> b!136595 m!209269))

(declare-fun m!209271 () Bool)

(assert (=> b!136589 m!209271))

(declare-fun m!209273 () Bool)

(assert (=> b!136593 m!209273))

(declare-fun m!209275 () Bool)

(assert (=> b!136593 m!209275))

(declare-fun m!209277 () Bool)

(assert (=> b!136593 m!209277))

(declare-fun m!209279 () Bool)

(assert (=> b!136593 m!209279))

(declare-fun m!209281 () Bool)

(assert (=> start!26606 m!209281))

(declare-fun m!209283 () Bool)

(assert (=> start!26606 m!209283))

(declare-fun m!209285 () Bool)

(assert (=> b!136583 m!209285))

(assert (=> b!136583 m!209261))

(declare-fun m!209287 () Bool)

(assert (=> b!136592 m!209287))

(declare-fun m!209289 () Bool)

(assert (=> b!136592 m!209289))

(declare-fun m!209291 () Bool)

(assert (=> b!136592 m!209291))

(assert (=> b!136592 m!209237))

(declare-fun m!209293 () Bool)

(assert (=> b!136584 m!209293))

(declare-fun m!209295 () Bool)

(assert (=> b!136588 m!209295))

(check-sat (not b!136582) (not b!136587) (not b!136594) (not b!136584) (not b!136592) (not b!136595) (not b!136590) (not start!26606) (not b!136581) (not b!136589) (not b!136588) (not b!136583) (not b!136586) (not b!136593))
