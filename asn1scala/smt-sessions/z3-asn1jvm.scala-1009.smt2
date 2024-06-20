; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28760 () Bool)

(assert start!28760)

(declare-fun b!149025 () Bool)

(declare-fun res!124784 () Bool)

(declare-fun e!99457 () Bool)

(assert (=> b!149025 (=> (not res!124784) (not e!99457))))

(declare-datatypes ((array!6682 0))(
  ( (array!6683 (arr!3807 (Array (_ BitVec 32) (_ BitVec 8))) (size!3023 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5304 0))(
  ( (BitStream!5305 (buf!3498 array!6682) (currentByte!6412 (_ BitVec 32)) (currentBit!6407 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5304)

(declare-datatypes ((Unit!9437 0))(
  ( (Unit!9438) )
))
(declare-datatypes ((tuple2!13262 0))(
  ( (tuple2!13263 (_1!6995 Unit!9437) (_2!6995 BitStream!5304)) )
))
(declare-fun lt!232421 () tuple2!13262)

(declare-fun isPrefixOf!0 (BitStream!5304 BitStream!5304) Bool)

(assert (=> b!149025 (= res!124784 (isPrefixOf!0 thiss!1634 (_2!6995 lt!232421)))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!6682)

(declare-fun e!99461 () Bool)

(declare-datatypes ((tuple2!13264 0))(
  ( (tuple2!13265 (_1!6996 BitStream!5304) (_2!6996 array!6682)) )
))
(declare-fun lt!232425 () tuple2!13264)

(declare-fun b!149026 () Bool)

(declare-fun arrayRangesEq!339 (array!6682 array!6682 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!149026 (= e!99461 (not (arrayRangesEq!339 arr!237 (_2!6996 lt!232425) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!149027 () Bool)

(declare-fun res!124783 () Bool)

(declare-fun e!99462 () Bool)

(assert (=> b!149027 (=> (not res!124783) (not e!99462))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!149027 (= res!124783 (invariant!0 (currentBit!6407 thiss!1634) (currentByte!6412 thiss!1634) (size!3023 (buf!3498 thiss!1634))))))

(declare-fun b!149028 () Bool)

(declare-fun e!99466 () Bool)

(assert (=> b!149028 (= e!99466 true)))

(declare-fun lt!232442 () tuple2!13264)

(declare-fun lt!232422 () tuple2!13264)

(assert (=> b!149028 (arrayRangesEq!339 (_2!6996 lt!232442) (_2!6996 lt!232422) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!232439 () Unit!9437)

(declare-fun arrayRangesEqSymmetricLemma!71 (array!6682 array!6682 (_ BitVec 32) (_ BitVec 32)) Unit!9437)

(assert (=> b!149028 (= lt!232439 (arrayRangesEqSymmetricLemma!71 (_2!6996 lt!232422) (_2!6996 lt!232442) #b00000000000000000000000000000000 to!404))))

(declare-datatypes ((tuple2!13266 0))(
  ( (tuple2!13267 (_1!6997 BitStream!5304) (_2!6997 BitStream!5304)) )
))
(declare-fun lt!232430 () tuple2!13266)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun b!149029 () Bool)

(declare-datatypes ((tuple2!13268 0))(
  ( (tuple2!13269 (_1!6998 BitStream!5304) (_2!6998 (_ BitVec 8))) )
))
(declare-fun lt!232440 () tuple2!13268)

(assert (=> b!149029 (= e!99457 (and (= (_2!6998 lt!232440) (select (arr!3807 arr!237) from!447)) (= (_1!6998 lt!232440) (_2!6997 lt!232430))))))

(declare-fun readBytePure!0 (BitStream!5304) tuple2!13268)

(assert (=> b!149029 (= lt!232440 (readBytePure!0 (_1!6997 lt!232430)))))

(declare-fun reader!0 (BitStream!5304 BitStream!5304) tuple2!13266)

(assert (=> b!149029 (= lt!232430 (reader!0 thiss!1634 (_2!6995 lt!232421)))))

(declare-fun b!149030 () Bool)

(declare-fun e!99460 () Bool)

(declare-fun e!99463 () Bool)

(assert (=> b!149030 (= e!99460 e!99463)))

(declare-fun res!124787 () Bool)

(assert (=> b!149030 (=> (not res!124787) (not e!99463))))

(declare-fun lt!232428 () (_ BitVec 64))

(declare-fun lt!232436 () tuple2!13262)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!149030 (= res!124787 (= (bitIndex!0 (size!3023 (buf!3498 (_2!6995 lt!232436))) (currentByte!6412 (_2!6995 lt!232436)) (currentBit!6407 (_2!6995 lt!232436))) (bvadd (bitIndex!0 (size!3023 (buf!3498 (_2!6995 lt!232421))) (currentByte!6412 (_2!6995 lt!232421)) (currentBit!6407 (_2!6995 lt!232421))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!232428))))))

(assert (=> b!149030 (= lt!232428 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!149031 () Bool)

(declare-fun e!99465 () Bool)

(declare-fun array_inv!2812 (array!6682) Bool)

(assert (=> b!149031 (= e!99465 (array_inv!2812 (buf!3498 thiss!1634)))))

(declare-fun res!124786 () Bool)

(assert (=> start!28760 (=> (not res!124786) (not e!99462))))

(assert (=> start!28760 (= res!124786 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3023 arr!237))))))

(assert (=> start!28760 e!99462))

(assert (=> start!28760 true))

(assert (=> start!28760 (array_inv!2812 arr!237)))

(declare-fun inv!12 (BitStream!5304) Bool)

(assert (=> start!28760 (and (inv!12 thiss!1634) e!99465)))

(declare-fun b!149032 () Bool)

(declare-fun res!124794 () Bool)

(assert (=> b!149032 (=> (not res!124794) (not e!99463))))

(assert (=> b!149032 (= res!124794 (isPrefixOf!0 (_2!6995 lt!232421) (_2!6995 lt!232436)))))

(declare-fun b!149033 () Bool)

(declare-fun e!99459 () Bool)

(assert (=> b!149033 (= e!99459 (invariant!0 (currentBit!6407 thiss!1634) (currentByte!6412 thiss!1634) (size!3023 (buf!3498 (_2!6995 lt!232421)))))))

(declare-fun b!149034 () Bool)

(declare-fun res!124793 () Bool)

(assert (=> b!149034 (=> (not res!124793) (not e!99462))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!149034 (= res!124793 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3023 (buf!3498 thiss!1634))) ((_ sign_extend 32) (currentByte!6412 thiss!1634)) ((_ sign_extend 32) (currentBit!6407 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!149035 () Bool)

(declare-fun res!124789 () Bool)

(assert (=> b!149035 (=> (not res!124789) (not e!99462))))

(assert (=> b!149035 (= res!124789 (bvslt from!447 to!404))))

(declare-fun b!149036 () Bool)

(assert (=> b!149036 (= e!99462 (not e!99466))))

(declare-fun res!124790 () Bool)

(assert (=> b!149036 (=> res!124790 e!99466)))

(assert (=> b!149036 (= res!124790 (not (arrayRangesEq!339 (_2!6996 lt!232422) (_2!6996 lt!232442) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!232429 () tuple2!13264)

(assert (=> b!149036 (arrayRangesEq!339 (_2!6996 lt!232422) (_2!6996 lt!232429) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!232432 () tuple2!13266)

(declare-fun lt!232424 () Unit!9437)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5304 array!6682 (_ BitVec 32) (_ BitVec 32)) Unit!9437)

(assert (=> b!149036 (= lt!232424 (readByteArrayLoopArrayPrefixLemma!0 (_1!6997 lt!232432) arr!237 from!447 to!404))))

(declare-fun lt!232419 () array!6682)

(declare-fun readByteArrayLoopPure!0 (BitStream!5304 array!6682 (_ BitVec 32) (_ BitVec 32)) tuple2!13264)

(declare-fun withMovedByteIndex!0 (BitStream!5304 (_ BitVec 32)) BitStream!5304)

(assert (=> b!149036 (= lt!232429 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6997 lt!232432) #b00000000000000000000000000000001) lt!232419 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!232423 () tuple2!13266)

(assert (=> b!149036 (= lt!232442 (readByteArrayLoopPure!0 (_1!6997 lt!232423) lt!232419 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!232427 () tuple2!13268)

(assert (=> b!149036 (= lt!232419 (array!6683 (store (arr!3807 arr!237) from!447 (_2!6998 lt!232427)) (size!3023 arr!237)))))

(declare-fun lt!232420 () (_ BitVec 32))

(assert (=> b!149036 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3023 (buf!3498 (_2!6995 lt!232436)))) ((_ sign_extend 32) (currentByte!6412 (_2!6995 lt!232421))) ((_ sign_extend 32) (currentBit!6407 (_2!6995 lt!232421))) lt!232420)))

(declare-fun lt!232435 () Unit!9437)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5304 array!6682 (_ BitVec 32)) Unit!9437)

(assert (=> b!149036 (= lt!232435 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6995 lt!232421) (buf!3498 (_2!6995 lt!232436)) lt!232420))))

(assert (=> b!149036 (= (_1!6996 lt!232422) (_2!6997 lt!232432))))

(assert (=> b!149036 (= lt!232422 (readByteArrayLoopPure!0 (_1!6997 lt!232432) arr!237 from!447 to!404))))

(assert (=> b!149036 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3023 (buf!3498 (_2!6995 lt!232436)))) ((_ sign_extend 32) (currentByte!6412 thiss!1634)) ((_ sign_extend 32) (currentBit!6407 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!232433 () Unit!9437)

(assert (=> b!149036 (= lt!232433 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3498 (_2!6995 lt!232436)) (bvsub to!404 from!447)))))

(assert (=> b!149036 (= (_2!6998 lt!232427) (select (arr!3807 arr!237) from!447))))

(assert (=> b!149036 (= lt!232427 (readBytePure!0 (_1!6997 lt!232432)))))

(assert (=> b!149036 (= lt!232423 (reader!0 (_2!6995 lt!232421) (_2!6995 lt!232436)))))

(assert (=> b!149036 (= lt!232432 (reader!0 thiss!1634 (_2!6995 lt!232436)))))

(declare-fun e!99456 () Bool)

(assert (=> b!149036 e!99456))

(declare-fun res!124792 () Bool)

(assert (=> b!149036 (=> (not res!124792) (not e!99456))))

(declare-fun lt!232426 () tuple2!13268)

(declare-fun lt!232437 () tuple2!13268)

(assert (=> b!149036 (= res!124792 (= (bitIndex!0 (size!3023 (buf!3498 (_1!6998 lt!232426))) (currentByte!6412 (_1!6998 lt!232426)) (currentBit!6407 (_1!6998 lt!232426))) (bitIndex!0 (size!3023 (buf!3498 (_1!6998 lt!232437))) (currentByte!6412 (_1!6998 lt!232437)) (currentBit!6407 (_1!6998 lt!232437)))))))

(declare-fun lt!232434 () Unit!9437)

(declare-fun lt!232438 () BitStream!5304)

(declare-fun readBytePrefixLemma!0 (BitStream!5304 BitStream!5304) Unit!9437)

(assert (=> b!149036 (= lt!232434 (readBytePrefixLemma!0 lt!232438 (_2!6995 lt!232436)))))

(assert (=> b!149036 (= lt!232437 (readBytePure!0 (BitStream!5305 (buf!3498 (_2!6995 lt!232436)) (currentByte!6412 thiss!1634) (currentBit!6407 thiss!1634))))))

(assert (=> b!149036 (= lt!232426 (readBytePure!0 lt!232438))))

(assert (=> b!149036 (= lt!232438 (BitStream!5305 (buf!3498 (_2!6995 lt!232421)) (currentByte!6412 thiss!1634) (currentBit!6407 thiss!1634)))))

(assert (=> b!149036 e!99459))

(declare-fun res!124785 () Bool)

(assert (=> b!149036 (=> (not res!124785) (not e!99459))))

(assert (=> b!149036 (= res!124785 (isPrefixOf!0 thiss!1634 (_2!6995 lt!232436)))))

(declare-fun lt!232431 () Unit!9437)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5304 BitStream!5304 BitStream!5304) Unit!9437)

(assert (=> b!149036 (= lt!232431 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6995 lt!232421) (_2!6995 lt!232436)))))

(assert (=> b!149036 e!99460))

(declare-fun res!124796 () Bool)

(assert (=> b!149036 (=> (not res!124796) (not e!99460))))

(assert (=> b!149036 (= res!124796 (= (size!3023 (buf!3498 (_2!6995 lt!232421))) (size!3023 (buf!3498 (_2!6995 lt!232436)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5304 array!6682 (_ BitVec 32) (_ BitVec 32)) tuple2!13262)

(assert (=> b!149036 (= lt!232436 (appendByteArrayLoop!0 (_2!6995 lt!232421) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!149036 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3023 (buf!3498 (_2!6995 lt!232421)))) ((_ sign_extend 32) (currentByte!6412 (_2!6995 lt!232421))) ((_ sign_extend 32) (currentBit!6407 (_2!6995 lt!232421))) lt!232420)))

(assert (=> b!149036 (= lt!232420 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!232441 () Unit!9437)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5304 BitStream!5304 (_ BitVec 64) (_ BitVec 32)) Unit!9437)

(assert (=> b!149036 (= lt!232441 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6995 lt!232421) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!149036 e!99457))

(declare-fun res!124795 () Bool)

(assert (=> b!149036 (=> (not res!124795) (not e!99457))))

(assert (=> b!149036 (= res!124795 (= (size!3023 (buf!3498 thiss!1634)) (size!3023 (buf!3498 (_2!6995 lt!232421)))))))

(declare-fun appendByte!0 (BitStream!5304 (_ BitVec 8)) tuple2!13262)

(assert (=> b!149036 (= lt!232421 (appendByte!0 thiss!1634 (select (arr!3807 arr!237) from!447)))))

(declare-fun b!149037 () Bool)

(assert (=> b!149037 (= e!99463 (not e!99461))))

(declare-fun res!124791 () Bool)

(assert (=> b!149037 (=> res!124791 e!99461)))

(declare-fun lt!232418 () tuple2!13266)

(assert (=> b!149037 (= res!124791 (or (not (= (size!3023 (_2!6996 lt!232425)) (size!3023 arr!237))) (not (= (_1!6996 lt!232425) (_2!6997 lt!232418)))))))

(assert (=> b!149037 (= lt!232425 (readByteArrayLoopPure!0 (_1!6997 lt!232418) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!149037 (validate_offset_bits!1 ((_ sign_extend 32) (size!3023 (buf!3498 (_2!6995 lt!232436)))) ((_ sign_extend 32) (currentByte!6412 (_2!6995 lt!232421))) ((_ sign_extend 32) (currentBit!6407 (_2!6995 lt!232421))) lt!232428)))

(declare-fun lt!232443 () Unit!9437)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5304 array!6682 (_ BitVec 64)) Unit!9437)

(assert (=> b!149037 (= lt!232443 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6995 lt!232421) (buf!3498 (_2!6995 lt!232436)) lt!232428))))

(assert (=> b!149037 (= lt!232418 (reader!0 (_2!6995 lt!232421) (_2!6995 lt!232436)))))

(declare-fun b!149038 () Bool)

(declare-fun res!124788 () Bool)

(assert (=> b!149038 (=> (not res!124788) (not e!99457))))

(assert (=> b!149038 (= res!124788 (= (bitIndex!0 (size!3023 (buf!3498 (_2!6995 lt!232421))) (currentByte!6412 (_2!6995 lt!232421)) (currentBit!6407 (_2!6995 lt!232421))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3023 (buf!3498 thiss!1634)) (currentByte!6412 thiss!1634) (currentBit!6407 thiss!1634)))))))

(declare-fun b!149039 () Bool)

(assert (=> b!149039 (= e!99456 (= (_2!6998 lt!232426) (_2!6998 lt!232437)))))

(assert (= (and start!28760 res!124786) b!149034))

(assert (= (and b!149034 res!124793) b!149035))

(assert (= (and b!149035 res!124789) b!149027))

(assert (= (and b!149027 res!124783) b!149036))

(assert (= (and b!149036 res!124795) b!149038))

(assert (= (and b!149038 res!124788) b!149025))

(assert (= (and b!149025 res!124784) b!149029))

(assert (= (and b!149036 res!124796) b!149030))

(assert (= (and b!149030 res!124787) b!149032))

(assert (= (and b!149032 res!124794) b!149037))

(assert (= (and b!149037 (not res!124791)) b!149026))

(assert (= (and b!149036 res!124785) b!149033))

(assert (= (and b!149036 res!124792) b!149039))

(assert (= (and b!149036 (not res!124790)) b!149028))

(assert (= start!28760 b!149031))

(declare-fun m!231671 () Bool)

(assert (=> b!149029 m!231671))

(declare-fun m!231673 () Bool)

(assert (=> b!149029 m!231673))

(declare-fun m!231675 () Bool)

(assert (=> b!149029 m!231675))

(declare-fun m!231677 () Bool)

(assert (=> b!149031 m!231677))

(declare-fun m!231679 () Bool)

(assert (=> b!149034 m!231679))

(declare-fun m!231681 () Bool)

(assert (=> start!28760 m!231681))

(declare-fun m!231683 () Bool)

(assert (=> start!28760 m!231683))

(declare-fun m!231685 () Bool)

(assert (=> b!149027 m!231685))

(declare-fun m!231687 () Bool)

(assert (=> b!149026 m!231687))

(declare-fun m!231689 () Bool)

(assert (=> b!149028 m!231689))

(declare-fun m!231691 () Bool)

(assert (=> b!149028 m!231691))

(declare-fun m!231693 () Bool)

(assert (=> b!149038 m!231693))

(declare-fun m!231695 () Bool)

(assert (=> b!149038 m!231695))

(declare-fun m!231697 () Bool)

(assert (=> b!149037 m!231697))

(declare-fun m!231699 () Bool)

(assert (=> b!149037 m!231699))

(declare-fun m!231701 () Bool)

(assert (=> b!149037 m!231701))

(declare-fun m!231703 () Bool)

(assert (=> b!149037 m!231703))

(declare-fun m!231705 () Bool)

(assert (=> b!149032 m!231705))

(declare-fun m!231707 () Bool)

(assert (=> b!149033 m!231707))

(declare-fun m!231709 () Bool)

(assert (=> b!149030 m!231709))

(assert (=> b!149030 m!231693))

(declare-fun m!231711 () Bool)

(assert (=> b!149025 m!231711))

(declare-fun m!231713 () Bool)

(assert (=> b!149036 m!231713))

(declare-fun m!231715 () Bool)

(assert (=> b!149036 m!231715))

(declare-fun m!231717 () Bool)

(assert (=> b!149036 m!231717))

(declare-fun m!231719 () Bool)

(assert (=> b!149036 m!231719))

(declare-fun m!231721 () Bool)

(assert (=> b!149036 m!231721))

(assert (=> b!149036 m!231703))

(declare-fun m!231723 () Bool)

(assert (=> b!149036 m!231723))

(declare-fun m!231725 () Bool)

(assert (=> b!149036 m!231725))

(declare-fun m!231727 () Bool)

(assert (=> b!149036 m!231727))

(assert (=> b!149036 m!231671))

(declare-fun m!231729 () Bool)

(assert (=> b!149036 m!231729))

(declare-fun m!231731 () Bool)

(assert (=> b!149036 m!231731))

(declare-fun m!231733 () Bool)

(assert (=> b!149036 m!231733))

(declare-fun m!231735 () Bool)

(assert (=> b!149036 m!231735))

(declare-fun m!231737 () Bool)

(assert (=> b!149036 m!231737))

(declare-fun m!231739 () Bool)

(assert (=> b!149036 m!231739))

(declare-fun m!231741 () Bool)

(assert (=> b!149036 m!231741))

(declare-fun m!231743 () Bool)

(assert (=> b!149036 m!231743))

(declare-fun m!231745 () Bool)

(assert (=> b!149036 m!231745))

(assert (=> b!149036 m!231713))

(declare-fun m!231747 () Bool)

(assert (=> b!149036 m!231747))

(declare-fun m!231749 () Bool)

(assert (=> b!149036 m!231749))

(declare-fun m!231751 () Bool)

(assert (=> b!149036 m!231751))

(declare-fun m!231753 () Bool)

(assert (=> b!149036 m!231753))

(declare-fun m!231755 () Bool)

(assert (=> b!149036 m!231755))

(declare-fun m!231757 () Bool)

(assert (=> b!149036 m!231757))

(assert (=> b!149036 m!231671))

(declare-fun m!231759 () Bool)

(assert (=> b!149036 m!231759))

(declare-fun m!231761 () Bool)

(assert (=> b!149036 m!231761))

(check-sat (not b!149034) (not b!149029) (not b!149038) (not b!149031) (not b!149030) (not b!149026) (not b!149027) (not b!149025) (not b!149033) (not b!149037) (not start!28760) (not b!149032) (not b!149028) (not b!149036))
