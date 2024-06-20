; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52874 () Bool)

(assert start!52874)

(declare-fun b!244971 () Bool)

(declare-fun e!169768 () Bool)

(declare-fun e!169772 () Bool)

(assert (=> b!244971 (= e!169768 e!169772)))

(declare-fun res!204800 () Bool)

(assert (=> b!244971 (=> (not res!204800) (not e!169772))))

(declare-datatypes ((array!13400 0))(
  ( (array!13401 (arr!6862 (Array (_ BitVec 32) (_ BitVec 8))) (size!5875 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10672 0))(
  ( (BitStream!10673 (buf!6350 array!13400) (currentByte!11734 (_ BitVec 32)) (currentBit!11729 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17851 0))(
  ( (Unit!17852) )
))
(declare-datatypes ((tuple2!21018 0))(
  ( (tuple2!21019 (_1!11431 Unit!17851) (_2!11431 BitStream!10672)) )
))
(declare-fun lt!381937 () tuple2!21018)

(declare-fun lt!381942 () (_ BitVec 64))

(declare-fun lt!381941 () tuple2!21018)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!244971 (= res!204800 (= (bitIndex!0 (size!5875 (buf!6350 (_2!11431 lt!381941))) (currentByte!11734 (_2!11431 lt!381941)) (currentBit!11729 (_2!11431 lt!381941))) (bvadd (bitIndex!0 (size!5875 (buf!6350 (_2!11431 lt!381937))) (currentByte!11734 (_2!11431 lt!381937)) (currentBit!11729 (_2!11431 lt!381937))) lt!381942)))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!244971 (= lt!381942 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!244972 () Bool)

(declare-fun res!204804 () Bool)

(declare-fun e!169771 () Bool)

(assert (=> b!244972 (=> (not res!204804) (not e!169771))))

(declare-fun thiss!1005 () BitStream!10672)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!244972 (= res!204804 (validate_offset_bits!1 ((_ sign_extend 32) (size!5875 (buf!6350 thiss!1005))) ((_ sign_extend 32) (currentByte!11734 thiss!1005)) ((_ sign_extend 32) (currentBit!11729 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!244974 () Bool)

(declare-fun res!204805 () Bool)

(declare-fun e!169773 () Bool)

(assert (=> b!244974 (=> (not res!204805) (not e!169773))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!244974 (= res!204805 (invariant!0 (currentBit!11729 thiss!1005) (currentByte!11734 thiss!1005) (size!5875 (buf!6350 (_2!11431 lt!381937)))))))

(declare-fun b!244975 () Bool)

(declare-fun e!169767 () Bool)

(declare-fun array_inv!5616 (array!13400) Bool)

(assert (=> b!244975 (= e!169767 (array_inv!5616 (buf!6350 thiss!1005)))))

(declare-fun b!244976 () Bool)

(declare-datatypes ((tuple2!21020 0))(
  ( (tuple2!21021 (_1!11432 BitStream!10672) (_2!11432 Bool)) )
))
(declare-fun lt!381952 () tuple2!21020)

(declare-datatypes ((tuple2!21022 0))(
  ( (tuple2!21023 (_1!11433 BitStream!10672) (_2!11433 BitStream!10672)) )
))
(declare-fun lt!381940 () tuple2!21022)

(assert (=> b!244976 (= e!169772 (not (or (not (_2!11432 lt!381952)) (not (= (_1!11432 lt!381952) (_2!11433 lt!381940))))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10672 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21020)

(assert (=> b!244976 (= lt!381952 (checkBitsLoopPure!0 (_1!11433 lt!381940) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!244976 (validate_offset_bits!1 ((_ sign_extend 32) (size!5875 (buf!6350 (_2!11431 lt!381941)))) ((_ sign_extend 32) (currentByte!11734 (_2!11431 lt!381937))) ((_ sign_extend 32) (currentBit!11729 (_2!11431 lt!381937))) lt!381942)))

(declare-fun lt!381943 () Unit!17851)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10672 array!13400 (_ BitVec 64)) Unit!17851)

(assert (=> b!244976 (= lt!381943 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11431 lt!381937) (buf!6350 (_2!11431 lt!381941)) lt!381942))))

(declare-fun reader!0 (BitStream!10672 BitStream!10672) tuple2!21022)

(assert (=> b!244976 (= lt!381940 (reader!0 (_2!11431 lt!381937) (_2!11431 lt!381941)))))

(declare-fun b!244977 () Bool)

(assert (=> b!244977 (= e!169773 (invariant!0 (currentBit!11729 thiss!1005) (currentByte!11734 thiss!1005) (size!5875 (buf!6350 (_2!11431 lt!381941)))))))

(declare-fun b!244978 () Bool)

(declare-fun e!169765 () Bool)

(assert (=> b!244978 (= e!169771 (not e!169765))))

(declare-fun res!204796 () Bool)

(assert (=> b!244978 (=> res!204796 e!169765)))

(declare-fun lt!381957 () tuple2!21022)

(assert (=> b!244978 (= res!204796 (not (= (_1!11432 (checkBitsLoopPure!0 (_1!11433 lt!381957) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))) (_2!11433 lt!381957))))))

(declare-fun lt!381948 () (_ BitVec 64))

(assert (=> b!244978 (validate_offset_bits!1 ((_ sign_extend 32) (size!5875 (buf!6350 (_2!11431 lt!381941)))) ((_ sign_extend 32) (currentByte!11734 (_2!11431 lt!381937))) ((_ sign_extend 32) (currentBit!11729 (_2!11431 lt!381937))) lt!381948)))

(declare-fun lt!381944 () Unit!17851)

(assert (=> b!244978 (= lt!381944 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11431 lt!381937) (buf!6350 (_2!11431 lt!381941)) lt!381948))))

(declare-fun lt!381955 () tuple2!21022)

(declare-fun lt!381946 () tuple2!21020)

(assert (=> b!244978 (= lt!381946 (checkBitsLoopPure!0 (_1!11433 lt!381955) nBits!297 bit!26 from!289))))

(assert (=> b!244978 (validate_offset_bits!1 ((_ sign_extend 32) (size!5875 (buf!6350 (_2!11431 lt!381941)))) ((_ sign_extend 32) (currentByte!11734 thiss!1005)) ((_ sign_extend 32) (currentBit!11729 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!381949 () Unit!17851)

(assert (=> b!244978 (= lt!381949 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6350 (_2!11431 lt!381941)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!10672) tuple2!21020)

(assert (=> b!244978 (= (_2!11432 (readBitPure!0 (_1!11433 lt!381955))) bit!26)))

(assert (=> b!244978 (= lt!381957 (reader!0 (_2!11431 lt!381937) (_2!11431 lt!381941)))))

(assert (=> b!244978 (= lt!381955 (reader!0 thiss!1005 (_2!11431 lt!381941)))))

(declare-fun e!169775 () Bool)

(assert (=> b!244978 e!169775))

(declare-fun res!204795 () Bool)

(assert (=> b!244978 (=> (not res!204795) (not e!169775))))

(declare-fun lt!381945 () tuple2!21020)

(declare-fun lt!381951 () tuple2!21020)

(assert (=> b!244978 (= res!204795 (= (bitIndex!0 (size!5875 (buf!6350 (_1!11432 lt!381945))) (currentByte!11734 (_1!11432 lt!381945)) (currentBit!11729 (_1!11432 lt!381945))) (bitIndex!0 (size!5875 (buf!6350 (_1!11432 lt!381951))) (currentByte!11734 (_1!11432 lt!381951)) (currentBit!11729 (_1!11432 lt!381951)))))))

(declare-fun lt!381939 () Unit!17851)

(declare-fun lt!381947 () BitStream!10672)

(declare-fun readBitPrefixLemma!0 (BitStream!10672 BitStream!10672) Unit!17851)

(assert (=> b!244978 (= lt!381939 (readBitPrefixLemma!0 lt!381947 (_2!11431 lt!381941)))))

(assert (=> b!244978 (= lt!381951 (readBitPure!0 (BitStream!10673 (buf!6350 (_2!11431 lt!381941)) (currentByte!11734 thiss!1005) (currentBit!11729 thiss!1005))))))

(assert (=> b!244978 (= lt!381945 (readBitPure!0 lt!381947))))

(assert (=> b!244978 (= lt!381947 (BitStream!10673 (buf!6350 (_2!11431 lt!381937)) (currentByte!11734 thiss!1005) (currentBit!11729 thiss!1005)))))

(assert (=> b!244978 e!169773))

(declare-fun res!204801 () Bool)

(assert (=> b!244978 (=> (not res!204801) (not e!169773))))

(declare-fun isPrefixOf!0 (BitStream!10672 BitStream!10672) Bool)

(assert (=> b!244978 (= res!204801 (isPrefixOf!0 thiss!1005 (_2!11431 lt!381941)))))

(declare-fun lt!381954 () Unit!17851)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10672 BitStream!10672 BitStream!10672) Unit!17851)

(assert (=> b!244978 (= lt!381954 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11431 lt!381937) (_2!11431 lt!381941)))))

(assert (=> b!244978 e!169768))

(declare-fun res!204807 () Bool)

(assert (=> b!244978 (=> (not res!204807) (not e!169768))))

(assert (=> b!244978 (= res!204807 (= (size!5875 (buf!6350 (_2!11431 lt!381937))) (size!5875 (buf!6350 (_2!11431 lt!381941)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10672 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21018)

(assert (=> b!244978 (= lt!381941 (appendNBitsLoop!0 (_2!11431 lt!381937) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!244978 (validate_offset_bits!1 ((_ sign_extend 32) (size!5875 (buf!6350 (_2!11431 lt!381937)))) ((_ sign_extend 32) (currentByte!11734 (_2!11431 lt!381937))) ((_ sign_extend 32) (currentBit!11729 (_2!11431 lt!381937))) lt!381948)))

(assert (=> b!244978 (= lt!381948 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!381953 () Unit!17851)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10672 BitStream!10672 (_ BitVec 64) (_ BitVec 64)) Unit!17851)

(assert (=> b!244978 (= lt!381953 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11431 lt!381937) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!169774 () Bool)

(assert (=> b!244978 e!169774))

(declare-fun res!204806 () Bool)

(assert (=> b!244978 (=> (not res!204806) (not e!169774))))

(assert (=> b!244978 (= res!204806 (= (size!5875 (buf!6350 thiss!1005)) (size!5875 (buf!6350 (_2!11431 lt!381937)))))))

(declare-fun appendBit!0 (BitStream!10672 Bool) tuple2!21018)

(assert (=> b!244978 (= lt!381937 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!244979 () Bool)

(declare-fun res!204797 () Bool)

(assert (=> b!244979 (=> (not res!204797) (not e!169771))))

(assert (=> b!244979 (= res!204797 (bvslt from!289 nBits!297))))

(declare-fun res!204802 () Bool)

(assert (=> start!52874 (=> (not res!204802) (not e!169771))))

(assert (=> start!52874 (= res!204802 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52874 e!169771))

(assert (=> start!52874 true))

(declare-fun inv!12 (BitStream!10672) Bool)

(assert (=> start!52874 (and (inv!12 thiss!1005) e!169767)))

(declare-fun b!244973 () Bool)

(declare-fun e!169770 () Bool)

(declare-fun e!169766 () Bool)

(assert (=> b!244973 (= e!169770 e!169766)))

(declare-fun res!204799 () Bool)

(assert (=> b!244973 (=> (not res!204799) (not e!169766))))

(declare-fun lt!381938 () tuple2!21020)

(assert (=> b!244973 (= res!204799 (and (= (_2!11432 lt!381938) bit!26) (= (_1!11432 lt!381938) (_2!11431 lt!381937))))))

(declare-fun readerFrom!0 (BitStream!10672 (_ BitVec 32) (_ BitVec 32)) BitStream!10672)

(assert (=> b!244973 (= lt!381938 (readBitPure!0 (readerFrom!0 (_2!11431 lt!381937) (currentBit!11729 thiss!1005) (currentByte!11734 thiss!1005))))))

(declare-fun b!244980 () Bool)

(assert (=> b!244980 (= e!169775 (= (_2!11432 lt!381945) (_2!11432 lt!381951)))))

(declare-fun b!244981 () Bool)

(declare-fun lt!381956 () (_ BitVec 64))

(assert (=> b!244981 (= e!169766 (= (bitIndex!0 (size!5875 (buf!6350 (_1!11432 lt!381938))) (currentByte!11734 (_1!11432 lt!381938)) (currentBit!11729 (_1!11432 lt!381938))) lt!381956))))

(declare-fun b!244982 () Bool)

(declare-fun res!204798 () Bool)

(assert (=> b!244982 (=> (not res!204798) (not e!169770))))

(assert (=> b!244982 (= res!204798 (isPrefixOf!0 thiss!1005 (_2!11431 lt!381937)))))

(declare-fun b!244983 () Bool)

(declare-fun res!204794 () Bool)

(assert (=> b!244983 (=> (not res!204794) (not e!169772))))

(assert (=> b!244983 (= res!204794 (isPrefixOf!0 (_2!11431 lt!381937) (_2!11431 lt!381941)))))

(declare-fun b!244984 () Bool)

(assert (=> b!244984 (= e!169774 e!169770)))

(declare-fun res!204803 () Bool)

(assert (=> b!244984 (=> (not res!204803) (not e!169770))))

(declare-fun lt!381950 () (_ BitVec 64))

(assert (=> b!244984 (= res!204803 (= lt!381956 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!381950)))))

(assert (=> b!244984 (= lt!381956 (bitIndex!0 (size!5875 (buf!6350 (_2!11431 lt!381937))) (currentByte!11734 (_2!11431 lt!381937)) (currentBit!11729 (_2!11431 lt!381937))))))

(assert (=> b!244984 (= lt!381950 (bitIndex!0 (size!5875 (buf!6350 thiss!1005)) (currentByte!11734 thiss!1005) (currentBit!11729 thiss!1005)))))

(declare-fun b!244985 () Bool)

(declare-fun moveBitIndexPrecond!0 (BitStream!10672 (_ BitVec 64)) Bool)

(assert (=> b!244985 (= e!169765 (moveBitIndexPrecond!0 (_1!11433 lt!381955) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and start!52874 res!204802) b!244972))

(assert (= (and b!244972 res!204804) b!244979))

(assert (= (and b!244979 res!204797) b!244978))

(assert (= (and b!244978 res!204806) b!244984))

(assert (= (and b!244984 res!204803) b!244982))

(assert (= (and b!244982 res!204798) b!244973))

(assert (= (and b!244973 res!204799) b!244981))

(assert (= (and b!244978 res!204807) b!244971))

(assert (= (and b!244971 res!204800) b!244983))

(assert (= (and b!244983 res!204794) b!244976))

(assert (= (and b!244978 res!204801) b!244974))

(assert (= (and b!244974 res!204805) b!244977))

(assert (= (and b!244978 res!204795) b!244980))

(assert (= (and b!244978 (not res!204796)) b!244985))

(assert (= start!52874 b!244975))

(declare-fun m!369323 () Bool)

(assert (=> b!244976 m!369323))

(declare-fun m!369325 () Bool)

(assert (=> b!244976 m!369325))

(declare-fun m!369327 () Bool)

(assert (=> b!244976 m!369327))

(declare-fun m!369329 () Bool)

(assert (=> b!244976 m!369329))

(declare-fun m!369331 () Bool)

(assert (=> b!244971 m!369331))

(declare-fun m!369333 () Bool)

(assert (=> b!244971 m!369333))

(declare-fun m!369335 () Bool)

(assert (=> b!244981 m!369335))

(declare-fun m!369337 () Bool)

(assert (=> b!244983 m!369337))

(declare-fun m!369339 () Bool)

(assert (=> b!244974 m!369339))

(declare-fun m!369341 () Bool)

(assert (=> b!244973 m!369341))

(assert (=> b!244973 m!369341))

(declare-fun m!369343 () Bool)

(assert (=> b!244973 m!369343))

(declare-fun m!369345 () Bool)

(assert (=> b!244972 m!369345))

(declare-fun m!369347 () Bool)

(assert (=> start!52874 m!369347))

(declare-fun m!369349 () Bool)

(assert (=> b!244982 m!369349))

(declare-fun m!369351 () Bool)

(assert (=> b!244977 m!369351))

(declare-fun m!369353 () Bool)

(assert (=> b!244975 m!369353))

(declare-fun m!369355 () Bool)

(assert (=> b!244985 m!369355))

(assert (=> b!244984 m!369333))

(declare-fun m!369357 () Bool)

(assert (=> b!244984 m!369357))

(assert (=> b!244978 m!369329))

(declare-fun m!369359 () Bool)

(assert (=> b!244978 m!369359))

(declare-fun m!369361 () Bool)

(assert (=> b!244978 m!369361))

(declare-fun m!369363 () Bool)

(assert (=> b!244978 m!369363))

(declare-fun m!369365 () Bool)

(assert (=> b!244978 m!369365))

(declare-fun m!369367 () Bool)

(assert (=> b!244978 m!369367))

(declare-fun m!369369 () Bool)

(assert (=> b!244978 m!369369))

(declare-fun m!369371 () Bool)

(assert (=> b!244978 m!369371))

(declare-fun m!369373 () Bool)

(assert (=> b!244978 m!369373))

(declare-fun m!369375 () Bool)

(assert (=> b!244978 m!369375))

(declare-fun m!369377 () Bool)

(assert (=> b!244978 m!369377))

(declare-fun m!369379 () Bool)

(assert (=> b!244978 m!369379))

(declare-fun m!369381 () Bool)

(assert (=> b!244978 m!369381))

(declare-fun m!369383 () Bool)

(assert (=> b!244978 m!369383))

(declare-fun m!369385 () Bool)

(assert (=> b!244978 m!369385))

(declare-fun m!369387 () Bool)

(assert (=> b!244978 m!369387))

(declare-fun m!369389 () Bool)

(assert (=> b!244978 m!369389))

(declare-fun m!369391 () Bool)

(assert (=> b!244978 m!369391))

(declare-fun m!369393 () Bool)

(assert (=> b!244978 m!369393))

(declare-fun m!369395 () Bool)

(assert (=> b!244978 m!369395))

(push 1)

(assert (not b!244982))

(assert (not b!244975))

(assert (not b!244973))

(assert (not b!244971))

(assert (not b!244972))

(assert (not b!244983))

(assert (not b!244981))

(assert (not start!52874))

(assert (not b!244977))

(assert (not b!244976))

(assert (not b!244985))

(assert (not b!244984))

(assert (not b!244978))

(assert (not b!244974))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!82216 () Bool)

(declare-datatypes ((tuple2!21038 0))(
  ( (tuple2!21039 (_1!11441 Bool) (_2!11441 BitStream!10672)) )
))
(declare-fun lt!382287 () tuple2!21038)

(declare-fun readBit!0 (BitStream!10672) tuple2!21038)

(assert (=> d!82216 (= lt!382287 (readBit!0 (BitStream!10673 (buf!6350 (_2!11431 lt!381941)) (currentByte!11734 thiss!1005) (currentBit!11729 thiss!1005))))))

(assert (=> d!82216 (= (readBitPure!0 (BitStream!10673 (buf!6350 (_2!11431 lt!381941)) (currentByte!11734 thiss!1005) (currentBit!11729 thiss!1005))) (tuple2!21021 (_2!11441 lt!382287) (_1!11441 lt!382287)))))

(declare-fun bs!20804 () Bool)

(assert (= bs!20804 d!82216))

(declare-fun m!369703 () Bool)

(assert (=> bs!20804 m!369703))

(assert (=> b!244978 d!82216))

(declare-fun b!245175 () Bool)

(declare-fun e!169897 () Unit!17851)

(declare-fun lt!382329 () Unit!17851)

(assert (=> b!245175 (= e!169897 lt!382329)))

(declare-fun lt!382343 () (_ BitVec 64))

(assert (=> b!245175 (= lt!382343 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!382345 () (_ BitVec 64))

(assert (=> b!245175 (= lt!382345 (bitIndex!0 (size!5875 (buf!6350 (_2!11431 lt!381937))) (currentByte!11734 (_2!11431 lt!381937)) (currentBit!11729 (_2!11431 lt!381937))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13400 array!13400 (_ BitVec 64) (_ BitVec 64)) Unit!17851)

(assert (=> b!245175 (= lt!382329 (arrayBitRangesEqSymmetric!0 (buf!6350 (_2!11431 lt!381937)) (buf!6350 (_2!11431 lt!381941)) lt!382343 lt!382345))))

(declare-fun arrayBitRangesEq!0 (array!13400 array!13400 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!245175 (arrayBitRangesEq!0 (buf!6350 (_2!11431 lt!381941)) (buf!6350 (_2!11431 lt!381937)) lt!382343 lt!382345)))

(declare-fun b!245176 () Bool)

(declare-fun res!204980 () Bool)

(declare-fun e!169896 () Bool)

(assert (=> b!245176 (=> (not res!204980) (not e!169896))))

(declare-fun lt!382340 () tuple2!21022)

(assert (=> b!245176 (= res!204980 (isPrefixOf!0 (_1!11433 lt!382340) (_2!11431 lt!381937)))))

(declare-fun b!245177 () Bool)

(declare-fun lt!382334 () (_ BitVec 64))

(declare-fun lt!382332 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!10672 (_ BitVec 64)) BitStream!10672)

(assert (=> b!245177 (= e!169896 (= (_1!11433 lt!382340) (withMovedBitIndex!0 (_2!11433 lt!382340) (bvsub lt!382332 lt!382334))))))

(assert (=> b!245177 (or (= (bvand lt!382332 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!382334 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!382332 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!382332 lt!382334) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245177 (= lt!382334 (bitIndex!0 (size!5875 (buf!6350 (_2!11431 lt!381941))) (currentByte!11734 (_2!11431 lt!381941)) (currentBit!11729 (_2!11431 lt!381941))))))

(assert (=> b!245177 (= lt!382332 (bitIndex!0 (size!5875 (buf!6350 (_2!11431 lt!381937))) (currentByte!11734 (_2!11431 lt!381937)) (currentBit!11729 (_2!11431 lt!381937))))))

(declare-fun d!82218 () Bool)

(assert (=> d!82218 e!169896))

(declare-fun res!204979 () Bool)

(assert (=> d!82218 (=> (not res!204979) (not e!169896))))

(assert (=> d!82218 (= res!204979 (isPrefixOf!0 (_1!11433 lt!382340) (_2!11433 lt!382340)))))

(declare-fun lt!382328 () BitStream!10672)

(assert (=> d!82218 (= lt!382340 (tuple2!21023 lt!382328 (_2!11431 lt!381941)))))

(declare-fun lt!382337 () Unit!17851)

(declare-fun lt!382342 () Unit!17851)

(assert (=> d!82218 (= lt!382337 lt!382342)))

(assert (=> d!82218 (isPrefixOf!0 lt!382328 (_2!11431 lt!381941))))

(assert (=> d!82218 (= lt!382342 (lemmaIsPrefixTransitive!0 lt!382328 (_2!11431 lt!381941) (_2!11431 lt!381941)))))

(declare-fun lt!382338 () Unit!17851)

(declare-fun lt!382331 () Unit!17851)

(assert (=> d!82218 (= lt!382338 lt!382331)))

(assert (=> d!82218 (isPrefixOf!0 lt!382328 (_2!11431 lt!381941))))

(assert (=> d!82218 (= lt!382331 (lemmaIsPrefixTransitive!0 lt!382328 (_2!11431 lt!381937) (_2!11431 lt!381941)))))

(declare-fun lt!382341 () Unit!17851)

(assert (=> d!82218 (= lt!382341 e!169897)))

(declare-fun c!11483 () Bool)

(assert (=> d!82218 (= c!11483 (not (= (size!5875 (buf!6350 (_2!11431 lt!381937))) #b00000000000000000000000000000000)))))

(declare-fun lt!382333 () Unit!17851)

(declare-fun lt!382344 () Unit!17851)

(assert (=> d!82218 (= lt!382333 lt!382344)))

(assert (=> d!82218 (isPrefixOf!0 (_2!11431 lt!381941) (_2!11431 lt!381941))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10672) Unit!17851)

(assert (=> d!82218 (= lt!382344 (lemmaIsPrefixRefl!0 (_2!11431 lt!381941)))))

(declare-fun lt!382335 () Unit!17851)

(declare-fun lt!382339 () Unit!17851)

(assert (=> d!82218 (= lt!382335 lt!382339)))

(assert (=> d!82218 (= lt!382339 (lemmaIsPrefixRefl!0 (_2!11431 lt!381941)))))

(declare-fun lt!382336 () Unit!17851)

(declare-fun lt!382347 () Unit!17851)

(assert (=> d!82218 (= lt!382336 lt!382347)))

(assert (=> d!82218 (isPrefixOf!0 lt!382328 lt!382328)))

(assert (=> d!82218 (= lt!382347 (lemmaIsPrefixRefl!0 lt!382328))))

(declare-fun lt!382346 () Unit!17851)

(declare-fun lt!382330 () Unit!17851)

(assert (=> d!82218 (= lt!382346 lt!382330)))

(assert (=> d!82218 (isPrefixOf!0 (_2!11431 lt!381937) (_2!11431 lt!381937))))

(assert (=> d!82218 (= lt!382330 (lemmaIsPrefixRefl!0 (_2!11431 lt!381937)))))

(assert (=> d!82218 (= lt!382328 (BitStream!10673 (buf!6350 (_2!11431 lt!381941)) (currentByte!11734 (_2!11431 lt!381937)) (currentBit!11729 (_2!11431 lt!381937))))))

(assert (=> d!82218 (isPrefixOf!0 (_2!11431 lt!381937) (_2!11431 lt!381941))))

(assert (=> d!82218 (= (reader!0 (_2!11431 lt!381937) (_2!11431 lt!381941)) lt!382340)))

(declare-fun b!245178 () Bool)

(declare-fun res!204978 () Bool)

(assert (=> b!245178 (=> (not res!204978) (not e!169896))))

(assert (=> b!245178 (= res!204978 (isPrefixOf!0 (_2!11433 lt!382340) (_2!11431 lt!381941)))))

(declare-fun b!245179 () Bool)

(declare-fun Unit!17859 () Unit!17851)

(assert (=> b!245179 (= e!169897 Unit!17859)))

(assert (= (and d!82218 c!11483) b!245175))

(assert (= (and d!82218 (not c!11483)) b!245179))

(assert (= (and d!82218 res!204979) b!245176))

(assert (= (and b!245176 res!204980) b!245178))

(assert (= (and b!245178 res!204978) b!245177))

(declare-fun m!369705 () Bool)

(assert (=> b!245176 m!369705))

(declare-fun m!369707 () Bool)

(assert (=> d!82218 m!369707))

(declare-fun m!369709 () Bool)

(assert (=> d!82218 m!369709))

(declare-fun m!369711 () Bool)

(assert (=> d!82218 m!369711))

(assert (=> d!82218 m!369337))

(declare-fun m!369713 () Bool)

(assert (=> d!82218 m!369713))

(declare-fun m!369715 () Bool)

(assert (=> d!82218 m!369715))

(declare-fun m!369717 () Bool)

(assert (=> d!82218 m!369717))

(declare-fun m!369719 () Bool)

(assert (=> d!82218 m!369719))

(declare-fun m!369721 () Bool)

(assert (=> d!82218 m!369721))

(declare-fun m!369723 () Bool)

(assert (=> d!82218 m!369723))

(declare-fun m!369725 () Bool)

(assert (=> d!82218 m!369725))

(declare-fun m!369727 () Bool)

(assert (=> b!245177 m!369727))

(assert (=> b!245177 m!369331))

(assert (=> b!245177 m!369333))

(declare-fun m!369729 () Bool)

(assert (=> b!245178 m!369729))

(assert (=> b!245175 m!369333))

(declare-fun m!369731 () Bool)

(assert (=> b!245175 m!369731))

(declare-fun m!369733 () Bool)

(assert (=> b!245175 m!369733))

(assert (=> b!244978 d!82218))

(declare-fun d!82220 () Bool)

(assert (=> d!82220 (isPrefixOf!0 thiss!1005 (_2!11431 lt!381941))))

(declare-fun lt!382350 () Unit!17851)

(declare-fun choose!30 (BitStream!10672 BitStream!10672 BitStream!10672) Unit!17851)

(assert (=> d!82220 (= lt!382350 (choose!30 thiss!1005 (_2!11431 lt!381937) (_2!11431 lt!381941)))))

(assert (=> d!82220 (isPrefixOf!0 thiss!1005 (_2!11431 lt!381937))))

(assert (=> d!82220 (= (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11431 lt!381937) (_2!11431 lt!381941)) lt!382350)))

(declare-fun bs!20805 () Bool)

(assert (= bs!20805 d!82220))

(assert (=> bs!20805 m!369381))

(declare-fun m!369735 () Bool)

(assert (=> bs!20805 m!369735))

(assert (=> bs!20805 m!369349))

(assert (=> b!244978 d!82220))

(declare-fun d!82222 () Bool)

(declare-fun e!169900 () Bool)

(assert (=> d!82222 e!169900))

(declare-fun res!204983 () Bool)

(assert (=> d!82222 (=> (not res!204983) (not e!169900))))

(declare-fun lt!382360 () tuple2!21020)

(declare-fun lt!382359 () tuple2!21020)

(assert (=> d!82222 (= res!204983 (= (bitIndex!0 (size!5875 (buf!6350 (_1!11432 lt!382360))) (currentByte!11734 (_1!11432 lt!382360)) (currentBit!11729 (_1!11432 lt!382360))) (bitIndex!0 (size!5875 (buf!6350 (_1!11432 lt!382359))) (currentByte!11734 (_1!11432 lt!382359)) (currentBit!11729 (_1!11432 lt!382359)))))))

(declare-fun lt!382362 () Unit!17851)

(declare-fun lt!382361 () BitStream!10672)

(declare-fun choose!50 (BitStream!10672 BitStream!10672 BitStream!10672 tuple2!21020 tuple2!21020 BitStream!10672 Bool tuple2!21020 tuple2!21020 BitStream!10672 Bool) Unit!17851)

(assert (=> d!82222 (= lt!382362 (choose!50 lt!381947 (_2!11431 lt!381941) lt!382361 lt!382360 (tuple2!21021 (_1!11432 lt!382360) (_2!11432 lt!382360)) (_1!11432 lt!382360) (_2!11432 lt!382360) lt!382359 (tuple2!21021 (_1!11432 lt!382359) (_2!11432 lt!382359)) (_1!11432 lt!382359) (_2!11432 lt!382359)))))

(assert (=> d!82222 (= lt!382359 (readBitPure!0 lt!382361))))

(assert (=> d!82222 (= lt!382360 (readBitPure!0 lt!381947))))

(assert (=> d!82222 (= lt!382361 (BitStream!10673 (buf!6350 (_2!11431 lt!381941)) (currentByte!11734 lt!381947) (currentBit!11729 lt!381947)))))

(assert (=> d!82222 (invariant!0 (currentBit!11729 lt!381947) (currentByte!11734 lt!381947) (size!5875 (buf!6350 (_2!11431 lt!381941))))))

(assert (=> d!82222 (= (readBitPrefixLemma!0 lt!381947 (_2!11431 lt!381941)) lt!382362)))

(declare-fun b!245182 () Bool)

(assert (=> b!245182 (= e!169900 (= (_2!11432 lt!382360) (_2!11432 lt!382359)))))

(assert (= (and d!82222 res!204983) b!245182))

(declare-fun m!369737 () Bool)

(assert (=> d!82222 m!369737))

(declare-fun m!369739 () Bool)

(assert (=> d!82222 m!369739))

(declare-fun m!369741 () Bool)

(assert (=> d!82222 m!369741))

(declare-fun m!369743 () Bool)

(assert (=> d!82222 m!369743))

(assert (=> d!82222 m!369371))

(declare-fun m!369745 () Bool)

(assert (=> d!82222 m!369745))

(assert (=> b!244978 d!82222))

(declare-fun d!82224 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!82224 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5875 (buf!6350 (_2!11431 lt!381941)))) ((_ sign_extend 32) (currentByte!11734 (_2!11431 lt!381937))) ((_ sign_extend 32) (currentBit!11729 (_2!11431 lt!381937))) lt!381948) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5875 (buf!6350 (_2!11431 lt!381941)))) ((_ sign_extend 32) (currentByte!11734 (_2!11431 lt!381937))) ((_ sign_extend 32) (currentBit!11729 (_2!11431 lt!381937)))) lt!381948))))

(declare-fun bs!20806 () Bool)

(assert (= bs!20806 d!82224))

(declare-fun m!369747 () Bool)

(assert (=> bs!20806 m!369747))

(assert (=> b!244978 d!82224))

(declare-fun d!82226 () Bool)

(declare-fun e!169903 () Bool)

(assert (=> d!82226 e!169903))

(declare-fun res!204989 () Bool)

(assert (=> d!82226 (=> (not res!204989) (not e!169903))))

(declare-fun lt!382377 () (_ BitVec 64))

(declare-fun lt!382378 () (_ BitVec 64))

(declare-fun lt!382375 () (_ BitVec 64))

(assert (=> d!82226 (= res!204989 (= lt!382378 (bvsub lt!382375 lt!382377)))))

(assert (=> d!82226 (or (= (bvand lt!382375 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!382377 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!382375 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!382375 lt!382377) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82226 (= lt!382377 (remainingBits!0 ((_ sign_extend 32) (size!5875 (buf!6350 (_1!11432 lt!381945)))) ((_ sign_extend 32) (currentByte!11734 (_1!11432 lt!381945))) ((_ sign_extend 32) (currentBit!11729 (_1!11432 lt!381945)))))))

(declare-fun lt!382376 () (_ BitVec 64))

(declare-fun lt!382380 () (_ BitVec 64))

(assert (=> d!82226 (= lt!382375 (bvmul lt!382376 lt!382380))))

(assert (=> d!82226 (or (= lt!382376 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!382380 (bvsdiv (bvmul lt!382376 lt!382380) lt!382376)))))

(assert (=> d!82226 (= lt!382380 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82226 (= lt!382376 ((_ sign_extend 32) (size!5875 (buf!6350 (_1!11432 lt!381945)))))))

(assert (=> d!82226 (= lt!382378 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11734 (_1!11432 lt!381945))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11729 (_1!11432 lt!381945)))))))

(assert (=> d!82226 (invariant!0 (currentBit!11729 (_1!11432 lt!381945)) (currentByte!11734 (_1!11432 lt!381945)) (size!5875 (buf!6350 (_1!11432 lt!381945))))))

(assert (=> d!82226 (= (bitIndex!0 (size!5875 (buf!6350 (_1!11432 lt!381945))) (currentByte!11734 (_1!11432 lt!381945)) (currentBit!11729 (_1!11432 lt!381945))) lt!382378)))

(declare-fun b!245187 () Bool)

(declare-fun res!204988 () Bool)

(assert (=> b!245187 (=> (not res!204988) (not e!169903))))

(assert (=> b!245187 (= res!204988 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!382378))))

(declare-fun b!245188 () Bool)

(declare-fun lt!382379 () (_ BitVec 64))

(assert (=> b!245188 (= e!169903 (bvsle lt!382378 (bvmul lt!382379 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!245188 (or (= lt!382379 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!382379 #b0000000000000000000000000000000000000000000000000000000000001000) lt!382379)))))

(assert (=> b!245188 (= lt!382379 ((_ sign_extend 32) (size!5875 (buf!6350 (_1!11432 lt!381945)))))))

(assert (= (and d!82226 res!204989) b!245187))

(assert (= (and b!245187 res!204988) b!245188))

(declare-fun m!369749 () Bool)

(assert (=> d!82226 m!369749))

(declare-fun m!369751 () Bool)

(assert (=> d!82226 m!369751))

(assert (=> b!244978 d!82226))

(declare-fun d!82228 () Bool)

(declare-fun lt!382383 () tuple2!21038)

(declare-fun checkBitsLoop!0 (BitStream!10672 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21038)

(assert (=> d!82228 (= lt!382383 (checkBitsLoop!0 (_1!11433 lt!381955) nBits!297 bit!26 from!289))))

(assert (=> d!82228 (= (checkBitsLoopPure!0 (_1!11433 lt!381955) nBits!297 bit!26 from!289) (tuple2!21021 (_2!11441 lt!382383) (_1!11441 lt!382383)))))

(declare-fun bs!20807 () Bool)

(assert (= bs!20807 d!82228))

(declare-fun m!369753 () Bool)

(assert (=> bs!20807 m!369753))

(assert (=> b!244978 d!82228))

(declare-fun d!82230 () Bool)

(declare-fun lt!382384 () tuple2!21038)

(assert (=> d!82230 (= lt!382384 (readBit!0 (_1!11433 lt!381955)))))

(assert (=> d!82230 (= (readBitPure!0 (_1!11433 lt!381955)) (tuple2!21021 (_2!11441 lt!382384) (_1!11441 lt!382384)))))

(declare-fun bs!20808 () Bool)

(assert (= bs!20808 d!82230))

(declare-fun m!369755 () Bool)

(assert (=> bs!20808 m!369755))

(assert (=> b!244978 d!82230))

(declare-fun d!82232 () Bool)

(declare-fun res!204996 () Bool)

(declare-fun e!169908 () Bool)

(assert (=> d!82232 (=> (not res!204996) (not e!169908))))

(assert (=> d!82232 (= res!204996 (= (size!5875 (buf!6350 thiss!1005)) (size!5875 (buf!6350 (_2!11431 lt!381941)))))))

(assert (=> d!82232 (= (isPrefixOf!0 thiss!1005 (_2!11431 lt!381941)) e!169908)))

(declare-fun b!245195 () Bool)

(declare-fun res!204998 () Bool)

(assert (=> b!245195 (=> (not res!204998) (not e!169908))))

(assert (=> b!245195 (= res!204998 (bvsle (bitIndex!0 (size!5875 (buf!6350 thiss!1005)) (currentByte!11734 thiss!1005) (currentBit!11729 thiss!1005)) (bitIndex!0 (size!5875 (buf!6350 (_2!11431 lt!381941))) (currentByte!11734 (_2!11431 lt!381941)) (currentBit!11729 (_2!11431 lt!381941)))))))

(declare-fun b!245196 () Bool)

(declare-fun e!169909 () Bool)

(assert (=> b!245196 (= e!169908 e!169909)))

(declare-fun res!204997 () Bool)

(assert (=> b!245196 (=> res!204997 e!169909)))

(assert (=> b!245196 (= res!204997 (= (size!5875 (buf!6350 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!245197 () Bool)

(assert (=> b!245197 (= e!169909 (arrayBitRangesEq!0 (buf!6350 thiss!1005) (buf!6350 (_2!11431 lt!381941)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5875 (buf!6350 thiss!1005)) (currentByte!11734 thiss!1005) (currentBit!11729 thiss!1005))))))

(assert (= (and d!82232 res!204996) b!245195))

(assert (= (and b!245195 res!204998) b!245196))

(assert (= (and b!245196 (not res!204997)) b!245197))

(assert (=> b!245195 m!369357))

(assert (=> b!245195 m!369331))

(assert (=> b!245197 m!369357))

(assert (=> b!245197 m!369357))

(declare-fun m!369757 () Bool)

(assert (=> b!245197 m!369757))

(assert (=> b!244978 d!82232))

(declare-fun d!82234 () Bool)

(assert (=> d!82234 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5875 (buf!6350 (_2!11431 lt!381937)))) ((_ sign_extend 32) (currentByte!11734 (_2!11431 lt!381937))) ((_ sign_extend 32) (currentBit!11729 (_2!11431 lt!381937))) lt!381948) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5875 (buf!6350 (_2!11431 lt!381937)))) ((_ sign_extend 32) (currentByte!11734 (_2!11431 lt!381937))) ((_ sign_extend 32) (currentBit!11729 (_2!11431 lt!381937)))) lt!381948))))

(declare-fun bs!20809 () Bool)

(assert (= bs!20809 d!82234))

(declare-fun m!369759 () Bool)

(assert (=> bs!20809 m!369759))

(assert (=> b!244978 d!82234))

(declare-fun d!82236 () Bool)

(assert (=> d!82236 (validate_offset_bits!1 ((_ sign_extend 32) (size!5875 (buf!6350 (_2!11431 lt!381941)))) ((_ sign_extend 32) (currentByte!11734 thiss!1005)) ((_ sign_extend 32) (currentBit!11729 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!382387 () Unit!17851)

(declare-fun choose!9 (BitStream!10672 array!13400 (_ BitVec 64) BitStream!10672) Unit!17851)

(assert (=> d!82236 (= lt!382387 (choose!9 thiss!1005 (buf!6350 (_2!11431 lt!381941)) (bvsub nBits!297 from!289) (BitStream!10673 (buf!6350 (_2!11431 lt!381941)) (currentByte!11734 thiss!1005) (currentBit!11729 thiss!1005))))))

(assert (=> d!82236 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6350 (_2!11431 lt!381941)) (bvsub nBits!297 from!289)) lt!382387)))

(declare-fun bs!20810 () Bool)

(assert (= bs!20810 d!82236))

(assert (=> bs!20810 m!369365))

(declare-fun m!369761 () Bool)

(assert (=> bs!20810 m!369761))

(assert (=> b!244978 d!82236))

(declare-fun d!82238 () Bool)

(assert (=> d!82238 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5875 (buf!6350 (_2!11431 lt!381941)))) ((_ sign_extend 32) (currentByte!11734 thiss!1005)) ((_ sign_extend 32) (currentBit!11729 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5875 (buf!6350 (_2!11431 lt!381941)))) ((_ sign_extend 32) (currentByte!11734 thiss!1005)) ((_ sign_extend 32) (currentBit!11729 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20811 () Bool)

(assert (= bs!20811 d!82238))

(declare-fun m!369763 () Bool)

(assert (=> bs!20811 m!369763))

(assert (=> b!244978 d!82238))

(declare-fun b!245198 () Bool)

(declare-fun e!169911 () Unit!17851)

(declare-fun lt!382389 () Unit!17851)

(assert (=> b!245198 (= e!169911 lt!382389)))

(declare-fun lt!382403 () (_ BitVec 64))

(assert (=> b!245198 (= lt!382403 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!382405 () (_ BitVec 64))

(assert (=> b!245198 (= lt!382405 (bitIndex!0 (size!5875 (buf!6350 thiss!1005)) (currentByte!11734 thiss!1005) (currentBit!11729 thiss!1005)))))

(assert (=> b!245198 (= lt!382389 (arrayBitRangesEqSymmetric!0 (buf!6350 thiss!1005) (buf!6350 (_2!11431 lt!381941)) lt!382403 lt!382405))))

(assert (=> b!245198 (arrayBitRangesEq!0 (buf!6350 (_2!11431 lt!381941)) (buf!6350 thiss!1005) lt!382403 lt!382405)))

(declare-fun b!245199 () Bool)

(declare-fun res!205001 () Bool)

(declare-fun e!169910 () Bool)

(assert (=> b!245199 (=> (not res!205001) (not e!169910))))

(declare-fun lt!382400 () tuple2!21022)

(assert (=> b!245199 (= res!205001 (isPrefixOf!0 (_1!11433 lt!382400) thiss!1005))))

(declare-fun lt!382392 () (_ BitVec 64))

(declare-fun lt!382394 () (_ BitVec 64))

(declare-fun b!245200 () Bool)

(assert (=> b!245200 (= e!169910 (= (_1!11433 lt!382400) (withMovedBitIndex!0 (_2!11433 lt!382400) (bvsub lt!382392 lt!382394))))))

(assert (=> b!245200 (or (= (bvand lt!382392 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!382394 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!382392 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!382392 lt!382394) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245200 (= lt!382394 (bitIndex!0 (size!5875 (buf!6350 (_2!11431 lt!381941))) (currentByte!11734 (_2!11431 lt!381941)) (currentBit!11729 (_2!11431 lt!381941))))))

(assert (=> b!245200 (= lt!382392 (bitIndex!0 (size!5875 (buf!6350 thiss!1005)) (currentByte!11734 thiss!1005) (currentBit!11729 thiss!1005)))))

(declare-fun d!82240 () Bool)

(assert (=> d!82240 e!169910))

(declare-fun res!205000 () Bool)

(assert (=> d!82240 (=> (not res!205000) (not e!169910))))

(assert (=> d!82240 (= res!205000 (isPrefixOf!0 (_1!11433 lt!382400) (_2!11433 lt!382400)))))

(declare-fun lt!382388 () BitStream!10672)

(assert (=> d!82240 (= lt!382400 (tuple2!21023 lt!382388 (_2!11431 lt!381941)))))

(declare-fun lt!382397 () Unit!17851)

(declare-fun lt!382402 () Unit!17851)

(assert (=> d!82240 (= lt!382397 lt!382402)))

(assert (=> d!82240 (isPrefixOf!0 lt!382388 (_2!11431 lt!381941))))

(assert (=> d!82240 (= lt!382402 (lemmaIsPrefixTransitive!0 lt!382388 (_2!11431 lt!381941) (_2!11431 lt!381941)))))

(declare-fun lt!382398 () Unit!17851)

(declare-fun lt!382391 () Unit!17851)

(assert (=> d!82240 (= lt!382398 lt!382391)))

(assert (=> d!82240 (isPrefixOf!0 lt!382388 (_2!11431 lt!381941))))

(assert (=> d!82240 (= lt!382391 (lemmaIsPrefixTransitive!0 lt!382388 thiss!1005 (_2!11431 lt!381941)))))

(declare-fun lt!382401 () Unit!17851)

(assert (=> d!82240 (= lt!382401 e!169911)))

(declare-fun c!11484 () Bool)

(assert (=> d!82240 (= c!11484 (not (= (size!5875 (buf!6350 thiss!1005)) #b00000000000000000000000000000000)))))

(declare-fun lt!382393 () Unit!17851)

(declare-fun lt!382404 () Unit!17851)

(assert (=> d!82240 (= lt!382393 lt!382404)))

(assert (=> d!82240 (isPrefixOf!0 (_2!11431 lt!381941) (_2!11431 lt!381941))))

(assert (=> d!82240 (= lt!382404 (lemmaIsPrefixRefl!0 (_2!11431 lt!381941)))))

(declare-fun lt!382395 () Unit!17851)

(declare-fun lt!382399 () Unit!17851)

(assert (=> d!82240 (= lt!382395 lt!382399)))

(assert (=> d!82240 (= lt!382399 (lemmaIsPrefixRefl!0 (_2!11431 lt!381941)))))

(declare-fun lt!382396 () Unit!17851)

(declare-fun lt!382407 () Unit!17851)

(assert (=> d!82240 (= lt!382396 lt!382407)))

(assert (=> d!82240 (isPrefixOf!0 lt!382388 lt!382388)))

(assert (=> d!82240 (= lt!382407 (lemmaIsPrefixRefl!0 lt!382388))))

(declare-fun lt!382406 () Unit!17851)

(declare-fun lt!382390 () Unit!17851)

(assert (=> d!82240 (= lt!382406 lt!382390)))

(assert (=> d!82240 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!82240 (= lt!382390 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (=> d!82240 (= lt!382388 (BitStream!10673 (buf!6350 (_2!11431 lt!381941)) (currentByte!11734 thiss!1005) (currentBit!11729 thiss!1005)))))

(assert (=> d!82240 (isPrefixOf!0 thiss!1005 (_2!11431 lt!381941))))

(assert (=> d!82240 (= (reader!0 thiss!1005 (_2!11431 lt!381941)) lt!382400)))

(declare-fun b!245201 () Bool)

(declare-fun res!204999 () Bool)

(assert (=> b!245201 (=> (not res!204999) (not e!169910))))

(assert (=> b!245201 (= res!204999 (isPrefixOf!0 (_2!11433 lt!382400) (_2!11431 lt!381941)))))

(declare-fun b!245202 () Bool)

(declare-fun Unit!17860 () Unit!17851)

(assert (=> b!245202 (= e!169911 Unit!17860)))

(assert (= (and d!82240 c!11484) b!245198))

(assert (= (and d!82240 (not c!11484)) b!245202))

(assert (= (and d!82240 res!205000) b!245199))

(assert (= (and b!245199 res!205001) b!245201))

(assert (= (and b!245201 res!204999) b!245200))

(declare-fun m!369765 () Bool)

(assert (=> b!245199 m!369765))

(declare-fun m!369767 () Bool)

(assert (=> d!82240 m!369767))

(declare-fun m!369769 () Bool)

(assert (=> d!82240 m!369769))

(assert (=> d!82240 m!369711))

(assert (=> d!82240 m!369381))

(declare-fun m!369771 () Bool)

(assert (=> d!82240 m!369771))

(declare-fun m!369773 () Bool)

(assert (=> d!82240 m!369773))

(declare-fun m!369775 () Bool)

(assert (=> d!82240 m!369775))

(declare-fun m!369777 () Bool)

(assert (=> d!82240 m!369777))

(assert (=> d!82240 m!369721))

(declare-fun m!369779 () Bool)

(assert (=> d!82240 m!369779))

(declare-fun m!369781 () Bool)

(assert (=> d!82240 m!369781))

(declare-fun m!369783 () Bool)

(assert (=> b!245200 m!369783))

(assert (=> b!245200 m!369331))

(assert (=> b!245200 m!369357))

(declare-fun m!369785 () Bool)

(assert (=> b!245201 m!369785))

(assert (=> b!245198 m!369357))

(declare-fun m!369787 () Bool)

(assert (=> b!245198 m!369787))

(declare-fun m!369789 () Bool)

(assert (=> b!245198 m!369789))

(assert (=> b!244978 d!82240))

(declare-fun b!245214 () Bool)

(declare-fun e!169916 () Bool)

(declare-fun e!169917 () Bool)

(assert (=> b!245214 (= e!169916 e!169917)))

(declare-fun res!205010 () Bool)

(assert (=> b!245214 (=> (not res!205010) (not e!169917))))

(declare-fun lt!382417 () tuple2!21018)

(declare-fun lt!382418 () tuple2!21020)

(assert (=> b!245214 (= res!205010 (and (= (_2!11432 lt!382418) bit!26) (= (_1!11432 lt!382418) (_2!11431 lt!382417))))))

(assert (=> b!245214 (= lt!382418 (readBitPure!0 (readerFrom!0 (_2!11431 lt!382417) (currentBit!11729 thiss!1005) (currentByte!11734 thiss!1005))))))

(declare-fun b!245215 () Bool)

(assert (=> b!245215 (= e!169917 (= (bitIndex!0 (size!5875 (buf!6350 (_1!11432 lt!382418))) (currentByte!11734 (_1!11432 lt!382418)) (currentBit!11729 (_1!11432 lt!382418))) (bitIndex!0 (size!5875 (buf!6350 (_2!11431 lt!382417))) (currentByte!11734 (_2!11431 lt!382417)) (currentBit!11729 (_2!11431 lt!382417)))))))

(declare-fun b!245213 () Bool)

(declare-fun res!205011 () Bool)

(assert (=> b!245213 (=> (not res!205011) (not e!169916))))

(assert (=> b!245213 (= res!205011 (isPrefixOf!0 thiss!1005 (_2!11431 lt!382417)))))

(declare-fun d!82242 () Bool)

(assert (=> d!82242 e!169916))

(declare-fun res!205013 () Bool)

(assert (=> d!82242 (=> (not res!205013) (not e!169916))))

(assert (=> d!82242 (= res!205013 (= (size!5875 (buf!6350 thiss!1005)) (size!5875 (buf!6350 (_2!11431 lt!382417)))))))

(declare-fun choose!16 (BitStream!10672 Bool) tuple2!21018)

(assert (=> d!82242 (= lt!382417 (choose!16 thiss!1005 bit!26))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!82242 (validate_offset_bit!0 ((_ sign_extend 32) (size!5875 (buf!6350 thiss!1005))) ((_ sign_extend 32) (currentByte!11734 thiss!1005)) ((_ sign_extend 32) (currentBit!11729 thiss!1005)))))

(assert (=> d!82242 (= (appendBit!0 thiss!1005 bit!26) lt!382417)))

(declare-fun b!245212 () Bool)

(declare-fun res!205012 () Bool)

(assert (=> b!245212 (=> (not res!205012) (not e!169916))))

(declare-fun lt!382419 () (_ BitVec 64))

(declare-fun lt!382416 () (_ BitVec 64))

(assert (=> b!245212 (= res!205012 (= (bitIndex!0 (size!5875 (buf!6350 (_2!11431 lt!382417))) (currentByte!11734 (_2!11431 lt!382417)) (currentBit!11729 (_2!11431 lt!382417))) (bvadd lt!382419 lt!382416)))))

(assert (=> b!245212 (or (not (= (bvand lt!382419 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!382416 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!382419 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!382419 lt!382416) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245212 (= lt!382416 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!245212 (= lt!382419 (bitIndex!0 (size!5875 (buf!6350 thiss!1005)) (currentByte!11734 thiss!1005) (currentBit!11729 thiss!1005)))))

(assert (= (and d!82242 res!205013) b!245212))

(assert (= (and b!245212 res!205012) b!245213))

(assert (= (and b!245213 res!205011) b!245214))

(assert (= (and b!245214 res!205010) b!245215))

(declare-fun m!369791 () Bool)

(assert (=> d!82242 m!369791))

(declare-fun m!369793 () Bool)

(assert (=> d!82242 m!369793))

(declare-fun m!369795 () Bool)

(assert (=> b!245215 m!369795))

(declare-fun m!369797 () Bool)

(assert (=> b!245215 m!369797))

(assert (=> b!245212 m!369797))

(assert (=> b!245212 m!369357))

(declare-fun m!369799 () Bool)

(assert (=> b!245214 m!369799))

(assert (=> b!245214 m!369799))

(declare-fun m!369801 () Bool)

(assert (=> b!245214 m!369801))

(declare-fun m!369803 () Bool)

(assert (=> b!245213 m!369803))

(assert (=> b!244978 d!82242))

(declare-fun lt!382420 () tuple2!21038)

(declare-fun d!82244 () Bool)

(assert (=> d!82244 (= lt!382420 (checkBitsLoop!0 (_1!11433 lt!381957) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!82244 (= (checkBitsLoopPure!0 (_1!11433 lt!381957) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21021 (_2!11441 lt!382420) (_1!11441 lt!382420)))))

(declare-fun bs!20812 () Bool)

(assert (= bs!20812 d!82244))

(declare-fun m!369805 () Bool)

(assert (=> bs!20812 m!369805))

(assert (=> b!244978 d!82244))

(declare-fun d!82246 () Bool)

(declare-fun e!169918 () Bool)

(assert (=> d!82246 e!169918))

(declare-fun res!205015 () Bool)

(assert (=> d!82246 (=> (not res!205015) (not e!169918))))

(declare-fun lt!382421 () (_ BitVec 64))

(declare-fun lt!382423 () (_ BitVec 64))

(declare-fun lt!382424 () (_ BitVec 64))

(assert (=> d!82246 (= res!205015 (= lt!382424 (bvsub lt!382421 lt!382423)))))

(assert (=> d!82246 (or (= (bvand lt!382421 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!382423 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!382421 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!382421 lt!382423) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82246 (= lt!382423 (remainingBits!0 ((_ sign_extend 32) (size!5875 (buf!6350 (_1!11432 lt!381951)))) ((_ sign_extend 32) (currentByte!11734 (_1!11432 lt!381951))) ((_ sign_extend 32) (currentBit!11729 (_1!11432 lt!381951)))))))

(declare-fun lt!382422 () (_ BitVec 64))

(declare-fun lt!382426 () (_ BitVec 64))

(assert (=> d!82246 (= lt!382421 (bvmul lt!382422 lt!382426))))

(assert (=> d!82246 (or (= lt!382422 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!382426 (bvsdiv (bvmul lt!382422 lt!382426) lt!382422)))))

(assert (=> d!82246 (= lt!382426 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82246 (= lt!382422 ((_ sign_extend 32) (size!5875 (buf!6350 (_1!11432 lt!381951)))))))

(assert (=> d!82246 (= lt!382424 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11734 (_1!11432 lt!381951))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11729 (_1!11432 lt!381951)))))))

(assert (=> d!82246 (invariant!0 (currentBit!11729 (_1!11432 lt!381951)) (currentByte!11734 (_1!11432 lt!381951)) (size!5875 (buf!6350 (_1!11432 lt!381951))))))

(assert (=> d!82246 (= (bitIndex!0 (size!5875 (buf!6350 (_1!11432 lt!381951))) (currentByte!11734 (_1!11432 lt!381951)) (currentBit!11729 (_1!11432 lt!381951))) lt!382424)))

(declare-fun b!245216 () Bool)

(declare-fun res!205014 () Bool)

(assert (=> b!245216 (=> (not res!205014) (not e!169918))))

(assert (=> b!245216 (= res!205014 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!382424))))

(declare-fun b!245217 () Bool)

(declare-fun lt!382425 () (_ BitVec 64))

(assert (=> b!245217 (= e!169918 (bvsle lt!382424 (bvmul lt!382425 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!245217 (or (= lt!382425 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!382425 #b0000000000000000000000000000000000000000000000000000000000001000) lt!382425)))))

(assert (=> b!245217 (= lt!382425 ((_ sign_extend 32) (size!5875 (buf!6350 (_1!11432 lt!381951)))))))

(assert (= (and d!82246 res!205015) b!245216))

(assert (= (and b!245216 res!205014) b!245217))

(declare-fun m!369807 () Bool)

(assert (=> d!82246 m!369807))

(declare-fun m!369809 () Bool)

(assert (=> d!82246 m!369809))

(assert (=> b!244978 d!82246))

(declare-fun d!82248 () Bool)

(declare-fun e!169932 () Bool)

(assert (=> d!82248 e!169932))

(declare-fun res!205039 () Bool)

(assert (=> d!82248 (=> (not res!205039) (not e!169932))))

(declare-fun lt!382447 () tuple2!21018)

(assert (=> d!82248 (= res!205039 (= (size!5875 (buf!6350 (_2!11431 lt!381937))) (size!5875 (buf!6350 (_2!11431 lt!382447)))))))

(declare-fun choose!51 (BitStream!10672 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21018)

(assert (=> d!82248 (= lt!382447 (choose!51 (_2!11431 lt!381937) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!82248 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!82248 (= (appendNBitsLoop!0 (_2!11431 lt!381937) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!382447)))

(declare-fun b!245240 () Bool)

(declare-fun lt!382446 () tuple2!21020)

(declare-fun lt!382450 () tuple2!21022)

(assert (=> b!245240 (= e!169932 (and (_2!11432 lt!382446) (= (_1!11432 lt!382446) (_2!11433 lt!382450))))))

(assert (=> b!245240 (= lt!382446 (checkBitsLoopPure!0 (_1!11433 lt!382450) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!382448 () Unit!17851)

(declare-fun lt!382443 () Unit!17851)

(assert (=> b!245240 (= lt!382448 lt!382443)))

(declare-fun lt!382449 () (_ BitVec 64))

(assert (=> b!245240 (validate_offset_bits!1 ((_ sign_extend 32) (size!5875 (buf!6350 (_2!11431 lt!382447)))) ((_ sign_extend 32) (currentByte!11734 (_2!11431 lt!381937))) ((_ sign_extend 32) (currentBit!11729 (_2!11431 lt!381937))) lt!382449)))

(assert (=> b!245240 (= lt!382443 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11431 lt!381937) (buf!6350 (_2!11431 lt!382447)) lt!382449))))

(declare-fun e!169931 () Bool)

(assert (=> b!245240 e!169931))

(declare-fun res!205037 () Bool)

(assert (=> b!245240 (=> (not res!205037) (not e!169931))))

(assert (=> b!245240 (= res!205037 (and (= (size!5875 (buf!6350 (_2!11431 lt!381937))) (size!5875 (buf!6350 (_2!11431 lt!382447)))) (bvsge lt!382449 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245240 (= lt!382449 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!245240 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245240 (= lt!382450 (reader!0 (_2!11431 lt!381937) (_2!11431 lt!382447)))))

(declare-fun b!245239 () Bool)

(declare-fun res!205036 () Bool)

(assert (=> b!245239 (=> (not res!205036) (not e!169932))))

(assert (=> b!245239 (= res!205036 (isPrefixOf!0 (_2!11431 lt!381937) (_2!11431 lt!382447)))))

(declare-fun b!245241 () Bool)

(assert (=> b!245241 (= e!169931 (validate_offset_bits!1 ((_ sign_extend 32) (size!5875 (buf!6350 (_2!11431 lt!381937)))) ((_ sign_extend 32) (currentByte!11734 (_2!11431 lt!381937))) ((_ sign_extend 32) (currentBit!11729 (_2!11431 lt!381937))) lt!382449))))

(declare-fun b!245238 () Bool)

(declare-fun res!205038 () Bool)

(assert (=> b!245238 (=> (not res!205038) (not e!169932))))

(declare-fun lt!382444 () (_ BitVec 64))

(declare-fun lt!382445 () (_ BitVec 64))

(assert (=> b!245238 (= res!205038 (= (bitIndex!0 (size!5875 (buf!6350 (_2!11431 lt!382447))) (currentByte!11734 (_2!11431 lt!382447)) (currentBit!11729 (_2!11431 lt!382447))) (bvadd lt!382445 lt!382444)))))

(assert (=> b!245238 (or (not (= (bvand lt!382445 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!382444 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!382445 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!382445 lt!382444) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245238 (= lt!382444 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!245238 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245238 (= lt!382445 (bitIndex!0 (size!5875 (buf!6350 (_2!11431 lt!381937))) (currentByte!11734 (_2!11431 lt!381937)) (currentBit!11729 (_2!11431 lt!381937))))))

(assert (= (and d!82248 res!205039) b!245238))

(assert (= (and b!245238 res!205038) b!245239))

(assert (= (and b!245239 res!205036) b!245240))

(assert (= (and b!245240 res!205037) b!245241))

(declare-fun m!369817 () Bool)

(assert (=> b!245240 m!369817))

(declare-fun m!369819 () Bool)

(assert (=> b!245240 m!369819))

(declare-fun m!369821 () Bool)

(assert (=> b!245240 m!369821))

(declare-fun m!369823 () Bool)

(assert (=> b!245240 m!369823))

(declare-fun m!369825 () Bool)

(assert (=> b!245238 m!369825))

(assert (=> b!245238 m!369333))

(declare-fun m!369827 () Bool)

(assert (=> b!245241 m!369827))

(declare-fun m!369829 () Bool)

(assert (=> b!245239 m!369829))

(declare-fun m!369831 () Bool)

(assert (=> d!82248 m!369831))

(assert (=> b!244978 d!82248))

(declare-fun d!82260 () Bool)

(declare-fun lt!382451 () tuple2!21038)

(assert (=> d!82260 (= lt!382451 (readBit!0 lt!381947))))

(assert (=> d!82260 (= (readBitPure!0 lt!381947) (tuple2!21021 (_2!11441 lt!382451) (_1!11441 lt!382451)))))

(declare-fun bs!20814 () Bool)

(assert (= bs!20814 d!82260))

(declare-fun m!369833 () Bool)

(assert (=> bs!20814 m!369833))

(assert (=> b!244978 d!82260))

(declare-fun d!82262 () Bool)

(assert (=> d!82262 (validate_offset_bits!1 ((_ sign_extend 32) (size!5875 (buf!6350 (_2!11431 lt!381941)))) ((_ sign_extend 32) (currentByte!11734 (_2!11431 lt!381937))) ((_ sign_extend 32) (currentBit!11729 (_2!11431 lt!381937))) lt!381948)))

(declare-fun lt!382452 () Unit!17851)

(assert (=> d!82262 (= lt!382452 (choose!9 (_2!11431 lt!381937) (buf!6350 (_2!11431 lt!381941)) lt!381948 (BitStream!10673 (buf!6350 (_2!11431 lt!381941)) (currentByte!11734 (_2!11431 lt!381937)) (currentBit!11729 (_2!11431 lt!381937)))))))

(assert (=> d!82262 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11431 lt!381937) (buf!6350 (_2!11431 lt!381941)) lt!381948) lt!382452)))

(declare-fun bs!20815 () Bool)

(assert (= bs!20815 d!82262))

(assert (=> bs!20815 m!369363))

(declare-fun m!369835 () Bool)

(assert (=> bs!20815 m!369835))

(assert (=> b!244978 d!82262))

(declare-fun d!82264 () Bool)

(declare-fun e!169935 () Bool)

(assert (=> d!82264 e!169935))

(declare-fun res!205042 () Bool)

(assert (=> d!82264 (=> (not res!205042) (not e!169935))))

(assert (=> d!82264 (= res!205042 (or (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!382455 () Unit!17851)

(declare-fun choose!27 (BitStream!10672 BitStream!10672 (_ BitVec 64) (_ BitVec 64)) Unit!17851)

(assert (=> d!82264 (= lt!382455 (choose!27 thiss!1005 (_2!11431 lt!381937) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!82264 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!297 from!289)))))

(assert (=> d!82264 (= (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11431 lt!381937) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) lt!382455)))

(declare-fun b!245244 () Bool)

(assert (=> b!245244 (= e!169935 (validate_offset_bits!1 ((_ sign_extend 32) (size!5875 (buf!6350 (_2!11431 lt!381937)))) ((_ sign_extend 32) (currentByte!11734 (_2!11431 lt!381937))) ((_ sign_extend 32) (currentBit!11729 (_2!11431 lt!381937))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!82264 res!205042) b!245244))

(declare-fun m!369837 () Bool)

(assert (=> d!82264 m!369837))

(declare-fun m!369839 () Bool)

(assert (=> b!245244 m!369839))

(assert (=> b!244978 d!82264))

(declare-fun d!82266 () Bool)

(assert (=> d!82266 (= (invariant!0 (currentBit!11729 thiss!1005) (currentByte!11734 thiss!1005) (size!5875 (buf!6350 (_2!11431 lt!381941)))) (and (bvsge (currentBit!11729 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11729 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11734 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11734 thiss!1005) (size!5875 (buf!6350 (_2!11431 lt!381941)))) (and (= (currentBit!11729 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11734 thiss!1005) (size!5875 (buf!6350 (_2!11431 lt!381941))))))))))

(assert (=> b!244977 d!82266))

(declare-fun d!82268 () Bool)

(assert (=> d!82268 (= (array_inv!5616 (buf!6350 thiss!1005)) (bvsge (size!5875 (buf!6350 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!244975 d!82268))

(declare-fun lt!382456 () tuple2!21038)

(declare-fun d!82270 () Bool)

(assert (=> d!82270 (= lt!382456 (checkBitsLoop!0 (_1!11433 lt!381940) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!82270 (= (checkBitsLoopPure!0 (_1!11433 lt!381940) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21021 (_2!11441 lt!382456) (_1!11441 lt!382456)))))

(declare-fun bs!20816 () Bool)

(assert (= bs!20816 d!82270))

(declare-fun m!369841 () Bool)

(assert (=> bs!20816 m!369841))

(assert (=> b!244976 d!82270))

(declare-fun d!82272 () Bool)

(assert (=> d!82272 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5875 (buf!6350 (_2!11431 lt!381941)))) ((_ sign_extend 32) (currentByte!11734 (_2!11431 lt!381937))) ((_ sign_extend 32) (currentBit!11729 (_2!11431 lt!381937))) lt!381942) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5875 (buf!6350 (_2!11431 lt!381941)))) ((_ sign_extend 32) (currentByte!11734 (_2!11431 lt!381937))) ((_ sign_extend 32) (currentBit!11729 (_2!11431 lt!381937)))) lt!381942))))

(declare-fun bs!20817 () Bool)

(assert (= bs!20817 d!82272))

(assert (=> bs!20817 m!369747))

(assert (=> b!244976 d!82272))

(declare-fun d!82274 () Bool)

(assert (=> d!82274 (validate_offset_bits!1 ((_ sign_extend 32) (size!5875 (buf!6350 (_2!11431 lt!381941)))) ((_ sign_extend 32) (currentByte!11734 (_2!11431 lt!381937))) ((_ sign_extend 32) (currentBit!11729 (_2!11431 lt!381937))) lt!381942)))

(declare-fun lt!382457 () Unit!17851)

(assert (=> d!82274 (= lt!382457 (choose!9 (_2!11431 lt!381937) (buf!6350 (_2!11431 lt!381941)) lt!381942 (BitStream!10673 (buf!6350 (_2!11431 lt!381941)) (currentByte!11734 (_2!11431 lt!381937)) (currentBit!11729 (_2!11431 lt!381937)))))))

(assert (=> d!82274 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11431 lt!381937) (buf!6350 (_2!11431 lt!381941)) lt!381942) lt!382457)))

(declare-fun bs!20818 () Bool)

(assert (= bs!20818 d!82274))

(assert (=> bs!20818 m!369325))

(declare-fun m!369843 () Bool)

(assert (=> bs!20818 m!369843))

(assert (=> b!244976 d!82274))

(assert (=> b!244976 d!82218))

(declare-fun d!82276 () Bool)

(assert (=> d!82276 (= (invariant!0 (currentBit!11729 thiss!1005) (currentByte!11734 thiss!1005) (size!5875 (buf!6350 (_2!11431 lt!381937)))) (and (bvsge (currentBit!11729 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11729 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11734 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11734 thiss!1005) (size!5875 (buf!6350 (_2!11431 lt!381937)))) (and (= (currentBit!11729 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11734 thiss!1005) (size!5875 (buf!6350 (_2!11431 lt!381937))))))))))

(assert (=> b!244974 d!82276))

(declare-fun d!82278 () Bool)

(declare-fun res!205051 () Bool)

(declare-fun e!169941 () Bool)

(assert (=> d!82278 (=> (not res!205051) (not e!169941))))

(assert (=> d!82278 (= res!205051 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!5875 (buf!6350 (_1!11433 lt!381955))))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5875 (buf!6350 (_1!11433 lt!381955))))))))))

(assert (=> d!82278 (= (moveBitIndexPrecond!0 (_1!11433 lt!381955) #b0000000000000000000000000000000000000000000000000000000000000001) e!169941)))

(declare-fun b!245254 () Bool)

(declare-fun lt!382478 () (_ BitVec 64))

(assert (=> b!245254 (= e!169941 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!382478) (bvsle lt!382478 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5875 (buf!6350 (_1!11433 lt!381955))))))))))

(assert (=> b!245254 (= lt!382478 (bvadd (bitIndex!0 (size!5875 (buf!6350 (_1!11433 lt!381955))) (currentByte!11734 (_1!11433 lt!381955)) (currentBit!11729 (_1!11433 lt!381955))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!82278 res!205051) b!245254))

(declare-fun m!369849 () Bool)

(assert (=> b!245254 m!369849))

(assert (=> b!244985 d!82278))

(declare-fun d!82282 () Bool)

(declare-fun res!205054 () Bool)

(declare-fun e!169943 () Bool)

(assert (=> d!82282 (=> (not res!205054) (not e!169943))))

(assert (=> d!82282 (= res!205054 (= (size!5875 (buf!6350 (_2!11431 lt!381937))) (size!5875 (buf!6350 (_2!11431 lt!381941)))))))

(assert (=> d!82282 (= (isPrefixOf!0 (_2!11431 lt!381937) (_2!11431 lt!381941)) e!169943)))

(declare-fun b!245257 () Bool)

(declare-fun res!205056 () Bool)

(assert (=> b!245257 (=> (not res!205056) (not e!169943))))

(assert (=> b!245257 (= res!205056 (bvsle (bitIndex!0 (size!5875 (buf!6350 (_2!11431 lt!381937))) (currentByte!11734 (_2!11431 lt!381937)) (currentBit!11729 (_2!11431 lt!381937))) (bitIndex!0 (size!5875 (buf!6350 (_2!11431 lt!381941))) (currentByte!11734 (_2!11431 lt!381941)) (currentBit!11729 (_2!11431 lt!381941)))))))

(declare-fun b!245258 () Bool)

(declare-fun e!169944 () Bool)

(assert (=> b!245258 (= e!169943 e!169944)))

(declare-fun res!205055 () Bool)

(assert (=> b!245258 (=> res!205055 e!169944)))

(assert (=> b!245258 (= res!205055 (= (size!5875 (buf!6350 (_2!11431 lt!381937))) #b00000000000000000000000000000000))))

(declare-fun b!245259 () Bool)

(assert (=> b!245259 (= e!169944 (arrayBitRangesEq!0 (buf!6350 (_2!11431 lt!381937)) (buf!6350 (_2!11431 lt!381941)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5875 (buf!6350 (_2!11431 lt!381937))) (currentByte!11734 (_2!11431 lt!381937)) (currentBit!11729 (_2!11431 lt!381937)))))))

(assert (= (and d!82282 res!205054) b!245257))

(assert (= (and b!245257 res!205056) b!245258))

(assert (= (and b!245258 (not res!205055)) b!245259))

(assert (=> b!245257 m!369333))

(assert (=> b!245257 m!369331))

(assert (=> b!245259 m!369333))

(assert (=> b!245259 m!369333))

(declare-fun m!369855 () Bool)

(assert (=> b!245259 m!369855))

(assert (=> b!244983 d!82282))

(declare-fun d!82286 () Bool)

(declare-fun lt!382485 () tuple2!21038)

(assert (=> d!82286 (= lt!382485 (readBit!0 (readerFrom!0 (_2!11431 lt!381937) (currentBit!11729 thiss!1005) (currentByte!11734 thiss!1005))))))

(assert (=> d!82286 (= (readBitPure!0 (readerFrom!0 (_2!11431 lt!381937) (currentBit!11729 thiss!1005) (currentByte!11734 thiss!1005))) (tuple2!21021 (_2!11441 lt!382485) (_1!11441 lt!382485)))))

(declare-fun bs!20819 () Bool)

(assert (= bs!20819 d!82286))

(assert (=> bs!20819 m!369341))

(declare-fun m!369857 () Bool)

(assert (=> bs!20819 m!369857))

(assert (=> b!244973 d!82286))

(declare-fun d!82288 () Bool)

(declare-fun e!169947 () Bool)

(assert (=> d!82288 e!169947))

(declare-fun res!205060 () Bool)

(assert (=> d!82288 (=> (not res!205060) (not e!169947))))

(assert (=> d!82288 (= res!205060 (invariant!0 (currentBit!11729 (_2!11431 lt!381937)) (currentByte!11734 (_2!11431 lt!381937)) (size!5875 (buf!6350 (_2!11431 lt!381937)))))))

(assert (=> d!82288 (= (readerFrom!0 (_2!11431 lt!381937) (currentBit!11729 thiss!1005) (currentByte!11734 thiss!1005)) (BitStream!10673 (buf!6350 (_2!11431 lt!381937)) (currentByte!11734 thiss!1005) (currentBit!11729 thiss!1005)))))

(declare-fun b!245262 () Bool)

(assert (=> b!245262 (= e!169947 (invariant!0 (currentBit!11729 thiss!1005) (currentByte!11734 thiss!1005) (size!5875 (buf!6350 (_2!11431 lt!381937)))))))

(assert (= (and d!82288 res!205060) b!245262))

(declare-fun m!369859 () Bool)

(assert (=> d!82288 m!369859))

(assert (=> b!245262 m!369339))

(assert (=> b!244973 d!82288))

(declare-fun d!82290 () Bool)

(declare-fun e!169948 () Bool)

(assert (=> d!82290 e!169948))

(declare-fun res!205062 () Bool)

(assert (=> d!82290 (=> (not res!205062) (not e!169948))))

(declare-fun lt!382489 () (_ BitVec 64))

(declare-fun lt!382488 () (_ BitVec 64))

(declare-fun lt!382486 () (_ BitVec 64))

(assert (=> d!82290 (= res!205062 (= lt!382489 (bvsub lt!382486 lt!382488)))))

(assert (=> d!82290 (or (= (bvand lt!382486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!382488 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!382486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!382486 lt!382488) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82290 (= lt!382488 (remainingBits!0 ((_ sign_extend 32) (size!5875 (buf!6350 (_2!11431 lt!381937)))) ((_ sign_extend 32) (currentByte!11734 (_2!11431 lt!381937))) ((_ sign_extend 32) (currentBit!11729 (_2!11431 lt!381937)))))))

(declare-fun lt!382487 () (_ BitVec 64))

(declare-fun lt!382491 () (_ BitVec 64))

(assert (=> d!82290 (= lt!382486 (bvmul lt!382487 lt!382491))))

(assert (=> d!82290 (or (= lt!382487 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!382491 (bvsdiv (bvmul lt!382487 lt!382491) lt!382487)))))

(assert (=> d!82290 (= lt!382491 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82290 (= lt!382487 ((_ sign_extend 32) (size!5875 (buf!6350 (_2!11431 lt!381937)))))))

(assert (=> d!82290 (= lt!382489 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11734 (_2!11431 lt!381937))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11729 (_2!11431 lt!381937)))))))

(assert (=> d!82290 (invariant!0 (currentBit!11729 (_2!11431 lt!381937)) (currentByte!11734 (_2!11431 lt!381937)) (size!5875 (buf!6350 (_2!11431 lt!381937))))))

(assert (=> d!82290 (= (bitIndex!0 (size!5875 (buf!6350 (_2!11431 lt!381937))) (currentByte!11734 (_2!11431 lt!381937)) (currentBit!11729 (_2!11431 lt!381937))) lt!382489)))

(declare-fun b!245263 () Bool)

(declare-fun res!205061 () Bool)

(assert (=> b!245263 (=> (not res!205061) (not e!169948))))

(assert (=> b!245263 (= res!205061 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!382489))))

(declare-fun b!245264 () Bool)

(declare-fun lt!382490 () (_ BitVec 64))

(assert (=> b!245264 (= e!169948 (bvsle lt!382489 (bvmul lt!382490 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!245264 (or (= lt!382490 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!382490 #b0000000000000000000000000000000000000000000000000000000000001000) lt!382490)))))

(assert (=> b!245264 (= lt!382490 ((_ sign_extend 32) (size!5875 (buf!6350 (_2!11431 lt!381937)))))))

(assert (= (and d!82290 res!205062) b!245263))

(assert (= (and b!245263 res!205061) b!245264))

(assert (=> d!82290 m!369759))

(assert (=> d!82290 m!369859))

(assert (=> b!244984 d!82290))

(declare-fun d!82292 () Bool)

(declare-fun e!169949 () Bool)

(assert (=> d!82292 e!169949))

(declare-fun res!205064 () Bool)

(assert (=> d!82292 (=> (not res!205064) (not e!169949))))

(declare-fun lt!382492 () (_ BitVec 64))

(declare-fun lt!382495 () (_ BitVec 64))

(declare-fun lt!382494 () (_ BitVec 64))

(assert (=> d!82292 (= res!205064 (= lt!382495 (bvsub lt!382492 lt!382494)))))

(assert (=> d!82292 (or (= (bvand lt!382492 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!382494 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!382492 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!382492 lt!382494) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82292 (= lt!382494 (remainingBits!0 ((_ sign_extend 32) (size!5875 (buf!6350 thiss!1005))) ((_ sign_extend 32) (currentByte!11734 thiss!1005)) ((_ sign_extend 32) (currentBit!11729 thiss!1005))))))

(declare-fun lt!382493 () (_ BitVec 64))

(declare-fun lt!382497 () (_ BitVec 64))

(assert (=> d!82292 (= lt!382492 (bvmul lt!382493 lt!382497))))

(assert (=> d!82292 (or (= lt!382493 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!382497 (bvsdiv (bvmul lt!382493 lt!382497) lt!382493)))))

(assert (=> d!82292 (= lt!382497 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82292 (= lt!382493 ((_ sign_extend 32) (size!5875 (buf!6350 thiss!1005))))))

(assert (=> d!82292 (= lt!382495 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11734 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11729 thiss!1005))))))

(assert (=> d!82292 (invariant!0 (currentBit!11729 thiss!1005) (currentByte!11734 thiss!1005) (size!5875 (buf!6350 thiss!1005)))))

(assert (=> d!82292 (= (bitIndex!0 (size!5875 (buf!6350 thiss!1005)) (currentByte!11734 thiss!1005) (currentBit!11729 thiss!1005)) lt!382495)))

(declare-fun b!245265 () Bool)

(declare-fun res!205063 () Bool)

(assert (=> b!245265 (=> (not res!205063) (not e!169949))))

(assert (=> b!245265 (= res!205063 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!382495))))

(declare-fun b!245266 () Bool)

(declare-fun lt!382496 () (_ BitVec 64))

(assert (=> b!245266 (= e!169949 (bvsle lt!382495 (bvmul lt!382496 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!245266 (or (= lt!382496 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!382496 #b0000000000000000000000000000000000000000000000000000000000001000) lt!382496)))))

(assert (=> b!245266 (= lt!382496 ((_ sign_extend 32) (size!5875 (buf!6350 thiss!1005))))))

(assert (= (and d!82292 res!205064) b!245265))

(assert (= (and b!245265 res!205063) b!245266))

(declare-fun m!369861 () Bool)

(assert (=> d!82292 m!369861))

(declare-fun m!369863 () Bool)

(assert (=> d!82292 m!369863))

(assert (=> b!244984 d!82292))

(declare-fun d!82294 () Bool)

(declare-fun e!169950 () Bool)

(assert (=> d!82294 e!169950))

(declare-fun res!205066 () Bool)

(assert (=> d!82294 (=> (not res!205066) (not e!169950))))

(declare-fun lt!382501 () (_ BitVec 64))

(declare-fun lt!382500 () (_ BitVec 64))

(declare-fun lt!382498 () (_ BitVec 64))

(assert (=> d!82294 (= res!205066 (= lt!382501 (bvsub lt!382498 lt!382500)))))

(assert (=> d!82294 (or (= (bvand lt!382498 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!382500 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!382498 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!382498 lt!382500) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82294 (= lt!382500 (remainingBits!0 ((_ sign_extend 32) (size!5875 (buf!6350 (_2!11431 lt!381941)))) ((_ sign_extend 32) (currentByte!11734 (_2!11431 lt!381941))) ((_ sign_extend 32) (currentBit!11729 (_2!11431 lt!381941)))))))

(declare-fun lt!382499 () (_ BitVec 64))

(declare-fun lt!382503 () (_ BitVec 64))

(assert (=> d!82294 (= lt!382498 (bvmul lt!382499 lt!382503))))

(assert (=> d!82294 (or (= lt!382499 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!382503 (bvsdiv (bvmul lt!382499 lt!382503) lt!382499)))))

(assert (=> d!82294 (= lt!382503 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82294 (= lt!382499 ((_ sign_extend 32) (size!5875 (buf!6350 (_2!11431 lt!381941)))))))

(assert (=> d!82294 (= lt!382501 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11734 (_2!11431 lt!381941))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11729 (_2!11431 lt!381941)))))))

(assert (=> d!82294 (invariant!0 (currentBit!11729 (_2!11431 lt!381941)) (currentByte!11734 (_2!11431 lt!381941)) (size!5875 (buf!6350 (_2!11431 lt!381941))))))

(assert (=> d!82294 (= (bitIndex!0 (size!5875 (buf!6350 (_2!11431 lt!381941))) (currentByte!11734 (_2!11431 lt!381941)) (currentBit!11729 (_2!11431 lt!381941))) lt!382501)))

(declare-fun b!245267 () Bool)

(declare-fun res!205065 () Bool)

(assert (=> b!245267 (=> (not res!205065) (not e!169950))))

(assert (=> b!245267 (= res!205065 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!382501))))

(declare-fun b!245268 () Bool)

(declare-fun lt!382502 () (_ BitVec 64))

(assert (=> b!245268 (= e!169950 (bvsle lt!382501 (bvmul lt!382502 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!245268 (or (= lt!382502 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!382502 #b0000000000000000000000000000000000000000000000000000000000001000) lt!382502)))))

(assert (=> b!245268 (= lt!382502 ((_ sign_extend 32) (size!5875 (buf!6350 (_2!11431 lt!381941)))))))

(assert (= (and d!82294 res!205066) b!245267))

(assert (= (and b!245267 res!205065) b!245268))

(declare-fun m!369865 () Bool)

(assert (=> d!82294 m!369865))

(declare-fun m!369867 () Bool)

(assert (=> d!82294 m!369867))

(assert (=> b!244971 d!82294))

(assert (=> b!244971 d!82290))

(declare-fun d!82296 () Bool)

(declare-fun res!205067 () Bool)

(declare-fun e!169951 () Bool)

(assert (=> d!82296 (=> (not res!205067) (not e!169951))))

(assert (=> d!82296 (= res!205067 (= (size!5875 (buf!6350 thiss!1005)) (size!5875 (buf!6350 (_2!11431 lt!381937)))))))

(assert (=> d!82296 (= (isPrefixOf!0 thiss!1005 (_2!11431 lt!381937)) e!169951)))

(declare-fun b!245269 () Bool)

(declare-fun res!205069 () Bool)

(assert (=> b!245269 (=> (not res!205069) (not e!169951))))

(assert (=> b!245269 (= res!205069 (bvsle (bitIndex!0 (size!5875 (buf!6350 thiss!1005)) (currentByte!11734 thiss!1005) (currentBit!11729 thiss!1005)) (bitIndex!0 (size!5875 (buf!6350 (_2!11431 lt!381937))) (currentByte!11734 (_2!11431 lt!381937)) (currentBit!11729 (_2!11431 lt!381937)))))))

(declare-fun b!245270 () Bool)

(declare-fun e!169952 () Bool)

(assert (=> b!245270 (= e!169951 e!169952)))

(declare-fun res!205068 () Bool)

(assert (=> b!245270 (=> res!205068 e!169952)))

(assert (=> b!245270 (= res!205068 (= (size!5875 (buf!6350 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!245271 () Bool)

(assert (=> b!245271 (= e!169952 (arrayBitRangesEq!0 (buf!6350 thiss!1005) (buf!6350 (_2!11431 lt!381937)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5875 (buf!6350 thiss!1005)) (currentByte!11734 thiss!1005) (currentBit!11729 thiss!1005))))))

(assert (= (and d!82296 res!205067) b!245269))

(assert (= (and b!245269 res!205069) b!245270))

(assert (= (and b!245270 (not res!205068)) b!245271))

(assert (=> b!245269 m!369357))

(assert (=> b!245269 m!369333))

(assert (=> b!245271 m!369357))

(assert (=> b!245271 m!369357))

(declare-fun m!369869 () Bool)

(assert (=> b!245271 m!369869))

(assert (=> b!244982 d!82296))

(declare-fun d!82298 () Bool)

(assert (=> d!82298 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11729 thiss!1005) (currentByte!11734 thiss!1005) (size!5875 (buf!6350 thiss!1005))))))

(declare-fun bs!20820 () Bool)

(assert (= bs!20820 d!82298))

(assert (=> bs!20820 m!369863))

(assert (=> start!52874 d!82298))

(declare-fun d!82300 () Bool)

(assert (=> d!82300 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5875 (buf!6350 thiss!1005))) ((_ sign_extend 32) (currentByte!11734 thiss!1005)) ((_ sign_extend 32) (currentBit!11729 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5875 (buf!6350 thiss!1005))) ((_ sign_extend 32) (currentByte!11734 thiss!1005)) ((_ sign_extend 32) (currentBit!11729 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20821 () Bool)

(assert (= bs!20821 d!82300))

(assert (=> bs!20821 m!369861))

(assert (=> b!244972 d!82300))

(declare-fun d!82302 () Bool)

(declare-fun e!169953 () Bool)

(assert (=> d!82302 e!169953))

(declare-fun res!205071 () Bool)

(assert (=> d!82302 (=> (not res!205071) (not e!169953))))

(declare-fun lt!382504 () (_ BitVec 64))

(declare-fun lt!382506 () (_ BitVec 64))

(declare-fun lt!382507 () (_ BitVec 64))

(assert (=> d!82302 (= res!205071 (= lt!382507 (bvsub lt!382504 lt!382506)))))

(assert (=> d!82302 (or (= (bvand lt!382504 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!382506 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!382504 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!382504 lt!382506) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82302 (= lt!382506 (remainingBits!0 ((_ sign_extend 32) (size!5875 (buf!6350 (_1!11432 lt!381938)))) ((_ sign_extend 32) (currentByte!11734 (_1!11432 lt!381938))) ((_ sign_extend 32) (currentBit!11729 (_1!11432 lt!381938)))))))

(declare-fun lt!382505 () (_ BitVec 64))

(declare-fun lt!382509 () (_ BitVec 64))

(assert (=> d!82302 (= lt!382504 (bvmul lt!382505 lt!382509))))

(assert (=> d!82302 (or (= lt!382505 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!382509 (bvsdiv (bvmul lt!382505 lt!382509) lt!382505)))))

(assert (=> d!82302 (= lt!382509 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82302 (= lt!382505 ((_ sign_extend 32) (size!5875 (buf!6350 (_1!11432 lt!381938)))))))

(assert (=> d!82302 (= lt!382507 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11734 (_1!11432 lt!381938))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11729 (_1!11432 lt!381938)))))))

(assert (=> d!82302 (invariant!0 (currentBit!11729 (_1!11432 lt!381938)) (currentByte!11734 (_1!11432 lt!381938)) (size!5875 (buf!6350 (_1!11432 lt!381938))))))

(assert (=> d!82302 (= (bitIndex!0 (size!5875 (buf!6350 (_1!11432 lt!381938))) (currentByte!11734 (_1!11432 lt!381938)) (currentBit!11729 (_1!11432 lt!381938))) lt!382507)))

(declare-fun b!245272 () Bool)

(declare-fun res!205070 () Bool)

(assert (=> b!245272 (=> (not res!205070) (not e!169953))))

(assert (=> b!245272 (= res!205070 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!382507))))

(declare-fun b!245273 () Bool)

(declare-fun lt!382508 () (_ BitVec 64))

(assert (=> b!245273 (= e!169953 (bvsle lt!382507 (bvmul lt!382508 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!245273 (or (= lt!382508 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!382508 #b0000000000000000000000000000000000000000000000000000000000001000) lt!382508)))))

(assert (=> b!245273 (= lt!382508 ((_ sign_extend 32) (size!5875 (buf!6350 (_1!11432 lt!381938)))))))

(assert (= (and d!82302 res!205071) b!245272))

(assert (= (and b!245272 res!205070) b!245273))

(declare-fun m!369871 () Bool)

(assert (=> d!82302 m!369871))

(declare-fun m!369873 () Bool)

(assert (=> d!82302 m!369873))

(assert (=> b!244981 d!82302))

(push 1)

(assert (not d!82292))

(assert (not d!82246))

(assert (not b!245215))

(assert (not d!82274))

(assert (not d!82236))

(assert (not b!245213))

(assert (not b!245238))

(assert (not d!82262))

(assert (not d!82234))

(assert (not b!245241))

(assert (not b!245214))

(assert (not d!82218))

(assert (not b!245271))

(assert (not b!245200))

(assert (not b!245176))

(assert (not b!245259))

(assert (not d!82248))

(assert (not b!245197))

(assert (not b!245244))

(assert (not b!245178))

(assert (not d!82224))

(assert (not d!82228))

(assert (not d!82264))

(assert (not d!82270))

(assert (not d!82294))

(assert (not b!245254))

(assert (not d!82298))

(assert (not d!82220))

(assert (not b!245199))

(assert (not b!245257))

(assert (not d!82260))

(assert (not d!82290))

(assert (not b!245195))

(assert (not b!245177))

(assert (not b!245212))

(assert (not b!245239))

(assert (not d!82242))

(assert (not b!245269))

(assert (not b!245240))

(assert (not b!245175))

(assert (not d!82240))

(assert (not d!82244))

(assert (not b!245262))

(assert (not d!82238))

(assert (not d!82300))

(assert (not d!82288))

(assert (not d!82272))

(assert (not d!82222))

(assert (not b!245201))

(assert (not d!82216))

(assert (not d!82286))

(assert (not d!82230))

(assert (not b!245198))

(assert (not d!82226))

(assert (not d!82302))

(check-sat)

(pop 1)

(push 1)

(check-sat)

