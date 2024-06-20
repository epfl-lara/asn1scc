; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52376 () Bool)

(assert start!52376)

(declare-fun b!241137 () Bool)

(declare-fun res!201309 () Bool)

(declare-fun e!167084 () Bool)

(assert (=> b!241137 (=> (not res!201309) (not e!167084))))

(declare-datatypes ((array!13205 0))(
  ( (array!13206 (arr!6771 (Array (_ BitVec 32) (_ BitVec 8))) (size!5784 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10490 0))(
  ( (BitStream!10491 (buf!6250 array!13205) (currentByte!11610 (_ BitVec 32)) (currentBit!11605 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10490)

(declare-fun nBits!288 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241137 (= res!201309 (validate_offset_bits!1 ((_ sign_extend 32) (size!5784 (buf!6250 thiss!982))) ((_ sign_extend 32) (currentByte!11610 thiss!982)) ((_ sign_extend 32) (currentBit!11605 thiss!982)) nBits!288))))

(declare-fun b!241139 () Bool)

(declare-fun e!167086 () Bool)

(declare-datatypes ((tuple2!20550 0))(
  ( (tuple2!20551 (_1!11197 BitStream!10490) (_2!11197 Bool)) )
))
(declare-fun lt!376774 () tuple2!20550)

(declare-datatypes ((tuple2!20552 0))(
  ( (tuple2!20553 (_1!11198 BitStream!10490) (_2!11198 BitStream!10490)) )
))
(declare-fun lt!376773 () tuple2!20552)

(assert (=> b!241139 (= e!167086 (not (or (not (_2!11197 lt!376774)) (not (= (_1!11197 lt!376774) (_2!11198 lt!376773))))))))

(declare-fun bit!21 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10490 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20550)

(assert (=> b!241139 (= lt!376774 (checkBitsLoopPure!0 (_1!11198 lt!376773) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!17669 0))(
  ( (Unit!17670) )
))
(declare-datatypes ((tuple2!20554 0))(
  ( (tuple2!20555 (_1!11199 Unit!17669) (_2!11199 BitStream!10490)) )
))
(declare-fun lt!376779 () tuple2!20554)

(assert (=> b!241139 (validate_offset_bits!1 ((_ sign_extend 32) (size!5784 (buf!6250 (_2!11199 lt!376779)))) ((_ sign_extend 32) (currentByte!11610 thiss!982)) ((_ sign_extend 32) (currentBit!11605 thiss!982)) nBits!288)))

(declare-fun lt!376781 () Unit!17669)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10490 array!13205 (_ BitVec 64)) Unit!17669)

(assert (=> b!241139 (= lt!376781 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6250 (_2!11199 lt!376779)) nBits!288))))

(declare-fun reader!0 (BitStream!10490 BitStream!10490) tuple2!20552)

(assert (=> b!241139 (= lt!376773 (reader!0 thiss!982 (_2!11199 lt!376779)))))

(declare-fun b!241140 () Bool)

(declare-fun res!201305 () Bool)

(assert (=> b!241140 (=> (not res!201305) (not e!167086))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!241140 (= res!201305 (= (bitIndex!0 (size!5784 (buf!6250 (_2!11199 lt!376779))) (currentByte!11610 (_2!11199 lt!376779)) (currentBit!11605 (_2!11199 lt!376779))) (bvadd (bitIndex!0 (size!5784 (buf!6250 thiss!982)) (currentByte!11610 thiss!982) (currentBit!11605 thiss!982)) nBits!288)))))

(declare-fun b!241141 () Bool)

(declare-fun lt!376776 () tuple2!20550)

(declare-fun lt!376780 () tuple2!20552)

(assert (=> b!241141 (= e!167084 (not (and (_2!11197 lt!376776) (= (_1!11197 lt!376776) (_2!11198 lt!376780)))))))

(assert (=> b!241141 (= lt!376776 (checkBitsLoopPure!0 (_1!11198 lt!376780) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!241141 (validate_offset_bits!1 ((_ sign_extend 32) (size!5784 (buf!6250 (_2!11199 lt!376779)))) ((_ sign_extend 32) (currentByte!11610 thiss!982)) ((_ sign_extend 32) (currentBit!11605 thiss!982)) nBits!288)))

(declare-fun lt!376777 () Unit!17669)

(assert (=> b!241141 (= lt!376777 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6250 (_2!11199 lt!376779)) nBits!288))))

(assert (=> b!241141 (= lt!376780 (reader!0 thiss!982 (_2!11199 lt!376779)))))

(declare-fun lt!376775 () Bool)

(declare-fun isPrefixOf!0 (BitStream!10490 BitStream!10490) Bool)

(assert (=> b!241141 (= lt!376775 (isPrefixOf!0 thiss!982 (_2!11199 lt!376779)))))

(declare-fun lt!376782 () (_ BitVec 64))

(assert (=> b!241141 (= lt!376782 (bitIndex!0 (size!5784 (buf!6250 (_2!11199 lt!376779))) (currentByte!11610 (_2!11199 lt!376779)) (currentBit!11605 (_2!11199 lt!376779))))))

(declare-fun lt!376778 () (_ BitVec 64))

(assert (=> b!241141 (= lt!376778 (bitIndex!0 (size!5784 (buf!6250 thiss!982)) (currentByte!11610 thiss!982) (currentBit!11605 thiss!982)))))

(assert (=> b!241141 e!167086))

(declare-fun res!201306 () Bool)

(assert (=> b!241141 (=> (not res!201306) (not e!167086))))

(assert (=> b!241141 (= res!201306 (= (size!5784 (buf!6250 thiss!982)) (size!5784 (buf!6250 (_2!11199 lt!376779)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10490 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20554)

(assert (=> b!241141 (= lt!376779 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!241142 () Bool)

(declare-fun res!201307 () Bool)

(assert (=> b!241142 (=> (not res!201307) (not e!167086))))

(assert (=> b!241142 (= res!201307 (isPrefixOf!0 thiss!982 (_2!11199 lt!376779)))))

(declare-fun b!241138 () Bool)

(declare-fun e!167085 () Bool)

(declare-fun array_inv!5525 (array!13205) Bool)

(assert (=> b!241138 (= e!167085 (array_inv!5525 (buf!6250 thiss!982)))))

(declare-fun res!201308 () Bool)

(assert (=> start!52376 (=> (not res!201308) (not e!167084))))

(assert (=> start!52376 (= res!201308 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52376 e!167084))

(assert (=> start!52376 true))

(declare-fun inv!12 (BitStream!10490) Bool)

(assert (=> start!52376 (and (inv!12 thiss!982) e!167085)))

(assert (= (and start!52376 res!201308) b!241137))

(assert (= (and b!241137 res!201309) b!241141))

(assert (= (and b!241141 res!201306) b!241140))

(assert (= (and b!241140 res!201305) b!241142))

(assert (= (and b!241142 res!201307) b!241139))

(assert (= start!52376 b!241138))

(declare-fun m!363837 () Bool)

(assert (=> b!241141 m!363837))

(declare-fun m!363839 () Bool)

(assert (=> b!241141 m!363839))

(declare-fun m!363841 () Bool)

(assert (=> b!241141 m!363841))

(declare-fun m!363843 () Bool)

(assert (=> b!241141 m!363843))

(declare-fun m!363845 () Bool)

(assert (=> b!241141 m!363845))

(declare-fun m!363847 () Bool)

(assert (=> b!241141 m!363847))

(declare-fun m!363849 () Bool)

(assert (=> b!241141 m!363849))

(declare-fun m!363851 () Bool)

(assert (=> b!241141 m!363851))

(declare-fun m!363853 () Bool)

(assert (=> start!52376 m!363853))

(declare-fun m!363855 () Bool)

(assert (=> b!241137 m!363855))

(declare-fun m!363857 () Bool)

(assert (=> b!241138 m!363857))

(declare-fun m!363859 () Bool)

(assert (=> b!241139 m!363859))

(assert (=> b!241139 m!363837))

(assert (=> b!241139 m!363851))

(assert (=> b!241139 m!363839))

(assert (=> b!241140 m!363841))

(assert (=> b!241140 m!363845))

(assert (=> b!241142 m!363849))

(push 1)

(assert (not b!241139))

(assert (not b!241138))

(assert (not start!52376))

(assert (not b!241142))

(assert (not b!241140))

(assert (not b!241137))

(assert (not b!241141))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

