; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21592 () Bool)

(assert start!21592)

(declare-fun b!108666 () Bool)

(declare-fun e!71128 () Bool)

(declare-fun e!71129 () Bool)

(assert (=> b!108666 (= e!71128 e!71129)))

(declare-fun res!89596 () Bool)

(assert (=> b!108666 (=> (not res!89596) (not e!71129))))

(declare-datatypes ((array!4955 0))(
  ( (array!4956 (arr!2847 (Array (_ BitVec 32) (_ BitVec 8))) (size!2254 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3982 0))(
  ( (BitStream!3983 (buf!2645 array!4955) (currentByte!5181 (_ BitVec 32)) (currentBit!5176 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3982)

(declare-fun lt!163863 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!108666 (= res!89596 (validate_offset_bits!1 ((_ sign_extend 32) (size!2254 (buf!2645 thiss!1305))) ((_ sign_extend 32) (currentByte!5181 thiss!1305)) ((_ sign_extend 32) (currentBit!5176 thiss!1305)) lt!163863))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!108666 (= lt!163863 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!108667 () Bool)

(declare-fun res!89600 () Bool)

(declare-fun e!71134 () Bool)

(assert (=> b!108667 (=> (not res!89600) (not e!71134))))

(declare-datatypes ((Unit!6649 0))(
  ( (Unit!6650) )
))
(declare-datatypes ((tuple2!8964 0))(
  ( (tuple2!8965 (_1!4739 Unit!6649) (_2!4739 BitStream!3982)) )
))
(declare-fun lt!163885 () tuple2!8964)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!108667 (= res!89600 (invariant!0 (currentBit!5176 thiss!1305) (currentByte!5181 thiss!1305) (size!2254 (buf!2645 (_2!4739 lt!163885)))))))

(declare-fun b!108668 () Bool)

(declare-fun e!71127 () Bool)

(declare-datatypes ((tuple2!8966 0))(
  ( (tuple2!8967 (_1!4740 BitStream!3982) (_2!4740 Bool)) )
))
(declare-fun lt!163868 () tuple2!8966)

(declare-fun lt!163864 () tuple2!8966)

(assert (=> b!108668 (= e!71127 (= (_2!4740 lt!163868) (_2!4740 lt!163864)))))

(declare-fun b!108670 () Bool)

(declare-fun lt!163874 () tuple2!8964)

(assert (=> b!108670 (= e!71134 (invariant!0 (currentBit!5176 thiss!1305) (currentByte!5181 thiss!1305) (size!2254 (buf!2645 (_2!4739 lt!163874)))))))

(declare-fun b!108671 () Bool)

(declare-fun res!89601 () Bool)

(declare-fun e!71132 () Bool)

(assert (=> b!108671 (=> (not res!89601) (not e!71132))))

(declare-fun isPrefixOf!0 (BitStream!3982 BitStream!3982) Bool)

(assert (=> b!108671 (= res!89601 (isPrefixOf!0 thiss!1305 (_2!4739 lt!163885)))))

(declare-fun b!108672 () Bool)

(declare-fun res!89595 () Bool)

(assert (=> b!108672 (=> (not res!89595) (not e!71129))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!108672 (= res!89595 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-datatypes ((tuple2!8968 0))(
  ( (tuple2!8969 (_1!4741 BitStream!3982) (_2!4741 (_ BitVec 64))) )
))
(declare-fun lt!163878 () tuple2!8968)

(declare-fun lt!163862 () (_ BitVec 64))

(declare-fun lt!163877 () tuple2!8968)

(declare-fun b!108673 () Bool)

(declare-fun lt!163886 () (_ BitVec 64))

(declare-datatypes ((tuple2!8970 0))(
  ( (tuple2!8971 (_1!4742 BitStream!3982) (_2!4742 BitStream!3982)) )
))
(declare-fun lt!163881 () tuple2!8970)

(declare-fun lt!163883 () BitStream!3982)

(declare-fun e!71133 () Bool)

(declare-fun lt!163876 () tuple2!8970)

(assert (=> b!108673 (= e!71133 (and (= lt!163862 (bvsub lt!163886 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!4742 lt!163876) lt!163883)) (and (= (_2!4741 lt!163878) (_2!4741 lt!163877)) (= (_1!4741 lt!163878) (_2!4742 lt!163881))))))))

(declare-fun b!108674 () Bool)

(declare-fun e!71125 () Bool)

(assert (=> b!108674 (= e!71129 (not e!71125))))

(declare-fun res!89602 () Bool)

(assert (=> b!108674 (=> res!89602 e!71125)))

(assert (=> b!108674 (= res!89602 (not (= (_1!4741 lt!163877) (_2!4742 lt!163876))))))

(declare-fun lt!163869 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3982 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8968)

(assert (=> b!108674 (= lt!163877 (readNLeastSignificantBitsLoopPure!0 (_1!4742 lt!163876) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!163869))))

(declare-fun lt!163875 () (_ BitVec 64))

(assert (=> b!108674 (validate_offset_bits!1 ((_ sign_extend 32) (size!2254 (buf!2645 (_2!4739 lt!163874)))) ((_ sign_extend 32) (currentByte!5181 (_2!4739 lt!163885))) ((_ sign_extend 32) (currentBit!5176 (_2!4739 lt!163885))) lt!163875)))

(declare-fun lt!163871 () Unit!6649)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3982 array!4955 (_ BitVec 64)) Unit!6649)

(assert (=> b!108674 (= lt!163871 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4739 lt!163885) (buf!2645 (_2!4739 lt!163874)) lt!163875))))

(assert (=> b!108674 (= lt!163875 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!163872 () tuple2!8966)

(declare-fun lt!163861 () (_ BitVec 64))

(declare-fun lt!163884 () (_ BitVec 64))

(assert (=> b!108674 (= lt!163869 (bvor lt!163861 (ite (_2!4740 lt!163872) lt!163884 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108674 (= lt!163878 (readNLeastSignificantBitsLoopPure!0 (_1!4742 lt!163881) nBits!396 i!615 lt!163861))))

(assert (=> b!108674 (validate_offset_bits!1 ((_ sign_extend 32) (size!2254 (buf!2645 (_2!4739 lt!163874)))) ((_ sign_extend 32) (currentByte!5181 thiss!1305)) ((_ sign_extend 32) (currentBit!5176 thiss!1305)) lt!163863)))

(declare-fun lt!163870 () Unit!6649)

(assert (=> b!108674 (= lt!163870 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2645 (_2!4739 lt!163874)) lt!163863))))

(assert (=> b!108674 (= lt!163861 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!163889 () Bool)

(assert (=> b!108674 (= (_2!4740 lt!163872) lt!163889)))

(declare-fun readBitPure!0 (BitStream!3982) tuple2!8966)

(assert (=> b!108674 (= lt!163872 (readBitPure!0 (_1!4742 lt!163881)))))

(declare-fun reader!0 (BitStream!3982 BitStream!3982) tuple2!8970)

(assert (=> b!108674 (= lt!163876 (reader!0 (_2!4739 lt!163885) (_2!4739 lt!163874)))))

(assert (=> b!108674 (= lt!163881 (reader!0 thiss!1305 (_2!4739 lt!163874)))))

(assert (=> b!108674 e!71127))

(declare-fun res!89598 () Bool)

(assert (=> b!108674 (=> (not res!89598) (not e!71127))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!108674 (= res!89598 (= (bitIndex!0 (size!2254 (buf!2645 (_1!4740 lt!163868))) (currentByte!5181 (_1!4740 lt!163868)) (currentBit!5176 (_1!4740 lt!163868))) (bitIndex!0 (size!2254 (buf!2645 (_1!4740 lt!163864))) (currentByte!5181 (_1!4740 lt!163864)) (currentBit!5176 (_1!4740 lt!163864)))))))

(declare-fun lt!163866 () Unit!6649)

(declare-fun lt!163882 () BitStream!3982)

(declare-fun readBitPrefixLemma!0 (BitStream!3982 BitStream!3982) Unit!6649)

(assert (=> b!108674 (= lt!163866 (readBitPrefixLemma!0 lt!163882 (_2!4739 lt!163874)))))

(assert (=> b!108674 (= lt!163864 (readBitPure!0 (BitStream!3983 (buf!2645 (_2!4739 lt!163874)) (currentByte!5181 thiss!1305) (currentBit!5176 thiss!1305))))))

(assert (=> b!108674 (= lt!163868 (readBitPure!0 lt!163882))))

(assert (=> b!108674 (= lt!163882 (BitStream!3983 (buf!2645 (_2!4739 lt!163885)) (currentByte!5181 thiss!1305) (currentBit!5176 thiss!1305)))))

(assert (=> b!108674 e!71134))

(declare-fun res!89590 () Bool)

(assert (=> b!108674 (=> (not res!89590) (not e!71134))))

(assert (=> b!108674 (= res!89590 (isPrefixOf!0 thiss!1305 (_2!4739 lt!163874)))))

(declare-fun lt!163880 () Unit!6649)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3982 BitStream!3982 BitStream!3982) Unit!6649)

(assert (=> b!108674 (= lt!163880 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4739 lt!163885) (_2!4739 lt!163874)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3982 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8964)

(assert (=> b!108674 (= lt!163874 (appendNLeastSignificantBitsLoop!0 (_2!4739 lt!163885) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!71135 () Bool)

(assert (=> b!108674 e!71135))

(declare-fun res!89594 () Bool)

(assert (=> b!108674 (=> (not res!89594) (not e!71135))))

(assert (=> b!108674 (= res!89594 (= (size!2254 (buf!2645 thiss!1305)) (size!2254 (buf!2645 (_2!4739 lt!163885)))))))

(declare-fun appendBit!0 (BitStream!3982 Bool) tuple2!8964)

(assert (=> b!108674 (= lt!163885 (appendBit!0 thiss!1305 lt!163889))))

(assert (=> b!108674 (= lt!163889 (not (= (bvand v!199 lt!163884) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108674 (= lt!163884 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!108675 () Bool)

(declare-fun lt!163888 () (_ BitVec 64))

(assert (=> b!108675 (= e!71125 (or (not (= (_1!4742 lt!163876) lt!163883)) (not (= (size!2254 (buf!2645 thiss!1305)) (size!2254 (buf!2645 (_2!4739 lt!163874))))) (not (= lt!163888 (bvadd lt!163862 lt!163863))) (bvsle (bvsub nBits!396 i!615) #b00000000000000000000000001000000)))))

(assert (=> b!108675 e!71133))

(declare-fun res!89591 () Bool)

(assert (=> b!108675 (=> (not res!89591) (not e!71133))))

(declare-fun withMovedBitIndex!0 (BitStream!3982 (_ BitVec 64)) BitStream!3982)

(assert (=> b!108675 (= res!89591 (= (_1!4742 lt!163876) (withMovedBitIndex!0 (_2!4742 lt!163876) (bvsub lt!163886 lt!163888))))))

(assert (=> b!108675 (= lt!163886 (bitIndex!0 (size!2254 (buf!2645 (_2!4739 lt!163885))) (currentByte!5181 (_2!4739 lt!163885)) (currentBit!5176 (_2!4739 lt!163885))))))

(assert (=> b!108675 (= (_1!4742 lt!163881) (withMovedBitIndex!0 (_2!4742 lt!163881) (bvsub lt!163862 lt!163888)))))

(assert (=> b!108675 (= lt!163888 (bitIndex!0 (size!2254 (buf!2645 (_2!4739 lt!163874))) (currentByte!5181 (_2!4739 lt!163874)) (currentBit!5176 (_2!4739 lt!163874))))))

(assert (=> b!108675 (= lt!163862 (bitIndex!0 (size!2254 (buf!2645 thiss!1305)) (currentByte!5181 thiss!1305) (currentBit!5176 thiss!1305)))))

(declare-fun lt!163879 () tuple2!8968)

(assert (=> b!108675 (and (= (_2!4741 lt!163878) (_2!4741 lt!163879)) (= (_1!4741 lt!163878) (_1!4741 lt!163879)))))

(declare-fun lt!163867 () Unit!6649)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3982 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6649)

(assert (=> b!108675 (= lt!163867 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4742 lt!163881) nBits!396 i!615 lt!163861))))

(assert (=> b!108675 (= lt!163879 (readNLeastSignificantBitsLoopPure!0 lt!163883 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!163869))))

(assert (=> b!108675 (= lt!163883 (withMovedBitIndex!0 (_1!4742 lt!163881) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!108676 () Bool)

(assert (=> b!108676 (= e!71135 e!71132)))

(declare-fun res!89599 () Bool)

(assert (=> b!108676 (=> (not res!89599) (not e!71132))))

(declare-fun lt!163873 () (_ BitVec 64))

(declare-fun lt!163865 () (_ BitVec 64))

(assert (=> b!108676 (= res!89599 (= lt!163873 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!163865)))))

(assert (=> b!108676 (= lt!163873 (bitIndex!0 (size!2254 (buf!2645 (_2!4739 lt!163885))) (currentByte!5181 (_2!4739 lt!163885)) (currentBit!5176 (_2!4739 lt!163885))))))

(assert (=> b!108676 (= lt!163865 (bitIndex!0 (size!2254 (buf!2645 thiss!1305)) (currentByte!5181 thiss!1305) (currentBit!5176 thiss!1305)))))

(declare-fun b!108677 () Bool)

(declare-fun e!71130 () Bool)

(declare-fun array_inv!2056 (array!4955) Bool)

(assert (=> b!108677 (= e!71130 (array_inv!2056 (buf!2645 thiss!1305)))))

(declare-fun res!89593 () Bool)

(assert (=> start!21592 (=> (not res!89593) (not e!71128))))

(assert (=> start!21592 (= res!89593 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21592 e!71128))

(assert (=> start!21592 true))

(declare-fun inv!12 (BitStream!3982) Bool)

(assert (=> start!21592 (and (inv!12 thiss!1305) e!71130)))

(declare-fun b!108669 () Bool)

(declare-fun res!89592 () Bool)

(assert (=> b!108669 (=> (not res!89592) (not e!71129))))

(assert (=> b!108669 (= res!89592 (bvslt i!615 nBits!396))))

(declare-fun b!108678 () Bool)

(declare-fun e!71126 () Bool)

(assert (=> b!108678 (= e!71132 e!71126)))

(declare-fun res!89597 () Bool)

(assert (=> b!108678 (=> (not res!89597) (not e!71126))))

(declare-fun lt!163887 () tuple2!8966)

(assert (=> b!108678 (= res!89597 (and (= (_2!4740 lt!163887) lt!163889) (= (_1!4740 lt!163887) (_2!4739 lt!163885))))))

(declare-fun readerFrom!0 (BitStream!3982 (_ BitVec 32) (_ BitVec 32)) BitStream!3982)

(assert (=> b!108678 (= lt!163887 (readBitPure!0 (readerFrom!0 (_2!4739 lt!163885) (currentBit!5176 thiss!1305) (currentByte!5181 thiss!1305))))))

(declare-fun b!108679 () Bool)

(assert (=> b!108679 (= e!71126 (= (bitIndex!0 (size!2254 (buf!2645 (_1!4740 lt!163887))) (currentByte!5181 (_1!4740 lt!163887)) (currentBit!5176 (_1!4740 lt!163887))) lt!163873))))

(assert (= (and start!21592 res!89593) b!108666))

(assert (= (and b!108666 res!89596) b!108672))

(assert (= (and b!108672 res!89595) b!108669))

(assert (= (and b!108669 res!89592) b!108674))

(assert (= (and b!108674 res!89594) b!108676))

(assert (= (and b!108676 res!89599) b!108671))

(assert (= (and b!108671 res!89601) b!108678))

(assert (= (and b!108678 res!89597) b!108679))

(assert (= (and b!108674 res!89590) b!108667))

(assert (= (and b!108667 res!89600) b!108670))

(assert (= (and b!108674 res!89598) b!108668))

(assert (= (and b!108674 (not res!89602)) b!108675))

(assert (= (and b!108675 res!89591) b!108673))

(assert (= start!21592 b!108677))

(declare-fun m!161099 () Bool)

(assert (=> b!108677 m!161099))

(declare-fun m!161101 () Bool)

(assert (=> b!108674 m!161101))

(declare-fun m!161103 () Bool)

(assert (=> b!108674 m!161103))

(declare-fun m!161105 () Bool)

(assert (=> b!108674 m!161105))

(declare-fun m!161107 () Bool)

(assert (=> b!108674 m!161107))

(declare-fun m!161109 () Bool)

(assert (=> b!108674 m!161109))

(declare-fun m!161111 () Bool)

(assert (=> b!108674 m!161111))

(declare-fun m!161113 () Bool)

(assert (=> b!108674 m!161113))

(declare-fun m!161115 () Bool)

(assert (=> b!108674 m!161115))

(declare-fun m!161117 () Bool)

(assert (=> b!108674 m!161117))

(declare-fun m!161119 () Bool)

(assert (=> b!108674 m!161119))

(declare-fun m!161121 () Bool)

(assert (=> b!108674 m!161121))

(declare-fun m!161123 () Bool)

(assert (=> b!108674 m!161123))

(declare-fun m!161125 () Bool)

(assert (=> b!108674 m!161125))

(declare-fun m!161127 () Bool)

(assert (=> b!108674 m!161127))

(declare-fun m!161129 () Bool)

(assert (=> b!108674 m!161129))

(declare-fun m!161131 () Bool)

(assert (=> b!108674 m!161131))

(declare-fun m!161133 () Bool)

(assert (=> b!108674 m!161133))

(declare-fun m!161135 () Bool)

(assert (=> b!108674 m!161135))

(declare-fun m!161137 () Bool)

(assert (=> b!108674 m!161137))

(declare-fun m!161139 () Bool)

(assert (=> b!108672 m!161139))

(declare-fun m!161141 () Bool)

(assert (=> b!108675 m!161141))

(declare-fun m!161143 () Bool)

(assert (=> b!108675 m!161143))

(declare-fun m!161145 () Bool)

(assert (=> b!108675 m!161145))

(declare-fun m!161147 () Bool)

(assert (=> b!108675 m!161147))

(declare-fun m!161149 () Bool)

(assert (=> b!108675 m!161149))

(declare-fun m!161151 () Bool)

(assert (=> b!108675 m!161151))

(declare-fun m!161153 () Bool)

(assert (=> b!108675 m!161153))

(declare-fun m!161155 () Bool)

(assert (=> b!108675 m!161155))

(declare-fun m!161157 () Bool)

(assert (=> start!21592 m!161157))

(declare-fun m!161159 () Bool)

(assert (=> b!108678 m!161159))

(assert (=> b!108678 m!161159))

(declare-fun m!161161 () Bool)

(assert (=> b!108678 m!161161))

(declare-fun m!161163 () Bool)

(assert (=> b!108667 m!161163))

(assert (=> b!108676 m!161153))

(assert (=> b!108676 m!161145))

(declare-fun m!161165 () Bool)

(assert (=> b!108671 m!161165))

(declare-fun m!161167 () Bool)

(assert (=> b!108666 m!161167))

(declare-fun m!161169 () Bool)

(assert (=> b!108670 m!161169))

(declare-fun m!161171 () Bool)

(assert (=> b!108679 m!161171))

(push 1)

(assert (not b!108671))

(assert (not b!108674))

(assert (not b!108672))

(assert (not b!108666))

(assert (not b!108675))

(assert (not b!108676))

(assert (not b!108670))

(assert (not b!108679))

(assert (not b!108667))

(assert (not b!108678))

(assert (not b!108677))

(assert (not start!21592))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

