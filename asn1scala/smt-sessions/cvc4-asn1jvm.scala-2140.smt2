; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54316 () Bool)

(assert start!54316)

(declare-fun b!253802 () Bool)

(declare-fun res!212674 () Bool)

(declare-fun e!175869 () Bool)

(assert (=> b!253802 (=> (not res!212674) (not e!175869))))

(declare-datatypes ((array!13751 0))(
  ( (array!13752 (arr!7020 (Array (_ BitVec 32) (_ BitVec 8))) (size!6033 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10988 0))(
  ( (BitStream!10989 (buf!6541 array!13751) (currentByte!12005 (_ BitVec 32)) (currentBit!12000 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!18241 0))(
  ( (Unit!18242) )
))
(declare-datatypes ((tuple2!21774 0))(
  ( (tuple2!21775 (_1!11818 Unit!18241) (_2!11818 BitStream!10988)) )
))
(declare-fun lt!394114 () tuple2!21774)

(declare-fun lt!394112 () tuple2!21774)

(declare-fun isPrefixOf!0 (BitStream!10988 BitStream!10988) Bool)

(assert (=> b!253802 (= res!212674 (isPrefixOf!0 (_2!11818 lt!394114) (_2!11818 lt!394112)))))

(declare-fun res!212672 () Bool)

(declare-fun e!175868 () Bool)

(assert (=> start!54316 (=> (not res!212672) (not e!175868))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!54316 (= res!212672 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54316 e!175868))

(assert (=> start!54316 true))

(declare-fun thiss!1005 () BitStream!10988)

(declare-fun e!175864 () Bool)

(declare-fun inv!12 (BitStream!10988) Bool)

(assert (=> start!54316 (and (inv!12 thiss!1005) e!175864)))

(declare-fun b!253803 () Bool)

(declare-fun e!175866 () Bool)

(declare-datatypes ((tuple2!21776 0))(
  ( (tuple2!21777 (_1!11819 BitStream!10988) (_2!11819 Bool)) )
))
(declare-fun lt!394118 () tuple2!21776)

(declare-fun lt!394124 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!253803 (= e!175866 (= (bitIndex!0 (size!6033 (buf!6541 (_1!11819 lt!394118))) (currentByte!12005 (_1!11819 lt!394118)) (currentBit!12000 (_1!11819 lt!394118))) lt!394124))))

(declare-fun b!253804 () Bool)

(declare-fun array_inv!5774 (array!13751) Bool)

(assert (=> b!253804 (= e!175864 (array_inv!5774 (buf!6541 thiss!1005)))))

(declare-fun b!253805 () Bool)

(declare-fun e!175867 () Bool)

(declare-fun lt!394117 () tuple2!21776)

(declare-fun lt!394110 () tuple2!21776)

(assert (=> b!253805 (= e!175867 (= (_2!11819 lt!394117) (_2!11819 lt!394110)))))

(declare-fun b!253806 () Bool)

(declare-fun res!212670 () Bool)

(assert (=> b!253806 (=> (not res!212670) (not e!175868))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!253806 (= res!212670 (validate_offset_bits!1 ((_ sign_extend 32) (size!6033 (buf!6541 thiss!1005))) ((_ sign_extend 32) (currentByte!12005 thiss!1005)) ((_ sign_extend 32) (currentBit!12000 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!253807 () Bool)

(declare-fun e!175870 () Bool)

(declare-fun lt!394125 () tuple2!21776)

(declare-datatypes ((tuple2!21778 0))(
  ( (tuple2!21779 (_1!11820 BitStream!10988) (_2!11820 BitStream!10988)) )
))
(declare-fun lt!394119 () tuple2!21778)

(assert (=> b!253807 (= e!175870 (= (_1!11819 lt!394125) (_2!11820 lt!394119)))))

(declare-fun lt!394121 () tuple2!21776)

(assert (=> b!253807 (= (_2!11819 lt!394125) (_2!11819 lt!394121))))

(declare-fun b!253808 () Bool)

(declare-fun res!212676 () Bool)

(declare-fun e!175865 () Bool)

(assert (=> b!253808 (=> (not res!212676) (not e!175865))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!253808 (= res!212676 (invariant!0 (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005) (size!6033 (buf!6541 (_2!11818 lt!394114)))))))

(declare-fun b!253809 () Bool)

(assert (=> b!253809 (= e!175865 (invariant!0 (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005) (size!6033 (buf!6541 (_2!11818 lt!394112)))))))

(declare-fun b!253810 () Bool)

(declare-fun res!212671 () Bool)

(assert (=> b!253810 (=> (not res!212671) (not e!175868))))

(assert (=> b!253810 (= res!212671 (bvslt from!289 nBits!297))))

(declare-fun b!253811 () Bool)

(declare-fun lt!394123 () tuple2!21776)

(declare-fun lt!394113 () tuple2!21778)

(assert (=> b!253811 (= e!175869 (not (or (not (_2!11819 lt!394123)) (not (= (_1!11819 lt!394123) (_2!11820 lt!394113))))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10988 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21776)

(assert (=> b!253811 (= lt!394123 (checkBitsLoopPure!0 (_1!11820 lt!394113) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!394129 () (_ BitVec 64))

(assert (=> b!253811 (validate_offset_bits!1 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394112)))) ((_ sign_extend 32) (currentByte!12005 (_2!11818 lt!394114))) ((_ sign_extend 32) (currentBit!12000 (_2!11818 lt!394114))) lt!394129)))

(declare-fun lt!394127 () Unit!18241)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10988 array!13751 (_ BitVec 64)) Unit!18241)

(assert (=> b!253811 (= lt!394127 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11818 lt!394114) (buf!6541 (_2!11818 lt!394112)) lt!394129))))

(declare-fun reader!0 (BitStream!10988 BitStream!10988) tuple2!21778)

(assert (=> b!253811 (= lt!394113 (reader!0 (_2!11818 lt!394114) (_2!11818 lt!394112)))))

(declare-fun b!253812 () Bool)

(assert (=> b!253812 (= e!175868 (not e!175870))))

(declare-fun res!212675 () Bool)

(assert (=> b!253812 (=> res!212675 e!175870)))

(declare-fun lt!394126 () tuple2!21778)

(assert (=> b!253812 (= res!212675 (not (= (_1!11819 lt!394121) (_2!11820 lt!394126))))))

(assert (=> b!253812 (= lt!394121 (checkBitsLoopPure!0 (_1!11820 lt!394126) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!394130 () (_ BitVec 64))

(assert (=> b!253812 (validate_offset_bits!1 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394112)))) ((_ sign_extend 32) (currentByte!12005 (_2!11818 lt!394114))) ((_ sign_extend 32) (currentBit!12000 (_2!11818 lt!394114))) lt!394130)))

(declare-fun lt!394122 () Unit!18241)

(assert (=> b!253812 (= lt!394122 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11818 lt!394114) (buf!6541 (_2!11818 lt!394112)) lt!394130))))

(assert (=> b!253812 (= lt!394125 (checkBitsLoopPure!0 (_1!11820 lt!394119) nBits!297 bit!26 from!289))))

(assert (=> b!253812 (validate_offset_bits!1 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394112)))) ((_ sign_extend 32) (currentByte!12005 thiss!1005)) ((_ sign_extend 32) (currentBit!12000 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!394120 () Unit!18241)

(assert (=> b!253812 (= lt!394120 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6541 (_2!11818 lt!394112)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!10988) tuple2!21776)

(assert (=> b!253812 (= (_2!11819 (readBitPure!0 (_1!11820 lt!394119))) bit!26)))

(assert (=> b!253812 (= lt!394126 (reader!0 (_2!11818 lt!394114) (_2!11818 lt!394112)))))

(assert (=> b!253812 (= lt!394119 (reader!0 thiss!1005 (_2!11818 lt!394112)))))

(assert (=> b!253812 e!175867))

(declare-fun res!212677 () Bool)

(assert (=> b!253812 (=> (not res!212677) (not e!175867))))

(assert (=> b!253812 (= res!212677 (= (bitIndex!0 (size!6033 (buf!6541 (_1!11819 lt!394117))) (currentByte!12005 (_1!11819 lt!394117)) (currentBit!12000 (_1!11819 lt!394117))) (bitIndex!0 (size!6033 (buf!6541 (_1!11819 lt!394110))) (currentByte!12005 (_1!11819 lt!394110)) (currentBit!12000 (_1!11819 lt!394110)))))))

(declare-fun lt!394116 () Unit!18241)

(declare-fun lt!394115 () BitStream!10988)

(declare-fun readBitPrefixLemma!0 (BitStream!10988 BitStream!10988) Unit!18241)

(assert (=> b!253812 (= lt!394116 (readBitPrefixLemma!0 lt!394115 (_2!11818 lt!394112)))))

(assert (=> b!253812 (= lt!394110 (readBitPure!0 (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005))))))

(assert (=> b!253812 (= lt!394117 (readBitPure!0 lt!394115))))

(assert (=> b!253812 (= lt!394115 (BitStream!10989 (buf!6541 (_2!11818 lt!394114)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005)))))

(assert (=> b!253812 e!175865))

(declare-fun res!212681 () Bool)

(assert (=> b!253812 (=> (not res!212681) (not e!175865))))

(assert (=> b!253812 (= res!212681 (isPrefixOf!0 thiss!1005 (_2!11818 lt!394112)))))

(declare-fun lt!394128 () Unit!18241)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10988 BitStream!10988 BitStream!10988) Unit!18241)

(assert (=> b!253812 (= lt!394128 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11818 lt!394114) (_2!11818 lt!394112)))))

(declare-fun e!175872 () Bool)

(assert (=> b!253812 e!175872))

(declare-fun res!212668 () Bool)

(assert (=> b!253812 (=> (not res!212668) (not e!175872))))

(assert (=> b!253812 (= res!212668 (= (size!6033 (buf!6541 (_2!11818 lt!394114))) (size!6033 (buf!6541 (_2!11818 lt!394112)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10988 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21774)

(assert (=> b!253812 (= lt!394112 (appendNBitsLoop!0 (_2!11818 lt!394114) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!253812 (validate_offset_bits!1 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394114)))) ((_ sign_extend 32) (currentByte!12005 (_2!11818 lt!394114))) ((_ sign_extend 32) (currentBit!12000 (_2!11818 lt!394114))) lt!394130)))

(assert (=> b!253812 (= lt!394130 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!394111 () Unit!18241)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10988 BitStream!10988 (_ BitVec 64) (_ BitVec 64)) Unit!18241)

(assert (=> b!253812 (= lt!394111 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11818 lt!394114) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!175874 () Bool)

(assert (=> b!253812 e!175874))

(declare-fun res!212682 () Bool)

(assert (=> b!253812 (=> (not res!212682) (not e!175874))))

(assert (=> b!253812 (= res!212682 (= (size!6033 (buf!6541 thiss!1005)) (size!6033 (buf!6541 (_2!11818 lt!394114)))))))

(declare-fun appendBit!0 (BitStream!10988 Bool) tuple2!21774)

(assert (=> b!253812 (= lt!394114 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!253813 () Bool)

(declare-fun res!212673 () Bool)

(assert (=> b!253813 (=> res!212673 e!175870)))

(declare-fun withMovedBitIndex!0 (BitStream!10988 (_ BitVec 64)) BitStream!10988)

(assert (=> b!253813 (= res!212673 (not (= (_1!11820 lt!394126) (withMovedBitIndex!0 (_1!11820 lt!394119) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!253814 () Bool)

(declare-fun res!212669 () Bool)

(declare-fun e!175873 () Bool)

(assert (=> b!253814 (=> (not res!212669) (not e!175873))))

(assert (=> b!253814 (= res!212669 (isPrefixOf!0 thiss!1005 (_2!11818 lt!394114)))))

(declare-fun b!253815 () Bool)

(assert (=> b!253815 (= e!175872 e!175869)))

(declare-fun res!212680 () Bool)

(assert (=> b!253815 (=> (not res!212680) (not e!175869))))

(assert (=> b!253815 (= res!212680 (= (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394112))) (currentByte!12005 (_2!11818 lt!394112)) (currentBit!12000 (_2!11818 lt!394112))) (bvadd (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394114))) (currentByte!12005 (_2!11818 lt!394114)) (currentBit!12000 (_2!11818 lt!394114))) lt!394129)))))

(assert (=> b!253815 (= lt!394129 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!253816 () Bool)

(assert (=> b!253816 (= e!175873 e!175866)))

(declare-fun res!212678 () Bool)

(assert (=> b!253816 (=> (not res!212678) (not e!175866))))

(assert (=> b!253816 (= res!212678 (and (= (_2!11819 lt!394118) bit!26) (= (_1!11819 lt!394118) (_2!11818 lt!394114))))))

(declare-fun readerFrom!0 (BitStream!10988 (_ BitVec 32) (_ BitVec 32)) BitStream!10988)

(assert (=> b!253816 (= lt!394118 (readBitPure!0 (readerFrom!0 (_2!11818 lt!394114) (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005))))))

(declare-fun b!253817 () Bool)

(assert (=> b!253817 (= e!175874 e!175873)))

(declare-fun res!212679 () Bool)

(assert (=> b!253817 (=> (not res!212679) (not e!175873))))

(declare-fun lt!394131 () (_ BitVec 64))

(assert (=> b!253817 (= res!212679 (= lt!394124 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!394131)))))

(assert (=> b!253817 (= lt!394124 (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394114))) (currentByte!12005 (_2!11818 lt!394114)) (currentBit!12000 (_2!11818 lt!394114))))))

(assert (=> b!253817 (= lt!394131 (bitIndex!0 (size!6033 (buf!6541 thiss!1005)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005)))))

(assert (= (and start!54316 res!212672) b!253806))

(assert (= (and b!253806 res!212670) b!253810))

(assert (= (and b!253810 res!212671) b!253812))

(assert (= (and b!253812 res!212682) b!253817))

(assert (= (and b!253817 res!212679) b!253814))

(assert (= (and b!253814 res!212669) b!253816))

(assert (= (and b!253816 res!212678) b!253803))

(assert (= (and b!253812 res!212668) b!253815))

(assert (= (and b!253815 res!212680) b!253802))

(assert (= (and b!253802 res!212674) b!253811))

(assert (= (and b!253812 res!212681) b!253808))

(assert (= (and b!253808 res!212676) b!253809))

(assert (= (and b!253812 res!212677) b!253805))

(assert (= (and b!253812 (not res!212675)) b!253813))

(assert (= (and b!253813 (not res!212673)) b!253807))

(assert (= start!54316 b!253804))

(declare-fun m!382081 () Bool)

(assert (=> start!54316 m!382081))

(declare-fun m!382083 () Bool)

(assert (=> b!253813 m!382083))

(declare-fun m!382085 () Bool)

(assert (=> b!253808 m!382085))

(declare-fun m!382087 () Bool)

(assert (=> b!253804 m!382087))

(declare-fun m!382089 () Bool)

(assert (=> b!253803 m!382089))

(declare-fun m!382091 () Bool)

(assert (=> b!253817 m!382091))

(declare-fun m!382093 () Bool)

(assert (=> b!253817 m!382093))

(declare-fun m!382095 () Bool)

(assert (=> b!253809 m!382095))

(declare-fun m!382097 () Bool)

(assert (=> b!253816 m!382097))

(assert (=> b!253816 m!382097))

(declare-fun m!382099 () Bool)

(assert (=> b!253816 m!382099))

(declare-fun m!382101 () Bool)

(assert (=> b!253815 m!382101))

(assert (=> b!253815 m!382091))

(declare-fun m!382103 () Bool)

(assert (=> b!253811 m!382103))

(declare-fun m!382105 () Bool)

(assert (=> b!253811 m!382105))

(declare-fun m!382107 () Bool)

(assert (=> b!253811 m!382107))

(declare-fun m!382109 () Bool)

(assert (=> b!253811 m!382109))

(declare-fun m!382111 () Bool)

(assert (=> b!253812 m!382111))

(declare-fun m!382113 () Bool)

(assert (=> b!253812 m!382113))

(declare-fun m!382115 () Bool)

(assert (=> b!253812 m!382115))

(declare-fun m!382117 () Bool)

(assert (=> b!253812 m!382117))

(declare-fun m!382119 () Bool)

(assert (=> b!253812 m!382119))

(declare-fun m!382121 () Bool)

(assert (=> b!253812 m!382121))

(declare-fun m!382123 () Bool)

(assert (=> b!253812 m!382123))

(declare-fun m!382125 () Bool)

(assert (=> b!253812 m!382125))

(declare-fun m!382127 () Bool)

(assert (=> b!253812 m!382127))

(declare-fun m!382129 () Bool)

(assert (=> b!253812 m!382129))

(declare-fun m!382131 () Bool)

(assert (=> b!253812 m!382131))

(assert (=> b!253812 m!382109))

(declare-fun m!382133 () Bool)

(assert (=> b!253812 m!382133))

(declare-fun m!382135 () Bool)

(assert (=> b!253812 m!382135))

(declare-fun m!382137 () Bool)

(assert (=> b!253812 m!382137))

(declare-fun m!382139 () Bool)

(assert (=> b!253812 m!382139))

(declare-fun m!382141 () Bool)

(assert (=> b!253812 m!382141))

(declare-fun m!382143 () Bool)

(assert (=> b!253812 m!382143))

(declare-fun m!382145 () Bool)

(assert (=> b!253812 m!382145))

(declare-fun m!382147 () Bool)

(assert (=> b!253812 m!382147))

(declare-fun m!382149 () Bool)

(assert (=> b!253802 m!382149))

(declare-fun m!382151 () Bool)

(assert (=> b!253814 m!382151))

(declare-fun m!382153 () Bool)

(assert (=> b!253806 m!382153))

(push 1)

(assert (not b!253817))

(assert (not start!54316))

(assert (not b!253812))

(assert (not b!253803))

(assert (not b!253808))

(assert (not b!253814))

(assert (not b!253816))

(assert (not b!253815))

(assert (not b!253813))

(assert (not b!253802))

(assert (not b!253806))

(assert (not b!253804))

(assert (not b!253809))

(assert (not b!253811))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!85080 () Bool)

(declare-fun e!175952 () Bool)

(assert (=> d!85080 e!175952))

(declare-fun res!212799 () Bool)

(assert (=> d!85080 (=> (not res!212799) (not e!175952))))

(declare-fun lt!394451 () (_ BitVec 64))

(declare-fun lt!394450 () BitStream!10988)

(assert (=> d!85080 (= res!212799 (= (bvadd lt!394451 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!6033 (buf!6541 lt!394450)) (currentByte!12005 lt!394450) (currentBit!12000 lt!394450))))))

(assert (=> d!85080 (or (not (= (bvand lt!394451 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!394451 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!394451 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85080 (= lt!394451 (bitIndex!0 (size!6033 (buf!6541 (_1!11820 lt!394119))) (currentByte!12005 (_1!11820 lt!394119)) (currentBit!12000 (_1!11820 lt!394119))))))

(declare-fun moveBitIndex!0 (BitStream!10988 (_ BitVec 64)) tuple2!21774)

(assert (=> d!85080 (= lt!394450 (_2!11818 (moveBitIndex!0 (_1!11820 lt!394119) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!10988 (_ BitVec 64)) Bool)

(assert (=> d!85080 (moveBitIndexPrecond!0 (_1!11820 lt!394119) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!85080 (= (withMovedBitIndex!0 (_1!11820 lt!394119) #b0000000000000000000000000000000000000000000000000000000000000001) lt!394450)))

(declare-fun b!253949 () Bool)

(assert (=> b!253949 (= e!175952 (= (size!6033 (buf!6541 (_1!11820 lt!394119))) (size!6033 (buf!6541 lt!394450))))))

(assert (= (and d!85080 res!212799) b!253949))

(declare-fun m!382415 () Bool)

(assert (=> d!85080 m!382415))

(declare-fun m!382417 () Bool)

(assert (=> d!85080 m!382417))

(declare-fun m!382419 () Bool)

(assert (=> d!85080 m!382419))

(declare-fun m!382421 () Bool)

(assert (=> d!85080 m!382421))

(assert (=> b!253813 d!85080))

(declare-fun d!85084 () Bool)

(declare-fun res!212806 () Bool)

(declare-fun e!175957 () Bool)

(assert (=> d!85084 (=> (not res!212806) (not e!175957))))

(assert (=> d!85084 (= res!212806 (= (size!6033 (buf!6541 (_2!11818 lt!394114))) (size!6033 (buf!6541 (_2!11818 lt!394112)))))))

(assert (=> d!85084 (= (isPrefixOf!0 (_2!11818 lt!394114) (_2!11818 lt!394112)) e!175957)))

(declare-fun b!253956 () Bool)

(declare-fun res!212808 () Bool)

(assert (=> b!253956 (=> (not res!212808) (not e!175957))))

(assert (=> b!253956 (= res!212808 (bvsle (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394114))) (currentByte!12005 (_2!11818 lt!394114)) (currentBit!12000 (_2!11818 lt!394114))) (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394112))) (currentByte!12005 (_2!11818 lt!394112)) (currentBit!12000 (_2!11818 lt!394112)))))))

(declare-fun b!253957 () Bool)

(declare-fun e!175958 () Bool)

(assert (=> b!253957 (= e!175957 e!175958)))

(declare-fun res!212807 () Bool)

(assert (=> b!253957 (=> res!212807 e!175958)))

(assert (=> b!253957 (= res!212807 (= (size!6033 (buf!6541 (_2!11818 lt!394114))) #b00000000000000000000000000000000))))

(declare-fun b!253958 () Bool)

(declare-fun arrayBitRangesEq!0 (array!13751 array!13751 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!253958 (= e!175958 (arrayBitRangesEq!0 (buf!6541 (_2!11818 lt!394114)) (buf!6541 (_2!11818 lt!394112)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394114))) (currentByte!12005 (_2!11818 lt!394114)) (currentBit!12000 (_2!11818 lt!394114)))))))

(assert (= (and d!85084 res!212806) b!253956))

(assert (= (and b!253956 res!212808) b!253957))

(assert (= (and b!253957 (not res!212807)) b!253958))

(assert (=> b!253956 m!382091))

(assert (=> b!253956 m!382101))

(assert (=> b!253958 m!382091))

(assert (=> b!253958 m!382091))

(declare-fun m!382423 () Bool)

(assert (=> b!253958 m!382423))

(assert (=> b!253802 d!85084))

(declare-fun d!85086 () Bool)

(assert (=> d!85086 (validate_offset_bits!1 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394112)))) ((_ sign_extend 32) (currentByte!12005 thiss!1005)) ((_ sign_extend 32) (currentBit!12000 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!394454 () Unit!18241)

(declare-fun choose!9 (BitStream!10988 array!13751 (_ BitVec 64) BitStream!10988) Unit!18241)

(assert (=> d!85086 (= lt!394454 (choose!9 thiss!1005 (buf!6541 (_2!11818 lt!394112)) (bvsub nBits!297 from!289) (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005))))))

(assert (=> d!85086 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6541 (_2!11818 lt!394112)) (bvsub nBits!297 from!289)) lt!394454)))

(declare-fun bs!21513 () Bool)

(assert (= bs!21513 d!85086))

(assert (=> bs!21513 m!382125))

(declare-fun m!382425 () Bool)

(assert (=> bs!21513 m!382425))

(assert (=> b!253812 d!85086))

(declare-fun d!85088 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!85088 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394114)))) ((_ sign_extend 32) (currentByte!12005 (_2!11818 lt!394114))) ((_ sign_extend 32) (currentBit!12000 (_2!11818 lt!394114))) lt!394130) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394114)))) ((_ sign_extend 32) (currentByte!12005 (_2!11818 lt!394114))) ((_ sign_extend 32) (currentBit!12000 (_2!11818 lt!394114)))) lt!394130))))

(declare-fun bs!21514 () Bool)

(assert (= bs!21514 d!85088))

(declare-fun m!382427 () Bool)

(assert (=> bs!21514 m!382427))

(assert (=> b!253812 d!85088))

(declare-fun b!253990 () Bool)

(declare-fun e!175974 () Unit!18241)

(declare-fun Unit!18247 () Unit!18241)

(assert (=> b!253990 (= e!175974 Unit!18247)))

(declare-fun b!253991 () Bool)

(declare-fun res!212835 () Bool)

(declare-fun e!175973 () Bool)

(assert (=> b!253991 (=> (not res!212835) (not e!175973))))

(declare-fun lt!394540 () tuple2!21778)

(assert (=> b!253991 (= res!212835 (isPrefixOf!0 (_1!11820 lt!394540) thiss!1005))))

(declare-fun b!253992 () Bool)

(declare-fun lt!394544 () Unit!18241)

(assert (=> b!253992 (= e!175974 lt!394544)))

(declare-fun lt!394533 () (_ BitVec 64))

(assert (=> b!253992 (= lt!394533 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!394534 () (_ BitVec 64))

(assert (=> b!253992 (= lt!394534 (bitIndex!0 (size!6033 (buf!6541 thiss!1005)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13751 array!13751 (_ BitVec 64) (_ BitVec 64)) Unit!18241)

(assert (=> b!253992 (= lt!394544 (arrayBitRangesEqSymmetric!0 (buf!6541 thiss!1005) (buf!6541 (_2!11818 lt!394112)) lt!394533 lt!394534))))

(assert (=> b!253992 (arrayBitRangesEq!0 (buf!6541 (_2!11818 lt!394112)) (buf!6541 thiss!1005) lt!394533 lt!394534)))

(declare-fun b!253994 () Bool)

(declare-fun res!212837 () Bool)

(assert (=> b!253994 (=> (not res!212837) (not e!175973))))

(assert (=> b!253994 (= res!212837 (isPrefixOf!0 (_2!11820 lt!394540) (_2!11818 lt!394112)))))

(declare-fun d!85090 () Bool)

(assert (=> d!85090 e!175973))

(declare-fun res!212836 () Bool)

(assert (=> d!85090 (=> (not res!212836) (not e!175973))))

(assert (=> d!85090 (= res!212836 (isPrefixOf!0 (_1!11820 lt!394540) (_2!11820 lt!394540)))))

(declare-fun lt!394539 () BitStream!10988)

(assert (=> d!85090 (= lt!394540 (tuple2!21779 lt!394539 (_2!11818 lt!394112)))))

(declare-fun lt!394543 () Unit!18241)

(declare-fun lt!394542 () Unit!18241)

(assert (=> d!85090 (= lt!394543 lt!394542)))

(assert (=> d!85090 (isPrefixOf!0 lt!394539 (_2!11818 lt!394112))))

(assert (=> d!85090 (= lt!394542 (lemmaIsPrefixTransitive!0 lt!394539 (_2!11818 lt!394112) (_2!11818 lt!394112)))))

(declare-fun lt!394538 () Unit!18241)

(declare-fun lt!394546 () Unit!18241)

(assert (=> d!85090 (= lt!394538 lt!394546)))

(assert (=> d!85090 (isPrefixOf!0 lt!394539 (_2!11818 lt!394112))))

(assert (=> d!85090 (= lt!394546 (lemmaIsPrefixTransitive!0 lt!394539 thiss!1005 (_2!11818 lt!394112)))))

(declare-fun lt!394536 () Unit!18241)

(assert (=> d!85090 (= lt!394536 e!175974)))

(declare-fun c!11703 () Bool)

(assert (=> d!85090 (= c!11703 (not (= (size!6033 (buf!6541 thiss!1005)) #b00000000000000000000000000000000)))))

(declare-fun lt!394531 () Unit!18241)

(declare-fun lt!394535 () Unit!18241)

(assert (=> d!85090 (= lt!394531 lt!394535)))

(assert (=> d!85090 (isPrefixOf!0 (_2!11818 lt!394112) (_2!11818 lt!394112))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10988) Unit!18241)

(assert (=> d!85090 (= lt!394535 (lemmaIsPrefixRefl!0 (_2!11818 lt!394112)))))

(declare-fun lt!394550 () Unit!18241)

(declare-fun lt!394545 () Unit!18241)

(assert (=> d!85090 (= lt!394550 lt!394545)))

(assert (=> d!85090 (= lt!394545 (lemmaIsPrefixRefl!0 (_2!11818 lt!394112)))))

(declare-fun lt!394548 () Unit!18241)

(declare-fun lt!394532 () Unit!18241)

(assert (=> d!85090 (= lt!394548 lt!394532)))

(assert (=> d!85090 (isPrefixOf!0 lt!394539 lt!394539)))

(assert (=> d!85090 (= lt!394532 (lemmaIsPrefixRefl!0 lt!394539))))

(declare-fun lt!394537 () Unit!18241)

(declare-fun lt!394549 () Unit!18241)

(assert (=> d!85090 (= lt!394537 lt!394549)))

(assert (=> d!85090 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!85090 (= lt!394549 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (=> d!85090 (= lt!394539 (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005)))))

(assert (=> d!85090 (isPrefixOf!0 thiss!1005 (_2!11818 lt!394112))))

(assert (=> d!85090 (= (reader!0 thiss!1005 (_2!11818 lt!394112)) lt!394540)))

(declare-fun b!253993 () Bool)

(declare-fun lt!394541 () (_ BitVec 64))

(declare-fun lt!394547 () (_ BitVec 64))

(assert (=> b!253993 (= e!175973 (= (_1!11820 lt!394540) (withMovedBitIndex!0 (_2!11820 lt!394540) (bvsub lt!394541 lt!394547))))))

(assert (=> b!253993 (or (= (bvand lt!394541 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394547 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!394541 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394541 lt!394547) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253993 (= lt!394547 (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394112))) (currentByte!12005 (_2!11818 lt!394112)) (currentBit!12000 (_2!11818 lt!394112))))))

(assert (=> b!253993 (= lt!394541 (bitIndex!0 (size!6033 (buf!6541 thiss!1005)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005)))))

(assert (= (and d!85090 c!11703) b!253992))

(assert (= (and d!85090 (not c!11703)) b!253990))

(assert (= (and d!85090 res!212836) b!253991))

(assert (= (and b!253991 res!212835) b!253994))

(assert (= (and b!253994 res!212837) b!253993))

(declare-fun m!382451 () Bool)

(assert (=> d!85090 m!382451))

(declare-fun m!382453 () Bool)

(assert (=> d!85090 m!382453))

(declare-fun m!382455 () Bool)

(assert (=> d!85090 m!382455))

(declare-fun m!382457 () Bool)

(assert (=> d!85090 m!382457))

(declare-fun m!382459 () Bool)

(assert (=> d!85090 m!382459))

(declare-fun m!382461 () Bool)

(assert (=> d!85090 m!382461))

(assert (=> d!85090 m!382137))

(declare-fun m!382463 () Bool)

(assert (=> d!85090 m!382463))

(declare-fun m!382465 () Bool)

(assert (=> d!85090 m!382465))

(declare-fun m!382467 () Bool)

(assert (=> d!85090 m!382467))

(declare-fun m!382469 () Bool)

(assert (=> d!85090 m!382469))

(declare-fun m!382471 () Bool)

(assert (=> b!253994 m!382471))

(declare-fun m!382473 () Bool)

(assert (=> b!253991 m!382473))

(declare-fun m!382475 () Bool)

(assert (=> b!253993 m!382475))

(assert (=> b!253993 m!382101))

(assert (=> b!253993 m!382093))

(assert (=> b!253992 m!382093))

(declare-fun m!382477 () Bool)

(assert (=> b!253992 m!382477))

(declare-fun m!382479 () Bool)

(assert (=> b!253992 m!382479))

(assert (=> b!253812 d!85090))

(declare-fun d!85098 () Bool)

(assert (=> d!85098 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394112)))) ((_ sign_extend 32) (currentByte!12005 (_2!11818 lt!394114))) ((_ sign_extend 32) (currentBit!12000 (_2!11818 lt!394114))) lt!394130) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394112)))) ((_ sign_extend 32) (currentByte!12005 (_2!11818 lt!394114))) ((_ sign_extend 32) (currentBit!12000 (_2!11818 lt!394114)))) lt!394130))))

(declare-fun bs!21515 () Bool)

(assert (= bs!21515 d!85098))

(declare-fun m!382481 () Bool)

(assert (=> bs!21515 m!382481))

(assert (=> b!253812 d!85098))

(declare-fun b!254007 () Bool)

(declare-fun e!175980 () Bool)

(declare-fun lt!394559 () tuple2!21776)

(declare-fun lt!394560 () tuple2!21774)

(assert (=> b!254007 (= e!175980 (= (bitIndex!0 (size!6033 (buf!6541 (_1!11819 lt!394559))) (currentByte!12005 (_1!11819 lt!394559)) (currentBit!12000 (_1!11819 lt!394559))) (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394560))) (currentByte!12005 (_2!11818 lt!394560)) (currentBit!12000 (_2!11818 lt!394560)))))))

(declare-fun b!254005 () Bool)

(declare-fun res!212847 () Bool)

(declare-fun e!175979 () Bool)

(assert (=> b!254005 (=> (not res!212847) (not e!175979))))

(assert (=> b!254005 (= res!212847 (isPrefixOf!0 thiss!1005 (_2!11818 lt!394560)))))

(declare-fun b!254004 () Bool)

(declare-fun res!212846 () Bool)

(assert (=> b!254004 (=> (not res!212846) (not e!175979))))

(declare-fun lt!394562 () (_ BitVec 64))

(declare-fun lt!394561 () (_ BitVec 64))

(assert (=> b!254004 (= res!212846 (= (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394560))) (currentByte!12005 (_2!11818 lt!394560)) (currentBit!12000 (_2!11818 lt!394560))) (bvadd lt!394562 lt!394561)))))

