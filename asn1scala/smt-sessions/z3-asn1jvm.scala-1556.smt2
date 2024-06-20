; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43634 () Bool)

(assert start!43634)

(declare-fun b!207155 () Bool)

(declare-fun res!173777 () Bool)

(declare-fun e!141612 () Bool)

(assert (=> b!207155 (=> res!173777 e!141612)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!323413 () (_ BitVec 64))

(declare-datatypes ((array!10417 0))(
  ( (array!10418 (arr!5510 (Array (_ BitVec 32) (_ BitVec 8))) (size!4580 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8268 0))(
  ( (BitStream!8269 (buf!5085 array!10417) (currentByte!9603 (_ BitVec 32)) (currentBit!9598 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!14754 0))(
  ( (Unit!14755) )
))
(declare-datatypes ((tuple2!17746 0))(
  ( (tuple2!17747 (_1!9528 Unit!14754) (_2!9528 BitStream!8268)) )
))
(declare-fun lt!323421 () tuple2!17746)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!323418 () (_ BitVec 64))

(declare-fun thiss!1204 () BitStream!8268)

(assert (=> b!207155 (= res!173777 (or (not (= (size!4580 (buf!5085 (_2!9528 lt!323421))) (size!4580 (buf!5085 thiss!1204)))) (not (= lt!323418 (bvsub (bvadd lt!323413 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun res!173783 () Bool)

(declare-fun e!141617 () Bool)

(assert (=> start!43634 (=> (not res!173783) (not e!141617))))

(assert (=> start!43634 (= res!173783 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43634 e!141617))

(assert (=> start!43634 true))

(declare-fun e!141614 () Bool)

(declare-fun inv!12 (BitStream!8268) Bool)

(assert (=> start!43634 (and (inv!12 thiss!1204) e!141614)))

(declare-fun b!207156 () Bool)

(declare-fun e!141618 () Bool)

(declare-fun e!141615 () Bool)

(assert (=> b!207156 (= e!141618 (not e!141615))))

(declare-fun res!173776 () Bool)

(assert (=> b!207156 (=> res!173776 e!141615)))

(declare-fun lt!323410 () (_ BitVec 64))

(assert (=> b!207156 (= res!173776 (not (= lt!323410 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!323413))))))

(declare-fun lt!323423 () tuple2!17746)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!207156 (= lt!323410 (bitIndex!0 (size!4580 (buf!5085 (_2!9528 lt!323423))) (currentByte!9603 (_2!9528 lt!323423)) (currentBit!9598 (_2!9528 lt!323423))))))

(assert (=> b!207156 (= lt!323413 (bitIndex!0 (size!4580 (buf!5085 thiss!1204)) (currentByte!9603 thiss!1204) (currentBit!9598 thiss!1204)))))

(declare-fun e!141610 () Bool)

(assert (=> b!207156 e!141610))

(declare-fun res!173774 () Bool)

(assert (=> b!207156 (=> (not res!173774) (not e!141610))))

(assert (=> b!207156 (= res!173774 (= (size!4580 (buf!5085 thiss!1204)) (size!4580 (buf!5085 (_2!9528 lt!323423)))))))

(declare-fun lt!323409 () Bool)

(declare-fun appendBit!0 (BitStream!8268 Bool) tuple2!17746)

(assert (=> b!207156 (= lt!323423 (appendBit!0 thiss!1204 lt!323409))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!207156 (= lt!323409 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!207157 () Bool)

(assert (=> b!207157 (= e!141615 e!141612)))

(declare-fun res!173781 () Bool)

(assert (=> b!207157 (=> res!173781 e!141612)))

(assert (=> b!207157 (= res!173781 (not (= lt!323418 (bvsub (bvsub (bvadd lt!323410 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!207157 (= lt!323418 (bitIndex!0 (size!4580 (buf!5085 (_2!9528 lt!323421))) (currentByte!9603 (_2!9528 lt!323421)) (currentBit!9598 (_2!9528 lt!323421))))))

(declare-fun isPrefixOf!0 (BitStream!8268 BitStream!8268) Bool)

(assert (=> b!207157 (isPrefixOf!0 thiss!1204 (_2!9528 lt!323421))))

(declare-fun lt!323422 () Unit!14754)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8268 BitStream!8268 BitStream!8268) Unit!14754)

(assert (=> b!207157 (= lt!323422 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9528 lt!323423) (_2!9528 lt!323421)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8268 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17746)

(assert (=> b!207157 (= lt!323421 (appendBitsLSBFirstLoopTR!0 (_2!9528 lt!323423) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!207158 () Bool)

(declare-fun res!173772 () Bool)

(assert (=> b!207158 (=> (not res!173772) (not e!141618))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!207158 (= res!173772 (invariant!0 (currentBit!9598 thiss!1204) (currentByte!9603 thiss!1204) (size!4580 (buf!5085 thiss!1204))))))

(declare-fun b!207159 () Bool)

(declare-fun e!141616 () Bool)

(assert (=> b!207159 (= e!141616 (invariant!0 (currentBit!9598 thiss!1204) (currentByte!9603 thiss!1204) (size!4580 (buf!5085 (_2!9528 lt!323421)))))))

(declare-fun b!207160 () Bool)

(declare-fun e!141613 () Bool)

(declare-datatypes ((tuple2!17748 0))(
  ( (tuple2!17749 (_1!9529 BitStream!8268) (_2!9529 Bool)) )
))
(declare-fun lt!323411 () tuple2!17748)

(declare-fun lt!323426 () (_ BitVec 64))

(assert (=> b!207160 (= e!141613 (= (bitIndex!0 (size!4580 (buf!5085 (_1!9529 lt!323411))) (currentByte!9603 (_1!9529 lt!323411)) (currentBit!9598 (_1!9529 lt!323411))) lt!323426))))

(declare-fun b!207161 () Bool)

(declare-fun res!173786 () Bool)

(assert (=> b!207161 (=> res!173786 e!141612)))

(assert (=> b!207161 (= res!173786 (not (invariant!0 (currentBit!9598 (_2!9528 lt!323421)) (currentByte!9603 (_2!9528 lt!323421)) (size!4580 (buf!5085 (_2!9528 lt!323421))))))))

(declare-fun b!207162 () Bool)

(declare-fun res!173780 () Bool)

(assert (=> b!207162 (=> res!173780 e!141612)))

(assert (=> b!207162 (= res!173780 (not (isPrefixOf!0 (_2!9528 lt!323423) (_2!9528 lt!323421))))))

(declare-fun b!207163 () Bool)

(assert (=> b!207163 (= e!141617 e!141618)))

(declare-fun res!173779 () Bool)

(assert (=> b!207163 (=> (not res!173779) (not e!141618))))

(declare-fun lt!323419 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!207163 (= res!173779 (validate_offset_bits!1 ((_ sign_extend 32) (size!4580 (buf!5085 thiss!1204))) ((_ sign_extend 32) (currentByte!9603 thiss!1204)) ((_ sign_extend 32) (currentBit!9598 thiss!1204)) lt!323419))))

(assert (=> b!207163 (= lt!323419 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!207164 () Bool)

(declare-fun e!141609 () Bool)

(declare-fun lt!323408 () tuple2!17748)

(declare-fun lt!323416 () tuple2!17748)

(assert (=> b!207164 (= e!141609 (= (_2!9529 lt!323408) (_2!9529 lt!323416)))))

(declare-fun b!207165 () Bool)

(declare-fun e!141608 () Bool)

(assert (=> b!207165 (= e!141610 e!141608)))

(declare-fun res!173778 () Bool)

(assert (=> b!207165 (=> (not res!173778) (not e!141608))))

(declare-fun lt!323412 () (_ BitVec 64))

(assert (=> b!207165 (= res!173778 (= lt!323426 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!323412)))))

(assert (=> b!207165 (= lt!323426 (bitIndex!0 (size!4580 (buf!5085 (_2!9528 lt!323423))) (currentByte!9603 (_2!9528 lt!323423)) (currentBit!9598 (_2!9528 lt!323423))))))

(assert (=> b!207165 (= lt!323412 (bitIndex!0 (size!4580 (buf!5085 thiss!1204)) (currentByte!9603 thiss!1204) (currentBit!9598 thiss!1204)))))

(declare-fun b!207166 () Bool)

(declare-fun res!173773 () Bool)

(assert (=> b!207166 (=> (not res!173773) (not e!141608))))

(assert (=> b!207166 (= res!173773 (isPrefixOf!0 thiss!1204 (_2!9528 lt!323423)))))

(declare-fun b!207167 () Bool)

(assert (=> b!207167 (= e!141608 e!141613)))

(declare-fun res!173784 () Bool)

(assert (=> b!207167 (=> (not res!173784) (not e!141613))))

(assert (=> b!207167 (= res!173784 (and (= (_2!9529 lt!323411) lt!323409) (= (_1!9529 lt!323411) (_2!9528 lt!323423))))))

(declare-fun readBitPure!0 (BitStream!8268) tuple2!17748)

(declare-fun readerFrom!0 (BitStream!8268 (_ BitVec 32) (_ BitVec 32)) BitStream!8268)

(assert (=> b!207167 (= lt!323411 (readBitPure!0 (readerFrom!0 (_2!9528 lt!323423) (currentBit!9598 thiss!1204) (currentByte!9603 thiss!1204))))))

(declare-fun b!207168 () Bool)

(declare-fun res!173782 () Bool)

(assert (=> b!207168 (=> res!173782 e!141612)))

(assert (=> b!207168 (= res!173782 (not (isPrefixOf!0 thiss!1204 (_2!9528 lt!323423))))))

(declare-fun b!207169 () Bool)

(assert (=> b!207169 (= e!141612 (= (size!4580 (buf!5085 (_2!9528 lt!323423))) (size!4580 (buf!5085 (_2!9528 lt!323421)))))))

(declare-datatypes ((tuple2!17750 0))(
  ( (tuple2!17751 (_1!9530 BitStream!8268) (_2!9530 (_ BitVec 64))) )
))
(declare-fun lt!323420 () tuple2!17750)

(declare-datatypes ((tuple2!17752 0))(
  ( (tuple2!17753 (_1!9531 BitStream!8268) (_2!9531 BitStream!8268)) )
))
(declare-fun lt!323417 () tuple2!17752)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8268 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17750)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!207169 (= lt!323420 (readNBitsLSBFirstsLoopPure!0 (_1!9531 lt!323417) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(assert (=> b!207169 (validate_offset_bits!1 ((_ sign_extend 32) (size!4580 (buf!5085 (_2!9528 lt!323421)))) ((_ sign_extend 32) (currentByte!9603 thiss!1204)) ((_ sign_extend 32) (currentBit!9598 thiss!1204)) lt!323419)))

(declare-fun lt!323415 () Unit!14754)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8268 array!10417 (_ BitVec 64)) Unit!14754)

(assert (=> b!207169 (= lt!323415 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5085 (_2!9528 lt!323421)) lt!323419))))

(assert (=> b!207169 (= (_2!9529 (readBitPure!0 (_1!9531 lt!323417))) lt!323409)))

(declare-fun lt!323414 () tuple2!17752)

(declare-fun reader!0 (BitStream!8268 BitStream!8268) tuple2!17752)

(assert (=> b!207169 (= lt!323414 (reader!0 (_2!9528 lt!323423) (_2!9528 lt!323421)))))

(assert (=> b!207169 (= lt!323417 (reader!0 thiss!1204 (_2!9528 lt!323421)))))

(assert (=> b!207169 e!141609))

(declare-fun res!173785 () Bool)

(assert (=> b!207169 (=> (not res!173785) (not e!141609))))

(assert (=> b!207169 (= res!173785 (= (bitIndex!0 (size!4580 (buf!5085 (_1!9529 lt!323408))) (currentByte!9603 (_1!9529 lt!323408)) (currentBit!9598 (_1!9529 lt!323408))) (bitIndex!0 (size!4580 (buf!5085 (_1!9529 lt!323416))) (currentByte!9603 (_1!9529 lt!323416)) (currentBit!9598 (_1!9529 lt!323416)))))))

(declare-fun lt!323425 () Unit!14754)

(declare-fun lt!323424 () BitStream!8268)

(declare-fun readBitPrefixLemma!0 (BitStream!8268 BitStream!8268) Unit!14754)

(assert (=> b!207169 (= lt!323425 (readBitPrefixLemma!0 lt!323424 (_2!9528 lt!323421)))))

(assert (=> b!207169 (= lt!323416 (readBitPure!0 (BitStream!8269 (buf!5085 (_2!9528 lt!323421)) (currentByte!9603 thiss!1204) (currentBit!9598 thiss!1204))))))

(assert (=> b!207169 (= lt!323408 (readBitPure!0 lt!323424))))

(assert (=> b!207169 e!141616))

(declare-fun res!173775 () Bool)

(assert (=> b!207169 (=> (not res!173775) (not e!141616))))

(assert (=> b!207169 (= res!173775 (invariant!0 (currentBit!9598 thiss!1204) (currentByte!9603 thiss!1204) (size!4580 (buf!5085 (_2!9528 lt!323423)))))))

(assert (=> b!207169 (= lt!323424 (BitStream!8269 (buf!5085 (_2!9528 lt!323423)) (currentByte!9603 thiss!1204) (currentBit!9598 thiss!1204)))))

(declare-fun b!207170 () Bool)

(declare-fun res!173771 () Bool)

(assert (=> b!207170 (=> (not res!173771) (not e!141618))))

(assert (=> b!207170 (= res!173771 (not (= i!590 nBits!348)))))

(declare-fun b!207171 () Bool)

(declare-fun array_inv!4321 (array!10417) Bool)

(assert (=> b!207171 (= e!141614 (array_inv!4321 (buf!5085 thiss!1204)))))

(assert (= (and start!43634 res!173783) b!207163))

(assert (= (and b!207163 res!173779) b!207158))

(assert (= (and b!207158 res!173772) b!207170))

(assert (= (and b!207170 res!173771) b!207156))

(assert (= (and b!207156 res!173774) b!207165))

(assert (= (and b!207165 res!173778) b!207166))

(assert (= (and b!207166 res!173773) b!207167))

(assert (= (and b!207167 res!173784) b!207160))

(assert (= (and b!207156 (not res!173776)) b!207157))

(assert (= (and b!207157 (not res!173781)) b!207161))

(assert (= (and b!207161 (not res!173786)) b!207155))

(assert (= (and b!207155 (not res!173777)) b!207162))

(assert (= (and b!207162 (not res!173780)) b!207168))

(assert (= (and b!207168 (not res!173782)) b!207169))

(assert (= (and b!207169 res!173775) b!207159))

(assert (= (and b!207169 res!173785) b!207164))

(assert (= start!43634 b!207171))

(declare-fun m!318839 () Bool)

(assert (=> b!207158 m!318839))

(declare-fun m!318841 () Bool)

(assert (=> start!43634 m!318841))

(declare-fun m!318843 () Bool)

(assert (=> b!207167 m!318843))

(assert (=> b!207167 m!318843))

(declare-fun m!318845 () Bool)

(assert (=> b!207167 m!318845))

(declare-fun m!318847 () Bool)

(assert (=> b!207162 m!318847))

(declare-fun m!318849 () Bool)

(assert (=> b!207163 m!318849))

(declare-fun m!318851 () Bool)

(assert (=> b!207156 m!318851))

(declare-fun m!318853 () Bool)

(assert (=> b!207156 m!318853))

(declare-fun m!318855 () Bool)

(assert (=> b!207156 m!318855))

(declare-fun m!318857 () Bool)

(assert (=> b!207160 m!318857))

(assert (=> b!207165 m!318851))

(assert (=> b!207165 m!318853))

(declare-fun m!318859 () Bool)

(assert (=> b!207157 m!318859))

(declare-fun m!318861 () Bool)

(assert (=> b!207157 m!318861))

(declare-fun m!318863 () Bool)

(assert (=> b!207157 m!318863))

(declare-fun m!318865 () Bool)

(assert (=> b!207157 m!318865))

(declare-fun m!318867 () Bool)

(assert (=> b!207168 m!318867))

(declare-fun m!318869 () Bool)

(assert (=> b!207169 m!318869))

(declare-fun m!318871 () Bool)

(assert (=> b!207169 m!318871))

(declare-fun m!318873 () Bool)

(assert (=> b!207169 m!318873))

(declare-fun m!318875 () Bool)

(assert (=> b!207169 m!318875))

(declare-fun m!318877 () Bool)

(assert (=> b!207169 m!318877))

(declare-fun m!318879 () Bool)

(assert (=> b!207169 m!318879))

(declare-fun m!318881 () Bool)

(assert (=> b!207169 m!318881))

(declare-fun m!318883 () Bool)

(assert (=> b!207169 m!318883))

(declare-fun m!318885 () Bool)

(assert (=> b!207169 m!318885))

(declare-fun m!318887 () Bool)

(assert (=> b!207169 m!318887))

(declare-fun m!318889 () Bool)

(assert (=> b!207169 m!318889))

(declare-fun m!318891 () Bool)

(assert (=> b!207169 m!318891))

(declare-fun m!318893 () Bool)

(assert (=> b!207169 m!318893))

(declare-fun m!318895 () Bool)

(assert (=> b!207171 m!318895))

(declare-fun m!318897 () Bool)

(assert (=> b!207159 m!318897))

(assert (=> b!207166 m!318867))

(declare-fun m!318899 () Bool)

(assert (=> b!207161 m!318899))

(check-sat (not b!207162) (not b!207171) (not b!207160) (not b!207157) (not b!207163) (not b!207166) (not b!207156) (not b!207167) (not b!207168) (not b!207165) (not b!207161) (not start!43634) (not b!207159) (not b!207169) (not b!207158))
