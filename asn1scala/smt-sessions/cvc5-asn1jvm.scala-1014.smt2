; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28920 () Bool)

(assert start!28920)

(declare-fun b!149980 () Bool)

(declare-fun res!125674 () Bool)

(declare-fun e!100127 () Bool)

(assert (=> b!149980 (=> (not res!125674) (not e!100127))))

(declare-datatypes ((array!6713 0))(
  ( (array!6714 (arr!3830 (Array (_ BitVec 32) (_ BitVec 8))) (size!3037 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5332 0))(
  ( (BitStream!5333 (buf!3518 array!6713) (currentByte!6438 (_ BitVec 32)) (currentBit!6433 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!9474 0))(
  ( (Unit!9475) )
))
(declare-datatypes ((tuple2!13380 0))(
  ( (tuple2!13381 (_1!7057 Unit!9474) (_2!7057 BitStream!5332)) )
))
(declare-fun lt!234361 () tuple2!13380)

(declare-fun lt!234351 () tuple2!13380)

(declare-fun isPrefixOf!0 (BitStream!5332 BitStream!5332) Bool)

(assert (=> b!149980 (= res!125674 (isPrefixOf!0 (_2!7057 lt!234361) (_2!7057 lt!234351)))))

(declare-fun b!149981 () Bool)

(declare-fun res!125666 () Bool)

(declare-fun e!100131 () Bool)

(assert (=> b!149981 (=> (not res!125666) (not e!100131))))

(declare-fun thiss!1634 () BitStream!5332)

(assert (=> b!149981 (= res!125666 (isPrefixOf!0 thiss!1634 (_2!7057 lt!234361)))))

(declare-fun b!149982 () Bool)

(declare-fun e!100133 () Bool)

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!149982 (= e!100133 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000))))))

(declare-fun b!149983 () Bool)

(declare-fun res!125675 () Bool)

(declare-fun e!100128 () Bool)

(assert (=> b!149983 (=> (not res!125675) (not e!100128))))

(assert (=> b!149983 (= res!125675 (bvslt from!447 to!404))))

(declare-fun b!149984 () Bool)

(declare-fun e!100130 () Bool)

(assert (=> b!149984 (= e!100130 e!100127)))

(declare-fun res!125677 () Bool)

(assert (=> b!149984 (=> (not res!125677) (not e!100127))))

(declare-fun lt!234342 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!149984 (= res!125677 (= (bitIndex!0 (size!3037 (buf!3518 (_2!7057 lt!234351))) (currentByte!6438 (_2!7057 lt!234351)) (currentBit!6433 (_2!7057 lt!234351))) (bvadd (bitIndex!0 (size!3037 (buf!3518 (_2!7057 lt!234361))) (currentByte!6438 (_2!7057 lt!234361)) (currentBit!6433 (_2!7057 lt!234361))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!234342))))))

(assert (=> b!149984 (= lt!234342 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!149985 () Bool)

(declare-fun res!125672 () Bool)

(assert (=> b!149985 (=> res!125672 e!100133)))

(assert (=> b!149985 (= res!125672 (not (= (bitIndex!0 (size!3037 (buf!3518 (_2!7057 lt!234351))) (currentByte!6438 (_2!7057 lt!234351)) (currentBit!6433 (_2!7057 lt!234351))) (bvadd (bitIndex!0 (size!3037 (buf!3518 thiss!1634)) (currentByte!6438 thiss!1634) (currentBit!6433 thiss!1634)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!404 from!447)))))))))

(declare-fun e!100126 () Bool)

(declare-datatypes ((tuple2!13382 0))(
  ( (tuple2!13383 (_1!7058 BitStream!5332) (_2!7058 array!6713)) )
))
(declare-fun lt!234356 () tuple2!13382)

(declare-fun arr!237 () array!6713)

(declare-fun b!149987 () Bool)

