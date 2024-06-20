; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21238 () Bool)

(assert start!21238)

(declare-fun b!107020 () Bool)

(declare-fun e!70065 () Bool)

(declare-fun e!70055 () Bool)

(assert (=> b!107020 (= e!70065 e!70055)))

(declare-fun res!88179 () Bool)

(assert (=> b!107020 (=> (not res!88179) (not e!70055))))

(declare-datatypes ((array!4916 0))(
  ( (array!4917 (arr!2832 (Array (_ BitVec 32) (_ BitVec 8))) (size!2239 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3952 0))(
  ( (BitStream!3953 (buf!2621 array!4916) (currentByte!5139 (_ BitVec 32)) (currentBit!5134 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8812 0))(
  ( (tuple2!8813 (_1!4663 BitStream!3952) (_2!4663 Bool)) )
))
(declare-fun lt!159639 () tuple2!8812)

(declare-datatypes ((Unit!6556 0))(
  ( (Unit!6557) )
))
(declare-datatypes ((tuple2!8814 0))(
  ( (tuple2!8815 (_1!4664 Unit!6556) (_2!4664 BitStream!3952)) )
))
(declare-fun lt!159631 () tuple2!8814)

(declare-fun lt!159624 () Bool)

(assert (=> b!107020 (= res!88179 (and (= (_2!4663 lt!159639) lt!159624) (= (_1!4663 lt!159639) (_2!4664 lt!159631))))))

(declare-fun thiss!1305 () BitStream!3952)

(declare-fun readBitPure!0 (BitStream!3952) tuple2!8812)

(declare-fun readerFrom!0 (BitStream!3952 (_ BitVec 32) (_ BitVec 32)) BitStream!3952)

(assert (=> b!107020 (= lt!159639 (readBitPure!0 (readerFrom!0 (_2!4664 lt!159631) (currentBit!5134 thiss!1305) (currentByte!5139 thiss!1305))))))

(declare-fun b!107021 () Bool)

(declare-fun e!70064 () Bool)

(declare-fun lt!159618 () tuple2!8814)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!107021 (= e!70064 (invariant!0 (currentBit!5134 thiss!1305) (currentByte!5139 thiss!1305) (size!2239 (buf!2621 (_2!4664 lt!159618)))))))

(declare-fun b!107022 () Bool)

(declare-fun e!70063 () Bool)

(declare-fun e!70060 () Bool)

(assert (=> b!107022 (= e!70063 (not e!70060))))

(declare-fun res!88183 () Bool)

(assert (=> b!107022 (=> res!88183 e!70060)))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-datatypes ((tuple2!8816 0))(
  ( (tuple2!8817 (_1!4665 BitStream!3952) (_2!4665 BitStream!3952)) )
))
(declare-fun lt!159641 () tuple2!8816)

(declare-fun lt!159634 () (_ BitVec 64))

(declare-datatypes ((tuple2!8818 0))(
  ( (tuple2!8819 (_1!4666 BitStream!3952) (_2!4666 (_ BitVec 64))) )
))
(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3952 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8818)

(assert (=> b!107022 (= res!88183 (not (= (_1!4666 (readNLeastSignificantBitsLoopPure!0 (_1!4665 lt!159641) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!159634)) (_2!4665 lt!159641))))))

(declare-fun lt!159640 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!107022 (validate_offset_bits!1 ((_ sign_extend 32) (size!2239 (buf!2621 (_2!4664 lt!159618)))) ((_ sign_extend 32) (currentByte!5139 (_2!4664 lt!159631))) ((_ sign_extend 32) (currentBit!5134 (_2!4664 lt!159631))) lt!159640)))

(declare-fun lt!159638 () Unit!6556)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3952 array!4916 (_ BitVec 64)) Unit!6556)

(assert (=> b!107022 (= lt!159638 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4664 lt!159631) (buf!2621 (_2!4664 lt!159618)) lt!159640))))