(assert (=> b!254004 (or (not (= (bvand lt!394562 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394561 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!394562 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!394562 lt!394561) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!254004 (= lt!394561 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!254004 (= lt!394562 (bitIndex!0 (size!6033 (buf!6541 thiss!1005)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005)))))

(declare-fun b!254006 () Bool)

(assert (=> b!254006 (= e!175979 e!175980)))

(declare-fun res!212849 () Bool)

(assert (=> b!254006 (=> (not res!212849) (not e!175980))))

(assert (=> b!254006 (= res!212849 (and (= (_2!11819 lt!394559) bit!26) (= (_1!11819 lt!394559) (_2!11818 lt!394560))))))

(assert (=> b!254006 (= lt!394559 (readBitPure!0 (readerFrom!0 (_2!11818 lt!394560) (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005))))))

(declare-fun d!85100 () Bool)

(assert (=> d!85100 e!175979))

(declare-fun res!212848 () Bool)

(assert (=> d!85100 (=> (not res!212848) (not e!175979))))

(assert (=> d!85100 (= res!212848 (= (size!6033 (buf!6541 thiss!1005)) (size!6033 (buf!6541 (_2!11818 lt!394560)))))))

(declare-fun choose!16 (BitStream!10988 Bool) tuple2!21774)

(assert (=> d!85100 (= lt!394560 (choose!16 thiss!1005 bit!26))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!85100 (validate_offset_bit!0 ((_ sign_extend 32) (size!6033 (buf!6541 thiss!1005))) ((_ sign_extend 32) (currentByte!12005 thiss!1005)) ((_ sign_extend 32) (currentBit!12000 thiss!1005)))))

(assert (=> d!85100 (= (appendBit!0 thiss!1005 bit!26) lt!394560)))

(assert (= (and d!85100 res!212848) b!254004))

(assert (= (and b!254004 res!212846) b!254005))

(assert (= (and b!254005 res!212847) b!254006))

(assert (= (and b!254006 res!212849) b!254007))

(declare-fun m!382483 () Bool)

(assert (=> b!254004 m!382483))

(assert (=> b!254004 m!382093))

(declare-fun m!382485 () Bool)

(assert (=> d!85100 m!382485))

(declare-fun m!382487 () Bool)

(assert (=> d!85100 m!382487))

(declare-fun m!382489 () Bool)

(assert (=> b!254005 m!382489))

(declare-fun m!382491 () Bool)

(assert (=> b!254007 m!382491))

(assert (=> b!254007 m!382483))

(declare-fun m!382493 () Bool)

(assert (=> b!254006 m!382493))

(assert (=> b!254006 m!382493))

(declare-fun m!382495 () Bool)

(assert (=> b!254006 m!382495))

(assert (=> b!253812 d!85100))

(declare-fun d!85102 () Bool)

(declare-datatypes ((tuple2!21784 0))(
  ( (tuple2!21785 (_1!11823 Bool) (_2!11823 BitStream!10988)) )
))
(declare-fun lt!394565 () tuple2!21784)

(declare-fun readBit!0 (BitStream!10988) tuple2!21784)

(assert (=> d!85102 (= lt!394565 (readBit!0 lt!394115))))

(assert (=> d!85102 (= (readBitPure!0 lt!394115) (tuple2!21777 (_2!11823 lt!394565) (_1!11823 lt!394565)))))

(declare-fun bs!21516 () Bool)

(assert (= bs!21516 d!85102))

(declare-fun m!382497 () Bool)

(assert (=> bs!21516 m!382497))

(assert (=> b!253812 d!85102))

(declare-fun d!85104 () Bool)

(declare-fun lt!394566 () tuple2!21784)

(assert (=> d!85104 (= lt!394566 (readBit!0 (_1!11820 lt!394119)))))

(assert (=> d!85104 (= (readBitPure!0 (_1!11820 lt!394119)) (tuple2!21777 (_2!11823 lt!394566) (_1!11823 lt!394566)))))

(declare-fun bs!21517 () Bool)

(assert (= bs!21517 d!85104))

(declare-fun m!382499 () Bool)

(assert (=> bs!21517 m!382499))

(assert (=> b!253812 d!85104))

(declare-fun d!85106 () Bool)

(declare-fun e!175989 () Bool)

(assert (=> d!85106 e!175989))

(declare-fun res!212867 () Bool)

(assert (=> d!85106 (=> (not res!212867) (not e!175989))))

(declare-fun lt!394606 () (_ BitVec 64))

(declare-fun lt!394607 () (_ BitVec 64))

(declare-fun lt!394605 () (_ BitVec 64))

(assert (=> d!85106 (= res!212867 (= lt!394606 (bvsub lt!394605 lt!394607)))))

(assert (=> d!85106 (or (= (bvand lt!394605 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394607 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!394605 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394605 lt!394607) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85106 (= lt!394607 (remainingBits!0 ((_ sign_extend 32) (size!6033 (buf!6541 (_1!11819 lt!394117)))) ((_ sign_extend 32) (currentByte!12005 (_1!11819 lt!394117))) ((_ sign_extend 32) (currentBit!12000 (_1!11819 lt!394117)))))))

(declare-fun lt!394609 () (_ BitVec 64))

(declare-fun lt!394608 () (_ BitVec 64))

(assert (=> d!85106 (= lt!394605 (bvmul lt!394609 lt!394608))))

(assert (=> d!85106 (or (= lt!394609 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!394608 (bvsdiv (bvmul lt!394609 lt!394608) lt!394609)))))

(assert (=> d!85106 (= lt!394608 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85106 (= lt!394609 ((_ sign_extend 32) (size!6033 (buf!6541 (_1!11819 lt!394117)))))))

(assert (=> d!85106 (= lt!394606 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12005 (_1!11819 lt!394117))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12000 (_1!11819 lt!394117)))))))

(assert (=> d!85106 (invariant!0 (currentBit!12000 (_1!11819 lt!394117)) (currentByte!12005 (_1!11819 lt!394117)) (size!6033 (buf!6541 (_1!11819 lt!394117))))))

(assert (=> d!85106 (= (bitIndex!0 (size!6033 (buf!6541 (_1!11819 lt!394117))) (currentByte!12005 (_1!11819 lt!394117)) (currentBit!12000 (_1!11819 lt!394117))) lt!394606)))

(declare-fun b!254024 () Bool)

(declare-fun res!212866 () Bool)

(assert (=> b!254024 (=> (not res!212866) (not e!175989))))

(assert (=> b!254024 (= res!212866 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!394606))))

(declare-fun b!254025 () Bool)

(declare-fun lt!394604 () (_ BitVec 64))

(assert (=> b!254025 (= e!175989 (bvsle lt!394606 (bvmul lt!394604 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254025 (or (= lt!394604 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!394604 #b0000000000000000000000000000000000000000000000000000000000001000) lt!394604)))))

(assert (=> b!254025 (= lt!394604 ((_ sign_extend 32) (size!6033 (buf!6541 (_1!11819 lt!394117)))))))

(assert (= (and d!85106 res!212867) b!254024))

(assert (= (and b!254024 res!212866) b!254025))

(declare-fun m!382519 () Bool)

(assert (=> d!85106 m!382519))

(declare-fun m!382521 () Bool)

(assert (=> d!85106 m!382521))

(assert (=> b!253812 d!85106))

(declare-fun b!254026 () Bool)

(declare-fun e!175991 () Unit!18241)

(declare-fun Unit!18248 () Unit!18241)

(assert (=> b!254026 (= e!175991 Unit!18248)))

(declare-fun b!254027 () Bool)

(declare-fun res!212868 () Bool)

(declare-fun e!175990 () Bool)

(assert (=> b!254027 (=> (not res!212868) (not e!175990))))

(declare-fun lt!394619 () tuple2!21778)

(assert (=> b!254027 (= res!212868 (isPrefixOf!0 (_1!11820 lt!394619) (_2!11818 lt!394114)))))

(declare-fun b!254028 () Bool)

(declare-fun lt!394623 () Unit!18241)

(assert (=> b!254028 (= e!175991 lt!394623)))

(declare-fun lt!394612 () (_ BitVec 64))

(assert (=> b!254028 (= lt!394612 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!394613 () (_ BitVec 64))

(assert (=> b!254028 (= lt!394613 (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394114))) (currentByte!12005 (_2!11818 lt!394114)) (currentBit!12000 (_2!11818 lt!394114))))))

(assert (=> b!254028 (= lt!394623 (arrayBitRangesEqSymmetric!0 (buf!6541 (_2!11818 lt!394114)) (buf!6541 (_2!11818 lt!394112)) lt!394612 lt!394613))))

(assert (=> b!254028 (arrayBitRangesEq!0 (buf!6541 (_2!11818 lt!394112)) (buf!6541 (_2!11818 lt!394114)) lt!394612 lt!394613)))

(declare-fun b!254030 () Bool)

(declare-fun res!212870 () Bool)

(assert (=> b!254030 (=> (not res!212870) (not e!175990))))

(assert (=> b!254030 (= res!212870 (isPrefixOf!0 (_2!11820 lt!394619) (_2!11818 lt!394112)))))

(declare-fun d!85112 () Bool)

(assert (=> d!85112 e!175990))

(declare-fun res!212869 () Bool)

(assert (=> d!85112 (=> (not res!212869) (not e!175990))))

(assert (=> d!85112 (= res!212869 (isPrefixOf!0 (_1!11820 lt!394619) (_2!11820 lt!394619)))))

(declare-fun lt!394618 () BitStream!10988)

(assert (=> d!85112 (= lt!394619 (tuple2!21779 lt!394618 (_2!11818 lt!394112)))))

(declare-fun lt!394622 () Unit!18241)

(declare-fun lt!394621 () Unit!18241)

(assert (=> d!85112 (= lt!394622 lt!394621)))

(assert (=> d!85112 (isPrefixOf!0 lt!394618 (_2!11818 lt!394112))))

(assert (=> d!85112 (= lt!394621 (lemmaIsPrefixTransitive!0 lt!394618 (_2!11818 lt!394112) (_2!11818 lt!394112)))))

(declare-fun lt!394617 () Unit!18241)

(declare-fun lt!394625 () Unit!18241)

(assert (=> d!85112 (= lt!394617 lt!394625)))

(assert (=> d!85112 (isPrefixOf!0 lt!394618 (_2!11818 lt!394112))))

(assert (=> d!85112 (= lt!394625 (lemmaIsPrefixTransitive!0 lt!394618 (_2!11818 lt!394114) (_2!11818 lt!394112)))))

(declare-fun lt!394615 () Unit!18241)

(assert (=> d!85112 (= lt!394615 e!175991)))

(declare-fun c!11704 () Bool)

(assert (=> d!85112 (= c!11704 (not (= (size!6033 (buf!6541 (_2!11818 lt!394114))) #b00000000000000000000000000000000)))))

(declare-fun lt!394610 () Unit!18241)

(declare-fun lt!394614 () Unit!18241)

(assert (=> d!85112 (= lt!394610 lt!394614)))

(assert (=> d!85112 (isPrefixOf!0 (_2!11818 lt!394112) (_2!11818 lt!394112))))

(assert (=> d!85112 (= lt!394614 (lemmaIsPrefixRefl!0 (_2!11818 lt!394112)))))

(declare-fun lt!394629 () Unit!18241)

(declare-fun lt!394624 () Unit!18241)

(assert (=> d!85112 (= lt!394629 lt!394624)))

(assert (=> d!85112 (= lt!394624 (lemmaIsPrefixRefl!0 (_2!11818 lt!394112)))))

(declare-fun lt!394627 () Unit!18241)

(declare-fun lt!394611 () Unit!18241)

(assert (=> d!85112 (= lt!394627 lt!394611)))

(assert (=> d!85112 (isPrefixOf!0 lt!394618 lt!394618)))

(assert (=> d!85112 (= lt!394611 (lemmaIsPrefixRefl!0 lt!394618))))

(declare-fun lt!394616 () Unit!18241)

(declare-fun lt!394628 () Unit!18241)

(assert (=> d!85112 (= lt!394616 lt!394628)))

(assert (=> d!85112 (isPrefixOf!0 (_2!11818 lt!394114) (_2!11818 lt!394114))))

(assert (=> d!85112 (= lt!394628 (lemmaIsPrefixRefl!0 (_2!11818 lt!394114)))))

(assert (=> d!85112 (= lt!394618 (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 (_2!11818 lt!394114)) (currentBit!12000 (_2!11818 lt!394114))))))

(assert (=> d!85112 (isPrefixOf!0 (_2!11818 lt!394114) (_2!11818 lt!394112))))

(assert (=> d!85112 (= (reader!0 (_2!11818 lt!394114) (_2!11818 lt!394112)) lt!394619)))

(declare-fun b!254029 () Bool)

(declare-fun lt!394626 () (_ BitVec 64))

(declare-fun lt!394620 () (_ BitVec 64))

(assert (=> b!254029 (= e!175990 (= (_1!11820 lt!394619) (withMovedBitIndex!0 (_2!11820 lt!394619) (bvsub lt!394620 lt!394626))))))

(assert (=> b!254029 (or (= (bvand lt!394620 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394626 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!394620 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394620 lt!394626) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!254029 (= lt!394626 (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394112))) (currentByte!12005 (_2!11818 lt!394112)) (currentBit!12000 (_2!11818 lt!394112))))))

(assert (=> b!254029 (= lt!394620 (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394114))) (currentByte!12005 (_2!11818 lt!394114)) (currentBit!12000 (_2!11818 lt!394114))))))

(assert (= (and d!85112 c!11704) b!254028))

(assert (= (and d!85112 (not c!11704)) b!254026))

(assert (= (and d!85112 res!212869) b!254027))

(assert (= (and b!254027 res!212868) b!254030))

(assert (= (and b!254030 res!212870) b!254029))

(declare-fun m!382525 () Bool)

(assert (=> d!85112 m!382525))

(declare-fun m!382529 () Bool)

(assert (=> d!85112 m!382529))

(declare-fun m!382531 () Bool)

(assert (=> d!85112 m!382531))

(declare-fun m!382533 () Bool)

(assert (=> d!85112 m!382533))

(assert (=> d!85112 m!382459))

(declare-fun m!382535 () Bool)

(assert (=> d!85112 m!382535))

(assert (=> d!85112 m!382149))

(declare-fun m!382537 () Bool)

(assert (=> d!85112 m!382537))

(assert (=> d!85112 m!382465))

(declare-fun m!382539 () Bool)

(assert (=> d!85112 m!382539))

(declare-fun m!382541 () Bool)

(assert (=> d!85112 m!382541))

(declare-fun m!382543 () Bool)

(assert (=> b!254030 m!382543))

(declare-fun m!382545 () Bool)

(assert (=> b!254027 m!382545))

(declare-fun m!382547 () Bool)

(assert (=> b!254029 m!382547))

(assert (=> b!254029 m!382101))

(assert (=> b!254029 m!382091))

(assert (=> b!254028 m!382091))

(declare-fun m!382549 () Bool)

(assert (=> b!254028 m!382549))

(declare-fun m!382551 () Bool)

(assert (=> b!254028 m!382551))

(assert (=> b!253812 d!85112))

(declare-fun d!85118 () Bool)

(declare-fun e!176002 () Bool)

(assert (=> d!85118 e!176002))

(declare-fun res!212885 () Bool)

(assert (=> d!85118 (=> (not res!212885) (not e!176002))))

(declare-fun lt!394663 () tuple2!21776)

(declare-fun lt!394666 () tuple2!21776)

(assert (=> d!85118 (= res!212885 (= (bitIndex!0 (size!6033 (buf!6541 (_1!11819 lt!394663))) (currentByte!12005 (_1!11819 lt!394663)) (currentBit!12000 (_1!11819 lt!394663))) (bitIndex!0 (size!6033 (buf!6541 (_1!11819 lt!394666))) (currentByte!12005 (_1!11819 lt!394666)) (currentBit!12000 (_1!11819 lt!394666)))))))

(declare-fun lt!394664 () BitStream!10988)

(declare-fun lt!394665 () Unit!18241)

(declare-fun choose!50 (BitStream!10988 BitStream!10988 BitStream!10988 tuple2!21776 tuple2!21776 BitStream!10988 Bool tuple2!21776 tuple2!21776 BitStream!10988 Bool) Unit!18241)

(assert (=> d!85118 (= lt!394665 (choose!50 lt!394115 (_2!11818 lt!394112) lt!394664 lt!394663 (tuple2!21777 (_1!11819 lt!394663) (_2!11819 lt!394663)) (_1!11819 lt!394663) (_2!11819 lt!394663) lt!394666 (tuple2!21777 (_1!11819 lt!394666) (_2!11819 lt!394666)) (_1!11819 lt!394666) (_2!11819 lt!394666)))))

(assert (=> d!85118 (= lt!394666 (readBitPure!0 lt!394664))))

(assert (=> d!85118 (= lt!394663 (readBitPure!0 lt!394115))))

(assert (=> d!85118 (= lt!394664 (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 lt!394115) (currentBit!12000 lt!394115)))))

(assert (=> d!85118 (invariant!0 (currentBit!12000 lt!394115) (currentByte!12005 lt!394115) (size!6033 (buf!6541 (_2!11818 lt!394112))))))

(assert (=> d!85118 (= (readBitPrefixLemma!0 lt!394115 (_2!11818 lt!394112)) lt!394665)))

(declare-fun b!254045 () Bool)

(assert (=> b!254045 (= e!176002 (= (_2!11819 lt!394663) (_2!11819 lt!394666)))))

(assert (= (and d!85118 res!212885) b!254045))

(declare-fun m!382569 () Bool)

(assert (=> d!85118 m!382569))

(declare-fun m!382573 () Bool)

(assert (=> d!85118 m!382573))

(declare-fun m!382575 () Bool)

(assert (=> d!85118 m!382575))

(declare-fun m!382577 () Bool)

(assert (=> d!85118 m!382577))

(assert (=> d!85118 m!382111))

(declare-fun m!382579 () Bool)

(assert (=> d!85118 m!382579))

(assert (=> b!253812 d!85118))

(declare-fun b!254057 () Bool)

(declare-fun res!212897 () Bool)

(declare-fun e!176008 () Bool)

(assert (=> b!254057 (=> (not res!212897) (not e!176008))))

(declare-fun lt!394693 () tuple2!21774)

(assert (=> b!254057 (= res!212897 (isPrefixOf!0 (_2!11818 lt!394114) (_2!11818 lt!394693)))))

(declare-fun d!85144 () Bool)

(assert (=> d!85144 e!176008))

(declare-fun res!212899 () Bool)

(assert (=> d!85144 (=> (not res!212899) (not e!176008))))

(assert (=> d!85144 (= res!212899 (= (size!6033 (buf!6541 (_2!11818 lt!394114))) (size!6033 (buf!6541 (_2!11818 lt!394693)))))))

(declare-fun choose!51 (BitStream!10988 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21774)

(assert (=> d!85144 (= lt!394693 (choose!51 (_2!11818 lt!394114) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!85144 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!85144 (= (appendNBitsLoop!0 (_2!11818 lt!394114) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!394693)))

(declare-fun b!254058 () Bool)

(declare-fun lt!394697 () tuple2!21776)

(declare-fun lt!394695 () tuple2!21778)

(assert (=> b!254058 (= e!176008 (and (_2!11819 lt!394697) (= (_1!11819 lt!394697) (_2!11820 lt!394695))))))

(assert (=> b!254058 (= lt!394697 (checkBitsLoopPure!0 (_1!11820 lt!394695) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!394692 () Unit!18241)

(declare-fun lt!394691 () Unit!18241)

(assert (=> b!254058 (= lt!394692 lt!394691)))

(declare-fun lt!394694 () (_ BitVec 64))

(assert (=> b!254058 (validate_offset_bits!1 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394693)))) ((_ sign_extend 32) (currentByte!12005 (_2!11818 lt!394114))) ((_ sign_extend 32) (currentBit!12000 (_2!11818 lt!394114))) lt!394694)))

(assert (=> b!254058 (= lt!394691 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11818 lt!394114) (buf!6541 (_2!11818 lt!394693)) lt!394694))))

(declare-fun e!176009 () Bool)

(assert (=> b!254058 e!176009))

(declare-fun res!212896 () Bool)

(assert (=> b!254058 (=> (not res!212896) (not e!176009))))

(assert (=> b!254058 (= res!212896 (and (= (size!6033 (buf!6541 (_2!11818 lt!394114))) (size!6033 (buf!6541 (_2!11818 lt!394693)))) (bvsge lt!394694 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!254058 (= lt!394694 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!254058 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!254058 (= lt!394695 (reader!0 (_2!11818 lt!394114) (_2!11818 lt!394693)))))

(declare-fun b!254056 () Bool)

(declare-fun res!212898 () Bool)

(assert (=> b!254056 (=> (not res!212898) (not e!176008))))

(declare-fun lt!394696 () (_ BitVec 64))

(declare-fun lt!394698 () (_ BitVec 64))

(assert (=> b!254056 (= res!212898 (= (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394693))) (currentByte!12005 (_2!11818 lt!394693)) (currentBit!12000 (_2!11818 lt!394693))) (bvadd lt!394696 lt!394698)))))

(assert (=> b!254056 (or (not (= (bvand lt!394696 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394698 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!394696 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!394696 lt!394698) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!254056 (= lt!394698 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!254056 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!254056 (= lt!394696 (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394114))) (currentByte!12005 (_2!11818 lt!394114)) (currentBit!12000 (_2!11818 lt!394114))))))

(declare-fun b!254059 () Bool)

(assert (=> b!254059 (= e!176009 (validate_offset_bits!1 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394114)))) ((_ sign_extend 32) (currentByte!12005 (_2!11818 lt!394114))) ((_ sign_extend 32) (currentBit!12000 (_2!11818 lt!394114))) lt!394694))))

(assert (= (and d!85144 res!212899) b!254056))

(assert (= (and b!254056 res!212898) b!254057))

(assert (= (and b!254057 res!212897) b!254058))

(assert (= (and b!254058 res!212896) b!254059))

(declare-fun m!382587 () Bool)

(assert (=> b!254058 m!382587))

(declare-fun m!382589 () Bool)

(assert (=> b!254058 m!382589))

(declare-fun m!382591 () Bool)

(assert (=> b!254058 m!382591))

(declare-fun m!382593 () Bool)

(assert (=> b!254058 m!382593))

(declare-fun m!382595 () Bool)

(assert (=> b!254057 m!382595))

(declare-fun m!382597 () Bool)

(assert (=> b!254059 m!382597))

(declare-fun m!382599 () Bool)

(assert (=> d!85144 m!382599))

(declare-fun m!382601 () Bool)

(assert (=> b!254056 m!382601))

(assert (=> b!254056 m!382091))

(assert (=> b!253812 d!85144))

(declare-fun d!85150 () Bool)

(assert (=> d!85150 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394112)))) ((_ sign_extend 32) (currentByte!12005 thiss!1005)) ((_ sign_extend 32) (currentBit!12000 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394112)))) ((_ sign_extend 32) (currentByte!12005 thiss!1005)) ((_ sign_extend 32) (currentBit!12000 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21527 () Bool)

(assert (= bs!21527 d!85150))

(declare-fun m!382603 () Bool)

(assert (=> bs!21527 m!382603))

(assert (=> b!253812 d!85150))

(declare-fun lt!394701 () tuple2!21784)

(declare-fun d!85152 () Bool)

(declare-fun checkBitsLoop!0 (BitStream!10988 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21784)

(assert (=> d!85152 (= lt!394701 (checkBitsLoop!0 (_1!11820 lt!394126) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!85152 (= (checkBitsLoopPure!0 (_1!11820 lt!394126) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21777 (_2!11823 lt!394701) (_1!11823 lt!394701)))))

(declare-fun bs!21528 () Bool)

(assert (= bs!21528 d!85152))

(declare-fun m!382605 () Bool)

(assert (=> bs!21528 m!382605))

(assert (=> b!253812 d!85152))

(declare-fun d!85154 () Bool)

(declare-fun e!176010 () Bool)

(assert (=> d!85154 e!176010))

(declare-fun res!212901 () Bool)

(assert (=> d!85154 (=> (not res!212901) (not e!176010))))

(declare-fun lt!394703 () (_ BitVec 64))

(declare-fun lt!394705 () (_ BitVec 64))

(declare-fun lt!394704 () (_ BitVec 64))

(assert (=> d!85154 (= res!212901 (= lt!394704 (bvsub lt!394703 lt!394705)))))

(assert (=> d!85154 (or (= (bvand lt!394703 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394705 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!394703 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394703 lt!394705) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85154 (= lt!394705 (remainingBits!0 ((_ sign_extend 32) (size!6033 (buf!6541 (_1!11819 lt!394110)))) ((_ sign_extend 32) (currentByte!12005 (_1!11819 lt!394110))) ((_ sign_extend 32) (currentBit!12000 (_1!11819 lt!394110)))))))

(declare-fun lt!394707 () (_ BitVec 64))

(declare-fun lt!394706 () (_ BitVec 64))

(assert (=> d!85154 (= lt!394703 (bvmul lt!394707 lt!394706))))

(assert (=> d!85154 (or (= lt!394707 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!394706 (bvsdiv (bvmul lt!394707 lt!394706) lt!394707)))))

(assert (=> d!85154 (= lt!394706 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85154 (= lt!394707 ((_ sign_extend 32) (size!6033 (buf!6541 (_1!11819 lt!394110)))))))

(assert (=> d!85154 (= lt!394704 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12005 (_1!11819 lt!394110))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12000 (_1!11819 lt!394110)))))))

(assert (=> d!85154 (invariant!0 (currentBit!12000 (_1!11819 lt!394110)) (currentByte!12005 (_1!11819 lt!394110)) (size!6033 (buf!6541 (_1!11819 lt!394110))))))

(assert (=> d!85154 (= (bitIndex!0 (size!6033 (buf!6541 (_1!11819 lt!394110))) (currentByte!12005 (_1!11819 lt!394110)) (currentBit!12000 (_1!11819 lt!394110))) lt!394704)))

(declare-fun b!254060 () Bool)

(declare-fun res!212900 () Bool)

(assert (=> b!254060 (=> (not res!212900) (not e!176010))))

(assert (=> b!254060 (= res!212900 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!394704))))

(declare-fun b!254061 () Bool)

(declare-fun lt!394702 () (_ BitVec 64))

(assert (=> b!254061 (= e!176010 (bvsle lt!394704 (bvmul lt!394702 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254061 (or (= lt!394702 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!394702 #b0000000000000000000000000000000000000000000000000000000000001000) lt!394702)))))

(assert (=> b!254061 (= lt!394702 ((_ sign_extend 32) (size!6033 (buf!6541 (_1!11819 lt!394110)))))))

(assert (= (and d!85154 res!212901) b!254060))

(assert (= (and b!254060 res!212900) b!254061))

(declare-fun m!382607 () Bool)

(assert (=> d!85154 m!382607))

(declare-fun m!382609 () Bool)

(assert (=> d!85154 m!382609))

(assert (=> b!253812 d!85154))

(declare-fun d!85156 () Bool)

(declare-fun res!212902 () Bool)

(declare-fun e!176011 () Bool)

(assert (=> d!85156 (=> (not res!212902) (not e!176011))))

(assert (=> d!85156 (= res!212902 (= (size!6033 (buf!6541 thiss!1005)) (size!6033 (buf!6541 (_2!11818 lt!394112)))))))

(assert (=> d!85156 (= (isPrefixOf!0 thiss!1005 (_2!11818 lt!394112)) e!176011)))

(declare-fun b!254062 () Bool)

(declare-fun res!212904 () Bool)

(assert (=> b!254062 (=> (not res!212904) (not e!176011))))

(assert (=> b!254062 (= res!212904 (bvsle (bitIndex!0 (size!6033 (buf!6541 thiss!1005)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005)) (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394112))) (currentByte!12005 (_2!11818 lt!394112)) (currentBit!12000 (_2!11818 lt!394112)))))))

(declare-fun b!254063 () Bool)

(declare-fun e!176012 () Bool)

(assert (=> b!254063 (= e!176011 e!176012)))

(declare-fun res!212903 () Bool)

(assert (=> b!254063 (=> res!212903 e!176012)))

(assert (=> b!254063 (= res!212903 (= (size!6033 (buf!6541 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!254064 () Bool)

(assert (=> b!254064 (= e!176012 (arrayBitRangesEq!0 (buf!6541 thiss!1005) (buf!6541 (_2!11818 lt!394112)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6033 (buf!6541 thiss!1005)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005))))))

(assert (= (and d!85156 res!212902) b!254062))

(assert (= (and b!254062 res!212904) b!254063))

(assert (= (and b!254063 (not res!212903)) b!254064))

(assert (=> b!254062 m!382093))

(assert (=> b!254062 m!382101))

(assert (=> b!254064 m!382093))

(assert (=> b!254064 m!382093))

(declare-fun m!382611 () Bool)

(assert (=> b!254064 m!382611))

(assert (=> b!253812 d!85156))

(declare-fun d!85158 () Bool)

(declare-fun e!176015 () Bool)

(assert (=> d!85158 e!176015))

(declare-fun res!212907 () Bool)

(assert (=> d!85158 (=> (not res!212907) (not e!176015))))

(assert (=> d!85158 (= res!212907 (or (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!394710 () Unit!18241)

(declare-fun choose!27 (BitStream!10988 BitStream!10988 (_ BitVec 64) (_ BitVec 64)) Unit!18241)

(assert (=> d!85158 (= lt!394710 (choose!27 thiss!1005 (_2!11818 lt!394114) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!85158 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!297 from!289)))))

(assert (=> d!85158 (= (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11818 lt!394114) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) lt!394710)))

(declare-fun b!254067 () Bool)

(assert (=> b!254067 (= e!176015 (validate_offset_bits!1 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394114)))) ((_ sign_extend 32) (currentByte!12005 (_2!11818 lt!394114))) ((_ sign_extend 32) (currentBit!12000 (_2!11818 lt!394114))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!85158 res!212907) b!254067))

(declare-fun m!382613 () Bool)

(assert (=> d!85158 m!382613))

(declare-fun m!382615 () Bool)

(assert (=> b!254067 m!382615))

(assert (=> b!253812 d!85158))

(declare-fun d!85160 () Bool)

(assert (=> d!85160 (validate_offset_bits!1 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394112)))) ((_ sign_extend 32) (currentByte!12005 (_2!11818 lt!394114))) ((_ sign_extend 32) (currentBit!12000 (_2!11818 lt!394114))) lt!394130)))

(declare-fun lt!394711 () Unit!18241)

(assert (=> d!85160 (= lt!394711 (choose!9 (_2!11818 lt!394114) (buf!6541 (_2!11818 lt!394112)) lt!394130 (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 (_2!11818 lt!394114)) (currentBit!12000 (_2!11818 lt!394114)))))))

(assert (=> d!85160 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11818 lt!394114) (buf!6541 (_2!11818 lt!394112)) lt!394130) lt!394711)))

(declare-fun bs!21529 () Bool)

(assert (= bs!21529 d!85160))

(assert (=> bs!21529 m!382129))

(declare-fun m!382617 () Bool)

(assert (=> bs!21529 m!382617))

(assert (=> b!253812 d!85160))

(declare-fun d!85162 () Bool)

(declare-fun lt!394712 () tuple2!21784)

(assert (=> d!85162 (= lt!394712 (readBit!0 (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005))))))

(assert (=> d!85162 (= (readBitPure!0 (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005))) (tuple2!21777 (_2!11823 lt!394712) (_1!11823 lt!394712)))))

(declare-fun bs!21530 () Bool)

(assert (= bs!21530 d!85162))

(declare-fun m!382619 () Bool)

(assert (=> bs!21530 m!382619))

(assert (=> b!253812 d!85162))

(declare-fun d!85164 () Bool)

(declare-fun lt!394713 () tuple2!21784)

(assert (=> d!85164 (= lt!394713 (checkBitsLoop!0 (_1!11820 lt!394119) nBits!297 bit!26 from!289))))

(assert (=> d!85164 (= (checkBitsLoopPure!0 (_1!11820 lt!394119) nBits!297 bit!26 from!289) (tuple2!21777 (_2!11823 lt!394713) (_1!11823 lt!394713)))))

(declare-fun bs!21531 () Bool)

(assert (= bs!21531 d!85164))

(declare-fun m!382621 () Bool)

(assert (=> bs!21531 m!382621))

(assert (=> b!253812 d!85164))

(declare-fun d!85166 () Bool)

(assert (=> d!85166 (isPrefixOf!0 thiss!1005 (_2!11818 lt!394112))))

(declare-fun lt!394716 () Unit!18241)

(declare-fun choose!30 (BitStream!10988 BitStream!10988 BitStream!10988) Unit!18241)

(assert (=> d!85166 (= lt!394716 (choose!30 thiss!1005 (_2!11818 lt!394114) (_2!11818 lt!394112)))))

(assert (=> d!85166 (isPrefixOf!0 thiss!1005 (_2!11818 lt!394114))))

(assert (=> d!85166 (= (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11818 lt!394114) (_2!11818 lt!394112)) lt!394716)))

(declare-fun bs!21532 () Bool)

(assert (= bs!21532 d!85166))

(assert (=> bs!21532 m!382137))

(declare-fun m!382623 () Bool)

(assert (=> bs!21532 m!382623))

(assert (=> bs!21532 m!382151))

(assert (=> b!253812 d!85166))

(declare-fun lt!394717 () tuple2!21784)

(declare-fun d!85168 () Bool)

(assert (=> d!85168 (= lt!394717 (checkBitsLoop!0 (_1!11820 lt!394113) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!85168 (= (checkBitsLoopPure!0 (_1!11820 lt!394113) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21777 (_2!11823 lt!394717) (_1!11823 lt!394717)))))

(declare-fun bs!21533 () Bool)

(assert (= bs!21533 d!85168))

(declare-fun m!382625 () Bool)

(assert (=> bs!21533 m!382625))

(assert (=> b!253811 d!85168))

(declare-fun d!85170 () Bool)

(assert (=> d!85170 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394112)))) ((_ sign_extend 32) (currentByte!12005 (_2!11818 lt!394114))) ((_ sign_extend 32) (currentBit!12000 (_2!11818 lt!394114))) lt!394129) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394112)))) ((_ sign_extend 32) (currentByte!12005 (_2!11818 lt!394114))) ((_ sign_extend 32) (currentBit!12000 (_2!11818 lt!394114)))) lt!394129))))