(declare-fun arrayRangesEq!353 (array!6713 array!6713 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!149987 (= e!100126 (not (arrayRangesEq!353 arr!237 (_2!7058 lt!234356) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!149988 () Bool)

(declare-fun res!125671 () Bool)

(assert (=> b!149988 (=> (not res!125671) (not e!100128))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!149988 (= res!125671 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3037 (buf!3518 thiss!1634))) ((_ sign_extend 32) (currentByte!6438 thiss!1634)) ((_ sign_extend 32) (currentBit!6433 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!149989 () Bool)

(declare-fun e!100124 () Bool)

(assert (=> b!149989 (= e!100128 (not e!100124))))

(declare-fun res!125668 () Bool)

(assert (=> b!149989 (=> res!125668 e!100124)))

(declare-fun lt!234340 () tuple2!13382)

(declare-fun lt!234341 () tuple2!13382)

(assert (=> b!149989 (= res!125668 (not (arrayRangesEq!353 (_2!7058 lt!234341) (_2!7058 lt!234340) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!234352 () tuple2!13382)

(assert (=> b!149989 (arrayRangesEq!353 (_2!7058 lt!234341) (_2!7058 lt!234352) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!234355 () Unit!9474)

(declare-datatypes ((tuple2!13384 0))(
  ( (tuple2!13385 (_1!7059 BitStream!5332) (_2!7059 BitStream!5332)) )
))
(declare-fun lt!234357 () tuple2!13384)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5332 array!6713 (_ BitVec 32) (_ BitVec 32)) Unit!9474)

(assert (=> b!149989 (= lt!234355 (readByteArrayLoopArrayPrefixLemma!0 (_1!7059 lt!234357) arr!237 from!447 to!404))))

(declare-fun lt!234359 () array!6713)

(declare-fun readByteArrayLoopPure!0 (BitStream!5332 array!6713 (_ BitVec 32) (_ BitVec 32)) tuple2!13382)

(declare-fun withMovedByteIndex!0 (BitStream!5332 (_ BitVec 32)) BitStream!5332)

(assert (=> b!149989 (= lt!234352 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!7059 lt!234357) #b00000000000000000000000000000001) lt!234359 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!234350 () tuple2!13384)

(assert (=> b!149989 (= lt!234340 (readByteArrayLoopPure!0 (_1!7059 lt!234350) lt!234359 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((tuple2!13386 0))(
  ( (tuple2!13387 (_1!7060 BitStream!5332) (_2!7060 (_ BitVec 8))) )
))
(declare-fun lt!234358 () tuple2!13386)

(assert (=> b!149989 (= lt!234359 (array!6714 (store (arr!3830 arr!237) from!447 (_2!7060 lt!234358)) (size!3037 arr!237)))))

(declare-fun lt!234363 () (_ BitVec 32))

(assert (=> b!149989 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3037 (buf!3518 (_2!7057 lt!234351)))) ((_ sign_extend 32) (currentByte!6438 (_2!7057 lt!234361))) ((_ sign_extend 32) (currentBit!6433 (_2!7057 lt!234361))) lt!234363)))

(declare-fun lt!234348 () Unit!9474)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5332 array!6713 (_ BitVec 32)) Unit!9474)

(assert (=> b!149989 (= lt!234348 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!7057 lt!234361) (buf!3518 (_2!7057 lt!234351)) lt!234363))))

(assert (=> b!149989 (= (_1!7058 lt!234341) (_2!7059 lt!234357))))

(assert (=> b!149989 (= lt!234341 (readByteArrayLoopPure!0 (_1!7059 lt!234357) arr!237 from!447 to!404))))

(assert (=> b!149989 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3037 (buf!3518 (_2!7057 lt!234351)))) ((_ sign_extend 32) (currentByte!6438 thiss!1634)) ((_ sign_extend 32) (currentBit!6433 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!234347 () Unit!9474)

(assert (=> b!149989 (= lt!234347 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3518 (_2!7057 lt!234351)) (bvsub to!404 from!447)))))

(assert (=> b!149989 (= (_2!7060 lt!234358) (select (arr!3830 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!5332) tuple2!13386)

(assert (=> b!149989 (= lt!234358 (readBytePure!0 (_1!7059 lt!234357)))))

(declare-fun reader!0 (BitStream!5332 BitStream!5332) tuple2!13384)

(assert (=> b!149989 (= lt!234350 (reader!0 (_2!7057 lt!234361) (_2!7057 lt!234351)))))

(assert (=> b!149989 (= lt!234357 (reader!0 thiss!1634 (_2!7057 lt!234351)))))

(declare-fun e!100134 () Bool)

(assert (=> b!149989 e!100134))

(declare-fun res!125678 () Bool)

(assert (=> b!149989 (=> (not res!125678) (not e!100134))))

(declare-fun lt!234338 () tuple2!13386)

(declare-fun lt!234360 () tuple2!13386)

(assert (=> b!149989 (= res!125678 (= (bitIndex!0 (size!3037 (buf!3518 (_1!7060 lt!234338))) (currentByte!6438 (_1!7060 lt!234338)) (currentBit!6433 (_1!7060 lt!234338))) (bitIndex!0 (size!3037 (buf!3518 (_1!7060 lt!234360))) (currentByte!6438 (_1!7060 lt!234360)) (currentBit!6433 (_1!7060 lt!234360)))))))

(declare-fun lt!234339 () Unit!9474)

(declare-fun lt!234346 () BitStream!5332)

(declare-fun readBytePrefixLemma!0 (BitStream!5332 BitStream!5332) Unit!9474)

(assert (=> b!149989 (= lt!234339 (readBytePrefixLemma!0 lt!234346 (_2!7057 lt!234351)))))

(assert (=> b!149989 (= lt!234360 (readBytePure!0 (BitStream!5333 (buf!3518 (_2!7057 lt!234351)) (currentByte!6438 thiss!1634) (currentBit!6433 thiss!1634))))))

(assert (=> b!149989 (= lt!234338 (readBytePure!0 lt!234346))))

(assert (=> b!149989 (= lt!234346 (BitStream!5333 (buf!3518 (_2!7057 lt!234361)) (currentByte!6438 thiss!1634) (currentBit!6433 thiss!1634)))))

(declare-fun e!100129 () Bool)

(assert (=> b!149989 e!100129))

(declare-fun res!125669 () Bool)

(assert (=> b!149989 (=> (not res!125669) (not e!100129))))

(assert (=> b!149989 (= res!125669 (isPrefixOf!0 thiss!1634 (_2!7057 lt!234351)))))

(declare-fun lt!234343 () Unit!9474)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5332 BitStream!5332 BitStream!5332) Unit!9474)

(assert (=> b!149989 (= lt!234343 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!7057 lt!234361) (_2!7057 lt!234351)))))

(assert (=> b!149989 e!100130))

(declare-fun res!125679 () Bool)

(assert (=> b!149989 (=> (not res!125679) (not e!100130))))

(assert (=> b!149989 (= res!125679 (= (size!3037 (buf!3518 (_2!7057 lt!234361))) (size!3037 (buf!3518 (_2!7057 lt!234351)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5332 array!6713 (_ BitVec 32) (_ BitVec 32)) tuple2!13380)

(assert (=> b!149989 (= lt!234351 (appendByteArrayLoop!0 (_2!7057 lt!234361) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!149989 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3037 (buf!3518 (_2!7057 lt!234361)))) ((_ sign_extend 32) (currentByte!6438 (_2!7057 lt!234361))) ((_ sign_extend 32) (currentBit!6433 (_2!7057 lt!234361))) lt!234363)))

(assert (=> b!149989 (= lt!234363 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!234354 () Unit!9474)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5332 BitStream!5332 (_ BitVec 64) (_ BitVec 32)) Unit!9474)

(assert (=> b!149989 (= lt!234354 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!7057 lt!234361) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!149989 e!100131))

(declare-fun res!125681 () Bool)

(assert (=> b!149989 (=> (not res!125681) (not e!100131))))

(assert (=> b!149989 (= res!125681 (= (size!3037 (buf!3518 thiss!1634)) (size!3037 (buf!3518 (_2!7057 lt!234361)))))))

(declare-fun appendByte!0 (BitStream!5332 (_ BitVec 8)) tuple2!13380)

(assert (=> b!149989 (= lt!234361 (appendByte!0 thiss!1634 (select (arr!3830 arr!237) from!447)))))

(declare-fun b!149990 () Bool)

(assert (=> b!149990 (= e!100127 (not e!100126))))

(declare-fun res!125676 () Bool)

(assert (=> b!149990 (=> res!125676 e!100126)))

(declare-fun lt!234337 () tuple2!13384)

(assert (=> b!149990 (= res!125676 (or (not (= (size!3037 (_2!7058 lt!234356)) (size!3037 arr!237))) (not (= (_1!7058 lt!234356) (_2!7059 lt!234337)))))))

(assert (=> b!149990 (= lt!234356 (readByteArrayLoopPure!0 (_1!7059 lt!234337) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!149990 (validate_offset_bits!1 ((_ sign_extend 32) (size!3037 (buf!3518 (_2!7057 lt!234351)))) ((_ sign_extend 32) (currentByte!6438 (_2!7057 lt!234361))) ((_ sign_extend 32) (currentBit!6433 (_2!7057 lt!234361))) lt!234342)))

(declare-fun lt!234345 () Unit!9474)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5332 array!6713 (_ BitVec 64)) Unit!9474)

(assert (=> b!149990 (= lt!234345 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!7057 lt!234361) (buf!3518 (_2!7057 lt!234351)) lt!234342))))

(assert (=> b!149990 (= lt!234337 (reader!0 (_2!7057 lt!234361) (_2!7057 lt!234351)))))

(declare-fun b!149991 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!149991 (= e!100129 (invariant!0 (currentBit!6433 thiss!1634) (currentByte!6438 thiss!1634) (size!3037 (buf!3518 (_2!7057 lt!234361)))))))

(declare-fun b!149992 () Bool)

(declare-fun e!100135 () Bool)

(declare-fun array_inv!2826 (array!6713) Bool)

(assert (=> b!149992 (= e!100135 (array_inv!2826 (buf!3518 thiss!1634)))))

(declare-fun res!125680 () Bool)

(assert (=> start!28920 (=> (not res!125680) (not e!100128))))

(assert (=> start!28920 (= res!125680 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3037 arr!237))))))

(assert (=> start!28920 e!100128))

(assert (=> start!28920 true))

(assert (=> start!28920 (array_inv!2826 arr!237)))

(declare-fun inv!12 (BitStream!5332) Bool)

(assert (=> start!28920 (and (inv!12 thiss!1634) e!100135)))

(declare-fun b!149986 () Bool)

(declare-fun res!125673 () Bool)

(assert (=> b!149986 (=> (not res!125673) (not e!100131))))

(assert (=> b!149986 (= res!125673 (= (bitIndex!0 (size!3037 (buf!3518 (_2!7057 lt!234361))) (currentByte!6438 (_2!7057 lt!234361)) (currentBit!6433 (_2!7057 lt!234361))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3037 (buf!3518 thiss!1634)) (currentByte!6438 thiss!1634) (currentBit!6433 thiss!1634)))))))

(declare-fun b!149993 () Bool)

(declare-fun res!125667 () Bool)

(assert (=> b!149993 (=> (not res!125667) (not e!100128))))

(assert (=> b!149993 (= res!125667 (invariant!0 (currentBit!6433 thiss!1634) (currentByte!6438 thiss!1634) (size!3037 (buf!3518 thiss!1634))))))

(declare-fun b!149994 () Bool)

(assert (=> b!149994 (= e!100134 (= (_2!7060 lt!234338) (_2!7060 lt!234360)))))

(declare-fun lt!234349 () tuple2!13386)

(declare-fun b!149995 () Bool)

(declare-fun lt!234362 () tuple2!13384)

(assert (=> b!149995 (= e!100131 (and (= (_2!7060 lt!234349) (select (arr!3830 arr!237) from!447)) (= (_1!7060 lt!234349) (_2!7059 lt!234362))))))

(assert (=> b!149995 (= lt!234349 (readBytePure!0 (_1!7059 lt!234362)))))

(assert (=> b!149995 (= lt!234362 (reader!0 thiss!1634 (_2!7057 lt!234361)))))

(declare-fun b!149996 () Bool)

(assert (=> b!149996 (= e!100124 e!100133)))

(declare-fun res!125670 () Bool)

(assert (=> b!149996 (=> res!125670 e!100133)))

(assert (=> b!149996 (= res!125670 (not (= (size!3037 (buf!3518 thiss!1634)) (size!3037 (buf!3518 (_2!7057 lt!234351))))))))

(assert (=> b!149996 (arrayRangesEq!353 arr!237 (_2!7058 lt!234341) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!234344 () Unit!9474)

(declare-fun arrayRangesEqTransitive!68 (array!6713 array!6713 array!6713 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9474)

(assert (=> b!149996 (= lt!234344 (arrayRangesEqTransitive!68 arr!237 (_2!7058 lt!234340) (_2!7058 lt!234341) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!149996 (arrayRangesEq!353 (_2!7058 lt!234340) (_2!7058 lt!234341) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!234353 () Unit!9474)

(declare-fun arrayRangesEqSymmetricLemma!85 (array!6713 array!6713 (_ BitVec 32) (_ BitVec 32)) Unit!9474)

(assert (=> b!149996 (= lt!234353 (arrayRangesEqSymmetricLemma!85 (_2!7058 lt!234341) (_2!7058 lt!234340) #b00000000000000000000000000000000 to!404))))

(assert (= (and start!28920 res!125680) b!149988))

(assert (= (and b!149988 res!125671) b!149983))

(assert (= (and b!149983 res!125675) b!149993))

(assert (= (and b!149993 res!125667) b!149989))

(assert (= (and b!149989 res!125681) b!149986))

(assert (= (and b!149986 res!125673) b!149981))

(assert (= (and b!149981 res!125666) b!149995))

(assert (= (and b!149989 res!125679) b!149984))

(assert (= (and b!149984 res!125677) b!149980))

(assert (= (and b!149980 res!125674) b!149990))

(assert (= (and b!149990 (not res!125676)) b!149987))

(assert (= (and b!149989 res!125669) b!149991))

(assert (= (and b!149989 res!125678) b!149994))

(assert (= (and b!149989 (not res!125668)) b!149996))

(assert (= (and b!149996 (not res!125670)) b!149985))

(assert (= (and b!149985 (not res!125672)) b!149982))

(assert (= start!28920 b!149992))

(declare-fun m!233625 () Bool)

(assert (=> b!149981 m!233625))

(declare-fun m!233627 () Bool)

(assert (=> b!149993 m!233627))

(declare-fun m!233629 () Bool)

(assert (=> b!149989 m!233629))

(declare-fun m!233631 () Bool)

(assert (=> b!149989 m!233631))

(declare-fun m!233633 () Bool)

(assert (=> b!149989 m!233633))

(declare-fun m!233635 () Bool)

(assert (=> b!149989 m!233635))

(declare-fun m!233637 () Bool)

(assert (=> b!149989 m!233637))

(declare-fun m!233639 () Bool)

(assert (=> b!149989 m!233639))

(declare-fun m!233641 () Bool)

(assert (=> b!149989 m!233641))

(declare-fun m!233643 () Bool)

(assert (=> b!149989 m!233643))

(declare-fun m!233645 () Bool)

(assert (=> b!149989 m!233645))

(declare-fun m!233647 () Bool)

(assert (=> b!149989 m!233647))

(declare-fun m!233649 () Bool)

(assert (=> b!149989 m!233649))

(declare-fun m!233651 () Bool)

(assert (=> b!149989 m!233651))

(declare-fun m!233653 () Bool)

(assert (=> b!149989 m!233653))

(declare-fun m!233655 () Bool)

(assert (=> b!149989 m!233655))

(declare-fun m!233657 () Bool)

(assert (=> b!149989 m!233657))

(declare-fun m!233659 () Bool)

(assert (=> b!149989 m!233659))

(declare-fun m!233661 () Bool)

(assert (=> b!149989 m!233661))

(declare-fun m!233663 () Bool)

(assert (=> b!149989 m!233663))

(declare-fun m!233665 () Bool)

(assert (=> b!149989 m!233665))

(declare-fun m!233667 () Bool)

(assert (=> b!149989 m!233667))

(declare-fun m!233669 () Bool)

(assert (=> b!149989 m!233669))

(assert (=> b!149989 m!233635))

(declare-fun m!233671 () Bool)

(assert (=> b!149989 m!233671))

(declare-fun m!233673 () Bool)

(assert (=> b!149989 m!233673))

(declare-fun m!233675 () Bool)

(assert (=> b!149989 m!233675))

(assert (=> b!149989 m!233653))

(declare-fun m!233677 () Bool)

(assert (=> b!149989 m!233677))

(declare-fun m!233679 () Bool)

(assert (=> b!149989 m!233679))

(declare-fun m!233681 () Bool)

(assert (=> b!149989 m!233681))

(declare-fun m!233683 () Bool)

(assert (=> b!149985 m!233683))

(declare-fun m!233685 () Bool)

(assert (=> b!149985 m!233685))

(declare-fun m!233687 () Bool)

(assert (=> b!149980 m!233687))

(declare-fun m!233689 () Bool)

(assert (=> b!149991 m!233689))

(declare-fun m!233691 () Bool)

(assert (=> b!149988 m!233691))

(assert (=> b!149984 m!233683))

(declare-fun m!233693 () Bool)

(assert (=> b!149984 m!233693))

(assert (=> b!149986 m!233693))

(assert (=> b!149986 m!233685))

(declare-fun m!233695 () Bool)

(assert (=> b!149987 m!233695))

(declare-fun m!233697 () Bool)

(assert (=> b!149996 m!233697))

(declare-fun m!233699 () Bool)

(assert (=> b!149996 m!233699))

(declare-fun m!233701 () Bool)

(assert (=> b!149996 m!233701))

(declare-fun m!233703 () Bool)

(assert (=> b!149996 m!233703))

(declare-fun m!233705 () Bool)

(assert (=> start!28920 m!233705))

(declare-fun m!233707 () Bool)

(assert (=> start!28920 m!233707))

(declare-fun m!233709 () Bool)

(assert (=> b!149990 m!233709))

(declare-fun m!233711 () Bool)

(assert (=> b!149990 m!233711))

(declare-fun m!233713 () Bool)

(assert (=> b!149990 m!233713))

(assert (=> b!149990 m!233649))

(assert (=> b!149995 m!233653))

(declare-fun m!233715 () Bool)

(assert (=> b!149995 m!233715))

(declare-fun m!233717 () Bool)

(assert (=> b!149995 m!233717))

(declare-fun m!233719 () Bool)

(assert (=> b!149992 m!233719))

(push 1)

(assert (not b!149980))

(assert (not b!149992))

(assert (not b!149984))

(assert (not b!149986))

(assert (not b!149990))

(assert (not b!149989))

(assert (not b!149987))

(assert (not b!149985))

(assert (not b!149988))

(assert (not b!149991))

(assert (not b!149981))

(assert (not b!149995))

(assert (not b!149996))

(assert (not start!28920))

(assert (not b!149993))

(check-sat)

(pop 1)

(push 1)

(check-sat)