(assert (=> b!107022 (= lt!159640 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!159623 () tuple2!8812)

(declare-fun lt!159629 () (_ BitVec 64))

(declare-fun lt!159642 () (_ BitVec 64))

(assert (=> b!107022 (= lt!159634 (bvor lt!159629 (ite (_2!4663 lt!159623) lt!159642 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!159626 () tuple2!8816)

(declare-fun lt!159617 () tuple2!8818)

(assert (=> b!107022 (= lt!159617 (readNLeastSignificantBitsLoopPure!0 (_1!4665 lt!159626) nBits!396 i!615 lt!159629))))

(declare-fun lt!159625 () (_ BitVec 64))

(assert (=> b!107022 (validate_offset_bits!1 ((_ sign_extend 32) (size!2239 (buf!2621 (_2!4664 lt!159618)))) ((_ sign_extend 32) (currentByte!5139 thiss!1305)) ((_ sign_extend 32) (currentBit!5134 thiss!1305)) lt!159625)))

(declare-fun lt!159636 () Unit!6556)

(assert (=> b!107022 (= lt!159636 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2621 (_2!4664 lt!159618)) lt!159625))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!107022 (= lt!159629 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!107022 (= (_2!4663 lt!159623) lt!159624)))

(assert (=> b!107022 (= lt!159623 (readBitPure!0 (_1!4665 lt!159626)))))

(declare-fun reader!0 (BitStream!3952 BitStream!3952) tuple2!8816)

(assert (=> b!107022 (= lt!159641 (reader!0 (_2!4664 lt!159631) (_2!4664 lt!159618)))))

(assert (=> b!107022 (= lt!159626 (reader!0 thiss!1305 (_2!4664 lt!159618)))))

(declare-fun e!70057 () Bool)

(assert (=> b!107022 e!70057))

(declare-fun res!88173 () Bool)

(assert (=> b!107022 (=> (not res!88173) (not e!70057))))

(declare-fun lt!159622 () tuple2!8812)

(declare-fun lt!159637 () tuple2!8812)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!107022 (= res!88173 (= (bitIndex!0 (size!2239 (buf!2621 (_1!4663 lt!159622))) (currentByte!5139 (_1!4663 lt!159622)) (currentBit!5134 (_1!4663 lt!159622))) (bitIndex!0 (size!2239 (buf!2621 (_1!4663 lt!159637))) (currentByte!5139 (_1!4663 lt!159637)) (currentBit!5134 (_1!4663 lt!159637)))))))

(declare-fun lt!159630 () Unit!6556)

(declare-fun lt!159621 () BitStream!3952)

(declare-fun readBitPrefixLemma!0 (BitStream!3952 BitStream!3952) Unit!6556)

(assert (=> b!107022 (= lt!159630 (readBitPrefixLemma!0 lt!159621 (_2!4664 lt!159618)))))

(assert (=> b!107022 (= lt!159637 (readBitPure!0 (BitStream!3953 (buf!2621 (_2!4664 lt!159618)) (currentByte!5139 thiss!1305) (currentBit!5134 thiss!1305))))))

(assert (=> b!107022 (= lt!159622 (readBitPure!0 lt!159621))))

(assert (=> b!107022 (= lt!159621 (BitStream!3953 (buf!2621 (_2!4664 lt!159631)) (currentByte!5139 thiss!1305) (currentBit!5134 thiss!1305)))))

(assert (=> b!107022 e!70064))

(declare-fun res!88180 () Bool)

(assert (=> b!107022 (=> (not res!88180) (not e!70064))))

(declare-fun isPrefixOf!0 (BitStream!3952 BitStream!3952) Bool)

(assert (=> b!107022 (= res!88180 (isPrefixOf!0 thiss!1305 (_2!4664 lt!159618)))))

(declare-fun lt!159633 () Unit!6556)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3952 BitStream!3952 BitStream!3952) Unit!6556)

(assert (=> b!107022 (= lt!159633 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4664 lt!159631) (_2!4664 lt!159618)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3952 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8814)

(assert (=> b!107022 (= lt!159618 (appendNLeastSignificantBitsLoop!0 (_2!4664 lt!159631) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!70061 () Bool)

(assert (=> b!107022 e!70061))

(declare-fun res!88184 () Bool)

(assert (=> b!107022 (=> (not res!88184) (not e!70061))))

(assert (=> b!107022 (= res!88184 (= (size!2239 (buf!2621 thiss!1305)) (size!2239 (buf!2621 (_2!4664 lt!159631)))))))

(declare-fun appendBit!0 (BitStream!3952 Bool) tuple2!8814)

(assert (=> b!107022 (= lt!159631 (appendBit!0 thiss!1305 lt!159624))))

(assert (=> b!107022 (= lt!159624 (not (= (bvand v!199 lt!159642) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107022 (= lt!159642 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!107023 () Bool)

(declare-fun res!88181 () Bool)

(assert (=> b!107023 (=> (not res!88181) (not e!70063))))

(assert (=> b!107023 (= res!88181 (bvslt i!615 nBits!396))))

(declare-fun b!107025 () Bool)

(assert (=> b!107025 (= e!70060 (invariant!0 (currentBit!5134 (_2!4664 lt!159631)) (currentByte!5139 (_2!4664 lt!159631)) (size!2239 (buf!2621 (_2!4664 lt!159631)))))))

(declare-fun e!70058 () Bool)

(assert (=> b!107025 e!70058))

(declare-fun res!88182 () Bool)

(assert (=> b!107025 (=> (not res!88182) (not e!70058))))

(declare-fun lt!159627 () (_ BitVec 64))

(declare-fun lt!159619 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!3952 (_ BitVec 64)) BitStream!3952)

(assert (=> b!107025 (= res!88182 (= (_1!4665 lt!159626) (withMovedBitIndex!0 (_2!4665 lt!159626) (bvsub lt!159619 lt!159627))))))

(assert (=> b!107025 (= lt!159627 (bitIndex!0 (size!2239 (buf!2621 (_2!4664 lt!159618))) (currentByte!5139 (_2!4664 lt!159618)) (currentBit!5134 (_2!4664 lt!159618))))))

(assert (=> b!107025 (= lt!159619 (bitIndex!0 (size!2239 (buf!2621 thiss!1305)) (currentByte!5139 thiss!1305) (currentBit!5134 thiss!1305)))))

(declare-fun lt!159632 () tuple2!8818)

(assert (=> b!107025 (and (= (_2!4666 lt!159617) (_2!4666 lt!159632)) (= (_1!4666 lt!159617) (_1!4666 lt!159632)))))

(declare-fun lt!159628 () Unit!6556)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3952 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6556)

(assert (=> b!107025 (= lt!159628 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4665 lt!159626) nBits!396 i!615 lt!159629))))

(assert (=> b!107025 (= lt!159632 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4665 lt!159626) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!159634))))

(declare-fun b!107026 () Bool)

(declare-fun lt!159635 () (_ BitVec 64))

(assert (=> b!107026 (= e!70055 (= (bitIndex!0 (size!2239 (buf!2621 (_1!4663 lt!159639))) (currentByte!5139 (_1!4663 lt!159639)) (currentBit!5134 (_1!4663 lt!159639))) lt!159635))))

(declare-fun b!107027 () Bool)

(declare-fun res!88178 () Bool)

(assert (=> b!107027 (=> (not res!88178) (not e!70064))))

(assert (=> b!107027 (= res!88178 (invariant!0 (currentBit!5134 thiss!1305) (currentByte!5139 thiss!1305) (size!2239 (buf!2621 (_2!4664 lt!159631)))))))

(declare-fun b!107028 () Bool)

(declare-fun res!88185 () Bool)

(assert (=> b!107028 (=> (not res!88185) (not e!70063))))

(assert (=> b!107028 (= res!88185 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!107029 () Bool)

(declare-fun e!70059 () Bool)

(declare-fun array_inv!2041 (array!4916) Bool)

(assert (=> b!107029 (= e!70059 (array_inv!2041 (buf!2621 thiss!1305)))))

(declare-fun b!107024 () Bool)

(assert (=> b!107024 (= e!70058 (= (_1!4665 lt!159641) (withMovedBitIndex!0 (_2!4665 lt!159641) (bvsub (bitIndex!0 (size!2239 (buf!2621 (_2!4664 lt!159631))) (currentByte!5139 (_2!4664 lt!159631)) (currentBit!5134 (_2!4664 lt!159631))) lt!159627))))))

(declare-fun res!88174 () Bool)

(declare-fun e!70062 () Bool)

(assert (=> start!21238 (=> (not res!88174) (not e!70062))))

(assert (=> start!21238 (= res!88174 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21238 e!70062))

(assert (=> start!21238 true))

(declare-fun inv!12 (BitStream!3952) Bool)

(assert (=> start!21238 (and (inv!12 thiss!1305) e!70059)))

(declare-fun b!107030 () Bool)

(declare-fun res!88177 () Bool)

(assert (=> b!107030 (=> (not res!88177) (not e!70065))))

(assert (=> b!107030 (= res!88177 (isPrefixOf!0 thiss!1305 (_2!4664 lt!159631)))))

(declare-fun b!107031 () Bool)

(assert (=> b!107031 (= e!70062 e!70063)))

(declare-fun res!88176 () Bool)

(assert (=> b!107031 (=> (not res!88176) (not e!70063))))

(assert (=> b!107031 (= res!88176 (validate_offset_bits!1 ((_ sign_extend 32) (size!2239 (buf!2621 thiss!1305))) ((_ sign_extend 32) (currentByte!5139 thiss!1305)) ((_ sign_extend 32) (currentBit!5134 thiss!1305)) lt!159625))))

(assert (=> b!107031 (= lt!159625 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!107032 () Bool)

(assert (=> b!107032 (= e!70057 (= (_2!4663 lt!159622) (_2!4663 lt!159637)))))

(declare-fun b!107033 () Bool)

(assert (=> b!107033 (= e!70061 e!70065)))

(declare-fun res!88175 () Bool)

(assert (=> b!107033 (=> (not res!88175) (not e!70065))))

(declare-fun lt!159620 () (_ BitVec 64))

(assert (=> b!107033 (= res!88175 (= lt!159635 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!159620)))))

(assert (=> b!107033 (= lt!159635 (bitIndex!0 (size!2239 (buf!2621 (_2!4664 lt!159631))) (currentByte!5139 (_2!4664 lt!159631)) (currentBit!5134 (_2!4664 lt!159631))))))

(assert (=> b!107033 (= lt!159620 (bitIndex!0 (size!2239 (buf!2621 thiss!1305)) (currentByte!5139 thiss!1305) (currentBit!5134 thiss!1305)))))

(assert (= (and start!21238 res!88174) b!107031))

(assert (= (and b!107031 res!88176) b!107028))

(assert (= (and b!107028 res!88185) b!107023))

(assert (= (and b!107023 res!88181) b!107022))

(assert (= (and b!107022 res!88184) b!107033))

(assert (= (and b!107033 res!88175) b!107030))

(assert (= (and b!107030 res!88177) b!107020))

(assert (= (and b!107020 res!88179) b!107026))

(assert (= (and b!107022 res!88180) b!107027))

(assert (= (and b!107027 res!88178) b!107021))

(assert (= (and b!107022 res!88173) b!107032))

(assert (= (and b!107022 (not res!88183)) b!107025))

(assert (= (and b!107025 res!88182) b!107024))

(assert (= start!21238 b!107029))

(declare-fun m!157899 () Bool)

(assert (=> b!107031 m!157899))

(declare-fun m!157901 () Bool)

(assert (=> b!107029 m!157901))

(declare-fun m!157903 () Bool)

(assert (=> b!107026 m!157903))

(declare-fun m!157905 () Bool)

(assert (=> b!107024 m!157905))

(declare-fun m!157907 () Bool)

(assert (=> b!107024 m!157907))

(assert (=> b!107033 m!157905))

(declare-fun m!157909 () Bool)

(assert (=> b!107033 m!157909))

(assert (=> b!107025 m!157909))

(declare-fun m!157911 () Bool)

(assert (=> b!107025 m!157911))

(declare-fun m!157913 () Bool)

(assert (=> b!107025 m!157913))

(declare-fun m!157915 () Bool)

(assert (=> b!107025 m!157915))

(declare-fun m!157917 () Bool)

(assert (=> b!107025 m!157917))

(declare-fun m!157919 () Bool)

(assert (=> b!107025 m!157919))

(assert (=> b!107025 m!157913))

(declare-fun m!157921 () Bool)

(assert (=> b!107025 m!157921))

(declare-fun m!157923 () Bool)

(assert (=> b!107030 m!157923))

(declare-fun m!157925 () Bool)

(assert (=> start!21238 m!157925))

(declare-fun m!157927 () Bool)

(assert (=> b!107028 m!157927))

(declare-fun m!157929 () Bool)

(assert (=> b!107020 m!157929))

(assert (=> b!107020 m!157929))

(declare-fun m!157931 () Bool)

(assert (=> b!107020 m!157931))

(declare-fun m!157933 () Bool)

(assert (=> b!107022 m!157933))

(declare-fun m!157935 () Bool)

(assert (=> b!107022 m!157935))

(declare-fun m!157937 () Bool)

(assert (=> b!107022 m!157937))

(declare-fun m!157939 () Bool)

(assert (=> b!107022 m!157939))

(declare-fun m!157941 () Bool)

(assert (=> b!107022 m!157941))

(declare-fun m!157943 () Bool)

(assert (=> b!107022 m!157943))

(declare-fun m!157945 () Bool)

(assert (=> b!107022 m!157945))

(declare-fun m!157947 () Bool)

(assert (=> b!107022 m!157947))

(declare-fun m!157949 () Bool)

(assert (=> b!107022 m!157949))

(declare-fun m!157951 () Bool)

(assert (=> b!107022 m!157951))

(declare-fun m!157953 () Bool)

(assert (=> b!107022 m!157953))

(declare-fun m!157955 () Bool)

(assert (=> b!107022 m!157955))

(declare-fun m!157957 () Bool)

(assert (=> b!107022 m!157957))

(declare-fun m!157959 () Bool)

(assert (=> b!107022 m!157959))

(declare-fun m!157961 () Bool)

(assert (=> b!107022 m!157961))

(declare-fun m!157963 () Bool)

(assert (=> b!107022 m!157963))

(declare-fun m!157965 () Bool)

(assert (=> b!107022 m!157965))

(declare-fun m!157967 () Bool)

(assert (=> b!107022 m!157967))

(declare-fun m!157969 () Bool)

(assert (=> b!107022 m!157969))

(declare-fun m!157971 () Bool)

(assert (=> b!107021 m!157971))

(declare-fun m!157973 () Bool)

(assert (=> b!107027 m!157973))

(push 1)

(assert (not b!107024))

(assert (not b!107020))

(assert (not b!107025))

(assert (not start!21238))

(assert (not b!107031))

(assert (not b!107027))

(assert (not b!107033))

(assert (not b!107030))

(assert (not b!107021))

(assert (not b!107026))

(assert (not b!107029))

(assert (not b!107022))

(assert (not b!107028))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!33748 () Bool)

(declare-fun e!70137 () Bool)

(assert (=> d!33748 e!70137))

(declare-fun res!88270 () Bool)

(assert (=> d!33748 (=> (not res!88270) (not e!70137))))

(declare-fun lt!159806 () BitStream!3952)

(declare-fun lt!159807 () (_ BitVec 64))

(assert (=> d!33748 (= res!88270 (= (bvadd lt!159807 (bvsub lt!159619 lt!159627)) (bitIndex!0 (size!2239 (buf!2621 lt!159806)) (currentByte!5139 lt!159806) (currentBit!5134 lt!159806))))))

(assert (=> d!33748 (or (not (= (bvand lt!159807 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!159619 lt!159627) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!159807 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!159807 (bvsub lt!159619 lt!159627)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33748 (= lt!159807 (bitIndex!0 (size!2239 (buf!2621 (_2!4665 lt!159626))) (currentByte!5139 (_2!4665 lt!159626)) (currentBit!5134 (_2!4665 lt!159626))))))

(declare-fun moveBitIndex!0 (BitStream!3952 (_ BitVec 64)) tuple2!8814)

(assert (=> d!33748 (= lt!159806 (_2!4664 (moveBitIndex!0 (_2!4665 lt!159626) (bvsub lt!159619 lt!159627))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!3952 (_ BitVec 64)) Bool)

(assert (=> d!33748 (moveBitIndexPrecond!0 (_2!4665 lt!159626) (bvsub lt!159619 lt!159627))))

(assert (=> d!33748 (= (withMovedBitIndex!0 (_2!4665 lt!159626) (bvsub lt!159619 lt!159627)) lt!159806)))

(declare-fun b!107123 () Bool)

(assert (=> b!107123 (= e!70137 (= (size!2239 (buf!2621 (_2!4665 lt!159626))) (size!2239 (buf!2621 lt!159806))))))

(assert (= (and d!33748 res!88270) b!107123))

(declare-fun m!158129 () Bool)

(assert (=> d!33748 m!158129))

(declare-fun m!158131 () Bool)

(assert (=> d!33748 m!158131))

(declare-fun m!158133 () Bool)

(assert (=> d!33748 m!158133))

(declare-fun m!158135 () Bool)

(assert (=> d!33748 m!158135))

(assert (=> b!107025 d!33748))

(declare-fun d!33750 () Bool)

(declare-fun e!70138 () Bool)

(assert (=> d!33750 e!70138))

(declare-fun res!88271 () Bool)

(assert (=> d!33750 (=> (not res!88271) (not e!70138))))

(declare-fun lt!159809 () (_ BitVec 64))

(declare-fun lt!159808 () BitStream!3952)

(assert (=> d!33750 (= res!88271 (= (bvadd lt!159809 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2239 (buf!2621 lt!159808)) (currentByte!5139 lt!159808) (currentBit!5134 lt!159808))))))

(assert (=> d!33750 (or (not (= (bvand lt!159809 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!159809 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!159809 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33750 (= lt!159809 (bitIndex!0 (size!2239 (buf!2621 (_1!4665 lt!159626))) (currentByte!5139 (_1!4665 lt!159626)) (currentBit!5134 (_1!4665 lt!159626))))))

(assert (=> d!33750 (= lt!159808 (_2!4664 (moveBitIndex!0 (_1!4665 lt!159626) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!33750 (moveBitIndexPrecond!0 (_1!4665 lt!159626) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!33750 (= (withMovedBitIndex!0 (_1!4665 lt!159626) #b0000000000000000000000000000000000000000000000000000000000000001) lt!159808)))

(declare-fun b!107124 () Bool)

(assert (=> b!107124 (= e!70138 (= (size!2239 (buf!2621 (_1!4665 lt!159626))) (size!2239 (buf!2621 lt!159808))))))

(assert (= (and d!33750 res!88271) b!107124))

(declare-fun m!158137 () Bool)

(assert (=> d!33750 m!158137))

(declare-fun m!158139 () Bool)

(assert (=> d!33750 m!158139))

(declare-fun m!158141 () Bool)

(assert (=> d!33750 m!158141))

(declare-fun m!158143 () Bool)

(assert (=> d!33750 m!158143))

(assert (=> b!107025 d!33750))

(declare-fun d!33752 () Bool)

(assert (=> d!33752 (= (invariant!0 (currentBit!5134 (_2!4664 lt!159631)) (currentByte!5139 (_2!4664 lt!159631)) (size!2239 (buf!2621 (_2!4664 lt!159631)))) (and (bvsge (currentBit!5134 (_2!4664 lt!159631)) #b00000000000000000000000000000000) (bvslt (currentBit!5134 (_2!4664 lt!159631)) #b00000000000000000000000000001000) (bvsge (currentByte!5139 (_2!4664 lt!159631)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5139 (_2!4664 lt!159631)) (size!2239 (buf!2621 (_2!4664 lt!159631)))) (and (= (currentBit!5134 (_2!4664 lt!159631)) #b00000000000000000000000000000000) (= (currentByte!5139 (_2!4664 lt!159631)) (size!2239 (buf!2621 (_2!4664 lt!159631))))))))))

(assert (=> b!107025 d!33752))

(declare-fun d!33754 () Bool)

(declare-fun lt!159855 () tuple2!8818)

(declare-fun lt!159857 () tuple2!8818)

(assert (=> d!33754 (and (= (_2!4666 lt!159855) (_2!4666 lt!159857)) (= (_1!4666 lt!159855) (_1!4666 lt!159857)))))

(declare-fun lt!159852 () (_ BitVec 64))

(declare-fun lt!159854 () Unit!6556)

(declare-fun lt!159856 () BitStream!3952)

(declare-fun lt!159853 () Bool)

(declare-fun choose!45 (BitStream!3952 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!8818 tuple2!8818 BitStream!3952 (_ BitVec 64) Bool BitStream!3952 (_ BitVec 64) tuple2!8818 tuple2!8818 BitStream!3952 (_ BitVec 64)) Unit!6556)

(assert (=> d!33754 (= lt!159854 (choose!45 (_1!4665 lt!159626) nBits!396 i!615 lt!159629 lt!159855 (tuple2!8819 (_1!4666 lt!159855) (_2!4666 lt!159855)) (_1!4666 lt!159855) (_2!4666 lt!159855) lt!159853 lt!159856 lt!159852 lt!159857 (tuple2!8819 (_1!4666 lt!159857) (_2!4666 lt!159857)) (_1!4666 lt!159857) (_2!4666 lt!159857)))))

(assert (=> d!33754 (= lt!159857 (readNLeastSignificantBitsLoopPure!0 lt!159856 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!159852))))

(assert (=> d!33754 (= lt!159852 (bvor lt!159629 (ite lt!159853 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33754 (= lt!159856 (withMovedBitIndex!0 (_1!4665 lt!159626) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!33754 (= lt!159853 (_2!4663 (readBitPure!0 (_1!4665 lt!159626))))))

(assert (=> d!33754 (= lt!159855 (readNLeastSignificantBitsLoopPure!0 (_1!4665 lt!159626) nBits!396 i!615 lt!159629))))

(assert (=> d!33754 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4665 lt!159626) nBits!396 i!615 lt!159629) lt!159854)))

(declare-fun bs!8241 () Bool)

(assert (= bs!8241 d!33754))

(declare-fun m!158155 () Bool)

(assert (=> bs!8241 m!158155))

(assert (=> bs!8241 m!157913))

(declare-fun m!158157 () Bool)

(assert (=> bs!8241 m!158157))

(assert (=> bs!8241 m!157969))

(assert (=> bs!8241 m!157963))

(assert (=> b!107025 d!33754))

(declare-fun d!33766 () Bool)

(declare-fun e!70146 () Bool)

(assert (=> d!33766 e!70146))

(declare-fun res!88286 () Bool)

(assert (=> d!33766 (=> (not res!88286) (not e!70146))))

(declare-fun lt!159874 () (_ BitVec 64))

(declare-fun lt!159872 () (_ BitVec 64))

(declare-fun lt!159873 () (_ BitVec 64))

(assert (=> d!33766 (= res!88286 (= lt!159874 (bvsub lt!159872 lt!159873)))))

(assert (=> d!33766 (or (= (bvand lt!159872 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!159873 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!159872 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!159872 lt!159873) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!33766 (= lt!159873 (remainingBits!0 ((_ sign_extend 32) (size!2239 (buf!2621 (_2!4664 lt!159618)))) ((_ sign_extend 32) (currentByte!5139 (_2!4664 lt!159618))) ((_ sign_extend 32) (currentBit!5134 (_2!4664 lt!159618)))))))

(declare-fun lt!159870 () (_ BitVec 64))

(declare-fun lt!159875 () (_ BitVec 64))

(assert (=> d!33766 (= lt!159872 (bvmul lt!159870 lt!159875))))

(assert (=> d!33766 (or (= lt!159870 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!159875 (bvsdiv (bvmul lt!159870 lt!159875) lt!159870)))))

(assert (=> d!33766 (= lt!159875 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33766 (= lt!159870 ((_ sign_extend 32) (size!2239 (buf!2621 (_2!4664 lt!159618)))))))

(assert (=> d!33766 (= lt!159874 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5139 (_2!4664 lt!159618))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5134 (_2!4664 lt!159618)))))))

(assert (=> d!33766 (invariant!0 (currentBit!5134 (_2!4664 lt!159618)) (currentByte!5139 (_2!4664 lt!159618)) (size!2239 (buf!2621 (_2!4664 lt!159618))))))

(assert (=> d!33766 (= (bitIndex!0 (size!2239 (buf!2621 (_2!4664 lt!159618))) (currentByte!5139 (_2!4664 lt!159618)) (currentBit!5134 (_2!4664 lt!159618))) lt!159874)))

(declare-fun b!107139 () Bool)

(declare-fun res!88287 () Bool)

(assert (=> b!107139 (=> (not res!88287) (not e!70146))))

(assert (=> b!107139 (= res!88287 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!159874))))

(declare-fun b!107140 () Bool)

(declare-fun lt!159871 () (_ BitVec 64))

(assert (=> b!107140 (= e!70146 (bvsle lt!159874 (bvmul lt!159871 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!107140 (or (= lt!159871 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!159871 #b0000000000000000000000000000000000000000000000000000000000001000) lt!159871)))))

(assert (=> b!107140 (= lt!159871 ((_ sign_extend 32) (size!2239 (buf!2621 (_2!4664 lt!159618)))))))

(assert (= (and d!33766 res!88286) b!107139))

(assert (= (and b!107139 res!88287) b!107140))

(declare-fun m!158159 () Bool)

(assert (=> d!33766 m!158159))

(declare-fun m!158161 () Bool)

(assert (=> d!33766 m!158161))

(assert (=> b!107025 d!33766))

(declare-fun d!33768 () Bool)

(declare-fun e!70147 () Bool)

(assert (=> d!33768 e!70147))

(declare-fun res!88288 () Bool)

(assert (=> d!33768 (=> (not res!88288) (not e!70147))))

(declare-fun lt!159878 () (_ BitVec 64))

(declare-fun lt!159880 () (_ BitVec 64))

(declare-fun lt!159879 () (_ BitVec 64))

(assert (=> d!33768 (= res!88288 (= lt!159880 (bvsub lt!159878 lt!159879)))))

(assert (=> d!33768 (or (= (bvand lt!159878 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!159879 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!159878 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!159878 lt!159879) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33768 (= lt!159879 (remainingBits!0 ((_ sign_extend 32) (size!2239 (buf!2621 thiss!1305))) ((_ sign_extend 32) (currentByte!5139 thiss!1305)) ((_ sign_extend 32) (currentBit!5134 thiss!1305))))))

(declare-fun lt!159876 () (_ BitVec 64))

(declare-fun lt!159881 () (_ BitVec 64))

(assert (=> d!33768 (= lt!159878 (bvmul lt!159876 lt!159881))))

(assert (=> d!33768 (or (= lt!159876 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!159881 (bvsdiv (bvmul lt!159876 lt!159881) lt!159876)))))

(assert (=> d!33768 (= lt!159881 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33768 (= lt!159876 ((_ sign_extend 32) (size!2239 (buf!2621 thiss!1305))))))

(assert (=> d!33768 (= lt!159880 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5139 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5134 thiss!1305))))))

(assert (=> d!33768 (invariant!0 (currentBit!5134 thiss!1305) (currentByte!5139 thiss!1305) (size!2239 (buf!2621 thiss!1305)))))

(assert (=> d!33768 (= (bitIndex!0 (size!2239 (buf!2621 thiss!1305)) (currentByte!5139 thiss!1305) (currentBit!5134 thiss!1305)) lt!159880)))

(declare-fun b!107141 () Bool)

(declare-fun res!88289 () Bool)

(assert (=> b!107141 (=> (not res!88289) (not e!70147))))

(assert (=> b!107141 (= res!88289 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!159880))))

(declare-fun b!107142 () Bool)

(declare-fun lt!159877 () (_ BitVec 64))

(assert (=> b!107142 (= e!70147 (bvsle lt!159880 (bvmul lt!159877 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!107142 (or (= lt!159877 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!159877 #b0000000000000000000000000000000000000000000000000000000000001000) lt!159877)))))

(assert (=> b!107142 (= lt!159877 ((_ sign_extend 32) (size!2239 (buf!2621 thiss!1305))))))

(assert (= (and d!33768 res!88288) b!107141))

(assert (= (and b!107141 res!88289) b!107142))

(declare-fun m!158163 () Bool)

(assert (=> d!33768 m!158163))

(declare-fun m!158165 () Bool)

(assert (=> d!33768 m!158165))

(assert (=> b!107025 d!33768))

(declare-fun d!33770 () Bool)

(declare-datatypes ((tuple2!8840 0))(
  ( (tuple2!8841 (_1!4677 (_ BitVec 64)) (_2!4677 BitStream!3952)) )
))
(declare-fun lt!159884 () tuple2!8840)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!3952 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8840)

(assert (=> d!33770 (= lt!159884 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!4665 lt!159626) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!159634))))

(assert (=> d!33770 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4665 lt!159626) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!159634) (tuple2!8819 (_2!4677 lt!159884) (_1!4677 lt!159884)))))

(declare-fun bs!8242 () Bool)

(assert (= bs!8242 d!33770))

(assert (=> bs!8242 m!157913))

(declare-fun m!158167 () Bool)

(assert (=> bs!8242 m!158167))

(assert (=> b!107025 d!33770))

(declare-fun d!33772 () Bool)

(declare-fun e!70148 () Bool)

(assert (=> d!33772 e!70148))

(declare-fun res!88290 () Bool)

(assert (=> d!33772 (=> (not res!88290) (not e!70148))))

(declare-fun lt!159888 () (_ BitVec 64))

(declare-fun lt!159887 () (_ BitVec 64))

(declare-fun lt!159889 () (_ BitVec 64))

(assert (=> d!33772 (= res!88290 (= lt!159889 (bvsub lt!159887 lt!159888)))))

(assert (=> d!33772 (or (= (bvand lt!159887 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!159888 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!159887 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!159887 lt!159888) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33772 (= lt!159888 (remainingBits!0 ((_ sign_extend 32) (size!2239 (buf!2621 (_1!4663 lt!159639)))) ((_ sign_extend 32) (currentByte!5139 (_1!4663 lt!159639))) ((_ sign_extend 32) (currentBit!5134 (_1!4663 lt!159639)))))))

(declare-fun lt!159885 () (_ BitVec 64))

(declare-fun lt!159890 () (_ BitVec 64))

(assert (=> d!33772 (= lt!159887 (bvmul lt!159885 lt!159890))))

(assert (=> d!33772 (or (= lt!159885 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!159890 (bvsdiv (bvmul lt!159885 lt!159890) lt!159885)))))

(assert (=> d!33772 (= lt!159890 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33772 (= lt!159885 ((_ sign_extend 32) (size!2239 (buf!2621 (_1!4663 lt!159639)))))))

(assert (=> d!33772 (= lt!159889 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5139 (_1!4663 lt!159639))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5134 (_1!4663 lt!159639)))))))

(assert (=> d!33772 (invariant!0 (currentBit!5134 (_1!4663 lt!159639)) (currentByte!5139 (_1!4663 lt!159639)) (size!2239 (buf!2621 (_1!4663 lt!159639))))))

(assert (=> d!33772 (= (bitIndex!0 (size!2239 (buf!2621 (_1!4663 lt!159639))) (currentByte!5139 (_1!4663 lt!159639)) (currentBit!5134 (_1!4663 lt!159639))) lt!159889)))

(declare-fun b!107143 () Bool)

(declare-fun res!88291 () Bool)

(assert (=> b!107143 (=> (not res!88291) (not e!70148))))

(assert (=> b!107143 (= res!88291 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!159889))))

(declare-fun b!107144 () Bool)

(declare-fun lt!159886 () (_ BitVec 64))

(assert (=> b!107144 (= e!70148 (bvsle lt!159889 (bvmul lt!159886 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!107144 (or (= lt!159886 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!159886 #b0000000000000000000000000000000000000000000000000000000000001000) lt!159886)))))

(assert (=> b!107144 (= lt!159886 ((_ sign_extend 32) (size!2239 (buf!2621 (_1!4663 lt!159639)))))))

(assert (= (and d!33772 res!88290) b!107143))

(assert (= (and b!107143 res!88291) b!107144))

(declare-fun m!158169 () Bool)

(assert (=> d!33772 m!158169))

(declare-fun m!158171 () Bool)

(assert (=> d!33772 m!158171))

(assert (=> b!107026 d!33772))

(declare-fun d!33774 () Bool)

(assert (=> d!33774 (= (invariant!0 (currentBit!5134 thiss!1305) (currentByte!5139 thiss!1305) (size!2239 (buf!2621 (_2!4664 lt!159631)))) (and (bvsge (currentBit!5134 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5134 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5139 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5139 thiss!1305) (size!2239 (buf!2621 (_2!4664 lt!159631)))) (and (= (currentBit!5134 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5139 thiss!1305) (size!2239 (buf!2621 (_2!4664 lt!159631))))))))))

(assert (=> b!107027 d!33774))

(declare-fun d!33776 () Bool)

(declare-fun e!70151 () Bool)

(assert (=> d!33776 e!70151))

(declare-fun res!88294 () Bool)

(assert (=> d!33776 (=> (not res!88294) (not e!70151))))

(declare-fun lt!159900 () tuple2!8812)

(declare-fun lt!159899 () tuple2!8812)

(assert (=> d!33776 (= res!88294 (= (bitIndex!0 (size!2239 (buf!2621 (_1!4663 lt!159900))) (currentByte!5139 (_1!4663 lt!159900)) (currentBit!5134 (_1!4663 lt!159900))) (bitIndex!0 (size!2239 (buf!2621 (_1!4663 lt!159899))) (currentByte!5139 (_1!4663 lt!159899)) (currentBit!5134 (_1!4663 lt!159899)))))))

(declare-fun lt!159901 () Unit!6556)

(declare-fun lt!159902 () BitStream!3952)

(declare-fun choose!50 (BitStream!3952 BitStream!3952 BitStream!3952 tuple2!8812 tuple2!8812 BitStream!3952 Bool tuple2!8812 tuple2!8812 BitStream!3952 Bool) Unit!6556)

(assert (=> d!33776 (= lt!159901 (choose!50 lt!159621 (_2!4664 lt!159618) lt!159902 lt!159900 (tuple2!8813 (_1!4663 lt!159900) (_2!4663 lt!159900)) (_1!4663 lt!159900) (_2!4663 lt!159900) lt!159899 (tuple2!8813 (_1!4663 lt!159899) (_2!4663 lt!159899)) (_1!4663 lt!159899) (_2!4663 lt!159899)))))

(assert (=> d!33776 (= lt!159899 (readBitPure!0 lt!159902))))

(assert (=> d!33776 (= lt!159900 (readBitPure!0 lt!159621))))

(assert (=> d!33776 (= lt!159902 (BitStream!3953 (buf!2621 (_2!4664 lt!159618)) (currentByte!5139 lt!159621) (currentBit!5134 lt!159621)))))

(assert (=> d!33776 (invariant!0 (currentBit!5134 lt!159621) (currentByte!5139 lt!159621) (size!2239 (buf!2621 (_2!4664 lt!159618))))))

(assert (=> d!33776 (= (readBitPrefixLemma!0 lt!159621 (_2!4664 lt!159618)) lt!159901)))

(declare-fun b!107147 () Bool)

(assert (=> b!107147 (= e!70151 (= (_2!4663 lt!159900) (_2!4663 lt!159899)))))

(assert (= (and d!33776 res!88294) b!107147))

(declare-fun m!158173 () Bool)

(assert (=> d!33776 m!158173))

(declare-fun m!158175 () Bool)

(assert (=> d!33776 m!158175))

(declare-fun m!158177 () Bool)

(assert (=> d!33776 m!158177))

(assert (=> d!33776 m!157939))

(declare-fun m!158179 () Bool)

(assert (=> d!33776 m!158179))

(declare-fun m!158181 () Bool)

(assert (=> d!33776 m!158181))

(assert (=> b!107022 d!33776))

(declare-fun d!33778 () Bool)

(declare-fun lt!159903 () tuple2!8840)

(assert (=> d!33778 (= lt!159903 (readNLeastSignificantBitsLoop!0 (_1!4665 lt!159626) nBits!396 i!615 lt!159629))))

(assert (=> d!33778 (= (readNLeastSignificantBitsLoopPure!0 (_1!4665 lt!159626) nBits!396 i!615 lt!159629) (tuple2!8819 (_2!4677 lt!159903) (_1!4677 lt!159903)))))

(declare-fun bs!8243 () Bool)

(assert (= bs!8243 d!33778))

(declare-fun m!158183 () Bool)

(assert (=> bs!8243 m!158183))

(assert (=> b!107022 d!33778))

(declare-fun b!107324 () Bool)

(declare-fun e!70248 () Bool)

(declare-fun lt!160426 () (_ BitVec 64))

(assert (=> b!107324 (= e!70248 (validate_offset_bits!1 ((_ sign_extend 32) (size!2239 (buf!2621 (_2!4664 lt!159631)))) ((_ sign_extend 32) (currentByte!5139 (_2!4664 lt!159631))) ((_ sign_extend 32) (currentBit!5134 (_2!4664 lt!159631))) lt!160426))))

(declare-fun b!107325 () Bool)

(declare-fun res!88444 () Bool)

(declare-fun e!70247 () Bool)

(assert (=> b!107325 (=> (not res!88444) (not e!70247))))

(declare-fun lt!160431 () tuple2!8814)

(assert (=> b!107325 (= res!88444 (isPrefixOf!0 (_2!4664 lt!159631) (_2!4664 lt!160431)))))

(declare-fun b!107326 () Bool)

(declare-fun lt!160415 () tuple2!8812)

(declare-fun lt!160439 () tuple2!8814)

(assert (=> b!107326 (= lt!160415 (readBitPure!0 (readerFrom!0 (_2!4664 lt!160439) (currentBit!5134 (_2!4664 lt!159631)) (currentByte!5139 (_2!4664 lt!159631)))))))

(declare-fun lt!160427 () Bool)

(declare-fun res!88441 () Bool)

(assert (=> b!107326 (= res!88441 (and (= (_2!4663 lt!160415) lt!160427) (= (_1!4663 lt!160415) (_2!4664 lt!160439))))))

(declare-fun e!70249 () Bool)

(assert (=> b!107326 (=> (not res!88441) (not e!70249))))

(declare-fun e!70250 () Bool)

(assert (=> b!107326 (= e!70250 e!70249)))

(declare-fun lt!160447 () BitStream!3952)

(declare-fun call!1356 () Bool)

(declare-fun c!6617 () Bool)

(declare-fun bm!1353 () Bool)

(assert (=> bm!1353 (= call!1356 (isPrefixOf!0 (ite c!6617 (_2!4664 lt!159631) lt!160447) (ite c!6617 (_2!4664 lt!160439) lt!160447)))))

(declare-fun b!107327 () Bool)

(declare-fun e!70253 () (_ BitVec 64))

(assert (=> b!107327 (= e!70253 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!107328 () Bool)

(declare-fun res!88443 () Bool)

(assert (=> b!107328 (= res!88443 call!1356)))

(assert (=> b!107328 (=> (not res!88443) (not e!70250))))

(declare-fun b!107329 () Bool)

(declare-fun e!70252 () tuple2!8814)

(declare-fun lt!160434 () tuple2!8814)

(declare-fun Unit!6570 () Unit!6556)

(assert (=> b!107329 (= e!70252 (tuple2!8815 Unit!6570 (_2!4664 lt!160434)))))

(assert (=> b!107329 (= lt!160427 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107329 (= lt!160439 (appendBit!0 (_2!4664 lt!159631) lt!160427))))

(declare-fun res!88442 () Bool)

(assert (=> b!107329 (= res!88442 (= (size!2239 (buf!2621 (_2!4664 lt!159631))) (size!2239 (buf!2621 (_2!4664 lt!160439)))))))

(assert (=> b!107329 (=> (not res!88442) (not e!70250))))

(assert (=> b!107329 e!70250))

(declare-fun lt!160436 () tuple2!8814)

(assert (=> b!107329 (= lt!160436 lt!160439)))

(assert (=> b!107329 (= lt!160434 (appendNLeastSignificantBitsLoop!0 (_2!4664 lt!160436) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!160443 () Unit!6556)

(assert (=> b!107329 (= lt!160443 (lemmaIsPrefixTransitive!0 (_2!4664 lt!159631) (_2!4664 lt!160436) (_2!4664 lt!160434)))))

(assert (=> b!107329 (isPrefixOf!0 (_2!4664 lt!159631) (_2!4664 lt!160434))))

(declare-fun lt!160409 () Unit!6556)

(assert (=> b!107329 (= lt!160409 lt!160443)))

(assert (=> b!107329 (invariant!0 (currentBit!5134 (_2!4664 lt!159631)) (currentByte!5139 (_2!4664 lt!159631)) (size!2239 (buf!2621 (_2!4664 lt!160436))))))

(declare-fun lt!160424 () BitStream!3952)

(assert (=> b!107329 (= lt!160424 (BitStream!3953 (buf!2621 (_2!4664 lt!160436)) (currentByte!5139 (_2!4664 lt!159631)) (currentBit!5134 (_2!4664 lt!159631))))))

(assert (=> b!107329 (invariant!0 (currentBit!5134 lt!160424) (currentByte!5139 lt!160424) (size!2239 (buf!2621 (_2!4664 lt!160434))))))

(declare-fun lt!160450 () BitStream!3952)

(assert (=> b!107329 (= lt!160450 (BitStream!3953 (buf!2621 (_2!4664 lt!160434)) (currentByte!5139 lt!160424) (currentBit!5134 lt!160424)))))

(declare-fun lt!160421 () tuple2!8812)

(assert (=> b!107329 (= lt!160421 (readBitPure!0 lt!160424))))

(declare-fun lt!160420 () tuple2!8812)

(assert (=> b!107329 (= lt!160420 (readBitPure!0 lt!160450))))

(declare-fun lt!160418 () Unit!6556)

(assert (=> b!107329 (= lt!160418 (readBitPrefixLemma!0 lt!160424 (_2!4664 lt!160434)))))

(declare-fun res!88437 () Bool)

(assert (=> b!107329 (= res!88437 (= (bitIndex!0 (size!2239 (buf!2621 (_1!4663 lt!160421))) (currentByte!5139 (_1!4663 lt!160421)) (currentBit!5134 (_1!4663 lt!160421))) (bitIndex!0 (size!2239 (buf!2621 (_1!4663 lt!160420))) (currentByte!5139 (_1!4663 lt!160420)) (currentBit!5134 (_1!4663 lt!160420)))))))

(declare-fun e!70251 () Bool)

(assert (=> b!107329 (=> (not res!88437) (not e!70251))))

(assert (=> b!107329 e!70251))

(declare-fun lt!160452 () Unit!6556)

(assert (=> b!107329 (= lt!160452 lt!160418)))

(declare-fun lt!160441 () tuple2!8816)

(assert (=> b!107329 (= lt!160441 (reader!0 (_2!4664 lt!159631) (_2!4664 lt!160434)))))

(declare-fun lt!160451 () tuple2!8816)

(assert (=> b!107329 (= lt!160451 (reader!0 (_2!4664 lt!160436) (_2!4664 lt!160434)))))

(declare-fun lt!160430 () tuple2!8812)

(assert (=> b!107329 (= lt!160430 (readBitPure!0 (_1!4665 lt!160441)))))

(assert (=> b!107329 (= (_2!4663 lt!160430) lt!160427)))

(declare-fun lt!160448 () Unit!6556)

(declare-fun Unit!6571 () Unit!6556)

(assert (=> b!107329 (= lt!160448 Unit!6571)))

(declare-fun lt!160416 () (_ BitVec 64))

(assert (=> b!107329 (= lt!160416 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!160438 () (_ BitVec 64))

(assert (=> b!107329 (= lt!160438 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!160419 () Unit!6556)

(assert (=> b!107329 (= lt!160419 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4664 lt!159631) (buf!2621 (_2!4664 lt!160434)) lt!160438))))

(assert (=> b!107329 (validate_offset_bits!1 ((_ sign_extend 32) (size!2239 (buf!2621 (_2!4664 lt!160434)))) ((_ sign_extend 32) (currentByte!5139 (_2!4664 lt!159631))) ((_ sign_extend 32) (currentBit!5134 (_2!4664 lt!159631))) lt!160438)))

(declare-fun lt!160417 () Unit!6556)

(assert (=> b!107329 (= lt!160417 lt!160419)))

(declare-fun lt!160442 () tuple2!8818)

(assert (=> b!107329 (= lt!160442 (readNLeastSignificantBitsLoopPure!0 (_1!4665 lt!160441) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!160416))))

(declare-fun lt!160410 () (_ BitVec 64))

(assert (=> b!107329 (= lt!160410 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!160423 () Unit!6556)

(assert (=> b!107329 (= lt!160423 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4664 lt!160436) (buf!2621 (_2!4664 lt!160434)) lt!160410))))

(assert (=> b!107329 (validate_offset_bits!1 ((_ sign_extend 32) (size!2239 (buf!2621 (_2!4664 lt!160434)))) ((_ sign_extend 32) (currentByte!5139 (_2!4664 lt!160436))) ((_ sign_extend 32) (currentBit!5134 (_2!4664 lt!160436))) lt!160410)))

(declare-fun lt!160449 () Unit!6556)

(assert (=> b!107329 (= lt!160449 lt!160423)))

(declare-fun lt!160425 () tuple2!8818)

(assert (=> b!107329 (= lt!160425 (readNLeastSignificantBitsLoopPure!0 (_1!4665 lt!160451) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!160416 (ite (_2!4663 lt!160430) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!160422 () tuple2!8818)

(assert (=> b!107329 (= lt!160422 (readNLeastSignificantBitsLoopPure!0 (_1!4665 lt!160441) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!160416))))

(declare-fun c!6618 () Bool)

(assert (=> b!107329 (= c!6618 (_2!4663 (readBitPure!0 (_1!4665 lt!160441))))))

(declare-fun lt!160412 () tuple2!8818)

(assert (=> b!107329 (= lt!160412 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4665 lt!160441) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!160416 e!70253)))))

(declare-fun lt!160445 () Unit!6556)

(assert (=> b!107329 (= lt!160445 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4665 lt!160441) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!160416))))

(assert (=> b!107329 (and (= (_2!4666 lt!160422) (_2!4666 lt!160412)) (= (_1!4666 lt!160422) (_1!4666 lt!160412)))))

(declare-fun lt!160428 () Unit!6556)

(assert (=> b!107329 (= lt!160428 lt!160445)))

(assert (=> b!107329 (= (_1!4665 lt!160441) (withMovedBitIndex!0 (_2!4665 lt!160441) (bvsub (bitIndex!0 (size!2239 (buf!2621 (_2!4664 lt!159631))) (currentByte!5139 (_2!4664 lt!159631)) (currentBit!5134 (_2!4664 lt!159631))) (bitIndex!0 (size!2239 (buf!2621 (_2!4664 lt!160434))) (currentByte!5139 (_2!4664 lt!160434)) (currentBit!5134 (_2!4664 lt!160434))))))))

(declare-fun lt!160446 () Unit!6556)

(declare-fun Unit!6572 () Unit!6556)

(assert (=> b!107329 (= lt!160446 Unit!6572)))

(assert (=> b!107329 (= (_1!4665 lt!160451) (withMovedBitIndex!0 (_2!4665 lt!160451) (bvsub (bitIndex!0 (size!2239 (buf!2621 (_2!4664 lt!160436))) (currentByte!5139 (_2!4664 lt!160436)) (currentBit!5134 (_2!4664 lt!160436))) (bitIndex!0 (size!2239 (buf!2621 (_2!4664 lt!160434))) (currentByte!5139 (_2!4664 lt!160434)) (currentBit!5134 (_2!4664 lt!160434))))))))

(declare-fun lt!160437 () Unit!6556)

(declare-fun Unit!6573 () Unit!6556)

(assert (=> b!107329 (= lt!160437 Unit!6573)))

(assert (=> b!107329 (= (bitIndex!0 (size!2239 (buf!2621 (_2!4664 lt!159631))) (currentByte!5139 (_2!4664 lt!159631)) (currentBit!5134 (_2!4664 lt!159631))) (bvsub (bitIndex!0 (size!2239 (buf!2621 (_2!4664 lt!160436))) (currentByte!5139 (_2!4664 lt!160436)) (currentBit!5134 (_2!4664 lt!160436))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!160440 () Unit!6556)

(declare-fun Unit!6574 () Unit!6556)

(assert (=> b!107329 (= lt!160440 Unit!6574)))

(assert (=> b!107329 (= (_2!4666 lt!160442) (_2!4666 lt!160425))))

(declare-fun lt!160414 () Unit!6556)

(declare-fun Unit!6575 () Unit!6556)

(assert (=> b!107329 (= lt!160414 Unit!6575)))

(assert (=> b!107329 (= (_1!4666 lt!160442) (_2!4665 lt!160441))))

(declare-fun d!33780 () Bool)

(assert (=> d!33780 e!70247))

(declare-fun res!88439 () Bool)

(assert (=> d!33780 (=> (not res!88439) (not e!70247))))

(assert (=> d!33780 (= res!88439 (= (size!2239 (buf!2621 (_2!4664 lt!159631))) (size!2239 (buf!2621 (_2!4664 lt!160431)))))))

(assert (=> d!33780 (= lt!160431 e!70252)))

(assert (=> d!33780 (= c!6617 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!33780 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!33780 (= (appendNLeastSignificantBitsLoop!0 (_2!4664 lt!159631) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!160431)))

(declare-fun b!107330 () Bool)

(assert (=> b!107330 (= e!70251 (= (_2!4663 lt!160421) (_2!4663 lt!160420)))))

(declare-fun b!107331 () Bool)

(assert (=> b!107331 (= e!70249 (= (bitIndex!0 (size!2239 (buf!2621 (_1!4663 lt!160415))) (currentByte!5139 (_1!4663 lt!160415)) (currentBit!5134 (_1!4663 lt!160415))) (bitIndex!0 (size!2239 (buf!2621 (_2!4664 lt!160439))) (currentByte!5139 (_2!4664 lt!160439)) (currentBit!5134 (_2!4664 lt!160439)))))))

(declare-fun b!107332 () Bool)

(declare-fun res!88440 () Bool)

(assert (=> b!107332 (=> (not res!88440) (not e!70247))))

(declare-fun lt!160408 () (_ BitVec 64))

(declare-fun lt!160435 () (_ BitVec 64))

(assert (=> b!107332 (= res!88440 (= (bitIndex!0 (size!2239 (buf!2621 (_2!4664 lt!160431))) (currentByte!5139 (_2!4664 lt!160431)) (currentBit!5134 (_2!4664 lt!160431))) (bvadd lt!160408 lt!160435)))))

(assert (=> b!107332 (or (not (= (bvand lt!160408 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!160435 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!160408 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!160408 lt!160435) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107332 (= lt!160435 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!107332 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!107332 (= lt!160408 (bitIndex!0 (size!2239 (buf!2621 (_2!4664 lt!159631))) (currentByte!5139 (_2!4664 lt!159631)) (currentBit!5134 (_2!4664 lt!159631))))))

(declare-fun b!107333 () Bool)

(assert (=> b!107333 (= e!70253 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun lt!160413 () tuple2!8818)

(declare-fun lt!160444 () tuple2!8816)

(declare-fun b!107334 () Bool)

(assert (=> b!107334 (= e!70247 (and (= (_2!4666 lt!160413) v!199) (= (_1!4666 lt!160413) (_2!4665 lt!160444))))))

(declare-fun lt!160432 () (_ BitVec 64))

(assert (=> b!107334 (= lt!160413 (readNLeastSignificantBitsLoopPure!0 (_1!4665 lt!160444) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!160432))))

(declare-fun lt!160433 () Unit!6556)

(declare-fun lt!160429 () Unit!6556)

(assert (=> b!107334 (= lt!160433 lt!160429)))

(assert (=> b!107334 (validate_offset_bits!1 ((_ sign_extend 32) (size!2239 (buf!2621 (_2!4664 lt!160431)))) ((_ sign_extend 32) (currentByte!5139 (_2!4664 lt!159631))) ((_ sign_extend 32) (currentBit!5134 (_2!4664 lt!159631))) lt!160426)))

(assert (=> b!107334 (= lt!160429 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4664 lt!159631) (buf!2621 (_2!4664 lt!160431)) lt!160426))))

(assert (=> b!107334 e!70248))

(declare-fun res!88438 () Bool)

(assert (=> b!107334 (=> (not res!88438) (not e!70248))))

(assert (=> b!107334 (= res!88438 (and (= (size!2239 (buf!2621 (_2!4664 lt!159631))) (size!2239 (buf!2621 (_2!4664 lt!160431)))) (bvsge lt!160426 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107334 (= lt!160426 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!107334 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!107334 (= lt!160432 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!107334 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!107334 (= lt!160444 (reader!0 (_2!4664 lt!159631) (_2!4664 lt!160431)))))

(declare-fun b!107335 () Bool)

(declare-fun lt!160411 () Unit!6556)

(assert (=> b!107335 (= e!70252 (tuple2!8815 lt!160411 (_2!4664 lt!159631)))))

(assert (=> b!107335 (= lt!160447 (_2!4664 lt!159631))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3952) Unit!6556)

(assert (=> b!107335 (= lt!160411 (lemmaIsPrefixRefl!0 lt!160447))))

(assert (=> b!107335 call!1356))

(declare-fun b!107336 () Bool)

(declare-fun res!88436 () Bool)

(assert (=> b!107336 (= res!88436 (= (bitIndex!0 (size!2239 (buf!2621 (_2!4664 lt!160439))) (currentByte!5139 (_2!4664 lt!160439)) (currentBit!5134 (_2!4664 lt!160439))) (bvadd (bitIndex!0 (size!2239 (buf!2621 (_2!4664 lt!159631))) (currentByte!5139 (_2!4664 lt!159631)) (currentBit!5134 (_2!4664 lt!159631))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!107336 (=> (not res!88436) (not e!70250))))

(assert (= (and d!33780 c!6617) b!107329))

(assert (= (and d!33780 (not c!6617)) b!107335))

(assert (= (and b!107329 res!88442) b!107336))

(assert (= (and b!107336 res!88436) b!107328))

(assert (= (and b!107328 res!88443) b!107326))

(assert (= (and b!107326 res!88441) b!107331))

(assert (= (and b!107329 res!88437) b!107330))

(assert (= (and b!107329 c!6618) b!107333))

(assert (= (and b!107329 (not c!6618)) b!107327))

(assert (= (or b!107328 b!107335) bm!1353))

(assert (= (and d!33780 res!88439) b!107332))

(assert (= (and b!107332 res!88440) b!107325))

(assert (= (and b!107325 res!88444) b!107334))

(assert (= (and b!107334 res!88438) b!107324))

(declare-fun m!158479 () Bool)

(assert (=> b!107329 m!158479))

(declare-fun m!158481 () Bool)

(assert (=> b!107329 m!158481))

(declare-fun m!158483 () Bool)

(assert (=> b!107329 m!158483))

(declare-fun m!158485 () Bool)

(assert (=> b!107329 m!158485))

(declare-fun m!158487 () Bool)

(assert (=> b!107329 m!158487))

(declare-fun m!158489 () Bool)

(assert (=> b!107329 m!158489))

(declare-fun m!158491 () Bool)

(assert (=> b!107329 m!158491))

(declare-fun m!158493 () Bool)

(assert (=> b!107329 m!158493))

(declare-fun m!158495 () Bool)

(assert (=> b!107329 m!158495))

(declare-fun m!158497 () Bool)

(assert (=> b!107329 m!158497))

(declare-fun m!158499 () Bool)

(assert (=> b!107329 m!158499))

(declare-fun m!158501 () Bool)

(assert (=> b!107329 m!158501))

(declare-fun m!158503 () Bool)

(assert (=> b!107329 m!158503))

(declare-fun m!158505 () Bool)

(assert (=> b!107329 m!158505))

(declare-fun m!158507 () Bool)

(assert (=> b!107329 m!158507))

(assert (=> b!107329 m!158495))

(declare-fun m!158509 () Bool)

(assert (=> b!107329 m!158509))

(declare-fun m!158511 () Bool)

(assert (=> b!107329 m!158511))

(declare-fun m!158513 () Bool)

(assert (=> b!107329 m!158513))

(declare-fun m!158515 () Bool)

(assert (=> b!107329 m!158515))

(declare-fun m!158517 () Bool)

(assert (=> b!107329 m!158517))

(declare-fun m!158519 () Bool)

(assert (=> b!107329 m!158519))

(declare-fun m!158521 () Bool)

(assert (=> b!107329 m!158521))

(declare-fun m!158523 () Bool)

(assert (=> b!107329 m!158523))

(declare-fun m!158525 () Bool)

(assert (=> b!107329 m!158525))

(declare-fun m!158527 () Bool)

(assert (=> b!107329 m!158527))

(declare-fun m!158529 () Bool)

(assert (=> b!107329 m!158529))

(declare-fun m!158531 () Bool)

(assert (=> b!107329 m!158531))

(declare-fun m!158533 () Bool)

(assert (=> b!107329 m!158533))

(assert (=> b!107329 m!157905))

(declare-fun m!158535 () Bool)

(assert (=> b!107324 m!158535))

(declare-fun m!158537 () Bool)

(assert (=> b!107326 m!158537))

(assert (=> b!107326 m!158537))

(declare-fun m!158539 () Bool)

(assert (=> b!107326 m!158539))

(declare-fun m!158541 () Bool)

(assert (=> b!107331 m!158541))

(declare-fun m!158543 () Bool)

(assert (=> b!107331 m!158543))

(declare-fun m!158545 () Bool)

(assert (=> b!107335 m!158545))

(declare-fun m!158547 () Bool)

(assert (=> b!107334 m!158547))

(assert (=> b!107334 m!158519))

(declare-fun m!158549 () Bool)

(assert (=> b!107334 m!158549))

(declare-fun m!158551 () Bool)

(assert (=> b!107334 m!158551))

(declare-fun m!158553 () Bool)

(assert (=> b!107334 m!158553))

(declare-fun m!158555 () Bool)

(assert (=> b!107325 m!158555))

(declare-fun m!158557 () Bool)

(assert (=> bm!1353 m!158557))

(assert (=> b!107336 m!158543))

(assert (=> b!107336 m!157905))

(declare-fun m!158559 () Bool)

(assert (=> b!107332 m!158559))

(assert (=> b!107332 m!157905))

(assert (=> b!107022 d!33780))

(declare-fun b!107361 () Bool)

(declare-fun res!88461 () Bool)

(declare-fun e!70267 () Bool)

(assert (=> b!107361 (=> (not res!88461) (not e!70267))))

(declare-fun lt!160538 () tuple2!8816)

(assert (=> b!107361 (= res!88461 (isPrefixOf!0 (_1!4665 lt!160538) thiss!1305))))

(declare-fun b!107362 () Bool)

(declare-fun e!70266 () Unit!6556)

(declare-fun lt!160527 () Unit!6556)

(assert (=> b!107362 (= e!70266 lt!160527)))

(declare-fun lt!160540 () (_ BitVec 64))

(assert (=> b!107362 (= lt!160540 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160524 () (_ BitVec 64))

(assert (=> b!107362 (= lt!160524 (bitIndex!0 (size!2239 (buf!2621 thiss!1305)) (currentByte!5139 thiss!1305) (currentBit!5134 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4916 array!4916 (_ BitVec 64) (_ BitVec 64)) Unit!6556)

(assert (=> b!107362 (= lt!160527 (arrayBitRangesEqSymmetric!0 (buf!2621 thiss!1305) (buf!2621 (_2!4664 lt!159618)) lt!160540 lt!160524))))

(declare-fun arrayBitRangesEq!0 (array!4916 array!4916 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!107362 (arrayBitRangesEq!0 (buf!2621 (_2!4664 lt!159618)) (buf!2621 thiss!1305) lt!160540 lt!160524)))

(declare-fun b!107363 () Bool)

(declare-fun lt!160525 () (_ BitVec 64))

(declare-fun lt!160533 () (_ BitVec 64))

(assert (=> b!107363 (= e!70267 (= (_1!4665 lt!160538) (withMovedBitIndex!0 (_2!4665 lt!160538) (bvsub lt!160533 lt!160525))))))

(assert (=> b!107363 (or (= (bvand lt!160533 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!160525 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!160533 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!160533 lt!160525) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107363 (= lt!160525 (bitIndex!0 (size!2239 (buf!2621 (_2!4664 lt!159618))) (currentByte!5139 (_2!4664 lt!159618)) (currentBit!5134 (_2!4664 lt!159618))))))

(assert (=> b!107363 (= lt!160533 (bitIndex!0 (size!2239 (buf!2621 thiss!1305)) (currentByte!5139 thiss!1305) (currentBit!5134 thiss!1305)))))

(declare-fun d!33866 () Bool)

(assert (=> d!33866 e!70267))

(declare-fun res!88462 () Bool)

(assert (=> d!33866 (=> (not res!88462) (not e!70267))))

(assert (=> d!33866 (= res!88462 (isPrefixOf!0 (_1!4665 lt!160538) (_2!4665 lt!160538)))))

(declare-fun lt!160523 () BitStream!3952)

(assert (=> d!33866 (= lt!160538 (tuple2!8817 lt!160523 (_2!4664 lt!159618)))))

(declare-fun lt!160534 () Unit!6556)

(declare-fun lt!160536 () Unit!6556)

(assert (=> d!33866 (= lt!160534 lt!160536)))

(assert (=> d!33866 (isPrefixOf!0 lt!160523 (_2!4664 lt!159618))))

(assert (=> d!33866 (= lt!160536 (lemmaIsPrefixTransitive!0 lt!160523 (_2!4664 lt!159618) (_2!4664 lt!159618)))))

(declare-fun lt!160542 () Unit!6556)

(declare-fun lt!160526 () Unit!6556)

(assert (=> d!33866 (= lt!160542 lt!160526)))

(assert (=> d!33866 (isPrefixOf!0 lt!160523 (_2!4664 lt!159618))))

(assert (=> d!33866 (= lt!160526 (lemmaIsPrefixTransitive!0 lt!160523 thiss!1305 (_2!4664 lt!159618)))))

(declare-fun lt!160544 () Unit!6556)

(assert (=> d!33866 (= lt!160544 e!70266)))

(declare-fun c!6623 () Bool)

(assert (=> d!33866 (= c!6623 (not (= (size!2239 (buf!2621 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!160530 () Unit!6556)

(declare-fun lt!160537 () Unit!6556)

(assert (=> d!33866 (= lt!160530 lt!160537)))

(assert (=> d!33866 (isPrefixOf!0 (_2!4664 lt!159618) (_2!4664 lt!159618))))

(assert (=> d!33866 (= lt!160537 (lemmaIsPrefixRefl!0 (_2!4664 lt!159618)))))

(declare-fun lt!160529 () Unit!6556)

(declare-fun lt!160535 () Unit!6556)

(assert (=> d!33866 (= lt!160529 lt!160535)))

(assert (=> d!33866 (= lt!160535 (lemmaIsPrefixRefl!0 (_2!4664 lt!159618)))))

(declare-fun lt!160543 () Unit!6556)

(declare-fun lt!160541 () Unit!6556)

(assert (=> d!33866 (= lt!160543 lt!160541)))

(assert (=> d!33866 (isPrefixOf!0 lt!160523 lt!160523)))

(assert (=> d!33866 (= lt!160541 (lemmaIsPrefixRefl!0 lt!160523))))

(declare-fun lt!160539 () Unit!6556)

(declare-fun lt!160528 () Unit!6556)

(assert (=> d!33866 (= lt!160539 lt!160528)))

(assert (=> d!33866 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!33866 (= lt!160528 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!33866 (= lt!160523 (BitStream!3953 (buf!2621 (_2!4664 lt!159618)) (currentByte!5139 thiss!1305) (currentBit!5134 thiss!1305)))))

(assert (=> d!33866 (isPrefixOf!0 thiss!1305 (_2!4664 lt!159618))))

(assert (=> d!33866 (= (reader!0 thiss!1305 (_2!4664 lt!159618)) lt!160538)))

(declare-fun b!107364 () Bool)

(declare-fun Unit!6577 () Unit!6556)

(assert (=> b!107364 (= e!70266 Unit!6577)))

(declare-fun b!107365 () Bool)

(declare-fun res!88463 () Bool)

(assert (=> b!107365 (=> (not res!88463) (not e!70267))))

(assert (=> b!107365 (= res!88463 (isPrefixOf!0 (_2!4665 lt!160538) (_2!4664 lt!159618)))))

(assert (= (and d!33866 c!6623) b!107362))

(assert (= (and d!33866 (not c!6623)) b!107364))

(assert (= (and d!33866 res!88462) b!107361))

(assert (= (and b!107361 res!88461) b!107365))

(assert (= (and b!107365 res!88463) b!107363))

(declare-fun m!158561 () Bool)

(assert (=> b!107363 m!158561))

(assert (=> b!107363 m!157921))

(assert (=> b!107363 m!157909))

(declare-fun m!158563 () Bool)

(assert (=> b!107361 m!158563))

(declare-fun m!158565 () Bool)

(assert (=> b!107365 m!158565))

(assert (=> b!107362 m!157909))

(declare-fun m!158567 () Bool)

(assert (=> b!107362 m!158567))

(declare-fun m!158569 () Bool)

(assert (=> b!107362 m!158569))

(declare-fun m!158571 () Bool)

(assert (=> d!33866 m!158571))

(declare-fun m!158573 () Bool)

(assert (=> d!33866 m!158573))

(assert (=> d!33866 m!157945))

(declare-fun m!158575 () Bool)

(assert (=> d!33866 m!158575))

(declare-fun m!158577 () Bool)

(assert (=> d!33866 m!158577))

(declare-fun m!158579 () Bool)

(assert (=> d!33866 m!158579))

(declare-fun m!158581 () Bool)

(assert (=> d!33866 m!158581))

(declare-fun m!158583 () Bool)

(assert (=> d!33866 m!158583))

(declare-fun m!158585 () Bool)

(assert (=> d!33866 m!158585))

(declare-fun m!158587 () Bool)

(assert (=> d!33866 m!158587))

(declare-fun m!158589 () Bool)

(assert (=> d!33866 m!158589))

(assert (=> b!107022 d!33866))

(declare-fun d!33868 () Bool)

(assert (=> d!33868 (isPrefixOf!0 thiss!1305 (_2!4664 lt!159618))))

(declare-fun lt!160589 () Unit!6556)

(declare-fun choose!30 (BitStream!3952 BitStream!3952 BitStream!3952) Unit!6556)

(assert (=> d!33868 (= lt!160589 (choose!30 thiss!1305 (_2!4664 lt!159631) (_2!4664 lt!159618)))))

(assert (=> d!33868 (isPrefixOf!0 thiss!1305 (_2!4664 lt!159631))))

(assert (=> d!33868 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4664 lt!159631) (_2!4664 lt!159618)) lt!160589)))

(declare-fun bs!8261 () Bool)

(assert (= bs!8261 d!33868))

(assert (=> bs!8261 m!157945))

(declare-fun m!158591 () Bool)

(assert (=> bs!8261 m!158591))

(assert (=> bs!8261 m!157923))

(assert (=> b!107022 d!33868))

(declare-fun d!33870 () Bool)

(assert (=> d!33870 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2239 (buf!2621 (_2!4664 lt!159618)))) ((_ sign_extend 32) (currentByte!5139 thiss!1305)) ((_ sign_extend 32) (currentBit!5134 thiss!1305)) lt!159625) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2239 (buf!2621 (_2!4664 lt!159618)))) ((_ sign_extend 32) (currentByte!5139 thiss!1305)) ((_ sign_extend 32) (currentBit!5134 thiss!1305))) lt!159625))))

(declare-fun bs!8262 () Bool)

(assert (= bs!8262 d!33870))

(declare-fun m!158593 () Bool)

(assert (=> bs!8262 m!158593))

(assert (=> b!107022 d!33870))

(declare-fun d!33872 () Bool)

(declare-datatypes ((tuple2!8844 0))(
  ( (tuple2!8845 (_1!4679 Bool) (_2!4679 BitStream!3952)) )
))
(declare-fun lt!160604 () tuple2!8844)

(declare-fun readBit!0 (BitStream!3952) tuple2!8844)

(assert (=> d!33872 (= lt!160604 (readBit!0 (_1!4665 lt!159626)))))

(assert (=> d!33872 (= (readBitPure!0 (_1!4665 lt!159626)) (tuple2!8813 (_2!4679 lt!160604) (_1!4679 lt!160604)))))

(declare-fun bs!8263 () Bool)

(assert (= bs!8263 d!33872))

(declare-fun m!158595 () Bool)

(assert (=> bs!8263 m!158595))

(assert (=> b!107022 d!33872))

(declare-fun d!33874 () Bool)

(declare-fun e!70274 () Bool)

(assert (=> d!33874 e!70274))

(declare-fun res!88472 () Bool)

(assert (=> d!33874 (=> (not res!88472) (not e!70274))))

(declare-fun lt!160608 () (_ BitVec 64))

(declare-fun lt!160607 () (_ BitVec 64))

(declare-fun lt!160609 () (_ BitVec 64))

(assert (=> d!33874 (= res!88472 (= lt!160609 (bvsub lt!160607 lt!160608)))))

(assert (=> d!33874 (or (= (bvand lt!160607 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!160608 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!160607 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!160607 lt!160608) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33874 (= lt!160608 (remainingBits!0 ((_ sign_extend 32) (size!2239 (buf!2621 (_1!4663 lt!159637)))) ((_ sign_extend 32) (currentByte!5139 (_1!4663 lt!159637))) ((_ sign_extend 32) (currentBit!5134 (_1!4663 lt!159637)))))))

(declare-fun lt!160605 () (_ BitVec 64))

(declare-fun lt!160610 () (_ BitVec 64))

(assert (=> d!33874 (= lt!160607 (bvmul lt!160605 lt!160610))))

(assert (=> d!33874 (or (= lt!160605 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!160610 (bvsdiv (bvmul lt!160605 lt!160610) lt!160605)))))

(assert (=> d!33874 (= lt!160610 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33874 (= lt!160605 ((_ sign_extend 32) (size!2239 (buf!2621 (_1!4663 lt!159637)))))))

(assert (=> d!33874 (= lt!160609 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5139 (_1!4663 lt!159637))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5134 (_1!4663 lt!159637)))))))

(assert (=> d!33874 (invariant!0 (currentBit!5134 (_1!4663 lt!159637)) (currentByte!5139 (_1!4663 lt!159637)) (size!2239 (buf!2621 (_1!4663 lt!159637))))))

(assert (=> d!33874 (= (bitIndex!0 (size!2239 (buf!2621 (_1!4663 lt!159637))) (currentByte!5139 (_1!4663 lt!159637)) (currentBit!5134 (_1!4663 lt!159637))) lt!160609)))

(declare-fun b!107378 () Bool)

(declare-fun res!88473 () Bool)

(assert (=> b!107378 (=> (not res!88473) (not e!70274))))

(assert (=> b!107378 (= res!88473 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!160609))))

(declare-fun b!107379 () Bool)

(declare-fun lt!160606 () (_ BitVec 64))

(assert (=> b!107379 (= e!70274 (bvsle lt!160609 (bvmul lt!160606 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!107379 (or (= lt!160606 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!160606 #b0000000000000000000000000000000000000000000000000000000000001000) lt!160606)))))

(assert (=> b!107379 (= lt!160606 ((_ sign_extend 32) (size!2239 (buf!2621 (_1!4663 lt!159637)))))))

(assert (= (and d!33874 res!88472) b!107378))

(assert (= (and b!107378 res!88473) b!107379))

(declare-fun m!158597 () Bool)

(assert (=> d!33874 m!158597))

(declare-fun m!158599 () Bool)

(assert (=> d!33874 m!158599))

(assert (=> b!107022 d!33874))

(declare-fun d!33876 () Bool)

(declare-fun lt!160615 () tuple2!8844)

(assert (=> d!33876 (= lt!160615 (readBit!0 (BitStream!3953 (buf!2621 (_2!4664 lt!159618)) (currentByte!5139 thiss!1305) (currentBit!5134 thiss!1305))))))

(assert (=> d!33876 (= (readBitPure!0 (BitStream!3953 (buf!2621 (_2!4664 lt!159618)) (currentByte!5139 thiss!1305) (currentBit!5134 thiss!1305))) (tuple2!8813 (_2!4679 lt!160615) (_1!4679 lt!160615)))))

(declare-fun bs!8264 () Bool)

(assert (= bs!8264 d!33876))

(declare-fun m!158601 () Bool)

(assert (=> bs!8264 m!158601))

(assert (=> b!107022 d!33876))

(declare-fun d!33878 () Bool)

(declare-fun lt!160616 () tuple2!8840)

(assert (=> d!33878 (= lt!160616 (readNLeastSignificantBitsLoop!0 (_1!4665 lt!159641) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!159634))))

(assert (=> d!33878 (= (readNLeastSignificantBitsLoopPure!0 (_1!4665 lt!159641) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!159634) (tuple2!8819 (_2!4677 lt!160616) (_1!4677 lt!160616)))))

(declare-fun bs!8265 () Bool)

(assert (= bs!8265 d!33878))

(declare-fun m!158603 () Bool)

(assert (=> bs!8265 m!158603))

(assert (=> b!107022 d!33878))

(declare-fun b!107380 () Bool)

(declare-fun res!88474 () Bool)

(declare-fun e!70276 () Bool)

(assert (=> b!107380 (=> (not res!88474) (not e!70276))))

(declare-fun lt!160630 () tuple2!8816)

(assert (=> b!107380 (= res!88474 (isPrefixOf!0 (_1!4665 lt!160630) (_2!4664 lt!159631)))))

(declare-fun b!107381 () Bool)

(declare-fun e!70275 () Unit!6556)

(declare-fun lt!160621 () Unit!6556)

(assert (=> b!107381 (= e!70275 lt!160621)))

(declare-fun lt!160632 () (_ BitVec 64))

(assert (=> b!107381 (= lt!160632 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160618 () (_ BitVec 64))

(assert (=> b!107381 (= lt!160618 (bitIndex!0 (size!2239 (buf!2621 (_2!4664 lt!159631))) (currentByte!5139 (_2!4664 lt!159631)) (currentBit!5134 (_2!4664 lt!159631))))))

(assert (=> b!107381 (= lt!160621 (arrayBitRangesEqSymmetric!0 (buf!2621 (_2!4664 lt!159631)) (buf!2621 (_2!4664 lt!159618)) lt!160632 lt!160618))))

(assert (=> b!107381 (arrayBitRangesEq!0 (buf!2621 (_2!4664 lt!159618)) (buf!2621 (_2!4664 lt!159631)) lt!160632 lt!160618)))

(declare-fun b!107382 () Bool)

(declare-fun lt!160625 () (_ BitVec 64))

(declare-fun lt!160619 () (_ BitVec 64))

(assert (=> b!107382 (= e!70276 (= (_1!4665 lt!160630) (withMovedBitIndex!0 (_2!4665 lt!160630) (bvsub lt!160625 lt!160619))))))

(assert (=> b!107382 (or (= (bvand lt!160625 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!160619 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!160625 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!160625 lt!160619) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107382 (= lt!160619 (bitIndex!0 (size!2239 (buf!2621 (_2!4664 lt!159618))) (currentByte!5139 (_2!4664 lt!159618)) (currentBit!5134 (_2!4664 lt!159618))))))

(assert (=> b!107382 (= lt!160625 (bitIndex!0 (size!2239 (buf!2621 (_2!4664 lt!159631))) (currentByte!5139 (_2!4664 lt!159631)) (currentBit!5134 (_2!4664 lt!159631))))))

(declare-fun d!33880 () Bool)

(assert (=> d!33880 e!70276))

(declare-fun res!88475 () Bool)

(assert (=> d!33880 (=> (not res!88475) (not e!70276))))

(assert (=> d!33880 (= res!88475 (isPrefixOf!0 (_1!4665 lt!160630) (_2!4665 lt!160630)))))

(declare-fun lt!160617 () BitStream!3952)

(assert (=> d!33880 (= lt!160630 (tuple2!8817 lt!160617 (_2!4664 lt!159618)))))

(declare-fun lt!160626 () Unit!6556)

(declare-fun lt!160628 () Unit!6556)

(assert (=> d!33880 (= lt!160626 lt!160628)))

(assert (=> d!33880 (isPrefixOf!0 lt!160617 (_2!4664 lt!159618))))

(assert (=> d!33880 (= lt!160628 (lemmaIsPrefixTransitive!0 lt!160617 (_2!4664 lt!159618) (_2!4664 lt!159618)))))

(declare-fun lt!160634 () Unit!6556)

(declare-fun lt!160620 () Unit!6556)

(assert (=> d!33880 (= lt!160634 lt!160620)))

(assert (=> d!33880 (isPrefixOf!0 lt!160617 (_2!4664 lt!159618))))

(assert (=> d!33880 (= lt!160620 (lemmaIsPrefixTransitive!0 lt!160617 (_2!4664 lt!159631) (_2!4664 lt!159618)))))

(declare-fun lt!160636 () Unit!6556)

(assert (=> d!33880 (= lt!160636 e!70275)))

(declare-fun c!6626 () Bool)

(assert (=> d!33880 (= c!6626 (not (= (size!2239 (buf!2621 (_2!4664 lt!159631))) #b00000000000000000000000000000000)))))

(declare-fun lt!160624 () Unit!6556)

(declare-fun lt!160629 () Unit!6556)

(assert (=> d!33880 (= lt!160624 lt!160629)))

(assert (=> d!33880 (isPrefixOf!0 (_2!4664 lt!159618) (_2!4664 lt!159618))))

(assert (=> d!33880 (= lt!160629 (lemmaIsPrefixRefl!0 (_2!4664 lt!159618)))))

(declare-fun lt!160623 () Unit!6556)

(declare-fun lt!160627 () Unit!6556)

(assert (=> d!33880 (= lt!160623 lt!160627)))

(assert (=> d!33880 (= lt!160627 (lemmaIsPrefixRefl!0 (_2!4664 lt!159618)))))

(declare-fun lt!160635 () Unit!6556)

(declare-fun lt!160633 () Unit!6556)

(assert (=> d!33880 (= lt!160635 lt!160633)))

(assert (=> d!33880 (isPrefixOf!0 lt!160617 lt!160617)))

(assert (=> d!33880 (= lt!160633 (lemmaIsPrefixRefl!0 lt!160617))))

(declare-fun lt!160631 () Unit!6556)

(declare-fun lt!160622 () Unit!6556)

(assert (=> d!33880 (= lt!160631 lt!160622)))

(assert (=> d!33880 (isPrefixOf!0 (_2!4664 lt!159631) (_2!4664 lt!159631))))

(assert (=> d!33880 (= lt!160622 (lemmaIsPrefixRefl!0 (_2!4664 lt!159631)))))

(assert (=> d!33880 (= lt!160617 (BitStream!3953 (buf!2621 (_2!4664 lt!159618)) (currentByte!5139 (_2!4664 lt!159631)) (currentBit!5134 (_2!4664 lt!159631))))))

(assert (=> d!33880 (isPrefixOf!0 (_2!4664 lt!159631) (_2!4664 lt!159618))))

(assert (=> d!33880 (= (reader!0 (_2!4664 lt!159631) (_2!4664 lt!159618)) lt!160630)))

(declare-fun b!107383 () Bool)

(declare-fun Unit!6579 () Unit!6556)

(assert (=> b!107383 (= e!70275 Unit!6579)))

(declare-fun b!107384 () Bool)

(declare-fun res!88476 () Bool)

(assert (=> b!107384 (=> (not res!88476) (not e!70276))))

(assert (=> b!107384 (= res!88476 (isPrefixOf!0 (_2!4665 lt!160630) (_2!4664 lt!159618)))))

(assert (= (and d!33880 c!6626) b!107381))

(assert (= (and d!33880 (not c!6626)) b!107383))

(assert (= (and d!33880 res!88475) b!107380))

(assert (= (and b!107380 res!88474) b!107384))

(assert (= (and b!107384 res!88476) b!107382))

(declare-fun m!158605 () Bool)

(assert (=> b!107382 m!158605))

(assert (=> b!107382 m!157921))

(assert (=> b!107382 m!157905))

(declare-fun m!158607 () Bool)

(assert (=> b!107380 m!158607))

(declare-fun m!158609 () Bool)

(assert (=> b!107384 m!158609))

(assert (=> b!107381 m!157905))

(declare-fun m!158611 () Bool)

(assert (=> b!107381 m!158611))

(declare-fun m!158613 () Bool)

(assert (=> b!107381 m!158613))

(declare-fun m!158615 () Bool)

(assert (=> d!33880 m!158615))

(assert (=> d!33880 m!158573))

(declare-fun m!158617 () Bool)

(assert (=> d!33880 m!158617))

(declare-fun m!158619 () Bool)

(assert (=> d!33880 m!158619))

(declare-fun m!158621 () Bool)

(assert (=> d!33880 m!158621))

(declare-fun m!158623 () Bool)

(assert (=> d!33880 m!158623))

(assert (=> d!33880 m!158581))

(declare-fun m!158625 () Bool)

(assert (=> d!33880 m!158625))

(declare-fun m!158627 () Bool)

(assert (=> d!33880 m!158627))

(declare-fun m!158629 () Bool)

(assert (=> d!33880 m!158629))

(declare-fun m!158631 () Bool)

(assert (=> d!33880 m!158631))

(assert (=> b!107022 d!33880))

(declare-fun d!33882 () Bool)

(assert (=> d!33882 (validate_offset_bits!1 ((_ sign_extend 32) (size!2239 (buf!2621 (_2!4664 lt!159618)))) ((_ sign_extend 32) (currentByte!5139 (_2!4664 lt!159631))) ((_ sign_extend 32) (currentBit!5134 (_2!4664 lt!159631))) lt!159640)))

(declare-fun lt!160639 () Unit!6556)

(declare-fun choose!9 (BitStream!3952 array!4916 (_ BitVec 64) BitStream!3952) Unit!6556)

(assert (=> d!33882 (= lt!160639 (choose!9 (_2!4664 lt!159631) (buf!2621 (_2!4664 lt!159618)) lt!159640 (BitStream!3953 (buf!2621 (_2!4664 lt!159618)) (currentByte!5139 (_2!4664 lt!159631)) (currentBit!5134 (_2!4664 lt!159631)))))))

(assert (=> d!33882 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4664 lt!159631) (buf!2621 (_2!4664 lt!159618)) lt!159640) lt!160639)))

(declare-fun bs!8266 () Bool)

(assert (= bs!8266 d!33882))

(assert (=> bs!8266 m!157947))

(declare-fun m!158633 () Bool)

(assert (=> bs!8266 m!158633))

(assert (=> b!107022 d!33882))

(declare-fun b!107407 () Bool)

(declare-fun res!88494 () Bool)

(declare-fun e!70288 () Bool)

(assert (=> b!107407 (=> (not res!88494) (not e!70288))))

(declare-fun lt!160694 () (_ BitVec 64))

(declare-fun lt!160695 () tuple2!8814)

(declare-fun lt!160696 () (_ BitVec 64))

(assert (=> b!107407 (= res!88494 (= (bitIndex!0 (size!2239 (buf!2621 (_2!4664 lt!160695))) (currentByte!5139 (_2!4664 lt!160695)) (currentBit!5134 (_2!4664 lt!160695))) (bvadd lt!160696 lt!160694)))))

(assert (=> b!107407 (or (not (= (bvand lt!160696 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!160694 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!160696 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!160696 lt!160694) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107407 (= lt!160694 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!107407 (= lt!160696 (bitIndex!0 (size!2239 (buf!2621 thiss!1305)) (currentByte!5139 thiss!1305) (currentBit!5134 thiss!1305)))))

(declare-fun b!107410 () Bool)

(declare-fun e!70289 () Bool)

(declare-fun lt!160693 () tuple2!8812)

(assert (=> b!107410 (= e!70289 (= (bitIndex!0 (size!2239 (buf!2621 (_1!4663 lt!160693))) (currentByte!5139 (_1!4663 lt!160693)) (currentBit!5134 (_1!4663 lt!160693))) (bitIndex!0 (size!2239 (buf!2621 (_2!4664 lt!160695))) (currentByte!5139 (_2!4664 lt!160695)) (currentBit!5134 (_2!4664 lt!160695)))))))

(declare-fun b!107408 () Bool)

(declare-fun res!88496 () Bool)

(assert (=> b!107408 (=> (not res!88496) (not e!70288))))

(assert (=> b!107408 (= res!88496 (isPrefixOf!0 thiss!1305 (_2!4664 lt!160695)))))

(declare-fun b!107409 () Bool)

(assert (=> b!107409 (= e!70288 e!70289)))

(declare-fun res!88495 () Bool)

(assert (=> b!107409 (=> (not res!88495) (not e!70289))))

(assert (=> b!107409 (= res!88495 (and (= (_2!4663 lt!160693) lt!159624) (= (_1!4663 lt!160693) (_2!4664 lt!160695))))))

(assert (=> b!107409 (= lt!160693 (readBitPure!0 (readerFrom!0 (_2!4664 lt!160695) (currentBit!5134 thiss!1305) (currentByte!5139 thiss!1305))))))

(declare-fun d!33884 () Bool)

(assert (=> d!33884 e!70288))

(declare-fun res!88497 () Bool)

(assert (=> d!33884 (=> (not res!88497) (not e!70288))))

(assert (=> d!33884 (= res!88497 (= (size!2239 (buf!2621 thiss!1305)) (size!2239 (buf!2621 (_2!4664 lt!160695)))))))

(declare-fun choose!16 (BitStream!3952 Bool) tuple2!8814)

(assert (=> d!33884 (= lt!160695 (choose!16 thiss!1305 lt!159624))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!33884 (validate_offset_bit!0 ((_ sign_extend 32) (size!2239 (buf!2621 thiss!1305))) ((_ sign_extend 32) (currentByte!5139 thiss!1305)) ((_ sign_extend 32) (currentBit!5134 thiss!1305)))))

(assert (=> d!33884 (= (appendBit!0 thiss!1305 lt!159624) lt!160695)))

(assert (= (and d!33884 res!88497) b!107407))

(assert (= (and b!107407 res!88494) b!107408))

(assert (= (and b!107408 res!88496) b!107409))

(assert (= (and b!107409 res!88495) b!107410))

(declare-fun m!158719 () Bool)

(assert (=> b!107407 m!158719))

(assert (=> b!107407 m!157909))

(declare-fun m!158721 () Bool)

(assert (=> b!107408 m!158721))

(declare-fun m!158723 () Bool)

(assert (=> b!107409 m!158723))

(assert (=> b!107409 m!158723))

(declare-fun m!158725 () Bool)

(assert (=> b!107409 m!158725))

(declare-fun m!158727 () Bool)

(assert (=> d!33884 m!158727))

(declare-fun m!158729 () Bool)

(assert (=> d!33884 m!158729))

(declare-fun m!158731 () Bool)

(assert (=> b!107410 m!158731))

(assert (=> b!107410 m!158719))

(assert (=> b!107022 d!33884))

(declare-fun d!33890 () Bool)

(assert (=> d!33890 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!107022 d!33890))

(declare-fun d!33892 () Bool)

(assert (=> d!33892 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2239 (buf!2621 (_2!4664 lt!159618)))) ((_ sign_extend 32) (currentByte!5139 (_2!4664 lt!159631))) ((_ sign_extend 32) (currentBit!5134 (_2!4664 lt!159631))) lt!159640) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2239 (buf!2621 (_2!4664 lt!159618)))) ((_ sign_extend 32) (currentByte!5139 (_2!4664 lt!159631))) ((_ sign_extend 32) (currentBit!5134 (_2!4664 lt!159631)))) lt!159640))))

(declare-fun bs!8268 () Bool)

(assert (= bs!8268 d!33892))

(declare-fun m!158733 () Bool)

(assert (=> bs!8268 m!158733))

(assert (=> b!107022 d!33892))

(declare-fun d!33894 () Bool)

(declare-fun lt!160697 () tuple2!8844)

(assert (=> d!33894 (= lt!160697 (readBit!0 lt!159621))))

(assert (=> d!33894 (= (readBitPure!0 lt!159621) (tuple2!8813 (_2!4679 lt!160697) (_1!4679 lt!160697)))))

(declare-fun bs!8269 () Bool)

(assert (= bs!8269 d!33894))

(declare-fun m!158735 () Bool)

(assert (=> bs!8269 m!158735))

(assert (=> b!107022 d!33894))

(declare-fun d!33896 () Bool)

(assert (=> d!33896 (validate_offset_bits!1 ((_ sign_extend 32) (size!2239 (buf!2621 (_2!4664 lt!159618)))) ((_ sign_extend 32) (currentByte!5139 thiss!1305)) ((_ sign_extend 32) (currentBit!5134 thiss!1305)) lt!159625)))

(declare-fun lt!160698 () Unit!6556)

(assert (=> d!33896 (= lt!160698 (choose!9 thiss!1305 (buf!2621 (_2!4664 lt!159618)) lt!159625 (BitStream!3953 (buf!2621 (_2!4664 lt!159618)) (currentByte!5139 thiss!1305) (currentBit!5134 thiss!1305))))))

(assert (=> d!33896 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2621 (_2!4664 lt!159618)) lt!159625) lt!160698)))

(declare-fun bs!8270 () Bool)

(assert (= bs!8270 d!33896))

(assert (=> bs!8270 m!157953))

(declare-fun m!158737 () Bool)

(assert (=> bs!8270 m!158737))

(assert (=> b!107022 d!33896))

(declare-fun d!33898 () Bool)

(declare-fun res!88509 () Bool)

(declare-fun e!70299 () Bool)

(assert (=> d!33898 (=> (not res!88509) (not e!70299))))

(assert (=> d!33898 (= res!88509 (= (size!2239 (buf!2621 thiss!1305)) (size!2239 (buf!2621 (_2!4664 lt!159618)))))))

(assert (=> d!33898 (= (isPrefixOf!0 thiss!1305 (_2!4664 lt!159618)) e!70299)))

(declare-fun b!107422 () Bool)

(declare-fun res!88510 () Bool)

(assert (=> b!107422 (=> (not res!88510) (not e!70299))))

(assert (=> b!107422 (= res!88510 (bvsle (bitIndex!0 (size!2239 (buf!2621 thiss!1305)) (currentByte!5139 thiss!1305) (currentBit!5134 thiss!1305)) (bitIndex!0 (size!2239 (buf!2621 (_2!4664 lt!159618))) (currentByte!5139 (_2!4664 lt!159618)) (currentBit!5134 (_2!4664 lt!159618)))))))

(declare-fun b!107423 () Bool)

(declare-fun e!70298 () Bool)

(assert (=> b!107423 (= e!70299 e!70298)))

(declare-fun res!88511 () Bool)

(assert (=> b!107423 (=> res!88511 e!70298)))

(assert (=> b!107423 (= res!88511 (= (size!2239 (buf!2621 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!107424 () Bool)

(assert (=> b!107424 (= e!70298 (arrayBitRangesEq!0 (buf!2621 thiss!1305) (buf!2621 (_2!4664 lt!159618)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2239 (buf!2621 thiss!1305)) (currentByte!5139 thiss!1305) (currentBit!5134 thiss!1305))))))

(assert (= (and d!33898 res!88509) b!107422))

(assert (= (and b!107422 res!88510) b!107423))

(assert (= (and b!107423 (not res!88511)) b!107424))

(assert (=> b!107422 m!157909))

(assert (=> b!107422 m!157921))

(assert (=> b!107424 m!157909))

(assert (=> b!107424 m!157909))

(declare-fun m!158759 () Bool)

(assert (=> b!107424 m!158759))

(assert (=> b!107022 d!33898))

(declare-fun d!33910 () Bool)

(declare-fun e!70300 () Bool)

(assert (=> d!33910 e!70300))

(declare-fun res!88512 () Bool)

(assert (=> d!33910 (=> (not res!88512) (not e!70300))))

(declare-fun lt!160723 () (_ BitVec 64))

(declare-fun lt!160722 () (_ BitVec 64))

(declare-fun lt!160721 () (_ BitVec 64))

(assert (=> d!33910 (= res!88512 (= lt!160723 (bvsub lt!160721 lt!160722)))))

(assert (=> d!33910 (or (= (bvand lt!160721 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!160722 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!160721 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!160721 lt!160722) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33910 (= lt!160722 (remainingBits!0 ((_ sign_extend 32) (size!2239 (buf!2621 (_1!4663 lt!159622)))) ((_ sign_extend 32) (currentByte!5139 (_1!4663 lt!159622))) ((_ sign_extend 32) (currentBit!5134 (_1!4663 lt!159622)))))))

(declare-fun lt!160719 () (_ BitVec 64))

(declare-fun lt!160724 () (_ BitVec 64))

(assert (=> d!33910 (= lt!160721 (bvmul lt!160719 lt!160724))))

(assert (=> d!33910 (or (= lt!160719 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!160724 (bvsdiv (bvmul lt!160719 lt!160724) lt!160719)))))

(assert (=> d!33910 (= lt!160724 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33910 (= lt!160719 ((_ sign_extend 32) (size!2239 (buf!2621 (_1!4663 lt!159622)))))))

(assert (=> d!33910 (= lt!160723 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5139 (_1!4663 lt!159622))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5134 (_1!4663 lt!159622)))))))

(assert (=> d!33910 (invariant!0 (currentBit!5134 (_1!4663 lt!159622)) (currentByte!5139 (_1!4663 lt!159622)) (size!2239 (buf!2621 (_1!4663 lt!159622))))))

(assert (=> d!33910 (= (bitIndex!0 (size!2239 (buf!2621 (_1!4663 lt!159622))) (currentByte!5139 (_1!4663 lt!159622)) (currentBit!5134 (_1!4663 lt!159622))) lt!160723)))

(declare-fun b!107425 () Bool)

(declare-fun res!88513 () Bool)

(assert (=> b!107425 (=> (not res!88513) (not e!70300))))

(assert (=> b!107425 (= res!88513 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!160723))))

(declare-fun b!107426 () Bool)

(declare-fun lt!160720 () (_ BitVec 64))

(assert (=> b!107426 (= e!70300 (bvsle lt!160723 (bvmul lt!160720 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!107426 (or (= lt!160720 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!160720 #b0000000000000000000000000000000000000000000000000000000000001000) lt!160720)))))

(assert (=> b!107426 (= lt!160720 ((_ sign_extend 32) (size!2239 (buf!2621 (_1!4663 lt!159622)))))))

(assert (= (and d!33910 res!88512) b!107425))

(assert (= (and b!107425 res!88513) b!107426))

(declare-fun m!158761 () Bool)

(assert (=> d!33910 m!158761))

(declare-fun m!158763 () Bool)

(assert (=> d!33910 m!158763))

(assert (=> b!107022 d!33910))

(declare-fun d!33914 () Bool)

(declare-fun e!70301 () Bool)

(assert (=> d!33914 e!70301))

(declare-fun res!88514 () Bool)

(assert (=> d!33914 (=> (not res!88514) (not e!70301))))

(declare-fun lt!160729 () (_ BitVec 64))

(declare-fun lt!160727 () (_ BitVec 64))

(declare-fun lt!160728 () (_ BitVec 64))

(assert (=> d!33914 (= res!88514 (= lt!160729 (bvsub lt!160727 lt!160728)))))

(assert (=> d!33914 (or (= (bvand lt!160727 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!160728 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!160727 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!160727 lt!160728) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33914 (= lt!160728 (remainingBits!0 ((_ sign_extend 32) (size!2239 (buf!2621 (_2!4664 lt!159631)))) ((_ sign_extend 32) (currentByte!5139 (_2!4664 lt!159631))) ((_ sign_extend 32) (currentBit!5134 (_2!4664 lt!159631)))))))

(declare-fun lt!160725 () (_ BitVec 64))

(declare-fun lt!160730 () (_ BitVec 64))

(assert (=> d!33914 (= lt!160727 (bvmul lt!160725 lt!160730))))

(assert (=> d!33914 (or (= lt!160725 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!160730 (bvsdiv (bvmul lt!160725 lt!160730) lt!160725)))))

(assert (=> d!33914 (= lt!160730 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33914 (= lt!160725 ((_ sign_extend 32) (size!2239 (buf!2621 (_2!4664 lt!159631)))))))

(assert (=> d!33914 (= lt!160729 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5139 (_2!4664 lt!159631))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5134 (_2!4664 lt!159631)))))))

(assert (=> d!33914 (invariant!0 (currentBit!5134 (_2!4664 lt!159631)) (currentByte!5139 (_2!4664 lt!159631)) (size!2239 (buf!2621 (_2!4664 lt!159631))))))

(assert (=> d!33914 (= (bitIndex!0 (size!2239 (buf!2621 (_2!4664 lt!159631))) (currentByte!5139 (_2!4664 lt!159631)) (currentBit!5134 (_2!4664 lt!159631))) lt!160729)))

(declare-fun b!107427 () Bool)

(declare-fun res!88515 () Bool)

(assert (=> b!107427 (=> (not res!88515) (not e!70301))))

(assert (=> b!107427 (= res!88515 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!160729))))

(declare-fun b!107428 () Bool)

(declare-fun lt!160726 () (_ BitVec 64))

(assert (=> b!107428 (= e!70301 (bvsle lt!160729 (bvmul lt!160726 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!107428 (or (= lt!160726 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!160726 #b0000000000000000000000000000000000000000000000000000000000001000) lt!160726)))))

(assert (=> b!107428 (= lt!160726 ((_ sign_extend 32) (size!2239 (buf!2621 (_2!4664 lt!159631)))))))

(assert (= (and d!33914 res!88514) b!107427))

(assert (= (and b!107427 res!88515) b!107428))

(declare-fun m!158765 () Bool)

(assert (=> d!33914 m!158765))

(assert (=> d!33914 m!157917))

(assert (=> b!107033 d!33914))

(assert (=> b!107033 d!33768))

(declare-fun d!33916 () Bool)

(declare-fun e!70302 () Bool)

(assert (=> d!33916 e!70302))

(declare-fun res!88516 () Bool)

(assert (=> d!33916 (=> (not res!88516) (not e!70302))))

(declare-fun lt!160732 () (_ BitVec 64))

(declare-fun lt!160731 () BitStream!3952)

(assert (=> d!33916 (= res!88516 (= (bvadd lt!160732 (bvsub (bitIndex!0 (size!2239 (buf!2621 (_2!4664 lt!159631))) (currentByte!5139 (_2!4664 lt!159631)) (currentBit!5134 (_2!4664 lt!159631))) lt!159627)) (bitIndex!0 (size!2239 (buf!2621 lt!160731)) (currentByte!5139 lt!160731) (currentBit!5134 lt!160731))))))

(assert (=> d!33916 (or (not (= (bvand lt!160732 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2239 (buf!2621 (_2!4664 lt!159631))) (currentByte!5139 (_2!4664 lt!159631)) (currentBit!5134 (_2!4664 lt!159631))) lt!159627) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!160732 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!160732 (bvsub (bitIndex!0 (size!2239 (buf!2621 (_2!4664 lt!159631))) (currentByte!5139 (_2!4664 lt!159631)) (currentBit!5134 (_2!4664 lt!159631))) lt!159627)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33916 (= lt!160732 (bitIndex!0 (size!2239 (buf!2621 (_2!4665 lt!159641))) (currentByte!5139 (_2!4665 lt!159641)) (currentBit!5134 (_2!4665 lt!159641))))))

(assert (=> d!33916 (= lt!160731 (_2!4664 (moveBitIndex!0 (_2!4665 lt!159641) (bvsub (bitIndex!0 (size!2239 (buf!2621 (_2!4664 lt!159631))) (currentByte!5139 (_2!4664 lt!159631)) (currentBit!5134 (_2!4664 lt!159631))) lt!159627))))))

(assert (=> d!33916 (moveBitIndexPrecond!0 (_2!4665 lt!159641) (bvsub (bitIndex!0 (size!2239 (buf!2621 (_2!4664 lt!159631))) (currentByte!5139 (_2!4664 lt!159631)) (currentBit!5134 (_2!4664 lt!159631))) lt!159627))))

(assert (=> d!33916 (= (withMovedBitIndex!0 (_2!4665 lt!159641) (bvsub (bitIndex!0 (size!2239 (buf!2621 (_2!4664 lt!159631))) (currentByte!5139 (_2!4664 lt!159631)) (currentBit!5134 (_2!4664 lt!159631))) lt!159627)) lt!160731)))

(declare-fun b!107429 () Bool)

(assert (=> b!107429 (= e!70302 (= (size!2239 (buf!2621 (_2!4665 lt!159641))) (size!2239 (buf!2621 lt!160731))))))

(assert (= (and d!33916 res!88516) b!107429))

(declare-fun m!158767 () Bool)

(assert (=> d!33916 m!158767))

(declare-fun m!158769 () Bool)

(assert (=> d!33916 m!158769))

(declare-fun m!158771 () Bool)

(assert (=> d!33916 m!158771))

(declare-fun m!158773 () Bool)

(assert (=> d!33916 m!158773))

(assert (=> b!107024 d!33916))

(assert (=> b!107024 d!33914))

(declare-fun d!33918 () Bool)

(declare-fun res!88517 () Bool)

(declare-fun e!70304 () Bool)

(assert (=> d!33918 (=> (not res!88517) (not e!70304))))

(assert (=> d!33918 (= res!88517 (= (size!2239 (buf!2621 thiss!1305)) (size!2239 (buf!2621 (_2!4664 lt!159631)))))))

(assert (=> d!33918 (= (isPrefixOf!0 thiss!1305 (_2!4664 lt!159631)) e!70304)))

(declare-fun b!107430 () Bool)

(declare-fun res!88518 () Bool)

(assert (=> b!107430 (=> (not res!88518) (not e!70304))))

(assert (=> b!107430 (= res!88518 (bvsle (bitIndex!0 (size!2239 (buf!2621 thiss!1305)) (currentByte!5139 thiss!1305) (currentBit!5134 thiss!1305)) (bitIndex!0 (size!2239 (buf!2621 (_2!4664 lt!159631))) (currentByte!5139 (_2!4664 lt!159631)) (currentBit!5134 (_2!4664 lt!159631)))))))

(declare-fun b!107431 () Bool)

(declare-fun e!70303 () Bool)

(assert (=> b!107431 (= e!70304 e!70303)))

(declare-fun res!88519 () Bool)

(assert (=> b!107431 (=> res!88519 e!70303)))

(assert (=> b!107431 (= res!88519 (= (size!2239 (buf!2621 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!107432 () Bool)

(assert (=> b!107432 (= e!70303 (arrayBitRangesEq!0 (buf!2621 thiss!1305) (buf!2621 (_2!4664 lt!159631)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2239 (buf!2621 thiss!1305)) (currentByte!5139 thiss!1305) (currentBit!5134 thiss!1305))))))

(assert (= (and d!33918 res!88517) b!107430))

(assert (= (and b!107430 res!88518) b!107431))

(assert (= (and b!107431 (not res!88519)) b!107432))

(assert (=> b!107430 m!157909))

(assert (=> b!107430 m!157905))

(assert (=> b!107432 m!157909))

(assert (=> b!107432 m!157909))

(declare-fun m!158775 () Bool)

(assert (=> b!107432 m!158775))

(assert (=> b!107030 d!33918))

(declare-fun d!33920 () Bool)

(declare-fun lt!160736 () tuple2!8844)

(assert (=> d!33920 (= lt!160736 (readBit!0 (readerFrom!0 (_2!4664 lt!159631) (currentBit!5134 thiss!1305) (currentByte!5139 thiss!1305))))))

(assert (=> d!33920 (= (readBitPure!0 (readerFrom!0 (_2!4664 lt!159631) (currentBit!5134 thiss!1305) (currentByte!5139 thiss!1305))) (tuple2!8813 (_2!4679 lt!160736) (_1!4679 lt!160736)))))

(declare-fun bs!8274 () Bool)

(assert (= bs!8274 d!33920))

(assert (=> bs!8274 m!157929))

(declare-fun m!158777 () Bool)

(assert (=> bs!8274 m!158777))

(assert (=> b!107020 d!33920))

(declare-fun d!33922 () Bool)

(declare-fun e!70309 () Bool)

(assert (=> d!33922 e!70309))

(declare-fun res!88526 () Bool)

(assert (=> d!33922 (=> (not res!88526) (not e!70309))))

(assert (=> d!33922 (= res!88526 (invariant!0 (currentBit!5134 (_2!4664 lt!159631)) (currentByte!5139 (_2!4664 lt!159631)) (size!2239 (buf!2621 (_2!4664 lt!159631)))))))

(assert (=> d!33922 (= (readerFrom!0 (_2!4664 lt!159631) (currentBit!5134 thiss!1305) (currentByte!5139 thiss!1305)) (BitStream!3953 (buf!2621 (_2!4664 lt!159631)) (currentByte!5139 thiss!1305) (currentBit!5134 thiss!1305)))))

(declare-fun b!107440 () Bool)

(assert (=> b!107440 (= e!70309 (invariant!0 (currentBit!5134 thiss!1305) (currentByte!5139 thiss!1305) (size!2239 (buf!2621 (_2!4664 lt!159631)))))))

(assert (= (and d!33922 res!88526) b!107440))

(assert (=> d!33922 m!157917))

(assert (=> b!107440 m!157973))

(assert (=> b!107020 d!33922))

(declare-fun d!33932 () Bool)

(assert (=> d!33932 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2239 (buf!2621 thiss!1305))) ((_ sign_extend 32) (currentByte!5139 thiss!1305)) ((_ sign_extend 32) (currentBit!5134 thiss!1305)) lt!159625) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2239 (buf!2621 thiss!1305))) ((_ sign_extend 32) (currentByte!5139 thiss!1305)) ((_ sign_extend 32) (currentBit!5134 thiss!1305))) lt!159625))))

(declare-fun bs!8278 () Bool)

(assert (= bs!8278 d!33932))

(assert (=> bs!8278 m!158163))

(assert (=> b!107031 d!33932))

(declare-fun d!33934 () Bool)

(assert (=> d!33934 (= (invariant!0 (currentBit!5134 thiss!1305) (currentByte!5139 thiss!1305) (size!2239 (buf!2621 (_2!4664 lt!159618)))) (and (bvsge (currentBit!5134 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5134 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5139 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5139 thiss!1305) (size!2239 (buf!2621 (_2!4664 lt!159618)))) (and (= (currentBit!5134 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5139 thiss!1305) (size!2239 (buf!2621 (_2!4664 lt!159618))))))))))

(assert (=> b!107021 d!33934))

(declare-fun d!33936 () Bool)

(assert (=> d!33936 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5134 thiss!1305) (currentByte!5139 thiss!1305) (size!2239 (buf!2621 thiss!1305))))))

(declare-fun bs!8279 () Bool)

(assert (= bs!8279 d!33936))

(assert (=> bs!8279 m!158165))

(assert (=> start!21238 d!33936))

(declare-fun d!33938 () Bool)

(assert (=> d!33938 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!107028 d!33938))

(declare-fun d!33940 () Bool)

(assert (=> d!33940 (= (array_inv!2041 (buf!2621 thiss!1305)) (bvsge (size!2239 (buf!2621 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!107029 d!33940))

(push 1)

(assert (not d!33932))

(assert (not b!107332))

(assert (not d!33866))

(assert (not b!107325))

(assert (not b!107329))

(assert (not b!107409))

(assert (not bm!1353))

(assert (not d!33876))

(assert (not b!107362))

(assert (not d!33892))

(assert (not b!107440))

(assert (not d!33754))

(assert (not d!33768))

(assert (not b!107335))

(assert (not b!107424))

(assert (not d!33922))

(assert (not b!107363))

(assert (not d!33882))

(assert (not d!33776))

(assert (not b!107334))

(assert (not d!33914))

(assert (not b!107422))

(assert (not d!33936))

(assert (not d!33748))

(assert (not b!107336))

(assert (not b!107324))

(assert (not b!107408))

(assert (not d!33880))

(assert (not d!33896))

(assert (not d!33772))

(assert (not b!107361))

(assert (not b!107326))

(assert (not d!33894))

(assert (not d!33872))

(assert (not d!33770))

(assert (not b!107331))

(assert (not d!33778))

(assert (not d!33868))

(assert (not d!33920))

(assert (not d!33750))

(assert (not d!33870))

(assert (not b!107365))

(assert (not b!107380))

(assert (not d!33878))

(assert (not b!107381))

(assert (not d!33916))

(assert (not d!33910))

(assert (not b!107382))

(assert (not b!107432))

(assert (not b!107384))

(assert (not d!33874))

(assert (not b!107410))

(assert (not b!107430))

(assert (not d!33884))

(assert (not b!107407))

(assert (not d!33766))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