(declare-fun bs!21534 () Bool)

(assert (= bs!21534 d!85170))

(assert (=> bs!21534 m!382481))

(assert (=> b!253811 d!85170))

(declare-fun d!85172 () Bool)

(assert (=> d!85172 (validate_offset_bits!1 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394112)))) ((_ sign_extend 32) (currentByte!12005 (_2!11818 lt!394114))) ((_ sign_extend 32) (currentBit!12000 (_2!11818 lt!394114))) lt!394129)))

(declare-fun lt!394718 () Unit!18241)

(assert (=> d!85172 (= lt!394718 (choose!9 (_2!11818 lt!394114) (buf!6541 (_2!11818 lt!394112)) lt!394129 (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 (_2!11818 lt!394114)) (currentBit!12000 (_2!11818 lt!394114)))))))

(assert (=> d!85172 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11818 lt!394114) (buf!6541 (_2!11818 lt!394112)) lt!394129) lt!394718)))

(declare-fun bs!21535 () Bool)

(assert (= bs!21535 d!85172))

(assert (=> bs!21535 m!382105))

(declare-fun m!382627 () Bool)

(assert (=> bs!21535 m!382627))

(assert (=> b!253811 d!85172))

(assert (=> b!253811 d!85112))

(declare-fun d!85174 () Bool)

(assert (=> d!85174 (= (invariant!0 (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005) (size!6033 (buf!6541 (_2!11818 lt!394112)))) (and (bvsge (currentBit!12000 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!12000 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!12005 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!12005 thiss!1005) (size!6033 (buf!6541 (_2!11818 lt!394112)))) (and (= (currentBit!12000 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!12005 thiss!1005) (size!6033 (buf!6541 (_2!11818 lt!394112))))))))))

(assert (=> b!253809 d!85174))

(declare-fun d!85176 () Bool)

(assert (=> d!85176 (= (invariant!0 (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005) (size!6033 (buf!6541 (_2!11818 lt!394114)))) (and (bvsge (currentBit!12000 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!12000 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!12005 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!12005 thiss!1005) (size!6033 (buf!6541 (_2!11818 lt!394114)))) (and (= (currentBit!12000 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!12005 thiss!1005) (size!6033 (buf!6541 (_2!11818 lt!394114))))))))))

(assert (=> b!253808 d!85176))

(declare-fun d!85178 () Bool)

(declare-fun e!176016 () Bool)

(assert (=> d!85178 e!176016))

(declare-fun res!212909 () Bool)

(assert (=> d!85178 (=> (not res!212909) (not e!176016))))

(declare-fun lt!394721 () (_ BitVec 64))

(declare-fun lt!394720 () (_ BitVec 64))

(declare-fun lt!394722 () (_ BitVec 64))

(assert (=> d!85178 (= res!212909 (= lt!394721 (bvsub lt!394720 lt!394722)))))

(assert (=> d!85178 (or (= (bvand lt!394720 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394722 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!394720 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394720 lt!394722) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85178 (= lt!394722 (remainingBits!0 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394114)))) ((_ sign_extend 32) (currentByte!12005 (_2!11818 lt!394114))) ((_ sign_extend 32) (currentBit!12000 (_2!11818 lt!394114)))))))

(declare-fun lt!394724 () (_ BitVec 64))

(declare-fun lt!394723 () (_ BitVec 64))

(assert (=> d!85178 (= lt!394720 (bvmul lt!394724 lt!394723))))

(assert (=> d!85178 (or (= lt!394724 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!394723 (bvsdiv (bvmul lt!394724 lt!394723) lt!394724)))))

(assert (=> d!85178 (= lt!394723 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85178 (= lt!394724 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394114)))))))

(assert (=> d!85178 (= lt!394721 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12005 (_2!11818 lt!394114))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12000 (_2!11818 lt!394114)))))))

(assert (=> d!85178 (invariant!0 (currentBit!12000 (_2!11818 lt!394114)) (currentByte!12005 (_2!11818 lt!394114)) (size!6033 (buf!6541 (_2!11818 lt!394114))))))

(assert (=> d!85178 (= (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394114))) (currentByte!12005 (_2!11818 lt!394114)) (currentBit!12000 (_2!11818 lt!394114))) lt!394721)))

(declare-fun b!254068 () Bool)

(declare-fun res!212908 () Bool)

(assert (=> b!254068 (=> (not res!212908) (not e!176016))))

(assert (=> b!254068 (= res!212908 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!394721))))

(declare-fun b!254069 () Bool)

(declare-fun lt!394719 () (_ BitVec 64))

(assert (=> b!254069 (= e!176016 (bvsle lt!394721 (bvmul lt!394719 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254069 (or (= lt!394719 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!394719 #b0000000000000000000000000000000000000000000000000000000000001000) lt!394719)))))

(assert (=> b!254069 (= lt!394719 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394114)))))))

(assert (= (and d!85178 res!212909) b!254068))

(assert (= (and b!254068 res!212908) b!254069))

(assert (=> d!85178 m!382427))

(declare-fun m!382629 () Bool)

(assert (=> d!85178 m!382629))

(assert (=> b!253817 d!85178))

(declare-fun d!85180 () Bool)

(declare-fun e!176017 () Bool)

(assert (=> d!85180 e!176017))

(declare-fun res!212911 () Bool)

(assert (=> d!85180 (=> (not res!212911) (not e!176017))))

(declare-fun lt!394726 () (_ BitVec 64))

(declare-fun lt!394727 () (_ BitVec 64))

(declare-fun lt!394728 () (_ BitVec 64))

(assert (=> d!85180 (= res!212911 (= lt!394727 (bvsub lt!394726 lt!394728)))))

(assert (=> d!85180 (or (= (bvand lt!394726 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394728 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!394726 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394726 lt!394728) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85180 (= lt!394728 (remainingBits!0 ((_ sign_extend 32) (size!6033 (buf!6541 thiss!1005))) ((_ sign_extend 32) (currentByte!12005 thiss!1005)) ((_ sign_extend 32) (currentBit!12000 thiss!1005))))))

(declare-fun lt!394730 () (_ BitVec 64))

(declare-fun lt!394729 () (_ BitVec 64))

(assert (=> d!85180 (= lt!394726 (bvmul lt!394730 lt!394729))))

(assert (=> d!85180 (or (= lt!394730 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!394729 (bvsdiv (bvmul lt!394730 lt!394729) lt!394730)))))

(assert (=> d!85180 (= lt!394729 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85180 (= lt!394730 ((_ sign_extend 32) (size!6033 (buf!6541 thiss!1005))))))

(assert (=> d!85180 (= lt!394727 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12005 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12000 thiss!1005))))))

(assert (=> d!85180 (invariant!0 (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005) (size!6033 (buf!6541 thiss!1005)))))

(assert (=> d!85180 (= (bitIndex!0 (size!6033 (buf!6541 thiss!1005)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005)) lt!394727)))

(declare-fun b!254070 () Bool)

(declare-fun res!212910 () Bool)

(assert (=> b!254070 (=> (not res!212910) (not e!176017))))

(assert (=> b!254070 (= res!212910 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!394727))))

(declare-fun b!254071 () Bool)

(declare-fun lt!394725 () (_ BitVec 64))

(assert (=> b!254071 (= e!176017 (bvsle lt!394727 (bvmul lt!394725 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254071 (or (= lt!394725 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!394725 #b0000000000000000000000000000000000000000000000000000000000001000) lt!394725)))))

(assert (=> b!254071 (= lt!394725 ((_ sign_extend 32) (size!6033 (buf!6541 thiss!1005))))))

(assert (= (and d!85180 res!212911) b!254070))

(assert (= (and b!254070 res!212910) b!254071))

(declare-fun m!382631 () Bool)

(assert (=> d!85180 m!382631))

(declare-fun m!382633 () Bool)

(assert (=> d!85180 m!382633))

(assert (=> b!253817 d!85180))

(declare-fun d!85182 () Bool)

(assert (=> d!85182 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6033 (buf!6541 thiss!1005))) ((_ sign_extend 32) (currentByte!12005 thiss!1005)) ((_ sign_extend 32) (currentBit!12000 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6033 (buf!6541 thiss!1005))) ((_ sign_extend 32) (currentByte!12005 thiss!1005)) ((_ sign_extend 32) (currentBit!12000 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21536 () Bool)

(assert (= bs!21536 d!85182))

(assert (=> bs!21536 m!382631))

(assert (=> b!253806 d!85182))

(declare-fun d!85184 () Bool)

(declare-fun lt!394731 () tuple2!21784)

(assert (=> d!85184 (= lt!394731 (readBit!0 (readerFrom!0 (_2!11818 lt!394114) (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005))))))

(assert (=> d!85184 (= (readBitPure!0 (readerFrom!0 (_2!11818 lt!394114) (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005))) (tuple2!21777 (_2!11823 lt!394731) (_1!11823 lt!394731)))))

(declare-fun bs!21537 () Bool)

(assert (= bs!21537 d!85184))

(assert (=> bs!21537 m!382097))

(declare-fun m!382635 () Bool)

(assert (=> bs!21537 m!382635))

(assert (=> b!253816 d!85184))

(declare-fun d!85186 () Bool)

(declare-fun e!176020 () Bool)

(assert (=> d!85186 e!176020))

(declare-fun res!212915 () Bool)

(assert (=> d!85186 (=> (not res!212915) (not e!176020))))

(assert (=> d!85186 (= res!212915 (invariant!0 (currentBit!12000 (_2!11818 lt!394114)) (currentByte!12005 (_2!11818 lt!394114)) (size!6033 (buf!6541 (_2!11818 lt!394114)))))))

(assert (=> d!85186 (= (readerFrom!0 (_2!11818 lt!394114) (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005)) (BitStream!10989 (buf!6541 (_2!11818 lt!394114)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005)))))

(declare-fun b!254074 () Bool)

(assert (=> b!254074 (= e!176020 (invariant!0 (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005) (size!6033 (buf!6541 (_2!11818 lt!394114)))))))

(assert (= (and d!85186 res!212915) b!254074))

(assert (=> d!85186 m!382629))

(assert (=> b!254074 m!382085))

(assert (=> b!253816 d!85186))

(declare-fun d!85188 () Bool)

(assert (=> d!85188 (= (inv!12 thiss!1005) (invariant!0 (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005) (size!6033 (buf!6541 thiss!1005))))))

(declare-fun bs!21538 () Bool)

(assert (= bs!21538 d!85188))

(assert (=> bs!21538 m!382633))

(assert (=> start!54316 d!85188))

(declare-fun d!85190 () Bool)

(declare-fun e!176021 () Bool)

(assert (=> d!85190 e!176021))

(declare-fun res!212917 () Bool)

(assert (=> d!85190 (=> (not res!212917) (not e!176021))))

(declare-fun lt!394733 () (_ BitVec 64))

(declare-fun lt!394734 () (_ BitVec 64))

(declare-fun lt!394735 () (_ BitVec 64))

(assert (=> d!85190 (= res!212917 (= lt!394734 (bvsub lt!394733 lt!394735)))))

(assert (=> d!85190 (or (= (bvand lt!394733 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394735 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!394733 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394733 lt!394735) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85190 (= lt!394735 (remainingBits!0 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394112)))) ((_ sign_extend 32) (currentByte!12005 (_2!11818 lt!394112))) ((_ sign_extend 32) (currentBit!12000 (_2!11818 lt!394112)))))))

(declare-fun lt!394737 () (_ BitVec 64))

(declare-fun lt!394736 () (_ BitVec 64))

(assert (=> d!85190 (= lt!394733 (bvmul lt!394737 lt!394736))))

(assert (=> d!85190 (or (= lt!394737 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!394736 (bvsdiv (bvmul lt!394737 lt!394736) lt!394737)))))

(assert (=> d!85190 (= lt!394736 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85190 (= lt!394737 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394112)))))))

(assert (=> d!85190 (= lt!394734 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12005 (_2!11818 lt!394112))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12000 (_2!11818 lt!394112)))))))

(assert (=> d!85190 (invariant!0 (currentBit!12000 (_2!11818 lt!394112)) (currentByte!12005 (_2!11818 lt!394112)) (size!6033 (buf!6541 (_2!11818 lt!394112))))))

(assert (=> d!85190 (= (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394112))) (currentByte!12005 (_2!11818 lt!394112)) (currentBit!12000 (_2!11818 lt!394112))) lt!394734)))

(declare-fun b!254075 () Bool)

(declare-fun res!212916 () Bool)

(assert (=> b!254075 (=> (not res!212916) (not e!176021))))

(assert (=> b!254075 (= res!212916 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!394734))))

(declare-fun b!254076 () Bool)

(declare-fun lt!394732 () (_ BitVec 64))

(assert (=> b!254076 (= e!176021 (bvsle lt!394734 (bvmul lt!394732 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254076 (or (= lt!394732 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!394732 #b0000000000000000000000000000000000000000000000000000000000001000) lt!394732)))))

(assert (=> b!254076 (= lt!394732 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394112)))))))

(assert (= (and d!85190 res!212917) b!254075))

(assert (= (and b!254075 res!212916) b!254076))

(declare-fun m!382637 () Bool)

(assert (=> d!85190 m!382637))

(declare-fun m!382639 () Bool)

(assert (=> d!85190 m!382639))

(assert (=> b!253815 d!85190))

(assert (=> b!253815 d!85178))

(declare-fun d!85192 () Bool)

(assert (=> d!85192 (= (array_inv!5774 (buf!6541 thiss!1005)) (bvsge (size!6033 (buf!6541 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!253804 d!85192))

(declare-fun d!85194 () Bool)

(declare-fun res!212918 () Bool)

(declare-fun e!176022 () Bool)

(assert (=> d!85194 (=> (not res!212918) (not e!176022))))

(assert (=> d!85194 (= res!212918 (= (size!6033 (buf!6541 thiss!1005)) (size!6033 (buf!6541 (_2!11818 lt!394114)))))))

(assert (=> d!85194 (= (isPrefixOf!0 thiss!1005 (_2!11818 lt!394114)) e!176022)))

(declare-fun b!254077 () Bool)

(declare-fun res!212920 () Bool)

(assert (=> b!254077 (=> (not res!212920) (not e!176022))))

(assert (=> b!254077 (= res!212920 (bvsle (bitIndex!0 (size!6033 (buf!6541 thiss!1005)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005)) (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394114))) (currentByte!12005 (_2!11818 lt!394114)) (currentBit!12000 (_2!11818 lt!394114)))))))

(declare-fun b!254078 () Bool)

(declare-fun e!176023 () Bool)

(assert (=> b!254078 (= e!176022 e!176023)))

(declare-fun res!212919 () Bool)

(assert (=> b!254078 (=> res!212919 e!176023)))

(assert (=> b!254078 (= res!212919 (= (size!6033 (buf!6541 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!254079 () Bool)

(assert (=> b!254079 (= e!176023 (arrayBitRangesEq!0 (buf!6541 thiss!1005) (buf!6541 (_2!11818 lt!394114)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6033 (buf!6541 thiss!1005)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005))))))

(assert (= (and d!85194 res!212918) b!254077))

(assert (= (and b!254077 res!212920) b!254078))

(assert (= (and b!254078 (not res!212919)) b!254079))

(assert (=> b!254077 m!382093))

(assert (=> b!254077 m!382091))

(assert (=> b!254079 m!382093))

(assert (=> b!254079 m!382093))

(declare-fun m!382641 () Bool)

(assert (=> b!254079 m!382641))

(assert (=> b!253814 d!85194))

(declare-fun d!85196 () Bool)

(declare-fun e!176024 () Bool)

(assert (=> d!85196 e!176024))

(declare-fun res!212922 () Bool)

(assert (=> d!85196 (=> (not res!212922) (not e!176024))))

(declare-fun lt!394740 () (_ BitVec 64))

(declare-fun lt!394741 () (_ BitVec 64))

(declare-fun lt!394739 () (_ BitVec 64))

(assert (=> d!85196 (= res!212922 (= lt!394740 (bvsub lt!394739 lt!394741)))))

(assert (=> d!85196 (or (= (bvand lt!394739 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394741 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!394739 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394739 lt!394741) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85196 (= lt!394741 (remainingBits!0 ((_ sign_extend 32) (size!6033 (buf!6541 (_1!11819 lt!394118)))) ((_ sign_extend 32) (currentByte!12005 (_1!11819 lt!394118))) ((_ sign_extend 32) (currentBit!12000 (_1!11819 lt!394118)))))))

(declare-fun lt!394743 () (_ BitVec 64))

(declare-fun lt!394742 () (_ BitVec 64))

(assert (=> d!85196 (= lt!394739 (bvmul lt!394743 lt!394742))))

(assert (=> d!85196 (or (= lt!394743 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!394742 (bvsdiv (bvmul lt!394743 lt!394742) lt!394743)))))

(assert (=> d!85196 (= lt!394742 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85196 (= lt!394743 ((_ sign_extend 32) (size!6033 (buf!6541 (_1!11819 lt!394118)))))))

(assert (=> d!85196 (= lt!394740 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12005 (_1!11819 lt!394118))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12000 (_1!11819 lt!394118)))))))

(assert (=> d!85196 (invariant!0 (currentBit!12000 (_1!11819 lt!394118)) (currentByte!12005 (_1!11819 lt!394118)) (size!6033 (buf!6541 (_1!11819 lt!394118))))))

(assert (=> d!85196 (= (bitIndex!0 (size!6033 (buf!6541 (_1!11819 lt!394118))) (currentByte!12005 (_1!11819 lt!394118)) (currentBit!12000 (_1!11819 lt!394118))) lt!394740)))

(declare-fun b!254080 () Bool)

(declare-fun res!212921 () Bool)

(assert (=> b!254080 (=> (not res!212921) (not e!176024))))

(assert (=> b!254080 (= res!212921 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!394740))))

(declare-fun b!254081 () Bool)

(declare-fun lt!394738 () (_ BitVec 64))

(assert (=> b!254081 (= e!176024 (bvsle lt!394740 (bvmul lt!394738 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254081 (or (= lt!394738 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!394738 #b0000000000000000000000000000000000000000000000000000000000001000) lt!394738)))))

(assert (=> b!254081 (= lt!394738 ((_ sign_extend 32) (size!6033 (buf!6541 (_1!11819 lt!394118)))))))

(assert (= (and d!85196 res!212922) b!254080))

(assert (= (and b!254080 res!212921) b!254081))

(declare-fun m!382643 () Bool)

(assert (=> d!85196 m!382643))

(declare-fun m!382645 () Bool)

(assert (=> d!85196 m!382645))

(assert (=> b!253803 d!85196))

(push 1)

(assert (not d!85168))

(assert (not b!254030))

(assert (not b!254005))

(assert (not d!85154))

(assert (not d!85162))

(assert (not d!85100))

(assert (not b!254067))

(assert (not b!254057))

(assert (not b!254027))

(assert (not b!254059))

(assert (not b!254074))

(assert (not d!85150))

(assert (not d!85180))

(assert (not b!254004))

(assert (not b!254062))

(assert (not b!254064))

(assert (not d!85098))

(assert (not d!85104))

(assert (not d!85178))

(assert (not d!85086))

(assert (not d!85088))

(assert (not d!85158))

(assert (not d!85184))

(assert (not d!85112))

(assert (not b!254077))

(assert (not b!253958))

(assert (not b!253993))

(assert (not d!85166))

(assert (not d!85190))

(assert (not d!85188))

(assert (not d!85160))

(assert (not d!85186))

(assert (not d!85196))

(assert (not b!254029))

(assert (not b!253994))

(assert (not d!85118))

(assert (not d!85152))

(assert (not d!85102))

(assert (not d!85172))

(assert (not b!253956))

(assert (not d!85080))

(assert (not d!85106))

(assert (not b!254007))

(assert (not b!253991))

(assert (not b!254079))

(assert (not d!85182))

(assert (not d!85164))

(assert (not d!85090))

(assert (not b!253992))

(assert (not b!254056))

(assert (not d!85170))

(assert (not d!85144))

(assert (not b!254028))

(assert (not b!254006))

(assert (not b!254058))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!85364 () Bool)

(assert (=> d!85364 (= (remainingBits!0 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394112)))) ((_ sign_extend 32) (currentByte!12005 (_2!11818 lt!394114))) ((_ sign_extend 32) (currentBit!12000 (_2!11818 lt!394114)))) (bvsub (bvmul ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394112)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12005 (_2!11818 lt!394114))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12000 (_2!11818 lt!394114))))))))

(assert (=> d!85170 d!85364))

(declare-fun d!85366 () Bool)

(declare-fun lt!394995 () tuple2!21784)

(assert (=> d!85366 (= lt!394995 (checkBitsLoop!0 (_1!11820 lt!394695) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!85366 (= (checkBitsLoopPure!0 (_1!11820 lt!394695) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21777 (_2!11823 lt!394995) (_1!11823 lt!394995)))))

(declare-fun bs!21564 () Bool)

(assert (= bs!21564 d!85366))

(declare-fun m!382991 () Bool)

(assert (=> bs!21564 m!382991))

(assert (=> b!254058 d!85366))

(declare-fun d!85368 () Bool)

(assert (=> d!85368 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394693)))) ((_ sign_extend 32) (currentByte!12005 (_2!11818 lt!394114))) ((_ sign_extend 32) (currentBit!12000 (_2!11818 lt!394114))) lt!394694) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394693)))) ((_ sign_extend 32) (currentByte!12005 (_2!11818 lt!394114))) ((_ sign_extend 32) (currentBit!12000 (_2!11818 lt!394114)))) lt!394694))))

(declare-fun bs!21565 () Bool)

(assert (= bs!21565 d!85368))

(declare-fun m!382993 () Bool)

(assert (=> bs!21565 m!382993))

(assert (=> b!254058 d!85368))

(declare-fun d!85370 () Bool)

(assert (=> d!85370 (validate_offset_bits!1 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394693)))) ((_ sign_extend 32) (currentByte!12005 (_2!11818 lt!394114))) ((_ sign_extend 32) (currentBit!12000 (_2!11818 lt!394114))) lt!394694)))

(declare-fun lt!394996 () Unit!18241)

(assert (=> d!85370 (= lt!394996 (choose!9 (_2!11818 lt!394114) (buf!6541 (_2!11818 lt!394693)) lt!394694 (BitStream!10989 (buf!6541 (_2!11818 lt!394693)) (currentByte!12005 (_2!11818 lt!394114)) (currentBit!12000 (_2!11818 lt!394114)))))))

(assert (=> d!85370 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11818 lt!394114) (buf!6541 (_2!11818 lt!394693)) lt!394694) lt!394996)))

(declare-fun bs!21566 () Bool)

(assert (= bs!21566 d!85370))

(assert (=> bs!21566 m!382589))

(declare-fun m!382995 () Bool)

(assert (=> bs!21566 m!382995))

(assert (=> b!254058 d!85370))

(declare-fun b!254290 () Bool)

(declare-fun e!176178 () Unit!18241)

(declare-fun Unit!18256 () Unit!18241)

(assert (=> b!254290 (= e!176178 Unit!18256)))

(declare-fun b!254291 () Bool)

(declare-fun res!213087 () Bool)

(declare-fun e!176177 () Bool)

(assert (=> b!254291 (=> (not res!213087) (not e!176177))))

(declare-fun lt!395006 () tuple2!21778)

(assert (=> b!254291 (= res!213087 (isPrefixOf!0 (_1!11820 lt!395006) (_2!11818 lt!394114)))))

(declare-fun b!254292 () Bool)

(declare-fun lt!395010 () Unit!18241)

(assert (=> b!254292 (= e!176178 lt!395010)))

(declare-fun lt!394999 () (_ BitVec 64))

(assert (=> b!254292 (= lt!394999 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!395000 () (_ BitVec 64))

(assert (=> b!254292 (= lt!395000 (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394114))) (currentByte!12005 (_2!11818 lt!394114)) (currentBit!12000 (_2!11818 lt!394114))))))

(assert (=> b!254292 (= lt!395010 (arrayBitRangesEqSymmetric!0 (buf!6541 (_2!11818 lt!394114)) (buf!6541 (_2!11818 lt!394693)) lt!394999 lt!395000))))

(assert (=> b!254292 (arrayBitRangesEq!0 (buf!6541 (_2!11818 lt!394693)) (buf!6541 (_2!11818 lt!394114)) lt!394999 lt!395000)))

(declare-fun b!254294 () Bool)

(declare-fun res!213089 () Bool)

(assert (=> b!254294 (=> (not res!213089) (not e!176177))))

(assert (=> b!254294 (= res!213089 (isPrefixOf!0 (_2!11820 lt!395006) (_2!11818 lt!394693)))))

(declare-fun d!85372 () Bool)

(assert (=> d!85372 e!176177))

(declare-fun res!213088 () Bool)

(assert (=> d!85372 (=> (not res!213088) (not e!176177))))

(assert (=> d!85372 (= res!213088 (isPrefixOf!0 (_1!11820 lt!395006) (_2!11820 lt!395006)))))

(declare-fun lt!395005 () BitStream!10988)

(assert (=> d!85372 (= lt!395006 (tuple2!21779 lt!395005 (_2!11818 lt!394693)))))

(declare-fun lt!395009 () Unit!18241)

(declare-fun lt!395008 () Unit!18241)

(assert (=> d!85372 (= lt!395009 lt!395008)))

(assert (=> d!85372 (isPrefixOf!0 lt!395005 (_2!11818 lt!394693))))

(assert (=> d!85372 (= lt!395008 (lemmaIsPrefixTransitive!0 lt!395005 (_2!11818 lt!394693) (_2!11818 lt!394693)))))

(declare-fun lt!395004 () Unit!18241)

(declare-fun lt!395012 () Unit!18241)

(assert (=> d!85372 (= lt!395004 lt!395012)))

(assert (=> d!85372 (isPrefixOf!0 lt!395005 (_2!11818 lt!394693))))

(assert (=> d!85372 (= lt!395012 (lemmaIsPrefixTransitive!0 lt!395005 (_2!11818 lt!394114) (_2!11818 lt!394693)))))

(declare-fun lt!395002 () Unit!18241)

(assert (=> d!85372 (= lt!395002 e!176178)))

(declare-fun c!11723 () Bool)

(assert (=> d!85372 (= c!11723 (not (= (size!6033 (buf!6541 (_2!11818 lt!394114))) #b00000000000000000000000000000000)))))

(declare-fun lt!394997 () Unit!18241)

(declare-fun lt!395001 () Unit!18241)

(assert (=> d!85372 (= lt!394997 lt!395001)))

(assert (=> d!85372 (isPrefixOf!0 (_2!11818 lt!394693) (_2!11818 lt!394693))))

(assert (=> d!85372 (= lt!395001 (lemmaIsPrefixRefl!0 (_2!11818 lt!394693)))))

(declare-fun lt!395016 () Unit!18241)

(declare-fun lt!395011 () Unit!18241)

(assert (=> d!85372 (= lt!395016 lt!395011)))

(assert (=> d!85372 (= lt!395011 (lemmaIsPrefixRefl!0 (_2!11818 lt!394693)))))

(declare-fun lt!395014 () Unit!18241)

(declare-fun lt!394998 () Unit!18241)

(assert (=> d!85372 (= lt!395014 lt!394998)))

(assert (=> d!85372 (isPrefixOf!0 lt!395005 lt!395005)))

(assert (=> d!85372 (= lt!394998 (lemmaIsPrefixRefl!0 lt!395005))))

(declare-fun lt!395003 () Unit!18241)

(declare-fun lt!395015 () Unit!18241)

(assert (=> d!85372 (= lt!395003 lt!395015)))

(assert (=> d!85372 (isPrefixOf!0 (_2!11818 lt!394114) (_2!11818 lt!394114))))

(assert (=> d!85372 (= lt!395015 (lemmaIsPrefixRefl!0 (_2!11818 lt!394114)))))

(assert (=> d!85372 (= lt!395005 (BitStream!10989 (buf!6541 (_2!11818 lt!394693)) (currentByte!12005 (_2!11818 lt!394114)) (currentBit!12000 (_2!11818 lt!394114))))))

(assert (=> d!85372 (isPrefixOf!0 (_2!11818 lt!394114) (_2!11818 lt!394693))))

(assert (=> d!85372 (= (reader!0 (_2!11818 lt!394114) (_2!11818 lt!394693)) lt!395006)))

(declare-fun b!254293 () Bool)

(declare-fun lt!395007 () (_ BitVec 64))

(declare-fun lt!395013 () (_ BitVec 64))

(assert (=> b!254293 (= e!176177 (= (_1!11820 lt!395006) (withMovedBitIndex!0 (_2!11820 lt!395006) (bvsub lt!395007 lt!395013))))))

(assert (=> b!254293 (or (= (bvand lt!395007 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!395013 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!395007 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!395007 lt!395013) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!254293 (= lt!395013 (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394693))) (currentByte!12005 (_2!11818 lt!394693)) (currentBit!12000 (_2!11818 lt!394693))))))

(assert (=> b!254293 (= lt!395007 (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394114))) (currentByte!12005 (_2!11818 lt!394114)) (currentBit!12000 (_2!11818 lt!394114))))))

(assert (= (and d!85372 c!11723) b!254292))

(assert (= (and d!85372 (not c!11723)) b!254290))

(assert (= (and d!85372 res!213088) b!254291))

(assert (= (and b!254291 res!213087) b!254294))

(assert (= (and b!254294 res!213089) b!254293))

(assert (=> d!85372 m!382525))

(declare-fun m!382997 () Bool)

(assert (=> d!85372 m!382997))

(declare-fun m!382999 () Bool)

(assert (=> d!85372 m!382999))

(declare-fun m!383001 () Bool)

(assert (=> d!85372 m!383001))

(declare-fun m!383003 () Bool)

(assert (=> d!85372 m!383003))

(assert (=> d!85372 m!382535))

(assert (=> d!85372 m!382595))

(declare-fun m!383005 () Bool)

(assert (=> d!85372 m!383005))

(declare-fun m!383007 () Bool)

(assert (=> d!85372 m!383007))

(declare-fun m!383009 () Bool)

(assert (=> d!85372 m!383009))

(declare-fun m!383011 () Bool)

(assert (=> d!85372 m!383011))

(declare-fun m!383013 () Bool)

(assert (=> b!254294 m!383013))

(declare-fun m!383015 () Bool)

(assert (=> b!254291 m!383015))

(declare-fun m!383017 () Bool)

(assert (=> b!254293 m!383017))

(assert (=> b!254293 m!382601))

(assert (=> b!254293 m!382091))

(assert (=> b!254292 m!382091))

(declare-fun m!383019 () Bool)

(assert (=> b!254292 m!383019))

(declare-fun m!383021 () Bool)

(assert (=> b!254292 m!383021))

(assert (=> b!254058 d!85372))

(declare-fun call!3997 () Bool)

(declare-fun bm!3994 () Bool)

(declare-datatypes ((tuple4!304 0))(
  ( (tuple4!305 (_1!11825 (_ BitVec 32)) (_2!11825 (_ BitVec 32)) (_3!932 (_ BitVec 32)) (_4!152 (_ BitVec 32))) )
))
(declare-fun lt!395025 () tuple4!304)

(declare-fun lt!395024 () (_ BitVec 32))

(declare-fun lt!395023 () (_ BitVec 32))

(declare-fun c!11726 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!3994 (= call!3997 (byteRangesEq!0 (select (arr!7020 (buf!6541 (_2!11818 lt!394114))) (_3!932 lt!395025)) (select (arr!7020 (buf!6541 (_2!11818 lt!394112))) (_3!932 lt!395025)) lt!395023 (ite c!11726 lt!395024 #b00000000000000000000000000001000)))))

(declare-fun d!85374 () Bool)

(declare-fun res!213103 () Bool)

(declare-fun e!176191 () Bool)

(assert (=> d!85374 (=> res!213103 e!176191)))

(assert (=> d!85374 (= res!213103 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394114))) (currentByte!12005 (_2!11818 lt!394114)) (currentBit!12000 (_2!11818 lt!394114)))))))

(assert (=> d!85374 (= (arrayBitRangesEq!0 (buf!6541 (_2!11818 lt!394114)) (buf!6541 (_2!11818 lt!394112)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394114))) (currentByte!12005 (_2!11818 lt!394114)) (currentBit!12000 (_2!11818 lt!394114)))) e!176191)))

(declare-fun b!254309 () Bool)

(declare-fun e!176195 () Bool)

(assert (=> b!254309 (= e!176191 e!176195)))

(declare-fun res!213100 () Bool)

(assert (=> b!254309 (=> (not res!213100) (not e!176195))))

(declare-fun e!176192 () Bool)

(assert (=> b!254309 (= res!213100 e!176192)))

(declare-fun res!213104 () Bool)

(assert (=> b!254309 (=> res!213104 e!176192)))

(assert (=> b!254309 (= res!213104 (bvsge (_1!11825 lt!395025) (_2!11825 lt!395025)))))

