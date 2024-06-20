; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28786 () Bool)

(assert start!28786)

(declare-fun b!149636 () Bool)

(declare-datatypes ((array!6708 0))(
  ( (array!6709 (arr!3820 (Array (_ BitVec 32) (_ BitVec 8))) (size!3036 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5330 0))(
  ( (BitStream!5331 (buf!3511 array!6708) (currentByte!6425 (_ BitVec 32)) (currentBit!6420 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!13366 0))(
  ( (tuple2!13367 (_1!7047 BitStream!5330) (_2!7047 BitStream!5330)) )
))
(declare-fun lt!233521 () tuple2!13366)

(declare-fun arr!237 () array!6708)

(declare-datatypes ((tuple2!13368 0))(
  ( (tuple2!13369 (_1!7048 BitStream!5330) (_2!7048 (_ BitVec 8))) )
))
(declare-fun lt!233534 () tuple2!13368)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun e!99919 () Bool)

(assert (=> b!149636 (= e!99919 (and (= (_2!7048 lt!233534) (select (arr!3820 arr!237) from!447)) (= (_1!7048 lt!233534) (_2!7047 lt!233521))))))

(declare-fun readBytePure!0 (BitStream!5330) tuple2!13368)

(assert (=> b!149636 (= lt!233534 (readBytePure!0 (_1!7047 lt!233521)))))

(declare-fun thiss!1634 () BitStream!5330)

(declare-datatypes ((Unit!9463 0))(
  ( (Unit!9464) )
))
(declare-datatypes ((tuple2!13370 0))(
  ( (tuple2!13371 (_1!7049 Unit!9463) (_2!7049 BitStream!5330)) )
))
(declare-fun lt!233544 () tuple2!13370)

(declare-fun reader!0 (BitStream!5330 BitStream!5330) tuple2!13366)

(assert (=> b!149636 (= lt!233521 (reader!0 thiss!1634 (_2!7049 lt!233544)))))

(declare-fun b!149637 () Bool)

(declare-fun res!125365 () Bool)

(declare-fun e!99915 () Bool)

(assert (=> b!149637 (=> (not res!125365) (not e!99915))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!149637 (= res!125365 (invariant!0 (currentBit!6420 thiss!1634) (currentByte!6425 thiss!1634) (size!3036 (buf!3511 thiss!1634))))))

(declare-fun b!149638 () Bool)

(declare-fun e!99917 () Bool)

(declare-fun e!99918 () Bool)

(assert (=> b!149638 (= e!99917 (not e!99918))))

(declare-fun res!125360 () Bool)

(assert (=> b!149638 (=> res!125360 e!99918)))

(declare-fun lt!233529 () tuple2!13366)

(declare-datatypes ((tuple2!13372 0))(
  ( (tuple2!13373 (_1!7050 BitStream!5330) (_2!7050 array!6708)) )
))
(declare-fun lt!233523 () tuple2!13372)

(assert (=> b!149638 (= res!125360 (or (not (= (size!3036 (_2!7050 lt!233523)) (size!3036 arr!237))) (not (= (_1!7050 lt!233523) (_2!7047 lt!233529)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!5330 array!6708 (_ BitVec 32) (_ BitVec 32)) tuple2!13372)

(assert (=> b!149638 (= lt!233523 (readByteArrayLoopPure!0 (_1!7047 lt!233529) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!233519 () tuple2!13370)

(declare-fun lt!233545 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!149638 (validate_offset_bits!1 ((_ sign_extend 32) (size!3036 (buf!3511 (_2!7049 lt!233519)))) ((_ sign_extend 32) (currentByte!6425 (_2!7049 lt!233544))) ((_ sign_extend 32) (currentBit!6420 (_2!7049 lt!233544))) lt!233545)))

(declare-fun lt!233531 () Unit!9463)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5330 array!6708 (_ BitVec 64)) Unit!9463)

(assert (=> b!149638 (= lt!233531 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!7049 lt!233544) (buf!3511 (_2!7049 lt!233519)) lt!233545))))

(assert (=> b!149638 (= lt!233529 (reader!0 (_2!7049 lt!233544) (_2!7049 lt!233519)))))

(declare-fun b!149639 () Bool)

(declare-fun res!125357 () Bool)

(assert (=> b!149639 (=> (not res!125357) (not e!99919))))

(declare-fun isPrefixOf!0 (BitStream!5330 BitStream!5330) Bool)

(assert (=> b!149639 (= res!125357 (isPrefixOf!0 thiss!1634 (_2!7049 lt!233544)))))

(declare-fun b!149640 () Bool)

(declare-fun arrayRangesEq!352 (array!6708 array!6708 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!149640 (= e!99918 (not (arrayRangesEq!352 arr!237 (_2!7050 lt!233523) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!233522 () (_ BitVec 64))

(declare-fun lt!233540 () (_ BitVec 64))

(declare-fun b!149641 () Bool)

(declare-fun lt!233525 () (_ BitVec 64))

(declare-fun e!99911 () Bool)

(assert (=> b!149641 (= e!99911 (or (not (= lt!233525 (bvand lt!233522 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!233525 (bvand (bvadd lt!233540 lt!233522) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!149641 (= lt!233525 (bvand lt!233540 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!149641 (= lt!233522 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!404 from!447))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!149641 (= lt!233540 (bitIndex!0 (size!3036 (buf!3511 thiss!1634)) (currentByte!6425 thiss!1634) (currentBit!6420 thiss!1634)))))

(declare-fun b!149642 () Bool)

(declare-fun res!125368 () Bool)

(assert (=> b!149642 (=> (not res!125368) (not e!99919))))

(assert (=> b!149642 (= res!125368 (= (bitIndex!0 (size!3036 (buf!3511 (_2!7049 lt!233544))) (currentByte!6425 (_2!7049 lt!233544)) (currentBit!6420 (_2!7049 lt!233544))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3036 (buf!3511 thiss!1634)) (currentByte!6425 thiss!1634) (currentBit!6420 thiss!1634)))))))

(declare-fun b!149643 () Bool)

(declare-fun e!99916 () Bool)

(assert (=> b!149643 (= e!99916 e!99917)))

(declare-fun res!125369 () Bool)

(assert (=> b!149643 (=> (not res!125369) (not e!99917))))

(assert (=> b!149643 (= res!125369 (= (bitIndex!0 (size!3036 (buf!3511 (_2!7049 lt!233519))) (currentByte!6425 (_2!7049 lt!233519)) (currentBit!6420 (_2!7049 lt!233519))) (bvadd (bitIndex!0 (size!3036 (buf!3511 (_2!7049 lt!233544))) (currentByte!6425 (_2!7049 lt!233544)) (currentBit!6420 (_2!7049 lt!233544))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!233545))))))

(assert (=> b!149643 (= lt!233545 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!149644 () Bool)

(declare-fun e!99920 () Bool)

(assert (=> b!149644 (= e!99915 (not e!99920))))

(declare-fun res!125362 () Bool)

(assert (=> b!149644 (=> res!125362 e!99920)))

(declare-fun lt!233532 () tuple2!13372)

(declare-fun lt!233547 () tuple2!13372)

(assert (=> b!149644 (= res!125362 (not (arrayRangesEq!352 (_2!7050 lt!233532) (_2!7050 lt!233547) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!233535 () tuple2!13372)

(assert (=> b!149644 (arrayRangesEq!352 (_2!7050 lt!233532) (_2!7050 lt!233535) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!233543 () tuple2!13366)

(declare-fun lt!233546 () Unit!9463)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5330 array!6708 (_ BitVec 32) (_ BitVec 32)) Unit!9463)

(assert (=> b!149644 (= lt!233546 (readByteArrayLoopArrayPrefixLemma!0 (_1!7047 lt!233543) arr!237 from!447 to!404))))

(declare-fun lt!233541 () array!6708)

(declare-fun withMovedByteIndex!0 (BitStream!5330 (_ BitVec 32)) BitStream!5330)

(assert (=> b!149644 (= lt!233535 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!7047 lt!233543) #b00000000000000000000000000000001) lt!233541 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!233533 () tuple2!13366)

(assert (=> b!149644 (= lt!233547 (readByteArrayLoopPure!0 (_1!7047 lt!233533) lt!233541 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!233527 () tuple2!13368)

(assert (=> b!149644 (= lt!233541 (array!6709 (store (arr!3820 arr!237) from!447 (_2!7048 lt!233527)) (size!3036 arr!237)))))

(declare-fun lt!233528 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!149644 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3036 (buf!3511 (_2!7049 lt!233519)))) ((_ sign_extend 32) (currentByte!6425 (_2!7049 lt!233544))) ((_ sign_extend 32) (currentBit!6420 (_2!7049 lt!233544))) lt!233528)))

(declare-fun lt!233524 () Unit!9463)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5330 array!6708 (_ BitVec 32)) Unit!9463)

(assert (=> b!149644 (= lt!233524 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!7049 lt!233544) (buf!3511 (_2!7049 lt!233519)) lt!233528))))

(assert (=> b!149644 (= (_1!7050 lt!233532) (_2!7047 lt!233543))))

(assert (=> b!149644 (= lt!233532 (readByteArrayLoopPure!0 (_1!7047 lt!233543) arr!237 from!447 to!404))))

(assert (=> b!149644 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3036 (buf!3511 (_2!7049 lt!233519)))) ((_ sign_extend 32) (currentByte!6425 thiss!1634)) ((_ sign_extend 32) (currentBit!6420 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!233526 () Unit!9463)

(assert (=> b!149644 (= lt!233526 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3511 (_2!7049 lt!233519)) (bvsub to!404 from!447)))))

(assert (=> b!149644 (= (_2!7048 lt!233527) (select (arr!3820 arr!237) from!447))))

(assert (=> b!149644 (= lt!233527 (readBytePure!0 (_1!7047 lt!233543)))))

(assert (=> b!149644 (= lt!233533 (reader!0 (_2!7049 lt!233544) (_2!7049 lt!233519)))))

(assert (=> b!149644 (= lt!233543 (reader!0 thiss!1634 (_2!7049 lt!233519)))))

(declare-fun e!99921 () Bool)

(assert (=> b!149644 e!99921))

(declare-fun res!125361 () Bool)

(assert (=> b!149644 (=> (not res!125361) (not e!99921))))

(declare-fun lt!233537 () tuple2!13368)

(declare-fun lt!233539 () tuple2!13368)

(assert (=> b!149644 (= res!125361 (= (bitIndex!0 (size!3036 (buf!3511 (_1!7048 lt!233537))) (currentByte!6425 (_1!7048 lt!233537)) (currentBit!6420 (_1!7048 lt!233537))) (bitIndex!0 (size!3036 (buf!3511 (_1!7048 lt!233539))) (currentByte!6425 (_1!7048 lt!233539)) (currentBit!6420 (_1!7048 lt!233539)))))))

(declare-fun lt!233536 () Unit!9463)

(declare-fun lt!233542 () BitStream!5330)

(declare-fun readBytePrefixLemma!0 (BitStream!5330 BitStream!5330) Unit!9463)

(assert (=> b!149644 (= lt!233536 (readBytePrefixLemma!0 lt!233542 (_2!7049 lt!233519)))))

(assert (=> b!149644 (= lt!233539 (readBytePure!0 (BitStream!5331 (buf!3511 (_2!7049 lt!233519)) (currentByte!6425 thiss!1634) (currentBit!6420 thiss!1634))))))

(assert (=> b!149644 (= lt!233537 (readBytePure!0 lt!233542))))

(assert (=> b!149644 (= lt!233542 (BitStream!5331 (buf!3511 (_2!7049 lt!233544)) (currentByte!6425 thiss!1634) (currentBit!6420 thiss!1634)))))

(declare-fun e!99912 () Bool)

(assert (=> b!149644 e!99912))

(declare-fun res!125356 () Bool)

(assert (=> b!149644 (=> (not res!125356) (not e!99912))))

(assert (=> b!149644 (= res!125356 (isPrefixOf!0 thiss!1634 (_2!7049 lt!233519)))))

(declare-fun lt!233530 () Unit!9463)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5330 BitStream!5330 BitStream!5330) Unit!9463)

(assert (=> b!149644 (= lt!233530 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!7049 lt!233544) (_2!7049 lt!233519)))))

(assert (=> b!149644 e!99916))

(declare-fun res!125358 () Bool)

(assert (=> b!149644 (=> (not res!125358) (not e!99916))))

(assert (=> b!149644 (= res!125358 (= (size!3036 (buf!3511 (_2!7049 lt!233544))) (size!3036 (buf!3511 (_2!7049 lt!233519)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5330 array!6708 (_ BitVec 32) (_ BitVec 32)) tuple2!13370)

(assert (=> b!149644 (= lt!233519 (appendByteArrayLoop!0 (_2!7049 lt!233544) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!149644 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3036 (buf!3511 (_2!7049 lt!233544)))) ((_ sign_extend 32) (currentByte!6425 (_2!7049 lt!233544))) ((_ sign_extend 32) (currentBit!6420 (_2!7049 lt!233544))) lt!233528)))

(assert (=> b!149644 (= lt!233528 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!233520 () Unit!9463)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5330 BitStream!5330 (_ BitVec 64) (_ BitVec 32)) Unit!9463)

(assert (=> b!149644 (= lt!233520 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!7049 lt!233544) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!149644 e!99919))

(declare-fun res!125367 () Bool)

(assert (=> b!149644 (=> (not res!125367) (not e!99919))))

(assert (=> b!149644 (= res!125367 (= (size!3036 (buf!3511 thiss!1634)) (size!3036 (buf!3511 (_2!7049 lt!233544)))))))

(declare-fun appendByte!0 (BitStream!5330 (_ BitVec 8)) tuple2!13370)

(assert (=> b!149644 (= lt!233544 (appendByte!0 thiss!1634 (select (arr!3820 arr!237) from!447)))))

(declare-fun res!125355 () Bool)

(assert (=> start!28786 (=> (not res!125355) (not e!99915))))

(assert (=> start!28786 (= res!125355 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3036 arr!237))))))

(assert (=> start!28786 e!99915))

(assert (=> start!28786 true))

(declare-fun array_inv!2825 (array!6708) Bool)

(assert (=> start!28786 (array_inv!2825 arr!237)))

(declare-fun e!99913 () Bool)

(declare-fun inv!12 (BitStream!5330) Bool)

(assert (=> start!28786 (and (inv!12 thiss!1634) e!99913)))

(declare-fun b!149645 () Bool)

(assert (=> b!149645 (= e!99913 (array_inv!2825 (buf!3511 thiss!1634)))))

(declare-fun b!149646 () Bool)

(assert (=> b!149646 (= e!99920 e!99911)))

(declare-fun res!125364 () Bool)

(assert (=> b!149646 (=> res!125364 e!99911)))

(assert (=> b!149646 (= res!125364 (not (= (size!3036 (buf!3511 thiss!1634)) (size!3036 (buf!3511 (_2!7049 lt!233519))))))))

(assert (=> b!149646 (arrayRangesEq!352 arr!237 (_2!7050 lt!233532) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!233538 () Unit!9463)

(declare-fun arrayRangesEqTransitive!67 (array!6708 array!6708 array!6708 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9463)

(assert (=> b!149646 (= lt!233538 (arrayRangesEqTransitive!67 arr!237 (_2!7050 lt!233547) (_2!7050 lt!233532) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!149646 (arrayRangesEq!352 (_2!7050 lt!233547) (_2!7050 lt!233532) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!233518 () Unit!9463)

(declare-fun arrayRangesEqSymmetricLemma!84 (array!6708 array!6708 (_ BitVec 32) (_ BitVec 32)) Unit!9463)

(assert (=> b!149646 (= lt!233518 (arrayRangesEqSymmetricLemma!84 (_2!7050 lt!233532) (_2!7050 lt!233547) #b00000000000000000000000000000000 to!404))))

(declare-fun b!149647 () Bool)

(declare-fun res!125366 () Bool)

(assert (=> b!149647 (=> (not res!125366) (not e!99915))))

(assert (=> b!149647 (= res!125366 (bvslt from!447 to!404))))

(declare-fun b!149648 () Bool)

(declare-fun res!125359 () Bool)

(assert (=> b!149648 (=> (not res!125359) (not e!99915))))

(assert (=> b!149648 (= res!125359 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3036 (buf!3511 thiss!1634))) ((_ sign_extend 32) (currentByte!6425 thiss!1634)) ((_ sign_extend 32) (currentBit!6420 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!149649 () Bool)

(declare-fun res!125363 () Bool)

(assert (=> b!149649 (=> (not res!125363) (not e!99917))))

(assert (=> b!149649 (= res!125363 (isPrefixOf!0 (_2!7049 lt!233544) (_2!7049 lt!233519)))))

(declare-fun b!149650 () Bool)

(assert (=> b!149650 (= e!99912 (invariant!0 (currentBit!6420 thiss!1634) (currentByte!6425 thiss!1634) (size!3036 (buf!3511 (_2!7049 lt!233544)))))))

(declare-fun b!149651 () Bool)

(assert (=> b!149651 (= e!99921 (= (_2!7048 lt!233537) (_2!7048 lt!233539)))))

(assert (= (and start!28786 res!125355) b!149648))

(assert (= (and b!149648 res!125359) b!149647))

(assert (= (and b!149647 res!125366) b!149637))

(assert (= (and b!149637 res!125365) b!149644))

(assert (= (and b!149644 res!125367) b!149642))

(assert (= (and b!149642 res!125368) b!149639))

(assert (= (and b!149639 res!125357) b!149636))

(assert (= (and b!149644 res!125358) b!149643))

(assert (= (and b!149643 res!125369) b!149649))

(assert (= (and b!149649 res!125363) b!149638))

(assert (= (and b!149638 (not res!125360)) b!149640))

(assert (= (and b!149644 res!125356) b!149650))

(assert (= (and b!149644 res!125361) b!149651))

(assert (= (and b!149644 (not res!125362)) b!149646))

(assert (= (and b!149646 (not res!125364)) b!149641))

(assert (= start!28786 b!149645))

(declare-fun m!232911 () Bool)

(assert (=> b!149642 m!232911))

(declare-fun m!232913 () Bool)

(assert (=> b!149642 m!232913))

(declare-fun m!232915 () Bool)

(assert (=> b!149643 m!232915))

(assert (=> b!149643 m!232911))

(declare-fun m!232917 () Bool)

(assert (=> b!149640 m!232917))

(declare-fun m!232919 () Bool)

(assert (=> b!149636 m!232919))

(declare-fun m!232921 () Bool)

(assert (=> b!149636 m!232921))

(declare-fun m!232923 () Bool)

(assert (=> b!149636 m!232923))

(declare-fun m!232925 () Bool)

(assert (=> b!149649 m!232925))

(declare-fun m!232927 () Bool)

(assert (=> b!149638 m!232927))

(declare-fun m!232929 () Bool)

(assert (=> b!149638 m!232929))

(declare-fun m!232931 () Bool)

(assert (=> b!149638 m!232931))

(declare-fun m!232933 () Bool)

(assert (=> b!149638 m!232933))

(declare-fun m!232935 () Bool)

(assert (=> b!149648 m!232935))

(declare-fun m!232937 () Bool)

(assert (=> b!149646 m!232937))

(declare-fun m!232939 () Bool)

(assert (=> b!149646 m!232939))

(declare-fun m!232941 () Bool)

(assert (=> b!149646 m!232941))

(declare-fun m!232943 () Bool)

(assert (=> b!149646 m!232943))

(declare-fun m!232945 () Bool)

(assert (=> b!149637 m!232945))

(declare-fun m!232947 () Bool)

(assert (=> b!149639 m!232947))

(declare-fun m!232949 () Bool)

(assert (=> start!28786 m!232949))

(declare-fun m!232951 () Bool)

(assert (=> start!28786 m!232951))

(assert (=> b!149641 m!232913))

(declare-fun m!232953 () Bool)

(assert (=> b!149645 m!232953))

(declare-fun m!232955 () Bool)

(assert (=> b!149650 m!232955))

(declare-fun m!232957 () Bool)

(assert (=> b!149644 m!232957))

(declare-fun m!232959 () Bool)

(assert (=> b!149644 m!232959))

(declare-fun m!232961 () Bool)

(assert (=> b!149644 m!232961))

(declare-fun m!232963 () Bool)

(assert (=> b!149644 m!232963))

(declare-fun m!232965 () Bool)

(assert (=> b!149644 m!232965))

(declare-fun m!232967 () Bool)

(assert (=> b!149644 m!232967))

(declare-fun m!232969 () Bool)

(assert (=> b!149644 m!232969))

(declare-fun m!232971 () Bool)

(assert (=> b!149644 m!232971))

(declare-fun m!232973 () Bool)

(assert (=> b!149644 m!232973))

(declare-fun m!232975 () Bool)

(assert (=> b!149644 m!232975))

(declare-fun m!232977 () Bool)

(assert (=> b!149644 m!232977))

(assert (=> b!149644 m!232919))

(declare-fun m!232979 () Bool)

(assert (=> b!149644 m!232979))

(declare-fun m!232981 () Bool)

(assert (=> b!149644 m!232981))

(declare-fun m!232983 () Bool)

(assert (=> b!149644 m!232983))

(declare-fun m!232985 () Bool)

(assert (=> b!149644 m!232985))

(declare-fun m!232987 () Bool)

(assert (=> b!149644 m!232987))

(declare-fun m!232989 () Bool)

(assert (=> b!149644 m!232989))

(declare-fun m!232991 () Bool)

(assert (=> b!149644 m!232991))

(declare-fun m!232993 () Bool)

(assert (=> b!149644 m!232993))

(assert (=> b!149644 m!232933))

(assert (=> b!149644 m!232981))

(declare-fun m!232995 () Bool)

(assert (=> b!149644 m!232995))

(declare-fun m!232997 () Bool)

(assert (=> b!149644 m!232997))

(declare-fun m!232999 () Bool)

(assert (=> b!149644 m!232999))

(declare-fun m!233001 () Bool)

(assert (=> b!149644 m!233001))

(assert (=> b!149644 m!232919))

(declare-fun m!233003 () Bool)

(assert (=> b!149644 m!233003))

(declare-fun m!233005 () Bool)

(assert (=> b!149644 m!233005))

(push 1)

(assert (not b!149648))

(assert (not b!149636))

(assert (not b!149650))

(assert (not b!149640))

(assert (not start!28786))

(assert (not b!149638))

(assert (not b!149643))

(assert (not b!149645))

(assert (not b!149649))

(assert (not b!149644))

(assert (not b!149641))

(assert (not b!149646))

(assert (not b!149639))

(assert (not b!149637))

(assert (not b!149642))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!48620 () Bool)

(declare-fun e!99963 () Bool)

(assert (=> d!48620 e!99963))

(declare-fun res!125432 () Bool)

(assert (=> d!48620 (=> (not res!125432) (not e!99963))))

(declare-fun lt!233748 () (_ BitVec 64))

(declare-fun lt!233750 () (_ BitVec 64))

(declare-fun lt!233746 () (_ BitVec 64))

(assert (=> d!48620 (= res!125432 (= lt!233746 (bvsub lt!233750 lt!233748)))))

(assert (=> d!48620 (or (= (bvand lt!233750 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!233748 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!233750 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!233750 lt!233748) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!48620 (= lt!233748 (remainingBits!0 ((_ sign_extend 32) (size!3036 (buf!3511 thiss!1634))) ((_ sign_extend 32) (currentByte!6425 thiss!1634)) ((_ sign_extend 32) (currentBit!6420 thiss!1634))))))

(declare-fun lt!233751 () (_ BitVec 64))

(declare-fun lt!233749 () (_ BitVec 64))

(assert (=> d!48620 (= lt!233750 (bvmul lt!233751 lt!233749))))

(assert (=> d!48620 (or (= lt!233751 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!233749 (bvsdiv (bvmul lt!233751 lt!233749) lt!233751)))))

(assert (=> d!48620 (= lt!233749 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48620 (= lt!233751 ((_ sign_extend 32) (size!3036 (buf!3511 thiss!1634))))))

(assert (=> d!48620 (= lt!233746 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6425 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6420 thiss!1634))))))

(assert (=> d!48620 (invariant!0 (currentBit!6420 thiss!1634) (currentByte!6425 thiss!1634) (size!3036 (buf!3511 thiss!1634)))))

(assert (=> d!48620 (= (bitIndex!0 (size!3036 (buf!3511 thiss!1634)) (currentByte!6425 thiss!1634) (currentBit!6420 thiss!1634)) lt!233746)))

(declare-fun b!149722 () Bool)

(declare-fun res!125433 () Bool)

(assert (=> b!149722 (=> (not res!125433) (not e!99963))))

(assert (=> b!149722 (= res!125433 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!233746))))

(declare-fun b!149723 () Bool)

(declare-fun lt!233747 () (_ BitVec 64))

(assert (=> b!149723 (= e!99963 (bvsle lt!233746 (bvmul lt!233747 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!149723 (or (= lt!233747 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!233747 #b0000000000000000000000000000000000000000000000000000000000001000) lt!233747)))))

(assert (=> b!149723 (= lt!233747 ((_ sign_extend 32) (size!3036 (buf!3511 thiss!1634))))))

(assert (= (and d!48620 res!125432) b!149722))

(assert (= (and b!149722 res!125433) b!149723))

(declare-fun m!233147 () Bool)

(assert (=> d!48620 m!233147))

(assert (=> d!48620 m!232945))

(assert (=> b!149641 d!48620))

(declare-fun d!48626 () Bool)

(declare-fun res!125438 () Bool)

(declare-fun e!99968 () Bool)

(assert (=> d!48626 (=> res!125438 e!99968)))

(assert (=> d!48626 (= res!125438 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!48626 (= (arrayRangesEq!352 arr!237 (_2!7050 lt!233523) #b00000000000000000000000000000000 to!404) e!99968)))

(declare-fun b!149728 () Bool)

(declare-fun e!99969 () Bool)

(assert (=> b!149728 (= e!99968 e!99969)))

(declare-fun res!125439 () Bool)

(assert (=> b!149728 (=> (not res!125439) (not e!99969))))

(assert (=> b!149728 (= res!125439 (= (select (arr!3820 arr!237) #b00000000000000000000000000000000) (select (arr!3820 (_2!7050 lt!233523)) #b00000000000000000000000000000000)))))

(declare-fun b!149729 () Bool)

(assert (=> b!149729 (= e!99969 (arrayRangesEq!352 arr!237 (_2!7050 lt!233523) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48626 (not res!125438)) b!149728))

(assert (= (and b!149728 res!125439) b!149729))

(declare-fun m!233149 () Bool)

(assert (=> b!149728 m!233149))

(declare-fun m!233151 () Bool)

(assert (=> b!149728 m!233151))

(declare-fun m!233153 () Bool)

(assert (=> b!149729 m!233153))

(assert (=> b!149640 d!48626))

(declare-fun d!48628 () Bool)

(declare-fun e!99970 () Bool)

(assert (=> d!48628 e!99970))

(declare-fun res!125440 () Bool)

(assert (=> d!48628 (=> (not res!125440) (not e!99970))))

(declare-fun lt!233756 () (_ BitVec 64))

(declare-fun lt!233754 () (_ BitVec 64))

(declare-fun lt!233752 () (_ BitVec 64))

(assert (=> d!48628 (= res!125440 (= lt!233752 (bvsub lt!233756 lt!233754)))))

(assert (=> d!48628 (or (= (bvand lt!233756 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!233754 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!233756 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!233756 lt!233754) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48628 (= lt!233754 (remainingBits!0 ((_ sign_extend 32) (size!3036 (buf!3511 (_2!7049 lt!233544)))) ((_ sign_extend 32) (currentByte!6425 (_2!7049 lt!233544))) ((_ sign_extend 32) (currentBit!6420 (_2!7049 lt!233544)))))))

(declare-fun lt!233757 () (_ BitVec 64))

(declare-fun lt!233755 () (_ BitVec 64))

(assert (=> d!48628 (= lt!233756 (bvmul lt!233757 lt!233755))))

(assert (=> d!48628 (or (= lt!233757 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!233755 (bvsdiv (bvmul lt!233757 lt!233755) lt!233757)))))

(assert (=> d!48628 (= lt!233755 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48628 (= lt!233757 ((_ sign_extend 32) (size!3036 (buf!3511 (_2!7049 lt!233544)))))))

(assert (=> d!48628 (= lt!233752 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6425 (_2!7049 lt!233544))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6420 (_2!7049 lt!233544)))))))

(assert (=> d!48628 (invariant!0 (currentBit!6420 (_2!7049 lt!233544)) (currentByte!6425 (_2!7049 lt!233544)) (size!3036 (buf!3511 (_2!7049 lt!233544))))))

(assert (=> d!48628 (= (bitIndex!0 (size!3036 (buf!3511 (_2!7049 lt!233544))) (currentByte!6425 (_2!7049 lt!233544)) (currentBit!6420 (_2!7049 lt!233544))) lt!233752)))

(declare-fun b!149730 () Bool)

(declare-fun res!125441 () Bool)

(assert (=> b!149730 (=> (not res!125441) (not e!99970))))

(assert (=> b!149730 (= res!125441 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!233752))))

(declare-fun b!149731 () Bool)

(declare-fun lt!233753 () (_ BitVec 64))

(assert (=> b!149731 (= e!99970 (bvsle lt!233752 (bvmul lt!233753 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!149731 (or (= lt!233753 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!233753 #b0000000000000000000000000000000000000000000000000000000000001000) lt!233753)))))

(assert (=> b!149731 (= lt!233753 ((_ sign_extend 32) (size!3036 (buf!3511 (_2!7049 lt!233544)))))))

(assert (= (and d!48628 res!125440) b!149730))

(assert (= (and b!149730 res!125441) b!149731))

(declare-fun m!233155 () Bool)

(assert (=> d!48628 m!233155))

(declare-fun m!233157 () Bool)

(assert (=> d!48628 m!233157))

(assert (=> b!149642 d!48628))

(assert (=> b!149642 d!48620))

(declare-datatypes ((tuple3!584 0))(
  ( (tuple3!585 (_1!7053 Unit!9463) (_2!7053 BitStream!5330) (_3!365 array!6708)) )
))
(declare-fun lt!233760 () tuple3!584)

(declare-fun d!48630 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!5330 array!6708 (_ BitVec 32) (_ BitVec 32)) tuple3!584)

(assert (=> d!48630 (= lt!233760 (readByteArrayLoop!0 (_1!7047 lt!233529) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!48630 (= (readByteArrayLoopPure!0 (_1!7047 lt!233529) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13373 (_2!7053 lt!233760) (_3!365 lt!233760)))))

(declare-fun bs!11874 () Bool)

(assert (= bs!11874 d!48630))

(declare-fun m!233159 () Bool)

(assert (=> bs!11874 m!233159))

(assert (=> b!149638 d!48630))

(declare-fun d!48632 () Bool)

(assert (=> d!48632 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3036 (buf!3511 (_2!7049 lt!233519)))) ((_ sign_extend 32) (currentByte!6425 (_2!7049 lt!233544))) ((_ sign_extend 32) (currentBit!6420 (_2!7049 lt!233544))) lt!233545) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3036 (buf!3511 (_2!7049 lt!233519)))) ((_ sign_extend 32) (currentByte!6425 (_2!7049 lt!233544))) ((_ sign_extend 32) (currentBit!6420 (_2!7049 lt!233544)))) lt!233545))))

(declare-fun bs!11875 () Bool)

(assert (= bs!11875 d!48632))

(declare-fun m!233161 () Bool)

(assert (=> bs!11875 m!233161))

(assert (=> b!149638 d!48632))

(declare-fun d!48634 () Bool)

(assert (=> d!48634 (validate_offset_bits!1 ((_ sign_extend 32) (size!3036 (buf!3511 (_2!7049 lt!233519)))) ((_ sign_extend 32) (currentByte!6425 (_2!7049 lt!233544))) ((_ sign_extend 32) (currentBit!6420 (_2!7049 lt!233544))) lt!233545)))

(declare-fun lt!233763 () Unit!9463)

(declare-fun choose!9 (BitStream!5330 array!6708 (_ BitVec 64) BitStream!5330) Unit!9463)

(assert (=> d!48634 (= lt!233763 (choose!9 (_2!7049 lt!233544) (buf!3511 (_2!7049 lt!233519)) lt!233545 (BitStream!5331 (buf!3511 (_2!7049 lt!233519)) (currentByte!6425 (_2!7049 lt!233544)) (currentBit!6420 (_2!7049 lt!233544)))))))

(assert (=> d!48634 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!7049 lt!233544) (buf!3511 (_2!7049 lt!233519)) lt!233545) lt!233763)))

(declare-fun bs!11876 () Bool)

(assert (= bs!11876 d!48634))

(assert (=> bs!11876 m!232929))

(declare-fun m!233163 () Bool)

(assert (=> bs!11876 m!233163))

(assert (=> b!149638 d!48634))

(declare-fun b!149742 () Bool)

(declare-fun res!125448 () Bool)

(declare-fun e!99976 () Bool)

(assert (=> b!149742 (=> (not res!125448) (not e!99976))))

(declare-fun lt!233815 () tuple2!13366)

(assert (=> b!149742 (= res!125448 (isPrefixOf!0 (_2!7047 lt!233815) (_2!7049 lt!233519)))))

(declare-fun b!149744 () Bool)

(declare-fun e!99975 () Unit!9463)

(declare-fun lt!233811 () Unit!9463)

(assert (=> b!149744 (= e!99975 lt!233811)))

(declare-fun lt!233817 () (_ BitVec 64))

(assert (=> b!149744 (= lt!233817 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!233810 () (_ BitVec 64))

(assert (=> b!149744 (= lt!233810 (bitIndex!0 (size!3036 (buf!3511 (_2!7049 lt!233544))) (currentByte!6425 (_2!7049 lt!233544)) (currentBit!6420 (_2!7049 lt!233544))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6708 array!6708 (_ BitVec 64) (_ BitVec 64)) Unit!9463)

(assert (=> b!149744 (= lt!233811 (arrayBitRangesEqSymmetric!0 (buf!3511 (_2!7049 lt!233544)) (buf!3511 (_2!7049 lt!233519)) lt!233817 lt!233810))))

(declare-fun arrayBitRangesEq!0 (array!6708 array!6708 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!149744 (arrayBitRangesEq!0 (buf!3511 (_2!7049 lt!233519)) (buf!3511 (_2!7049 lt!233544)) lt!233817 lt!233810)))

(declare-fun lt!233821 () (_ BitVec 64))

(declare-fun lt!233805 () (_ BitVec 64))

(declare-fun b!149745 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!5330 (_ BitVec 64)) BitStream!5330)

(assert (=> b!149745 (= e!99976 (= (_1!7047 lt!233815) (withMovedBitIndex!0 (_2!7047 lt!233815) (bvsub lt!233821 lt!233805))))))

(assert (=> b!149745 (or (= (bvand lt!233821 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!233805 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!233821 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!233821 lt!233805) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!149745 (= lt!233805 (bitIndex!0 (size!3036 (buf!3511 (_2!7049 lt!233519))) (currentByte!6425 (_2!7049 lt!233519)) (currentBit!6420 (_2!7049 lt!233519))))))

(assert (=> b!149745 (= lt!233821 (bitIndex!0 (size!3036 (buf!3511 (_2!7049 lt!233544))) (currentByte!6425 (_2!7049 lt!233544)) (currentBit!6420 (_2!7049 lt!233544))))))

(declare-fun b!149746 () Bool)

(declare-fun Unit!9468 () Unit!9463)

(assert (=> b!149746 (= e!99975 Unit!9468)))

(declare-fun b!149743 () Bool)

(declare-fun res!125449 () Bool)

(assert (=> b!149743 (=> (not res!125449) (not e!99976))))

(assert (=> b!149743 (= res!125449 (isPrefixOf!0 (_1!7047 lt!233815) (_2!7049 lt!233544)))))

(declare-fun d!48636 () Bool)

(assert (=> d!48636 e!99976))

(declare-fun res!125450 () Bool)

(assert (=> d!48636 (=> (not res!125450) (not e!99976))))

(assert (=> d!48636 (= res!125450 (isPrefixOf!0 (_1!7047 lt!233815) (_2!7047 lt!233815)))))

(declare-fun lt!233808 () BitStream!5330)

(assert (=> d!48636 (= lt!233815 (tuple2!13367 lt!233808 (_2!7049 lt!233519)))))

(declare-fun lt!233819 () Unit!9463)

(declare-fun lt!233823 () Unit!9463)

(assert (=> d!48636 (= lt!233819 lt!233823)))

(assert (=> d!48636 (isPrefixOf!0 lt!233808 (_2!7049 lt!233519))))

(assert (=> d!48636 (= lt!233823 (lemmaIsPrefixTransitive!0 lt!233808 (_2!7049 lt!233519) (_2!7049 lt!233519)))))

(declare-fun lt!233813 () Unit!9463)

(declare-fun lt!233809 () Unit!9463)

(assert (=> d!48636 (= lt!233813 lt!233809)))

(assert (=> d!48636 (isPrefixOf!0 lt!233808 (_2!7049 lt!233519))))

(assert (=> d!48636 (= lt!233809 (lemmaIsPrefixTransitive!0 lt!233808 (_2!7049 lt!233544) (_2!7049 lt!233519)))))

(declare-fun lt!233818 () Unit!9463)

(assert (=> d!48636 (= lt!233818 e!99975)))

(declare-fun c!8048 () Bool)

(assert (=> d!48636 (= c!8048 (not (= (size!3036 (buf!3511 (_2!7049 lt!233544))) #b00000000000000000000000000000000)))))

(declare-fun lt!233814 () Unit!9463)

(declare-fun lt!233812 () Unit!9463)

(assert (=> d!48636 (= lt!233814 lt!233812)))

(assert (=> d!48636 (isPrefixOf!0 (_2!7049 lt!233519) (_2!7049 lt!233519))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5330) Unit!9463)

(assert (=> d!48636 (= lt!233812 (lemmaIsPrefixRefl!0 (_2!7049 lt!233519)))))

(declare-fun lt!233806 () Unit!9463)

(declare-fun lt!233804 () Unit!9463)

(assert (=> d!48636 (= lt!233806 lt!233804)))

(assert (=> d!48636 (= lt!233804 (lemmaIsPrefixRefl!0 (_2!7049 lt!233519)))))

(declare-fun lt!233822 () Unit!9463)

(declare-fun lt!233820 () Unit!9463)

(assert (=> d!48636 (= lt!233822 lt!233820)))

(assert (=> d!48636 (isPrefixOf!0 lt!233808 lt!233808)))

(assert (=> d!48636 (= lt!233820 (lemmaIsPrefixRefl!0 lt!233808))))

(declare-fun lt!233807 () Unit!9463)

(declare-fun lt!233816 () Unit!9463)

(assert (=> d!48636 (= lt!233807 lt!233816)))

(assert (=> d!48636 (isPrefixOf!0 (_2!7049 lt!233544) (_2!7049 lt!233544))))

(assert (=> d!48636 (= lt!233816 (lemmaIsPrefixRefl!0 (_2!7049 lt!233544)))))

(assert (=> d!48636 (= lt!233808 (BitStream!5331 (buf!3511 (_2!7049 lt!233519)) (currentByte!6425 (_2!7049 lt!233544)) (currentBit!6420 (_2!7049 lt!233544))))))

(assert (=> d!48636 (isPrefixOf!0 (_2!7049 lt!233544) (_2!7049 lt!233519))))

(assert (=> d!48636 (= (reader!0 (_2!7049 lt!233544) (_2!7049 lt!233519)) lt!233815)))

(assert (= (and d!48636 c!8048) b!149744))

(assert (= (and d!48636 (not c!8048)) b!149746))

(assert (= (and d!48636 res!125450) b!149743))

(assert (= (and b!149743 res!125449) b!149742))

(assert (= (and b!149742 res!125448) b!149745))

(declare-fun m!233165 () Bool)

(assert (=> b!149742 m!233165))

(assert (=> b!149744 m!232911))

(declare-fun m!233167 () Bool)

(assert (=> b!149744 m!233167))

(declare-fun m!233169 () Bool)

(assert (=> b!149744 m!233169))

(declare-fun m!233171 () Bool)

(assert (=> d!48636 m!233171))

(declare-fun m!233173 () Bool)

(assert (=> d!48636 m!233173))

(declare-fun m!233175 () Bool)

(assert (=> d!48636 m!233175))

(declare-fun m!233177 () Bool)

(assert (=> d!48636 m!233177))

(declare-fun m!233179 () Bool)

(assert (=> d!48636 m!233179))

(declare-fun m!233181 () Bool)

(assert (=> d!48636 m!233181))

(assert (=> d!48636 m!232925))

(declare-fun m!233183 () Bool)

(assert (=> d!48636 m!233183))

(declare-fun m!233185 () Bool)

(assert (=> d!48636 m!233185))

(declare-fun m!233187 () Bool)

(assert (=> d!48636 m!233187))

(declare-fun m!233189 () Bool)

(assert (=> d!48636 m!233189))

(declare-fun m!233191 () Bool)

(assert (=> b!149743 m!233191))

(declare-fun m!233193 () Bool)

(assert (=> b!149745 m!233193))

(assert (=> b!149745 m!232915))

(assert (=> b!149745 m!232911))

(assert (=> b!149638 d!48636))

(declare-fun d!48638 () Bool)

(declare-fun res!125469 () Bool)

(declare-fun e!99988 () Bool)

(assert (=> d!48638 (=> (not res!125469) (not e!99988))))

(assert (=> d!48638 (= res!125469 (= (size!3036 (buf!3511 (_2!7049 lt!233544))) (size!3036 (buf!3511 (_2!7049 lt!233519)))))))

(assert (=> d!48638 (= (isPrefixOf!0 (_2!7049 lt!233544) (_2!7049 lt!233519)) e!99988)))

(declare-fun b!149763 () Bool)

(declare-fun res!125467 () Bool)

(assert (=> b!149763 (=> (not res!125467) (not e!99988))))

(assert (=> b!149763 (= res!125467 (bvsle (bitIndex!0 (size!3036 (buf!3511 (_2!7049 lt!233544))) (currentByte!6425 (_2!7049 lt!233544)) (currentBit!6420 (_2!7049 lt!233544))) (bitIndex!0 (size!3036 (buf!3511 (_2!7049 lt!233519))) (currentByte!6425 (_2!7049 lt!233519)) (currentBit!6420 (_2!7049 lt!233519)))))))

(declare-fun b!149764 () Bool)

(declare-fun e!99987 () Bool)

(assert (=> b!149764 (= e!99988 e!99987)))

(declare-fun res!125468 () Bool)

(assert (=> b!149764 (=> res!125468 e!99987)))

(assert (=> b!149764 (= res!125468 (= (size!3036 (buf!3511 (_2!7049 lt!233544))) #b00000000000000000000000000000000))))

(declare-fun b!149765 () Bool)

(assert (=> b!149765 (= e!99987 (arrayBitRangesEq!0 (buf!3511 (_2!7049 lt!233544)) (buf!3511 (_2!7049 lt!233519)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3036 (buf!3511 (_2!7049 lt!233544))) (currentByte!6425 (_2!7049 lt!233544)) (currentBit!6420 (_2!7049 lt!233544)))))))

(assert (= (and d!48638 res!125469) b!149763))

(assert (= (and b!149763 res!125467) b!149764))

(assert (= (and b!149764 (not res!125468)) b!149765))

(assert (=> b!149763 m!232911))

(assert (=> b!149763 m!232915))

(assert (=> b!149765 m!232911))

(assert (=> b!149765 m!232911))

(declare-fun m!233195 () Bool)

(assert (=> b!149765 m!233195))

(assert (=> b!149649 d!48638))

(declare-fun d!48640 () Bool)

(assert (=> d!48640 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3036 (buf!3511 thiss!1634))) ((_ sign_extend 32) (currentByte!6425 thiss!1634)) ((_ sign_extend 32) (currentBit!6420 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3036 (buf!3511 thiss!1634))) ((_ sign_extend 32) (currentByte!6425 thiss!1634)) ((_ sign_extend 32) (currentBit!6420 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11877 () Bool)

(assert (= bs!11877 d!48640))

(assert (=> bs!11877 m!233147))

(assert (=> b!149648 d!48640))

(declare-fun d!48642 () Bool)

(assert (=> d!48642 (= (invariant!0 (currentBit!6420 thiss!1634) (currentByte!6425 thiss!1634) (size!3036 (buf!3511 (_2!7049 lt!233544)))) (and (bvsge (currentBit!6420 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6420 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6425 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6425 thiss!1634) (size!3036 (buf!3511 (_2!7049 lt!233544)))) (and (= (currentBit!6420 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6425 thiss!1634) (size!3036 (buf!3511 (_2!7049 lt!233544))))))))))

(assert (=> b!149650 d!48642))

(declare-fun d!48650 () Bool)

(declare-fun res!125477 () Bool)

(declare-fun e!99993 () Bool)

(assert (=> d!48650 (=> (not res!125477) (not e!99993))))

(assert (=> d!48650 (= res!125477 (= (size!3036 (buf!3511 thiss!1634)) (size!3036 (buf!3511 (_2!7049 lt!233544)))))))

(assert (=> d!48650 (= (isPrefixOf!0 thiss!1634 (_2!7049 lt!233544)) e!99993)))

(declare-fun b!149771 () Bool)

(declare-fun res!125475 () Bool)

(assert (=> b!149771 (=> (not res!125475) (not e!99993))))

(assert (=> b!149771 (= res!125475 (bvsle (bitIndex!0 (size!3036 (buf!3511 thiss!1634)) (currentByte!6425 thiss!1634) (currentBit!6420 thiss!1634)) (bitIndex!0 (size!3036 (buf!3511 (_2!7049 lt!233544))) (currentByte!6425 (_2!7049 lt!233544)) (currentBit!6420 (_2!7049 lt!233544)))))))

(declare-fun b!149772 () Bool)

(declare-fun e!99992 () Bool)

(assert (=> b!149772 (= e!99993 e!99992)))

(declare-fun res!125476 () Bool)

(assert (=> b!149772 (=> res!125476 e!99992)))

(assert (=> b!149772 (= res!125476 (= (size!3036 (buf!3511 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!149773 () Bool)

(assert (=> b!149773 (= e!99992 (arrayBitRangesEq!0 (buf!3511 thiss!1634) (buf!3511 (_2!7049 lt!233544)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3036 (buf!3511 thiss!1634)) (currentByte!6425 thiss!1634) (currentBit!6420 thiss!1634))))))

(assert (= (and d!48650 res!125477) b!149771))

(assert (= (and b!149771 res!125475) b!149772))

(assert (= (and b!149772 (not res!125476)) b!149773))

(assert (=> b!149771 m!232913))

(assert (=> b!149771 m!232911))

(assert (=> b!149773 m!232913))

(assert (=> b!149773 m!232913))

(declare-fun m!233217 () Bool)

(assert (=> b!149773 m!233217))

(assert (=> b!149639 d!48650))

(declare-fun d!48654 () Bool)

(declare-fun res!125481 () Bool)

(declare-fun e!99996 () Bool)

(assert (=> d!48654 (=> res!125481 e!99996)))

(assert (=> d!48654 (= res!125481 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!48654 (= (arrayRangesEq!352 arr!237 (_2!7050 lt!233532) #b00000000000000000000000000000000 to!404) e!99996)))

(declare-fun b!149777 () Bool)

(declare-fun e!99997 () Bool)

(assert (=> b!149777 (= e!99996 e!99997)))

(declare-fun res!125482 () Bool)

(assert (=> b!149777 (=> (not res!125482) (not e!99997))))

(assert (=> b!149777 (= res!125482 (= (select (arr!3820 arr!237) #b00000000000000000000000000000000) (select (arr!3820 (_2!7050 lt!233532)) #b00000000000000000000000000000000)))))

(declare-fun b!149778 () Bool)

(assert (=> b!149778 (= e!99997 (arrayRangesEq!352 arr!237 (_2!7050 lt!233532) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48654 (not res!125481)) b!149777))

(assert (= (and b!149777 res!125482) b!149778))

(assert (=> b!149777 m!233149))

(declare-fun m!233223 () Bool)

(assert (=> b!149777 m!233223))

(declare-fun m!233225 () Bool)

(assert (=> b!149778 m!233225))

(assert (=> b!149646 d!48654))

(declare-fun d!48660 () Bool)

(assert (=> d!48660 (arrayRangesEq!352 arr!237 (_2!7050 lt!233532) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!233875 () Unit!9463)

(declare-fun choose!88 (array!6708 array!6708 array!6708 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9463)

(assert (=> d!48660 (= lt!233875 (choose!88 arr!237 (_2!7050 lt!233547) (_2!7050 lt!233532) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> d!48660 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 to!404) (bvsle to!404 to!404))))

(assert (=> d!48660 (= (arrayRangesEqTransitive!67 arr!237 (_2!7050 lt!233547) (_2!7050 lt!233532) #b00000000000000000000000000000000 to!404 to!404) lt!233875)))

(declare-fun bs!11881 () Bool)

(assert (= bs!11881 d!48660))

(assert (=> bs!11881 m!232937))

(declare-fun m!233253 () Bool)

(assert (=> bs!11881 m!233253))

(assert (=> b!149646 d!48660))

(declare-fun d!48666 () Bool)

(declare-fun res!125488 () Bool)

(declare-fun e!100002 () Bool)

(assert (=> d!48666 (=> res!125488 e!100002)))

(assert (=> d!48666 (= res!125488 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!48666 (= (arrayRangesEq!352 (_2!7050 lt!233547) (_2!7050 lt!233532) #b00000000000000000000000000000000 to!404) e!100002)))

(declare-fun b!149786 () Bool)

(declare-fun e!100003 () Bool)

(assert (=> b!149786 (= e!100002 e!100003)))

(declare-fun res!125489 () Bool)

(assert (=> b!149786 (=> (not res!125489) (not e!100003))))

(assert (=> b!149786 (= res!125489 (= (select (arr!3820 (_2!7050 lt!233547)) #b00000000000000000000000000000000) (select (arr!3820 (_2!7050 lt!233532)) #b00000000000000000000000000000000)))))

(declare-fun b!149787 () Bool)

(assert (=> b!149787 (= e!100003 (arrayRangesEq!352 (_2!7050 lt!233547) (_2!7050 lt!233532) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48666 (not res!125488)) b!149786))

(assert (= (and b!149786 res!125489) b!149787))

(declare-fun m!233255 () Bool)

(assert (=> b!149786 m!233255))

(assert (=> b!149786 m!233223))

(declare-fun m!233257 () Bool)

(assert (=> b!149787 m!233257))

(assert (=> b!149646 d!48666))

(declare-fun d!48668 () Bool)

(assert (=> d!48668 (arrayRangesEq!352 (_2!7050 lt!233547) (_2!7050 lt!233532) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!233881 () Unit!9463)

(declare-fun choose!89 (array!6708 array!6708 (_ BitVec 32) (_ BitVec 32)) Unit!9463)

(assert (=> d!48668 (= lt!233881 (choose!89 (_2!7050 lt!233532) (_2!7050 lt!233547) #b00000000000000000000000000000000 to!404))))

(assert (=> d!48668 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 to!404) (bvsle to!404 (size!3036 (_2!7050 lt!233532))))))

(assert (=> d!48668 (= (arrayRangesEqSymmetricLemma!84 (_2!7050 lt!233532) (_2!7050 lt!233547) #b00000000000000000000000000000000 to!404) lt!233881)))

(declare-fun bs!11883 () Bool)

(assert (= bs!11883 d!48668))

(assert (=> bs!11883 m!232941))

(declare-fun m!233263 () Bool)

(assert (=> bs!11883 m!233263))

(assert (=> b!149646 d!48668))

(declare-fun d!48674 () Bool)

(assert (=> d!48674 (= (invariant!0 (currentBit!6420 thiss!1634) (currentByte!6425 thiss!1634) (size!3036 (buf!3511 thiss!1634))) (and (bvsge (currentBit!6420 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6420 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6425 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6425 thiss!1634) (size!3036 (buf!3511 thiss!1634))) (and (= (currentBit!6420 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6425 thiss!1634) (size!3036 (buf!3511 thiss!1634)))))))))

(assert (=> b!149637 d!48674))

(declare-fun d!48676 () Bool)

(declare-datatypes ((tuple2!13376 0))(
  ( (tuple2!13377 (_1!7054 (_ BitVec 8)) (_2!7054 BitStream!5330)) )
))
(declare-fun lt!233888 () tuple2!13376)

(declare-fun readByte!0 (BitStream!5330) tuple2!13376)

(assert (=> d!48676 (= lt!233888 (readByte!0 (_1!7047 lt!233521)))))

(assert (=> d!48676 (= (readBytePure!0 (_1!7047 lt!233521)) (tuple2!13369 (_2!7054 lt!233888) (_1!7054 lt!233888)))))

(declare-fun bs!11886 () Bool)

(assert (= bs!11886 d!48676))

(declare-fun m!233269 () Bool)

(assert (=> bs!11886 m!233269))

(assert (=> b!149636 d!48676))

(declare-fun b!149790 () Bool)

(declare-fun res!125492 () Bool)

(declare-fun e!100007 () Bool)

(assert (=> b!149790 (=> (not res!125492) (not e!100007))))

(declare-fun lt!233900 () tuple2!13366)

(assert (=> b!149790 (= res!125492 (isPrefixOf!0 (_2!7047 lt!233900) (_2!7049 lt!233544)))))

(declare-fun b!149792 () Bool)

(declare-fun e!100006 () Unit!9463)

(declare-fun lt!233896 () Unit!9463)

(assert (=> b!149792 (= e!100006 lt!233896)))

(declare-fun lt!233902 () (_ BitVec 64))

(assert (=> b!149792 (= lt!233902 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!233895 () (_ BitVec 64))

(assert (=> b!149792 (= lt!233895 (bitIndex!0 (size!3036 (buf!3511 thiss!1634)) (currentByte!6425 thiss!1634) (currentBit!6420 thiss!1634)))))

(assert (=> b!149792 (= lt!233896 (arrayBitRangesEqSymmetric!0 (buf!3511 thiss!1634) (buf!3511 (_2!7049 lt!233544)) lt!233902 lt!233895))))

(assert (=> b!149792 (arrayBitRangesEq!0 (buf!3511 (_2!7049 lt!233544)) (buf!3511 thiss!1634) lt!233902 lt!233895)))

(declare-fun lt!233890 () (_ BitVec 64))

(declare-fun lt!233906 () (_ BitVec 64))

(declare-fun b!149793 () Bool)

(assert (=> b!149793 (= e!100007 (= (_1!7047 lt!233900) (withMovedBitIndex!0 (_2!7047 lt!233900) (bvsub lt!233906 lt!233890))))))

(assert (=> b!149793 (or (= (bvand lt!233906 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!233890 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!233906 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!233906 lt!233890) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!149793 (= lt!233890 (bitIndex!0 (size!3036 (buf!3511 (_2!7049 lt!233544))) (currentByte!6425 (_2!7049 lt!233544)) (currentBit!6420 (_2!7049 lt!233544))))))

(assert (=> b!149793 (= lt!233906 (bitIndex!0 (size!3036 (buf!3511 thiss!1634)) (currentByte!6425 thiss!1634) (currentBit!6420 thiss!1634)))))

(declare-fun b!149794 () Bool)

(declare-fun Unit!9469 () Unit!9463)

(assert (=> b!149794 (= e!100006 Unit!9469)))

(declare-fun b!149791 () Bool)

(declare-fun res!125493 () Bool)

(assert (=> b!149791 (=> (not res!125493) (not e!100007))))

(assert (=> b!149791 (= res!125493 (isPrefixOf!0 (_1!7047 lt!233900) thiss!1634))))

(declare-fun d!48682 () Bool)

(assert (=> d!48682 e!100007))

(declare-fun res!125494 () Bool)

(assert (=> d!48682 (=> (not res!125494) (not e!100007))))

(assert (=> d!48682 (= res!125494 (isPrefixOf!0 (_1!7047 lt!233900) (_2!7047 lt!233900)))))

(declare-fun lt!233893 () BitStream!5330)

(assert (=> d!48682 (= lt!233900 (tuple2!13367 lt!233893 (_2!7049 lt!233544)))))

(declare-fun lt!233904 () Unit!9463)

(declare-fun lt!233908 () Unit!9463)

(assert (=> d!48682 (= lt!233904 lt!233908)))

(assert (=> d!48682 (isPrefixOf!0 lt!233893 (_2!7049 lt!233544))))

(assert (=> d!48682 (= lt!233908 (lemmaIsPrefixTransitive!0 lt!233893 (_2!7049 lt!233544) (_2!7049 lt!233544)))))

(declare-fun lt!233898 () Unit!9463)

(declare-fun lt!233894 () Unit!9463)

(assert (=> d!48682 (= lt!233898 lt!233894)))

(assert (=> d!48682 (isPrefixOf!0 lt!233893 (_2!7049 lt!233544))))

(assert (=> d!48682 (= lt!233894 (lemmaIsPrefixTransitive!0 lt!233893 thiss!1634 (_2!7049 lt!233544)))))

(declare-fun lt!233903 () Unit!9463)

(assert (=> d!48682 (= lt!233903 e!100006)))

(declare-fun c!8050 () Bool)

(assert (=> d!48682 (= c!8050 (not (= (size!3036 (buf!3511 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!233899 () Unit!9463)

(declare-fun lt!233897 () Unit!9463)

(assert (=> d!48682 (= lt!233899 lt!233897)))

(assert (=> d!48682 (isPrefixOf!0 (_2!7049 lt!233544) (_2!7049 lt!233544))))

(assert (=> d!48682 (= lt!233897 (lemmaIsPrefixRefl!0 (_2!7049 lt!233544)))))

(declare-fun lt!233891 () Unit!9463)

(declare-fun lt!233889 () Unit!9463)

(assert (=> d!48682 (= lt!233891 lt!233889)))

(assert (=> d!48682 (= lt!233889 (lemmaIsPrefixRefl!0 (_2!7049 lt!233544)))))

(declare-fun lt!233907 () Unit!9463)

(declare-fun lt!233905 () Unit!9463)

(assert (=> d!48682 (= lt!233907 lt!233905)))

(assert (=> d!48682 (isPrefixOf!0 lt!233893 lt!233893)))

(assert (=> d!48682 (= lt!233905 (lemmaIsPrefixRefl!0 lt!233893))))

(declare-fun lt!233892 () Unit!9463)

(declare-fun lt!233901 () Unit!9463)

(assert (=> d!48682 (= lt!233892 lt!233901)))

(assert (=> d!48682 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!48682 (= lt!233901 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!48682 (= lt!233893 (BitStream!5331 (buf!3511 (_2!7049 lt!233544)) (currentByte!6425 thiss!1634) (currentBit!6420 thiss!1634)))))

(assert (=> d!48682 (isPrefixOf!0 thiss!1634 (_2!7049 lt!233544))))

(assert (=> d!48682 (= (reader!0 thiss!1634 (_2!7049 lt!233544)) lt!233900)))

(assert (= (and d!48682 c!8050) b!149792))

(assert (= (and d!48682 (not c!8050)) b!149794))

(assert (= (and d!48682 res!125494) b!149791))

(assert (= (and b!149791 res!125493) b!149790))

(assert (= (and b!149790 res!125492) b!149793))

(declare-fun m!233271 () Bool)

(assert (=> b!149790 m!233271))

(assert (=> b!149792 m!232913))

(declare-fun m!233273 () Bool)

(assert (=> b!149792 m!233273))

(declare-fun m!233275 () Bool)

(assert (=> b!149792 m!233275))

(assert (=> d!48682 m!233181))

(declare-fun m!233277 () Bool)

(assert (=> d!48682 m!233277))

(declare-fun m!233279 () Bool)

(assert (=> d!48682 m!233279))

(declare-fun m!233281 () Bool)

(assert (=> d!48682 m!233281))

(assert (=> d!48682 m!233177))

(declare-fun m!233283 () Bool)

(assert (=> d!48682 m!233283))

(assert (=> d!48682 m!232947))

(declare-fun m!233285 () Bool)

(assert (=> d!48682 m!233285))

(declare-fun m!233287 () Bool)

(assert (=> d!48682 m!233287))

(declare-fun m!233289 () Bool)

(assert (=> d!48682 m!233289))

(declare-fun m!233291 () Bool)

(assert (=> d!48682 m!233291))

(declare-fun m!233293 () Bool)

(assert (=> b!149791 m!233293))

(declare-fun m!233295 () Bool)

(assert (=> b!149793 m!233295))

(assert (=> b!149793 m!232911))

(assert (=> b!149793 m!232913))

(assert (=> b!149636 d!48682))

(declare-fun d!48686 () Bool)

(declare-fun e!100008 () Bool)

(assert (=> d!48686 e!100008))

(declare-fun res!125495 () Bool)

(assert (=> d!48686 (=> (not res!125495) (not e!100008))))

(declare-fun lt!233913 () (_ BitVec 64))

(declare-fun lt!233911 () (_ BitVec 64))

(declare-fun lt!233909 () (_ BitVec 64))

(assert (=> d!48686 (= res!125495 (= lt!233909 (bvsub lt!233913 lt!233911)))))

(assert (=> d!48686 (or (= (bvand lt!233913 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!233911 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!233913 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!233913 lt!233911) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48686 (= lt!233911 (remainingBits!0 ((_ sign_extend 32) (size!3036 (buf!3511 (_2!7049 lt!233519)))) ((_ sign_extend 32) (currentByte!6425 (_2!7049 lt!233519))) ((_ sign_extend 32) (currentBit!6420 (_2!7049 lt!233519)))))))

(declare-fun lt!233914 () (_ BitVec 64))

(declare-fun lt!233912 () (_ BitVec 64))

(assert (=> d!48686 (= lt!233913 (bvmul lt!233914 lt!233912))))

(assert (=> d!48686 (or (= lt!233914 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!233912 (bvsdiv (bvmul lt!233914 lt!233912) lt!233914)))))

(assert (=> d!48686 (= lt!233912 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48686 (= lt!233914 ((_ sign_extend 32) (size!3036 (buf!3511 (_2!7049 lt!233519)))))))

(assert (=> d!48686 (= lt!233909 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6425 (_2!7049 lt!233519))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6420 (_2!7049 lt!233519)))))))

(assert (=> d!48686 (invariant!0 (currentBit!6420 (_2!7049 lt!233519)) (currentByte!6425 (_2!7049 lt!233519)) (size!3036 (buf!3511 (_2!7049 lt!233519))))))

(assert (=> d!48686 (= (bitIndex!0 (size!3036 (buf!3511 (_2!7049 lt!233519))) (currentByte!6425 (_2!7049 lt!233519)) (currentBit!6420 (_2!7049 lt!233519))) lt!233909)))

(declare-fun b!149795 () Bool)

(declare-fun res!125496 () Bool)

(assert (=> b!149795 (=> (not res!125496) (not e!100008))))

(assert (=> b!149795 (= res!125496 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!233909))))

(declare-fun b!149796 () Bool)

(declare-fun lt!233910 () (_ BitVec 64))

(assert (=> b!149796 (= e!100008 (bvsle lt!233909 (bvmul lt!233910 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!149796 (or (= lt!233910 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!233910 #b0000000000000000000000000000000000000000000000000000000000001000) lt!233910)))))

(assert (=> b!149796 (= lt!233910 ((_ sign_extend 32) (size!3036 (buf!3511 (_2!7049 lt!233519)))))))

(assert (= (and d!48686 res!125495) b!149795))

(assert (= (and b!149795 res!125496) b!149796))

(declare-fun m!233297 () Bool)

(assert (=> d!48686 m!233297))

(declare-fun m!233299 () Bool)

(assert (=> d!48686 m!233299))

(assert (=> b!149643 d!48686))

(assert (=> b!149643 d!48628))

(declare-fun d!48688 () Bool)

(assert (=> d!48688 (= (array_inv!2825 (buf!3511 thiss!1634)) (bvsge (size!3036 (buf!3511 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!149645 d!48688))

(declare-fun d!48690 () Bool)

(assert (=> d!48690 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3036 (buf!3511 (_2!7049 lt!233519)))) ((_ sign_extend 32) (currentByte!6425 (_2!7049 lt!233544))) ((_ sign_extend 32) (currentBit!6420 (_2!7049 lt!233544))) lt!233528)))

(declare-fun lt!233920 () Unit!9463)

(declare-fun choose!26 (BitStream!5330 array!6708 (_ BitVec 32) BitStream!5330) Unit!9463)

(assert (=> d!48690 (= lt!233920 (choose!26 (_2!7049 lt!233544) (buf!3511 (_2!7049 lt!233519)) lt!233528 (BitStream!5331 (buf!3511 (_2!7049 lt!233519)) (currentByte!6425 (_2!7049 lt!233544)) (currentBit!6420 (_2!7049 lt!233544)))))))

(assert (=> d!48690 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!7049 lt!233544) (buf!3511 (_2!7049 lt!233519)) lt!233528) lt!233920)))

(declare-fun bs!11890 () Bool)

(assert (= bs!11890 d!48690))

(assert (=> bs!11890 m!232995))

(declare-fun m!233309 () Bool)

(assert (=> bs!11890 m!233309))

(assert (=> b!149644 d!48690))

(declare-fun d!48700 () Bool)

(assert (=> d!48700 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3036 (buf!3511 (_2!7049 lt!233519)))) ((_ sign_extend 32) (currentByte!6425 (_2!7049 lt!233544))) ((_ sign_extend 32) (currentBit!6420 (_2!7049 lt!233544))) lt!233528) (bvsle ((_ sign_extend 32) lt!233528) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3036 (buf!3511 (_2!7049 lt!233519)))) ((_ sign_extend 32) (currentByte!6425 (_2!7049 lt!233544))) ((_ sign_extend 32) (currentBit!6420 (_2!7049 lt!233544)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11891 () Bool)

(assert (= bs!11891 d!48700))

(assert (=> bs!11891 m!233161))

(assert (=> b!149644 d!48700))

(declare-fun d!48702 () Bool)

(declare-fun e!100015 () Bool)

(assert (=> d!48702 e!100015))

(declare-fun res!125504 () Bool)

(assert (=> d!48702 (=> (not res!125504) (not e!100015))))

(declare-fun lt!233932 () tuple2!13368)

(declare-fun lt!233930 () tuple2!13368)

(assert (=> d!48702 (= res!125504 (= (bitIndex!0 (size!3036 (buf!3511 (_1!7048 lt!233932))) (currentByte!6425 (_1!7048 lt!233932)) (currentBit!6420 (_1!7048 lt!233932))) (bitIndex!0 (size!3036 (buf!3511 (_1!7048 lt!233930))) (currentByte!6425 (_1!7048 lt!233930)) (currentBit!6420 (_1!7048 lt!233930)))))))

(declare-fun lt!233931 () Unit!9463)

(declare-fun lt!233929 () BitStream!5330)

(declare-fun choose!14 (BitStream!5330 BitStream!5330 BitStream!5330 tuple2!13368 tuple2!13368 BitStream!5330 (_ BitVec 8) tuple2!13368 tuple2!13368 BitStream!5330 (_ BitVec 8)) Unit!9463)

(assert (=> d!48702 (= lt!233931 (choose!14 lt!233542 (_2!7049 lt!233519) lt!233929 lt!233932 (tuple2!13369 (_1!7048 lt!233932) (_2!7048 lt!233932)) (_1!7048 lt!233932) (_2!7048 lt!233932) lt!233930 (tuple2!13369 (_1!7048 lt!233930) (_2!7048 lt!233930)) (_1!7048 lt!233930) (_2!7048 lt!233930)))))

(assert (=> d!48702 (= lt!233930 (readBytePure!0 lt!233929))))

(assert (=> d!48702 (= lt!233932 (readBytePure!0 lt!233542))))

(assert (=> d!48702 (= lt!233929 (BitStream!5331 (buf!3511 (_2!7049 lt!233519)) (currentByte!6425 lt!233542) (currentBit!6420 lt!233542)))))

(assert (=> d!48702 (= (readBytePrefixLemma!0 lt!233542 (_2!7049 lt!233519)) lt!233931)))

(declare-fun b!149804 () Bool)

(assert (=> b!149804 (= e!100015 (= (_2!7048 lt!233932) (_2!7048 lt!233930)))))

(assert (= (and d!48702 res!125504) b!149804))

(declare-fun m!233311 () Bool)

(assert (=> d!48702 m!233311))

(declare-fun m!233313 () Bool)

(assert (=> d!48702 m!233313))

(declare-fun m!233315 () Bool)

(assert (=> d!48702 m!233315))

(declare-fun m!233317 () Bool)

(assert (=> d!48702 m!233317))

(assert (=> d!48702 m!232969))

(assert (=> b!149644 d!48702))

(declare-fun d!48704 () Bool)

(declare-fun lt!233933 () tuple3!584)

(assert (=> d!48704 (= lt!233933 (readByteArrayLoop!0 (_1!7047 lt!233543) arr!237 from!447 to!404))))

(assert (=> d!48704 (= (readByteArrayLoopPure!0 (_1!7047 lt!233543) arr!237 from!447 to!404) (tuple2!13373 (_2!7053 lt!233933) (_3!365 lt!233933)))))

(declare-fun bs!11892 () Bool)

(assert (= bs!11892 d!48704))

(declare-fun m!233319 () Bool)

(assert (=> bs!11892 m!233319))

(assert (=> b!149644 d!48704))

(declare-fun d!48706 () Bool)

(declare-fun lt!233934 () tuple3!584)

(assert (=> d!48706 (= lt!233934 (readByteArrayLoop!0 (_1!7047 lt!233533) lt!233541 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!48706 (= (readByteArrayLoopPure!0 (_1!7047 lt!233533) lt!233541 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13373 (_2!7053 lt!233934) (_3!365 lt!233934)))))

(declare-fun bs!11893 () Bool)

(assert (= bs!11893 d!48706))

(declare-fun m!233321 () Bool)

(assert (=> bs!11893 m!233321))

(assert (=> b!149644 d!48706))

(declare-fun d!48708 () Bool)

(assert (=> d!48708 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3036 (buf!3511 (_2!7049 lt!233519)))) ((_ sign_extend 32) (currentByte!6425 thiss!1634)) ((_ sign_extend 32) (currentBit!6420 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!233935 () Unit!9463)

(assert (=> d!48708 (= lt!233935 (choose!26 thiss!1634 (buf!3511 (_2!7049 lt!233519)) (bvsub to!404 from!447) (BitStream!5331 (buf!3511 (_2!7049 lt!233519)) (currentByte!6425 thiss!1634) (currentBit!6420 thiss!1634))))))

(assert (=> d!48708 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3511 (_2!7049 lt!233519)) (bvsub to!404 from!447)) lt!233935)))

(declare-fun bs!11894 () Bool)

(assert (= bs!11894 d!48708))

(assert (=> bs!11894 m!232997))

(declare-fun m!233323 () Bool)

(assert (=> bs!11894 m!233323))

(assert (=> b!149644 d!48708))

(declare-fun d!48710 () Bool)

(declare-fun res!125507 () Bool)

(declare-fun e!100017 () Bool)

(assert (=> d!48710 (=> (not res!125507) (not e!100017))))

(assert (=> d!48710 (= res!125507 (= (size!3036 (buf!3511 thiss!1634)) (size!3036 (buf!3511 (_2!7049 lt!233519)))))))

(assert (=> d!48710 (= (isPrefixOf!0 thiss!1634 (_2!7049 lt!233519)) e!100017)))

(declare-fun b!149805 () Bool)

(declare-fun res!125505 () Bool)

(assert (=> b!149805 (=> (not res!125505) (not e!100017))))

(assert (=> b!149805 (= res!125505 (bvsle (bitIndex!0 (size!3036 (buf!3511 thiss!1634)) (currentByte!6425 thiss!1634) (currentBit!6420 thiss!1634)) (bitIndex!0 (size!3036 (buf!3511 (_2!7049 lt!233519))) (currentByte!6425 (_2!7049 lt!233519)) (currentBit!6420 (_2!7049 lt!233519)))))))

(declare-fun b!149806 () Bool)

(declare-fun e!100016 () Bool)

(assert (=> b!149806 (= e!100017 e!100016)))

(declare-fun res!125506 () Bool)

(assert (=> b!149806 (=> res!125506 e!100016)))

(assert (=> b!149806 (= res!125506 (= (size!3036 (buf!3511 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!149807 () Bool)

(assert (=> b!149807 (= e!100016 (arrayBitRangesEq!0 (buf!3511 thiss!1634) (buf!3511 (_2!7049 lt!233519)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3036 (buf!3511 thiss!1634)) (currentByte!6425 thiss!1634) (currentBit!6420 thiss!1634))))))

(assert (= (and d!48710 res!125507) b!149805))

(assert (= (and b!149805 res!125505) b!149806))

(assert (= (and b!149806 (not res!125506)) b!149807))

(assert (=> b!149805 m!232913))

(assert (=> b!149805 m!232915))

(assert (=> b!149807 m!232913))

(assert (=> b!149807 m!232913))

(declare-fun m!233325 () Bool)

(assert (=> b!149807 m!233325))

(assert (=> b!149644 d!48710))

(declare-fun d!48712 () Bool)

(declare-fun moveByteIndex!0 (BitStream!5330 (_ BitVec 32)) tuple2!13370)

(assert (=> d!48712 (= (withMovedByteIndex!0 (_1!7047 lt!233543) #b00000000000000000000000000000001) (_2!7049 (moveByteIndex!0 (_1!7047 lt!233543) #b00000000000000000000000000000001)))))

(declare-fun bs!11895 () Bool)

(assert (= bs!11895 d!48712))

(declare-fun m!233327 () Bool)

(assert (=> bs!11895 m!233327))

(assert (=> b!149644 d!48712))

(declare-fun d!48714 () Bool)

(assert (=> d!48714 (isPrefixOf!0 thiss!1634 (_2!7049 lt!233519))))

(declare-fun lt!233938 () Unit!9463)

(declare-fun choose!30 (BitStream!5330 BitStream!5330 BitStream!5330) Unit!9463)

(assert (=> d!48714 (= lt!233938 (choose!30 thiss!1634 (_2!7049 lt!233544) (_2!7049 lt!233519)))))

(assert (=> d!48714 (isPrefixOf!0 thiss!1634 (_2!7049 lt!233544))))

(assert (=> d!48714 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!7049 lt!233544) (_2!7049 lt!233519)) lt!233938)))

(declare-fun bs!11896 () Bool)

(assert (= bs!11896 d!48714))

(assert (=> bs!11896 m!232977))

(declare-fun m!233329 () Bool)

(assert (=> bs!11896 m!233329))

(assert (=> bs!11896 m!232947))

(assert (=> b!149644 d!48714))

(declare-fun b!149808 () Bool)

(declare-fun res!125508 () Bool)

(declare-fun e!100019 () Bool)

(assert (=> b!149808 (=> (not res!125508) (not e!100019))))

(declare-fun lt!233950 () tuple2!13366)

(assert (=> b!149808 (= res!125508 (isPrefixOf!0 (_2!7047 lt!233950) (_2!7049 lt!233519)))))

(declare-fun b!149810 () Bool)

(declare-fun e!100018 () Unit!9463)

(declare-fun lt!233946 () Unit!9463)

(assert (=> b!149810 (= e!100018 lt!233946)))

(declare-fun lt!233952 () (_ BitVec 64))

(assert (=> b!149810 (= lt!233952 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!233945 () (_ BitVec 64))

(assert (=> b!149810 (= lt!233945 (bitIndex!0 (size!3036 (buf!3511 thiss!1634)) (currentByte!6425 thiss!1634) (currentBit!6420 thiss!1634)))))

(assert (=> b!149810 (= lt!233946 (arrayBitRangesEqSymmetric!0 (buf!3511 thiss!1634) (buf!3511 (_2!7049 lt!233519)) lt!233952 lt!233945))))

(assert (=> b!149810 (arrayBitRangesEq!0 (buf!3511 (_2!7049 lt!233519)) (buf!3511 thiss!1634) lt!233952 lt!233945)))

(declare-fun b!149811 () Bool)

(declare-fun lt!233940 () (_ BitVec 64))

(declare-fun lt!233956 () (_ BitVec 64))

(assert (=> b!149811 (= e!100019 (= (_1!7047 lt!233950) (withMovedBitIndex!0 (_2!7047 lt!233950) (bvsub lt!233956 lt!233940))))))

(assert (=> b!149811 (or (= (bvand lt!233956 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!233940 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!233956 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!233956 lt!233940) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!149811 (= lt!233940 (bitIndex!0 (size!3036 (buf!3511 (_2!7049 lt!233519))) (currentByte!6425 (_2!7049 lt!233519)) (currentBit!6420 (_2!7049 lt!233519))))))

(assert (=> b!149811 (= lt!233956 (bitIndex!0 (size!3036 (buf!3511 thiss!1634)) (currentByte!6425 thiss!1634) (currentBit!6420 thiss!1634)))))

(declare-fun b!149812 () Bool)

(declare-fun Unit!9470 () Unit!9463)

(assert (=> b!149812 (= e!100018 Unit!9470)))

(declare-fun b!149809 () Bool)

(declare-fun res!125509 () Bool)

(assert (=> b!149809 (=> (not res!125509) (not e!100019))))

(assert (=> b!149809 (= res!125509 (isPrefixOf!0 (_1!7047 lt!233950) thiss!1634))))

(declare-fun d!48716 () Bool)

(assert (=> d!48716 e!100019))

(declare-fun res!125510 () Bool)

(assert (=> d!48716 (=> (not res!125510) (not e!100019))))

(assert (=> d!48716 (= res!125510 (isPrefixOf!0 (_1!7047 lt!233950) (_2!7047 lt!233950)))))

(declare-fun lt!233943 () BitStream!5330)

(assert (=> d!48716 (= lt!233950 (tuple2!13367 lt!233943 (_2!7049 lt!233519)))))

(declare-fun lt!233954 () Unit!9463)

(declare-fun lt!233958 () Unit!9463)

(assert (=> d!48716 (= lt!233954 lt!233958)))

(assert (=> d!48716 (isPrefixOf!0 lt!233943 (_2!7049 lt!233519))))

(assert (=> d!48716 (= lt!233958 (lemmaIsPrefixTransitive!0 lt!233943 (_2!7049 lt!233519) (_2!7049 lt!233519)))))

(declare-fun lt!233948 () Unit!9463)

(declare-fun lt!233944 () Unit!9463)

(assert (=> d!48716 (= lt!233948 lt!233944)))

(assert (=> d!48716 (isPrefixOf!0 lt!233943 (_2!7049 lt!233519))))

(assert (=> d!48716 (= lt!233944 (lemmaIsPrefixTransitive!0 lt!233943 thiss!1634 (_2!7049 lt!233519)))))

(declare-fun lt!233953 () Unit!9463)

(assert (=> d!48716 (= lt!233953 e!100018)))

(declare-fun c!8051 () Bool)

(assert (=> d!48716 (= c!8051 (not (= (size!3036 (buf!3511 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!233949 () Unit!9463)

(declare-fun lt!233947 () Unit!9463)

(assert (=> d!48716 (= lt!233949 lt!233947)))

(assert (=> d!48716 (isPrefixOf!0 (_2!7049 lt!233519) (_2!7049 lt!233519))))

(assert (=> d!48716 (= lt!233947 (lemmaIsPrefixRefl!0 (_2!7049 lt!233519)))))

(declare-fun lt!233941 () Unit!9463)

(declare-fun lt!233939 () Unit!9463)

(assert (=> d!48716 (= lt!233941 lt!233939)))

(assert (=> d!48716 (= lt!233939 (lemmaIsPrefixRefl!0 (_2!7049 lt!233519)))))

(declare-fun lt!233957 () Unit!9463)

(declare-fun lt!233955 () Unit!9463)

(assert (=> d!48716 (= lt!233957 lt!233955)))

(assert (=> d!48716 (isPrefixOf!0 lt!233943 lt!233943)))

(assert (=> d!48716 (= lt!233955 (lemmaIsPrefixRefl!0 lt!233943))))

(declare-fun lt!233942 () Unit!9463)

(declare-fun lt!233951 () Unit!9463)

(assert (=> d!48716 (= lt!233942 lt!233951)))

(assert (=> d!48716 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!48716 (= lt!233951 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!48716 (= lt!233943 (BitStream!5331 (buf!3511 (_2!7049 lt!233519)) (currentByte!6425 thiss!1634) (currentBit!6420 thiss!1634)))))

(assert (=> d!48716 (isPrefixOf!0 thiss!1634 (_2!7049 lt!233519))))

(assert (=> d!48716 (= (reader!0 thiss!1634 (_2!7049 lt!233519)) lt!233950)))

(assert (= (and d!48716 c!8051) b!149810))

(assert (= (and d!48716 (not c!8051)) b!149812))

(assert (= (and d!48716 res!125510) b!149809))

(assert (= (and b!149809 res!125509) b!149808))

(assert (= (and b!149808 res!125508) b!149811))

(declare-fun m!233331 () Bool)

(assert (=> b!149808 m!233331))

(assert (=> b!149810 m!232913))

(declare-fun m!233333 () Bool)

(assert (=> b!149810 m!233333))

(declare-fun m!233335 () Bool)

(assert (=> b!149810 m!233335))

(assert (=> d!48716 m!233171))

(declare-fun m!233337 () Bool)

(assert (=> d!48716 m!233337))

(declare-fun m!233339 () Bool)

(assert (=> d!48716 m!233339))

(assert (=> d!48716 m!233281))

(assert (=> d!48716 m!233179))

(assert (=> d!48716 m!233283))

(assert (=> d!48716 m!232977))

(declare-fun m!233341 () Bool)

(assert (=> d!48716 m!233341))

(declare-fun m!233343 () Bool)

(assert (=> d!48716 m!233343))

(declare-fun m!233345 () Bool)

(assert (=> d!48716 m!233345))

(declare-fun m!233347 () Bool)

(assert (=> d!48716 m!233347))

(declare-fun m!233349 () Bool)

(assert (=> b!149809 m!233349))

(declare-fun m!233351 () Bool)

(assert (=> b!149811 m!233351))

(assert (=> b!149811 m!232915))

(assert (=> b!149811 m!232913))

(assert (=> b!149644 d!48716))

(declare-fun d!48718 () Bool)

(declare-fun lt!233959 () tuple2!13376)

(assert (=> d!48718 (= lt!233959 (readByte!0 lt!233542))))

(assert (=> d!48718 (= (readBytePure!0 lt!233542) (tuple2!13369 (_2!7054 lt!233959) (_1!7054 lt!233959)))))

(declare-fun bs!11897 () Bool)

(assert (= bs!11897 d!48718))

(declare-fun m!233353 () Bool)

(assert (=> bs!11897 m!233353))

(assert (=> b!149644 d!48718))

(declare-fun d!48720 () Bool)

(declare-fun lt!233968 () tuple2!13372)

(declare-fun lt!233970 () tuple2!13372)

(assert (=> d!48720 (arrayRangesEq!352 (_2!7050 lt!233968) (_2!7050 lt!233970) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!233969 () BitStream!5330)

(declare-fun lt!233971 () Unit!9463)

(declare-fun choose!35 (BitStream!5330 array!6708 (_ BitVec 32) (_ BitVec 32) tuple2!13372 array!6708 BitStream!5330 tuple2!13372 array!6708) Unit!9463)

(assert (=> d!48720 (= lt!233971 (choose!35 (_1!7047 lt!233543) arr!237 from!447 to!404 lt!233968 (_2!7050 lt!233968) lt!233969 lt!233970 (_2!7050 lt!233970)))))

(assert (=> d!48720 (= lt!233970 (readByteArrayLoopPure!0 lt!233969 (array!6709 (store (arr!3820 arr!237) from!447 (_2!7048 (readBytePure!0 (_1!7047 lt!233543)))) (size!3036 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!48720 (= lt!233969 (withMovedByteIndex!0 (_1!7047 lt!233543) #b00000000000000000000000000000001))))

(assert (=> d!48720 (= lt!233968 (readByteArrayLoopPure!0 (_1!7047 lt!233543) arr!237 from!447 to!404))))

(assert (=> d!48720 (= (readByteArrayLoopArrayPrefixLemma!0 (_1!7047 lt!233543) arr!237 from!447 to!404) lt!233971)))

(declare-fun bs!11899 () Bool)

(assert (= bs!11899 d!48720))

(declare-fun m!233355 () Bool)

(assert (=> bs!11899 m!233355))

(declare-fun m!233357 () Bool)

(assert (=> bs!11899 m!233357))

(declare-fun m!233359 () Bool)

(assert (=> bs!11899 m!233359))

(declare-fun m!233361 () Bool)

(assert (=> bs!11899 m!233361))

(assert (=> bs!11899 m!232973))

(assert (=> bs!11899 m!232993))

(assert (=> bs!11899 m!232981))

(assert (=> b!149644 d!48720))

(declare-fun d!48722 () Bool)

(declare-fun e!100020 () Bool)

(assert (=> d!48722 e!100020))

(declare-fun res!125511 () Bool)

(assert (=> d!48722 (=> (not res!125511) (not e!100020))))

(declare-fun lt!233972 () (_ BitVec 64))

(declare-fun lt!233974 () (_ BitVec 64))

(declare-fun lt!233976 () (_ BitVec 64))

(assert (=> d!48722 (= res!125511 (= lt!233972 (bvsub lt!233976 lt!233974)))))

(assert (=> d!48722 (or (= (bvand lt!233976 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!233974 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!233976 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!233976 lt!233974) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48722 (= lt!233974 (remainingBits!0 ((_ sign_extend 32) (size!3036 (buf!3511 (_1!7048 lt!233539)))) ((_ sign_extend 32) (currentByte!6425 (_1!7048 lt!233539))) ((_ sign_extend 32) (currentBit!6420 (_1!7048 lt!233539)))))))

(declare-fun lt!233977 () (_ BitVec 64))

(declare-fun lt!233975 () (_ BitVec 64))

(assert (=> d!48722 (= lt!233976 (bvmul lt!233977 lt!233975))))

(assert (=> d!48722 (or (= lt!233977 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!233975 (bvsdiv (bvmul lt!233977 lt!233975) lt!233977)))))

(assert (=> d!48722 (= lt!233975 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48722 (= lt!233977 ((_ sign_extend 32) (size!3036 (buf!3511 (_1!7048 lt!233539)))))))

(assert (=> d!48722 (= lt!233972 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6425 (_1!7048 lt!233539))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6420 (_1!7048 lt!233539)))))))

(assert (=> d!48722 (invariant!0 (currentBit!6420 (_1!7048 lt!233539)) (currentByte!6425 (_1!7048 lt!233539)) (size!3036 (buf!3511 (_1!7048 lt!233539))))))

(assert (=> d!48722 (= (bitIndex!0 (size!3036 (buf!3511 (_1!7048 lt!233539))) (currentByte!6425 (_1!7048 lt!233539)) (currentBit!6420 (_1!7048 lt!233539))) lt!233972)))

(declare-fun b!149813 () Bool)

(declare-fun res!125512 () Bool)

(assert (=> b!149813 (=> (not res!125512) (not e!100020))))

(assert (=> b!149813 (= res!125512 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!233972))))

(declare-fun b!149814 () Bool)

(declare-fun lt!233973 () (_ BitVec 64))

(assert (=> b!149814 (= e!100020 (bvsle lt!233972 (bvmul lt!233973 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!149814 (or (= lt!233973 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!233973 #b0000000000000000000000000000000000000000000000000000000000001000) lt!233973)))))

(assert (=> b!149814 (= lt!233973 ((_ sign_extend 32) (size!3036 (buf!3511 (_1!7048 lt!233539)))))))

(assert (= (and d!48722 res!125511) b!149813))

(assert (= (and b!149813 res!125512) b!149814))

(declare-fun m!233363 () Bool)

(assert (=> d!48722 m!233363))

(declare-fun m!233365 () Bool)

(assert (=> d!48722 m!233365))

(assert (=> b!149644 d!48722))

(declare-fun e!100028 () Bool)

(declare-fun lt!234001 () tuple2!13372)

(declare-fun b!149825 () Bool)

(assert (=> b!149825 (= e!100028 (arrayRangesEq!352 arr!237 (_2!7050 lt!234001) #b00000000000000000000000000000000 to!404))))

(declare-fun b!149826 () Bool)

(declare-fun res!125527 () Bool)

(declare-fun e!100027 () Bool)

(assert (=> b!149826 (=> (not res!125527) (not e!100027))))

(declare-fun lt!234000 () (_ BitVec 64))

(declare-fun lt!234003 () (_ BitVec 64))

(declare-fun lt!233999 () tuple2!13370)

(assert (=> b!149826 (= res!125527 (= (bitIndex!0 (size!3036 (buf!3511 (_2!7049 lt!233999))) (currentByte!6425 (_2!7049 lt!233999)) (currentBit!6420 (_2!7049 lt!233999))) (bvadd lt!234000 lt!234003)))))

(assert (=> b!149826 (or (not (= (bvand lt!234000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!234003 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!234000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!234000 lt!234003) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!234004 () (_ BitVec 64))

(assert (=> b!149826 (= lt!234003 (bvmul lt!234004 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!149826 (or (= lt!234004 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!234004 #b0000000000000000000000000000000000000000000000000000000000001000) lt!234004)))))

(assert (=> b!149826 (= lt!234004 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!149826 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!149826 (= lt!234000 (bitIndex!0 (size!3036 (buf!3511 (_2!7049 lt!233544))) (currentByte!6425 (_2!7049 lt!233544)) (currentBit!6420 (_2!7049 lt!233544))))))

(declare-fun d!48724 () Bool)

(assert (=> d!48724 e!100027))

(declare-fun res!125525 () Bool)

(assert (=> d!48724 (=> (not res!125525) (not e!100027))))

(assert (=> d!48724 (= res!125525 (= (size!3036 (buf!3511 (_2!7049 lt!233544))) (size!3036 (buf!3511 (_2!7049 lt!233999)))))))

(declare-fun choose!64 (BitStream!5330 array!6708 (_ BitVec 32) (_ BitVec 32)) tuple2!13370)

(assert (=> d!48724 (= lt!233999 (choose!64 (_2!7049 lt!233544) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!48724 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3036 arr!237)))))

(assert (=> d!48724 (= (appendByteArrayLoop!0 (_2!7049 lt!233544) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!233999)))

(declare-fun b!149827 () Bool)

(declare-fun e!100029 () Bool)

(declare-fun lt!233998 () (_ BitVec 64))

(assert (=> b!149827 (= e!100029 (validate_offset_bits!1 ((_ sign_extend 32) (size!3036 (buf!3511 (_2!7049 lt!233544)))) ((_ sign_extend 32) (currentByte!6425 (_2!7049 lt!233544))) ((_ sign_extend 32) (currentBit!6420 (_2!7049 lt!233544))) lt!233998))))

(declare-fun b!149828 () Bool)

(assert (=> b!149828 (= e!100027 e!100028)))

(declare-fun res!125524 () Bool)

(assert (=> b!149828 (=> (not res!125524) (not e!100028))))

(declare-fun lt!233996 () tuple2!13366)

(assert (=> b!149828 (= res!125524 (and (= (size!3036 (_2!7050 lt!234001)) (size!3036 arr!237)) (= (_1!7050 lt!234001) (_2!7047 lt!233996))))))

(assert (=> b!149828 (= lt!234001 (readByteArrayLoopPure!0 (_1!7047 lt!233996) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!234002 () Unit!9463)

(declare-fun lt!233997 () Unit!9463)

(assert (=> b!149828 (= lt!234002 lt!233997)))

(assert (=> b!149828 (validate_offset_bits!1 ((_ sign_extend 32) (size!3036 (buf!3511 (_2!7049 lt!233999)))) ((_ sign_extend 32) (currentByte!6425 (_2!7049 lt!233544))) ((_ sign_extend 32) (currentBit!6420 (_2!7049 lt!233544))) lt!233998)))

(assert (=> b!149828 (= lt!233997 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!7049 lt!233544) (buf!3511 (_2!7049 lt!233999)) lt!233998))))

(assert (=> b!149828 e!100029))

(declare-fun res!125526 () Bool)

(assert (=> b!149828 (=> (not res!125526) (not e!100029))))

(assert (=> b!149828 (= res!125526 (and (= (size!3036 (buf!3511 (_2!7049 lt!233544))) (size!3036 (buf!3511 (_2!7049 lt!233999)))) (bvsge lt!233998 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!149828 (= lt!233998 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!149828 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!149828 (= lt!233996 (reader!0 (_2!7049 lt!233544) (_2!7049 lt!233999)))))

(declare-fun b!149829 () Bool)

(declare-fun res!125523 () Bool)

(assert (=> b!149829 (=> (not res!125523) (not e!100027))))

(assert (=> b!149829 (= res!125523 (isPrefixOf!0 (_2!7049 lt!233544) (_2!7049 lt!233999)))))

(assert (= (and d!48724 res!125525) b!149826))

(assert (= (and b!149826 res!125527) b!149829))

(assert (= (and b!149829 res!125523) b!149828))

(assert (= (and b!149828 res!125526) b!149827))

(assert (= (and b!149828 res!125524) b!149825))

(declare-fun m!233367 () Bool)

(assert (=> b!149829 m!233367))

(declare-fun m!233369 () Bool)

(assert (=> b!149826 m!233369))

(assert (=> b!149826 m!232911))

(declare-fun m!233371 () Bool)

(assert (=> b!149825 m!233371))

(declare-fun m!233373 () Bool)

(assert (=> b!149828 m!233373))

(declare-fun m!233375 () Bool)

(assert (=> b!149828 m!233375))

(declare-fun m!233377 () Bool)

(assert (=> b!149828 m!233377))

(declare-fun m!233379 () Bool)

(assert (=> b!149828 m!233379))

(declare-fun m!233381 () Bool)

(assert (=> b!149827 m!233381))

(declare-fun m!233383 () Bool)

(assert (=> d!48724 m!233383))

(assert (=> b!149644 d!48724))

(assert (=> b!149644 d!48636))

(declare-fun d!48726 () Bool)

(declare-fun res!125528 () Bool)

(declare-fun e!100030 () Bool)

(assert (=> d!48726 (=> res!125528 e!100030)))

(assert (=> d!48726 (= res!125528 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!48726 (= (arrayRangesEq!352 (_2!7050 lt!233532) (_2!7050 lt!233535) #b00000000000000000000000000000000 to!404) e!100030)))

(declare-fun b!149830 () Bool)

(declare-fun e!100031 () Bool)

(assert (=> b!149830 (= e!100030 e!100031)))

(declare-fun res!125529 () Bool)

(assert (=> b!149830 (=> (not res!125529) (not e!100031))))

(assert (=> b!149830 (= res!125529 (= (select (arr!3820 (_2!7050 lt!233532)) #b00000000000000000000000000000000) (select (arr!3820 (_2!7050 lt!233535)) #b00000000000000000000000000000000)))))

(declare-fun b!149831 () Bool)

(assert (=> b!149831 (= e!100031 (arrayRangesEq!352 (_2!7050 lt!233532) (_2!7050 lt!233535) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48726 (not res!125528)) b!149830))

(assert (= (and b!149830 res!125529) b!149831))

(assert (=> b!149830 m!233223))

(declare-fun m!233385 () Bool)

(assert (=> b!149830 m!233385))

(declare-fun m!233387 () Bool)

(assert (=> b!149831 m!233387))

(assert (=> b!149644 d!48726))

(declare-fun d!48728 () Bool)

(assert (=> d!48728 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3036 (buf!3511 (_2!7049 lt!233519)))) ((_ sign_extend 32) (currentByte!6425 thiss!1634)) ((_ sign_extend 32) (currentBit!6420 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3036 (buf!3511 (_2!7049 lt!233519)))) ((_ sign_extend 32) (currentByte!6425 thiss!1634)) ((_ sign_extend 32) (currentBit!6420 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11900 () Bool)

(assert (= bs!11900 d!48728))

(declare-fun m!233389 () Bool)

(assert (=> bs!11900 m!233389))

(assert (=> b!149644 d!48728))

(declare-fun d!48730 () Bool)

(declare-fun e!100032 () Bool)

(assert (=> d!48730 e!100032))

(declare-fun res!125530 () Bool)

(assert (=> d!48730 (=> (not res!125530) (not e!100032))))

(declare-fun lt!234005 () (_ BitVec 64))

(declare-fun lt!234009 () (_ BitVec 64))

(declare-fun lt!234007 () (_ BitVec 64))

(assert (=> d!48730 (= res!125530 (= lt!234005 (bvsub lt!234009 lt!234007)))))

(assert (=> d!48730 (or (= (bvand lt!234009 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!234007 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!234009 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!234009 lt!234007) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48730 (= lt!234007 (remainingBits!0 ((_ sign_extend 32) (size!3036 (buf!3511 (_1!7048 lt!233537)))) ((_ sign_extend 32) (currentByte!6425 (_1!7048 lt!233537))) ((_ sign_extend 32) (currentBit!6420 (_1!7048 lt!233537)))))))

(declare-fun lt!234010 () (_ BitVec 64))

(declare-fun lt!234008 () (_ BitVec 64))

(assert (=> d!48730 (= lt!234009 (bvmul lt!234010 lt!234008))))

(assert (=> d!48730 (or (= lt!234010 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!234008 (bvsdiv (bvmul lt!234010 lt!234008) lt!234010)))))

(assert (=> d!48730 (= lt!234008 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48730 (= lt!234010 ((_ sign_extend 32) (size!3036 (buf!3511 (_1!7048 lt!233537)))))))

(assert (=> d!48730 (= lt!234005 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6425 (_1!7048 lt!233537))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6420 (_1!7048 lt!233537)))))))

(assert (=> d!48730 (invariant!0 (currentBit!6420 (_1!7048 lt!233537)) (currentByte!6425 (_1!7048 lt!233537)) (size!3036 (buf!3511 (_1!7048 lt!233537))))))

(assert (=> d!48730 (= (bitIndex!0 (size!3036 (buf!3511 (_1!7048 lt!233537))) (currentByte!6425 (_1!7048 lt!233537)) (currentBit!6420 (_1!7048 lt!233537))) lt!234005)))

(declare-fun b!149832 () Bool)

(declare-fun res!125531 () Bool)

(assert (=> b!149832 (=> (not res!125531) (not e!100032))))

(assert (=> b!149832 (= res!125531 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!234005))))

(declare-fun b!149833 () Bool)

(declare-fun lt!234006 () (_ BitVec 64))

(assert (=> b!149833 (= e!100032 (bvsle lt!234005 (bvmul lt!234006 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!149833 (or (= lt!234006 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!234006 #b0000000000000000000000000000000000000000000000000000000000001000) lt!234006)))))

(assert (=> b!149833 (= lt!234006 ((_ sign_extend 32) (size!3036 (buf!3511 (_1!7048 lt!233537)))))))

(assert (= (and d!48730 res!125530) b!149832))

(assert (= (and b!149832 res!125531) b!149833))

(declare-fun m!233391 () Bool)

(assert (=> d!48730 m!233391))

(declare-fun m!233393 () Bool)

(assert (=> d!48730 m!233393))

(assert (=> b!149644 d!48730))

(declare-fun d!48732 () Bool)

(declare-fun res!125532 () Bool)

(declare-fun e!100033 () Bool)

(assert (=> d!48732 (=> res!125532 e!100033)))

(assert (=> d!48732 (= res!125532 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!48732 (= (arrayRangesEq!352 (_2!7050 lt!233532) (_2!7050 lt!233547) #b00000000000000000000000000000000 to!404) e!100033)))

(declare-fun b!149834 () Bool)

(declare-fun e!100034 () Bool)

(assert (=> b!149834 (= e!100033 e!100034)))

(declare-fun res!125533 () Bool)

(assert (=> b!149834 (=> (not res!125533) (not e!100034))))

(assert (=> b!149834 (= res!125533 (= (select (arr!3820 (_2!7050 lt!233532)) #b00000000000000000000000000000000) (select (arr!3820 (_2!7050 lt!233547)) #b00000000000000000000000000000000)))))

(declare-fun b!149835 () Bool)

(assert (=> b!149835 (= e!100034 (arrayRangesEq!352 (_2!7050 lt!233532) (_2!7050 lt!233547) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48732 (not res!125532)) b!149834))

(assert (= (and b!149834 res!125533) b!149835))

(assert (=> b!149834 m!233223))

(assert (=> b!149834 m!233255))

(declare-fun m!233395 () Bool)

(assert (=> b!149835 m!233395))

(assert (=> b!149644 d!48732))

(declare-fun d!48734 () Bool)

(declare-fun e!100037 () Bool)

(assert (=> d!48734 e!100037))

(declare-fun res!125542 () Bool)

(assert (=> d!48734 (=> (not res!125542) (not e!100037))))

(declare-fun lt!234025 () tuple2!13370)

(assert (=> d!48734 (= res!125542 (= (size!3036 (buf!3511 thiss!1634)) (size!3036 (buf!3511 (_2!7049 lt!234025)))))))

(declare-fun choose!6 (BitStream!5330 (_ BitVec 8)) tuple2!13370)

(assert (=> d!48734 (= lt!234025 (choose!6 thiss!1634 (select (arr!3820 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!48734 (validate_offset_byte!0 ((_ sign_extend 32) (size!3036 (buf!3511 thiss!1634))) ((_ sign_extend 32) (currentByte!6425 thiss!1634)) ((_ sign_extend 32) (currentBit!6420 thiss!1634)))))

(assert (=> d!48734 (= (appendByte!0 thiss!1634 (select (arr!3820 arr!237) from!447)) lt!234025)))

(declare-fun b!149842 () Bool)

(declare-fun res!125540 () Bool)

(assert (=> b!149842 (=> (not res!125540) (not e!100037))))

(declare-fun lt!234022 () (_ BitVec 64))

(declare-fun lt!234023 () (_ BitVec 64))

(assert (=> b!149842 (= res!125540 (= (bitIndex!0 (size!3036 (buf!3511 (_2!7049 lt!234025))) (currentByte!6425 (_2!7049 lt!234025)) (currentBit!6420 (_2!7049 lt!234025))) (bvadd lt!234023 lt!234022)))))

(assert (=> b!149842 (or (not (= (bvand lt!234023 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!234022 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!234023 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!234023 lt!234022) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!149842 (= lt!234022 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!149842 (= lt!234023 (bitIndex!0 (size!3036 (buf!3511 thiss!1634)) (currentByte!6425 thiss!1634) (currentBit!6420 thiss!1634)))))

(declare-fun b!149843 () Bool)

(declare-fun res!125541 () Bool)

(assert (=> b!149843 (=> (not res!125541) (not e!100037))))

(assert (=> b!149843 (= res!125541 (isPrefixOf!0 thiss!1634 (_2!7049 lt!234025)))))

(declare-fun b!149844 () Bool)

(declare-fun lt!234021 () tuple2!13366)

(declare-fun lt!234024 () tuple2!13368)

(assert (=> b!149844 (= e!100037 (and (= (_2!7048 lt!234024) (select (arr!3820 arr!237) from!447)) (= (_1!7048 lt!234024) (_2!7047 lt!234021))))))

(assert (=> b!149844 (= lt!234024 (readBytePure!0 (_1!7047 lt!234021)))))

(assert (=> b!149844 (= lt!234021 (reader!0 thiss!1634 (_2!7049 lt!234025)))))

(assert (= (and d!48734 res!125542) b!149842))

(assert (= (and b!149842 res!125540) b!149843))

(assert (= (and b!149843 res!125541) b!149844))

(assert (=> d!48734 m!232919))

(declare-fun m!233397 () Bool)

(assert (=> d!48734 m!233397))

(declare-fun m!233399 () Bool)

(assert (=> d!48734 m!233399))

(declare-fun m!233401 () Bool)

(assert (=> b!149842 m!233401))

(assert (=> b!149842 m!232913))

(declare-fun m!233403 () Bool)

(assert (=> b!149843 m!233403))

(declare-fun m!233405 () Bool)

(assert (=> b!149844 m!233405))

(declare-fun m!233407 () Bool)

(assert (=> b!149844 m!233407))

(assert (=> b!149644 d!48734))

(declare-fun d!48736 () Bool)

(assert (=> d!48736 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3036 (buf!3511 (_2!7049 lt!233544)))) ((_ sign_extend 32) (currentByte!6425 (_2!7049 lt!233544))) ((_ sign_extend 32) (currentBit!6420 (_2!7049 lt!233544))) lt!233528) (bvsle ((_ sign_extend 32) lt!233528) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3036 (buf!3511 (_2!7049 lt!233544)))) ((_ sign_extend 32) (currentByte!6425 (_2!7049 lt!233544))) ((_ sign_extend 32) (currentBit!6420 (_2!7049 lt!233544)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11901 () Bool)

(assert (= bs!11901 d!48736))

(assert (=> bs!11901 m!233155))

(assert (=> b!149644 d!48736))

(declare-fun d!48738 () Bool)

(declare-fun lt!234026 () tuple2!13376)

(assert (=> d!48738 (= lt!234026 (readByte!0 (BitStream!5331 (buf!3511 (_2!7049 lt!233519)) (currentByte!6425 thiss!1634) (currentBit!6420 thiss!1634))))))

(assert (=> d!48738 (= (readBytePure!0 (BitStream!5331 (buf!3511 (_2!7049 lt!233519)) (currentByte!6425 thiss!1634) (currentBit!6420 thiss!1634))) (tuple2!13369 (_2!7054 lt!234026) (_1!7054 lt!234026)))))

(declare-fun bs!11902 () Bool)

(assert (= bs!11902 d!48738))

(declare-fun m!233409 () Bool)

(assert (=> bs!11902 m!233409))

(assert (=> b!149644 d!48738))

(declare-fun d!48740 () Bool)

(declare-fun e!100040 () Bool)

(assert (=> d!48740 e!100040))

(declare-fun res!125545 () Bool)

(assert (=> d!48740 (=> (not res!125545) (not e!100040))))

(assert (=> d!48740 (= res!125545 (and (or (let ((rhs!3280 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3280 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3280) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!48741 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!48741 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!48741 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3279 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3279 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3279) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!234033 () Unit!9463)

(declare-fun choose!57 (BitStream!5330 BitStream!5330 (_ BitVec 64) (_ BitVec 32)) Unit!9463)

(assert (=> d!48740 (= lt!234033 (choose!57 thiss!1634 (_2!7049 lt!233544) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!48740 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!7049 lt!233544) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!234033)))

(declare-fun lt!234035 () (_ BitVec 32))

(declare-fun b!149847 () Bool)

(assert (=> b!149847 (= e!100040 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3036 (buf!3511 (_2!7049 lt!233544)))) ((_ sign_extend 32) (currentByte!6425 (_2!7049 lt!233544))) ((_ sign_extend 32) (currentBit!6420 (_2!7049 lt!233544))) (bvsub (bvsub to!404 from!447) lt!234035)))))

(assert (=> b!149847 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!234035 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!234035) #b10000000000000000000000000000000)))))

(declare-fun lt!234034 () (_ BitVec 64))

(assert (=> b!149847 (= lt!234035 ((_ extract 31 0) lt!234034))))

(assert (=> b!149847 (and (bvslt lt!234034 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!234034 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!149847 (= lt!234034 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!48740 res!125545) b!149847))

(declare-fun m!233411 () Bool)

(assert (=> d!48740 m!233411))

(declare-fun m!233413 () Bool)

(assert (=> b!149847 m!233413))

(assert (=> b!149644 d!48740))

(declare-fun lt!234036 () tuple3!584)

(declare-fun d!48743 () Bool)

(assert (=> d!48743 (= lt!234036 (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!7047 lt!233543) #b00000000000000000000000000000001) lt!233541 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!48743 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!7047 lt!233543) #b00000000000000000000000000000001) lt!233541 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13373 (_2!7053 lt!234036) (_3!365 lt!234036)))))

(declare-fun bs!11903 () Bool)

(assert (= bs!11903 d!48743))

(assert (=> bs!11903 m!232981))

(declare-fun m!233415 () Bool)

(assert (=> bs!11903 m!233415))

(assert (=> b!149644 d!48743))

(declare-fun d!48745 () Bool)

(declare-fun lt!234037 () tuple2!13376)

(assert (=> d!48745 (= lt!234037 (readByte!0 (_1!7047 lt!233543)))))

(assert (=> d!48745 (= (readBytePure!0 (_1!7047 lt!233543)) (tuple2!13369 (_2!7054 lt!234037) (_1!7054 lt!234037)))))

(declare-fun bs!11904 () Bool)

(assert (= bs!11904 d!48745))

(declare-fun m!233417 () Bool)

(assert (=> bs!11904 m!233417))

(assert (=> b!149644 d!48745))

(declare-fun d!48747 () Bool)

(assert (=> d!48747 (= (array_inv!2825 arr!237) (bvsge (size!3036 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!28786 d!48747))

(declare-fun d!48749 () Bool)

(assert (=> d!48749 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6420 thiss!1634) (currentByte!6425 thiss!1634) (size!3036 (buf!3511 thiss!1634))))))

(declare-fun bs!11905 () Bool)

(assert (= bs!11905 d!48749))

(assert (=> bs!11905 m!232945))

(assert (=> start!28786 d!48749))

(push 1)

(assert (not b!149791))

(assert (not b!149847))

(assert (not b!149771))

(assert (not d!48620))

(assert (not d!48660))

(assert (not d!48682))

(assert (not b!149829))

(assert (not d!48706))

(assert (not d!48632))

(assert (not b!149811))

(assert (not b!149825))

(assert (not b!149793))

(assert (not d!48640))

(assert (not b!149831))

(assert (not b!149773))

(assert (not d!48749))

(assert (not b!149810))

(assert (not b!149808))

(assert (not b!149743))

(assert (not d!48708))

(assert (not b!149745))

(assert (not d!48712))

(assert (not d!48686))

(assert (not b!149787))

(assert (not b!149765))

(assert (not d!48736))

(assert (not d!48730))

(assert (not d!48702))

(assert (not d!48724))

(assert (not d!48718))

(assert (not b!149742))

(assert (not d!48716))

(assert (not b!149809))

(assert (not d!48704))

(assert (not d!48745))

(assert (not d!48738))

(assert (not d!48668))

(assert (not b!149844))

(assert (not d!48743))

(assert (not d!48630))

(assert (not b!149744))

(assert (not b!149792))

(assert (not d!48628))

(assert (not d!48700))

(assert (not b!149835))

(assert (not b!149778))

(assert (not b!149843))

(assert (not b!149807))

(assert (not d!48676))

(assert (not d!48720))

(assert (not b!149790))

(assert (not b!149763))

(assert (not b!149827))

(assert (not d!48734))

(assert (not d!48634))

(assert (not d!48714))

(assert (not d!48722))

(assert (not b!149729))

(assert (not b!149826))

(assert (not d!48728))

(assert (not b!149828))

(assert (not d!48636))

(assert (not d!48740))

(assert (not b!149805))

(assert (not d!48690))

(assert (not b!149842))

(check-sat)

(pop 1)

(push 1)

(check-sat)

