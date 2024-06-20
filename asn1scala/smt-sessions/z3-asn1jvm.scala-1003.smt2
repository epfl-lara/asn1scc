; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28338 () Bool)

(assert start!28338)

(declare-fun b!146745 () Bool)

(declare-fun res!122767 () Bool)

(declare-fun e!97852 () Bool)

(assert (=> b!146745 (=> (not res!122767) (not e!97852))))

(declare-datatypes ((array!6640 0))(
  ( (array!6641 (arr!3759 (Array (_ BitVec 32) (_ BitVec 8))) (size!3005 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5268 0))(
  ( (BitStream!5269 (buf!3460 array!6640) (currentByte!6362 (_ BitVec 32)) (currentBit!6357 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!9195 0))(
  ( (Unit!9196) )
))
(declare-datatypes ((tuple2!13098 0))(
  ( (tuple2!13099 (_1!6903 Unit!9195) (_2!6903 BitStream!5268)) )
))
(declare-fun lt!227980 () tuple2!13098)

(declare-fun thiss!1634 () BitStream!5268)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!146745 (= res!122767 (= (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!227980))) (currentByte!6362 (_2!6903 lt!227980)) (currentBit!6357 (_2!6903 lt!227980))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3005 (buf!3460 thiss!1634)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634)))))))

(declare-fun b!146746 () Bool)

(declare-fun e!97858 () Bool)

(declare-fun array_inv!2794 (array!6640) Bool)

(assert (=> b!146746 (= e!97858 (array_inv!2794 (buf!3460 thiss!1634)))))

(declare-fun b!146747 () Bool)

(declare-fun e!97854 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!146747 (= e!97854 (invariant!0 (currentBit!6357 thiss!1634) (currentByte!6362 thiss!1634) (size!3005 (buf!3460 (_2!6903 lt!227980)))))))

(declare-fun res!122774 () Bool)

(declare-fun e!97857 () Bool)

(assert (=> start!28338 (=> (not res!122774) (not e!97857))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!6640)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!28338 (= res!122774 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3005 arr!237))))))

(assert (=> start!28338 e!97857))

(assert (=> start!28338 true))

(assert (=> start!28338 (array_inv!2794 arr!237)))

(declare-fun inv!12 (BitStream!5268) Bool)

(assert (=> start!28338 (and (inv!12 thiss!1634) e!97858)))

(declare-fun b!146748 () Bool)

(declare-fun res!122770 () Bool)

(assert (=> b!146748 (=> (not res!122770) (not e!97857))))

(assert (=> b!146748 (= res!122770 (bvslt from!447 to!404))))

(declare-fun b!146749 () Bool)

(declare-fun res!122775 () Bool)

(assert (=> b!146749 (=> (not res!122775) (not e!97857))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!146749 (= res!122775 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3005 (buf!3460 thiss!1634))) ((_ sign_extend 32) (currentByte!6362 thiss!1634)) ((_ sign_extend 32) (currentBit!6357 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!146750 () Bool)

(declare-fun res!122765 () Bool)

(assert (=> b!146750 (=> (not res!122765) (not e!97852))))

(declare-fun isPrefixOf!0 (BitStream!5268 BitStream!5268) Bool)

(assert (=> b!146750 (= res!122765 (isPrefixOf!0 thiss!1634 (_2!6903 lt!227980)))))

(declare-fun b!146751 () Bool)

(declare-fun e!97856 () Bool)

(declare-datatypes ((tuple2!13100 0))(
  ( (tuple2!13101 (_1!6904 BitStream!5268) (_2!6904 (_ BitVec 8))) )
))
(declare-fun lt!227965 () tuple2!13100)

(declare-fun lt!227957 () tuple2!13100)

(assert (=> b!146751 (= e!97856 (= (_2!6904 lt!227965) (_2!6904 lt!227957)))))

(declare-fun b!146752 () Bool)

(declare-datatypes ((tuple2!13102 0))(
  ( (tuple2!13103 (_1!6905 BitStream!5268) (_2!6905 BitStream!5268)) )
))
(declare-fun lt!227974 () tuple2!13102)

(declare-fun lt!227958 () tuple2!13100)

(assert (=> b!146752 (= e!97852 (and (= (_2!6904 lt!227958) (select (arr!3759 arr!237) from!447)) (= (_1!6904 lt!227958) (_2!6905 lt!227974))))))

(declare-fun readBytePure!0 (BitStream!5268) tuple2!13100)

(assert (=> b!146752 (= lt!227958 (readBytePure!0 (_1!6905 lt!227974)))))

(declare-fun reader!0 (BitStream!5268 BitStream!5268) tuple2!13102)

(assert (=> b!146752 (= lt!227974 (reader!0 thiss!1634 (_2!6903 lt!227980)))))

(declare-fun b!146753 () Bool)

(declare-fun e!97859 () Bool)

(declare-fun e!97850 () Bool)

(assert (=> b!146753 (= e!97859 (not e!97850))))

(declare-fun res!122778 () Bool)

(assert (=> b!146753 (=> res!122778 e!97850)))

(declare-datatypes ((tuple2!13104 0))(
  ( (tuple2!13105 (_1!6906 BitStream!5268) (_2!6906 array!6640)) )
))
(declare-fun lt!227973 () tuple2!13104)

(declare-fun lt!227963 () tuple2!13102)

(assert (=> b!146753 (= res!122778 (or (not (= (size!3005 (_2!6906 lt!227973)) (size!3005 arr!237))) (not (= (_1!6906 lt!227973) (_2!6905 lt!227963)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5268 array!6640 (_ BitVec 32) (_ BitVec 32)) tuple2!13104)

(assert (=> b!146753 (= lt!227973 (readByteArrayLoopPure!0 (_1!6905 lt!227963) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!227961 () tuple2!13098)

(declare-fun lt!227964 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!146753 (validate_offset_bits!1 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!227961)))) ((_ sign_extend 32) (currentByte!6362 (_2!6903 lt!227980))) ((_ sign_extend 32) (currentBit!6357 (_2!6903 lt!227980))) lt!227964)))

(declare-fun lt!227976 () Unit!9195)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5268 array!6640 (_ BitVec 64)) Unit!9195)

(assert (=> b!146753 (= lt!227976 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6903 lt!227980) (buf!3460 (_2!6903 lt!227961)) lt!227964))))

(assert (=> b!146753 (= lt!227963 (reader!0 (_2!6903 lt!227980) (_2!6903 lt!227961)))))

(declare-fun b!146754 () Bool)

(declare-fun res!122772 () Bool)

(assert (=> b!146754 (=> (not res!122772) (not e!97857))))

(assert (=> b!146754 (= res!122772 (invariant!0 (currentBit!6357 thiss!1634) (currentByte!6362 thiss!1634) (size!3005 (buf!3460 thiss!1634))))))

(declare-fun b!146755 () Bool)

(declare-fun arrayRangesEq!321 (array!6640 array!6640 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!146755 (= e!97850 (not (arrayRangesEq!321 arr!237 (_2!6906 lt!227973) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!146756 () Bool)

(declare-fun e!97851 () Bool)

(assert (=> b!146756 (= e!97851 e!97859)))

(declare-fun res!122766 () Bool)

(assert (=> b!146756 (=> (not res!122766) (not e!97859))))

(assert (=> b!146756 (= res!122766 (= (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!227961))) (currentByte!6362 (_2!6903 lt!227961)) (currentBit!6357 (_2!6903 lt!227961))) (bvadd (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!227980))) (currentByte!6362 (_2!6903 lt!227980)) (currentBit!6357 (_2!6903 lt!227980))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!227964))))))

(assert (=> b!146756 (= lt!227964 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!146757 () Bool)

(declare-fun e!97860 () Bool)

(assert (=> b!146757 (= e!97857 (not e!97860))))

(declare-fun res!122771 () Bool)

(assert (=> b!146757 (=> res!122771 e!97860)))

(declare-fun lt!227962 () tuple2!13104)

(declare-fun lt!227967 () tuple2!13104)

(assert (=> b!146757 (= res!122771 (not (arrayRangesEq!321 (_2!6906 lt!227967) (_2!6906 lt!227962) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!227960 () tuple2!13104)

(assert (=> b!146757 (arrayRangesEq!321 (_2!6906 lt!227967) (_2!6906 lt!227960) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!227970 () Unit!9195)

(declare-fun lt!227956 () tuple2!13102)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5268 array!6640 (_ BitVec 32) (_ BitVec 32)) Unit!9195)

(assert (=> b!146757 (= lt!227970 (readByteArrayLoopArrayPrefixLemma!0 (_1!6905 lt!227956) arr!237 from!447 to!404))))

(declare-fun lt!227971 () array!6640)

(declare-fun withMovedByteIndex!0 (BitStream!5268 (_ BitVec 32)) BitStream!5268)

(assert (=> b!146757 (= lt!227960 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6905 lt!227956) #b00000000000000000000000000000001) lt!227971 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!227978 () tuple2!13102)

(assert (=> b!146757 (= lt!227962 (readByteArrayLoopPure!0 (_1!6905 lt!227978) lt!227971 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!227975 () tuple2!13100)

(assert (=> b!146757 (= lt!227971 (array!6641 (store (arr!3759 arr!237) from!447 (_2!6904 lt!227975)) (size!3005 arr!237)))))

(declare-fun lt!227969 () (_ BitVec 32))

(assert (=> b!146757 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!227961)))) ((_ sign_extend 32) (currentByte!6362 (_2!6903 lt!227980))) ((_ sign_extend 32) (currentBit!6357 (_2!6903 lt!227980))) lt!227969)))

(declare-fun lt!227972 () Unit!9195)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5268 array!6640 (_ BitVec 32)) Unit!9195)

(assert (=> b!146757 (= lt!227972 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6903 lt!227980) (buf!3460 (_2!6903 lt!227961)) lt!227969))))

(assert (=> b!146757 (= (_1!6906 lt!227967) (_2!6905 lt!227956))))

(assert (=> b!146757 (= lt!227967 (readByteArrayLoopPure!0 (_1!6905 lt!227956) arr!237 from!447 to!404))))

(assert (=> b!146757 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!227961)))) ((_ sign_extend 32) (currentByte!6362 thiss!1634)) ((_ sign_extend 32) (currentBit!6357 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!227966 () Unit!9195)

(assert (=> b!146757 (= lt!227966 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3460 (_2!6903 lt!227961)) (bvsub to!404 from!447)))))

(assert (=> b!146757 (= (_2!6904 lt!227975) (select (arr!3759 arr!237) from!447))))

(assert (=> b!146757 (= lt!227975 (readBytePure!0 (_1!6905 lt!227956)))))

(assert (=> b!146757 (= lt!227978 (reader!0 (_2!6903 lt!227980) (_2!6903 lt!227961)))))

(assert (=> b!146757 (= lt!227956 (reader!0 thiss!1634 (_2!6903 lt!227961)))))

(assert (=> b!146757 e!97856))

(declare-fun res!122777 () Bool)

(assert (=> b!146757 (=> (not res!122777) (not e!97856))))

(assert (=> b!146757 (= res!122777 (= (bitIndex!0 (size!3005 (buf!3460 (_1!6904 lt!227965))) (currentByte!6362 (_1!6904 lt!227965)) (currentBit!6357 (_1!6904 lt!227965))) (bitIndex!0 (size!3005 (buf!3460 (_1!6904 lt!227957))) (currentByte!6362 (_1!6904 lt!227957)) (currentBit!6357 (_1!6904 lt!227957)))))))

(declare-fun lt!227959 () Unit!9195)

(declare-fun lt!227979 () BitStream!5268)

(declare-fun readBytePrefixLemma!0 (BitStream!5268 BitStream!5268) Unit!9195)

(assert (=> b!146757 (= lt!227959 (readBytePrefixLemma!0 lt!227979 (_2!6903 lt!227961)))))

(assert (=> b!146757 (= lt!227957 (readBytePure!0 (BitStream!5269 (buf!3460 (_2!6903 lt!227961)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634))))))

(assert (=> b!146757 (= lt!227965 (readBytePure!0 lt!227979))))

(assert (=> b!146757 (= lt!227979 (BitStream!5269 (buf!3460 (_2!6903 lt!227980)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634)))))

(assert (=> b!146757 e!97854))

(declare-fun res!122768 () Bool)

(assert (=> b!146757 (=> (not res!122768) (not e!97854))))

(assert (=> b!146757 (= res!122768 (isPrefixOf!0 thiss!1634 (_2!6903 lt!227961)))))

(declare-fun lt!227977 () Unit!9195)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5268 BitStream!5268 BitStream!5268) Unit!9195)

(assert (=> b!146757 (= lt!227977 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6903 lt!227980) (_2!6903 lt!227961)))))

(assert (=> b!146757 e!97851))

(declare-fun res!122769 () Bool)

(assert (=> b!146757 (=> (not res!122769) (not e!97851))))

(assert (=> b!146757 (= res!122769 (= (size!3005 (buf!3460 (_2!6903 lt!227980))) (size!3005 (buf!3460 (_2!6903 lt!227961)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5268 array!6640 (_ BitVec 32) (_ BitVec 32)) tuple2!13098)

(assert (=> b!146757 (= lt!227961 (appendByteArrayLoop!0 (_2!6903 lt!227980) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!146757 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!227980)))) ((_ sign_extend 32) (currentByte!6362 (_2!6903 lt!227980))) ((_ sign_extend 32) (currentBit!6357 (_2!6903 lt!227980))) lt!227969)))

(assert (=> b!146757 (= lt!227969 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!227968 () Unit!9195)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5268 BitStream!5268 (_ BitVec 64) (_ BitVec 32)) Unit!9195)

(assert (=> b!146757 (= lt!227968 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6903 lt!227980) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!146757 e!97852))

(declare-fun res!122773 () Bool)

(assert (=> b!146757 (=> (not res!122773) (not e!97852))))

(assert (=> b!146757 (= res!122773 (= (size!3005 (buf!3460 thiss!1634)) (size!3005 (buf!3460 (_2!6903 lt!227980)))))))

(declare-fun appendByte!0 (BitStream!5268 (_ BitVec 8)) tuple2!13098)

(assert (=> b!146757 (= lt!227980 (appendByte!0 thiss!1634 (select (arr!3759 arr!237) from!447)))))

(declare-fun b!146758 () Bool)

(declare-fun res!122776 () Bool)

(assert (=> b!146758 (=> (not res!122776) (not e!97859))))

(assert (=> b!146758 (= res!122776 (isPrefixOf!0 (_2!6903 lt!227980) (_2!6903 lt!227961)))))

(declare-fun b!146759 () Bool)

(assert (=> b!146759 (= e!97860 (or (bvsgt #b00000000000000000000000000000000 to!404) (bvsgt to!404 (size!3005 (_2!6906 lt!227967))) (= (size!3005 (_2!6906 lt!227967)) (size!3005 (_2!6906 lt!227962)))))))

(assert (= (and start!28338 res!122774) b!146749))

(assert (= (and b!146749 res!122775) b!146748))

(assert (= (and b!146748 res!122770) b!146754))

(assert (= (and b!146754 res!122772) b!146757))

(assert (= (and b!146757 res!122773) b!146745))

(assert (= (and b!146745 res!122767) b!146750))

(assert (= (and b!146750 res!122765) b!146752))

(assert (= (and b!146757 res!122769) b!146756))

(assert (= (and b!146756 res!122766) b!146758))

(assert (= (and b!146758 res!122776) b!146753))

(assert (= (and b!146753 (not res!122778)) b!146755))

(assert (= (and b!146757 res!122768) b!146747))

(assert (= (and b!146757 res!122777) b!146751))

(assert (= (and b!146757 (not res!122771)) b!146759))

(assert (= start!28338 b!146746))

(declare-fun m!226583 () Bool)

(assert (=> b!146758 m!226583))

(declare-fun m!226585 () Bool)

(assert (=> b!146753 m!226585))

(declare-fun m!226587 () Bool)

(assert (=> b!146753 m!226587))

(declare-fun m!226589 () Bool)

(assert (=> b!146753 m!226589))

(declare-fun m!226591 () Bool)

(assert (=> b!146753 m!226591))

(declare-fun m!226593 () Bool)

(assert (=> b!146747 m!226593))

(declare-fun m!226595 () Bool)

(assert (=> b!146752 m!226595))

(declare-fun m!226597 () Bool)

(assert (=> b!146752 m!226597))

(declare-fun m!226599 () Bool)

(assert (=> b!146752 m!226599))

(declare-fun m!226601 () Bool)

(assert (=> b!146755 m!226601))

(declare-fun m!226603 () Bool)

(assert (=> b!146757 m!226603))

(declare-fun m!226605 () Bool)

(assert (=> b!146757 m!226605))

(declare-fun m!226607 () Bool)

(assert (=> b!146757 m!226607))

(declare-fun m!226609 () Bool)

(assert (=> b!146757 m!226609))

(declare-fun m!226611 () Bool)

(assert (=> b!146757 m!226611))

(declare-fun m!226613 () Bool)

(assert (=> b!146757 m!226613))

(assert (=> b!146757 m!226591))

(declare-fun m!226615 () Bool)

(assert (=> b!146757 m!226615))

(declare-fun m!226617 () Bool)

(assert (=> b!146757 m!226617))

(declare-fun m!226619 () Bool)

(assert (=> b!146757 m!226619))

(declare-fun m!226621 () Bool)

(assert (=> b!146757 m!226621))

(declare-fun m!226623 () Bool)

(assert (=> b!146757 m!226623))

(declare-fun m!226625 () Bool)

(assert (=> b!146757 m!226625))

(assert (=> b!146757 m!226595))

(declare-fun m!226627 () Bool)

(assert (=> b!146757 m!226627))

(assert (=> b!146757 m!226595))

(declare-fun m!226629 () Bool)

(assert (=> b!146757 m!226629))

(declare-fun m!226631 () Bool)

(assert (=> b!146757 m!226631))

(declare-fun m!226633 () Bool)

(assert (=> b!146757 m!226633))

(declare-fun m!226635 () Bool)

(assert (=> b!146757 m!226635))

(declare-fun m!226637 () Bool)

(assert (=> b!146757 m!226637))

(declare-fun m!226639 () Bool)

(assert (=> b!146757 m!226639))

(declare-fun m!226641 () Bool)

(assert (=> b!146757 m!226641))

(declare-fun m!226643 () Bool)

(assert (=> b!146757 m!226643))

(declare-fun m!226645 () Bool)

(assert (=> b!146757 m!226645))

(declare-fun m!226647 () Bool)

(assert (=> b!146757 m!226647))

(assert (=> b!146757 m!226645))

(declare-fun m!226649 () Bool)

(assert (=> b!146757 m!226649))

(declare-fun m!226651 () Bool)

(assert (=> b!146757 m!226651))

(declare-fun m!226653 () Bool)

(assert (=> b!146756 m!226653))

(declare-fun m!226655 () Bool)

(assert (=> b!146756 m!226655))

(declare-fun m!226657 () Bool)

(assert (=> b!146749 m!226657))

(declare-fun m!226659 () Bool)

(assert (=> b!146750 m!226659))

(assert (=> b!146745 m!226655))

(declare-fun m!226661 () Bool)

(assert (=> b!146745 m!226661))

(declare-fun m!226663 () Bool)

(assert (=> start!28338 m!226663))

(declare-fun m!226665 () Bool)

(assert (=> start!28338 m!226665))

(declare-fun m!226667 () Bool)

(assert (=> b!146746 m!226667))

(declare-fun m!226669 () Bool)

(assert (=> b!146754 m!226669))

(check-sat (not b!146755) (not b!146753) (not b!146745) (not b!146757) (not start!28338) (not b!146749) (not b!146747) (not b!146750) (not b!146752) (not b!146746) (not b!146758) (not b!146756) (not b!146754))
(check-sat)
(get-model)

(declare-fun d!47441 () Bool)

(assert (=> d!47441 (= (invariant!0 (currentBit!6357 thiss!1634) (currentByte!6362 thiss!1634) (size!3005 (buf!3460 thiss!1634))) (and (bvsge (currentBit!6357 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6357 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6362 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6362 thiss!1634) (size!3005 (buf!3460 thiss!1634))) (and (= (currentBit!6357 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6362 thiss!1634) (size!3005 (buf!3460 thiss!1634)))))))))

(assert (=> b!146754 d!47441))

(declare-fun d!47443 () Bool)

(declare-fun res!122993 () Bool)

(declare-fun e!98008 () Bool)

(assert (=> d!47443 (=> res!122993 e!98008)))

(assert (=> d!47443 (= res!122993 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!47443 (= (arrayRangesEq!321 arr!237 (_2!6906 lt!227973) #b00000000000000000000000000000000 to!404) e!98008)))

(declare-fun b!146997 () Bool)

(declare-fun e!98009 () Bool)

(assert (=> b!146997 (= e!98008 e!98009)))

(declare-fun res!122994 () Bool)

(assert (=> b!146997 (=> (not res!122994) (not e!98009))))

(assert (=> b!146997 (= res!122994 (= (select (arr!3759 arr!237) #b00000000000000000000000000000000) (select (arr!3759 (_2!6906 lt!227973)) #b00000000000000000000000000000000)))))

(declare-fun b!146998 () Bool)

(assert (=> b!146998 (= e!98009 (arrayRangesEq!321 arr!237 (_2!6906 lt!227973) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!47443 (not res!122993)) b!146997))

(assert (= (and b!146997 res!122994) b!146998))

(declare-fun m!227155 () Bool)

(assert (=> b!146997 m!227155))

(declare-fun m!227157 () Bool)

(assert (=> b!146997 m!227157))

(declare-fun m!227159 () Bool)

(assert (=> b!146998 m!227159))

(assert (=> b!146755 d!47443))

(declare-fun d!47445 () Bool)

(assert (=> d!47445 (= (array_inv!2794 arr!237) (bvsge (size!3005 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!28338 d!47445))

(declare-fun d!47447 () Bool)

(assert (=> d!47447 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6357 thiss!1634) (currentByte!6362 thiss!1634) (size!3005 (buf!3460 thiss!1634))))))

(declare-fun bs!11613 () Bool)

(assert (= bs!11613 d!47447))

(assert (=> bs!11613 m!226669))

(assert (=> start!28338 d!47447))

(declare-fun d!47449 () Bool)

(declare-fun e!98012 () Bool)

(assert (=> d!47449 e!98012))

(declare-fun res!122999 () Bool)

(assert (=> d!47449 (=> (not res!122999) (not e!98012))))

(declare-fun lt!228547 () (_ BitVec 64))

(declare-fun lt!228548 () (_ BitVec 64))

(declare-fun lt!228550 () (_ BitVec 64))

(assert (=> d!47449 (= res!122999 (= lt!228548 (bvsub lt!228547 lt!228550)))))

(assert (=> d!47449 (or (= (bvand lt!228547 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!228550 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!228547 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!228547 lt!228550) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!47449 (= lt!228550 (remainingBits!0 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!227961)))) ((_ sign_extend 32) (currentByte!6362 (_2!6903 lt!227961))) ((_ sign_extend 32) (currentBit!6357 (_2!6903 lt!227961)))))))

(declare-fun lt!228546 () (_ BitVec 64))

(declare-fun lt!228549 () (_ BitVec 64))

(assert (=> d!47449 (= lt!228547 (bvmul lt!228546 lt!228549))))

(assert (=> d!47449 (or (= lt!228546 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!228549 (bvsdiv (bvmul lt!228546 lt!228549) lt!228546)))))

(assert (=> d!47449 (= lt!228549 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!47449 (= lt!228546 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!227961)))))))

(assert (=> d!47449 (= lt!228548 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6362 (_2!6903 lt!227961))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6357 (_2!6903 lt!227961)))))))

(assert (=> d!47449 (invariant!0 (currentBit!6357 (_2!6903 lt!227961)) (currentByte!6362 (_2!6903 lt!227961)) (size!3005 (buf!3460 (_2!6903 lt!227961))))))

(assert (=> d!47449 (= (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!227961))) (currentByte!6362 (_2!6903 lt!227961)) (currentBit!6357 (_2!6903 lt!227961))) lt!228548)))

(declare-fun b!147003 () Bool)

(declare-fun res!123000 () Bool)

(assert (=> b!147003 (=> (not res!123000) (not e!98012))))

(assert (=> b!147003 (= res!123000 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!228548))))

(declare-fun b!147004 () Bool)

(declare-fun lt!228551 () (_ BitVec 64))

(assert (=> b!147004 (= e!98012 (bvsle lt!228548 (bvmul lt!228551 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!147004 (or (= lt!228551 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!228551 #b0000000000000000000000000000000000000000000000000000000000001000) lt!228551)))))

(assert (=> b!147004 (= lt!228551 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!227961)))))))

(assert (= (and d!47449 res!122999) b!147003))

(assert (= (and b!147003 res!123000) b!147004))

(declare-fun m!227161 () Bool)

(assert (=> d!47449 m!227161))

(declare-fun m!227163 () Bool)

(assert (=> d!47449 m!227163))

(assert (=> b!146756 d!47449))

(declare-fun d!47451 () Bool)

(declare-fun e!98013 () Bool)

(assert (=> d!47451 e!98013))

(declare-fun res!123001 () Bool)

(assert (=> d!47451 (=> (not res!123001) (not e!98013))))

(declare-fun lt!228553 () (_ BitVec 64))

(declare-fun lt!228554 () (_ BitVec 64))

(declare-fun lt!228556 () (_ BitVec 64))

(assert (=> d!47451 (= res!123001 (= lt!228554 (bvsub lt!228553 lt!228556)))))

(assert (=> d!47451 (or (= (bvand lt!228553 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!228556 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!228553 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!228553 lt!228556) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!47451 (= lt!228556 (remainingBits!0 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!227980)))) ((_ sign_extend 32) (currentByte!6362 (_2!6903 lt!227980))) ((_ sign_extend 32) (currentBit!6357 (_2!6903 lt!227980)))))))

(declare-fun lt!228552 () (_ BitVec 64))

(declare-fun lt!228555 () (_ BitVec 64))

(assert (=> d!47451 (= lt!228553 (bvmul lt!228552 lt!228555))))

(assert (=> d!47451 (or (= lt!228552 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!228555 (bvsdiv (bvmul lt!228552 lt!228555) lt!228552)))))

(assert (=> d!47451 (= lt!228555 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!47451 (= lt!228552 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!227980)))))))

(assert (=> d!47451 (= lt!228554 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6362 (_2!6903 lt!227980))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6357 (_2!6903 lt!227980)))))))

(assert (=> d!47451 (invariant!0 (currentBit!6357 (_2!6903 lt!227980)) (currentByte!6362 (_2!6903 lt!227980)) (size!3005 (buf!3460 (_2!6903 lt!227980))))))

(assert (=> d!47451 (= (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!227980))) (currentByte!6362 (_2!6903 lt!227980)) (currentBit!6357 (_2!6903 lt!227980))) lt!228554)))

(declare-fun b!147005 () Bool)

(declare-fun res!123002 () Bool)

(assert (=> b!147005 (=> (not res!123002) (not e!98013))))

(assert (=> b!147005 (= res!123002 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!228554))))

(declare-fun b!147006 () Bool)

(declare-fun lt!228557 () (_ BitVec 64))

(assert (=> b!147006 (= e!98013 (bvsle lt!228554 (bvmul lt!228557 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!147006 (or (= lt!228557 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!228557 #b0000000000000000000000000000000000000000000000000000000000001000) lt!228557)))))

(assert (=> b!147006 (= lt!228557 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!227980)))))))

(assert (= (and d!47451 res!123001) b!147005))

(assert (= (and b!147005 res!123002) b!147006))

(declare-fun m!227165 () Bool)

(assert (=> d!47451 m!227165))

(declare-fun m!227167 () Bool)

(assert (=> d!47451 m!227167))

(assert (=> b!146756 d!47451))

(assert (=> b!146745 d!47451))

(declare-fun d!47453 () Bool)

(declare-fun e!98014 () Bool)

(assert (=> d!47453 e!98014))

(declare-fun res!123003 () Bool)

(assert (=> d!47453 (=> (not res!123003) (not e!98014))))

(declare-fun lt!228559 () (_ BitVec 64))

(declare-fun lt!228560 () (_ BitVec 64))

(declare-fun lt!228562 () (_ BitVec 64))

(assert (=> d!47453 (= res!123003 (= lt!228560 (bvsub lt!228559 lt!228562)))))

(assert (=> d!47453 (or (= (bvand lt!228559 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!228562 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!228559 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!228559 lt!228562) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!47453 (= lt!228562 (remainingBits!0 ((_ sign_extend 32) (size!3005 (buf!3460 thiss!1634))) ((_ sign_extend 32) (currentByte!6362 thiss!1634)) ((_ sign_extend 32) (currentBit!6357 thiss!1634))))))

(declare-fun lt!228558 () (_ BitVec 64))

(declare-fun lt!228561 () (_ BitVec 64))

(assert (=> d!47453 (= lt!228559 (bvmul lt!228558 lt!228561))))

(assert (=> d!47453 (or (= lt!228558 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!228561 (bvsdiv (bvmul lt!228558 lt!228561) lt!228558)))))

(assert (=> d!47453 (= lt!228561 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!47453 (= lt!228558 ((_ sign_extend 32) (size!3005 (buf!3460 thiss!1634))))))

(assert (=> d!47453 (= lt!228560 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6362 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6357 thiss!1634))))))

(assert (=> d!47453 (invariant!0 (currentBit!6357 thiss!1634) (currentByte!6362 thiss!1634) (size!3005 (buf!3460 thiss!1634)))))

(assert (=> d!47453 (= (bitIndex!0 (size!3005 (buf!3460 thiss!1634)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634)) lt!228560)))

(declare-fun b!147007 () Bool)

(declare-fun res!123004 () Bool)

(assert (=> b!147007 (=> (not res!123004) (not e!98014))))

(assert (=> b!147007 (= res!123004 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!228560))))

(declare-fun b!147008 () Bool)

(declare-fun lt!228563 () (_ BitVec 64))

(assert (=> b!147008 (= e!98014 (bvsle lt!228560 (bvmul lt!228563 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!147008 (or (= lt!228563 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!228563 #b0000000000000000000000000000000000000000000000000000000000001000) lt!228563)))))

(assert (=> b!147008 (= lt!228563 ((_ sign_extend 32) (size!3005 (buf!3460 thiss!1634))))))

(assert (= (and d!47453 res!123003) b!147007))

(assert (= (and b!147007 res!123004) b!147008))

(declare-fun m!227169 () Bool)

(assert (=> d!47453 m!227169))

(assert (=> d!47453 m!226669))

(assert (=> b!146745 d!47453))

(declare-fun d!47455 () Bool)

(assert (=> d!47455 (= (array_inv!2794 (buf!3460 thiss!1634)) (bvsge (size!3005 (buf!3460 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!146746 d!47455))

(declare-fun b!147019 () Bool)

(declare-fun lt!228590 () tuple2!13104)

(declare-fun e!98023 () Bool)

(assert (=> b!147019 (= e!98023 (arrayRangesEq!321 arr!237 (_2!6906 lt!228590) #b00000000000000000000000000000000 to!404))))

(declare-fun b!147020 () Bool)

(declare-fun res!123017 () Bool)

(declare-fun e!98022 () Bool)

(assert (=> b!147020 (=> (not res!123017) (not e!98022))))

(declare-fun lt!228588 () tuple2!13098)

(assert (=> b!147020 (= res!123017 (isPrefixOf!0 (_2!6903 lt!227980) (_2!6903 lt!228588)))))

(declare-fun d!47457 () Bool)

(assert (=> d!47457 e!98022))

(declare-fun res!123016 () Bool)

(assert (=> d!47457 (=> (not res!123016) (not e!98022))))

(assert (=> d!47457 (= res!123016 (= (size!3005 (buf!3460 (_2!6903 lt!227980))) (size!3005 (buf!3460 (_2!6903 lt!228588)))))))

(declare-fun choose!64 (BitStream!5268 array!6640 (_ BitVec 32) (_ BitVec 32)) tuple2!13098)

(assert (=> d!47457 (= lt!228588 (choose!64 (_2!6903 lt!227980) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!47457 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3005 arr!237)))))

(assert (=> d!47457 (= (appendByteArrayLoop!0 (_2!6903 lt!227980) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!228588)))

(declare-fun b!147021 () Bool)

(assert (=> b!147021 (= e!98022 e!98023)))

(declare-fun res!123019 () Bool)

(assert (=> b!147021 (=> (not res!123019) (not e!98023))))

(declare-fun lt!228584 () tuple2!13102)

(assert (=> b!147021 (= res!123019 (and (= (size!3005 (_2!6906 lt!228590)) (size!3005 arr!237)) (= (_1!6906 lt!228590) (_2!6905 lt!228584))))))

(assert (=> b!147021 (= lt!228590 (readByteArrayLoopPure!0 (_1!6905 lt!228584) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!228585 () Unit!9195)

(declare-fun lt!228586 () Unit!9195)

(assert (=> b!147021 (= lt!228585 lt!228586)))

(declare-fun lt!228589 () (_ BitVec 64))

(assert (=> b!147021 (validate_offset_bits!1 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!228588)))) ((_ sign_extend 32) (currentByte!6362 (_2!6903 lt!227980))) ((_ sign_extend 32) (currentBit!6357 (_2!6903 lt!227980))) lt!228589)))

(assert (=> b!147021 (= lt!228586 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6903 lt!227980) (buf!3460 (_2!6903 lt!228588)) lt!228589))))

(declare-fun e!98021 () Bool)

(assert (=> b!147021 e!98021))

(declare-fun res!123018 () Bool)

(assert (=> b!147021 (=> (not res!123018) (not e!98021))))

(assert (=> b!147021 (= res!123018 (and (= (size!3005 (buf!3460 (_2!6903 lt!227980))) (size!3005 (buf!3460 (_2!6903 lt!228588)))) (bvsge lt!228589 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!147021 (= lt!228589 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!147021 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!147021 (= lt!228584 (reader!0 (_2!6903 lt!227980) (_2!6903 lt!228588)))))

(declare-fun b!147022 () Bool)

(declare-fun res!123015 () Bool)

(assert (=> b!147022 (=> (not res!123015) (not e!98022))))

(declare-fun lt!228587 () (_ BitVec 64))

(declare-fun lt!228582 () (_ BitVec 64))

(assert (=> b!147022 (= res!123015 (= (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!228588))) (currentByte!6362 (_2!6903 lt!228588)) (currentBit!6357 (_2!6903 lt!228588))) (bvadd lt!228582 lt!228587)))))

(assert (=> b!147022 (or (not (= (bvand lt!228582 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!228587 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!228582 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!228582 lt!228587) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!228583 () (_ BitVec 64))

(assert (=> b!147022 (= lt!228587 (bvmul lt!228583 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!147022 (or (= lt!228583 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!228583 #b0000000000000000000000000000000000000000000000000000000000001000) lt!228583)))))

(assert (=> b!147022 (= lt!228583 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!147022 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!147022 (= lt!228582 (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!227980))) (currentByte!6362 (_2!6903 lt!227980)) (currentBit!6357 (_2!6903 lt!227980))))))

(declare-fun b!147023 () Bool)

(assert (=> b!147023 (= e!98021 (validate_offset_bits!1 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!227980)))) ((_ sign_extend 32) (currentByte!6362 (_2!6903 lt!227980))) ((_ sign_extend 32) (currentBit!6357 (_2!6903 lt!227980))) lt!228589))))

(assert (= (and d!47457 res!123016) b!147022))

(assert (= (and b!147022 res!123015) b!147020))

(assert (= (and b!147020 res!123017) b!147021))

(assert (= (and b!147021 res!123018) b!147023))

(assert (= (and b!147021 res!123019) b!147019))

(declare-fun m!227171 () Bool)

(assert (=> b!147022 m!227171))

(assert (=> b!147022 m!226655))

(declare-fun m!227173 () Bool)

(assert (=> b!147021 m!227173))

(declare-fun m!227175 () Bool)

(assert (=> b!147021 m!227175))

(declare-fun m!227177 () Bool)

(assert (=> b!147021 m!227177))

(declare-fun m!227179 () Bool)

(assert (=> b!147021 m!227179))

(declare-fun m!227181 () Bool)

(assert (=> d!47457 m!227181))

(declare-fun m!227183 () Bool)

(assert (=> b!147019 m!227183))

(declare-fun m!227185 () Bool)

(assert (=> b!147023 m!227185))

(declare-fun m!227187 () Bool)

(assert (=> b!147020 m!227187))

(assert (=> b!146757 d!47457))

(declare-fun d!47459 () Bool)

(declare-datatypes ((tuple3!574 0))(
  ( (tuple3!575 (_1!6915 Unit!9195) (_2!6915 BitStream!5268) (_3!356 array!6640)) )
))
(declare-fun lt!228593 () tuple3!574)

(declare-fun readByteArrayLoop!0 (BitStream!5268 array!6640 (_ BitVec 32) (_ BitVec 32)) tuple3!574)

(assert (=> d!47459 (= lt!228593 (readByteArrayLoop!0 (_1!6905 lt!227956) arr!237 from!447 to!404))))

(assert (=> d!47459 (= (readByteArrayLoopPure!0 (_1!6905 lt!227956) arr!237 from!447 to!404) (tuple2!13105 (_2!6915 lt!228593) (_3!356 lt!228593)))))

(declare-fun bs!11614 () Bool)

(assert (= bs!11614 d!47459))

(declare-fun m!227189 () Bool)

(assert (=> bs!11614 m!227189))

(assert (=> b!146757 d!47459))

(declare-fun d!47461 () Bool)

(declare-fun res!123026 () Bool)

(declare-fun e!98028 () Bool)

(assert (=> d!47461 (=> (not res!123026) (not e!98028))))

(assert (=> d!47461 (= res!123026 (= (size!3005 (buf!3460 thiss!1634)) (size!3005 (buf!3460 (_2!6903 lt!227961)))))))

(assert (=> d!47461 (= (isPrefixOf!0 thiss!1634 (_2!6903 lt!227961)) e!98028)))

(declare-fun b!147030 () Bool)

(declare-fun res!123028 () Bool)

(assert (=> b!147030 (=> (not res!123028) (not e!98028))))

(assert (=> b!147030 (= res!123028 (bvsle (bitIndex!0 (size!3005 (buf!3460 thiss!1634)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634)) (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!227961))) (currentByte!6362 (_2!6903 lt!227961)) (currentBit!6357 (_2!6903 lt!227961)))))))

(declare-fun b!147031 () Bool)

(declare-fun e!98029 () Bool)

(assert (=> b!147031 (= e!98028 e!98029)))

(declare-fun res!123027 () Bool)

(assert (=> b!147031 (=> res!123027 e!98029)))

(assert (=> b!147031 (= res!123027 (= (size!3005 (buf!3460 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!147032 () Bool)

(declare-fun arrayBitRangesEq!0 (array!6640 array!6640 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!147032 (= e!98029 (arrayBitRangesEq!0 (buf!3460 thiss!1634) (buf!3460 (_2!6903 lt!227961)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3005 (buf!3460 thiss!1634)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634))))))

(assert (= (and d!47461 res!123026) b!147030))

(assert (= (and b!147030 res!123028) b!147031))

(assert (= (and b!147031 (not res!123027)) b!147032))

(assert (=> b!147030 m!226661))

(assert (=> b!147030 m!226653))

(assert (=> b!147032 m!226661))

(assert (=> b!147032 m!226661))

(declare-fun m!227191 () Bool)

(assert (=> b!147032 m!227191))

(assert (=> b!146757 d!47461))

(declare-fun d!47463 () Bool)

(declare-fun res!123029 () Bool)

(declare-fun e!98030 () Bool)

(assert (=> d!47463 (=> res!123029 e!98030)))

(assert (=> d!47463 (= res!123029 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!47463 (= (arrayRangesEq!321 (_2!6906 lt!227967) (_2!6906 lt!227962) #b00000000000000000000000000000000 to!404) e!98030)))

(declare-fun b!147033 () Bool)

(declare-fun e!98031 () Bool)

(assert (=> b!147033 (= e!98030 e!98031)))

(declare-fun res!123030 () Bool)

(assert (=> b!147033 (=> (not res!123030) (not e!98031))))

(assert (=> b!147033 (= res!123030 (= (select (arr!3759 (_2!6906 lt!227967)) #b00000000000000000000000000000000) (select (arr!3759 (_2!6906 lt!227962)) #b00000000000000000000000000000000)))))

(declare-fun b!147034 () Bool)

(assert (=> b!147034 (= e!98031 (arrayRangesEq!321 (_2!6906 lt!227967) (_2!6906 lt!227962) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!47463 (not res!123029)) b!147033))

(assert (= (and b!147033 res!123030) b!147034))

(declare-fun m!227193 () Bool)

(assert (=> b!147033 m!227193))

(declare-fun m!227195 () Bool)

(assert (=> b!147033 m!227195))

(declare-fun m!227197 () Bool)

(assert (=> b!147034 m!227197))

(assert (=> b!146757 d!47463))

(declare-fun lt!228594 () tuple3!574)

(declare-fun d!47465 () Bool)

(assert (=> d!47465 (= lt!228594 (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!6905 lt!227956) #b00000000000000000000000000000001) lt!227971 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!47465 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6905 lt!227956) #b00000000000000000000000000000001) lt!227971 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13105 (_2!6915 lt!228594) (_3!356 lt!228594)))))

(declare-fun bs!11615 () Bool)

(assert (= bs!11615 d!47465))

(assert (=> bs!11615 m!226645))

(declare-fun m!227199 () Bool)

(assert (=> bs!11615 m!227199))

(assert (=> b!146757 d!47465))

(declare-fun d!47467 () Bool)

(assert (=> d!47467 (isPrefixOf!0 thiss!1634 (_2!6903 lt!227961))))

(declare-fun lt!228597 () Unit!9195)

(declare-fun choose!30 (BitStream!5268 BitStream!5268 BitStream!5268) Unit!9195)

(assert (=> d!47467 (= lt!228597 (choose!30 thiss!1634 (_2!6903 lt!227980) (_2!6903 lt!227961)))))

(assert (=> d!47467 (isPrefixOf!0 thiss!1634 (_2!6903 lt!227980))))

(assert (=> d!47467 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6903 lt!227980) (_2!6903 lt!227961)) lt!228597)))

(declare-fun bs!11616 () Bool)

(assert (= bs!11616 d!47467))

(assert (=> bs!11616 m!226635))

(declare-fun m!227201 () Bool)

(assert (=> bs!11616 m!227201))

(assert (=> bs!11616 m!226659))

(assert (=> b!146757 d!47467))

(declare-fun d!47469 () Bool)

(assert (=> d!47469 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!227961)))) ((_ sign_extend 32) (currentByte!6362 thiss!1634)) ((_ sign_extend 32) (currentBit!6357 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!228600 () Unit!9195)

(declare-fun choose!26 (BitStream!5268 array!6640 (_ BitVec 32) BitStream!5268) Unit!9195)

(assert (=> d!47469 (= lt!228600 (choose!26 thiss!1634 (buf!3460 (_2!6903 lt!227961)) (bvsub to!404 from!447) (BitStream!5269 (buf!3460 (_2!6903 lt!227961)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634))))))

(assert (=> d!47469 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3460 (_2!6903 lt!227961)) (bvsub to!404 from!447)) lt!228600)))

(declare-fun bs!11617 () Bool)

(assert (= bs!11617 d!47469))

(assert (=> bs!11617 m!226629))

(declare-fun m!227203 () Bool)

(assert (=> bs!11617 m!227203))

(assert (=> b!146757 d!47469))

(declare-fun d!47471 () Bool)

(declare-fun e!98032 () Bool)

(assert (=> d!47471 e!98032))

(declare-fun res!123031 () Bool)

(assert (=> d!47471 (=> (not res!123031) (not e!98032))))

(declare-fun lt!228602 () (_ BitVec 64))

(declare-fun lt!228605 () (_ BitVec 64))

(declare-fun lt!228603 () (_ BitVec 64))

(assert (=> d!47471 (= res!123031 (= lt!228603 (bvsub lt!228602 lt!228605)))))

(assert (=> d!47471 (or (= (bvand lt!228602 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!228605 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!228602 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!228602 lt!228605) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!47471 (= lt!228605 (remainingBits!0 ((_ sign_extend 32) (size!3005 (buf!3460 (_1!6904 lt!227965)))) ((_ sign_extend 32) (currentByte!6362 (_1!6904 lt!227965))) ((_ sign_extend 32) (currentBit!6357 (_1!6904 lt!227965)))))))

(declare-fun lt!228601 () (_ BitVec 64))

(declare-fun lt!228604 () (_ BitVec 64))

(assert (=> d!47471 (= lt!228602 (bvmul lt!228601 lt!228604))))

(assert (=> d!47471 (or (= lt!228601 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!228604 (bvsdiv (bvmul lt!228601 lt!228604) lt!228601)))))

(assert (=> d!47471 (= lt!228604 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!47471 (= lt!228601 ((_ sign_extend 32) (size!3005 (buf!3460 (_1!6904 lt!227965)))))))

(assert (=> d!47471 (= lt!228603 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6362 (_1!6904 lt!227965))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6357 (_1!6904 lt!227965)))))))

(assert (=> d!47471 (invariant!0 (currentBit!6357 (_1!6904 lt!227965)) (currentByte!6362 (_1!6904 lt!227965)) (size!3005 (buf!3460 (_1!6904 lt!227965))))))

(assert (=> d!47471 (= (bitIndex!0 (size!3005 (buf!3460 (_1!6904 lt!227965))) (currentByte!6362 (_1!6904 lt!227965)) (currentBit!6357 (_1!6904 lt!227965))) lt!228603)))

(declare-fun b!147035 () Bool)

(declare-fun res!123032 () Bool)

(assert (=> b!147035 (=> (not res!123032) (not e!98032))))

(assert (=> b!147035 (= res!123032 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!228603))))

(declare-fun b!147036 () Bool)

(declare-fun lt!228606 () (_ BitVec 64))

(assert (=> b!147036 (= e!98032 (bvsle lt!228603 (bvmul lt!228606 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!147036 (or (= lt!228606 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!228606 #b0000000000000000000000000000000000000000000000000000000000001000) lt!228606)))))

(assert (=> b!147036 (= lt!228606 ((_ sign_extend 32) (size!3005 (buf!3460 (_1!6904 lt!227965)))))))

(assert (= (and d!47471 res!123031) b!147035))

(assert (= (and b!147035 res!123032) b!147036))

(declare-fun m!227205 () Bool)

(assert (=> d!47471 m!227205))

(declare-fun m!227207 () Bool)

(assert (=> d!47471 m!227207))

(assert (=> b!146757 d!47471))

(declare-fun d!47473 () Bool)

(declare-datatypes ((tuple2!13118 0))(
  ( (tuple2!13119 (_1!6916 (_ BitVec 8)) (_2!6916 BitStream!5268)) )
))
(declare-fun lt!228609 () tuple2!13118)

(declare-fun readByte!0 (BitStream!5268) tuple2!13118)

(assert (=> d!47473 (= lt!228609 (readByte!0 (BitStream!5269 (buf!3460 (_2!6903 lt!227961)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634))))))

(assert (=> d!47473 (= (readBytePure!0 (BitStream!5269 (buf!3460 (_2!6903 lt!227961)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634))) (tuple2!13101 (_2!6916 lt!228609) (_1!6916 lt!228609)))))

(declare-fun bs!11618 () Bool)

(assert (= bs!11618 d!47473))

(declare-fun m!227209 () Bool)

(assert (=> bs!11618 m!227209))

(assert (=> b!146757 d!47473))

(declare-fun d!47475 () Bool)

(declare-fun lt!228610 () tuple2!13118)

(assert (=> d!47475 (= lt!228610 (readByte!0 lt!227979))))

(assert (=> d!47475 (= (readBytePure!0 lt!227979) (tuple2!13101 (_2!6916 lt!228610) (_1!6916 lt!228610)))))

(declare-fun bs!11619 () Bool)

(assert (= bs!11619 d!47475))

(declare-fun m!227211 () Bool)

(assert (=> bs!11619 m!227211))

(assert (=> b!146757 d!47475))

(declare-fun d!47477 () Bool)

(assert (=> d!47477 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!227961)))) ((_ sign_extend 32) (currentByte!6362 thiss!1634)) ((_ sign_extend 32) (currentBit!6357 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!227961)))) ((_ sign_extend 32) (currentByte!6362 thiss!1634)) ((_ sign_extend 32) (currentBit!6357 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11620 () Bool)

(assert (= bs!11620 d!47477))

(declare-fun m!227213 () Bool)

(assert (=> bs!11620 m!227213))

(assert (=> b!146757 d!47477))

(declare-fun d!47479 () Bool)

(assert (=> d!47479 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!227961)))) ((_ sign_extend 32) (currentByte!6362 (_2!6903 lt!227980))) ((_ sign_extend 32) (currentBit!6357 (_2!6903 lt!227980))) lt!227969) (bvsle ((_ sign_extend 32) lt!227969) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!227961)))) ((_ sign_extend 32) (currentByte!6362 (_2!6903 lt!227980))) ((_ sign_extend 32) (currentBit!6357 (_2!6903 lt!227980)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11621 () Bool)

(assert (= bs!11621 d!47479))

(declare-fun m!227215 () Bool)

(assert (=> bs!11621 m!227215))

(assert (=> b!146757 d!47479))

(declare-fun d!47481 () Bool)

(declare-fun e!98035 () Bool)

(assert (=> d!47481 e!98035))

(declare-fun res!123040 () Bool)

(assert (=> d!47481 (=> (not res!123040) (not e!98035))))

(declare-fun lt!228624 () tuple2!13098)

(assert (=> d!47481 (= res!123040 (= (size!3005 (buf!3460 thiss!1634)) (size!3005 (buf!3460 (_2!6903 lt!228624)))))))

(declare-fun choose!6 (BitStream!5268 (_ BitVec 8)) tuple2!13098)

(assert (=> d!47481 (= lt!228624 (choose!6 thiss!1634 (select (arr!3759 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!47481 (validate_offset_byte!0 ((_ sign_extend 32) (size!3005 (buf!3460 thiss!1634))) ((_ sign_extend 32) (currentByte!6362 thiss!1634)) ((_ sign_extend 32) (currentBit!6357 thiss!1634)))))

(assert (=> d!47481 (= (appendByte!0 thiss!1634 (select (arr!3759 arr!237) from!447)) lt!228624)))

(declare-fun b!147043 () Bool)

(declare-fun res!123039 () Bool)

(assert (=> b!147043 (=> (not res!123039) (not e!98035))))

(declare-fun lt!228623 () (_ BitVec 64))

(declare-fun lt!228625 () (_ BitVec 64))

(assert (=> b!147043 (= res!123039 (= (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!228624))) (currentByte!6362 (_2!6903 lt!228624)) (currentBit!6357 (_2!6903 lt!228624))) (bvadd lt!228623 lt!228625)))))

(assert (=> b!147043 (or (not (= (bvand lt!228623 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!228625 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!228623 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!228623 lt!228625) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!147043 (= lt!228625 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!147043 (= lt!228623 (bitIndex!0 (size!3005 (buf!3460 thiss!1634)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634)))))

(declare-fun b!147044 () Bool)

(declare-fun res!123041 () Bool)

(assert (=> b!147044 (=> (not res!123041) (not e!98035))))

(assert (=> b!147044 (= res!123041 (isPrefixOf!0 thiss!1634 (_2!6903 lt!228624)))))

(declare-fun b!147045 () Bool)

(declare-fun lt!228622 () tuple2!13102)

(declare-fun lt!228621 () tuple2!13100)

(assert (=> b!147045 (= e!98035 (and (= (_2!6904 lt!228621) (select (arr!3759 arr!237) from!447)) (= (_1!6904 lt!228621) (_2!6905 lt!228622))))))

(assert (=> b!147045 (= lt!228621 (readBytePure!0 (_1!6905 lt!228622)))))

(assert (=> b!147045 (= lt!228622 (reader!0 thiss!1634 (_2!6903 lt!228624)))))

(assert (= (and d!47481 res!123040) b!147043))

(assert (= (and b!147043 res!123039) b!147044))

(assert (= (and b!147044 res!123041) b!147045))

(assert (=> d!47481 m!226595))

(declare-fun m!227217 () Bool)

(assert (=> d!47481 m!227217))

(declare-fun m!227219 () Bool)

(assert (=> d!47481 m!227219))

(declare-fun m!227221 () Bool)

(assert (=> b!147043 m!227221))

(assert (=> b!147043 m!226661))

(declare-fun m!227223 () Bool)

(assert (=> b!147044 m!227223))

(declare-fun m!227225 () Bool)

(assert (=> b!147045 m!227225))

(declare-fun m!227227 () Bool)

(assert (=> b!147045 m!227227))

(assert (=> b!146757 d!47481))

(declare-fun d!47483 () Bool)

(assert (=> d!47483 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!227980)))) ((_ sign_extend 32) (currentByte!6362 (_2!6903 lt!227980))) ((_ sign_extend 32) (currentBit!6357 (_2!6903 lt!227980))) lt!227969) (bvsle ((_ sign_extend 32) lt!227969) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!227980)))) ((_ sign_extend 32) (currentByte!6362 (_2!6903 lt!227980))) ((_ sign_extend 32) (currentBit!6357 (_2!6903 lt!227980)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11622 () Bool)

(assert (= bs!11622 d!47483))

(assert (=> bs!11622 m!227165))

(assert (=> b!146757 d!47483))

(declare-fun d!47485 () Bool)

(declare-fun e!98040 () Bool)

(assert (=> d!47485 e!98040))

(declare-fun res!123050 () Bool)

(assert (=> d!47485 (=> (not res!123050) (not e!98040))))

(declare-fun lt!228679 () tuple2!13102)

(assert (=> d!47485 (= res!123050 (isPrefixOf!0 (_1!6905 lt!228679) (_2!6905 lt!228679)))))

(declare-fun lt!228685 () BitStream!5268)

(assert (=> d!47485 (= lt!228679 (tuple2!13103 lt!228685 (_2!6903 lt!227961)))))

(declare-fun lt!228672 () Unit!9195)

(declare-fun lt!228668 () Unit!9195)

(assert (=> d!47485 (= lt!228672 lt!228668)))

(assert (=> d!47485 (isPrefixOf!0 lt!228685 (_2!6903 lt!227961))))

(assert (=> d!47485 (= lt!228668 (lemmaIsPrefixTransitive!0 lt!228685 (_2!6903 lt!227961) (_2!6903 lt!227961)))))

(declare-fun lt!228680 () Unit!9195)

(declare-fun lt!228677 () Unit!9195)

(assert (=> d!47485 (= lt!228680 lt!228677)))

(assert (=> d!47485 (isPrefixOf!0 lt!228685 (_2!6903 lt!227961))))

(assert (=> d!47485 (= lt!228677 (lemmaIsPrefixTransitive!0 lt!228685 thiss!1634 (_2!6903 lt!227961)))))

(declare-fun lt!228681 () Unit!9195)

(declare-fun e!98041 () Unit!9195)

(assert (=> d!47485 (= lt!228681 e!98041)))

(declare-fun c!7960 () Bool)

(assert (=> d!47485 (= c!7960 (not (= (size!3005 (buf!3460 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!228667 () Unit!9195)

(declare-fun lt!228675 () Unit!9195)

(assert (=> d!47485 (= lt!228667 lt!228675)))

(assert (=> d!47485 (isPrefixOf!0 (_2!6903 lt!227961) (_2!6903 lt!227961))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5268) Unit!9195)

(assert (=> d!47485 (= lt!228675 (lemmaIsPrefixRefl!0 (_2!6903 lt!227961)))))

(declare-fun lt!228674 () Unit!9195)

(declare-fun lt!228671 () Unit!9195)

(assert (=> d!47485 (= lt!228674 lt!228671)))

(assert (=> d!47485 (= lt!228671 (lemmaIsPrefixRefl!0 (_2!6903 lt!227961)))))

(declare-fun lt!228682 () Unit!9195)

(declare-fun lt!228676 () Unit!9195)

(assert (=> d!47485 (= lt!228682 lt!228676)))

(assert (=> d!47485 (isPrefixOf!0 lt!228685 lt!228685)))

(assert (=> d!47485 (= lt!228676 (lemmaIsPrefixRefl!0 lt!228685))))

(declare-fun lt!228670 () Unit!9195)

(declare-fun lt!228678 () Unit!9195)

(assert (=> d!47485 (= lt!228670 lt!228678)))

(assert (=> d!47485 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!47485 (= lt!228678 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!47485 (= lt!228685 (BitStream!5269 (buf!3460 (_2!6903 lt!227961)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634)))))

(assert (=> d!47485 (isPrefixOf!0 thiss!1634 (_2!6903 lt!227961))))

(assert (=> d!47485 (= (reader!0 thiss!1634 (_2!6903 lt!227961)) lt!228679)))

(declare-fun b!147056 () Bool)

(declare-fun res!123048 () Bool)

(assert (=> b!147056 (=> (not res!123048) (not e!98040))))

(assert (=> b!147056 (= res!123048 (isPrefixOf!0 (_1!6905 lt!228679) thiss!1634))))

(declare-fun b!147057 () Bool)

(declare-fun lt!228673 () Unit!9195)

(assert (=> b!147057 (= e!98041 lt!228673)))

(declare-fun lt!228683 () (_ BitVec 64))

(assert (=> b!147057 (= lt!228683 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!228684 () (_ BitVec 64))

(assert (=> b!147057 (= lt!228684 (bitIndex!0 (size!3005 (buf!3460 thiss!1634)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6640 array!6640 (_ BitVec 64) (_ BitVec 64)) Unit!9195)

(assert (=> b!147057 (= lt!228673 (arrayBitRangesEqSymmetric!0 (buf!3460 thiss!1634) (buf!3460 (_2!6903 lt!227961)) lt!228683 lt!228684))))

(assert (=> b!147057 (arrayBitRangesEq!0 (buf!3460 (_2!6903 lt!227961)) (buf!3460 thiss!1634) lt!228683 lt!228684)))

(declare-fun b!147058 () Bool)

(declare-fun Unit!9205 () Unit!9195)

(assert (=> b!147058 (= e!98041 Unit!9205)))

(declare-fun b!147059 () Bool)

(declare-fun res!123049 () Bool)

(assert (=> b!147059 (=> (not res!123049) (not e!98040))))

(assert (=> b!147059 (= res!123049 (isPrefixOf!0 (_2!6905 lt!228679) (_2!6903 lt!227961)))))

(declare-fun lt!228669 () (_ BitVec 64))

(declare-fun lt!228666 () (_ BitVec 64))

(declare-fun b!147060 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!5268 (_ BitVec 64)) BitStream!5268)

(assert (=> b!147060 (= e!98040 (= (_1!6905 lt!228679) (withMovedBitIndex!0 (_2!6905 lt!228679) (bvsub lt!228669 lt!228666))))))

(assert (=> b!147060 (or (= (bvand lt!228669 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!228666 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!228669 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!228669 lt!228666) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!147060 (= lt!228666 (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!227961))) (currentByte!6362 (_2!6903 lt!227961)) (currentBit!6357 (_2!6903 lt!227961))))))

(assert (=> b!147060 (= lt!228669 (bitIndex!0 (size!3005 (buf!3460 thiss!1634)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634)))))

(assert (= (and d!47485 c!7960) b!147057))

(assert (= (and d!47485 (not c!7960)) b!147058))

(assert (= (and d!47485 res!123050) b!147056))

(assert (= (and b!147056 res!123048) b!147059))

(assert (= (and b!147059 res!123049) b!147060))

(declare-fun m!227229 () Bool)

(assert (=> b!147056 m!227229))

(declare-fun m!227231 () Bool)

(assert (=> b!147060 m!227231))

(assert (=> b!147060 m!226653))

(assert (=> b!147060 m!226661))

(assert (=> b!147057 m!226661))

(declare-fun m!227233 () Bool)

(assert (=> b!147057 m!227233))

(declare-fun m!227235 () Bool)

(assert (=> b!147057 m!227235))

(declare-fun m!227237 () Bool)

(assert (=> d!47485 m!227237))

(declare-fun m!227239 () Bool)

(assert (=> d!47485 m!227239))

(declare-fun m!227241 () Bool)

(assert (=> d!47485 m!227241))

(declare-fun m!227243 () Bool)

(assert (=> d!47485 m!227243))

(declare-fun m!227245 () Bool)

(assert (=> d!47485 m!227245))

(assert (=> d!47485 m!226635))

(declare-fun m!227247 () Bool)

(assert (=> d!47485 m!227247))

(declare-fun m!227249 () Bool)

(assert (=> d!47485 m!227249))

(declare-fun m!227251 () Bool)

(assert (=> d!47485 m!227251))

(declare-fun m!227253 () Bool)

(assert (=> d!47485 m!227253))

(declare-fun m!227255 () Bool)

(assert (=> d!47485 m!227255))

(declare-fun m!227257 () Bool)

(assert (=> b!147059 m!227257))

(assert (=> b!146757 d!47485))

(declare-fun d!47487 () Bool)

(declare-fun res!123051 () Bool)

(declare-fun e!98042 () Bool)

(assert (=> d!47487 (=> res!123051 e!98042)))

(assert (=> d!47487 (= res!123051 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!47487 (= (arrayRangesEq!321 (_2!6906 lt!227967) (_2!6906 lt!227960) #b00000000000000000000000000000000 to!404) e!98042)))

(declare-fun b!147061 () Bool)

(declare-fun e!98043 () Bool)

(assert (=> b!147061 (= e!98042 e!98043)))

(declare-fun res!123052 () Bool)

(assert (=> b!147061 (=> (not res!123052) (not e!98043))))

(assert (=> b!147061 (= res!123052 (= (select (arr!3759 (_2!6906 lt!227967)) #b00000000000000000000000000000000) (select (arr!3759 (_2!6906 lt!227960)) #b00000000000000000000000000000000)))))

(declare-fun b!147062 () Bool)

(assert (=> b!147062 (= e!98043 (arrayRangesEq!321 (_2!6906 lt!227967) (_2!6906 lt!227960) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!47487 (not res!123051)) b!147061))

(assert (= (and b!147061 res!123052) b!147062))

(assert (=> b!147061 m!227193))

(declare-fun m!227259 () Bool)

(assert (=> b!147061 m!227259))

(declare-fun m!227261 () Bool)

(assert (=> b!147062 m!227261))

(assert (=> b!146757 d!47487))

(declare-fun d!47489 () Bool)

(declare-fun e!98046 () Bool)

(assert (=> d!47489 e!98046))

(declare-fun res!123055 () Bool)

(assert (=> d!47489 (=> (not res!123055) (not e!98046))))

(declare-fun lt!228697 () tuple2!13100)

(declare-fun lt!228694 () tuple2!13100)

(assert (=> d!47489 (= res!123055 (= (bitIndex!0 (size!3005 (buf!3460 (_1!6904 lt!228697))) (currentByte!6362 (_1!6904 lt!228697)) (currentBit!6357 (_1!6904 lt!228697))) (bitIndex!0 (size!3005 (buf!3460 (_1!6904 lt!228694))) (currentByte!6362 (_1!6904 lt!228694)) (currentBit!6357 (_1!6904 lt!228694)))))))

(declare-fun lt!228695 () BitStream!5268)

(declare-fun lt!228696 () Unit!9195)

(declare-fun choose!14 (BitStream!5268 BitStream!5268 BitStream!5268 tuple2!13100 tuple2!13100 BitStream!5268 (_ BitVec 8) tuple2!13100 tuple2!13100 BitStream!5268 (_ BitVec 8)) Unit!9195)

(assert (=> d!47489 (= lt!228696 (choose!14 lt!227979 (_2!6903 lt!227961) lt!228695 lt!228697 (tuple2!13101 (_1!6904 lt!228697) (_2!6904 lt!228697)) (_1!6904 lt!228697) (_2!6904 lt!228697) lt!228694 (tuple2!13101 (_1!6904 lt!228694) (_2!6904 lt!228694)) (_1!6904 lt!228694) (_2!6904 lt!228694)))))

(assert (=> d!47489 (= lt!228694 (readBytePure!0 lt!228695))))

(assert (=> d!47489 (= lt!228697 (readBytePure!0 lt!227979))))

(assert (=> d!47489 (= lt!228695 (BitStream!5269 (buf!3460 (_2!6903 lt!227961)) (currentByte!6362 lt!227979) (currentBit!6357 lt!227979)))))

(assert (=> d!47489 (= (readBytePrefixLemma!0 lt!227979 (_2!6903 lt!227961)) lt!228696)))

(declare-fun b!147065 () Bool)

(assert (=> b!147065 (= e!98046 (= (_2!6904 lt!228697) (_2!6904 lt!228694)))))

(assert (= (and d!47489 res!123055) b!147065))

(declare-fun m!227263 () Bool)

(assert (=> d!47489 m!227263))

(declare-fun m!227265 () Bool)

(assert (=> d!47489 m!227265))

(assert (=> d!47489 m!226617))

(declare-fun m!227267 () Bool)

(assert (=> d!47489 m!227267))

(declare-fun m!227269 () Bool)

(assert (=> d!47489 m!227269))

(assert (=> b!146757 d!47489))

(declare-fun d!47491 () Bool)

(declare-fun moveByteIndex!0 (BitStream!5268 (_ BitVec 32)) tuple2!13098)

(assert (=> d!47491 (= (withMovedByteIndex!0 (_1!6905 lt!227956) #b00000000000000000000000000000001) (_2!6903 (moveByteIndex!0 (_1!6905 lt!227956) #b00000000000000000000000000000001)))))

(declare-fun bs!11623 () Bool)

(assert (= bs!11623 d!47491))

(declare-fun m!227271 () Bool)

(assert (=> bs!11623 m!227271))

(assert (=> b!146757 d!47491))

(declare-fun d!47493 () Bool)

(declare-fun e!98049 () Bool)

(assert (=> d!47493 e!98049))

(declare-fun res!123058 () Bool)

(assert (=> d!47493 (=> (not res!123058) (not e!98049))))

(assert (=> d!47493 (= res!123058 (and (or (let ((rhs!3249 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3249 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3249) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!47494 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!47494 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!47494 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3248 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3248 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3248) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!228705 () Unit!9195)

(declare-fun choose!57 (BitStream!5268 BitStream!5268 (_ BitVec 64) (_ BitVec 32)) Unit!9195)

(assert (=> d!47493 (= lt!228705 (choose!57 thiss!1634 (_2!6903 lt!227980) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!47493 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6903 lt!227980) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!228705)))

(declare-fun b!147068 () Bool)

(declare-fun lt!228706 () (_ BitVec 32))

(assert (=> b!147068 (= e!98049 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!227980)))) ((_ sign_extend 32) (currentByte!6362 (_2!6903 lt!227980))) ((_ sign_extend 32) (currentBit!6357 (_2!6903 lt!227980))) (bvsub (bvsub to!404 from!447) lt!228706)))))

(assert (=> b!147068 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!228706 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!228706) #b10000000000000000000000000000000)))))

(declare-fun lt!228704 () (_ BitVec 64))

(assert (=> b!147068 (= lt!228706 ((_ extract 31 0) lt!228704))))

(assert (=> b!147068 (and (bvslt lt!228704 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!228704 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!147068 (= lt!228704 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!47493 res!123058) b!147068))

(declare-fun m!227273 () Bool)

(assert (=> d!47493 m!227273))

(declare-fun m!227275 () Bool)

(assert (=> b!147068 m!227275))

(assert (=> b!146757 d!47493))

(declare-fun d!47496 () Bool)

(declare-fun lt!228707 () tuple2!13118)

(assert (=> d!47496 (= lt!228707 (readByte!0 (_1!6905 lt!227956)))))

(assert (=> d!47496 (= (readBytePure!0 (_1!6905 lt!227956)) (tuple2!13101 (_2!6916 lt!228707) (_1!6916 lt!228707)))))

(declare-fun bs!11624 () Bool)

(assert (= bs!11624 d!47496))

(declare-fun m!227277 () Bool)

(assert (=> bs!11624 m!227277))

(assert (=> b!146757 d!47496))

(declare-fun d!47498 () Bool)

(declare-fun e!98050 () Bool)

(assert (=> d!47498 e!98050))

(declare-fun res!123059 () Bool)

(assert (=> d!47498 (=> (not res!123059) (not e!98050))))

(declare-fun lt!228709 () (_ BitVec 64))

(declare-fun lt!228712 () (_ BitVec 64))

(declare-fun lt!228710 () (_ BitVec 64))

(assert (=> d!47498 (= res!123059 (= lt!228710 (bvsub lt!228709 lt!228712)))))

(assert (=> d!47498 (or (= (bvand lt!228709 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!228712 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!228709 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!228709 lt!228712) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!47498 (= lt!228712 (remainingBits!0 ((_ sign_extend 32) (size!3005 (buf!3460 (_1!6904 lt!227957)))) ((_ sign_extend 32) (currentByte!6362 (_1!6904 lt!227957))) ((_ sign_extend 32) (currentBit!6357 (_1!6904 lt!227957)))))))

(declare-fun lt!228708 () (_ BitVec 64))

(declare-fun lt!228711 () (_ BitVec 64))

(assert (=> d!47498 (= lt!228709 (bvmul lt!228708 lt!228711))))

(assert (=> d!47498 (or (= lt!228708 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!228711 (bvsdiv (bvmul lt!228708 lt!228711) lt!228708)))))

(assert (=> d!47498 (= lt!228711 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!47498 (= lt!228708 ((_ sign_extend 32) (size!3005 (buf!3460 (_1!6904 lt!227957)))))))

(assert (=> d!47498 (= lt!228710 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6362 (_1!6904 lt!227957))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6357 (_1!6904 lt!227957)))))))

(assert (=> d!47498 (invariant!0 (currentBit!6357 (_1!6904 lt!227957)) (currentByte!6362 (_1!6904 lt!227957)) (size!3005 (buf!3460 (_1!6904 lt!227957))))))

(assert (=> d!47498 (= (bitIndex!0 (size!3005 (buf!3460 (_1!6904 lt!227957))) (currentByte!6362 (_1!6904 lt!227957)) (currentBit!6357 (_1!6904 lt!227957))) lt!228710)))

(declare-fun b!147069 () Bool)

(declare-fun res!123060 () Bool)

(assert (=> b!147069 (=> (not res!123060) (not e!98050))))

(assert (=> b!147069 (= res!123060 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!228710))))

(declare-fun b!147070 () Bool)

(declare-fun lt!228713 () (_ BitVec 64))

(assert (=> b!147070 (= e!98050 (bvsle lt!228710 (bvmul lt!228713 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!147070 (or (= lt!228713 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!228713 #b0000000000000000000000000000000000000000000000000000000000001000) lt!228713)))))

(assert (=> b!147070 (= lt!228713 ((_ sign_extend 32) (size!3005 (buf!3460 (_1!6904 lt!227957)))))))

(assert (= (and d!47498 res!123059) b!147069))

(assert (= (and b!147069 res!123060) b!147070))

(declare-fun m!227279 () Bool)

(assert (=> d!47498 m!227279))

(declare-fun m!227281 () Bool)

(assert (=> d!47498 m!227281))

(assert (=> b!146757 d!47498))

(declare-fun d!47500 () Bool)

(assert (=> d!47500 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!227961)))) ((_ sign_extend 32) (currentByte!6362 (_2!6903 lt!227980))) ((_ sign_extend 32) (currentBit!6357 (_2!6903 lt!227980))) lt!227969)))

(declare-fun lt!228714 () Unit!9195)

(assert (=> d!47500 (= lt!228714 (choose!26 (_2!6903 lt!227980) (buf!3460 (_2!6903 lt!227961)) lt!227969 (BitStream!5269 (buf!3460 (_2!6903 lt!227961)) (currentByte!6362 (_2!6903 lt!227980)) (currentBit!6357 (_2!6903 lt!227980)))))))

(assert (=> d!47500 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6903 lt!227980) (buf!3460 (_2!6903 lt!227961)) lt!227969) lt!228714)))

(declare-fun bs!11625 () Bool)

(assert (= bs!11625 d!47500))

(assert (=> bs!11625 m!226631))

(declare-fun m!227283 () Bool)

(assert (=> bs!11625 m!227283))

(assert (=> b!146757 d!47500))

(declare-fun lt!228715 () tuple3!574)

(declare-fun d!47502 () Bool)

(assert (=> d!47502 (= lt!228715 (readByteArrayLoop!0 (_1!6905 lt!227978) lt!227971 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!47502 (= (readByteArrayLoopPure!0 (_1!6905 lt!227978) lt!227971 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13105 (_2!6915 lt!228715) (_3!356 lt!228715)))))

(declare-fun bs!11626 () Bool)

(assert (= bs!11626 d!47502))

(declare-fun m!227285 () Bool)

(assert (=> bs!11626 m!227285))

(assert (=> b!146757 d!47502))

(declare-fun d!47504 () Bool)

(declare-fun lt!228724 () tuple2!13104)

(declare-fun lt!228726 () tuple2!13104)

(assert (=> d!47504 (arrayRangesEq!321 (_2!6906 lt!228724) (_2!6906 lt!228726) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!228725 () BitStream!5268)

(declare-fun lt!228727 () Unit!9195)

(declare-fun choose!35 (BitStream!5268 array!6640 (_ BitVec 32) (_ BitVec 32) tuple2!13104 array!6640 BitStream!5268 tuple2!13104 array!6640) Unit!9195)

(assert (=> d!47504 (= lt!228727 (choose!35 (_1!6905 lt!227956) arr!237 from!447 to!404 lt!228724 (_2!6906 lt!228724) lt!228725 lt!228726 (_2!6906 lt!228726)))))

(assert (=> d!47504 (= lt!228726 (readByteArrayLoopPure!0 lt!228725 (array!6641 (store (arr!3759 arr!237) from!447 (_2!6904 (readBytePure!0 (_1!6905 lt!227956)))) (size!3005 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!47504 (= lt!228725 (withMovedByteIndex!0 (_1!6905 lt!227956) #b00000000000000000000000000000001))))

(assert (=> d!47504 (= lt!228724 (readByteArrayLoopPure!0 (_1!6905 lt!227956) arr!237 from!447 to!404))))

(assert (=> d!47504 (= (readByteArrayLoopArrayPrefixLemma!0 (_1!6905 lt!227956) arr!237 from!447 to!404) lt!228727)))

(declare-fun bs!11628 () Bool)

(assert (= bs!11628 d!47504))

(declare-fun m!227287 () Bool)

(assert (=> bs!11628 m!227287))

(declare-fun m!227289 () Bool)

(assert (=> bs!11628 m!227289))

(declare-fun m!227291 () Bool)

(assert (=> bs!11628 m!227291))

(assert (=> bs!11628 m!226645))

(assert (=> bs!11628 m!226613))

(declare-fun m!227293 () Bool)

(assert (=> bs!11628 m!227293))

(assert (=> bs!11628 m!226623))

(assert (=> b!146757 d!47504))

(declare-fun d!47506 () Bool)

(declare-fun e!98051 () Bool)

(assert (=> d!47506 e!98051))

(declare-fun res!123063 () Bool)

(assert (=> d!47506 (=> (not res!123063) (not e!98051))))

(declare-fun lt!228741 () tuple2!13102)

(assert (=> d!47506 (= res!123063 (isPrefixOf!0 (_1!6905 lt!228741) (_2!6905 lt!228741)))))

(declare-fun lt!228747 () BitStream!5268)

(assert (=> d!47506 (= lt!228741 (tuple2!13103 lt!228747 (_2!6903 lt!227961)))))

(declare-fun lt!228734 () Unit!9195)

(declare-fun lt!228730 () Unit!9195)

(assert (=> d!47506 (= lt!228734 lt!228730)))

(assert (=> d!47506 (isPrefixOf!0 lt!228747 (_2!6903 lt!227961))))

(assert (=> d!47506 (= lt!228730 (lemmaIsPrefixTransitive!0 lt!228747 (_2!6903 lt!227961) (_2!6903 lt!227961)))))

(declare-fun lt!228742 () Unit!9195)

(declare-fun lt!228739 () Unit!9195)

(assert (=> d!47506 (= lt!228742 lt!228739)))

(assert (=> d!47506 (isPrefixOf!0 lt!228747 (_2!6903 lt!227961))))

(assert (=> d!47506 (= lt!228739 (lemmaIsPrefixTransitive!0 lt!228747 (_2!6903 lt!227980) (_2!6903 lt!227961)))))

(declare-fun lt!228743 () Unit!9195)

(declare-fun e!98052 () Unit!9195)

(assert (=> d!47506 (= lt!228743 e!98052)))

(declare-fun c!7961 () Bool)

(assert (=> d!47506 (= c!7961 (not (= (size!3005 (buf!3460 (_2!6903 lt!227980))) #b00000000000000000000000000000000)))))

(declare-fun lt!228729 () Unit!9195)

(declare-fun lt!228737 () Unit!9195)

(assert (=> d!47506 (= lt!228729 lt!228737)))

(assert (=> d!47506 (isPrefixOf!0 (_2!6903 lt!227961) (_2!6903 lt!227961))))

(assert (=> d!47506 (= lt!228737 (lemmaIsPrefixRefl!0 (_2!6903 lt!227961)))))

(declare-fun lt!228736 () Unit!9195)

(declare-fun lt!228733 () Unit!9195)

(assert (=> d!47506 (= lt!228736 lt!228733)))

(assert (=> d!47506 (= lt!228733 (lemmaIsPrefixRefl!0 (_2!6903 lt!227961)))))

(declare-fun lt!228744 () Unit!9195)

(declare-fun lt!228738 () Unit!9195)

(assert (=> d!47506 (= lt!228744 lt!228738)))

(assert (=> d!47506 (isPrefixOf!0 lt!228747 lt!228747)))

(assert (=> d!47506 (= lt!228738 (lemmaIsPrefixRefl!0 lt!228747))))

(declare-fun lt!228732 () Unit!9195)

(declare-fun lt!228740 () Unit!9195)

(assert (=> d!47506 (= lt!228732 lt!228740)))

(assert (=> d!47506 (isPrefixOf!0 (_2!6903 lt!227980) (_2!6903 lt!227980))))

(assert (=> d!47506 (= lt!228740 (lemmaIsPrefixRefl!0 (_2!6903 lt!227980)))))

(assert (=> d!47506 (= lt!228747 (BitStream!5269 (buf!3460 (_2!6903 lt!227961)) (currentByte!6362 (_2!6903 lt!227980)) (currentBit!6357 (_2!6903 lt!227980))))))

(assert (=> d!47506 (isPrefixOf!0 (_2!6903 lt!227980) (_2!6903 lt!227961))))

(assert (=> d!47506 (= (reader!0 (_2!6903 lt!227980) (_2!6903 lt!227961)) lt!228741)))

(declare-fun b!147071 () Bool)

(declare-fun res!123061 () Bool)

(assert (=> b!147071 (=> (not res!123061) (not e!98051))))

(assert (=> b!147071 (= res!123061 (isPrefixOf!0 (_1!6905 lt!228741) (_2!6903 lt!227980)))))

(declare-fun b!147072 () Bool)

(declare-fun lt!228735 () Unit!9195)

(assert (=> b!147072 (= e!98052 lt!228735)))

(declare-fun lt!228745 () (_ BitVec 64))

(assert (=> b!147072 (= lt!228745 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!228746 () (_ BitVec 64))

(assert (=> b!147072 (= lt!228746 (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!227980))) (currentByte!6362 (_2!6903 lt!227980)) (currentBit!6357 (_2!6903 lt!227980))))))

(assert (=> b!147072 (= lt!228735 (arrayBitRangesEqSymmetric!0 (buf!3460 (_2!6903 lt!227980)) (buf!3460 (_2!6903 lt!227961)) lt!228745 lt!228746))))

(assert (=> b!147072 (arrayBitRangesEq!0 (buf!3460 (_2!6903 lt!227961)) (buf!3460 (_2!6903 lt!227980)) lt!228745 lt!228746)))

(declare-fun b!147073 () Bool)

(declare-fun Unit!9206 () Unit!9195)

(assert (=> b!147073 (= e!98052 Unit!9206)))

(declare-fun b!147074 () Bool)

(declare-fun res!123062 () Bool)

(assert (=> b!147074 (=> (not res!123062) (not e!98051))))

(assert (=> b!147074 (= res!123062 (isPrefixOf!0 (_2!6905 lt!228741) (_2!6903 lt!227961)))))

(declare-fun b!147075 () Bool)

(declare-fun lt!228731 () (_ BitVec 64))

(declare-fun lt!228728 () (_ BitVec 64))

(assert (=> b!147075 (= e!98051 (= (_1!6905 lt!228741) (withMovedBitIndex!0 (_2!6905 lt!228741) (bvsub lt!228731 lt!228728))))))

(assert (=> b!147075 (or (= (bvand lt!228731 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!228728 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!228731 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!228731 lt!228728) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!147075 (= lt!228728 (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!227961))) (currentByte!6362 (_2!6903 lt!227961)) (currentBit!6357 (_2!6903 lt!227961))))))

(assert (=> b!147075 (= lt!228731 (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!227980))) (currentByte!6362 (_2!6903 lt!227980)) (currentBit!6357 (_2!6903 lt!227980))))))

(assert (= (and d!47506 c!7961) b!147072))

(assert (= (and d!47506 (not c!7961)) b!147073))

(assert (= (and d!47506 res!123063) b!147071))

(assert (= (and b!147071 res!123061) b!147074))

(assert (= (and b!147074 res!123062) b!147075))

(declare-fun m!227295 () Bool)

(assert (=> b!147071 m!227295))

(declare-fun m!227297 () Bool)

(assert (=> b!147075 m!227297))

(assert (=> b!147075 m!226653))

(assert (=> b!147075 m!226655))

(assert (=> b!147072 m!226655))

(declare-fun m!227299 () Bool)

(assert (=> b!147072 m!227299))

(declare-fun m!227301 () Bool)

(assert (=> b!147072 m!227301))

(declare-fun m!227303 () Bool)

(assert (=> d!47506 m!227303))

(declare-fun m!227305 () Bool)

(assert (=> d!47506 m!227305))

(declare-fun m!227307 () Bool)

(assert (=> d!47506 m!227307))

(declare-fun m!227309 () Bool)

(assert (=> d!47506 m!227309))

(assert (=> d!47506 m!227245))

(assert (=> d!47506 m!226583))

(declare-fun m!227311 () Bool)

(assert (=> d!47506 m!227311))

(declare-fun m!227313 () Bool)

(assert (=> d!47506 m!227313))

(declare-fun m!227315 () Bool)

(assert (=> d!47506 m!227315))

(declare-fun m!227317 () Bool)

(assert (=> d!47506 m!227317))

(assert (=> d!47506 m!227255))

(declare-fun m!227319 () Bool)

(assert (=> b!147074 m!227319))

(assert (=> b!146757 d!47506))

(declare-fun d!47508 () Bool)

(declare-fun res!123064 () Bool)

(declare-fun e!98053 () Bool)

(assert (=> d!47508 (=> (not res!123064) (not e!98053))))

(assert (=> d!47508 (= res!123064 (= (size!3005 (buf!3460 (_2!6903 lt!227980))) (size!3005 (buf!3460 (_2!6903 lt!227961)))))))

(assert (=> d!47508 (= (isPrefixOf!0 (_2!6903 lt!227980) (_2!6903 lt!227961)) e!98053)))

(declare-fun b!147076 () Bool)

(declare-fun res!123066 () Bool)

(assert (=> b!147076 (=> (not res!123066) (not e!98053))))

(assert (=> b!147076 (= res!123066 (bvsle (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!227980))) (currentByte!6362 (_2!6903 lt!227980)) (currentBit!6357 (_2!6903 lt!227980))) (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!227961))) (currentByte!6362 (_2!6903 lt!227961)) (currentBit!6357 (_2!6903 lt!227961)))))))

(declare-fun b!147077 () Bool)

(declare-fun e!98054 () Bool)

(assert (=> b!147077 (= e!98053 e!98054)))

(declare-fun res!123065 () Bool)

(assert (=> b!147077 (=> res!123065 e!98054)))

(assert (=> b!147077 (= res!123065 (= (size!3005 (buf!3460 (_2!6903 lt!227980))) #b00000000000000000000000000000000))))

(declare-fun b!147078 () Bool)

(assert (=> b!147078 (= e!98054 (arrayBitRangesEq!0 (buf!3460 (_2!6903 lt!227980)) (buf!3460 (_2!6903 lt!227961)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!227980))) (currentByte!6362 (_2!6903 lt!227980)) (currentBit!6357 (_2!6903 lt!227980)))))))

(assert (= (and d!47508 res!123064) b!147076))

(assert (= (and b!147076 res!123066) b!147077))

(assert (= (and b!147077 (not res!123065)) b!147078))

(assert (=> b!147076 m!226655))

(assert (=> b!147076 m!226653))

(assert (=> b!147078 m!226655))

(assert (=> b!147078 m!226655))

(declare-fun m!227321 () Bool)

(assert (=> b!147078 m!227321))

(assert (=> b!146758 d!47508))

(declare-fun d!47510 () Bool)

(assert (=> d!47510 (= (invariant!0 (currentBit!6357 thiss!1634) (currentByte!6362 thiss!1634) (size!3005 (buf!3460 (_2!6903 lt!227980)))) (and (bvsge (currentBit!6357 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6357 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6362 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6362 thiss!1634) (size!3005 (buf!3460 (_2!6903 lt!227980)))) (and (= (currentBit!6357 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6362 thiss!1634) (size!3005 (buf!3460 (_2!6903 lt!227980))))))))))

(assert (=> b!146747 d!47510))

(declare-fun d!47512 () Bool)

(assert (=> d!47512 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3005 (buf!3460 thiss!1634))) ((_ sign_extend 32) (currentByte!6362 thiss!1634)) ((_ sign_extend 32) (currentBit!6357 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3005 (buf!3460 thiss!1634))) ((_ sign_extend 32) (currentByte!6362 thiss!1634)) ((_ sign_extend 32) (currentBit!6357 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11629 () Bool)

(assert (= bs!11629 d!47512))

(assert (=> bs!11629 m!227169))

(assert (=> b!146749 d!47512))

(declare-fun d!47514 () Bool)

(declare-fun res!123067 () Bool)

(declare-fun e!98055 () Bool)

(assert (=> d!47514 (=> (not res!123067) (not e!98055))))

(assert (=> d!47514 (= res!123067 (= (size!3005 (buf!3460 thiss!1634)) (size!3005 (buf!3460 (_2!6903 lt!227980)))))))

(assert (=> d!47514 (= (isPrefixOf!0 thiss!1634 (_2!6903 lt!227980)) e!98055)))

(declare-fun b!147079 () Bool)

(declare-fun res!123069 () Bool)

(assert (=> b!147079 (=> (not res!123069) (not e!98055))))

(assert (=> b!147079 (= res!123069 (bvsle (bitIndex!0 (size!3005 (buf!3460 thiss!1634)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634)) (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!227980))) (currentByte!6362 (_2!6903 lt!227980)) (currentBit!6357 (_2!6903 lt!227980)))))))

(declare-fun b!147080 () Bool)

(declare-fun e!98056 () Bool)

(assert (=> b!147080 (= e!98055 e!98056)))

(declare-fun res!123068 () Bool)

(assert (=> b!147080 (=> res!123068 e!98056)))

(assert (=> b!147080 (= res!123068 (= (size!3005 (buf!3460 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!147081 () Bool)

(assert (=> b!147081 (= e!98056 (arrayBitRangesEq!0 (buf!3460 thiss!1634) (buf!3460 (_2!6903 lt!227980)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3005 (buf!3460 thiss!1634)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634))))))

(assert (= (and d!47514 res!123067) b!147079))

(assert (= (and b!147079 res!123069) b!147080))

(assert (= (and b!147080 (not res!123068)) b!147081))

(assert (=> b!147079 m!226661))

(assert (=> b!147079 m!226655))

(assert (=> b!147081 m!226661))

(assert (=> b!147081 m!226661))

(declare-fun m!227323 () Bool)

(assert (=> b!147081 m!227323))

(assert (=> b!146750 d!47514))

(declare-fun d!47516 () Bool)

(declare-fun lt!228748 () tuple2!13118)

(assert (=> d!47516 (= lt!228748 (readByte!0 (_1!6905 lt!227974)))))

(assert (=> d!47516 (= (readBytePure!0 (_1!6905 lt!227974)) (tuple2!13101 (_2!6916 lt!228748) (_1!6916 lt!228748)))))

(declare-fun bs!11630 () Bool)

(assert (= bs!11630 d!47516))

(declare-fun m!227325 () Bool)

(assert (=> bs!11630 m!227325))

(assert (=> b!146752 d!47516))

(declare-fun d!47518 () Bool)

(declare-fun e!98057 () Bool)

(assert (=> d!47518 e!98057))

(declare-fun res!123072 () Bool)

(assert (=> d!47518 (=> (not res!123072) (not e!98057))))

(declare-fun lt!228762 () tuple2!13102)

(assert (=> d!47518 (= res!123072 (isPrefixOf!0 (_1!6905 lt!228762) (_2!6905 lt!228762)))))

(declare-fun lt!228768 () BitStream!5268)

(assert (=> d!47518 (= lt!228762 (tuple2!13103 lt!228768 (_2!6903 lt!227980)))))

(declare-fun lt!228755 () Unit!9195)

(declare-fun lt!228751 () Unit!9195)

(assert (=> d!47518 (= lt!228755 lt!228751)))

(assert (=> d!47518 (isPrefixOf!0 lt!228768 (_2!6903 lt!227980))))

(assert (=> d!47518 (= lt!228751 (lemmaIsPrefixTransitive!0 lt!228768 (_2!6903 lt!227980) (_2!6903 lt!227980)))))

(declare-fun lt!228763 () Unit!9195)

(declare-fun lt!228760 () Unit!9195)

(assert (=> d!47518 (= lt!228763 lt!228760)))

(assert (=> d!47518 (isPrefixOf!0 lt!228768 (_2!6903 lt!227980))))

(assert (=> d!47518 (= lt!228760 (lemmaIsPrefixTransitive!0 lt!228768 thiss!1634 (_2!6903 lt!227980)))))

(declare-fun lt!228764 () Unit!9195)

(declare-fun e!98058 () Unit!9195)

(assert (=> d!47518 (= lt!228764 e!98058)))

(declare-fun c!7962 () Bool)

(assert (=> d!47518 (= c!7962 (not (= (size!3005 (buf!3460 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!228750 () Unit!9195)

(declare-fun lt!228758 () Unit!9195)

(assert (=> d!47518 (= lt!228750 lt!228758)))

(assert (=> d!47518 (isPrefixOf!0 (_2!6903 lt!227980) (_2!6903 lt!227980))))

(assert (=> d!47518 (= lt!228758 (lemmaIsPrefixRefl!0 (_2!6903 lt!227980)))))

(declare-fun lt!228757 () Unit!9195)

(declare-fun lt!228754 () Unit!9195)

(assert (=> d!47518 (= lt!228757 lt!228754)))

(assert (=> d!47518 (= lt!228754 (lemmaIsPrefixRefl!0 (_2!6903 lt!227980)))))

(declare-fun lt!228765 () Unit!9195)

(declare-fun lt!228759 () Unit!9195)

(assert (=> d!47518 (= lt!228765 lt!228759)))

(assert (=> d!47518 (isPrefixOf!0 lt!228768 lt!228768)))

(assert (=> d!47518 (= lt!228759 (lemmaIsPrefixRefl!0 lt!228768))))

(declare-fun lt!228753 () Unit!9195)

(declare-fun lt!228761 () Unit!9195)

(assert (=> d!47518 (= lt!228753 lt!228761)))

(assert (=> d!47518 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!47518 (= lt!228761 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!47518 (= lt!228768 (BitStream!5269 (buf!3460 (_2!6903 lt!227980)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634)))))

(assert (=> d!47518 (isPrefixOf!0 thiss!1634 (_2!6903 lt!227980))))

(assert (=> d!47518 (= (reader!0 thiss!1634 (_2!6903 lt!227980)) lt!228762)))

(declare-fun b!147082 () Bool)

(declare-fun res!123070 () Bool)

(assert (=> b!147082 (=> (not res!123070) (not e!98057))))

(assert (=> b!147082 (= res!123070 (isPrefixOf!0 (_1!6905 lt!228762) thiss!1634))))

(declare-fun b!147083 () Bool)

(declare-fun lt!228756 () Unit!9195)

(assert (=> b!147083 (= e!98058 lt!228756)))

(declare-fun lt!228766 () (_ BitVec 64))

(assert (=> b!147083 (= lt!228766 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!228767 () (_ BitVec 64))

(assert (=> b!147083 (= lt!228767 (bitIndex!0 (size!3005 (buf!3460 thiss!1634)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634)))))

(assert (=> b!147083 (= lt!228756 (arrayBitRangesEqSymmetric!0 (buf!3460 thiss!1634) (buf!3460 (_2!6903 lt!227980)) lt!228766 lt!228767))))

(assert (=> b!147083 (arrayBitRangesEq!0 (buf!3460 (_2!6903 lt!227980)) (buf!3460 thiss!1634) lt!228766 lt!228767)))

(declare-fun b!147084 () Bool)

(declare-fun Unit!9207 () Unit!9195)

(assert (=> b!147084 (= e!98058 Unit!9207)))

(declare-fun b!147085 () Bool)

(declare-fun res!123071 () Bool)

(assert (=> b!147085 (=> (not res!123071) (not e!98057))))

(assert (=> b!147085 (= res!123071 (isPrefixOf!0 (_2!6905 lt!228762) (_2!6903 lt!227980)))))

(declare-fun lt!228749 () (_ BitVec 64))

(declare-fun b!147086 () Bool)

(declare-fun lt!228752 () (_ BitVec 64))

(assert (=> b!147086 (= e!98057 (= (_1!6905 lt!228762) (withMovedBitIndex!0 (_2!6905 lt!228762) (bvsub lt!228752 lt!228749))))))

(assert (=> b!147086 (or (= (bvand lt!228752 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!228749 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!228752 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!228752 lt!228749) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!147086 (= lt!228749 (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!227980))) (currentByte!6362 (_2!6903 lt!227980)) (currentBit!6357 (_2!6903 lt!227980))))))

(assert (=> b!147086 (= lt!228752 (bitIndex!0 (size!3005 (buf!3460 thiss!1634)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634)))))

(assert (= (and d!47518 c!7962) b!147083))

(assert (= (and d!47518 (not c!7962)) b!147084))

(assert (= (and d!47518 res!123072) b!147082))

(assert (= (and b!147082 res!123070) b!147085))

(assert (= (and b!147085 res!123071) b!147086))

(declare-fun m!227327 () Bool)

(assert (=> b!147082 m!227327))

(declare-fun m!227329 () Bool)

(assert (=> b!147086 m!227329))

(assert (=> b!147086 m!226655))

(assert (=> b!147086 m!226661))

(assert (=> b!147083 m!226661))

(declare-fun m!227331 () Bool)

(assert (=> b!147083 m!227331))

(declare-fun m!227333 () Bool)

(assert (=> b!147083 m!227333))

(assert (=> d!47518 m!227237))

(assert (=> d!47518 m!227239))

(declare-fun m!227335 () Bool)

(assert (=> d!47518 m!227335))

(declare-fun m!227337 () Bool)

(assert (=> d!47518 m!227337))

(assert (=> d!47518 m!227303))

(assert (=> d!47518 m!226659))

(declare-fun m!227339 () Bool)

(assert (=> d!47518 m!227339))

(declare-fun m!227341 () Bool)

(assert (=> d!47518 m!227341))

(declare-fun m!227343 () Bool)

(assert (=> d!47518 m!227343))

(declare-fun m!227345 () Bool)

(assert (=> d!47518 m!227345))

(assert (=> d!47518 m!227305))

(declare-fun m!227347 () Bool)

(assert (=> b!147085 m!227347))

(assert (=> b!146752 d!47518))

(declare-fun lt!228769 () tuple3!574)

(declare-fun d!47520 () Bool)

(assert (=> d!47520 (= lt!228769 (readByteArrayLoop!0 (_1!6905 lt!227963) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!47520 (= (readByteArrayLoopPure!0 (_1!6905 lt!227963) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13105 (_2!6915 lt!228769) (_3!356 lt!228769)))))

(declare-fun bs!11631 () Bool)

(assert (= bs!11631 d!47520))

(declare-fun m!227349 () Bool)

(assert (=> bs!11631 m!227349))

(assert (=> b!146753 d!47520))

(declare-fun d!47522 () Bool)

(assert (=> d!47522 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!227961)))) ((_ sign_extend 32) (currentByte!6362 (_2!6903 lt!227980))) ((_ sign_extend 32) (currentBit!6357 (_2!6903 lt!227980))) lt!227964) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!227961)))) ((_ sign_extend 32) (currentByte!6362 (_2!6903 lt!227980))) ((_ sign_extend 32) (currentBit!6357 (_2!6903 lt!227980)))) lt!227964))))

(declare-fun bs!11632 () Bool)

(assert (= bs!11632 d!47522))

(assert (=> bs!11632 m!227215))

(assert (=> b!146753 d!47522))

(declare-fun d!47524 () Bool)

(assert (=> d!47524 (validate_offset_bits!1 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!227961)))) ((_ sign_extend 32) (currentByte!6362 (_2!6903 lt!227980))) ((_ sign_extend 32) (currentBit!6357 (_2!6903 lt!227980))) lt!227964)))

(declare-fun lt!228772 () Unit!9195)

(declare-fun choose!9 (BitStream!5268 array!6640 (_ BitVec 64) BitStream!5268) Unit!9195)

(assert (=> d!47524 (= lt!228772 (choose!9 (_2!6903 lt!227980) (buf!3460 (_2!6903 lt!227961)) lt!227964 (BitStream!5269 (buf!3460 (_2!6903 lt!227961)) (currentByte!6362 (_2!6903 lt!227980)) (currentBit!6357 (_2!6903 lt!227980)))))))

(assert (=> d!47524 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6903 lt!227980) (buf!3460 (_2!6903 lt!227961)) lt!227964) lt!228772)))

(declare-fun bs!11633 () Bool)

(assert (= bs!11633 d!47524))

(assert (=> bs!11633 m!226587))

(declare-fun m!227351 () Bool)

(assert (=> bs!11633 m!227351))

(assert (=> b!146753 d!47524))

(assert (=> b!146753 d!47506))

(check-sat (not d!47483) (not b!147023) (not b!146998) (not b!147022) (not d!47516) (not b!147020) (not d!47489) (not b!147062) (not d!47496) (not b!147045) (not d!47504) (not b!147086) (not b!147044) (not b!147043) (not d!47493) (not d!47457) (not d!47518) (not d!47447) (not d!47473) (not d!47453) (not d!47449) (not b!147074) (not d!47469) (not d!47498) (not b!147059) (not b!147030) (not d!47520) (not d!47459) (not d!47491) (not b!147085) (not d!47500) (not d!47451) (not b!147081) (not b!147034) (not b!147021) (not b!147068) (not d!47502) (not d!47465) (not b!147056) (not d!47485) (not b!147032) (not b!147079) (not d!47512) (not d!47467) (not d!47471) (not d!47479) (not d!47477) (not b!147083) (not b!147078) (not b!147072) (not b!147082) (not b!147057) (not b!147075) (not d!47481) (not d!47522) (not d!47506) (not b!147076) (not d!47524) (not b!147060) (not b!147071) (not d!47475) (not b!147019))
(check-sat)
(get-model)

(declare-fun d!47712 () Bool)

(declare-fun res!123260 () Bool)

(declare-fun e!98227 () Bool)

(assert (=> d!47712 (=> res!123260 e!98227)))

(assert (=> d!47712 (= res!123260 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!47712 (= (arrayRangesEq!321 arr!237 (_2!6906 lt!228590) #b00000000000000000000000000000000 to!404) e!98227)))

(declare-fun b!147311 () Bool)

(declare-fun e!98228 () Bool)

(assert (=> b!147311 (= e!98227 e!98228)))

(declare-fun res!123261 () Bool)

(assert (=> b!147311 (=> (not res!123261) (not e!98228))))

(assert (=> b!147311 (= res!123261 (= (select (arr!3759 arr!237) #b00000000000000000000000000000000) (select (arr!3759 (_2!6906 lt!228590)) #b00000000000000000000000000000000)))))

(declare-fun b!147312 () Bool)

(assert (=> b!147312 (= e!98228 (arrayRangesEq!321 arr!237 (_2!6906 lt!228590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!47712 (not res!123260)) b!147311))

(assert (= (and b!147311 res!123261) b!147312))

(assert (=> b!147311 m!227155))

(declare-fun m!227915 () Bool)

(assert (=> b!147311 m!227915))

(declare-fun m!227917 () Bool)

(assert (=> b!147312 m!227917))

(assert (=> b!147019 d!47712))

(declare-fun d!47714 () Bool)

(declare-fun res!123262 () Bool)

(declare-fun e!98229 () Bool)

(assert (=> d!47714 (=> (not res!123262) (not e!98229))))

(assert (=> d!47714 (= res!123262 (= (size!3005 (buf!3460 (_2!6905 lt!228679))) (size!3005 (buf!3460 (_2!6903 lt!227961)))))))

(assert (=> d!47714 (= (isPrefixOf!0 (_2!6905 lt!228679) (_2!6903 lt!227961)) e!98229)))

(declare-fun b!147313 () Bool)

(declare-fun res!123264 () Bool)

(assert (=> b!147313 (=> (not res!123264) (not e!98229))))

(assert (=> b!147313 (= res!123264 (bvsle (bitIndex!0 (size!3005 (buf!3460 (_2!6905 lt!228679))) (currentByte!6362 (_2!6905 lt!228679)) (currentBit!6357 (_2!6905 lt!228679))) (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!227961))) (currentByte!6362 (_2!6903 lt!227961)) (currentBit!6357 (_2!6903 lt!227961)))))))

(declare-fun b!147314 () Bool)

(declare-fun e!98230 () Bool)

(assert (=> b!147314 (= e!98229 e!98230)))

(declare-fun res!123263 () Bool)

(assert (=> b!147314 (=> res!123263 e!98230)))

(assert (=> b!147314 (= res!123263 (= (size!3005 (buf!3460 (_2!6905 lt!228679))) #b00000000000000000000000000000000))))

(declare-fun b!147315 () Bool)

(assert (=> b!147315 (= e!98230 (arrayBitRangesEq!0 (buf!3460 (_2!6905 lt!228679)) (buf!3460 (_2!6903 lt!227961)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3005 (buf!3460 (_2!6905 lt!228679))) (currentByte!6362 (_2!6905 lt!228679)) (currentBit!6357 (_2!6905 lt!228679)))))))

(assert (= (and d!47714 res!123262) b!147313))

(assert (= (and b!147313 res!123264) b!147314))

(assert (= (and b!147314 (not res!123263)) b!147315))

(declare-fun m!227919 () Bool)

(assert (=> b!147313 m!227919))

(assert (=> b!147313 m!226653))

(assert (=> b!147315 m!227919))

(assert (=> b!147315 m!227919))

(declare-fun m!227921 () Bool)

(assert (=> b!147315 m!227921))

(assert (=> b!147059 d!47714))

(declare-fun b!147326 () Bool)

(declare-fun e!98237 () Bool)

(declare-fun lt!229270 () tuple3!574)

(assert (=> b!147326 (= e!98237 (= (select (arr!3759 (_3!356 lt!229270)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6904 (readBytePure!0 (withMovedByteIndex!0 (_1!6905 lt!227956) #b00000000000000000000000000000001)))))))

(assert (=> b!147326 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!3005 (_3!356 lt!229270))))))

(declare-fun call!1979 () Bool)

(declare-fun lt!229287 () (_ BitVec 32))

(declare-fun bm!1976 () Bool)

(declare-fun lt!229262 () (_ BitVec 32))

(declare-fun lt!229277 () tuple3!574)

(declare-fun lt!229284 () array!6640)

(declare-fun lt!229253 () array!6640)

(declare-fun c!7981 () Bool)

(assert (=> bm!1976 (= call!1979 (arrayRangesEq!321 (ite c!7981 lt!227971 lt!229284) (ite c!7981 (_3!356 lt!229277) lt!229253) (ite c!7981 #b00000000000000000000000000000000 lt!229287) (ite c!7981 (bvadd #b00000000000000000000000000000001 from!447) lt!229262)))))

(declare-fun b!147327 () Bool)

(declare-fun e!98239 () tuple3!574)

(declare-fun lt!229258 () Unit!9195)

(assert (=> b!147327 (= e!98239 (tuple3!575 lt!229258 (_2!6915 lt!229277) (_3!356 lt!229277)))))

(declare-fun lt!229283 () tuple2!13118)

(assert (=> b!147327 (= lt!229283 (readByte!0 (withMovedByteIndex!0 (_1!6905 lt!227956) #b00000000000000000000000000000001)))))

(declare-fun lt!229272 () array!6640)

(assert (=> b!147327 (= lt!229272 (array!6641 (store (arr!3759 lt!227971) (bvadd #b00000000000000000000000000000001 from!447) (_1!6916 lt!229283)) (size!3005 lt!227971)))))

(declare-fun lt!229273 () (_ BitVec 64))

(assert (=> b!147327 (= lt!229273 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!229256 () (_ BitVec 32))

(assert (=> b!147327 (= lt!229256 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!229274 () Unit!9195)

(assert (=> b!147327 (= lt!229274 (validateOffsetBytesFromBitIndexLemma!0 (withMovedByteIndex!0 (_1!6905 lt!227956) #b00000000000000000000000000000001) (_2!6916 lt!229283) lt!229273 lt!229256))))

(assert (=> b!147327 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6916 lt!229283)))) ((_ sign_extend 32) (currentByte!6362 (_2!6916 lt!229283))) ((_ sign_extend 32) (currentBit!6357 (_2!6916 lt!229283))) (bvsub lt!229256 ((_ extract 31 0) (bvsdiv (bvadd lt!229273 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!229268 () Unit!9195)

(assert (=> b!147327 (= lt!229268 lt!229274)))

(assert (=> b!147327 (= lt!229277 (readByteArrayLoop!0 (_2!6916 lt!229283) lt!229272 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(declare-fun call!1980 () (_ BitVec 64))

(assert (=> b!147327 (= call!1980 (bvadd (bitIndex!0 (size!3005 (buf!3460 (withMovedByteIndex!0 (_1!6905 lt!227956) #b00000000000000000000000000000001))) (currentByte!6362 (withMovedByteIndex!0 (_1!6905 lt!227956) #b00000000000000000000000000000001)) (currentBit!6357 (withMovedByteIndex!0 (_1!6905 lt!227956) #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!229280 () Unit!9195)

(declare-fun Unit!9255 () Unit!9195)

(assert (=> b!147327 (= lt!229280 Unit!9255)))

(assert (=> b!147327 (= (bvadd call!1980 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3005 (buf!3460 (_2!6915 lt!229277))) (currentByte!6362 (_2!6915 lt!229277)) (currentBit!6357 (_2!6915 lt!229277))))))

(declare-fun lt!229279 () Unit!9195)

(declare-fun Unit!9256 () Unit!9195)

(assert (=> b!147327 (= lt!229279 Unit!9256)))

(assert (=> b!147327 (= (bvadd (bitIndex!0 (size!3005 (buf!3460 (withMovedByteIndex!0 (_1!6905 lt!227956) #b00000000000000000000000000000001))) (currentByte!6362 (withMovedByteIndex!0 (_1!6905 lt!227956) #b00000000000000000000000000000001)) (currentBit!6357 (withMovedByteIndex!0 (_1!6905 lt!227956) #b00000000000000000000000000000001))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3005 (buf!3460 (_2!6915 lt!229277))) (currentByte!6362 (_2!6915 lt!229277)) (currentBit!6357 (_2!6915 lt!229277))))))

(declare-fun lt!229286 () Unit!9195)

(declare-fun Unit!9257 () Unit!9195)

(assert (=> b!147327 (= lt!229286 Unit!9257)))

(assert (=> b!147327 (and (= (buf!3460 (withMovedByteIndex!0 (_1!6905 lt!227956) #b00000000000000000000000000000001)) (buf!3460 (_2!6915 lt!229277))) (= (size!3005 lt!227971) (size!3005 (_3!356 lt!229277))))))

(declare-fun lt!229263 () Unit!9195)

(declare-fun Unit!9258 () Unit!9195)

(assert (=> b!147327 (= lt!229263 Unit!9258)))

(declare-fun lt!229282 () Unit!9195)

(declare-fun arrayUpdatedAtPrefixLemma!13 (array!6640 (_ BitVec 32) (_ BitVec 8)) Unit!9195)

(assert (=> b!147327 (= lt!229282 (arrayUpdatedAtPrefixLemma!13 lt!227971 (bvadd #b00000000000000000000000000000001 from!447) (_1!6916 lt!229283)))))

(declare-fun call!1981 () Bool)

(assert (=> b!147327 call!1981))

(declare-fun lt!229257 () Unit!9195)

(assert (=> b!147327 (= lt!229257 lt!229282)))

(declare-fun lt!229281 () (_ BitVec 32))

(assert (=> b!147327 (= lt!229281 #b00000000000000000000000000000000)))

(declare-fun lt!229261 () Unit!9195)

(declare-fun arrayRangesEqTransitive!53 (array!6640 array!6640 array!6640 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9195)

(assert (=> b!147327 (= lt!229261 (arrayRangesEqTransitive!53 lt!227971 lt!229272 (_3!356 lt!229277) lt!229281 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!147327 (arrayRangesEq!321 lt!227971 (_3!356 lt!229277) lt!229281 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!229275 () Unit!9195)

(assert (=> b!147327 (= lt!229275 lt!229261)))

(assert (=> b!147327 call!1979))

(declare-fun lt!229252 () Unit!9195)

(declare-fun Unit!9259 () Unit!9195)

(assert (=> b!147327 (= lt!229252 Unit!9259)))

(declare-fun lt!229260 () Unit!9195)

(declare-fun arrayRangesEqImpliesEq!13 (array!6640 array!6640 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9195)

(assert (=> b!147327 (= lt!229260 (arrayRangesEqImpliesEq!13 lt!229272 (_3!356 lt!229277) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!147327 (= (select (store (arr!3759 lt!227971) (bvadd #b00000000000000000000000000000001 from!447) (_1!6916 lt!229283)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3759 (_3!356 lt!229277)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!229264 () Unit!9195)

(assert (=> b!147327 (= lt!229264 lt!229260)))

(declare-fun lt!229271 () Bool)

(assert (=> b!147327 (= lt!229271 (= (select (arr!3759 (_3!356 lt!229277)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6916 lt!229283)))))

(declare-fun Unit!9260 () Unit!9195)

(assert (=> b!147327 (= lt!229258 Unit!9260)))

(assert (=> b!147327 lt!229271))

(declare-fun bm!1977 () Bool)

(assert (=> bm!1977 (= call!1981 (arrayRangesEq!321 lt!227971 (ite c!7981 (array!6641 (store (arr!3759 lt!227971) (bvadd #b00000000000000000000000000000001 from!447) (_1!6916 lt!229283)) (size!3005 lt!227971)) lt!227971) #b00000000000000000000000000000000 (ite c!7981 (bvadd #b00000000000000000000000000000001 from!447) (size!3005 lt!227971))))))

(declare-fun d!47716 () Bool)

(assert (=> d!47716 e!98237))

(declare-fun res!123271 () Bool)

(assert (=> d!47716 (=> res!123271 e!98237)))

(assert (=> d!47716 (= res!123271 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!229259 () Bool)

(declare-fun e!98238 () Bool)

(assert (=> d!47716 (= lt!229259 e!98238)))

(declare-fun res!123273 () Bool)

(assert (=> d!47716 (=> (not res!123273) (not e!98238))))

(declare-fun lt!229265 () (_ BitVec 64))

(declare-fun lt!229269 () (_ BitVec 64))

(assert (=> d!47716 (= res!123273 (= (bvadd lt!229269 lt!229265) (bitIndex!0 (size!3005 (buf!3460 (_2!6915 lt!229270))) (currentByte!6362 (_2!6915 lt!229270)) (currentBit!6357 (_2!6915 lt!229270)))))))

(assert (=> d!47716 (or (not (= (bvand lt!229269 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!229265 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!229269 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!229269 lt!229265) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!229254 () (_ BitVec 64))

(assert (=> d!47716 (= lt!229265 (bvmul lt!229254 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!47716 (or (= lt!229254 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!229254 #b0000000000000000000000000000000000000000000000000000000000001000) lt!229254)))))

(assert (=> d!47716 (= lt!229254 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!47716 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!47716 (= lt!229269 (bitIndex!0 (size!3005 (buf!3460 (withMovedByteIndex!0 (_1!6905 lt!227956) #b00000000000000000000000000000001))) (currentByte!6362 (withMovedByteIndex!0 (_1!6905 lt!227956) #b00000000000000000000000000000001)) (currentBit!6357 (withMovedByteIndex!0 (_1!6905 lt!227956) #b00000000000000000000000000000001))))))

(assert (=> d!47716 (= lt!229270 e!98239)))

(assert (=> d!47716 (= c!7981 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!47716 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3005 lt!227971)))))

(assert (=> d!47716 (= (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!6905 lt!227956) #b00000000000000000000000000000001) lt!227971 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!229270)))

(declare-fun bm!1978 () Bool)

(assert (=> bm!1978 (= call!1980 (bitIndex!0 (ite c!7981 (size!3005 (buf!3460 (_2!6916 lt!229283))) (size!3005 (buf!3460 (withMovedByteIndex!0 (_1!6905 lt!227956) #b00000000000000000000000000000001)))) (ite c!7981 (currentByte!6362 (_2!6916 lt!229283)) (currentByte!6362 (withMovedByteIndex!0 (_1!6905 lt!227956) #b00000000000000000000000000000001))) (ite c!7981 (currentBit!6357 (_2!6916 lt!229283)) (currentBit!6357 (withMovedByteIndex!0 (_1!6905 lt!227956) #b00000000000000000000000000000001)))))))

(declare-fun b!147328 () Bool)

(assert (=> b!147328 (= e!98238 (arrayRangesEq!321 lt!227971 (_3!356 lt!229270) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun b!147329 () Bool)

(declare-fun res!123272 () Bool)

(assert (=> b!147329 (=> (not res!123272) (not e!98238))))

(assert (=> b!147329 (= res!123272 (and (= (buf!3460 (withMovedByteIndex!0 (_1!6905 lt!227956) #b00000000000000000000000000000001)) (buf!3460 (_2!6915 lt!229270))) (= (size!3005 lt!227971) (size!3005 (_3!356 lt!229270)))))))

(declare-fun b!147330 () Bool)

(declare-fun lt!229266 () Unit!9195)

(assert (=> b!147330 (= e!98239 (tuple3!575 lt!229266 (withMovedByteIndex!0 (_1!6905 lt!227956) #b00000000000000000000000000000001) lt!227971))))

(assert (=> b!147330 (= call!1980 call!1980)))

(declare-fun lt!229285 () Unit!9195)

(declare-fun Unit!9261 () Unit!9195)

(assert (=> b!147330 (= lt!229285 Unit!9261)))

(declare-fun lt!229278 () Unit!9195)

(declare-fun arrayRangesEqReflexiveLemma!13 (array!6640) Unit!9195)

(assert (=> b!147330 (= lt!229278 (arrayRangesEqReflexiveLemma!13 lt!227971))))

(assert (=> b!147330 call!1981))

(declare-fun lt!229255 () Unit!9195)

(assert (=> b!147330 (= lt!229255 lt!229278)))

(assert (=> b!147330 (= lt!229284 lt!227971)))

(assert (=> b!147330 (= lt!229253 lt!227971)))

(declare-fun lt!229267 () (_ BitVec 32))

(assert (=> b!147330 (= lt!229267 #b00000000000000000000000000000000)))

(declare-fun lt!229276 () (_ BitVec 32))

(assert (=> b!147330 (= lt!229276 (size!3005 lt!227971))))

(assert (=> b!147330 (= lt!229287 #b00000000000000000000000000000000)))

(assert (=> b!147330 (= lt!229262 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun arrayRangesEqSlicedLemma!13 (array!6640 array!6640 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9195)

(assert (=> b!147330 (= lt!229266 (arrayRangesEqSlicedLemma!13 lt!229284 lt!229253 lt!229267 lt!229276 lt!229287 lt!229262))))

(assert (=> b!147330 call!1979))

(assert (= (and d!47716 c!7981) b!147327))

(assert (= (and d!47716 (not c!7981)) b!147330))

(assert (= (or b!147327 b!147330) bm!1976))

(assert (= (or b!147327 b!147330) bm!1977))

(assert (= (or b!147327 b!147330) bm!1978))

(assert (= (and d!47716 res!123273) b!147329))

(assert (= (and b!147329 res!123272) b!147328))

(assert (= (and d!47716 (not res!123271)) b!147326))

(declare-fun m!227923 () Bool)

(assert (=> b!147330 m!227923))

(declare-fun m!227925 () Bool)

(assert (=> b!147330 m!227925))

(declare-fun m!227927 () Bool)

(assert (=> bm!1977 m!227927))

(declare-fun m!227929 () Bool)

(assert (=> bm!1977 m!227929))

(declare-fun m!227931 () Bool)

(assert (=> b!147326 m!227931))

(assert (=> b!147326 m!226645))

(declare-fun m!227933 () Bool)

(assert (=> b!147326 m!227933))

(declare-fun m!227935 () Bool)

(assert (=> d!47716 m!227935))

(declare-fun m!227937 () Bool)

(assert (=> d!47716 m!227937))

(declare-fun m!227939 () Bool)

(assert (=> bm!1978 m!227939))

(declare-fun m!227941 () Bool)

(assert (=> b!147328 m!227941))

(assert (=> b!147327 m!227927))

(declare-fun m!227943 () Bool)

(assert (=> b!147327 m!227943))

(declare-fun m!227945 () Bool)

(assert (=> b!147327 m!227945))

(declare-fun m!227947 () Bool)

(assert (=> b!147327 m!227947))

(declare-fun m!227949 () Bool)

(assert (=> b!147327 m!227949))

(declare-fun m!227951 () Bool)

(assert (=> b!147327 m!227951))

(declare-fun m!227953 () Bool)

(assert (=> b!147327 m!227953))

(declare-fun m!227955 () Bool)

(assert (=> b!147327 m!227955))

(declare-fun m!227957 () Bool)

(assert (=> b!147327 m!227957))

(assert (=> b!147327 m!226645))

(declare-fun m!227959 () Bool)

(assert (=> b!147327 m!227959))

(assert (=> b!147327 m!227937))

(declare-fun m!227961 () Bool)

(assert (=> b!147327 m!227961))

(assert (=> b!147327 m!226645))

(declare-fun m!227963 () Bool)

(assert (=> b!147327 m!227963))

(declare-fun m!227965 () Bool)

(assert (=> bm!1976 m!227965))

(assert (=> d!47465 d!47716))

(assert (=> b!147057 d!47453))

(declare-fun d!47718 () Bool)

(assert (=> d!47718 (arrayBitRangesEq!0 (buf!3460 (_2!6903 lt!227961)) (buf!3460 thiss!1634) lt!228683 lt!228684)))

(declare-fun lt!229290 () Unit!9195)

(declare-fun choose!8 (array!6640 array!6640 (_ BitVec 64) (_ BitVec 64)) Unit!9195)

(assert (=> d!47718 (= lt!229290 (choose!8 (buf!3460 thiss!1634) (buf!3460 (_2!6903 lt!227961)) lt!228683 lt!228684))))

(assert (=> d!47718 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!228683) (bvsle lt!228683 lt!228684))))

(assert (=> d!47718 (= (arrayBitRangesEqSymmetric!0 (buf!3460 thiss!1634) (buf!3460 (_2!6903 lt!227961)) lt!228683 lt!228684) lt!229290)))

(declare-fun bs!11666 () Bool)

(assert (= bs!11666 d!47718))

(assert (=> bs!11666 m!227235))

(declare-fun m!227967 () Bool)

(assert (=> bs!11666 m!227967))

(assert (=> b!147057 d!47718))

(declare-fun b!147345 () Bool)

(declare-fun e!98253 () Bool)

(declare-fun call!1984 () Bool)

(assert (=> b!147345 (= e!98253 call!1984)))

(declare-fun b!147346 () Bool)

(declare-fun e!98254 () Bool)

(declare-fun e!98256 () Bool)

(assert (=> b!147346 (= e!98254 e!98256)))

(declare-fun lt!229298 () (_ BitVec 32))

(declare-datatypes ((tuple4!140 0))(
  ( (tuple4!141 (_1!6919 (_ BitVec 32)) (_2!6919 (_ BitVec 32)) (_3!358 (_ BitVec 32)) (_4!70 (_ BitVec 32))) )
))
(declare-fun lt!229299 () tuple4!140)

(declare-fun res!123288 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!147346 (= res!123288 (byteRangesEq!0 (select (arr!3759 (buf!3460 (_2!6903 lt!227961))) (_3!358 lt!229299)) (select (arr!3759 (buf!3460 thiss!1634)) (_3!358 lt!229299)) lt!229298 #b00000000000000000000000000001000))))

(assert (=> b!147346 (=> (not res!123288) (not e!98256))))

(declare-fun b!147347 () Bool)

(assert (=> b!147347 (= e!98254 call!1984)))

(declare-fun b!147348 () Bool)

(declare-fun e!98252 () Bool)

(declare-fun e!98255 () Bool)

(assert (=> b!147348 (= e!98252 e!98255)))

(declare-fun res!123285 () Bool)

(assert (=> b!147348 (=> (not res!123285) (not e!98255))))

(declare-fun e!98257 () Bool)

(assert (=> b!147348 (= res!123285 e!98257)))

(declare-fun res!123286 () Bool)

(assert (=> b!147348 (=> res!123286 e!98257)))

(assert (=> b!147348 (= res!123286 (bvsge (_1!6919 lt!229299) (_2!6919 lt!229299)))))

(declare-fun lt!229297 () (_ BitVec 32))

(assert (=> b!147348 (= lt!229297 ((_ extract 31 0) (bvsrem lt!228684 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!147348 (= lt!229298 ((_ extract 31 0) (bvsrem lt!228683 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!140)

(assert (=> b!147348 (= lt!229299 (arrayBitIndices!0 lt!228683 lt!228684))))

(declare-fun b!147349 () Bool)

(assert (=> b!147349 (= e!98257 (arrayRangesEq!321 (buf!3460 (_2!6903 lt!227961)) (buf!3460 thiss!1634) (_1!6919 lt!229299) (_2!6919 lt!229299)))))

(declare-fun b!147350 () Bool)

(assert (=> b!147350 (= e!98255 e!98254)))

(declare-fun c!7984 () Bool)

(assert (=> b!147350 (= c!7984 (= (_3!358 lt!229299) (_4!70 lt!229299)))))

(declare-fun b!147351 () Bool)

(declare-fun res!123284 () Bool)

(assert (=> b!147351 (= res!123284 (= lt!229297 #b00000000000000000000000000000000))))

(assert (=> b!147351 (=> res!123284 e!98253)))

(assert (=> b!147351 (= e!98256 e!98253)))

(declare-fun bm!1981 () Bool)

(assert (=> bm!1981 (= call!1984 (byteRangesEq!0 (ite c!7984 (select (arr!3759 (buf!3460 (_2!6903 lt!227961))) (_3!358 lt!229299)) (select (arr!3759 (buf!3460 (_2!6903 lt!227961))) (_4!70 lt!229299))) (ite c!7984 (select (arr!3759 (buf!3460 thiss!1634)) (_3!358 lt!229299)) (select (arr!3759 (buf!3460 thiss!1634)) (_4!70 lt!229299))) (ite c!7984 lt!229298 #b00000000000000000000000000000000) lt!229297))))

(declare-fun d!47720 () Bool)

(declare-fun res!123287 () Bool)

(assert (=> d!47720 (=> res!123287 e!98252)))

(assert (=> d!47720 (= res!123287 (bvsge lt!228683 lt!228684))))

(assert (=> d!47720 (= (arrayBitRangesEq!0 (buf!3460 (_2!6903 lt!227961)) (buf!3460 thiss!1634) lt!228683 lt!228684) e!98252)))

(assert (= (and d!47720 (not res!123287)) b!147348))

(assert (= (and b!147348 (not res!123286)) b!147349))

(assert (= (and b!147348 res!123285) b!147350))

(assert (= (and b!147350 c!7984) b!147347))

(assert (= (and b!147350 (not c!7984)) b!147346))

(assert (= (and b!147346 res!123288) b!147351))

(assert (= (and b!147351 (not res!123284)) b!147345))

(assert (= (or b!147347 b!147345) bm!1981))

(declare-fun m!227969 () Bool)

(assert (=> b!147346 m!227969))

(declare-fun m!227971 () Bool)

(assert (=> b!147346 m!227971))

(assert (=> b!147346 m!227969))

(assert (=> b!147346 m!227971))

(declare-fun m!227973 () Bool)

(assert (=> b!147346 m!227973))

(declare-fun m!227975 () Bool)

(assert (=> b!147348 m!227975))

(declare-fun m!227977 () Bool)

(assert (=> b!147349 m!227977))

(declare-fun m!227979 () Bool)

(assert (=> bm!1981 m!227979))

(declare-fun m!227981 () Bool)

(assert (=> bm!1981 m!227981))

(assert (=> bm!1981 m!227969))

(declare-fun m!227983 () Bool)

(assert (=> bm!1981 m!227983))

(assert (=> bm!1981 m!227971))

(assert (=> b!147057 d!47720))

(assert (=> d!47500 d!47479))

(declare-fun d!47722 () Bool)

(assert (=> d!47722 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!227961)))) ((_ sign_extend 32) (currentByte!6362 (_2!6903 lt!227980))) ((_ sign_extend 32) (currentBit!6357 (_2!6903 lt!227980))) lt!227969)))

(assert (=> d!47722 true))

(declare-fun _$5!74 () Unit!9195)

(assert (=> d!47722 (= (choose!26 (_2!6903 lt!227980) (buf!3460 (_2!6903 lt!227961)) lt!227969 (BitStream!5269 (buf!3460 (_2!6903 lt!227961)) (currentByte!6362 (_2!6903 lt!227980)) (currentBit!6357 (_2!6903 lt!227980)))) _$5!74)))

(declare-fun bs!11667 () Bool)

(assert (= bs!11667 d!47722))

(assert (=> bs!11667 m!226631))

(assert (=> d!47500 d!47722))

(assert (=> d!47469 d!47477))

(declare-fun d!47724 () Bool)

(assert (=> d!47724 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!227961)))) ((_ sign_extend 32) (currentByte!6362 thiss!1634)) ((_ sign_extend 32) (currentBit!6357 thiss!1634)) (bvsub to!404 from!447))))

(assert (=> d!47724 true))

(declare-fun _$5!75 () Unit!9195)

(assert (=> d!47724 (= (choose!26 thiss!1634 (buf!3460 (_2!6903 lt!227961)) (bvsub to!404 from!447) (BitStream!5269 (buf!3460 (_2!6903 lt!227961)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634))) _$5!75)))

(declare-fun bs!11668 () Bool)

(assert (= bs!11668 d!47724))

(assert (=> bs!11668 m!226629))

(assert (=> d!47469 d!47724))

(declare-fun d!47726 () Bool)

(declare-fun e!98265 () Bool)

(assert (=> d!47726 e!98265))

(declare-fun res!123295 () Bool)

(assert (=> d!47726 (=> (not res!123295) (not e!98265))))

(declare-fun _$37!47 () tuple2!13098)

(assert (=> d!47726 (= res!123295 (= (size!3005 (buf!3460 thiss!1634)) (size!3005 (buf!3460 (_2!6903 _$37!47)))))))

(declare-fun e!98264 () Bool)

(assert (=> d!47726 (and (inv!12 (_2!6903 _$37!47)) e!98264)))

(assert (=> d!47726 (= (choose!6 thiss!1634 (select (arr!3759 arr!237) from!447)) _$37!47)))

(declare-fun lt!229305 () tuple2!13102)

(declare-fun lt!229304 () tuple2!13100)

(declare-fun b!147363 () Bool)

(assert (=> b!147363 (= e!98265 (and (= (_2!6904 lt!229304) (select (arr!3759 arr!237) from!447)) (= (_1!6904 lt!229304) (_2!6905 lt!229305))))))

(assert (=> b!147363 (= lt!229304 (readBytePure!0 (_1!6905 lt!229305)))))

(assert (=> b!147363 (= lt!229305 (reader!0 thiss!1634 (_2!6903 _$37!47)))))

(declare-fun b!147361 () Bool)

(declare-fun res!123297 () Bool)

(assert (=> b!147361 (=> (not res!123297) (not e!98265))))

(assert (=> b!147361 (= res!123297 (= (bitIndex!0 (size!3005 (buf!3460 (_2!6903 _$37!47))) (currentByte!6362 (_2!6903 _$37!47)) (currentBit!6357 (_2!6903 _$37!47))) (bvadd (bitIndex!0 (size!3005 (buf!3460 thiss!1634)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!147362 () Bool)

(declare-fun res!123296 () Bool)

(assert (=> b!147362 (=> (not res!123296) (not e!98265))))

(assert (=> b!147362 (= res!123296 (isPrefixOf!0 thiss!1634 (_2!6903 _$37!47)))))

(declare-fun b!147360 () Bool)

(assert (=> b!147360 (= e!98264 (array_inv!2794 (buf!3460 (_2!6903 _$37!47))))))

(assert (= d!47726 b!147360))

(assert (= (and d!47726 res!123295) b!147361))

(assert (= (and b!147361 res!123297) b!147362))

(assert (= (and b!147362 res!123296) b!147363))

(declare-fun m!227985 () Bool)

(assert (=> b!147360 m!227985))

(declare-fun m!227987 () Bool)

(assert (=> b!147361 m!227987))

(assert (=> b!147361 m!226661))

(declare-fun m!227989 () Bool)

(assert (=> b!147363 m!227989))

(declare-fun m!227991 () Bool)

(assert (=> b!147363 m!227991))

(declare-fun m!227993 () Bool)

(assert (=> b!147362 m!227993))

(declare-fun m!227995 () Bool)

(assert (=> d!47726 m!227995))

(assert (=> d!47481 d!47726))

(declare-fun d!47728 () Bool)

(assert (=> d!47728 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3005 (buf!3460 thiss!1634))) ((_ sign_extend 32) (currentByte!6362 thiss!1634)) ((_ sign_extend 32) (currentBit!6357 thiss!1634))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3005 (buf!3460 thiss!1634))) ((_ sign_extend 32) (currentByte!6362 thiss!1634)) ((_ sign_extend 32) (currentBit!6357 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!11669 () Bool)

(assert (= bs!11669 d!47728))

(assert (=> bs!11669 m!227169))

(assert (=> d!47481 d!47728))

(declare-fun d!47730 () Bool)

(declare-fun lt!229323 () (_ BitVec 8))

(declare-fun lt!229326 () (_ BitVec 8))

(assert (=> d!47730 (= lt!229323 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3759 (buf!3460 (_1!6905 lt!227956))) (currentByte!6362 (_1!6905 lt!227956)))) ((_ sign_extend 24) lt!229326))))))

(assert (=> d!47730 (= lt!229326 ((_ extract 7 0) (currentBit!6357 (_1!6905 lt!227956))))))

(declare-fun e!98271 () Bool)

(assert (=> d!47730 e!98271))

(declare-fun res!123303 () Bool)

(assert (=> d!47730 (=> (not res!123303) (not e!98271))))

(assert (=> d!47730 (= res!123303 (validate_offset_bits!1 ((_ sign_extend 32) (size!3005 (buf!3460 (_1!6905 lt!227956)))) ((_ sign_extend 32) (currentByte!6362 (_1!6905 lt!227956))) ((_ sign_extend 32) (currentBit!6357 (_1!6905 lt!227956))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!13122 0))(
  ( (tuple2!13123 (_1!6920 Unit!9195) (_2!6920 (_ BitVec 8))) )
))
(declare-fun Unit!9262 () Unit!9195)

(declare-fun Unit!9263 () Unit!9195)

(assert (=> d!47730 (= (readByte!0 (_1!6905 lt!227956)) (tuple2!13119 (_2!6920 (ite (bvsgt ((_ sign_extend 24) lt!229326) #b00000000000000000000000000000000) (tuple2!13123 Unit!9262 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!229323) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3759 (buf!3460 (_1!6905 lt!227956))) (bvadd (currentByte!6362 (_1!6905 lt!227956)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!229326)))))))) (tuple2!13123 Unit!9263 lt!229323))) (BitStream!5269 (buf!3460 (_1!6905 lt!227956)) (bvadd (currentByte!6362 (_1!6905 lt!227956)) #b00000000000000000000000000000001) (currentBit!6357 (_1!6905 lt!227956)))))))

(declare-fun b!147368 () Bool)

(declare-fun e!98272 () Bool)

(assert (=> b!147368 (= e!98271 e!98272)))

(declare-fun res!123304 () Bool)

(assert (=> b!147368 (=> (not res!123304) (not e!98272))))

(declare-fun lt!229322 () tuple2!13118)

(assert (=> b!147368 (= res!123304 (= (buf!3460 (_2!6916 lt!229322)) (buf!3460 (_1!6905 lt!227956))))))

(declare-fun lt!229325 () (_ BitVec 8))

(declare-fun lt!229320 () (_ BitVec 8))

(declare-fun Unit!9264 () Unit!9195)

(declare-fun Unit!9265 () Unit!9195)

(assert (=> b!147368 (= lt!229322 (tuple2!13119 (_2!6920 (ite (bvsgt ((_ sign_extend 24) lt!229320) #b00000000000000000000000000000000) (tuple2!13123 Unit!9264 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!229325) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3759 (buf!3460 (_1!6905 lt!227956))) (bvadd (currentByte!6362 (_1!6905 lt!227956)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!229320)))))))) (tuple2!13123 Unit!9265 lt!229325))) (BitStream!5269 (buf!3460 (_1!6905 lt!227956)) (bvadd (currentByte!6362 (_1!6905 lt!227956)) #b00000000000000000000000000000001) (currentBit!6357 (_1!6905 lt!227956)))))))

(assert (=> b!147368 (= lt!229325 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3759 (buf!3460 (_1!6905 lt!227956))) (currentByte!6362 (_1!6905 lt!227956)))) ((_ sign_extend 24) lt!229320))))))

(assert (=> b!147368 (= lt!229320 ((_ extract 7 0) (currentBit!6357 (_1!6905 lt!227956))))))

(declare-fun b!147369 () Bool)

(declare-fun lt!229324 () (_ BitVec 64))

(declare-fun lt!229321 () (_ BitVec 64))

(assert (=> b!147369 (= e!98272 (= (bitIndex!0 (size!3005 (buf!3460 (_2!6916 lt!229322))) (currentByte!6362 (_2!6916 lt!229322)) (currentBit!6357 (_2!6916 lt!229322))) (bvadd lt!229321 lt!229324)))))

(assert (=> b!147369 (or (not (= (bvand lt!229321 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!229324 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!229321 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!229321 lt!229324) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!147369 (= lt!229324 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!147369 (= lt!229321 (bitIndex!0 (size!3005 (buf!3460 (_1!6905 lt!227956))) (currentByte!6362 (_1!6905 lt!227956)) (currentBit!6357 (_1!6905 lt!227956))))))

(assert (= (and d!47730 res!123303) b!147368))

(assert (= (and b!147368 res!123304) b!147369))

(declare-fun m!227997 () Bool)

(assert (=> d!47730 m!227997))

(declare-fun m!227999 () Bool)

(assert (=> d!47730 m!227999))

(declare-fun m!228001 () Bool)

(assert (=> d!47730 m!228001))

(assert (=> b!147368 m!228001))

(assert (=> b!147368 m!227997))

(declare-fun m!228003 () Bool)

(assert (=> b!147369 m!228003))

(declare-fun m!228005 () Bool)

(assert (=> b!147369 m!228005))

(assert (=> d!47496 d!47730))

(declare-fun d!47732 () Bool)

(declare-fun e!98275 () Bool)

(assert (=> d!47732 e!98275))

(declare-fun res!123307 () Bool)

(assert (=> d!47732 (=> (not res!123307) (not e!98275))))

(declare-fun moveByteIndexPrecond!0 (BitStream!5268 (_ BitVec 32)) Bool)

(assert (=> d!47732 (= res!123307 (moveByteIndexPrecond!0 (_1!6905 lt!227956) #b00000000000000000000000000000001))))

(declare-fun Unit!9266 () Unit!9195)

(assert (=> d!47732 (= (moveByteIndex!0 (_1!6905 lt!227956) #b00000000000000000000000000000001) (tuple2!13099 Unit!9266 (BitStream!5269 (buf!3460 (_1!6905 lt!227956)) (bvadd (currentByte!6362 (_1!6905 lt!227956)) #b00000000000000000000000000000001) (currentBit!6357 (_1!6905 lt!227956)))))))

(declare-fun b!147372 () Bool)

(assert (=> b!147372 (= e!98275 (and (or (not (= (bvand (currentByte!6362 (_1!6905 lt!227956)) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6362 (_1!6905 lt!227956)) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6362 (_1!6905 lt!227956)) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6362 (_1!6905 lt!227956)) #b00000000000000000000000000000001) (bvadd (currentByte!6362 (_1!6905 lt!227956)) #b00000000000000000000000000000001))))))

(assert (= (and d!47732 res!123307) b!147372))

(declare-fun m!228007 () Bool)

(assert (=> d!47732 m!228007))

(assert (=> d!47491 d!47732))

(declare-fun d!47734 () Bool)

(declare-fun lt!229327 () tuple2!13118)

(assert (=> d!47734 (= lt!229327 (readByte!0 (_1!6905 lt!228622)))))

(assert (=> d!47734 (= (readBytePure!0 (_1!6905 lt!228622)) (tuple2!13101 (_2!6916 lt!229327) (_1!6916 lt!229327)))))

(declare-fun bs!11670 () Bool)

(assert (= bs!11670 d!47734))

(declare-fun m!228009 () Bool)

(assert (=> bs!11670 m!228009))

(assert (=> b!147045 d!47734))

(declare-fun d!47736 () Bool)

(declare-fun e!98276 () Bool)

(assert (=> d!47736 e!98276))

(declare-fun res!123310 () Bool)

(assert (=> d!47736 (=> (not res!123310) (not e!98276))))

(declare-fun lt!229341 () tuple2!13102)

(assert (=> d!47736 (= res!123310 (isPrefixOf!0 (_1!6905 lt!229341) (_2!6905 lt!229341)))))

(declare-fun lt!229347 () BitStream!5268)

(assert (=> d!47736 (= lt!229341 (tuple2!13103 lt!229347 (_2!6903 lt!228624)))))

(declare-fun lt!229334 () Unit!9195)

(declare-fun lt!229330 () Unit!9195)

(assert (=> d!47736 (= lt!229334 lt!229330)))

(assert (=> d!47736 (isPrefixOf!0 lt!229347 (_2!6903 lt!228624))))

(assert (=> d!47736 (= lt!229330 (lemmaIsPrefixTransitive!0 lt!229347 (_2!6903 lt!228624) (_2!6903 lt!228624)))))

(declare-fun lt!229342 () Unit!9195)

(declare-fun lt!229339 () Unit!9195)

(assert (=> d!47736 (= lt!229342 lt!229339)))

(assert (=> d!47736 (isPrefixOf!0 lt!229347 (_2!6903 lt!228624))))

(assert (=> d!47736 (= lt!229339 (lemmaIsPrefixTransitive!0 lt!229347 thiss!1634 (_2!6903 lt!228624)))))

(declare-fun lt!229343 () Unit!9195)

(declare-fun e!98277 () Unit!9195)

(assert (=> d!47736 (= lt!229343 e!98277)))

(declare-fun c!7985 () Bool)

(assert (=> d!47736 (= c!7985 (not (= (size!3005 (buf!3460 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!229329 () Unit!9195)

(declare-fun lt!229337 () Unit!9195)

(assert (=> d!47736 (= lt!229329 lt!229337)))

(assert (=> d!47736 (isPrefixOf!0 (_2!6903 lt!228624) (_2!6903 lt!228624))))

(assert (=> d!47736 (= lt!229337 (lemmaIsPrefixRefl!0 (_2!6903 lt!228624)))))

(declare-fun lt!229336 () Unit!9195)

(declare-fun lt!229333 () Unit!9195)

(assert (=> d!47736 (= lt!229336 lt!229333)))

(assert (=> d!47736 (= lt!229333 (lemmaIsPrefixRefl!0 (_2!6903 lt!228624)))))

(declare-fun lt!229344 () Unit!9195)

(declare-fun lt!229338 () Unit!9195)

(assert (=> d!47736 (= lt!229344 lt!229338)))

(assert (=> d!47736 (isPrefixOf!0 lt!229347 lt!229347)))

(assert (=> d!47736 (= lt!229338 (lemmaIsPrefixRefl!0 lt!229347))))

(declare-fun lt!229332 () Unit!9195)

(declare-fun lt!229340 () Unit!9195)

(assert (=> d!47736 (= lt!229332 lt!229340)))

(assert (=> d!47736 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!47736 (= lt!229340 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!47736 (= lt!229347 (BitStream!5269 (buf!3460 (_2!6903 lt!228624)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634)))))

(assert (=> d!47736 (isPrefixOf!0 thiss!1634 (_2!6903 lt!228624))))

(assert (=> d!47736 (= (reader!0 thiss!1634 (_2!6903 lt!228624)) lt!229341)))

(declare-fun b!147373 () Bool)

(declare-fun res!123308 () Bool)

(assert (=> b!147373 (=> (not res!123308) (not e!98276))))

(assert (=> b!147373 (= res!123308 (isPrefixOf!0 (_1!6905 lt!229341) thiss!1634))))

(declare-fun b!147374 () Bool)

(declare-fun lt!229335 () Unit!9195)

(assert (=> b!147374 (= e!98277 lt!229335)))

(declare-fun lt!229345 () (_ BitVec 64))

(assert (=> b!147374 (= lt!229345 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!229346 () (_ BitVec 64))

(assert (=> b!147374 (= lt!229346 (bitIndex!0 (size!3005 (buf!3460 thiss!1634)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634)))))

(assert (=> b!147374 (= lt!229335 (arrayBitRangesEqSymmetric!0 (buf!3460 thiss!1634) (buf!3460 (_2!6903 lt!228624)) lt!229345 lt!229346))))

(assert (=> b!147374 (arrayBitRangesEq!0 (buf!3460 (_2!6903 lt!228624)) (buf!3460 thiss!1634) lt!229345 lt!229346)))

(declare-fun b!147375 () Bool)

(declare-fun Unit!9267 () Unit!9195)

(assert (=> b!147375 (= e!98277 Unit!9267)))

(declare-fun b!147376 () Bool)

(declare-fun res!123309 () Bool)

(assert (=> b!147376 (=> (not res!123309) (not e!98276))))

(assert (=> b!147376 (= res!123309 (isPrefixOf!0 (_2!6905 lt!229341) (_2!6903 lt!228624)))))

(declare-fun b!147377 () Bool)

(declare-fun lt!229328 () (_ BitVec 64))

(declare-fun lt!229331 () (_ BitVec 64))

(assert (=> b!147377 (= e!98276 (= (_1!6905 lt!229341) (withMovedBitIndex!0 (_2!6905 lt!229341) (bvsub lt!229331 lt!229328))))))

(assert (=> b!147377 (or (= (bvand lt!229331 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!229328 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!229331 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!229331 lt!229328) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!147377 (= lt!229328 (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!228624))) (currentByte!6362 (_2!6903 lt!228624)) (currentBit!6357 (_2!6903 lt!228624))))))

(assert (=> b!147377 (= lt!229331 (bitIndex!0 (size!3005 (buf!3460 thiss!1634)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634)))))

(assert (= (and d!47736 c!7985) b!147374))

(assert (= (and d!47736 (not c!7985)) b!147375))

(assert (= (and d!47736 res!123310) b!147373))

(assert (= (and b!147373 res!123308) b!147376))

(assert (= (and b!147376 res!123309) b!147377))

(declare-fun m!228011 () Bool)

(assert (=> b!147373 m!228011))

(declare-fun m!228013 () Bool)

(assert (=> b!147377 m!228013))

(assert (=> b!147377 m!227221))

(assert (=> b!147377 m!226661))

(assert (=> b!147374 m!226661))

(declare-fun m!228015 () Bool)

(assert (=> b!147374 m!228015))

(declare-fun m!228017 () Bool)

(assert (=> b!147374 m!228017))

(assert (=> d!47736 m!227237))

(assert (=> d!47736 m!227239))

(declare-fun m!228019 () Bool)

(assert (=> d!47736 m!228019))

(declare-fun m!228021 () Bool)

(assert (=> d!47736 m!228021))

(declare-fun m!228023 () Bool)

(assert (=> d!47736 m!228023))

(assert (=> d!47736 m!227223))

(declare-fun m!228025 () Bool)

(assert (=> d!47736 m!228025))

(declare-fun m!228027 () Bool)

(assert (=> d!47736 m!228027))

(declare-fun m!228029 () Bool)

(assert (=> d!47736 m!228029))

(declare-fun m!228031 () Bool)

(assert (=> d!47736 m!228031))

(declare-fun m!228033 () Bool)

(assert (=> d!47736 m!228033))

(declare-fun m!228035 () Bool)

(assert (=> b!147376 m!228035))

(assert (=> b!147045 d!47736))

(declare-fun d!47738 () Bool)

(declare-fun e!98280 () Bool)

(assert (=> d!47738 e!98280))

(declare-fun res!123313 () Bool)

(assert (=> d!47738 (=> (not res!123313) (not e!98280))))

(declare-fun lt!229352 () BitStream!5268)

(declare-fun lt!229353 () (_ BitVec 64))

(assert (=> d!47738 (= res!123313 (= (bvadd lt!229353 (bvsub lt!228752 lt!228749)) (bitIndex!0 (size!3005 (buf!3460 lt!229352)) (currentByte!6362 lt!229352) (currentBit!6357 lt!229352))))))

(assert (=> d!47738 (or (not (= (bvand lt!229353 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!228752 lt!228749) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!229353 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!229353 (bvsub lt!228752 lt!228749)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!47738 (= lt!229353 (bitIndex!0 (size!3005 (buf!3460 (_2!6905 lt!228762))) (currentByte!6362 (_2!6905 lt!228762)) (currentBit!6357 (_2!6905 lt!228762))))))

(declare-fun moveBitIndex!0 (BitStream!5268 (_ BitVec 64)) tuple2!13098)

(assert (=> d!47738 (= lt!229352 (_2!6903 (moveBitIndex!0 (_2!6905 lt!228762) (bvsub lt!228752 lt!228749))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!5268 (_ BitVec 64)) Bool)

(assert (=> d!47738 (moveBitIndexPrecond!0 (_2!6905 lt!228762) (bvsub lt!228752 lt!228749))))

(assert (=> d!47738 (= (withMovedBitIndex!0 (_2!6905 lt!228762) (bvsub lt!228752 lt!228749)) lt!229352)))

(declare-fun b!147380 () Bool)

(assert (=> b!147380 (= e!98280 (= (size!3005 (buf!3460 (_2!6905 lt!228762))) (size!3005 (buf!3460 lt!229352))))))

(assert (= (and d!47738 res!123313) b!147380))

(declare-fun m!228037 () Bool)

(assert (=> d!47738 m!228037))

(declare-fun m!228039 () Bool)

(assert (=> d!47738 m!228039))

(declare-fun m!228041 () Bool)

(assert (=> d!47738 m!228041))

(declare-fun m!228043 () Bool)

(assert (=> d!47738 m!228043))

(assert (=> b!147086 d!47738))

(assert (=> b!147086 d!47451))

(assert (=> b!147086 d!47453))

(declare-fun d!47740 () Bool)

(declare-fun e!98281 () Bool)

(assert (=> d!47740 e!98281))

(declare-fun res!123314 () Bool)

(assert (=> d!47740 (=> (not res!123314) (not e!98281))))

(declare-fun lt!229355 () (_ BitVec 64))

(declare-fun lt!229356 () (_ BitVec 64))

(declare-fun lt!229358 () (_ BitVec 64))

(assert (=> d!47740 (= res!123314 (= lt!229356 (bvsub lt!229355 lt!229358)))))

(assert (=> d!47740 (or (= (bvand lt!229355 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!229358 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!229355 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!229355 lt!229358) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!47740 (= lt!229358 (remainingBits!0 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!228624)))) ((_ sign_extend 32) (currentByte!6362 (_2!6903 lt!228624))) ((_ sign_extend 32) (currentBit!6357 (_2!6903 lt!228624)))))))

(declare-fun lt!229354 () (_ BitVec 64))

(declare-fun lt!229357 () (_ BitVec 64))

(assert (=> d!47740 (= lt!229355 (bvmul lt!229354 lt!229357))))

(assert (=> d!47740 (or (= lt!229354 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!229357 (bvsdiv (bvmul lt!229354 lt!229357) lt!229354)))))

(assert (=> d!47740 (= lt!229357 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!47740 (= lt!229354 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!228624)))))))

(assert (=> d!47740 (= lt!229356 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6362 (_2!6903 lt!228624))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6357 (_2!6903 lt!228624)))))))

(assert (=> d!47740 (invariant!0 (currentBit!6357 (_2!6903 lt!228624)) (currentByte!6362 (_2!6903 lt!228624)) (size!3005 (buf!3460 (_2!6903 lt!228624))))))

(assert (=> d!47740 (= (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!228624))) (currentByte!6362 (_2!6903 lt!228624)) (currentBit!6357 (_2!6903 lt!228624))) lt!229356)))

(declare-fun b!147381 () Bool)

(declare-fun res!123315 () Bool)

(assert (=> b!147381 (=> (not res!123315) (not e!98281))))

(assert (=> b!147381 (= res!123315 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!229356))))

(declare-fun b!147382 () Bool)

(declare-fun lt!229359 () (_ BitVec 64))

(assert (=> b!147382 (= e!98281 (bvsle lt!229356 (bvmul lt!229359 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!147382 (or (= lt!229359 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!229359 #b0000000000000000000000000000000000000000000000000000000000001000) lt!229359)))))

(assert (=> b!147382 (= lt!229359 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!228624)))))))

(assert (= (and d!47740 res!123314) b!147381))

(assert (= (and b!147381 res!123315) b!147382))

(declare-fun m!228045 () Bool)

(assert (=> d!47740 m!228045))

(declare-fun m!228047 () Bool)

(assert (=> d!47740 m!228047))

(assert (=> b!147043 d!47740))

(assert (=> b!147043 d!47453))

(declare-fun d!47742 () Bool)

(declare-fun res!123316 () Bool)

(declare-fun e!98282 () Bool)

(assert (=> d!47742 (=> res!123316 e!98282)))

(assert (=> d!47742 (= res!123316 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!47742 (= (arrayRangesEq!321 (_2!6906 lt!227967) (_2!6906 lt!227962) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!98282)))

(declare-fun b!147383 () Bool)

(declare-fun e!98283 () Bool)

(assert (=> b!147383 (= e!98282 e!98283)))

(declare-fun res!123317 () Bool)

(assert (=> b!147383 (=> (not res!123317) (not e!98283))))

(assert (=> b!147383 (= res!123317 (= (select (arr!3759 (_2!6906 lt!227967)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3759 (_2!6906 lt!227962)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!147384 () Bool)

(assert (=> b!147384 (= e!98283 (arrayRangesEq!321 (_2!6906 lt!227967) (_2!6906 lt!227962) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!47742 (not res!123316)) b!147383))

(assert (= (and b!147383 res!123317) b!147384))

(declare-fun m!228049 () Bool)

(assert (=> b!147383 m!228049))

(declare-fun m!228051 () Bool)

(assert (=> b!147383 m!228051))

(declare-fun m!228053 () Bool)

(assert (=> b!147384 m!228053))

(assert (=> b!147034 d!47742))

(assert (=> b!147083 d!47453))

(declare-fun d!47744 () Bool)

(assert (=> d!47744 (arrayBitRangesEq!0 (buf!3460 (_2!6903 lt!227980)) (buf!3460 thiss!1634) lt!228766 lt!228767)))

(declare-fun lt!229360 () Unit!9195)

(assert (=> d!47744 (= lt!229360 (choose!8 (buf!3460 thiss!1634) (buf!3460 (_2!6903 lt!227980)) lt!228766 lt!228767))))

(assert (=> d!47744 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!228766) (bvsle lt!228766 lt!228767))))

(assert (=> d!47744 (= (arrayBitRangesEqSymmetric!0 (buf!3460 thiss!1634) (buf!3460 (_2!6903 lt!227980)) lt!228766 lt!228767) lt!229360)))

(declare-fun bs!11671 () Bool)

(assert (= bs!11671 d!47744))

(assert (=> bs!11671 m!227333))

(declare-fun m!228055 () Bool)

(assert (=> bs!11671 m!228055))

(assert (=> b!147083 d!47744))

(declare-fun b!147385 () Bool)

(declare-fun e!98285 () Bool)

(declare-fun call!1985 () Bool)

(assert (=> b!147385 (= e!98285 call!1985)))

(declare-fun b!147386 () Bool)

(declare-fun e!98286 () Bool)

(declare-fun e!98288 () Bool)

(assert (=> b!147386 (= e!98286 e!98288)))

(declare-fun lt!229363 () tuple4!140)

(declare-fun lt!229362 () (_ BitVec 32))

(declare-fun res!123322 () Bool)

(assert (=> b!147386 (= res!123322 (byteRangesEq!0 (select (arr!3759 (buf!3460 (_2!6903 lt!227980))) (_3!358 lt!229363)) (select (arr!3759 (buf!3460 thiss!1634)) (_3!358 lt!229363)) lt!229362 #b00000000000000000000000000001000))))

(assert (=> b!147386 (=> (not res!123322) (not e!98288))))

(declare-fun b!147387 () Bool)

(assert (=> b!147387 (= e!98286 call!1985)))

(declare-fun b!147388 () Bool)

(declare-fun e!98284 () Bool)

(declare-fun e!98287 () Bool)

(assert (=> b!147388 (= e!98284 e!98287)))

(declare-fun res!123319 () Bool)

(assert (=> b!147388 (=> (not res!123319) (not e!98287))))

(declare-fun e!98289 () Bool)

(assert (=> b!147388 (= res!123319 e!98289)))

(declare-fun res!123320 () Bool)

(assert (=> b!147388 (=> res!123320 e!98289)))

(assert (=> b!147388 (= res!123320 (bvsge (_1!6919 lt!229363) (_2!6919 lt!229363)))))

(declare-fun lt!229361 () (_ BitVec 32))

(assert (=> b!147388 (= lt!229361 ((_ extract 31 0) (bvsrem lt!228767 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!147388 (= lt!229362 ((_ extract 31 0) (bvsrem lt!228766 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!147388 (= lt!229363 (arrayBitIndices!0 lt!228766 lt!228767))))

(declare-fun b!147389 () Bool)

(assert (=> b!147389 (= e!98289 (arrayRangesEq!321 (buf!3460 (_2!6903 lt!227980)) (buf!3460 thiss!1634) (_1!6919 lt!229363) (_2!6919 lt!229363)))))

(declare-fun b!147390 () Bool)

(assert (=> b!147390 (= e!98287 e!98286)))

(declare-fun c!7986 () Bool)

(assert (=> b!147390 (= c!7986 (= (_3!358 lt!229363) (_4!70 lt!229363)))))

(declare-fun b!147391 () Bool)

(declare-fun res!123318 () Bool)

(assert (=> b!147391 (= res!123318 (= lt!229361 #b00000000000000000000000000000000))))

(assert (=> b!147391 (=> res!123318 e!98285)))

(assert (=> b!147391 (= e!98288 e!98285)))

(declare-fun bm!1982 () Bool)

(assert (=> bm!1982 (= call!1985 (byteRangesEq!0 (ite c!7986 (select (arr!3759 (buf!3460 (_2!6903 lt!227980))) (_3!358 lt!229363)) (select (arr!3759 (buf!3460 (_2!6903 lt!227980))) (_4!70 lt!229363))) (ite c!7986 (select (arr!3759 (buf!3460 thiss!1634)) (_3!358 lt!229363)) (select (arr!3759 (buf!3460 thiss!1634)) (_4!70 lt!229363))) (ite c!7986 lt!229362 #b00000000000000000000000000000000) lt!229361))))

(declare-fun d!47746 () Bool)

(declare-fun res!123321 () Bool)

(assert (=> d!47746 (=> res!123321 e!98284)))

(assert (=> d!47746 (= res!123321 (bvsge lt!228766 lt!228767))))

(assert (=> d!47746 (= (arrayBitRangesEq!0 (buf!3460 (_2!6903 lt!227980)) (buf!3460 thiss!1634) lt!228766 lt!228767) e!98284)))

(assert (= (and d!47746 (not res!123321)) b!147388))

(assert (= (and b!147388 (not res!123320)) b!147389))

(assert (= (and b!147388 res!123319) b!147390))

(assert (= (and b!147390 c!7986) b!147387))

(assert (= (and b!147390 (not c!7986)) b!147386))

(assert (= (and b!147386 res!123322) b!147391))

(assert (= (and b!147391 (not res!123318)) b!147385))

(assert (= (or b!147387 b!147385) bm!1982))

(declare-fun m!228057 () Bool)

(assert (=> b!147386 m!228057))

(declare-fun m!228059 () Bool)

(assert (=> b!147386 m!228059))

(assert (=> b!147386 m!228057))

(assert (=> b!147386 m!228059))

(declare-fun m!228061 () Bool)

(assert (=> b!147386 m!228061))

(declare-fun m!228063 () Bool)

(assert (=> b!147388 m!228063))

(declare-fun m!228065 () Bool)

(assert (=> b!147389 m!228065))

(declare-fun m!228067 () Bool)

(assert (=> bm!1982 m!228067))

(declare-fun m!228069 () Bool)

(assert (=> bm!1982 m!228069))

(assert (=> bm!1982 m!228057))

(declare-fun m!228071 () Bool)

(assert (=> bm!1982 m!228071))

(assert (=> bm!1982 m!228059))

(assert (=> b!147083 d!47746))

(assert (=> d!47524 d!47522))

(declare-fun d!47748 () Bool)

(assert (=> d!47748 (validate_offset_bits!1 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!227961)))) ((_ sign_extend 32) (currentByte!6362 (_2!6903 lt!227980))) ((_ sign_extend 32) (currentBit!6357 (_2!6903 lt!227980))) lt!227964)))

(assert (=> d!47748 true))

(declare-fun _$6!316 () Unit!9195)

(assert (=> d!47748 (= (choose!9 (_2!6903 lt!227980) (buf!3460 (_2!6903 lt!227961)) lt!227964 (BitStream!5269 (buf!3460 (_2!6903 lt!227961)) (currentByte!6362 (_2!6903 lt!227980)) (currentBit!6357 (_2!6903 lt!227980)))) _$6!316)))

(declare-fun bs!11672 () Bool)

(assert (= bs!11672 d!47748))

(assert (=> bs!11672 m!226587))

(assert (=> d!47524 d!47748))

(assert (=> d!47504 d!47491))

(assert (=> d!47504 d!47459))

(declare-fun lt!229364 () tuple3!574)

(declare-fun d!47750 () Bool)

(assert (=> d!47750 (= lt!229364 (readByteArrayLoop!0 lt!228725 (array!6641 (store (arr!3759 arr!237) from!447 (_2!6904 (readBytePure!0 (_1!6905 lt!227956)))) (size!3005 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!47750 (= (readByteArrayLoopPure!0 lt!228725 (array!6641 (store (arr!3759 arr!237) from!447 (_2!6904 (readBytePure!0 (_1!6905 lt!227956)))) (size!3005 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404) (tuple2!13105 (_2!6915 lt!229364) (_3!356 lt!229364)))))

(declare-fun bs!11673 () Bool)

(assert (= bs!11673 d!47750))

(declare-fun m!228073 () Bool)

(assert (=> bs!11673 m!228073))

(assert (=> d!47504 d!47750))

(declare-fun d!47752 () Bool)

(assert (=> d!47752 (arrayRangesEq!321 (_2!6906 (readByteArrayLoopPure!0 (_1!6905 lt!227956) arr!237 from!447 to!404)) (_2!6906 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6905 lt!227956) #b00000000000000000000000000000001) (array!6641 (store (arr!3759 arr!237) from!447 (_2!6904 (readBytePure!0 (_1!6905 lt!227956)))) (size!3005 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404)) #b00000000000000000000000000000000 to!404)))

(assert (=> d!47752 true))

(declare-fun _$13!64 () Unit!9195)

(assert (=> d!47752 (= (choose!35 (_1!6905 lt!227956) arr!237 from!447 to!404 lt!228724 (_2!6906 lt!228724) lt!228725 lt!228726 (_2!6906 lt!228726)) _$13!64)))

(declare-fun bs!11675 () Bool)

(assert (= bs!11675 d!47752))

(assert (=> bs!11675 m!227289))

(assert (=> bs!11675 m!226645))

(declare-fun m!228075 () Bool)

(assert (=> bs!11675 m!228075))

(assert (=> bs!11675 m!226613))

(declare-fun m!228077 () Bool)

(assert (=> bs!11675 m!228077))

(assert (=> bs!11675 m!226623))

(assert (=> bs!11675 m!226645))

(assert (=> d!47504 d!47752))

(declare-fun d!47754 () Bool)

(declare-fun res!123323 () Bool)

(declare-fun e!98290 () Bool)

(assert (=> d!47754 (=> res!123323 e!98290)))

(assert (=> d!47754 (= res!123323 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!47754 (= (arrayRangesEq!321 (_2!6906 lt!228724) (_2!6906 lt!228726) #b00000000000000000000000000000000 to!404) e!98290)))

(declare-fun b!147392 () Bool)

(declare-fun e!98291 () Bool)

(assert (=> b!147392 (= e!98290 e!98291)))

(declare-fun res!123324 () Bool)

(assert (=> b!147392 (=> (not res!123324) (not e!98291))))

(assert (=> b!147392 (= res!123324 (= (select (arr!3759 (_2!6906 lt!228724)) #b00000000000000000000000000000000) (select (arr!3759 (_2!6906 lt!228726)) #b00000000000000000000000000000000)))))

(declare-fun b!147393 () Bool)

(assert (=> b!147393 (= e!98291 (arrayRangesEq!321 (_2!6906 lt!228724) (_2!6906 lt!228726) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!47754 (not res!123323)) b!147392))

(assert (= (and b!147392 res!123324) b!147393))

(declare-fun m!228079 () Bool)

(assert (=> b!147392 m!228079))

(declare-fun m!228081 () Bool)

(assert (=> b!147392 m!228081))

(declare-fun m!228083 () Bool)

(assert (=> b!147393 m!228083))

(assert (=> d!47504 d!47754))

(assert (=> d!47504 d!47496))

(declare-fun d!47756 () Bool)

(assert (=> d!47756 (= (remainingBits!0 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!227980)))) ((_ sign_extend 32) (currentByte!6362 (_2!6903 lt!227980))) ((_ sign_extend 32) (currentBit!6357 (_2!6903 lt!227980)))) (bvsub (bvmul ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!227980)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6362 (_2!6903 lt!227980))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6357 (_2!6903 lt!227980))))))))

(assert (=> d!47483 d!47756))

(assert (=> d!47467 d!47461))

(declare-fun d!47758 () Bool)

(assert (=> d!47758 (isPrefixOf!0 thiss!1634 (_2!6903 lt!227961))))

(assert (=> d!47758 true))

(declare-fun _$15!237 () Unit!9195)

(assert (=> d!47758 (= (choose!30 thiss!1634 (_2!6903 lt!227980) (_2!6903 lt!227961)) _$15!237)))

(declare-fun bs!11676 () Bool)

(assert (= bs!11676 d!47758))

(assert (=> bs!11676 m!226635))

(assert (=> d!47467 d!47758))

(assert (=> d!47467 d!47514))

(declare-fun d!47760 () Bool)

(assert (=> d!47760 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!227980)))) ((_ sign_extend 32) (currentByte!6362 (_2!6903 lt!227980))) ((_ sign_extend 32) (currentBit!6357 (_2!6903 lt!227980))) lt!228589) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!227980)))) ((_ sign_extend 32) (currentByte!6362 (_2!6903 lt!227980))) ((_ sign_extend 32) (currentBit!6357 (_2!6903 lt!227980)))) lt!228589))))

(declare-fun bs!11677 () Bool)

(assert (= bs!11677 d!47760))

(assert (=> bs!11677 m!227165))

(assert (=> b!147023 d!47760))

(declare-fun d!47762 () Bool)

(declare-fun res!123325 () Bool)

(declare-fun e!98292 () Bool)

(assert (=> d!47762 (=> (not res!123325) (not e!98292))))

(assert (=> d!47762 (= res!123325 (= (size!3005 (buf!3460 (_2!6905 lt!228741))) (size!3005 (buf!3460 (_2!6903 lt!227961)))))))

(assert (=> d!47762 (= (isPrefixOf!0 (_2!6905 lt!228741) (_2!6903 lt!227961)) e!98292)))

(declare-fun b!147394 () Bool)

(declare-fun res!123327 () Bool)

(assert (=> b!147394 (=> (not res!123327) (not e!98292))))

(assert (=> b!147394 (= res!123327 (bvsle (bitIndex!0 (size!3005 (buf!3460 (_2!6905 lt!228741))) (currentByte!6362 (_2!6905 lt!228741)) (currentBit!6357 (_2!6905 lt!228741))) (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!227961))) (currentByte!6362 (_2!6903 lt!227961)) (currentBit!6357 (_2!6903 lt!227961)))))))

(declare-fun b!147395 () Bool)

(declare-fun e!98293 () Bool)

(assert (=> b!147395 (= e!98292 e!98293)))

(declare-fun res!123326 () Bool)

(assert (=> b!147395 (=> res!123326 e!98293)))

(assert (=> b!147395 (= res!123326 (= (size!3005 (buf!3460 (_2!6905 lt!228741))) #b00000000000000000000000000000000))))

(declare-fun b!147396 () Bool)

(assert (=> b!147396 (= e!98293 (arrayBitRangesEq!0 (buf!3460 (_2!6905 lt!228741)) (buf!3460 (_2!6903 lt!227961)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3005 (buf!3460 (_2!6905 lt!228741))) (currentByte!6362 (_2!6905 lt!228741)) (currentBit!6357 (_2!6905 lt!228741)))))))

(assert (= (and d!47762 res!123325) b!147394))

(assert (= (and b!147394 res!123327) b!147395))

(assert (= (and b!147395 (not res!123326)) b!147396))

(declare-fun m!228085 () Bool)

(assert (=> b!147394 m!228085))

(assert (=> b!147394 m!226653))

(assert (=> b!147396 m!228085))

(assert (=> b!147396 m!228085))

(declare-fun m!228087 () Bool)

(assert (=> b!147396 m!228087))

(assert (=> b!147074 d!47762))

(declare-fun b!147397 () Bool)

(declare-fun lt!229383 () tuple3!574)

(declare-fun e!98294 () Bool)

(assert (=> b!147397 (= e!98294 (= (select (arr!3759 (_3!356 lt!229383)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6904 (readBytePure!0 (_1!6905 lt!227978)))))))

(assert (=> b!147397 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!3005 (_3!356 lt!229383))))))

(declare-fun lt!229397 () array!6640)

(declare-fun lt!229390 () tuple3!574)

(declare-fun bm!1983 () Bool)

(declare-fun call!1986 () Bool)

(declare-fun c!7987 () Bool)

(declare-fun lt!229366 () array!6640)

(declare-fun lt!229400 () (_ BitVec 32))

(declare-fun lt!229375 () (_ BitVec 32))

(assert (=> bm!1983 (= call!1986 (arrayRangesEq!321 (ite c!7987 lt!227971 lt!229397) (ite c!7987 (_3!356 lt!229390) lt!229366) (ite c!7987 #b00000000000000000000000000000000 lt!229400) (ite c!7987 (bvadd #b00000000000000000000000000000001 from!447) lt!229375)))))

(declare-fun b!147398 () Bool)

(declare-fun e!98296 () tuple3!574)

(declare-fun lt!229371 () Unit!9195)

(assert (=> b!147398 (= e!98296 (tuple3!575 lt!229371 (_2!6915 lt!229390) (_3!356 lt!229390)))))

(declare-fun lt!229396 () tuple2!13118)

(assert (=> b!147398 (= lt!229396 (readByte!0 (_1!6905 lt!227978)))))

(declare-fun lt!229385 () array!6640)

(assert (=> b!147398 (= lt!229385 (array!6641 (store (arr!3759 lt!227971) (bvadd #b00000000000000000000000000000001 from!447) (_1!6916 lt!229396)) (size!3005 lt!227971)))))

(declare-fun lt!229386 () (_ BitVec 64))

(assert (=> b!147398 (= lt!229386 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!229369 () (_ BitVec 32))

(assert (=> b!147398 (= lt!229369 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!229387 () Unit!9195)

(assert (=> b!147398 (= lt!229387 (validateOffsetBytesFromBitIndexLemma!0 (_1!6905 lt!227978) (_2!6916 lt!229396) lt!229386 lt!229369))))

(assert (=> b!147398 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6916 lt!229396)))) ((_ sign_extend 32) (currentByte!6362 (_2!6916 lt!229396))) ((_ sign_extend 32) (currentBit!6357 (_2!6916 lt!229396))) (bvsub lt!229369 ((_ extract 31 0) (bvsdiv (bvadd lt!229386 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!229381 () Unit!9195)

(assert (=> b!147398 (= lt!229381 lt!229387)))

(assert (=> b!147398 (= lt!229390 (readByteArrayLoop!0 (_2!6916 lt!229396) lt!229385 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(declare-fun call!1987 () (_ BitVec 64))

(assert (=> b!147398 (= call!1987 (bvadd (bitIndex!0 (size!3005 (buf!3460 (_1!6905 lt!227978))) (currentByte!6362 (_1!6905 lt!227978)) (currentBit!6357 (_1!6905 lt!227978))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!229393 () Unit!9195)

(declare-fun Unit!9268 () Unit!9195)

(assert (=> b!147398 (= lt!229393 Unit!9268)))

(assert (=> b!147398 (= (bvadd call!1987 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3005 (buf!3460 (_2!6915 lt!229390))) (currentByte!6362 (_2!6915 lt!229390)) (currentBit!6357 (_2!6915 lt!229390))))))

(declare-fun lt!229392 () Unit!9195)

(declare-fun Unit!9269 () Unit!9195)

(assert (=> b!147398 (= lt!229392 Unit!9269)))

(assert (=> b!147398 (= (bvadd (bitIndex!0 (size!3005 (buf!3460 (_1!6905 lt!227978))) (currentByte!6362 (_1!6905 lt!227978)) (currentBit!6357 (_1!6905 lt!227978))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3005 (buf!3460 (_2!6915 lt!229390))) (currentByte!6362 (_2!6915 lt!229390)) (currentBit!6357 (_2!6915 lt!229390))))))

(declare-fun lt!229399 () Unit!9195)

(declare-fun Unit!9270 () Unit!9195)

(assert (=> b!147398 (= lt!229399 Unit!9270)))

(assert (=> b!147398 (and (= (buf!3460 (_1!6905 lt!227978)) (buf!3460 (_2!6915 lt!229390))) (= (size!3005 lt!227971) (size!3005 (_3!356 lt!229390))))))

(declare-fun lt!229376 () Unit!9195)

(declare-fun Unit!9271 () Unit!9195)

(assert (=> b!147398 (= lt!229376 Unit!9271)))

(declare-fun lt!229395 () Unit!9195)

(assert (=> b!147398 (= lt!229395 (arrayUpdatedAtPrefixLemma!13 lt!227971 (bvadd #b00000000000000000000000000000001 from!447) (_1!6916 lt!229396)))))

(declare-fun call!1988 () Bool)

(assert (=> b!147398 call!1988))

(declare-fun lt!229370 () Unit!9195)

(assert (=> b!147398 (= lt!229370 lt!229395)))

(declare-fun lt!229394 () (_ BitVec 32))

(assert (=> b!147398 (= lt!229394 #b00000000000000000000000000000000)))

(declare-fun lt!229374 () Unit!9195)

(assert (=> b!147398 (= lt!229374 (arrayRangesEqTransitive!53 lt!227971 lt!229385 (_3!356 lt!229390) lt!229394 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!147398 (arrayRangesEq!321 lt!227971 (_3!356 lt!229390) lt!229394 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!229388 () Unit!9195)

(assert (=> b!147398 (= lt!229388 lt!229374)))

(assert (=> b!147398 call!1986))

(declare-fun lt!229365 () Unit!9195)

(declare-fun Unit!9272 () Unit!9195)

(assert (=> b!147398 (= lt!229365 Unit!9272)))

(declare-fun lt!229373 () Unit!9195)

(assert (=> b!147398 (= lt!229373 (arrayRangesEqImpliesEq!13 lt!229385 (_3!356 lt!229390) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!147398 (= (select (store (arr!3759 lt!227971) (bvadd #b00000000000000000000000000000001 from!447) (_1!6916 lt!229396)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3759 (_3!356 lt!229390)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!229377 () Unit!9195)

(assert (=> b!147398 (= lt!229377 lt!229373)))

(declare-fun lt!229384 () Bool)

(assert (=> b!147398 (= lt!229384 (= (select (arr!3759 (_3!356 lt!229390)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6916 lt!229396)))))

(declare-fun Unit!9273 () Unit!9195)

(assert (=> b!147398 (= lt!229371 Unit!9273)))

(assert (=> b!147398 lt!229384))

(declare-fun bm!1984 () Bool)

(assert (=> bm!1984 (= call!1988 (arrayRangesEq!321 lt!227971 (ite c!7987 (array!6641 (store (arr!3759 lt!227971) (bvadd #b00000000000000000000000000000001 from!447) (_1!6916 lt!229396)) (size!3005 lt!227971)) lt!227971) #b00000000000000000000000000000000 (ite c!7987 (bvadd #b00000000000000000000000000000001 from!447) (size!3005 lt!227971))))))

(declare-fun d!47764 () Bool)

(assert (=> d!47764 e!98294))

(declare-fun res!123328 () Bool)

(assert (=> d!47764 (=> res!123328 e!98294)))

(assert (=> d!47764 (= res!123328 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!229372 () Bool)

(declare-fun e!98295 () Bool)

(assert (=> d!47764 (= lt!229372 e!98295)))

(declare-fun res!123330 () Bool)

(assert (=> d!47764 (=> (not res!123330) (not e!98295))))

(declare-fun lt!229378 () (_ BitVec 64))

(declare-fun lt!229382 () (_ BitVec 64))

(assert (=> d!47764 (= res!123330 (= (bvadd lt!229382 lt!229378) (bitIndex!0 (size!3005 (buf!3460 (_2!6915 lt!229383))) (currentByte!6362 (_2!6915 lt!229383)) (currentBit!6357 (_2!6915 lt!229383)))))))

(assert (=> d!47764 (or (not (= (bvand lt!229382 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!229378 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!229382 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!229382 lt!229378) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!229367 () (_ BitVec 64))

(assert (=> d!47764 (= lt!229378 (bvmul lt!229367 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!47764 (or (= lt!229367 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!229367 #b0000000000000000000000000000000000000000000000000000000000001000) lt!229367)))))

(assert (=> d!47764 (= lt!229367 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!47764 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!47764 (= lt!229382 (bitIndex!0 (size!3005 (buf!3460 (_1!6905 lt!227978))) (currentByte!6362 (_1!6905 lt!227978)) (currentBit!6357 (_1!6905 lt!227978))))))

(assert (=> d!47764 (= lt!229383 e!98296)))

(assert (=> d!47764 (= c!7987 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!47764 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3005 lt!227971)))))

(assert (=> d!47764 (= (readByteArrayLoop!0 (_1!6905 lt!227978) lt!227971 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!229383)))

(declare-fun bm!1985 () Bool)

(assert (=> bm!1985 (= call!1987 (bitIndex!0 (ite c!7987 (size!3005 (buf!3460 (_2!6916 lt!229396))) (size!3005 (buf!3460 (_1!6905 lt!227978)))) (ite c!7987 (currentByte!6362 (_2!6916 lt!229396)) (currentByte!6362 (_1!6905 lt!227978))) (ite c!7987 (currentBit!6357 (_2!6916 lt!229396)) (currentBit!6357 (_1!6905 lt!227978)))))))

(declare-fun b!147399 () Bool)

(assert (=> b!147399 (= e!98295 (arrayRangesEq!321 lt!227971 (_3!356 lt!229383) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun b!147400 () Bool)

(declare-fun res!123329 () Bool)

(assert (=> b!147400 (=> (not res!123329) (not e!98295))))

(assert (=> b!147400 (= res!123329 (and (= (buf!3460 (_1!6905 lt!227978)) (buf!3460 (_2!6915 lt!229383))) (= (size!3005 lt!227971) (size!3005 (_3!356 lt!229383)))))))

(declare-fun b!147401 () Bool)

(declare-fun lt!229379 () Unit!9195)

(assert (=> b!147401 (= e!98296 (tuple3!575 lt!229379 (_1!6905 lt!227978) lt!227971))))

(assert (=> b!147401 (= call!1987 call!1987)))

(declare-fun lt!229398 () Unit!9195)

(declare-fun Unit!9274 () Unit!9195)

(assert (=> b!147401 (= lt!229398 Unit!9274)))

(declare-fun lt!229391 () Unit!9195)

(assert (=> b!147401 (= lt!229391 (arrayRangesEqReflexiveLemma!13 lt!227971))))

(assert (=> b!147401 call!1988))

(declare-fun lt!229368 () Unit!9195)

(assert (=> b!147401 (= lt!229368 lt!229391)))

(assert (=> b!147401 (= lt!229397 lt!227971)))

(assert (=> b!147401 (= lt!229366 lt!227971)))

(declare-fun lt!229380 () (_ BitVec 32))

(assert (=> b!147401 (= lt!229380 #b00000000000000000000000000000000)))

(declare-fun lt!229389 () (_ BitVec 32))

(assert (=> b!147401 (= lt!229389 (size!3005 lt!227971))))

(assert (=> b!147401 (= lt!229400 #b00000000000000000000000000000000)))

(assert (=> b!147401 (= lt!229375 (bvadd #b00000000000000000000000000000001 from!447))))

(assert (=> b!147401 (= lt!229379 (arrayRangesEqSlicedLemma!13 lt!229397 lt!229366 lt!229380 lt!229389 lt!229400 lt!229375))))

(assert (=> b!147401 call!1986))

(assert (= (and d!47764 c!7987) b!147398))

(assert (= (and d!47764 (not c!7987)) b!147401))

(assert (= (or b!147398 b!147401) bm!1983))

(assert (= (or b!147398 b!147401) bm!1984))

(assert (= (or b!147398 b!147401) bm!1985))

(assert (= (and d!47764 res!123330) b!147400))

(assert (= (and b!147400 res!123329) b!147399))

(assert (= (and d!47764 (not res!123328)) b!147397))

(assert (=> b!147401 m!227923))

(declare-fun m!228089 () Bool)

(assert (=> b!147401 m!228089))

(declare-fun m!228091 () Bool)

(assert (=> bm!1984 m!228091))

(declare-fun m!228093 () Bool)

(assert (=> bm!1984 m!228093))

(declare-fun m!228095 () Bool)

(assert (=> b!147397 m!228095))

(declare-fun m!228097 () Bool)

(assert (=> b!147397 m!228097))

(declare-fun m!228099 () Bool)

(assert (=> d!47764 m!228099))

(declare-fun m!228101 () Bool)

(assert (=> d!47764 m!228101))

(declare-fun m!228103 () Bool)

(assert (=> bm!1985 m!228103))

(declare-fun m!228105 () Bool)

(assert (=> b!147399 m!228105))

(assert (=> b!147398 m!228091))

(declare-fun m!228107 () Bool)

(assert (=> b!147398 m!228107))

(declare-fun m!228109 () Bool)

(assert (=> b!147398 m!228109))

(declare-fun m!228111 () Bool)

(assert (=> b!147398 m!228111))

(declare-fun m!228113 () Bool)

(assert (=> b!147398 m!228113))

(declare-fun m!228115 () Bool)

(assert (=> b!147398 m!228115))

(declare-fun m!228117 () Bool)

(assert (=> b!147398 m!228117))

(declare-fun m!228119 () Bool)

(assert (=> b!147398 m!228119))

(declare-fun m!228121 () Bool)

(assert (=> b!147398 m!228121))

(declare-fun m!228123 () Bool)

(assert (=> b!147398 m!228123))

(assert (=> b!147398 m!228101))

(declare-fun m!228125 () Bool)

(assert (=> b!147398 m!228125))

(declare-fun m!228127 () Bool)

(assert (=> b!147398 m!228127))

(declare-fun m!228129 () Bool)

(assert (=> bm!1983 m!228129))

(assert (=> d!47502 d!47764))

(declare-fun lt!229401 () tuple3!574)

(declare-fun d!47766 () Bool)

(assert (=> d!47766 (= lt!229401 (readByteArrayLoop!0 (_1!6905 lt!228584) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!47766 (= (readByteArrayLoopPure!0 (_1!6905 lt!228584) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13105 (_2!6915 lt!229401) (_3!356 lt!229401)))))

(declare-fun bs!11678 () Bool)

(assert (= bs!11678 d!47766))

(declare-fun m!228131 () Bool)

(assert (=> bs!11678 m!228131))

(assert (=> b!147021 d!47766))

(declare-fun d!47768 () Bool)

(assert (=> d!47768 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!228588)))) ((_ sign_extend 32) (currentByte!6362 (_2!6903 lt!227980))) ((_ sign_extend 32) (currentBit!6357 (_2!6903 lt!227980))) lt!228589) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!228588)))) ((_ sign_extend 32) (currentByte!6362 (_2!6903 lt!227980))) ((_ sign_extend 32) (currentBit!6357 (_2!6903 lt!227980)))) lt!228589))))

(declare-fun bs!11679 () Bool)

(assert (= bs!11679 d!47768))

(declare-fun m!228133 () Bool)

(assert (=> bs!11679 m!228133))

(assert (=> b!147021 d!47768))

(declare-fun d!47770 () Bool)

(assert (=> d!47770 (validate_offset_bits!1 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!228588)))) ((_ sign_extend 32) (currentByte!6362 (_2!6903 lt!227980))) ((_ sign_extend 32) (currentBit!6357 (_2!6903 lt!227980))) lt!228589)))

(declare-fun lt!229402 () Unit!9195)

(assert (=> d!47770 (= lt!229402 (choose!9 (_2!6903 lt!227980) (buf!3460 (_2!6903 lt!228588)) lt!228589 (BitStream!5269 (buf!3460 (_2!6903 lt!228588)) (currentByte!6362 (_2!6903 lt!227980)) (currentBit!6357 (_2!6903 lt!227980)))))))

(assert (=> d!47770 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6903 lt!227980) (buf!3460 (_2!6903 lt!228588)) lt!228589) lt!229402)))

(declare-fun bs!11680 () Bool)

(assert (= bs!11680 d!47770))

(assert (=> bs!11680 m!227175))

(declare-fun m!228135 () Bool)

(assert (=> bs!11680 m!228135))

(assert (=> b!147021 d!47770))

(declare-fun d!47772 () Bool)

(declare-fun e!98297 () Bool)

(assert (=> d!47772 e!98297))

(declare-fun res!123333 () Bool)

(assert (=> d!47772 (=> (not res!123333) (not e!98297))))

(declare-fun lt!229416 () tuple2!13102)

(assert (=> d!47772 (= res!123333 (isPrefixOf!0 (_1!6905 lt!229416) (_2!6905 lt!229416)))))

(declare-fun lt!229422 () BitStream!5268)

(assert (=> d!47772 (= lt!229416 (tuple2!13103 lt!229422 (_2!6903 lt!228588)))))

(declare-fun lt!229409 () Unit!9195)

(declare-fun lt!229405 () Unit!9195)

(assert (=> d!47772 (= lt!229409 lt!229405)))

(assert (=> d!47772 (isPrefixOf!0 lt!229422 (_2!6903 lt!228588))))

(assert (=> d!47772 (= lt!229405 (lemmaIsPrefixTransitive!0 lt!229422 (_2!6903 lt!228588) (_2!6903 lt!228588)))))

(declare-fun lt!229417 () Unit!9195)

(declare-fun lt!229414 () Unit!9195)

(assert (=> d!47772 (= lt!229417 lt!229414)))

(assert (=> d!47772 (isPrefixOf!0 lt!229422 (_2!6903 lt!228588))))

(assert (=> d!47772 (= lt!229414 (lemmaIsPrefixTransitive!0 lt!229422 (_2!6903 lt!227980) (_2!6903 lt!228588)))))

(declare-fun lt!229418 () Unit!9195)

(declare-fun e!98298 () Unit!9195)

(assert (=> d!47772 (= lt!229418 e!98298)))

(declare-fun c!7988 () Bool)

(assert (=> d!47772 (= c!7988 (not (= (size!3005 (buf!3460 (_2!6903 lt!227980))) #b00000000000000000000000000000000)))))

(declare-fun lt!229404 () Unit!9195)

(declare-fun lt!229412 () Unit!9195)

(assert (=> d!47772 (= lt!229404 lt!229412)))

(assert (=> d!47772 (isPrefixOf!0 (_2!6903 lt!228588) (_2!6903 lt!228588))))

(assert (=> d!47772 (= lt!229412 (lemmaIsPrefixRefl!0 (_2!6903 lt!228588)))))

(declare-fun lt!229411 () Unit!9195)

(declare-fun lt!229408 () Unit!9195)

(assert (=> d!47772 (= lt!229411 lt!229408)))

(assert (=> d!47772 (= lt!229408 (lemmaIsPrefixRefl!0 (_2!6903 lt!228588)))))

(declare-fun lt!229419 () Unit!9195)

(declare-fun lt!229413 () Unit!9195)

(assert (=> d!47772 (= lt!229419 lt!229413)))

(assert (=> d!47772 (isPrefixOf!0 lt!229422 lt!229422)))

(assert (=> d!47772 (= lt!229413 (lemmaIsPrefixRefl!0 lt!229422))))

(declare-fun lt!229407 () Unit!9195)

(declare-fun lt!229415 () Unit!9195)

(assert (=> d!47772 (= lt!229407 lt!229415)))

(assert (=> d!47772 (isPrefixOf!0 (_2!6903 lt!227980) (_2!6903 lt!227980))))

(assert (=> d!47772 (= lt!229415 (lemmaIsPrefixRefl!0 (_2!6903 lt!227980)))))

(assert (=> d!47772 (= lt!229422 (BitStream!5269 (buf!3460 (_2!6903 lt!228588)) (currentByte!6362 (_2!6903 lt!227980)) (currentBit!6357 (_2!6903 lt!227980))))))

(assert (=> d!47772 (isPrefixOf!0 (_2!6903 lt!227980) (_2!6903 lt!228588))))

(assert (=> d!47772 (= (reader!0 (_2!6903 lt!227980) (_2!6903 lt!228588)) lt!229416)))

(declare-fun b!147402 () Bool)

(declare-fun res!123331 () Bool)

(assert (=> b!147402 (=> (not res!123331) (not e!98297))))

(assert (=> b!147402 (= res!123331 (isPrefixOf!0 (_1!6905 lt!229416) (_2!6903 lt!227980)))))

(declare-fun b!147403 () Bool)

(declare-fun lt!229410 () Unit!9195)

(assert (=> b!147403 (= e!98298 lt!229410)))

(declare-fun lt!229420 () (_ BitVec 64))

(assert (=> b!147403 (= lt!229420 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!229421 () (_ BitVec 64))

(assert (=> b!147403 (= lt!229421 (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!227980))) (currentByte!6362 (_2!6903 lt!227980)) (currentBit!6357 (_2!6903 lt!227980))))))

(assert (=> b!147403 (= lt!229410 (arrayBitRangesEqSymmetric!0 (buf!3460 (_2!6903 lt!227980)) (buf!3460 (_2!6903 lt!228588)) lt!229420 lt!229421))))

(assert (=> b!147403 (arrayBitRangesEq!0 (buf!3460 (_2!6903 lt!228588)) (buf!3460 (_2!6903 lt!227980)) lt!229420 lt!229421)))

(declare-fun b!147404 () Bool)

(declare-fun Unit!9275 () Unit!9195)

(assert (=> b!147404 (= e!98298 Unit!9275)))

(declare-fun b!147405 () Bool)

(declare-fun res!123332 () Bool)

(assert (=> b!147405 (=> (not res!123332) (not e!98297))))

(assert (=> b!147405 (= res!123332 (isPrefixOf!0 (_2!6905 lt!229416) (_2!6903 lt!228588)))))

(declare-fun lt!229406 () (_ BitVec 64))

(declare-fun lt!229403 () (_ BitVec 64))

(declare-fun b!147406 () Bool)

(assert (=> b!147406 (= e!98297 (= (_1!6905 lt!229416) (withMovedBitIndex!0 (_2!6905 lt!229416) (bvsub lt!229406 lt!229403))))))

(assert (=> b!147406 (or (= (bvand lt!229406 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!229403 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!229406 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!229406 lt!229403) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!147406 (= lt!229403 (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!228588))) (currentByte!6362 (_2!6903 lt!228588)) (currentBit!6357 (_2!6903 lt!228588))))))

(assert (=> b!147406 (= lt!229406 (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!227980))) (currentByte!6362 (_2!6903 lt!227980)) (currentBit!6357 (_2!6903 lt!227980))))))

(assert (= (and d!47772 c!7988) b!147403))

(assert (= (and d!47772 (not c!7988)) b!147404))

(assert (= (and d!47772 res!123333) b!147402))

(assert (= (and b!147402 res!123331) b!147405))

(assert (= (and b!147405 res!123332) b!147406))

(declare-fun m!228137 () Bool)

(assert (=> b!147402 m!228137))

(declare-fun m!228139 () Bool)

(assert (=> b!147406 m!228139))

(assert (=> b!147406 m!227171))

(assert (=> b!147406 m!226655))

(assert (=> b!147403 m!226655))

(declare-fun m!228141 () Bool)

(assert (=> b!147403 m!228141))

(declare-fun m!228143 () Bool)

(assert (=> b!147403 m!228143))

(assert (=> d!47772 m!227303))

(assert (=> d!47772 m!227305))

(declare-fun m!228145 () Bool)

(assert (=> d!47772 m!228145))

(declare-fun m!228147 () Bool)

(assert (=> d!47772 m!228147))

(declare-fun m!228149 () Bool)

(assert (=> d!47772 m!228149))

(assert (=> d!47772 m!227187))

(declare-fun m!228151 () Bool)

(assert (=> d!47772 m!228151))

(declare-fun m!228153 () Bool)

(assert (=> d!47772 m!228153))

(declare-fun m!228155 () Bool)

(assert (=> d!47772 m!228155))

(declare-fun m!228157 () Bool)

(assert (=> d!47772 m!228157))

(declare-fun m!228159 () Bool)

(assert (=> d!47772 m!228159))

(declare-fun m!228161 () Bool)

(assert (=> b!147405 m!228161))

(assert (=> b!147021 d!47772))

(assert (=> b!147072 d!47451))

(declare-fun d!47774 () Bool)

(assert (=> d!47774 (arrayBitRangesEq!0 (buf!3460 (_2!6903 lt!227961)) (buf!3460 (_2!6903 lt!227980)) lt!228745 lt!228746)))

(declare-fun lt!229423 () Unit!9195)

(assert (=> d!47774 (= lt!229423 (choose!8 (buf!3460 (_2!6903 lt!227980)) (buf!3460 (_2!6903 lt!227961)) lt!228745 lt!228746))))

(assert (=> d!47774 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!228745) (bvsle lt!228745 lt!228746))))

(assert (=> d!47774 (= (arrayBitRangesEqSymmetric!0 (buf!3460 (_2!6903 lt!227980)) (buf!3460 (_2!6903 lt!227961)) lt!228745 lt!228746) lt!229423)))

(declare-fun bs!11681 () Bool)

(assert (= bs!11681 d!47774))

(assert (=> bs!11681 m!227301))

(declare-fun m!228163 () Bool)

(assert (=> bs!11681 m!228163))

(assert (=> b!147072 d!47774))

(declare-fun b!147407 () Bool)

(declare-fun e!98300 () Bool)

(declare-fun call!1989 () Bool)

(assert (=> b!147407 (= e!98300 call!1989)))

(declare-fun b!147408 () Bool)

(declare-fun e!98301 () Bool)

(declare-fun e!98303 () Bool)

(assert (=> b!147408 (= e!98301 e!98303)))

(declare-fun lt!229425 () (_ BitVec 32))

(declare-fun lt!229426 () tuple4!140)

(declare-fun res!123338 () Bool)

(assert (=> b!147408 (= res!123338 (byteRangesEq!0 (select (arr!3759 (buf!3460 (_2!6903 lt!227961))) (_3!358 lt!229426)) (select (arr!3759 (buf!3460 (_2!6903 lt!227980))) (_3!358 lt!229426)) lt!229425 #b00000000000000000000000000001000))))

(assert (=> b!147408 (=> (not res!123338) (not e!98303))))

(declare-fun b!147409 () Bool)

(assert (=> b!147409 (= e!98301 call!1989)))

(declare-fun b!147410 () Bool)

(declare-fun e!98299 () Bool)

(declare-fun e!98302 () Bool)

(assert (=> b!147410 (= e!98299 e!98302)))

(declare-fun res!123335 () Bool)

(assert (=> b!147410 (=> (not res!123335) (not e!98302))))

(declare-fun e!98304 () Bool)

(assert (=> b!147410 (= res!123335 e!98304)))

(declare-fun res!123336 () Bool)

(assert (=> b!147410 (=> res!123336 e!98304)))

(assert (=> b!147410 (= res!123336 (bvsge (_1!6919 lt!229426) (_2!6919 lt!229426)))))

(declare-fun lt!229424 () (_ BitVec 32))

(assert (=> b!147410 (= lt!229424 ((_ extract 31 0) (bvsrem lt!228746 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!147410 (= lt!229425 ((_ extract 31 0) (bvsrem lt!228745 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!147410 (= lt!229426 (arrayBitIndices!0 lt!228745 lt!228746))))

(declare-fun b!147411 () Bool)

(assert (=> b!147411 (= e!98304 (arrayRangesEq!321 (buf!3460 (_2!6903 lt!227961)) (buf!3460 (_2!6903 lt!227980)) (_1!6919 lt!229426) (_2!6919 lt!229426)))))

(declare-fun b!147412 () Bool)

(assert (=> b!147412 (= e!98302 e!98301)))

(declare-fun c!7989 () Bool)

(assert (=> b!147412 (= c!7989 (= (_3!358 lt!229426) (_4!70 lt!229426)))))

(declare-fun b!147413 () Bool)

(declare-fun res!123334 () Bool)

(assert (=> b!147413 (= res!123334 (= lt!229424 #b00000000000000000000000000000000))))

(assert (=> b!147413 (=> res!123334 e!98300)))

(assert (=> b!147413 (= e!98303 e!98300)))

(declare-fun bm!1986 () Bool)

(assert (=> bm!1986 (= call!1989 (byteRangesEq!0 (ite c!7989 (select (arr!3759 (buf!3460 (_2!6903 lt!227961))) (_3!358 lt!229426)) (select (arr!3759 (buf!3460 (_2!6903 lt!227961))) (_4!70 lt!229426))) (ite c!7989 (select (arr!3759 (buf!3460 (_2!6903 lt!227980))) (_3!358 lt!229426)) (select (arr!3759 (buf!3460 (_2!6903 lt!227980))) (_4!70 lt!229426))) (ite c!7989 lt!229425 #b00000000000000000000000000000000) lt!229424))))

(declare-fun d!47776 () Bool)

(declare-fun res!123337 () Bool)

(assert (=> d!47776 (=> res!123337 e!98299)))

(assert (=> d!47776 (= res!123337 (bvsge lt!228745 lt!228746))))

(assert (=> d!47776 (= (arrayBitRangesEq!0 (buf!3460 (_2!6903 lt!227961)) (buf!3460 (_2!6903 lt!227980)) lt!228745 lt!228746) e!98299)))

(assert (= (and d!47776 (not res!123337)) b!147410))

(assert (= (and b!147410 (not res!123336)) b!147411))

(assert (= (and b!147410 res!123335) b!147412))

(assert (= (and b!147412 c!7989) b!147409))

(assert (= (and b!147412 (not c!7989)) b!147408))

(assert (= (and b!147408 res!123338) b!147413))

(assert (= (and b!147413 (not res!123334)) b!147407))

(assert (= (or b!147409 b!147407) bm!1986))

(declare-fun m!228165 () Bool)

(assert (=> b!147408 m!228165))

(declare-fun m!228167 () Bool)

(assert (=> b!147408 m!228167))

(assert (=> b!147408 m!228165))

(assert (=> b!147408 m!228167))

(declare-fun m!228169 () Bool)

(assert (=> b!147408 m!228169))

(declare-fun m!228171 () Bool)

(assert (=> b!147410 m!228171))

(declare-fun m!228173 () Bool)

(assert (=> b!147411 m!228173))

(declare-fun m!228175 () Bool)

(assert (=> bm!1986 m!228175))

(declare-fun m!228177 () Bool)

(assert (=> bm!1986 m!228177))

(assert (=> bm!1986 m!228165))

(declare-fun m!228179 () Bool)

(assert (=> bm!1986 m!228179))

(assert (=> bm!1986 m!228167))

(assert (=> b!147072 d!47776))

(declare-fun d!47778 () Bool)

(assert (=> d!47778 (= (remainingBits!0 ((_ sign_extend 32) (size!3005 (buf!3460 (_1!6904 lt!227957)))) ((_ sign_extend 32) (currentByte!6362 (_1!6904 lt!227957))) ((_ sign_extend 32) (currentBit!6357 (_1!6904 lt!227957)))) (bvsub (bvmul ((_ sign_extend 32) (size!3005 (buf!3460 (_1!6904 lt!227957)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6362 (_1!6904 lt!227957))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6357 (_1!6904 lt!227957))))))))

(assert (=> d!47498 d!47778))

(declare-fun d!47780 () Bool)

(assert (=> d!47780 (= (invariant!0 (currentBit!6357 (_1!6904 lt!227957)) (currentByte!6362 (_1!6904 lt!227957)) (size!3005 (buf!3460 (_1!6904 lt!227957)))) (and (bvsge (currentBit!6357 (_1!6904 lt!227957)) #b00000000000000000000000000000000) (bvslt (currentBit!6357 (_1!6904 lt!227957)) #b00000000000000000000000000001000) (bvsge (currentByte!6362 (_1!6904 lt!227957)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6362 (_1!6904 lt!227957)) (size!3005 (buf!3460 (_1!6904 lt!227957)))) (and (= (currentBit!6357 (_1!6904 lt!227957)) #b00000000000000000000000000000000) (= (currentByte!6362 (_1!6904 lt!227957)) (size!3005 (buf!3460 (_1!6904 lt!227957))))))))))

(assert (=> d!47498 d!47780))

(declare-fun d!47782 () Bool)

(assert (=> d!47782 (= (remainingBits!0 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!227961)))) ((_ sign_extend 32) (currentByte!6362 (_2!6903 lt!227980))) ((_ sign_extend 32) (currentBit!6357 (_2!6903 lt!227980)))) (bvsub (bvmul ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!227961)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6362 (_2!6903 lt!227980))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6357 (_2!6903 lt!227980))))))))

(assert (=> d!47522 d!47782))

(declare-fun d!47784 () Bool)

(declare-fun res!123339 () Bool)

(declare-fun e!98305 () Bool)

(assert (=> d!47784 (=> (not res!123339) (not e!98305))))

(assert (=> d!47784 (= res!123339 (= (size!3005 (buf!3460 (_1!6905 lt!228741))) (size!3005 (buf!3460 (_2!6903 lt!227980)))))))

(assert (=> d!47784 (= (isPrefixOf!0 (_1!6905 lt!228741) (_2!6903 lt!227980)) e!98305)))

(declare-fun b!147414 () Bool)

(declare-fun res!123341 () Bool)

(assert (=> b!147414 (=> (not res!123341) (not e!98305))))

(assert (=> b!147414 (= res!123341 (bvsle (bitIndex!0 (size!3005 (buf!3460 (_1!6905 lt!228741))) (currentByte!6362 (_1!6905 lt!228741)) (currentBit!6357 (_1!6905 lt!228741))) (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!227980))) (currentByte!6362 (_2!6903 lt!227980)) (currentBit!6357 (_2!6903 lt!227980)))))))

(declare-fun b!147415 () Bool)

(declare-fun e!98306 () Bool)

(assert (=> b!147415 (= e!98305 e!98306)))

(declare-fun res!123340 () Bool)

(assert (=> b!147415 (=> res!123340 e!98306)))

(assert (=> b!147415 (= res!123340 (= (size!3005 (buf!3460 (_1!6905 lt!228741))) #b00000000000000000000000000000000))))

(declare-fun b!147416 () Bool)

(assert (=> b!147416 (= e!98306 (arrayBitRangesEq!0 (buf!3460 (_1!6905 lt!228741)) (buf!3460 (_2!6903 lt!227980)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3005 (buf!3460 (_1!6905 lt!228741))) (currentByte!6362 (_1!6905 lt!228741)) (currentBit!6357 (_1!6905 lt!228741)))))))

(assert (= (and d!47784 res!123339) b!147414))

(assert (= (and b!147414 res!123341) b!147415))

(assert (= (and b!147415 (not res!123340)) b!147416))

(declare-fun m!228181 () Bool)

(assert (=> b!147414 m!228181))

(assert (=> b!147414 m!226655))

(assert (=> b!147416 m!228181))

(assert (=> b!147416 m!228181))

(declare-fun m!228183 () Bool)

(assert (=> b!147416 m!228183))

(assert (=> b!147071 d!47784))

(declare-fun d!47786 () Bool)

(assert (=> d!47786 (= (remainingBits!0 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!227961)))) ((_ sign_extend 32) (currentByte!6362 thiss!1634)) ((_ sign_extend 32) (currentBit!6357 thiss!1634))) (bvsub (bvmul ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!227961)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6362 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6357 thiss!1634)))))))

(assert (=> d!47477 d!47786))

(declare-fun d!47788 () Bool)

(assert (=> d!47788 (= (remainingBits!0 ((_ sign_extend 32) (size!3005 (buf!3460 thiss!1634))) ((_ sign_extend 32) (currentByte!6362 thiss!1634)) ((_ sign_extend 32) (currentBit!6357 thiss!1634))) (bvsub (bvmul ((_ sign_extend 32) (size!3005 (buf!3460 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6362 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6357 thiss!1634)))))))

(assert (=> d!47453 d!47788))

(assert (=> d!47453 d!47441))

(declare-fun d!47790 () Bool)

(declare-fun e!98307 () Bool)

(assert (=> d!47790 e!98307))

(declare-fun res!123342 () Bool)

(assert (=> d!47790 (=> (not res!123342) (not e!98307))))

(declare-fun lt!229428 () (_ BitVec 64))

(declare-fun lt!229427 () BitStream!5268)

(assert (=> d!47790 (= res!123342 (= (bvadd lt!229428 (bvsub lt!228669 lt!228666)) (bitIndex!0 (size!3005 (buf!3460 lt!229427)) (currentByte!6362 lt!229427) (currentBit!6357 lt!229427))))))

(assert (=> d!47790 (or (not (= (bvand lt!229428 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!228669 lt!228666) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!229428 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!229428 (bvsub lt!228669 lt!228666)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!47790 (= lt!229428 (bitIndex!0 (size!3005 (buf!3460 (_2!6905 lt!228679))) (currentByte!6362 (_2!6905 lt!228679)) (currentBit!6357 (_2!6905 lt!228679))))))

(assert (=> d!47790 (= lt!229427 (_2!6903 (moveBitIndex!0 (_2!6905 lt!228679) (bvsub lt!228669 lt!228666))))))

(assert (=> d!47790 (moveBitIndexPrecond!0 (_2!6905 lt!228679) (bvsub lt!228669 lt!228666))))

(assert (=> d!47790 (= (withMovedBitIndex!0 (_2!6905 lt!228679) (bvsub lt!228669 lt!228666)) lt!229427)))

(declare-fun b!147417 () Bool)

(assert (=> b!147417 (= e!98307 (= (size!3005 (buf!3460 (_2!6905 lt!228679))) (size!3005 (buf!3460 lt!229427))))))

(assert (= (and d!47790 res!123342) b!147417))

(declare-fun m!228185 () Bool)

(assert (=> d!47790 m!228185))

(assert (=> d!47790 m!227919))

(declare-fun m!228187 () Bool)

(assert (=> d!47790 m!228187))

(declare-fun m!228189 () Bool)

(assert (=> d!47790 m!228189))

(assert (=> b!147060 d!47790))

(assert (=> b!147060 d!47449))

(assert (=> b!147060 d!47453))

(assert (=> b!147030 d!47453))

(assert (=> b!147030 d!47449))

(declare-fun b!147418 () Bool)

(declare-fun e!98309 () Bool)

(declare-fun call!1990 () Bool)

(assert (=> b!147418 (= e!98309 call!1990)))

(declare-fun b!147419 () Bool)

(declare-fun e!98310 () Bool)

(declare-fun e!98312 () Bool)

(assert (=> b!147419 (= e!98310 e!98312)))

(declare-fun lt!229431 () tuple4!140)

(declare-fun lt!229430 () (_ BitVec 32))

(declare-fun res!123347 () Bool)

(assert (=> b!147419 (= res!123347 (byteRangesEq!0 (select (arr!3759 (buf!3460 (_2!6903 lt!227980))) (_3!358 lt!229431)) (select (arr!3759 (buf!3460 (_2!6903 lt!227961))) (_3!358 lt!229431)) lt!229430 #b00000000000000000000000000001000))))

(assert (=> b!147419 (=> (not res!123347) (not e!98312))))

(declare-fun b!147420 () Bool)

(assert (=> b!147420 (= e!98310 call!1990)))

(declare-fun b!147421 () Bool)

(declare-fun e!98308 () Bool)

(declare-fun e!98311 () Bool)

(assert (=> b!147421 (= e!98308 e!98311)))

(declare-fun res!123344 () Bool)

(assert (=> b!147421 (=> (not res!123344) (not e!98311))))

(declare-fun e!98313 () Bool)

(assert (=> b!147421 (= res!123344 e!98313)))

(declare-fun res!123345 () Bool)

(assert (=> b!147421 (=> res!123345 e!98313)))

(assert (=> b!147421 (= res!123345 (bvsge (_1!6919 lt!229431) (_2!6919 lt!229431)))))

(declare-fun lt!229429 () (_ BitVec 32))

(assert (=> b!147421 (= lt!229429 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!227980))) (currentByte!6362 (_2!6903 lt!227980)) (currentBit!6357 (_2!6903 lt!227980))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!147421 (= lt!229430 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!147421 (= lt!229431 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!227980))) (currentByte!6362 (_2!6903 lt!227980)) (currentBit!6357 (_2!6903 lt!227980)))))))

(declare-fun b!147422 () Bool)

(assert (=> b!147422 (= e!98313 (arrayRangesEq!321 (buf!3460 (_2!6903 lt!227980)) (buf!3460 (_2!6903 lt!227961)) (_1!6919 lt!229431) (_2!6919 lt!229431)))))

(declare-fun b!147423 () Bool)

(assert (=> b!147423 (= e!98311 e!98310)))

(declare-fun c!7990 () Bool)

(assert (=> b!147423 (= c!7990 (= (_3!358 lt!229431) (_4!70 lt!229431)))))

(declare-fun b!147424 () Bool)

(declare-fun res!123343 () Bool)

(assert (=> b!147424 (= res!123343 (= lt!229429 #b00000000000000000000000000000000))))

(assert (=> b!147424 (=> res!123343 e!98309)))

(assert (=> b!147424 (= e!98312 e!98309)))

(declare-fun bm!1987 () Bool)

(assert (=> bm!1987 (= call!1990 (byteRangesEq!0 (ite c!7990 (select (arr!3759 (buf!3460 (_2!6903 lt!227980))) (_3!358 lt!229431)) (select (arr!3759 (buf!3460 (_2!6903 lt!227980))) (_4!70 lt!229431))) (ite c!7990 (select (arr!3759 (buf!3460 (_2!6903 lt!227961))) (_3!358 lt!229431)) (select (arr!3759 (buf!3460 (_2!6903 lt!227961))) (_4!70 lt!229431))) (ite c!7990 lt!229430 #b00000000000000000000000000000000) lt!229429))))

(declare-fun d!47792 () Bool)

(declare-fun res!123346 () Bool)

(assert (=> d!47792 (=> res!123346 e!98308)))

(assert (=> d!47792 (= res!123346 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!227980))) (currentByte!6362 (_2!6903 lt!227980)) (currentBit!6357 (_2!6903 lt!227980)))))))

(assert (=> d!47792 (= (arrayBitRangesEq!0 (buf!3460 (_2!6903 lt!227980)) (buf!3460 (_2!6903 lt!227961)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!227980))) (currentByte!6362 (_2!6903 lt!227980)) (currentBit!6357 (_2!6903 lt!227980)))) e!98308)))

(assert (= (and d!47792 (not res!123346)) b!147421))

(assert (= (and b!147421 (not res!123345)) b!147422))

(assert (= (and b!147421 res!123344) b!147423))

(assert (= (and b!147423 c!7990) b!147420))

(assert (= (and b!147423 (not c!7990)) b!147419))

(assert (= (and b!147419 res!123347) b!147424))

(assert (= (and b!147424 (not res!123343)) b!147418))

(assert (= (or b!147420 b!147418) bm!1987))

(declare-fun m!228191 () Bool)

(assert (=> b!147419 m!228191))

(declare-fun m!228193 () Bool)

(assert (=> b!147419 m!228193))

(assert (=> b!147419 m!228191))

(assert (=> b!147419 m!228193))

(declare-fun m!228195 () Bool)

(assert (=> b!147419 m!228195))

(assert (=> b!147421 m!226655))

(declare-fun m!228197 () Bool)

(assert (=> b!147421 m!228197))

(declare-fun m!228199 () Bool)

(assert (=> b!147422 m!228199))

(declare-fun m!228201 () Bool)

(assert (=> bm!1987 m!228201))

(declare-fun m!228203 () Bool)

(assert (=> bm!1987 m!228203))

(assert (=> bm!1987 m!228191))

(declare-fun m!228205 () Bool)

(assert (=> bm!1987 m!228205))

(assert (=> bm!1987 m!228193))

(assert (=> b!147078 d!47792))

(assert (=> b!147078 d!47451))

(declare-fun d!47794 () Bool)

(declare-fun lt!229435 () (_ BitVec 8))

(declare-fun lt!229438 () (_ BitVec 8))

(assert (=> d!47794 (= lt!229435 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3759 (buf!3460 (_1!6905 lt!227974))) (currentByte!6362 (_1!6905 lt!227974)))) ((_ sign_extend 24) lt!229438))))))

(assert (=> d!47794 (= lt!229438 ((_ extract 7 0) (currentBit!6357 (_1!6905 lt!227974))))))

(declare-fun e!98314 () Bool)

(assert (=> d!47794 e!98314))

(declare-fun res!123348 () Bool)

(assert (=> d!47794 (=> (not res!123348) (not e!98314))))

(assert (=> d!47794 (= res!123348 (validate_offset_bits!1 ((_ sign_extend 32) (size!3005 (buf!3460 (_1!6905 lt!227974)))) ((_ sign_extend 32) (currentByte!6362 (_1!6905 lt!227974))) ((_ sign_extend 32) (currentBit!6357 (_1!6905 lt!227974))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!9276 () Unit!9195)

(declare-fun Unit!9277 () Unit!9195)

(assert (=> d!47794 (= (readByte!0 (_1!6905 lt!227974)) (tuple2!13119 (_2!6920 (ite (bvsgt ((_ sign_extend 24) lt!229438) #b00000000000000000000000000000000) (tuple2!13123 Unit!9276 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!229435) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3759 (buf!3460 (_1!6905 lt!227974))) (bvadd (currentByte!6362 (_1!6905 lt!227974)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!229438)))))))) (tuple2!13123 Unit!9277 lt!229435))) (BitStream!5269 (buf!3460 (_1!6905 lt!227974)) (bvadd (currentByte!6362 (_1!6905 lt!227974)) #b00000000000000000000000000000001) (currentBit!6357 (_1!6905 lt!227974)))))))

(declare-fun b!147425 () Bool)

(declare-fun e!98315 () Bool)

(assert (=> b!147425 (= e!98314 e!98315)))

(declare-fun res!123349 () Bool)

(assert (=> b!147425 (=> (not res!123349) (not e!98315))))

(declare-fun lt!229434 () tuple2!13118)

(assert (=> b!147425 (= res!123349 (= (buf!3460 (_2!6916 lt!229434)) (buf!3460 (_1!6905 lt!227974))))))

(declare-fun lt!229432 () (_ BitVec 8))

(declare-fun lt!229437 () (_ BitVec 8))

(declare-fun Unit!9278 () Unit!9195)

(declare-fun Unit!9279 () Unit!9195)

(assert (=> b!147425 (= lt!229434 (tuple2!13119 (_2!6920 (ite (bvsgt ((_ sign_extend 24) lt!229432) #b00000000000000000000000000000000) (tuple2!13123 Unit!9278 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!229437) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3759 (buf!3460 (_1!6905 lt!227974))) (bvadd (currentByte!6362 (_1!6905 lt!227974)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!229432)))))))) (tuple2!13123 Unit!9279 lt!229437))) (BitStream!5269 (buf!3460 (_1!6905 lt!227974)) (bvadd (currentByte!6362 (_1!6905 lt!227974)) #b00000000000000000000000000000001) (currentBit!6357 (_1!6905 lt!227974)))))))

(assert (=> b!147425 (= lt!229437 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3759 (buf!3460 (_1!6905 lt!227974))) (currentByte!6362 (_1!6905 lt!227974)))) ((_ sign_extend 24) lt!229432))))))

(assert (=> b!147425 (= lt!229432 ((_ extract 7 0) (currentBit!6357 (_1!6905 lt!227974))))))

(declare-fun b!147426 () Bool)

(declare-fun lt!229436 () (_ BitVec 64))

(declare-fun lt!229433 () (_ BitVec 64))

(assert (=> b!147426 (= e!98315 (= (bitIndex!0 (size!3005 (buf!3460 (_2!6916 lt!229434))) (currentByte!6362 (_2!6916 lt!229434)) (currentBit!6357 (_2!6916 lt!229434))) (bvadd lt!229433 lt!229436)))))

(assert (=> b!147426 (or (not (= (bvand lt!229433 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!229436 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!229433 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!229433 lt!229436) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!147426 (= lt!229436 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!147426 (= lt!229433 (bitIndex!0 (size!3005 (buf!3460 (_1!6905 lt!227974))) (currentByte!6362 (_1!6905 lt!227974)) (currentBit!6357 (_1!6905 lt!227974))))))

(assert (= (and d!47794 res!123348) b!147425))

(assert (= (and b!147425 res!123349) b!147426))

(declare-fun m!228207 () Bool)

(assert (=> d!47794 m!228207))

(declare-fun m!228209 () Bool)

(assert (=> d!47794 m!228209))

(declare-fun m!228211 () Bool)

(assert (=> d!47794 m!228211))

(assert (=> b!147425 m!228211))

(assert (=> b!147425 m!228207))

(declare-fun m!228213 () Bool)

(assert (=> b!147426 m!228213))

(declare-fun m!228215 () Bool)

(assert (=> b!147426 m!228215))

(assert (=> d!47516 d!47794))

(assert (=> d!47447 d!47441))

(assert (=> b!147076 d!47451))

(assert (=> b!147076 d!47449))

(declare-fun d!47796 () Bool)

(declare-fun res!123350 () Bool)

(declare-fun e!98316 () Bool)

(assert (=> d!47796 (=> (not res!123350) (not e!98316))))

(assert (=> d!47796 (= res!123350 (= (size!3005 (buf!3460 (_1!6905 lt!228679))) (size!3005 (buf!3460 thiss!1634))))))

(assert (=> d!47796 (= (isPrefixOf!0 (_1!6905 lt!228679) thiss!1634) e!98316)))

(declare-fun b!147427 () Bool)

(declare-fun res!123352 () Bool)

(assert (=> b!147427 (=> (not res!123352) (not e!98316))))

(assert (=> b!147427 (= res!123352 (bvsle (bitIndex!0 (size!3005 (buf!3460 (_1!6905 lt!228679))) (currentByte!6362 (_1!6905 lt!228679)) (currentBit!6357 (_1!6905 lt!228679))) (bitIndex!0 (size!3005 (buf!3460 thiss!1634)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634))))))

(declare-fun b!147428 () Bool)

(declare-fun e!98317 () Bool)

(assert (=> b!147428 (= e!98316 e!98317)))

(declare-fun res!123351 () Bool)

(assert (=> b!147428 (=> res!123351 e!98317)))

(assert (=> b!147428 (= res!123351 (= (size!3005 (buf!3460 (_1!6905 lt!228679))) #b00000000000000000000000000000000))))

(declare-fun b!147429 () Bool)

(assert (=> b!147429 (= e!98317 (arrayBitRangesEq!0 (buf!3460 (_1!6905 lt!228679)) (buf!3460 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3005 (buf!3460 (_1!6905 lt!228679))) (currentByte!6362 (_1!6905 lt!228679)) (currentBit!6357 (_1!6905 lt!228679)))))))

(assert (= (and d!47796 res!123350) b!147427))

(assert (= (and b!147427 res!123352) b!147428))

(assert (= (and b!147428 (not res!123351)) b!147429))

(declare-fun m!228217 () Bool)

(assert (=> b!147427 m!228217))

(assert (=> b!147427 m!226661))

(assert (=> b!147429 m!228217))

(assert (=> b!147429 m!228217))

(declare-fun m!228219 () Bool)

(assert (=> b!147429 m!228219))

(assert (=> b!147056 d!47796))

(declare-fun lt!229449 () tuple2!13104)

(declare-fun b!147440 () Bool)

(declare-fun e!98326 () Bool)

(assert (=> b!147440 (= e!98326 (arrayRangesEq!321 arr!237 (_2!6906 lt!229449) #b00000000000000000000000000000000 to!404))))

(declare-fun b!147441 () Bool)

(declare-fun e!98329 () Bool)

(assert (=> b!147441 (= e!98329 e!98326)))

(declare-fun res!123363 () Bool)

(assert (=> b!147441 (=> (not res!123363) (not e!98326))))

(declare-fun lt!229453 () tuple2!13102)

(assert (=> b!147441 (= res!123363 (and (= (size!3005 (_2!6906 lt!229449)) (size!3005 arr!237)) (= (_1!6906 lt!229449) (_2!6905 lt!229453))))))

(assert (=> b!147441 (= lt!229449 (readByteArrayLoopPure!0 (_1!6905 lt!229453) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!229450 () Unit!9195)

(declare-fun lt!229451 () Unit!9195)

(assert (=> b!147441 (= lt!229450 lt!229451)))

(declare-fun _$39!51 () tuple2!13098)

(declare-fun lt!229452 () (_ BitVec 64))

(assert (=> b!147441 (validate_offset_bits!1 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 _$39!51)))) ((_ sign_extend 32) (currentByte!6362 (_2!6903 lt!227980))) ((_ sign_extend 32) (currentBit!6357 (_2!6903 lt!227980))) lt!229452)))

(assert (=> b!147441 (= lt!229451 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6903 lt!227980) (buf!3460 (_2!6903 _$39!51)) lt!229452))))

(assert (=> b!147441 (= lt!229452 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!147441 (= lt!229453 (reader!0 (_2!6903 lt!227980) (_2!6903 _$39!51)))))

(declare-fun b!147442 () Bool)

(declare-fun res!123362 () Bool)

(assert (=> b!147442 (=> (not res!123362) (not e!98329))))

(assert (=> b!147442 (= res!123362 (= (bitIndex!0 (size!3005 (buf!3460 (_2!6903 _$39!51))) (currentByte!6362 (_2!6903 _$39!51)) (currentBit!6357 (_2!6903 _$39!51))) (bvadd (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!227980))) (currentByte!6362 (_2!6903 lt!227980)) (currentBit!6357 (_2!6903 lt!227980))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!147443 () Bool)

(declare-fun e!98328 () Bool)

(assert (=> b!147443 (= e!98328 (array_inv!2794 (buf!3460 (_2!6903 _$39!51))))))

(declare-fun b!147444 () Bool)

(declare-fun res!123364 () Bool)

(assert (=> b!147444 (=> (not res!123364) (not e!98329))))

(assert (=> b!147444 (= res!123364 (isPrefixOf!0 (_2!6903 lt!227980) (_2!6903 _$39!51)))))

(declare-fun d!47798 () Bool)

(assert (=> d!47798 e!98329))

(declare-fun res!123361 () Bool)

(assert (=> d!47798 (=> (not res!123361) (not e!98329))))

(assert (=> d!47798 (= res!123361 (= (size!3005 (buf!3460 (_2!6903 lt!227980))) (size!3005 (buf!3460 (_2!6903 _$39!51)))))))

(assert (=> d!47798 (and (inv!12 (_2!6903 _$39!51)) e!98328)))

(assert (=> d!47798 (= (choose!64 (_2!6903 lt!227980) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) _$39!51)))

(assert (= d!47798 b!147443))

(assert (= (and d!47798 res!123361) b!147442))

(assert (= (and b!147442 res!123362) b!147444))

(assert (= (and b!147444 res!123364) b!147441))

(assert (= (and b!147441 res!123363) b!147440))

(declare-fun m!228221 () Bool)

(assert (=> b!147442 m!228221))

(assert (=> b!147442 m!226655))

(declare-fun m!228223 () Bool)

(assert (=> b!147443 m!228223))

(declare-fun m!228225 () Bool)

(assert (=> b!147440 m!228225))

(declare-fun m!228227 () Bool)

(assert (=> b!147444 m!228227))

(declare-fun m!228229 () Bool)

(assert (=> b!147441 m!228229))

(declare-fun m!228231 () Bool)

(assert (=> b!147441 m!228231))

(declare-fun m!228233 () Bool)

(assert (=> b!147441 m!228233))

(declare-fun m!228235 () Bool)

(assert (=> b!147441 m!228235))

(declare-fun m!228237 () Bool)

(assert (=> d!47798 m!228237))

(assert (=> d!47457 d!47798))

(declare-fun d!47800 () Bool)

(declare-fun res!123365 () Bool)

(declare-fun e!98330 () Bool)

(assert (=> d!47800 (=> res!123365 e!98330)))

(assert (=> d!47800 (= res!123365 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!47800 (= (arrayRangesEq!321 (_2!6906 lt!227967) (_2!6906 lt!227960) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!98330)))

(declare-fun b!147445 () Bool)

(declare-fun e!98331 () Bool)

(assert (=> b!147445 (= e!98330 e!98331)))

(declare-fun res!123366 () Bool)

(assert (=> b!147445 (=> (not res!123366) (not e!98331))))

(assert (=> b!147445 (= res!123366 (= (select (arr!3759 (_2!6906 lt!227967)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3759 (_2!6906 lt!227960)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!147446 () Bool)

(assert (=> b!147446 (= e!98331 (arrayRangesEq!321 (_2!6906 lt!227967) (_2!6906 lt!227960) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!47800 (not res!123365)) b!147445))

(assert (= (and b!147445 res!123366) b!147446))

(assert (=> b!147445 m!228049))

(declare-fun m!228239 () Bool)

(assert (=> b!147445 m!228239))

(declare-fun m!228241 () Bool)

(assert (=> b!147446 m!228241))

(assert (=> b!147062 d!47800))

(assert (=> d!47506 d!47508))

(declare-fun d!47802 () Bool)

(declare-fun res!123367 () Bool)

(declare-fun e!98332 () Bool)

(assert (=> d!47802 (=> (not res!123367) (not e!98332))))

(assert (=> d!47802 (= res!123367 (= (size!3005 (buf!3460 (_2!6903 lt!227980))) (size!3005 (buf!3460 (_2!6903 lt!227980)))))))

(assert (=> d!47802 (= (isPrefixOf!0 (_2!6903 lt!227980) (_2!6903 lt!227980)) e!98332)))

(declare-fun b!147447 () Bool)

(declare-fun res!123369 () Bool)

(assert (=> b!147447 (=> (not res!123369) (not e!98332))))

(assert (=> b!147447 (= res!123369 (bvsle (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!227980))) (currentByte!6362 (_2!6903 lt!227980)) (currentBit!6357 (_2!6903 lt!227980))) (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!227980))) (currentByte!6362 (_2!6903 lt!227980)) (currentBit!6357 (_2!6903 lt!227980)))))))

(declare-fun b!147448 () Bool)

(declare-fun e!98333 () Bool)

(assert (=> b!147448 (= e!98332 e!98333)))

(declare-fun res!123368 () Bool)

(assert (=> b!147448 (=> res!123368 e!98333)))

(assert (=> b!147448 (= res!123368 (= (size!3005 (buf!3460 (_2!6903 lt!227980))) #b00000000000000000000000000000000))))

(declare-fun b!147449 () Bool)

(assert (=> b!147449 (= e!98333 (arrayBitRangesEq!0 (buf!3460 (_2!6903 lt!227980)) (buf!3460 (_2!6903 lt!227980)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!227980))) (currentByte!6362 (_2!6903 lt!227980)) (currentBit!6357 (_2!6903 lt!227980)))))))

(assert (= (and d!47802 res!123367) b!147447))

(assert (= (and b!147447 res!123369) b!147448))

(assert (= (and b!147448 (not res!123368)) b!147449))

(assert (=> b!147447 m!226655))

(assert (=> b!147447 m!226655))

(assert (=> b!147449 m!226655))

(assert (=> b!147449 m!226655))

(declare-fun m!228243 () Bool)

(assert (=> b!147449 m!228243))

(assert (=> d!47506 d!47802))

(declare-fun d!47804 () Bool)

(assert (=> d!47804 (isPrefixOf!0 lt!228747 lt!228747)))

(declare-fun lt!229456 () Unit!9195)

(declare-fun choose!11 (BitStream!5268) Unit!9195)

(assert (=> d!47804 (= lt!229456 (choose!11 lt!228747))))

(assert (=> d!47804 (= (lemmaIsPrefixRefl!0 lt!228747) lt!229456)))

(declare-fun bs!11683 () Bool)

(assert (= bs!11683 d!47804))

(assert (=> bs!11683 m!227311))

(declare-fun m!228245 () Bool)

(assert (=> bs!11683 m!228245))

(assert (=> d!47506 d!47804))

(declare-fun d!47806 () Bool)

(declare-fun res!123370 () Bool)

(declare-fun e!98334 () Bool)

(assert (=> d!47806 (=> (not res!123370) (not e!98334))))

(assert (=> d!47806 (= res!123370 (= (size!3005 (buf!3460 lt!228747)) (size!3005 (buf!3460 lt!228747))))))

(assert (=> d!47806 (= (isPrefixOf!0 lt!228747 lt!228747) e!98334)))

(declare-fun b!147450 () Bool)

(declare-fun res!123372 () Bool)

(assert (=> b!147450 (=> (not res!123372) (not e!98334))))

(assert (=> b!147450 (= res!123372 (bvsle (bitIndex!0 (size!3005 (buf!3460 lt!228747)) (currentByte!6362 lt!228747) (currentBit!6357 lt!228747)) (bitIndex!0 (size!3005 (buf!3460 lt!228747)) (currentByte!6362 lt!228747) (currentBit!6357 lt!228747))))))

(declare-fun b!147451 () Bool)

(declare-fun e!98335 () Bool)

(assert (=> b!147451 (= e!98334 e!98335)))

(declare-fun res!123371 () Bool)

(assert (=> b!147451 (=> res!123371 e!98335)))

(assert (=> b!147451 (= res!123371 (= (size!3005 (buf!3460 lt!228747)) #b00000000000000000000000000000000))))

(declare-fun b!147452 () Bool)

(assert (=> b!147452 (= e!98335 (arrayBitRangesEq!0 (buf!3460 lt!228747) (buf!3460 lt!228747) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3005 (buf!3460 lt!228747)) (currentByte!6362 lt!228747) (currentBit!6357 lt!228747))))))

(assert (= (and d!47806 res!123370) b!147450))

(assert (= (and b!147450 res!123372) b!147451))

(assert (= (and b!147451 (not res!123371)) b!147452))

(declare-fun m!228247 () Bool)

(assert (=> b!147450 m!228247))

(assert (=> b!147450 m!228247))

(assert (=> b!147452 m!228247))

(assert (=> b!147452 m!228247))

(declare-fun m!228249 () Bool)

(assert (=> b!147452 m!228249))

(assert (=> d!47506 d!47806))

(declare-fun d!47808 () Bool)

(declare-fun res!123373 () Bool)

(declare-fun e!98336 () Bool)

(assert (=> d!47808 (=> (not res!123373) (not e!98336))))

(assert (=> d!47808 (= res!123373 (= (size!3005 (buf!3460 (_2!6903 lt!227961))) (size!3005 (buf!3460 (_2!6903 lt!227961)))))))

(assert (=> d!47808 (= (isPrefixOf!0 (_2!6903 lt!227961) (_2!6903 lt!227961)) e!98336)))

(declare-fun b!147453 () Bool)

(declare-fun res!123375 () Bool)

(assert (=> b!147453 (=> (not res!123375) (not e!98336))))

(assert (=> b!147453 (= res!123375 (bvsle (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!227961))) (currentByte!6362 (_2!6903 lt!227961)) (currentBit!6357 (_2!6903 lt!227961))) (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!227961))) (currentByte!6362 (_2!6903 lt!227961)) (currentBit!6357 (_2!6903 lt!227961)))))))

(declare-fun b!147454 () Bool)

(declare-fun e!98337 () Bool)

(assert (=> b!147454 (= e!98336 e!98337)))

(declare-fun res!123374 () Bool)

(assert (=> b!147454 (=> res!123374 e!98337)))

(assert (=> b!147454 (= res!123374 (= (size!3005 (buf!3460 (_2!6903 lt!227961))) #b00000000000000000000000000000000))))

(declare-fun b!147455 () Bool)

(assert (=> b!147455 (= e!98337 (arrayBitRangesEq!0 (buf!3460 (_2!6903 lt!227961)) (buf!3460 (_2!6903 lt!227961)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!227961))) (currentByte!6362 (_2!6903 lt!227961)) (currentBit!6357 (_2!6903 lt!227961)))))))

(assert (= (and d!47808 res!123373) b!147453))

(assert (= (and b!147453 res!123375) b!147454))

(assert (= (and b!147454 (not res!123374)) b!147455))

(assert (=> b!147453 m!226653))

(assert (=> b!147453 m!226653))

(assert (=> b!147455 m!226653))

(assert (=> b!147455 m!226653))

(declare-fun m!228251 () Bool)

(assert (=> b!147455 m!228251))

(assert (=> d!47506 d!47808))

(declare-fun d!47810 () Bool)

(assert (=> d!47810 (isPrefixOf!0 (_2!6903 lt!227961) (_2!6903 lt!227961))))

(declare-fun lt!229457 () Unit!9195)

(assert (=> d!47810 (= lt!229457 (choose!11 (_2!6903 lt!227961)))))

(assert (=> d!47810 (= (lemmaIsPrefixRefl!0 (_2!6903 lt!227961)) lt!229457)))

(declare-fun bs!11684 () Bool)

(assert (= bs!11684 d!47810))

(assert (=> bs!11684 m!227245))

(declare-fun m!228253 () Bool)

(assert (=> bs!11684 m!228253))

(assert (=> d!47506 d!47810))

(declare-fun d!47812 () Bool)

(declare-fun res!123376 () Bool)

(declare-fun e!98338 () Bool)

(assert (=> d!47812 (=> (not res!123376) (not e!98338))))

(assert (=> d!47812 (= res!123376 (= (size!3005 (buf!3460 lt!228747)) (size!3005 (buf!3460 (_2!6903 lt!227961)))))))

(assert (=> d!47812 (= (isPrefixOf!0 lt!228747 (_2!6903 lt!227961)) e!98338)))

(declare-fun b!147456 () Bool)

(declare-fun res!123378 () Bool)

(assert (=> b!147456 (=> (not res!123378) (not e!98338))))

(assert (=> b!147456 (= res!123378 (bvsle (bitIndex!0 (size!3005 (buf!3460 lt!228747)) (currentByte!6362 lt!228747) (currentBit!6357 lt!228747)) (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!227961))) (currentByte!6362 (_2!6903 lt!227961)) (currentBit!6357 (_2!6903 lt!227961)))))))

(declare-fun b!147457 () Bool)

(declare-fun e!98339 () Bool)

(assert (=> b!147457 (= e!98338 e!98339)))

(declare-fun res!123377 () Bool)

(assert (=> b!147457 (=> res!123377 e!98339)))

(assert (=> b!147457 (= res!123377 (= (size!3005 (buf!3460 lt!228747)) #b00000000000000000000000000000000))))

(declare-fun b!147458 () Bool)

(assert (=> b!147458 (= e!98339 (arrayBitRangesEq!0 (buf!3460 lt!228747) (buf!3460 (_2!6903 lt!227961)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3005 (buf!3460 lt!228747)) (currentByte!6362 lt!228747) (currentBit!6357 lt!228747))))))

(assert (= (and d!47812 res!123376) b!147456))

(assert (= (and b!147456 res!123378) b!147457))

(assert (= (and b!147457 (not res!123377)) b!147458))

(assert (=> b!147456 m!228247))

(assert (=> b!147456 m!226653))

(assert (=> b!147458 m!228247))

(assert (=> b!147458 m!228247))

(declare-fun m!228255 () Bool)

(assert (=> b!147458 m!228255))

(assert (=> d!47506 d!47812))

(declare-fun d!47814 () Bool)

(declare-fun res!123379 () Bool)

(declare-fun e!98340 () Bool)

(assert (=> d!47814 (=> (not res!123379) (not e!98340))))

(assert (=> d!47814 (= res!123379 (= (size!3005 (buf!3460 (_1!6905 lt!228741))) (size!3005 (buf!3460 (_2!6905 lt!228741)))))))

(assert (=> d!47814 (= (isPrefixOf!0 (_1!6905 lt!228741) (_2!6905 lt!228741)) e!98340)))

(declare-fun b!147459 () Bool)

(declare-fun res!123381 () Bool)

(assert (=> b!147459 (=> (not res!123381) (not e!98340))))

(assert (=> b!147459 (= res!123381 (bvsle (bitIndex!0 (size!3005 (buf!3460 (_1!6905 lt!228741))) (currentByte!6362 (_1!6905 lt!228741)) (currentBit!6357 (_1!6905 lt!228741))) (bitIndex!0 (size!3005 (buf!3460 (_2!6905 lt!228741))) (currentByte!6362 (_2!6905 lt!228741)) (currentBit!6357 (_2!6905 lt!228741)))))))

(declare-fun b!147460 () Bool)

(declare-fun e!98341 () Bool)

(assert (=> b!147460 (= e!98340 e!98341)))

(declare-fun res!123380 () Bool)

(assert (=> b!147460 (=> res!123380 e!98341)))

(assert (=> b!147460 (= res!123380 (= (size!3005 (buf!3460 (_1!6905 lt!228741))) #b00000000000000000000000000000000))))

(declare-fun b!147461 () Bool)

(assert (=> b!147461 (= e!98341 (arrayBitRangesEq!0 (buf!3460 (_1!6905 lt!228741)) (buf!3460 (_2!6905 lt!228741)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3005 (buf!3460 (_1!6905 lt!228741))) (currentByte!6362 (_1!6905 lt!228741)) (currentBit!6357 (_1!6905 lt!228741)))))))

(assert (= (and d!47814 res!123379) b!147459))

(assert (= (and b!147459 res!123381) b!147460))

(assert (= (and b!147460 (not res!123380)) b!147461))

(assert (=> b!147459 m!228181))

(assert (=> b!147459 m!228085))

(assert (=> b!147461 m!228181))

(assert (=> b!147461 m!228181))

(declare-fun m!228257 () Bool)

(assert (=> b!147461 m!228257))

(assert (=> d!47506 d!47814))

(declare-fun d!47816 () Bool)

(assert (=> d!47816 (isPrefixOf!0 (_2!6903 lt!227980) (_2!6903 lt!227980))))

(declare-fun lt!229458 () Unit!9195)

(assert (=> d!47816 (= lt!229458 (choose!11 (_2!6903 lt!227980)))))

(assert (=> d!47816 (= (lemmaIsPrefixRefl!0 (_2!6903 lt!227980)) lt!229458)))

(declare-fun bs!11685 () Bool)

(assert (= bs!11685 d!47816))

(assert (=> bs!11685 m!227303))

(declare-fun m!228259 () Bool)

(assert (=> bs!11685 m!228259))

(assert (=> d!47506 d!47816))

(declare-fun d!47818 () Bool)

(assert (=> d!47818 (isPrefixOf!0 lt!228747 (_2!6903 lt!227961))))

(declare-fun lt!229459 () Unit!9195)

(assert (=> d!47818 (= lt!229459 (choose!30 lt!228747 (_2!6903 lt!227961) (_2!6903 lt!227961)))))

(assert (=> d!47818 (isPrefixOf!0 lt!228747 (_2!6903 lt!227961))))

(assert (=> d!47818 (= (lemmaIsPrefixTransitive!0 lt!228747 (_2!6903 lt!227961) (_2!6903 lt!227961)) lt!229459)))

(declare-fun bs!11686 () Bool)

(assert (= bs!11686 d!47818))

(assert (=> bs!11686 m!227313))

(declare-fun m!228261 () Bool)

(assert (=> bs!11686 m!228261))

(assert (=> bs!11686 m!227313))

(assert (=> d!47506 d!47818))

(declare-fun d!47820 () Bool)

(assert (=> d!47820 (isPrefixOf!0 lt!228747 (_2!6903 lt!227961))))

(declare-fun lt!229460 () Unit!9195)

(assert (=> d!47820 (= lt!229460 (choose!30 lt!228747 (_2!6903 lt!227980) (_2!6903 lt!227961)))))

(assert (=> d!47820 (isPrefixOf!0 lt!228747 (_2!6903 lt!227980))))

(assert (=> d!47820 (= (lemmaIsPrefixTransitive!0 lt!228747 (_2!6903 lt!227980) (_2!6903 lt!227961)) lt!229460)))

(declare-fun bs!11687 () Bool)

(assert (= bs!11687 d!47820))

(assert (=> bs!11687 m!227313))

(declare-fun m!228263 () Bool)

(assert (=> bs!11687 m!228263))

(declare-fun m!228265 () Bool)

(assert (=> bs!11687 m!228265))

(assert (=> d!47506 d!47820))

(declare-fun b!147462 () Bool)

(declare-fun lt!229479 () tuple3!574)

(declare-fun e!98342 () Bool)

(assert (=> b!147462 (= e!98342 (= (select (arr!3759 (_3!356 lt!229479)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6904 (readBytePure!0 (_1!6905 lt!227963)))))))

(assert (=> b!147462 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!3005 (_3!356 lt!229479))))))

(declare-fun lt!229496 () (_ BitVec 32))

(declare-fun lt!229493 () array!6640)

(declare-fun call!1991 () Bool)

(declare-fun lt!229471 () (_ BitVec 32))

(declare-fun lt!229486 () tuple3!574)

(declare-fun lt!229462 () array!6640)

(declare-fun bm!1988 () Bool)

(declare-fun c!7991 () Bool)

(assert (=> bm!1988 (= call!1991 (arrayRangesEq!321 (ite c!7991 arr!237 lt!229493) (ite c!7991 (_3!356 lt!229486) lt!229462) (ite c!7991 #b00000000000000000000000000000000 lt!229496) (ite c!7991 (bvadd #b00000000000000000000000000000001 from!447) lt!229471)))))

(declare-fun b!147463 () Bool)

(declare-fun e!98344 () tuple3!574)

(declare-fun lt!229467 () Unit!9195)

(assert (=> b!147463 (= e!98344 (tuple3!575 lt!229467 (_2!6915 lt!229486) (_3!356 lt!229486)))))

(declare-fun lt!229492 () tuple2!13118)

(assert (=> b!147463 (= lt!229492 (readByte!0 (_1!6905 lt!227963)))))

(declare-fun lt!229481 () array!6640)

(assert (=> b!147463 (= lt!229481 (array!6641 (store (arr!3759 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6916 lt!229492)) (size!3005 arr!237)))))

(declare-fun lt!229482 () (_ BitVec 64))

(assert (=> b!147463 (= lt!229482 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!229465 () (_ BitVec 32))

(assert (=> b!147463 (= lt!229465 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!229483 () Unit!9195)

(assert (=> b!147463 (= lt!229483 (validateOffsetBytesFromBitIndexLemma!0 (_1!6905 lt!227963) (_2!6916 lt!229492) lt!229482 lt!229465))))

(assert (=> b!147463 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6916 lt!229492)))) ((_ sign_extend 32) (currentByte!6362 (_2!6916 lt!229492))) ((_ sign_extend 32) (currentBit!6357 (_2!6916 lt!229492))) (bvsub lt!229465 ((_ extract 31 0) (bvsdiv (bvadd lt!229482 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!229477 () Unit!9195)

(assert (=> b!147463 (= lt!229477 lt!229483)))

(assert (=> b!147463 (= lt!229486 (readByteArrayLoop!0 (_2!6916 lt!229492) lt!229481 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(declare-fun call!1992 () (_ BitVec 64))

(assert (=> b!147463 (= call!1992 (bvadd (bitIndex!0 (size!3005 (buf!3460 (_1!6905 lt!227963))) (currentByte!6362 (_1!6905 lt!227963)) (currentBit!6357 (_1!6905 lt!227963))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!229489 () Unit!9195)

(declare-fun Unit!9280 () Unit!9195)

(assert (=> b!147463 (= lt!229489 Unit!9280)))

(assert (=> b!147463 (= (bvadd call!1992 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3005 (buf!3460 (_2!6915 lt!229486))) (currentByte!6362 (_2!6915 lt!229486)) (currentBit!6357 (_2!6915 lt!229486))))))

(declare-fun lt!229488 () Unit!9195)

(declare-fun Unit!9281 () Unit!9195)

(assert (=> b!147463 (= lt!229488 Unit!9281)))

(assert (=> b!147463 (= (bvadd (bitIndex!0 (size!3005 (buf!3460 (_1!6905 lt!227963))) (currentByte!6362 (_1!6905 lt!227963)) (currentBit!6357 (_1!6905 lt!227963))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3005 (buf!3460 (_2!6915 lt!229486))) (currentByte!6362 (_2!6915 lt!229486)) (currentBit!6357 (_2!6915 lt!229486))))))

(declare-fun lt!229495 () Unit!9195)

(declare-fun Unit!9282 () Unit!9195)

(assert (=> b!147463 (= lt!229495 Unit!9282)))

(assert (=> b!147463 (and (= (buf!3460 (_1!6905 lt!227963)) (buf!3460 (_2!6915 lt!229486))) (= (size!3005 arr!237) (size!3005 (_3!356 lt!229486))))))

(declare-fun lt!229472 () Unit!9195)

(declare-fun Unit!9283 () Unit!9195)

(assert (=> b!147463 (= lt!229472 Unit!9283)))

(declare-fun lt!229491 () Unit!9195)

(assert (=> b!147463 (= lt!229491 (arrayUpdatedAtPrefixLemma!13 arr!237 (bvadd #b00000000000000000000000000000001 from!447) (_1!6916 lt!229492)))))

(declare-fun call!1993 () Bool)

(assert (=> b!147463 call!1993))

(declare-fun lt!229466 () Unit!9195)

(assert (=> b!147463 (= lt!229466 lt!229491)))

(declare-fun lt!229490 () (_ BitVec 32))

(assert (=> b!147463 (= lt!229490 #b00000000000000000000000000000000)))

(declare-fun lt!229470 () Unit!9195)

(assert (=> b!147463 (= lt!229470 (arrayRangesEqTransitive!53 arr!237 lt!229481 (_3!356 lt!229486) lt!229490 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!147463 (arrayRangesEq!321 arr!237 (_3!356 lt!229486) lt!229490 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!229484 () Unit!9195)

(assert (=> b!147463 (= lt!229484 lt!229470)))

(assert (=> b!147463 call!1991))

(declare-fun lt!229461 () Unit!9195)

(declare-fun Unit!9284 () Unit!9195)

(assert (=> b!147463 (= lt!229461 Unit!9284)))

(declare-fun lt!229469 () Unit!9195)

(assert (=> b!147463 (= lt!229469 (arrayRangesEqImpliesEq!13 lt!229481 (_3!356 lt!229486) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!147463 (= (select (store (arr!3759 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6916 lt!229492)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3759 (_3!356 lt!229486)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!229473 () Unit!9195)

(assert (=> b!147463 (= lt!229473 lt!229469)))

(declare-fun lt!229480 () Bool)

(assert (=> b!147463 (= lt!229480 (= (select (arr!3759 (_3!356 lt!229486)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6916 lt!229492)))))

(declare-fun Unit!9285 () Unit!9195)

(assert (=> b!147463 (= lt!229467 Unit!9285)))

(assert (=> b!147463 lt!229480))

(declare-fun bm!1989 () Bool)

(assert (=> bm!1989 (= call!1993 (arrayRangesEq!321 arr!237 (ite c!7991 (array!6641 (store (arr!3759 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6916 lt!229492)) (size!3005 arr!237)) arr!237) #b00000000000000000000000000000000 (ite c!7991 (bvadd #b00000000000000000000000000000001 from!447) (size!3005 arr!237))))))

(declare-fun d!47822 () Bool)

(assert (=> d!47822 e!98342))

(declare-fun res!123382 () Bool)

(assert (=> d!47822 (=> res!123382 e!98342)))

(assert (=> d!47822 (= res!123382 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!229468 () Bool)

(declare-fun e!98343 () Bool)

(assert (=> d!47822 (= lt!229468 e!98343)))

(declare-fun res!123384 () Bool)

(assert (=> d!47822 (=> (not res!123384) (not e!98343))))

(declare-fun lt!229478 () (_ BitVec 64))

(declare-fun lt!229474 () (_ BitVec 64))

(assert (=> d!47822 (= res!123384 (= (bvadd lt!229478 lt!229474) (bitIndex!0 (size!3005 (buf!3460 (_2!6915 lt!229479))) (currentByte!6362 (_2!6915 lt!229479)) (currentBit!6357 (_2!6915 lt!229479)))))))

(assert (=> d!47822 (or (not (= (bvand lt!229478 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!229474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!229478 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!229478 lt!229474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!229463 () (_ BitVec 64))

(assert (=> d!47822 (= lt!229474 (bvmul lt!229463 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!47822 (or (= lt!229463 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!229463 #b0000000000000000000000000000000000000000000000000000000000001000) lt!229463)))))

(assert (=> d!47822 (= lt!229463 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!47822 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!47822 (= lt!229478 (bitIndex!0 (size!3005 (buf!3460 (_1!6905 lt!227963))) (currentByte!6362 (_1!6905 lt!227963)) (currentBit!6357 (_1!6905 lt!227963))))))

(assert (=> d!47822 (= lt!229479 e!98344)))

(assert (=> d!47822 (= c!7991 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!47822 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3005 arr!237)))))

(assert (=> d!47822 (= (readByteArrayLoop!0 (_1!6905 lt!227963) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!229479)))

(declare-fun bm!1990 () Bool)

(assert (=> bm!1990 (= call!1992 (bitIndex!0 (ite c!7991 (size!3005 (buf!3460 (_2!6916 lt!229492))) (size!3005 (buf!3460 (_1!6905 lt!227963)))) (ite c!7991 (currentByte!6362 (_2!6916 lt!229492)) (currentByte!6362 (_1!6905 lt!227963))) (ite c!7991 (currentBit!6357 (_2!6916 lt!229492)) (currentBit!6357 (_1!6905 lt!227963)))))))

(declare-fun b!147464 () Bool)

(assert (=> b!147464 (= e!98343 (arrayRangesEq!321 arr!237 (_3!356 lt!229479) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun b!147465 () Bool)

(declare-fun res!123383 () Bool)

(assert (=> b!147465 (=> (not res!123383) (not e!98343))))

(assert (=> b!147465 (= res!123383 (and (= (buf!3460 (_1!6905 lt!227963)) (buf!3460 (_2!6915 lt!229479))) (= (size!3005 arr!237) (size!3005 (_3!356 lt!229479)))))))

(declare-fun b!147466 () Bool)

(declare-fun lt!229475 () Unit!9195)

(assert (=> b!147466 (= e!98344 (tuple3!575 lt!229475 (_1!6905 lt!227963) arr!237))))

(assert (=> b!147466 (= call!1992 call!1992)))

(declare-fun lt!229494 () Unit!9195)

(declare-fun Unit!9286 () Unit!9195)

(assert (=> b!147466 (= lt!229494 Unit!9286)))

(declare-fun lt!229487 () Unit!9195)

(assert (=> b!147466 (= lt!229487 (arrayRangesEqReflexiveLemma!13 arr!237))))

(assert (=> b!147466 call!1993))

(declare-fun lt!229464 () Unit!9195)

(assert (=> b!147466 (= lt!229464 lt!229487)))

(assert (=> b!147466 (= lt!229493 arr!237)))

(assert (=> b!147466 (= lt!229462 arr!237)))

(declare-fun lt!229476 () (_ BitVec 32))

(assert (=> b!147466 (= lt!229476 #b00000000000000000000000000000000)))

(declare-fun lt!229485 () (_ BitVec 32))

(assert (=> b!147466 (= lt!229485 (size!3005 arr!237))))

(assert (=> b!147466 (= lt!229496 #b00000000000000000000000000000000)))

(assert (=> b!147466 (= lt!229471 (bvadd #b00000000000000000000000000000001 from!447))))

(assert (=> b!147466 (= lt!229475 (arrayRangesEqSlicedLemma!13 lt!229493 lt!229462 lt!229476 lt!229485 lt!229496 lt!229471))))

(assert (=> b!147466 call!1991))

(assert (= (and d!47822 c!7991) b!147463))

(assert (= (and d!47822 (not c!7991)) b!147466))

(assert (= (or b!147463 b!147466) bm!1988))

(assert (= (or b!147463 b!147466) bm!1989))

(assert (= (or b!147463 b!147466) bm!1990))

(assert (= (and d!47822 res!123384) b!147465))

(assert (= (and b!147465 res!123383) b!147464))

(assert (= (and d!47822 (not res!123382)) b!147462))

(declare-fun m!228267 () Bool)

(assert (=> b!147466 m!228267))

(declare-fun m!228269 () Bool)

(assert (=> b!147466 m!228269))

(declare-fun m!228271 () Bool)

(assert (=> bm!1989 m!228271))

(declare-fun m!228273 () Bool)

(assert (=> bm!1989 m!228273))

(declare-fun m!228275 () Bool)

(assert (=> b!147462 m!228275))

(declare-fun m!228277 () Bool)

(assert (=> b!147462 m!228277))

(declare-fun m!228279 () Bool)

(assert (=> d!47822 m!228279))

(declare-fun m!228281 () Bool)

(assert (=> d!47822 m!228281))

(declare-fun m!228283 () Bool)

(assert (=> bm!1990 m!228283))

(declare-fun m!228285 () Bool)

(assert (=> b!147464 m!228285))

(assert (=> b!147463 m!228271))

(declare-fun m!228287 () Bool)

(assert (=> b!147463 m!228287))

(declare-fun m!228289 () Bool)

(assert (=> b!147463 m!228289))

(declare-fun m!228291 () Bool)

(assert (=> b!147463 m!228291))

(declare-fun m!228293 () Bool)

(assert (=> b!147463 m!228293))

(declare-fun m!228295 () Bool)

(assert (=> b!147463 m!228295))

(declare-fun m!228297 () Bool)

(assert (=> b!147463 m!228297))

(declare-fun m!228299 () Bool)

(assert (=> b!147463 m!228299))

(declare-fun m!228301 () Bool)

(assert (=> b!147463 m!228301))

(declare-fun m!228303 () Bool)

(assert (=> b!147463 m!228303))

(assert (=> b!147463 m!228281))

(declare-fun m!228305 () Bool)

(assert (=> b!147463 m!228305))

(declare-fun m!228307 () Bool)

(assert (=> b!147463 m!228307))

(declare-fun m!228309 () Bool)

(assert (=> bm!1988 m!228309))

(assert (=> d!47520 d!47822))

(declare-fun d!47824 () Bool)

(declare-fun lt!229500 () (_ BitVec 8))

(declare-fun lt!229503 () (_ BitVec 8))

(assert (=> d!47824 (= lt!229500 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3759 (buf!3460 lt!227979)) (currentByte!6362 lt!227979))) ((_ sign_extend 24) lt!229503))))))

(assert (=> d!47824 (= lt!229503 ((_ extract 7 0) (currentBit!6357 lt!227979)))))

(declare-fun e!98345 () Bool)

(assert (=> d!47824 e!98345))

(declare-fun res!123385 () Bool)

(assert (=> d!47824 (=> (not res!123385) (not e!98345))))

(assert (=> d!47824 (= res!123385 (validate_offset_bits!1 ((_ sign_extend 32) (size!3005 (buf!3460 lt!227979))) ((_ sign_extend 32) (currentByte!6362 lt!227979)) ((_ sign_extend 32) (currentBit!6357 lt!227979)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!9287 () Unit!9195)

(declare-fun Unit!9288 () Unit!9195)

(assert (=> d!47824 (= (readByte!0 lt!227979) (tuple2!13119 (_2!6920 (ite (bvsgt ((_ sign_extend 24) lt!229503) #b00000000000000000000000000000000) (tuple2!13123 Unit!9287 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!229500) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3759 (buf!3460 lt!227979)) (bvadd (currentByte!6362 lt!227979) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!229503)))))))) (tuple2!13123 Unit!9288 lt!229500))) (BitStream!5269 (buf!3460 lt!227979) (bvadd (currentByte!6362 lt!227979) #b00000000000000000000000000000001) (currentBit!6357 lt!227979))))))

(declare-fun b!147467 () Bool)

(declare-fun e!98346 () Bool)

(assert (=> b!147467 (= e!98345 e!98346)))

(declare-fun res!123386 () Bool)

(assert (=> b!147467 (=> (not res!123386) (not e!98346))))

(declare-fun lt!229499 () tuple2!13118)

(assert (=> b!147467 (= res!123386 (= (buf!3460 (_2!6916 lt!229499)) (buf!3460 lt!227979)))))

(declare-fun lt!229502 () (_ BitVec 8))

(declare-fun lt!229497 () (_ BitVec 8))

(declare-fun Unit!9289 () Unit!9195)

(declare-fun Unit!9290 () Unit!9195)

(assert (=> b!147467 (= lt!229499 (tuple2!13119 (_2!6920 (ite (bvsgt ((_ sign_extend 24) lt!229497) #b00000000000000000000000000000000) (tuple2!13123 Unit!9289 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!229502) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3759 (buf!3460 lt!227979)) (bvadd (currentByte!6362 lt!227979) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!229497)))))))) (tuple2!13123 Unit!9290 lt!229502))) (BitStream!5269 (buf!3460 lt!227979) (bvadd (currentByte!6362 lt!227979) #b00000000000000000000000000000001) (currentBit!6357 lt!227979))))))

(assert (=> b!147467 (= lt!229502 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3759 (buf!3460 lt!227979)) (currentByte!6362 lt!227979))) ((_ sign_extend 24) lt!229497))))))

(assert (=> b!147467 (= lt!229497 ((_ extract 7 0) (currentBit!6357 lt!227979)))))

(declare-fun b!147468 () Bool)

(declare-fun lt!229498 () (_ BitVec 64))

(declare-fun lt!229501 () (_ BitVec 64))

(assert (=> b!147468 (= e!98346 (= (bitIndex!0 (size!3005 (buf!3460 (_2!6916 lt!229499))) (currentByte!6362 (_2!6916 lt!229499)) (currentBit!6357 (_2!6916 lt!229499))) (bvadd lt!229498 lt!229501)))))

(assert (=> b!147468 (or (not (= (bvand lt!229498 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!229501 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!229498 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!229498 lt!229501) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!147468 (= lt!229501 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!147468 (= lt!229498 (bitIndex!0 (size!3005 (buf!3460 lt!227979)) (currentByte!6362 lt!227979) (currentBit!6357 lt!227979)))))

(assert (= (and d!47824 res!123385) b!147467))

(assert (= (and b!147467 res!123386) b!147468))

(declare-fun m!228311 () Bool)

(assert (=> d!47824 m!228311))

(declare-fun m!228313 () Bool)

(assert (=> d!47824 m!228313))

(declare-fun m!228315 () Bool)

(assert (=> d!47824 m!228315))

(assert (=> b!147467 m!228315))

(assert (=> b!147467 m!228311))

(declare-fun m!228317 () Bool)

(assert (=> b!147468 m!228317))

(declare-fun m!228319 () Bool)

(assert (=> b!147468 m!228319))

(assert (=> d!47475 d!47824))

(declare-fun b!147469 () Bool)

(declare-fun e!98348 () Bool)

(declare-fun call!1994 () Bool)

(assert (=> b!147469 (= e!98348 call!1994)))

(declare-fun b!147470 () Bool)

(declare-fun e!98349 () Bool)

(declare-fun e!98351 () Bool)

(assert (=> b!147470 (= e!98349 e!98351)))

(declare-fun res!123391 () Bool)

(declare-fun lt!229505 () (_ BitVec 32))

(declare-fun lt!229506 () tuple4!140)

(assert (=> b!147470 (= res!123391 (byteRangesEq!0 (select (arr!3759 (buf!3460 thiss!1634)) (_3!358 lt!229506)) (select (arr!3759 (buf!3460 (_2!6903 lt!227980))) (_3!358 lt!229506)) lt!229505 #b00000000000000000000000000001000))))

(assert (=> b!147470 (=> (not res!123391) (not e!98351))))

(declare-fun b!147471 () Bool)

(assert (=> b!147471 (= e!98349 call!1994)))

(declare-fun b!147472 () Bool)

(declare-fun e!98347 () Bool)

(declare-fun e!98350 () Bool)

(assert (=> b!147472 (= e!98347 e!98350)))

(declare-fun res!123388 () Bool)

(assert (=> b!147472 (=> (not res!123388) (not e!98350))))

(declare-fun e!98352 () Bool)

(assert (=> b!147472 (= res!123388 e!98352)))

(declare-fun res!123389 () Bool)

(assert (=> b!147472 (=> res!123389 e!98352)))

(assert (=> b!147472 (= res!123389 (bvsge (_1!6919 lt!229506) (_2!6919 lt!229506)))))

(declare-fun lt!229504 () (_ BitVec 32))

(assert (=> b!147472 (= lt!229504 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3005 (buf!3460 thiss!1634)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!147472 (= lt!229505 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!147472 (= lt!229506 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3005 (buf!3460 thiss!1634)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634))))))

(declare-fun b!147473 () Bool)

(assert (=> b!147473 (= e!98352 (arrayRangesEq!321 (buf!3460 thiss!1634) (buf!3460 (_2!6903 lt!227980)) (_1!6919 lt!229506) (_2!6919 lt!229506)))))

(declare-fun b!147474 () Bool)

(assert (=> b!147474 (= e!98350 e!98349)))

(declare-fun c!7992 () Bool)

(assert (=> b!147474 (= c!7992 (= (_3!358 lt!229506) (_4!70 lt!229506)))))

(declare-fun b!147475 () Bool)

(declare-fun res!123387 () Bool)

(assert (=> b!147475 (= res!123387 (= lt!229504 #b00000000000000000000000000000000))))

(assert (=> b!147475 (=> res!123387 e!98348)))

(assert (=> b!147475 (= e!98351 e!98348)))

(declare-fun bm!1991 () Bool)

(assert (=> bm!1991 (= call!1994 (byteRangesEq!0 (ite c!7992 (select (arr!3759 (buf!3460 thiss!1634)) (_3!358 lt!229506)) (select (arr!3759 (buf!3460 thiss!1634)) (_4!70 lt!229506))) (ite c!7992 (select (arr!3759 (buf!3460 (_2!6903 lt!227980))) (_3!358 lt!229506)) (select (arr!3759 (buf!3460 (_2!6903 lt!227980))) (_4!70 lt!229506))) (ite c!7992 lt!229505 #b00000000000000000000000000000000) lt!229504))))

(declare-fun d!47826 () Bool)

(declare-fun res!123390 () Bool)

(assert (=> d!47826 (=> res!123390 e!98347)))

(assert (=> d!47826 (= res!123390 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3005 (buf!3460 thiss!1634)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634))))))

(assert (=> d!47826 (= (arrayBitRangesEq!0 (buf!3460 thiss!1634) (buf!3460 (_2!6903 lt!227980)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3005 (buf!3460 thiss!1634)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634))) e!98347)))

(assert (= (and d!47826 (not res!123390)) b!147472))

(assert (= (and b!147472 (not res!123389)) b!147473))

(assert (= (and b!147472 res!123388) b!147474))

(assert (= (and b!147474 c!7992) b!147471))

(assert (= (and b!147474 (not c!7992)) b!147470))

(assert (= (and b!147470 res!123391) b!147475))

(assert (= (and b!147475 (not res!123387)) b!147469))

(assert (= (or b!147471 b!147469) bm!1991))

(declare-fun m!228321 () Bool)

(assert (=> b!147470 m!228321))

(declare-fun m!228323 () Bool)

(assert (=> b!147470 m!228323))

(assert (=> b!147470 m!228321))

(assert (=> b!147470 m!228323))

(declare-fun m!228325 () Bool)

(assert (=> b!147470 m!228325))

(assert (=> b!147472 m!226661))

(declare-fun m!228327 () Bool)

(assert (=> b!147472 m!228327))

(declare-fun m!228329 () Bool)

(assert (=> b!147473 m!228329))

(declare-fun m!228331 () Bool)

(assert (=> bm!1991 m!228331))

(declare-fun m!228333 () Bool)

(assert (=> bm!1991 m!228333))

(assert (=> bm!1991 m!228321))

(declare-fun m!228335 () Bool)

(assert (=> bm!1991 m!228335))

(assert (=> bm!1991 m!228323))

(assert (=> b!147081 d!47826))

(assert (=> b!147081 d!47453))

(assert (=> b!147079 d!47453))

(assert (=> b!147079 d!47451))

(declare-fun d!47828 () Bool)

(declare-fun res!123392 () Bool)

(declare-fun e!98353 () Bool)

(assert (=> d!47828 (=> (not res!123392) (not e!98353))))

(assert (=> d!47828 (= res!123392 (= (size!3005 (buf!3460 thiss!1634)) (size!3005 (buf!3460 (_2!6903 lt!228624)))))))

(assert (=> d!47828 (= (isPrefixOf!0 thiss!1634 (_2!6903 lt!228624)) e!98353)))

(declare-fun b!147476 () Bool)

(declare-fun res!123394 () Bool)

(assert (=> b!147476 (=> (not res!123394) (not e!98353))))

(assert (=> b!147476 (= res!123394 (bvsle (bitIndex!0 (size!3005 (buf!3460 thiss!1634)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634)) (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!228624))) (currentByte!6362 (_2!6903 lt!228624)) (currentBit!6357 (_2!6903 lt!228624)))))))

(declare-fun b!147477 () Bool)

(declare-fun e!98354 () Bool)

(assert (=> b!147477 (= e!98353 e!98354)))

(declare-fun res!123393 () Bool)

(assert (=> b!147477 (=> res!123393 e!98354)))

(assert (=> b!147477 (= res!123393 (= (size!3005 (buf!3460 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!147478 () Bool)

(assert (=> b!147478 (= e!98354 (arrayBitRangesEq!0 (buf!3460 thiss!1634) (buf!3460 (_2!6903 lt!228624)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3005 (buf!3460 thiss!1634)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634))))))

(assert (= (and d!47828 res!123392) b!147476))

(assert (= (and b!147476 res!123394) b!147477))

(assert (= (and b!147477 (not res!123393)) b!147478))

(assert (=> b!147476 m!226661))

(assert (=> b!147476 m!227221))

(assert (=> b!147478 m!226661))

(assert (=> b!147478 m!226661))

(declare-fun m!228337 () Bool)

(assert (=> b!147478 m!228337))

(assert (=> b!147044 d!47828))

(declare-fun d!47830 () Bool)

(declare-fun res!123395 () Bool)

(declare-fun e!98355 () Bool)

(assert (=> d!47830 (=> (not res!123395) (not e!98355))))

(assert (=> d!47830 (= res!123395 (= (size!3005 (buf!3460 (_2!6905 lt!228762))) (size!3005 (buf!3460 (_2!6903 lt!227980)))))))

(assert (=> d!47830 (= (isPrefixOf!0 (_2!6905 lt!228762) (_2!6903 lt!227980)) e!98355)))

(declare-fun b!147479 () Bool)

(declare-fun res!123397 () Bool)

(assert (=> b!147479 (=> (not res!123397) (not e!98355))))

(assert (=> b!147479 (= res!123397 (bvsle (bitIndex!0 (size!3005 (buf!3460 (_2!6905 lt!228762))) (currentByte!6362 (_2!6905 lt!228762)) (currentBit!6357 (_2!6905 lt!228762))) (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!227980))) (currentByte!6362 (_2!6903 lt!227980)) (currentBit!6357 (_2!6903 lt!227980)))))))

(declare-fun b!147480 () Bool)

(declare-fun e!98356 () Bool)

(assert (=> b!147480 (= e!98355 e!98356)))

(declare-fun res!123396 () Bool)

(assert (=> b!147480 (=> res!123396 e!98356)))

(assert (=> b!147480 (= res!123396 (= (size!3005 (buf!3460 (_2!6905 lt!228762))) #b00000000000000000000000000000000))))

(declare-fun b!147481 () Bool)

(assert (=> b!147481 (= e!98356 (arrayBitRangesEq!0 (buf!3460 (_2!6905 lt!228762)) (buf!3460 (_2!6903 lt!227980)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3005 (buf!3460 (_2!6905 lt!228762))) (currentByte!6362 (_2!6905 lt!228762)) (currentBit!6357 (_2!6905 lt!228762)))))))

(assert (= (and d!47830 res!123395) b!147479))

(assert (= (and b!147479 res!123397) b!147480))

(assert (= (and b!147480 (not res!123396)) b!147481))

(assert (=> b!147479 m!228039))

(assert (=> b!147479 m!226655))

(assert (=> b!147481 m!228039))

(assert (=> b!147481 m!228039))

(declare-fun m!228339 () Bool)

(assert (=> b!147481 m!228339))

(assert (=> b!147085 d!47830))

(assert (=> d!47479 d!47782))

(declare-fun d!47832 () Bool)

(assert (=> d!47832 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!227980)))) ((_ sign_extend 32) (currentByte!6362 (_2!6903 lt!227980))) ((_ sign_extend 32) (currentBit!6357 (_2!6903 lt!227980))) (bvsub (bvsub to!404 from!447) lt!228706)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) lt!228706)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!227980)))) ((_ sign_extend 32) (currentByte!6362 (_2!6903 lt!227980))) ((_ sign_extend 32) (currentBit!6357 (_2!6903 lt!227980)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11688 () Bool)

(assert (= bs!11688 d!47832))

(assert (=> bs!11688 m!227165))

(assert (=> b!147068 d!47832))

(declare-fun d!47834 () Bool)

(assert (=> d!47834 (isPrefixOf!0 lt!228685 (_2!6903 lt!227961))))

(declare-fun lt!229507 () Unit!9195)

(assert (=> d!47834 (= lt!229507 (choose!30 lt!228685 thiss!1634 (_2!6903 lt!227961)))))

(assert (=> d!47834 (isPrefixOf!0 lt!228685 thiss!1634)))

(assert (=> d!47834 (= (lemmaIsPrefixTransitive!0 lt!228685 thiss!1634 (_2!6903 lt!227961)) lt!229507)))

(declare-fun bs!11689 () Bool)

(assert (= bs!11689 d!47834))

(assert (=> bs!11689 m!227249))

(declare-fun m!228341 () Bool)

(assert (=> bs!11689 m!228341))

(declare-fun m!228343 () Bool)

(assert (=> bs!11689 m!228343))

(assert (=> d!47485 d!47834))

(declare-fun d!47836 () Bool)

(declare-fun res!123398 () Bool)

(declare-fun e!98357 () Bool)

(assert (=> d!47836 (=> (not res!123398) (not e!98357))))

(assert (=> d!47836 (= res!123398 (= (size!3005 (buf!3460 lt!228685)) (size!3005 (buf!3460 (_2!6903 lt!227961)))))))

(assert (=> d!47836 (= (isPrefixOf!0 lt!228685 (_2!6903 lt!227961)) e!98357)))

(declare-fun b!147482 () Bool)

(declare-fun res!123400 () Bool)

(assert (=> b!147482 (=> (not res!123400) (not e!98357))))

(assert (=> b!147482 (= res!123400 (bvsle (bitIndex!0 (size!3005 (buf!3460 lt!228685)) (currentByte!6362 lt!228685) (currentBit!6357 lt!228685)) (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!227961))) (currentByte!6362 (_2!6903 lt!227961)) (currentBit!6357 (_2!6903 lt!227961)))))))

(declare-fun b!147483 () Bool)

(declare-fun e!98358 () Bool)

(assert (=> b!147483 (= e!98357 e!98358)))

(declare-fun res!123399 () Bool)

(assert (=> b!147483 (=> res!123399 e!98358)))

(assert (=> b!147483 (= res!123399 (= (size!3005 (buf!3460 lt!228685)) #b00000000000000000000000000000000))))

(declare-fun b!147484 () Bool)

(assert (=> b!147484 (= e!98358 (arrayBitRangesEq!0 (buf!3460 lt!228685) (buf!3460 (_2!6903 lt!227961)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3005 (buf!3460 lt!228685)) (currentByte!6362 lt!228685) (currentBit!6357 lt!228685))))))

(assert (= (and d!47836 res!123398) b!147482))

(assert (= (and b!147482 res!123400) b!147483))

(assert (= (and b!147483 (not res!123399)) b!147484))

(declare-fun m!228345 () Bool)

(assert (=> b!147482 m!228345))

(assert (=> b!147482 m!226653))

(assert (=> b!147484 m!228345))

(assert (=> b!147484 m!228345))

(declare-fun m!228347 () Bool)

(assert (=> b!147484 m!228347))

(assert (=> d!47485 d!47836))

(assert (=> d!47485 d!47810))

(declare-fun d!47838 () Bool)

(declare-fun res!123401 () Bool)

(declare-fun e!98359 () Bool)

(assert (=> d!47838 (=> (not res!123401) (not e!98359))))

(assert (=> d!47838 (= res!123401 (= (size!3005 (buf!3460 thiss!1634)) (size!3005 (buf!3460 thiss!1634))))))

(assert (=> d!47838 (= (isPrefixOf!0 thiss!1634 thiss!1634) e!98359)))

(declare-fun b!147485 () Bool)

(declare-fun res!123403 () Bool)

(assert (=> b!147485 (=> (not res!123403) (not e!98359))))

(assert (=> b!147485 (= res!123403 (bvsle (bitIndex!0 (size!3005 (buf!3460 thiss!1634)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634)) (bitIndex!0 (size!3005 (buf!3460 thiss!1634)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634))))))

(declare-fun b!147486 () Bool)

(declare-fun e!98360 () Bool)

(assert (=> b!147486 (= e!98359 e!98360)))

(declare-fun res!123402 () Bool)

(assert (=> b!147486 (=> res!123402 e!98360)))

(assert (=> b!147486 (= res!123402 (= (size!3005 (buf!3460 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!147487 () Bool)

(assert (=> b!147487 (= e!98360 (arrayBitRangesEq!0 (buf!3460 thiss!1634) (buf!3460 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3005 (buf!3460 thiss!1634)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634))))))

(assert (= (and d!47838 res!123401) b!147485))

(assert (= (and b!147485 res!123403) b!147486))

(assert (= (and b!147486 (not res!123402)) b!147487))

(assert (=> b!147485 m!226661))

(assert (=> b!147485 m!226661))

(assert (=> b!147487 m!226661))

(assert (=> b!147487 m!226661))

(declare-fun m!228349 () Bool)

(assert (=> b!147487 m!228349))

(assert (=> d!47485 d!47838))

(declare-fun d!47840 () Bool)

(assert (=> d!47840 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!229508 () Unit!9195)

(assert (=> d!47840 (= lt!229508 (choose!11 thiss!1634))))

(assert (=> d!47840 (= (lemmaIsPrefixRefl!0 thiss!1634) lt!229508)))

(declare-fun bs!11690 () Bool)

(assert (= bs!11690 d!47840))

(assert (=> bs!11690 m!227237))

(declare-fun m!228351 () Bool)

(assert (=> bs!11690 m!228351))

(assert (=> d!47485 d!47840))

(assert (=> d!47485 d!47461))

(declare-fun d!47842 () Bool)

(declare-fun res!123404 () Bool)

(declare-fun e!98361 () Bool)

(assert (=> d!47842 (=> (not res!123404) (not e!98361))))

(assert (=> d!47842 (= res!123404 (= (size!3005 (buf!3460 (_1!6905 lt!228679))) (size!3005 (buf!3460 (_2!6905 lt!228679)))))))

(assert (=> d!47842 (= (isPrefixOf!0 (_1!6905 lt!228679) (_2!6905 lt!228679)) e!98361)))

(declare-fun b!147488 () Bool)

(declare-fun res!123406 () Bool)

(assert (=> b!147488 (=> (not res!123406) (not e!98361))))

(assert (=> b!147488 (= res!123406 (bvsle (bitIndex!0 (size!3005 (buf!3460 (_1!6905 lt!228679))) (currentByte!6362 (_1!6905 lt!228679)) (currentBit!6357 (_1!6905 lt!228679))) (bitIndex!0 (size!3005 (buf!3460 (_2!6905 lt!228679))) (currentByte!6362 (_2!6905 lt!228679)) (currentBit!6357 (_2!6905 lt!228679)))))))

(declare-fun b!147489 () Bool)

(declare-fun e!98362 () Bool)

(assert (=> b!147489 (= e!98361 e!98362)))

(declare-fun res!123405 () Bool)

(assert (=> b!147489 (=> res!123405 e!98362)))

(assert (=> b!147489 (= res!123405 (= (size!3005 (buf!3460 (_1!6905 lt!228679))) #b00000000000000000000000000000000))))

(declare-fun b!147490 () Bool)

(assert (=> b!147490 (= e!98362 (arrayBitRangesEq!0 (buf!3460 (_1!6905 lt!228679)) (buf!3460 (_2!6905 lt!228679)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3005 (buf!3460 (_1!6905 lt!228679))) (currentByte!6362 (_1!6905 lt!228679)) (currentBit!6357 (_1!6905 lt!228679)))))))

(assert (= (and d!47842 res!123404) b!147488))

(assert (= (and b!147488 res!123406) b!147489))

(assert (= (and b!147489 (not res!123405)) b!147490))

(assert (=> b!147488 m!228217))

(assert (=> b!147488 m!227919))

(assert (=> b!147490 m!228217))

(assert (=> b!147490 m!228217))

(declare-fun m!228353 () Bool)

(assert (=> b!147490 m!228353))

(assert (=> d!47485 d!47842))

(declare-fun d!47844 () Bool)

(assert (=> d!47844 (isPrefixOf!0 lt!228685 lt!228685)))

(declare-fun lt!229509 () Unit!9195)

(assert (=> d!47844 (= lt!229509 (choose!11 lt!228685))))

(assert (=> d!47844 (= (lemmaIsPrefixRefl!0 lt!228685) lt!229509)))

(declare-fun bs!11691 () Bool)

(assert (= bs!11691 d!47844))

(assert (=> bs!11691 m!227247))

(declare-fun m!228355 () Bool)

(assert (=> bs!11691 m!228355))

(assert (=> d!47485 d!47844))

(assert (=> d!47485 d!47808))

(declare-fun d!47846 () Bool)

(declare-fun res!123407 () Bool)

(declare-fun e!98363 () Bool)

(assert (=> d!47846 (=> (not res!123407) (not e!98363))))

(assert (=> d!47846 (= res!123407 (= (size!3005 (buf!3460 lt!228685)) (size!3005 (buf!3460 lt!228685))))))

(assert (=> d!47846 (= (isPrefixOf!0 lt!228685 lt!228685) e!98363)))

(declare-fun b!147491 () Bool)

(declare-fun res!123409 () Bool)

(assert (=> b!147491 (=> (not res!123409) (not e!98363))))

(assert (=> b!147491 (= res!123409 (bvsle (bitIndex!0 (size!3005 (buf!3460 lt!228685)) (currentByte!6362 lt!228685) (currentBit!6357 lt!228685)) (bitIndex!0 (size!3005 (buf!3460 lt!228685)) (currentByte!6362 lt!228685) (currentBit!6357 lt!228685))))))

(declare-fun b!147492 () Bool)

(declare-fun e!98364 () Bool)

(assert (=> b!147492 (= e!98363 e!98364)))

(declare-fun res!123408 () Bool)

(assert (=> b!147492 (=> res!123408 e!98364)))

(assert (=> b!147492 (= res!123408 (= (size!3005 (buf!3460 lt!228685)) #b00000000000000000000000000000000))))

(declare-fun b!147493 () Bool)

(assert (=> b!147493 (= e!98364 (arrayBitRangesEq!0 (buf!3460 lt!228685) (buf!3460 lt!228685) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3005 (buf!3460 lt!228685)) (currentByte!6362 lt!228685) (currentBit!6357 lt!228685))))))

(assert (= (and d!47846 res!123407) b!147491))

(assert (= (and b!147491 res!123409) b!147492))

(assert (= (and b!147492 (not res!123408)) b!147493))

(assert (=> b!147491 m!228345))

(assert (=> b!147491 m!228345))

(assert (=> b!147493 m!228345))

(assert (=> b!147493 m!228345))

(declare-fun m!228357 () Bool)

(assert (=> b!147493 m!228357))

(assert (=> d!47485 d!47846))

(declare-fun d!47848 () Bool)

(assert (=> d!47848 (isPrefixOf!0 lt!228685 (_2!6903 lt!227961))))

(declare-fun lt!229510 () Unit!9195)

(assert (=> d!47848 (= lt!229510 (choose!30 lt!228685 (_2!6903 lt!227961) (_2!6903 lt!227961)))))

(assert (=> d!47848 (isPrefixOf!0 lt!228685 (_2!6903 lt!227961))))

(assert (=> d!47848 (= (lemmaIsPrefixTransitive!0 lt!228685 (_2!6903 lt!227961) (_2!6903 lt!227961)) lt!229510)))

(declare-fun bs!11692 () Bool)

(assert (= bs!11692 d!47848))

(assert (=> bs!11692 m!227249))

(declare-fun m!228359 () Bool)

(assert (=> bs!11692 m!228359))

(assert (=> bs!11692 m!227249))

(assert (=> d!47485 d!47848))

(declare-fun d!47850 () Bool)

(declare-fun res!123410 () Bool)

(declare-fun e!98365 () Bool)

(assert (=> d!47850 (=> (not res!123410) (not e!98365))))

(assert (=> d!47850 (= res!123410 (= (size!3005 (buf!3460 (_1!6905 lt!228762))) (size!3005 (buf!3460 thiss!1634))))))

(assert (=> d!47850 (= (isPrefixOf!0 (_1!6905 lt!228762) thiss!1634) e!98365)))

(declare-fun b!147494 () Bool)

(declare-fun res!123412 () Bool)

(assert (=> b!147494 (=> (not res!123412) (not e!98365))))

(assert (=> b!147494 (= res!123412 (bvsle (bitIndex!0 (size!3005 (buf!3460 (_1!6905 lt!228762))) (currentByte!6362 (_1!6905 lt!228762)) (currentBit!6357 (_1!6905 lt!228762))) (bitIndex!0 (size!3005 (buf!3460 thiss!1634)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634))))))

(declare-fun b!147495 () Bool)

(declare-fun e!98366 () Bool)

(assert (=> b!147495 (= e!98365 e!98366)))

(declare-fun res!123411 () Bool)

(assert (=> b!147495 (=> res!123411 e!98366)))

(assert (=> b!147495 (= res!123411 (= (size!3005 (buf!3460 (_1!6905 lt!228762))) #b00000000000000000000000000000000))))

(declare-fun b!147496 () Bool)

(assert (=> b!147496 (= e!98366 (arrayBitRangesEq!0 (buf!3460 (_1!6905 lt!228762)) (buf!3460 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3005 (buf!3460 (_1!6905 lt!228762))) (currentByte!6362 (_1!6905 lt!228762)) (currentBit!6357 (_1!6905 lt!228762)))))))

(assert (= (and d!47850 res!123410) b!147494))

(assert (= (and b!147494 res!123412) b!147495))

(assert (= (and b!147495 (not res!123411)) b!147496))

(declare-fun m!228361 () Bool)

(assert (=> b!147494 m!228361))

(assert (=> b!147494 m!226661))

(assert (=> b!147496 m!228361))

(assert (=> b!147496 m!228361))

(declare-fun m!228363 () Bool)

(assert (=> b!147496 m!228363))

(assert (=> b!147082 d!47850))

(declare-fun d!47852 () Bool)

(assert (=> d!47852 (= (remainingBits!0 ((_ sign_extend 32) (size!3005 (buf!3460 (_1!6904 lt!227965)))) ((_ sign_extend 32) (currentByte!6362 (_1!6904 lt!227965))) ((_ sign_extend 32) (currentBit!6357 (_1!6904 lt!227965)))) (bvsub (bvmul ((_ sign_extend 32) (size!3005 (buf!3460 (_1!6904 lt!227965)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6362 (_1!6904 lt!227965))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6357 (_1!6904 lt!227965))))))))

(assert (=> d!47471 d!47852))

(declare-fun d!47854 () Bool)

(assert (=> d!47854 (= (invariant!0 (currentBit!6357 (_1!6904 lt!227965)) (currentByte!6362 (_1!6904 lt!227965)) (size!3005 (buf!3460 (_1!6904 lt!227965)))) (and (bvsge (currentBit!6357 (_1!6904 lt!227965)) #b00000000000000000000000000000000) (bvslt (currentBit!6357 (_1!6904 lt!227965)) #b00000000000000000000000000001000) (bvsge (currentByte!6362 (_1!6904 lt!227965)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6362 (_1!6904 lt!227965)) (size!3005 (buf!3460 (_1!6904 lt!227965)))) (and (= (currentBit!6357 (_1!6904 lt!227965)) #b00000000000000000000000000000000) (= (currentByte!6362 (_1!6904 lt!227965)) (size!3005 (buf!3460 (_1!6904 lt!227965))))))))))

(assert (=> d!47471 d!47854))

(declare-fun d!47856 () Bool)

(declare-fun res!123413 () Bool)

(declare-fun e!98367 () Bool)

(assert (=> d!47856 (=> res!123413 e!98367)))

(assert (=> d!47856 (= res!123413 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!47856 (= (arrayRangesEq!321 arr!237 (_2!6906 lt!227973) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!98367)))

(declare-fun b!147497 () Bool)

(declare-fun e!98368 () Bool)

(assert (=> b!147497 (= e!98367 e!98368)))

(declare-fun res!123414 () Bool)

(assert (=> b!147497 (=> (not res!123414) (not e!98368))))

(assert (=> b!147497 (= res!123414 (= (select (arr!3759 arr!237) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3759 (_2!6906 lt!227973)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!147498 () Bool)

(assert (=> b!147498 (= e!98368 (arrayRangesEq!321 arr!237 (_2!6906 lt!227973) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!47856 (not res!123413)) b!147497))

(assert (= (and b!147497 res!123414) b!147498))

(declare-fun m!228365 () Bool)

(assert (=> b!147497 m!228365))

(declare-fun m!228367 () Bool)

(assert (=> b!147497 m!228367))

(declare-fun m!228369 () Bool)

(assert (=> b!147498 m!228369))

(assert (=> b!146998 d!47856))

(declare-fun d!47858 () Bool)

(declare-fun lt!229514 () (_ BitVec 8))

(declare-fun lt!229517 () (_ BitVec 8))

(assert (=> d!47858 (= lt!229514 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3759 (buf!3460 (BitStream!5269 (buf!3460 (_2!6903 lt!227961)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634)))) (currentByte!6362 (BitStream!5269 (buf!3460 (_2!6903 lt!227961)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634))))) ((_ sign_extend 24) lt!229517))))))

(assert (=> d!47858 (= lt!229517 ((_ extract 7 0) (currentBit!6357 (BitStream!5269 (buf!3460 (_2!6903 lt!227961)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634)))))))

(declare-fun e!98369 () Bool)

(assert (=> d!47858 e!98369))

(declare-fun res!123415 () Bool)

(assert (=> d!47858 (=> (not res!123415) (not e!98369))))

(assert (=> d!47858 (= res!123415 (validate_offset_bits!1 ((_ sign_extend 32) (size!3005 (buf!3460 (BitStream!5269 (buf!3460 (_2!6903 lt!227961)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634))))) ((_ sign_extend 32) (currentByte!6362 (BitStream!5269 (buf!3460 (_2!6903 lt!227961)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634)))) ((_ sign_extend 32) (currentBit!6357 (BitStream!5269 (buf!3460 (_2!6903 lt!227961)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634)))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!9291 () Unit!9195)

(declare-fun Unit!9292 () Unit!9195)

(assert (=> d!47858 (= (readByte!0 (BitStream!5269 (buf!3460 (_2!6903 lt!227961)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634))) (tuple2!13119 (_2!6920 (ite (bvsgt ((_ sign_extend 24) lt!229517) #b00000000000000000000000000000000) (tuple2!13123 Unit!9291 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!229514) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3759 (buf!3460 (BitStream!5269 (buf!3460 (_2!6903 lt!227961)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634)))) (bvadd (currentByte!6362 (BitStream!5269 (buf!3460 (_2!6903 lt!227961)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!229517)))))))) (tuple2!13123 Unit!9292 lt!229514))) (BitStream!5269 (buf!3460 (BitStream!5269 (buf!3460 (_2!6903 lt!227961)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634))) (bvadd (currentByte!6362 (BitStream!5269 (buf!3460 (_2!6903 lt!227961)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634))) #b00000000000000000000000000000001) (currentBit!6357 (BitStream!5269 (buf!3460 (_2!6903 lt!227961)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634))))))))

(declare-fun b!147499 () Bool)

(declare-fun e!98370 () Bool)

(assert (=> b!147499 (= e!98369 e!98370)))

(declare-fun res!123416 () Bool)

(assert (=> b!147499 (=> (not res!123416) (not e!98370))))

(declare-fun lt!229513 () tuple2!13118)

(assert (=> b!147499 (= res!123416 (= (buf!3460 (_2!6916 lt!229513)) (buf!3460 (BitStream!5269 (buf!3460 (_2!6903 lt!227961)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634)))))))

(declare-fun lt!229516 () (_ BitVec 8))

(declare-fun lt!229511 () (_ BitVec 8))

(declare-fun Unit!9293 () Unit!9195)

(declare-fun Unit!9294 () Unit!9195)

(assert (=> b!147499 (= lt!229513 (tuple2!13119 (_2!6920 (ite (bvsgt ((_ sign_extend 24) lt!229511) #b00000000000000000000000000000000) (tuple2!13123 Unit!9293 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!229516) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3759 (buf!3460 (BitStream!5269 (buf!3460 (_2!6903 lt!227961)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634)))) (bvadd (currentByte!6362 (BitStream!5269 (buf!3460 (_2!6903 lt!227961)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!229511)))))))) (tuple2!13123 Unit!9294 lt!229516))) (BitStream!5269 (buf!3460 (BitStream!5269 (buf!3460 (_2!6903 lt!227961)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634))) (bvadd (currentByte!6362 (BitStream!5269 (buf!3460 (_2!6903 lt!227961)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634))) #b00000000000000000000000000000001) (currentBit!6357 (BitStream!5269 (buf!3460 (_2!6903 lt!227961)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634))))))))

(assert (=> b!147499 (= lt!229516 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3759 (buf!3460 (BitStream!5269 (buf!3460 (_2!6903 lt!227961)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634)))) (currentByte!6362 (BitStream!5269 (buf!3460 (_2!6903 lt!227961)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634))))) ((_ sign_extend 24) lt!229511))))))

(assert (=> b!147499 (= lt!229511 ((_ extract 7 0) (currentBit!6357 (BitStream!5269 (buf!3460 (_2!6903 lt!227961)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634)))))))

(declare-fun lt!229515 () (_ BitVec 64))

(declare-fun b!147500 () Bool)

(declare-fun lt!229512 () (_ BitVec 64))

(assert (=> b!147500 (= e!98370 (= (bitIndex!0 (size!3005 (buf!3460 (_2!6916 lt!229513))) (currentByte!6362 (_2!6916 lt!229513)) (currentBit!6357 (_2!6916 lt!229513))) (bvadd lt!229512 lt!229515)))))

(assert (=> b!147500 (or (not (= (bvand lt!229512 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!229515 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!229512 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!229512 lt!229515) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!147500 (= lt!229515 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!147500 (= lt!229512 (bitIndex!0 (size!3005 (buf!3460 (BitStream!5269 (buf!3460 (_2!6903 lt!227961)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634)))) (currentByte!6362 (BitStream!5269 (buf!3460 (_2!6903 lt!227961)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634))) (currentBit!6357 (BitStream!5269 (buf!3460 (_2!6903 lt!227961)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634)))))))

(assert (= (and d!47858 res!123415) b!147499))

(assert (= (and b!147499 res!123416) b!147500))

(declare-fun m!228371 () Bool)

(assert (=> d!47858 m!228371))

(declare-fun m!228373 () Bool)

(assert (=> d!47858 m!228373))

(declare-fun m!228375 () Bool)

(assert (=> d!47858 m!228375))

(assert (=> b!147499 m!228375))

(assert (=> b!147499 m!228371))

(declare-fun m!228377 () Bool)

(assert (=> b!147500 m!228377))

(declare-fun m!228379 () Bool)

(assert (=> b!147500 m!228379))

(assert (=> d!47473 d!47858))

(declare-fun d!47860 () Bool)

(declare-fun e!98371 () Bool)

(assert (=> d!47860 e!98371))

(declare-fun res!123417 () Bool)

(assert (=> d!47860 (=> (not res!123417) (not e!98371))))

(declare-fun lt!229519 () (_ BitVec 64))

(declare-fun lt!229518 () BitStream!5268)

(assert (=> d!47860 (= res!123417 (= (bvadd lt!229519 (bvsub lt!228731 lt!228728)) (bitIndex!0 (size!3005 (buf!3460 lt!229518)) (currentByte!6362 lt!229518) (currentBit!6357 lt!229518))))))

(assert (=> d!47860 (or (not (= (bvand lt!229519 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!228731 lt!228728) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!229519 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!229519 (bvsub lt!228731 lt!228728)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!47860 (= lt!229519 (bitIndex!0 (size!3005 (buf!3460 (_2!6905 lt!228741))) (currentByte!6362 (_2!6905 lt!228741)) (currentBit!6357 (_2!6905 lt!228741))))))

(assert (=> d!47860 (= lt!229518 (_2!6903 (moveBitIndex!0 (_2!6905 lt!228741) (bvsub lt!228731 lt!228728))))))

(assert (=> d!47860 (moveBitIndexPrecond!0 (_2!6905 lt!228741) (bvsub lt!228731 lt!228728))))

(assert (=> d!47860 (= (withMovedBitIndex!0 (_2!6905 lt!228741) (bvsub lt!228731 lt!228728)) lt!229518)))

(declare-fun b!147501 () Bool)

(assert (=> b!147501 (= e!98371 (= (size!3005 (buf!3460 (_2!6905 lt!228741))) (size!3005 (buf!3460 lt!229518))))))

(assert (= (and d!47860 res!123417) b!147501))

(declare-fun m!228381 () Bool)

(assert (=> d!47860 m!228381))

(assert (=> d!47860 m!228085))

(declare-fun m!228383 () Bool)

(assert (=> d!47860 m!228383))

(declare-fun m!228385 () Bool)

(assert (=> d!47860 m!228385))

(assert (=> b!147075 d!47860))

(assert (=> b!147075 d!47449))

(assert (=> b!147075 d!47451))

(assert (=> d!47451 d!47756))

(declare-fun d!47862 () Bool)

(assert (=> d!47862 (= (invariant!0 (currentBit!6357 (_2!6903 lt!227980)) (currentByte!6362 (_2!6903 lt!227980)) (size!3005 (buf!3460 (_2!6903 lt!227980)))) (and (bvsge (currentBit!6357 (_2!6903 lt!227980)) #b00000000000000000000000000000000) (bvslt (currentBit!6357 (_2!6903 lt!227980)) #b00000000000000000000000000001000) (bvsge (currentByte!6362 (_2!6903 lt!227980)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6362 (_2!6903 lt!227980)) (size!3005 (buf!3460 (_2!6903 lt!227980)))) (and (= (currentBit!6357 (_2!6903 lt!227980)) #b00000000000000000000000000000000) (= (currentByte!6362 (_2!6903 lt!227980)) (size!3005 (buf!3460 (_2!6903 lt!227980))))))))))

(assert (=> d!47451 d!47862))

(assert (=> d!47512 d!47788))

(assert (=> d!47518 d!47802))

(assert (=> d!47518 d!47514))

(declare-fun d!47864 () Bool)

(assert (=> d!47864 (isPrefixOf!0 lt!228768 (_2!6903 lt!227980))))

(declare-fun lt!229520 () Unit!9195)

(assert (=> d!47864 (= lt!229520 (choose!30 lt!228768 (_2!6903 lt!227980) (_2!6903 lt!227980)))))

(assert (=> d!47864 (isPrefixOf!0 lt!228768 (_2!6903 lt!227980))))

(assert (=> d!47864 (= (lemmaIsPrefixTransitive!0 lt!228768 (_2!6903 lt!227980) (_2!6903 lt!227980)) lt!229520)))

(declare-fun bs!11693 () Bool)

(assert (= bs!11693 d!47864))

(assert (=> bs!11693 m!227341))

(declare-fun m!228387 () Bool)

(assert (=> bs!11693 m!228387))

(assert (=> bs!11693 m!227341))

(assert (=> d!47518 d!47864))

(declare-fun d!47866 () Bool)

(declare-fun res!123418 () Bool)

(declare-fun e!98372 () Bool)

(assert (=> d!47866 (=> (not res!123418) (not e!98372))))

(assert (=> d!47866 (= res!123418 (= (size!3005 (buf!3460 lt!228768)) (size!3005 (buf!3460 lt!228768))))))

(assert (=> d!47866 (= (isPrefixOf!0 lt!228768 lt!228768) e!98372)))

(declare-fun b!147502 () Bool)

(declare-fun res!123420 () Bool)

(assert (=> b!147502 (=> (not res!123420) (not e!98372))))

(assert (=> b!147502 (= res!123420 (bvsle (bitIndex!0 (size!3005 (buf!3460 lt!228768)) (currentByte!6362 lt!228768) (currentBit!6357 lt!228768)) (bitIndex!0 (size!3005 (buf!3460 lt!228768)) (currentByte!6362 lt!228768) (currentBit!6357 lt!228768))))))

(declare-fun b!147503 () Bool)

(declare-fun e!98373 () Bool)

(assert (=> b!147503 (= e!98372 e!98373)))

(declare-fun res!123419 () Bool)

(assert (=> b!147503 (=> res!123419 e!98373)))

(assert (=> b!147503 (= res!123419 (= (size!3005 (buf!3460 lt!228768)) #b00000000000000000000000000000000))))

(declare-fun b!147504 () Bool)

(assert (=> b!147504 (= e!98373 (arrayBitRangesEq!0 (buf!3460 lt!228768) (buf!3460 lt!228768) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3005 (buf!3460 lt!228768)) (currentByte!6362 lt!228768) (currentBit!6357 lt!228768))))))

(assert (= (and d!47866 res!123418) b!147502))

(assert (= (and b!147502 res!123420) b!147503))

(assert (= (and b!147503 (not res!123419)) b!147504))

(declare-fun m!228389 () Bool)

(assert (=> b!147502 m!228389))

(assert (=> b!147502 m!228389))

(assert (=> b!147504 m!228389))

(assert (=> b!147504 m!228389))

(declare-fun m!228391 () Bool)

(assert (=> b!147504 m!228391))

(assert (=> d!47518 d!47866))

(declare-fun d!47868 () Bool)

(assert (=> d!47868 (isPrefixOf!0 lt!228768 (_2!6903 lt!227980))))

(declare-fun lt!229521 () Unit!9195)

(assert (=> d!47868 (= lt!229521 (choose!30 lt!228768 thiss!1634 (_2!6903 lt!227980)))))

(assert (=> d!47868 (isPrefixOf!0 lt!228768 thiss!1634)))

(assert (=> d!47868 (= (lemmaIsPrefixTransitive!0 lt!228768 thiss!1634 (_2!6903 lt!227980)) lt!229521)))

(declare-fun bs!11694 () Bool)

(assert (= bs!11694 d!47868))

(assert (=> bs!11694 m!227341))

(declare-fun m!228393 () Bool)

(assert (=> bs!11694 m!228393))

(declare-fun m!228395 () Bool)

(assert (=> bs!11694 m!228395))

(assert (=> d!47518 d!47868))

(declare-fun d!47870 () Bool)

(declare-fun res!123421 () Bool)

(declare-fun e!98374 () Bool)

(assert (=> d!47870 (=> (not res!123421) (not e!98374))))

(assert (=> d!47870 (= res!123421 (= (size!3005 (buf!3460 lt!228768)) (size!3005 (buf!3460 (_2!6903 lt!227980)))))))

(assert (=> d!47870 (= (isPrefixOf!0 lt!228768 (_2!6903 lt!227980)) e!98374)))

(declare-fun b!147505 () Bool)

(declare-fun res!123423 () Bool)

(assert (=> b!147505 (=> (not res!123423) (not e!98374))))

(assert (=> b!147505 (= res!123423 (bvsle (bitIndex!0 (size!3005 (buf!3460 lt!228768)) (currentByte!6362 lt!228768) (currentBit!6357 lt!228768)) (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!227980))) (currentByte!6362 (_2!6903 lt!227980)) (currentBit!6357 (_2!6903 lt!227980)))))))

(declare-fun b!147506 () Bool)

(declare-fun e!98375 () Bool)

(assert (=> b!147506 (= e!98374 e!98375)))

(declare-fun res!123422 () Bool)

(assert (=> b!147506 (=> res!123422 e!98375)))

(assert (=> b!147506 (= res!123422 (= (size!3005 (buf!3460 lt!228768)) #b00000000000000000000000000000000))))

(declare-fun b!147507 () Bool)

(assert (=> b!147507 (= e!98375 (arrayBitRangesEq!0 (buf!3460 lt!228768) (buf!3460 (_2!6903 lt!227980)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3005 (buf!3460 lt!228768)) (currentByte!6362 lt!228768) (currentBit!6357 lt!228768))))))

(assert (= (and d!47870 res!123421) b!147505))

(assert (= (and b!147505 res!123423) b!147506))

(assert (= (and b!147506 (not res!123422)) b!147507))

(assert (=> b!147505 m!228389))

(assert (=> b!147505 m!226655))

(assert (=> b!147507 m!228389))

(assert (=> b!147507 m!228389))

(declare-fun m!228397 () Bool)

(assert (=> b!147507 m!228397))

(assert (=> d!47518 d!47870))

(assert (=> d!47518 d!47840))

(assert (=> d!47518 d!47816))

(assert (=> d!47518 d!47838))

(declare-fun d!47872 () Bool)

(assert (=> d!47872 (isPrefixOf!0 lt!228768 lt!228768)))

(declare-fun lt!229522 () Unit!9195)

(assert (=> d!47872 (= lt!229522 (choose!11 lt!228768))))

(assert (=> d!47872 (= (lemmaIsPrefixRefl!0 lt!228768) lt!229522)))

(declare-fun bs!11695 () Bool)

(assert (= bs!11695 d!47872))

(assert (=> bs!11695 m!227339))

(declare-fun m!228399 () Bool)

(assert (=> bs!11695 m!228399))

(assert (=> d!47518 d!47872))

(declare-fun d!47874 () Bool)

(declare-fun res!123424 () Bool)

(declare-fun e!98376 () Bool)

(assert (=> d!47874 (=> (not res!123424) (not e!98376))))

(assert (=> d!47874 (= res!123424 (= (size!3005 (buf!3460 (_1!6905 lt!228762))) (size!3005 (buf!3460 (_2!6905 lt!228762)))))))

(assert (=> d!47874 (= (isPrefixOf!0 (_1!6905 lt!228762) (_2!6905 lt!228762)) e!98376)))

(declare-fun b!147508 () Bool)

(declare-fun res!123426 () Bool)

(assert (=> b!147508 (=> (not res!123426) (not e!98376))))

(assert (=> b!147508 (= res!123426 (bvsle (bitIndex!0 (size!3005 (buf!3460 (_1!6905 lt!228762))) (currentByte!6362 (_1!6905 lt!228762)) (currentBit!6357 (_1!6905 lt!228762))) (bitIndex!0 (size!3005 (buf!3460 (_2!6905 lt!228762))) (currentByte!6362 (_2!6905 lt!228762)) (currentBit!6357 (_2!6905 lt!228762)))))))

(declare-fun b!147509 () Bool)

(declare-fun e!98377 () Bool)

(assert (=> b!147509 (= e!98376 e!98377)))

(declare-fun res!123425 () Bool)

(assert (=> b!147509 (=> res!123425 e!98377)))

(assert (=> b!147509 (= res!123425 (= (size!3005 (buf!3460 (_1!6905 lt!228762))) #b00000000000000000000000000000000))))

(declare-fun b!147510 () Bool)

(assert (=> b!147510 (= e!98377 (arrayBitRangesEq!0 (buf!3460 (_1!6905 lt!228762)) (buf!3460 (_2!6905 lt!228762)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3005 (buf!3460 (_1!6905 lt!228762))) (currentByte!6362 (_1!6905 lt!228762)) (currentBit!6357 (_1!6905 lt!228762)))))))

(assert (= (and d!47874 res!123424) b!147508))

(assert (= (and b!147508 res!123426) b!147509))

(assert (= (and b!147509 (not res!123425)) b!147510))

(assert (=> b!147508 m!228361))

(assert (=> b!147508 m!228039))

(assert (=> b!147510 m!228361))

(assert (=> b!147510 m!228361))

(declare-fun m!228401 () Bool)

(assert (=> b!147510 m!228401))

(assert (=> d!47518 d!47874))

(declare-fun d!47876 () Bool)

(assert (=> d!47876 (= (remainingBits!0 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!227961)))) ((_ sign_extend 32) (currentByte!6362 (_2!6903 lt!227961))) ((_ sign_extend 32) (currentBit!6357 (_2!6903 lt!227961)))) (bvsub (bvmul ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!227961)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6362 (_2!6903 lt!227961))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6357 (_2!6903 lt!227961))))))))

(assert (=> d!47449 d!47876))

(declare-fun d!47878 () Bool)

(assert (=> d!47878 (= (invariant!0 (currentBit!6357 (_2!6903 lt!227961)) (currentByte!6362 (_2!6903 lt!227961)) (size!3005 (buf!3460 (_2!6903 lt!227961)))) (and (bvsge (currentBit!6357 (_2!6903 lt!227961)) #b00000000000000000000000000000000) (bvslt (currentBit!6357 (_2!6903 lt!227961)) #b00000000000000000000000000001000) (bvsge (currentByte!6362 (_2!6903 lt!227961)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6362 (_2!6903 lt!227961)) (size!3005 (buf!3460 (_2!6903 lt!227961)))) (and (= (currentBit!6357 (_2!6903 lt!227961)) #b00000000000000000000000000000000) (= (currentByte!6362 (_2!6903 lt!227961)) (size!3005 (buf!3460 (_2!6903 lt!227961))))))))))

(assert (=> d!47449 d!47878))

(declare-fun d!47880 () Bool)

(declare-fun e!98378 () Bool)

(assert (=> d!47880 e!98378))

(declare-fun res!123427 () Bool)

(assert (=> d!47880 (=> (not res!123427) (not e!98378))))

(declare-fun lt!229524 () (_ BitVec 64))

(declare-fun lt!229527 () (_ BitVec 64))

(declare-fun lt!229525 () (_ BitVec 64))

(assert (=> d!47880 (= res!123427 (= lt!229525 (bvsub lt!229524 lt!229527)))))

(assert (=> d!47880 (or (= (bvand lt!229524 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!229527 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!229524 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!229524 lt!229527) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!47880 (= lt!229527 (remainingBits!0 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!228588)))) ((_ sign_extend 32) (currentByte!6362 (_2!6903 lt!228588))) ((_ sign_extend 32) (currentBit!6357 (_2!6903 lt!228588)))))))

(declare-fun lt!229523 () (_ BitVec 64))

(declare-fun lt!229526 () (_ BitVec 64))

(assert (=> d!47880 (= lt!229524 (bvmul lt!229523 lt!229526))))

(assert (=> d!47880 (or (= lt!229523 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!229526 (bvsdiv (bvmul lt!229523 lt!229526) lt!229523)))))

(assert (=> d!47880 (= lt!229526 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!47880 (= lt!229523 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!228588)))))))

(assert (=> d!47880 (= lt!229525 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6362 (_2!6903 lt!228588))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6357 (_2!6903 lt!228588)))))))

(assert (=> d!47880 (invariant!0 (currentBit!6357 (_2!6903 lt!228588)) (currentByte!6362 (_2!6903 lt!228588)) (size!3005 (buf!3460 (_2!6903 lt!228588))))))

(assert (=> d!47880 (= (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!228588))) (currentByte!6362 (_2!6903 lt!228588)) (currentBit!6357 (_2!6903 lt!228588))) lt!229525)))

(declare-fun b!147511 () Bool)

(declare-fun res!123428 () Bool)

(assert (=> b!147511 (=> (not res!123428) (not e!98378))))

(assert (=> b!147511 (= res!123428 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!229525))))

(declare-fun b!147512 () Bool)

(declare-fun lt!229528 () (_ BitVec 64))

(assert (=> b!147512 (= e!98378 (bvsle lt!229525 (bvmul lt!229528 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!147512 (or (= lt!229528 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!229528 #b0000000000000000000000000000000000000000000000000000000000001000) lt!229528)))))

(assert (=> b!147512 (= lt!229528 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!228588)))))))

(assert (= (and d!47880 res!123427) b!147511))

(assert (= (and b!147511 res!123428) b!147512))

(declare-fun m!228403 () Bool)

(assert (=> d!47880 m!228403))

(declare-fun m!228405 () Bool)

(assert (=> d!47880 m!228405))

(assert (=> b!147022 d!47880))

(assert (=> b!147022 d!47451))

(declare-fun d!47882 () Bool)

(assert (=> d!47882 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6903 lt!227980)))) ((_ sign_extend 32) (currentByte!6362 (_2!6903 lt!227980))) ((_ sign_extend 32) (currentBit!6357 (_2!6903 lt!227980))) (bvsub (bvsub to!404 from!447) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!47882 true))

(declare-fun _$7!82 () Unit!9195)

(assert (=> d!47882 (= (choose!57 thiss!1634 (_2!6903 lt!227980) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) _$7!82)))

(declare-fun bs!11696 () Bool)

(assert (= bs!11696 d!47882))

(declare-fun m!228407 () Bool)

(assert (=> bs!11696 m!228407))

(assert (=> d!47493 d!47882))

(declare-fun b!147513 () Bool)

(declare-fun lt!229547 () tuple3!574)

(declare-fun e!98379 () Bool)

(assert (=> b!147513 (= e!98379 (= (select (arr!3759 (_3!356 lt!229547)) from!447) (_2!6904 (readBytePure!0 (_1!6905 lt!227956)))))))

(assert (=> b!147513 (and (bvsge from!447 #b00000000000000000000000000000000) (bvslt from!447 (size!3005 (_3!356 lt!229547))))))

(declare-fun lt!229539 () (_ BitVec 32))

(declare-fun lt!229554 () tuple3!574)

(declare-fun lt!229564 () (_ BitVec 32))

(declare-fun call!1995 () Bool)

(declare-fun lt!229561 () array!6640)

(declare-fun bm!1992 () Bool)

(declare-fun lt!229530 () array!6640)

(declare-fun c!7993 () Bool)

(assert (=> bm!1992 (= call!1995 (arrayRangesEq!321 (ite c!7993 arr!237 lt!229561) (ite c!7993 (_3!356 lt!229554) lt!229530) (ite c!7993 #b00000000000000000000000000000000 lt!229564) (ite c!7993 from!447 lt!229539)))))

(declare-fun b!147514 () Bool)

(declare-fun e!98381 () tuple3!574)

(declare-fun lt!229535 () Unit!9195)

(assert (=> b!147514 (= e!98381 (tuple3!575 lt!229535 (_2!6915 lt!229554) (_3!356 lt!229554)))))

(declare-fun lt!229560 () tuple2!13118)

(assert (=> b!147514 (= lt!229560 (readByte!0 (_1!6905 lt!227956)))))

(declare-fun lt!229549 () array!6640)

(assert (=> b!147514 (= lt!229549 (array!6641 (store (arr!3759 arr!237) from!447 (_1!6916 lt!229560)) (size!3005 arr!237)))))

(declare-fun lt!229550 () (_ BitVec 64))

(assert (=> b!147514 (= lt!229550 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!229533 () (_ BitVec 32))

(assert (=> b!147514 (= lt!229533 (bvsub to!404 from!447))))

(declare-fun lt!229551 () Unit!9195)

(assert (=> b!147514 (= lt!229551 (validateOffsetBytesFromBitIndexLemma!0 (_1!6905 lt!227956) (_2!6916 lt!229560) lt!229550 lt!229533))))

(assert (=> b!147514 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3005 (buf!3460 (_2!6916 lt!229560)))) ((_ sign_extend 32) (currentByte!6362 (_2!6916 lt!229560))) ((_ sign_extend 32) (currentBit!6357 (_2!6916 lt!229560))) (bvsub lt!229533 ((_ extract 31 0) (bvsdiv (bvadd lt!229550 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!229545 () Unit!9195)

(assert (=> b!147514 (= lt!229545 lt!229551)))

(assert (=> b!147514 (= lt!229554 (readByteArrayLoop!0 (_2!6916 lt!229560) lt!229549 (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(declare-fun call!1996 () (_ BitVec 64))

(assert (=> b!147514 (= call!1996 (bvadd (bitIndex!0 (size!3005 (buf!3460 (_1!6905 lt!227956))) (currentByte!6362 (_1!6905 lt!227956)) (currentBit!6357 (_1!6905 lt!227956))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!229557 () Unit!9195)

(declare-fun Unit!9295 () Unit!9195)

(assert (=> b!147514 (= lt!229557 Unit!9295)))

(assert (=> b!147514 (= (bvadd call!1996 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3005 (buf!3460 (_2!6915 lt!229554))) (currentByte!6362 (_2!6915 lt!229554)) (currentBit!6357 (_2!6915 lt!229554))))))

(declare-fun lt!229556 () Unit!9195)

(declare-fun Unit!9296 () Unit!9195)

(assert (=> b!147514 (= lt!229556 Unit!9296)))

(assert (=> b!147514 (= (bvadd (bitIndex!0 (size!3005 (buf!3460 (_1!6905 lt!227956))) (currentByte!6362 (_1!6905 lt!227956)) (currentBit!6357 (_1!6905 lt!227956))) (bvmul ((_ sign_extend 32) (bvsub to!404 from!447)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3005 (buf!3460 (_2!6915 lt!229554))) (currentByte!6362 (_2!6915 lt!229554)) (currentBit!6357 (_2!6915 lt!229554))))))

(declare-fun lt!229563 () Unit!9195)

(declare-fun Unit!9297 () Unit!9195)

(assert (=> b!147514 (= lt!229563 Unit!9297)))

(assert (=> b!147514 (and (= (buf!3460 (_1!6905 lt!227956)) (buf!3460 (_2!6915 lt!229554))) (= (size!3005 arr!237) (size!3005 (_3!356 lt!229554))))))

(declare-fun lt!229540 () Unit!9195)

(declare-fun Unit!9298 () Unit!9195)

(assert (=> b!147514 (= lt!229540 Unit!9298)))

(declare-fun lt!229559 () Unit!9195)

(assert (=> b!147514 (= lt!229559 (arrayUpdatedAtPrefixLemma!13 arr!237 from!447 (_1!6916 lt!229560)))))

(declare-fun call!1997 () Bool)

(assert (=> b!147514 call!1997))

(declare-fun lt!229534 () Unit!9195)

(assert (=> b!147514 (= lt!229534 lt!229559)))

(declare-fun lt!229558 () (_ BitVec 32))

(assert (=> b!147514 (= lt!229558 #b00000000000000000000000000000000)))

(declare-fun lt!229538 () Unit!9195)

(assert (=> b!147514 (= lt!229538 (arrayRangesEqTransitive!53 arr!237 lt!229549 (_3!356 lt!229554) lt!229558 from!447 (bvadd from!447 #b00000000000000000000000000000001)))))

(assert (=> b!147514 (arrayRangesEq!321 arr!237 (_3!356 lt!229554) lt!229558 from!447)))

(declare-fun lt!229552 () Unit!9195)

(assert (=> b!147514 (= lt!229552 lt!229538)))

(assert (=> b!147514 call!1995))

(declare-fun lt!229529 () Unit!9195)

(declare-fun Unit!9299 () Unit!9195)

(assert (=> b!147514 (= lt!229529 Unit!9299)))

(declare-fun lt!229537 () Unit!9195)

(assert (=> b!147514 (= lt!229537 (arrayRangesEqImpliesEq!13 lt!229549 (_3!356 lt!229554) #b00000000000000000000000000000000 from!447 (bvadd from!447 #b00000000000000000000000000000001)))))

(assert (=> b!147514 (= (select (store (arr!3759 arr!237) from!447 (_1!6916 lt!229560)) from!447) (select (arr!3759 (_3!356 lt!229554)) from!447))))

(declare-fun lt!229541 () Unit!9195)

(assert (=> b!147514 (= lt!229541 lt!229537)))

(declare-fun lt!229548 () Bool)

(assert (=> b!147514 (= lt!229548 (= (select (arr!3759 (_3!356 lt!229554)) from!447) (_1!6916 lt!229560)))))

(declare-fun Unit!9300 () Unit!9195)

(assert (=> b!147514 (= lt!229535 Unit!9300)))

(assert (=> b!147514 lt!229548))

(declare-fun bm!1993 () Bool)

(assert (=> bm!1993 (= call!1997 (arrayRangesEq!321 arr!237 (ite c!7993 (array!6641 (store (arr!3759 arr!237) from!447 (_1!6916 lt!229560)) (size!3005 arr!237)) arr!237) #b00000000000000000000000000000000 (ite c!7993 from!447 (size!3005 arr!237))))))

(declare-fun d!47884 () Bool)

(assert (=> d!47884 e!98379))

(declare-fun res!123429 () Bool)

(assert (=> d!47884 (=> res!123429 e!98379)))

(assert (=> d!47884 (= res!123429 (bvsge from!447 to!404))))

(declare-fun lt!229536 () Bool)

(declare-fun e!98380 () Bool)

(assert (=> d!47884 (= lt!229536 e!98380)))

(declare-fun res!123431 () Bool)

(assert (=> d!47884 (=> (not res!123431) (not e!98380))))

(declare-fun lt!229542 () (_ BitVec 64))

(declare-fun lt!229546 () (_ BitVec 64))

(assert (=> d!47884 (= res!123431 (= (bvadd lt!229546 lt!229542) (bitIndex!0 (size!3005 (buf!3460 (_2!6915 lt!229547))) (currentByte!6362 (_2!6915 lt!229547)) (currentBit!6357 (_2!6915 lt!229547)))))))

(assert (=> d!47884 (or (not (= (bvand lt!229546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!229542 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!229546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!229546 lt!229542) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!229531 () (_ BitVec 64))

(assert (=> d!47884 (= lt!229542 (bvmul lt!229531 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!47884 (or (= lt!229531 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!229531 #b0000000000000000000000000000000000000000000000000000000000001000) lt!229531)))))

(assert (=> d!47884 (= lt!229531 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(assert (=> d!47884 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))

(assert (=> d!47884 (= lt!229546 (bitIndex!0 (size!3005 (buf!3460 (_1!6905 lt!227956))) (currentByte!6362 (_1!6905 lt!227956)) (currentBit!6357 (_1!6905 lt!227956))))))

(assert (=> d!47884 (= lt!229547 e!98381)))

(assert (=> d!47884 (= c!7993 (bvslt from!447 to!404))))

(assert (=> d!47884 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3005 arr!237)))))

(assert (=> d!47884 (= (readByteArrayLoop!0 (_1!6905 lt!227956) arr!237 from!447 to!404) lt!229547)))

(declare-fun bm!1994 () Bool)

(assert (=> bm!1994 (= call!1996 (bitIndex!0 (ite c!7993 (size!3005 (buf!3460 (_2!6916 lt!229560))) (size!3005 (buf!3460 (_1!6905 lt!227956)))) (ite c!7993 (currentByte!6362 (_2!6916 lt!229560)) (currentByte!6362 (_1!6905 lt!227956))) (ite c!7993 (currentBit!6357 (_2!6916 lt!229560)) (currentBit!6357 (_1!6905 lt!227956)))))))

(declare-fun b!147515 () Bool)

(assert (=> b!147515 (= e!98380 (arrayRangesEq!321 arr!237 (_3!356 lt!229547) #b00000000000000000000000000000000 from!447))))

(declare-fun b!147516 () Bool)

(declare-fun res!123430 () Bool)

(assert (=> b!147516 (=> (not res!123430) (not e!98380))))

(assert (=> b!147516 (= res!123430 (and (= (buf!3460 (_1!6905 lt!227956)) (buf!3460 (_2!6915 lt!229547))) (= (size!3005 arr!237) (size!3005 (_3!356 lt!229547)))))))

(declare-fun b!147517 () Bool)

(declare-fun lt!229543 () Unit!9195)

(assert (=> b!147517 (= e!98381 (tuple3!575 lt!229543 (_1!6905 lt!227956) arr!237))))

(assert (=> b!147517 (= call!1996 call!1996)))

(declare-fun lt!229562 () Unit!9195)

(declare-fun Unit!9301 () Unit!9195)

(assert (=> b!147517 (= lt!229562 Unit!9301)))

(declare-fun lt!229555 () Unit!9195)

(assert (=> b!147517 (= lt!229555 (arrayRangesEqReflexiveLemma!13 arr!237))))

(assert (=> b!147517 call!1997))

(declare-fun lt!229532 () Unit!9195)

(assert (=> b!147517 (= lt!229532 lt!229555)))

(assert (=> b!147517 (= lt!229561 arr!237)))

(assert (=> b!147517 (= lt!229530 arr!237)))

(declare-fun lt!229544 () (_ BitVec 32))

(assert (=> b!147517 (= lt!229544 #b00000000000000000000000000000000)))

(declare-fun lt!229553 () (_ BitVec 32))

(assert (=> b!147517 (= lt!229553 (size!3005 arr!237))))

(assert (=> b!147517 (= lt!229564 #b00000000000000000000000000000000)))

(assert (=> b!147517 (= lt!229539 from!447)))

(assert (=> b!147517 (= lt!229543 (arrayRangesEqSlicedLemma!13 lt!229561 lt!229530 lt!229544 lt!229553 lt!229564 lt!229539))))

(assert (=> b!147517 call!1995))

(assert (= (and d!47884 c!7993) b!147514))

(assert (= (and d!47884 (not c!7993)) b!147517))

(assert (= (or b!147514 b!147517) bm!1992))

(assert (= (or b!147514 b!147517) bm!1993))

(assert (= (or b!147514 b!147517) bm!1994))

(assert (= (and d!47884 res!123431) b!147516))

(assert (= (and b!147516 res!123430) b!147515))

(assert (= (and d!47884 (not res!123429)) b!147513))

(assert (=> b!147517 m!228267))

(declare-fun m!228409 () Bool)

(assert (=> b!147517 m!228409))

(declare-fun m!228411 () Bool)

(assert (=> bm!1993 m!228411))

(declare-fun m!228413 () Bool)

(assert (=> bm!1993 m!228413))

(declare-fun m!228415 () Bool)

(assert (=> b!147513 m!228415))

(assert (=> b!147513 m!226623))

(declare-fun m!228417 () Bool)

(assert (=> d!47884 m!228417))

(assert (=> d!47884 m!228005))

(declare-fun m!228419 () Bool)

(assert (=> bm!1994 m!228419))

(declare-fun m!228421 () Bool)

(assert (=> b!147515 m!228421))

(assert (=> b!147514 m!228411))

(declare-fun m!228423 () Bool)

(assert (=> b!147514 m!228423))

(declare-fun m!228425 () Bool)

(assert (=> b!147514 m!228425))

(declare-fun m!228427 () Bool)

(assert (=> b!147514 m!228427))

(declare-fun m!228429 () Bool)

(assert (=> b!147514 m!228429))

(declare-fun m!228431 () Bool)

(assert (=> b!147514 m!228431))

(declare-fun m!228433 () Bool)

(assert (=> b!147514 m!228433))

(declare-fun m!228435 () Bool)

(assert (=> b!147514 m!228435))

(declare-fun m!228437 () Bool)

(assert (=> b!147514 m!228437))

(declare-fun m!228439 () Bool)

(assert (=> b!147514 m!228439))

(assert (=> b!147514 m!228005))

(declare-fun m!228441 () Bool)

(assert (=> b!147514 m!228441))

(assert (=> b!147514 m!227277))

(declare-fun m!228443 () Bool)

(assert (=> bm!1992 m!228443))

(assert (=> d!47459 d!47884))

(declare-fun b!147518 () Bool)

(declare-fun e!98383 () Bool)

(declare-fun call!1998 () Bool)

(assert (=> b!147518 (= e!98383 call!1998)))

(declare-fun b!147519 () Bool)

(declare-fun e!98384 () Bool)

(declare-fun e!98386 () Bool)

(assert (=> b!147519 (= e!98384 e!98386)))

(declare-fun lt!229566 () (_ BitVec 32))

(declare-fun res!123436 () Bool)

(declare-fun lt!229567 () tuple4!140)

(assert (=> b!147519 (= res!123436 (byteRangesEq!0 (select (arr!3759 (buf!3460 thiss!1634)) (_3!358 lt!229567)) (select (arr!3759 (buf!3460 (_2!6903 lt!227961))) (_3!358 lt!229567)) lt!229566 #b00000000000000000000000000001000))))

(assert (=> b!147519 (=> (not res!123436) (not e!98386))))

(declare-fun b!147520 () Bool)

(assert (=> b!147520 (= e!98384 call!1998)))

(declare-fun b!147521 () Bool)

(declare-fun e!98382 () Bool)

(declare-fun e!98385 () Bool)

(assert (=> b!147521 (= e!98382 e!98385)))

(declare-fun res!123433 () Bool)

(assert (=> b!147521 (=> (not res!123433) (not e!98385))))

(declare-fun e!98387 () Bool)

(assert (=> b!147521 (= res!123433 e!98387)))

(declare-fun res!123434 () Bool)

(assert (=> b!147521 (=> res!123434 e!98387)))

(assert (=> b!147521 (= res!123434 (bvsge (_1!6919 lt!229567) (_2!6919 lt!229567)))))

(declare-fun lt!229565 () (_ BitVec 32))

(assert (=> b!147521 (= lt!229565 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3005 (buf!3460 thiss!1634)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!147521 (= lt!229566 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!147521 (= lt!229567 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3005 (buf!3460 thiss!1634)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634))))))

(declare-fun b!147522 () Bool)

(assert (=> b!147522 (= e!98387 (arrayRangesEq!321 (buf!3460 thiss!1634) (buf!3460 (_2!6903 lt!227961)) (_1!6919 lt!229567) (_2!6919 lt!229567)))))

(declare-fun b!147523 () Bool)

(assert (=> b!147523 (= e!98385 e!98384)))

(declare-fun c!7994 () Bool)

(assert (=> b!147523 (= c!7994 (= (_3!358 lt!229567) (_4!70 lt!229567)))))

(declare-fun b!147524 () Bool)

(declare-fun res!123432 () Bool)

(assert (=> b!147524 (= res!123432 (= lt!229565 #b00000000000000000000000000000000))))

(assert (=> b!147524 (=> res!123432 e!98383)))

(assert (=> b!147524 (= e!98386 e!98383)))

(declare-fun bm!1995 () Bool)

(assert (=> bm!1995 (= call!1998 (byteRangesEq!0 (ite c!7994 (select (arr!3759 (buf!3460 thiss!1634)) (_3!358 lt!229567)) (select (arr!3759 (buf!3460 thiss!1634)) (_4!70 lt!229567))) (ite c!7994 (select (arr!3759 (buf!3460 (_2!6903 lt!227961))) (_3!358 lt!229567)) (select (arr!3759 (buf!3460 (_2!6903 lt!227961))) (_4!70 lt!229567))) (ite c!7994 lt!229566 #b00000000000000000000000000000000) lt!229565))))

(declare-fun d!47886 () Bool)

(declare-fun res!123435 () Bool)

(assert (=> d!47886 (=> res!123435 e!98382)))

(assert (=> d!47886 (= res!123435 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3005 (buf!3460 thiss!1634)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634))))))

(assert (=> d!47886 (= (arrayBitRangesEq!0 (buf!3460 thiss!1634) (buf!3460 (_2!6903 lt!227961)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3005 (buf!3460 thiss!1634)) (currentByte!6362 thiss!1634) (currentBit!6357 thiss!1634))) e!98382)))

(assert (= (and d!47886 (not res!123435)) b!147521))

(assert (= (and b!147521 (not res!123434)) b!147522))

(assert (= (and b!147521 res!123433) b!147523))

(assert (= (and b!147523 c!7994) b!147520))

(assert (= (and b!147523 (not c!7994)) b!147519))

(assert (= (and b!147519 res!123436) b!147524))

(assert (= (and b!147524 (not res!123432)) b!147518))

(assert (= (or b!147520 b!147518) bm!1995))

(declare-fun m!228445 () Bool)

(assert (=> b!147519 m!228445))

(declare-fun m!228447 () Bool)

(assert (=> b!147519 m!228447))

(assert (=> b!147519 m!228445))

(assert (=> b!147519 m!228447))

(declare-fun m!228449 () Bool)

(assert (=> b!147519 m!228449))

(assert (=> b!147521 m!226661))

(assert (=> b!147521 m!228327))

(declare-fun m!228451 () Bool)

(assert (=> b!147522 m!228451))

(declare-fun m!228453 () Bool)

(assert (=> bm!1995 m!228453))

(declare-fun m!228455 () Bool)

(assert (=> bm!1995 m!228455))

(assert (=> bm!1995 m!228445))

(declare-fun m!228457 () Bool)

(assert (=> bm!1995 m!228457))

(assert (=> bm!1995 m!228447))

(assert (=> b!147032 d!47886))

(assert (=> b!147032 d!47453))

(declare-fun d!47888 () Bool)

(declare-fun e!98390 () Bool)

(assert (=> d!47888 e!98390))

(declare-fun res!123439 () Bool)

(assert (=> d!47888 (=> (not res!123439) (not e!98390))))

(declare-fun lt!229572 () tuple2!13100)

(declare-fun lt!229573 () tuple2!13100)

(assert (=> d!47888 (= res!123439 (= (bitIndex!0 (size!3005 (buf!3460 (_1!6904 lt!229572))) (currentByte!6362 (_1!6904 lt!229572)) (currentBit!6357 (_1!6904 lt!229572))) (bitIndex!0 (size!3005 (buf!3460 (_1!6904 lt!229573))) (currentByte!6362 (_1!6904 lt!229573)) (currentBit!6357 (_1!6904 lt!229573)))))))

(assert (=> d!47888 (= lt!229573 (readBytePure!0 (BitStream!5269 (buf!3460 (_2!6903 lt!227961)) (currentByte!6362 lt!227979) (currentBit!6357 lt!227979))))))

(assert (=> d!47888 (= lt!229572 (readBytePure!0 lt!227979))))

(assert (=> d!47888 true))

(declare-fun _$8!90 () Unit!9195)

(assert (=> d!47888 (= (choose!14 lt!227979 (_2!6903 lt!227961) lt!228695 lt!228697 (tuple2!13101 (_1!6904 lt!228697) (_2!6904 lt!228697)) (_1!6904 lt!228697) (_2!6904 lt!228697) lt!228694 (tuple2!13101 (_1!6904 lt!228694) (_2!6904 lt!228694)) (_1!6904 lt!228694) (_2!6904 lt!228694)) _$8!90)))

(declare-fun b!147527 () Bool)

(assert (=> b!147527 (= e!98390 (= (_2!6904 lt!229572) (_2!6904 lt!229573)))))

(assert (= (and d!47888 res!123439) b!147527))

(declare-fun m!228459 () Bool)

(assert (=> d!47888 m!228459))

(declare-fun m!228461 () Bool)

(assert (=> d!47888 m!228461))

(declare-fun m!228463 () Bool)

(assert (=> d!47888 m!228463))

(assert (=> d!47888 m!226617))

(assert (=> d!47489 d!47888))

(declare-fun d!47890 () Bool)

(declare-fun e!98391 () Bool)

(assert (=> d!47890 e!98391))

(declare-fun res!123440 () Bool)

(assert (=> d!47890 (=> (not res!123440) (not e!98391))))

(declare-fun lt!229575 () (_ BitVec 64))

(declare-fun lt!229576 () (_ BitVec 64))

(declare-fun lt!229578 () (_ BitVec 64))

(assert (=> d!47890 (= res!123440 (= lt!229576 (bvsub lt!229575 lt!229578)))))

(assert (=> d!47890 (or (= (bvand lt!229575 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!229578 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!229575 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!229575 lt!229578) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!47890 (= lt!229578 (remainingBits!0 ((_ sign_extend 32) (size!3005 (buf!3460 (_1!6904 lt!228694)))) ((_ sign_extend 32) (currentByte!6362 (_1!6904 lt!228694))) ((_ sign_extend 32) (currentBit!6357 (_1!6904 lt!228694)))))))

(declare-fun lt!229574 () (_ BitVec 64))

(declare-fun lt!229577 () (_ BitVec 64))

(assert (=> d!47890 (= lt!229575 (bvmul lt!229574 lt!229577))))

(assert (=> d!47890 (or (= lt!229574 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!229577 (bvsdiv (bvmul lt!229574 lt!229577) lt!229574)))))

(assert (=> d!47890 (= lt!229577 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!47890 (= lt!229574 ((_ sign_extend 32) (size!3005 (buf!3460 (_1!6904 lt!228694)))))))

(assert (=> d!47890 (= lt!229576 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6362 (_1!6904 lt!228694))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6357 (_1!6904 lt!228694)))))))

(assert (=> d!47890 (invariant!0 (currentBit!6357 (_1!6904 lt!228694)) (currentByte!6362 (_1!6904 lt!228694)) (size!3005 (buf!3460 (_1!6904 lt!228694))))))

(assert (=> d!47890 (= (bitIndex!0 (size!3005 (buf!3460 (_1!6904 lt!228694))) (currentByte!6362 (_1!6904 lt!228694)) (currentBit!6357 (_1!6904 lt!228694))) lt!229576)))

(declare-fun b!147528 () Bool)

(declare-fun res!123441 () Bool)

(assert (=> b!147528 (=> (not res!123441) (not e!98391))))

(assert (=> b!147528 (= res!123441 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!229576))))

(declare-fun b!147529 () Bool)

(declare-fun lt!229579 () (_ BitVec 64))

(assert (=> b!147529 (= e!98391 (bvsle lt!229576 (bvmul lt!229579 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!147529 (or (= lt!229579 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!229579 #b0000000000000000000000000000000000000000000000000000000000001000) lt!229579)))))

(assert (=> b!147529 (= lt!229579 ((_ sign_extend 32) (size!3005 (buf!3460 (_1!6904 lt!228694)))))))

(assert (= (and d!47890 res!123440) b!147528))

(assert (= (and b!147528 res!123441) b!147529))

(declare-fun m!228465 () Bool)

(assert (=> d!47890 m!228465))

(declare-fun m!228467 () Bool)

(assert (=> d!47890 m!228467))

(assert (=> d!47489 d!47890))

(assert (=> d!47489 d!47475))

(declare-fun d!47892 () Bool)

(declare-fun e!98392 () Bool)

(assert (=> d!47892 e!98392))

(declare-fun res!123442 () Bool)

(assert (=> d!47892 (=> (not res!123442) (not e!98392))))

(declare-fun lt!229582 () (_ BitVec 64))

(declare-fun lt!229581 () (_ BitVec 64))

(declare-fun lt!229584 () (_ BitVec 64))

(assert (=> d!47892 (= res!123442 (= lt!229582 (bvsub lt!229581 lt!229584)))))

(assert (=> d!47892 (or (= (bvand lt!229581 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!229584 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!229581 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!229581 lt!229584) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!47892 (= lt!229584 (remainingBits!0 ((_ sign_extend 32) (size!3005 (buf!3460 (_1!6904 lt!228697)))) ((_ sign_extend 32) (currentByte!6362 (_1!6904 lt!228697))) ((_ sign_extend 32) (currentBit!6357 (_1!6904 lt!228697)))))))

(declare-fun lt!229580 () (_ BitVec 64))

(declare-fun lt!229583 () (_ BitVec 64))

(assert (=> d!47892 (= lt!229581 (bvmul lt!229580 lt!229583))))

(assert (=> d!47892 (or (= lt!229580 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!229583 (bvsdiv (bvmul lt!229580 lt!229583) lt!229580)))))

(assert (=> d!47892 (= lt!229583 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!47892 (= lt!229580 ((_ sign_extend 32) (size!3005 (buf!3460 (_1!6904 lt!228697)))))))

(assert (=> d!47892 (= lt!229582 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6362 (_1!6904 lt!228697))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6357 (_1!6904 lt!228697)))))))

(assert (=> d!47892 (invariant!0 (currentBit!6357 (_1!6904 lt!228697)) (currentByte!6362 (_1!6904 lt!228697)) (size!3005 (buf!3460 (_1!6904 lt!228697))))))

(assert (=> d!47892 (= (bitIndex!0 (size!3005 (buf!3460 (_1!6904 lt!228697))) (currentByte!6362 (_1!6904 lt!228697)) (currentBit!6357 (_1!6904 lt!228697))) lt!229582)))

(declare-fun b!147530 () Bool)

(declare-fun res!123443 () Bool)

(assert (=> b!147530 (=> (not res!123443) (not e!98392))))

(assert (=> b!147530 (= res!123443 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!229582))))

(declare-fun b!147531 () Bool)

(declare-fun lt!229585 () (_ BitVec 64))

(assert (=> b!147531 (= e!98392 (bvsle lt!229582 (bvmul lt!229585 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!147531 (or (= lt!229585 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!229585 #b0000000000000000000000000000000000000000000000000000000000001000) lt!229585)))))

(assert (=> b!147531 (= lt!229585 ((_ sign_extend 32) (size!3005 (buf!3460 (_1!6904 lt!228697)))))))

(assert (= (and d!47892 res!123442) b!147530))

(assert (= (and b!147530 res!123443) b!147531))

(declare-fun m!228469 () Bool)

(assert (=> d!47892 m!228469))

(declare-fun m!228471 () Bool)

(assert (=> d!47892 m!228471))

(assert (=> d!47489 d!47892))

(declare-fun d!47894 () Bool)

(declare-fun lt!229586 () tuple2!13118)

(assert (=> d!47894 (= lt!229586 (readByte!0 lt!228695))))

(assert (=> d!47894 (= (readBytePure!0 lt!228695) (tuple2!13101 (_2!6916 lt!229586) (_1!6916 lt!229586)))))

(declare-fun bs!11697 () Bool)

(assert (= bs!11697 d!47894))

(declare-fun m!228473 () Bool)

(assert (=> bs!11697 m!228473))

(assert (=> d!47489 d!47894))

(declare-fun d!47896 () Bool)

(declare-fun res!123444 () Bool)

(declare-fun e!98393 () Bool)

(assert (=> d!47896 (=> (not res!123444) (not e!98393))))

(assert (=> d!47896 (= res!123444 (= (size!3005 (buf!3460 (_2!6903 lt!227980))) (size!3005 (buf!3460 (_2!6903 lt!228588)))))))

(assert (=> d!47896 (= (isPrefixOf!0 (_2!6903 lt!227980) (_2!6903 lt!228588)) e!98393)))

(declare-fun b!147532 () Bool)

(declare-fun res!123446 () Bool)

(assert (=> b!147532 (=> (not res!123446) (not e!98393))))

(assert (=> b!147532 (= res!123446 (bvsle (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!227980))) (currentByte!6362 (_2!6903 lt!227980)) (currentBit!6357 (_2!6903 lt!227980))) (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!228588))) (currentByte!6362 (_2!6903 lt!228588)) (currentBit!6357 (_2!6903 lt!228588)))))))

(declare-fun b!147533 () Bool)

(declare-fun e!98394 () Bool)

(assert (=> b!147533 (= e!98393 e!98394)))

(declare-fun res!123445 () Bool)

(assert (=> b!147533 (=> res!123445 e!98394)))

(assert (=> b!147533 (= res!123445 (= (size!3005 (buf!3460 (_2!6903 lt!227980))) #b00000000000000000000000000000000))))

(declare-fun b!147534 () Bool)

(assert (=> b!147534 (= e!98394 (arrayBitRangesEq!0 (buf!3460 (_2!6903 lt!227980)) (buf!3460 (_2!6903 lt!228588)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3005 (buf!3460 (_2!6903 lt!227980))) (currentByte!6362 (_2!6903 lt!227980)) (currentBit!6357 (_2!6903 lt!227980)))))))

(assert (= (and d!47896 res!123444) b!147532))

(assert (= (and b!147532 res!123446) b!147533))

(assert (= (and b!147533 (not res!123445)) b!147534))

(assert (=> b!147532 m!226655))

(assert (=> b!147532 m!227171))

(assert (=> b!147534 m!226655))

(assert (=> b!147534 m!226655))

(declare-fun m!228475 () Bool)

(assert (=> b!147534 m!228475))

(assert (=> b!147020 d!47896))

(check-sat (not b!147377) (not d!47794) (not d!47810) (not b!147376) (not b!147326) (not d!47884) (not bm!1986) (not bm!1994) (not b!147443) (not b!147482) (not b!147502) (not b!147485) (not b!147472) (not bm!1977) (not b!147478) (not b!147312) (not b!147505) (not d!47772) (not b!147442) (not d!47888) (not b!147313) (not d!47892) (not d!47872) (not bm!1978) (not d!47758) (not b!147346) (not b!147411) (not d!47804) (not bm!1984) (not d!47734) (not d!47880) (not bm!1991) (not b!147504) (not b!147393) (not b!147532) (not b!147405) (not b!147419) (not b!147514) (not bm!1983) (not d!47768) (not d!47834) (not b!147421) (not bm!1989) (not b!147468) (not b!147389) (not b!147369) (not b!147487) (not d!47858) (not d!47764) (not b!147450) (not b!147519) (not b!147461) (not bm!1995) (not b!147446) (not b!147363) (not d!47774) (not b!147394) (not b!147429) (not b!147386) (not b!147402) (not d!47868) (not bm!1982) (not bm!1987) (not b!147464) (not b!147488) (not b!147348) (not b!147521) (not bm!1990) (not b!147396) (not b!147414) (not d!47750) (not d!47738) (not d!47722) (not b!147422) (not b!147362) (not d!47718) (not bm!1985) (not b!147315) (not d!47894) (not b!147534) (not d!47840) (not d!47726) (not b!147373) (not b!147479) (not d!47818) (not b!147494) (not d!47760) (not b!147441) (not d!47736) (not b!147455) (not b!147484) (not b!147508) (not b!147481) (not d!47864) (not d!47816) (not b!147447) (not b!147456) (not d!47832) (not d!47844) (not b!147515) (not b!147349) (not b!147398) (not b!147416) (not b!147327) (not d!47748) (not b!147426) (not d!47798) (not b!147466) (not d!47824) (not d!47730) (not d!47790) (not b!147513) (not b!147440) (not d!47744) (not b!147427) (not b!147397) (not b!147517) (not b!147473) (not b!147408) (not d!47848) (not d!47890) (not d!47740) (not b!147403) (not d!47822) (not b!147459) (not d!47732) (not d!47752) (not bm!1988) (not d!47882) (not bm!1993) (not b!147328) (not b!147470) (not b!147374) (not bm!1992) (not b!147500) (not b!147360) (not b!147384) (not d!47716) (not b!147361) (not b!147490) (not d!47820) (not b!147507) (not b!147496) (not b!147399) (not d!47728) (not d!47770) (not d!47724) (not b!147444) (not b!147452) (not b!147498) (not b!147462) (not b!147463) (not b!147510) (not d!47766) (not b!147410) (not b!147453) (not b!147406) (not b!147449) (not b!147401) (not b!147491) (not b!147476) (not b!147330) (not bm!1976) (not d!47860) (not b!147522) (not bm!1981) (not b!147493) (not b!147458) (not b!147388))