(assert (=> b!254309 (= lt!395024 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394114))) (currentByte!12005 (_2!11818 lt!394114)) (currentBit!12000 (_2!11818 lt!394114))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254309 (= lt!395023 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!304)

(assert (=> b!254309 (= lt!395025 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394114))) (currentByte!12005 (_2!11818 lt!394114)) (currentBit!12000 (_2!11818 lt!394114)))))))

(declare-fun b!254310 () Bool)

(declare-fun res!213101 () Bool)

(assert (=> b!254310 (= res!213101 (= lt!395024 #b00000000000000000000000000000000))))

(declare-fun e!176196 () Bool)

(assert (=> b!254310 (=> res!213101 e!176196)))

(declare-fun e!176194 () Bool)

(assert (=> b!254310 (= e!176194 e!176196)))

(declare-fun b!254311 () Bool)

(declare-fun e!176193 () Bool)

(assert (=> b!254311 (= e!176195 e!176193)))

(assert (=> b!254311 (= c!11726 (= (_3!932 lt!395025) (_4!152 lt!395025)))))

(declare-fun b!254312 () Bool)

(assert (=> b!254312 (= e!176196 (byteRangesEq!0 (select (arr!7020 (buf!6541 (_2!11818 lt!394114))) (_4!152 lt!395025)) (select (arr!7020 (buf!6541 (_2!11818 lt!394112))) (_4!152 lt!395025)) #b00000000000000000000000000000000 lt!395024))))

(declare-fun b!254313 () Bool)

(assert (=> b!254313 (= e!176193 call!3997)))

(declare-fun b!254314 () Bool)

(assert (=> b!254314 (= e!176193 e!176194)))

(declare-fun res!213102 () Bool)

(assert (=> b!254314 (= res!213102 call!3997)))

(assert (=> b!254314 (=> (not res!213102) (not e!176194))))

(declare-fun b!254315 () Bool)

(declare-fun arrayRangesEq!929 (array!13751 array!13751 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!254315 (= e!176192 (arrayRangesEq!929 (buf!6541 (_2!11818 lt!394114)) (buf!6541 (_2!11818 lt!394112)) (_1!11825 lt!395025) (_2!11825 lt!395025)))))

(assert (= (and d!85374 (not res!213103)) b!254309))

(assert (= (and b!254309 (not res!213104)) b!254315))

(assert (= (and b!254309 res!213100) b!254311))

(assert (= (and b!254311 c!11726) b!254313))

(assert (= (and b!254311 (not c!11726)) b!254314))

(assert (= (and b!254314 res!213102) b!254310))

(assert (= (and b!254310 (not res!213101)) b!254312))

(assert (= (or b!254313 b!254314) bm!3994))

(declare-fun m!383023 () Bool)

(assert (=> bm!3994 m!383023))

(declare-fun m!383025 () Bool)

(assert (=> bm!3994 m!383025))

(assert (=> bm!3994 m!383023))

(assert (=> bm!3994 m!383025))

(declare-fun m!383027 () Bool)

(assert (=> bm!3994 m!383027))

(assert (=> b!254309 m!382091))

(declare-fun m!383029 () Bool)

(assert (=> b!254309 m!383029))

(declare-fun m!383031 () Bool)

(assert (=> b!254312 m!383031))

(declare-fun m!383033 () Bool)

(assert (=> b!254312 m!383033))

(assert (=> b!254312 m!383031))

(assert (=> b!254312 m!383033))

(declare-fun m!383035 () Bool)

(assert (=> b!254312 m!383035))

(declare-fun m!383037 () Bool)

(assert (=> b!254315 m!383037))

(assert (=> b!253958 d!85374))

(assert (=> b!253958 d!85178))

(assert (=> b!253956 d!85178))

(assert (=> b!253956 d!85190))

(declare-fun call!3998 () Bool)

(declare-fun bm!3995 () Bool)

(declare-fun lt!395027 () (_ BitVec 32))

(declare-fun lt!395026 () (_ BitVec 32))

(declare-fun lt!395028 () tuple4!304)

(declare-fun c!11727 () Bool)

(assert (=> bm!3995 (= call!3998 (byteRangesEq!0 (select (arr!7020 (buf!6541 thiss!1005)) (_3!932 lt!395028)) (select (arr!7020 (buf!6541 (_2!11818 lt!394112))) (_3!932 lt!395028)) lt!395026 (ite c!11727 lt!395027 #b00000000000000000000000000001000)))))

(declare-fun d!85376 () Bool)

(declare-fun res!213108 () Bool)

(declare-fun e!176197 () Bool)

(assert (=> d!85376 (=> res!213108 e!176197)))

(assert (=> d!85376 (= res!213108 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6033 (buf!6541 thiss!1005)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005))))))

(assert (=> d!85376 (= (arrayBitRangesEq!0 (buf!6541 thiss!1005) (buf!6541 (_2!11818 lt!394112)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6033 (buf!6541 thiss!1005)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005))) e!176197)))

(declare-fun b!254316 () Bool)

(declare-fun e!176201 () Bool)

(assert (=> b!254316 (= e!176197 e!176201)))

(declare-fun res!213105 () Bool)

(assert (=> b!254316 (=> (not res!213105) (not e!176201))))

(declare-fun e!176198 () Bool)

(assert (=> b!254316 (= res!213105 e!176198)))

(declare-fun res!213109 () Bool)

(assert (=> b!254316 (=> res!213109 e!176198)))

(assert (=> b!254316 (= res!213109 (bvsge (_1!11825 lt!395028) (_2!11825 lt!395028)))))

(assert (=> b!254316 (= lt!395027 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6033 (buf!6541 thiss!1005)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254316 (= lt!395026 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254316 (= lt!395028 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6033 (buf!6541 thiss!1005)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005))))))

(declare-fun b!254317 () Bool)

(declare-fun res!213106 () Bool)

(assert (=> b!254317 (= res!213106 (= lt!395027 #b00000000000000000000000000000000))))

(declare-fun e!176202 () Bool)

(assert (=> b!254317 (=> res!213106 e!176202)))

(declare-fun e!176200 () Bool)

(assert (=> b!254317 (= e!176200 e!176202)))

(declare-fun b!254318 () Bool)

(declare-fun e!176199 () Bool)

(assert (=> b!254318 (= e!176201 e!176199)))

(assert (=> b!254318 (= c!11727 (= (_3!932 lt!395028) (_4!152 lt!395028)))))

(declare-fun b!254319 () Bool)

(assert (=> b!254319 (= e!176202 (byteRangesEq!0 (select (arr!7020 (buf!6541 thiss!1005)) (_4!152 lt!395028)) (select (arr!7020 (buf!6541 (_2!11818 lt!394112))) (_4!152 lt!395028)) #b00000000000000000000000000000000 lt!395027))))

(declare-fun b!254320 () Bool)

(assert (=> b!254320 (= e!176199 call!3998)))

(declare-fun b!254321 () Bool)

(assert (=> b!254321 (= e!176199 e!176200)))

(declare-fun res!213107 () Bool)

(assert (=> b!254321 (= res!213107 call!3998)))

(assert (=> b!254321 (=> (not res!213107) (not e!176200))))

(declare-fun b!254322 () Bool)

(assert (=> b!254322 (= e!176198 (arrayRangesEq!929 (buf!6541 thiss!1005) (buf!6541 (_2!11818 lt!394112)) (_1!11825 lt!395028) (_2!11825 lt!395028)))))

(assert (= (and d!85376 (not res!213108)) b!254316))

(assert (= (and b!254316 (not res!213109)) b!254322))

(assert (= (and b!254316 res!213105) b!254318))

(assert (= (and b!254318 c!11727) b!254320))

(assert (= (and b!254318 (not c!11727)) b!254321))

(assert (= (and b!254321 res!213107) b!254317))

(assert (= (and b!254317 (not res!213106)) b!254319))

(assert (= (or b!254320 b!254321) bm!3995))

(declare-fun m!383039 () Bool)

(assert (=> bm!3995 m!383039))

(declare-fun m!383041 () Bool)

(assert (=> bm!3995 m!383041))

(assert (=> bm!3995 m!383039))

(assert (=> bm!3995 m!383041))

(declare-fun m!383043 () Bool)

(assert (=> bm!3995 m!383043))

(assert (=> b!254316 m!382093))

(declare-fun m!383045 () Bool)

(assert (=> b!254316 m!383045))

(declare-fun m!383047 () Bool)

(assert (=> b!254319 m!383047))

(declare-fun m!383049 () Bool)

(assert (=> b!254319 m!383049))

(assert (=> b!254319 m!383047))

(assert (=> b!254319 m!383049))

(declare-fun m!383051 () Bool)

(assert (=> b!254319 m!383051))

(declare-fun m!383053 () Bool)

(assert (=> b!254322 m!383053))

(assert (=> b!254064 d!85376))

(assert (=> b!254064 d!85180))

(declare-fun b!254332 () Bool)

(declare-fun res!213116 () Bool)

(declare-fun e!176210 () Bool)

(assert (=> b!254332 (=> (not res!213116) (not e!176210))))

(declare-fun _$23!45 () tuple2!21774)

(assert (=> b!254332 (= res!213116 (= (bitIndex!0 (size!6033 (buf!6541 (_2!11818 _$23!45))) (currentByte!12005 (_2!11818 _$23!45)) (currentBit!12000 (_2!11818 _$23!45))) (bvadd (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394114))) (currentByte!12005 (_2!11818 lt!394114)) (currentBit!12000 (_2!11818 lt!394114))) (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))))

(declare-fun b!254334 () Bool)

(declare-fun lt!395040 () tuple2!21776)

(declare-fun lt!395043 () tuple2!21778)

(assert (=> b!254334 (= e!176210 (and (_2!11819 lt!395040) (= (_1!11819 lt!395040) (_2!11820 lt!395043))))))

(assert (=> b!254334 (= lt!395040 (checkBitsLoopPure!0 (_1!11820 lt!395043) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!395039 () Unit!18241)

(declare-fun lt!395042 () Unit!18241)

(assert (=> b!254334 (= lt!395039 lt!395042)))

(declare-fun lt!395041 () (_ BitVec 64))

(assert (=> b!254334 (validate_offset_bits!1 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 _$23!45)))) ((_ sign_extend 32) (currentByte!12005 (_2!11818 lt!394114))) ((_ sign_extend 32) (currentBit!12000 (_2!11818 lt!394114))) lt!395041)))

(assert (=> b!254334 (= lt!395042 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11818 lt!394114) (buf!6541 (_2!11818 _$23!45)) lt!395041))))

(assert (=> b!254334 (= lt!395041 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!254334 (= lt!395043 (reader!0 (_2!11818 lt!394114) (_2!11818 _$23!45)))))

(declare-fun b!254333 () Bool)

(declare-fun res!213118 () Bool)

(assert (=> b!254333 (=> (not res!213118) (not e!176210))))

(assert (=> b!254333 (= res!213118 (isPrefixOf!0 (_2!11818 lt!394114) (_2!11818 _$23!45)))))

(declare-fun d!85378 () Bool)

(assert (=> d!85378 e!176210))

(declare-fun res!213117 () Bool)

(assert (=> d!85378 (=> (not res!213117) (not e!176210))))

(assert (=> d!85378 (= res!213117 (= (size!6033 (buf!6541 (_2!11818 lt!394114))) (size!6033 (buf!6541 (_2!11818 _$23!45)))))))

(declare-fun e!176209 () Bool)

(assert (=> d!85378 (and (inv!12 (_2!11818 _$23!45)) e!176209)))

(assert (=> d!85378 (= (choose!51 (_2!11818 lt!394114) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) _$23!45)))

(declare-fun b!254331 () Bool)

(assert (=> b!254331 (= e!176209 (array_inv!5774 (buf!6541 (_2!11818 _$23!45))))))

(assert (= d!85378 b!254331))

(assert (= (and d!85378 res!213117) b!254332))

(assert (= (and b!254332 res!213116) b!254333))

(assert (= (and b!254333 res!213118) b!254334))

(declare-fun m!383055 () Bool)

(assert (=> b!254331 m!383055))

(declare-fun m!383057 () Bool)

(assert (=> b!254334 m!383057))

(declare-fun m!383059 () Bool)

(assert (=> b!254334 m!383059))

(declare-fun m!383061 () Bool)

(assert (=> b!254334 m!383061))

(declare-fun m!383063 () Bool)

(assert (=> b!254334 m!383063))

(declare-fun m!383065 () Bool)

(assert (=> b!254333 m!383065))

(declare-fun m!383067 () Bool)

(assert (=> d!85378 m!383067))

(declare-fun m!383069 () Bool)

(assert (=> b!254332 m!383069))

(assert (=> b!254332 m!382091))

(assert (=> d!85144 d!85378))

(assert (=> b!254062 d!85180))

(assert (=> b!254062 d!85190))

(declare-fun d!85380 () Bool)

(declare-fun e!176212 () Bool)

(assert (=> d!85380 e!176212))

(declare-fun res!213120 () Bool)

(assert (=> d!85380 (=> (not res!213120) (not e!176212))))

(declare-fun lt!395047 () (_ BitVec 64))

(declare-fun lt!395046 () (_ BitVec 64))

(declare-fun lt!395045 () (_ BitVec 64))

(assert (=> d!85380 (= res!213120 (= lt!395046 (bvsub lt!395045 lt!395047)))))

(assert (=> d!85380 (or (= (bvand lt!395045 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!395047 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!395045 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!395045 lt!395047) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85380 (= lt!395047 (remainingBits!0 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394693)))) ((_ sign_extend 32) (currentByte!12005 (_2!11818 lt!394693))) ((_ sign_extend 32) (currentBit!12000 (_2!11818 lt!394693)))))))

(declare-fun lt!395049 () (_ BitVec 64))

(declare-fun lt!395048 () (_ BitVec 64))

(assert (=> d!85380 (= lt!395045 (bvmul lt!395049 lt!395048))))

(assert (=> d!85380 (or (= lt!395049 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!395048 (bvsdiv (bvmul lt!395049 lt!395048) lt!395049)))))

(assert (=> d!85380 (= lt!395048 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85380 (= lt!395049 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394693)))))))

(assert (=> d!85380 (= lt!395046 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12005 (_2!11818 lt!394693))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12000 (_2!11818 lt!394693)))))))

(assert (=> d!85380 (invariant!0 (currentBit!12000 (_2!11818 lt!394693)) (currentByte!12005 (_2!11818 lt!394693)) (size!6033 (buf!6541 (_2!11818 lt!394693))))))

(assert (=> d!85380 (= (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394693))) (currentByte!12005 (_2!11818 lt!394693)) (currentBit!12000 (_2!11818 lt!394693))) lt!395046)))

(declare-fun b!254335 () Bool)

(declare-fun res!213119 () Bool)

(assert (=> b!254335 (=> (not res!213119) (not e!176212))))

(assert (=> b!254335 (= res!213119 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!395046))))

(declare-fun b!254336 () Bool)

(declare-fun lt!395044 () (_ BitVec 64))

(assert (=> b!254336 (= e!176212 (bvsle lt!395046 (bvmul lt!395044 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254336 (or (= lt!395044 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!395044 #b0000000000000000000000000000000000000000000000000000000000001000) lt!395044)))))

(assert (=> b!254336 (= lt!395044 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394693)))))))

(assert (= (and d!85380 res!213120) b!254335))

(assert (= (and b!254335 res!213119) b!254336))

(declare-fun m!383071 () Bool)

(assert (=> d!85380 m!383071))

(declare-fun m!383073 () Bool)

(assert (=> d!85380 m!383073))

(assert (=> b!254056 d!85380))

(assert (=> b!254056 d!85178))

(declare-fun d!85382 () Bool)

(assert (=> d!85382 (= (remainingBits!0 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394112)))) ((_ sign_extend 32) (currentByte!12005 thiss!1005)) ((_ sign_extend 32) (currentBit!12000 thiss!1005))) (bvsub (bvmul ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394112)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12005 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12000 thiss!1005)))))))

(assert (=> d!85150 d!85382))

(declare-fun d!85384 () Bool)

(assert (=> d!85384 (= (remainingBits!0 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394114)))) ((_ sign_extend 32) (currentByte!12005 (_2!11818 lt!394114))) ((_ sign_extend 32) (currentBit!12000 (_2!11818 lt!394114)))) (bvsub (bvmul ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394114)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12005 (_2!11818 lt!394114))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12000 (_2!11818 lt!394114))))))))

(assert (=> d!85088 d!85384))

(declare-fun d!85386 () Bool)

(assert (=> d!85386 (= (remainingBits!0 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394112)))) ((_ sign_extend 32) (currentByte!12005 (_2!11818 lt!394112))) ((_ sign_extend 32) (currentBit!12000 (_2!11818 lt!394112)))) (bvsub (bvmul ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394112)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12005 (_2!11818 lt!394112))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12000 (_2!11818 lt!394112))))))))

(assert (=> d!85190 d!85386))

(declare-fun d!85388 () Bool)

