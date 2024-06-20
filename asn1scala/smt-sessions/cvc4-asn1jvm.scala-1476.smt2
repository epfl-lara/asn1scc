; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40860 () Bool)

(assert start!40860)

(declare-fun b!188123 () Bool)

(declare-fun res!156718 () Bool)

(declare-fun e!130015 () Bool)

(assert (=> b!188123 (=> (not res!156718) (not e!130015))))

(declare-datatypes ((array!9855 0))(
  ( (array!9856 (arr!5274 (Array (_ BitVec 32) (_ BitVec 8))) (size!4344 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7796 0))(
  ( (BitStream!7797 (buf!4815 array!9855) (currentByte!9081 (_ BitVec 32)) (currentBit!9076 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7796)

(declare-datatypes ((Unit!13448 0))(
  ( (Unit!13449) )
))
(declare-datatypes ((tuple2!16248 0))(
  ( (tuple2!16249 (_1!8769 Unit!13448) (_2!8769 BitStream!7796)) )
))
(declare-fun lt!291888 () tuple2!16248)

(declare-fun isPrefixOf!0 (BitStream!7796 BitStream!7796) Bool)

(assert (=> b!188123 (= res!156718 (isPrefixOf!0 thiss!1204 (_2!8769 lt!291888)))))

(declare-fun b!188124 () Bool)

(declare-fun res!156717 () Bool)

(declare-fun e!130011 () Bool)

(assert (=> b!188124 (=> res!156717 e!130011)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!291892 () (_ BitVec 64))

(declare-fun lt!291884 () tuple2!16248)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!291886 () (_ BitVec 64))

(assert (=> b!188124 (= res!156717 (or (not (= (size!4344 (buf!4815 (_2!8769 lt!291884))) (size!4344 (buf!4815 thiss!1204)))) (not (= lt!291892 (bvsub (bvadd lt!291886 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!188125 () Bool)

(declare-fun e!130018 () Bool)

(declare-fun e!130007 () Bool)

(assert (=> b!188125 (= e!130018 e!130007)))

(declare-fun res!156720 () Bool)

(assert (=> b!188125 (=> res!156720 e!130007)))

(declare-datatypes ((tuple2!16250 0))(
  ( (tuple2!16251 (_1!8770 BitStream!7796) (_2!8770 BitStream!7796)) )
))
(declare-fun lt!291891 () tuple2!16250)

(declare-fun lt!291873 () BitStream!7796)

(assert (=> b!188125 (= res!156720 (not (= (_1!8770 lt!291891) lt!291873)))))

(declare-fun e!130010 () Bool)

(assert (=> b!188125 e!130010))

(declare-fun res!156731 () Bool)

(assert (=> b!188125 (=> (not res!156731) (not e!130010))))

(declare-datatypes ((tuple2!16252 0))(
  ( (tuple2!16253 (_1!8771 BitStream!7796) (_2!8771 (_ BitVec 64))) )
))
(declare-fun lt!291883 () tuple2!16252)

(declare-fun lt!291882 () tuple2!16252)

(assert (=> b!188125 (= res!156731 (and (= (_2!8771 lt!291883) (_2!8771 lt!291882)) (= (_1!8771 lt!291883) (_1!8771 lt!291882))))))

(declare-fun lt!291890 () Unit!13448)

(declare-fun lt!291865 () tuple2!16250)

(declare-fun lt!291880 () (_ BitVec 64))

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7796 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13448)

(assert (=> b!188125 (= lt!291890 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8770 lt!291865) nBits!348 i!590 lt!291880))))

(declare-fun lt!291872 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7796 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16252)

(assert (=> b!188125 (= lt!291882 (readNBitsLSBFirstsLoopPure!0 lt!291873 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!291872))))

(declare-fun withMovedBitIndex!0 (BitStream!7796 (_ BitVec 64)) BitStream!7796)

(assert (=> b!188125 (= lt!291873 (withMovedBitIndex!0 (_1!8770 lt!291865) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!188126 () Bool)

(declare-fun res!156722 () Bool)

(assert (=> b!188126 (=> res!156722 e!130011)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!188126 (= res!156722 (not (invariant!0 (currentBit!9076 (_2!8769 lt!291884)) (currentByte!9081 (_2!8769 lt!291884)) (size!4344 (buf!4815 (_2!8769 lt!291884))))))))

(declare-fun b!188127 () Bool)

(declare-fun e!130012 () Bool)

(assert (=> b!188127 (= e!130012 (invariant!0 (currentBit!9076 thiss!1204) (currentByte!9081 thiss!1204) (size!4344 (buf!4815 (_2!8769 lt!291884)))))))

(declare-fun b!188128 () Bool)

(assert (=> b!188128 (= e!130011 e!130018)))

(declare-fun res!156723 () Bool)

(assert (=> b!188128 (=> res!156723 e!130018)))

(declare-fun lt!291885 () tuple2!16252)

(assert (=> b!188128 (= res!156723 (not (= (_1!8771 lt!291885) (_2!8770 lt!291891))))))

(assert (=> b!188128 (= lt!291885 (readNBitsLSBFirstsLoopPure!0 (_1!8770 lt!291891) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!291872))))

(declare-fun lt!291876 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!188128 (validate_offset_bits!1 ((_ sign_extend 32) (size!4344 (buf!4815 (_2!8769 lt!291884)))) ((_ sign_extend 32) (currentByte!9081 (_2!8769 lt!291888))) ((_ sign_extend 32) (currentBit!9076 (_2!8769 lt!291888))) lt!291876)))

(declare-fun lt!291869 () Unit!13448)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7796 array!9855 (_ BitVec 64)) Unit!13448)

(assert (=> b!188128 (= lt!291869 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8769 lt!291888) (buf!4815 (_2!8769 lt!291884)) lt!291876))))

(assert (=> b!188128 (= lt!291876 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!16254 0))(
  ( (tuple2!16255 (_1!8772 BitStream!7796) (_2!8772 Bool)) )
))
(declare-fun lt!291868 () tuple2!16254)

(declare-fun lt!291887 () (_ BitVec 64))

(assert (=> b!188128 (= lt!291872 (bvor lt!291880 (ite (_2!8772 lt!291868) lt!291887 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!188128 (= lt!291883 (readNBitsLSBFirstsLoopPure!0 (_1!8770 lt!291865) nBits!348 i!590 lt!291880))))

(declare-fun lt!291870 () (_ BitVec 64))

(assert (=> b!188128 (validate_offset_bits!1 ((_ sign_extend 32) (size!4344 (buf!4815 (_2!8769 lt!291884)))) ((_ sign_extend 32) (currentByte!9081 thiss!1204)) ((_ sign_extend 32) (currentBit!9076 thiss!1204)) lt!291870)))

(declare-fun lt!291874 () Unit!13448)

(assert (=> b!188128 (= lt!291874 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4815 (_2!8769 lt!291884)) lt!291870))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!188128 (= lt!291880 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!291889 () Bool)

(assert (=> b!188128 (= (_2!8772 lt!291868) lt!291889)))

(declare-fun readBitPure!0 (BitStream!7796) tuple2!16254)

(assert (=> b!188128 (= lt!291868 (readBitPure!0 (_1!8770 lt!291865)))))

(declare-fun reader!0 (BitStream!7796 BitStream!7796) tuple2!16250)

(assert (=> b!188128 (= lt!291891 (reader!0 (_2!8769 lt!291888) (_2!8769 lt!291884)))))

(assert (=> b!188128 (= lt!291865 (reader!0 thiss!1204 (_2!8769 lt!291884)))))

(declare-fun e!130016 () Bool)

(assert (=> b!188128 e!130016))

(declare-fun res!156725 () Bool)

(assert (=> b!188128 (=> (not res!156725) (not e!130016))))

(declare-fun lt!291878 () tuple2!16254)

(declare-fun lt!291864 () tuple2!16254)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!188128 (= res!156725 (= (bitIndex!0 (size!4344 (buf!4815 (_1!8772 lt!291878))) (currentByte!9081 (_1!8772 lt!291878)) (currentBit!9076 (_1!8772 lt!291878))) (bitIndex!0 (size!4344 (buf!4815 (_1!8772 lt!291864))) (currentByte!9081 (_1!8772 lt!291864)) (currentBit!9076 (_1!8772 lt!291864)))))))

(declare-fun lt!291867 () Unit!13448)

(declare-fun lt!291879 () BitStream!7796)

(declare-fun readBitPrefixLemma!0 (BitStream!7796 BitStream!7796) Unit!13448)

(assert (=> b!188128 (= lt!291867 (readBitPrefixLemma!0 lt!291879 (_2!8769 lt!291884)))))

(assert (=> b!188128 (= lt!291864 (readBitPure!0 (BitStream!7797 (buf!4815 (_2!8769 lt!291884)) (currentByte!9081 thiss!1204) (currentBit!9076 thiss!1204))))))

(assert (=> b!188128 (= lt!291878 (readBitPure!0 lt!291879))))

(assert (=> b!188128 e!130012))

(declare-fun res!156714 () Bool)

(assert (=> b!188128 (=> (not res!156714) (not e!130012))))

(assert (=> b!188128 (= res!156714 (invariant!0 (currentBit!9076 thiss!1204) (currentByte!9081 thiss!1204) (size!4344 (buf!4815 (_2!8769 lt!291888)))))))

(assert (=> b!188128 (= lt!291879 (BitStream!7797 (buf!4815 (_2!8769 lt!291888)) (currentByte!9081 thiss!1204) (currentBit!9076 thiss!1204)))))

(declare-fun b!188129 () Bool)

(declare-fun e!130014 () Bool)

(declare-fun lt!291875 () tuple2!16254)

(declare-fun lt!291877 () (_ BitVec 64))

(assert (=> b!188129 (= e!130014 (= (bitIndex!0 (size!4344 (buf!4815 (_1!8772 lt!291875))) (currentByte!9081 (_1!8772 lt!291875)) (currentBit!9076 (_1!8772 lt!291875))) lt!291877))))

(declare-fun b!188130 () Bool)

(declare-fun e!130008 () Bool)

(declare-fun array_inv!4085 (array!9855) Bool)

(assert (=> b!188130 (= e!130008 (array_inv!4085 (buf!4815 thiss!1204)))))

(declare-fun b!188131 () Bool)

(assert (=> b!188131 (= e!130007 (invariant!0 (currentBit!9076 (_2!8770 lt!291865)) (currentByte!9081 (_2!8770 lt!291865)) (size!4344 (buf!4815 (_2!8770 lt!291865)))))))

(declare-fun b!188132 () Bool)

(declare-fun res!156729 () Bool)

(assert (=> b!188132 (=> res!156729 e!130011)))

(assert (=> b!188132 (= res!156729 (not (isPrefixOf!0 thiss!1204 (_2!8769 lt!291888))))))

(declare-fun b!188133 () Bool)

(declare-fun lt!291881 () (_ BitVec 64))

(assert (=> b!188133 (= e!130010 (and (= lt!291886 (bvsub lt!291881 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!8770 lt!291891) lt!291873)) (= (_2!8771 lt!291883) (_2!8771 lt!291885)))))))

(declare-fun res!156713 () Bool)

(declare-fun e!130019 () Bool)

(assert (=> start!40860 (=> (not res!156713) (not e!130019))))

(assert (=> start!40860 (= res!156713 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40860 e!130019))

(assert (=> start!40860 true))

(declare-fun inv!12 (BitStream!7796) Bool)

(assert (=> start!40860 (and (inv!12 thiss!1204) e!130008)))

(declare-fun b!188134 () Bool)

(declare-fun e!130013 () Bool)

(assert (=> b!188134 (= e!130013 e!130015)))

(declare-fun res!156719 () Bool)

(assert (=> b!188134 (=> (not res!156719) (not e!130015))))

(declare-fun lt!291871 () (_ BitVec 64))

(assert (=> b!188134 (= res!156719 (= lt!291877 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!291871)))))

(assert (=> b!188134 (= lt!291877 (bitIndex!0 (size!4344 (buf!4815 (_2!8769 lt!291888))) (currentByte!9081 (_2!8769 lt!291888)) (currentBit!9076 (_2!8769 lt!291888))))))

(assert (=> b!188134 (= lt!291871 (bitIndex!0 (size!4344 (buf!4815 thiss!1204)) (currentByte!9081 thiss!1204) (currentBit!9076 thiss!1204)))))

(declare-fun b!188135 () Bool)

(declare-fun res!156716 () Bool)

(assert (=> b!188135 (=> (not res!156716) (not e!130010))))

(assert (=> b!188135 (= res!156716 (= (_1!8770 lt!291891) (withMovedBitIndex!0 (_2!8770 lt!291891) (bvsub lt!291881 lt!291892))))))

(declare-fun b!188136 () Bool)

(declare-fun res!156730 () Bool)

(assert (=> b!188136 (=> res!156730 e!130011)))

(assert (=> b!188136 (= res!156730 (not (isPrefixOf!0 (_2!8769 lt!291888) (_2!8769 lt!291884))))))

(declare-fun b!188137 () Bool)

(assert (=> b!188137 (= e!130016 (= (_2!8772 lt!291878) (_2!8772 lt!291864)))))

(declare-fun b!188138 () Bool)

(declare-fun e!130017 () Bool)

(declare-fun e!130009 () Bool)

(assert (=> b!188138 (= e!130017 (not e!130009))))

(declare-fun res!156726 () Bool)

(assert (=> b!188138 (=> res!156726 e!130009)))

(assert (=> b!188138 (= res!156726 (not (= lt!291881 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!291886))))))

(assert (=> b!188138 (= lt!291881 (bitIndex!0 (size!4344 (buf!4815 (_2!8769 lt!291888))) (currentByte!9081 (_2!8769 lt!291888)) (currentBit!9076 (_2!8769 lt!291888))))))

(assert (=> b!188138 (= lt!291886 (bitIndex!0 (size!4344 (buf!4815 thiss!1204)) (currentByte!9081 thiss!1204) (currentBit!9076 thiss!1204)))))

(assert (=> b!188138 e!130013))

(declare-fun res!156728 () Bool)

(assert (=> b!188138 (=> (not res!156728) (not e!130013))))

(assert (=> b!188138 (= res!156728 (= (size!4344 (buf!4815 thiss!1204)) (size!4344 (buf!4815 (_2!8769 lt!291888)))))))

(declare-fun appendBit!0 (BitStream!7796 Bool) tuple2!16248)

(assert (=> b!188138 (= lt!291888 (appendBit!0 thiss!1204 lt!291889))))

(assert (=> b!188138 (= lt!291889 (not (= (bvand v!189 lt!291887) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!188138 (= lt!291887 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!188139 () Bool)

(assert (=> b!188139 (= e!130009 e!130011)))

(declare-fun res!156727 () Bool)

(assert (=> b!188139 (=> res!156727 e!130011)))

(assert (=> b!188139 (= res!156727 (not (= lt!291892 (bvsub (bvsub (bvadd lt!291881 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!188139 (= lt!291892 (bitIndex!0 (size!4344 (buf!4815 (_2!8769 lt!291884))) (currentByte!9081 (_2!8769 lt!291884)) (currentBit!9076 (_2!8769 lt!291884))))))

(assert (=> b!188139 (isPrefixOf!0 thiss!1204 (_2!8769 lt!291884))))

(declare-fun lt!291866 () Unit!13448)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7796 BitStream!7796 BitStream!7796) Unit!13448)

(assert (=> b!188139 (= lt!291866 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8769 lt!291888) (_2!8769 lt!291884)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7796 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16248)

(assert (=> b!188139 (= lt!291884 (appendBitsLSBFirstLoopTR!0 (_2!8769 lt!291888) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!188140 () Bool)

(declare-fun res!156712 () Bool)

(assert (=> b!188140 (=> (not res!156712) (not e!130017))))

(assert (=> b!188140 (= res!156712 (invariant!0 (currentBit!9076 thiss!1204) (currentByte!9081 thiss!1204) (size!4344 (buf!4815 thiss!1204))))))

(declare-fun b!188141 () Bool)

(declare-fun res!156732 () Bool)

(assert (=> b!188141 (=> (not res!156732) (not e!130017))))

(assert (=> b!188141 (= res!156732 (not (= i!590 nBits!348)))))

(declare-fun b!188142 () Bool)

(assert (=> b!188142 (= e!130015 e!130014)))

(declare-fun res!156721 () Bool)

(assert (=> b!188142 (=> (not res!156721) (not e!130014))))

(assert (=> b!188142 (= res!156721 (and (= (_2!8772 lt!291875) lt!291889) (= (_1!8772 lt!291875) (_2!8769 lt!291888))))))

(declare-fun readerFrom!0 (BitStream!7796 (_ BitVec 32) (_ BitVec 32)) BitStream!7796)

(assert (=> b!188142 (= lt!291875 (readBitPure!0 (readerFrom!0 (_2!8769 lt!291888) (currentBit!9076 thiss!1204) (currentByte!9081 thiss!1204))))))

(declare-fun b!188143 () Bool)

(declare-fun res!156715 () Bool)

(assert (=> b!188143 (=> (not res!156715) (not e!130010))))

(assert (=> b!188143 (= res!156715 (= (_1!8770 lt!291865) (withMovedBitIndex!0 (_2!8770 lt!291865) (bvsub lt!291886 lt!291892))))))

(declare-fun b!188144 () Bool)

(assert (=> b!188144 (= e!130019 e!130017)))

(declare-fun res!156724 () Bool)

(assert (=> b!188144 (=> (not res!156724) (not e!130017))))

(assert (=> b!188144 (= res!156724 (validate_offset_bits!1 ((_ sign_extend 32) (size!4344 (buf!4815 thiss!1204))) ((_ sign_extend 32) (currentByte!9081 thiss!1204)) ((_ sign_extend 32) (currentBit!9076 thiss!1204)) lt!291870))))

(assert (=> b!188144 (= lt!291870 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(assert (= (and start!40860 res!156713) b!188144))

(assert (= (and b!188144 res!156724) b!188140))

(assert (= (and b!188140 res!156712) b!188141))

(assert (= (and b!188141 res!156732) b!188138))

(assert (= (and b!188138 res!156728) b!188134))

(assert (= (and b!188134 res!156719) b!188123))

(assert (= (and b!188123 res!156718) b!188142))

(assert (= (and b!188142 res!156721) b!188129))

(assert (= (and b!188138 (not res!156726)) b!188139))

(assert (= (and b!188139 (not res!156727)) b!188126))

(assert (= (and b!188126 (not res!156722)) b!188124))

(assert (= (and b!188124 (not res!156717)) b!188136))

(assert (= (and b!188136 (not res!156730)) b!188132))

(assert (= (and b!188132 (not res!156729)) b!188128))

(assert (= (and b!188128 res!156714) b!188127))

(assert (= (and b!188128 res!156725) b!188137))

(assert (= (and b!188128 (not res!156723)) b!188125))

(assert (= (and b!188125 res!156731) b!188143))

(assert (= (and b!188143 res!156715) b!188135))

(assert (= (and b!188135 res!156716) b!188133))

(assert (= (and b!188125 (not res!156720)) b!188131))

(assert (= start!40860 b!188130))

(declare-fun m!292575 () Bool)

(assert (=> b!188131 m!292575))

(declare-fun m!292577 () Bool)

(assert (=> b!188140 m!292577))

(declare-fun m!292579 () Bool)

(assert (=> b!188138 m!292579))

(declare-fun m!292581 () Bool)

(assert (=> b!188138 m!292581))

(declare-fun m!292583 () Bool)

(assert (=> b!188138 m!292583))

(declare-fun m!292585 () Bool)

(assert (=> b!188143 m!292585))

(declare-fun m!292587 () Bool)

(assert (=> b!188132 m!292587))

(declare-fun m!292589 () Bool)

(assert (=> b!188139 m!292589))

(declare-fun m!292591 () Bool)

(assert (=> b!188139 m!292591))

(declare-fun m!292593 () Bool)

(assert (=> b!188139 m!292593))

(declare-fun m!292595 () Bool)

(assert (=> b!188139 m!292595))

(declare-fun m!292597 () Bool)

(assert (=> b!188129 m!292597))

(declare-fun m!292599 () Bool)

(assert (=> b!188135 m!292599))

(assert (=> b!188123 m!292587))

(declare-fun m!292601 () Bool)

(assert (=> b!188142 m!292601))

(assert (=> b!188142 m!292601))

(declare-fun m!292603 () Bool)

(assert (=> b!188142 m!292603))

(declare-fun m!292605 () Bool)

(assert (=> b!188144 m!292605))

(declare-fun m!292607 () Bool)

(assert (=> b!188126 m!292607))

(declare-fun m!292609 () Bool)

(assert (=> start!40860 m!292609))

(assert (=> b!188134 m!292579))

(assert (=> b!188134 m!292581))

(declare-fun m!292611 () Bool)

(assert (=> b!188125 m!292611))

(declare-fun m!292613 () Bool)

(assert (=> b!188125 m!292613))

(declare-fun m!292615 () Bool)

(assert (=> b!188125 m!292615))

(declare-fun m!292617 () Bool)

(assert (=> b!188127 m!292617))

(declare-fun m!292619 () Bool)

(assert (=> b!188130 m!292619))

(declare-fun m!292621 () Bool)

(assert (=> b!188128 m!292621))

(declare-fun m!292623 () Bool)

(assert (=> b!188128 m!292623))

(declare-fun m!292625 () Bool)

(assert (=> b!188128 m!292625))

(declare-fun m!292627 () Bool)

(assert (=> b!188128 m!292627))

(declare-fun m!292629 () Bool)

(assert (=> b!188128 m!292629))

(declare-fun m!292631 () Bool)

(assert (=> b!188128 m!292631))

(declare-fun m!292633 () Bool)

(assert (=> b!188128 m!292633))

(declare-fun m!292635 () Bool)

(assert (=> b!188128 m!292635))

(declare-fun m!292637 () Bool)

(assert (=> b!188128 m!292637))

(declare-fun m!292639 () Bool)

(assert (=> b!188128 m!292639))

(declare-fun m!292641 () Bool)

(assert (=> b!188128 m!292641))

(declare-fun m!292643 () Bool)

(assert (=> b!188128 m!292643))

(declare-fun m!292645 () Bool)

(assert (=> b!188128 m!292645))

(declare-fun m!292647 () Bool)

(assert (=> b!188128 m!292647))

(declare-fun m!292649 () Bool)

(assert (=> b!188128 m!292649))

(declare-fun m!292651 () Bool)

(assert (=> b!188128 m!292651))

(declare-fun m!292653 () Bool)

(assert (=> b!188136 m!292653))

(push 1)

(assert (not start!40860))

(assert (not b!188125))

(assert (not b!188132))

(assert (not b!188129))

(assert (not b!188123))

(assert (not b!188144))

(assert (not b!188136))

(assert (not b!188128))

(assert (not b!188127))

(assert (not b!188131))

(assert (not b!188135))

(assert (not b!188126))

(assert (not b!188142))

(assert (not b!188140))

(assert (not b!188130))

(assert (not b!188143))

(assert (not b!188138))

(assert (not b!188134))

(assert (not b!188139))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!64921 () Bool)

(assert (=> d!64921 (= (invariant!0 (currentBit!9076 thiss!1204) (currentByte!9081 thiss!1204) (size!4344 (buf!4815 (_2!8769 lt!291884)))) (and (bvsge (currentBit!9076 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9076 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9081 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9081 thiss!1204) (size!4344 (buf!4815 (_2!8769 lt!291884)))) (and (= (currentBit!9076 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9081 thiss!1204) (size!4344 (buf!4815 (_2!8769 lt!291884))))))))))

(assert (=> b!188127 d!64921))

(declare-fun d!64923 () Bool)

(assert (=> d!64923 (= (invariant!0 (currentBit!9076 (_2!8769 lt!291884)) (currentByte!9081 (_2!8769 lt!291884)) (size!4344 (buf!4815 (_2!8769 lt!291884)))) (and (bvsge (currentBit!9076 (_2!8769 lt!291884)) #b00000000000000000000000000000000) (bvslt (currentBit!9076 (_2!8769 lt!291884)) #b00000000000000000000000000001000) (bvsge (currentByte!9081 (_2!8769 lt!291884)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9081 (_2!8769 lt!291884)) (size!4344 (buf!4815 (_2!8769 lt!291884)))) (and (= (currentBit!9076 (_2!8769 lt!291884)) #b00000000000000000000000000000000) (= (currentByte!9081 (_2!8769 lt!291884)) (size!4344 (buf!4815 (_2!8769 lt!291884))))))))))

(assert (=> b!188126 d!64923))

(declare-fun d!64925 () Bool)

(declare-fun e!130042 () Bool)

(assert (=> d!64925 e!130042))

(declare-fun res!156772 () Bool)

(assert (=> d!64925 (=> (not res!156772) (not e!130042))))

(declare-fun lt!291962 () (_ BitVec 64))

(declare-fun lt!291960 () (_ BitVec 64))

(declare-fun lt!291959 () (_ BitVec 64))

(assert (=> d!64925 (= res!156772 (= lt!291962 (bvsub lt!291959 lt!291960)))))

(assert (=> d!64925 (or (= (bvand lt!291959 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!291960 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!291959 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!291959 lt!291960) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!64925 (= lt!291960 (remainingBits!0 ((_ sign_extend 32) (size!4344 (buf!4815 (_2!8769 lt!291884)))) ((_ sign_extend 32) (currentByte!9081 (_2!8769 lt!291884))) ((_ sign_extend 32) (currentBit!9076 (_2!8769 lt!291884)))))))

(declare-fun lt!291963 () (_ BitVec 64))

(declare-fun lt!291964 () (_ BitVec 64))

(assert (=> d!64925 (= lt!291959 (bvmul lt!291963 lt!291964))))

(assert (=> d!64925 (or (= lt!291963 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!291964 (bvsdiv (bvmul lt!291963 lt!291964) lt!291963)))))

(assert (=> d!64925 (= lt!291964 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64925 (= lt!291963 ((_ sign_extend 32) (size!4344 (buf!4815 (_2!8769 lt!291884)))))))

(assert (=> d!64925 (= lt!291962 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9081 (_2!8769 lt!291884))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9076 (_2!8769 lt!291884)))))))

(assert (=> d!64925 (invariant!0 (currentBit!9076 (_2!8769 lt!291884)) (currentByte!9081 (_2!8769 lt!291884)) (size!4344 (buf!4815 (_2!8769 lt!291884))))))

(assert (=> d!64925 (= (bitIndex!0 (size!4344 (buf!4815 (_2!8769 lt!291884))) (currentByte!9081 (_2!8769 lt!291884)) (currentBit!9076 (_2!8769 lt!291884))) lt!291962)))

(declare-fun b!188183 () Bool)

(declare-fun res!156771 () Bool)

(assert (=> b!188183 (=> (not res!156771) (not e!130042))))

(assert (=> b!188183 (= res!156771 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!291962))))

(declare-fun b!188184 () Bool)

(declare-fun lt!291961 () (_ BitVec 64))

(assert (=> b!188184 (= e!130042 (bvsle lt!291962 (bvmul lt!291961 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!188184 (or (= lt!291961 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!291961 #b0000000000000000000000000000000000000000000000000000000000001000) lt!291961)))))

(assert (=> b!188184 (= lt!291961 ((_ sign_extend 32) (size!4344 (buf!4815 (_2!8769 lt!291884)))))))

(assert (= (and d!64925 res!156772) b!188183))

(assert (= (and b!188183 res!156771) b!188184))

(declare-fun m!292673 () Bool)

(assert (=> d!64925 m!292673))

(assert (=> d!64925 m!292607))

(assert (=> b!188139 d!64925))

(declare-fun d!64927 () Bool)

(declare-fun res!156780 () Bool)

(declare-fun e!130048 () Bool)

(assert (=> d!64927 (=> (not res!156780) (not e!130048))))

(assert (=> d!64927 (= res!156780 (= (size!4344 (buf!4815 thiss!1204)) (size!4344 (buf!4815 (_2!8769 lt!291884)))))))

(assert (=> d!64927 (= (isPrefixOf!0 thiss!1204 (_2!8769 lt!291884)) e!130048)))

(declare-fun b!188191 () Bool)

(declare-fun res!156781 () Bool)

(assert (=> b!188191 (=> (not res!156781) (not e!130048))))

(assert (=> b!188191 (= res!156781 (bvsle (bitIndex!0 (size!4344 (buf!4815 thiss!1204)) (currentByte!9081 thiss!1204) (currentBit!9076 thiss!1204)) (bitIndex!0 (size!4344 (buf!4815 (_2!8769 lt!291884))) (currentByte!9081 (_2!8769 lt!291884)) (currentBit!9076 (_2!8769 lt!291884)))))))

(declare-fun b!188192 () Bool)

(declare-fun e!130047 () Bool)

(assert (=> b!188192 (= e!130048 e!130047)))

(declare-fun res!156779 () Bool)

(assert (=> b!188192 (=> res!156779 e!130047)))

(assert (=> b!188192 (= res!156779 (= (size!4344 (buf!4815 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!188193 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9855 array!9855 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!188193 (= e!130047 (arrayBitRangesEq!0 (buf!4815 thiss!1204) (buf!4815 (_2!8769 lt!291884)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4344 (buf!4815 thiss!1204)) (currentByte!9081 thiss!1204) (currentBit!9076 thiss!1204))))))

(assert (= (and d!64927 res!156780) b!188191))

(assert (= (and b!188191 res!156781) b!188192))

(assert (= (and b!188192 (not res!156779)) b!188193))

(assert (=> b!188191 m!292581))

(assert (=> b!188191 m!292589))

(assert (=> b!188193 m!292581))

(assert (=> b!188193 m!292581))

(declare-fun m!292675 () Bool)

(assert (=> b!188193 m!292675))

(assert (=> b!188139 d!64927))

(declare-fun d!64929 () Bool)

(assert (=> d!64929 (isPrefixOf!0 thiss!1204 (_2!8769 lt!291884))))

(declare-fun lt!291967 () Unit!13448)

(declare-fun choose!30 (BitStream!7796 BitStream!7796 BitStream!7796) Unit!13448)

(assert (=> d!64929 (= lt!291967 (choose!30 thiss!1204 (_2!8769 lt!291888) (_2!8769 lt!291884)))))

(assert (=> d!64929 (isPrefixOf!0 thiss!1204 (_2!8769 lt!291888))))

(assert (=> d!64929 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8769 lt!291888) (_2!8769 lt!291884)) lt!291967)))

(declare-fun bs!16133 () Bool)

(assert (= bs!16133 d!64929))

(assert (=> bs!16133 m!292591))

(declare-fun m!292677 () Bool)

(assert (=> bs!16133 m!292677))

(assert (=> bs!16133 m!292587))

(assert (=> b!188139 d!64929))

(declare-fun b!188412 () Bool)

(declare-fun e!130179 () Bool)

(declare-fun lt!292668 () tuple2!16252)

(declare-fun lt!292674 () tuple2!16250)

(assert (=> b!188412 (= e!130179 (= (_1!8771 lt!292668) (_2!8770 lt!292674)))))

(declare-fun b!188413 () Bool)

(declare-fun e!130174 () Bool)

(declare-fun lt!292680 () (_ BitVec 64))

(assert (=> b!188413 (= e!130174 (validate_offset_bits!1 ((_ sign_extend 32) (size!4344 (buf!4815 (_2!8769 lt!291888)))) ((_ sign_extend 32) (currentByte!9081 (_2!8769 lt!291888))) ((_ sign_extend 32) (currentBit!9076 (_2!8769 lt!291888))) lt!292680))))

(declare-fun bm!3026 () Bool)

(declare-fun call!3029 () Bool)

(declare-fun lt!292677 () tuple2!16248)

(declare-fun c!9611 () Bool)

(assert (=> bm!3026 (= call!3029 (isPrefixOf!0 (_2!8769 lt!291888) (ite c!9611 (_2!8769 lt!291888) (_2!8769 lt!292677))))))

(declare-fun b!188414 () Bool)

(declare-fun e!130177 () Bool)

(declare-fun lt!292697 () tuple2!16252)

(declare-fun lt!292667 () tuple2!16250)

(assert (=> b!188414 (= e!130177 (= (_1!8771 lt!292697) (_2!8770 lt!292667)))))

(declare-fun b!188415 () Bool)

(declare-fun e!130175 () tuple2!16248)

(declare-fun Unit!13474 () Unit!13448)

(assert (=> b!188415 (= e!130175 (tuple2!16249 Unit!13474 (_2!8769 lt!291888)))))

(declare-fun lt!292657 () Unit!13448)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7796) Unit!13448)

(assert (=> b!188415 (= lt!292657 (lemmaIsPrefixRefl!0 (_2!8769 lt!291888)))))

(assert (=> b!188415 call!3029))

(declare-fun lt!292650 () Unit!13448)

(assert (=> b!188415 (= lt!292650 lt!292657)))

(declare-fun b!188416 () Bool)

(declare-fun e!130176 () Bool)

(declare-fun lt!292673 () tuple2!16254)

(declare-fun lt!292648 () tuple2!16248)

(assert (=> b!188416 (= e!130176 (= (bitIndex!0 (size!4344 (buf!4815 (_1!8772 lt!292673))) (currentByte!9081 (_1!8772 lt!292673)) (currentBit!9076 (_1!8772 lt!292673))) (bitIndex!0 (size!4344 (buf!4815 (_2!8769 lt!292648))) (currentByte!9081 (_2!8769 lt!292648)) (currentBit!9076 (_2!8769 lt!292648)))))))

(declare-fun b!188417 () Bool)

(declare-fun res!156969 () Bool)

(declare-fun e!130182 () Bool)

(assert (=> b!188417 (=> (not res!156969) (not e!130182))))

(declare-fun lt!292659 () tuple2!16248)

(assert (=> b!188417 (= res!156969 (= (size!4344 (buf!4815 (_2!8769 lt!291888))) (size!4344 (buf!4815 (_2!8769 lt!292659)))))))

(declare-fun b!188411 () Bool)

(declare-fun res!156966 () Bool)

(assert (=> b!188411 (= res!156966 (= (bitIndex!0 (size!4344 (buf!4815 (_2!8769 lt!292648))) (currentByte!9081 (_2!8769 lt!292648)) (currentBit!9076 (_2!8769 lt!292648))) (bvadd (bitIndex!0 (size!4344 (buf!4815 (_2!8769 lt!291888))) (currentByte!9081 (_2!8769 lt!291888)) (currentBit!9076 (_2!8769 lt!291888))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!130180 () Bool)

(assert (=> b!188411 (=> (not res!156966) (not e!130180))))

(declare-fun d!64931 () Bool)

(assert (=> d!64931 e!130182))

(declare-fun res!156962 () Bool)

(assert (=> d!64931 (=> (not res!156962) (not e!130182))))

(assert (=> d!64931 (= res!156962 (invariant!0 (currentBit!9076 (_2!8769 lt!292659)) (currentByte!9081 (_2!8769 lt!292659)) (size!4344 (buf!4815 (_2!8769 lt!292659)))))))

(assert (=> d!64931 (= lt!292659 e!130175)))

(assert (=> d!64931 (= c!9611 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!64931 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!64931 (= (appendBitsLSBFirstLoopTR!0 (_2!8769 lt!291888) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!292659)))

(declare-fun b!188418 () Bool)

(assert (=> b!188418 (= lt!292673 (readBitPure!0 (readerFrom!0 (_2!8769 lt!292648) (currentBit!9076 (_2!8769 lt!291888)) (currentByte!9081 (_2!8769 lt!291888)))))))

(declare-fun res!156968 () Bool)

(declare-fun lt!292686 () Bool)

(assert (=> b!188418 (= res!156968 (and (= (_2!8772 lt!292673) lt!292686) (= (_1!8772 lt!292673) (_2!8769 lt!292648))))))

(assert (=> b!188418 (=> (not res!156968) (not e!130176))))

(assert (=> b!188418 (= e!130180 e!130176)))

(declare-fun b!188419 () Bool)

(assert (=> b!188419 (= e!130175 (tuple2!16249 (_1!8769 lt!292677) (_2!8769 lt!292677)))))

(assert (=> b!188419 (= lt!292686 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!188419 (= lt!292648 (appendBit!0 (_2!8769 lt!291888) lt!292686))))

(declare-fun res!156964 () Bool)

(assert (=> b!188419 (= res!156964 (= (size!4344 (buf!4815 (_2!8769 lt!291888))) (size!4344 (buf!4815 (_2!8769 lt!292648)))))))

(assert (=> b!188419 (=> (not res!156964) (not e!130180))))

(assert (=> b!188419 e!130180))

(declare-fun lt!292655 () tuple2!16248)

(assert (=> b!188419 (= lt!292655 lt!292648)))

(assert (=> b!188419 (= lt!292677 (appendBitsLSBFirstLoopTR!0 (_2!8769 lt!292655) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!292692 () Unit!13448)

(assert (=> b!188419 (= lt!292692 (lemmaIsPrefixTransitive!0 (_2!8769 lt!291888) (_2!8769 lt!292655) (_2!8769 lt!292677)))))

(assert (=> b!188419 call!3029))

(declare-fun lt!292679 () Unit!13448)

(assert (=> b!188419 (= lt!292679 lt!292692)))

(assert (=> b!188419 (invariant!0 (currentBit!9076 (_2!8769 lt!291888)) (currentByte!9081 (_2!8769 lt!291888)) (size!4344 (buf!4815 (_2!8769 lt!292655))))))

(declare-fun lt!292681 () BitStream!7796)

(assert (=> b!188419 (= lt!292681 (BitStream!7797 (buf!4815 (_2!8769 lt!292655)) (currentByte!9081 (_2!8769 lt!291888)) (currentBit!9076 (_2!8769 lt!291888))))))

(assert (=> b!188419 (invariant!0 (currentBit!9076 lt!292681) (currentByte!9081 lt!292681) (size!4344 (buf!4815 (_2!8769 lt!292677))))))

(declare-fun lt!292670 () BitStream!7796)

(assert (=> b!188419 (= lt!292670 (BitStream!7797 (buf!4815 (_2!8769 lt!292677)) (currentByte!9081 lt!292681) (currentBit!9076 lt!292681)))))

(declare-fun lt!292664 () tuple2!16254)

(assert (=> b!188419 (= lt!292664 (readBitPure!0 lt!292681))))

(declare-fun lt!292675 () tuple2!16254)

(assert (=> b!188419 (= lt!292675 (readBitPure!0 lt!292670))))

(declare-fun lt!292662 () Unit!13448)

(assert (=> b!188419 (= lt!292662 (readBitPrefixLemma!0 lt!292681 (_2!8769 lt!292677)))))

(declare-fun res!156965 () Bool)

(assert (=> b!188419 (= res!156965 (= (bitIndex!0 (size!4344 (buf!4815 (_1!8772 lt!292664))) (currentByte!9081 (_1!8772 lt!292664)) (currentBit!9076 (_1!8772 lt!292664))) (bitIndex!0 (size!4344 (buf!4815 (_1!8772 lt!292675))) (currentByte!9081 (_1!8772 lt!292675)) (currentBit!9076 (_1!8772 lt!292675)))))))

(declare-fun e!130181 () Bool)

(assert (=> b!188419 (=> (not res!156965) (not e!130181))))

(assert (=> b!188419 e!130181))

(declare-fun lt!292690 () Unit!13448)

(assert (=> b!188419 (= lt!292690 lt!292662)))

(declare-fun lt!292688 () tuple2!16250)

(assert (=> b!188419 (= lt!292688 (reader!0 (_2!8769 lt!291888) (_2!8769 lt!292677)))))

(declare-fun lt!292693 () tuple2!16250)

(assert (=> b!188419 (= lt!292693 (reader!0 (_2!8769 lt!292655) (_2!8769 lt!292677)))))

(declare-fun lt!292689 () tuple2!16254)

(assert (=> b!188419 (= lt!292689 (readBitPure!0 (_1!8770 lt!292688)))))

(assert (=> b!188419 (= (_2!8772 lt!292689) lt!292686)))

(declare-fun lt!292663 () Unit!13448)

(declare-fun Unit!13475 () Unit!13448)

(assert (=> b!188419 (= lt!292663 Unit!13475)))

(declare-fun lt!292665 () (_ BitVec 64))

(assert (=> b!188419 (= lt!292665 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!292685 () (_ BitVec 64))

(assert (=> b!188419 (= lt!292685 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!292647 () Unit!13448)

(assert (=> b!188419 (= lt!292647 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8769 lt!291888) (buf!4815 (_2!8769 lt!292677)) lt!292685))))

(assert (=> b!188419 (validate_offset_bits!1 ((_ sign_extend 32) (size!4344 (buf!4815 (_2!8769 lt!292677)))) ((_ sign_extend 32) (currentByte!9081 (_2!8769 lt!291888))) ((_ sign_extend 32) (currentBit!9076 (_2!8769 lt!291888))) lt!292685)))

(declare-fun lt!292649 () Unit!13448)

(assert (=> b!188419 (= lt!292649 lt!292647)))

(declare-fun lt!292653 () tuple2!16252)

(assert (=> b!188419 (= lt!292653 (readNBitsLSBFirstsLoopPure!0 (_1!8770 lt!292688) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!292665))))

(declare-fun lt!292676 () (_ BitVec 64))

(assert (=> b!188419 (= lt!292676 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!292687 () Unit!13448)

(assert (=> b!188419 (= lt!292687 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8769 lt!292655) (buf!4815 (_2!8769 lt!292677)) lt!292676))))

(assert (=> b!188419 (validate_offset_bits!1 ((_ sign_extend 32) (size!4344 (buf!4815 (_2!8769 lt!292677)))) ((_ sign_extend 32) (currentByte!9081 (_2!8769 lt!292655))) ((_ sign_extend 32) (currentBit!9076 (_2!8769 lt!292655))) lt!292676)))

(declare-fun lt!292691 () Unit!13448)

(assert (=> b!188419 (= lt!292691 lt!292687)))

(declare-fun lt!292694 () tuple2!16252)

(assert (=> b!188419 (= lt!292694 (readNBitsLSBFirstsLoopPure!0 (_1!8770 lt!292693) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!292665 (ite (_2!8772 lt!292689) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!292654 () tuple2!16252)

(assert (=> b!188419 (= lt!292654 (readNBitsLSBFirstsLoopPure!0 (_1!8770 lt!292688) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!292665))))

(declare-fun c!9610 () Bool)

(assert (=> b!188419 (= c!9610 (_2!8772 (readBitPure!0 (_1!8770 lt!292688))))))

(declare-fun lt!292683 () tuple2!16252)

(declare-fun e!130178 () (_ BitVec 64))

(assert (=> b!188419 (= lt!292683 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8770 lt!292688) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!292665 e!130178)))))

(declare-fun lt!292656 () Unit!13448)

(assert (=> b!188419 (= lt!292656 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8770 lt!292688) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!292665))))

(assert (=> b!188419 (and (= (_2!8771 lt!292654) (_2!8771 lt!292683)) (= (_1!8771 lt!292654) (_1!8771 lt!292683)))))

(declare-fun lt!292698 () Unit!13448)

(assert (=> b!188419 (= lt!292698 lt!292656)))

(assert (=> b!188419 (= (_1!8770 lt!292688) (withMovedBitIndex!0 (_2!8770 lt!292688) (bvsub (bitIndex!0 (size!4344 (buf!4815 (_2!8769 lt!291888))) (currentByte!9081 (_2!8769 lt!291888)) (currentBit!9076 (_2!8769 lt!291888))) (bitIndex!0 (size!4344 (buf!4815 (_2!8769 lt!292677))) (currentByte!9081 (_2!8769 lt!292677)) (currentBit!9076 (_2!8769 lt!292677))))))))

(declare-fun lt!292652 () Unit!13448)

(declare-fun Unit!13476 () Unit!13448)

(assert (=> b!188419 (= lt!292652 Unit!13476)))

(assert (=> b!188419 (= (_1!8770 lt!292693) (withMovedBitIndex!0 (_2!8770 lt!292693) (bvsub (bitIndex!0 (size!4344 (buf!4815 (_2!8769 lt!292655))) (currentByte!9081 (_2!8769 lt!292655)) (currentBit!9076 (_2!8769 lt!292655))) (bitIndex!0 (size!4344 (buf!4815 (_2!8769 lt!292677))) (currentByte!9081 (_2!8769 lt!292677)) (currentBit!9076 (_2!8769 lt!292677))))))))

(declare-fun lt!292700 () Unit!13448)

(declare-fun Unit!13477 () Unit!13448)

(assert (=> b!188419 (= lt!292700 Unit!13477)))

(assert (=> b!188419 (= (bitIndex!0 (size!4344 (buf!4815 (_2!8769 lt!291888))) (currentByte!9081 (_2!8769 lt!291888)) (currentBit!9076 (_2!8769 lt!291888))) (bvsub (bitIndex!0 (size!4344 (buf!4815 (_2!8769 lt!292655))) (currentByte!9081 (_2!8769 lt!292655)) (currentBit!9076 (_2!8769 lt!292655))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!292651 () Unit!13448)

(declare-fun Unit!13478 () Unit!13448)

(assert (=> b!188419 (= lt!292651 Unit!13478)))

(assert (=> b!188419 (= (_2!8771 lt!292653) (_2!8771 lt!292694))))

(declare-fun lt!292661 () Unit!13448)

(declare-fun Unit!13479 () Unit!13448)

(assert (=> b!188419 (= lt!292661 Unit!13479)))

(assert (=> b!188419 (invariant!0 (currentBit!9076 (_2!8769 lt!292677)) (currentByte!9081 (_2!8769 lt!292677)) (size!4344 (buf!4815 (_2!8769 lt!292677))))))

(declare-fun lt!292658 () Unit!13448)

(declare-fun Unit!13480 () Unit!13448)

(assert (=> b!188419 (= lt!292658 Unit!13480)))

(assert (=> b!188419 (= (size!4344 (buf!4815 (_2!8769 lt!291888))) (size!4344 (buf!4815 (_2!8769 lt!292677))))))

(declare-fun lt!292645 () Unit!13448)

(declare-fun Unit!13481 () Unit!13448)

(assert (=> b!188419 (= lt!292645 Unit!13481)))

(assert (=> b!188419 (= (bitIndex!0 (size!4344 (buf!4815 (_2!8769 lt!292677))) (currentByte!9081 (_2!8769 lt!292677)) (currentBit!9076 (_2!8769 lt!292677))) (bvsub (bvadd (bitIndex!0 (size!4344 (buf!4815 (_2!8769 lt!291888))) (currentByte!9081 (_2!8769 lt!291888)) (currentBit!9076 (_2!8769 lt!291888))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!292695 () Unit!13448)

(declare-fun Unit!13482 () Unit!13448)

(assert (=> b!188419 (= lt!292695 Unit!13482)))

(declare-fun lt!292669 () Unit!13448)

(declare-fun Unit!13483 () Unit!13448)

(assert (=> b!188419 (= lt!292669 Unit!13483)))

(assert (=> b!188419 (= lt!292674 (reader!0 (_2!8769 lt!291888) (_2!8769 lt!292677)))))

(declare-fun lt!292646 () (_ BitVec 64))

(assert (=> b!188419 (= lt!292646 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!292660 () Unit!13448)

(assert (=> b!188419 (= lt!292660 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8769 lt!291888) (buf!4815 (_2!8769 lt!292677)) lt!292646))))

(assert (=> b!188419 (validate_offset_bits!1 ((_ sign_extend 32) (size!4344 (buf!4815 (_2!8769 lt!292677)))) ((_ sign_extend 32) (currentByte!9081 (_2!8769 lt!291888))) ((_ sign_extend 32) (currentBit!9076 (_2!8769 lt!291888))) lt!292646)))

(declare-fun lt!292672 () Unit!13448)

(assert (=> b!188419 (= lt!292672 lt!292660)))

(assert (=> b!188419 (= lt!292668 (readNBitsLSBFirstsLoopPure!0 (_1!8770 lt!292674) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!156967 () Bool)

(assert (=> b!188419 (= res!156967 (= (_2!8771 lt!292668) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!188419 (=> (not res!156967) (not e!130179))))

(assert (=> b!188419 e!130179))

(declare-fun lt!292699 () Unit!13448)

(declare-fun Unit!13484 () Unit!13448)

(assert (=> b!188419 (= lt!292699 Unit!13484)))

(declare-fun b!188420 () Bool)

(declare-fun res!156963 () Bool)

(assert (=> b!188420 (=> (not res!156963) (not e!130182))))

(assert (=> b!188420 (= res!156963 (isPrefixOf!0 (_2!8769 lt!291888) (_2!8769 lt!292659)))))

(declare-fun b!188421 () Bool)

(assert (=> b!188421 (= e!130178 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!188422 () Bool)

(declare-fun res!156970 () Bool)

(assert (=> b!188422 (= res!156970 (isPrefixOf!0 (_2!8769 lt!291888) (_2!8769 lt!292648)))))

(assert (=> b!188422 (=> (not res!156970) (not e!130180))))

(declare-fun b!188423 () Bool)

(assert (=> b!188423 (= e!130182 e!130177)))

(declare-fun res!156961 () Bool)

(assert (=> b!188423 (=> (not res!156961) (not e!130177))))

(assert (=> b!188423 (= res!156961 (= (_2!8771 lt!292697) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!188423 (= lt!292697 (readNBitsLSBFirstsLoopPure!0 (_1!8770 lt!292667) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!292684 () Unit!13448)

(declare-fun lt!292671 () Unit!13448)

(assert (=> b!188423 (= lt!292684 lt!292671)))

(assert (=> b!188423 (validate_offset_bits!1 ((_ sign_extend 32) (size!4344 (buf!4815 (_2!8769 lt!292659)))) ((_ sign_extend 32) (currentByte!9081 (_2!8769 lt!291888))) ((_ sign_extend 32) (currentBit!9076 (_2!8769 lt!291888))) lt!292680)))

(assert (=> b!188423 (= lt!292671 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8769 lt!291888) (buf!4815 (_2!8769 lt!292659)) lt!292680))))

(assert (=> b!188423 e!130174))

(declare-fun res!156960 () Bool)

(assert (=> b!188423 (=> (not res!156960) (not e!130174))))

(assert (=> b!188423 (= res!156960 (and (= (size!4344 (buf!4815 (_2!8769 lt!291888))) (size!4344 (buf!4815 (_2!8769 lt!292659)))) (bvsge lt!292680 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!188423 (= lt!292680 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!188423 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!188423 (= lt!292667 (reader!0 (_2!8769 lt!291888) (_2!8769 lt!292659)))))

(declare-fun b!188424 () Bool)

(assert (=> b!188424 (= e!130178 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!188425 () Bool)

(declare-fun res!156959 () Bool)

(assert (=> b!188425 (=> (not res!156959) (not e!130182))))

(declare-fun lt!292678 () (_ BitVec 64))

(declare-fun lt!292666 () (_ BitVec 64))

(assert (=> b!188425 (= res!156959 (= (bitIndex!0 (size!4344 (buf!4815 (_2!8769 lt!292659))) (currentByte!9081 (_2!8769 lt!292659)) (currentBit!9076 (_2!8769 lt!292659))) (bvsub lt!292666 lt!292678)))))

(assert (=> b!188425 (or (= (bvand lt!292666 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!292678 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!292666 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!292666 lt!292678) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!188425 (= lt!292678 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!292682 () (_ BitVec 64))

(declare-fun lt!292696 () (_ BitVec 64))

(assert (=> b!188425 (= lt!292666 (bvadd lt!292682 lt!292696))))

(assert (=> b!188425 (or (not (= (bvand lt!292682 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!292696 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!292682 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!292682 lt!292696) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!188425 (= lt!292696 ((_ sign_extend 32) nBits!348))))

(assert (=> b!188425 (= lt!292682 (bitIndex!0 (size!4344 (buf!4815 (_2!8769 lt!291888))) (currentByte!9081 (_2!8769 lt!291888)) (currentBit!9076 (_2!8769 lt!291888))))))

(declare-fun b!188426 () Bool)

(assert (=> b!188426 (= e!130181 (= (_2!8772 lt!292664) (_2!8772 lt!292675)))))

(assert (= (and d!64931 c!9611) b!188415))

(assert (= (and d!64931 (not c!9611)) b!188419))

(assert (= (and b!188419 res!156964) b!188411))

(assert (= (and b!188411 res!156966) b!188422))

(assert (= (and b!188422 res!156970) b!188418))

(assert (= (and b!188418 res!156968) b!188416))

(assert (= (and b!188419 res!156965) b!188426))

(assert (= (and b!188419 c!9610) b!188424))

(assert (= (and b!188419 (not c!9610)) b!188421))

(assert (= (and b!188419 res!156967) b!188412))

(assert (= (or b!188415 b!188419) bm!3026))

(assert (= (and d!64931 res!156962) b!188417))

(assert (= (and b!188417 res!156969) b!188425))

(assert (= (and b!188425 res!156959) b!188420))

(assert (= (and b!188420 res!156963) b!188423))

(assert (= (and b!188423 res!156960) b!188413))

(assert (= (and b!188423 res!156961) b!188414))

(declare-fun m!293071 () Bool)

(assert (=> b!188419 m!293071))

(declare-fun m!293073 () Bool)

(assert (=> b!188419 m!293073))

(declare-fun m!293075 () Bool)

(assert (=> b!188419 m!293075))

(declare-fun m!293077 () Bool)

(assert (=> b!188419 m!293077))

(declare-fun m!293079 () Bool)

(assert (=> b!188419 m!293079))

(declare-fun m!293081 () Bool)

(assert (=> b!188419 m!293081))

(declare-fun m!293083 () Bool)

(assert (=> b!188419 m!293083))

(declare-fun m!293085 () Bool)

(assert (=> b!188419 m!293085))

(declare-fun m!293087 () Bool)

(assert (=> b!188419 m!293087))

(declare-fun m!293089 () Bool)

(assert (=> b!188419 m!293089))

(declare-fun m!293091 () Bool)

(assert (=> b!188419 m!293091))

(declare-fun m!293093 () Bool)

(assert (=> b!188419 m!293093))

(declare-fun m!293095 () Bool)

(assert (=> b!188419 m!293095))

(declare-fun m!293097 () Bool)

(assert (=> b!188419 m!293097))

(assert (=> b!188419 m!293075))

(declare-fun m!293099 () Bool)

(assert (=> b!188419 m!293099))

(declare-fun m!293101 () Bool)

(assert (=> b!188419 m!293101))

(declare-fun m!293103 () Bool)

(assert (=> b!188419 m!293103))

(declare-fun m!293105 () Bool)

(assert (=> b!188419 m!293105))

(declare-fun m!293107 () Bool)

(assert (=> b!188419 m!293107))

(declare-fun m!293109 () Bool)

(assert (=> b!188419 m!293109))

(declare-fun m!293111 () Bool)

(assert (=> b!188419 m!293111))

(assert (=> b!188419 m!292579))

(declare-fun m!293113 () Bool)

(assert (=> b!188419 m!293113))

(declare-fun m!293115 () Bool)

(assert (=> b!188419 m!293115))

(declare-fun m!293117 () Bool)

(assert (=> b!188419 m!293117))

(declare-fun m!293119 () Bool)

(assert (=> b!188419 m!293119))

(declare-fun m!293121 () Bool)

(assert (=> b!188419 m!293121))

(declare-fun m!293123 () Bool)

(assert (=> b!188419 m!293123))

(declare-fun m!293125 () Bool)

(assert (=> b!188419 m!293125))

(declare-fun m!293127 () Bool)

(assert (=> b!188419 m!293127))

(declare-fun m!293129 () Bool)

(assert (=> b!188419 m!293129))

(declare-fun m!293131 () Bool)

(assert (=> b!188419 m!293131))

(declare-fun m!293133 () Bool)

(assert (=> b!188419 m!293133))

(declare-fun m!293135 () Bool)

(assert (=> b!188416 m!293135))

(declare-fun m!293137 () Bool)

(assert (=> b!188416 m!293137))

(declare-fun m!293139 () Bool)

(assert (=> bm!3026 m!293139))

(declare-fun m!293141 () Bool)

(assert (=> b!188425 m!293141))

(assert (=> b!188425 m!292579))

(declare-fun m!293143 () Bool)

(assert (=> b!188413 m!293143))

(declare-fun m!293145 () Bool)

(assert (=> b!188418 m!293145))

(assert (=> b!188418 m!293145))

(declare-fun m!293147 () Bool)

(assert (=> b!188418 m!293147))

(declare-fun m!293149 () Bool)

(assert (=> b!188420 m!293149))

(declare-fun m!293151 () Bool)

(assert (=> b!188422 m!293151))

(declare-fun m!293153 () Bool)

(assert (=> b!188415 m!293153))

(declare-fun m!293155 () Bool)

(assert (=> b!188423 m!293155))

(assert (=> b!188423 m!293097))

(declare-fun m!293157 () Bool)

(assert (=> b!188423 m!293157))

(declare-fun m!293159 () Bool)

(assert (=> b!188423 m!293159))

(assert (=> b!188423 m!293113))

(declare-fun m!293161 () Bool)

(assert (=> b!188423 m!293161))

(declare-fun m!293163 () Bool)

(assert (=> d!64931 m!293163))

(assert (=> b!188411 m!293137))

(assert (=> b!188411 m!292579))

(assert (=> b!188139 d!64931))

(declare-fun d!65039 () Bool)

(declare-datatypes ((tuple2!16264 0))(
  ( (tuple2!16265 (_1!8777 Bool) (_2!8777 BitStream!7796)) )
))
(declare-fun lt!292715 () tuple2!16264)

(declare-fun readBit!0 (BitStream!7796) tuple2!16264)

(assert (=> d!65039 (= lt!292715 (readBit!0 (_1!8770 lt!291865)))))

(assert (=> d!65039 (= (readBitPure!0 (_1!8770 lt!291865)) (tuple2!16255 (_2!8777 lt!292715) (_1!8777 lt!292715)))))

(declare-fun bs!16156 () Bool)

(assert (= bs!16156 d!65039))

(declare-fun m!293177 () Bool)

(assert (=> bs!16156 m!293177))

(assert (=> b!188128 d!65039))

(declare-fun d!65045 () Bool)

(assert (=> d!65045 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!188128 d!65045))

(declare-fun d!65047 () Bool)

(assert (=> d!65047 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4344 (buf!4815 (_2!8769 lt!291884)))) ((_ sign_extend 32) (currentByte!9081 (_2!8769 lt!291888))) ((_ sign_extend 32) (currentBit!9076 (_2!8769 lt!291888))) lt!291876) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4344 (buf!4815 (_2!8769 lt!291884)))) ((_ sign_extend 32) (currentByte!9081 (_2!8769 lt!291888))) ((_ sign_extend 32) (currentBit!9076 (_2!8769 lt!291888)))) lt!291876))))

(declare-fun bs!16158 () Bool)

(assert (= bs!16158 d!65047))

(declare-fun m!293181 () Bool)

(assert (=> bs!16158 m!293181))

(assert (=> b!188128 d!65047))

(declare-fun d!65051 () Bool)

(assert (=> d!65051 (validate_offset_bits!1 ((_ sign_extend 32) (size!4344 (buf!4815 (_2!8769 lt!291884)))) ((_ sign_extend 32) (currentByte!9081 thiss!1204)) ((_ sign_extend 32) (currentBit!9076 thiss!1204)) lt!291870)))

(declare-fun lt!292730 () Unit!13448)

(declare-fun choose!9 (BitStream!7796 array!9855 (_ BitVec 64) BitStream!7796) Unit!13448)

(assert (=> d!65051 (= lt!292730 (choose!9 thiss!1204 (buf!4815 (_2!8769 lt!291884)) lt!291870 (BitStream!7797 (buf!4815 (_2!8769 lt!291884)) (currentByte!9081 thiss!1204) (currentBit!9076 thiss!1204))))))

(assert (=> d!65051 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4815 (_2!8769 lt!291884)) lt!291870) lt!292730)))

(declare-fun bs!16162 () Bool)

(assert (= bs!16162 d!65051))

(assert (=> bs!16162 m!292621))

(declare-fun m!293193 () Bool)

(assert (=> bs!16162 m!293193))

(assert (=> b!188128 d!65051))

(declare-fun b!188457 () Bool)

(declare-fun res!156992 () Bool)

(declare-fun e!130197 () Bool)

(assert (=> b!188457 (=> (not res!156992) (not e!130197))))

(declare-fun lt!292841 () tuple2!16250)

(assert (=> b!188457 (= res!156992 (isPrefixOf!0 (_2!8770 lt!292841) (_2!8769 lt!291884)))))

(declare-fun b!188458 () Bool)

(declare-fun res!156993 () Bool)

(assert (=> b!188458 (=> (not res!156993) (not e!130197))))

(assert (=> b!188458 (= res!156993 (isPrefixOf!0 (_1!8770 lt!292841) thiss!1204))))

(declare-fun d!65063 () Bool)

(assert (=> d!65063 e!130197))

(declare-fun res!156991 () Bool)

(assert (=> d!65063 (=> (not res!156991) (not e!130197))))

(assert (=> d!65063 (= res!156991 (isPrefixOf!0 (_1!8770 lt!292841) (_2!8770 lt!292841)))))

(declare-fun lt!292836 () BitStream!7796)

(assert (=> d!65063 (= lt!292841 (tuple2!16251 lt!292836 (_2!8769 lt!291884)))))

(declare-fun lt!292838 () Unit!13448)

(declare-fun lt!292844 () Unit!13448)

(assert (=> d!65063 (= lt!292838 lt!292844)))

(assert (=> d!65063 (isPrefixOf!0 lt!292836 (_2!8769 lt!291884))))

(assert (=> d!65063 (= lt!292844 (lemmaIsPrefixTransitive!0 lt!292836 (_2!8769 lt!291884) (_2!8769 lt!291884)))))

(declare-fun lt!292847 () Unit!13448)

(declare-fun lt!292848 () Unit!13448)

(assert (=> d!65063 (= lt!292847 lt!292848)))

(assert (=> d!65063 (isPrefixOf!0 lt!292836 (_2!8769 lt!291884))))

(assert (=> d!65063 (= lt!292848 (lemmaIsPrefixTransitive!0 lt!292836 thiss!1204 (_2!8769 lt!291884)))))

(declare-fun lt!292833 () Unit!13448)

(declare-fun e!130198 () Unit!13448)

(assert (=> d!65063 (= lt!292833 e!130198)))

(declare-fun c!9617 () Bool)

(assert (=> d!65063 (= c!9617 (not (= (size!4344 (buf!4815 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!292837 () Unit!13448)

(declare-fun lt!292832 () Unit!13448)

(assert (=> d!65063 (= lt!292837 lt!292832)))

(assert (=> d!65063 (isPrefixOf!0 (_2!8769 lt!291884) (_2!8769 lt!291884))))

(assert (=> d!65063 (= lt!292832 (lemmaIsPrefixRefl!0 (_2!8769 lt!291884)))))

(declare-fun lt!292845 () Unit!13448)

(declare-fun lt!292843 () Unit!13448)

(assert (=> d!65063 (= lt!292845 lt!292843)))

(assert (=> d!65063 (= lt!292843 (lemmaIsPrefixRefl!0 (_2!8769 lt!291884)))))

(declare-fun lt!292846 () Unit!13448)

(declare-fun lt!292849 () Unit!13448)

(assert (=> d!65063 (= lt!292846 lt!292849)))

(assert (=> d!65063 (isPrefixOf!0 lt!292836 lt!292836)))

(assert (=> d!65063 (= lt!292849 (lemmaIsPrefixRefl!0 lt!292836))))

(declare-fun lt!292839 () Unit!13448)

(declare-fun lt!292840 () Unit!13448)

(assert (=> d!65063 (= lt!292839 lt!292840)))

(assert (=> d!65063 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!65063 (= lt!292840 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!65063 (= lt!292836 (BitStream!7797 (buf!4815 (_2!8769 lt!291884)) (currentByte!9081 thiss!1204) (currentBit!9076 thiss!1204)))))

(assert (=> d!65063 (isPrefixOf!0 thiss!1204 (_2!8769 lt!291884))))

(assert (=> d!65063 (= (reader!0 thiss!1204 (_2!8769 lt!291884)) lt!292841)))

(declare-fun b!188459 () Bool)

(declare-fun lt!292834 () Unit!13448)

(assert (=> b!188459 (= e!130198 lt!292834)))

(declare-fun lt!292850 () (_ BitVec 64))

(assert (=> b!188459 (= lt!292850 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!292842 () (_ BitVec 64))

(assert (=> b!188459 (= lt!292842 (bitIndex!0 (size!4344 (buf!4815 thiss!1204)) (currentByte!9081 thiss!1204) (currentBit!9076 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9855 array!9855 (_ BitVec 64) (_ BitVec 64)) Unit!13448)

(assert (=> b!188459 (= lt!292834 (arrayBitRangesEqSymmetric!0 (buf!4815 thiss!1204) (buf!4815 (_2!8769 lt!291884)) lt!292850 lt!292842))))

(assert (=> b!188459 (arrayBitRangesEq!0 (buf!4815 (_2!8769 lt!291884)) (buf!4815 thiss!1204) lt!292850 lt!292842)))

(declare-fun b!188460 () Bool)

(declare-fun Unit!13487 () Unit!13448)

(assert (=> b!188460 (= e!130198 Unit!13487)))

(declare-fun lt!292831 () (_ BitVec 64))

(declare-fun lt!292835 () (_ BitVec 64))

(declare-fun b!188461 () Bool)

(assert (=> b!188461 (= e!130197 (= (_1!8770 lt!292841) (withMovedBitIndex!0 (_2!8770 lt!292841) (bvsub lt!292831 lt!292835))))))

(assert (=> b!188461 (or (= (bvand lt!292831 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!292835 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!292831 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!292831 lt!292835) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!188461 (= lt!292835 (bitIndex!0 (size!4344 (buf!4815 (_2!8769 lt!291884))) (currentByte!9081 (_2!8769 lt!291884)) (currentBit!9076 (_2!8769 lt!291884))))))

(assert (=> b!188461 (= lt!292831 (bitIndex!0 (size!4344 (buf!4815 thiss!1204)) (currentByte!9081 thiss!1204) (currentBit!9076 thiss!1204)))))

(assert (= (and d!65063 c!9617) b!188459))

(assert (= (and d!65063 (not c!9617)) b!188460))

(assert (= (and d!65063 res!156991) b!188458))

(assert (= (and b!188458 res!156993) b!188457))

(assert (= (and b!188457 res!156992) b!188461))

(assert (=> b!188459 m!292581))

(declare-fun m!293223 () Bool)

(assert (=> b!188459 m!293223))

(declare-fun m!293225 () Bool)

(assert (=> b!188459 m!293225))

(declare-fun m!293227 () Bool)

(assert (=> b!188458 m!293227))

(declare-fun m!293231 () Bool)

(assert (=> b!188457 m!293231))

(declare-fun m!293235 () Bool)

(assert (=> d!65063 m!293235))

(assert (=> d!65063 m!292591))

(declare-fun m!293237 () Bool)

(assert (=> d!65063 m!293237))

(declare-fun m!293239 () Bool)

(assert (=> d!65063 m!293239))

(declare-fun m!293241 () Bool)

(assert (=> d!65063 m!293241))

(declare-fun m!293243 () Bool)

(assert (=> d!65063 m!293243))

(declare-fun m!293245 () Bool)

(assert (=> d!65063 m!293245))

(declare-fun m!293247 () Bool)

(assert (=> d!65063 m!293247))

(declare-fun m!293251 () Bool)

(assert (=> d!65063 m!293251))

(declare-fun m!293253 () Bool)

(assert (=> d!65063 m!293253))

(declare-fun m!293255 () Bool)

(assert (=> d!65063 m!293255))

(declare-fun m!293257 () Bool)

(assert (=> b!188461 m!293257))

(assert (=> b!188461 m!292589))

(assert (=> b!188461 m!292581))

(assert (=> b!188128 d!65063))

(declare-fun d!65071 () Bool)

(declare-fun lt!292859 () tuple2!16264)

(assert (=> d!65071 (= lt!292859 (readBit!0 (BitStream!7797 (buf!4815 (_2!8769 lt!291884)) (currentByte!9081 thiss!1204) (currentBit!9076 thiss!1204))))))

(assert (=> d!65071 (= (readBitPure!0 (BitStream!7797 (buf!4815 (_2!8769 lt!291884)) (currentByte!9081 thiss!1204) (currentBit!9076 thiss!1204))) (tuple2!16255 (_2!8777 lt!292859) (_1!8777 lt!292859)))))

(declare-fun bs!16165 () Bool)

(assert (= bs!16165 d!65071))

(declare-fun m!293259 () Bool)

(assert (=> bs!16165 m!293259))

(assert (=> b!188128 d!65071))

(declare-fun d!65073 () Bool)

(declare-fun e!130200 () Bool)

(assert (=> d!65073 e!130200))

(declare-fun res!156997 () Bool)

(assert (=> d!65073 (=> (not res!156997) (not e!130200))))

(declare-fun lt!292861 () (_ BitVec 64))

(declare-fun lt!292860 () (_ BitVec 64))

(declare-fun lt!292863 () (_ BitVec 64))

(assert (=> d!65073 (= res!156997 (= lt!292863 (bvsub lt!292860 lt!292861)))))

(assert (=> d!65073 (or (= (bvand lt!292860 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!292861 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!292860 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!292860 lt!292861) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65073 (= lt!292861 (remainingBits!0 ((_ sign_extend 32) (size!4344 (buf!4815 (_1!8772 lt!291864)))) ((_ sign_extend 32) (currentByte!9081 (_1!8772 lt!291864))) ((_ sign_extend 32) (currentBit!9076 (_1!8772 lt!291864)))))))

(declare-fun lt!292864 () (_ BitVec 64))

(declare-fun lt!292865 () (_ BitVec 64))

(assert (=> d!65073 (= lt!292860 (bvmul lt!292864 lt!292865))))

(assert (=> d!65073 (or (= lt!292864 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!292865 (bvsdiv (bvmul lt!292864 lt!292865) lt!292864)))))

(assert (=> d!65073 (= lt!292865 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65073 (= lt!292864 ((_ sign_extend 32) (size!4344 (buf!4815 (_1!8772 lt!291864)))))))

(assert (=> d!65073 (= lt!292863 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9081 (_1!8772 lt!291864))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9076 (_1!8772 lt!291864)))))))

(assert (=> d!65073 (invariant!0 (currentBit!9076 (_1!8772 lt!291864)) (currentByte!9081 (_1!8772 lt!291864)) (size!4344 (buf!4815 (_1!8772 lt!291864))))))

(assert (=> d!65073 (= (bitIndex!0 (size!4344 (buf!4815 (_1!8772 lt!291864))) (currentByte!9081 (_1!8772 lt!291864)) (currentBit!9076 (_1!8772 lt!291864))) lt!292863)))

(declare-fun b!188464 () Bool)

(declare-fun res!156996 () Bool)

(assert (=> b!188464 (=> (not res!156996) (not e!130200))))

(assert (=> b!188464 (= res!156996 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!292863))))

(declare-fun b!188465 () Bool)

(declare-fun lt!292862 () (_ BitVec 64))

(assert (=> b!188465 (= e!130200 (bvsle lt!292863 (bvmul lt!292862 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!188465 (or (= lt!292862 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!292862 #b0000000000000000000000000000000000000000000000000000000000001000) lt!292862)))))

(assert (=> b!188465 (= lt!292862 ((_ sign_extend 32) (size!4344 (buf!4815 (_1!8772 lt!291864)))))))

(assert (= (and d!65073 res!156997) b!188464))

(assert (= (and b!188464 res!156996) b!188465))

(declare-fun m!293263 () Bool)

(assert (=> d!65073 m!293263))

(declare-fun m!293265 () Bool)

(assert (=> d!65073 m!293265))

(assert (=> b!188128 d!65073))

(declare-fun d!65079 () Bool)

(declare-fun e!130205 () Bool)

(assert (=> d!65079 e!130205))

(declare-fun res!157003 () Bool)

(assert (=> d!65079 (=> (not res!157003) (not e!130205))))

(declare-fun lt!292895 () tuple2!16254)

(declare-fun lt!292896 () tuple2!16254)

(assert (=> d!65079 (= res!157003 (= (bitIndex!0 (size!4344 (buf!4815 (_1!8772 lt!292895))) (currentByte!9081 (_1!8772 lt!292895)) (currentBit!9076 (_1!8772 lt!292895))) (bitIndex!0 (size!4344 (buf!4815 (_1!8772 lt!292896))) (currentByte!9081 (_1!8772 lt!292896)) (currentBit!9076 (_1!8772 lt!292896)))))))

(declare-fun lt!292898 () Unit!13448)

(declare-fun lt!292897 () BitStream!7796)

(declare-fun choose!50 (BitStream!7796 BitStream!7796 BitStream!7796 tuple2!16254 tuple2!16254 BitStream!7796 Bool tuple2!16254 tuple2!16254 BitStream!7796 Bool) Unit!13448)

(assert (=> d!65079 (= lt!292898 (choose!50 lt!291879 (_2!8769 lt!291884) lt!292897 lt!292895 (tuple2!16255 (_1!8772 lt!292895) (_2!8772 lt!292895)) (_1!8772 lt!292895) (_2!8772 lt!292895) lt!292896 (tuple2!16255 (_1!8772 lt!292896) (_2!8772 lt!292896)) (_1!8772 lt!292896) (_2!8772 lt!292896)))))

(assert (=> d!65079 (= lt!292896 (readBitPure!0 lt!292897))))

(assert (=> d!65079 (= lt!292895 (readBitPure!0 lt!291879))))

(assert (=> d!65079 (= lt!292897 (BitStream!7797 (buf!4815 (_2!8769 lt!291884)) (currentByte!9081 lt!291879) (currentBit!9076 lt!291879)))))

(assert (=> d!65079 (invariant!0 (currentBit!9076 lt!291879) (currentByte!9081 lt!291879) (size!4344 (buf!4815 (_2!8769 lt!291884))))))

(assert (=> d!65079 (= (readBitPrefixLemma!0 lt!291879 (_2!8769 lt!291884)) lt!292898)))

(declare-fun b!188473 () Bool)

(assert (=> b!188473 (= e!130205 (= (_2!8772 lt!292895) (_2!8772 lt!292896)))))

(assert (= (and d!65079 res!157003) b!188473))

(declare-fun m!293297 () Bool)

(assert (=> d!65079 m!293297))

(declare-fun m!293299 () Bool)

(assert (=> d!65079 m!293299))

(declare-fun m!293301 () Bool)

(assert (=> d!65079 m!293301))

(assert (=> d!65079 m!292649))

(declare-fun m!293303 () Bool)

(assert (=> d!65079 m!293303))

(declare-fun m!293305 () Bool)

(assert (=> d!65079 m!293305))

(assert (=> b!188128 d!65079))

(declare-fun b!188474 () Bool)

(declare-fun res!157005 () Bool)

(declare-fun e!130206 () Bool)

(assert (=> b!188474 (=> (not res!157005) (not e!130206))))

(declare-fun lt!292909 () tuple2!16250)

(assert (=> b!188474 (= res!157005 (isPrefixOf!0 (_2!8770 lt!292909) (_2!8769 lt!291884)))))

(declare-fun b!188475 () Bool)

(declare-fun res!157006 () Bool)

(assert (=> b!188475 (=> (not res!157006) (not e!130206))))

(assert (=> b!188475 (= res!157006 (isPrefixOf!0 (_1!8770 lt!292909) (_2!8769 lt!291888)))))

(declare-fun d!65085 () Bool)

(assert (=> d!65085 e!130206))

(declare-fun res!157004 () Bool)

(assert (=> d!65085 (=> (not res!157004) (not e!130206))))

(assert (=> d!65085 (= res!157004 (isPrefixOf!0 (_1!8770 lt!292909) (_2!8770 lt!292909)))))

(declare-fun lt!292904 () BitStream!7796)

(assert (=> d!65085 (= lt!292909 (tuple2!16251 lt!292904 (_2!8769 lt!291884)))))

(declare-fun lt!292906 () Unit!13448)

(declare-fun lt!292912 () Unit!13448)

(assert (=> d!65085 (= lt!292906 lt!292912)))

(assert (=> d!65085 (isPrefixOf!0 lt!292904 (_2!8769 lt!291884))))

(assert (=> d!65085 (= lt!292912 (lemmaIsPrefixTransitive!0 lt!292904 (_2!8769 lt!291884) (_2!8769 lt!291884)))))

(declare-fun lt!292915 () Unit!13448)

(declare-fun lt!292916 () Unit!13448)

(assert (=> d!65085 (= lt!292915 lt!292916)))

(assert (=> d!65085 (isPrefixOf!0 lt!292904 (_2!8769 lt!291884))))

(assert (=> d!65085 (= lt!292916 (lemmaIsPrefixTransitive!0 lt!292904 (_2!8769 lt!291888) (_2!8769 lt!291884)))))

(declare-fun lt!292901 () Unit!13448)

(declare-fun e!130207 () Unit!13448)

(assert (=> d!65085 (= lt!292901 e!130207)))

(declare-fun c!9619 () Bool)

(assert (=> d!65085 (= c!9619 (not (= (size!4344 (buf!4815 (_2!8769 lt!291888))) #b00000000000000000000000000000000)))))

(declare-fun lt!292905 () Unit!13448)

(declare-fun lt!292900 () Unit!13448)

(assert (=> d!65085 (= lt!292905 lt!292900)))

(assert (=> d!65085 (isPrefixOf!0 (_2!8769 lt!291884) (_2!8769 lt!291884))))

(assert (=> d!65085 (= lt!292900 (lemmaIsPrefixRefl!0 (_2!8769 lt!291884)))))

(declare-fun lt!292913 () Unit!13448)

(declare-fun lt!292911 () Unit!13448)

(assert (=> d!65085 (= lt!292913 lt!292911)))

(assert (=> d!65085 (= lt!292911 (lemmaIsPrefixRefl!0 (_2!8769 lt!291884)))))

(declare-fun lt!292914 () Unit!13448)

(declare-fun lt!292917 () Unit!13448)

(assert (=> d!65085 (= lt!292914 lt!292917)))

(assert (=> d!65085 (isPrefixOf!0 lt!292904 lt!292904)))

(assert (=> d!65085 (= lt!292917 (lemmaIsPrefixRefl!0 lt!292904))))

(declare-fun lt!292907 () Unit!13448)

(declare-fun lt!292908 () Unit!13448)

(assert (=> d!65085 (= lt!292907 lt!292908)))

(assert (=> d!65085 (isPrefixOf!0 (_2!8769 lt!291888) (_2!8769 lt!291888))))

(assert (=> d!65085 (= lt!292908 (lemmaIsPrefixRefl!0 (_2!8769 lt!291888)))))

(assert (=> d!65085 (= lt!292904 (BitStream!7797 (buf!4815 (_2!8769 lt!291884)) (currentByte!9081 (_2!8769 lt!291888)) (currentBit!9076 (_2!8769 lt!291888))))))

(assert (=> d!65085 (isPrefixOf!0 (_2!8769 lt!291888) (_2!8769 lt!291884))))

(assert (=> d!65085 (= (reader!0 (_2!8769 lt!291888) (_2!8769 lt!291884)) lt!292909)))

(declare-fun b!188476 () Bool)

(declare-fun lt!292902 () Unit!13448)

(assert (=> b!188476 (= e!130207 lt!292902)))

(declare-fun lt!292918 () (_ BitVec 64))

(assert (=> b!188476 (= lt!292918 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!292910 () (_ BitVec 64))

(assert (=> b!188476 (= lt!292910 (bitIndex!0 (size!4344 (buf!4815 (_2!8769 lt!291888))) (currentByte!9081 (_2!8769 lt!291888)) (currentBit!9076 (_2!8769 lt!291888))))))

(assert (=> b!188476 (= lt!292902 (arrayBitRangesEqSymmetric!0 (buf!4815 (_2!8769 lt!291888)) (buf!4815 (_2!8769 lt!291884)) lt!292918 lt!292910))))

(assert (=> b!188476 (arrayBitRangesEq!0 (buf!4815 (_2!8769 lt!291884)) (buf!4815 (_2!8769 lt!291888)) lt!292918 lt!292910)))

(declare-fun b!188477 () Bool)

(declare-fun Unit!13488 () Unit!13448)

(assert (=> b!188477 (= e!130207 Unit!13488)))

(declare-fun lt!292899 () (_ BitVec 64))

(declare-fun lt!292903 () (_ BitVec 64))

(declare-fun b!188478 () Bool)

(assert (=> b!188478 (= e!130206 (= (_1!8770 lt!292909) (withMovedBitIndex!0 (_2!8770 lt!292909) (bvsub lt!292899 lt!292903))))))

(assert (=> b!188478 (or (= (bvand lt!292899 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!292903 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!292899 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!292899 lt!292903) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!188478 (= lt!292903 (bitIndex!0 (size!4344 (buf!4815 (_2!8769 lt!291884))) (currentByte!9081 (_2!8769 lt!291884)) (currentBit!9076 (_2!8769 lt!291884))))))

(assert (=> b!188478 (= lt!292899 (bitIndex!0 (size!4344 (buf!4815 (_2!8769 lt!291888))) (currentByte!9081 (_2!8769 lt!291888)) (currentBit!9076 (_2!8769 lt!291888))))))

(assert (= (and d!65085 c!9619) b!188476))

(assert (= (and d!65085 (not c!9619)) b!188477))

(assert (= (and d!65085 res!157004) b!188475))

(assert (= (and b!188475 res!157006) b!188474))

(assert (= (and b!188474 res!157005) b!188478))

(assert (=> b!188476 m!292579))

(declare-fun m!293307 () Bool)

(assert (=> b!188476 m!293307))

(declare-fun m!293309 () Bool)

(assert (=> b!188476 m!293309))

(declare-fun m!293311 () Bool)

(assert (=> b!188475 m!293311))

(declare-fun m!293313 () Bool)

(assert (=> b!188474 m!293313))

(assert (=> d!65085 m!293235))

(assert (=> d!65085 m!292653))

(declare-fun m!293315 () Bool)

(assert (=> d!65085 m!293315))

(declare-fun m!293317 () Bool)

(assert (=> d!65085 m!293317))

(declare-fun m!293319 () Bool)

(assert (=> d!65085 m!293319))

(declare-fun m!293321 () Bool)

(assert (=> d!65085 m!293321))

(declare-fun m!293323 () Bool)

(assert (=> d!65085 m!293323))

(declare-fun m!293325 () Bool)

(assert (=> d!65085 m!293325))

(declare-fun m!293327 () Bool)

(assert (=> d!65085 m!293327))

(assert (=> d!65085 m!293253))

(assert (=> d!65085 m!293153))

(declare-fun m!293329 () Bool)

(assert (=> b!188478 m!293329))

(assert (=> b!188478 m!292589))

(assert (=> b!188478 m!292579))

(assert (=> b!188128 d!65085))

(declare-datatypes ((tuple2!16266 0))(
  ( (tuple2!16267 (_1!8778 (_ BitVec 64)) (_2!8778 BitStream!7796)) )
))
(declare-fun lt!292921 () tuple2!16266)

(declare-fun d!65087 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!7796 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16266)

(assert (=> d!65087 (= lt!292921 (readNBitsLSBFirstsLoop!0 (_1!8770 lt!291891) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!291872))))

(assert (=> d!65087 (= (readNBitsLSBFirstsLoopPure!0 (_1!8770 lt!291891) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!291872) (tuple2!16253 (_2!8778 lt!292921) (_1!8778 lt!292921)))))

(declare-fun bs!16168 () Bool)

(assert (= bs!16168 d!65087))

(declare-fun m!293331 () Bool)

(assert (=> bs!16168 m!293331))

(assert (=> b!188128 d!65087))

(declare-fun d!65089 () Bool)

(assert (=> d!65089 (= (invariant!0 (currentBit!9076 thiss!1204) (currentByte!9081 thiss!1204) (size!4344 (buf!4815 (_2!8769 lt!291888)))) (and (bvsge (currentBit!9076 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9076 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9081 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9081 thiss!1204) (size!4344 (buf!4815 (_2!8769 lt!291888)))) (and (= (currentBit!9076 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9081 thiss!1204) (size!4344 (buf!4815 (_2!8769 lt!291888))))))))))

(assert (=> b!188128 d!65089))

(declare-fun d!65091 () Bool)

(declare-fun e!130208 () Bool)

(assert (=> d!65091 e!130208))

(declare-fun res!157008 () Bool)

(assert (=> d!65091 (=> (not res!157008) (not e!130208))))

(declare-fun lt!292923 () (_ BitVec 64))

(declare-fun lt!292925 () (_ BitVec 64))

(declare-fun lt!292922 () (_ BitVec 64))

(assert (=> d!65091 (= res!157008 (= lt!292925 (bvsub lt!292922 lt!292923)))))

(assert (=> d!65091 (or (= (bvand lt!292922 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!292923 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!292922 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!292922 lt!292923) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65091 (= lt!292923 (remainingBits!0 ((_ sign_extend 32) (size!4344 (buf!4815 (_1!8772 lt!291878)))) ((_ sign_extend 32) (currentByte!9081 (_1!8772 lt!291878))) ((_ sign_extend 32) (currentBit!9076 (_1!8772 lt!291878)))))))

(declare-fun lt!292926 () (_ BitVec 64))

(declare-fun lt!292927 () (_ BitVec 64))

(assert (=> d!65091 (= lt!292922 (bvmul lt!292926 lt!292927))))

(assert (=> d!65091 (or (= lt!292926 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!292927 (bvsdiv (bvmul lt!292926 lt!292927) lt!292926)))))

(assert (=> d!65091 (= lt!292927 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65091 (= lt!292926 ((_ sign_extend 32) (size!4344 (buf!4815 (_1!8772 lt!291878)))))))

(assert (=> d!65091 (= lt!292925 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9081 (_1!8772 lt!291878))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9076 (_1!8772 lt!291878)))))))

(assert (=> d!65091 (invariant!0 (currentBit!9076 (_1!8772 lt!291878)) (currentByte!9081 (_1!8772 lt!291878)) (size!4344 (buf!4815 (_1!8772 lt!291878))))))

(assert (=> d!65091 (= (bitIndex!0 (size!4344 (buf!4815 (_1!8772 lt!291878))) (currentByte!9081 (_1!8772 lt!291878)) (currentBit!9076 (_1!8772 lt!291878))) lt!292925)))

(declare-fun b!188479 () Bool)

(declare-fun res!157007 () Bool)

(assert (=> b!188479 (=> (not res!157007) (not e!130208))))

(assert (=> b!188479 (= res!157007 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!292925))))

(declare-fun b!188480 () Bool)

(declare-fun lt!292924 () (_ BitVec 64))

(assert (=> b!188480 (= e!130208 (bvsle lt!292925 (bvmul lt!292924 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!188480 (or (= lt!292924 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!292924 #b0000000000000000000000000000000000000000000000000000000000001000) lt!292924)))))

(assert (=> b!188480 (= lt!292924 ((_ sign_extend 32) (size!4344 (buf!4815 (_1!8772 lt!291878)))))))

(assert (= (and d!65091 res!157008) b!188479))

(assert (= (and b!188479 res!157007) b!188480))

(declare-fun m!293333 () Bool)

(assert (=> d!65091 m!293333))

(declare-fun m!293335 () Bool)

(assert (=> d!65091 m!293335))

(assert (=> b!188128 d!65091))

(declare-fun d!65093 () Bool)

(assert (=> d!65093 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4344 (buf!4815 (_2!8769 lt!291884)))) ((_ sign_extend 32) (currentByte!9081 thiss!1204)) ((_ sign_extend 32) (currentBit!9076 thiss!1204)) lt!291870) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4344 (buf!4815 (_2!8769 lt!291884)))) ((_ sign_extend 32) (currentByte!9081 thiss!1204)) ((_ sign_extend 32) (currentBit!9076 thiss!1204))) lt!291870))))

(declare-fun bs!16169 () Bool)

(assert (= bs!16169 d!65093))

(declare-fun m!293337 () Bool)

(assert (=> bs!16169 m!293337))

(assert (=> b!188128 d!65093))

(declare-fun d!65095 () Bool)

(assert (=> d!65095 (validate_offset_bits!1 ((_ sign_extend 32) (size!4344 (buf!4815 (_2!8769 lt!291884)))) ((_ sign_extend 32) (currentByte!9081 (_2!8769 lt!291888))) ((_ sign_extend 32) (currentBit!9076 (_2!8769 lt!291888))) lt!291876)))

(declare-fun lt!292928 () Unit!13448)

(assert (=> d!65095 (= lt!292928 (choose!9 (_2!8769 lt!291888) (buf!4815 (_2!8769 lt!291884)) lt!291876 (BitStream!7797 (buf!4815 (_2!8769 lt!291884)) (currentByte!9081 (_2!8769 lt!291888)) (currentBit!9076 (_2!8769 lt!291888)))))))

(assert (=> d!65095 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8769 lt!291888) (buf!4815 (_2!8769 lt!291884)) lt!291876) lt!292928)))

(declare-fun bs!16170 () Bool)

(assert (= bs!16170 d!65095))

(assert (=> bs!16170 m!292623))

(declare-fun m!293339 () Bool)

(assert (=> bs!16170 m!293339))

(assert (=> b!188128 d!65095))

(declare-fun d!65097 () Bool)

(declare-fun lt!292929 () tuple2!16266)

(assert (=> d!65097 (= lt!292929 (readNBitsLSBFirstsLoop!0 (_1!8770 lt!291865) nBits!348 i!590 lt!291880))))

(assert (=> d!65097 (= (readNBitsLSBFirstsLoopPure!0 (_1!8770 lt!291865) nBits!348 i!590 lt!291880) (tuple2!16253 (_2!8778 lt!292929) (_1!8778 lt!292929)))))

(declare-fun bs!16171 () Bool)

(assert (= bs!16171 d!65097))

(declare-fun m!293341 () Bool)

(assert (=> bs!16171 m!293341))

(assert (=> b!188128 d!65097))

(declare-fun d!65099 () Bool)

(declare-fun lt!292930 () tuple2!16264)

(assert (=> d!65099 (= lt!292930 (readBit!0 lt!291879))))

(assert (=> d!65099 (= (readBitPure!0 lt!291879) (tuple2!16255 (_2!8777 lt!292930) (_1!8777 lt!292930)))))

(declare-fun bs!16172 () Bool)

(assert (= bs!16172 d!65099))

(declare-fun m!293343 () Bool)

(assert (=> bs!16172 m!293343))

(assert (=> b!188128 d!65099))

(declare-fun d!65101 () Bool)

(declare-fun e!130209 () Bool)

(assert (=> d!65101 e!130209))

(declare-fun res!157010 () Bool)

(assert (=> d!65101 (=> (not res!157010) (not e!130209))))

(declare-fun lt!292931 () (_ BitVec 64))

(declare-fun lt!292934 () (_ BitVec 64))

(declare-fun lt!292932 () (_ BitVec 64))

(assert (=> d!65101 (= res!157010 (= lt!292934 (bvsub lt!292931 lt!292932)))))

(assert (=> d!65101 (or (= (bvand lt!292931 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!292932 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!292931 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!292931 lt!292932) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65101 (= lt!292932 (remainingBits!0 ((_ sign_extend 32) (size!4344 (buf!4815 (_2!8769 lt!291888)))) ((_ sign_extend 32) (currentByte!9081 (_2!8769 lt!291888))) ((_ sign_extend 32) (currentBit!9076 (_2!8769 lt!291888)))))))

(declare-fun lt!292935 () (_ BitVec 64))

(declare-fun lt!292936 () (_ BitVec 64))

(assert (=> d!65101 (= lt!292931 (bvmul lt!292935 lt!292936))))

(assert (=> d!65101 (or (= lt!292935 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!292936 (bvsdiv (bvmul lt!292935 lt!292936) lt!292935)))))

(assert (=> d!65101 (= lt!292936 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65101 (= lt!292935 ((_ sign_extend 32) (size!4344 (buf!4815 (_2!8769 lt!291888)))))))

(assert (=> d!65101 (= lt!292934 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9081 (_2!8769 lt!291888))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9076 (_2!8769 lt!291888)))))))

(assert (=> d!65101 (invariant!0 (currentBit!9076 (_2!8769 lt!291888)) (currentByte!9081 (_2!8769 lt!291888)) (size!4344 (buf!4815 (_2!8769 lt!291888))))))

(assert (=> d!65101 (= (bitIndex!0 (size!4344 (buf!4815 (_2!8769 lt!291888))) (currentByte!9081 (_2!8769 lt!291888)) (currentBit!9076 (_2!8769 lt!291888))) lt!292934)))

(declare-fun b!188481 () Bool)

(declare-fun res!157009 () Bool)

(assert (=> b!188481 (=> (not res!157009) (not e!130209))))

(assert (=> b!188481 (= res!157009 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!292934))))

(declare-fun b!188482 () Bool)

(declare-fun lt!292933 () (_ BitVec 64))

(assert (=> b!188482 (= e!130209 (bvsle lt!292934 (bvmul lt!292933 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!188482 (or (= lt!292933 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!292933 #b0000000000000000000000000000000000000000000000000000000000001000) lt!292933)))))

(assert (=> b!188482 (= lt!292933 ((_ sign_extend 32) (size!4344 (buf!4815 (_2!8769 lt!291888)))))))

(assert (= (and d!65101 res!157010) b!188481))

(assert (= (and b!188481 res!157009) b!188482))

(declare-fun m!293345 () Bool)

(assert (=> d!65101 m!293345))

(declare-fun m!293347 () Bool)

(assert (=> d!65101 m!293347))

(assert (=> b!188138 d!65101))

(declare-fun d!65103 () Bool)

(declare-fun e!130210 () Bool)

(assert (=> d!65103 e!130210))

(declare-fun res!157012 () Bool)

(assert (=> d!65103 (=> (not res!157012) (not e!130210))))

(declare-fun lt!292937 () (_ BitVec 64))

(declare-fun lt!292938 () (_ BitVec 64))

(declare-fun lt!292940 () (_ BitVec 64))

(assert (=> d!65103 (= res!157012 (= lt!292940 (bvsub lt!292937 lt!292938)))))

(assert (=> d!65103 (or (= (bvand lt!292937 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!292938 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!292937 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!292937 lt!292938) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65103 (= lt!292938 (remainingBits!0 ((_ sign_extend 32) (size!4344 (buf!4815 thiss!1204))) ((_ sign_extend 32) (currentByte!9081 thiss!1204)) ((_ sign_extend 32) (currentBit!9076 thiss!1204))))))

(declare-fun lt!292941 () (_ BitVec 64))

(declare-fun lt!292942 () (_ BitVec 64))

(assert (=> d!65103 (= lt!292937 (bvmul lt!292941 lt!292942))))

(assert (=> d!65103 (or (= lt!292941 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!292942 (bvsdiv (bvmul lt!292941 lt!292942) lt!292941)))))

(assert (=> d!65103 (= lt!292942 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65103 (= lt!292941 ((_ sign_extend 32) (size!4344 (buf!4815 thiss!1204))))))

(assert (=> d!65103 (= lt!292940 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9081 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9076 thiss!1204))))))

(assert (=> d!65103 (invariant!0 (currentBit!9076 thiss!1204) (currentByte!9081 thiss!1204) (size!4344 (buf!4815 thiss!1204)))))

(assert (=> d!65103 (= (bitIndex!0 (size!4344 (buf!4815 thiss!1204)) (currentByte!9081 thiss!1204) (currentBit!9076 thiss!1204)) lt!292940)))

(declare-fun b!188483 () Bool)

(declare-fun res!157011 () Bool)

(assert (=> b!188483 (=> (not res!157011) (not e!130210))))

(assert (=> b!188483 (= res!157011 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!292940))))

(declare-fun b!188484 () Bool)

(declare-fun lt!292939 () (_ BitVec 64))

(assert (=> b!188484 (= e!130210 (bvsle lt!292940 (bvmul lt!292939 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!188484 (or (= lt!292939 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!292939 #b0000000000000000000000000000000000000000000000000000000000001000) lt!292939)))))

(assert (=> b!188484 (= lt!292939 ((_ sign_extend 32) (size!4344 (buf!4815 thiss!1204))))))

(assert (= (and d!65103 res!157012) b!188483))

(assert (= (and b!188483 res!157011) b!188484))

(declare-fun m!293349 () Bool)

(assert (=> d!65103 m!293349))

(assert (=> d!65103 m!292577))

(assert (=> b!188138 d!65103))

(declare-fun d!65105 () Bool)

(declare-fun e!130215 () Bool)

(assert (=> d!65105 e!130215))

(declare-fun res!157024 () Bool)

(assert (=> d!65105 (=> (not res!157024) (not e!130215))))

(declare-fun lt!292953 () tuple2!16248)

(assert (=> d!65105 (= res!157024 (= (size!4344 (buf!4815 thiss!1204)) (size!4344 (buf!4815 (_2!8769 lt!292953)))))))

(declare-fun choose!16 (BitStream!7796 Bool) tuple2!16248)

(assert (=> d!65105 (= lt!292953 (choose!16 thiss!1204 lt!291889))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!65105 (validate_offset_bit!0 ((_ sign_extend 32) (size!4344 (buf!4815 thiss!1204))) ((_ sign_extend 32) (currentByte!9081 thiss!1204)) ((_ sign_extend 32) (currentBit!9076 thiss!1204)))))

(assert (=> d!65105 (= (appendBit!0 thiss!1204 lt!291889) lt!292953)))

(declare-fun b!188494 () Bool)

(declare-fun res!157023 () Bool)

(assert (=> b!188494 (=> (not res!157023) (not e!130215))))

(declare-fun lt!292954 () (_ BitVec 64))

(declare-fun lt!292951 () (_ BitVec 64))

(assert (=> b!188494 (= res!157023 (= (bitIndex!0 (size!4344 (buf!4815 (_2!8769 lt!292953))) (currentByte!9081 (_2!8769 lt!292953)) (currentBit!9076 (_2!8769 lt!292953))) (bvadd lt!292954 lt!292951)))))

(assert (=> b!188494 (or (not (= (bvand lt!292954 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!292951 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!292954 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!292954 lt!292951) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!188494 (= lt!292951 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!188494 (= lt!292954 (bitIndex!0 (size!4344 (buf!4815 thiss!1204)) (currentByte!9081 thiss!1204) (currentBit!9076 thiss!1204)))))

(declare-fun b!188495 () Bool)

(declare-fun res!157022 () Bool)

(assert (=> b!188495 (=> (not res!157022) (not e!130215))))

(assert (=> b!188495 (= res!157022 (isPrefixOf!0 thiss!1204 (_2!8769 lt!292953)))))

(declare-fun b!188497 () Bool)

(declare-fun e!130216 () Bool)

(declare-fun lt!292952 () tuple2!16254)

(assert (=> b!188497 (= e!130216 (= (bitIndex!0 (size!4344 (buf!4815 (_1!8772 lt!292952))) (currentByte!9081 (_1!8772 lt!292952)) (currentBit!9076 (_1!8772 lt!292952))) (bitIndex!0 (size!4344 (buf!4815 (_2!8769 lt!292953))) (currentByte!9081 (_2!8769 lt!292953)) (currentBit!9076 (_2!8769 lt!292953)))))))

(declare-fun b!188496 () Bool)

(assert (=> b!188496 (= e!130215 e!130216)))

(declare-fun res!157021 () Bool)

(assert (=> b!188496 (=> (not res!157021) (not e!130216))))

(assert (=> b!188496 (= res!157021 (and (= (_2!8772 lt!292952) lt!291889) (= (_1!8772 lt!292952) (_2!8769 lt!292953))))))

(assert (=> b!188496 (= lt!292952 (readBitPure!0 (readerFrom!0 (_2!8769 lt!292953) (currentBit!9076 thiss!1204) (currentByte!9081 thiss!1204))))))

(assert (= (and d!65105 res!157024) b!188494))

(assert (= (and b!188494 res!157023) b!188495))

(assert (= (and b!188495 res!157022) b!188496))

(assert (= (and b!188496 res!157021) b!188497))

(declare-fun m!293351 () Bool)

(assert (=> b!188494 m!293351))

(assert (=> b!188494 m!292581))

(declare-fun m!293353 () Bool)

(assert (=> b!188496 m!293353))

(assert (=> b!188496 m!293353))

(declare-fun m!293355 () Bool)

(assert (=> b!188496 m!293355))

(declare-fun m!293357 () Bool)

(assert (=> b!188497 m!293357))

(assert (=> b!188497 m!293351))

(declare-fun m!293359 () Bool)

(assert (=> b!188495 m!293359))

(declare-fun m!293361 () Bool)

(assert (=> d!65105 m!293361))

(declare-fun m!293363 () Bool)

(assert (=> d!65105 m!293363))

(assert (=> b!188138 d!65105))

(declare-fun d!65107 () Bool)

(declare-fun e!130219 () Bool)

(assert (=> d!65107 e!130219))

(declare-fun res!157027 () Bool)

(assert (=> d!65107 (=> (not res!157027) (not e!130219))))

(declare-fun lt!292959 () BitStream!7796)

(declare-fun lt!292960 () (_ BitVec 64))

(assert (=> d!65107 (= res!157027 (= (bvadd lt!292960 (bvsub lt!291881 lt!291892)) (bitIndex!0 (size!4344 (buf!4815 lt!292959)) (currentByte!9081 lt!292959) (currentBit!9076 lt!292959))))))

(assert (=> d!65107 (or (not (= (bvand lt!292960 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!291881 lt!291892) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!292960 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!292960 (bvsub lt!291881 lt!291892)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65107 (= lt!292960 (bitIndex!0 (size!4344 (buf!4815 (_2!8770 lt!291891))) (currentByte!9081 (_2!8770 lt!291891)) (currentBit!9076 (_2!8770 lt!291891))))))

(declare-fun moveBitIndex!0 (BitStream!7796 (_ BitVec 64)) tuple2!16248)

(assert (=> d!65107 (= lt!292959 (_2!8769 (moveBitIndex!0 (_2!8770 lt!291891) (bvsub lt!291881 lt!291892))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!7796 (_ BitVec 64)) Bool)

(assert (=> d!65107 (moveBitIndexPrecond!0 (_2!8770 lt!291891) (bvsub lt!291881 lt!291892))))

(assert (=> d!65107 (= (withMovedBitIndex!0 (_2!8770 lt!291891) (bvsub lt!291881 lt!291892)) lt!292959)))

(declare-fun b!188500 () Bool)

(assert (=> b!188500 (= e!130219 (= (size!4344 (buf!4815 (_2!8770 lt!291891))) (size!4344 (buf!4815 lt!292959))))))

(assert (= (and d!65107 res!157027) b!188500))

(declare-fun m!293365 () Bool)

(assert (=> d!65107 m!293365))

(declare-fun m!293367 () Bool)

(assert (=> d!65107 m!293367))

(declare-fun m!293369 () Bool)

(assert (=> d!65107 m!293369))

(declare-fun m!293371 () Bool)

(assert (=> d!65107 m!293371))

(assert (=> b!188135 d!65107))

(assert (=> b!188134 d!65101))

(assert (=> b!188134 d!65103))

(declare-fun d!65109 () Bool)

(declare-fun res!157029 () Bool)

(declare-fun e!130221 () Bool)

(assert (=> d!65109 (=> (not res!157029) (not e!130221))))

(assert (=> d!65109 (= res!157029 (= (size!4344 (buf!4815 (_2!8769 lt!291888))) (size!4344 (buf!4815 (_2!8769 lt!291884)))))))

(assert (=> d!65109 (= (isPrefixOf!0 (_2!8769 lt!291888) (_2!8769 lt!291884)) e!130221)))

(declare-fun b!188501 () Bool)

(declare-fun res!157030 () Bool)

(assert (=> b!188501 (=> (not res!157030) (not e!130221))))

(assert (=> b!188501 (= res!157030 (bvsle (bitIndex!0 (size!4344 (buf!4815 (_2!8769 lt!291888))) (currentByte!9081 (_2!8769 lt!291888)) (currentBit!9076 (_2!8769 lt!291888))) (bitIndex!0 (size!4344 (buf!4815 (_2!8769 lt!291884))) (currentByte!9081 (_2!8769 lt!291884)) (currentBit!9076 (_2!8769 lt!291884)))))))

(declare-fun b!188502 () Bool)

(declare-fun e!130220 () Bool)

(assert (=> b!188502 (= e!130221 e!130220)))

(declare-fun res!157028 () Bool)

(assert (=> b!188502 (=> res!157028 e!130220)))

(assert (=> b!188502 (= res!157028 (= (size!4344 (buf!4815 (_2!8769 lt!291888))) #b00000000000000000000000000000000))))

(declare-fun b!188503 () Bool)

(assert (=> b!188503 (= e!130220 (arrayBitRangesEq!0 (buf!4815 (_2!8769 lt!291888)) (buf!4815 (_2!8769 lt!291884)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4344 (buf!4815 (_2!8769 lt!291888))) (currentByte!9081 (_2!8769 lt!291888)) (currentBit!9076 (_2!8769 lt!291888)))))))

(assert (= (and d!65109 res!157029) b!188501))

(assert (= (and b!188501 res!157030) b!188502))

(assert (= (and b!188502 (not res!157028)) b!188503))

(assert (=> b!188501 m!292579))

(assert (=> b!188501 m!292589))

(assert (=> b!188503 m!292579))

(assert (=> b!188503 m!292579))

(declare-fun m!293373 () Bool)

(assert (=> b!188503 m!293373))

(assert (=> b!188136 d!65109))

(declare-fun d!65111 () Bool)

(declare-fun lt!292973 () tuple2!16252)

(declare-fun lt!292974 () tuple2!16252)

(assert (=> d!65111 (and (= (_2!8771 lt!292973) (_2!8771 lt!292974)) (= (_1!8771 lt!292973) (_1!8771 lt!292974)))))

(declare-fun lt!292978 () (_ BitVec 64))

(declare-fun lt!292975 () Bool)

(declare-fun lt!292976 () BitStream!7796)

(declare-fun lt!292977 () Unit!13448)

(declare-fun choose!56 (BitStream!7796 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!16252 tuple2!16252 BitStream!7796 (_ BitVec 64) Bool BitStream!7796 (_ BitVec 64) tuple2!16252 tuple2!16252 BitStream!7796 (_ BitVec 64)) Unit!13448)

(assert (=> d!65111 (= lt!292977 (choose!56 (_1!8770 lt!291865) nBits!348 i!590 lt!291880 lt!292973 (tuple2!16253 (_1!8771 lt!292973) (_2!8771 lt!292973)) (_1!8771 lt!292973) (_2!8771 lt!292973) lt!292975 lt!292976 lt!292978 lt!292974 (tuple2!16253 (_1!8771 lt!292974) (_2!8771 lt!292974)) (_1!8771 lt!292974) (_2!8771 lt!292974)))))

(assert (=> d!65111 (= lt!292974 (readNBitsLSBFirstsLoopPure!0 lt!292976 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!292978))))

(assert (=> d!65111 (= lt!292978 (bvor lt!291880 (ite lt!292975 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65111 (= lt!292976 (withMovedBitIndex!0 (_1!8770 lt!291865) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!65111 (= lt!292975 (_2!8772 (readBitPure!0 (_1!8770 lt!291865))))))

(assert (=> d!65111 (= lt!292973 (readNBitsLSBFirstsLoopPure!0 (_1!8770 lt!291865) nBits!348 i!590 lt!291880))))

(assert (=> d!65111 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8770 lt!291865) nBits!348 i!590 lt!291880) lt!292977)))

(declare-fun bs!16174 () Bool)

(assert (= bs!16174 d!65111))

(declare-fun m!293375 () Bool)

(assert (=> bs!16174 m!293375))

(assert (=> bs!16174 m!292615))

(assert (=> bs!16174 m!292645))

(assert (=> bs!16174 m!292633))

(declare-fun m!293377 () Bool)

(assert (=> bs!16174 m!293377))

(assert (=> b!188125 d!65111))

(declare-fun d!65113 () Bool)

(declare-fun lt!292979 () tuple2!16266)

(assert (=> d!65113 (= lt!292979 (readNBitsLSBFirstsLoop!0 lt!291873 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!291872))))

(assert (=> d!65113 (= (readNBitsLSBFirstsLoopPure!0 lt!291873 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!291872) (tuple2!16253 (_2!8778 lt!292979) (_1!8778 lt!292979)))))

(declare-fun bs!16175 () Bool)

(assert (= bs!16175 d!65113))

(declare-fun m!293379 () Bool)

(assert (=> bs!16175 m!293379))

(assert (=> b!188125 d!65113))

(declare-fun d!65115 () Bool)

(declare-fun e!130222 () Bool)

(assert (=> d!65115 e!130222))

(declare-fun res!157031 () Bool)

(assert (=> d!65115 (=> (not res!157031) (not e!130222))))

(declare-fun lt!292981 () (_ BitVec 64))

(declare-fun lt!292980 () BitStream!7796)

(assert (=> d!65115 (= res!157031 (= (bvadd lt!292981 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4344 (buf!4815 lt!292980)) (currentByte!9081 lt!292980) (currentBit!9076 lt!292980))))))

(assert (=> d!65115 (or (not (= (bvand lt!292981 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!292981 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!292981 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65115 (= lt!292981 (bitIndex!0 (size!4344 (buf!4815 (_1!8770 lt!291865))) (currentByte!9081 (_1!8770 lt!291865)) (currentBit!9076 (_1!8770 lt!291865))))))

(assert (=> d!65115 (= lt!292980 (_2!8769 (moveBitIndex!0 (_1!8770 lt!291865) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!65115 (moveBitIndexPrecond!0 (_1!8770 lt!291865) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!65115 (= (withMovedBitIndex!0 (_1!8770 lt!291865) #b0000000000000000000000000000000000000000000000000000000000000001) lt!292980)))

(declare-fun b!188504 () Bool)

(assert (=> b!188504 (= e!130222 (= (size!4344 (buf!4815 (_1!8770 lt!291865))) (size!4344 (buf!4815 lt!292980))))))

(assert (= (and d!65115 res!157031) b!188504))

(declare-fun m!293381 () Bool)

(assert (=> d!65115 m!293381))

(declare-fun m!293383 () Bool)

(assert (=> d!65115 m!293383))

(declare-fun m!293385 () Bool)

(assert (=> d!65115 m!293385))

(declare-fun m!293387 () Bool)

(assert (=> d!65115 m!293387))

(assert (=> b!188125 d!65115))

(declare-fun d!65117 () Bool)

(declare-fun e!130223 () Bool)

(assert (=> d!65117 e!130223))

(declare-fun res!157032 () Bool)

(assert (=> d!65117 (=> (not res!157032) (not e!130223))))

(declare-fun lt!292982 () BitStream!7796)

(declare-fun lt!292983 () (_ BitVec 64))

(assert (=> d!65117 (= res!157032 (= (bvadd lt!292983 (bvsub lt!291886 lt!291892)) (bitIndex!0 (size!4344 (buf!4815 lt!292982)) (currentByte!9081 lt!292982) (currentBit!9076 lt!292982))))))

(assert (=> d!65117 (or (not (= (bvand lt!292983 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!291886 lt!291892) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!292983 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!292983 (bvsub lt!291886 lt!291892)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65117 (= lt!292983 (bitIndex!0 (size!4344 (buf!4815 (_2!8770 lt!291865))) (currentByte!9081 (_2!8770 lt!291865)) (currentBit!9076 (_2!8770 lt!291865))))))

(assert (=> d!65117 (= lt!292982 (_2!8769 (moveBitIndex!0 (_2!8770 lt!291865) (bvsub lt!291886 lt!291892))))))

(assert (=> d!65117 (moveBitIndexPrecond!0 (_2!8770 lt!291865) (bvsub lt!291886 lt!291892))))

(assert (=> d!65117 (= (withMovedBitIndex!0 (_2!8770 lt!291865) (bvsub lt!291886 lt!291892)) lt!292982)))

(declare-fun b!188505 () Bool)

(assert (=> b!188505 (= e!130223 (= (size!4344 (buf!4815 (_2!8770 lt!291865))) (size!4344 (buf!4815 lt!292982))))))

(assert (= (and d!65117 res!157032) b!188505))

(declare-fun m!293389 () Bool)

(assert (=> d!65117 m!293389))

(declare-fun m!293391 () Bool)

(assert (=> d!65117 m!293391))

(declare-fun m!293393 () Bool)

(assert (=> d!65117 m!293393))

(declare-fun m!293395 () Bool)

(assert (=> d!65117 m!293395))

(assert (=> b!188143 d!65117))

(declare-fun d!65119 () Bool)

(declare-fun res!157034 () Bool)

(declare-fun e!130225 () Bool)

(assert (=> d!65119 (=> (not res!157034) (not e!130225))))

(assert (=> d!65119 (= res!157034 (= (size!4344 (buf!4815 thiss!1204)) (size!4344 (buf!4815 (_2!8769 lt!291888)))))))

(assert (=> d!65119 (= (isPrefixOf!0 thiss!1204 (_2!8769 lt!291888)) e!130225)))

(declare-fun b!188506 () Bool)

(declare-fun res!157035 () Bool)

(assert (=> b!188506 (=> (not res!157035) (not e!130225))))

(assert (=> b!188506 (= res!157035 (bvsle (bitIndex!0 (size!4344 (buf!4815 thiss!1204)) (currentByte!9081 thiss!1204) (currentBit!9076 thiss!1204)) (bitIndex!0 (size!4344 (buf!4815 (_2!8769 lt!291888))) (currentByte!9081 (_2!8769 lt!291888)) (currentBit!9076 (_2!8769 lt!291888)))))))

(declare-fun b!188507 () Bool)

(declare-fun e!130224 () Bool)

(assert (=> b!188507 (= e!130225 e!130224)))

(declare-fun res!157033 () Bool)

(assert (=> b!188507 (=> res!157033 e!130224)))

(assert (=> b!188507 (= res!157033 (= (size!4344 (buf!4815 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!188508 () Bool)

(assert (=> b!188508 (= e!130224 (arrayBitRangesEq!0 (buf!4815 thiss!1204) (buf!4815 (_2!8769 lt!291888)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4344 (buf!4815 thiss!1204)) (currentByte!9081 thiss!1204) (currentBit!9076 thiss!1204))))))

(assert (= (and d!65119 res!157034) b!188506))

(assert (= (and b!188506 res!157035) b!188507))

(assert (= (and b!188507 (not res!157033)) b!188508))

(assert (=> b!188506 m!292581))

(assert (=> b!188506 m!292579))

(assert (=> b!188508 m!292581))

(assert (=> b!188508 m!292581))

(declare-fun m!293397 () Bool)

(assert (=> b!188508 m!293397))

(assert (=> b!188132 d!65119))

(declare-fun d!65121 () Bool)

(declare-fun lt!292984 () tuple2!16264)

(assert (=> d!65121 (= lt!292984 (readBit!0 (readerFrom!0 (_2!8769 lt!291888) (currentBit!9076 thiss!1204) (currentByte!9081 thiss!1204))))))

(assert (=> d!65121 (= (readBitPure!0 (readerFrom!0 (_2!8769 lt!291888) (currentBit!9076 thiss!1204) (currentByte!9081 thiss!1204))) (tuple2!16255 (_2!8777 lt!292984) (_1!8777 lt!292984)))))

(declare-fun bs!16176 () Bool)

(assert (= bs!16176 d!65121))

(assert (=> bs!16176 m!292601))

(declare-fun m!293399 () Bool)

(assert (=> bs!16176 m!293399))

(assert (=> b!188142 d!65121))

(declare-fun d!65123 () Bool)

(declare-fun e!130228 () Bool)

(assert (=> d!65123 e!130228))

(declare-fun res!157039 () Bool)

(assert (=> d!65123 (=> (not res!157039) (not e!130228))))

(assert (=> d!65123 (= res!157039 (invariant!0 (currentBit!9076 (_2!8769 lt!291888)) (currentByte!9081 (_2!8769 lt!291888)) (size!4344 (buf!4815 (_2!8769 lt!291888)))))))

(assert (=> d!65123 (= (readerFrom!0 (_2!8769 lt!291888) (currentBit!9076 thiss!1204) (currentByte!9081 thiss!1204)) (BitStream!7797 (buf!4815 (_2!8769 lt!291888)) (currentByte!9081 thiss!1204) (currentBit!9076 thiss!1204)))))

(declare-fun b!188511 () Bool)

(assert (=> b!188511 (= e!130228 (invariant!0 (currentBit!9076 thiss!1204) (currentByte!9081 thiss!1204) (size!4344 (buf!4815 (_2!8769 lt!291888)))))))

(assert (= (and d!65123 res!157039) b!188511))

(assert (=> d!65123 m!293347))

(assert (=> b!188511 m!292631))

(assert (=> b!188142 d!65123))

(declare-fun d!65125 () Bool)

(assert (=> d!65125 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9076 thiss!1204) (currentByte!9081 thiss!1204) (size!4344 (buf!4815 thiss!1204))))))

(declare-fun bs!16177 () Bool)

(assert (= bs!16177 d!65125))

(assert (=> bs!16177 m!292577))

(assert (=> start!40860 d!65125))

(assert (=> b!188123 d!65119))

(declare-fun d!65127 () Bool)

(assert (=> d!65127 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4344 (buf!4815 thiss!1204))) ((_ sign_extend 32) (currentByte!9081 thiss!1204)) ((_ sign_extend 32) (currentBit!9076 thiss!1204)) lt!291870) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4344 (buf!4815 thiss!1204))) ((_ sign_extend 32) (currentByte!9081 thiss!1204)) ((_ sign_extend 32) (currentBit!9076 thiss!1204))) lt!291870))))

(declare-fun bs!16178 () Bool)

(assert (= bs!16178 d!65127))

(assert (=> bs!16178 m!293349))

(assert (=> b!188144 d!65127))

(declare-fun d!65129 () Bool)

(assert (=> d!65129 (= (invariant!0 (currentBit!9076 thiss!1204) (currentByte!9081 thiss!1204) (size!4344 (buf!4815 thiss!1204))) (and (bvsge (currentBit!9076 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9076 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9081 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9081 thiss!1204) (size!4344 (buf!4815 thiss!1204))) (and (= (currentBit!9076 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9081 thiss!1204) (size!4344 (buf!4815 thiss!1204)))))))))

(assert (=> b!188140 d!65129))

(declare-fun d!65131 () Bool)

(declare-fun e!130229 () Bool)

(assert (=> d!65131 e!130229))

(declare-fun res!157041 () Bool)

(assert (=> d!65131 (=> (not res!157041) (not e!130229))))

(declare-fun lt!292985 () (_ BitVec 64))

(declare-fun lt!292988 () (_ BitVec 64))

(declare-fun lt!292986 () (_ BitVec 64))

(assert (=> d!65131 (= res!157041 (= lt!292988 (bvsub lt!292985 lt!292986)))))

(assert (=> d!65131 (or (= (bvand lt!292985 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!292986 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!292985 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!292985 lt!292986) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65131 (= lt!292986 (remainingBits!0 ((_ sign_extend 32) (size!4344 (buf!4815 (_1!8772 lt!291875)))) ((_ sign_extend 32) (currentByte!9081 (_1!8772 lt!291875))) ((_ sign_extend 32) (currentBit!9076 (_1!8772 lt!291875)))))))

(declare-fun lt!292989 () (_ BitVec 64))

(declare-fun lt!292990 () (_ BitVec 64))

(assert (=> d!65131 (= lt!292985 (bvmul lt!292989 lt!292990))))

(assert (=> d!65131 (or (= lt!292989 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!292990 (bvsdiv (bvmul lt!292989 lt!292990) lt!292989)))))

(assert (=> d!65131 (= lt!292990 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65131 (= lt!292989 ((_ sign_extend 32) (size!4344 (buf!4815 (_1!8772 lt!291875)))))))

(assert (=> d!65131 (= lt!292988 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9081 (_1!8772 lt!291875))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9076 (_1!8772 lt!291875)))))))

(assert (=> d!65131 (invariant!0 (currentBit!9076 (_1!8772 lt!291875)) (currentByte!9081 (_1!8772 lt!291875)) (size!4344 (buf!4815 (_1!8772 lt!291875))))))

(assert (=> d!65131 (= (bitIndex!0 (size!4344 (buf!4815 (_1!8772 lt!291875))) (currentByte!9081 (_1!8772 lt!291875)) (currentBit!9076 (_1!8772 lt!291875))) lt!292988)))

(declare-fun b!188512 () Bool)

(declare-fun res!157040 () Bool)

(assert (=> b!188512 (=> (not res!157040) (not e!130229))))

(assert (=> b!188512 (= res!157040 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!292988))))

(declare-fun b!188513 () Bool)

(declare-fun lt!292987 () (_ BitVec 64))

(assert (=> b!188513 (= e!130229 (bvsle lt!292988 (bvmul lt!292987 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!188513 (or (= lt!292987 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!292987 #b0000000000000000000000000000000000000000000000000000000000001000) lt!292987)))))

(assert (=> b!188513 (= lt!292987 ((_ sign_extend 32) (size!4344 (buf!4815 (_1!8772 lt!291875)))))))

(assert (= (and d!65131 res!157041) b!188512))

(assert (= (and b!188512 res!157040) b!188513))

(declare-fun m!293401 () Bool)

(assert (=> d!65131 m!293401))

(declare-fun m!293403 () Bool)

(assert (=> d!65131 m!293403))

(assert (=> b!188129 d!65131))

(declare-fun d!65133 () Bool)

(assert (=> d!65133 (= (invariant!0 (currentBit!9076 (_2!8770 lt!291865)) (currentByte!9081 (_2!8770 lt!291865)) (size!4344 (buf!4815 (_2!8770 lt!291865)))) (and (bvsge (currentBit!9076 (_2!8770 lt!291865)) #b00000000000000000000000000000000) (bvslt (currentBit!9076 (_2!8770 lt!291865)) #b00000000000000000000000000001000) (bvsge (currentByte!9081 (_2!8770 lt!291865)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9081 (_2!8770 lt!291865)) (size!4344 (buf!4815 (_2!8770 lt!291865)))) (and (= (currentBit!9076 (_2!8770 lt!291865)) #b00000000000000000000000000000000) (= (currentByte!9081 (_2!8770 lt!291865)) (size!4344 (buf!4815 (_2!8770 lt!291865))))))))))

(assert (=> b!188131 d!65133))

(declare-fun d!65135 () Bool)

(assert (=> d!65135 (= (array_inv!4085 (buf!4815 thiss!1204)) (bvsge (size!4344 (buf!4815 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!188130 d!65135))

(push 1)

