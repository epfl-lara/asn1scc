; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26610 () Bool)

(assert start!26610)

(declare-fun b!136673 () Bool)

(declare-fun res!113742 () Bool)

(declare-fun e!90790 () Bool)

(assert (=> b!136673 (=> (not res!113742) (not e!90790))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6205 0))(
  ( (array!6206 (arr!3489 (Array (_ BitVec 32) (_ BitVec 8))) (size!2809 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4882 0))(
  ( (BitStream!4883 (buf!3212 array!6205) (currentByte!6015 (_ BitVec 32)) (currentBit!6010 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4882)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!136673 (= res!113742 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2809 (buf!3212 thiss!1634))) ((_ sign_extend 32) (currentByte!6015 thiss!1634)) ((_ sign_extend 32) (currentBit!6010 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!136674 () Bool)

(declare-fun res!113752 () Bool)

(declare-fun e!90799 () Bool)

(assert (=> b!136674 (=> (not res!113752) (not e!90799))))

(declare-datatypes ((Unit!8559 0))(
  ( (Unit!8560) )
))
(declare-datatypes ((tuple2!11878 0))(
  ( (tuple2!11879 (_1!6260 Unit!8559) (_2!6260 BitStream!4882)) )
))
(declare-fun lt!212644 () tuple2!11878)

(declare-fun lt!212641 () tuple2!11878)

(declare-fun isPrefixOf!0 (BitStream!4882 BitStream!4882) Bool)

(assert (=> b!136674 (= res!113752 (isPrefixOf!0 (_2!6260 lt!212644) (_2!6260 lt!212641)))))

(declare-fun res!113754 () Bool)

(assert (=> start!26610 (=> (not res!113754) (not e!90790))))

(declare-fun arr!237 () array!6205)

(assert (=> start!26610 (= res!113754 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2809 arr!237))))))

(assert (=> start!26610 e!90790))

(assert (=> start!26610 true))

(declare-fun array_inv!2598 (array!6205) Bool)

(assert (=> start!26610 (array_inv!2598 arr!237)))

(declare-fun e!90797 () Bool)

(declare-fun inv!12 (BitStream!4882) Bool)

(assert (=> start!26610 (and (inv!12 thiss!1634) e!90797)))

(declare-fun b!136675 () Bool)

(declare-fun res!113745 () Bool)

(assert (=> b!136675 (=> (not res!113745) (not e!90790))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!136675 (= res!113745 (invariant!0 (currentBit!6010 thiss!1634) (currentByte!6015 thiss!1634) (size!2809 (buf!3212 thiss!1634))))))

(declare-fun b!136676 () Bool)

(declare-fun e!90794 () Bool)

(assert (=> b!136676 (= e!90790 (not e!90794))))

(declare-fun res!113746 () Bool)

(assert (=> b!136676 (=> res!113746 e!90794)))

(declare-datatypes ((tuple2!11880 0))(
  ( (tuple2!11881 (_1!6261 BitStream!4882) (_2!6261 array!6205)) )
))
(declare-fun lt!212640 () tuple2!11880)

(declare-fun lt!212651 () tuple2!11880)

(declare-fun arrayRangesEq!212 (array!6205 array!6205 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!136676 (= res!113746 (not (arrayRangesEq!212 (_2!6261 lt!212651) (_2!6261 lt!212640) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!212666 () tuple2!11880)

(assert (=> b!136676 (arrayRangesEq!212 (_2!6261 lt!212651) (_2!6261 lt!212666) #b00000000000000000000000000000000 to!404)))

(declare-datatypes ((tuple2!11882 0))(
  ( (tuple2!11883 (_1!6262 BitStream!4882) (_2!6262 BitStream!4882)) )
))
(declare-fun lt!212645 () tuple2!11882)

(declare-fun lt!212649 () Unit!8559)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4882 array!6205 (_ BitVec 32) (_ BitVec 32)) Unit!8559)

(assert (=> b!136676 (= lt!212649 (readByteArrayLoopArrayPrefixLemma!0 (_1!6262 lt!212645) arr!237 from!447 to!404))))

(declare-fun lt!212646 () array!6205)

(declare-fun readByteArrayLoopPure!0 (BitStream!4882 array!6205 (_ BitVec 32) (_ BitVec 32)) tuple2!11880)

(declare-fun withMovedByteIndex!0 (BitStream!4882 (_ BitVec 32)) BitStream!4882)

(assert (=> b!136676 (= lt!212666 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6262 lt!212645) #b00000000000000000000000000000001) lt!212646 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!212648 () tuple2!11882)

(assert (=> b!136676 (= lt!212640 (readByteArrayLoopPure!0 (_1!6262 lt!212648) lt!212646 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((tuple2!11884 0))(
  ( (tuple2!11885 (_1!6263 BitStream!4882) (_2!6263 (_ BitVec 8))) )
))
(declare-fun lt!212655 () tuple2!11884)

(assert (=> b!136676 (= lt!212646 (array!6206 (store (arr!3489 arr!237) from!447 (_2!6263 lt!212655)) (size!2809 arr!237)))))

(declare-fun lt!212662 () (_ BitVec 32))

(assert (=> b!136676 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2809 (buf!3212 (_2!6260 lt!212641)))) ((_ sign_extend 32) (currentByte!6015 (_2!6260 lt!212644))) ((_ sign_extend 32) (currentBit!6010 (_2!6260 lt!212644))) lt!212662)))

(declare-fun lt!212643 () Unit!8559)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4882 array!6205 (_ BitVec 32)) Unit!8559)

(assert (=> b!136676 (= lt!212643 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6260 lt!212644) (buf!3212 (_2!6260 lt!212641)) lt!212662))))

(assert (=> b!136676 (= (_1!6261 lt!212651) (_2!6262 lt!212645))))

(assert (=> b!136676 (= lt!212651 (readByteArrayLoopPure!0 (_1!6262 lt!212645) arr!237 from!447 to!404))))

(assert (=> b!136676 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2809 (buf!3212 (_2!6260 lt!212641)))) ((_ sign_extend 32) (currentByte!6015 thiss!1634)) ((_ sign_extend 32) (currentBit!6010 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!212642 () Unit!8559)

(assert (=> b!136676 (= lt!212642 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3212 (_2!6260 lt!212641)) (bvsub to!404 from!447)))))

(assert (=> b!136676 (= (_2!6263 lt!212655) (select (arr!3489 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!4882) tuple2!11884)

(assert (=> b!136676 (= lt!212655 (readBytePure!0 (_1!6262 lt!212645)))))

(declare-fun reader!0 (BitStream!4882 BitStream!4882) tuple2!11882)

(assert (=> b!136676 (= lt!212648 (reader!0 (_2!6260 lt!212644) (_2!6260 lt!212641)))))

(assert (=> b!136676 (= lt!212645 (reader!0 thiss!1634 (_2!6260 lt!212641)))))

(declare-fun e!90789 () Bool)

(assert (=> b!136676 e!90789))

(declare-fun res!113750 () Bool)

(assert (=> b!136676 (=> (not res!113750) (not e!90789))))

(declare-fun lt!212652 () tuple2!11884)

(declare-fun lt!212665 () tuple2!11884)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!136676 (= res!113750 (= (bitIndex!0 (size!2809 (buf!3212 (_1!6263 lt!212652))) (currentByte!6015 (_1!6263 lt!212652)) (currentBit!6010 (_1!6263 lt!212652))) (bitIndex!0 (size!2809 (buf!3212 (_1!6263 lt!212665))) (currentByte!6015 (_1!6263 lt!212665)) (currentBit!6010 (_1!6263 lt!212665)))))))

(declare-fun lt!212664 () Unit!8559)

(declare-fun lt!212657 () BitStream!4882)

(declare-fun readBytePrefixLemma!0 (BitStream!4882 BitStream!4882) Unit!8559)

(assert (=> b!136676 (= lt!212664 (readBytePrefixLemma!0 lt!212657 (_2!6260 lt!212641)))))

(assert (=> b!136676 (= lt!212665 (readBytePure!0 (BitStream!4883 (buf!3212 (_2!6260 lt!212641)) (currentByte!6015 thiss!1634) (currentBit!6010 thiss!1634))))))

(assert (=> b!136676 (= lt!212652 (readBytePure!0 lt!212657))))

(assert (=> b!136676 (= lt!212657 (BitStream!4883 (buf!3212 (_2!6260 lt!212644)) (currentByte!6015 thiss!1634) (currentBit!6010 thiss!1634)))))

(declare-fun e!90798 () Bool)

(assert (=> b!136676 e!90798))

(declare-fun res!113748 () Bool)

(assert (=> b!136676 (=> (not res!113748) (not e!90798))))

(assert (=> b!136676 (= res!113748 (isPrefixOf!0 thiss!1634 (_2!6260 lt!212641)))))

(declare-fun lt!212647 () Unit!8559)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4882 BitStream!4882 BitStream!4882) Unit!8559)

(assert (=> b!136676 (= lt!212647 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6260 lt!212644) (_2!6260 lt!212641)))))

(declare-fun e!90791 () Bool)

(assert (=> b!136676 e!90791))

(declare-fun res!113751 () Bool)

(assert (=> b!136676 (=> (not res!113751) (not e!90791))))

(assert (=> b!136676 (= res!113751 (= (size!2809 (buf!3212 (_2!6260 lt!212644))) (size!2809 (buf!3212 (_2!6260 lt!212641)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4882 array!6205 (_ BitVec 32) (_ BitVec 32)) tuple2!11878)

(assert (=> b!136676 (= lt!212641 (appendByteArrayLoop!0 (_2!6260 lt!212644) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!136676 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2809 (buf!3212 (_2!6260 lt!212644)))) ((_ sign_extend 32) (currentByte!6015 (_2!6260 lt!212644))) ((_ sign_extend 32) (currentBit!6010 (_2!6260 lt!212644))) lt!212662)))

(assert (=> b!136676 (= lt!212662 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!212650 () Unit!8559)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4882 BitStream!4882 (_ BitVec 64) (_ BitVec 32)) Unit!8559)

(assert (=> b!136676 (= lt!212650 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6260 lt!212644) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!90800 () Bool)

(assert (=> b!136676 e!90800))

(declare-fun res!113749 () Bool)

(assert (=> b!136676 (=> (not res!113749) (not e!90800))))

(assert (=> b!136676 (= res!113749 (= (size!2809 (buf!3212 thiss!1634)) (size!2809 (buf!3212 (_2!6260 lt!212644)))))))

(declare-fun appendByte!0 (BitStream!4882 (_ BitVec 8)) tuple2!11878)

(assert (=> b!136676 (= lt!212644 (appendByte!0 thiss!1634 (select (arr!3489 arr!237) from!447)))))

(declare-fun b!136677 () Bool)

(declare-fun e!90793 () Bool)

(assert (=> b!136677 (= e!90799 (not e!90793))))

(declare-fun res!113743 () Bool)

(assert (=> b!136677 (=> res!113743 e!90793)))

(declare-fun lt!212660 () tuple2!11882)

(declare-fun lt!212659 () tuple2!11880)

(assert (=> b!136677 (= res!113743 (or (not (= (size!2809 (_2!6261 lt!212659)) (size!2809 arr!237))) (not (= (_1!6261 lt!212659) (_2!6262 lt!212660)))))))

(assert (=> b!136677 (= lt!212659 (readByteArrayLoopPure!0 (_1!6262 lt!212660) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!212653 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!136677 (validate_offset_bits!1 ((_ sign_extend 32) (size!2809 (buf!3212 (_2!6260 lt!212641)))) ((_ sign_extend 32) (currentByte!6015 (_2!6260 lt!212644))) ((_ sign_extend 32) (currentBit!6010 (_2!6260 lt!212644))) lt!212653)))

(declare-fun lt!212663 () Unit!8559)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4882 array!6205 (_ BitVec 64)) Unit!8559)

(assert (=> b!136677 (= lt!212663 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6260 lt!212644) (buf!3212 (_2!6260 lt!212641)) lt!212653))))

(assert (=> b!136677 (= lt!212660 (reader!0 (_2!6260 lt!212644) (_2!6260 lt!212641)))))

(declare-fun b!136678 () Bool)

(declare-fun e!90796 () Bool)

(assert (=> b!136678 (= e!90794 e!90796)))

(declare-fun res!113755 () Bool)

(assert (=> b!136678 (=> res!113755 e!90796)))

(assert (=> b!136678 (= res!113755 (not (= (size!2809 (buf!3212 thiss!1634)) (size!2809 (buf!3212 (_2!6260 lt!212641))))))))

(assert (=> b!136678 (arrayRangesEq!212 arr!237 (_2!6261 lt!212651) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!212658 () Unit!8559)

(declare-fun arrayRangesEqTransitive!14 (array!6205 array!6205 array!6205 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8559)

(assert (=> b!136678 (= lt!212658 (arrayRangesEqTransitive!14 arr!237 (_2!6261 lt!212640) (_2!6261 lt!212651) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!136678 (arrayRangesEq!212 (_2!6261 lt!212640) (_2!6261 lt!212651) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!212654 () Unit!8559)

(declare-fun arrayRangesEqSymmetricLemma!25 (array!6205 array!6205 (_ BitVec 32) (_ BitVec 32)) Unit!8559)

(assert (=> b!136678 (= lt!212654 (arrayRangesEqSymmetricLemma!25 (_2!6261 lt!212651) (_2!6261 lt!212640) #b00000000000000000000000000000000 to!404))))

(declare-fun b!136679 () Bool)

(declare-fun res!113747 () Bool)

(assert (=> b!136679 (=> (not res!113747) (not e!90800))))

(assert (=> b!136679 (= res!113747 (isPrefixOf!0 thiss!1634 (_2!6260 lt!212644)))))

(declare-fun lt!212661 () tuple2!11882)

(declare-fun b!136680 () Bool)

(declare-fun lt!212656 () tuple2!11884)

(assert (=> b!136680 (= e!90800 (and (= (_2!6263 lt!212656) (select (arr!3489 arr!237) from!447)) (= (_1!6263 lt!212656) (_2!6262 lt!212661))))))

(assert (=> b!136680 (= lt!212656 (readBytePure!0 (_1!6262 lt!212661)))))

(assert (=> b!136680 (= lt!212661 (reader!0 thiss!1634 (_2!6260 lt!212644)))))

(declare-fun b!136681 () Bool)

(assert (=> b!136681 (= e!90796 (invariant!0 (currentBit!6010 (_2!6260 lt!212641)) (currentByte!6015 (_2!6260 lt!212641)) (size!2809 (buf!3212 (_2!6260 lt!212641)))))))

(declare-fun b!136682 () Bool)

(assert (=> b!136682 (= e!90789 (= (_2!6263 lt!212652) (_2!6263 lt!212665)))))

(declare-fun b!136683 () Bool)

(declare-fun res!113744 () Bool)

(assert (=> b!136683 (=> (not res!113744) (not e!90790))))

(assert (=> b!136683 (= res!113744 (bvslt from!447 to!404))))

(declare-fun b!136684 () Bool)

(assert (=> b!136684 (= e!90798 (invariant!0 (currentBit!6010 thiss!1634) (currentByte!6015 thiss!1634) (size!2809 (buf!3212 (_2!6260 lt!212644)))))))

(declare-fun b!136685 () Bool)

(assert (=> b!136685 (= e!90797 (array_inv!2598 (buf!3212 thiss!1634)))))

(declare-fun b!136686 () Bool)

(declare-fun res!113741 () Bool)

(assert (=> b!136686 (=> (not res!113741) (not e!90800))))

(assert (=> b!136686 (= res!113741 (= (bitIndex!0 (size!2809 (buf!3212 (_2!6260 lt!212644))) (currentByte!6015 (_2!6260 lt!212644)) (currentBit!6010 (_2!6260 lt!212644))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2809 (buf!3212 thiss!1634)) (currentByte!6015 thiss!1634) (currentBit!6010 thiss!1634)))))))

(declare-fun b!136687 () Bool)

(assert (=> b!136687 (= e!90793 (not (arrayRangesEq!212 arr!237 (_2!6261 lt!212659) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!136688 () Bool)

(assert (=> b!136688 (= e!90791 e!90799)))

(declare-fun res!113753 () Bool)

(assert (=> b!136688 (=> (not res!113753) (not e!90799))))

(assert (=> b!136688 (= res!113753 (= (bitIndex!0 (size!2809 (buf!3212 (_2!6260 lt!212641))) (currentByte!6015 (_2!6260 lt!212641)) (currentBit!6010 (_2!6260 lt!212641))) (bvadd (bitIndex!0 (size!2809 (buf!3212 (_2!6260 lt!212644))) (currentByte!6015 (_2!6260 lt!212644)) (currentBit!6010 (_2!6260 lt!212644))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!212653))))))

(assert (=> b!136688 (= lt!212653 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (= (and start!26610 res!113754) b!136673))

(assert (= (and b!136673 res!113742) b!136683))

(assert (= (and b!136683 res!113744) b!136675))

(assert (= (and b!136675 res!113745) b!136676))

(assert (= (and b!136676 res!113749) b!136686))

(assert (= (and b!136686 res!113741) b!136679))

(assert (= (and b!136679 res!113747) b!136680))

(assert (= (and b!136676 res!113751) b!136688))

(assert (= (and b!136688 res!113753) b!136674))

(assert (= (and b!136674 res!113752) b!136677))

(assert (= (and b!136677 (not res!113743)) b!136687))

(assert (= (and b!136676 res!113748) b!136684))

(assert (= (and b!136676 res!113750) b!136682))

(assert (= (and b!136676 (not res!113746)) b!136678))

(assert (= (and b!136678 (not res!113755)) b!136681))

(assert (= start!26610 b!136685))

(declare-fun m!209393 () Bool)

(assert (=> b!136679 m!209393))

(declare-fun m!209395 () Bool)

(assert (=> b!136688 m!209395))

(declare-fun m!209397 () Bool)

(assert (=> b!136688 m!209397))

(declare-fun m!209399 () Bool)

(assert (=> b!136673 m!209399))

(declare-fun m!209401 () Bool)

(assert (=> b!136680 m!209401))

(declare-fun m!209403 () Bool)

(assert (=> b!136680 m!209403))

(declare-fun m!209405 () Bool)

(assert (=> b!136680 m!209405))

(declare-fun m!209407 () Bool)

(assert (=> b!136687 m!209407))

(declare-fun m!209409 () Bool)

(assert (=> b!136685 m!209409))

(declare-fun m!209411 () Bool)

(assert (=> b!136684 m!209411))

(declare-fun m!209413 () Bool)

(assert (=> b!136678 m!209413))

(declare-fun m!209415 () Bool)

(assert (=> b!136678 m!209415))

(declare-fun m!209417 () Bool)

(assert (=> b!136678 m!209417))

(declare-fun m!209419 () Bool)

(assert (=> b!136678 m!209419))

(declare-fun m!209421 () Bool)

(assert (=> b!136677 m!209421))

(declare-fun m!209423 () Bool)

(assert (=> b!136677 m!209423))

(declare-fun m!209425 () Bool)

(assert (=> b!136677 m!209425))

(declare-fun m!209427 () Bool)

(assert (=> b!136677 m!209427))

(declare-fun m!209429 () Bool)

(assert (=> b!136676 m!209429))

(declare-fun m!209431 () Bool)

(assert (=> b!136676 m!209431))

(declare-fun m!209433 () Bool)

(assert (=> b!136676 m!209433))

(declare-fun m!209435 () Bool)

(assert (=> b!136676 m!209435))

(declare-fun m!209437 () Bool)

(assert (=> b!136676 m!209437))

(declare-fun m!209439 () Bool)

(assert (=> b!136676 m!209439))

(declare-fun m!209441 () Bool)

(assert (=> b!136676 m!209441))

(declare-fun m!209443 () Bool)

(assert (=> b!136676 m!209443))

(declare-fun m!209445 () Bool)

(assert (=> b!136676 m!209445))

(declare-fun m!209447 () Bool)

(assert (=> b!136676 m!209447))

(declare-fun m!209449 () Bool)

(assert (=> b!136676 m!209449))

(declare-fun m!209451 () Bool)

(assert (=> b!136676 m!209451))

(declare-fun m!209453 () Bool)

(assert (=> b!136676 m!209453))

(assert (=> b!136676 m!209449))

(declare-fun m!209455 () Bool)

(assert (=> b!136676 m!209455))

(assert (=> b!136676 m!209401))

(declare-fun m!209457 () Bool)

(assert (=> b!136676 m!209457))

(declare-fun m!209459 () Bool)

(assert (=> b!136676 m!209459))

(declare-fun m!209461 () Bool)

(assert (=> b!136676 m!209461))

(assert (=> b!136676 m!209427))

(declare-fun m!209463 () Bool)

(assert (=> b!136676 m!209463))

(declare-fun m!209465 () Bool)

(assert (=> b!136676 m!209465))

(declare-fun m!209467 () Bool)

(assert (=> b!136676 m!209467))

(declare-fun m!209469 () Bool)

(assert (=> b!136676 m!209469))

(declare-fun m!209471 () Bool)

(assert (=> b!136676 m!209471))

(declare-fun m!209473 () Bool)

(assert (=> b!136676 m!209473))

(declare-fun m!209475 () Bool)

(assert (=> b!136676 m!209475))

(declare-fun m!209477 () Bool)

(assert (=> b!136676 m!209477))

(assert (=> b!136676 m!209401))

(declare-fun m!209479 () Bool)

(assert (=> b!136674 m!209479))

(declare-fun m!209481 () Bool)

(assert (=> b!136675 m!209481))

(declare-fun m!209483 () Bool)

(assert (=> b!136681 m!209483))

(declare-fun m!209485 () Bool)

(assert (=> start!26610 m!209485))

(declare-fun m!209487 () Bool)

(assert (=> start!26610 m!209487))

(assert (=> b!136686 m!209397))

(declare-fun m!209489 () Bool)

(assert (=> b!136686 m!209489))

(push 1)

(assert (not b!136678))

(assert (not b!136686))

(assert (not start!26610))

(assert (not b!136685))

(assert (not b!136681))

(assert (not b!136680))

(assert (not b!136684))

(assert (not b!136679))

(assert (not b!136687))

(assert (not b!136688))

(assert (not b!136677))

(assert (not b!136675))

(assert (not b!136674))

(assert (not b!136676))

(assert (not b!136673))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!44094 () Bool)

(declare-datatypes ((tuple3!520 0))(
  ( (tuple3!521 (_1!6272 Unit!8559) (_2!6272 BitStream!4882) (_3!321 array!6205)) )
))
(declare-fun lt!212831 () tuple3!520)

(declare-fun readByteArrayLoop!0 (BitStream!4882 array!6205 (_ BitVec 32) (_ BitVec 32)) tuple3!520)

(assert (=> d!44094 (= lt!212831 (readByteArrayLoop!0 (_1!6262 lt!212660) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!44094 (= (readByteArrayLoopPure!0 (_1!6262 lt!212660) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11881 (_2!6272 lt!212831) (_3!321 lt!212831)))))

(declare-fun bs!10738 () Bool)

(assert (= bs!10738 d!44094))

(declare-fun m!209687 () Bool)

(assert (=> bs!10738 m!209687))

(assert (=> b!136677 d!44094))

(declare-fun d!44096 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!44096 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2809 (buf!3212 (_2!6260 lt!212641)))) ((_ sign_extend 32) (currentByte!6015 (_2!6260 lt!212644))) ((_ sign_extend 32) (currentBit!6010 (_2!6260 lt!212644))) lt!212653) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2809 (buf!3212 (_2!6260 lt!212641)))) ((_ sign_extend 32) (currentByte!6015 (_2!6260 lt!212644))) ((_ sign_extend 32) (currentBit!6010 (_2!6260 lt!212644)))) lt!212653))))

(declare-fun bs!10739 () Bool)

(assert (= bs!10739 d!44096))

(declare-fun m!209689 () Bool)

(assert (=> bs!10739 m!209689))

(assert (=> b!136677 d!44096))

(declare-fun d!44098 () Bool)

(assert (=> d!44098 (validate_offset_bits!1 ((_ sign_extend 32) (size!2809 (buf!3212 (_2!6260 lt!212641)))) ((_ sign_extend 32) (currentByte!6015 (_2!6260 lt!212644))) ((_ sign_extend 32) (currentBit!6010 (_2!6260 lt!212644))) lt!212653)))

(declare-fun lt!212834 () Unit!8559)

(declare-fun choose!9 (BitStream!4882 array!6205 (_ BitVec 64) BitStream!4882) Unit!8559)

(assert (=> d!44098 (= lt!212834 (choose!9 (_2!6260 lt!212644) (buf!3212 (_2!6260 lt!212641)) lt!212653 (BitStream!4883 (buf!3212 (_2!6260 lt!212641)) (currentByte!6015 (_2!6260 lt!212644)) (currentBit!6010 (_2!6260 lt!212644)))))))

(assert (=> d!44098 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6260 lt!212644) (buf!3212 (_2!6260 lt!212641)) lt!212653) lt!212834)))

(declare-fun bs!10740 () Bool)

(assert (= bs!10740 d!44098))

(assert (=> bs!10740 m!209423))

(declare-fun m!209691 () Bool)

(assert (=> bs!10740 m!209691))

(assert (=> b!136677 d!44098))

(declare-fun b!136795 () Bool)

(declare-fun e!90877 () Unit!8559)

(declare-fun Unit!8565 () Unit!8559)

(assert (=> b!136795 (= e!90877 Unit!8565)))

(declare-fun d!44100 () Bool)

(declare-fun e!90878 () Bool)

(assert (=> d!44100 e!90878))

(declare-fun res!113852 () Bool)

(assert (=> d!44100 (=> (not res!113852) (not e!90878))))

(declare-fun lt!212888 () tuple2!11882)

(assert (=> d!44100 (= res!113852 (isPrefixOf!0 (_1!6262 lt!212888) (_2!6262 lt!212888)))))

(declare-fun lt!212889 () BitStream!4882)

(assert (=> d!44100 (= lt!212888 (tuple2!11883 lt!212889 (_2!6260 lt!212641)))))

(declare-fun lt!212881 () Unit!8559)

(declare-fun lt!212875 () Unit!8559)

(assert (=> d!44100 (= lt!212881 lt!212875)))

(assert (=> d!44100 (isPrefixOf!0 lt!212889 (_2!6260 lt!212641))))

(assert (=> d!44100 (= lt!212875 (lemmaIsPrefixTransitive!0 lt!212889 (_2!6260 lt!212641) (_2!6260 lt!212641)))))

(declare-fun lt!212886 () Unit!8559)

(declare-fun lt!212887 () Unit!8559)

(assert (=> d!44100 (= lt!212886 lt!212887)))

(assert (=> d!44100 (isPrefixOf!0 lt!212889 (_2!6260 lt!212641))))

(assert (=> d!44100 (= lt!212887 (lemmaIsPrefixTransitive!0 lt!212889 (_2!6260 lt!212644) (_2!6260 lt!212641)))))

(declare-fun lt!212885 () Unit!8559)

(assert (=> d!44100 (= lt!212885 e!90877)))

(declare-fun c!7728 () Bool)

(assert (=> d!44100 (= c!7728 (not (= (size!2809 (buf!3212 (_2!6260 lt!212644))) #b00000000000000000000000000000000)))))

(declare-fun lt!212879 () Unit!8559)

(declare-fun lt!212892 () Unit!8559)

(assert (=> d!44100 (= lt!212879 lt!212892)))

(assert (=> d!44100 (isPrefixOf!0 (_2!6260 lt!212641) (_2!6260 lt!212641))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4882) Unit!8559)

(assert (=> d!44100 (= lt!212892 (lemmaIsPrefixRefl!0 (_2!6260 lt!212641)))))

(declare-fun lt!212891 () Unit!8559)

(declare-fun lt!212876 () Unit!8559)

(assert (=> d!44100 (= lt!212891 lt!212876)))

(assert (=> d!44100 (= lt!212876 (lemmaIsPrefixRefl!0 (_2!6260 lt!212641)))))

(declare-fun lt!212890 () Unit!8559)

(declare-fun lt!212877 () Unit!8559)

(assert (=> d!44100 (= lt!212890 lt!212877)))

(assert (=> d!44100 (isPrefixOf!0 lt!212889 lt!212889)))

(assert (=> d!44100 (= lt!212877 (lemmaIsPrefixRefl!0 lt!212889))))

(declare-fun lt!212882 () Unit!8559)

(declare-fun lt!212880 () Unit!8559)

(assert (=> d!44100 (= lt!212882 lt!212880)))

(assert (=> d!44100 (isPrefixOf!0 (_2!6260 lt!212644) (_2!6260 lt!212644))))

(assert (=> d!44100 (= lt!212880 (lemmaIsPrefixRefl!0 (_2!6260 lt!212644)))))

(assert (=> d!44100 (= lt!212889 (BitStream!4883 (buf!3212 (_2!6260 lt!212641)) (currentByte!6015 (_2!6260 lt!212644)) (currentBit!6010 (_2!6260 lt!212644))))))

(assert (=> d!44100 (isPrefixOf!0 (_2!6260 lt!212644) (_2!6260 lt!212641))))

(assert (=> d!44100 (= (reader!0 (_2!6260 lt!212644) (_2!6260 lt!212641)) lt!212888)))

(declare-fun b!136796 () Bool)

(declare-fun res!113853 () Bool)

(assert (=> b!136796 (=> (not res!113853) (not e!90878))))

(assert (=> b!136796 (= res!113853 (isPrefixOf!0 (_1!6262 lt!212888) (_2!6260 lt!212644)))))

(declare-fun b!136797 () Bool)

(declare-fun res!113854 () Bool)

(assert (=> b!136797 (=> (not res!113854) (not e!90878))))

(assert (=> b!136797 (= res!113854 (isPrefixOf!0 (_2!6262 lt!212888) (_2!6260 lt!212641)))))

(declare-fun b!136798 () Bool)

(declare-fun lt!212883 () Unit!8559)

(assert (=> b!136798 (= e!90877 lt!212883)))

(declare-fun lt!212878 () (_ BitVec 64))

(assert (=> b!136798 (= lt!212878 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!212894 () (_ BitVec 64))

(assert (=> b!136798 (= lt!212894 (bitIndex!0 (size!2809 (buf!3212 (_2!6260 lt!212644))) (currentByte!6015 (_2!6260 lt!212644)) (currentBit!6010 (_2!6260 lt!212644))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6205 array!6205 (_ BitVec 64) (_ BitVec 64)) Unit!8559)

(assert (=> b!136798 (= lt!212883 (arrayBitRangesEqSymmetric!0 (buf!3212 (_2!6260 lt!212644)) (buf!3212 (_2!6260 lt!212641)) lt!212878 lt!212894))))

(declare-fun arrayBitRangesEq!0 (array!6205 array!6205 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!136798 (arrayBitRangesEq!0 (buf!3212 (_2!6260 lt!212641)) (buf!3212 (_2!6260 lt!212644)) lt!212878 lt!212894)))

(declare-fun lt!212884 () (_ BitVec 64))

(declare-fun lt!212893 () (_ BitVec 64))

(declare-fun b!136799 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!4882 (_ BitVec 64)) BitStream!4882)

(assert (=> b!136799 (= e!90878 (= (_1!6262 lt!212888) (withMovedBitIndex!0 (_2!6262 lt!212888) (bvsub lt!212884 lt!212893))))))

(assert (=> b!136799 (or (= (bvand lt!212884 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!212893 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!212884 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!212884 lt!212893) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!136799 (= lt!212893 (bitIndex!0 (size!2809 (buf!3212 (_2!6260 lt!212641))) (currentByte!6015 (_2!6260 lt!212641)) (currentBit!6010 (_2!6260 lt!212641))))))

(assert (=> b!136799 (= lt!212884 (bitIndex!0 (size!2809 (buf!3212 (_2!6260 lt!212644))) (currentByte!6015 (_2!6260 lt!212644)) (currentBit!6010 (_2!6260 lt!212644))))))

(assert (= (and d!44100 c!7728) b!136798))

(assert (= (and d!44100 (not c!7728)) b!136795))

(assert (= (and d!44100 res!113852) b!136796))

(assert (= (and b!136796 res!113853) b!136797))

(assert (= (and b!136797 res!113854) b!136799))

(declare-fun m!209693 () Bool)

(assert (=> b!136796 m!209693))

(declare-fun m!209695 () Bool)

(assert (=> b!136799 m!209695))

(assert (=> b!136799 m!209395))

(assert (=> b!136799 m!209397))

(declare-fun m!209697 () Bool)

(assert (=> d!44100 m!209697))

(declare-fun m!209699 () Bool)

(assert (=> d!44100 m!209699))

(declare-fun m!209701 () Bool)

(assert (=> d!44100 m!209701))

(declare-fun m!209703 () Bool)

(assert (=> d!44100 m!209703))

(declare-fun m!209705 () Bool)

(assert (=> d!44100 m!209705))

(declare-fun m!209707 () Bool)

(assert (=> d!44100 m!209707))

(declare-fun m!209709 () Bool)

(assert (=> d!44100 m!209709))

(assert (=> d!44100 m!209479))

(declare-fun m!209711 () Bool)

(assert (=> d!44100 m!209711))

(declare-fun m!209713 () Bool)

(assert (=> d!44100 m!209713))

(declare-fun m!209715 () Bool)

(assert (=> d!44100 m!209715))

(assert (=> b!136798 m!209397))

(declare-fun m!209717 () Bool)

(assert (=> b!136798 m!209717))

(declare-fun m!209719 () Bool)

(assert (=> b!136798 m!209719))

(declare-fun m!209721 () Bool)

(assert (=> b!136797 m!209721))

(assert (=> b!136677 d!44100))

(declare-fun d!44102 () Bool)

(declare-datatypes ((tuple2!11902 0))(
  ( (tuple2!11903 (_1!6273 (_ BitVec 8)) (_2!6273 BitStream!4882)) )
))
(declare-fun lt!212897 () tuple2!11902)

(declare-fun readByte!0 (BitStream!4882) tuple2!11902)

(assert (=> d!44102 (= lt!212897 (readByte!0 (BitStream!4883 (buf!3212 (_2!6260 lt!212641)) (currentByte!6015 thiss!1634) (currentBit!6010 thiss!1634))))))

(assert (=> d!44102 (= (readBytePure!0 (BitStream!4883 (buf!3212 (_2!6260 lt!212641)) (currentByte!6015 thiss!1634) (currentBit!6010 thiss!1634))) (tuple2!11885 (_2!6273 lt!212897) (_1!6273 lt!212897)))))

(declare-fun bs!10741 () Bool)

(assert (= bs!10741 d!44102))

(declare-fun m!209723 () Bool)

(assert (=> bs!10741 m!209723))

(assert (=> b!136676 d!44102))

(declare-fun d!44104 () Bool)

(declare-fun moveByteIndex!0 (BitStream!4882 (_ BitVec 32)) tuple2!11878)

(assert (=> d!44104 (= (withMovedByteIndex!0 (_1!6262 lt!212645) #b00000000000000000000000000000001) (_2!6260 (moveByteIndex!0 (_1!6262 lt!212645) #b00000000000000000000000000000001)))))

(declare-fun bs!10742 () Bool)

(assert (= bs!10742 d!44104))

(declare-fun m!209725 () Bool)

(assert (=> bs!10742 m!209725))

(assert (=> b!136676 d!44104))

(declare-fun d!44106 () Bool)

(assert (=> d!44106 (isPrefixOf!0 thiss!1634 (_2!6260 lt!212641))))

(declare-fun lt!212900 () Unit!8559)

(declare-fun choose!30 (BitStream!4882 BitStream!4882 BitStream!4882) Unit!8559)

(assert (=> d!44106 (= lt!212900 (choose!30 thiss!1634 (_2!6260 lt!212644) (_2!6260 lt!212641)))))

(assert (=> d!44106 (isPrefixOf!0 thiss!1634 (_2!6260 lt!212644))))

(assert (=> d!44106 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6260 lt!212644) (_2!6260 lt!212641)) lt!212900)))

(declare-fun bs!10743 () Bool)

(assert (= bs!10743 d!44106))

(assert (=> bs!10743 m!209429))

(declare-fun m!209727 () Bool)

(assert (=> bs!10743 m!209727))

(assert (=> bs!10743 m!209393))

(assert (=> b!136676 d!44106))

(declare-fun d!44108 () Bool)

(declare-fun lt!212909 () tuple2!11880)

(declare-fun lt!212911 () tuple2!11880)

(assert (=> d!44108 (arrayRangesEq!212 (_2!6261 lt!212909) (_2!6261 lt!212911) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!212912 () Unit!8559)

(declare-fun lt!212910 () BitStream!4882)

(declare-fun choose!35 (BitStream!4882 array!6205 (_ BitVec 32) (_ BitVec 32) tuple2!11880 array!6205 BitStream!4882 tuple2!11880 array!6205) Unit!8559)

(assert (=> d!44108 (= lt!212912 (choose!35 (_1!6262 lt!212645) arr!237 from!447 to!404 lt!212909 (_2!6261 lt!212909) lt!212910 lt!212911 (_2!6261 lt!212911)))))

(assert (=> d!44108 (= lt!212911 (readByteArrayLoopPure!0 lt!212910 (array!6206 (store (arr!3489 arr!237) from!447 (_2!6263 (readBytePure!0 (_1!6262 lt!212645)))) (size!2809 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!44108 (= lt!212910 (withMovedByteIndex!0 (_1!6262 lt!212645) #b00000000000000000000000000000001))))

(assert (=> d!44108 (= lt!212909 (readByteArrayLoopPure!0 (_1!6262 lt!212645) arr!237 from!447 to!404))))

(assert (=> d!44108 (= (readByteArrayLoopArrayPrefixLemma!0 (_1!6262 lt!212645) arr!237 from!447 to!404) lt!212912)))

(declare-fun bs!10745 () Bool)

(assert (= bs!10745 d!44108))

(assert (=> bs!10745 m!209463))

(declare-fun m!209729 () Bool)

(assert (=> bs!10745 m!209729))

(declare-fun m!209731 () Bool)

(assert (=> bs!10745 m!209731))

(assert (=> bs!10745 m!209471))

(declare-fun m!209733 () Bool)

(assert (=> bs!10745 m!209733))

(declare-fun m!209735 () Bool)

(assert (=> bs!10745 m!209735))

(assert (=> bs!10745 m!209449))

(assert (=> b!136676 d!44108))

(declare-fun d!44110 () Bool)

(assert (=> d!44110 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2809 (buf!3212 (_2!6260 lt!212641)))) ((_ sign_extend 32) (currentByte!6015 (_2!6260 lt!212644))) ((_ sign_extend 32) (currentBit!6010 (_2!6260 lt!212644))) lt!212662)))

(declare-fun lt!212915 () Unit!8559)

(declare-fun choose!26 (BitStream!4882 array!6205 (_ BitVec 32) BitStream!4882) Unit!8559)

(assert (=> d!44110 (= lt!212915 (choose!26 (_2!6260 lt!212644) (buf!3212 (_2!6260 lt!212641)) lt!212662 (BitStream!4883 (buf!3212 (_2!6260 lt!212641)) (currentByte!6015 (_2!6260 lt!212644)) (currentBit!6010 (_2!6260 lt!212644)))))))

(assert (=> d!44110 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6260 lt!212644) (buf!3212 (_2!6260 lt!212641)) lt!212662) lt!212915)))

(declare-fun bs!10746 () Bool)

(assert (= bs!10746 d!44110))

(assert (=> bs!10746 m!209441))

(declare-fun m!209737 () Bool)

(assert (=> bs!10746 m!209737))

(assert (=> b!136676 d!44110))

(declare-fun b!136800 () Bool)

(declare-fun e!90879 () Unit!8559)

(declare-fun Unit!8566 () Unit!8559)

(assert (=> b!136800 (= e!90879 Unit!8566)))

(declare-fun d!44112 () Bool)

(declare-fun e!90880 () Bool)

(assert (=> d!44112 e!90880))

(declare-fun res!113855 () Bool)

(assert (=> d!44112 (=> (not res!113855) (not e!90880))))

(declare-fun lt!212929 () tuple2!11882)

(assert (=> d!44112 (= res!113855 (isPrefixOf!0 (_1!6262 lt!212929) (_2!6262 lt!212929)))))

(declare-fun lt!212930 () BitStream!4882)

(assert (=> d!44112 (= lt!212929 (tuple2!11883 lt!212930 (_2!6260 lt!212641)))))

(declare-fun lt!212922 () Unit!8559)

(declare-fun lt!212916 () Unit!8559)

(assert (=> d!44112 (= lt!212922 lt!212916)))

(assert (=> d!44112 (isPrefixOf!0 lt!212930 (_2!6260 lt!212641))))

(assert (=> d!44112 (= lt!212916 (lemmaIsPrefixTransitive!0 lt!212930 (_2!6260 lt!212641) (_2!6260 lt!212641)))))

(declare-fun lt!212927 () Unit!8559)

(declare-fun lt!212928 () Unit!8559)

(assert (=> d!44112 (= lt!212927 lt!212928)))

(assert (=> d!44112 (isPrefixOf!0 lt!212930 (_2!6260 lt!212641))))

(assert (=> d!44112 (= lt!212928 (lemmaIsPrefixTransitive!0 lt!212930 thiss!1634 (_2!6260 lt!212641)))))

(declare-fun lt!212926 () Unit!8559)

(assert (=> d!44112 (= lt!212926 e!90879)))

(declare-fun c!7729 () Bool)

(assert (=> d!44112 (= c!7729 (not (= (size!2809 (buf!3212 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!212920 () Unit!8559)

(declare-fun lt!212933 () Unit!8559)

(assert (=> d!44112 (= lt!212920 lt!212933)))

(assert (=> d!44112 (isPrefixOf!0 (_2!6260 lt!212641) (_2!6260 lt!212641))))

(assert (=> d!44112 (= lt!212933 (lemmaIsPrefixRefl!0 (_2!6260 lt!212641)))))

(declare-fun lt!212932 () Unit!8559)

(declare-fun lt!212917 () Unit!8559)

(assert (=> d!44112 (= lt!212932 lt!212917)))

(assert (=> d!44112 (= lt!212917 (lemmaIsPrefixRefl!0 (_2!6260 lt!212641)))))

(declare-fun lt!212931 () Unit!8559)

(declare-fun lt!212918 () Unit!8559)

(assert (=> d!44112 (= lt!212931 lt!212918)))

(assert (=> d!44112 (isPrefixOf!0 lt!212930 lt!212930)))

(assert (=> d!44112 (= lt!212918 (lemmaIsPrefixRefl!0 lt!212930))))

(declare-fun lt!212923 () Unit!8559)

(declare-fun lt!212921 () Unit!8559)

(assert (=> d!44112 (= lt!212923 lt!212921)))

(assert (=> d!44112 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!44112 (= lt!212921 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!44112 (= lt!212930 (BitStream!4883 (buf!3212 (_2!6260 lt!212641)) (currentByte!6015 thiss!1634) (currentBit!6010 thiss!1634)))))

(assert (=> d!44112 (isPrefixOf!0 thiss!1634 (_2!6260 lt!212641))))

(assert (=> d!44112 (= (reader!0 thiss!1634 (_2!6260 lt!212641)) lt!212929)))

(declare-fun b!136801 () Bool)

(declare-fun res!113856 () Bool)

(assert (=> b!136801 (=> (not res!113856) (not e!90880))))

(assert (=> b!136801 (= res!113856 (isPrefixOf!0 (_1!6262 lt!212929) thiss!1634))))

(declare-fun b!136802 () Bool)

(declare-fun res!113857 () Bool)

(assert (=> b!136802 (=> (not res!113857) (not e!90880))))

(assert (=> b!136802 (= res!113857 (isPrefixOf!0 (_2!6262 lt!212929) (_2!6260 lt!212641)))))

(declare-fun b!136803 () Bool)

(declare-fun lt!212924 () Unit!8559)

(assert (=> b!136803 (= e!90879 lt!212924)))

(declare-fun lt!212919 () (_ BitVec 64))

(assert (=> b!136803 (= lt!212919 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!212935 () (_ BitVec 64))

(assert (=> b!136803 (= lt!212935 (bitIndex!0 (size!2809 (buf!3212 thiss!1634)) (currentByte!6015 thiss!1634) (currentBit!6010 thiss!1634)))))

(assert (=> b!136803 (= lt!212924 (arrayBitRangesEqSymmetric!0 (buf!3212 thiss!1634) (buf!3212 (_2!6260 lt!212641)) lt!212919 lt!212935))))

(assert (=> b!136803 (arrayBitRangesEq!0 (buf!3212 (_2!6260 lt!212641)) (buf!3212 thiss!1634) lt!212919 lt!212935)))

(declare-fun b!136804 () Bool)

(declare-fun lt!212925 () (_ BitVec 64))

(declare-fun lt!212934 () (_ BitVec 64))

(assert (=> b!136804 (= e!90880 (= (_1!6262 lt!212929) (withMovedBitIndex!0 (_2!6262 lt!212929) (bvsub lt!212925 lt!212934))))))

(assert (=> b!136804 (or (= (bvand lt!212925 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!212934 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!212925 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!212925 lt!212934) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!136804 (= lt!212934 (bitIndex!0 (size!2809 (buf!3212 (_2!6260 lt!212641))) (currentByte!6015 (_2!6260 lt!212641)) (currentBit!6010 (_2!6260 lt!212641))))))

(assert (=> b!136804 (= lt!212925 (bitIndex!0 (size!2809 (buf!3212 thiss!1634)) (currentByte!6015 thiss!1634) (currentBit!6010 thiss!1634)))))

(assert (= (and d!44112 c!7729) b!136803))

(assert (= (and d!44112 (not c!7729)) b!136800))

(assert (= (and d!44112 res!113855) b!136801))

(assert (= (and b!136801 res!113856) b!136802))

(assert (= (and b!136802 res!113857) b!136804))

(declare-fun m!209739 () Bool)

(assert (=> b!136801 m!209739))

(declare-fun m!209741 () Bool)

(assert (=> b!136804 m!209741))

(assert (=> b!136804 m!209395))

(assert (=> b!136804 m!209489))

(declare-fun m!209743 () Bool)

(assert (=> d!44112 m!209743))

(declare-fun m!209745 () Bool)

(assert (=> d!44112 m!209745))

(declare-fun m!209747 () Bool)

(assert (=> d!44112 m!209747))

(declare-fun m!209749 () Bool)

(assert (=> d!44112 m!209749))

(assert (=> d!44112 m!209705))

(declare-fun m!209751 () Bool)

(assert (=> d!44112 m!209751))

(declare-fun m!209753 () Bool)

(assert (=> d!44112 m!209753))

(assert (=> d!44112 m!209429))

(declare-fun m!209755 () Bool)

(assert (=> d!44112 m!209755))

(declare-fun m!209757 () Bool)

(assert (=> d!44112 m!209757))

(assert (=> d!44112 m!209715))

(assert (=> b!136803 m!209489))

(declare-fun m!209759 () Bool)

(assert (=> b!136803 m!209759))

(declare-fun m!209761 () Bool)

(assert (=> b!136803 m!209761))

(declare-fun m!209763 () Bool)

(assert (=> b!136802 m!209763))

(assert (=> b!136676 d!44112))

(declare-fun d!44114 () Bool)

(declare-fun e!90883 () Bool)

(assert (=> d!44114 e!90883))

(declare-fun res!113860 () Bool)

(assert (=> d!44114 (=> (not res!113860) (not e!90883))))

(assert (=> d!44114 (= res!113860 (and (or (let ((rhs!3148 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3148 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3148) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!44115 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!44115 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!44115 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3147 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3147 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3147) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!212944 () Unit!8559)

(declare-fun choose!57 (BitStream!4882 BitStream!4882 (_ BitVec 64) (_ BitVec 32)) Unit!8559)

(assert (=> d!44114 (= lt!212944 (choose!57 thiss!1634 (_2!6260 lt!212644) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!44114 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6260 lt!212644) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!212944)))

(declare-fun lt!212942 () (_ BitVec 32))

(declare-fun b!136807 () Bool)

(assert (=> b!136807 (= e!90883 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2809 (buf!3212 (_2!6260 lt!212644)))) ((_ sign_extend 32) (currentByte!6015 (_2!6260 lt!212644))) ((_ sign_extend 32) (currentBit!6010 (_2!6260 lt!212644))) (bvsub (bvsub to!404 from!447) lt!212942)))))

(assert (=> b!136807 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!212942 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!212942) #b10000000000000000000000000000000)))))

(declare-fun lt!212943 () (_ BitVec 64))

(assert (=> b!136807 (= lt!212942 ((_ extract 31 0) lt!212943))))

(assert (=> b!136807 (and (bvslt lt!212943 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!212943 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!136807 (= lt!212943 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!44114 res!113860) b!136807))

(declare-fun m!209765 () Bool)

(assert (=> d!44114 m!209765))

(declare-fun m!209767 () Bool)

(assert (=> b!136807 m!209767))

(assert (=> b!136676 d!44114))

(declare-fun d!44117 () Bool)

(declare-fun e!90892 () Bool)

(assert (=> d!44117 e!90892))

(declare-fun res!113878 () Bool)

(assert (=> d!44117 (=> (not res!113878) (not e!90892))))

(declare-fun lt!212962 () tuple2!11878)

(assert (=> d!44117 (= res!113878 (= (size!2809 (buf!3212 thiss!1634)) (size!2809 (buf!3212 (_2!6260 lt!212962)))))))

(declare-fun choose!6 (BitStream!4882 (_ BitVec 8)) tuple2!11878)

(assert (=> d!44117 (= lt!212962 (choose!6 thiss!1634 (select (arr!3489 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!44117 (validate_offset_byte!0 ((_ sign_extend 32) (size!2809 (buf!3212 thiss!1634))) ((_ sign_extend 32) (currentByte!6015 thiss!1634)) ((_ sign_extend 32) (currentBit!6010 thiss!1634)))))

(assert (=> d!44117 (= (appendByte!0 thiss!1634 (select (arr!3489 arr!237) from!447)) lt!212962)))

(declare-fun b!136823 () Bool)

(declare-fun res!113876 () Bool)

(assert (=> b!136823 (=> (not res!113876) (not e!90892))))

(declare-fun lt!212958 () (_ BitVec 64))

(declare-fun lt!212960 () (_ BitVec 64))

(assert (=> b!136823 (= res!113876 (= (bitIndex!0 (size!2809 (buf!3212 (_2!6260 lt!212962))) (currentByte!6015 (_2!6260 lt!212962)) (currentBit!6010 (_2!6260 lt!212962))) (bvadd lt!212958 lt!212960)))))

(assert (=> b!136823 (or (not (= (bvand lt!212958 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!212960 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!212958 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!212958 lt!212960) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!136823 (= lt!212960 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!136823 (= lt!212958 (bitIndex!0 (size!2809 (buf!3212 thiss!1634)) (currentByte!6015 thiss!1634) (currentBit!6010 thiss!1634)))))

(declare-fun b!136824 () Bool)

(declare-fun res!113877 () Bool)

(assert (=> b!136824 (=> (not res!113877) (not e!90892))))

(assert (=> b!136824 (= res!113877 (isPrefixOf!0 thiss!1634 (_2!6260 lt!212962)))))

(declare-fun lt!212961 () tuple2!11884)

(declare-fun lt!212959 () tuple2!11882)

(declare-fun b!136825 () Bool)

(assert (=> b!136825 (= e!90892 (and (= (_2!6263 lt!212961) (select (arr!3489 arr!237) from!447)) (= (_1!6263 lt!212961) (_2!6262 lt!212959))))))

(assert (=> b!136825 (= lt!212961 (readBytePure!0 (_1!6262 lt!212959)))))

(assert (=> b!136825 (= lt!212959 (reader!0 thiss!1634 (_2!6260 lt!212962)))))

(assert (= (and d!44117 res!113878) b!136823))

(assert (= (and b!136823 res!113876) b!136824))

(assert (= (and b!136824 res!113877) b!136825))

(assert (=> d!44117 m!209401))

(declare-fun m!209775 () Bool)

(assert (=> d!44117 m!209775))

(declare-fun m!209777 () Bool)

(assert (=> d!44117 m!209777))

(declare-fun m!209779 () Bool)

(assert (=> b!136823 m!209779))

(assert (=> b!136823 m!209489))

(declare-fun m!209781 () Bool)

(assert (=> b!136824 m!209781))

(declare-fun m!209783 () Bool)

(assert (=> b!136825 m!209783))

(declare-fun m!209785 () Bool)

(assert (=> b!136825 m!209785))

(assert (=> b!136676 d!44117))

(declare-fun b!136857 () Bool)

(declare-fun lt!213051 () tuple2!11880)

(declare-fun e!90913 () Bool)

(assert (=> b!136857 (= e!90913 (arrayRangesEq!212 arr!237 (_2!6261 lt!213051) #b00000000000000000000000000000000 to!404))))

(declare-fun b!136858 () Bool)

(declare-fun res!113908 () Bool)

(declare-fun e!90911 () Bool)

(assert (=> b!136858 (=> (not res!113908) (not e!90911))))

(declare-fun lt!213049 () tuple2!11878)

(assert (=> b!136858 (= res!113908 (isPrefixOf!0 (_2!6260 lt!212644) (_2!6260 lt!213049)))))

(declare-fun d!44129 () Bool)

(assert (=> d!44129 e!90911))

(declare-fun res!113905 () Bool)

(assert (=> d!44129 (=> (not res!113905) (not e!90911))))

(assert (=> d!44129 (= res!113905 (= (size!2809 (buf!3212 (_2!6260 lt!212644))) (size!2809 (buf!3212 (_2!6260 lt!213049)))))))

(declare-fun choose!64 (BitStream!4882 array!6205 (_ BitVec 32) (_ BitVec 32)) tuple2!11878)

(assert (=> d!44129 (= lt!213049 (choose!64 (_2!6260 lt!212644) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!44129 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2809 arr!237)))))

(assert (=> d!44129 (= (appendByteArrayLoop!0 (_2!6260 lt!212644) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!213049)))

(declare-fun b!136859 () Bool)

(declare-fun res!113906 () Bool)

(assert (=> b!136859 (=> (not res!113906) (not e!90911))))

(declare-fun lt!213047 () (_ BitVec 64))

(declare-fun lt!213052 () (_ BitVec 64))

(assert (=> b!136859 (= res!113906 (= (bitIndex!0 (size!2809 (buf!3212 (_2!6260 lt!213049))) (currentByte!6015 (_2!6260 lt!213049)) (currentBit!6010 (_2!6260 lt!213049))) (bvadd lt!213047 lt!213052)))))

(assert (=> b!136859 (or (not (= (bvand lt!213047 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!213052 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!213047 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!213047 lt!213052) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!213044 () (_ BitVec 64))

(assert (=> b!136859 (= lt!213052 (bvmul lt!213044 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!136859 (or (= lt!213044 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!213044 #b0000000000000000000000000000000000000000000000000000000000001000) lt!213044)))))

(assert (=> b!136859 (= lt!213044 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!136859 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!136859 (= lt!213047 (bitIndex!0 (size!2809 (buf!3212 (_2!6260 lt!212644))) (currentByte!6015 (_2!6260 lt!212644)) (currentBit!6010 (_2!6260 lt!212644))))))

(declare-fun b!136860 () Bool)

(declare-fun e!90912 () Bool)

(declare-fun lt!213045 () (_ BitVec 64))

(assert (=> b!136860 (= e!90912 (validate_offset_bits!1 ((_ sign_extend 32) (size!2809 (buf!3212 (_2!6260 lt!212644)))) ((_ sign_extend 32) (currentByte!6015 (_2!6260 lt!212644))) ((_ sign_extend 32) (currentBit!6010 (_2!6260 lt!212644))) lt!213045))))

(declare-fun b!136861 () Bool)

(assert (=> b!136861 (= e!90911 e!90913)))

(declare-fun res!113907 () Bool)

(assert (=> b!136861 (=> (not res!113907) (not e!90913))))

(declare-fun lt!213050 () tuple2!11882)

(assert (=> b!136861 (= res!113907 (and (= (size!2809 (_2!6261 lt!213051)) (size!2809 arr!237)) (= (_1!6261 lt!213051) (_2!6262 lt!213050))))))

(assert (=> b!136861 (= lt!213051 (readByteArrayLoopPure!0 (_1!6262 lt!213050) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!213048 () Unit!8559)

(declare-fun lt!213046 () Unit!8559)

(assert (=> b!136861 (= lt!213048 lt!213046)))

(assert (=> b!136861 (validate_offset_bits!1 ((_ sign_extend 32) (size!2809 (buf!3212 (_2!6260 lt!213049)))) ((_ sign_extend 32) (currentByte!6015 (_2!6260 lt!212644))) ((_ sign_extend 32) (currentBit!6010 (_2!6260 lt!212644))) lt!213045)))

(assert (=> b!136861 (= lt!213046 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6260 lt!212644) (buf!3212 (_2!6260 lt!213049)) lt!213045))))

(assert (=> b!136861 e!90912))

(declare-fun res!113904 () Bool)

(assert (=> b!136861 (=> (not res!113904) (not e!90912))))

(assert (=> b!136861 (= res!113904 (and (= (size!2809 (buf!3212 (_2!6260 lt!212644))) (size!2809 (buf!3212 (_2!6260 lt!213049)))) (bvsge lt!213045 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!136861 (= lt!213045 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!136861 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!136861 (= lt!213050 (reader!0 (_2!6260 lt!212644) (_2!6260 lt!213049)))))

(assert (= (and d!44129 res!113905) b!136859))

(assert (= (and b!136859 res!113906) b!136858))

(assert (= (and b!136858 res!113908) b!136861))

(assert (= (and b!136861 res!113904) b!136860))

(assert (= (and b!136861 res!113907) b!136857))

(declare-fun m!209825 () Bool)

(assert (=> b!136857 m!209825))

(declare-fun m!209827 () Bool)

(assert (=> b!136861 m!209827))

(declare-fun m!209829 () Bool)

(assert (=> b!136861 m!209829))

(declare-fun m!209831 () Bool)

(assert (=> b!136861 m!209831))

(declare-fun m!209833 () Bool)

(assert (=> b!136861 m!209833))

(declare-fun m!209835 () Bool)

(assert (=> b!136860 m!209835))

(declare-fun m!209837 () Bool)

(assert (=> b!136859 m!209837))

(assert (=> b!136859 m!209397))

(declare-fun m!209839 () Bool)

(assert (=> b!136858 m!209839))

(declare-fun m!209841 () Bool)

(assert (=> d!44129 m!209841))

(assert (=> b!136676 d!44129))

(declare-fun d!44139 () Bool)

(assert (=> d!44139 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2809 (buf!3212 (_2!6260 lt!212641)))) ((_ sign_extend 32) (currentByte!6015 (_2!6260 lt!212644))) ((_ sign_extend 32) (currentBit!6010 (_2!6260 lt!212644))) lt!212662) (bvsle ((_ sign_extend 32) lt!212662) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2809 (buf!3212 (_2!6260 lt!212641)))) ((_ sign_extend 32) (currentByte!6015 (_2!6260 lt!212644))) ((_ sign_extend 32) (currentBit!6010 (_2!6260 lt!212644)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10750 () Bool)

(assert (= bs!10750 d!44139))

(assert (=> bs!10750 m!209689))

(assert (=> b!136676 d!44139))

(declare-fun d!44141 () Bool)

(assert (=> d!44141 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2809 (buf!3212 (_2!6260 lt!212641)))) ((_ sign_extend 32) (currentByte!6015 thiss!1634)) ((_ sign_extend 32) (currentBit!6010 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!213053 () Unit!8559)

(assert (=> d!44141 (= lt!213053 (choose!26 thiss!1634 (buf!3212 (_2!6260 lt!212641)) (bvsub to!404 from!447) (BitStream!4883 (buf!3212 (_2!6260 lt!212641)) (currentByte!6015 thiss!1634) (currentBit!6010 thiss!1634))))))

(assert (=> d!44141 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3212 (_2!6260 lt!212641)) (bvsub to!404 from!447)) lt!213053)))

(declare-fun bs!10751 () Bool)

(assert (= bs!10751 d!44141))

(assert (=> bs!10751 m!209439))

(declare-fun m!209843 () Bool)

(assert (=> bs!10751 m!209843))

(assert (=> b!136676 d!44141))

(declare-fun d!44143 () Bool)

(declare-fun res!113913 () Bool)

(declare-fun e!90918 () Bool)

(assert (=> d!44143 (=> res!113913 e!90918)))

(assert (=> d!44143 (= res!113913 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!44143 (= (arrayRangesEq!212 (_2!6261 lt!212651) (_2!6261 lt!212666) #b00000000000000000000000000000000 to!404) e!90918)))

(declare-fun b!136866 () Bool)

(declare-fun e!90919 () Bool)

(assert (=> b!136866 (= e!90918 e!90919)))

(declare-fun res!113914 () Bool)

(assert (=> b!136866 (=> (not res!113914) (not e!90919))))

(assert (=> b!136866 (= res!113914 (= (select (arr!3489 (_2!6261 lt!212651)) #b00000000000000000000000000000000) (select (arr!3489 (_2!6261 lt!212666)) #b00000000000000000000000000000000)))))

(declare-fun b!136867 () Bool)

(assert (=> b!136867 (= e!90919 (arrayRangesEq!212 (_2!6261 lt!212651) (_2!6261 lt!212666) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!44143 (not res!113913)) b!136866))

(assert (= (and b!136866 res!113914) b!136867))

(declare-fun m!209845 () Bool)

(assert (=> b!136866 m!209845))

(declare-fun m!209847 () Bool)

(assert (=> b!136866 m!209847))

(declare-fun m!209849 () Bool)

(assert (=> b!136867 m!209849))

(assert (=> b!136676 d!44143))

(declare-fun d!44145 () Bool)

(declare-fun e!90922 () Bool)

(assert (=> d!44145 e!90922))

(declare-fun res!113920 () Bool)

(assert (=> d!44145 (=> (not res!113920) (not e!90922))))

(declare-fun lt!213071 () (_ BitVec 64))

(declare-fun lt!213069 () (_ BitVec 64))

(declare-fun lt!213067 () (_ BitVec 64))

(assert (=> d!44145 (= res!113920 (= lt!213069 (bvsub lt!213071 lt!213067)))))

(assert (=> d!44145 (or (= (bvand lt!213071 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!213067 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!213071 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!213071 lt!213067) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44145 (= lt!213067 (remainingBits!0 ((_ sign_extend 32) (size!2809 (buf!3212 (_1!6263 lt!212665)))) ((_ sign_extend 32) (currentByte!6015 (_1!6263 lt!212665))) ((_ sign_extend 32) (currentBit!6010 (_1!6263 lt!212665)))))))

(declare-fun lt!213070 () (_ BitVec 64))

(declare-fun lt!213066 () (_ BitVec 64))

(assert (=> d!44145 (= lt!213071 (bvmul lt!213070 lt!213066))))

(assert (=> d!44145 (or (= lt!213070 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!213066 (bvsdiv (bvmul lt!213070 lt!213066) lt!213070)))))

(assert (=> d!44145 (= lt!213066 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44145 (= lt!213070 ((_ sign_extend 32) (size!2809 (buf!3212 (_1!6263 lt!212665)))))))

(assert (=> d!44145 (= lt!213069 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6015 (_1!6263 lt!212665))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6010 (_1!6263 lt!212665)))))))

(assert (=> d!44145 (invariant!0 (currentBit!6010 (_1!6263 lt!212665)) (currentByte!6015 (_1!6263 lt!212665)) (size!2809 (buf!3212 (_1!6263 lt!212665))))))

(assert (=> d!44145 (= (bitIndex!0 (size!2809 (buf!3212 (_1!6263 lt!212665))) (currentByte!6015 (_1!6263 lt!212665)) (currentBit!6010 (_1!6263 lt!212665))) lt!213069)))

(declare-fun b!136872 () Bool)

(declare-fun res!113919 () Bool)

(assert (=> b!136872 (=> (not res!113919) (not e!90922))))

(assert (=> b!136872 (= res!113919 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!213069))))

(declare-fun b!136873 () Bool)

(declare-fun lt!213068 () (_ BitVec 64))

(assert (=> b!136873 (= e!90922 (bvsle lt!213069 (bvmul lt!213068 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!136873 (or (= lt!213068 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!213068 #b0000000000000000000000000000000000000000000000000000000000001000) lt!213068)))))

(assert (=> b!136873 (= lt!213068 ((_ sign_extend 32) (size!2809 (buf!3212 (_1!6263 lt!212665)))))))

(assert (= (and d!44145 res!113920) b!136872))

(assert (= (and b!136872 res!113919) b!136873))

(declare-fun m!209851 () Bool)

(assert (=> d!44145 m!209851))

(declare-fun m!209853 () Bool)

(assert (=> d!44145 m!209853))

(assert (=> b!136676 d!44145))

(declare-fun d!44147 () Bool)

(declare-fun lt!213072 () tuple3!520)

(assert (=> d!44147 (= lt!213072 (readByteArrayLoop!0 (_1!6262 lt!212648) lt!212646 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!44147 (= (readByteArrayLoopPure!0 (_1!6262 lt!212648) lt!212646 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11881 (_2!6272 lt!213072) (_3!321 lt!213072)))))

(declare-fun bs!10752 () Bool)

(assert (= bs!10752 d!44147))

(declare-fun m!209855 () Bool)

(assert (=> bs!10752 m!209855))

(assert (=> b!136676 d!44147))

(declare-fun d!44149 () Bool)

(declare-fun e!90925 () Bool)

(assert (=> d!44149 e!90925))

(declare-fun res!113923 () Bool)

(assert (=> d!44149 (=> (not res!113923) (not e!90925))))

(declare-fun lt!213084 () tuple2!11884)

(declare-fun lt!213082 () tuple2!11884)

(assert (=> d!44149 (= res!113923 (= (bitIndex!0 (size!2809 (buf!3212 (_1!6263 lt!213084))) (currentByte!6015 (_1!6263 lt!213084)) (currentBit!6010 (_1!6263 lt!213084))) (bitIndex!0 (size!2809 (buf!3212 (_1!6263 lt!213082))) (currentByte!6015 (_1!6263 lt!213082)) (currentBit!6010 (_1!6263 lt!213082)))))))

(declare-fun lt!213083 () BitStream!4882)

(declare-fun lt!213081 () Unit!8559)

(declare-fun choose!14 (BitStream!4882 BitStream!4882 BitStream!4882 tuple2!11884 tuple2!11884 BitStream!4882 (_ BitVec 8) tuple2!11884 tuple2!11884 BitStream!4882 (_ BitVec 8)) Unit!8559)

(assert (=> d!44149 (= lt!213081 (choose!14 lt!212657 (_2!6260 lt!212641) lt!213083 lt!213084 (tuple2!11885 (_1!6263 lt!213084) (_2!6263 lt!213084)) (_1!6263 lt!213084) (_2!6263 lt!213084) lt!213082 (tuple2!11885 (_1!6263 lt!213082) (_2!6263 lt!213082)) (_1!6263 lt!213082) (_2!6263 lt!213082)))))

(assert (=> d!44149 (= lt!213082 (readBytePure!0 lt!213083))))

(assert (=> d!44149 (= lt!213084 (readBytePure!0 lt!212657))))

(assert (=> d!44149 (= lt!213083 (BitStream!4883 (buf!3212 (_2!6260 lt!212641)) (currentByte!6015 lt!212657) (currentBit!6010 lt!212657)))))

(assert (=> d!44149 (= (readBytePrefixLemma!0 lt!212657 (_2!6260 lt!212641)) lt!213081)))

(declare-fun b!136876 () Bool)

(assert (=> b!136876 (= e!90925 (= (_2!6263 lt!213084) (_2!6263 lt!213082)))))

(assert (= (and d!44149 res!113923) b!136876))

(declare-fun m!209857 () Bool)

(assert (=> d!44149 m!209857))

(assert (=> d!44149 m!209473))

(declare-fun m!209859 () Bool)

(assert (=> d!44149 m!209859))

(declare-fun m!209861 () Bool)

(assert (=> d!44149 m!209861))

(declare-fun m!209863 () Bool)

(assert (=> d!44149 m!209863))

(assert (=> b!136676 d!44149))

(declare-fun d!44151 () Bool)

(declare-fun res!113924 () Bool)

(declare-fun e!90926 () Bool)

(assert (=> d!44151 (=> res!113924 e!90926)))

(assert (=> d!44151 (= res!113924 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!44151 (= (arrayRangesEq!212 (_2!6261 lt!212651) (_2!6261 lt!212640) #b00000000000000000000000000000000 to!404) e!90926)))

(declare-fun b!136877 () Bool)

(declare-fun e!90927 () Bool)

(assert (=> b!136877 (= e!90926 e!90927)))

(declare-fun res!113925 () Bool)

(assert (=> b!136877 (=> (not res!113925) (not e!90927))))

(assert (=> b!136877 (= res!113925 (= (select (arr!3489 (_2!6261 lt!212651)) #b00000000000000000000000000000000) (select (arr!3489 (_2!6261 lt!212640)) #b00000000000000000000000000000000)))))

(declare-fun b!136878 () Bool)

(assert (=> b!136878 (= e!90927 (arrayRangesEq!212 (_2!6261 lt!212651) (_2!6261 lt!212640) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!44151 (not res!113924)) b!136877))

(assert (= (and b!136877 res!113925) b!136878))

(assert (=> b!136877 m!209845))

(declare-fun m!209865 () Bool)

(assert (=> b!136877 m!209865))

(declare-fun m!209867 () Bool)

(assert (=> b!136878 m!209867))

(assert (=> b!136676 d!44151))

(declare-fun d!44153 () Bool)

(declare-fun lt!213085 () tuple2!11902)

(assert (=> d!44153 (= lt!213085 (readByte!0 (_1!6262 lt!212645)))))

(assert (=> d!44153 (= (readBytePure!0 (_1!6262 lt!212645)) (tuple2!11885 (_2!6273 lt!213085) (_1!6273 lt!213085)))))

(declare-fun bs!10753 () Bool)

(assert (= bs!10753 d!44153))

(declare-fun m!209869 () Bool)

(assert (=> bs!10753 m!209869))

(assert (=> b!136676 d!44153))

(declare-fun d!44155 () Bool)

(assert (=> d!44155 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2809 (buf!3212 (_2!6260 lt!212644)))) ((_ sign_extend 32) (currentByte!6015 (_2!6260 lt!212644))) ((_ sign_extend 32) (currentBit!6010 (_2!6260 lt!212644))) lt!212662) (bvsle ((_ sign_extend 32) lt!212662) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2809 (buf!3212 (_2!6260 lt!212644)))) ((_ sign_extend 32) (currentByte!6015 (_2!6260 lt!212644))) ((_ sign_extend 32) (currentBit!6010 (_2!6260 lt!212644)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10754 () Bool)

(assert (= bs!10754 d!44155))

(declare-fun m!209871 () Bool)

(assert (=> bs!10754 m!209871))

(assert (=> b!136676 d!44155))

(assert (=> b!136676 d!44100))

(declare-fun d!44157 () Bool)

(declare-fun lt!213086 () tuple3!520)

(assert (=> d!44157 (= lt!213086 (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!6262 lt!212645) #b00000000000000000000000000000001) lt!212646 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!44157 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6262 lt!212645) #b00000000000000000000000000000001) lt!212646 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11881 (_2!6272 lt!213086) (_3!321 lt!213086)))))

(declare-fun bs!10755 () Bool)

(assert (= bs!10755 d!44157))

(assert (=> bs!10755 m!209449))

(declare-fun m!209873 () Bool)

(assert (=> bs!10755 m!209873))

(assert (=> b!136676 d!44157))

(declare-fun d!44159 () Bool)

(declare-fun e!90928 () Bool)

(assert (=> d!44159 e!90928))

(declare-fun res!113927 () Bool)

(assert (=> d!44159 (=> (not res!113927) (not e!90928))))

(declare-fun lt!213092 () (_ BitVec 64))

(declare-fun lt!213090 () (_ BitVec 64))

(declare-fun lt!213088 () (_ BitVec 64))

(assert (=> d!44159 (= res!113927 (= lt!213090 (bvsub lt!213092 lt!213088)))))

(assert (=> d!44159 (or (= (bvand lt!213092 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!213088 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!213092 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!213092 lt!213088) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44159 (= lt!213088 (remainingBits!0 ((_ sign_extend 32) (size!2809 (buf!3212 (_1!6263 lt!212652)))) ((_ sign_extend 32) (currentByte!6015 (_1!6263 lt!212652))) ((_ sign_extend 32) (currentBit!6010 (_1!6263 lt!212652)))))))

(declare-fun lt!213091 () (_ BitVec 64))

(declare-fun lt!213087 () (_ BitVec 64))

(assert (=> d!44159 (= lt!213092 (bvmul lt!213091 lt!213087))))

(assert (=> d!44159 (or (= lt!213091 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!213087 (bvsdiv (bvmul lt!213091 lt!213087) lt!213091)))))

(assert (=> d!44159 (= lt!213087 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44159 (= lt!213091 ((_ sign_extend 32) (size!2809 (buf!3212 (_1!6263 lt!212652)))))))

(assert (=> d!44159 (= lt!213090 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6015 (_1!6263 lt!212652))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6010 (_1!6263 lt!212652)))))))

(assert (=> d!44159 (invariant!0 (currentBit!6010 (_1!6263 lt!212652)) (currentByte!6015 (_1!6263 lt!212652)) (size!2809 (buf!3212 (_1!6263 lt!212652))))))

(assert (=> d!44159 (= (bitIndex!0 (size!2809 (buf!3212 (_1!6263 lt!212652))) (currentByte!6015 (_1!6263 lt!212652)) (currentBit!6010 (_1!6263 lt!212652))) lt!213090)))

(declare-fun b!136879 () Bool)

(declare-fun res!113926 () Bool)

(assert (=> b!136879 (=> (not res!113926) (not e!90928))))

(assert (=> b!136879 (= res!113926 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!213090))))

(declare-fun b!136880 () Bool)

(declare-fun lt!213089 () (_ BitVec 64))

(assert (=> b!136880 (= e!90928 (bvsle lt!213090 (bvmul lt!213089 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!136880 (or (= lt!213089 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!213089 #b0000000000000000000000000000000000000000000000000000000000001000) lt!213089)))))

(assert (=> b!136880 (= lt!213089 ((_ sign_extend 32) (size!2809 (buf!3212 (_1!6263 lt!212652)))))))

(assert (= (and d!44159 res!113927) b!136879))

(assert (= (and b!136879 res!113926) b!136880))

(declare-fun m!209875 () Bool)

(assert (=> d!44159 m!209875))

(declare-fun m!209877 () Bool)

(assert (=> d!44159 m!209877))

(assert (=> b!136676 d!44159))

(declare-fun d!44161 () Bool)

(assert (=> d!44161 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2809 (buf!3212 (_2!6260 lt!212641)))) ((_ sign_extend 32) (currentByte!6015 thiss!1634)) ((_ sign_extend 32) (currentBit!6010 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2809 (buf!3212 (_2!6260 lt!212641)))) ((_ sign_extend 32) (currentByte!6015 thiss!1634)) ((_ sign_extend 32) (currentBit!6010 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10756 () Bool)

(assert (= bs!10756 d!44161))

(declare-fun m!209879 () Bool)

(assert (=> bs!10756 m!209879))

(assert (=> b!136676 d!44161))

(declare-fun d!44163 () Bool)

(declare-fun lt!213093 () tuple2!11902)

(assert (=> d!44163 (= lt!213093 (readByte!0 lt!212657))))

(assert (=> d!44163 (= (readBytePure!0 lt!212657) (tuple2!11885 (_2!6273 lt!213093) (_1!6273 lt!213093)))))

(declare-fun bs!10757 () Bool)

(assert (= bs!10757 d!44163))

(declare-fun m!209881 () Bool)

(assert (=> bs!10757 m!209881))

(assert (=> b!136676 d!44163))

(declare-fun d!44165 () Bool)

(declare-fun lt!213094 () tuple3!520)

(assert (=> d!44165 (= lt!213094 (readByteArrayLoop!0 (_1!6262 lt!212645) arr!237 from!447 to!404))))

(assert (=> d!44165 (= (readByteArrayLoopPure!0 (_1!6262 lt!212645) arr!237 from!447 to!404) (tuple2!11881 (_2!6272 lt!213094) (_3!321 lt!213094)))))

(declare-fun bs!10758 () Bool)

(assert (= bs!10758 d!44165))

(declare-fun m!209883 () Bool)

(assert (=> bs!10758 m!209883))

(assert (=> b!136676 d!44165))

(declare-fun d!44167 () Bool)

(declare-fun res!113935 () Bool)

(declare-fun e!90934 () Bool)

(assert (=> d!44167 (=> (not res!113935) (not e!90934))))

(assert (=> d!44167 (= res!113935 (= (size!2809 (buf!3212 thiss!1634)) (size!2809 (buf!3212 (_2!6260 lt!212641)))))))

(assert (=> d!44167 (= (isPrefixOf!0 thiss!1634 (_2!6260 lt!212641)) e!90934)))

(declare-fun b!136887 () Bool)

(declare-fun res!113936 () Bool)

(assert (=> b!136887 (=> (not res!113936) (not e!90934))))

(assert (=> b!136887 (= res!113936 (bvsle (bitIndex!0 (size!2809 (buf!3212 thiss!1634)) (currentByte!6015 thiss!1634) (currentBit!6010 thiss!1634)) (bitIndex!0 (size!2809 (buf!3212 (_2!6260 lt!212641))) (currentByte!6015 (_2!6260 lt!212641)) (currentBit!6010 (_2!6260 lt!212641)))))))

(declare-fun b!136888 () Bool)

(declare-fun e!90933 () Bool)

(assert (=> b!136888 (= e!90934 e!90933)))

(declare-fun res!113934 () Bool)

(assert (=> b!136888 (=> res!113934 e!90933)))

(assert (=> b!136888 (= res!113934 (= (size!2809 (buf!3212 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!136889 () Bool)

(assert (=> b!136889 (= e!90933 (arrayBitRangesEq!0 (buf!3212 thiss!1634) (buf!3212 (_2!6260 lt!212641)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2809 (buf!3212 thiss!1634)) (currentByte!6015 thiss!1634) (currentBit!6010 thiss!1634))))))

(assert (= (and d!44167 res!113935) b!136887))

(assert (= (and b!136887 res!113936) b!136888))

(assert (= (and b!136888 (not res!113934)) b!136889))

(assert (=> b!136887 m!209489))

(assert (=> b!136887 m!209395))

(assert (=> b!136889 m!209489))

(assert (=> b!136889 m!209489))

(declare-fun m!209885 () Bool)

(assert (=> b!136889 m!209885))

(assert (=> b!136676 d!44167))

(declare-fun d!44169 () Bool)

(declare-fun res!113937 () Bool)

(declare-fun e!90935 () Bool)

(assert (=> d!44169 (=> res!113937 e!90935)))

(assert (=> d!44169 (= res!113937 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!44169 (= (arrayRangesEq!212 arr!237 (_2!6261 lt!212659) #b00000000000000000000000000000000 to!404) e!90935)))

(declare-fun b!136890 () Bool)

(declare-fun e!90936 () Bool)

(assert (=> b!136890 (= e!90935 e!90936)))

(declare-fun res!113938 () Bool)

(assert (=> b!136890 (=> (not res!113938) (not e!90936))))

(assert (=> b!136890 (= res!113938 (= (select (arr!3489 arr!237) #b00000000000000000000000000000000) (select (arr!3489 (_2!6261 lt!212659)) #b00000000000000000000000000000000)))))

(declare-fun b!136891 () Bool)

(assert (=> b!136891 (= e!90936 (arrayRangesEq!212 arr!237 (_2!6261 lt!212659) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!44169 (not res!113937)) b!136890))

(assert (= (and b!136890 res!113938) b!136891))

(declare-fun m!209887 () Bool)

(assert (=> b!136890 m!209887))

(declare-fun m!209889 () Bool)

(assert (=> b!136890 m!209889))

(declare-fun m!209891 () Bool)

(assert (=> b!136891 m!209891))

(assert (=> b!136687 d!44169))

(declare-fun d!44171 () Bool)

(declare-fun e!90937 () Bool)

(assert (=> d!44171 e!90937))

(declare-fun res!113940 () Bool)

(assert (=> d!44171 (=> (not res!113940) (not e!90937))))

(declare-fun lt!213098 () (_ BitVec 64))

(declare-fun lt!213100 () (_ BitVec 64))

(declare-fun lt!213096 () (_ BitVec 64))

(assert (=> d!44171 (= res!113940 (= lt!213098 (bvsub lt!213100 lt!213096)))))

(assert (=> d!44171 (or (= (bvand lt!213100 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!213096 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!213100 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!213100 lt!213096) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44171 (= lt!213096 (remainingBits!0 ((_ sign_extend 32) (size!2809 (buf!3212 (_2!6260 lt!212644)))) ((_ sign_extend 32) (currentByte!6015 (_2!6260 lt!212644))) ((_ sign_extend 32) (currentBit!6010 (_2!6260 lt!212644)))))))

(declare-fun lt!213099 () (_ BitVec 64))

(declare-fun lt!213095 () (_ BitVec 64))

(assert (=> d!44171 (= lt!213100 (bvmul lt!213099 lt!213095))))

(assert (=> d!44171 (or (= lt!213099 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!213095 (bvsdiv (bvmul lt!213099 lt!213095) lt!213099)))))

(assert (=> d!44171 (= lt!213095 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44171 (= lt!213099 ((_ sign_extend 32) (size!2809 (buf!3212 (_2!6260 lt!212644)))))))

(assert (=> d!44171 (= lt!213098 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6015 (_2!6260 lt!212644))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6010 (_2!6260 lt!212644)))))))

(assert (=> d!44171 (invariant!0 (currentBit!6010 (_2!6260 lt!212644)) (currentByte!6015 (_2!6260 lt!212644)) (size!2809 (buf!3212 (_2!6260 lt!212644))))))

(assert (=> d!44171 (= (bitIndex!0 (size!2809 (buf!3212 (_2!6260 lt!212644))) (currentByte!6015 (_2!6260 lt!212644)) (currentBit!6010 (_2!6260 lt!212644))) lt!213098)))

(declare-fun b!136892 () Bool)

(declare-fun res!113939 () Bool)

(assert (=> b!136892 (=> (not res!113939) (not e!90937))))

(assert (=> b!136892 (= res!113939 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!213098))))

(declare-fun b!136893 () Bool)

(declare-fun lt!213097 () (_ BitVec 64))

(assert (=> b!136893 (= e!90937 (bvsle lt!213098 (bvmul lt!213097 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!136893 (or (= lt!213097 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!213097 #b0000000000000000000000000000000000000000000000000000000000001000) lt!213097)))))

(assert (=> b!136893 (= lt!213097 ((_ sign_extend 32) (size!2809 (buf!3212 (_2!6260 lt!212644)))))))

(assert (= (and d!44171 res!113940) b!136892))

(assert (= (and b!136892 res!113939) b!136893))

(assert (=> d!44171 m!209871))

(declare-fun m!209893 () Bool)

(assert (=> d!44171 m!209893))

(assert (=> b!136686 d!44171))

(declare-fun d!44173 () Bool)

(declare-fun e!90938 () Bool)

(assert (=> d!44173 e!90938))

(declare-fun res!113942 () Bool)

(assert (=> d!44173 (=> (not res!113942) (not e!90938))))

(declare-fun lt!213108 () (_ BitVec 64))

(declare-fun lt!213106 () (_ BitVec 64))

(declare-fun lt!213104 () (_ BitVec 64))

(assert (=> d!44173 (= res!113942 (= lt!213106 (bvsub lt!213108 lt!213104)))))

(assert (=> d!44173 (or (= (bvand lt!213108 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!213104 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!213108 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!213108 lt!213104) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44173 (= lt!213104 (remainingBits!0 ((_ sign_extend 32) (size!2809 (buf!3212 thiss!1634))) ((_ sign_extend 32) (currentByte!6015 thiss!1634)) ((_ sign_extend 32) (currentBit!6010 thiss!1634))))))

(declare-fun lt!213107 () (_ BitVec 64))

(declare-fun lt!213103 () (_ BitVec 64))

(assert (=> d!44173 (= lt!213108 (bvmul lt!213107 lt!213103))))

(assert (=> d!44173 (or (= lt!213107 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!213103 (bvsdiv (bvmul lt!213107 lt!213103) lt!213107)))))

(assert (=> d!44173 (= lt!213103 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44173 (= lt!213107 ((_ sign_extend 32) (size!2809 (buf!3212 thiss!1634))))))

(assert (=> d!44173 (= lt!213106 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6015 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6010 thiss!1634))))))

(assert (=> d!44173 (invariant!0 (currentBit!6010 thiss!1634) (currentByte!6015 thiss!1634) (size!2809 (buf!3212 thiss!1634)))))

(assert (=> d!44173 (= (bitIndex!0 (size!2809 (buf!3212 thiss!1634)) (currentByte!6015 thiss!1634) (currentBit!6010 thiss!1634)) lt!213106)))

(declare-fun b!136894 () Bool)

(declare-fun res!113941 () Bool)

(assert (=> b!136894 (=> (not res!113941) (not e!90938))))

(assert (=> b!136894 (= res!113941 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!213106))))

(declare-fun b!136895 () Bool)

(declare-fun lt!213105 () (_ BitVec 64))

(assert (=> b!136895 (= e!90938 (bvsle lt!213106 (bvmul lt!213105 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!136895 (or (= lt!213105 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!213105 #b0000000000000000000000000000000000000000000000000000000000001000) lt!213105)))))

(assert (=> b!136895 (= lt!213105 ((_ sign_extend 32) (size!2809 (buf!3212 thiss!1634))))))

(assert (= (and d!44173 res!113942) b!136894))

(assert (= (and b!136894 res!113941) b!136895))

(declare-fun m!209895 () Bool)

(assert (=> d!44173 m!209895))

(assert (=> d!44173 m!209481))

(assert (=> b!136686 d!44173))

(declare-fun d!44175 () Bool)

(assert (=> d!44175 (= (invariant!0 (currentBit!6010 thiss!1634) (currentByte!6015 thiss!1634) (size!2809 (buf!3212 thiss!1634))) (and (bvsge (currentBit!6010 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6010 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6015 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6015 thiss!1634) (size!2809 (buf!3212 thiss!1634))) (and (= (currentBit!6010 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6015 thiss!1634) (size!2809 (buf!3212 thiss!1634)))))))))

(assert (=> b!136675 d!44175))

(declare-fun d!44177 () Bool)

(declare-fun res!113954 () Bool)

(declare-fun e!90946 () Bool)

(assert (=> d!44177 (=> (not res!113954) (not e!90946))))

(assert (=> d!44177 (= res!113954 (= (size!2809 (buf!3212 (_2!6260 lt!212644))) (size!2809 (buf!3212 (_2!6260 lt!212641)))))))

(assert (=> d!44177 (= (isPrefixOf!0 (_2!6260 lt!212644) (_2!6260 lt!212641)) e!90946)))

(declare-fun b!136906 () Bool)

(declare-fun res!113955 () Bool)

(assert (=> b!136906 (=> (not res!113955) (not e!90946))))

(assert (=> b!136906 (= res!113955 (bvsle (bitIndex!0 (size!2809 (buf!3212 (_2!6260 lt!212644))) (currentByte!6015 (_2!6260 lt!212644)) (currentBit!6010 (_2!6260 lt!212644))) (bitIndex!0 (size!2809 (buf!3212 (_2!6260 lt!212641))) (currentByte!6015 (_2!6260 lt!212641)) (currentBit!6010 (_2!6260 lt!212641)))))))

(declare-fun b!136907 () Bool)

(declare-fun e!90945 () Bool)

(assert (=> b!136907 (= e!90946 e!90945)))

(declare-fun res!113953 () Bool)

(assert (=> b!136907 (=> res!113953 e!90945)))

(assert (=> b!136907 (= res!113953 (= (size!2809 (buf!3212 (_2!6260 lt!212644))) #b00000000000000000000000000000000))))

(declare-fun b!136908 () Bool)

(assert (=> b!136908 (= e!90945 (arrayBitRangesEq!0 (buf!3212 (_2!6260 lt!212644)) (buf!3212 (_2!6260 lt!212641)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2809 (buf!3212 (_2!6260 lt!212644))) (currentByte!6015 (_2!6260 lt!212644)) (currentBit!6010 (_2!6260 lt!212644)))))))

(assert (= (and d!44177 res!113954) b!136906))

(assert (= (and b!136906 res!113955) b!136907))

(assert (= (and b!136907 (not res!113953)) b!136908))

(assert (=> b!136906 m!209397))

(assert (=> b!136906 m!209395))

(assert (=> b!136908 m!209397))

(assert (=> b!136908 m!209397))

(declare-fun m!209897 () Bool)

(assert (=> b!136908 m!209897))

(assert (=> b!136674 d!44177))

(declare-fun d!44179 () Bool)

(assert (=> d!44179 (= (array_inv!2598 (buf!3212 thiss!1634)) (bvsge (size!2809 (buf!3212 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!136685 d!44179))

(declare-fun d!44181 () Bool)

(assert (=> d!44181 (= (invariant!0 (currentBit!6010 thiss!1634) (currentByte!6015 thiss!1634) (size!2809 (buf!3212 (_2!6260 lt!212644)))) (and (bvsge (currentBit!6010 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6010 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6015 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6015 thiss!1634) (size!2809 (buf!3212 (_2!6260 lt!212644)))) (and (= (currentBit!6010 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6015 thiss!1634) (size!2809 (buf!3212 (_2!6260 lt!212644))))))))))

(assert (=> b!136684 d!44181))

(declare-fun d!44183 () Bool)

(assert (=> d!44183 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2809 (buf!3212 thiss!1634))) ((_ sign_extend 32) (currentByte!6015 thiss!1634)) ((_ sign_extend 32) (currentBit!6010 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2809 (buf!3212 thiss!1634))) ((_ sign_extend 32) (currentByte!6015 thiss!1634)) ((_ sign_extend 32) (currentBit!6010 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10759 () Bool)

(assert (= bs!10759 d!44183))

(assert (=> bs!10759 m!209895))

(assert (=> b!136673 d!44183))

(declare-fun d!44185 () Bool)

(assert (=> d!44185 (= (invariant!0 (currentBit!6010 (_2!6260 lt!212641)) (currentByte!6015 (_2!6260 lt!212641)) (size!2809 (buf!3212 (_2!6260 lt!212641)))) (and (bvsge (currentBit!6010 (_2!6260 lt!212641)) #b00000000000000000000000000000000) (bvslt (currentBit!6010 (_2!6260 lt!212641)) #b00000000000000000000000000001000) (bvsge (currentByte!6015 (_2!6260 lt!212641)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6015 (_2!6260 lt!212641)) (size!2809 (buf!3212 (_2!6260 lt!212641)))) (and (= (currentBit!6010 (_2!6260 lt!212641)) #b00000000000000000000000000000000) (= (currentByte!6015 (_2!6260 lt!212641)) (size!2809 (buf!3212 (_2!6260 lt!212641))))))))))

(assert (=> b!136681 d!44185))

(declare-fun d!44187 () Bool)

(declare-fun lt!213125 () tuple2!11902)

(assert (=> d!44187 (= lt!213125 (readByte!0 (_1!6262 lt!212661)))))

(assert (=> d!44187 (= (readBytePure!0 (_1!6262 lt!212661)) (tuple2!11885 (_2!6273 lt!213125) (_1!6273 lt!213125)))))

(declare-fun bs!10760 () Bool)

(assert (= bs!10760 d!44187))

(declare-fun m!209899 () Bool)

(assert (=> bs!10760 m!209899))

(assert (=> b!136680 d!44187))

(declare-fun b!136909 () Bool)

(declare-fun e!90947 () Unit!8559)

(declare-fun Unit!8568 () Unit!8559)

(assert (=> b!136909 (= e!90947 Unit!8568)))

(declare-fun d!44189 () Bool)

(declare-fun e!90948 () Bool)

(assert (=> d!44189 e!90948))

(declare-fun res!113956 () Bool)

(assert (=> d!44189 (=> (not res!113956) (not e!90948))))

(declare-fun lt!213139 () tuple2!11882)

(assert (=> d!44189 (= res!113956 (isPrefixOf!0 (_1!6262 lt!213139) (_2!6262 lt!213139)))))

(declare-fun lt!213140 () BitStream!4882)

(assert (=> d!44189 (= lt!213139 (tuple2!11883 lt!213140 (_2!6260 lt!212644)))))

(declare-fun lt!213132 () Unit!8559)

(declare-fun lt!213126 () Unit!8559)

(assert (=> d!44189 (= lt!213132 lt!213126)))

(assert (=> d!44189 (isPrefixOf!0 lt!213140 (_2!6260 lt!212644))))

(assert (=> d!44189 (= lt!213126 (lemmaIsPrefixTransitive!0 lt!213140 (_2!6260 lt!212644) (_2!6260 lt!212644)))))

(declare-fun lt!213137 () Unit!8559)

(declare-fun lt!213138 () Unit!8559)

(assert (=> d!44189 (= lt!213137 lt!213138)))

(assert (=> d!44189 (isPrefixOf!0 lt!213140 (_2!6260 lt!212644))))

(assert (=> d!44189 (= lt!213138 (lemmaIsPrefixTransitive!0 lt!213140 thiss!1634 (_2!6260 lt!212644)))))

(declare-fun lt!213136 () Unit!8559)

(assert (=> d!44189 (= lt!213136 e!90947)))

(declare-fun c!7733 () Bool)

(assert (=> d!44189 (= c!7733 (not (= (size!2809 (buf!3212 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!213130 () Unit!8559)

(declare-fun lt!213143 () Unit!8559)

(assert (=> d!44189 (= lt!213130 lt!213143)))

(assert (=> d!44189 (isPrefixOf!0 (_2!6260 lt!212644) (_2!6260 lt!212644))))

(assert (=> d!44189 (= lt!213143 (lemmaIsPrefixRefl!0 (_2!6260 lt!212644)))))

(declare-fun lt!213142 () Unit!8559)

(declare-fun lt!213127 () Unit!8559)

(assert (=> d!44189 (= lt!213142 lt!213127)))

(assert (=> d!44189 (= lt!213127 (lemmaIsPrefixRefl!0 (_2!6260 lt!212644)))))

(declare-fun lt!213141 () Unit!8559)

(declare-fun lt!213128 () Unit!8559)

(assert (=> d!44189 (= lt!213141 lt!213128)))

(assert (=> d!44189 (isPrefixOf!0 lt!213140 lt!213140)))

(assert (=> d!44189 (= lt!213128 (lemmaIsPrefixRefl!0 lt!213140))))

(declare-fun lt!213133 () Unit!8559)

(declare-fun lt!213131 () Unit!8559)

(assert (=> d!44189 (= lt!213133 lt!213131)))

(assert (=> d!44189 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!44189 (= lt!213131 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!44189 (= lt!213140 (BitStream!4883 (buf!3212 (_2!6260 lt!212644)) (currentByte!6015 thiss!1634) (currentBit!6010 thiss!1634)))))

(assert (=> d!44189 (isPrefixOf!0 thiss!1634 (_2!6260 lt!212644))))

(assert (=> d!44189 (= (reader!0 thiss!1634 (_2!6260 lt!212644)) lt!213139)))

(declare-fun b!136910 () Bool)

(declare-fun res!113957 () Bool)

(assert (=> b!136910 (=> (not res!113957) (not e!90948))))

(assert (=> b!136910 (= res!113957 (isPrefixOf!0 (_1!6262 lt!213139) thiss!1634))))

(declare-fun b!136911 () Bool)

(declare-fun res!113958 () Bool)

(assert (=> b!136911 (=> (not res!113958) (not e!90948))))

(assert (=> b!136911 (= res!113958 (isPrefixOf!0 (_2!6262 lt!213139) (_2!6260 lt!212644)))))

(declare-fun b!136912 () Bool)

(declare-fun lt!213134 () Unit!8559)

(assert (=> b!136912 (= e!90947 lt!213134)))

(declare-fun lt!213129 () (_ BitVec 64))

(assert (=> b!136912 (= lt!213129 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!213145 () (_ BitVec 64))

(assert (=> b!136912 (= lt!213145 (bitIndex!0 (size!2809 (buf!3212 thiss!1634)) (currentByte!6015 thiss!1634) (currentBit!6010 thiss!1634)))))

(assert (=> b!136912 (= lt!213134 (arrayBitRangesEqSymmetric!0 (buf!3212 thiss!1634) (buf!3212 (_2!6260 lt!212644)) lt!213129 lt!213145))))

(assert (=> b!136912 (arrayBitRangesEq!0 (buf!3212 (_2!6260 lt!212644)) (buf!3212 thiss!1634) lt!213129 lt!213145)))

(declare-fun lt!213135 () (_ BitVec 64))

(declare-fun b!136913 () Bool)

(declare-fun lt!213144 () (_ BitVec 64))

(assert (=> b!136913 (= e!90948 (= (_1!6262 lt!213139) (withMovedBitIndex!0 (_2!6262 lt!213139) (bvsub lt!213135 lt!213144))))))

(assert (=> b!136913 (or (= (bvand lt!213135 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!213144 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!213135 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!213135 lt!213144) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!136913 (= lt!213144 (bitIndex!0 (size!2809 (buf!3212 (_2!6260 lt!212644))) (currentByte!6015 (_2!6260 lt!212644)) (currentBit!6010 (_2!6260 lt!212644))))))

(assert (=> b!136913 (= lt!213135 (bitIndex!0 (size!2809 (buf!3212 thiss!1634)) (currentByte!6015 thiss!1634) (currentBit!6010 thiss!1634)))))

(assert (= (and d!44189 c!7733) b!136912))

(assert (= (and d!44189 (not c!7733)) b!136909))

(assert (= (and d!44189 res!113956) b!136910))

(assert (= (and b!136910 res!113957) b!136911))

(assert (= (and b!136911 res!113958) b!136913))

(declare-fun m!209901 () Bool)

(assert (=> b!136910 m!209901))

(declare-fun m!209903 () Bool)

(assert (=> b!136913 m!209903))

(assert (=> b!136913 m!209397))

(assert (=> b!136913 m!209489))

(declare-fun m!209905 () Bool)

(assert (=> d!44189 m!209905))

(declare-fun m!209907 () Bool)

(assert (=> d!44189 m!209907))

(declare-fun m!209909 () Bool)

(assert (=> d!44189 m!209909))

(declare-fun m!209911 () Bool)

(assert (=> d!44189 m!209911))

(assert (=> d!44189 m!209709))

(declare-fun m!209913 () Bool)

(assert (=> d!44189 m!209913))

(assert (=> d!44189 m!209753))

(assert (=> d!44189 m!209393))

(assert (=> d!44189 m!209755))

(declare-fun m!209915 () Bool)

(assert (=> d!44189 m!209915))

(assert (=> d!44189 m!209711))

(assert (=> b!136912 m!209489))

(declare-fun m!209917 () Bool)

(assert (=> b!136912 m!209917))

(declare-fun m!209919 () Bool)

(assert (=> b!136912 m!209919))

(declare-fun m!209921 () Bool)

(assert (=> b!136911 m!209921))

(assert (=> b!136680 d!44189))

(declare-fun d!44191 () Bool)

(assert (=> d!44191 (= (array_inv!2598 arr!237) (bvsge (size!2809 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!26610 d!44191))

(declare-fun d!44193 () Bool)

(assert (=> d!44193 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6010 thiss!1634) (currentByte!6015 thiss!1634) (size!2809 (buf!3212 thiss!1634))))))

(declare-fun bs!10761 () Bool)

(assert (= bs!10761 d!44193))

(assert (=> bs!10761 m!209481))

(assert (=> start!26610 d!44193))

(declare-fun d!44195 () Bool)

(declare-fun res!113965 () Bool)

(declare-fun e!90953 () Bool)

(assert (=> d!44195 (=> (not res!113965) (not e!90953))))

(assert (=> d!44195 (= res!113965 (= (size!2809 (buf!3212 thiss!1634)) (size!2809 (buf!3212 (_2!6260 lt!212644)))))))

(assert (=> d!44195 (= (isPrefixOf!0 thiss!1634 (_2!6260 lt!212644)) e!90953)))

(declare-fun b!136919 () Bool)

(declare-fun res!113966 () Bool)

(assert (=> b!136919 (=> (not res!113966) (not e!90953))))

(assert (=> b!136919 (= res!113966 (bvsle (bitIndex!0 (size!2809 (buf!3212 thiss!1634)) (currentByte!6015 thiss!1634) (currentBit!6010 thiss!1634)) (bitIndex!0 (size!2809 (buf!3212 (_2!6260 lt!212644))) (currentByte!6015 (_2!6260 lt!212644)) (currentBit!6010 (_2!6260 lt!212644)))))))

(declare-fun b!136920 () Bool)

(declare-fun e!90952 () Bool)

(assert (=> b!136920 (= e!90953 e!90952)))

(declare-fun res!113964 () Bool)

(assert (=> b!136920 (=> res!113964 e!90952)))

(assert (=> b!136920 (= res!113964 (= (size!2809 (buf!3212 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!136921 () Bool)

(assert (=> b!136921 (= e!90952 (arrayBitRangesEq!0 (buf!3212 thiss!1634) (buf!3212 (_2!6260 lt!212644)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2809 (buf!3212 thiss!1634)) (currentByte!6015 thiss!1634) (currentBit!6010 thiss!1634))))))

(assert (= (and d!44195 res!113965) b!136919))

(assert (= (and b!136919 res!113966) b!136920))

(assert (= (and b!136920 (not res!113964)) b!136921))

(assert (=> b!136919 m!209489))

(assert (=> b!136919 m!209397))

(assert (=> b!136921 m!209489))

(assert (=> b!136921 m!209489))

(declare-fun m!209941 () Bool)

(assert (=> b!136921 m!209941))

(assert (=> b!136679 d!44195))

(declare-fun d!44199 () Bool)

(declare-fun res!113967 () Bool)

(declare-fun e!90954 () Bool)

(assert (=> d!44199 (=> res!113967 e!90954)))

(assert (=> d!44199 (= res!113967 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!44199 (= (arrayRangesEq!212 arr!237 (_2!6261 lt!212651) #b00000000000000000000000000000000 to!404) e!90954)))

(declare-fun b!136922 () Bool)

(declare-fun e!90955 () Bool)

(assert (=> b!136922 (= e!90954 e!90955)))

(declare-fun res!113968 () Bool)

(assert (=> b!136922 (=> (not res!113968) (not e!90955))))

(assert (=> b!136922 (= res!113968 (= (select (arr!3489 arr!237) #b00000000000000000000000000000000) (select (arr!3489 (_2!6261 lt!212651)) #b00000000000000000000000000000000)))))

(declare-fun b!136923 () Bool)

(assert (=> b!136923 (= e!90955 (arrayRangesEq!212 arr!237 (_2!6261 lt!212651) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!44199 (not res!113967)) b!136922))

(assert (= (and b!136922 res!113968) b!136923))

(assert (=> b!136922 m!209887))

(assert (=> b!136922 m!209845))

(declare-fun m!209943 () Bool)

(assert (=> b!136923 m!209943))

(assert (=> b!136678 d!44199))

(declare-fun d!44201 () Bool)

(assert (=> d!44201 (arrayRangesEq!212 arr!237 (_2!6261 lt!212651) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!213157 () Unit!8559)

(declare-fun choose!73 (array!6205 array!6205 array!6205 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8559)

(assert (=> d!44201 (= lt!213157 (choose!73 arr!237 (_2!6261 lt!212640) (_2!6261 lt!212651) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> d!44201 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 to!404) (bvsle to!404 to!404))))

(assert (=> d!44201 (= (arrayRangesEqTransitive!14 arr!237 (_2!6261 lt!212640) (_2!6261 lt!212651) #b00000000000000000000000000000000 to!404 to!404) lt!213157)))

(declare-fun bs!10762 () Bool)

(assert (= bs!10762 d!44201))

(assert (=> bs!10762 m!209413))

(declare-fun m!209945 () Bool)

(assert (=> bs!10762 m!209945))

(assert (=> b!136678 d!44201))

(declare-fun d!44203 () Bool)

(declare-fun res!113969 () Bool)

(declare-fun e!90956 () Bool)

(assert (=> d!44203 (=> res!113969 e!90956)))

(assert (=> d!44203 (= res!113969 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!44203 (= (arrayRangesEq!212 (_2!6261 lt!212640) (_2!6261 lt!212651) #b00000000000000000000000000000000 to!404) e!90956)))

(declare-fun b!136924 () Bool)

(declare-fun e!90957 () Bool)

(assert (=> b!136924 (= e!90956 e!90957)))

(declare-fun res!113970 () Bool)

(assert (=> b!136924 (=> (not res!113970) (not e!90957))))

(assert (=> b!136924 (= res!113970 (= (select (arr!3489 (_2!6261 lt!212640)) #b00000000000000000000000000000000) (select (arr!3489 (_2!6261 lt!212651)) #b00000000000000000000000000000000)))))

(declare-fun b!136925 () Bool)

(assert (=> b!136925 (= e!90957 (arrayRangesEq!212 (_2!6261 lt!212640) (_2!6261 lt!212651) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!44203 (not res!113969)) b!136924))

(assert (= (and b!136924 res!113970) b!136925))

(assert (=> b!136924 m!209865))

(assert (=> b!136924 m!209845))

(declare-fun m!209947 () Bool)

(assert (=> b!136925 m!209947))

(assert (=> b!136678 d!44203))

(declare-fun d!44205 () Bool)

(assert (=> d!44205 (arrayRangesEq!212 (_2!6261 lt!212640) (_2!6261 lt!212651) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!213160 () Unit!8559)

(declare-fun choose!74 (array!6205 array!6205 (_ BitVec 32) (_ BitVec 32)) Unit!8559)

(assert (=> d!44205 (= lt!213160 (choose!74 (_2!6261 lt!212651) (_2!6261 lt!212640) #b00000000000000000000000000000000 to!404))))

(assert (=> d!44205 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 to!404) (bvsle to!404 (size!2809 (_2!6261 lt!212651))))))

(assert (=> d!44205 (= (arrayRangesEqSymmetricLemma!25 (_2!6261 lt!212651) (_2!6261 lt!212640) #b00000000000000000000000000000000 to!404) lt!213160)))

(declare-fun bs!10763 () Bool)

(assert (= bs!10763 d!44205))

(assert (=> bs!10763 m!209417))

(declare-fun m!209949 () Bool)

(assert (=> bs!10763 m!209949))

(assert (=> b!136678 d!44205))

(declare-fun d!44207 () Bool)

(declare-fun e!90958 () Bool)

(assert (=> d!44207 e!90958))

(declare-fun res!113972 () Bool)

(assert (=> d!44207 (=> (not res!113972) (not e!90958))))

(declare-fun lt!213166 () (_ BitVec 64))

(declare-fun lt!213164 () (_ BitVec 64))

(declare-fun lt!213162 () (_ BitVec 64))

(assert (=> d!44207 (= res!113972 (= lt!213164 (bvsub lt!213166 lt!213162)))))

(assert (=> d!44207 (or (= (bvand lt!213166 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!213162 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!213166 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!213166 lt!213162) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44207 (= lt!213162 (remainingBits!0 ((_ sign_extend 32) (size!2809 (buf!3212 (_2!6260 lt!212641)))) ((_ sign_extend 32) (currentByte!6015 (_2!6260 lt!212641))) ((_ sign_extend 32) (currentBit!6010 (_2!6260 lt!212641)))))))

(declare-fun lt!213165 () (_ BitVec 64))

(declare-fun lt!213161 () (_ BitVec 64))

(assert (=> d!44207 (= lt!213166 (bvmul lt!213165 lt!213161))))

(assert (=> d!44207 (or (= lt!213165 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!213161 (bvsdiv (bvmul lt!213165 lt!213161) lt!213165)))))

(assert (=> d!44207 (= lt!213161 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44207 (= lt!213165 ((_ sign_extend 32) (size!2809 (buf!3212 (_2!6260 lt!212641)))))))

(assert (=> d!44207 (= lt!213164 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6015 (_2!6260 lt!212641))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6010 (_2!6260 lt!212641)))))))

(assert (=> d!44207 (invariant!0 (currentBit!6010 (_2!6260 lt!212641)) (currentByte!6015 (_2!6260 lt!212641)) (size!2809 (buf!3212 (_2!6260 lt!212641))))))

(assert (=> d!44207 (= (bitIndex!0 (size!2809 (buf!3212 (_2!6260 lt!212641))) (currentByte!6015 (_2!6260 lt!212641)) (currentBit!6010 (_2!6260 lt!212641))) lt!213164)))

(declare-fun b!136926 () Bool)

(declare-fun res!113971 () Bool)

(assert (=> b!136926 (=> (not res!113971) (not e!90958))))

(assert (=> b!136926 (= res!113971 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!213164))))

(declare-fun b!136927 () Bool)

(declare-fun lt!213163 () (_ BitVec 64))

(assert (=> b!136927 (= e!90958 (bvsle lt!213164 (bvmul lt!213163 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!136927 (or (= lt!213163 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!213163 #b0000000000000000000000000000000000000000000000000000000000001000) lt!213163)))))

(assert (=> b!136927 (= lt!213163 ((_ sign_extend 32) (size!2809 (buf!3212 (_2!6260 lt!212641)))))))

(assert (= (and d!44207 res!113972) b!136926))

(assert (= (and b!136926 res!113971) b!136927))

(declare-fun m!209951 () Bool)

(assert (=> d!44207 m!209951))

(assert (=> d!44207 m!209483))

(assert (=> b!136688 d!44207))

(assert (=> b!136688 d!44171))

(push 1)

(assert (not d!44096))

(assert (not b!136803))

(assert (not d!44106))

(assert (not b!136912))

(assert (not b!136906))

(assert (not b!136887))

(assert (not b!136801))

(assert (not d!44201))

(assert (not b!136925))

(assert (not b!136804))

(assert (not d!44173))

(assert (not b!136910))

(assert (not d!44189))

(assert (not b!136860))

(assert (not b!136861))

(assert (not b!136867))

(assert (not b!136796))

(assert (not b!136802))

(assert (not d!44207))

(assert (not d!44171))

(assert (not d!44161))

(assert (not d!44129))

(assert (not d!44205))

(assert (not b!136823))

(assert (not b!136919))

(assert (not b!136857))

(assert (not b!136798))

(assert (not b!136859))

(assert (not b!136923))

(assert (not b!136825))

(assert (not d!44147))

(assert (not d!44098))

(assert (not b!136807))

(assert (not d!44193))

(assert (not b!136921))

(assert (not b!136824))

(assert (not d!44145))

(assert (not d!44141))

(assert (not d!44114))

(assert (not d!44104))

(assert (not d!44165))

(assert (not d!44149))

(assert (not d!44183))

(assert (not b!136858))

(assert (not b!136891))

(assert (not d!44112))

(assert (not d!44159))

(assert (not b!136878))

(assert (not d!44102))

(assert (not b!136889))

(assert (not b!136911))

(assert (not d!44155))

(assert (not b!136797))

(assert (not d!44110))

(assert (not d!44108))

(assert (not d!44163))

(assert (not d!44139))

(assert (not d!44187))

(assert (not d!44094))

(assert (not b!136908))

(assert (not d!44100))

(assert (not b!136799))

(assert (not b!136913))

(assert (not d!44153))

(assert (not d!44157))

(assert (not d!44117))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