(assert (=> d!85388 (= (invariant!0 (currentBit!12000 (_2!11818 lt!394112)) (currentByte!12005 (_2!11818 lt!394112)) (size!6033 (buf!6541 (_2!11818 lt!394112)))) (and (bvsge (currentBit!12000 (_2!11818 lt!394112)) #b00000000000000000000000000000000) (bvslt (currentBit!12000 (_2!11818 lt!394112)) #b00000000000000000000000000001000) (bvsge (currentByte!12005 (_2!11818 lt!394112)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12005 (_2!11818 lt!394112)) (size!6033 (buf!6541 (_2!11818 lt!394112)))) (and (= (currentBit!12000 (_2!11818 lt!394112)) #b00000000000000000000000000000000) (= (currentByte!12005 (_2!11818 lt!394112)) (size!6033 (buf!6541 (_2!11818 lt!394112))))))))))

(assert (=> d!85190 d!85388))

(declare-fun b!254355 () Bool)

(declare-fun e!176226 () tuple2!21784)

(assert (=> b!254355 (= e!176226 (tuple2!21785 true (_1!11820 lt!394119)))))

(declare-fun b!254356 () Bool)

(declare-fun e!176227 () Bool)

(declare-fun lt!395082 () tuple2!21784)

(declare-fun lt!395080 () (_ BitVec 64))

(assert (=> b!254356 (= e!176227 (= (bvsub lt!395080 from!289) (bitIndex!0 (size!6033 (buf!6541 (_2!11823 lt!395082))) (currentByte!12005 (_2!11823 lt!395082)) (currentBit!12000 (_2!11823 lt!395082)))))))

(assert (=> b!254356 (or (= (bvand lt!395080 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!395080 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!395080 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!395077 () (_ BitVec 64))

(assert (=> b!254356 (= lt!395080 (bvadd lt!395077 nBits!297))))

(assert (=> b!254356 (or (not (= (bvand lt!395077 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!395077 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!395077 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!254356 (= lt!395077 (bitIndex!0 (size!6033 (buf!6541 (_1!11820 lt!394119))) (currentByte!12005 (_1!11820 lt!394119)) (currentBit!12000 (_1!11820 lt!394119))))))

(declare-fun b!254357 () Bool)

(declare-fun res!213131 () Bool)

(declare-fun e!176225 () Bool)

(assert (=> b!254357 (=> (not res!213131) (not e!176225))))

(assert (=> b!254357 (= res!213131 e!176227)))

(declare-fun res!213135 () Bool)

(assert (=> b!254357 (=> res!213135 e!176227)))

(assert (=> b!254357 (= res!213135 (not (_1!11823 lt!395082)))))

(declare-fun b!254359 () Bool)

(declare-fun res!213132 () Bool)

(assert (=> b!254359 (=> (not res!213132) (not e!176225))))

(assert (=> b!254359 (= res!213132 (and (= (buf!6541 (_1!11820 lt!394119)) (buf!6541 (_2!11823 lt!395082))) (or (not (= nBits!297 from!289)) (_1!11823 lt!395082))))))

(declare-fun lt!395072 () tuple2!21784)

(declare-fun b!254360 () Bool)

(declare-fun lt!395076 () tuple2!21784)

(assert (=> b!254360 (= lt!395076 (checkBitsLoop!0 (_2!11823 lt!395072) nBits!297 bit!26 (bvadd from!289 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!395081 () Unit!18241)

(declare-fun lt!395074 () Unit!18241)

(assert (=> b!254360 (= lt!395081 lt!395074)))

(declare-fun lt!395073 () (_ BitVec 64))

(declare-fun lt!395079 () (_ BitVec 64))

(assert (=> b!254360 (validate_offset_bits!1 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11823 lt!395072)))) ((_ sign_extend 32) (currentByte!12005 (_2!11823 lt!395072))) ((_ sign_extend 32) (currentBit!12000 (_2!11823 lt!395072))) (bvsub lt!395073 lt!395079))))

(assert (=> b!254360 (= lt!395074 (validateOffsetBitsIneqLemma!0 (_1!11820 lt!394119) (_2!11823 lt!395072) lt!395073 lt!395079))))

(assert (=> b!254360 (= lt!395079 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!254360 (= lt!395073 (bvsub nBits!297 from!289))))

(declare-fun e!176224 () tuple2!21784)

(assert (=> b!254360 (= e!176224 (tuple2!21785 (_1!11823 lt!395076) (_2!11823 lt!395076)))))

(declare-fun b!254361 () Bool)

(declare-fun e!176223 () Bool)

(assert (=> b!254361 (= e!176223 (= bit!26 (_2!11819 (readBitPure!0 (_1!11820 lt!394119)))))))

(declare-fun b!254362 () Bool)

(assert (=> b!254362 (= e!176226 e!176224)))

(assert (=> b!254362 (= lt!395072 (readBit!0 (_1!11820 lt!394119)))))

(declare-fun c!11732 () Bool)

(assert (=> b!254362 (= c!11732 (not (= (_1!11823 lt!395072) bit!26)))))

(declare-fun b!254363 () Bool)

(assert (=> b!254363 (= e!176225 e!176223)))

(declare-fun res!213134 () Bool)

(assert (=> b!254363 (=> res!213134 e!176223)))

(assert (=> b!254363 (= res!213134 (or (not (_1!11823 lt!395082)) (bvsge from!289 nBits!297)))))

(declare-fun b!254358 () Bool)

(assert (=> b!254358 (= e!176224 (tuple2!21785 false (_2!11823 lt!395072)))))

(declare-fun d!85390 () Bool)

(assert (=> d!85390 e!176225))

(declare-fun res!213133 () Bool)

(assert (=> d!85390 (=> (not res!213133) (not e!176225))))

(declare-fun lt!395075 () (_ BitVec 64))

(assert (=> d!85390 (= res!213133 (bvsge (bvsub lt!395075 from!289) (bitIndex!0 (size!6033 (buf!6541 (_2!11823 lt!395082))) (currentByte!12005 (_2!11823 lt!395082)) (currentBit!12000 (_2!11823 lt!395082)))))))

(assert (=> d!85390 (or (= (bvand lt!395075 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!395075 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!395075 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!395078 () (_ BitVec 64))

(assert (=> d!85390 (= lt!395075 (bvadd lt!395078 nBits!297))))

(assert (=> d!85390 (or (not (= (bvand lt!395078 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!395078 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!395078 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85390 (= lt!395078 (bitIndex!0 (size!6033 (buf!6541 (_1!11820 lt!394119))) (currentByte!12005 (_1!11820 lt!394119)) (currentBit!12000 (_1!11820 lt!394119))))))

(assert (=> d!85390 (= lt!395082 e!176226)))

(declare-fun c!11733 () Bool)

(assert (=> d!85390 (= c!11733 (= from!289 nBits!297))))

(assert (=> d!85390 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!85390 (= (checkBitsLoop!0 (_1!11820 lt!394119) nBits!297 bit!26 from!289) lt!395082)))

(assert (= (and d!85390 c!11733) b!254355))

(assert (= (and d!85390 (not c!11733)) b!254362))

(assert (= (and b!254362 c!11732) b!254358))

(assert (= (and b!254362 (not c!11732)) b!254360))

(assert (= (and d!85390 res!213133) b!254359))

(assert (= (and b!254359 res!213132) b!254357))

(assert (= (and b!254357 (not res!213135)) b!254356))

(assert (= (and b!254357 res!213131) b!254363))

(assert (= (and b!254363 (not res!213134)) b!254361))

(declare-fun m!383075 () Bool)

(assert (=> d!85390 m!383075))

(assert (=> d!85390 m!382417))

(declare-fun m!383077 () Bool)

(assert (=> b!254360 m!383077))

(declare-fun m!383079 () Bool)

(assert (=> b!254360 m!383079))

(declare-fun m!383081 () Bool)

(assert (=> b!254360 m!383081))

(assert (=> b!254361 m!382141))

(assert (=> b!254362 m!382499))

(assert (=> b!254356 m!383075))

(assert (=> b!254356 m!382417))

(assert (=> d!85164 d!85390))

(declare-fun d!85392 () Bool)

(assert (=> d!85392 (= (remainingBits!0 ((_ sign_extend 32) (size!6033 (buf!6541 (_1!11819 lt!394110)))) ((_ sign_extend 32) (currentByte!12005 (_1!11819 lt!394110))) ((_ sign_extend 32) (currentBit!12000 (_1!11819 lt!394110)))) (bvsub (bvmul ((_ sign_extend 32) (size!6033 (buf!6541 (_1!11819 lt!394110)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12005 (_1!11819 lt!394110))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12000 (_1!11819 lt!394110))))))))

(assert (=> d!85154 d!85392))

(declare-fun d!85394 () Bool)

(assert (=> d!85394 (= (invariant!0 (currentBit!12000 (_1!11819 lt!394110)) (currentByte!12005 (_1!11819 lt!394110)) (size!6033 (buf!6541 (_1!11819 lt!394110)))) (and (bvsge (currentBit!12000 (_1!11819 lt!394110)) #b00000000000000000000000000000000) (bvslt (currentBit!12000 (_1!11819 lt!394110)) #b00000000000000000000000000001000) (bvsge (currentByte!12005 (_1!11819 lt!394110)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12005 (_1!11819 lt!394110)) (size!6033 (buf!6541 (_1!11819 lt!394110)))) (and (= (currentBit!12000 (_1!11819 lt!394110)) #b00000000000000000000000000000000) (= (currentByte!12005 (_1!11819 lt!394110)) (size!6033 (buf!6541 (_1!11819 lt!394110))))))))))

(assert (=> d!85154 d!85394))

(declare-fun d!85396 () Bool)

(assert (=> d!85396 (= (invariant!0 (currentBit!12000 (_2!11818 lt!394114)) (currentByte!12005 (_2!11818 lt!394114)) (size!6033 (buf!6541 (_2!11818 lt!394114)))) (and (bvsge (currentBit!12000 (_2!11818 lt!394114)) #b00000000000000000000000000000000) (bvslt (currentBit!12000 (_2!11818 lt!394114)) #b00000000000000000000000000001000) (bvsge (currentByte!12005 (_2!11818 lt!394114)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12005 (_2!11818 lt!394114)) (size!6033 (buf!6541 (_2!11818 lt!394114)))) (and (= (currentBit!12000 (_2!11818 lt!394114)) #b00000000000000000000000000000000) (= (currentByte!12005 (_2!11818 lt!394114)) (size!6033 (buf!6541 (_2!11818 lt!394114))))))))))

(assert (=> d!85186 d!85396))

(declare-fun d!85398 () Bool)

(declare-fun e!176228 () Bool)

(assert (=> d!85398 e!176228))

(declare-fun res!213137 () Bool)

(assert (=> d!85398 (=> (not res!213137) (not e!176228))))

(declare-fun lt!395085 () (_ BitVec 64))

(declare-fun lt!395086 () (_ BitVec 64))

(declare-fun lt!395084 () (_ BitVec 64))

(assert (=> d!85398 (= res!213137 (= lt!395085 (bvsub lt!395084 lt!395086)))))

(assert (=> d!85398 (or (= (bvand lt!395084 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!395086 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!395084 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!395084 lt!395086) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85398 (= lt!395086 (remainingBits!0 ((_ sign_extend 32) (size!6033 (buf!6541 lt!394450))) ((_ sign_extend 32) (currentByte!12005 lt!394450)) ((_ sign_extend 32) (currentBit!12000 lt!394450))))))

(declare-fun lt!395088 () (_ BitVec 64))

(declare-fun lt!395087 () (_ BitVec 64))

(assert (=> d!85398 (= lt!395084 (bvmul lt!395088 lt!395087))))

(assert (=> d!85398 (or (= lt!395088 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!395087 (bvsdiv (bvmul lt!395088 lt!395087) lt!395088)))))

(assert (=> d!85398 (= lt!395087 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85398 (= lt!395088 ((_ sign_extend 32) (size!6033 (buf!6541 lt!394450))))))

(assert (=> d!85398 (= lt!395085 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12005 lt!394450)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12000 lt!394450))))))

(assert (=> d!85398 (invariant!0 (currentBit!12000 lt!394450) (currentByte!12005 lt!394450) (size!6033 (buf!6541 lt!394450)))))

(assert (=> d!85398 (= (bitIndex!0 (size!6033 (buf!6541 lt!394450)) (currentByte!12005 lt!394450) (currentBit!12000 lt!394450)) lt!395085)))

(declare-fun b!254364 () Bool)

(declare-fun res!213136 () Bool)

(assert (=> b!254364 (=> (not res!213136) (not e!176228))))

(assert (=> b!254364 (= res!213136 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!395085))))

(declare-fun b!254365 () Bool)

(declare-fun lt!395083 () (_ BitVec 64))

(assert (=> b!254365 (= e!176228 (bvsle lt!395085 (bvmul lt!395083 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254365 (or (= lt!395083 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!395083 #b0000000000000000000000000000000000000000000000000000000000001000) lt!395083)))))

(assert (=> b!254365 (= lt!395083 ((_ sign_extend 32) (size!6033 (buf!6541 lt!394450))))))

(assert (= (and d!85398 res!213137) b!254364))

(assert (= (and b!254364 res!213136) b!254365))

(declare-fun m!383083 () Bool)

(assert (=> d!85398 m!383083))

(declare-fun m!383085 () Bool)

(assert (=> d!85398 m!383085))

(assert (=> d!85080 d!85398))

(declare-fun d!85400 () Bool)

(declare-fun e!176229 () Bool)

(assert (=> d!85400 e!176229))

(declare-fun res!213139 () Bool)

(assert (=> d!85400 (=> (not res!213139) (not e!176229))))

(declare-fun lt!395091 () (_ BitVec 64))

(declare-fun lt!395090 () (_ BitVec 64))

(declare-fun lt!395092 () (_ BitVec 64))

(assert (=> d!85400 (= res!213139 (= lt!395091 (bvsub lt!395090 lt!395092)))))

(assert (=> d!85400 (or (= (bvand lt!395090 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!395092 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!395090 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!395090 lt!395092) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85400 (= lt!395092 (remainingBits!0 ((_ sign_extend 32) (size!6033 (buf!6541 (_1!11820 lt!394119)))) ((_ sign_extend 32) (currentByte!12005 (_1!11820 lt!394119))) ((_ sign_extend 32) (currentBit!12000 (_1!11820 lt!394119)))))))

(declare-fun lt!395094 () (_ BitVec 64))

(declare-fun lt!395093 () (_ BitVec 64))

(assert (=> d!85400 (= lt!395090 (bvmul lt!395094 lt!395093))))

(assert (=> d!85400 (or (= lt!395094 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!395093 (bvsdiv (bvmul lt!395094 lt!395093) lt!395094)))))

(assert (=> d!85400 (= lt!395093 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85400 (= lt!395094 ((_ sign_extend 32) (size!6033 (buf!6541 (_1!11820 lt!394119)))))))

(assert (=> d!85400 (= lt!395091 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12005 (_1!11820 lt!394119))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12000 (_1!11820 lt!394119)))))))

(assert (=> d!85400 (invariant!0 (currentBit!12000 (_1!11820 lt!394119)) (currentByte!12005 (_1!11820 lt!394119)) (size!6033 (buf!6541 (_1!11820 lt!394119))))))

(assert (=> d!85400 (= (bitIndex!0 (size!6033 (buf!6541 (_1!11820 lt!394119))) (currentByte!12005 (_1!11820 lt!394119)) (currentBit!12000 (_1!11820 lt!394119))) lt!395091)))

(declare-fun b!254366 () Bool)

(declare-fun res!213138 () Bool)

(assert (=> b!254366 (=> (not res!213138) (not e!176229))))

(assert (=> b!254366 (= res!213138 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!395091))))

(declare-fun b!254367 () Bool)

(declare-fun lt!395089 () (_ BitVec 64))

(assert (=> b!254367 (= e!176229 (bvsle lt!395091 (bvmul lt!395089 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254367 (or (= lt!395089 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!395089 #b0000000000000000000000000000000000000000000000000000000000001000) lt!395089)))))

(assert (=> b!254367 (= lt!395089 ((_ sign_extend 32) (size!6033 (buf!6541 (_1!11820 lt!394119)))))))

(assert (= (and d!85400 res!213139) b!254366))

(assert (= (and b!254366 res!213138) b!254367))

(declare-fun m!383087 () Bool)

(assert (=> d!85400 m!383087))

(declare-fun m!383089 () Bool)

(assert (=> d!85400 m!383089))

(assert (=> d!85080 d!85400))

(declare-fun d!85402 () Bool)

(declare-fun lt!395109 () (_ BitVec 32))

(assert (=> d!85402 (= lt!395109 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!395108 () (_ BitVec 32))

(assert (=> d!85402 (= lt!395108 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!176234 () Bool)

(assert (=> d!85402 e!176234))

(declare-fun res!213144 () Bool)

(assert (=> d!85402 (=> (not res!213144) (not e!176234))))

(assert (=> d!85402 (= res!213144 (moveBitIndexPrecond!0 (_1!11820 lt!394119) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun Unit!18257 () Unit!18241)

(declare-fun Unit!18258 () Unit!18241)

(declare-fun Unit!18259 () Unit!18241)

(assert (=> d!85402 (= (moveBitIndex!0 (_1!11820 lt!394119) #b0000000000000000000000000000000000000000000000000000000000000001) (ite (bvslt (bvadd (currentBit!12000 (_1!11820 lt!394119)) lt!395109) #b00000000000000000000000000000000) (tuple2!21775 Unit!18257 (BitStream!10989 (buf!6541 (_1!11820 lt!394119)) (bvsub (bvadd (currentByte!12005 (_1!11820 lt!394119)) lt!395108) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!395109 (currentBit!12000 (_1!11820 lt!394119))))) (ite (bvsge (bvadd (currentBit!12000 (_1!11820 lt!394119)) lt!395109) #b00000000000000000000000000001000) (tuple2!21775 Unit!18258 (BitStream!10989 (buf!6541 (_1!11820 lt!394119)) (bvadd (currentByte!12005 (_1!11820 lt!394119)) lt!395108 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!12000 (_1!11820 lt!394119)) lt!395109) #b00000000000000000000000000001000))) (tuple2!21775 Unit!18259 (BitStream!10989 (buf!6541 (_1!11820 lt!394119)) (bvadd (currentByte!12005 (_1!11820 lt!394119)) lt!395108) (bvadd (currentBit!12000 (_1!11820 lt!394119)) lt!395109))))))))

(declare-fun b!254372 () Bool)

(declare-fun e!176235 () Bool)

(assert (=> b!254372 (= e!176234 e!176235)))

(declare-fun res!213145 () Bool)

(assert (=> b!254372 (=> (not res!213145) (not e!176235))))

(declare-fun lt!395111 () (_ BitVec 64))

(declare-fun lt!395112 () tuple2!21774)

(assert (=> b!254372 (= res!213145 (= (bvadd lt!395111 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!395112))) (currentByte!12005 (_2!11818 lt!395112)) (currentBit!12000 (_2!11818 lt!395112)))))))

(assert (=> b!254372 (or (not (= (bvand lt!395111 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!395111 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!395111 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!254372 (= lt!395111 (bitIndex!0 (size!6033 (buf!6541 (_1!11820 lt!394119))) (currentByte!12005 (_1!11820 lt!394119)) (currentBit!12000 (_1!11820 lt!394119))))))

(declare-fun lt!395110 () (_ BitVec 32))

(declare-fun lt!395107 () (_ BitVec 32))

(declare-fun Unit!18260 () Unit!18241)

(declare-fun Unit!18261 () Unit!18241)

(declare-fun Unit!18262 () Unit!18241)

(assert (=> b!254372 (= lt!395112 (ite (bvslt (bvadd (currentBit!12000 (_1!11820 lt!394119)) lt!395107) #b00000000000000000000000000000000) (tuple2!21775 Unit!18260 (BitStream!10989 (buf!6541 (_1!11820 lt!394119)) (bvsub (bvadd (currentByte!12005 (_1!11820 lt!394119)) lt!395110) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!395107 (currentBit!12000 (_1!11820 lt!394119))))) (ite (bvsge (bvadd (currentBit!12000 (_1!11820 lt!394119)) lt!395107) #b00000000000000000000000000001000) (tuple2!21775 Unit!18261 (BitStream!10989 (buf!6541 (_1!11820 lt!394119)) (bvadd (currentByte!12005 (_1!11820 lt!394119)) lt!395110 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!12000 (_1!11820 lt!394119)) lt!395107) #b00000000000000000000000000001000))) (tuple2!21775 Unit!18262 (BitStream!10989 (buf!6541 (_1!11820 lt!394119)) (bvadd (currentByte!12005 (_1!11820 lt!394119)) lt!395110) (bvadd (currentBit!12000 (_1!11820 lt!394119)) lt!395107))))))))

(assert (=> b!254372 (= lt!395107 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254372 (= lt!395110 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!254373 () Bool)

(assert (=> b!254373 (= e!176235 (and (= (size!6033 (buf!6541 (_1!11820 lt!394119))) (size!6033 (buf!6541 (_2!11818 lt!395112)))) (= (buf!6541 (_1!11820 lt!394119)) (buf!6541 (_2!11818 lt!395112)))))))

(assert (= (and d!85402 res!213144) b!254372))

(assert (= (and b!254372 res!213145) b!254373))

(assert (=> d!85402 m!382421))

(declare-fun m!383091 () Bool)

(assert (=> b!254372 m!383091))

(assert (=> b!254372 m!382417))

(assert (=> d!85080 d!85402))

(declare-fun d!85406 () Bool)

(declare-fun res!213148 () Bool)

(declare-fun e!176238 () Bool)

(assert (=> d!85406 (=> (not res!213148) (not e!176238))))

(assert (=> d!85406 (= res!213148 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6033 (buf!6541 (_1!11820 lt!394119))))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6033 (buf!6541 (_1!11820 lt!394119))))))))))

(assert (=> d!85406 (= (moveBitIndexPrecond!0 (_1!11820 lt!394119) #b0000000000000000000000000000000000000000000000000000000000000001) e!176238)))

(declare-fun b!254377 () Bool)

(declare-fun lt!395115 () (_ BitVec 64))

(assert (=> b!254377 (= e!176238 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!395115) (bvsle lt!395115 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6033 (buf!6541 (_1!11820 lt!394119))))))))))

(assert (=> b!254377 (= lt!395115 (bvadd (bitIndex!0 (size!6033 (buf!6541 (_1!11820 lt!394119))) (currentByte!12005 (_1!11820 lt!394119)) (currentBit!12000 (_1!11820 lt!394119))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!85406 res!213148) b!254377))

(assert (=> b!254377 m!382417))

(assert (=> d!85080 d!85406))

(declare-fun b!254378 () Bool)

(declare-fun e!176242 () tuple2!21784)

(assert (=> b!254378 (= e!176242 (tuple2!21785 true (_1!11820 lt!394113)))))

(declare-fun lt!395124 () (_ BitVec 64))

(declare-fun lt!395126 () tuple2!21784)

(declare-fun e!176243 () Bool)

(declare-fun b!254379 () Bool)

(assert (=> b!254379 (= e!176243 (= (bvsub lt!395124 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (bitIndex!0 (size!6033 (buf!6541 (_2!11823 lt!395126))) (currentByte!12005 (_2!11823 lt!395126)) (currentBit!12000 (_2!11823 lt!395126)))))))

(assert (=> b!254379 (or (= (bvand lt!395124 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!395124 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!395124 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!395121 () (_ BitVec 64))

(assert (=> b!254379 (= lt!395124 (bvadd lt!395121 nBits!297))))

(assert (=> b!254379 (or (not (= (bvand lt!395121 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!395121 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!395121 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!254379 (= lt!395121 (bitIndex!0 (size!6033 (buf!6541 (_1!11820 lt!394113))) (currentByte!12005 (_1!11820 lt!394113)) (currentBit!12000 (_1!11820 lt!394113))))))

(declare-fun b!254380 () Bool)

(declare-fun res!213149 () Bool)

(declare-fun e!176241 () Bool)

(assert (=> b!254380 (=> (not res!213149) (not e!176241))))

(assert (=> b!254380 (= res!213149 e!176243)))

(declare-fun res!213153 () Bool)

(assert (=> b!254380 (=> res!213153 e!176243)))

(assert (=> b!254380 (= res!213153 (not (_1!11823 lt!395126)))))

(declare-fun b!254382 () Bool)

(declare-fun res!213150 () Bool)

(assert (=> b!254382 (=> (not res!213150) (not e!176241))))

(assert (=> b!254382 (= res!213150 (and (= (buf!6541 (_1!11820 lt!394113)) (buf!6541 (_2!11823 lt!395126))) (or (not (= nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))) (_1!11823 lt!395126))))))

(declare-fun lt!395120 () tuple2!21784)

(declare-fun lt!395116 () tuple2!21784)

(declare-fun b!254383 () Bool)

(assert (=> b!254383 (= lt!395120 (checkBitsLoop!0 (_2!11823 lt!395116) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!395125 () Unit!18241)

(declare-fun lt!395118 () Unit!18241)

(assert (=> b!254383 (= lt!395125 lt!395118)))

(declare-fun lt!395117 () (_ BitVec 64))

(declare-fun lt!395123 () (_ BitVec 64))

(assert (=> b!254383 (validate_offset_bits!1 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11823 lt!395116)))) ((_ sign_extend 32) (currentByte!12005 (_2!11823 lt!395116))) ((_ sign_extend 32) (currentBit!12000 (_2!11823 lt!395116))) (bvsub lt!395117 lt!395123))))

(assert (=> b!254383 (= lt!395118 (validateOffsetBitsIneqLemma!0 (_1!11820 lt!394113) (_2!11823 lt!395116) lt!395117 lt!395123))))

(assert (=> b!254383 (= lt!395123 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!254383 (= lt!395117 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun e!176240 () tuple2!21784)

(assert (=> b!254383 (= e!176240 (tuple2!21785 (_1!11823 lt!395120) (_2!11823 lt!395120)))))

(declare-fun b!254384 () Bool)

(declare-fun e!176239 () Bool)

(assert (=> b!254384 (= e!176239 (= bit!26 (_2!11819 (readBitPure!0 (_1!11820 lt!394113)))))))

(declare-fun b!254385 () Bool)

(assert (=> b!254385 (= e!176242 e!176240)))

(assert (=> b!254385 (= lt!395116 (readBit!0 (_1!11820 lt!394113)))))

(declare-fun c!11734 () Bool)

(assert (=> b!254385 (= c!11734 (not (= (_1!11823 lt!395116) bit!26)))))

(declare-fun b!254386 () Bool)

(assert (=> b!254386 (= e!176241 e!176239)))

(declare-fun res!213152 () Bool)

(assert (=> b!254386 (=> res!213152 e!176239)))

(assert (=> b!254386 (= res!213152 (or (not (_1!11823 lt!395126)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) nBits!297)))))

(declare-fun b!254381 () Bool)

(assert (=> b!254381 (= e!176240 (tuple2!21785 false (_2!11823 lt!395116)))))

(declare-fun d!85408 () Bool)

(assert (=> d!85408 e!176241))

(declare-fun res!213151 () Bool)

(assert (=> d!85408 (=> (not res!213151) (not e!176241))))

(declare-fun lt!395119 () (_ BitVec 64))

(assert (=> d!85408 (= res!213151 (bvsge (bvsub lt!395119 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (bitIndex!0 (size!6033 (buf!6541 (_2!11823 lt!395126))) (currentByte!12005 (_2!11823 lt!395126)) (currentBit!12000 (_2!11823 lt!395126)))))))

(assert (=> d!85408 (or (= (bvand lt!395119 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!395119 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!395119 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!395122 () (_ BitVec 64))

(assert (=> d!85408 (= lt!395119 (bvadd lt!395122 nBits!297))))

(assert (=> d!85408 (or (not (= (bvand lt!395122 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!395122 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!395122 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85408 (= lt!395122 (bitIndex!0 (size!6033 (buf!6541 (_1!11820 lt!394113))) (currentByte!12005 (_1!11820 lt!394113)) (currentBit!12000 (_1!11820 lt!394113))))))

(assert (=> d!85408 (= lt!395126 e!176242)))

(declare-fun c!11735 () Bool)

(assert (=> d!85408 (= c!11735 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) nBits!297))))

(assert (=> d!85408 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!85408 (= (checkBitsLoop!0 (_1!11820 lt!394113) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!395126)))

(assert (= (and d!85408 c!11735) b!254378))

(assert (= (and d!85408 (not c!11735)) b!254385))

(assert (= (and b!254385 c!11734) b!254381))

(assert (= (and b!254385 (not c!11734)) b!254383))

(assert (= (and d!85408 res!213151) b!254382))

(assert (= (and b!254382 res!213150) b!254380))

(assert (= (and b!254380 (not res!213153)) b!254379))

(assert (= (and b!254380 res!213149) b!254386))

(assert (= (and b!254386 (not res!213152)) b!254384))

(declare-fun m!383093 () Bool)

(assert (=> d!85408 m!383093))

(declare-fun m!383095 () Bool)

(assert (=> d!85408 m!383095))

(declare-fun m!383097 () Bool)

(assert (=> b!254383 m!383097))

(declare-fun m!383099 () Bool)

(assert (=> b!254383 m!383099))

(declare-fun m!383101 () Bool)

(assert (=> b!254383 m!383101))

(declare-fun m!383103 () Bool)

(assert (=> b!254384 m!383103))

(declare-fun m!383105 () Bool)

(assert (=> b!254385 m!383105))

(assert (=> b!254379 m!383093))

(assert (=> b!254379 m!383095))

(assert (=> d!85168 d!85408))

(declare-fun d!85410 () Bool)

(declare-fun e!176244 () Bool)

(assert (=> d!85410 e!176244))

(declare-fun res!213155 () Bool)

(assert (=> d!85410 (=> (not res!213155) (not e!176244))))

(declare-fun lt!395129 () (_ BitVec 64))

(declare-fun lt!395128 () (_ BitVec 64))

(declare-fun lt!395130 () (_ BitVec 64))

(assert (=> d!85410 (= res!213155 (= lt!395129 (bvsub lt!395128 lt!395130)))))

(assert (=> d!85410 (or (= (bvand lt!395128 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!395130 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!395128 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!395128 lt!395130) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85410 (= lt!395130 (remainingBits!0 ((_ sign_extend 32) (size!6033 (buf!6541 (_1!11819 lt!394666)))) ((_ sign_extend 32) (currentByte!12005 (_1!11819 lt!394666))) ((_ sign_extend 32) (currentBit!12000 (_1!11819 lt!394666)))))))

(declare-fun lt!395132 () (_ BitVec 64))

(declare-fun lt!395131 () (_ BitVec 64))

(assert (=> d!85410 (= lt!395128 (bvmul lt!395132 lt!395131))))

(assert (=> d!85410 (or (= lt!395132 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!395131 (bvsdiv (bvmul lt!395132 lt!395131) lt!395132)))))

(assert (=> d!85410 (= lt!395131 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85410 (= lt!395132 ((_ sign_extend 32) (size!6033 (buf!6541 (_1!11819 lt!394666)))))))

(assert (=> d!85410 (= lt!395129 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12005 (_1!11819 lt!394666))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12000 (_1!11819 lt!394666)))))))

(assert (=> d!85410 (invariant!0 (currentBit!12000 (_1!11819 lt!394666)) (currentByte!12005 (_1!11819 lt!394666)) (size!6033 (buf!6541 (_1!11819 lt!394666))))))

(assert (=> d!85410 (= (bitIndex!0 (size!6033 (buf!6541 (_1!11819 lt!394666))) (currentByte!12005 (_1!11819 lt!394666)) (currentBit!12000 (_1!11819 lt!394666))) lt!395129)))

(declare-fun b!254387 () Bool)

(declare-fun res!213154 () Bool)

(assert (=> b!254387 (=> (not res!213154) (not e!176244))))

(assert (=> b!254387 (= res!213154 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!395129))))

(declare-fun b!254388 () Bool)

(declare-fun lt!395127 () (_ BitVec 64))

(assert (=> b!254388 (= e!176244 (bvsle lt!395129 (bvmul lt!395127 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254388 (or (= lt!395127 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!395127 #b0000000000000000000000000000000000000000000000000000000000001000) lt!395127)))))

(assert (=> b!254388 (= lt!395127 ((_ sign_extend 32) (size!6033 (buf!6541 (_1!11819 lt!394666)))))))

(assert (= (and d!85410 res!213155) b!254387))

(assert (= (and b!254387 res!213154) b!254388))

(declare-fun m!383107 () Bool)

(assert (=> d!85410 m!383107))

(declare-fun m!383109 () Bool)

(assert (=> d!85410 m!383109))

(assert (=> d!85118 d!85410))

(declare-fun d!85412 () Bool)

(declare-fun e!176245 () Bool)

(assert (=> d!85412 e!176245))

(declare-fun res!213157 () Bool)

(assert (=> d!85412 (=> (not res!213157) (not e!176245))))

(declare-fun lt!395134 () (_ BitVec 64))

(declare-fun lt!395136 () (_ BitVec 64))

(declare-fun lt!395135 () (_ BitVec 64))

(assert (=> d!85412 (= res!213157 (= lt!395135 (bvsub lt!395134 lt!395136)))))

(assert (=> d!85412 (or (= (bvand lt!395134 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!395136 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!395134 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!395134 lt!395136) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85412 (= lt!395136 (remainingBits!0 ((_ sign_extend 32) (size!6033 (buf!6541 (_1!11819 lt!394663)))) ((_ sign_extend 32) (currentByte!12005 (_1!11819 lt!394663))) ((_ sign_extend 32) (currentBit!12000 (_1!11819 lt!394663)))))))

(declare-fun lt!395138 () (_ BitVec 64))

(declare-fun lt!395137 () (_ BitVec 64))

(assert (=> d!85412 (= lt!395134 (bvmul lt!395138 lt!395137))))

(assert (=> d!85412 (or (= lt!395138 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!395137 (bvsdiv (bvmul lt!395138 lt!395137) lt!395138)))))

(assert (=> d!85412 (= lt!395137 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85412 (= lt!395138 ((_ sign_extend 32) (size!6033 (buf!6541 (_1!11819 lt!394663)))))))

(assert (=> d!85412 (= lt!395135 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12005 (_1!11819 lt!394663))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12000 (_1!11819 lt!394663)))))))

(assert (=> d!85412 (invariant!0 (currentBit!12000 (_1!11819 lt!394663)) (currentByte!12005 (_1!11819 lt!394663)) (size!6033 (buf!6541 (_1!11819 lt!394663))))))

(assert (=> d!85412 (= (bitIndex!0 (size!6033 (buf!6541 (_1!11819 lt!394663))) (currentByte!12005 (_1!11819 lt!394663)) (currentBit!12000 (_1!11819 lt!394663))) lt!395135)))

(declare-fun b!254389 () Bool)

(declare-fun res!213156 () Bool)

(assert (=> b!254389 (=> (not res!213156) (not e!176245))))

(assert (=> b!254389 (= res!213156 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!395135))))

(declare-fun b!254390 () Bool)

(declare-fun lt!395133 () (_ BitVec 64))

(assert (=> b!254390 (= e!176245 (bvsle lt!395135 (bvmul lt!395133 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254390 (or (= lt!395133 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!395133 #b0000000000000000000000000000000000000000000000000000000000001000) lt!395133)))))

(assert (=> b!254390 (= lt!395133 ((_ sign_extend 32) (size!6033 (buf!6541 (_1!11819 lt!394663)))))))

(assert (= (and d!85412 res!213157) b!254389))

(assert (= (and b!254389 res!213156) b!254390))

(declare-fun m!383111 () Bool)

(assert (=> d!85412 m!383111))

(declare-fun m!383113 () Bool)

(assert (=> d!85412 m!383113))

(assert (=> d!85118 d!85412))

(assert (=> d!85118 d!85102))

(declare-fun d!85414 () Bool)

(declare-fun e!176248 () Bool)

(assert (=> d!85414 e!176248))

(declare-fun res!213160 () Bool)

(assert (=> d!85414 (=> (not res!213160) (not e!176248))))

(declare-fun lt!395146 () tuple2!21776)

(declare-fun lt!395147 () tuple2!21776)

(assert (=> d!85414 (= res!213160 (= (bitIndex!0 (size!6033 (buf!6541 (_1!11819 lt!395146))) (currentByte!12005 (_1!11819 lt!395146)) (currentBit!12000 (_1!11819 lt!395146))) (bitIndex!0 (size!6033 (buf!6541 (_1!11819 lt!395147))) (currentByte!12005 (_1!11819 lt!395147)) (currentBit!12000 (_1!11819 lt!395147)))))))

(declare-fun lt!395145 () BitStream!10988)

(assert (=> d!85414 (= lt!395147 (readBitPure!0 lt!395145))))

(assert (=> d!85414 (= lt!395146 (readBitPure!0 lt!394115))))

(assert (=> d!85414 (= lt!395145 (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 lt!394115) (currentBit!12000 lt!394115)))))

(assert (=> d!85414 (invariant!0 (currentBit!12000 lt!394115) (currentByte!12005 lt!394115) (size!6033 (buf!6541 (_2!11818 lt!394112))))))

(assert (=> d!85414 true))

(declare-fun _$9!117 () Unit!18241)

(assert (=> d!85414 (= (choose!50 lt!394115 (_2!11818 lt!394112) lt!394664 lt!394663 (tuple2!21777 (_1!11819 lt!394663) (_2!11819 lt!394663)) (_1!11819 lt!394663) (_2!11819 lt!394663) lt!394666 (tuple2!21777 (_1!11819 lt!394666) (_2!11819 lt!394666)) (_1!11819 lt!394666) (_2!11819 lt!394666)) _$9!117)))

(declare-fun b!254393 () Bool)

(assert (=> b!254393 (= e!176248 (= (_2!11819 lt!395146) (_2!11819 lt!395147)))))

(assert (= (and d!85414 res!213160) b!254393))

(declare-fun m!383115 () Bool)

(assert (=> d!85414 m!383115))

(declare-fun m!383117 () Bool)

(assert (=> d!85414 m!383117))

(assert (=> d!85414 m!382579))

(declare-fun m!383119 () Bool)

(assert (=> d!85414 m!383119))

(assert (=> d!85414 m!382111))

(assert (=> d!85118 d!85414))

(declare-fun d!85416 () Bool)

(assert (=> d!85416 (= (invariant!0 (currentBit!12000 lt!394115) (currentByte!12005 lt!394115) (size!6033 (buf!6541 (_2!11818 lt!394112)))) (and (bvsge (currentBit!12000 lt!394115) #b00000000000000000000000000000000) (bvslt (currentBit!12000 lt!394115) #b00000000000000000000000000001000) (bvsge (currentByte!12005 lt!394115) #b00000000000000000000000000000000) (or (bvslt (currentByte!12005 lt!394115) (size!6033 (buf!6541 (_2!11818 lt!394112)))) (and (= (currentBit!12000 lt!394115) #b00000000000000000000000000000000) (= (currentByte!12005 lt!394115) (size!6033 (buf!6541 (_2!11818 lt!394112))))))))))

(assert (=> d!85118 d!85416))

(declare-fun d!85418 () Bool)

(declare-fun lt!395148 () tuple2!21784)

(assert (=> d!85418 (= lt!395148 (readBit!0 lt!394664))))

(assert (=> d!85418 (= (readBitPure!0 lt!394664) (tuple2!21777 (_2!11823 lt!395148) (_1!11823 lt!395148)))))

(declare-fun bs!21567 () Bool)

(assert (= bs!21567 d!85418))

(declare-fun m!383121 () Bool)

(assert (=> bs!21567 m!383121))

(assert (=> d!85118 d!85418))

(declare-fun d!85420 () Bool)

(declare-fun res!213161 () Bool)

(declare-fun e!176249 () Bool)

(assert (=> d!85420 (=> (not res!213161) (not e!176249))))

(assert (=> d!85420 (= res!213161 (= (size!6033 (buf!6541 (_2!11820 lt!394540))) (size!6033 (buf!6541 (_2!11818 lt!394112)))))))

(assert (=> d!85420 (= (isPrefixOf!0 (_2!11820 lt!394540) (_2!11818 lt!394112)) e!176249)))

(declare-fun b!254394 () Bool)

(declare-fun res!213163 () Bool)

(assert (=> b!254394 (=> (not res!213163) (not e!176249))))

(assert (=> b!254394 (= res!213163 (bvsle (bitIndex!0 (size!6033 (buf!6541 (_2!11820 lt!394540))) (currentByte!12005 (_2!11820 lt!394540)) (currentBit!12000 (_2!11820 lt!394540))) (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394112))) (currentByte!12005 (_2!11818 lt!394112)) (currentBit!12000 (_2!11818 lt!394112)))))))

(declare-fun b!254395 () Bool)

(declare-fun e!176250 () Bool)

(assert (=> b!254395 (= e!176249 e!176250)))

(declare-fun res!213162 () Bool)

(assert (=> b!254395 (=> res!213162 e!176250)))

(assert (=> b!254395 (= res!213162 (= (size!6033 (buf!6541 (_2!11820 lt!394540))) #b00000000000000000000000000000000))))

(declare-fun b!254396 () Bool)

(assert (=> b!254396 (= e!176250 (arrayBitRangesEq!0 (buf!6541 (_2!11820 lt!394540)) (buf!6541 (_2!11818 lt!394112)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6033 (buf!6541 (_2!11820 lt!394540))) (currentByte!12005 (_2!11820 lt!394540)) (currentBit!12000 (_2!11820 lt!394540)))))))

(assert (= (and d!85420 res!213161) b!254394))

(assert (= (and b!254394 res!213163) b!254395))

(assert (= (and b!254395 (not res!213162)) b!254396))

(declare-fun m!383123 () Bool)

(assert (=> b!254394 m!383123))

(assert (=> b!254394 m!382101))

(assert (=> b!254396 m!383123))

(assert (=> b!254396 m!383123))

(declare-fun m!383125 () Bool)

(assert (=> b!254396 m!383125))

(assert (=> b!253994 d!85420))

(declare-fun d!85422 () Bool)

(assert (=> d!85422 (isPrefixOf!0 lt!394539 (_2!11818 lt!394112))))

(declare-fun lt!395149 () Unit!18241)

(assert (=> d!85422 (= lt!395149 (choose!30 lt!394539 thiss!1005 (_2!11818 lt!394112)))))

(assert (=> d!85422 (isPrefixOf!0 lt!394539 thiss!1005)))

(assert (=> d!85422 (= (lemmaIsPrefixTransitive!0 lt!394539 thiss!1005 (_2!11818 lt!394112)) lt!395149)))

(declare-fun bs!21568 () Bool)

(assert (= bs!21568 d!85422))

(assert (=> bs!21568 m!382463))

(declare-fun m!383127 () Bool)

(assert (=> bs!21568 m!383127))

(declare-fun m!383129 () Bool)

(assert (=> bs!21568 m!383129))

(assert (=> d!85090 d!85422))

(declare-fun d!85424 () Bool)

(declare-fun res!213164 () Bool)

(declare-fun e!176251 () Bool)

(assert (=> d!85424 (=> (not res!213164) (not e!176251))))

(assert (=> d!85424 (= res!213164 (= (size!6033 (buf!6541 (_1!11820 lt!394540))) (size!6033 (buf!6541 (_2!11820 lt!394540)))))))

(assert (=> d!85424 (= (isPrefixOf!0 (_1!11820 lt!394540) (_2!11820 lt!394540)) e!176251)))

(declare-fun b!254397 () Bool)

(declare-fun res!213166 () Bool)

(assert (=> b!254397 (=> (not res!213166) (not e!176251))))

(assert (=> b!254397 (= res!213166 (bvsle (bitIndex!0 (size!6033 (buf!6541 (_1!11820 lt!394540))) (currentByte!12005 (_1!11820 lt!394540)) (currentBit!12000 (_1!11820 lt!394540))) (bitIndex!0 (size!6033 (buf!6541 (_2!11820 lt!394540))) (currentByte!12005 (_2!11820 lt!394540)) (currentBit!12000 (_2!11820 lt!394540)))))))

(declare-fun b!254398 () Bool)

(declare-fun e!176252 () Bool)

(assert (=> b!254398 (= e!176251 e!176252)))

(declare-fun res!213165 () Bool)

(assert (=> b!254398 (=> res!213165 e!176252)))

(assert (=> b!254398 (= res!213165 (= (size!6033 (buf!6541 (_1!11820 lt!394540))) #b00000000000000000000000000000000))))

(declare-fun b!254399 () Bool)

(assert (=> b!254399 (= e!176252 (arrayBitRangesEq!0 (buf!6541 (_1!11820 lt!394540)) (buf!6541 (_2!11820 lt!394540)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6033 (buf!6541 (_1!11820 lt!394540))) (currentByte!12005 (_1!11820 lt!394540)) (currentBit!12000 (_1!11820 lt!394540)))))))

(assert (= (and d!85424 res!213164) b!254397))

(assert (= (and b!254397 res!213166) b!254398))

(assert (= (and b!254398 (not res!213165)) b!254399))

(declare-fun m!383131 () Bool)

(assert (=> b!254397 m!383131))

(assert (=> b!254397 m!383123))

(assert (=> b!254399 m!383131))

(assert (=> b!254399 m!383131))

(declare-fun m!383133 () Bool)

(assert (=> b!254399 m!383133))

(assert (=> d!85090 d!85424))

(declare-fun d!85426 () Bool)

(declare-fun res!213167 () Bool)

(declare-fun e!176253 () Bool)

(assert (=> d!85426 (=> (not res!213167) (not e!176253))))

(assert (=> d!85426 (= res!213167 (= (size!6033 (buf!6541 lt!394539)) (size!6033 (buf!6541 lt!394539))))))

(assert (=> d!85426 (= (isPrefixOf!0 lt!394539 lt!394539) e!176253)))

(declare-fun b!254400 () Bool)

(declare-fun res!213169 () Bool)

(assert (=> b!254400 (=> (not res!213169) (not e!176253))))

(assert (=> b!254400 (= res!213169 (bvsle (bitIndex!0 (size!6033 (buf!6541 lt!394539)) (currentByte!12005 lt!394539) (currentBit!12000 lt!394539)) (bitIndex!0 (size!6033 (buf!6541 lt!394539)) (currentByte!12005 lt!394539) (currentBit!12000 lt!394539))))))

(declare-fun b!254401 () Bool)

(declare-fun e!176254 () Bool)

(assert (=> b!254401 (= e!176253 e!176254)))

(declare-fun res!213168 () Bool)

(assert (=> b!254401 (=> res!213168 e!176254)))

(assert (=> b!254401 (= res!213168 (= (size!6033 (buf!6541 lt!394539)) #b00000000000000000000000000000000))))

(declare-fun b!254402 () Bool)

(assert (=> b!254402 (= e!176254 (arrayBitRangesEq!0 (buf!6541 lt!394539) (buf!6541 lt!394539) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6033 (buf!6541 lt!394539)) (currentByte!12005 lt!394539) (currentBit!12000 lt!394539))))))

(assert (= (and d!85426 res!213167) b!254400))

(assert (= (and b!254400 res!213169) b!254401))

(assert (= (and b!254401 (not res!213168)) b!254402))

(declare-fun m!383135 () Bool)

(assert (=> b!254400 m!383135))

(assert (=> b!254400 m!383135))

(assert (=> b!254402 m!383135))

(assert (=> b!254402 m!383135))

(declare-fun m!383137 () Bool)

(assert (=> b!254402 m!383137))

(assert (=> d!85090 d!85426))

(declare-fun d!85428 () Bool)

(assert (=> d!85428 (isPrefixOf!0 lt!394539 (_2!11818 lt!394112))))

(declare-fun lt!395150 () Unit!18241)

(assert (=> d!85428 (= lt!395150 (choose!30 lt!394539 (_2!11818 lt!394112) (_2!11818 lt!394112)))))

(assert (=> d!85428 (isPrefixOf!0 lt!394539 (_2!11818 lt!394112))))

(assert (=> d!85428 (= (lemmaIsPrefixTransitive!0 lt!394539 (_2!11818 lt!394112) (_2!11818 lt!394112)) lt!395150)))

(declare-fun bs!21569 () Bool)

(assert (= bs!21569 d!85428))

(assert (=> bs!21569 m!382463))

(declare-fun m!383139 () Bool)

(assert (=> bs!21569 m!383139))

(assert (=> bs!21569 m!382463))

(assert (=> d!85090 d!85428))

(declare-fun d!85430 () Bool)

(assert (=> d!85430 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-fun lt!395153 () Unit!18241)

(declare-fun choose!11 (BitStream!10988) Unit!18241)

(assert (=> d!85430 (= lt!395153 (choose!11 thiss!1005))))

(assert (=> d!85430 (= (lemmaIsPrefixRefl!0 thiss!1005) lt!395153)))

(declare-fun bs!21571 () Bool)

(assert (= bs!21571 d!85430))

(assert (=> bs!21571 m!382451))

(declare-fun m!383141 () Bool)

(assert (=> bs!21571 m!383141))

(assert (=> d!85090 d!85430))

(declare-fun d!85432 () Bool)

(assert (=> d!85432 (isPrefixOf!0 lt!394539 lt!394539)))

(declare-fun lt!395154 () Unit!18241)

(assert (=> d!85432 (= lt!395154 (choose!11 lt!394539))))

(assert (=> d!85432 (= (lemmaIsPrefixRefl!0 lt!394539) lt!395154)))

(declare-fun bs!21572 () Bool)

(assert (= bs!21572 d!85432))

(assert (=> bs!21572 m!382457))

(declare-fun m!383143 () Bool)

(assert (=> bs!21572 m!383143))

(assert (=> d!85090 d!85432))

(assert (=> d!85090 d!85156))

(declare-fun d!85434 () Bool)

(declare-fun res!213170 () Bool)

(declare-fun e!176255 () Bool)

(assert (=> d!85434 (=> (not res!213170) (not e!176255))))

(assert (=> d!85434 (= res!213170 (= (size!6033 (buf!6541 thiss!1005)) (size!6033 (buf!6541 thiss!1005))))))

(assert (=> d!85434 (= (isPrefixOf!0 thiss!1005 thiss!1005) e!176255)))

(declare-fun b!254403 () Bool)

(declare-fun res!213172 () Bool)

(assert (=> b!254403 (=> (not res!213172) (not e!176255))))

(assert (=> b!254403 (= res!213172 (bvsle (bitIndex!0 (size!6033 (buf!6541 thiss!1005)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005)) (bitIndex!0 (size!6033 (buf!6541 thiss!1005)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005))))))

(declare-fun b!254404 () Bool)

(declare-fun e!176256 () Bool)

(assert (=> b!254404 (= e!176255 e!176256)))

(declare-fun res!213171 () Bool)

(assert (=> b!254404 (=> res!213171 e!176256)))

(assert (=> b!254404 (= res!213171 (= (size!6033 (buf!6541 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!254405 () Bool)

(assert (=> b!254405 (= e!176256 (arrayBitRangesEq!0 (buf!6541 thiss!1005) (buf!6541 thiss!1005) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6033 (buf!6541 thiss!1005)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005))))))

(assert (= (and d!85434 res!213170) b!254403))

(assert (= (and b!254403 res!213172) b!254404))

(assert (= (and b!254404 (not res!213171)) b!254405))

(assert (=> b!254403 m!382093))

(assert (=> b!254403 m!382093))

(assert (=> b!254405 m!382093))

(assert (=> b!254405 m!382093))

(declare-fun m!383145 () Bool)

(assert (=> b!254405 m!383145))

(assert (=> d!85090 d!85434))

(declare-fun d!85436 () Bool)

(declare-fun res!213173 () Bool)

(declare-fun e!176257 () Bool)

(assert (=> d!85436 (=> (not res!213173) (not e!176257))))

(assert (=> d!85436 (= res!213173 (= (size!6033 (buf!6541 (_2!11818 lt!394112))) (size!6033 (buf!6541 (_2!11818 lt!394112)))))))

(assert (=> d!85436 (= (isPrefixOf!0 (_2!11818 lt!394112) (_2!11818 lt!394112)) e!176257)))

(declare-fun b!254406 () Bool)

(declare-fun res!213175 () Bool)

(assert (=> b!254406 (=> (not res!213175) (not e!176257))))

(assert (=> b!254406 (= res!213175 (bvsle (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394112))) (currentByte!12005 (_2!11818 lt!394112)) (currentBit!12000 (_2!11818 lt!394112))) (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394112))) (currentByte!12005 (_2!11818 lt!394112)) (currentBit!12000 (_2!11818 lt!394112)))))))

(declare-fun b!254407 () Bool)

(declare-fun e!176258 () Bool)

(assert (=> b!254407 (= e!176257 e!176258)))

(declare-fun res!213174 () Bool)

(assert (=> b!254407 (=> res!213174 e!176258)))

(assert (=> b!254407 (= res!213174 (= (size!6033 (buf!6541 (_2!11818 lt!394112))) #b00000000000000000000000000000000))))

(declare-fun b!254408 () Bool)

(assert (=> b!254408 (= e!176258 (arrayBitRangesEq!0 (buf!6541 (_2!11818 lt!394112)) (buf!6541 (_2!11818 lt!394112)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394112))) (currentByte!12005 (_2!11818 lt!394112)) (currentBit!12000 (_2!11818 lt!394112)))))))

(assert (= (and d!85436 res!213173) b!254406))

(assert (= (and b!254406 res!213175) b!254407))

(assert (= (and b!254407 (not res!213174)) b!254408))

(assert (=> b!254406 m!382101))

(assert (=> b!254406 m!382101))

(assert (=> b!254408 m!382101))

(assert (=> b!254408 m!382101))

(declare-fun m!383147 () Bool)

(assert (=> b!254408 m!383147))

(assert (=> d!85090 d!85436))

(declare-fun d!85438 () Bool)

(declare-fun res!213176 () Bool)

(declare-fun e!176259 () Bool)

(assert (=> d!85438 (=> (not res!213176) (not e!176259))))

(assert (=> d!85438 (= res!213176 (= (size!6033 (buf!6541 lt!394539)) (size!6033 (buf!6541 (_2!11818 lt!394112)))))))

(assert (=> d!85438 (= (isPrefixOf!0 lt!394539 (_2!11818 lt!394112)) e!176259)))

(declare-fun b!254409 () Bool)

(declare-fun res!213178 () Bool)

(assert (=> b!254409 (=> (not res!213178) (not e!176259))))

(assert (=> b!254409 (= res!213178 (bvsle (bitIndex!0 (size!6033 (buf!6541 lt!394539)) (currentByte!12005 lt!394539) (currentBit!12000 lt!394539)) (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394112))) (currentByte!12005 (_2!11818 lt!394112)) (currentBit!12000 (_2!11818 lt!394112)))))))

(declare-fun b!254410 () Bool)

(declare-fun e!176260 () Bool)

(assert (=> b!254410 (= e!176259 e!176260)))

(declare-fun res!213177 () Bool)

(assert (=> b!254410 (=> res!213177 e!176260)))

(assert (=> b!254410 (= res!213177 (= (size!6033 (buf!6541 lt!394539)) #b00000000000000000000000000000000))))

(declare-fun b!254411 () Bool)

(assert (=> b!254411 (= e!176260 (arrayBitRangesEq!0 (buf!6541 lt!394539) (buf!6541 (_2!11818 lt!394112)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6033 (buf!6541 lt!394539)) (currentByte!12005 lt!394539) (currentBit!12000 lt!394539))))))

(assert (= (and d!85438 res!213176) b!254409))

(assert (= (and b!254409 res!213178) b!254410))

(assert (= (and b!254410 (not res!213177)) b!254411))

(assert (=> b!254409 m!383135))

(assert (=> b!254409 m!382101))

(assert (=> b!254411 m!383135))

(assert (=> b!254411 m!383135))

(declare-fun m!383149 () Bool)

(assert (=> b!254411 m!383149))

(assert (=> d!85090 d!85438))

(declare-fun d!85440 () Bool)

(assert (=> d!85440 (isPrefixOf!0 (_2!11818 lt!394112) (_2!11818 lt!394112))))

(declare-fun lt!395155 () Unit!18241)

(assert (=> d!85440 (= lt!395155 (choose!11 (_2!11818 lt!394112)))))

(assert (=> d!85440 (= (lemmaIsPrefixRefl!0 (_2!11818 lt!394112)) lt!395155)))

(declare-fun bs!21573 () Bool)

(assert (= bs!21573 d!85440))

(assert (=> bs!21573 m!382459))

(declare-fun m!383151 () Bool)

(assert (=> bs!21573 m!383151))

(assert (=> d!85090 d!85440))

(declare-fun d!85442 () Bool)

(assert (=> d!85442 (= (invariant!0 (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005) (size!6033 (buf!6541 thiss!1005))) (and (bvsge (currentBit!12000 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!12000 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!12005 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!12005 thiss!1005) (size!6033 (buf!6541 thiss!1005))) (and (= (currentBit!12000 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!12005 thiss!1005) (size!6033 (buf!6541 thiss!1005)))))))))

(assert (=> d!85188 d!85442))

(assert (=> b!253992 d!85180))

(declare-fun d!85444 () Bool)

(assert (=> d!85444 (arrayBitRangesEq!0 (buf!6541 (_2!11818 lt!394112)) (buf!6541 thiss!1005) lt!394533 lt!394534)))

(declare-fun lt!395158 () Unit!18241)

(declare-fun choose!8 (array!13751 array!13751 (_ BitVec 64) (_ BitVec 64)) Unit!18241)

(assert (=> d!85444 (= lt!395158 (choose!8 (buf!6541 thiss!1005) (buf!6541 (_2!11818 lt!394112)) lt!394533 lt!394534))))

(assert (=> d!85444 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!394533) (bvsle lt!394533 lt!394534))))

(assert (=> d!85444 (= (arrayBitRangesEqSymmetric!0 (buf!6541 thiss!1005) (buf!6541 (_2!11818 lt!394112)) lt!394533 lt!394534) lt!395158)))

(declare-fun bs!21574 () Bool)

(assert (= bs!21574 d!85444))

(assert (=> bs!21574 m!382479))

(declare-fun m!383153 () Bool)

(assert (=> bs!21574 m!383153))

(assert (=> b!253992 d!85444))

(declare-fun bm!3996 () Bool)

(declare-fun lt!395160 () (_ BitVec 32))

(declare-fun call!3999 () Bool)

(declare-fun lt!395161 () tuple4!304)

(declare-fun c!11736 () Bool)

(declare-fun lt!395159 () (_ BitVec 32))

(assert (=> bm!3996 (= call!3999 (byteRangesEq!0 (select (arr!7020 (buf!6541 (_2!11818 lt!394112))) (_3!932 lt!395161)) (select (arr!7020 (buf!6541 thiss!1005)) (_3!932 lt!395161)) lt!395159 (ite c!11736 lt!395160 #b00000000000000000000000000001000)))))

(declare-fun d!85446 () Bool)

(declare-fun res!213182 () Bool)

(declare-fun e!176261 () Bool)

(assert (=> d!85446 (=> res!213182 e!176261)))

(assert (=> d!85446 (= res!213182 (bvsge lt!394533 lt!394534))))

(assert (=> d!85446 (= (arrayBitRangesEq!0 (buf!6541 (_2!11818 lt!394112)) (buf!6541 thiss!1005) lt!394533 lt!394534) e!176261)))

(declare-fun b!254412 () Bool)

(declare-fun e!176265 () Bool)

(assert (=> b!254412 (= e!176261 e!176265)))

(declare-fun res!213179 () Bool)

(assert (=> b!254412 (=> (not res!213179) (not e!176265))))

(declare-fun e!176262 () Bool)

(assert (=> b!254412 (= res!213179 e!176262)))

(declare-fun res!213183 () Bool)

(assert (=> b!254412 (=> res!213183 e!176262)))

(assert (=> b!254412 (= res!213183 (bvsge (_1!11825 lt!395161) (_2!11825 lt!395161)))))

(assert (=> b!254412 (= lt!395160 ((_ extract 31 0) (bvsrem lt!394534 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254412 (= lt!395159 ((_ extract 31 0) (bvsrem lt!394533 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254412 (= lt!395161 (arrayBitIndices!0 lt!394533 lt!394534))))

(declare-fun b!254413 () Bool)

(declare-fun res!213180 () Bool)

(assert (=> b!254413 (= res!213180 (= lt!395160 #b00000000000000000000000000000000))))

(declare-fun e!176266 () Bool)

(assert (=> b!254413 (=> res!213180 e!176266)))

(declare-fun e!176264 () Bool)

(assert (=> b!254413 (= e!176264 e!176266)))

(declare-fun b!254414 () Bool)

(declare-fun e!176263 () Bool)

(assert (=> b!254414 (= e!176265 e!176263)))

(assert (=> b!254414 (= c!11736 (= (_3!932 lt!395161) (_4!152 lt!395161)))))

(declare-fun b!254415 () Bool)

(assert (=> b!254415 (= e!176266 (byteRangesEq!0 (select (arr!7020 (buf!6541 (_2!11818 lt!394112))) (_4!152 lt!395161)) (select (arr!7020 (buf!6541 thiss!1005)) (_4!152 lt!395161)) #b00000000000000000000000000000000 lt!395160))))

(declare-fun b!254416 () Bool)

(assert (=> b!254416 (= e!176263 call!3999)))

(declare-fun b!254417 () Bool)

(assert (=> b!254417 (= e!176263 e!176264)))

(declare-fun res!213181 () Bool)

(assert (=> b!254417 (= res!213181 call!3999)))

(assert (=> b!254417 (=> (not res!213181) (not e!176264))))

(declare-fun b!254418 () Bool)

(assert (=> b!254418 (= e!176262 (arrayRangesEq!929 (buf!6541 (_2!11818 lt!394112)) (buf!6541 thiss!1005) (_1!11825 lt!395161) (_2!11825 lt!395161)))))

(assert (= (and d!85446 (not res!213182)) b!254412))

(assert (= (and b!254412 (not res!213183)) b!254418))

(assert (= (and b!254412 res!213179) b!254414))

(assert (= (and b!254414 c!11736) b!254416))

(assert (= (and b!254414 (not c!11736)) b!254417))

(assert (= (and b!254417 res!213181) b!254413))

(assert (= (and b!254413 (not res!213180)) b!254415))

(assert (= (or b!254416 b!254417) bm!3996))

(declare-fun m!383155 () Bool)

(assert (=> bm!3996 m!383155))

(declare-fun m!383157 () Bool)

(assert (=> bm!3996 m!383157))

(assert (=> bm!3996 m!383155))

(assert (=> bm!3996 m!383157))

(declare-fun m!383159 () Bool)

(assert (=> bm!3996 m!383159))

(declare-fun m!383161 () Bool)

(assert (=> b!254412 m!383161))

(declare-fun m!383163 () Bool)

(assert (=> b!254415 m!383163))

(declare-fun m!383165 () Bool)

(assert (=> b!254415 m!383165))

(assert (=> b!254415 m!383163))

(assert (=> b!254415 m!383165))

(declare-fun m!383167 () Bool)

(assert (=> b!254415 m!383167))

(declare-fun m!383169 () Bool)

(assert (=> b!254418 m!383169))

(assert (=> b!253992 d!85446))

(declare-fun d!85448 () Bool)

(declare-fun e!176273 () Bool)

(assert (=> d!85448 e!176273))

(declare-fun res!213186 () Bool)

(assert (=> d!85448 (=> (not res!213186) (not e!176273))))

(declare-fun increaseBitIndex!0 (BitStream!10988) tuple2!21774)

(assert (=> d!85448 (= res!213186 (= (buf!6541 (_2!11818 (increaseBitIndex!0 (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005))))) (buf!6541 (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005)))))))

(declare-fun lt!395182 () Bool)

(assert (=> d!85448 (= lt!395182 (not (= (bvand ((_ sign_extend 24) (select (arr!7020 (buf!6541 (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005)))) (currentByte!12005 (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12000 (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!395180 () tuple2!21784)

(assert (=> d!85448 (= lt!395180 (tuple2!21785 (not (= (bvand ((_ sign_extend 24) (select (arr!7020 (buf!6541 (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005)))) (currentByte!12005 (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12000 (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005)))))) #b00000000000000000000000000000000)) (_2!11818 (increaseBitIndex!0 (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005))))))))

(assert (=> d!85448 (validate_offset_bit!0 ((_ sign_extend 32) (size!6033 (buf!6541 (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005))))) ((_ sign_extend 32) (currentByte!12005 (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005)))) ((_ sign_extend 32) (currentBit!12000 (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005)))))))

(assert (=> d!85448 (= (readBit!0 (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005))) lt!395180)))

(declare-fun lt!395178 () (_ BitVec 64))

(declare-fun lt!395181 () (_ BitVec 64))

(declare-fun b!254421 () Bool)

(assert (=> b!254421 (= e!176273 (= (bitIndex!0 (size!6033 (buf!6541 (_2!11818 (increaseBitIndex!0 (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005)))))) (currentByte!12005 (_2!11818 (increaseBitIndex!0 (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005))))) (currentBit!12000 (_2!11818 (increaseBitIndex!0 (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005)))))) (bvadd lt!395178 lt!395181)))))

(assert (=> b!254421 (or (not (= (bvand lt!395178 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!395181 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!395178 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!395178 lt!395181) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!254421 (= lt!395181 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!254421 (= lt!395178 (bitIndex!0 (size!6033 (buf!6541 (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005)))) (currentByte!12005 (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005))) (currentBit!12000 (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005)))))))

(declare-fun lt!395176 () Bool)

(assert (=> b!254421 (= lt!395176 (not (= (bvand ((_ sign_extend 24) (select (arr!7020 (buf!6541 (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005)))) (currentByte!12005 (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12000 (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!395177 () Bool)

(assert (=> b!254421 (= lt!395177 (not (= (bvand ((_ sign_extend 24) (select (arr!7020 (buf!6541 (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005)))) (currentByte!12005 (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12000 (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!395179 () Bool)

(assert (=> b!254421 (= lt!395179 (not (= (bvand ((_ sign_extend 24) (select (arr!7020 (buf!6541 (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005)))) (currentByte!12005 (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12000 (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!85448 res!213186) b!254421))

(declare-fun m!383171 () Bool)

(assert (=> d!85448 m!383171))

(declare-fun m!383173 () Bool)

(assert (=> d!85448 m!383173))

(declare-fun m!383175 () Bool)

(assert (=> d!85448 m!383175))

(declare-fun m!383177 () Bool)

(assert (=> d!85448 m!383177))

(declare-fun m!383179 () Bool)

(assert (=> b!254421 m!383179))

(assert (=> b!254421 m!383173))

(declare-fun m!383181 () Bool)

(assert (=> b!254421 m!383181))

(assert (=> b!254421 m!383175))

(assert (=> b!254421 m!383171))

(assert (=> d!85162 d!85448))

(declare-fun d!85450 () Bool)

(declare-fun res!213187 () Bool)

(declare-fun e!176274 () Bool)

(assert (=> d!85450 (=> (not res!213187) (not e!176274))))

(assert (=> d!85450 (= res!213187 (= (size!6033 (buf!6541 (_2!11820 lt!394619))) (size!6033 (buf!6541 (_2!11818 lt!394112)))))))

(assert (=> d!85450 (= (isPrefixOf!0 (_2!11820 lt!394619) (_2!11818 lt!394112)) e!176274)))

(declare-fun b!254422 () Bool)

(declare-fun res!213189 () Bool)

(assert (=> b!254422 (=> (not res!213189) (not e!176274))))

(assert (=> b!254422 (= res!213189 (bvsle (bitIndex!0 (size!6033 (buf!6541 (_2!11820 lt!394619))) (currentByte!12005 (_2!11820 lt!394619)) (currentBit!12000 (_2!11820 lt!394619))) (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394112))) (currentByte!12005 (_2!11818 lt!394112)) (currentBit!12000 (_2!11818 lt!394112)))))))

(declare-fun b!254423 () Bool)

(declare-fun e!176275 () Bool)

(assert (=> b!254423 (= e!176274 e!176275)))

(declare-fun res!213188 () Bool)

(assert (=> b!254423 (=> res!213188 e!176275)))

(assert (=> b!254423 (= res!213188 (= (size!6033 (buf!6541 (_2!11820 lt!394619))) #b00000000000000000000000000000000))))

(declare-fun b!254424 () Bool)

(assert (=> b!254424 (= e!176275 (arrayBitRangesEq!0 (buf!6541 (_2!11820 lt!394619)) (buf!6541 (_2!11818 lt!394112)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6033 (buf!6541 (_2!11820 lt!394619))) (currentByte!12005 (_2!11820 lt!394619)) (currentBit!12000 (_2!11820 lt!394619)))))))

(assert (= (and d!85450 res!213187) b!254422))

(assert (= (and b!254422 res!213189) b!254423))

(assert (= (and b!254423 (not res!213188)) b!254424))

(declare-fun m!383183 () Bool)

(assert (=> b!254422 m!383183))

(assert (=> b!254422 m!382101))

(assert (=> b!254424 m!383183))

(assert (=> b!254424 m!383183))

(declare-fun m!383185 () Bool)

(assert (=> b!254424 m!383185))

(assert (=> b!254030 d!85450))

(declare-fun d!85452 () Bool)

(declare-fun lt!395183 () tuple2!21784)

(assert (=> d!85452 (= lt!395183 (readBit!0 (readerFrom!0 (_2!11818 lt!394560) (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005))))))

(assert (=> d!85452 (= (readBitPure!0 (readerFrom!0 (_2!11818 lt!394560) (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005))) (tuple2!21777 (_2!11823 lt!395183) (_1!11823 lt!395183)))))

(declare-fun bs!21575 () Bool)

(assert (= bs!21575 d!85452))

(assert (=> bs!21575 m!382493))

(declare-fun m!383187 () Bool)

(assert (=> bs!21575 m!383187))

(assert (=> b!254006 d!85452))

(declare-fun d!85454 () Bool)

(declare-fun e!176276 () Bool)

(assert (=> d!85454 e!176276))

(declare-fun res!213190 () Bool)

(assert (=> d!85454 (=> (not res!213190) (not e!176276))))

(assert (=> d!85454 (= res!213190 (invariant!0 (currentBit!12000 (_2!11818 lt!394560)) (currentByte!12005 (_2!11818 lt!394560)) (size!6033 (buf!6541 (_2!11818 lt!394560)))))))

(assert (=> d!85454 (= (readerFrom!0 (_2!11818 lt!394560) (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005)) (BitStream!10989 (buf!6541 (_2!11818 lt!394560)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005)))))

(declare-fun b!254425 () Bool)

(assert (=> b!254425 (= e!176276 (invariant!0 (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005) (size!6033 (buf!6541 (_2!11818 lt!394560)))))))

(assert (= (and d!85454 res!213190) b!254425))

(declare-fun m!383189 () Bool)

(assert (=> d!85454 m!383189))

(declare-fun m!383191 () Bool)

(assert (=> b!254425 m!383191))

(assert (=> b!254006 d!85454))

(declare-fun d!85456 () Bool)

(declare-fun e!176277 () Bool)

(assert (=> d!85456 e!176277))

(declare-fun res!213191 () Bool)

(assert (=> d!85456 (=> (not res!213191) (not e!176277))))

(assert (=> d!85456 (= res!213191 (= (buf!6541 (_2!11818 (increaseBitIndex!0 (readerFrom!0 (_2!11818 lt!394114) (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005))))) (buf!6541 (readerFrom!0 (_2!11818 lt!394114) (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005)))))))

(declare-fun lt!395190 () Bool)

(assert (=> d!85456 (= lt!395190 (not (= (bvand ((_ sign_extend 24) (select (arr!7020 (buf!6541 (readerFrom!0 (_2!11818 lt!394114) (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005)))) (currentByte!12005 (readerFrom!0 (_2!11818 lt!394114) (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12000 (readerFrom!0 (_2!11818 lt!394114) (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!395188 () tuple2!21784)

(assert (=> d!85456 (= lt!395188 (tuple2!21785 (not (= (bvand ((_ sign_extend 24) (select (arr!7020 (buf!6541 (readerFrom!0 (_2!11818 lt!394114) (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005)))) (currentByte!12005 (readerFrom!0 (_2!11818 lt!394114) (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12000 (readerFrom!0 (_2!11818 lt!394114) (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005)))))) #b00000000000000000000000000000000)) (_2!11818 (increaseBitIndex!0 (readerFrom!0 (_2!11818 lt!394114) (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005))))))))

(assert (=> d!85456 (validate_offset_bit!0 ((_ sign_extend 32) (size!6033 (buf!6541 (readerFrom!0 (_2!11818 lt!394114) (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005))))) ((_ sign_extend 32) (currentByte!12005 (readerFrom!0 (_2!11818 lt!394114) (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005)))) ((_ sign_extend 32) (currentBit!12000 (readerFrom!0 (_2!11818 lt!394114) (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005)))))))

(assert (=> d!85456 (= (readBit!0 (readerFrom!0 (_2!11818 lt!394114) (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005))) lt!395188)))

(declare-fun lt!395189 () (_ BitVec 64))

(declare-fun lt!395186 () (_ BitVec 64))

(declare-fun b!254426 () Bool)

(assert (=> b!254426 (= e!176277 (= (bitIndex!0 (size!6033 (buf!6541 (_2!11818 (increaseBitIndex!0 (readerFrom!0 (_2!11818 lt!394114) (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005)))))) (currentByte!12005 (_2!11818 (increaseBitIndex!0 (readerFrom!0 (_2!11818 lt!394114) (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005))))) (currentBit!12000 (_2!11818 (increaseBitIndex!0 (readerFrom!0 (_2!11818 lt!394114) (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005)))))) (bvadd lt!395186 lt!395189)))))

(assert (=> b!254426 (or (not (= (bvand lt!395186 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!395189 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!395186 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!395186 lt!395189) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!254426 (= lt!395189 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!254426 (= lt!395186 (bitIndex!0 (size!6033 (buf!6541 (readerFrom!0 (_2!11818 lt!394114) (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005)))) (currentByte!12005 (readerFrom!0 (_2!11818 lt!394114) (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005))) (currentBit!12000 (readerFrom!0 (_2!11818 lt!394114) (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005)))))))

(declare-fun lt!395184 () Bool)

(assert (=> b!254426 (= lt!395184 (not (= (bvand ((_ sign_extend 24) (select (arr!7020 (buf!6541 (readerFrom!0 (_2!11818 lt!394114) (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005)))) (currentByte!12005 (readerFrom!0 (_2!11818 lt!394114) (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12000 (readerFrom!0 (_2!11818 lt!394114) (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!395185 () Bool)

(assert (=> b!254426 (= lt!395185 (not (= (bvand ((_ sign_extend 24) (select (arr!7020 (buf!6541 (readerFrom!0 (_2!11818 lt!394114) (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005)))) (currentByte!12005 (readerFrom!0 (_2!11818 lt!394114) (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12000 (readerFrom!0 (_2!11818 lt!394114) (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!395187 () Bool)

(assert (=> b!254426 (= lt!395187 (not (= (bvand ((_ sign_extend 24) (select (arr!7020 (buf!6541 (readerFrom!0 (_2!11818 lt!394114) (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005)))) (currentByte!12005 (readerFrom!0 (_2!11818 lt!394114) (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12000 (readerFrom!0 (_2!11818 lt!394114) (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!85456 res!213191) b!254426))

(assert (=> d!85456 m!382097))

(declare-fun m!383193 () Bool)

(assert (=> d!85456 m!383193))

(declare-fun m!383195 () Bool)

(assert (=> d!85456 m!383195))

(declare-fun m!383197 () Bool)

(assert (=> d!85456 m!383197))

(declare-fun m!383199 () Bool)

(assert (=> d!85456 m!383199))

(declare-fun m!383201 () Bool)

(assert (=> b!254426 m!383201))

(assert (=> b!254426 m!383195))

(declare-fun m!383203 () Bool)

(assert (=> b!254426 m!383203))

(assert (=> b!254426 m!383197))

(assert (=> b!254426 m!382097))

(assert (=> b!254426 m!383193))

(assert (=> d!85184 d!85456))

(declare-fun d!85458 () Bool)

(assert (=> d!85458 (= (remainingBits!0 ((_ sign_extend 32) (size!6033 (buf!6541 (_1!11819 lt!394118)))) ((_ sign_extend 32) (currentByte!12005 (_1!11819 lt!394118))) ((_ sign_extend 32) (currentBit!12000 (_1!11819 lt!394118)))) (bvsub (bvmul ((_ sign_extend 32) (size!6033 (buf!6541 (_1!11819 lt!394118)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12005 (_1!11819 lt!394118))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12000 (_1!11819 lt!394118))))))))

(assert (=> d!85196 d!85458))

(declare-fun d!85460 () Bool)

(assert (=> d!85460 (= (invariant!0 (currentBit!12000 (_1!11819 lt!394118)) (currentByte!12005 (_1!11819 lt!394118)) (size!6033 (buf!6541 (_1!11819 lt!394118)))) (and (bvsge (currentBit!12000 (_1!11819 lt!394118)) #b00000000000000000000000000000000) (bvslt (currentBit!12000 (_1!11819 lt!394118)) #b00000000000000000000000000001000) (bvsge (currentByte!12005 (_1!11819 lt!394118)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12005 (_1!11819 lt!394118)) (size!6033 (buf!6541 (_1!11819 lt!394118)))) (and (= (currentBit!12000 (_1!11819 lt!394118)) #b00000000000000000000000000000000) (= (currentByte!12005 (_1!11819 lt!394118)) (size!6033 (buf!6541 (_1!11819 lt!394118))))))))))

(assert (=> d!85196 d!85460))

(assert (=> b!254074 d!85176))

(assert (=> b!254028 d!85178))

(declare-fun d!85462 () Bool)

(assert (=> d!85462 (arrayBitRangesEq!0 (buf!6541 (_2!11818 lt!394112)) (buf!6541 (_2!11818 lt!394114)) lt!394612 lt!394613)))

(declare-fun lt!395191 () Unit!18241)

(assert (=> d!85462 (= lt!395191 (choose!8 (buf!6541 (_2!11818 lt!394114)) (buf!6541 (_2!11818 lt!394112)) lt!394612 lt!394613))))

(assert (=> d!85462 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!394612) (bvsle lt!394612 lt!394613))))

(assert (=> d!85462 (= (arrayBitRangesEqSymmetric!0 (buf!6541 (_2!11818 lt!394114)) (buf!6541 (_2!11818 lt!394112)) lt!394612 lt!394613) lt!395191)))

(declare-fun bs!21576 () Bool)

(assert (= bs!21576 d!85462))

(assert (=> bs!21576 m!382551))

(declare-fun m!383205 () Bool)

(assert (=> bs!21576 m!383205))

(assert (=> b!254028 d!85462))

(declare-fun lt!395193 () (_ BitVec 32))

(declare-fun call!4000 () Bool)

(declare-fun lt!395192 () (_ BitVec 32))

(declare-fun c!11737 () Bool)

(declare-fun bm!3997 () Bool)

(declare-fun lt!395194 () tuple4!304)

(assert (=> bm!3997 (= call!4000 (byteRangesEq!0 (select (arr!7020 (buf!6541 (_2!11818 lt!394112))) (_3!932 lt!395194)) (select (arr!7020 (buf!6541 (_2!11818 lt!394114))) (_3!932 lt!395194)) lt!395192 (ite c!11737 lt!395193 #b00000000000000000000000000001000)))))

(declare-fun d!85464 () Bool)

(declare-fun res!213195 () Bool)

(declare-fun e!176278 () Bool)

(assert (=> d!85464 (=> res!213195 e!176278)))

(assert (=> d!85464 (= res!213195 (bvsge lt!394612 lt!394613))))

(assert (=> d!85464 (= (arrayBitRangesEq!0 (buf!6541 (_2!11818 lt!394112)) (buf!6541 (_2!11818 lt!394114)) lt!394612 lt!394613) e!176278)))

(declare-fun b!254427 () Bool)

(declare-fun e!176282 () Bool)

(assert (=> b!254427 (= e!176278 e!176282)))

(declare-fun res!213192 () Bool)

(assert (=> b!254427 (=> (not res!213192) (not e!176282))))

(declare-fun e!176279 () Bool)

(assert (=> b!254427 (= res!213192 e!176279)))

(declare-fun res!213196 () Bool)

(assert (=> b!254427 (=> res!213196 e!176279)))

(assert (=> b!254427 (= res!213196 (bvsge (_1!11825 lt!395194) (_2!11825 lt!395194)))))

(assert (=> b!254427 (= lt!395193 ((_ extract 31 0) (bvsrem lt!394613 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254427 (= lt!395192 ((_ extract 31 0) (bvsrem lt!394612 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254427 (= lt!395194 (arrayBitIndices!0 lt!394612 lt!394613))))

(declare-fun b!254428 () Bool)

(declare-fun res!213193 () Bool)

(assert (=> b!254428 (= res!213193 (= lt!395193 #b00000000000000000000000000000000))))

(declare-fun e!176283 () Bool)

(assert (=> b!254428 (=> res!213193 e!176283)))

(declare-fun e!176281 () Bool)

(assert (=> b!254428 (= e!176281 e!176283)))

(declare-fun b!254429 () Bool)

(declare-fun e!176280 () Bool)

(assert (=> b!254429 (= e!176282 e!176280)))

(assert (=> b!254429 (= c!11737 (= (_3!932 lt!395194) (_4!152 lt!395194)))))

(declare-fun b!254430 () Bool)

(assert (=> b!254430 (= e!176283 (byteRangesEq!0 (select (arr!7020 (buf!6541 (_2!11818 lt!394112))) (_4!152 lt!395194)) (select (arr!7020 (buf!6541 (_2!11818 lt!394114))) (_4!152 lt!395194)) #b00000000000000000000000000000000 lt!395193))))

(declare-fun b!254431 () Bool)

(assert (=> b!254431 (= e!176280 call!4000)))

(declare-fun b!254432 () Bool)

(assert (=> b!254432 (= e!176280 e!176281)))

(declare-fun res!213194 () Bool)

(assert (=> b!254432 (= res!213194 call!4000)))

(assert (=> b!254432 (=> (not res!213194) (not e!176281))))

(declare-fun b!254433 () Bool)

(assert (=> b!254433 (= e!176279 (arrayRangesEq!929 (buf!6541 (_2!11818 lt!394112)) (buf!6541 (_2!11818 lt!394114)) (_1!11825 lt!395194) (_2!11825 lt!395194)))))

(assert (= (and d!85464 (not res!213195)) b!254427))

(assert (= (and b!254427 (not res!213196)) b!254433))

(assert (= (and b!254427 res!213192) b!254429))

(assert (= (and b!254429 c!11737) b!254431))

(assert (= (and b!254429 (not c!11737)) b!254432))

(assert (= (and b!254432 res!213194) b!254428))

(assert (= (and b!254428 (not res!213193)) b!254430))

(assert (= (or b!254431 b!254432) bm!3997))

(declare-fun m!383207 () Bool)

(assert (=> bm!3997 m!383207))

(declare-fun m!383209 () Bool)

(assert (=> bm!3997 m!383209))

(assert (=> bm!3997 m!383207))

(assert (=> bm!3997 m!383209))

(declare-fun m!383211 () Bool)

(assert (=> bm!3997 m!383211))

(declare-fun m!383213 () Bool)

(assert (=> b!254427 m!383213))

(declare-fun m!383215 () Bool)

(assert (=> b!254430 m!383215))

(declare-fun m!383217 () Bool)

(assert (=> b!254430 m!383217))

(assert (=> b!254430 m!383215))

(assert (=> b!254430 m!383217))

(declare-fun m!383219 () Bool)

(assert (=> b!254430 m!383219))

(declare-fun m!383221 () Bool)

(assert (=> b!254433 m!383221))

(assert (=> b!254028 d!85464))

(declare-fun d!85466 () Bool)

(declare-fun e!176284 () Bool)

(assert (=> d!85466 e!176284))

(declare-fun res!213198 () Bool)

(assert (=> d!85466 (=> (not res!213198) (not e!176284))))

(declare-fun lt!395198 () (_ BitVec 64))

(declare-fun lt!395197 () (_ BitVec 64))

(declare-fun lt!395196 () (_ BitVec 64))

(assert (=> d!85466 (= res!213198 (= lt!395197 (bvsub lt!395196 lt!395198)))))

(assert (=> d!85466 (or (= (bvand lt!395196 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!395198 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!395196 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!395196 lt!395198) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85466 (= lt!395198 (remainingBits!0 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394560)))) ((_ sign_extend 32) (currentByte!12005 (_2!11818 lt!394560))) ((_ sign_extend 32) (currentBit!12000 (_2!11818 lt!394560)))))))

(declare-fun lt!395200 () (_ BitVec 64))

(declare-fun lt!395199 () (_ BitVec 64))

(assert (=> d!85466 (= lt!395196 (bvmul lt!395200 lt!395199))))

(assert (=> d!85466 (or (= lt!395200 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!395199 (bvsdiv (bvmul lt!395200 lt!395199) lt!395200)))))

(assert (=> d!85466 (= lt!395199 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85466 (= lt!395200 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394560)))))))

(assert (=> d!85466 (= lt!395197 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12005 (_2!11818 lt!394560))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12000 (_2!11818 lt!394560)))))))

(assert (=> d!85466 (invariant!0 (currentBit!12000 (_2!11818 lt!394560)) (currentByte!12005 (_2!11818 lt!394560)) (size!6033 (buf!6541 (_2!11818 lt!394560))))))

(assert (=> d!85466 (= (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394560))) (currentByte!12005 (_2!11818 lt!394560)) (currentBit!12000 (_2!11818 lt!394560))) lt!395197)))

(declare-fun b!254434 () Bool)

(declare-fun res!213197 () Bool)

(assert (=> b!254434 (=> (not res!213197) (not e!176284))))

(assert (=> b!254434 (= res!213197 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!395197))))

(declare-fun b!254435 () Bool)

(declare-fun lt!395195 () (_ BitVec 64))

(assert (=> b!254435 (= e!176284 (bvsle lt!395197 (bvmul lt!395195 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254435 (or (= lt!395195 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!395195 #b0000000000000000000000000000000000000000000000000000000000001000) lt!395195)))))

(assert (=> b!254435 (= lt!395195 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394560)))))))

(assert (= (and d!85466 res!213198) b!254434))

(assert (= (and b!254434 res!213197) b!254435))

(declare-fun m!383223 () Bool)

(assert (=> d!85466 m!383223))

(assert (=> d!85466 m!383189))

(assert (=> b!254004 d!85466))

(assert (=> b!254004 d!85180))

(declare-fun d!85468 () Bool)

(declare-fun e!176285 () Bool)

(assert (=> d!85468 e!176285))

(declare-fun res!213199 () Bool)

(assert (=> d!85468 (=> (not res!213199) (not e!176285))))

(assert (=> d!85468 (= res!213199 (= (buf!6541 (_2!11818 (increaseBitIndex!0 lt!394115))) (buf!6541 lt!394115)))))

(declare-fun lt!395207 () Bool)

(assert (=> d!85468 (= lt!395207 (not (= (bvand ((_ sign_extend 24) (select (arr!7020 (buf!6541 lt!394115)) (currentByte!12005 lt!394115))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12000 lt!394115)))) #b00000000000000000000000000000000)))))

(declare-fun lt!395205 () tuple2!21784)

(assert (=> d!85468 (= lt!395205 (tuple2!21785 (not (= (bvand ((_ sign_extend 24) (select (arr!7020 (buf!6541 lt!394115)) (currentByte!12005 lt!394115))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12000 lt!394115)))) #b00000000000000000000000000000000)) (_2!11818 (increaseBitIndex!0 lt!394115))))))

(assert (=> d!85468 (validate_offset_bit!0 ((_ sign_extend 32) (size!6033 (buf!6541 lt!394115))) ((_ sign_extend 32) (currentByte!12005 lt!394115)) ((_ sign_extend 32) (currentBit!12000 lt!394115)))))

(assert (=> d!85468 (= (readBit!0 lt!394115) lt!395205)))

(declare-fun lt!395203 () (_ BitVec 64))

(declare-fun b!254436 () Bool)

(declare-fun lt!395206 () (_ BitVec 64))

(assert (=> b!254436 (= e!176285 (= (bitIndex!0 (size!6033 (buf!6541 (_2!11818 (increaseBitIndex!0 lt!394115)))) (currentByte!12005 (_2!11818 (increaseBitIndex!0 lt!394115))) (currentBit!12000 (_2!11818 (increaseBitIndex!0 lt!394115)))) (bvadd lt!395203 lt!395206)))))

(assert (=> b!254436 (or (not (= (bvand lt!395203 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!395206 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!395203 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!395203 lt!395206) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!254436 (= lt!395206 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!254436 (= lt!395203 (bitIndex!0 (size!6033 (buf!6541 lt!394115)) (currentByte!12005 lt!394115) (currentBit!12000 lt!394115)))))

(declare-fun lt!395201 () Bool)

(assert (=> b!254436 (= lt!395201 (not (= (bvand ((_ sign_extend 24) (select (arr!7020 (buf!6541 lt!394115)) (currentByte!12005 lt!394115))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12000 lt!394115)))) #b00000000000000000000000000000000)))))

(declare-fun lt!395202 () Bool)

(assert (=> b!254436 (= lt!395202 (not (= (bvand ((_ sign_extend 24) (select (arr!7020 (buf!6541 lt!394115)) (currentByte!12005 lt!394115))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12000 lt!394115)))) #b00000000000000000000000000000000)))))

(declare-fun lt!395204 () Bool)

(assert (=> b!254436 (= lt!395204 (not (= (bvand ((_ sign_extend 24) (select (arr!7020 (buf!6541 lt!394115)) (currentByte!12005 lt!394115))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12000 lt!394115)))) #b00000000000000000000000000000000)))))

(assert (= (and d!85468 res!213199) b!254436))

(declare-fun m!383225 () Bool)

(assert (=> d!85468 m!383225))

(declare-fun m!383227 () Bool)

(assert (=> d!85468 m!383227))

(declare-fun m!383229 () Bool)

(assert (=> d!85468 m!383229))

(declare-fun m!383231 () Bool)

(assert (=> d!85468 m!383231))

(declare-fun m!383233 () Bool)

(assert (=> b!254436 m!383233))

(assert (=> b!254436 m!383227))

(declare-fun m!383235 () Bool)

(assert (=> b!254436 m!383235))

(assert (=> b!254436 m!383229))

(assert (=> b!254436 m!383225))

(assert (=> d!85102 d!85468))

(declare-fun lt!395210 () tuple4!304)

(declare-fun lt!395209 () (_ BitVec 32))

(declare-fun lt!395208 () (_ BitVec 32))

(declare-fun c!11738 () Bool)

(declare-fun call!4001 () Bool)

(declare-fun bm!3998 () Bool)

(assert (=> bm!3998 (= call!4001 (byteRangesEq!0 (select (arr!7020 (buf!6541 thiss!1005)) (_3!932 lt!395210)) (select (arr!7020 (buf!6541 (_2!11818 lt!394114))) (_3!932 lt!395210)) lt!395208 (ite c!11738 lt!395209 #b00000000000000000000000000001000)))))

(declare-fun d!85470 () Bool)

(declare-fun res!213203 () Bool)

(declare-fun e!176286 () Bool)

(assert (=> d!85470 (=> res!213203 e!176286)))

(assert (=> d!85470 (= res!213203 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6033 (buf!6541 thiss!1005)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005))))))

(assert (=> d!85470 (= (arrayBitRangesEq!0 (buf!6541 thiss!1005) (buf!6541 (_2!11818 lt!394114)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6033 (buf!6541 thiss!1005)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005))) e!176286)))

(declare-fun b!254437 () Bool)

(declare-fun e!176290 () Bool)

(assert (=> b!254437 (= e!176286 e!176290)))

(declare-fun res!213200 () Bool)

(assert (=> b!254437 (=> (not res!213200) (not e!176290))))

(declare-fun e!176287 () Bool)

(assert (=> b!254437 (= res!213200 e!176287)))

(declare-fun res!213204 () Bool)

(assert (=> b!254437 (=> res!213204 e!176287)))

(assert (=> b!254437 (= res!213204 (bvsge (_1!11825 lt!395210) (_2!11825 lt!395210)))))

(assert (=> b!254437 (= lt!395209 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6033 (buf!6541 thiss!1005)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254437 (= lt!395208 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254437 (= lt!395210 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6033 (buf!6541 thiss!1005)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005))))))

(declare-fun b!254438 () Bool)

(declare-fun res!213201 () Bool)

(assert (=> b!254438 (= res!213201 (= lt!395209 #b00000000000000000000000000000000))))

(declare-fun e!176291 () Bool)

(assert (=> b!254438 (=> res!213201 e!176291)))

(declare-fun e!176289 () Bool)

(assert (=> b!254438 (= e!176289 e!176291)))

(declare-fun b!254439 () Bool)

(declare-fun e!176288 () Bool)

(assert (=> b!254439 (= e!176290 e!176288)))

(assert (=> b!254439 (= c!11738 (= (_3!932 lt!395210) (_4!152 lt!395210)))))

(declare-fun b!254440 () Bool)

(assert (=> b!254440 (= e!176291 (byteRangesEq!0 (select (arr!7020 (buf!6541 thiss!1005)) (_4!152 lt!395210)) (select (arr!7020 (buf!6541 (_2!11818 lt!394114))) (_4!152 lt!395210)) #b00000000000000000000000000000000 lt!395209))))

(declare-fun b!254441 () Bool)

(assert (=> b!254441 (= e!176288 call!4001)))

(declare-fun b!254442 () Bool)

(assert (=> b!254442 (= e!176288 e!176289)))

(declare-fun res!213202 () Bool)

(assert (=> b!254442 (= res!213202 call!4001)))

(assert (=> b!254442 (=> (not res!213202) (not e!176289))))

(declare-fun b!254443 () Bool)

(assert (=> b!254443 (= e!176287 (arrayRangesEq!929 (buf!6541 thiss!1005) (buf!6541 (_2!11818 lt!394114)) (_1!11825 lt!395210) (_2!11825 lt!395210)))))

(assert (= (and d!85470 (not res!213203)) b!254437))

(assert (= (and b!254437 (not res!213204)) b!254443))

(assert (= (and b!254437 res!213200) b!254439))

(assert (= (and b!254439 c!11738) b!254441))

(assert (= (and b!254439 (not c!11738)) b!254442))

(assert (= (and b!254442 res!213202) b!254438))

(assert (= (and b!254438 (not res!213201)) b!254440))

(assert (= (or b!254441 b!254442) bm!3998))

(declare-fun m!383237 () Bool)

(assert (=> bm!3998 m!383237))

(declare-fun m!383239 () Bool)

(assert (=> bm!3998 m!383239))

(assert (=> bm!3998 m!383237))

(assert (=> bm!3998 m!383239))

(declare-fun m!383241 () Bool)

(assert (=> bm!3998 m!383241))

(assert (=> b!254437 m!382093))

(assert (=> b!254437 m!383045))

(declare-fun m!383243 () Bool)

(assert (=> b!254440 m!383243))

(declare-fun m!383245 () Bool)

(assert (=> b!254440 m!383245))

(assert (=> b!254440 m!383243))

(assert (=> b!254440 m!383245))

(declare-fun m!383247 () Bool)

(assert (=> b!254440 m!383247))

(declare-fun m!383249 () Bool)

(assert (=> b!254443 m!383249))

(assert (=> b!254079 d!85470))

(assert (=> b!254079 d!85180))

(assert (=> d!85160 d!85098))

(declare-fun d!85472 () Bool)

(assert (=> d!85472 (validate_offset_bits!1 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394112)))) ((_ sign_extend 32) (currentByte!12005 (_2!11818 lt!394114))) ((_ sign_extend 32) (currentBit!12000 (_2!11818 lt!394114))) lt!394130)))

(assert (=> d!85472 true))

(declare-fun _$6!437 () Unit!18241)

(assert (=> d!85472 (= (choose!9 (_2!11818 lt!394114) (buf!6541 (_2!11818 lt!394112)) lt!394130 (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 (_2!11818 lt!394114)) (currentBit!12000 (_2!11818 lt!394114)))) _$6!437)))

(declare-fun bs!21577 () Bool)

(assert (= bs!21577 d!85472))

(assert (=> bs!21577 m!382129))

(assert (=> d!85160 d!85472))

(declare-fun b!254444 () Bool)

(declare-fun e!176295 () tuple2!21784)

(assert (=> b!254444 (= e!176295 (tuple2!21785 true (_1!11820 lt!394126)))))

(declare-fun b!254445 () Bool)

(declare-fun lt!395219 () (_ BitVec 64))

(declare-fun lt!395221 () tuple2!21784)

(declare-fun e!176296 () Bool)

(assert (=> b!254445 (= e!176296 (= (bvsub lt!395219 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (bitIndex!0 (size!6033 (buf!6541 (_2!11823 lt!395221))) (currentByte!12005 (_2!11823 lt!395221)) (currentBit!12000 (_2!11823 lt!395221)))))))

(assert (=> b!254445 (or (= (bvand lt!395219 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!395219 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!395219 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!395216 () (_ BitVec 64))

(assert (=> b!254445 (= lt!395219 (bvadd lt!395216 nBits!297))))

(assert (=> b!254445 (or (not (= (bvand lt!395216 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!395216 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!395216 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!254445 (= lt!395216 (bitIndex!0 (size!6033 (buf!6541 (_1!11820 lt!394126))) (currentByte!12005 (_1!11820 lt!394126)) (currentBit!12000 (_1!11820 lt!394126))))))

(declare-fun b!254446 () Bool)

(declare-fun res!213205 () Bool)

(declare-fun e!176294 () Bool)

(assert (=> b!254446 (=> (not res!213205) (not e!176294))))

(assert (=> b!254446 (= res!213205 e!176296)))

(declare-fun res!213209 () Bool)

(assert (=> b!254446 (=> res!213209 e!176296)))

(assert (=> b!254446 (= res!213209 (not (_1!11823 lt!395221)))))

(declare-fun b!254448 () Bool)

(declare-fun res!213206 () Bool)

(assert (=> b!254448 (=> (not res!213206) (not e!176294))))

(assert (=> b!254448 (= res!213206 (and (= (buf!6541 (_1!11820 lt!394126)) (buf!6541 (_2!11823 lt!395221))) (or (not (= nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))) (_1!11823 lt!395221))))))

(declare-fun b!254449 () Bool)

(declare-fun lt!395215 () tuple2!21784)

(declare-fun lt!395211 () tuple2!21784)

(assert (=> b!254449 (= lt!395215 (checkBitsLoop!0 (_2!11823 lt!395211) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!395220 () Unit!18241)

(declare-fun lt!395213 () Unit!18241)

(assert (=> b!254449 (= lt!395220 lt!395213)))

(declare-fun lt!395212 () (_ BitVec 64))

(declare-fun lt!395218 () (_ BitVec 64))

(assert (=> b!254449 (validate_offset_bits!1 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11823 lt!395211)))) ((_ sign_extend 32) (currentByte!12005 (_2!11823 lt!395211))) ((_ sign_extend 32) (currentBit!12000 (_2!11823 lt!395211))) (bvsub lt!395212 lt!395218))))

(assert (=> b!254449 (= lt!395213 (validateOffsetBitsIneqLemma!0 (_1!11820 lt!394126) (_2!11823 lt!395211) lt!395212 lt!395218))))

(assert (=> b!254449 (= lt!395218 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!254449 (= lt!395212 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun e!176293 () tuple2!21784)

(assert (=> b!254449 (= e!176293 (tuple2!21785 (_1!11823 lt!395215) (_2!11823 lt!395215)))))

(declare-fun b!254450 () Bool)

(declare-fun e!176292 () Bool)

(assert (=> b!254450 (= e!176292 (= bit!26 (_2!11819 (readBitPure!0 (_1!11820 lt!394126)))))))

(declare-fun b!254451 () Bool)

(assert (=> b!254451 (= e!176295 e!176293)))

(assert (=> b!254451 (= lt!395211 (readBit!0 (_1!11820 lt!394126)))))

(declare-fun c!11739 () Bool)

(assert (=> b!254451 (= c!11739 (not (= (_1!11823 lt!395211) bit!26)))))

(declare-fun b!254452 () Bool)

(assert (=> b!254452 (= e!176294 e!176292)))

(declare-fun res!213208 () Bool)

(assert (=> b!254452 (=> res!213208 e!176292)))

(assert (=> b!254452 (= res!213208 (or (not (_1!11823 lt!395221)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) nBits!297)))))

(declare-fun b!254447 () Bool)

(assert (=> b!254447 (= e!176293 (tuple2!21785 false (_2!11823 lt!395211)))))

(declare-fun d!85474 () Bool)

(assert (=> d!85474 e!176294))

(declare-fun res!213207 () Bool)

(assert (=> d!85474 (=> (not res!213207) (not e!176294))))

(declare-fun lt!395214 () (_ BitVec 64))

(assert (=> d!85474 (= res!213207 (bvsge (bvsub lt!395214 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (bitIndex!0 (size!6033 (buf!6541 (_2!11823 lt!395221))) (currentByte!12005 (_2!11823 lt!395221)) (currentBit!12000 (_2!11823 lt!395221)))))))

(assert (=> d!85474 (or (= (bvand lt!395214 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!395214 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!395214 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!395217 () (_ BitVec 64))

(assert (=> d!85474 (= lt!395214 (bvadd lt!395217 nBits!297))))

(assert (=> d!85474 (or (not (= (bvand lt!395217 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!395217 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!395217 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85474 (= lt!395217 (bitIndex!0 (size!6033 (buf!6541 (_1!11820 lt!394126))) (currentByte!12005 (_1!11820 lt!394126)) (currentBit!12000 (_1!11820 lt!394126))))))

(assert (=> d!85474 (= lt!395221 e!176295)))

(declare-fun c!11740 () Bool)

(assert (=> d!85474 (= c!11740 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) nBits!297))))

(assert (=> d!85474 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!85474 (= (checkBitsLoop!0 (_1!11820 lt!394126) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!395221)))

(assert (= (and d!85474 c!11740) b!254444))

(assert (= (and d!85474 (not c!11740)) b!254451))

(assert (= (and b!254451 c!11739) b!254447))

(assert (= (and b!254451 (not c!11739)) b!254449))

(assert (= (and d!85474 res!213207) b!254448))

(assert (= (and b!254448 res!213206) b!254446))

(assert (= (and b!254446 (not res!213209)) b!254445))

(assert (= (and b!254446 res!213205) b!254452))

(assert (= (and b!254452 (not res!213208)) b!254450))

(declare-fun m!383251 () Bool)

(assert (=> d!85474 m!383251))

(declare-fun m!383253 () Bool)

(assert (=> d!85474 m!383253))

(declare-fun m!383255 () Bool)

(assert (=> b!254449 m!383255))

(declare-fun m!383257 () Bool)

(assert (=> b!254449 m!383257))

(declare-fun m!383259 () Bool)

(assert (=> b!254449 m!383259))

(declare-fun m!383261 () Bool)

(assert (=> b!254450 m!383261))

(declare-fun m!383263 () Bool)

(assert (=> b!254451 m!383263))

(assert (=> b!254445 m!383251))

(assert (=> b!254445 m!383253))

(assert (=> d!85152 d!85474))

(assert (=> b!254077 d!85180))

(assert (=> b!254077 d!85178))

(assert (=> d!85098 d!85364))

(assert (=> d!85172 d!85170))

(declare-fun d!85476 () Bool)

(assert (=> d!85476 (validate_offset_bits!1 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394112)))) ((_ sign_extend 32) (currentByte!12005 (_2!11818 lt!394114))) ((_ sign_extend 32) (currentBit!12000 (_2!11818 lt!394114))) lt!394129)))

(assert (=> d!85476 true))

(declare-fun _$6!438 () Unit!18241)

(assert (=> d!85476 (= (choose!9 (_2!11818 lt!394114) (buf!6541 (_2!11818 lt!394112)) lt!394129 (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 (_2!11818 lt!394114)) (currentBit!12000 (_2!11818 lt!394114)))) _$6!438)))

(declare-fun bs!21578 () Bool)

(assert (= bs!21578 d!85476))

(assert (=> bs!21578 m!382105))

(assert (=> d!85172 d!85476))

(declare-fun d!85478 () Bool)

(assert (=> d!85478 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394114)))) ((_ sign_extend 32) (currentByte!12005 (_2!11818 lt!394114))) ((_ sign_extend 32) (currentBit!12000 (_2!11818 lt!394114))) lt!394694) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394114)))) ((_ sign_extend 32) (currentByte!12005 (_2!11818 lt!394114))) ((_ sign_extend 32) (currentBit!12000 (_2!11818 lt!394114)))) lt!394694))))

(declare-fun bs!21579 () Bool)

(assert (= bs!21579 d!85478))

(assert (=> bs!21579 m!382427))

(assert (=> b!254059 d!85478))

(declare-fun d!85480 () Bool)

(declare-fun res!213210 () Bool)

(declare-fun e!176297 () Bool)

(assert (=> d!85480 (=> (not res!213210) (not e!176297))))

(assert (=> d!85480 (= res!213210 (= (size!6033 (buf!6541 (_2!11818 lt!394114))) (size!6033 (buf!6541 (_2!11818 lt!394114)))))))

(assert (=> d!85480 (= (isPrefixOf!0 (_2!11818 lt!394114) (_2!11818 lt!394114)) e!176297)))

(declare-fun b!254453 () Bool)

(declare-fun res!213212 () Bool)

(assert (=> b!254453 (=> (not res!213212) (not e!176297))))

(assert (=> b!254453 (= res!213212 (bvsle (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394114))) (currentByte!12005 (_2!11818 lt!394114)) (currentBit!12000 (_2!11818 lt!394114))) (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394114))) (currentByte!12005 (_2!11818 lt!394114)) (currentBit!12000 (_2!11818 lt!394114)))))))

(declare-fun b!254454 () Bool)

(declare-fun e!176298 () Bool)

(assert (=> b!254454 (= e!176297 e!176298)))

(declare-fun res!213211 () Bool)

(assert (=> b!254454 (=> res!213211 e!176298)))

(assert (=> b!254454 (= res!213211 (= (size!6033 (buf!6541 (_2!11818 lt!394114))) #b00000000000000000000000000000000))))

(declare-fun b!254455 () Bool)

(assert (=> b!254455 (= e!176298 (arrayBitRangesEq!0 (buf!6541 (_2!11818 lt!394114)) (buf!6541 (_2!11818 lt!394114)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394114))) (currentByte!12005 (_2!11818 lt!394114)) (currentBit!12000 (_2!11818 lt!394114)))))))

(assert (= (and d!85480 res!213210) b!254453))

(assert (= (and b!254453 res!213212) b!254454))

(assert (= (and b!254454 (not res!213211)) b!254455))

(assert (=> b!254453 m!382091))

(assert (=> b!254453 m!382091))

(assert (=> b!254455 m!382091))

(assert (=> b!254455 m!382091))

(declare-fun m!383265 () Bool)

(assert (=> b!254455 m!383265))

(assert (=> d!85112 d!85480))

(declare-fun d!85482 () Bool)

(assert (=> d!85482 (isPrefixOf!0 lt!394618 (_2!11818 lt!394112))))

(declare-fun lt!395222 () Unit!18241)

(assert (=> d!85482 (= lt!395222 (choose!30 lt!394618 (_2!11818 lt!394112) (_2!11818 lt!394112)))))

(assert (=> d!85482 (isPrefixOf!0 lt!394618 (_2!11818 lt!394112))))

(assert (=> d!85482 (= (lemmaIsPrefixTransitive!0 lt!394618 (_2!11818 lt!394112) (_2!11818 lt!394112)) lt!395222)))

(declare-fun bs!21580 () Bool)

(assert (= bs!21580 d!85482))

(assert (=> bs!21580 m!382537))

(declare-fun m!383267 () Bool)

(assert (=> bs!21580 m!383267))

(assert (=> bs!21580 m!382537))

(assert (=> d!85112 d!85482))

(declare-fun d!85484 () Bool)

(assert (=> d!85484 (isPrefixOf!0 lt!394618 lt!394618)))

(declare-fun lt!395223 () Unit!18241)

(assert (=> d!85484 (= lt!395223 (choose!11 lt!394618))))

(assert (=> d!85484 (= (lemmaIsPrefixRefl!0 lt!394618) lt!395223)))

(declare-fun bs!21581 () Bool)

(assert (= bs!21581 d!85484))

(assert (=> bs!21581 m!382533))

(declare-fun m!383269 () Bool)

(assert (=> bs!21581 m!383269))

(assert (=> d!85112 d!85484))

(declare-fun d!85486 () Bool)

(declare-fun res!213213 () Bool)

(declare-fun e!176299 () Bool)

(assert (=> d!85486 (=> (not res!213213) (not e!176299))))

(assert (=> d!85486 (= res!213213 (= (size!6033 (buf!6541 lt!394618)) (size!6033 (buf!6541 (_2!11818 lt!394112)))))))

(assert (=> d!85486 (= (isPrefixOf!0 lt!394618 (_2!11818 lt!394112)) e!176299)))

(declare-fun b!254456 () Bool)

(declare-fun res!213215 () Bool)

(assert (=> b!254456 (=> (not res!213215) (not e!176299))))

(assert (=> b!254456 (= res!213215 (bvsle (bitIndex!0 (size!6033 (buf!6541 lt!394618)) (currentByte!12005 lt!394618) (currentBit!12000 lt!394618)) (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394112))) (currentByte!12005 (_2!11818 lt!394112)) (currentBit!12000 (_2!11818 lt!394112)))))))

(declare-fun b!254457 () Bool)

(declare-fun e!176300 () Bool)

(assert (=> b!254457 (= e!176299 e!176300)))

(declare-fun res!213214 () Bool)

(assert (=> b!254457 (=> res!213214 e!176300)))

(assert (=> b!254457 (= res!213214 (= (size!6033 (buf!6541 lt!394618)) #b00000000000000000000000000000000))))

(declare-fun b!254458 () Bool)

(assert (=> b!254458 (= e!176300 (arrayBitRangesEq!0 (buf!6541 lt!394618) (buf!6541 (_2!11818 lt!394112)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6033 (buf!6541 lt!394618)) (currentByte!12005 lt!394618) (currentBit!12000 lt!394618))))))

(assert (= (and d!85486 res!213213) b!254456))

(assert (= (and b!254456 res!213215) b!254457))

(assert (= (and b!254457 (not res!213214)) b!254458))

(declare-fun m!383271 () Bool)

(assert (=> b!254456 m!383271))

(assert (=> b!254456 m!382101))

(assert (=> b!254458 m!383271))

(assert (=> b!254458 m!383271))

(declare-fun m!383273 () Bool)

(assert (=> b!254458 m!383273))

(assert (=> d!85112 d!85486))

(declare-fun d!85488 () Bool)

(declare-fun res!213216 () Bool)

(declare-fun e!176301 () Bool)

(assert (=> d!85488 (=> (not res!213216) (not e!176301))))

(assert (=> d!85488 (= res!213216 (= (size!6033 (buf!6541 lt!394618)) (size!6033 (buf!6541 lt!394618))))))

(assert (=> d!85488 (= (isPrefixOf!0 lt!394618 lt!394618) e!176301)))

(declare-fun b!254459 () Bool)

(declare-fun res!213218 () Bool)

(assert (=> b!254459 (=> (not res!213218) (not e!176301))))

(assert (=> b!254459 (= res!213218 (bvsle (bitIndex!0 (size!6033 (buf!6541 lt!394618)) (currentByte!12005 lt!394618) (currentBit!12000 lt!394618)) (bitIndex!0 (size!6033 (buf!6541 lt!394618)) (currentByte!12005 lt!394618) (currentBit!12000 lt!394618))))))

(declare-fun b!254460 () Bool)

(declare-fun e!176302 () Bool)

(assert (=> b!254460 (= e!176301 e!176302)))

(declare-fun res!213217 () Bool)

(assert (=> b!254460 (=> res!213217 e!176302)))

(assert (=> b!254460 (= res!213217 (= (size!6033 (buf!6541 lt!394618)) #b00000000000000000000000000000000))))

(declare-fun b!254461 () Bool)

(assert (=> b!254461 (= e!176302 (arrayBitRangesEq!0 (buf!6541 lt!394618) (buf!6541 lt!394618) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6033 (buf!6541 lt!394618)) (currentByte!12005 lt!394618) (currentBit!12000 lt!394618))))))

(assert (= (and d!85488 res!213216) b!254459))

(assert (= (and b!254459 res!213218) b!254460))

(assert (= (and b!254460 (not res!213217)) b!254461))

(assert (=> b!254459 m!383271))

(assert (=> b!254459 m!383271))

(assert (=> b!254461 m!383271))

(assert (=> b!254461 m!383271))

(declare-fun m!383275 () Bool)

(assert (=> b!254461 m!383275))

(assert (=> d!85112 d!85488))

(declare-fun d!85490 () Bool)

(assert (=> d!85490 (isPrefixOf!0 (_2!11818 lt!394114) (_2!11818 lt!394114))))

(declare-fun lt!395224 () Unit!18241)

(assert (=> d!85490 (= lt!395224 (choose!11 (_2!11818 lt!394114)))))

(assert (=> d!85490 (= (lemmaIsPrefixRefl!0 (_2!11818 lt!394114)) lt!395224)))

(declare-fun bs!21582 () Bool)

(assert (= bs!21582 d!85490))

(assert (=> bs!21582 m!382525))

(declare-fun m!383277 () Bool)

(assert (=> bs!21582 m!383277))

(assert (=> d!85112 d!85490))

(assert (=> d!85112 d!85436))

(declare-fun d!85492 () Bool)

(declare-fun res!213219 () Bool)

(declare-fun e!176303 () Bool)

(assert (=> d!85492 (=> (not res!213219) (not e!176303))))

(assert (=> d!85492 (= res!213219 (= (size!6033 (buf!6541 (_1!11820 lt!394619))) (size!6033 (buf!6541 (_2!11820 lt!394619)))))))

(assert (=> d!85492 (= (isPrefixOf!0 (_1!11820 lt!394619) (_2!11820 lt!394619)) e!176303)))

(declare-fun b!254462 () Bool)

(declare-fun res!213221 () Bool)

(assert (=> b!254462 (=> (not res!213221) (not e!176303))))

(assert (=> b!254462 (= res!213221 (bvsle (bitIndex!0 (size!6033 (buf!6541 (_1!11820 lt!394619))) (currentByte!12005 (_1!11820 lt!394619)) (currentBit!12000 (_1!11820 lt!394619))) (bitIndex!0 (size!6033 (buf!6541 (_2!11820 lt!394619))) (currentByte!12005 (_2!11820 lt!394619)) (currentBit!12000 (_2!11820 lt!394619)))))))

(declare-fun b!254463 () Bool)

(declare-fun e!176304 () Bool)

(assert (=> b!254463 (= e!176303 e!176304)))

(declare-fun res!213220 () Bool)

(assert (=> b!254463 (=> res!213220 e!176304)))

(assert (=> b!254463 (= res!213220 (= (size!6033 (buf!6541 (_1!11820 lt!394619))) #b00000000000000000000000000000000))))

(declare-fun b!254464 () Bool)

(assert (=> b!254464 (= e!176304 (arrayBitRangesEq!0 (buf!6541 (_1!11820 lt!394619)) (buf!6541 (_2!11820 lt!394619)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6033 (buf!6541 (_1!11820 lt!394619))) (currentByte!12005 (_1!11820 lt!394619)) (currentBit!12000 (_1!11820 lt!394619)))))))

(assert (= (and d!85492 res!213219) b!254462))

(assert (= (and b!254462 res!213221) b!254463))

(assert (= (and b!254463 (not res!213220)) b!254464))

(declare-fun m!383279 () Bool)

(assert (=> b!254462 m!383279))

(assert (=> b!254462 m!383183))

(assert (=> b!254464 m!383279))

(assert (=> b!254464 m!383279))

(declare-fun m!383281 () Bool)

(assert (=> b!254464 m!383281))

(assert (=> d!85112 d!85492))

(assert (=> d!85112 d!85440))

(declare-fun d!85494 () Bool)

(assert (=> d!85494 (isPrefixOf!0 lt!394618 (_2!11818 lt!394112))))

(declare-fun lt!395225 () Unit!18241)

(assert (=> d!85494 (= lt!395225 (choose!30 lt!394618 (_2!11818 lt!394114) (_2!11818 lt!394112)))))

(assert (=> d!85494 (isPrefixOf!0 lt!394618 (_2!11818 lt!394114))))

(assert (=> d!85494 (= (lemmaIsPrefixTransitive!0 lt!394618 (_2!11818 lt!394114) (_2!11818 lt!394112)) lt!395225)))

(declare-fun bs!21583 () Bool)

(assert (= bs!21583 d!85494))

(assert (=> bs!21583 m!382537))

(declare-fun m!383283 () Bool)

(assert (=> bs!21583 m!383283))

(declare-fun m!383285 () Bool)

(assert (=> bs!21583 m!383285))

(assert (=> d!85112 d!85494))

(assert (=> d!85112 d!85084))

(declare-fun d!85496 () Bool)

(assert (=> d!85496 (= (remainingBits!0 ((_ sign_extend 32) (size!6033 (buf!6541 (_1!11819 lt!394117)))) ((_ sign_extend 32) (currentByte!12005 (_1!11819 lt!394117))) ((_ sign_extend 32) (currentBit!12000 (_1!11819 lt!394117)))) (bvsub (bvmul ((_ sign_extend 32) (size!6033 (buf!6541 (_1!11819 lt!394117)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12005 (_1!11819 lt!394117))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12000 (_1!11819 lt!394117))))))))

(assert (=> d!85106 d!85496))

(declare-fun d!85498 () Bool)

(assert (=> d!85498 (= (invariant!0 (currentBit!12000 (_1!11819 lt!394117)) (currentByte!12005 (_1!11819 lt!394117)) (size!6033 (buf!6541 (_1!11819 lt!394117)))) (and (bvsge (currentBit!12000 (_1!11819 lt!394117)) #b00000000000000000000000000000000) (bvslt (currentBit!12000 (_1!11819 lt!394117)) #b00000000000000000000000000001000) (bvsge (currentByte!12005 (_1!11819 lt!394117)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12005 (_1!11819 lt!394117)) (size!6033 (buf!6541 (_1!11819 lt!394117)))) (and (= (currentBit!12000 (_1!11819 lt!394117)) #b00000000000000000000000000000000) (= (currentByte!12005 (_1!11819 lt!394117)) (size!6033 (buf!6541 (_1!11819 lt!394117))))))))))

(assert (=> d!85106 d!85498))

(declare-fun d!85500 () Bool)

(assert (=> d!85500 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394114)))) ((_ sign_extend 32) (currentByte!12005 (_2!11818 lt!394114))) ((_ sign_extend 32) (currentBit!12000 (_2!11818 lt!394114))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394114)))) ((_ sign_extend 32) (currentByte!12005 (_2!11818 lt!394114))) ((_ sign_extend 32) (currentBit!12000 (_2!11818 lt!394114)))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!21584 () Bool)

(assert (= bs!21584 d!85500))

(assert (=> bs!21584 m!382427))

(assert (=> b!254067 d!85500))

(declare-fun d!85502 () Bool)

(declare-fun res!213222 () Bool)

(declare-fun e!176305 () Bool)

(assert (=> d!85502 (=> (not res!213222) (not e!176305))))

(assert (=> d!85502 (= res!213222 (= (size!6033 (buf!6541 (_2!11818 lt!394114))) (size!6033 (buf!6541 (_2!11818 lt!394693)))))))

(assert (=> d!85502 (= (isPrefixOf!0 (_2!11818 lt!394114) (_2!11818 lt!394693)) e!176305)))

(declare-fun b!254465 () Bool)

(declare-fun res!213224 () Bool)

(assert (=> b!254465 (=> (not res!213224) (not e!176305))))

(assert (=> b!254465 (= res!213224 (bvsle (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394114))) (currentByte!12005 (_2!11818 lt!394114)) (currentBit!12000 (_2!11818 lt!394114))) (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394693))) (currentByte!12005 (_2!11818 lt!394693)) (currentBit!12000 (_2!11818 lt!394693)))))))

(declare-fun b!254466 () Bool)

(declare-fun e!176306 () Bool)

(assert (=> b!254466 (= e!176305 e!176306)))

(declare-fun res!213223 () Bool)

(assert (=> b!254466 (=> res!213223 e!176306)))

(assert (=> b!254466 (= res!213223 (= (size!6033 (buf!6541 (_2!11818 lt!394114))) #b00000000000000000000000000000000))))

(declare-fun b!254467 () Bool)

(assert (=> b!254467 (= e!176306 (arrayBitRangesEq!0 (buf!6541 (_2!11818 lt!394114)) (buf!6541 (_2!11818 lt!394693)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394114))) (currentByte!12005 (_2!11818 lt!394114)) (currentBit!12000 (_2!11818 lt!394114)))))))

(assert (= (and d!85502 res!213222) b!254465))

(assert (= (and b!254465 res!213224) b!254466))

(assert (= (and b!254466 (not res!213223)) b!254467))

(assert (=> b!254465 m!382091))

(assert (=> b!254465 m!382601))

(assert (=> b!254467 m!382091))

(assert (=> b!254467 m!382091))

(declare-fun m!383287 () Bool)

(assert (=> b!254467 m!383287))

(assert (=> b!254057 d!85502))

(declare-fun d!85504 () Bool)

(declare-fun e!176307 () Bool)

(assert (=> d!85504 e!176307))

(declare-fun res!213225 () Bool)

(assert (=> d!85504 (=> (not res!213225) (not e!176307))))

(assert (=> d!85504 (= res!213225 (= (buf!6541 (_2!11818 (increaseBitIndex!0 (_1!11820 lt!394119)))) (buf!6541 (_1!11820 lt!394119))))))

(declare-fun lt!395232 () Bool)

(assert (=> d!85504 (= lt!395232 (not (= (bvand ((_ sign_extend 24) (select (arr!7020 (buf!6541 (_1!11820 lt!394119))) (currentByte!12005 (_1!11820 lt!394119)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12000 (_1!11820 lt!394119))))) #b00000000000000000000000000000000)))))

(declare-fun lt!395230 () tuple2!21784)

(assert (=> d!85504 (= lt!395230 (tuple2!21785 (not (= (bvand ((_ sign_extend 24) (select (arr!7020 (buf!6541 (_1!11820 lt!394119))) (currentByte!12005 (_1!11820 lt!394119)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12000 (_1!11820 lt!394119))))) #b00000000000000000000000000000000)) (_2!11818 (increaseBitIndex!0 (_1!11820 lt!394119)))))))

(assert (=> d!85504 (validate_offset_bit!0 ((_ sign_extend 32) (size!6033 (buf!6541 (_1!11820 lt!394119)))) ((_ sign_extend 32) (currentByte!12005 (_1!11820 lt!394119))) ((_ sign_extend 32) (currentBit!12000 (_1!11820 lt!394119))))))

(assert (=> d!85504 (= (readBit!0 (_1!11820 lt!394119)) lt!395230)))

(declare-fun b!254468 () Bool)

(declare-fun lt!395228 () (_ BitVec 64))

(declare-fun lt!395231 () (_ BitVec 64))

(assert (=> b!254468 (= e!176307 (= (bitIndex!0 (size!6033 (buf!6541 (_2!11818 (increaseBitIndex!0 (_1!11820 lt!394119))))) (currentByte!12005 (_2!11818 (increaseBitIndex!0 (_1!11820 lt!394119)))) (currentBit!12000 (_2!11818 (increaseBitIndex!0 (_1!11820 lt!394119))))) (bvadd lt!395228 lt!395231)))))

(assert (=> b!254468 (or (not (= (bvand lt!395228 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!395231 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!395228 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!395228 lt!395231) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!254468 (= lt!395231 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!254468 (= lt!395228 (bitIndex!0 (size!6033 (buf!6541 (_1!11820 lt!394119))) (currentByte!12005 (_1!11820 lt!394119)) (currentBit!12000 (_1!11820 lt!394119))))))

(declare-fun lt!395226 () Bool)

(assert (=> b!254468 (= lt!395226 (not (= (bvand ((_ sign_extend 24) (select (arr!7020 (buf!6541 (_1!11820 lt!394119))) (currentByte!12005 (_1!11820 lt!394119)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12000 (_1!11820 lt!394119))))) #b00000000000000000000000000000000)))))

(declare-fun lt!395227 () Bool)

(assert (=> b!254468 (= lt!395227 (not (= (bvand ((_ sign_extend 24) (select (arr!7020 (buf!6541 (_1!11820 lt!394119))) (currentByte!12005 (_1!11820 lt!394119)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12000 (_1!11820 lt!394119))))) #b00000000000000000000000000000000)))))

(declare-fun lt!395229 () Bool)

(assert (=> b!254468 (= lt!395229 (not (= (bvand ((_ sign_extend 24) (select (arr!7020 (buf!6541 (_1!11820 lt!394119))) (currentByte!12005 (_1!11820 lt!394119)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12000 (_1!11820 lt!394119))))) #b00000000000000000000000000000000)))))

(assert (= (and d!85504 res!213225) b!254468))

(declare-fun m!383289 () Bool)

(assert (=> d!85504 m!383289))

(declare-fun m!383291 () Bool)

(assert (=> d!85504 m!383291))

(declare-fun m!383293 () Bool)

(assert (=> d!85504 m!383293))

(declare-fun m!383295 () Bool)

(assert (=> d!85504 m!383295))

(assert (=> b!254468 m!382417))

(assert (=> b!254468 m!383291))

(declare-fun m!383297 () Bool)

(assert (=> b!254468 m!383297))

(assert (=> b!254468 m!383293))

(assert (=> b!254468 m!383289))

(assert (=> d!85104 d!85504))

(assert (=> d!85178 d!85384))

(assert (=> d!85178 d!85396))

(declare-fun d!85506 () Bool)

(declare-fun e!176308 () Bool)

(assert (=> d!85506 e!176308))

(declare-fun res!213226 () Bool)

(assert (=> d!85506 (=> (not res!213226) (not e!176308))))

(declare-fun lt!395234 () (_ BitVec 64))

(declare-fun lt!395233 () BitStream!10988)

(assert (=> d!85506 (= res!213226 (= (bvadd lt!395234 (bvsub lt!394541 lt!394547)) (bitIndex!0 (size!6033 (buf!6541 lt!395233)) (currentByte!12005 lt!395233) (currentBit!12000 lt!395233))))))

(assert (=> d!85506 (or (not (= (bvand lt!395234 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394541 lt!394547) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!395234 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!395234 (bvsub lt!394541 lt!394547)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85506 (= lt!395234 (bitIndex!0 (size!6033 (buf!6541 (_2!11820 lt!394540))) (currentByte!12005 (_2!11820 lt!394540)) (currentBit!12000 (_2!11820 lt!394540))))))

(assert (=> d!85506 (= lt!395233 (_2!11818 (moveBitIndex!0 (_2!11820 lt!394540) (bvsub lt!394541 lt!394547))))))

(assert (=> d!85506 (moveBitIndexPrecond!0 (_2!11820 lt!394540) (bvsub lt!394541 lt!394547))))

(assert (=> d!85506 (= (withMovedBitIndex!0 (_2!11820 lt!394540) (bvsub lt!394541 lt!394547)) lt!395233)))

(declare-fun b!254469 () Bool)

(assert (=> b!254469 (= e!176308 (= (size!6033 (buf!6541 (_2!11820 lt!394540))) (size!6033 (buf!6541 lt!395233))))))

(assert (= (and d!85506 res!213226) b!254469))

(declare-fun m!383299 () Bool)

(assert (=> d!85506 m!383299))

(assert (=> d!85506 m!383123))

(declare-fun m!383301 () Bool)

(assert (=> d!85506 m!383301))

(declare-fun m!383303 () Bool)

(assert (=> d!85506 m!383303))

(assert (=> b!253993 d!85506))

(assert (=> b!253993 d!85190))

(assert (=> b!253993 d!85180))

(declare-fun d!85508 () Bool)

(assert (=> d!85508 (= (remainingBits!0 ((_ sign_extend 32) (size!6033 (buf!6541 thiss!1005))) ((_ sign_extend 32) (currentByte!12005 thiss!1005)) ((_ sign_extend 32) (currentBit!12000 thiss!1005))) (bvsub (bvmul ((_ sign_extend 32) (size!6033 (buf!6541 thiss!1005))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12005 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12000 thiss!1005)))))))

(assert (=> d!85180 d!85508))

(assert (=> d!85180 d!85442))

(declare-fun d!85510 () Bool)

(declare-fun e!176309 () Bool)

(assert (=> d!85510 e!176309))

(declare-fun res!213228 () Bool)

(assert (=> d!85510 (=> (not res!213228) (not e!176309))))

(declare-fun lt!395236 () (_ BitVec 64))

(declare-fun lt!395237 () (_ BitVec 64))

(declare-fun lt!395238 () (_ BitVec 64))

(assert (=> d!85510 (= res!213228 (= lt!395237 (bvsub lt!395236 lt!395238)))))

(assert (=> d!85510 (or (= (bvand lt!395236 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!395238 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!395236 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!395236 lt!395238) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85510 (= lt!395238 (remainingBits!0 ((_ sign_extend 32) (size!6033 (buf!6541 (_1!11819 lt!394559)))) ((_ sign_extend 32) (currentByte!12005 (_1!11819 lt!394559))) ((_ sign_extend 32) (currentBit!12000 (_1!11819 lt!394559)))))))

(declare-fun lt!395240 () (_ BitVec 64))

(declare-fun lt!395239 () (_ BitVec 64))

(assert (=> d!85510 (= lt!395236 (bvmul lt!395240 lt!395239))))

(assert (=> d!85510 (or (= lt!395240 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!395239 (bvsdiv (bvmul lt!395240 lt!395239) lt!395240)))))

(assert (=> d!85510 (= lt!395239 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85510 (= lt!395240 ((_ sign_extend 32) (size!6033 (buf!6541 (_1!11819 lt!394559)))))))

(assert (=> d!85510 (= lt!395237 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12005 (_1!11819 lt!394559))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12000 (_1!11819 lt!394559)))))))

(assert (=> d!85510 (invariant!0 (currentBit!12000 (_1!11819 lt!394559)) (currentByte!12005 (_1!11819 lt!394559)) (size!6033 (buf!6541 (_1!11819 lt!394559))))))

(assert (=> d!85510 (= (bitIndex!0 (size!6033 (buf!6541 (_1!11819 lt!394559))) (currentByte!12005 (_1!11819 lt!394559)) (currentBit!12000 (_1!11819 lt!394559))) lt!395237)))

(declare-fun b!254470 () Bool)

(declare-fun res!213227 () Bool)

(assert (=> b!254470 (=> (not res!213227) (not e!176309))))

(assert (=> b!254470 (= res!213227 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!395237))))

(declare-fun b!254471 () Bool)

(declare-fun lt!395235 () (_ BitVec 64))

(assert (=> b!254471 (= e!176309 (bvsle lt!395237 (bvmul lt!395235 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254471 (or (= lt!395235 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!395235 #b0000000000000000000000000000000000000000000000000000000000001000) lt!395235)))))

(assert (=> b!254471 (= lt!395235 ((_ sign_extend 32) (size!6033 (buf!6541 (_1!11819 lt!394559)))))))

(assert (= (and d!85510 res!213228) b!254470))

(assert (= (and b!254470 res!213227) b!254471))

(declare-fun m!383305 () Bool)

(assert (=> d!85510 m!383305))

(declare-fun m!383307 () Bool)

(assert (=> d!85510 m!383307))

(assert (=> b!254007 d!85510))

(assert (=> b!254007 d!85466))

(declare-fun d!85512 () Bool)

(declare-fun e!176310 () Bool)

(assert (=> d!85512 e!176310))

(declare-fun res!213229 () Bool)

(assert (=> d!85512 (=> (not res!213229) (not e!176310))))

(declare-fun lt!395242 () (_ BitVec 64))

(declare-fun lt!395241 () BitStream!10988)

(assert (=> d!85512 (= res!213229 (= (bvadd lt!395242 (bvsub lt!394620 lt!394626)) (bitIndex!0 (size!6033 (buf!6541 lt!395241)) (currentByte!12005 lt!395241) (currentBit!12000 lt!395241))))))

(assert (=> d!85512 (or (not (= (bvand lt!395242 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394620 lt!394626) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!395242 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!395242 (bvsub lt!394620 lt!394626)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85512 (= lt!395242 (bitIndex!0 (size!6033 (buf!6541 (_2!11820 lt!394619))) (currentByte!12005 (_2!11820 lt!394619)) (currentBit!12000 (_2!11820 lt!394619))))))

(assert (=> d!85512 (= lt!395241 (_2!11818 (moveBitIndex!0 (_2!11820 lt!394619) (bvsub lt!394620 lt!394626))))))

(assert (=> d!85512 (moveBitIndexPrecond!0 (_2!11820 lt!394619) (bvsub lt!394620 lt!394626))))

(assert (=> d!85512 (= (withMovedBitIndex!0 (_2!11820 lt!394619) (bvsub lt!394620 lt!394626)) lt!395241)))

(declare-fun b!254472 () Bool)

(assert (=> b!254472 (= e!176310 (= (size!6033 (buf!6541 (_2!11820 lt!394619))) (size!6033 (buf!6541 lt!395241))))))

(assert (= (and d!85512 res!213229) b!254472))

(declare-fun m!383309 () Bool)

(assert (=> d!85512 m!383309))

(assert (=> d!85512 m!383183))

(declare-fun m!383311 () Bool)

(assert (=> d!85512 m!383311))

(declare-fun m!383313 () Bool)

(assert (=> d!85512 m!383313))

(assert (=> b!254029 d!85512))

(assert (=> b!254029 d!85190))

(assert (=> b!254029 d!85178))

(declare-fun d!85514 () Bool)

(declare-fun res!213230 () Bool)

(declare-fun e!176311 () Bool)

(assert (=> d!85514 (=> (not res!213230) (not e!176311))))

(assert (=> d!85514 (= res!213230 (= (size!6033 (buf!6541 (_1!11820 lt!394540))) (size!6033 (buf!6541 thiss!1005))))))

(assert (=> d!85514 (= (isPrefixOf!0 (_1!11820 lt!394540) thiss!1005) e!176311)))

(declare-fun b!254473 () Bool)

(declare-fun res!213232 () Bool)

(assert (=> b!254473 (=> (not res!213232) (not e!176311))))

(assert (=> b!254473 (= res!213232 (bvsle (bitIndex!0 (size!6033 (buf!6541 (_1!11820 lt!394540))) (currentByte!12005 (_1!11820 lt!394540)) (currentBit!12000 (_1!11820 lt!394540))) (bitIndex!0 (size!6033 (buf!6541 thiss!1005)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005))))))

(declare-fun b!254474 () Bool)

(declare-fun e!176312 () Bool)

(assert (=> b!254474 (= e!176311 e!176312)))

(declare-fun res!213231 () Bool)

(assert (=> b!254474 (=> res!213231 e!176312)))

(assert (=> b!254474 (= res!213231 (= (size!6033 (buf!6541 (_1!11820 lt!394540))) #b00000000000000000000000000000000))))

(declare-fun b!254475 () Bool)

(assert (=> b!254475 (= e!176312 (arrayBitRangesEq!0 (buf!6541 (_1!11820 lt!394540)) (buf!6541 thiss!1005) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6033 (buf!6541 (_1!11820 lt!394540))) (currentByte!12005 (_1!11820 lt!394540)) (currentBit!12000 (_1!11820 lt!394540)))))))

(assert (= (and d!85514 res!213230) b!254473))

(assert (= (and b!254473 res!213232) b!254474))

(assert (= (and b!254474 (not res!213231)) b!254475))

(assert (=> b!254473 m!383131))

(assert (=> b!254473 m!382093))

(assert (=> b!254475 m!383131))

(assert (=> b!254475 m!383131))

(declare-fun m!383315 () Bool)

(assert (=> b!254475 m!383315))

(assert (=> b!253991 d!85514))

(declare-fun d!85516 () Bool)

(declare-fun res!213233 () Bool)

(declare-fun e!176313 () Bool)

(assert (=> d!85516 (=> (not res!213233) (not e!176313))))

(assert (=> d!85516 (= res!213233 (= (size!6033 (buf!6541 thiss!1005)) (size!6033 (buf!6541 (_2!11818 lt!394560)))))))

(assert (=> d!85516 (= (isPrefixOf!0 thiss!1005 (_2!11818 lt!394560)) e!176313)))

(declare-fun b!254476 () Bool)

(declare-fun res!213235 () Bool)

(assert (=> b!254476 (=> (not res!213235) (not e!176313))))

(assert (=> b!254476 (= res!213235 (bvsle (bitIndex!0 (size!6033 (buf!6541 thiss!1005)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005)) (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394560))) (currentByte!12005 (_2!11818 lt!394560)) (currentBit!12000 (_2!11818 lt!394560)))))))

(declare-fun b!254477 () Bool)

(declare-fun e!176314 () Bool)

(assert (=> b!254477 (= e!176313 e!176314)))

(declare-fun res!213234 () Bool)

(assert (=> b!254477 (=> res!213234 e!176314)))

(assert (=> b!254477 (= res!213234 (= (size!6033 (buf!6541 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!254478 () Bool)

(assert (=> b!254478 (= e!176314 (arrayBitRangesEq!0 (buf!6541 thiss!1005) (buf!6541 (_2!11818 lt!394560)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6033 (buf!6541 thiss!1005)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005))))))

(assert (= (and d!85516 res!213233) b!254476))

(assert (= (and b!254476 res!213235) b!254477))

(assert (= (and b!254477 (not res!213234)) b!254478))

(assert (=> b!254476 m!382093))

(assert (=> b!254476 m!382483))

(assert (=> b!254478 m!382093))

(assert (=> b!254478 m!382093))

(declare-fun m!383317 () Bool)

(assert (=> b!254478 m!383317))

(assert (=> b!254005 d!85516))

(declare-fun d!85518 () Bool)

(declare-fun res!213236 () Bool)

(declare-fun e!176315 () Bool)

(assert (=> d!85518 (=> (not res!213236) (not e!176315))))

(assert (=> d!85518 (= res!213236 (= (size!6033 (buf!6541 (_1!11820 lt!394619))) (size!6033 (buf!6541 (_2!11818 lt!394114)))))))

(assert (=> d!85518 (= (isPrefixOf!0 (_1!11820 lt!394619) (_2!11818 lt!394114)) e!176315)))

(declare-fun b!254479 () Bool)

(declare-fun res!213238 () Bool)

(assert (=> b!254479 (=> (not res!213238) (not e!176315))))

(assert (=> b!254479 (= res!213238 (bvsle (bitIndex!0 (size!6033 (buf!6541 (_1!11820 lt!394619))) (currentByte!12005 (_1!11820 lt!394619)) (currentBit!12000 (_1!11820 lt!394619))) (bitIndex!0 (size!6033 (buf!6541 (_2!11818 lt!394114))) (currentByte!12005 (_2!11818 lt!394114)) (currentBit!12000 (_2!11818 lt!394114)))))))

(declare-fun b!254480 () Bool)

(declare-fun e!176316 () Bool)

(assert (=> b!254480 (= e!176315 e!176316)))

(declare-fun res!213237 () Bool)

(assert (=> b!254480 (=> res!213237 e!176316)))

(assert (=> b!254480 (= res!213237 (= (size!6033 (buf!6541 (_1!11820 lt!394619))) #b00000000000000000000000000000000))))

(declare-fun b!254481 () Bool)

(assert (=> b!254481 (= e!176316 (arrayBitRangesEq!0 (buf!6541 (_1!11820 lt!394619)) (buf!6541 (_2!11818 lt!394114)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6033 (buf!6541 (_1!11820 lt!394619))) (currentByte!12005 (_1!11820 lt!394619)) (currentBit!12000 (_1!11820 lt!394619)))))))

(assert (= (and d!85518 res!213236) b!254479))

(assert (= (and b!254479 res!213238) b!254480))

(assert (= (and b!254480 (not res!213237)) b!254481))

(assert (=> b!254479 m!383279))

(assert (=> b!254479 m!382091))

(assert (=> b!254481 m!383279))

(assert (=> b!254481 m!383279))

(declare-fun m!383319 () Bool)

(assert (=> b!254481 m!383319))

(assert (=> b!254027 d!85518))

(declare-fun b!254493 () Bool)

(declare-fun e!176326 () Bool)

(declare-fun lt!395245 () tuple2!21776)

(declare-fun _$19!201 () tuple2!21774)

(assert (=> b!254493 (= e!176326 (= (bitIndex!0 (size!6033 (buf!6541 (_1!11819 lt!395245))) (currentByte!12005 (_1!11819 lt!395245)) (currentBit!12000 (_1!11819 lt!395245))) (bitIndex!0 (size!6033 (buf!6541 (_2!11818 _$19!201))) (currentByte!12005 (_2!11818 _$19!201)) (currentBit!12000 (_2!11818 _$19!201)))))))

(declare-fun b!254494 () Bool)

(declare-fun e!176327 () Bool)

(assert (=> b!254494 (= e!176327 (array_inv!5774 (buf!6541 (_2!11818 _$19!201))))))

(declare-fun b!254495 () Bool)

(declare-fun res!213247 () Bool)

(declare-fun e!176325 () Bool)

(assert (=> b!254495 (=> (not res!213247) (not e!176325))))

(assert (=> b!254495 (= res!213247 (= (bitIndex!0 (size!6033 (buf!6541 (_2!11818 _$19!201))) (currentByte!12005 (_2!11818 _$19!201)) (currentBit!12000 (_2!11818 _$19!201))) (bvadd (bitIndex!0 (size!6033 (buf!6541 thiss!1005)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!254496 () Bool)

(assert (=> b!254496 (= e!176325 e!176326)))

(declare-fun res!213249 () Bool)

(assert (=> b!254496 (=> (not res!213249) (not e!176326))))

(assert (=> b!254496 (= res!213249 (and (= (_2!11819 lt!395245) bit!26) (= (_1!11819 lt!395245) (_2!11818 _$19!201))))))

(assert (=> b!254496 (= lt!395245 (readBitPure!0 (readerFrom!0 (_2!11818 _$19!201) (currentBit!12000 thiss!1005) (currentByte!12005 thiss!1005))))))

(declare-fun d!85520 () Bool)

(assert (=> d!85520 e!176325))

(declare-fun res!213248 () Bool)

(assert (=> d!85520 (=> (not res!213248) (not e!176325))))

(assert (=> d!85520 (= res!213248 (= (size!6033 (buf!6541 thiss!1005)) (size!6033 (buf!6541 (_2!11818 _$19!201)))))))

(assert (=> d!85520 (and (inv!12 (_2!11818 _$19!201)) e!176327)))

(assert (=> d!85520 (= (choose!16 thiss!1005 bit!26) _$19!201)))

(declare-fun b!254497 () Bool)

(declare-fun res!213250 () Bool)

(assert (=> b!254497 (=> (not res!213250) (not e!176325))))

(assert (=> b!254497 (= res!213250 (isPrefixOf!0 thiss!1005 (_2!11818 _$19!201)))))

(assert (= d!85520 b!254494))

(assert (= (and d!85520 res!213248) b!254495))

(assert (= (and b!254495 res!213247) b!254497))

(assert (= (and b!254497 res!213250) b!254496))

(assert (= (and b!254496 res!213249) b!254493))

(declare-fun m!383321 () Bool)

(assert (=> b!254497 m!383321))

(declare-fun m!383323 () Bool)

(assert (=> b!254495 m!383323))

(assert (=> b!254495 m!382093))

(declare-fun m!383325 () Bool)

(assert (=> d!85520 m!383325))

(declare-fun m!383327 () Bool)

(assert (=> b!254496 m!383327))

(assert (=> b!254496 m!383327))

(declare-fun m!383329 () Bool)

(assert (=> b!254496 m!383329))

(declare-fun m!383331 () Bool)

(assert (=> b!254494 m!383331))

(declare-fun m!383333 () Bool)

(assert (=> b!254493 m!383333))

(assert (=> b!254493 m!383323))

(assert (=> d!85100 d!85520))

(declare-fun d!85522 () Bool)

(assert (=> d!85522 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6033 (buf!6541 thiss!1005))) ((_ sign_extend 32) (currentByte!12005 thiss!1005)) ((_ sign_extend 32) (currentBit!12000 thiss!1005))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6033 (buf!6541 thiss!1005))) ((_ sign_extend 32) (currentByte!12005 thiss!1005)) ((_ sign_extend 32) (currentBit!12000 thiss!1005))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!21585 () Bool)

(assert (= bs!21585 d!85522))

(assert (=> bs!21585 m!382631))

(assert (=> d!85100 d!85522))

(assert (=> d!85182 d!85508))

(assert (=> d!85086 d!85150))

(declare-fun d!85524 () Bool)

(assert (=> d!85524 (validate_offset_bits!1 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394112)))) ((_ sign_extend 32) (currentByte!12005 thiss!1005)) ((_ sign_extend 32) (currentBit!12000 thiss!1005)) (bvsub nBits!297 from!289))))

(assert (=> d!85524 true))

(declare-fun _$6!439 () Unit!18241)

(assert (=> d!85524 (= (choose!9 thiss!1005 (buf!6541 (_2!11818 lt!394112)) (bvsub nBits!297 from!289) (BitStream!10989 (buf!6541 (_2!11818 lt!394112)) (currentByte!12005 thiss!1005) (currentBit!12000 thiss!1005))) _$6!439)))

(declare-fun bs!21586 () Bool)

(assert (= bs!21586 d!85524))

(assert (=> bs!21586 m!382125))

(assert (=> d!85086 d!85524))

(assert (=> d!85166 d!85156))

(declare-fun d!85526 () Bool)

(assert (=> d!85526 (isPrefixOf!0 thiss!1005 (_2!11818 lt!394112))))

(assert (=> d!85526 true))

(declare-fun _$15!336 () Unit!18241)

(assert (=> d!85526 (= (choose!30 thiss!1005 (_2!11818 lt!394114) (_2!11818 lt!394112)) _$15!336)))

(declare-fun bs!21587 () Bool)

(assert (= bs!21587 d!85526))

(assert (=> bs!21587 m!382137))

(assert (=> d!85166 d!85526))

(assert (=> d!85166 d!85194))

(declare-fun d!85528 () Bool)

(assert (=> d!85528 (validate_offset_bits!1 ((_ sign_extend 32) (size!6033 (buf!6541 (_2!11818 lt!394114)))) ((_ sign_extend 32) (currentByte!12005 (_2!11818 lt!394114))) ((_ sign_extend 32) (currentBit!12000 (_2!11818 lt!394114))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!85528 true))

(declare-fun _$1!339 () Unit!18241)

(assert (=> d!85528 (= (choose!27 thiss!1005 (_2!11818 lt!394114) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) _$1!339)))

(declare-fun bs!21588 () Bool)

(assert (= bs!21588 d!85528))

(assert (=> bs!21588 m!382615))

(assert (=> d!85158 d!85528))

(push 1)

(assert (not b!254294))

(assert (not b!254415))

(assert (not b!254372))

(assert (not b!254456))

(assert (not d!85370))

(assert (not b!254333))

(assert (not d!85448))

(assert (not bm!3997))

(assert (not b!254421))

(assert (not b!254495))

(assert (not d!85500))

(assert (not d!85484))

(assert (not b!254383))

(assert (not d!85478))

(assert (not d!85526))

(assert (not b!254459))

(assert (not b!254396))

(assert (not b!254384))

(assert (not d!85366))

(assert (not d!85372))

(assert (not b!254331))

(assert (not d!85422))

(assert (not b!254292))

(assert (not d!85408))

(assert (not d!85504))

(assert (not d!85440))

(assert (not d!85506))

(assert (not b!254496))

(assert (not b!254479))

(assert (not b!254405))

(assert (not b!254332))

(assert (not b!254493))

(assert (not b!254450))

(assert (not d!85428))

(assert (not d!85444))

(assert (not b!254430))

(assert (not d!85528))

(assert (not b!254397))

(assert (not d!85378))

(assert (not d!85456))

(assert (not d!85390))

(assert (not b!254468))

(assert (not b!254394))

(assert (not d!85452))

(assert (not d!85490))

(assert (not b!254316))

(assert (not b!254425))

(assert (not d!85368))

(assert (not b!254478))

(assert (not b!254377))

(assert (not b!254385))

(assert (not b!254497))

(assert (not bm!3995))

(assert (not b!254433))

(assert (not d!85454))

(assert (not b!254440))

(assert (not bm!3998))

(assert (not b!254451))

(assert (not b!254475))

(assert (not b!254422))

(assert (not b!254467))

(assert (not b!254427))

(assert (not b!254291))

(assert (not d!85402))

(assert (not b!254360))

(assert (not b!254412))

(assert (not b!254315))

(assert (not b!254494))

(assert (not b!254449))

(assert (not b!254408))

(assert (not b!254458))

(assert (not d!85476))

(assert (not d!85524))

(assert (not b!254464))

(assert (not b!254436))

(assert (not d!85474))

(assert (not b!254400))

(assert (not d!85472))

(assert (not d!85398))

(assert (not b!254418))

(assert (not b!254455))

(assert (not d!85380))

(assert (not b!254362))

(assert (not d!85430))

(assert (not b!254443))

(assert (not d!85468))

(assert (not b!254462))

(assert (not bm!3996))

(assert (not b!254293))

(assert (not d!85466))

(assert (not b!254406))

(assert (not d!85512))

(assert (not b!254402))

(assert (not bm!3994))

(assert (not b!254424))

(assert (not b!254465))

(assert (not b!254334))

(assert (not b!254322))

(assert (not b!254461))

(assert (not b!254411))

(assert (not b!254481))

(assert (not d!85418))

(assert (not d!85412))

(assert (not b!254356))

(assert (not d!85400))

(assert (not b!254445))

(assert (not b!254473))

(assert (not b!254437))

(assert (not d!85522))

(assert (not b!254379))

(assert (not b!254453))

(assert (not d!85510))

(assert (not b!254361))

(assert (not d!85410))

(assert (not b!254476))

(assert (not d!85432))

(assert (not b!254312))

(assert (not d!85494))

(assert (not d!85414))

(assert (not b!254309))

(assert (not b!254409))

(assert (not b!254319))

(assert (not d!85482))

(assert (not b!254426))

(assert (not b!254403))

(assert (not d!85520))

(assert (not b!254399))

(assert (not d!85462))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

