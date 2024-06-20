; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26392 () Bool)

(assert start!26392)

(declare-fun b!135696 () Bool)

(declare-fun e!90110 () Bool)

(declare-datatypes ((array!6192 0))(
  ( (array!6193 (arr!3469 (Array (_ BitVec 32) (_ BitVec 8))) (size!2804 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4872 0))(
  ( (BitStream!4873 (buf!3197 array!6192) (currentByte!5994 (_ BitVec 32)) (currentBit!5989 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4872)

(declare-datatypes ((Unit!8446 0))(
  ( (Unit!8447) )
))
(declare-datatypes ((tuple2!11828 0))(
  ( (tuple2!11829 (_1!6230 Unit!8446) (_2!6230 BitStream!4872)) )
))
(declare-fun lt!210687 () tuple2!11828)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!135696 (= e!90110 (invariant!0 (currentBit!5989 thiss!1634) (currentByte!5994 thiss!1634) (size!2804 (buf!3197 (_2!6230 lt!210687)))))))

(declare-fun b!135697 () Bool)

(declare-fun res!112887 () Bool)

(declare-fun e!90107 () Bool)

(assert (=> b!135697 (=> (not res!112887) (not e!90107))))

(assert (=> b!135697 (= res!112887 (invariant!0 (currentBit!5989 thiss!1634) (currentByte!5994 thiss!1634) (size!2804 (buf!3197 thiss!1634))))))

(declare-fun b!135698 () Bool)

(declare-fun res!112896 () Bool)

(declare-fun e!90106 () Bool)

(assert (=> b!135698 (=> (not res!112896) (not e!90106))))

(declare-fun lt!210693 () tuple2!11828)

(declare-fun isPrefixOf!0 (BitStream!4872 BitStream!4872) Bool)

(assert (=> b!135698 (= res!112896 (isPrefixOf!0 (_2!6230 lt!210687) (_2!6230 lt!210693)))))

(declare-fun b!135699 () Bool)

(declare-fun res!112891 () Bool)

(declare-fun e!90102 () Bool)

(assert (=> b!135699 (=> (not res!112891) (not e!90102))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!135699 (= res!112891 (= (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!210687))) (currentByte!5994 (_2!6230 lt!210687)) (currentBit!5989 (_2!6230 lt!210687))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2804 (buf!3197 thiss!1634)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634)))))))

(declare-fun b!135700 () Bool)

(declare-datatypes ((tuple2!11830 0))(
  ( (tuple2!11831 (_1!6231 BitStream!4872) (_2!6231 (_ BitVec 8))) )
))
(declare-fun lt!210703 () tuple2!11830)

(declare-datatypes ((tuple2!11832 0))(
  ( (tuple2!11833 (_1!6232 BitStream!4872) (_2!6232 BitStream!4872)) )
))
(declare-fun lt!210696 () tuple2!11832)

(declare-fun arr!237 () array!6192)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!135700 (= e!90102 (and (= (_2!6231 lt!210703) (select (arr!3469 arr!237) from!447)) (= (_1!6231 lt!210703) (_2!6232 lt!210696))))))

(declare-fun readBytePure!0 (BitStream!4872) tuple2!11830)

(assert (=> b!135700 (= lt!210703 (readBytePure!0 (_1!6232 lt!210696)))))

(declare-fun reader!0 (BitStream!4872 BitStream!4872) tuple2!11832)

(assert (=> b!135700 (= lt!210696 (reader!0 thiss!1634 (_2!6230 lt!210687)))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun e!90111 () Bool)

(declare-fun b!135701 () Bool)

(declare-datatypes ((tuple2!11834 0))(
  ( (tuple2!11835 (_1!6233 BitStream!4872) (_2!6233 array!6192)) )
))
(declare-fun lt!210692 () tuple2!11834)

(assert (=> b!135701 (= e!90111 (or (bvsgt #b00000000000000000000000000000000 to!404) (bvsle (size!2804 arr!237) (size!2804 (_2!6233 lt!210692)))))))

(declare-fun arrayRangesEq!207 (array!6192 array!6192 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!135701 (arrayRangesEq!207 arr!237 (_2!6233 lt!210692) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!210695 () tuple2!11834)

(declare-fun lt!210699 () Unit!8446)

(declare-fun arrayRangesEqTransitive!9 (array!6192 array!6192 array!6192 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8446)

(assert (=> b!135701 (= lt!210699 (arrayRangesEqTransitive!9 arr!237 (_2!6233 lt!210695) (_2!6233 lt!210692) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!135701 (arrayRangesEq!207 (_2!6233 lt!210695) (_2!6233 lt!210692) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!210711 () Unit!8446)

(declare-fun arrayRangesEqSymmetricLemma!20 (array!6192 array!6192 (_ BitVec 32) (_ BitVec 32)) Unit!8446)

(assert (=> b!135701 (= lt!210711 (arrayRangesEqSymmetricLemma!20 (_2!6233 lt!210692) (_2!6233 lt!210695) #b00000000000000000000000000000000 to!404))))

(declare-fun b!135702 () Bool)

(declare-fun e!90109 () Bool)

(declare-fun lt!210707 () tuple2!11834)

(assert (=> b!135702 (= e!90109 (not (arrayRangesEq!207 arr!237 (_2!6233 lt!210707) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!135703 () Bool)

(declare-fun e!90101 () Bool)

(declare-fun array_inv!2593 (array!6192) Bool)

(assert (=> b!135703 (= e!90101 (array_inv!2593 (buf!3197 thiss!1634)))))

(declare-fun b!135704 () Bool)

(declare-fun e!90108 () Bool)

(assert (=> b!135704 (= e!90108 e!90106)))

(declare-fun res!112890 () Bool)

(assert (=> b!135704 (=> (not res!112890) (not e!90106))))

(declare-fun lt!210710 () (_ BitVec 64))

(assert (=> b!135704 (= res!112890 (= (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!210693))) (currentByte!5994 (_2!6230 lt!210693)) (currentBit!5989 (_2!6230 lt!210693))) (bvadd (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!210687))) (currentByte!5994 (_2!6230 lt!210687)) (currentBit!5989 (_2!6230 lt!210687))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!210710))))))

(assert (=> b!135704 (= lt!210710 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!135705 () Bool)

(assert (=> b!135705 (= e!90107 (not e!90111))))

(declare-fun res!112889 () Bool)

(assert (=> b!135705 (=> res!112889 e!90111)))

(assert (=> b!135705 (= res!112889 (not (arrayRangesEq!207 (_2!6233 lt!210692) (_2!6233 lt!210695) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!210701 () tuple2!11834)

(assert (=> b!135705 (arrayRangesEq!207 (_2!6233 lt!210692) (_2!6233 lt!210701) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!210690 () tuple2!11832)

(declare-fun lt!210708 () Unit!8446)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4872 array!6192 (_ BitVec 32) (_ BitVec 32)) Unit!8446)

(assert (=> b!135705 (= lt!210708 (readByteArrayLoopArrayPrefixLemma!0 (_1!6232 lt!210690) arr!237 from!447 to!404))))

(declare-fun lt!210686 () array!6192)

(declare-fun readByteArrayLoopPure!0 (BitStream!4872 array!6192 (_ BitVec 32) (_ BitVec 32)) tuple2!11834)

(declare-fun withMovedByteIndex!0 (BitStream!4872 (_ BitVec 32)) BitStream!4872)

(assert (=> b!135705 (= lt!210701 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6232 lt!210690) #b00000000000000000000000000000001) lt!210686 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!210688 () tuple2!11832)

(assert (=> b!135705 (= lt!210695 (readByteArrayLoopPure!0 (_1!6232 lt!210688) lt!210686 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!210700 () tuple2!11830)

(assert (=> b!135705 (= lt!210686 (array!6193 (store (arr!3469 arr!237) from!447 (_2!6231 lt!210700)) (size!2804 arr!237)))))

(declare-fun lt!210712 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!135705 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!210693)))) ((_ sign_extend 32) (currentByte!5994 (_2!6230 lt!210687))) ((_ sign_extend 32) (currentBit!5989 (_2!6230 lt!210687))) lt!210712)))

(declare-fun lt!210698 () Unit!8446)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4872 array!6192 (_ BitVec 32)) Unit!8446)

(assert (=> b!135705 (= lt!210698 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6230 lt!210687) (buf!3197 (_2!6230 lt!210693)) lt!210712))))

(assert (=> b!135705 (= (_1!6233 lt!210692) (_2!6232 lt!210690))))

(assert (=> b!135705 (= lt!210692 (readByteArrayLoopPure!0 (_1!6232 lt!210690) arr!237 from!447 to!404))))

(assert (=> b!135705 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!210693)))) ((_ sign_extend 32) (currentByte!5994 thiss!1634)) ((_ sign_extend 32) (currentBit!5989 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!210694 () Unit!8446)

(assert (=> b!135705 (= lt!210694 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3197 (_2!6230 lt!210693)) (bvsub to!404 from!447)))))

(assert (=> b!135705 (= (_2!6231 lt!210700) (select (arr!3469 arr!237) from!447))))

(assert (=> b!135705 (= lt!210700 (readBytePure!0 (_1!6232 lt!210690)))))

(assert (=> b!135705 (= lt!210688 (reader!0 (_2!6230 lt!210687) (_2!6230 lt!210693)))))

(assert (=> b!135705 (= lt!210690 (reader!0 thiss!1634 (_2!6230 lt!210693)))))

(declare-fun e!90105 () Bool)

(assert (=> b!135705 e!90105))

(declare-fun res!112894 () Bool)

(assert (=> b!135705 (=> (not res!112894) (not e!90105))))

(declare-fun lt!210697 () tuple2!11830)

(declare-fun lt!210704 () tuple2!11830)

(assert (=> b!135705 (= res!112894 (= (bitIndex!0 (size!2804 (buf!3197 (_1!6231 lt!210697))) (currentByte!5994 (_1!6231 lt!210697)) (currentBit!5989 (_1!6231 lt!210697))) (bitIndex!0 (size!2804 (buf!3197 (_1!6231 lt!210704))) (currentByte!5994 (_1!6231 lt!210704)) (currentBit!5989 (_1!6231 lt!210704)))))))

(declare-fun lt!210705 () Unit!8446)

(declare-fun lt!210689 () BitStream!4872)

(declare-fun readBytePrefixLemma!0 (BitStream!4872 BitStream!4872) Unit!8446)

(assert (=> b!135705 (= lt!210705 (readBytePrefixLemma!0 lt!210689 (_2!6230 lt!210693)))))

(assert (=> b!135705 (= lt!210704 (readBytePure!0 (BitStream!4873 (buf!3197 (_2!6230 lt!210693)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634))))))

(assert (=> b!135705 (= lt!210697 (readBytePure!0 lt!210689))))

(assert (=> b!135705 (= lt!210689 (BitStream!4873 (buf!3197 (_2!6230 lt!210687)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634)))))

(assert (=> b!135705 e!90110))

(declare-fun res!112893 () Bool)

(assert (=> b!135705 (=> (not res!112893) (not e!90110))))

(assert (=> b!135705 (= res!112893 (isPrefixOf!0 thiss!1634 (_2!6230 lt!210693)))))

(declare-fun lt!210691 () Unit!8446)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4872 BitStream!4872 BitStream!4872) Unit!8446)

(assert (=> b!135705 (= lt!210691 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6230 lt!210687) (_2!6230 lt!210693)))))

(assert (=> b!135705 e!90108))

(declare-fun res!112892 () Bool)

(assert (=> b!135705 (=> (not res!112892) (not e!90108))))

(assert (=> b!135705 (= res!112892 (= (size!2804 (buf!3197 (_2!6230 lt!210687))) (size!2804 (buf!3197 (_2!6230 lt!210693)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4872 array!6192 (_ BitVec 32) (_ BitVec 32)) tuple2!11828)

(assert (=> b!135705 (= lt!210693 (appendByteArrayLoop!0 (_2!6230 lt!210687) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!135705 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!210687)))) ((_ sign_extend 32) (currentByte!5994 (_2!6230 lt!210687))) ((_ sign_extend 32) (currentBit!5989 (_2!6230 lt!210687))) lt!210712)))

(assert (=> b!135705 (= lt!210712 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!210702 () Unit!8446)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4872 BitStream!4872 (_ BitVec 64) (_ BitVec 32)) Unit!8446)

(assert (=> b!135705 (= lt!210702 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6230 lt!210687) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!135705 e!90102))

(declare-fun res!112884 () Bool)

(assert (=> b!135705 (=> (not res!112884) (not e!90102))))

(assert (=> b!135705 (= res!112884 (= (size!2804 (buf!3197 thiss!1634)) (size!2804 (buf!3197 (_2!6230 lt!210687)))))))

(declare-fun appendByte!0 (BitStream!4872 (_ BitVec 8)) tuple2!11828)

(assert (=> b!135705 (= lt!210687 (appendByte!0 thiss!1634 (select (arr!3469 arr!237) from!447)))))

(declare-fun b!135706 () Bool)

(assert (=> b!135706 (= e!90105 (= (_2!6231 lt!210697) (_2!6231 lt!210704)))))

(declare-fun b!135707 () Bool)

(declare-fun res!112895 () Bool)

(assert (=> b!135707 (=> (not res!112895) (not e!90107))))

(assert (=> b!135707 (= res!112895 (bvslt from!447 to!404))))

(declare-fun b!135708 () Bool)

(declare-fun res!112883 () Bool)

(assert (=> b!135708 (=> (not res!112883) (not e!90107))))

(assert (=> b!135708 (= res!112883 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2804 (buf!3197 thiss!1634))) ((_ sign_extend 32) (currentByte!5994 thiss!1634)) ((_ sign_extend 32) (currentBit!5989 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun res!112886 () Bool)

(assert (=> start!26392 (=> (not res!112886) (not e!90107))))

(assert (=> start!26392 (= res!112886 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2804 arr!237))))))

(assert (=> start!26392 e!90107))

(assert (=> start!26392 true))

(assert (=> start!26392 (array_inv!2593 arr!237)))

(declare-fun inv!12 (BitStream!4872) Bool)

(assert (=> start!26392 (and (inv!12 thiss!1634) e!90101)))

(declare-fun b!135709 () Bool)

(assert (=> b!135709 (= e!90106 (not e!90109))))

(declare-fun res!112885 () Bool)

(assert (=> b!135709 (=> res!112885 e!90109)))

(declare-fun lt!210706 () tuple2!11832)

(assert (=> b!135709 (= res!112885 (or (not (= (size!2804 (_2!6233 lt!210707)) (size!2804 arr!237))) (not (= (_1!6233 lt!210707) (_2!6232 lt!210706)))))))

(assert (=> b!135709 (= lt!210707 (readByteArrayLoopPure!0 (_1!6232 lt!210706) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!135709 (validate_offset_bits!1 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!210693)))) ((_ sign_extend 32) (currentByte!5994 (_2!6230 lt!210687))) ((_ sign_extend 32) (currentBit!5989 (_2!6230 lt!210687))) lt!210710)))

(declare-fun lt!210709 () Unit!8446)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4872 array!6192 (_ BitVec 64)) Unit!8446)

(assert (=> b!135709 (= lt!210709 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6230 lt!210687) (buf!3197 (_2!6230 lt!210693)) lt!210710))))

(assert (=> b!135709 (= lt!210706 (reader!0 (_2!6230 lt!210687) (_2!6230 lt!210693)))))

(declare-fun b!135710 () Bool)

(declare-fun res!112888 () Bool)

(assert (=> b!135710 (=> (not res!112888) (not e!90102))))

(assert (=> b!135710 (= res!112888 (isPrefixOf!0 thiss!1634 (_2!6230 lt!210687)))))

(assert (= (and start!26392 res!112886) b!135708))

(assert (= (and b!135708 res!112883) b!135707))

(assert (= (and b!135707 res!112895) b!135697))

(assert (= (and b!135697 res!112887) b!135705))

(assert (= (and b!135705 res!112884) b!135699))

(assert (= (and b!135699 res!112891) b!135710))

(assert (= (and b!135710 res!112888) b!135700))

(assert (= (and b!135705 res!112892) b!135704))

(assert (= (and b!135704 res!112890) b!135698))

(assert (= (and b!135698 res!112896) b!135709))

(assert (= (and b!135709 (not res!112885)) b!135702))

(assert (= (and b!135705 res!112893) b!135696))

(assert (= (and b!135705 res!112894) b!135706))

(assert (= (and b!135705 (not res!112889)) b!135701))

(assert (= start!26392 b!135703))

(declare-fun m!207163 () Bool)

(assert (=> b!135708 m!207163))

(declare-fun m!207165 () Bool)

(assert (=> b!135700 m!207165))

(declare-fun m!207167 () Bool)

(assert (=> b!135700 m!207167))

(declare-fun m!207169 () Bool)

(assert (=> b!135700 m!207169))

(declare-fun m!207171 () Bool)

(assert (=> b!135709 m!207171))

(declare-fun m!207173 () Bool)

(assert (=> b!135709 m!207173))

(declare-fun m!207175 () Bool)

(assert (=> b!135709 m!207175))

(declare-fun m!207177 () Bool)

(assert (=> b!135709 m!207177))

(declare-fun m!207179 () Bool)

(assert (=> b!135697 m!207179))

(declare-fun m!207181 () Bool)

(assert (=> b!135701 m!207181))

(declare-fun m!207183 () Bool)

(assert (=> b!135701 m!207183))

(declare-fun m!207185 () Bool)

(assert (=> b!135701 m!207185))

(declare-fun m!207187 () Bool)

(assert (=> b!135701 m!207187))

(declare-fun m!207189 () Bool)

(assert (=> start!26392 m!207189))

(declare-fun m!207191 () Bool)

(assert (=> start!26392 m!207191))

(declare-fun m!207193 () Bool)

(assert (=> b!135703 m!207193))

(declare-fun m!207195 () Bool)

(assert (=> b!135699 m!207195))

(declare-fun m!207197 () Bool)

(assert (=> b!135699 m!207197))

(declare-fun m!207199 () Bool)

(assert (=> b!135702 m!207199))

(declare-fun m!207201 () Bool)

(assert (=> b!135698 m!207201))

(declare-fun m!207203 () Bool)

(assert (=> b!135704 m!207203))

(assert (=> b!135704 m!207195))

(declare-fun m!207205 () Bool)

(assert (=> b!135710 m!207205))

(declare-fun m!207207 () Bool)

(assert (=> b!135705 m!207207))

(assert (=> b!135705 m!207177))

(declare-fun m!207209 () Bool)

(assert (=> b!135705 m!207209))

(declare-fun m!207211 () Bool)

(assert (=> b!135705 m!207211))

(declare-fun m!207213 () Bool)

(assert (=> b!135705 m!207213))

(declare-fun m!207215 () Bool)

(assert (=> b!135705 m!207215))

(declare-fun m!207217 () Bool)

(assert (=> b!135705 m!207217))

(declare-fun m!207219 () Bool)

(assert (=> b!135705 m!207219))

(declare-fun m!207221 () Bool)

(assert (=> b!135705 m!207221))

(declare-fun m!207223 () Bool)

(assert (=> b!135705 m!207223))

(declare-fun m!207225 () Bool)

(assert (=> b!135705 m!207225))

(declare-fun m!207227 () Bool)

(assert (=> b!135705 m!207227))

(declare-fun m!207229 () Bool)

(assert (=> b!135705 m!207229))

(declare-fun m!207231 () Bool)

(assert (=> b!135705 m!207231))

(declare-fun m!207233 () Bool)

(assert (=> b!135705 m!207233))

(declare-fun m!207235 () Bool)

(assert (=> b!135705 m!207235))

(declare-fun m!207237 () Bool)

(assert (=> b!135705 m!207237))

(declare-fun m!207239 () Bool)

(assert (=> b!135705 m!207239))

(declare-fun m!207241 () Bool)

(assert (=> b!135705 m!207241))

(assert (=> b!135705 m!207235))

(declare-fun m!207243 () Bool)

(assert (=> b!135705 m!207243))

(declare-fun m!207245 () Bool)

(assert (=> b!135705 m!207245))

(declare-fun m!207247 () Bool)

(assert (=> b!135705 m!207247))

(declare-fun m!207249 () Bool)

(assert (=> b!135705 m!207249))

(assert (=> b!135705 m!207165))

(declare-fun m!207251 () Bool)

(assert (=> b!135705 m!207251))

(declare-fun m!207253 () Bool)

(assert (=> b!135705 m!207253))

(declare-fun m!207255 () Bool)

(assert (=> b!135705 m!207255))

(assert (=> b!135705 m!207165))

(declare-fun m!207257 () Bool)

(assert (=> b!135696 m!207257))

(check-sat (not b!135708) (not b!135696) (not b!135700) (not b!135699) (not b!135704) (not b!135710) (not b!135698) (not b!135697) (not b!135701) (not b!135709) (not b!135705) (not b!135703) (not b!135702) (not start!26392))
(check-sat)
(get-model)

(declare-fun d!43609 () Bool)

(declare-fun e!90265 () Bool)

(assert (=> d!43609 e!90265))

(declare-fun res!113119 () Bool)

(assert (=> d!43609 (=> (not res!113119) (not e!90265))))

(declare-fun lt!211299 () (_ BitVec 64))

(declare-fun lt!211297 () (_ BitVec 64))

(declare-fun lt!211301 () (_ BitVec 64))

(assert (=> d!43609 (= res!113119 (= lt!211301 (bvsub lt!211299 lt!211297)))))

(assert (=> d!43609 (or (= (bvand lt!211299 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!211297 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!211299 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!211299 lt!211297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!43609 (= lt!211297 (remainingBits!0 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!210687)))) ((_ sign_extend 32) (currentByte!5994 (_2!6230 lt!210687))) ((_ sign_extend 32) (currentBit!5989 (_2!6230 lt!210687)))))))

(declare-fun lt!211296 () (_ BitVec 64))

(declare-fun lt!211298 () (_ BitVec 64))

(assert (=> d!43609 (= lt!211299 (bvmul lt!211296 lt!211298))))

(assert (=> d!43609 (or (= lt!211296 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!211298 (bvsdiv (bvmul lt!211296 lt!211298) lt!211296)))))

(assert (=> d!43609 (= lt!211298 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!43609 (= lt!211296 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!210687)))))))

(assert (=> d!43609 (= lt!211301 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5994 (_2!6230 lt!210687))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5989 (_2!6230 lt!210687)))))))

(assert (=> d!43609 (invariant!0 (currentBit!5989 (_2!6230 lt!210687)) (currentByte!5994 (_2!6230 lt!210687)) (size!2804 (buf!3197 (_2!6230 lt!210687))))))

(assert (=> d!43609 (= (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!210687))) (currentByte!5994 (_2!6230 lt!210687)) (currentBit!5989 (_2!6230 lt!210687))) lt!211301)))

(declare-fun b!135956 () Bool)

(declare-fun res!113120 () Bool)

(assert (=> b!135956 (=> (not res!113120) (not e!90265))))

(assert (=> b!135956 (= res!113120 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!211301))))

(declare-fun b!135957 () Bool)

(declare-fun lt!211300 () (_ BitVec 64))

(assert (=> b!135957 (= e!90265 (bvsle lt!211301 (bvmul lt!211300 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!135957 (or (= lt!211300 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!211300 #b0000000000000000000000000000000000000000000000000000000000001000) lt!211300)))))

(assert (=> b!135957 (= lt!211300 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!210687)))))))

(assert (= (and d!43609 res!113119) b!135956))

(assert (= (and b!135956 res!113120) b!135957))

(declare-fun m!207767 () Bool)

(assert (=> d!43609 m!207767))

(declare-fun m!207769 () Bool)

(assert (=> d!43609 m!207769))

(assert (=> b!135699 d!43609))

(declare-fun d!43611 () Bool)

(declare-fun e!90266 () Bool)

(assert (=> d!43611 e!90266))

(declare-fun res!113121 () Bool)

(assert (=> d!43611 (=> (not res!113121) (not e!90266))))

(declare-fun lt!211307 () (_ BitVec 64))

(declare-fun lt!211303 () (_ BitVec 64))

(declare-fun lt!211305 () (_ BitVec 64))

(assert (=> d!43611 (= res!113121 (= lt!211307 (bvsub lt!211305 lt!211303)))))

(assert (=> d!43611 (or (= (bvand lt!211305 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!211303 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!211305 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!211305 lt!211303) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!43611 (= lt!211303 (remainingBits!0 ((_ sign_extend 32) (size!2804 (buf!3197 thiss!1634))) ((_ sign_extend 32) (currentByte!5994 thiss!1634)) ((_ sign_extend 32) (currentBit!5989 thiss!1634))))))

(declare-fun lt!211302 () (_ BitVec 64))

(declare-fun lt!211304 () (_ BitVec 64))

(assert (=> d!43611 (= lt!211305 (bvmul lt!211302 lt!211304))))

(assert (=> d!43611 (or (= lt!211302 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!211304 (bvsdiv (bvmul lt!211302 lt!211304) lt!211302)))))

(assert (=> d!43611 (= lt!211304 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!43611 (= lt!211302 ((_ sign_extend 32) (size!2804 (buf!3197 thiss!1634))))))

(assert (=> d!43611 (= lt!211307 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5994 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5989 thiss!1634))))))

(assert (=> d!43611 (invariant!0 (currentBit!5989 thiss!1634) (currentByte!5994 thiss!1634) (size!2804 (buf!3197 thiss!1634)))))

(assert (=> d!43611 (= (bitIndex!0 (size!2804 (buf!3197 thiss!1634)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634)) lt!211307)))

(declare-fun b!135958 () Bool)

(declare-fun res!113122 () Bool)

(assert (=> b!135958 (=> (not res!113122) (not e!90266))))

(assert (=> b!135958 (= res!113122 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!211307))))

(declare-fun b!135959 () Bool)

(declare-fun lt!211306 () (_ BitVec 64))

(assert (=> b!135959 (= e!90266 (bvsle lt!211307 (bvmul lt!211306 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!135959 (or (= lt!211306 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!211306 #b0000000000000000000000000000000000000000000000000000000000001000) lt!211306)))))

(assert (=> b!135959 (= lt!211306 ((_ sign_extend 32) (size!2804 (buf!3197 thiss!1634))))))

(assert (= (and d!43611 res!113121) b!135958))

(assert (= (and b!135958 res!113122) b!135959))

(declare-fun m!207771 () Bool)

(assert (=> d!43611 m!207771))

(assert (=> d!43611 m!207179))

(assert (=> b!135699 d!43611))

(declare-fun d!43613 () Bool)

(declare-fun res!113130 () Bool)

(declare-fun e!90272 () Bool)

(assert (=> d!43613 (=> (not res!113130) (not e!90272))))

(assert (=> d!43613 (= res!113130 (= (size!2804 (buf!3197 (_2!6230 lt!210687))) (size!2804 (buf!3197 (_2!6230 lt!210693)))))))

(assert (=> d!43613 (= (isPrefixOf!0 (_2!6230 lt!210687) (_2!6230 lt!210693)) e!90272)))

(declare-fun b!135966 () Bool)

(declare-fun res!113131 () Bool)

(assert (=> b!135966 (=> (not res!113131) (not e!90272))))

(assert (=> b!135966 (= res!113131 (bvsle (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!210687))) (currentByte!5994 (_2!6230 lt!210687)) (currentBit!5989 (_2!6230 lt!210687))) (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!210693))) (currentByte!5994 (_2!6230 lt!210693)) (currentBit!5989 (_2!6230 lt!210693)))))))

(declare-fun b!135967 () Bool)

(declare-fun e!90271 () Bool)

(assert (=> b!135967 (= e!90272 e!90271)))

(declare-fun res!113129 () Bool)

(assert (=> b!135967 (=> res!113129 e!90271)))

(assert (=> b!135967 (= res!113129 (= (size!2804 (buf!3197 (_2!6230 lt!210687))) #b00000000000000000000000000000000))))

(declare-fun b!135968 () Bool)

(declare-fun arrayBitRangesEq!0 (array!6192 array!6192 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!135968 (= e!90271 (arrayBitRangesEq!0 (buf!3197 (_2!6230 lt!210687)) (buf!3197 (_2!6230 lt!210693)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!210687))) (currentByte!5994 (_2!6230 lt!210687)) (currentBit!5989 (_2!6230 lt!210687)))))))

(assert (= (and d!43613 res!113130) b!135966))

(assert (= (and b!135966 res!113131) b!135967))

(assert (= (and b!135967 (not res!113129)) b!135968))

(assert (=> b!135966 m!207195))

(assert (=> b!135966 m!207203))

(assert (=> b!135968 m!207195))

(assert (=> b!135968 m!207195))

(declare-fun m!207773 () Bool)

(assert (=> b!135968 m!207773))

(assert (=> b!135698 d!43613))

(declare-datatypes ((tuple3!518 0))(
  ( (tuple3!519 (_1!6242 Unit!8446) (_2!6242 BitStream!4872) (_3!318 array!6192)) )
))
(declare-fun lt!211310 () tuple3!518)

(declare-fun d!43615 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!4872 array!6192 (_ BitVec 32) (_ BitVec 32)) tuple3!518)

(assert (=> d!43615 (= lt!211310 (readByteArrayLoop!0 (_1!6232 lt!210706) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!43615 (= (readByteArrayLoopPure!0 (_1!6232 lt!210706) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11835 (_2!6242 lt!211310) (_3!318 lt!211310)))))

(declare-fun bs!10641 () Bool)

(assert (= bs!10641 d!43615))

(declare-fun m!207775 () Bool)

(assert (=> bs!10641 m!207775))

(assert (=> b!135709 d!43615))

(declare-fun d!43617 () Bool)

(assert (=> d!43617 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!210693)))) ((_ sign_extend 32) (currentByte!5994 (_2!6230 lt!210687))) ((_ sign_extend 32) (currentBit!5989 (_2!6230 lt!210687))) lt!210710) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!210693)))) ((_ sign_extend 32) (currentByte!5994 (_2!6230 lt!210687))) ((_ sign_extend 32) (currentBit!5989 (_2!6230 lt!210687)))) lt!210710))))

(declare-fun bs!10642 () Bool)

(assert (= bs!10642 d!43617))

(declare-fun m!207777 () Bool)

(assert (=> bs!10642 m!207777))

(assert (=> b!135709 d!43617))

(declare-fun d!43619 () Bool)

(assert (=> d!43619 (validate_offset_bits!1 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!210693)))) ((_ sign_extend 32) (currentByte!5994 (_2!6230 lt!210687))) ((_ sign_extend 32) (currentBit!5989 (_2!6230 lt!210687))) lt!210710)))

(declare-fun lt!211313 () Unit!8446)

(declare-fun choose!9 (BitStream!4872 array!6192 (_ BitVec 64) BitStream!4872) Unit!8446)

(assert (=> d!43619 (= lt!211313 (choose!9 (_2!6230 lt!210687) (buf!3197 (_2!6230 lt!210693)) lt!210710 (BitStream!4873 (buf!3197 (_2!6230 lt!210693)) (currentByte!5994 (_2!6230 lt!210687)) (currentBit!5989 (_2!6230 lt!210687)))))))

(assert (=> d!43619 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6230 lt!210687) (buf!3197 (_2!6230 lt!210693)) lt!210710) lt!211313)))

(declare-fun bs!10643 () Bool)

(assert (= bs!10643 d!43619))

(assert (=> bs!10643 m!207173))

(declare-fun m!207779 () Bool)

(assert (=> bs!10643 m!207779))

(assert (=> b!135709 d!43619))

(declare-fun b!135979 () Bool)

(declare-fun e!90277 () Unit!8446)

(declare-fun lt!211363 () Unit!8446)

(assert (=> b!135979 (= e!90277 lt!211363)))

(declare-fun lt!211356 () (_ BitVec 64))

(assert (=> b!135979 (= lt!211356 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!211362 () (_ BitVec 64))

(assert (=> b!135979 (= lt!211362 (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!210687))) (currentByte!5994 (_2!6230 lt!210687)) (currentBit!5989 (_2!6230 lt!210687))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6192 array!6192 (_ BitVec 64) (_ BitVec 64)) Unit!8446)

(assert (=> b!135979 (= lt!211363 (arrayBitRangesEqSymmetric!0 (buf!3197 (_2!6230 lt!210687)) (buf!3197 (_2!6230 lt!210693)) lt!211356 lt!211362))))

(assert (=> b!135979 (arrayBitRangesEq!0 (buf!3197 (_2!6230 lt!210693)) (buf!3197 (_2!6230 lt!210687)) lt!211356 lt!211362)))

(declare-fun b!135980 () Bool)

(declare-fun res!113139 () Bool)

(declare-fun e!90278 () Bool)

(assert (=> b!135980 (=> (not res!113139) (not e!90278))))

(declare-fun lt!211358 () tuple2!11832)

(assert (=> b!135980 (= res!113139 (isPrefixOf!0 (_2!6232 lt!211358) (_2!6230 lt!210693)))))

(declare-fun b!135981 () Bool)

(declare-fun res!113138 () Bool)

(assert (=> b!135981 (=> (not res!113138) (not e!90278))))

(assert (=> b!135981 (= res!113138 (isPrefixOf!0 (_1!6232 lt!211358) (_2!6230 lt!210687)))))

(declare-fun b!135982 () Bool)

(declare-fun Unit!8456 () Unit!8446)

(assert (=> b!135982 (= e!90277 Unit!8456)))

(declare-fun d!43621 () Bool)

(assert (=> d!43621 e!90278))

(declare-fun res!113140 () Bool)

(assert (=> d!43621 (=> (not res!113140) (not e!90278))))

(assert (=> d!43621 (= res!113140 (isPrefixOf!0 (_1!6232 lt!211358) (_2!6232 lt!211358)))))

(declare-fun lt!211369 () BitStream!4872)

(assert (=> d!43621 (= lt!211358 (tuple2!11833 lt!211369 (_2!6230 lt!210693)))))

(declare-fun lt!211372 () Unit!8446)

(declare-fun lt!211373 () Unit!8446)

(assert (=> d!43621 (= lt!211372 lt!211373)))

(assert (=> d!43621 (isPrefixOf!0 lt!211369 (_2!6230 lt!210693))))

(assert (=> d!43621 (= lt!211373 (lemmaIsPrefixTransitive!0 lt!211369 (_2!6230 lt!210693) (_2!6230 lt!210693)))))

(declare-fun lt!211360 () Unit!8446)

(declare-fun lt!211365 () Unit!8446)

(assert (=> d!43621 (= lt!211360 lt!211365)))

(assert (=> d!43621 (isPrefixOf!0 lt!211369 (_2!6230 lt!210693))))

(assert (=> d!43621 (= lt!211365 (lemmaIsPrefixTransitive!0 lt!211369 (_2!6230 lt!210687) (_2!6230 lt!210693)))))

(declare-fun lt!211354 () Unit!8446)

(assert (=> d!43621 (= lt!211354 e!90277)))

(declare-fun c!7691 () Bool)

(assert (=> d!43621 (= c!7691 (not (= (size!2804 (buf!3197 (_2!6230 lt!210687))) #b00000000000000000000000000000000)))))

(declare-fun lt!211367 () Unit!8446)

(declare-fun lt!211355 () Unit!8446)

(assert (=> d!43621 (= lt!211367 lt!211355)))

(assert (=> d!43621 (isPrefixOf!0 (_2!6230 lt!210693) (_2!6230 lt!210693))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4872) Unit!8446)

(assert (=> d!43621 (= lt!211355 (lemmaIsPrefixRefl!0 (_2!6230 lt!210693)))))

(declare-fun lt!211368 () Unit!8446)

(declare-fun lt!211366 () Unit!8446)

(assert (=> d!43621 (= lt!211368 lt!211366)))

(assert (=> d!43621 (= lt!211366 (lemmaIsPrefixRefl!0 (_2!6230 lt!210693)))))

(declare-fun lt!211364 () Unit!8446)

(declare-fun lt!211371 () Unit!8446)

(assert (=> d!43621 (= lt!211364 lt!211371)))

(assert (=> d!43621 (isPrefixOf!0 lt!211369 lt!211369)))

(assert (=> d!43621 (= lt!211371 (lemmaIsPrefixRefl!0 lt!211369))))

(declare-fun lt!211361 () Unit!8446)

(declare-fun lt!211370 () Unit!8446)

(assert (=> d!43621 (= lt!211361 lt!211370)))

(assert (=> d!43621 (isPrefixOf!0 (_2!6230 lt!210687) (_2!6230 lt!210687))))

(assert (=> d!43621 (= lt!211370 (lemmaIsPrefixRefl!0 (_2!6230 lt!210687)))))

(assert (=> d!43621 (= lt!211369 (BitStream!4873 (buf!3197 (_2!6230 lt!210693)) (currentByte!5994 (_2!6230 lt!210687)) (currentBit!5989 (_2!6230 lt!210687))))))

(assert (=> d!43621 (isPrefixOf!0 (_2!6230 lt!210687) (_2!6230 lt!210693))))

(assert (=> d!43621 (= (reader!0 (_2!6230 lt!210687) (_2!6230 lt!210693)) lt!211358)))

(declare-fun lt!211357 () (_ BitVec 64))

(declare-fun lt!211359 () (_ BitVec 64))

(declare-fun b!135983 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!4872 (_ BitVec 64)) BitStream!4872)

(assert (=> b!135983 (= e!90278 (= (_1!6232 lt!211358) (withMovedBitIndex!0 (_2!6232 lt!211358) (bvsub lt!211357 lt!211359))))))

(assert (=> b!135983 (or (= (bvand lt!211357 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!211359 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!211357 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!211357 lt!211359) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!135983 (= lt!211359 (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!210693))) (currentByte!5994 (_2!6230 lt!210693)) (currentBit!5989 (_2!6230 lt!210693))))))

(assert (=> b!135983 (= lt!211357 (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!210687))) (currentByte!5994 (_2!6230 lt!210687)) (currentBit!5989 (_2!6230 lt!210687))))))

(assert (= (and d!43621 c!7691) b!135979))

(assert (= (and d!43621 (not c!7691)) b!135982))

(assert (= (and d!43621 res!113140) b!135981))

(assert (= (and b!135981 res!113138) b!135980))

(assert (= (and b!135980 res!113139) b!135983))

(declare-fun m!207781 () Bool)

(assert (=> b!135980 m!207781))

(declare-fun m!207783 () Bool)

(assert (=> d!43621 m!207783))

(declare-fun m!207785 () Bool)

(assert (=> d!43621 m!207785))

(declare-fun m!207787 () Bool)

(assert (=> d!43621 m!207787))

(declare-fun m!207789 () Bool)

(assert (=> d!43621 m!207789))

(declare-fun m!207791 () Bool)

(assert (=> d!43621 m!207791))

(declare-fun m!207793 () Bool)

(assert (=> d!43621 m!207793))

(declare-fun m!207795 () Bool)

(assert (=> d!43621 m!207795))

(declare-fun m!207797 () Bool)

(assert (=> d!43621 m!207797))

(assert (=> d!43621 m!207201))

(declare-fun m!207799 () Bool)

(assert (=> d!43621 m!207799))

(declare-fun m!207801 () Bool)

(assert (=> d!43621 m!207801))

(assert (=> b!135979 m!207195))

(declare-fun m!207803 () Bool)

(assert (=> b!135979 m!207803))

(declare-fun m!207805 () Bool)

(assert (=> b!135979 m!207805))

(declare-fun m!207807 () Bool)

(assert (=> b!135983 m!207807))

(assert (=> b!135983 m!207203))

(assert (=> b!135983 m!207195))

(declare-fun m!207809 () Bool)

(assert (=> b!135981 m!207809))

(assert (=> b!135709 d!43621))

(declare-fun d!43623 () Bool)

(assert (=> d!43623 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2804 (buf!3197 thiss!1634))) ((_ sign_extend 32) (currentByte!5994 thiss!1634)) ((_ sign_extend 32) (currentBit!5989 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2804 (buf!3197 thiss!1634))) ((_ sign_extend 32) (currentByte!5994 thiss!1634)) ((_ sign_extend 32) (currentBit!5989 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10644 () Bool)

(assert (= bs!10644 d!43623))

(assert (=> bs!10644 m!207771))

(assert (=> b!135708 d!43623))

(declare-fun d!43625 () Bool)

(assert (=> d!43625 (= (invariant!0 (currentBit!5989 thiss!1634) (currentByte!5994 thiss!1634) (size!2804 (buf!3197 thiss!1634))) (and (bvsge (currentBit!5989 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5989 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5994 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5994 thiss!1634) (size!2804 (buf!3197 thiss!1634))) (and (= (currentBit!5989 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5994 thiss!1634) (size!2804 (buf!3197 thiss!1634)))))))))

(assert (=> b!135697 d!43625))

(declare-fun d!43627 () Bool)

(declare-fun res!113145 () Bool)

(declare-fun e!90283 () Bool)

(assert (=> d!43627 (=> res!113145 e!90283)))

(assert (=> d!43627 (= res!113145 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!43627 (= (arrayRangesEq!207 arr!237 (_2!6233 lt!210692) #b00000000000000000000000000000000 to!404) e!90283)))

(declare-fun b!135988 () Bool)

(declare-fun e!90284 () Bool)

(assert (=> b!135988 (= e!90283 e!90284)))

(declare-fun res!113146 () Bool)

(assert (=> b!135988 (=> (not res!113146) (not e!90284))))

(assert (=> b!135988 (= res!113146 (= (select (arr!3469 arr!237) #b00000000000000000000000000000000) (select (arr!3469 (_2!6233 lt!210692)) #b00000000000000000000000000000000)))))

(declare-fun b!135989 () Bool)

(assert (=> b!135989 (= e!90284 (arrayRangesEq!207 arr!237 (_2!6233 lt!210692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!43627 (not res!113145)) b!135988))

(assert (= (and b!135988 res!113146) b!135989))

(declare-fun m!207811 () Bool)

(assert (=> b!135988 m!207811))

(declare-fun m!207813 () Bool)

(assert (=> b!135988 m!207813))

(declare-fun m!207815 () Bool)

(assert (=> b!135989 m!207815))

(assert (=> b!135701 d!43627))

(declare-fun d!43629 () Bool)

(assert (=> d!43629 (arrayRangesEq!207 arr!237 (_2!6233 lt!210692) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!211376 () Unit!8446)

(declare-fun choose!71 (array!6192 array!6192 array!6192 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8446)

(assert (=> d!43629 (= lt!211376 (choose!71 arr!237 (_2!6233 lt!210695) (_2!6233 lt!210692) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> d!43629 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 to!404) (bvsle to!404 to!404))))

(assert (=> d!43629 (= (arrayRangesEqTransitive!9 arr!237 (_2!6233 lt!210695) (_2!6233 lt!210692) #b00000000000000000000000000000000 to!404 to!404) lt!211376)))

(declare-fun bs!10645 () Bool)

(assert (= bs!10645 d!43629))

(assert (=> bs!10645 m!207181))

(declare-fun m!207817 () Bool)

(assert (=> bs!10645 m!207817))

(assert (=> b!135701 d!43629))

(declare-fun d!43631 () Bool)

(declare-fun res!113147 () Bool)

(declare-fun e!90285 () Bool)

(assert (=> d!43631 (=> res!113147 e!90285)))

(assert (=> d!43631 (= res!113147 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!43631 (= (arrayRangesEq!207 (_2!6233 lt!210695) (_2!6233 lt!210692) #b00000000000000000000000000000000 to!404) e!90285)))

(declare-fun b!135990 () Bool)

(declare-fun e!90286 () Bool)

(assert (=> b!135990 (= e!90285 e!90286)))

(declare-fun res!113148 () Bool)

(assert (=> b!135990 (=> (not res!113148) (not e!90286))))

(assert (=> b!135990 (= res!113148 (= (select (arr!3469 (_2!6233 lt!210695)) #b00000000000000000000000000000000) (select (arr!3469 (_2!6233 lt!210692)) #b00000000000000000000000000000000)))))

(declare-fun b!135991 () Bool)

(assert (=> b!135991 (= e!90286 (arrayRangesEq!207 (_2!6233 lt!210695) (_2!6233 lt!210692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!43631 (not res!113147)) b!135990))

(assert (= (and b!135990 res!113148) b!135991))

(declare-fun m!207819 () Bool)

(assert (=> b!135990 m!207819))

(assert (=> b!135990 m!207813))

(declare-fun m!207821 () Bool)

(assert (=> b!135991 m!207821))

(assert (=> b!135701 d!43631))

(declare-fun d!43633 () Bool)

(assert (=> d!43633 (arrayRangesEq!207 (_2!6233 lt!210695) (_2!6233 lt!210692) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!211379 () Unit!8446)

(declare-fun choose!72 (array!6192 array!6192 (_ BitVec 32) (_ BitVec 32)) Unit!8446)

(assert (=> d!43633 (= lt!211379 (choose!72 (_2!6233 lt!210692) (_2!6233 lt!210695) #b00000000000000000000000000000000 to!404))))

(assert (=> d!43633 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 to!404) (bvsle to!404 (size!2804 (_2!6233 lt!210692))))))

(assert (=> d!43633 (= (arrayRangesEqSymmetricLemma!20 (_2!6233 lt!210692) (_2!6233 lt!210695) #b00000000000000000000000000000000 to!404) lt!211379)))

(declare-fun bs!10646 () Bool)

(assert (= bs!10646 d!43633))

(assert (=> bs!10646 m!207185))

(declare-fun m!207823 () Bool)

(assert (=> bs!10646 m!207823))

(assert (=> b!135701 d!43633))

(declare-fun d!43635 () Bool)

(declare-datatypes ((tuple2!11848 0))(
  ( (tuple2!11849 (_1!6243 (_ BitVec 8)) (_2!6243 BitStream!4872)) )
))
(declare-fun lt!211382 () tuple2!11848)

(declare-fun readByte!0 (BitStream!4872) tuple2!11848)

(assert (=> d!43635 (= lt!211382 (readByte!0 (_1!6232 lt!210696)))))

(assert (=> d!43635 (= (readBytePure!0 (_1!6232 lt!210696)) (tuple2!11831 (_2!6243 lt!211382) (_1!6243 lt!211382)))))

(declare-fun bs!10647 () Bool)

(assert (= bs!10647 d!43635))

(declare-fun m!207825 () Bool)

(assert (=> bs!10647 m!207825))

(assert (=> b!135700 d!43635))

(declare-fun b!135992 () Bool)

(declare-fun e!90287 () Unit!8446)

(declare-fun lt!211392 () Unit!8446)

(assert (=> b!135992 (= e!90287 lt!211392)))

(declare-fun lt!211385 () (_ BitVec 64))

(assert (=> b!135992 (= lt!211385 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!211391 () (_ BitVec 64))

(assert (=> b!135992 (= lt!211391 (bitIndex!0 (size!2804 (buf!3197 thiss!1634)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634)))))

(assert (=> b!135992 (= lt!211392 (arrayBitRangesEqSymmetric!0 (buf!3197 thiss!1634) (buf!3197 (_2!6230 lt!210687)) lt!211385 lt!211391))))

(assert (=> b!135992 (arrayBitRangesEq!0 (buf!3197 (_2!6230 lt!210687)) (buf!3197 thiss!1634) lt!211385 lt!211391)))

(declare-fun b!135993 () Bool)

(declare-fun res!113150 () Bool)

(declare-fun e!90288 () Bool)

(assert (=> b!135993 (=> (not res!113150) (not e!90288))))

(declare-fun lt!211387 () tuple2!11832)

(assert (=> b!135993 (= res!113150 (isPrefixOf!0 (_2!6232 lt!211387) (_2!6230 lt!210687)))))

(declare-fun b!135994 () Bool)

(declare-fun res!113149 () Bool)

(assert (=> b!135994 (=> (not res!113149) (not e!90288))))

(assert (=> b!135994 (= res!113149 (isPrefixOf!0 (_1!6232 lt!211387) thiss!1634))))

(declare-fun b!135995 () Bool)

(declare-fun Unit!8457 () Unit!8446)

(assert (=> b!135995 (= e!90287 Unit!8457)))

(declare-fun d!43637 () Bool)

(assert (=> d!43637 e!90288))

(declare-fun res!113151 () Bool)

(assert (=> d!43637 (=> (not res!113151) (not e!90288))))

(assert (=> d!43637 (= res!113151 (isPrefixOf!0 (_1!6232 lt!211387) (_2!6232 lt!211387)))))

(declare-fun lt!211398 () BitStream!4872)

(assert (=> d!43637 (= lt!211387 (tuple2!11833 lt!211398 (_2!6230 lt!210687)))))

(declare-fun lt!211401 () Unit!8446)

(declare-fun lt!211402 () Unit!8446)

(assert (=> d!43637 (= lt!211401 lt!211402)))

(assert (=> d!43637 (isPrefixOf!0 lt!211398 (_2!6230 lt!210687))))

(assert (=> d!43637 (= lt!211402 (lemmaIsPrefixTransitive!0 lt!211398 (_2!6230 lt!210687) (_2!6230 lt!210687)))))

(declare-fun lt!211389 () Unit!8446)

(declare-fun lt!211394 () Unit!8446)

(assert (=> d!43637 (= lt!211389 lt!211394)))

(assert (=> d!43637 (isPrefixOf!0 lt!211398 (_2!6230 lt!210687))))

(assert (=> d!43637 (= lt!211394 (lemmaIsPrefixTransitive!0 lt!211398 thiss!1634 (_2!6230 lt!210687)))))

(declare-fun lt!211383 () Unit!8446)

(assert (=> d!43637 (= lt!211383 e!90287)))

(declare-fun c!7692 () Bool)

(assert (=> d!43637 (= c!7692 (not (= (size!2804 (buf!3197 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!211396 () Unit!8446)

(declare-fun lt!211384 () Unit!8446)

(assert (=> d!43637 (= lt!211396 lt!211384)))

(assert (=> d!43637 (isPrefixOf!0 (_2!6230 lt!210687) (_2!6230 lt!210687))))

(assert (=> d!43637 (= lt!211384 (lemmaIsPrefixRefl!0 (_2!6230 lt!210687)))))

(declare-fun lt!211397 () Unit!8446)

(declare-fun lt!211395 () Unit!8446)

(assert (=> d!43637 (= lt!211397 lt!211395)))

(assert (=> d!43637 (= lt!211395 (lemmaIsPrefixRefl!0 (_2!6230 lt!210687)))))

(declare-fun lt!211393 () Unit!8446)

(declare-fun lt!211400 () Unit!8446)

(assert (=> d!43637 (= lt!211393 lt!211400)))

(assert (=> d!43637 (isPrefixOf!0 lt!211398 lt!211398)))

(assert (=> d!43637 (= lt!211400 (lemmaIsPrefixRefl!0 lt!211398))))

(declare-fun lt!211390 () Unit!8446)

(declare-fun lt!211399 () Unit!8446)

(assert (=> d!43637 (= lt!211390 lt!211399)))

(assert (=> d!43637 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!43637 (= lt!211399 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!43637 (= lt!211398 (BitStream!4873 (buf!3197 (_2!6230 lt!210687)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634)))))

(assert (=> d!43637 (isPrefixOf!0 thiss!1634 (_2!6230 lt!210687))))

(assert (=> d!43637 (= (reader!0 thiss!1634 (_2!6230 lt!210687)) lt!211387)))

(declare-fun b!135996 () Bool)

(declare-fun lt!211388 () (_ BitVec 64))

(declare-fun lt!211386 () (_ BitVec 64))

(assert (=> b!135996 (= e!90288 (= (_1!6232 lt!211387) (withMovedBitIndex!0 (_2!6232 lt!211387) (bvsub lt!211386 lt!211388))))))

(assert (=> b!135996 (or (= (bvand lt!211386 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!211388 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!211386 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!211386 lt!211388) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!135996 (= lt!211388 (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!210687))) (currentByte!5994 (_2!6230 lt!210687)) (currentBit!5989 (_2!6230 lt!210687))))))

(assert (=> b!135996 (= lt!211386 (bitIndex!0 (size!2804 (buf!3197 thiss!1634)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634)))))

(assert (= (and d!43637 c!7692) b!135992))

(assert (= (and d!43637 (not c!7692)) b!135995))

(assert (= (and d!43637 res!113151) b!135994))

(assert (= (and b!135994 res!113149) b!135993))

(assert (= (and b!135993 res!113150) b!135996))

(declare-fun m!207827 () Bool)

(assert (=> b!135993 m!207827))

(declare-fun m!207829 () Bool)

(assert (=> d!43637 m!207829))

(declare-fun m!207831 () Bool)

(assert (=> d!43637 m!207831))

(assert (=> d!43637 m!207791))

(declare-fun m!207833 () Bool)

(assert (=> d!43637 m!207833))

(declare-fun m!207835 () Bool)

(assert (=> d!43637 m!207835))

(declare-fun m!207837 () Bool)

(assert (=> d!43637 m!207837))

(declare-fun m!207839 () Bool)

(assert (=> d!43637 m!207839))

(assert (=> d!43637 m!207801))

(assert (=> d!43637 m!207205))

(declare-fun m!207841 () Bool)

(assert (=> d!43637 m!207841))

(declare-fun m!207843 () Bool)

(assert (=> d!43637 m!207843))

(assert (=> b!135992 m!207197))

(declare-fun m!207845 () Bool)

(assert (=> b!135992 m!207845))

(declare-fun m!207847 () Bool)

(assert (=> b!135992 m!207847))

(declare-fun m!207849 () Bool)

(assert (=> b!135996 m!207849))

(assert (=> b!135996 m!207195))

(assert (=> b!135996 m!207197))

(declare-fun m!207851 () Bool)

(assert (=> b!135994 m!207851))

(assert (=> b!135700 d!43637))

(declare-fun d!43639 () Bool)

(assert (=> d!43639 (= (array_inv!2593 arr!237) (bvsge (size!2804 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!26392 d!43639))

(declare-fun d!43641 () Bool)

(assert (=> d!43641 (= (inv!12 thiss!1634) (invariant!0 (currentBit!5989 thiss!1634) (currentByte!5994 thiss!1634) (size!2804 (buf!3197 thiss!1634))))))

(declare-fun bs!10648 () Bool)

(assert (= bs!10648 d!43641))

(assert (=> bs!10648 m!207179))

(assert (=> start!26392 d!43641))

(declare-fun d!43643 () Bool)

(declare-fun res!113153 () Bool)

(declare-fun e!90290 () Bool)

(assert (=> d!43643 (=> (not res!113153) (not e!90290))))

(assert (=> d!43643 (= res!113153 (= (size!2804 (buf!3197 thiss!1634)) (size!2804 (buf!3197 (_2!6230 lt!210687)))))))

(assert (=> d!43643 (= (isPrefixOf!0 thiss!1634 (_2!6230 lt!210687)) e!90290)))

(declare-fun b!135997 () Bool)

(declare-fun res!113154 () Bool)

(assert (=> b!135997 (=> (not res!113154) (not e!90290))))

(assert (=> b!135997 (= res!113154 (bvsle (bitIndex!0 (size!2804 (buf!3197 thiss!1634)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634)) (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!210687))) (currentByte!5994 (_2!6230 lt!210687)) (currentBit!5989 (_2!6230 lt!210687)))))))

(declare-fun b!135998 () Bool)

(declare-fun e!90289 () Bool)

(assert (=> b!135998 (= e!90290 e!90289)))

(declare-fun res!113152 () Bool)

(assert (=> b!135998 (=> res!113152 e!90289)))

(assert (=> b!135998 (= res!113152 (= (size!2804 (buf!3197 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!135999 () Bool)

(assert (=> b!135999 (= e!90289 (arrayBitRangesEq!0 (buf!3197 thiss!1634) (buf!3197 (_2!6230 lt!210687)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2804 (buf!3197 thiss!1634)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634))))))

(assert (= (and d!43643 res!113153) b!135997))

(assert (= (and b!135997 res!113154) b!135998))

(assert (= (and b!135998 (not res!113152)) b!135999))

(assert (=> b!135997 m!207197))

(assert (=> b!135997 m!207195))

(assert (=> b!135999 m!207197))

(assert (=> b!135999 m!207197))

(declare-fun m!207853 () Bool)

(assert (=> b!135999 m!207853))

(assert (=> b!135710 d!43643))

(declare-fun d!43645 () Bool)

(declare-fun e!90291 () Bool)

(assert (=> d!43645 e!90291))

(declare-fun res!113155 () Bool)

(assert (=> d!43645 (=> (not res!113155) (not e!90291))))

(declare-fun lt!211404 () (_ BitVec 64))

(declare-fun lt!211406 () (_ BitVec 64))

(declare-fun lt!211408 () (_ BitVec 64))

(assert (=> d!43645 (= res!113155 (= lt!211408 (bvsub lt!211406 lt!211404)))))

(assert (=> d!43645 (or (= (bvand lt!211406 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!211404 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!211406 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!211406 lt!211404) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!43645 (= lt!211404 (remainingBits!0 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!210693)))) ((_ sign_extend 32) (currentByte!5994 (_2!6230 lt!210693))) ((_ sign_extend 32) (currentBit!5989 (_2!6230 lt!210693)))))))

(declare-fun lt!211403 () (_ BitVec 64))

(declare-fun lt!211405 () (_ BitVec 64))

(assert (=> d!43645 (= lt!211406 (bvmul lt!211403 lt!211405))))

(assert (=> d!43645 (or (= lt!211403 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!211405 (bvsdiv (bvmul lt!211403 lt!211405) lt!211403)))))

(assert (=> d!43645 (= lt!211405 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!43645 (= lt!211403 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!210693)))))))

(assert (=> d!43645 (= lt!211408 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5994 (_2!6230 lt!210693))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5989 (_2!6230 lt!210693)))))))

(assert (=> d!43645 (invariant!0 (currentBit!5989 (_2!6230 lt!210693)) (currentByte!5994 (_2!6230 lt!210693)) (size!2804 (buf!3197 (_2!6230 lt!210693))))))

(assert (=> d!43645 (= (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!210693))) (currentByte!5994 (_2!6230 lt!210693)) (currentBit!5989 (_2!6230 lt!210693))) lt!211408)))

(declare-fun b!136000 () Bool)

(declare-fun res!113156 () Bool)

(assert (=> b!136000 (=> (not res!113156) (not e!90291))))

(assert (=> b!136000 (= res!113156 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!211408))))

(declare-fun b!136001 () Bool)

(declare-fun lt!211407 () (_ BitVec 64))

(assert (=> b!136001 (= e!90291 (bvsle lt!211408 (bvmul lt!211407 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!136001 (or (= lt!211407 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!211407 #b0000000000000000000000000000000000000000000000000000000000001000) lt!211407)))))

(assert (=> b!136001 (= lt!211407 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!210693)))))))

(assert (= (and d!43645 res!113155) b!136000))

(assert (= (and b!136000 res!113156) b!136001))

(declare-fun m!207855 () Bool)

(assert (=> d!43645 m!207855))

(declare-fun m!207857 () Bool)

(assert (=> d!43645 m!207857))

(assert (=> b!135704 d!43645))

(assert (=> b!135704 d!43609))

(declare-fun d!43647 () Bool)

(assert (=> d!43647 (= (array_inv!2593 (buf!3197 thiss!1634)) (bvsge (size!2804 (buf!3197 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!135703 d!43647))

(declare-fun d!43649 () Bool)

(declare-fun res!113157 () Bool)

(declare-fun e!90292 () Bool)

(assert (=> d!43649 (=> res!113157 e!90292)))

(assert (=> d!43649 (= res!113157 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!43649 (= (arrayRangesEq!207 arr!237 (_2!6233 lt!210707) #b00000000000000000000000000000000 to!404) e!90292)))

(declare-fun b!136002 () Bool)

(declare-fun e!90293 () Bool)

(assert (=> b!136002 (= e!90292 e!90293)))

(declare-fun res!113158 () Bool)

(assert (=> b!136002 (=> (not res!113158) (not e!90293))))

(assert (=> b!136002 (= res!113158 (= (select (arr!3469 arr!237) #b00000000000000000000000000000000) (select (arr!3469 (_2!6233 lt!210707)) #b00000000000000000000000000000000)))))

(declare-fun b!136003 () Bool)

(assert (=> b!136003 (= e!90293 (arrayRangesEq!207 arr!237 (_2!6233 lt!210707) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!43649 (not res!113157)) b!136002))

(assert (= (and b!136002 res!113158) b!136003))

(assert (=> b!136002 m!207811))

(declare-fun m!207859 () Bool)

(assert (=> b!136002 m!207859))

(declare-fun m!207861 () Bool)

(assert (=> b!136003 m!207861))

(assert (=> b!135702 d!43649))

(declare-fun d!43651 () Bool)

(assert (=> d!43651 (= (invariant!0 (currentBit!5989 thiss!1634) (currentByte!5994 thiss!1634) (size!2804 (buf!3197 (_2!6230 lt!210687)))) (and (bvsge (currentBit!5989 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5989 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5994 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5994 thiss!1634) (size!2804 (buf!3197 (_2!6230 lt!210687)))) (and (= (currentBit!5989 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5994 thiss!1634) (size!2804 (buf!3197 (_2!6230 lt!210687))))))))))

(assert (=> b!135696 d!43651))

(declare-fun d!43653 () Bool)

(declare-fun lt!211409 () tuple2!11848)

(assert (=> d!43653 (= lt!211409 (readByte!0 lt!210689))))

(assert (=> d!43653 (= (readBytePure!0 lt!210689) (tuple2!11831 (_2!6243 lt!211409) (_1!6243 lt!211409)))))

(declare-fun bs!10649 () Bool)

(assert (= bs!10649 d!43653))

(declare-fun m!207863 () Bool)

(assert (=> bs!10649 m!207863))

(assert (=> b!135705 d!43653))

(declare-fun b!136004 () Bool)

(declare-fun e!90294 () Unit!8446)

(declare-fun lt!211419 () Unit!8446)

(assert (=> b!136004 (= e!90294 lt!211419)))

(declare-fun lt!211412 () (_ BitVec 64))

(assert (=> b!136004 (= lt!211412 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!211418 () (_ BitVec 64))

(assert (=> b!136004 (= lt!211418 (bitIndex!0 (size!2804 (buf!3197 thiss!1634)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634)))))

(assert (=> b!136004 (= lt!211419 (arrayBitRangesEqSymmetric!0 (buf!3197 thiss!1634) (buf!3197 (_2!6230 lt!210693)) lt!211412 lt!211418))))

(assert (=> b!136004 (arrayBitRangesEq!0 (buf!3197 (_2!6230 lt!210693)) (buf!3197 thiss!1634) lt!211412 lt!211418)))

(declare-fun b!136005 () Bool)

(declare-fun res!113160 () Bool)

(declare-fun e!90295 () Bool)

(assert (=> b!136005 (=> (not res!113160) (not e!90295))))

(declare-fun lt!211414 () tuple2!11832)

(assert (=> b!136005 (= res!113160 (isPrefixOf!0 (_2!6232 lt!211414) (_2!6230 lt!210693)))))

(declare-fun b!136006 () Bool)

(declare-fun res!113159 () Bool)

(assert (=> b!136006 (=> (not res!113159) (not e!90295))))

(assert (=> b!136006 (= res!113159 (isPrefixOf!0 (_1!6232 lt!211414) thiss!1634))))

(declare-fun b!136007 () Bool)

(declare-fun Unit!8458 () Unit!8446)

(assert (=> b!136007 (= e!90294 Unit!8458)))

(declare-fun d!43655 () Bool)

(assert (=> d!43655 e!90295))

(declare-fun res!113161 () Bool)

(assert (=> d!43655 (=> (not res!113161) (not e!90295))))

(assert (=> d!43655 (= res!113161 (isPrefixOf!0 (_1!6232 lt!211414) (_2!6232 lt!211414)))))

(declare-fun lt!211425 () BitStream!4872)

(assert (=> d!43655 (= lt!211414 (tuple2!11833 lt!211425 (_2!6230 lt!210693)))))

(declare-fun lt!211428 () Unit!8446)

(declare-fun lt!211429 () Unit!8446)

(assert (=> d!43655 (= lt!211428 lt!211429)))

(assert (=> d!43655 (isPrefixOf!0 lt!211425 (_2!6230 lt!210693))))

(assert (=> d!43655 (= lt!211429 (lemmaIsPrefixTransitive!0 lt!211425 (_2!6230 lt!210693) (_2!6230 lt!210693)))))

(declare-fun lt!211416 () Unit!8446)

(declare-fun lt!211421 () Unit!8446)

(assert (=> d!43655 (= lt!211416 lt!211421)))

(assert (=> d!43655 (isPrefixOf!0 lt!211425 (_2!6230 lt!210693))))

(assert (=> d!43655 (= lt!211421 (lemmaIsPrefixTransitive!0 lt!211425 thiss!1634 (_2!6230 lt!210693)))))

(declare-fun lt!211410 () Unit!8446)

(assert (=> d!43655 (= lt!211410 e!90294)))

(declare-fun c!7693 () Bool)

(assert (=> d!43655 (= c!7693 (not (= (size!2804 (buf!3197 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!211423 () Unit!8446)

(declare-fun lt!211411 () Unit!8446)

(assert (=> d!43655 (= lt!211423 lt!211411)))

(assert (=> d!43655 (isPrefixOf!0 (_2!6230 lt!210693) (_2!6230 lt!210693))))

(assert (=> d!43655 (= lt!211411 (lemmaIsPrefixRefl!0 (_2!6230 lt!210693)))))

(declare-fun lt!211424 () Unit!8446)

(declare-fun lt!211422 () Unit!8446)

(assert (=> d!43655 (= lt!211424 lt!211422)))

(assert (=> d!43655 (= lt!211422 (lemmaIsPrefixRefl!0 (_2!6230 lt!210693)))))

(declare-fun lt!211420 () Unit!8446)

(declare-fun lt!211427 () Unit!8446)

(assert (=> d!43655 (= lt!211420 lt!211427)))

(assert (=> d!43655 (isPrefixOf!0 lt!211425 lt!211425)))

(assert (=> d!43655 (= lt!211427 (lemmaIsPrefixRefl!0 lt!211425))))

(declare-fun lt!211417 () Unit!8446)

(declare-fun lt!211426 () Unit!8446)

(assert (=> d!43655 (= lt!211417 lt!211426)))

(assert (=> d!43655 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!43655 (= lt!211426 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!43655 (= lt!211425 (BitStream!4873 (buf!3197 (_2!6230 lt!210693)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634)))))

(assert (=> d!43655 (isPrefixOf!0 thiss!1634 (_2!6230 lt!210693))))

(assert (=> d!43655 (= (reader!0 thiss!1634 (_2!6230 lt!210693)) lt!211414)))

(declare-fun lt!211413 () (_ BitVec 64))

(declare-fun lt!211415 () (_ BitVec 64))

(declare-fun b!136008 () Bool)

(assert (=> b!136008 (= e!90295 (= (_1!6232 lt!211414) (withMovedBitIndex!0 (_2!6232 lt!211414) (bvsub lt!211413 lt!211415))))))

(assert (=> b!136008 (or (= (bvand lt!211413 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!211415 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!211413 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!211413 lt!211415) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!136008 (= lt!211415 (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!210693))) (currentByte!5994 (_2!6230 lt!210693)) (currentBit!5989 (_2!6230 lt!210693))))))

(assert (=> b!136008 (= lt!211413 (bitIndex!0 (size!2804 (buf!3197 thiss!1634)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634)))))

(assert (= (and d!43655 c!7693) b!136004))

(assert (= (and d!43655 (not c!7693)) b!136007))

(assert (= (and d!43655 res!113161) b!136006))

(assert (= (and b!136006 res!113159) b!136005))

(assert (= (and b!136005 res!113160) b!136008))

(declare-fun m!207865 () Bool)

(assert (=> b!136005 m!207865))

(declare-fun m!207867 () Bool)

(assert (=> d!43655 m!207867))

(declare-fun m!207869 () Bool)

(assert (=> d!43655 m!207869))

(assert (=> d!43655 m!207787))

(declare-fun m!207871 () Bool)

(assert (=> d!43655 m!207871))

(assert (=> d!43655 m!207835))

(declare-fun m!207873 () Bool)

(assert (=> d!43655 m!207873))

(declare-fun m!207875 () Bool)

(assert (=> d!43655 m!207875))

(assert (=> d!43655 m!207797))

(assert (=> d!43655 m!207247))

(declare-fun m!207877 () Bool)

(assert (=> d!43655 m!207877))

(assert (=> d!43655 m!207843))

(assert (=> b!136004 m!207197))

(declare-fun m!207879 () Bool)

(assert (=> b!136004 m!207879))

(declare-fun m!207881 () Bool)

(assert (=> b!136004 m!207881))

(declare-fun m!207883 () Bool)

(assert (=> b!136008 m!207883))

(assert (=> b!136008 m!207203))

(assert (=> b!136008 m!207197))

(declare-fun m!207885 () Bool)

(assert (=> b!136006 m!207885))

(assert (=> b!135705 d!43655))

(declare-fun d!43657 () Bool)

(declare-fun res!113163 () Bool)

(declare-fun e!90297 () Bool)

(assert (=> d!43657 (=> (not res!113163) (not e!90297))))

(assert (=> d!43657 (= res!113163 (= (size!2804 (buf!3197 thiss!1634)) (size!2804 (buf!3197 (_2!6230 lt!210693)))))))

(assert (=> d!43657 (= (isPrefixOf!0 thiss!1634 (_2!6230 lt!210693)) e!90297)))

(declare-fun b!136009 () Bool)

(declare-fun res!113164 () Bool)

(assert (=> b!136009 (=> (not res!113164) (not e!90297))))

(assert (=> b!136009 (= res!113164 (bvsle (bitIndex!0 (size!2804 (buf!3197 thiss!1634)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634)) (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!210693))) (currentByte!5994 (_2!6230 lt!210693)) (currentBit!5989 (_2!6230 lt!210693)))))))

(declare-fun b!136010 () Bool)

(declare-fun e!90296 () Bool)

(assert (=> b!136010 (= e!90297 e!90296)))

(declare-fun res!113162 () Bool)

(assert (=> b!136010 (=> res!113162 e!90296)))

(assert (=> b!136010 (= res!113162 (= (size!2804 (buf!3197 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!136011 () Bool)

(assert (=> b!136011 (= e!90296 (arrayBitRangesEq!0 (buf!3197 thiss!1634) (buf!3197 (_2!6230 lt!210693)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2804 (buf!3197 thiss!1634)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634))))))

(assert (= (and d!43657 res!113163) b!136009))

(assert (= (and b!136009 res!113164) b!136010))

(assert (= (and b!136010 (not res!113162)) b!136011))

(assert (=> b!136009 m!207197))

(assert (=> b!136009 m!207203))

(assert (=> b!136011 m!207197))

(assert (=> b!136011 m!207197))

(declare-fun m!207887 () Bool)

(assert (=> b!136011 m!207887))

(assert (=> b!135705 d!43657))

(declare-fun d!43659 () Bool)

(declare-fun lt!211438 () tuple2!11834)

(declare-fun lt!211440 () tuple2!11834)

(assert (=> d!43659 (arrayRangesEq!207 (_2!6233 lt!211438) (_2!6233 lt!211440) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!211441 () Unit!8446)

(declare-fun lt!211439 () BitStream!4872)

(declare-fun choose!35 (BitStream!4872 array!6192 (_ BitVec 32) (_ BitVec 32) tuple2!11834 array!6192 BitStream!4872 tuple2!11834 array!6192) Unit!8446)

(assert (=> d!43659 (= lt!211441 (choose!35 (_1!6232 lt!210690) arr!237 from!447 to!404 lt!211438 (_2!6233 lt!211438) lt!211439 lt!211440 (_2!6233 lt!211440)))))

(assert (=> d!43659 (= lt!211440 (readByteArrayLoopPure!0 lt!211439 (array!6193 (store (arr!3469 arr!237) from!447 (_2!6231 (readBytePure!0 (_1!6232 lt!210690)))) (size!2804 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!43659 (= lt!211439 (withMovedByteIndex!0 (_1!6232 lt!210690) #b00000000000000000000000000000001))))

(assert (=> d!43659 (= lt!211438 (readByteArrayLoopPure!0 (_1!6232 lt!210690) arr!237 from!447 to!404))))

(assert (=> d!43659 (= (readByteArrayLoopArrayPrefixLemma!0 (_1!6232 lt!210690) arr!237 from!447 to!404) lt!211441)))

(declare-fun bs!10651 () Bool)

(assert (= bs!10651 d!43659))

(assert (=> bs!10651 m!207235))

(declare-fun m!207889 () Bool)

(assert (=> bs!10651 m!207889))

(assert (=> bs!10651 m!207239))

(assert (=> bs!10651 m!207245))

(declare-fun m!207891 () Bool)

(assert (=> bs!10651 m!207891))

(declare-fun m!207893 () Bool)

(assert (=> bs!10651 m!207893))

(declare-fun m!207895 () Bool)

(assert (=> bs!10651 m!207895))

(assert (=> b!135705 d!43659))

(declare-fun d!43661 () Bool)

(declare-fun lt!211442 () tuple2!11848)

(assert (=> d!43661 (= lt!211442 (readByte!0 (BitStream!4873 (buf!3197 (_2!6230 lt!210693)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634))))))

(assert (=> d!43661 (= (readBytePure!0 (BitStream!4873 (buf!3197 (_2!6230 lt!210693)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634))) (tuple2!11831 (_2!6243 lt!211442) (_1!6243 lt!211442)))))

(declare-fun bs!10652 () Bool)

(assert (= bs!10652 d!43661))

(declare-fun m!207897 () Bool)

(assert (=> bs!10652 m!207897))

(assert (=> b!135705 d!43661))

(declare-fun d!43663 () Bool)

(declare-fun res!113165 () Bool)

(declare-fun e!90298 () Bool)

(assert (=> d!43663 (=> res!113165 e!90298)))

(assert (=> d!43663 (= res!113165 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!43663 (= (arrayRangesEq!207 (_2!6233 lt!210692) (_2!6233 lt!210695) #b00000000000000000000000000000000 to!404) e!90298)))

(declare-fun b!136012 () Bool)

(declare-fun e!90299 () Bool)

(assert (=> b!136012 (= e!90298 e!90299)))

(declare-fun res!113166 () Bool)

(assert (=> b!136012 (=> (not res!113166) (not e!90299))))

(assert (=> b!136012 (= res!113166 (= (select (arr!3469 (_2!6233 lt!210692)) #b00000000000000000000000000000000) (select (arr!3469 (_2!6233 lt!210695)) #b00000000000000000000000000000000)))))

(declare-fun b!136013 () Bool)

(assert (=> b!136013 (= e!90299 (arrayRangesEq!207 (_2!6233 lt!210692) (_2!6233 lt!210695) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!43663 (not res!113165)) b!136012))

(assert (= (and b!136012 res!113166) b!136013))

(assert (=> b!136012 m!207813))

(assert (=> b!136012 m!207819))

(declare-fun m!207899 () Bool)

(assert (=> b!136013 m!207899))

(assert (=> b!135705 d!43663))

(declare-fun d!43665 () Bool)

(assert (=> d!43665 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!210693)))) ((_ sign_extend 32) (currentByte!5994 (_2!6230 lt!210687))) ((_ sign_extend 32) (currentBit!5989 (_2!6230 lt!210687))) lt!210712)))

(declare-fun lt!211445 () Unit!8446)

(declare-fun choose!26 (BitStream!4872 array!6192 (_ BitVec 32) BitStream!4872) Unit!8446)

(assert (=> d!43665 (= lt!211445 (choose!26 (_2!6230 lt!210687) (buf!3197 (_2!6230 lt!210693)) lt!210712 (BitStream!4873 (buf!3197 (_2!6230 lt!210693)) (currentByte!5994 (_2!6230 lt!210687)) (currentBit!5989 (_2!6230 lt!210687)))))))

(assert (=> d!43665 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6230 lt!210687) (buf!3197 (_2!6230 lt!210693)) lt!210712) lt!211445)))

(declare-fun bs!10653 () Bool)

(assert (= bs!10653 d!43665))

(assert (=> bs!10653 m!207211))

(declare-fun m!207901 () Bool)

(assert (=> bs!10653 m!207901))

(assert (=> b!135705 d!43665))

(declare-fun d!43667 () Bool)

(assert (=> d!43667 (isPrefixOf!0 thiss!1634 (_2!6230 lt!210693))))

(declare-fun lt!211448 () Unit!8446)

(declare-fun choose!30 (BitStream!4872 BitStream!4872 BitStream!4872) Unit!8446)

(assert (=> d!43667 (= lt!211448 (choose!30 thiss!1634 (_2!6230 lt!210687) (_2!6230 lt!210693)))))

(assert (=> d!43667 (isPrefixOf!0 thiss!1634 (_2!6230 lt!210687))))

(assert (=> d!43667 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6230 lt!210687) (_2!6230 lt!210693)) lt!211448)))

(declare-fun bs!10654 () Bool)

(assert (= bs!10654 d!43667))

(assert (=> bs!10654 m!207247))

(declare-fun m!207903 () Bool)

(assert (=> bs!10654 m!207903))

(assert (=> bs!10654 m!207205))

(assert (=> b!135705 d!43667))

(declare-fun d!43669 () Bool)

(declare-fun e!90300 () Bool)

(assert (=> d!43669 e!90300))

(declare-fun res!113167 () Bool)

(assert (=> d!43669 (=> (not res!113167) (not e!90300))))

(declare-fun lt!211450 () (_ BitVec 64))

(declare-fun lt!211454 () (_ BitVec 64))

(declare-fun lt!211452 () (_ BitVec 64))

(assert (=> d!43669 (= res!113167 (= lt!211454 (bvsub lt!211452 lt!211450)))))

(assert (=> d!43669 (or (= (bvand lt!211452 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!211450 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!211452 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!211452 lt!211450) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!43669 (= lt!211450 (remainingBits!0 ((_ sign_extend 32) (size!2804 (buf!3197 (_1!6231 lt!210704)))) ((_ sign_extend 32) (currentByte!5994 (_1!6231 lt!210704))) ((_ sign_extend 32) (currentBit!5989 (_1!6231 lt!210704)))))))

(declare-fun lt!211449 () (_ BitVec 64))

(declare-fun lt!211451 () (_ BitVec 64))

(assert (=> d!43669 (= lt!211452 (bvmul lt!211449 lt!211451))))

(assert (=> d!43669 (or (= lt!211449 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!211451 (bvsdiv (bvmul lt!211449 lt!211451) lt!211449)))))

(assert (=> d!43669 (= lt!211451 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!43669 (= lt!211449 ((_ sign_extend 32) (size!2804 (buf!3197 (_1!6231 lt!210704)))))))

(assert (=> d!43669 (= lt!211454 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5994 (_1!6231 lt!210704))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5989 (_1!6231 lt!210704)))))))

(assert (=> d!43669 (invariant!0 (currentBit!5989 (_1!6231 lt!210704)) (currentByte!5994 (_1!6231 lt!210704)) (size!2804 (buf!3197 (_1!6231 lt!210704))))))

(assert (=> d!43669 (= (bitIndex!0 (size!2804 (buf!3197 (_1!6231 lt!210704))) (currentByte!5994 (_1!6231 lt!210704)) (currentBit!5989 (_1!6231 lt!210704))) lt!211454)))

(declare-fun b!136014 () Bool)

(declare-fun res!113168 () Bool)

(assert (=> b!136014 (=> (not res!113168) (not e!90300))))

(assert (=> b!136014 (= res!113168 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!211454))))

(declare-fun b!136015 () Bool)

(declare-fun lt!211453 () (_ BitVec 64))

(assert (=> b!136015 (= e!90300 (bvsle lt!211454 (bvmul lt!211453 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!136015 (or (= lt!211453 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!211453 #b0000000000000000000000000000000000000000000000000000000000001000) lt!211453)))))

(assert (=> b!136015 (= lt!211453 ((_ sign_extend 32) (size!2804 (buf!3197 (_1!6231 lt!210704)))))))

(assert (= (and d!43669 res!113167) b!136014))

(assert (= (and b!136014 res!113168) b!136015))

(declare-fun m!207905 () Bool)

(assert (=> d!43669 m!207905))

(declare-fun m!207907 () Bool)

(assert (=> d!43669 m!207907))

(assert (=> b!135705 d!43669))

(declare-fun d!43671 () Bool)

(declare-fun e!90303 () Bool)

(assert (=> d!43671 e!90303))

(declare-fun res!113177 () Bool)

(assert (=> d!43671 (=> (not res!113177) (not e!90303))))

(declare-fun lt!211466 () tuple2!11828)

(assert (=> d!43671 (= res!113177 (= (size!2804 (buf!3197 thiss!1634)) (size!2804 (buf!3197 (_2!6230 lt!211466)))))))

(declare-fun choose!6 (BitStream!4872 (_ BitVec 8)) tuple2!11828)

(assert (=> d!43671 (= lt!211466 (choose!6 thiss!1634 (select (arr!3469 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!43671 (validate_offset_byte!0 ((_ sign_extend 32) (size!2804 (buf!3197 thiss!1634))) ((_ sign_extend 32) (currentByte!5994 thiss!1634)) ((_ sign_extend 32) (currentBit!5989 thiss!1634)))))

(assert (=> d!43671 (= (appendByte!0 thiss!1634 (select (arr!3469 arr!237) from!447)) lt!211466)))

(declare-fun b!136022 () Bool)

(declare-fun res!113176 () Bool)

(assert (=> b!136022 (=> (not res!113176) (not e!90303))))

(declare-fun lt!211468 () (_ BitVec 64))

(declare-fun lt!211467 () (_ BitVec 64))

(assert (=> b!136022 (= res!113176 (= (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!211466))) (currentByte!5994 (_2!6230 lt!211466)) (currentBit!5989 (_2!6230 lt!211466))) (bvadd lt!211467 lt!211468)))))

(assert (=> b!136022 (or (not (= (bvand lt!211467 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!211468 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!211467 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!211467 lt!211468) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!136022 (= lt!211468 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!136022 (= lt!211467 (bitIndex!0 (size!2804 (buf!3197 thiss!1634)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634)))))

(declare-fun b!136023 () Bool)

(declare-fun res!113175 () Bool)

(assert (=> b!136023 (=> (not res!113175) (not e!90303))))

(assert (=> b!136023 (= res!113175 (isPrefixOf!0 thiss!1634 (_2!6230 lt!211466)))))

(declare-fun b!136024 () Bool)

(declare-fun lt!211469 () tuple2!11832)

(declare-fun lt!211465 () tuple2!11830)

(assert (=> b!136024 (= e!90303 (and (= (_2!6231 lt!211465) (select (arr!3469 arr!237) from!447)) (= (_1!6231 lt!211465) (_2!6232 lt!211469))))))

(assert (=> b!136024 (= lt!211465 (readBytePure!0 (_1!6232 lt!211469)))))

(assert (=> b!136024 (= lt!211469 (reader!0 thiss!1634 (_2!6230 lt!211466)))))

(assert (= (and d!43671 res!113177) b!136022))

(assert (= (and b!136022 res!113176) b!136023))

(assert (= (and b!136023 res!113175) b!136024))

(assert (=> d!43671 m!207165))

(declare-fun m!207909 () Bool)

(assert (=> d!43671 m!207909))

(declare-fun m!207911 () Bool)

(assert (=> d!43671 m!207911))

(declare-fun m!207913 () Bool)

(assert (=> b!136022 m!207913))

(assert (=> b!136022 m!207197))

(declare-fun m!207915 () Bool)

(assert (=> b!136023 m!207915))

(declare-fun m!207917 () Bool)

(assert (=> b!136024 m!207917))

(declare-fun m!207919 () Bool)

(assert (=> b!136024 m!207919))

(assert (=> b!135705 d!43671))

(declare-fun d!43673 () Bool)

(declare-fun lt!211470 () tuple3!518)

(assert (=> d!43673 (= lt!211470 (readByteArrayLoop!0 (_1!6232 lt!210688) lt!210686 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!43673 (= (readByteArrayLoopPure!0 (_1!6232 lt!210688) lt!210686 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11835 (_2!6242 lt!211470) (_3!318 lt!211470)))))

(declare-fun bs!10655 () Bool)

(assert (= bs!10655 d!43673))

(declare-fun m!207921 () Bool)

(assert (=> bs!10655 m!207921))

(assert (=> b!135705 d!43673))

(declare-fun d!43675 () Bool)

(declare-fun lt!211471 () tuple3!518)

(assert (=> d!43675 (= lt!211471 (readByteArrayLoop!0 (_1!6232 lt!210690) arr!237 from!447 to!404))))

(assert (=> d!43675 (= (readByteArrayLoopPure!0 (_1!6232 lt!210690) arr!237 from!447 to!404) (tuple2!11835 (_2!6242 lt!211471) (_3!318 lt!211471)))))

(declare-fun bs!10656 () Bool)

(assert (= bs!10656 d!43675))

(declare-fun m!207923 () Bool)

(assert (=> bs!10656 m!207923))

(assert (=> b!135705 d!43675))

(declare-fun d!43677 () Bool)

(assert (=> d!43677 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!210693)))) ((_ sign_extend 32) (currentByte!5994 thiss!1634)) ((_ sign_extend 32) (currentBit!5989 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!210693)))) ((_ sign_extend 32) (currentByte!5994 thiss!1634)) ((_ sign_extend 32) (currentBit!5989 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10657 () Bool)

(assert (= bs!10657 d!43677))

(declare-fun m!207925 () Bool)

(assert (=> bs!10657 m!207925))

(assert (=> b!135705 d!43677))

(declare-fun d!43679 () Bool)

(declare-fun res!113178 () Bool)

(declare-fun e!90304 () Bool)

(assert (=> d!43679 (=> res!113178 e!90304)))

(assert (=> d!43679 (= res!113178 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!43679 (= (arrayRangesEq!207 (_2!6233 lt!210692) (_2!6233 lt!210701) #b00000000000000000000000000000000 to!404) e!90304)))

(declare-fun b!136025 () Bool)

(declare-fun e!90305 () Bool)

(assert (=> b!136025 (= e!90304 e!90305)))

(declare-fun res!113179 () Bool)

(assert (=> b!136025 (=> (not res!113179) (not e!90305))))

(assert (=> b!136025 (= res!113179 (= (select (arr!3469 (_2!6233 lt!210692)) #b00000000000000000000000000000000) (select (arr!3469 (_2!6233 lt!210701)) #b00000000000000000000000000000000)))))

(declare-fun b!136026 () Bool)

(assert (=> b!136026 (= e!90305 (arrayRangesEq!207 (_2!6233 lt!210692) (_2!6233 lt!210701) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!43679 (not res!113178)) b!136025))

(assert (= (and b!136025 res!113179) b!136026))

(assert (=> b!136025 m!207813))

(declare-fun m!207927 () Bool)

(assert (=> b!136025 m!207927))

(declare-fun m!207929 () Bool)

(assert (=> b!136026 m!207929))

(assert (=> b!135705 d!43679))

(declare-fun d!43681 () Bool)

(assert (=> d!43681 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!210687)))) ((_ sign_extend 32) (currentByte!5994 (_2!6230 lt!210687))) ((_ sign_extend 32) (currentBit!5989 (_2!6230 lt!210687))) lt!210712) (bvsle ((_ sign_extend 32) lt!210712) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!210687)))) ((_ sign_extend 32) (currentByte!5994 (_2!6230 lt!210687))) ((_ sign_extend 32) (currentBit!5989 (_2!6230 lt!210687)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10658 () Bool)

(assert (= bs!10658 d!43681))

(assert (=> bs!10658 m!207767))

(assert (=> b!135705 d!43681))

(declare-fun d!43683 () Bool)

(declare-fun e!90306 () Bool)

(assert (=> d!43683 e!90306))

(declare-fun res!113180 () Bool)

(assert (=> d!43683 (=> (not res!113180) (not e!90306))))

(declare-fun lt!211475 () (_ BitVec 64))

(declare-fun lt!211473 () (_ BitVec 64))

(declare-fun lt!211477 () (_ BitVec 64))

(assert (=> d!43683 (= res!113180 (= lt!211477 (bvsub lt!211475 lt!211473)))))

(assert (=> d!43683 (or (= (bvand lt!211475 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!211473 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!211475 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!211475 lt!211473) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!43683 (= lt!211473 (remainingBits!0 ((_ sign_extend 32) (size!2804 (buf!3197 (_1!6231 lt!210697)))) ((_ sign_extend 32) (currentByte!5994 (_1!6231 lt!210697))) ((_ sign_extend 32) (currentBit!5989 (_1!6231 lt!210697)))))))

(declare-fun lt!211472 () (_ BitVec 64))

(declare-fun lt!211474 () (_ BitVec 64))

(assert (=> d!43683 (= lt!211475 (bvmul lt!211472 lt!211474))))

(assert (=> d!43683 (or (= lt!211472 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!211474 (bvsdiv (bvmul lt!211472 lt!211474) lt!211472)))))

(assert (=> d!43683 (= lt!211474 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!43683 (= lt!211472 ((_ sign_extend 32) (size!2804 (buf!3197 (_1!6231 lt!210697)))))))

(assert (=> d!43683 (= lt!211477 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5994 (_1!6231 lt!210697))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5989 (_1!6231 lt!210697)))))))

(assert (=> d!43683 (invariant!0 (currentBit!5989 (_1!6231 lt!210697)) (currentByte!5994 (_1!6231 lt!210697)) (size!2804 (buf!3197 (_1!6231 lt!210697))))))

(assert (=> d!43683 (= (bitIndex!0 (size!2804 (buf!3197 (_1!6231 lt!210697))) (currentByte!5994 (_1!6231 lt!210697)) (currentBit!5989 (_1!6231 lt!210697))) lt!211477)))

(declare-fun b!136027 () Bool)

(declare-fun res!113181 () Bool)

(assert (=> b!136027 (=> (not res!113181) (not e!90306))))

(assert (=> b!136027 (= res!113181 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!211477))))

(declare-fun b!136028 () Bool)

(declare-fun lt!211476 () (_ BitVec 64))

(assert (=> b!136028 (= e!90306 (bvsle lt!211477 (bvmul lt!211476 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!136028 (or (= lt!211476 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!211476 #b0000000000000000000000000000000000000000000000000000000000001000) lt!211476)))))

(assert (=> b!136028 (= lt!211476 ((_ sign_extend 32) (size!2804 (buf!3197 (_1!6231 lt!210697)))))))

(assert (= (and d!43683 res!113180) b!136027))

(assert (= (and b!136027 res!113181) b!136028))

(declare-fun m!207931 () Bool)

(assert (=> d!43683 m!207931))

(declare-fun m!207933 () Bool)

(assert (=> d!43683 m!207933))

(assert (=> b!135705 d!43683))

(declare-fun d!43685 () Bool)

(declare-fun moveByteIndex!0 (BitStream!4872 (_ BitVec 32)) tuple2!11828)

(assert (=> d!43685 (= (withMovedByteIndex!0 (_1!6232 lt!210690) #b00000000000000000000000000000001) (_2!6230 (moveByteIndex!0 (_1!6232 lt!210690) #b00000000000000000000000000000001)))))

(declare-fun bs!10659 () Bool)

(assert (= bs!10659 d!43685))

(declare-fun m!207935 () Bool)

(assert (=> bs!10659 m!207935))

(assert (=> b!135705 d!43685))

(declare-fun d!43687 () Bool)

(declare-fun lt!211478 () tuple2!11848)

(assert (=> d!43687 (= lt!211478 (readByte!0 (_1!6232 lt!210690)))))

(assert (=> d!43687 (= (readBytePure!0 (_1!6232 lt!210690)) (tuple2!11831 (_2!6243 lt!211478) (_1!6243 lt!211478)))))

(declare-fun bs!10660 () Bool)

(assert (= bs!10660 d!43687))

(declare-fun m!207937 () Bool)

(assert (=> bs!10660 m!207937))

(assert (=> b!135705 d!43687))

(declare-fun d!43689 () Bool)

(declare-fun e!90309 () Bool)

(assert (=> d!43689 e!90309))

(declare-fun res!113184 () Bool)

(assert (=> d!43689 (=> (not res!113184) (not e!90309))))

(declare-fun lt!211490 () tuple2!11830)

(declare-fun lt!211488 () tuple2!11830)

(assert (=> d!43689 (= res!113184 (= (bitIndex!0 (size!2804 (buf!3197 (_1!6231 lt!211490))) (currentByte!5994 (_1!6231 lt!211490)) (currentBit!5989 (_1!6231 lt!211490))) (bitIndex!0 (size!2804 (buf!3197 (_1!6231 lt!211488))) (currentByte!5994 (_1!6231 lt!211488)) (currentBit!5989 (_1!6231 lt!211488)))))))

(declare-fun lt!211489 () BitStream!4872)

(declare-fun lt!211487 () Unit!8446)

(declare-fun choose!14 (BitStream!4872 BitStream!4872 BitStream!4872 tuple2!11830 tuple2!11830 BitStream!4872 (_ BitVec 8) tuple2!11830 tuple2!11830 BitStream!4872 (_ BitVec 8)) Unit!8446)

(assert (=> d!43689 (= lt!211487 (choose!14 lt!210689 (_2!6230 lt!210693) lt!211489 lt!211490 (tuple2!11831 (_1!6231 lt!211490) (_2!6231 lt!211490)) (_1!6231 lt!211490) (_2!6231 lt!211490) lt!211488 (tuple2!11831 (_1!6231 lt!211488) (_2!6231 lt!211488)) (_1!6231 lt!211488) (_2!6231 lt!211488)))))

(assert (=> d!43689 (= lt!211488 (readBytePure!0 lt!211489))))

(assert (=> d!43689 (= lt!211490 (readBytePure!0 lt!210689))))

(assert (=> d!43689 (= lt!211489 (BitStream!4873 (buf!3197 (_2!6230 lt!210693)) (currentByte!5994 lt!210689) (currentBit!5989 lt!210689)))))

(assert (=> d!43689 (= (readBytePrefixLemma!0 lt!210689 (_2!6230 lt!210693)) lt!211487)))

(declare-fun b!136031 () Bool)

(assert (=> b!136031 (= e!90309 (= (_2!6231 lt!211490) (_2!6231 lt!211488)))))

(assert (= (and d!43689 res!113184) b!136031))

(declare-fun m!207939 () Bool)

(assert (=> d!43689 m!207939))

(declare-fun m!207941 () Bool)

(assert (=> d!43689 m!207941))

(declare-fun m!207943 () Bool)

(assert (=> d!43689 m!207943))

(assert (=> d!43689 m!207227))

(declare-fun m!207945 () Bool)

(assert (=> d!43689 m!207945))

(assert (=> b!135705 d!43689))

(assert (=> b!135705 d!43621))

(declare-fun lt!211515 () tuple2!11834)

(declare-fun e!90318 () Bool)

(declare-fun b!136042 () Bool)

(assert (=> b!136042 (= e!90318 (arrayRangesEq!207 arr!237 (_2!6233 lt!211515) #b00000000000000000000000000000000 to!404))))

(declare-fun b!136043 () Bool)

(declare-fun res!113198 () Bool)

(declare-fun e!90316 () Bool)

(assert (=> b!136043 (=> (not res!113198) (not e!90316))))

(declare-fun lt!211513 () tuple2!11828)

(declare-fun lt!211517 () (_ BitVec 64))

(declare-fun lt!211510 () (_ BitVec 64))

(assert (=> b!136043 (= res!113198 (= (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!211513))) (currentByte!5994 (_2!6230 lt!211513)) (currentBit!5989 (_2!6230 lt!211513))) (bvadd lt!211510 lt!211517)))))

(assert (=> b!136043 (or (not (= (bvand lt!211510 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!211517 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!211510 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!211510 lt!211517) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!211512 () (_ BitVec 64))

(assert (=> b!136043 (= lt!211517 (bvmul lt!211512 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!136043 (or (= lt!211512 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!211512 #b0000000000000000000000000000000000000000000000000000000000001000) lt!211512)))))

(assert (=> b!136043 (= lt!211512 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!136043 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!136043 (= lt!211510 (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!210687))) (currentByte!5994 (_2!6230 lt!210687)) (currentBit!5989 (_2!6230 lt!210687))))))

(declare-fun b!136044 () Bool)

(declare-fun e!90317 () Bool)

(declare-fun lt!211514 () (_ BitVec 64))

(assert (=> b!136044 (= e!90317 (validate_offset_bits!1 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!210687)))) ((_ sign_extend 32) (currentByte!5994 (_2!6230 lt!210687))) ((_ sign_extend 32) (currentBit!5989 (_2!6230 lt!210687))) lt!211514))))

(declare-fun d!43691 () Bool)

(assert (=> d!43691 e!90316))

(declare-fun res!113199 () Bool)

(assert (=> d!43691 (=> (not res!113199) (not e!90316))))

(assert (=> d!43691 (= res!113199 (= (size!2804 (buf!3197 (_2!6230 lt!210687))) (size!2804 (buf!3197 (_2!6230 lt!211513)))))))

(declare-fun choose!64 (BitStream!4872 array!6192 (_ BitVec 32) (_ BitVec 32)) tuple2!11828)

(assert (=> d!43691 (= lt!211513 (choose!64 (_2!6230 lt!210687) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!43691 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2804 arr!237)))))

(assert (=> d!43691 (= (appendByteArrayLoop!0 (_2!6230 lt!210687) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!211513)))

(declare-fun b!136045 () Bool)

(assert (=> b!136045 (= e!90316 e!90318)))

(declare-fun res!113197 () Bool)

(assert (=> b!136045 (=> (not res!113197) (not e!90318))))

(declare-fun lt!211509 () tuple2!11832)

(assert (=> b!136045 (= res!113197 (and (= (size!2804 (_2!6233 lt!211515)) (size!2804 arr!237)) (= (_1!6233 lt!211515) (_2!6232 lt!211509))))))

(assert (=> b!136045 (= lt!211515 (readByteArrayLoopPure!0 (_1!6232 lt!211509) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!211511 () Unit!8446)

(declare-fun lt!211516 () Unit!8446)

(assert (=> b!136045 (= lt!211511 lt!211516)))

(assert (=> b!136045 (validate_offset_bits!1 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!211513)))) ((_ sign_extend 32) (currentByte!5994 (_2!6230 lt!210687))) ((_ sign_extend 32) (currentBit!5989 (_2!6230 lt!210687))) lt!211514)))

(assert (=> b!136045 (= lt!211516 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6230 lt!210687) (buf!3197 (_2!6230 lt!211513)) lt!211514))))

(assert (=> b!136045 e!90317))

(declare-fun res!113195 () Bool)

(assert (=> b!136045 (=> (not res!113195) (not e!90317))))

(assert (=> b!136045 (= res!113195 (and (= (size!2804 (buf!3197 (_2!6230 lt!210687))) (size!2804 (buf!3197 (_2!6230 lt!211513)))) (bvsge lt!211514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!136045 (= lt!211514 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!136045 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!136045 (= lt!211509 (reader!0 (_2!6230 lt!210687) (_2!6230 lt!211513)))))

(declare-fun b!136046 () Bool)

(declare-fun res!113196 () Bool)

(assert (=> b!136046 (=> (not res!113196) (not e!90316))))

(assert (=> b!136046 (= res!113196 (isPrefixOf!0 (_2!6230 lt!210687) (_2!6230 lt!211513)))))

(assert (= (and d!43691 res!113199) b!136043))

(assert (= (and b!136043 res!113198) b!136046))

(assert (= (and b!136046 res!113196) b!136045))

(assert (= (and b!136045 res!113195) b!136044))

(assert (= (and b!136045 res!113197) b!136042))

(declare-fun m!207947 () Bool)

(assert (=> b!136046 m!207947))

(declare-fun m!207949 () Bool)

(assert (=> d!43691 m!207949))

(declare-fun m!207951 () Bool)

(assert (=> b!136043 m!207951))

(assert (=> b!136043 m!207195))

(declare-fun m!207953 () Bool)

(assert (=> b!136044 m!207953))

(declare-fun m!207955 () Bool)

(assert (=> b!136045 m!207955))

(declare-fun m!207957 () Bool)

(assert (=> b!136045 m!207957))

(declare-fun m!207959 () Bool)

(assert (=> b!136045 m!207959))

(declare-fun m!207961 () Bool)

(assert (=> b!136045 m!207961))

(declare-fun m!207963 () Bool)

(assert (=> b!136042 m!207963))

(assert (=> b!135705 d!43691))

(declare-fun d!43693 () Bool)

(assert (=> d!43693 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!210693)))) ((_ sign_extend 32) (currentByte!5994 (_2!6230 lt!210687))) ((_ sign_extend 32) (currentBit!5989 (_2!6230 lt!210687))) lt!210712) (bvsle ((_ sign_extend 32) lt!210712) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!210693)))) ((_ sign_extend 32) (currentByte!5994 (_2!6230 lt!210687))) ((_ sign_extend 32) (currentBit!5989 (_2!6230 lt!210687)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10661 () Bool)

(assert (= bs!10661 d!43693))

(assert (=> bs!10661 m!207777))

(assert (=> b!135705 d!43693))

(declare-fun d!43695 () Bool)

(declare-fun e!90321 () Bool)

(assert (=> d!43695 e!90321))

(declare-fun res!113202 () Bool)

(assert (=> d!43695 (=> (not res!113202) (not e!90321))))

(assert (=> d!43695 (= res!113202 (and (or (let ((rhs!3137 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3137 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3137) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!43696 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!43696 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!43696 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3136 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3136 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3136) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!211526 () Unit!8446)

(declare-fun choose!57 (BitStream!4872 BitStream!4872 (_ BitVec 64) (_ BitVec 32)) Unit!8446)

(assert (=> d!43695 (= lt!211526 (choose!57 thiss!1634 (_2!6230 lt!210687) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!43695 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6230 lt!210687) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!211526)))

(declare-fun lt!211524 () (_ BitVec 32))

(declare-fun b!136049 () Bool)

(assert (=> b!136049 (= e!90321 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!210687)))) ((_ sign_extend 32) (currentByte!5994 (_2!6230 lt!210687))) ((_ sign_extend 32) (currentBit!5989 (_2!6230 lt!210687))) (bvsub (bvsub to!404 from!447) lt!211524)))))

(assert (=> b!136049 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!211524 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!211524) #b10000000000000000000000000000000)))))

(declare-fun lt!211525 () (_ BitVec 64))

(assert (=> b!136049 (= lt!211524 ((_ extract 31 0) lt!211525))))

(assert (=> b!136049 (and (bvslt lt!211525 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!211525 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!136049 (= lt!211525 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!43695 res!113202) b!136049))

(declare-fun m!207965 () Bool)

(assert (=> d!43695 m!207965))

(declare-fun m!207967 () Bool)

(assert (=> b!136049 m!207967))

(assert (=> b!135705 d!43695))

(declare-fun d!43698 () Bool)

(assert (=> d!43698 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!210693)))) ((_ sign_extend 32) (currentByte!5994 thiss!1634)) ((_ sign_extend 32) (currentBit!5989 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!211527 () Unit!8446)

(assert (=> d!43698 (= lt!211527 (choose!26 thiss!1634 (buf!3197 (_2!6230 lt!210693)) (bvsub to!404 from!447) (BitStream!4873 (buf!3197 (_2!6230 lt!210693)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634))))))

(assert (=> d!43698 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3197 (_2!6230 lt!210693)) (bvsub to!404 from!447)) lt!211527)))

(declare-fun bs!10662 () Bool)

(assert (= bs!10662 d!43698))

(assert (=> bs!10662 m!207241))

(declare-fun m!207969 () Bool)

(assert (=> bs!10662 m!207969))

(assert (=> b!135705 d!43698))

(declare-fun lt!211528 () tuple3!518)

(declare-fun d!43700 () Bool)

(assert (=> d!43700 (= lt!211528 (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!6232 lt!210690) #b00000000000000000000000000000001) lt!210686 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!43700 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6232 lt!210690) #b00000000000000000000000000000001) lt!210686 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11835 (_2!6242 lt!211528) (_3!318 lt!211528)))))

(declare-fun bs!10663 () Bool)

(assert (= bs!10663 d!43700))

(assert (=> bs!10663 m!207235))

(declare-fun m!207971 () Bool)

(assert (=> bs!10663 m!207971))

(assert (=> b!135705 d!43700))

(check-sat (not d!43683) (not b!135981) (not d!43665) (not b!136049) (not b!136023) (not d!43655) (not d!43689) (not b!135968) (not d!43671) (not b!136005) (not b!136046) (not d!43681) (not b!135999) (not b!135994) (not d!43609) (not b!136006) (not b!135997) (not d!43687) (not b!136022) (not d!43695) (not d!43673) (not d!43629) (not d!43615) (not b!136009) (not d!43685) (not d!43619) (not b!136013) (not b!136003) (not b!135989) (not d!43633) (not d!43623) (not b!135979) (not d!43700) (not d!43691) (not d!43617) (not b!136043) (not b!136026) (not d!43635) (not d!43677) (not b!135992) (not d!43611) (not b!135966) (not b!135993) (not d!43637) (not b!136004) (not d!43661) (not d!43667) (not b!136024) (not d!43675) (not b!136044) (not b!135980) (not b!135991) (not b!135996) (not d!43653) (not d!43645) (not d!43693) (not d!43621) (not d!43641) (not d!43659) (not b!136008) (not d!43698) (not b!136045) (not b!136011) (not d!43669) (not b!135983) (not b!136042))
(check-sat)
(get-model)

(assert (=> b!135979 d!43609))

(declare-fun d!43702 () Bool)

(assert (=> d!43702 (arrayBitRangesEq!0 (buf!3197 (_2!6230 lt!210693)) (buf!3197 (_2!6230 lt!210687)) lt!211356 lt!211362)))

(declare-fun lt!211531 () Unit!8446)

(declare-fun choose!8 (array!6192 array!6192 (_ BitVec 64) (_ BitVec 64)) Unit!8446)

(assert (=> d!43702 (= lt!211531 (choose!8 (buf!3197 (_2!6230 lt!210687)) (buf!3197 (_2!6230 lt!210693)) lt!211356 lt!211362))))

(assert (=> d!43702 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!211356) (bvsle lt!211356 lt!211362))))

(assert (=> d!43702 (= (arrayBitRangesEqSymmetric!0 (buf!3197 (_2!6230 lt!210687)) (buf!3197 (_2!6230 lt!210693)) lt!211356 lt!211362) lt!211531)))

(declare-fun bs!10664 () Bool)

(assert (= bs!10664 d!43702))

(assert (=> bs!10664 m!207805))

(declare-fun m!207973 () Bool)

(assert (=> bs!10664 m!207973))

(assert (=> b!135979 d!43702))

(declare-fun b!136064 () Bool)

(declare-fun res!113213 () Bool)

(declare-fun lt!211540 () (_ BitVec 32))

(assert (=> b!136064 (= res!113213 (= lt!211540 #b00000000000000000000000000000000))))

(declare-fun e!90336 () Bool)

(assert (=> b!136064 (=> res!113213 e!90336)))

(declare-fun e!90339 () Bool)

(assert (=> b!136064 (= e!90339 e!90336)))

(declare-datatypes ((tuple4!118 0))(
  ( (tuple4!119 (_1!6244 (_ BitVec 32)) (_2!6244 (_ BitVec 32)) (_3!319 (_ BitVec 32)) (_4!59 (_ BitVec 32))) )
))
(declare-fun lt!211539 () tuple4!118)

(declare-fun b!136065 () Bool)

(declare-fun e!90338 () Bool)

(assert (=> b!136065 (= e!90338 (arrayRangesEq!207 (buf!3197 (_2!6230 lt!210693)) (buf!3197 (_2!6230 lt!210687)) (_1!6244 lt!211539) (_2!6244 lt!211539)))))

(declare-fun b!136066 () Bool)

(declare-fun call!1770 () Bool)

(assert (=> b!136066 (= e!90336 call!1770)))

(declare-fun d!43704 () Bool)

(declare-fun res!113216 () Bool)

(declare-fun e!90337 () Bool)

(assert (=> d!43704 (=> res!113216 e!90337)))

(assert (=> d!43704 (= res!113216 (bvsge lt!211356 lt!211362))))

(assert (=> d!43704 (= (arrayBitRangesEq!0 (buf!3197 (_2!6230 lt!210693)) (buf!3197 (_2!6230 lt!210687)) lt!211356 lt!211362) e!90337)))

(declare-fun b!136067 () Bool)

(declare-fun e!90335 () Bool)

(assert (=> b!136067 (= e!90337 e!90335)))

(declare-fun res!113217 () Bool)

(assert (=> b!136067 (=> (not res!113217) (not e!90335))))

(assert (=> b!136067 (= res!113217 e!90338)))

(declare-fun res!113214 () Bool)

(assert (=> b!136067 (=> res!113214 e!90338)))

(assert (=> b!136067 (= res!113214 (bvsge (_1!6244 lt!211539) (_2!6244 lt!211539)))))

(assert (=> b!136067 (= lt!211540 ((_ extract 31 0) (bvsrem lt!211362 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!211538 () (_ BitVec 32))

(assert (=> b!136067 (= lt!211538 ((_ extract 31 0) (bvsrem lt!211356 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!118)

(assert (=> b!136067 (= lt!211539 (arrayBitIndices!0 lt!211356 lt!211362))))

(declare-fun b!136068 () Bool)

(declare-fun e!90334 () Bool)

(assert (=> b!136068 (= e!90335 e!90334)))

(declare-fun c!7696 () Bool)

(assert (=> b!136068 (= c!7696 (= (_3!319 lt!211539) (_4!59 lt!211539)))))

(declare-fun b!136069 () Bool)

(assert (=> b!136069 (= e!90334 e!90339)))

(declare-fun res!113215 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!136069 (= res!113215 (byteRangesEq!0 (select (arr!3469 (buf!3197 (_2!6230 lt!210693))) (_3!319 lt!211539)) (select (arr!3469 (buf!3197 (_2!6230 lt!210687))) (_3!319 lt!211539)) lt!211538 #b00000000000000000000000000001000))))

(assert (=> b!136069 (=> (not res!113215) (not e!90339))))

(declare-fun bm!1767 () Bool)

(assert (=> bm!1767 (= call!1770 (byteRangesEq!0 (ite c!7696 (select (arr!3469 (buf!3197 (_2!6230 lt!210693))) (_3!319 lt!211539)) (select (arr!3469 (buf!3197 (_2!6230 lt!210693))) (_4!59 lt!211539))) (ite c!7696 (select (arr!3469 (buf!3197 (_2!6230 lt!210687))) (_3!319 lt!211539)) (select (arr!3469 (buf!3197 (_2!6230 lt!210687))) (_4!59 lt!211539))) (ite c!7696 lt!211538 #b00000000000000000000000000000000) lt!211540))))

(declare-fun b!136070 () Bool)

(assert (=> b!136070 (= e!90334 call!1770)))

(assert (= (and d!43704 (not res!113216)) b!136067))

(assert (= (and b!136067 (not res!113214)) b!136065))

(assert (= (and b!136067 res!113217) b!136068))

(assert (= (and b!136068 c!7696) b!136070))

(assert (= (and b!136068 (not c!7696)) b!136069))

(assert (= (and b!136069 res!113215) b!136064))

(assert (= (and b!136064 (not res!113213)) b!136066))

(assert (= (or b!136070 b!136066) bm!1767))

(declare-fun m!207975 () Bool)

(assert (=> b!136065 m!207975))

(declare-fun m!207977 () Bool)

(assert (=> b!136067 m!207977))

(declare-fun m!207979 () Bool)

(assert (=> b!136069 m!207979))

(declare-fun m!207981 () Bool)

(assert (=> b!136069 m!207981))

(assert (=> b!136069 m!207979))

(assert (=> b!136069 m!207981))

(declare-fun m!207983 () Bool)

(assert (=> b!136069 m!207983))

(declare-fun m!207985 () Bool)

(assert (=> bm!1767 m!207985))

(declare-fun m!207987 () Bool)

(assert (=> bm!1767 m!207987))

(assert (=> bm!1767 m!207979))

(declare-fun m!207989 () Bool)

(assert (=> bm!1767 m!207989))

(assert (=> bm!1767 m!207981))

(assert (=> b!135979 d!43704))

(declare-fun d!43706 () Bool)

(declare-fun res!113219 () Bool)

(declare-fun e!90341 () Bool)

(assert (=> d!43706 (=> (not res!113219) (not e!90341))))

(assert (=> d!43706 (= res!113219 (= (size!2804 (buf!3197 (_2!6230 lt!210687))) (size!2804 (buf!3197 (_2!6230 lt!211513)))))))

(assert (=> d!43706 (= (isPrefixOf!0 (_2!6230 lt!210687) (_2!6230 lt!211513)) e!90341)))

(declare-fun b!136071 () Bool)

(declare-fun res!113220 () Bool)

(assert (=> b!136071 (=> (not res!113220) (not e!90341))))

(assert (=> b!136071 (= res!113220 (bvsle (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!210687))) (currentByte!5994 (_2!6230 lt!210687)) (currentBit!5989 (_2!6230 lt!210687))) (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!211513))) (currentByte!5994 (_2!6230 lt!211513)) (currentBit!5989 (_2!6230 lt!211513)))))))

(declare-fun b!136072 () Bool)

(declare-fun e!90340 () Bool)

(assert (=> b!136072 (= e!90341 e!90340)))

(declare-fun res!113218 () Bool)

(assert (=> b!136072 (=> res!113218 e!90340)))

(assert (=> b!136072 (= res!113218 (= (size!2804 (buf!3197 (_2!6230 lt!210687))) #b00000000000000000000000000000000))))

(declare-fun b!136073 () Bool)

(assert (=> b!136073 (= e!90340 (arrayBitRangesEq!0 (buf!3197 (_2!6230 lt!210687)) (buf!3197 (_2!6230 lt!211513)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!210687))) (currentByte!5994 (_2!6230 lt!210687)) (currentBit!5989 (_2!6230 lt!210687)))))))

(assert (= (and d!43706 res!113219) b!136071))

(assert (= (and b!136071 res!113220) b!136072))

(assert (= (and b!136072 (not res!113218)) b!136073))

(assert (=> b!136071 m!207195))

(assert (=> b!136071 m!207951))

(assert (=> b!136073 m!207195))

(assert (=> b!136073 m!207195))

(declare-fun m!207991 () Bool)

(assert (=> b!136073 m!207991))

(assert (=> b!136046 d!43706))

(declare-fun d!43708 () Bool)

(declare-fun lt!211559 () (_ BitVec 8))

(declare-fun lt!211560 () (_ BitVec 8))

(assert (=> d!43708 (= lt!211559 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3469 (buf!3197 (_1!6232 lt!210696))) (currentByte!5994 (_1!6232 lt!210696)))) ((_ sign_extend 24) lt!211560))))))

(assert (=> d!43708 (= lt!211560 ((_ extract 7 0) (currentBit!5989 (_1!6232 lt!210696))))))

(declare-fun e!90347 () Bool)

(assert (=> d!43708 e!90347))

(declare-fun res!113227 () Bool)

(assert (=> d!43708 (=> (not res!113227) (not e!90347))))

(assert (=> d!43708 (= res!113227 (validate_offset_bits!1 ((_ sign_extend 32) (size!2804 (buf!3197 (_1!6232 lt!210696)))) ((_ sign_extend 32) (currentByte!5994 (_1!6232 lt!210696))) ((_ sign_extend 32) (currentBit!5989 (_1!6232 lt!210696))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!11850 0))(
  ( (tuple2!11851 (_1!6245 Unit!8446) (_2!6245 (_ BitVec 8))) )
))
(declare-fun Unit!8459 () Unit!8446)

(declare-fun Unit!8460 () Unit!8446)

(assert (=> d!43708 (= (readByte!0 (_1!6232 lt!210696)) (tuple2!11849 (_2!6245 (ite (bvsgt ((_ sign_extend 24) lt!211560) #b00000000000000000000000000000000) (tuple2!11851 Unit!8459 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!211559) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3469 (buf!3197 (_1!6232 lt!210696))) (bvadd (currentByte!5994 (_1!6232 lt!210696)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!211560)))))))) (tuple2!11851 Unit!8460 lt!211559))) (BitStream!4873 (buf!3197 (_1!6232 lt!210696)) (bvadd (currentByte!5994 (_1!6232 lt!210696)) #b00000000000000000000000000000001) (currentBit!5989 (_1!6232 lt!210696)))))))

(declare-fun b!136078 () Bool)

(declare-fun e!90346 () Bool)

(assert (=> b!136078 (= e!90347 e!90346)))

(declare-fun res!113226 () Bool)

(assert (=> b!136078 (=> (not res!113226) (not e!90346))))

(declare-fun lt!211558 () tuple2!11848)

(assert (=> b!136078 (= res!113226 (= (buf!3197 (_2!6243 lt!211558)) (buf!3197 (_1!6232 lt!210696))))))

(declare-fun lt!211561 () (_ BitVec 8))

(declare-fun lt!211557 () (_ BitVec 8))

(declare-fun Unit!8461 () Unit!8446)

(declare-fun Unit!8462 () Unit!8446)

(assert (=> b!136078 (= lt!211558 (tuple2!11849 (_2!6245 (ite (bvsgt ((_ sign_extend 24) lt!211557) #b00000000000000000000000000000000) (tuple2!11851 Unit!8461 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!211561) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3469 (buf!3197 (_1!6232 lt!210696))) (bvadd (currentByte!5994 (_1!6232 lt!210696)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!211557)))))))) (tuple2!11851 Unit!8462 lt!211561))) (BitStream!4873 (buf!3197 (_1!6232 lt!210696)) (bvadd (currentByte!5994 (_1!6232 lt!210696)) #b00000000000000000000000000000001) (currentBit!5989 (_1!6232 lt!210696)))))))

(assert (=> b!136078 (= lt!211561 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3469 (buf!3197 (_1!6232 lt!210696))) (currentByte!5994 (_1!6232 lt!210696)))) ((_ sign_extend 24) lt!211557))))))

(assert (=> b!136078 (= lt!211557 ((_ extract 7 0) (currentBit!5989 (_1!6232 lt!210696))))))

(declare-fun lt!211556 () (_ BitVec 64))

(declare-fun b!136079 () Bool)

(declare-fun lt!211555 () (_ BitVec 64))

(assert (=> b!136079 (= e!90346 (= (bitIndex!0 (size!2804 (buf!3197 (_2!6243 lt!211558))) (currentByte!5994 (_2!6243 lt!211558)) (currentBit!5989 (_2!6243 lt!211558))) (bvadd lt!211556 lt!211555)))))

(assert (=> b!136079 (or (not (= (bvand lt!211556 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!211555 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!211556 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!211556 lt!211555) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!136079 (= lt!211555 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!136079 (= lt!211556 (bitIndex!0 (size!2804 (buf!3197 (_1!6232 lt!210696))) (currentByte!5994 (_1!6232 lt!210696)) (currentBit!5989 (_1!6232 lt!210696))))))

(assert (= (and d!43708 res!113227) b!136078))

(assert (= (and b!136078 res!113226) b!136079))

(declare-fun m!207993 () Bool)

(assert (=> d!43708 m!207993))

(declare-fun m!207995 () Bool)

(assert (=> d!43708 m!207995))

(declare-fun m!207997 () Bool)

(assert (=> d!43708 m!207997))

(assert (=> b!136078 m!207997))

(assert (=> b!136078 m!207993))

(declare-fun m!207999 () Bool)

(assert (=> b!136079 m!207999))

(declare-fun m!208001 () Bool)

(assert (=> b!136079 m!208001))

(assert (=> d!43635 d!43708))

(assert (=> d!43629 d!43627))

(declare-fun d!43710 () Bool)

(assert (=> d!43710 (arrayRangesEq!207 arr!237 (_2!6233 lt!210692) #b00000000000000000000000000000000 to!404)))

(assert (=> d!43710 true))

(declare-fun _$16!44 () Unit!8446)

(assert (=> d!43710 (= (choose!71 arr!237 (_2!6233 lt!210695) (_2!6233 lt!210692) #b00000000000000000000000000000000 to!404 to!404) _$16!44)))

(declare-fun bs!10665 () Bool)

(assert (= bs!10665 d!43710))

(assert (=> bs!10665 m!207181))

(assert (=> d!43629 d!43710))

(declare-fun d!43712 () Bool)

(assert (=> d!43712 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!210687)))) ((_ sign_extend 32) (currentByte!5994 (_2!6230 lt!210687))) ((_ sign_extend 32) (currentBit!5989 (_2!6230 lt!210687))) (bvsub (bvsub to!404 from!447) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!43712 true))

(declare-fun _$7!58 () Unit!8446)

(assert (=> d!43712 (= (choose!57 thiss!1634 (_2!6230 lt!210687) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) _$7!58)))

(declare-fun bs!10666 () Bool)

(assert (= bs!10666 d!43712))

(declare-fun m!208003 () Bool)

(assert (=> bs!10666 m!208003))

(assert (=> d!43695 d!43712))

(assert (=> b!136009 d!43611))

(assert (=> b!136009 d!43645))

(declare-fun d!43714 () Bool)

(declare-fun res!113229 () Bool)

(declare-fun e!90349 () Bool)

(assert (=> d!43714 (=> (not res!113229) (not e!90349))))

(assert (=> d!43714 (= res!113229 (= (size!2804 (buf!3197 lt!211425)) (size!2804 (buf!3197 (_2!6230 lt!210693)))))))

(assert (=> d!43714 (= (isPrefixOf!0 lt!211425 (_2!6230 lt!210693)) e!90349)))

(declare-fun b!136080 () Bool)

(declare-fun res!113230 () Bool)

(assert (=> b!136080 (=> (not res!113230) (not e!90349))))

(assert (=> b!136080 (= res!113230 (bvsle (bitIndex!0 (size!2804 (buf!3197 lt!211425)) (currentByte!5994 lt!211425) (currentBit!5989 lt!211425)) (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!210693))) (currentByte!5994 (_2!6230 lt!210693)) (currentBit!5989 (_2!6230 lt!210693)))))))

(declare-fun b!136081 () Bool)

(declare-fun e!90348 () Bool)

(assert (=> b!136081 (= e!90349 e!90348)))

(declare-fun res!113228 () Bool)

(assert (=> b!136081 (=> res!113228 e!90348)))

(assert (=> b!136081 (= res!113228 (= (size!2804 (buf!3197 lt!211425)) #b00000000000000000000000000000000))))

(declare-fun b!136082 () Bool)

(assert (=> b!136082 (= e!90348 (arrayBitRangesEq!0 (buf!3197 lt!211425) (buf!3197 (_2!6230 lt!210693)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2804 (buf!3197 lt!211425)) (currentByte!5994 lt!211425) (currentBit!5989 lt!211425))))))

(assert (= (and d!43714 res!113229) b!136080))

(assert (= (and b!136080 res!113230) b!136081))

(assert (= (and b!136081 (not res!113228)) b!136082))

(declare-fun m!208005 () Bool)

(assert (=> b!136080 m!208005))

(assert (=> b!136080 m!207203))

(assert (=> b!136082 m!208005))

(assert (=> b!136082 m!208005))

(declare-fun m!208007 () Bool)

(assert (=> b!136082 m!208007))

(assert (=> d!43655 d!43714))

(declare-fun d!43716 () Bool)

(declare-fun res!113232 () Bool)

(declare-fun e!90351 () Bool)

(assert (=> d!43716 (=> (not res!113232) (not e!90351))))

(assert (=> d!43716 (= res!113232 (= (size!2804 (buf!3197 (_1!6232 lt!211414))) (size!2804 (buf!3197 (_2!6232 lt!211414)))))))

(assert (=> d!43716 (= (isPrefixOf!0 (_1!6232 lt!211414) (_2!6232 lt!211414)) e!90351)))

(declare-fun b!136083 () Bool)

(declare-fun res!113233 () Bool)

(assert (=> b!136083 (=> (not res!113233) (not e!90351))))

(assert (=> b!136083 (= res!113233 (bvsle (bitIndex!0 (size!2804 (buf!3197 (_1!6232 lt!211414))) (currentByte!5994 (_1!6232 lt!211414)) (currentBit!5989 (_1!6232 lt!211414))) (bitIndex!0 (size!2804 (buf!3197 (_2!6232 lt!211414))) (currentByte!5994 (_2!6232 lt!211414)) (currentBit!5989 (_2!6232 lt!211414)))))))

(declare-fun b!136084 () Bool)

(declare-fun e!90350 () Bool)

(assert (=> b!136084 (= e!90351 e!90350)))

(declare-fun res!113231 () Bool)

(assert (=> b!136084 (=> res!113231 e!90350)))

(assert (=> b!136084 (= res!113231 (= (size!2804 (buf!3197 (_1!6232 lt!211414))) #b00000000000000000000000000000000))))

(declare-fun b!136085 () Bool)

(assert (=> b!136085 (= e!90350 (arrayBitRangesEq!0 (buf!3197 (_1!6232 lt!211414)) (buf!3197 (_2!6232 lt!211414)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2804 (buf!3197 (_1!6232 lt!211414))) (currentByte!5994 (_1!6232 lt!211414)) (currentBit!5989 (_1!6232 lt!211414)))))))

(assert (= (and d!43716 res!113232) b!136083))

(assert (= (and b!136083 res!113233) b!136084))

(assert (= (and b!136084 (not res!113231)) b!136085))

(declare-fun m!208009 () Bool)

(assert (=> b!136083 m!208009))

(declare-fun m!208011 () Bool)

(assert (=> b!136083 m!208011))

(assert (=> b!136085 m!208009))

(assert (=> b!136085 m!208009))

(declare-fun m!208013 () Bool)

(assert (=> b!136085 m!208013))

(assert (=> d!43655 d!43716))

(declare-fun d!43718 () Bool)

(declare-fun res!113235 () Bool)

(declare-fun e!90353 () Bool)

(assert (=> d!43718 (=> (not res!113235) (not e!90353))))

(assert (=> d!43718 (= res!113235 (= (size!2804 (buf!3197 lt!211425)) (size!2804 (buf!3197 lt!211425))))))

(assert (=> d!43718 (= (isPrefixOf!0 lt!211425 lt!211425) e!90353)))

(declare-fun b!136086 () Bool)

(declare-fun res!113236 () Bool)

(assert (=> b!136086 (=> (not res!113236) (not e!90353))))

(assert (=> b!136086 (= res!113236 (bvsle (bitIndex!0 (size!2804 (buf!3197 lt!211425)) (currentByte!5994 lt!211425) (currentBit!5989 lt!211425)) (bitIndex!0 (size!2804 (buf!3197 lt!211425)) (currentByte!5994 lt!211425) (currentBit!5989 lt!211425))))))

(declare-fun b!136087 () Bool)

(declare-fun e!90352 () Bool)

(assert (=> b!136087 (= e!90353 e!90352)))

(declare-fun res!113234 () Bool)

(assert (=> b!136087 (=> res!113234 e!90352)))

(assert (=> b!136087 (= res!113234 (= (size!2804 (buf!3197 lt!211425)) #b00000000000000000000000000000000))))

(declare-fun b!136088 () Bool)

(assert (=> b!136088 (= e!90352 (arrayBitRangesEq!0 (buf!3197 lt!211425) (buf!3197 lt!211425) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2804 (buf!3197 lt!211425)) (currentByte!5994 lt!211425) (currentBit!5989 lt!211425))))))

(assert (= (and d!43718 res!113235) b!136086))

(assert (= (and b!136086 res!113236) b!136087))

(assert (= (and b!136087 (not res!113234)) b!136088))

(assert (=> b!136086 m!208005))

(assert (=> b!136086 m!208005))

(assert (=> b!136088 m!208005))

(assert (=> b!136088 m!208005))

(declare-fun m!208015 () Bool)

(assert (=> b!136088 m!208015))

(assert (=> d!43655 d!43718))

(declare-fun d!43720 () Bool)

(assert (=> d!43720 (isPrefixOf!0 lt!211425 lt!211425)))

(declare-fun lt!211564 () Unit!8446)

(declare-fun choose!11 (BitStream!4872) Unit!8446)

(assert (=> d!43720 (= lt!211564 (choose!11 lt!211425))))

(assert (=> d!43720 (= (lemmaIsPrefixRefl!0 lt!211425) lt!211564)))

(declare-fun bs!10668 () Bool)

(assert (= bs!10668 d!43720))

(assert (=> bs!10668 m!207877))

(declare-fun m!208017 () Bool)

(assert (=> bs!10668 m!208017))

(assert (=> d!43655 d!43720))

(declare-fun d!43722 () Bool)

(assert (=> d!43722 (isPrefixOf!0 lt!211425 (_2!6230 lt!210693))))

(declare-fun lt!211565 () Unit!8446)

(assert (=> d!43722 (= lt!211565 (choose!30 lt!211425 (_2!6230 lt!210693) (_2!6230 lt!210693)))))

(assert (=> d!43722 (isPrefixOf!0 lt!211425 (_2!6230 lt!210693))))

(assert (=> d!43722 (= (lemmaIsPrefixTransitive!0 lt!211425 (_2!6230 lt!210693) (_2!6230 lt!210693)) lt!211565)))

(declare-fun bs!10669 () Bool)

(assert (= bs!10669 d!43722))

(assert (=> bs!10669 m!207875))

(declare-fun m!208019 () Bool)

(assert (=> bs!10669 m!208019))

(assert (=> bs!10669 m!207875))

(assert (=> d!43655 d!43722))

(assert (=> d!43655 d!43657))

(declare-fun d!43724 () Bool)

(assert (=> d!43724 (isPrefixOf!0 lt!211425 (_2!6230 lt!210693))))

(declare-fun lt!211566 () Unit!8446)

(assert (=> d!43724 (= lt!211566 (choose!30 lt!211425 thiss!1634 (_2!6230 lt!210693)))))

(assert (=> d!43724 (isPrefixOf!0 lt!211425 thiss!1634)))

(assert (=> d!43724 (= (lemmaIsPrefixTransitive!0 lt!211425 thiss!1634 (_2!6230 lt!210693)) lt!211566)))

(declare-fun bs!10670 () Bool)

(assert (= bs!10670 d!43724))

(assert (=> bs!10670 m!207875))

(declare-fun m!208021 () Bool)

(assert (=> bs!10670 m!208021))

(declare-fun m!208023 () Bool)

(assert (=> bs!10670 m!208023))

(assert (=> d!43655 d!43724))

(declare-fun d!43726 () Bool)

(declare-fun res!113238 () Bool)

(declare-fun e!90355 () Bool)

(assert (=> d!43726 (=> (not res!113238) (not e!90355))))

(assert (=> d!43726 (= res!113238 (= (size!2804 (buf!3197 thiss!1634)) (size!2804 (buf!3197 thiss!1634))))))

(assert (=> d!43726 (= (isPrefixOf!0 thiss!1634 thiss!1634) e!90355)))

(declare-fun b!136089 () Bool)

(declare-fun res!113239 () Bool)

(assert (=> b!136089 (=> (not res!113239) (not e!90355))))

(assert (=> b!136089 (= res!113239 (bvsle (bitIndex!0 (size!2804 (buf!3197 thiss!1634)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634)) (bitIndex!0 (size!2804 (buf!3197 thiss!1634)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634))))))

(declare-fun b!136090 () Bool)

(declare-fun e!90354 () Bool)

(assert (=> b!136090 (= e!90355 e!90354)))

(declare-fun res!113237 () Bool)

(assert (=> b!136090 (=> res!113237 e!90354)))

(assert (=> b!136090 (= res!113237 (= (size!2804 (buf!3197 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!136091 () Bool)

(assert (=> b!136091 (= e!90354 (arrayBitRangesEq!0 (buf!3197 thiss!1634) (buf!3197 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2804 (buf!3197 thiss!1634)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634))))))

(assert (= (and d!43726 res!113238) b!136089))

(assert (= (and b!136089 res!113239) b!136090))

(assert (= (and b!136090 (not res!113237)) b!136091))

(assert (=> b!136089 m!207197))

(assert (=> b!136089 m!207197))

(assert (=> b!136091 m!207197))

(assert (=> b!136091 m!207197))

(declare-fun m!208025 () Bool)

(assert (=> b!136091 m!208025))

(assert (=> d!43655 d!43726))

(declare-fun d!43728 () Bool)

(assert (=> d!43728 (isPrefixOf!0 (_2!6230 lt!210693) (_2!6230 lt!210693))))

(declare-fun lt!211567 () Unit!8446)

(assert (=> d!43728 (= lt!211567 (choose!11 (_2!6230 lt!210693)))))

(assert (=> d!43728 (= (lemmaIsPrefixRefl!0 (_2!6230 lt!210693)) lt!211567)))

(declare-fun bs!10671 () Bool)

(assert (= bs!10671 d!43728))

(assert (=> bs!10671 m!207797))

(declare-fun m!208027 () Bool)

(assert (=> bs!10671 m!208027))

(assert (=> d!43655 d!43728))

(declare-fun d!43730 () Bool)

(assert (=> d!43730 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!211568 () Unit!8446)

(assert (=> d!43730 (= lt!211568 (choose!11 thiss!1634))))

(assert (=> d!43730 (= (lemmaIsPrefixRefl!0 thiss!1634) lt!211568)))

(declare-fun bs!10672 () Bool)

(assert (= bs!10672 d!43730))

(assert (=> bs!10672 m!207843))

(declare-fun m!208029 () Bool)

(assert (=> bs!10672 m!208029))

(assert (=> d!43655 d!43730))

(declare-fun d!43732 () Bool)

(declare-fun res!113241 () Bool)

(declare-fun e!90357 () Bool)

(assert (=> d!43732 (=> (not res!113241) (not e!90357))))

(assert (=> d!43732 (= res!113241 (= (size!2804 (buf!3197 (_2!6230 lt!210693))) (size!2804 (buf!3197 (_2!6230 lt!210693)))))))

(assert (=> d!43732 (= (isPrefixOf!0 (_2!6230 lt!210693) (_2!6230 lt!210693)) e!90357)))

(declare-fun b!136092 () Bool)

(declare-fun res!113242 () Bool)

(assert (=> b!136092 (=> (not res!113242) (not e!90357))))

(assert (=> b!136092 (= res!113242 (bvsle (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!210693))) (currentByte!5994 (_2!6230 lt!210693)) (currentBit!5989 (_2!6230 lt!210693))) (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!210693))) (currentByte!5994 (_2!6230 lt!210693)) (currentBit!5989 (_2!6230 lt!210693)))))))

(declare-fun b!136093 () Bool)

(declare-fun e!90356 () Bool)

(assert (=> b!136093 (= e!90357 e!90356)))

(declare-fun res!113240 () Bool)

(assert (=> b!136093 (=> res!113240 e!90356)))

(assert (=> b!136093 (= res!113240 (= (size!2804 (buf!3197 (_2!6230 lt!210693))) #b00000000000000000000000000000000))))

(declare-fun b!136094 () Bool)

(assert (=> b!136094 (= e!90356 (arrayBitRangesEq!0 (buf!3197 (_2!6230 lt!210693)) (buf!3197 (_2!6230 lt!210693)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!210693))) (currentByte!5994 (_2!6230 lt!210693)) (currentBit!5989 (_2!6230 lt!210693)))))))

(assert (= (and d!43732 res!113241) b!136092))

(assert (= (and b!136092 res!113242) b!136093))

(assert (= (and b!136093 (not res!113240)) b!136094))

(assert (=> b!136092 m!207203))

(assert (=> b!136092 m!207203))

(assert (=> b!136094 m!207203))

(assert (=> b!136094 m!207203))

(declare-fun m!208031 () Bool)

(assert (=> b!136094 m!208031))

(assert (=> d!43655 d!43732))

(declare-fun d!43734 () Bool)

(declare-fun res!113244 () Bool)

(declare-fun e!90359 () Bool)

(assert (=> d!43734 (=> (not res!113244) (not e!90359))))

(assert (=> d!43734 (= res!113244 (= (size!2804 (buf!3197 (_1!6232 lt!211358))) (size!2804 (buf!3197 (_2!6230 lt!210687)))))))

(assert (=> d!43734 (= (isPrefixOf!0 (_1!6232 lt!211358) (_2!6230 lt!210687)) e!90359)))

(declare-fun b!136095 () Bool)

(declare-fun res!113245 () Bool)

(assert (=> b!136095 (=> (not res!113245) (not e!90359))))

(assert (=> b!136095 (= res!113245 (bvsle (bitIndex!0 (size!2804 (buf!3197 (_1!6232 lt!211358))) (currentByte!5994 (_1!6232 lt!211358)) (currentBit!5989 (_1!6232 lt!211358))) (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!210687))) (currentByte!5994 (_2!6230 lt!210687)) (currentBit!5989 (_2!6230 lt!210687)))))))

(declare-fun b!136096 () Bool)

(declare-fun e!90358 () Bool)

(assert (=> b!136096 (= e!90359 e!90358)))

(declare-fun res!113243 () Bool)

(assert (=> b!136096 (=> res!113243 e!90358)))

(assert (=> b!136096 (= res!113243 (= (size!2804 (buf!3197 (_1!6232 lt!211358))) #b00000000000000000000000000000000))))

(declare-fun b!136097 () Bool)

(assert (=> b!136097 (= e!90358 (arrayBitRangesEq!0 (buf!3197 (_1!6232 lt!211358)) (buf!3197 (_2!6230 lt!210687)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2804 (buf!3197 (_1!6232 lt!211358))) (currentByte!5994 (_1!6232 lt!211358)) (currentBit!5989 (_1!6232 lt!211358)))))))

(assert (= (and d!43734 res!113244) b!136095))

(assert (= (and b!136095 res!113245) b!136096))

(assert (= (and b!136096 (not res!113243)) b!136097))

(declare-fun m!208033 () Bool)

(assert (=> b!136095 m!208033))

(assert (=> b!136095 m!207195))

(assert (=> b!136097 m!208033))

(assert (=> b!136097 m!208033))

(declare-fun m!208035 () Bool)

(assert (=> b!136097 m!208035))

(assert (=> b!135981 d!43734))

(declare-fun b!136098 () Bool)

(declare-fun res!113246 () Bool)

(declare-fun lt!211571 () (_ BitVec 32))

(assert (=> b!136098 (= res!113246 (= lt!211571 #b00000000000000000000000000000000))))

(declare-fun e!90362 () Bool)

(assert (=> b!136098 (=> res!113246 e!90362)))

(declare-fun e!90365 () Bool)

(assert (=> b!136098 (= e!90365 e!90362)))

(declare-fun b!136099 () Bool)

(declare-fun lt!211570 () tuple4!118)

(declare-fun e!90364 () Bool)

(assert (=> b!136099 (= e!90364 (arrayRangesEq!207 (buf!3197 thiss!1634) (buf!3197 (_2!6230 lt!210693)) (_1!6244 lt!211570) (_2!6244 lt!211570)))))

(declare-fun b!136100 () Bool)

(declare-fun call!1771 () Bool)

(assert (=> b!136100 (= e!90362 call!1771)))

(declare-fun d!43736 () Bool)

(declare-fun res!113249 () Bool)

(declare-fun e!90363 () Bool)

(assert (=> d!43736 (=> res!113249 e!90363)))

(assert (=> d!43736 (= res!113249 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2804 (buf!3197 thiss!1634)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634))))))

(assert (=> d!43736 (= (arrayBitRangesEq!0 (buf!3197 thiss!1634) (buf!3197 (_2!6230 lt!210693)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2804 (buf!3197 thiss!1634)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634))) e!90363)))

(declare-fun b!136101 () Bool)

(declare-fun e!90361 () Bool)

(assert (=> b!136101 (= e!90363 e!90361)))

(declare-fun res!113250 () Bool)

(assert (=> b!136101 (=> (not res!113250) (not e!90361))))

(assert (=> b!136101 (= res!113250 e!90364)))

(declare-fun res!113247 () Bool)

(assert (=> b!136101 (=> res!113247 e!90364)))

(assert (=> b!136101 (= res!113247 (bvsge (_1!6244 lt!211570) (_2!6244 lt!211570)))))

(assert (=> b!136101 (= lt!211571 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2804 (buf!3197 thiss!1634)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!211569 () (_ BitVec 32))

(assert (=> b!136101 (= lt!211569 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!136101 (= lt!211570 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2804 (buf!3197 thiss!1634)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634))))))

(declare-fun b!136102 () Bool)

(declare-fun e!90360 () Bool)

(assert (=> b!136102 (= e!90361 e!90360)))

(declare-fun c!7697 () Bool)

(assert (=> b!136102 (= c!7697 (= (_3!319 lt!211570) (_4!59 lt!211570)))))

(declare-fun b!136103 () Bool)

(assert (=> b!136103 (= e!90360 e!90365)))

(declare-fun res!113248 () Bool)

(assert (=> b!136103 (= res!113248 (byteRangesEq!0 (select (arr!3469 (buf!3197 thiss!1634)) (_3!319 lt!211570)) (select (arr!3469 (buf!3197 (_2!6230 lt!210693))) (_3!319 lt!211570)) lt!211569 #b00000000000000000000000000001000))))

(assert (=> b!136103 (=> (not res!113248) (not e!90365))))

(declare-fun bm!1768 () Bool)

(assert (=> bm!1768 (= call!1771 (byteRangesEq!0 (ite c!7697 (select (arr!3469 (buf!3197 thiss!1634)) (_3!319 lt!211570)) (select (arr!3469 (buf!3197 thiss!1634)) (_4!59 lt!211570))) (ite c!7697 (select (arr!3469 (buf!3197 (_2!6230 lt!210693))) (_3!319 lt!211570)) (select (arr!3469 (buf!3197 (_2!6230 lt!210693))) (_4!59 lt!211570))) (ite c!7697 lt!211569 #b00000000000000000000000000000000) lt!211571))))

(declare-fun b!136104 () Bool)

(assert (=> b!136104 (= e!90360 call!1771)))

(assert (= (and d!43736 (not res!113249)) b!136101))

(assert (= (and b!136101 (not res!113247)) b!136099))

(assert (= (and b!136101 res!113250) b!136102))

(assert (= (and b!136102 c!7697) b!136104))

(assert (= (and b!136102 (not c!7697)) b!136103))

(assert (= (and b!136103 res!113248) b!136098))

(assert (= (and b!136098 (not res!113246)) b!136100))

(assert (= (or b!136104 b!136100) bm!1768))

(declare-fun m!208037 () Bool)

(assert (=> b!136099 m!208037))

(assert (=> b!136101 m!207197))

(declare-fun m!208039 () Bool)

(assert (=> b!136101 m!208039))

(declare-fun m!208041 () Bool)

(assert (=> b!136103 m!208041))

(declare-fun m!208043 () Bool)

(assert (=> b!136103 m!208043))

(assert (=> b!136103 m!208041))

(assert (=> b!136103 m!208043))

(declare-fun m!208045 () Bool)

(assert (=> b!136103 m!208045))

(declare-fun m!208047 () Bool)

(assert (=> bm!1768 m!208047))

(declare-fun m!208049 () Bool)

(assert (=> bm!1768 m!208049))

(assert (=> bm!1768 m!208041))

(declare-fun m!208051 () Bool)

(assert (=> bm!1768 m!208051))

(assert (=> bm!1768 m!208043))

(assert (=> b!136011 d!43736))

(assert (=> b!136011 d!43611))

(declare-fun d!43738 () Bool)

(declare-fun e!90366 () Bool)

(assert (=> d!43738 e!90366))

(declare-fun res!113251 () Bool)

(assert (=> d!43738 (=> (not res!113251) (not e!90366))))

(declare-fun lt!211573 () (_ BitVec 64))

(declare-fun lt!211577 () (_ BitVec 64))

(declare-fun lt!211575 () (_ BitVec 64))

(assert (=> d!43738 (= res!113251 (= lt!211577 (bvsub lt!211575 lt!211573)))))

(assert (=> d!43738 (or (= (bvand lt!211575 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!211573 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!211575 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!211575 lt!211573) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!43738 (= lt!211573 (remainingBits!0 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!211466)))) ((_ sign_extend 32) (currentByte!5994 (_2!6230 lt!211466))) ((_ sign_extend 32) (currentBit!5989 (_2!6230 lt!211466)))))))

(declare-fun lt!211572 () (_ BitVec 64))

(declare-fun lt!211574 () (_ BitVec 64))

(assert (=> d!43738 (= lt!211575 (bvmul lt!211572 lt!211574))))

(assert (=> d!43738 (or (= lt!211572 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!211574 (bvsdiv (bvmul lt!211572 lt!211574) lt!211572)))))

(assert (=> d!43738 (= lt!211574 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!43738 (= lt!211572 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!211466)))))))

(assert (=> d!43738 (= lt!211577 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5994 (_2!6230 lt!211466))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5989 (_2!6230 lt!211466)))))))

(assert (=> d!43738 (invariant!0 (currentBit!5989 (_2!6230 lt!211466)) (currentByte!5994 (_2!6230 lt!211466)) (size!2804 (buf!3197 (_2!6230 lt!211466))))))

(assert (=> d!43738 (= (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!211466))) (currentByte!5994 (_2!6230 lt!211466)) (currentBit!5989 (_2!6230 lt!211466))) lt!211577)))

(declare-fun b!136105 () Bool)

(declare-fun res!113252 () Bool)

(assert (=> b!136105 (=> (not res!113252) (not e!90366))))

(assert (=> b!136105 (= res!113252 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!211577))))

(declare-fun b!136106 () Bool)

(declare-fun lt!211576 () (_ BitVec 64))

(assert (=> b!136106 (= e!90366 (bvsle lt!211577 (bvmul lt!211576 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!136106 (or (= lt!211576 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!211576 #b0000000000000000000000000000000000000000000000000000000000001000) lt!211576)))))

(assert (=> b!136106 (= lt!211576 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!211466)))))))

(assert (= (and d!43738 res!113251) b!136105))

(assert (= (and b!136105 res!113252) b!136106))

(declare-fun m!208053 () Bool)

(assert (=> d!43738 m!208053))

(declare-fun m!208055 () Bool)

(assert (=> d!43738 m!208055))

(assert (=> b!136022 d!43738))

(assert (=> b!136022 d!43611))

(declare-fun d!43740 () Bool)

(assert (=> d!43740 (= (remainingBits!0 ((_ sign_extend 32) (size!2804 (buf!3197 thiss!1634))) ((_ sign_extend 32) (currentByte!5994 thiss!1634)) ((_ sign_extend 32) (currentBit!5989 thiss!1634))) (bvsub (bvmul ((_ sign_extend 32) (size!2804 (buf!3197 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5994 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5989 thiss!1634)))))))

(assert (=> d!43611 d!43740))

(assert (=> d!43611 d!43625))

(assert (=> b!135992 d!43611))

(declare-fun d!43742 () Bool)

(assert (=> d!43742 (arrayBitRangesEq!0 (buf!3197 (_2!6230 lt!210687)) (buf!3197 thiss!1634) lt!211385 lt!211391)))

(declare-fun lt!211578 () Unit!8446)

(assert (=> d!43742 (= lt!211578 (choose!8 (buf!3197 thiss!1634) (buf!3197 (_2!6230 lt!210687)) lt!211385 lt!211391))))

(assert (=> d!43742 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!211385) (bvsle lt!211385 lt!211391))))

(assert (=> d!43742 (= (arrayBitRangesEqSymmetric!0 (buf!3197 thiss!1634) (buf!3197 (_2!6230 lt!210687)) lt!211385 lt!211391) lt!211578)))

(declare-fun bs!10673 () Bool)

(assert (= bs!10673 d!43742))

(assert (=> bs!10673 m!207847))

(declare-fun m!208057 () Bool)

(assert (=> bs!10673 m!208057))

(assert (=> b!135992 d!43742))

(declare-fun b!136107 () Bool)

(declare-fun res!113253 () Bool)

(declare-fun lt!211581 () (_ BitVec 32))

(assert (=> b!136107 (= res!113253 (= lt!211581 #b00000000000000000000000000000000))))

(declare-fun e!90369 () Bool)

(assert (=> b!136107 (=> res!113253 e!90369)))

(declare-fun e!90372 () Bool)

(assert (=> b!136107 (= e!90372 e!90369)))

(declare-fun b!136108 () Bool)

(declare-fun lt!211580 () tuple4!118)

(declare-fun e!90371 () Bool)

(assert (=> b!136108 (= e!90371 (arrayRangesEq!207 (buf!3197 (_2!6230 lt!210687)) (buf!3197 thiss!1634) (_1!6244 lt!211580) (_2!6244 lt!211580)))))

(declare-fun b!136109 () Bool)

(declare-fun call!1772 () Bool)

(assert (=> b!136109 (= e!90369 call!1772)))

(declare-fun d!43744 () Bool)

(declare-fun res!113256 () Bool)

(declare-fun e!90370 () Bool)

(assert (=> d!43744 (=> res!113256 e!90370)))

(assert (=> d!43744 (= res!113256 (bvsge lt!211385 lt!211391))))

(assert (=> d!43744 (= (arrayBitRangesEq!0 (buf!3197 (_2!6230 lt!210687)) (buf!3197 thiss!1634) lt!211385 lt!211391) e!90370)))

(declare-fun b!136110 () Bool)

(declare-fun e!90368 () Bool)

(assert (=> b!136110 (= e!90370 e!90368)))

(declare-fun res!113257 () Bool)

(assert (=> b!136110 (=> (not res!113257) (not e!90368))))

(assert (=> b!136110 (= res!113257 e!90371)))

(declare-fun res!113254 () Bool)

(assert (=> b!136110 (=> res!113254 e!90371)))

(assert (=> b!136110 (= res!113254 (bvsge (_1!6244 lt!211580) (_2!6244 lt!211580)))))

(assert (=> b!136110 (= lt!211581 ((_ extract 31 0) (bvsrem lt!211391 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!211579 () (_ BitVec 32))

(assert (=> b!136110 (= lt!211579 ((_ extract 31 0) (bvsrem lt!211385 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!136110 (= lt!211580 (arrayBitIndices!0 lt!211385 lt!211391))))

(declare-fun b!136111 () Bool)

(declare-fun e!90367 () Bool)

(assert (=> b!136111 (= e!90368 e!90367)))

(declare-fun c!7698 () Bool)

(assert (=> b!136111 (= c!7698 (= (_3!319 lt!211580) (_4!59 lt!211580)))))

(declare-fun b!136112 () Bool)

(assert (=> b!136112 (= e!90367 e!90372)))

(declare-fun res!113255 () Bool)

(assert (=> b!136112 (= res!113255 (byteRangesEq!0 (select (arr!3469 (buf!3197 (_2!6230 lt!210687))) (_3!319 lt!211580)) (select (arr!3469 (buf!3197 thiss!1634)) (_3!319 lt!211580)) lt!211579 #b00000000000000000000000000001000))))

(assert (=> b!136112 (=> (not res!113255) (not e!90372))))

(declare-fun bm!1769 () Bool)

(assert (=> bm!1769 (= call!1772 (byteRangesEq!0 (ite c!7698 (select (arr!3469 (buf!3197 (_2!6230 lt!210687))) (_3!319 lt!211580)) (select (arr!3469 (buf!3197 (_2!6230 lt!210687))) (_4!59 lt!211580))) (ite c!7698 (select (arr!3469 (buf!3197 thiss!1634)) (_3!319 lt!211580)) (select (arr!3469 (buf!3197 thiss!1634)) (_4!59 lt!211580))) (ite c!7698 lt!211579 #b00000000000000000000000000000000) lt!211581))))

(declare-fun b!136113 () Bool)

(assert (=> b!136113 (= e!90367 call!1772)))

(assert (= (and d!43744 (not res!113256)) b!136110))

(assert (= (and b!136110 (not res!113254)) b!136108))

(assert (= (and b!136110 res!113257) b!136111))

(assert (= (and b!136111 c!7698) b!136113))

(assert (= (and b!136111 (not c!7698)) b!136112))

(assert (= (and b!136112 res!113255) b!136107))

(assert (= (and b!136107 (not res!113253)) b!136109))

(assert (= (or b!136113 b!136109) bm!1769))

(declare-fun m!208059 () Bool)

(assert (=> b!136108 m!208059))

(declare-fun m!208061 () Bool)

(assert (=> b!136110 m!208061))

(declare-fun m!208063 () Bool)

(assert (=> b!136112 m!208063))

(declare-fun m!208065 () Bool)

(assert (=> b!136112 m!208065))

(assert (=> b!136112 m!208063))

(assert (=> b!136112 m!208065))

(declare-fun m!208067 () Bool)

(assert (=> b!136112 m!208067))

(declare-fun m!208069 () Bool)

(assert (=> bm!1769 m!208069))

(declare-fun m!208071 () Bool)

(assert (=> bm!1769 m!208071))

(assert (=> bm!1769 m!208063))

(declare-fun m!208073 () Bool)

(assert (=> bm!1769 m!208073))

(assert (=> bm!1769 m!208065))

(assert (=> b!135992 d!43744))

(assert (=> d!43623 d!43740))

(declare-fun d!43746 () Bool)

(declare-fun res!113258 () Bool)

(declare-fun e!90373 () Bool)

(assert (=> d!43746 (=> res!113258 e!90373)))

(assert (=> d!43746 (= res!113258 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!43746 (= (arrayRangesEq!207 arr!237 (_2!6233 lt!211515) #b00000000000000000000000000000000 to!404) e!90373)))

(declare-fun b!136114 () Bool)

(declare-fun e!90374 () Bool)

(assert (=> b!136114 (= e!90373 e!90374)))

(declare-fun res!113259 () Bool)

(assert (=> b!136114 (=> (not res!113259) (not e!90374))))

(assert (=> b!136114 (= res!113259 (= (select (arr!3469 arr!237) #b00000000000000000000000000000000) (select (arr!3469 (_2!6233 lt!211515)) #b00000000000000000000000000000000)))))

(declare-fun b!136115 () Bool)

(assert (=> b!136115 (= e!90374 (arrayRangesEq!207 arr!237 (_2!6233 lt!211515) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!43746 (not res!113258)) b!136114))

(assert (= (and b!136114 res!113259) b!136115))

(assert (=> b!136114 m!207811))

(declare-fun m!208075 () Bool)

(assert (=> b!136114 m!208075))

(declare-fun m!208077 () Bool)

(assert (=> b!136115 m!208077))

(assert (=> b!136042 d!43746))

(declare-fun d!43748 () Bool)

(assert (=> d!43748 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!210687)))) ((_ sign_extend 32) (currentByte!5994 (_2!6230 lt!210687))) ((_ sign_extend 32) (currentBit!5989 (_2!6230 lt!210687))) lt!211514) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!210687)))) ((_ sign_extend 32) (currentByte!5994 (_2!6230 lt!210687))) ((_ sign_extend 32) (currentBit!5989 (_2!6230 lt!210687)))) lt!211514))))

(declare-fun bs!10674 () Bool)

(assert (= bs!10674 d!43748))

(assert (=> bs!10674 m!207767))

(assert (=> b!136044 d!43748))

(declare-fun d!43750 () Bool)

(declare-fun e!90377 () Bool)

(assert (=> d!43750 e!90377))

(declare-fun res!113262 () Bool)

(assert (=> d!43750 (=> (not res!113262) (not e!90377))))

(declare-fun lt!211587 () (_ BitVec 64))

(declare-fun lt!211586 () BitStream!4872)

(assert (=> d!43750 (= res!113262 (= (bvadd lt!211587 (bvsub lt!211386 lt!211388)) (bitIndex!0 (size!2804 (buf!3197 lt!211586)) (currentByte!5994 lt!211586) (currentBit!5989 lt!211586))))))

(assert (=> d!43750 (or (not (= (bvand lt!211587 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!211386 lt!211388) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!211587 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!211587 (bvsub lt!211386 lt!211388)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!43750 (= lt!211587 (bitIndex!0 (size!2804 (buf!3197 (_2!6232 lt!211387))) (currentByte!5994 (_2!6232 lt!211387)) (currentBit!5989 (_2!6232 lt!211387))))))

(declare-fun moveBitIndex!0 (BitStream!4872 (_ BitVec 64)) tuple2!11828)

(assert (=> d!43750 (= lt!211586 (_2!6230 (moveBitIndex!0 (_2!6232 lt!211387) (bvsub lt!211386 lt!211388))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4872 (_ BitVec 64)) Bool)

(assert (=> d!43750 (moveBitIndexPrecond!0 (_2!6232 lt!211387) (bvsub lt!211386 lt!211388))))

(assert (=> d!43750 (= (withMovedBitIndex!0 (_2!6232 lt!211387) (bvsub lt!211386 lt!211388)) lt!211586)))

(declare-fun b!136118 () Bool)

(assert (=> b!136118 (= e!90377 (= (size!2804 (buf!3197 (_2!6232 lt!211387))) (size!2804 (buf!3197 lt!211586))))))

(assert (= (and d!43750 res!113262) b!136118))

(declare-fun m!208079 () Bool)

(assert (=> d!43750 m!208079))

(declare-fun m!208081 () Bool)

(assert (=> d!43750 m!208081))

(declare-fun m!208083 () Bool)

(assert (=> d!43750 m!208083))

(declare-fun m!208085 () Bool)

(assert (=> d!43750 m!208085))

(assert (=> b!135996 d!43750))

(assert (=> b!135996 d!43609))

(assert (=> b!135996 d!43611))

(declare-fun d!43752 () Bool)

(declare-fun res!113264 () Bool)

(declare-fun e!90379 () Bool)

(assert (=> d!43752 (=> (not res!113264) (not e!90379))))

(assert (=> d!43752 (= res!113264 (= (size!2804 (buf!3197 (_1!6232 lt!211387))) (size!2804 (buf!3197 thiss!1634))))))

(assert (=> d!43752 (= (isPrefixOf!0 (_1!6232 lt!211387) thiss!1634) e!90379)))

(declare-fun b!136119 () Bool)

(declare-fun res!113265 () Bool)

(assert (=> b!136119 (=> (not res!113265) (not e!90379))))

(assert (=> b!136119 (= res!113265 (bvsle (bitIndex!0 (size!2804 (buf!3197 (_1!6232 lt!211387))) (currentByte!5994 (_1!6232 lt!211387)) (currentBit!5989 (_1!6232 lt!211387))) (bitIndex!0 (size!2804 (buf!3197 thiss!1634)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634))))))

(declare-fun b!136120 () Bool)

(declare-fun e!90378 () Bool)

(assert (=> b!136120 (= e!90379 e!90378)))

(declare-fun res!113263 () Bool)

(assert (=> b!136120 (=> res!113263 e!90378)))

(assert (=> b!136120 (= res!113263 (= (size!2804 (buf!3197 (_1!6232 lt!211387))) #b00000000000000000000000000000000))))

(declare-fun b!136121 () Bool)

(assert (=> b!136121 (= e!90378 (arrayBitRangesEq!0 (buf!3197 (_1!6232 lt!211387)) (buf!3197 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2804 (buf!3197 (_1!6232 lt!211387))) (currentByte!5994 (_1!6232 lt!211387)) (currentBit!5989 (_1!6232 lt!211387)))))))

(assert (= (and d!43752 res!113264) b!136119))

(assert (= (and b!136119 res!113265) b!136120))

(assert (= (and b!136120 (not res!113263)) b!136121))

(declare-fun m!208087 () Bool)

(assert (=> b!136119 m!208087))

(assert (=> b!136119 m!207197))

(assert (=> b!136121 m!208087))

(assert (=> b!136121 m!208087))

(declare-fun m!208089 () Bool)

(assert (=> b!136121 m!208089))

(assert (=> b!135994 d!43752))

(assert (=> d!43689 d!43653))

(declare-fun d!43754 () Bool)

(declare-fun lt!211588 () tuple2!11848)

(assert (=> d!43754 (= lt!211588 (readByte!0 lt!211489))))

(assert (=> d!43754 (= (readBytePure!0 lt!211489) (tuple2!11831 (_2!6243 lt!211588) (_1!6243 lt!211588)))))

(declare-fun bs!10675 () Bool)

(assert (= bs!10675 d!43754))

(declare-fun m!208091 () Bool)

(assert (=> bs!10675 m!208091))

(assert (=> d!43689 d!43754))

(declare-fun d!43756 () Bool)

(declare-fun e!90382 () Bool)

(assert (=> d!43756 e!90382))

(declare-fun res!113268 () Bool)

(assert (=> d!43756 (=> (not res!113268) (not e!90382))))

(declare-fun lt!211594 () tuple2!11830)

(declare-fun lt!211593 () tuple2!11830)

(assert (=> d!43756 (= res!113268 (= (bitIndex!0 (size!2804 (buf!3197 (_1!6231 lt!211594))) (currentByte!5994 (_1!6231 lt!211594)) (currentBit!5989 (_1!6231 lt!211594))) (bitIndex!0 (size!2804 (buf!3197 (_1!6231 lt!211593))) (currentByte!5994 (_1!6231 lt!211593)) (currentBit!5989 (_1!6231 lt!211593)))))))

(assert (=> d!43756 (= lt!211593 (readBytePure!0 (BitStream!4873 (buf!3197 (_2!6230 lt!210693)) (currentByte!5994 lt!210689) (currentBit!5989 lt!210689))))))

(assert (=> d!43756 (= lt!211594 (readBytePure!0 lt!210689))))

(assert (=> d!43756 true))

(declare-fun _$8!66 () Unit!8446)

(assert (=> d!43756 (= (choose!14 lt!210689 (_2!6230 lt!210693) lt!211489 lt!211490 (tuple2!11831 (_1!6231 lt!211490) (_2!6231 lt!211490)) (_1!6231 lt!211490) (_2!6231 lt!211490) lt!211488 (tuple2!11831 (_1!6231 lt!211488) (_2!6231 lt!211488)) (_1!6231 lt!211488) (_2!6231 lt!211488)) _$8!66)))

(declare-fun b!136124 () Bool)

(assert (=> b!136124 (= e!90382 (= (_2!6231 lt!211594) (_2!6231 lt!211593)))))

(assert (= (and d!43756 res!113268) b!136124))

(declare-fun m!208093 () Bool)

(assert (=> d!43756 m!208093))

(declare-fun m!208095 () Bool)

(assert (=> d!43756 m!208095))

(declare-fun m!208097 () Bool)

(assert (=> d!43756 m!208097))

(assert (=> d!43756 m!207227))

(assert (=> d!43689 d!43756))

(declare-fun d!43758 () Bool)

(declare-fun e!90383 () Bool)

(assert (=> d!43758 e!90383))

(declare-fun res!113269 () Bool)

(assert (=> d!43758 (=> (not res!113269) (not e!90383))))

(declare-fun lt!211600 () (_ BitVec 64))

(declare-fun lt!211598 () (_ BitVec 64))

(declare-fun lt!211596 () (_ BitVec 64))

(assert (=> d!43758 (= res!113269 (= lt!211600 (bvsub lt!211598 lt!211596)))))

(assert (=> d!43758 (or (= (bvand lt!211598 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!211596 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!211598 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!211598 lt!211596) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!43758 (= lt!211596 (remainingBits!0 ((_ sign_extend 32) (size!2804 (buf!3197 (_1!6231 lt!211488)))) ((_ sign_extend 32) (currentByte!5994 (_1!6231 lt!211488))) ((_ sign_extend 32) (currentBit!5989 (_1!6231 lt!211488)))))))

(declare-fun lt!211595 () (_ BitVec 64))

(declare-fun lt!211597 () (_ BitVec 64))

(assert (=> d!43758 (= lt!211598 (bvmul lt!211595 lt!211597))))

(assert (=> d!43758 (or (= lt!211595 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!211597 (bvsdiv (bvmul lt!211595 lt!211597) lt!211595)))))

(assert (=> d!43758 (= lt!211597 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!43758 (= lt!211595 ((_ sign_extend 32) (size!2804 (buf!3197 (_1!6231 lt!211488)))))))

(assert (=> d!43758 (= lt!211600 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5994 (_1!6231 lt!211488))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5989 (_1!6231 lt!211488)))))))

(assert (=> d!43758 (invariant!0 (currentBit!5989 (_1!6231 lt!211488)) (currentByte!5994 (_1!6231 lt!211488)) (size!2804 (buf!3197 (_1!6231 lt!211488))))))

(assert (=> d!43758 (= (bitIndex!0 (size!2804 (buf!3197 (_1!6231 lt!211488))) (currentByte!5994 (_1!6231 lt!211488)) (currentBit!5989 (_1!6231 lt!211488))) lt!211600)))

(declare-fun b!136125 () Bool)

(declare-fun res!113270 () Bool)

(assert (=> b!136125 (=> (not res!113270) (not e!90383))))

(assert (=> b!136125 (= res!113270 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!211600))))

(declare-fun b!136126 () Bool)

(declare-fun lt!211599 () (_ BitVec 64))

(assert (=> b!136126 (= e!90383 (bvsle lt!211600 (bvmul lt!211599 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!136126 (or (= lt!211599 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!211599 #b0000000000000000000000000000000000000000000000000000000000001000) lt!211599)))))

(assert (=> b!136126 (= lt!211599 ((_ sign_extend 32) (size!2804 (buf!3197 (_1!6231 lt!211488)))))))

(assert (= (and d!43758 res!113269) b!136125))

(assert (= (and b!136125 res!113270) b!136126))

(declare-fun m!208099 () Bool)

(assert (=> d!43758 m!208099))

(declare-fun m!208101 () Bool)

(assert (=> d!43758 m!208101))

(assert (=> d!43689 d!43758))

(declare-fun d!43760 () Bool)

(declare-fun e!90384 () Bool)

(assert (=> d!43760 e!90384))

(declare-fun res!113271 () Bool)

(assert (=> d!43760 (=> (not res!113271) (not e!90384))))

(declare-fun lt!211604 () (_ BitVec 64))

(declare-fun lt!211606 () (_ BitVec 64))

(declare-fun lt!211602 () (_ BitVec 64))

(assert (=> d!43760 (= res!113271 (= lt!211606 (bvsub lt!211604 lt!211602)))))

(assert (=> d!43760 (or (= (bvand lt!211604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!211602 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!211604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!211604 lt!211602) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!43760 (= lt!211602 (remainingBits!0 ((_ sign_extend 32) (size!2804 (buf!3197 (_1!6231 lt!211490)))) ((_ sign_extend 32) (currentByte!5994 (_1!6231 lt!211490))) ((_ sign_extend 32) (currentBit!5989 (_1!6231 lt!211490)))))))

(declare-fun lt!211601 () (_ BitVec 64))

(declare-fun lt!211603 () (_ BitVec 64))

(assert (=> d!43760 (= lt!211604 (bvmul lt!211601 lt!211603))))

(assert (=> d!43760 (or (= lt!211601 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!211603 (bvsdiv (bvmul lt!211601 lt!211603) lt!211601)))))

(assert (=> d!43760 (= lt!211603 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!43760 (= lt!211601 ((_ sign_extend 32) (size!2804 (buf!3197 (_1!6231 lt!211490)))))))

(assert (=> d!43760 (= lt!211606 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5994 (_1!6231 lt!211490))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5989 (_1!6231 lt!211490)))))))

(assert (=> d!43760 (invariant!0 (currentBit!5989 (_1!6231 lt!211490)) (currentByte!5994 (_1!6231 lt!211490)) (size!2804 (buf!3197 (_1!6231 lt!211490))))))

(assert (=> d!43760 (= (bitIndex!0 (size!2804 (buf!3197 (_1!6231 lt!211490))) (currentByte!5994 (_1!6231 lt!211490)) (currentBit!5989 (_1!6231 lt!211490))) lt!211606)))

(declare-fun b!136127 () Bool)

(declare-fun res!113272 () Bool)

(assert (=> b!136127 (=> (not res!113272) (not e!90384))))

(assert (=> b!136127 (= res!113272 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!211606))))

(declare-fun b!136128 () Bool)

(declare-fun lt!211605 () (_ BitVec 64))

(assert (=> b!136128 (= e!90384 (bvsle lt!211606 (bvmul lt!211605 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!136128 (or (= lt!211605 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!211605 #b0000000000000000000000000000000000000000000000000000000000001000) lt!211605)))))

(assert (=> b!136128 (= lt!211605 ((_ sign_extend 32) (size!2804 (buf!3197 (_1!6231 lt!211490)))))))

(assert (= (and d!43760 res!113271) b!136127))

(assert (= (and b!136127 res!113272) b!136128))

(declare-fun m!208103 () Bool)

(assert (=> d!43760 m!208103))

(declare-fun m!208105 () Bool)

(assert (=> d!43760 m!208105))

(assert (=> d!43689 d!43760))

(declare-fun d!43762 () Bool)

(declare-fun lt!211611 () (_ BitVec 8))

(declare-fun lt!211612 () (_ BitVec 8))

(assert (=> d!43762 (= lt!211611 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3469 (buf!3197 lt!210689)) (currentByte!5994 lt!210689))) ((_ sign_extend 24) lt!211612))))))

(assert (=> d!43762 (= lt!211612 ((_ extract 7 0) (currentBit!5989 lt!210689)))))

(declare-fun e!90386 () Bool)

(assert (=> d!43762 e!90386))

(declare-fun res!113274 () Bool)

(assert (=> d!43762 (=> (not res!113274) (not e!90386))))

(assert (=> d!43762 (= res!113274 (validate_offset_bits!1 ((_ sign_extend 32) (size!2804 (buf!3197 lt!210689))) ((_ sign_extend 32) (currentByte!5994 lt!210689)) ((_ sign_extend 32) (currentBit!5989 lt!210689)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!8463 () Unit!8446)

(declare-fun Unit!8464 () Unit!8446)

(assert (=> d!43762 (= (readByte!0 lt!210689) (tuple2!11849 (_2!6245 (ite (bvsgt ((_ sign_extend 24) lt!211612) #b00000000000000000000000000000000) (tuple2!11851 Unit!8463 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!211611) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3469 (buf!3197 lt!210689)) (bvadd (currentByte!5994 lt!210689) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!211612)))))))) (tuple2!11851 Unit!8464 lt!211611))) (BitStream!4873 (buf!3197 lt!210689) (bvadd (currentByte!5994 lt!210689) #b00000000000000000000000000000001) (currentBit!5989 lt!210689))))))

(declare-fun b!136129 () Bool)

(declare-fun e!90385 () Bool)

(assert (=> b!136129 (= e!90386 e!90385)))

(declare-fun res!113273 () Bool)

(assert (=> b!136129 (=> (not res!113273) (not e!90385))))

(declare-fun lt!211610 () tuple2!11848)

(assert (=> b!136129 (= res!113273 (= (buf!3197 (_2!6243 lt!211610)) (buf!3197 lt!210689)))))

(declare-fun lt!211613 () (_ BitVec 8))

(declare-fun lt!211609 () (_ BitVec 8))

(declare-fun Unit!8465 () Unit!8446)

(declare-fun Unit!8466 () Unit!8446)

(assert (=> b!136129 (= lt!211610 (tuple2!11849 (_2!6245 (ite (bvsgt ((_ sign_extend 24) lt!211609) #b00000000000000000000000000000000) (tuple2!11851 Unit!8465 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!211613) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3469 (buf!3197 lt!210689)) (bvadd (currentByte!5994 lt!210689) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!211609)))))))) (tuple2!11851 Unit!8466 lt!211613))) (BitStream!4873 (buf!3197 lt!210689) (bvadd (currentByte!5994 lt!210689) #b00000000000000000000000000000001) (currentBit!5989 lt!210689))))))

(assert (=> b!136129 (= lt!211613 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3469 (buf!3197 lt!210689)) (currentByte!5994 lt!210689))) ((_ sign_extend 24) lt!211609))))))

(assert (=> b!136129 (= lt!211609 ((_ extract 7 0) (currentBit!5989 lt!210689)))))

(declare-fun b!136130 () Bool)

(declare-fun lt!211607 () (_ BitVec 64))

(declare-fun lt!211608 () (_ BitVec 64))

(assert (=> b!136130 (= e!90385 (= (bitIndex!0 (size!2804 (buf!3197 (_2!6243 lt!211610))) (currentByte!5994 (_2!6243 lt!211610)) (currentBit!5989 (_2!6243 lt!211610))) (bvadd lt!211608 lt!211607)))))

(assert (=> b!136130 (or (not (= (bvand lt!211608 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!211607 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!211608 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!211608 lt!211607) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!136130 (= lt!211607 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!136130 (= lt!211608 (bitIndex!0 (size!2804 (buf!3197 lt!210689)) (currentByte!5994 lt!210689) (currentBit!5989 lt!210689)))))

(assert (= (and d!43762 res!113274) b!136129))

(assert (= (and b!136129 res!113273) b!136130))

(declare-fun m!208107 () Bool)

(assert (=> d!43762 m!208107))

(declare-fun m!208109 () Bool)

(assert (=> d!43762 m!208109))

(declare-fun m!208111 () Bool)

(assert (=> d!43762 m!208111))

(assert (=> b!136129 m!208111))

(assert (=> b!136129 m!208107))

(declare-fun m!208113 () Bool)

(assert (=> b!136130 m!208113))

(declare-fun m!208115 () Bool)

(assert (=> b!136130 m!208115))

(assert (=> d!43653 d!43762))

(declare-fun d!43764 () Bool)

(assert (=> d!43764 (= (remainingBits!0 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!210693)))) ((_ sign_extend 32) (currentByte!5994 thiss!1634)) ((_ sign_extend 32) (currentBit!5989 thiss!1634))) (bvsub (bvmul ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!210693)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5994 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5989 thiss!1634)))))))

(assert (=> d!43677 d!43764))

(declare-fun d!43766 () Bool)

(assert (=> d!43766 (= (remainingBits!0 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!210693)))) ((_ sign_extend 32) (currentByte!5994 (_2!6230 lt!210687))) ((_ sign_extend 32) (currentBit!5989 (_2!6230 lt!210687)))) (bvsub (bvmul ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!210693)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5994 (_2!6230 lt!210687))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5989 (_2!6230 lt!210687))))))))

(assert (=> d!43617 d!43766))

(declare-fun d!43768 () Bool)

(declare-fun res!113276 () Bool)

(declare-fun e!90388 () Bool)

(assert (=> d!43768 (=> (not res!113276) (not e!90388))))

(assert (=> d!43768 (= res!113276 (= (size!2804 (buf!3197 (_2!6232 lt!211414))) (size!2804 (buf!3197 (_2!6230 lt!210693)))))))

(assert (=> d!43768 (= (isPrefixOf!0 (_2!6232 lt!211414) (_2!6230 lt!210693)) e!90388)))

(declare-fun b!136131 () Bool)

(declare-fun res!113277 () Bool)

(assert (=> b!136131 (=> (not res!113277) (not e!90388))))

(assert (=> b!136131 (= res!113277 (bvsle (bitIndex!0 (size!2804 (buf!3197 (_2!6232 lt!211414))) (currentByte!5994 (_2!6232 lt!211414)) (currentBit!5989 (_2!6232 lt!211414))) (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!210693))) (currentByte!5994 (_2!6230 lt!210693)) (currentBit!5989 (_2!6230 lt!210693)))))))

(declare-fun b!136132 () Bool)

(declare-fun e!90387 () Bool)

(assert (=> b!136132 (= e!90388 e!90387)))

(declare-fun res!113275 () Bool)

(assert (=> b!136132 (=> res!113275 e!90387)))

(assert (=> b!136132 (= res!113275 (= (size!2804 (buf!3197 (_2!6232 lt!211414))) #b00000000000000000000000000000000))))

(declare-fun b!136133 () Bool)

(assert (=> b!136133 (= e!90387 (arrayBitRangesEq!0 (buf!3197 (_2!6232 lt!211414)) (buf!3197 (_2!6230 lt!210693)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2804 (buf!3197 (_2!6232 lt!211414))) (currentByte!5994 (_2!6232 lt!211414)) (currentBit!5989 (_2!6232 lt!211414)))))))

(assert (= (and d!43768 res!113276) b!136131))

(assert (= (and b!136131 res!113277) b!136132))

(assert (= (and b!136132 (not res!113275)) b!136133))

(assert (=> b!136131 m!208011))

(assert (=> b!136131 m!207203))

(assert (=> b!136133 m!208011))

(assert (=> b!136133 m!208011))

(declare-fun m!208117 () Bool)

(assert (=> b!136133 m!208117))

(assert (=> b!136005 d!43768))

(assert (=> d!43637 d!43643))

(declare-fun d!43770 () Bool)

(declare-fun res!113279 () Bool)

(declare-fun e!90390 () Bool)

(assert (=> d!43770 (=> (not res!113279) (not e!90390))))

(assert (=> d!43770 (= res!113279 (= (size!2804 (buf!3197 (_1!6232 lt!211387))) (size!2804 (buf!3197 (_2!6232 lt!211387)))))))

(assert (=> d!43770 (= (isPrefixOf!0 (_1!6232 lt!211387) (_2!6232 lt!211387)) e!90390)))

(declare-fun b!136134 () Bool)

(declare-fun res!113280 () Bool)

(assert (=> b!136134 (=> (not res!113280) (not e!90390))))

(assert (=> b!136134 (= res!113280 (bvsle (bitIndex!0 (size!2804 (buf!3197 (_1!6232 lt!211387))) (currentByte!5994 (_1!6232 lt!211387)) (currentBit!5989 (_1!6232 lt!211387))) (bitIndex!0 (size!2804 (buf!3197 (_2!6232 lt!211387))) (currentByte!5994 (_2!6232 lt!211387)) (currentBit!5989 (_2!6232 lt!211387)))))))

(declare-fun b!136135 () Bool)

(declare-fun e!90389 () Bool)

(assert (=> b!136135 (= e!90390 e!90389)))

(declare-fun res!113278 () Bool)

(assert (=> b!136135 (=> res!113278 e!90389)))

(assert (=> b!136135 (= res!113278 (= (size!2804 (buf!3197 (_1!6232 lt!211387))) #b00000000000000000000000000000000))))

(declare-fun b!136136 () Bool)

(assert (=> b!136136 (= e!90389 (arrayBitRangesEq!0 (buf!3197 (_1!6232 lt!211387)) (buf!3197 (_2!6232 lt!211387)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2804 (buf!3197 (_1!6232 lt!211387))) (currentByte!5994 (_1!6232 lt!211387)) (currentBit!5989 (_1!6232 lt!211387)))))))

(assert (= (and d!43770 res!113279) b!136134))

(assert (= (and b!136134 res!113280) b!136135))

(assert (= (and b!136135 (not res!113278)) b!136136))

(assert (=> b!136134 m!208087))

(assert (=> b!136134 m!208081))

(assert (=> b!136136 m!208087))

(assert (=> b!136136 m!208087))

(declare-fun m!208119 () Bool)

(assert (=> b!136136 m!208119))

(assert (=> d!43637 d!43770))

(declare-fun d!43772 () Bool)

(assert (=> d!43772 (isPrefixOf!0 (_2!6230 lt!210687) (_2!6230 lt!210687))))

(declare-fun lt!211614 () Unit!8446)

(assert (=> d!43772 (= lt!211614 (choose!11 (_2!6230 lt!210687)))))

(assert (=> d!43772 (= (lemmaIsPrefixRefl!0 (_2!6230 lt!210687)) lt!211614)))

(declare-fun bs!10676 () Bool)

(assert (= bs!10676 d!43772))

(assert (=> bs!10676 m!207801))

(declare-fun m!208121 () Bool)

(assert (=> bs!10676 m!208121))

(assert (=> d!43637 d!43772))

(assert (=> d!43637 d!43726))

(declare-fun d!43774 () Bool)

(declare-fun res!113282 () Bool)

(declare-fun e!90392 () Bool)

(assert (=> d!43774 (=> (not res!113282) (not e!90392))))

(assert (=> d!43774 (= res!113282 (= (size!2804 (buf!3197 (_2!6230 lt!210687))) (size!2804 (buf!3197 (_2!6230 lt!210687)))))))

(assert (=> d!43774 (= (isPrefixOf!0 (_2!6230 lt!210687) (_2!6230 lt!210687)) e!90392)))

(declare-fun b!136137 () Bool)

(declare-fun res!113283 () Bool)

(assert (=> b!136137 (=> (not res!113283) (not e!90392))))

(assert (=> b!136137 (= res!113283 (bvsle (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!210687))) (currentByte!5994 (_2!6230 lt!210687)) (currentBit!5989 (_2!6230 lt!210687))) (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!210687))) (currentByte!5994 (_2!6230 lt!210687)) (currentBit!5989 (_2!6230 lt!210687)))))))

(declare-fun b!136138 () Bool)

(declare-fun e!90391 () Bool)

(assert (=> b!136138 (= e!90392 e!90391)))

(declare-fun res!113281 () Bool)

(assert (=> b!136138 (=> res!113281 e!90391)))

(assert (=> b!136138 (= res!113281 (= (size!2804 (buf!3197 (_2!6230 lt!210687))) #b00000000000000000000000000000000))))

(declare-fun b!136139 () Bool)

(assert (=> b!136139 (= e!90391 (arrayBitRangesEq!0 (buf!3197 (_2!6230 lt!210687)) (buf!3197 (_2!6230 lt!210687)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!210687))) (currentByte!5994 (_2!6230 lt!210687)) (currentBit!5989 (_2!6230 lt!210687)))))))

(assert (= (and d!43774 res!113282) b!136137))

(assert (= (and b!136137 res!113283) b!136138))

(assert (= (and b!136138 (not res!113281)) b!136139))

(assert (=> b!136137 m!207195))

(assert (=> b!136137 m!207195))

(assert (=> b!136139 m!207195))

(assert (=> b!136139 m!207195))

(declare-fun m!208123 () Bool)

(assert (=> b!136139 m!208123))

(assert (=> d!43637 d!43774))

(assert (=> d!43637 d!43730))

(declare-fun d!43776 () Bool)

(assert (=> d!43776 (isPrefixOf!0 lt!211398 (_2!6230 lt!210687))))

(declare-fun lt!211615 () Unit!8446)

(assert (=> d!43776 (= lt!211615 (choose!30 lt!211398 (_2!6230 lt!210687) (_2!6230 lt!210687)))))

(assert (=> d!43776 (isPrefixOf!0 lt!211398 (_2!6230 lt!210687))))

(assert (=> d!43776 (= (lemmaIsPrefixTransitive!0 lt!211398 (_2!6230 lt!210687) (_2!6230 lt!210687)) lt!211615)))

(declare-fun bs!10677 () Bool)

(assert (= bs!10677 d!43776))

(assert (=> bs!10677 m!207839))

(declare-fun m!208125 () Bool)

(assert (=> bs!10677 m!208125))

(assert (=> bs!10677 m!207839))

(assert (=> d!43637 d!43776))

(declare-fun d!43778 () Bool)

(assert (=> d!43778 (isPrefixOf!0 lt!211398 (_2!6230 lt!210687))))

(declare-fun lt!211616 () Unit!8446)

(assert (=> d!43778 (= lt!211616 (choose!30 lt!211398 thiss!1634 (_2!6230 lt!210687)))))

(assert (=> d!43778 (isPrefixOf!0 lt!211398 thiss!1634)))

(assert (=> d!43778 (= (lemmaIsPrefixTransitive!0 lt!211398 thiss!1634 (_2!6230 lt!210687)) lt!211616)))

(declare-fun bs!10678 () Bool)

(assert (= bs!10678 d!43778))

(assert (=> bs!10678 m!207839))

(declare-fun m!208127 () Bool)

(assert (=> bs!10678 m!208127))

(declare-fun m!208129 () Bool)

(assert (=> bs!10678 m!208129))

(assert (=> d!43637 d!43778))

(declare-fun d!43780 () Bool)

(declare-fun res!113285 () Bool)

(declare-fun e!90394 () Bool)

(assert (=> d!43780 (=> (not res!113285) (not e!90394))))

(assert (=> d!43780 (= res!113285 (= (size!2804 (buf!3197 lt!211398)) (size!2804 (buf!3197 (_2!6230 lt!210687)))))))

(assert (=> d!43780 (= (isPrefixOf!0 lt!211398 (_2!6230 lt!210687)) e!90394)))

(declare-fun b!136140 () Bool)

(declare-fun res!113286 () Bool)

(assert (=> b!136140 (=> (not res!113286) (not e!90394))))

(assert (=> b!136140 (= res!113286 (bvsle (bitIndex!0 (size!2804 (buf!3197 lt!211398)) (currentByte!5994 lt!211398) (currentBit!5989 lt!211398)) (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!210687))) (currentByte!5994 (_2!6230 lt!210687)) (currentBit!5989 (_2!6230 lt!210687)))))))

(declare-fun b!136141 () Bool)

(declare-fun e!90393 () Bool)

(assert (=> b!136141 (= e!90394 e!90393)))

(declare-fun res!113284 () Bool)

(assert (=> b!136141 (=> res!113284 e!90393)))

(assert (=> b!136141 (= res!113284 (= (size!2804 (buf!3197 lt!211398)) #b00000000000000000000000000000000))))

(declare-fun b!136142 () Bool)

(assert (=> b!136142 (= e!90393 (arrayBitRangesEq!0 (buf!3197 lt!211398) (buf!3197 (_2!6230 lt!210687)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2804 (buf!3197 lt!211398)) (currentByte!5994 lt!211398) (currentBit!5989 lt!211398))))))

(assert (= (and d!43780 res!113285) b!136140))

(assert (= (and b!136140 res!113286) b!136141))

(assert (= (and b!136141 (not res!113284)) b!136142))

(declare-fun m!208131 () Bool)

(assert (=> b!136140 m!208131))

(assert (=> b!136140 m!207195))

(assert (=> b!136142 m!208131))

(assert (=> b!136142 m!208131))

(declare-fun m!208133 () Bool)

(assert (=> b!136142 m!208133))

(assert (=> d!43637 d!43780))

(declare-fun d!43782 () Bool)

(assert (=> d!43782 (isPrefixOf!0 lt!211398 lt!211398)))

(declare-fun lt!211617 () Unit!8446)

(assert (=> d!43782 (= lt!211617 (choose!11 lt!211398))))

(assert (=> d!43782 (= (lemmaIsPrefixRefl!0 lt!211398) lt!211617)))

(declare-fun bs!10679 () Bool)

(assert (= bs!10679 d!43782))

(assert (=> bs!10679 m!207841))

(declare-fun m!208135 () Bool)

(assert (=> bs!10679 m!208135))

(assert (=> d!43637 d!43782))

(declare-fun d!43784 () Bool)

(declare-fun res!113288 () Bool)

(declare-fun e!90396 () Bool)

(assert (=> d!43784 (=> (not res!113288) (not e!90396))))

(assert (=> d!43784 (= res!113288 (= (size!2804 (buf!3197 lt!211398)) (size!2804 (buf!3197 lt!211398))))))

(assert (=> d!43784 (= (isPrefixOf!0 lt!211398 lt!211398) e!90396)))

(declare-fun b!136143 () Bool)

(declare-fun res!113289 () Bool)

(assert (=> b!136143 (=> (not res!113289) (not e!90396))))

(assert (=> b!136143 (= res!113289 (bvsle (bitIndex!0 (size!2804 (buf!3197 lt!211398)) (currentByte!5994 lt!211398) (currentBit!5989 lt!211398)) (bitIndex!0 (size!2804 (buf!3197 lt!211398)) (currentByte!5994 lt!211398) (currentBit!5989 lt!211398))))))

(declare-fun b!136144 () Bool)

(declare-fun e!90395 () Bool)

(assert (=> b!136144 (= e!90396 e!90395)))

(declare-fun res!113287 () Bool)

(assert (=> b!136144 (=> res!113287 e!90395)))

(assert (=> b!136144 (= res!113287 (= (size!2804 (buf!3197 lt!211398)) #b00000000000000000000000000000000))))

(declare-fun b!136145 () Bool)

(assert (=> b!136145 (= e!90395 (arrayBitRangesEq!0 (buf!3197 lt!211398) (buf!3197 lt!211398) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2804 (buf!3197 lt!211398)) (currentByte!5994 lt!211398) (currentBit!5989 lt!211398))))))

(assert (= (and d!43784 res!113288) b!136143))

(assert (= (and b!136143 res!113289) b!136144))

(assert (= (and b!136144 (not res!113287)) b!136145))

(assert (=> b!136143 m!208131))

(assert (=> b!136143 m!208131))

(assert (=> b!136145 m!208131))

(assert (=> b!136145 m!208131))

(declare-fun m!208137 () Bool)

(assert (=> b!136145 m!208137))

(assert (=> d!43637 d!43784))

(declare-fun d!43786 () Bool)

(declare-fun res!113290 () Bool)

(declare-fun e!90397 () Bool)

(assert (=> d!43786 (=> res!113290 e!90397)))

(assert (=> d!43786 (= res!113290 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!43786 (= (arrayRangesEq!207 arr!237 (_2!6233 lt!210707) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!90397)))

(declare-fun b!136146 () Bool)

(declare-fun e!90398 () Bool)

(assert (=> b!136146 (= e!90397 e!90398)))

(declare-fun res!113291 () Bool)

(assert (=> b!136146 (=> (not res!113291) (not e!90398))))

(assert (=> b!136146 (= res!113291 (= (select (arr!3469 arr!237) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3469 (_2!6233 lt!210707)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!136147 () Bool)

(assert (=> b!136147 (= e!90398 (arrayRangesEq!207 arr!237 (_2!6233 lt!210707) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!43786 (not res!113290)) b!136146))

(assert (= (and b!136146 res!113291) b!136147))

(declare-fun m!208139 () Bool)

(assert (=> b!136146 m!208139))

(declare-fun m!208141 () Bool)

(assert (=> b!136146 m!208141))

(declare-fun m!208143 () Bool)

(assert (=> b!136147 m!208143))

(assert (=> b!136003 d!43786))

(declare-fun d!43788 () Bool)

(assert (=> d!43788 (= (remainingBits!0 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!210687)))) ((_ sign_extend 32) (currentByte!5994 (_2!6230 lt!210687))) ((_ sign_extend 32) (currentBit!5989 (_2!6230 lt!210687)))) (bvsub (bvmul ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!210687)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5994 (_2!6230 lt!210687))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5989 (_2!6230 lt!210687))))))))

(assert (=> d!43609 d!43788))

(declare-fun d!43790 () Bool)

(assert (=> d!43790 (= (invariant!0 (currentBit!5989 (_2!6230 lt!210687)) (currentByte!5994 (_2!6230 lt!210687)) (size!2804 (buf!3197 (_2!6230 lt!210687)))) (and (bvsge (currentBit!5989 (_2!6230 lt!210687)) #b00000000000000000000000000000000) (bvslt (currentBit!5989 (_2!6230 lt!210687)) #b00000000000000000000000000001000) (bvsge (currentByte!5994 (_2!6230 lt!210687)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5994 (_2!6230 lt!210687)) (size!2804 (buf!3197 (_2!6230 lt!210687)))) (and (= (currentBit!5989 (_2!6230 lt!210687)) #b00000000000000000000000000000000) (= (currentByte!5994 (_2!6230 lt!210687)) (size!2804 (buf!3197 (_2!6230 lt!210687))))))))))

(assert (=> d!43609 d!43790))

(declare-fun d!43792 () Bool)

(declare-fun res!113292 () Bool)

(declare-fun e!90399 () Bool)

(assert (=> d!43792 (=> res!113292 e!90399)))

(assert (=> d!43792 (= res!113292 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!43792 (= (arrayRangesEq!207 arr!237 (_2!6233 lt!210692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!90399)))

(declare-fun b!136148 () Bool)

(declare-fun e!90400 () Bool)

(assert (=> b!136148 (= e!90399 e!90400)))

(declare-fun res!113293 () Bool)

(assert (=> b!136148 (=> (not res!113293) (not e!90400))))

(assert (=> b!136148 (= res!113293 (= (select (arr!3469 arr!237) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3469 (_2!6233 lt!210692)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!136149 () Bool)

(assert (=> b!136149 (= e!90400 (arrayRangesEq!207 arr!237 (_2!6233 lt!210692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!43792 (not res!113292)) b!136148))

(assert (= (and b!136148 res!113293) b!136149))

(assert (=> b!136148 m!208139))

(declare-fun m!208145 () Bool)

(assert (=> b!136148 m!208145))

(declare-fun m!208147 () Bool)

(assert (=> b!136149 m!208147))

(assert (=> b!135989 d!43792))

(declare-fun d!43794 () Bool)

(declare-fun lt!211622 () (_ BitVec 8))

(declare-fun lt!211623 () (_ BitVec 8))

(assert (=> d!43794 (= lt!211622 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3469 (buf!3197 (_1!6232 lt!210690))) (currentByte!5994 (_1!6232 lt!210690)))) ((_ sign_extend 24) lt!211623))))))

(assert (=> d!43794 (= lt!211623 ((_ extract 7 0) (currentBit!5989 (_1!6232 lt!210690))))))

(declare-fun e!90402 () Bool)

(assert (=> d!43794 e!90402))

(declare-fun res!113295 () Bool)

(assert (=> d!43794 (=> (not res!113295) (not e!90402))))

(assert (=> d!43794 (= res!113295 (validate_offset_bits!1 ((_ sign_extend 32) (size!2804 (buf!3197 (_1!6232 lt!210690)))) ((_ sign_extend 32) (currentByte!5994 (_1!6232 lt!210690))) ((_ sign_extend 32) (currentBit!5989 (_1!6232 lt!210690))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!8467 () Unit!8446)

(declare-fun Unit!8468 () Unit!8446)

(assert (=> d!43794 (= (readByte!0 (_1!6232 lt!210690)) (tuple2!11849 (_2!6245 (ite (bvsgt ((_ sign_extend 24) lt!211623) #b00000000000000000000000000000000) (tuple2!11851 Unit!8467 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!211622) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3469 (buf!3197 (_1!6232 lt!210690))) (bvadd (currentByte!5994 (_1!6232 lt!210690)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!211623)))))))) (tuple2!11851 Unit!8468 lt!211622))) (BitStream!4873 (buf!3197 (_1!6232 lt!210690)) (bvadd (currentByte!5994 (_1!6232 lt!210690)) #b00000000000000000000000000000001) (currentBit!5989 (_1!6232 lt!210690)))))))

(declare-fun b!136150 () Bool)

(declare-fun e!90401 () Bool)

(assert (=> b!136150 (= e!90402 e!90401)))

(declare-fun res!113294 () Bool)

(assert (=> b!136150 (=> (not res!113294) (not e!90401))))

(declare-fun lt!211621 () tuple2!11848)

(assert (=> b!136150 (= res!113294 (= (buf!3197 (_2!6243 lt!211621)) (buf!3197 (_1!6232 lt!210690))))))

(declare-fun lt!211620 () (_ BitVec 8))

(declare-fun lt!211624 () (_ BitVec 8))

(declare-fun Unit!8469 () Unit!8446)

(declare-fun Unit!8470 () Unit!8446)

(assert (=> b!136150 (= lt!211621 (tuple2!11849 (_2!6245 (ite (bvsgt ((_ sign_extend 24) lt!211620) #b00000000000000000000000000000000) (tuple2!11851 Unit!8469 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!211624) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3469 (buf!3197 (_1!6232 lt!210690))) (bvadd (currentByte!5994 (_1!6232 lt!210690)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!211620)))))))) (tuple2!11851 Unit!8470 lt!211624))) (BitStream!4873 (buf!3197 (_1!6232 lt!210690)) (bvadd (currentByte!5994 (_1!6232 lt!210690)) #b00000000000000000000000000000001) (currentBit!5989 (_1!6232 lt!210690)))))))

(assert (=> b!136150 (= lt!211624 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3469 (buf!3197 (_1!6232 lt!210690))) (currentByte!5994 (_1!6232 lt!210690)))) ((_ sign_extend 24) lt!211620))))))

(assert (=> b!136150 (= lt!211620 ((_ extract 7 0) (currentBit!5989 (_1!6232 lt!210690))))))

(declare-fun b!136151 () Bool)

(declare-fun lt!211618 () (_ BitVec 64))

(declare-fun lt!211619 () (_ BitVec 64))

(assert (=> b!136151 (= e!90401 (= (bitIndex!0 (size!2804 (buf!3197 (_2!6243 lt!211621))) (currentByte!5994 (_2!6243 lt!211621)) (currentBit!5989 (_2!6243 lt!211621))) (bvadd lt!211619 lt!211618)))))

(assert (=> b!136151 (or (not (= (bvand lt!211619 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!211618 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!211619 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!211619 lt!211618) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!136151 (= lt!211618 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!136151 (= lt!211619 (bitIndex!0 (size!2804 (buf!3197 (_1!6232 lt!210690))) (currentByte!5994 (_1!6232 lt!210690)) (currentBit!5989 (_1!6232 lt!210690))))))

(assert (= (and d!43794 res!113295) b!136150))

(assert (= (and b!136150 res!113294) b!136151))

(declare-fun m!208149 () Bool)

(assert (=> d!43794 m!208149))

(declare-fun m!208151 () Bool)

(assert (=> d!43794 m!208151))

(declare-fun m!208153 () Bool)

(assert (=> d!43794 m!208153))

(assert (=> b!136150 m!208153))

(assert (=> b!136150 m!208149))

(declare-fun m!208155 () Bool)

(assert (=> b!136151 m!208155))

(declare-fun m!208157 () Bool)

(assert (=> b!136151 m!208157))

(assert (=> d!43687 d!43794))

(declare-fun d!43796 () Bool)

(declare-fun res!113297 () Bool)

(declare-fun e!90404 () Bool)

(assert (=> d!43796 (=> (not res!113297) (not e!90404))))

(assert (=> d!43796 (= res!113297 (= (size!2804 (buf!3197 thiss!1634)) (size!2804 (buf!3197 (_2!6230 lt!211466)))))))

(assert (=> d!43796 (= (isPrefixOf!0 thiss!1634 (_2!6230 lt!211466)) e!90404)))

(declare-fun b!136152 () Bool)

(declare-fun res!113298 () Bool)

(assert (=> b!136152 (=> (not res!113298) (not e!90404))))

(assert (=> b!136152 (= res!113298 (bvsle (bitIndex!0 (size!2804 (buf!3197 thiss!1634)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634)) (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!211466))) (currentByte!5994 (_2!6230 lt!211466)) (currentBit!5989 (_2!6230 lt!211466)))))))

(declare-fun b!136153 () Bool)

(declare-fun e!90403 () Bool)

(assert (=> b!136153 (= e!90404 e!90403)))

(declare-fun res!113296 () Bool)

(assert (=> b!136153 (=> res!113296 e!90403)))

(assert (=> b!136153 (= res!113296 (= (size!2804 (buf!3197 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!136154 () Bool)

(assert (=> b!136154 (= e!90403 (arrayBitRangesEq!0 (buf!3197 thiss!1634) (buf!3197 (_2!6230 lt!211466)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2804 (buf!3197 thiss!1634)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634))))))

(assert (= (and d!43796 res!113297) b!136152))

(assert (= (and b!136152 res!113298) b!136153))

(assert (= (and b!136153 (not res!113296)) b!136154))

(assert (=> b!136152 m!207197))

(assert (=> b!136152 m!207913))

(assert (=> b!136154 m!207197))

(assert (=> b!136154 m!207197))

(declare-fun m!208159 () Bool)

(assert (=> b!136154 m!208159))

(assert (=> b!136023 d!43796))

(assert (=> d!43633 d!43631))

(declare-fun d!43798 () Bool)

(assert (=> d!43798 (arrayRangesEq!207 (_2!6233 lt!210695) (_2!6233 lt!210692) #b00000000000000000000000000000000 to!404)))

(assert (=> d!43798 true))

(declare-fun _$6!286 () Unit!8446)

(assert (=> d!43798 (= (choose!72 (_2!6233 lt!210692) (_2!6233 lt!210695) #b00000000000000000000000000000000 to!404) _$6!286)))

(declare-fun bs!10680 () Bool)

(assert (= bs!10680 d!43798))

(assert (=> bs!10680 m!207185))

(assert (=> d!43633 d!43798))

(declare-fun c!7701 () Bool)

(declare-fun bm!1776 () Bool)

(declare-fun lt!211712 () tuple2!11848)

(declare-fun call!1780 () Bool)

(assert (=> bm!1776 (= call!1780 (arrayRangesEq!207 arr!237 (ite c!7701 (array!6193 (store (arr!3469 arr!237) from!447 (_1!6243 lt!211712)) (size!2804 arr!237)) arr!237) #b00000000000000000000000000000000 (ite c!7701 from!447 (size!2804 arr!237))))))

(declare-fun b!136165 () Bool)

(declare-fun e!90411 () tuple3!518)

(declare-fun lt!211715 () Unit!8446)

(assert (=> b!136165 (= e!90411 (tuple3!519 lt!211715 (_1!6232 lt!210690) arr!237))))

(declare-fun call!1781 () (_ BitVec 64))

(assert (=> b!136165 (= call!1781 call!1781)))

(declare-fun lt!211705 () Unit!8446)

(declare-fun Unit!8471 () Unit!8446)

(assert (=> b!136165 (= lt!211705 Unit!8471)))

(declare-fun lt!211711 () Unit!8446)

(declare-fun arrayRangesEqReflexiveLemma!5 (array!6192) Unit!8446)

(assert (=> b!136165 (= lt!211711 (arrayRangesEqReflexiveLemma!5 arr!237))))

(assert (=> b!136165 call!1780))

(declare-fun lt!211698 () Unit!8446)

(assert (=> b!136165 (= lt!211698 lt!211711)))

(declare-fun lt!211709 () array!6192)

(assert (=> b!136165 (= lt!211709 arr!237)))

(declare-fun lt!211729 () array!6192)

(assert (=> b!136165 (= lt!211729 arr!237)))

(declare-fun lt!211728 () (_ BitVec 32))

(assert (=> b!136165 (= lt!211728 #b00000000000000000000000000000000)))

(declare-fun lt!211714 () (_ BitVec 32))

(assert (=> b!136165 (= lt!211714 (size!2804 arr!237))))

(declare-fun lt!211726 () (_ BitVec 32))

(assert (=> b!136165 (= lt!211726 #b00000000000000000000000000000000)))

(declare-fun lt!211723 () (_ BitVec 32))

(assert (=> b!136165 (= lt!211723 from!447)))

(declare-fun arrayRangesEqSlicedLemma!5 (array!6192 array!6192 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8446)

(assert (=> b!136165 (= lt!211715 (arrayRangesEqSlicedLemma!5 lt!211709 lt!211729 lt!211728 lt!211714 lt!211726 lt!211723))))

(declare-fun call!1779 () Bool)

(assert (=> b!136165 call!1779))

(declare-fun d!43800 () Bool)

(declare-fun e!90413 () Bool)

(assert (=> d!43800 e!90413))

(declare-fun res!113305 () Bool)

(assert (=> d!43800 (=> res!113305 e!90413)))

(assert (=> d!43800 (= res!113305 (bvsge from!447 to!404))))

(declare-fun lt!211701 () Bool)

(declare-fun e!90412 () Bool)

(assert (=> d!43800 (= lt!211701 e!90412)))

(declare-fun res!113306 () Bool)

(assert (=> d!43800 (=> (not res!113306) (not e!90412))))

(declare-fun lt!211725 () (_ BitVec 64))

(declare-fun lt!211697 () tuple3!518)

(declare-fun lt!211722 () (_ BitVec 64))

(assert (=> d!43800 (= res!113306 (= (bvadd lt!211722 lt!211725) (bitIndex!0 (size!2804 (buf!3197 (_2!6242 lt!211697))) (currentByte!5994 (_2!6242 lt!211697)) (currentBit!5989 (_2!6242 lt!211697)))))))

(assert (=> d!43800 (or (not (= (bvand lt!211722 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!211725 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!211722 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!211722 lt!211725) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!211719 () (_ BitVec 64))

(assert (=> d!43800 (= lt!211725 (bvmul lt!211719 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!43800 (or (= lt!211719 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!211719 #b0000000000000000000000000000000000000000000000000000000000001000) lt!211719)))))

(assert (=> d!43800 (= lt!211719 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(assert (=> d!43800 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))

(assert (=> d!43800 (= lt!211722 (bitIndex!0 (size!2804 (buf!3197 (_1!6232 lt!210690))) (currentByte!5994 (_1!6232 lt!210690)) (currentBit!5989 (_1!6232 lt!210690))))))

(assert (=> d!43800 (= lt!211697 e!90411)))

(assert (=> d!43800 (= c!7701 (bvslt from!447 to!404))))

(assert (=> d!43800 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2804 arr!237)))))

(assert (=> d!43800 (= (readByteArrayLoop!0 (_1!6232 lt!210690) arr!237 from!447 to!404) lt!211697)))

(declare-fun b!136166 () Bool)

(declare-fun res!113307 () Bool)

(assert (=> b!136166 (=> (not res!113307) (not e!90412))))

(assert (=> b!136166 (= res!113307 (and (= (buf!3197 (_1!6232 lt!210690)) (buf!3197 (_2!6242 lt!211697))) (= (size!2804 arr!237) (size!2804 (_3!318 lt!211697)))))))

(declare-fun b!136167 () Bool)

(assert (=> b!136167 (= e!90413 (= (select (arr!3469 (_3!318 lt!211697)) from!447) (_2!6231 (readBytePure!0 (_1!6232 lt!210690)))))))

(assert (=> b!136167 (and (bvsge from!447 #b00000000000000000000000000000000) (bvslt from!447 (size!2804 (_3!318 lt!211697))))))

(declare-fun lt!211707 () tuple3!518)

(declare-fun bm!1777 () Bool)

(assert (=> bm!1777 (= call!1781 (bitIndex!0 (ite c!7701 (size!2804 (buf!3197 (_2!6242 lt!211707))) (size!2804 (buf!3197 (_1!6232 lt!210690)))) (ite c!7701 (currentByte!5994 (_2!6242 lt!211707)) (currentByte!5994 (_1!6232 lt!210690))) (ite c!7701 (currentBit!5989 (_2!6242 lt!211707)) (currentBit!5989 (_1!6232 lt!210690)))))))

(declare-fun b!136168 () Bool)

(declare-fun lt!211706 () Unit!8446)

(assert (=> b!136168 (= e!90411 (tuple3!519 lt!211706 (_2!6242 lt!211707) (_3!318 lt!211707)))))

(assert (=> b!136168 (= lt!211712 (readByte!0 (_1!6232 lt!210690)))))

(declare-fun lt!211699 () array!6192)

(assert (=> b!136168 (= lt!211699 (array!6193 (store (arr!3469 arr!237) from!447 (_1!6243 lt!211712)) (size!2804 arr!237)))))

(declare-fun lt!211724 () (_ BitVec 64))

(assert (=> b!136168 (= lt!211724 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!211700 () (_ BitVec 32))

(assert (=> b!136168 (= lt!211700 (bvsub to!404 from!447))))

(declare-fun lt!211720 () Unit!8446)

(assert (=> b!136168 (= lt!211720 (validateOffsetBytesFromBitIndexLemma!0 (_1!6232 lt!210690) (_2!6243 lt!211712) lt!211724 lt!211700))))

(assert (=> b!136168 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6243 lt!211712)))) ((_ sign_extend 32) (currentByte!5994 (_2!6243 lt!211712))) ((_ sign_extend 32) (currentBit!5989 (_2!6243 lt!211712))) (bvsub lt!211700 ((_ extract 31 0) (bvsdiv (bvadd lt!211724 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!211721 () Unit!8446)

(assert (=> b!136168 (= lt!211721 lt!211720)))

(assert (=> b!136168 (= lt!211707 (readByteArrayLoop!0 (_2!6243 lt!211712) lt!211699 (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!136168 (= (bitIndex!0 (size!2804 (buf!3197 (_2!6243 lt!211712))) (currentByte!5994 (_2!6243 lt!211712)) (currentBit!5989 (_2!6243 lt!211712))) (bvadd (bitIndex!0 (size!2804 (buf!3197 (_1!6232 lt!210690))) (currentByte!5994 (_1!6232 lt!210690)) (currentBit!5989 (_1!6232 lt!210690))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!211708 () Unit!8446)

(declare-fun Unit!8472 () Unit!8446)

(assert (=> b!136168 (= lt!211708 Unit!8472)))

(assert (=> b!136168 (= (bvadd (bitIndex!0 (size!2804 (buf!3197 (_2!6243 lt!211712))) (currentByte!5994 (_2!6243 lt!211712)) (currentBit!5989 (_2!6243 lt!211712))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!1781)))

(declare-fun lt!211718 () Unit!8446)

(declare-fun Unit!8473 () Unit!8446)

(assert (=> b!136168 (= lt!211718 Unit!8473)))

(assert (=> b!136168 (= (bvadd (bitIndex!0 (size!2804 (buf!3197 (_1!6232 lt!210690))) (currentByte!5994 (_1!6232 lt!210690)) (currentBit!5989 (_1!6232 lt!210690))) (bvmul ((_ sign_extend 32) (bvsub to!404 from!447)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!1781)))

(declare-fun lt!211703 () Unit!8446)

(declare-fun Unit!8474 () Unit!8446)

(assert (=> b!136168 (= lt!211703 Unit!8474)))

(assert (=> b!136168 (and (= (buf!3197 (_1!6232 lt!210690)) (buf!3197 (_2!6242 lt!211707))) (= (size!2804 arr!237) (size!2804 (_3!318 lt!211707))))))

(declare-fun lt!211710 () Unit!8446)

(declare-fun Unit!8475 () Unit!8446)

(assert (=> b!136168 (= lt!211710 Unit!8475)))

(declare-fun lt!211731 () Unit!8446)

(declare-fun arrayUpdatedAtPrefixLemma!5 (array!6192 (_ BitVec 32) (_ BitVec 8)) Unit!8446)

(assert (=> b!136168 (= lt!211731 (arrayUpdatedAtPrefixLemma!5 arr!237 from!447 (_1!6243 lt!211712)))))

(assert (=> b!136168 call!1780))

(declare-fun lt!211730 () Unit!8446)

(assert (=> b!136168 (= lt!211730 lt!211731)))

(declare-fun lt!211713 () (_ BitVec 32))

(assert (=> b!136168 (= lt!211713 #b00000000000000000000000000000000)))

(declare-fun lt!211732 () Unit!8446)

(assert (=> b!136168 (= lt!211732 (arrayRangesEqTransitive!9 arr!237 lt!211699 (_3!318 lt!211707) lt!211713 from!447 (bvadd from!447 #b00000000000000000000000000000001)))))

(assert (=> b!136168 (arrayRangesEq!207 arr!237 (_3!318 lt!211707) lt!211713 from!447)))

(declare-fun lt!211704 () Unit!8446)

(assert (=> b!136168 (= lt!211704 lt!211732)))

(assert (=> b!136168 call!1779))

(declare-fun lt!211727 () Unit!8446)

(declare-fun Unit!8476 () Unit!8446)

(assert (=> b!136168 (= lt!211727 Unit!8476)))

(declare-fun lt!211716 () Unit!8446)

(declare-fun arrayRangesEqImpliesEq!5 (array!6192 array!6192 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8446)

(assert (=> b!136168 (= lt!211716 (arrayRangesEqImpliesEq!5 lt!211699 (_3!318 lt!211707) #b00000000000000000000000000000000 from!447 (bvadd from!447 #b00000000000000000000000000000001)))))

(assert (=> b!136168 (= (select (store (arr!3469 arr!237) from!447 (_1!6243 lt!211712)) from!447) (select (arr!3469 (_3!318 lt!211707)) from!447))))

(declare-fun lt!211717 () Unit!8446)

(assert (=> b!136168 (= lt!211717 lt!211716)))

(declare-fun lt!211702 () Bool)

(assert (=> b!136168 (= lt!211702 (= (select (arr!3469 (_3!318 lt!211707)) from!447) (_1!6243 lt!211712)))))

(declare-fun Unit!8477 () Unit!8446)

(assert (=> b!136168 (= lt!211706 Unit!8477)))

(assert (=> b!136168 lt!211702))

(declare-fun b!136169 () Bool)

(assert (=> b!136169 (= e!90412 (arrayRangesEq!207 arr!237 (_3!318 lt!211697) #b00000000000000000000000000000000 from!447))))

(declare-fun bm!1778 () Bool)

(assert (=> bm!1778 (= call!1779 (arrayRangesEq!207 (ite c!7701 arr!237 lt!211709) (ite c!7701 (_3!318 lt!211707) lt!211729) (ite c!7701 #b00000000000000000000000000000000 lt!211726) (ite c!7701 from!447 lt!211723)))))

(assert (= (and d!43800 c!7701) b!136168))

(assert (= (and d!43800 (not c!7701)) b!136165))

(assert (= (or b!136168 b!136165) bm!1776))

(assert (= (or b!136168 b!136165) bm!1778))

(assert (= (or b!136168 b!136165) bm!1777))

(assert (= (and d!43800 res!113306) b!136166))

(assert (= (and b!136166 res!113307) b!136169))

(assert (= (and d!43800 (not res!113305)) b!136167))

(declare-fun m!208161 () Bool)

(assert (=> d!43800 m!208161))

(assert (=> d!43800 m!208157))

(declare-fun m!208163 () Bool)

(assert (=> b!136167 m!208163))

(assert (=> b!136167 m!207245))

(declare-fun m!208165 () Bool)

(assert (=> b!136165 m!208165))

(declare-fun m!208167 () Bool)

(assert (=> b!136165 m!208167))

(declare-fun m!208169 () Bool)

(assert (=> b!136169 m!208169))

(declare-fun m!208171 () Bool)

(assert (=> b!136168 m!208171))

(declare-fun m!208173 () Bool)

(assert (=> b!136168 m!208173))

(declare-fun m!208175 () Bool)

(assert (=> b!136168 m!208175))

(declare-fun m!208177 () Bool)

(assert (=> b!136168 m!208177))

(assert (=> b!136168 m!208157))

(declare-fun m!208179 () Bool)

(assert (=> b!136168 m!208179))

(declare-fun m!208181 () Bool)

(assert (=> b!136168 m!208181))

(declare-fun m!208183 () Bool)

(assert (=> b!136168 m!208183))

(declare-fun m!208185 () Bool)

(assert (=> b!136168 m!208185))

(declare-fun m!208187 () Bool)

(assert (=> b!136168 m!208187))

(declare-fun m!208189 () Bool)

(assert (=> b!136168 m!208189))

(declare-fun m!208191 () Bool)

(assert (=> b!136168 m!208191))

(assert (=> b!136168 m!207937))

(declare-fun m!208193 () Bool)

(assert (=> bm!1777 m!208193))

(assert (=> bm!1776 m!208177))

(declare-fun m!208195 () Bool)

(assert (=> bm!1776 m!208195))

(declare-fun m!208197 () Bool)

(assert (=> bm!1778 m!208197))

(assert (=> d!43675 d!43800))

(declare-fun d!43802 () Bool)

(assert (=> d!43802 (= (remainingBits!0 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!210693)))) ((_ sign_extend 32) (currentByte!5994 (_2!6230 lt!210693))) ((_ sign_extend 32) (currentBit!5989 (_2!6230 lt!210693)))) (bvsub (bvmul ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!210693)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5994 (_2!6230 lt!210693))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5989 (_2!6230 lt!210693))))))))

(assert (=> d!43645 d!43802))

(declare-fun d!43804 () Bool)

(assert (=> d!43804 (= (invariant!0 (currentBit!5989 (_2!6230 lt!210693)) (currentByte!5994 (_2!6230 lt!210693)) (size!2804 (buf!3197 (_2!6230 lt!210693)))) (and (bvsge (currentBit!5989 (_2!6230 lt!210693)) #b00000000000000000000000000000000) (bvslt (currentBit!5989 (_2!6230 lt!210693)) #b00000000000000000000000000001000) (bvsge (currentByte!5994 (_2!6230 lt!210693)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5994 (_2!6230 lt!210693)) (size!2804 (buf!3197 (_2!6230 lt!210693)))) (and (= (currentBit!5989 (_2!6230 lt!210693)) #b00000000000000000000000000000000) (= (currentByte!5994 (_2!6230 lt!210693)) (size!2804 (buf!3197 (_2!6230 lt!210693))))))))))

(assert (=> d!43645 d!43804))

(declare-fun d!43806 () Bool)

(declare-fun res!113308 () Bool)

(declare-fun e!90414 () Bool)

(assert (=> d!43806 (=> res!113308 e!90414)))

(assert (=> d!43806 (= res!113308 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!43806 (= (arrayRangesEq!207 (_2!6233 lt!210692) (_2!6233 lt!210695) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!90414)))

(declare-fun b!136170 () Bool)

(declare-fun e!90415 () Bool)

(assert (=> b!136170 (= e!90414 e!90415)))

(declare-fun res!113309 () Bool)

(assert (=> b!136170 (=> (not res!113309) (not e!90415))))

(assert (=> b!136170 (= res!113309 (= (select (arr!3469 (_2!6233 lt!210692)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3469 (_2!6233 lt!210695)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!136171 () Bool)

(assert (=> b!136171 (= e!90415 (arrayRangesEq!207 (_2!6233 lt!210692) (_2!6233 lt!210695) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!43806 (not res!113308)) b!136170))

(assert (= (and b!136170 res!113309) b!136171))

(assert (=> b!136170 m!208145))

(declare-fun m!208199 () Bool)

(assert (=> b!136170 m!208199))

(declare-fun m!208201 () Bool)

(assert (=> b!136171 m!208201))

(assert (=> b!136013 d!43806))

(assert (=> d!43681 d!43788))

(assert (=> d!43665 d!43693))

(declare-fun d!43808 () Bool)

(assert (=> d!43808 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!210693)))) ((_ sign_extend 32) (currentByte!5994 (_2!6230 lt!210687))) ((_ sign_extend 32) (currentBit!5989 (_2!6230 lt!210687))) lt!210712)))

(assert (=> d!43808 true))

(declare-fun _$5!44 () Unit!8446)

(assert (=> d!43808 (= (choose!26 (_2!6230 lt!210687) (buf!3197 (_2!6230 lt!210693)) lt!210712 (BitStream!4873 (buf!3197 (_2!6230 lt!210693)) (currentByte!5994 (_2!6230 lt!210687)) (currentBit!5989 (_2!6230 lt!210687)))) _$5!44)))

(declare-fun bs!10681 () Bool)

(assert (= bs!10681 d!43808))

(assert (=> bs!10681 m!207211))

(assert (=> d!43665 d!43808))

(declare-fun d!43810 () Bool)

(declare-fun res!113310 () Bool)

(declare-fun e!90416 () Bool)

(assert (=> d!43810 (=> res!113310 e!90416)))

(assert (=> d!43810 (= res!113310 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!43810 (= (arrayRangesEq!207 (_2!6233 lt!210695) (_2!6233 lt!210692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!90416)))

(declare-fun b!136172 () Bool)

(declare-fun e!90417 () Bool)

(assert (=> b!136172 (= e!90416 e!90417)))

(declare-fun res!113311 () Bool)

(assert (=> b!136172 (=> (not res!113311) (not e!90417))))

(assert (=> b!136172 (= res!113311 (= (select (arr!3469 (_2!6233 lt!210695)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3469 (_2!6233 lt!210692)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!136173 () Bool)

(assert (=> b!136173 (= e!90417 (arrayRangesEq!207 (_2!6233 lt!210695) (_2!6233 lt!210692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!43810 (not res!113310)) b!136172))

(assert (= (and b!136172 res!113311) b!136173))

(assert (=> b!136172 m!208199))

(assert (=> b!136172 m!208145))

(declare-fun m!208203 () Bool)

(assert (=> b!136173 m!208203))

(assert (=> b!135991 d!43810))

(assert (=> d!43667 d!43657))

(declare-fun d!43812 () Bool)

(assert (=> d!43812 (isPrefixOf!0 thiss!1634 (_2!6230 lt!210693))))

(assert (=> d!43812 true))

(declare-fun _$15!213 () Unit!8446)

(assert (=> d!43812 (= (choose!30 thiss!1634 (_2!6230 lt!210687) (_2!6230 lt!210693)) _$15!213)))

(declare-fun bs!10682 () Bool)

(assert (= bs!10682 d!43812))

(assert (=> bs!10682 m!207247))

(assert (=> d!43667 d!43812))

(assert (=> d!43667 d!43643))

(assert (=> b!135997 d!43611))

(assert (=> b!135997 d!43609))

(declare-fun call!1783 () Bool)

(declare-fun bm!1779 () Bool)

(declare-fun lt!211748 () tuple2!11848)

(declare-fun c!7702 () Bool)

(assert (=> bm!1779 (= call!1783 (arrayRangesEq!207 lt!210686 (ite c!7702 (array!6193 (store (arr!3469 lt!210686) (bvadd #b00000000000000000000000000000001 from!447) (_1!6243 lt!211748)) (size!2804 lt!210686)) lt!210686) #b00000000000000000000000000000000 (ite c!7702 (bvadd #b00000000000000000000000000000001 from!447) (size!2804 lt!210686))))))

(declare-fun b!136174 () Bool)

(declare-fun lt!211751 () Unit!8446)

(declare-fun e!90418 () tuple3!518)

(assert (=> b!136174 (= e!90418 (tuple3!519 lt!211751 (withMovedByteIndex!0 (_1!6232 lt!210690) #b00000000000000000000000000000001) lt!210686))))

(declare-fun call!1784 () (_ BitVec 64))

(assert (=> b!136174 (= call!1784 call!1784)))

(declare-fun lt!211741 () Unit!8446)

(declare-fun Unit!8478 () Unit!8446)

(assert (=> b!136174 (= lt!211741 Unit!8478)))

(declare-fun lt!211747 () Unit!8446)

(assert (=> b!136174 (= lt!211747 (arrayRangesEqReflexiveLemma!5 lt!210686))))

(assert (=> b!136174 call!1783))

(declare-fun lt!211734 () Unit!8446)

(assert (=> b!136174 (= lt!211734 lt!211747)))

(declare-fun lt!211745 () array!6192)

(assert (=> b!136174 (= lt!211745 lt!210686)))

(declare-fun lt!211765 () array!6192)

(assert (=> b!136174 (= lt!211765 lt!210686)))

(declare-fun lt!211764 () (_ BitVec 32))

(assert (=> b!136174 (= lt!211764 #b00000000000000000000000000000000)))

(declare-fun lt!211750 () (_ BitVec 32))

(assert (=> b!136174 (= lt!211750 (size!2804 lt!210686))))

(declare-fun lt!211762 () (_ BitVec 32))

(assert (=> b!136174 (= lt!211762 #b00000000000000000000000000000000)))

(declare-fun lt!211759 () (_ BitVec 32))

(assert (=> b!136174 (= lt!211759 (bvadd #b00000000000000000000000000000001 from!447))))

(assert (=> b!136174 (= lt!211751 (arrayRangesEqSlicedLemma!5 lt!211745 lt!211765 lt!211764 lt!211750 lt!211762 lt!211759))))

(declare-fun call!1782 () Bool)

(assert (=> b!136174 call!1782))

(declare-fun d!43814 () Bool)

(declare-fun e!90420 () Bool)

(assert (=> d!43814 e!90420))

(declare-fun res!113312 () Bool)

(assert (=> d!43814 (=> res!113312 e!90420)))

(assert (=> d!43814 (= res!113312 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!211737 () Bool)

(declare-fun e!90419 () Bool)

(assert (=> d!43814 (= lt!211737 e!90419)))

(declare-fun res!113313 () Bool)

(assert (=> d!43814 (=> (not res!113313) (not e!90419))))

(declare-fun lt!211733 () tuple3!518)

(declare-fun lt!211761 () (_ BitVec 64))

(declare-fun lt!211758 () (_ BitVec 64))

(assert (=> d!43814 (= res!113313 (= (bvadd lt!211758 lt!211761) (bitIndex!0 (size!2804 (buf!3197 (_2!6242 lt!211733))) (currentByte!5994 (_2!6242 lt!211733)) (currentBit!5989 (_2!6242 lt!211733)))))))

(assert (=> d!43814 (or (not (= (bvand lt!211758 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!211761 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!211758 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!211758 lt!211761) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!211755 () (_ BitVec 64))

(assert (=> d!43814 (= lt!211761 (bvmul lt!211755 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!43814 (or (= lt!211755 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!211755 #b0000000000000000000000000000000000000000000000000000000000001000) lt!211755)))))

(assert (=> d!43814 (= lt!211755 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!43814 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!43814 (= lt!211758 (bitIndex!0 (size!2804 (buf!3197 (withMovedByteIndex!0 (_1!6232 lt!210690) #b00000000000000000000000000000001))) (currentByte!5994 (withMovedByteIndex!0 (_1!6232 lt!210690) #b00000000000000000000000000000001)) (currentBit!5989 (withMovedByteIndex!0 (_1!6232 lt!210690) #b00000000000000000000000000000001))))))

(assert (=> d!43814 (= lt!211733 e!90418)))

(assert (=> d!43814 (= c!7702 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!43814 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2804 lt!210686)))))

(assert (=> d!43814 (= (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!6232 lt!210690) #b00000000000000000000000000000001) lt!210686 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!211733)))

(declare-fun b!136175 () Bool)

(declare-fun res!113314 () Bool)

(assert (=> b!136175 (=> (not res!113314) (not e!90419))))

(assert (=> b!136175 (= res!113314 (and (= (buf!3197 (withMovedByteIndex!0 (_1!6232 lt!210690) #b00000000000000000000000000000001)) (buf!3197 (_2!6242 lt!211733))) (= (size!2804 lt!210686) (size!2804 (_3!318 lt!211733)))))))

(declare-fun b!136176 () Bool)

(assert (=> b!136176 (= e!90420 (= (select (arr!3469 (_3!318 lt!211733)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6231 (readBytePure!0 (withMovedByteIndex!0 (_1!6232 lt!210690) #b00000000000000000000000000000001)))))))

(assert (=> b!136176 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!2804 (_3!318 lt!211733))))))

(declare-fun lt!211743 () tuple3!518)

(declare-fun bm!1780 () Bool)

(assert (=> bm!1780 (= call!1784 (bitIndex!0 (ite c!7702 (size!2804 (buf!3197 (_2!6242 lt!211743))) (size!2804 (buf!3197 (withMovedByteIndex!0 (_1!6232 lt!210690) #b00000000000000000000000000000001)))) (ite c!7702 (currentByte!5994 (_2!6242 lt!211743)) (currentByte!5994 (withMovedByteIndex!0 (_1!6232 lt!210690) #b00000000000000000000000000000001))) (ite c!7702 (currentBit!5989 (_2!6242 lt!211743)) (currentBit!5989 (withMovedByteIndex!0 (_1!6232 lt!210690) #b00000000000000000000000000000001)))))))

(declare-fun b!136177 () Bool)

(declare-fun lt!211742 () Unit!8446)

(assert (=> b!136177 (= e!90418 (tuple3!519 lt!211742 (_2!6242 lt!211743) (_3!318 lt!211743)))))

(assert (=> b!136177 (= lt!211748 (readByte!0 (withMovedByteIndex!0 (_1!6232 lt!210690) #b00000000000000000000000000000001)))))

(declare-fun lt!211735 () array!6192)

(assert (=> b!136177 (= lt!211735 (array!6193 (store (arr!3469 lt!210686) (bvadd #b00000000000000000000000000000001 from!447) (_1!6243 lt!211748)) (size!2804 lt!210686)))))

(declare-fun lt!211760 () (_ BitVec 64))

(assert (=> b!136177 (= lt!211760 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!211736 () (_ BitVec 32))

(assert (=> b!136177 (= lt!211736 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!211756 () Unit!8446)

(assert (=> b!136177 (= lt!211756 (validateOffsetBytesFromBitIndexLemma!0 (withMovedByteIndex!0 (_1!6232 lt!210690) #b00000000000000000000000000000001) (_2!6243 lt!211748) lt!211760 lt!211736))))

(assert (=> b!136177 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6243 lt!211748)))) ((_ sign_extend 32) (currentByte!5994 (_2!6243 lt!211748))) ((_ sign_extend 32) (currentBit!5989 (_2!6243 lt!211748))) (bvsub lt!211736 ((_ extract 31 0) (bvsdiv (bvadd lt!211760 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!211757 () Unit!8446)

(assert (=> b!136177 (= lt!211757 lt!211756)))

(assert (=> b!136177 (= lt!211743 (readByteArrayLoop!0 (_2!6243 lt!211748) lt!211735 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!136177 (= (bitIndex!0 (size!2804 (buf!3197 (_2!6243 lt!211748))) (currentByte!5994 (_2!6243 lt!211748)) (currentBit!5989 (_2!6243 lt!211748))) (bvadd (bitIndex!0 (size!2804 (buf!3197 (withMovedByteIndex!0 (_1!6232 lt!210690) #b00000000000000000000000000000001))) (currentByte!5994 (withMovedByteIndex!0 (_1!6232 lt!210690) #b00000000000000000000000000000001)) (currentBit!5989 (withMovedByteIndex!0 (_1!6232 lt!210690) #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!211744 () Unit!8446)

(declare-fun Unit!8479 () Unit!8446)

(assert (=> b!136177 (= lt!211744 Unit!8479)))

(assert (=> b!136177 (= (bvadd (bitIndex!0 (size!2804 (buf!3197 (_2!6243 lt!211748))) (currentByte!5994 (_2!6243 lt!211748)) (currentBit!5989 (_2!6243 lt!211748))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!1784)))

(declare-fun lt!211754 () Unit!8446)

(declare-fun Unit!8480 () Unit!8446)

(assert (=> b!136177 (= lt!211754 Unit!8480)))

(assert (=> b!136177 (= (bvadd (bitIndex!0 (size!2804 (buf!3197 (withMovedByteIndex!0 (_1!6232 lt!210690) #b00000000000000000000000000000001))) (currentByte!5994 (withMovedByteIndex!0 (_1!6232 lt!210690) #b00000000000000000000000000000001)) (currentBit!5989 (withMovedByteIndex!0 (_1!6232 lt!210690) #b00000000000000000000000000000001))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!1784)))

(declare-fun lt!211739 () Unit!8446)

(declare-fun Unit!8481 () Unit!8446)

(assert (=> b!136177 (= lt!211739 Unit!8481)))

(assert (=> b!136177 (and (= (buf!3197 (withMovedByteIndex!0 (_1!6232 lt!210690) #b00000000000000000000000000000001)) (buf!3197 (_2!6242 lt!211743))) (= (size!2804 lt!210686) (size!2804 (_3!318 lt!211743))))))

(declare-fun lt!211746 () Unit!8446)

(declare-fun Unit!8482 () Unit!8446)

(assert (=> b!136177 (= lt!211746 Unit!8482)))

(declare-fun lt!211767 () Unit!8446)

(assert (=> b!136177 (= lt!211767 (arrayUpdatedAtPrefixLemma!5 lt!210686 (bvadd #b00000000000000000000000000000001 from!447) (_1!6243 lt!211748)))))

(assert (=> b!136177 call!1783))

(declare-fun lt!211766 () Unit!8446)

(assert (=> b!136177 (= lt!211766 lt!211767)))

(declare-fun lt!211749 () (_ BitVec 32))

(assert (=> b!136177 (= lt!211749 #b00000000000000000000000000000000)))

(declare-fun lt!211768 () Unit!8446)

(assert (=> b!136177 (= lt!211768 (arrayRangesEqTransitive!9 lt!210686 lt!211735 (_3!318 lt!211743) lt!211749 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!136177 (arrayRangesEq!207 lt!210686 (_3!318 lt!211743) lt!211749 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!211740 () Unit!8446)

(assert (=> b!136177 (= lt!211740 lt!211768)))

(assert (=> b!136177 call!1782))

(declare-fun lt!211763 () Unit!8446)

(declare-fun Unit!8483 () Unit!8446)

(assert (=> b!136177 (= lt!211763 Unit!8483)))

(declare-fun lt!211752 () Unit!8446)

(assert (=> b!136177 (= lt!211752 (arrayRangesEqImpliesEq!5 lt!211735 (_3!318 lt!211743) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!136177 (= (select (store (arr!3469 lt!210686) (bvadd #b00000000000000000000000000000001 from!447) (_1!6243 lt!211748)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3469 (_3!318 lt!211743)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!211753 () Unit!8446)

(assert (=> b!136177 (= lt!211753 lt!211752)))

(declare-fun lt!211738 () Bool)

(assert (=> b!136177 (= lt!211738 (= (select (arr!3469 (_3!318 lt!211743)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6243 lt!211748)))))

(declare-fun Unit!8484 () Unit!8446)

(assert (=> b!136177 (= lt!211742 Unit!8484)))

(assert (=> b!136177 lt!211738))

(declare-fun b!136178 () Bool)

(assert (=> b!136178 (= e!90419 (arrayRangesEq!207 lt!210686 (_3!318 lt!211733) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun bm!1781 () Bool)

(assert (=> bm!1781 (= call!1782 (arrayRangesEq!207 (ite c!7702 lt!210686 lt!211745) (ite c!7702 (_3!318 lt!211743) lt!211765) (ite c!7702 #b00000000000000000000000000000000 lt!211762) (ite c!7702 (bvadd #b00000000000000000000000000000001 from!447) lt!211759)))))

(assert (= (and d!43814 c!7702) b!136177))

(assert (= (and d!43814 (not c!7702)) b!136174))

(assert (= (or b!136177 b!136174) bm!1779))

(assert (= (or b!136177 b!136174) bm!1781))

(assert (= (or b!136177 b!136174) bm!1780))

(assert (= (and d!43814 res!113313) b!136175))

(assert (= (and b!136175 res!113314) b!136178))

(assert (= (and d!43814 (not res!113312)) b!136176))

(declare-fun m!208205 () Bool)

(assert (=> d!43814 m!208205))

(declare-fun m!208207 () Bool)

(assert (=> d!43814 m!208207))

(declare-fun m!208209 () Bool)

(assert (=> b!136176 m!208209))

(assert (=> b!136176 m!207235))

(declare-fun m!208211 () Bool)

(assert (=> b!136176 m!208211))

(declare-fun m!208213 () Bool)

(assert (=> b!136174 m!208213))

(declare-fun m!208215 () Bool)

(assert (=> b!136174 m!208215))

(declare-fun m!208217 () Bool)

(assert (=> b!136178 m!208217))

(declare-fun m!208219 () Bool)

(assert (=> b!136177 m!208219))

(assert (=> b!136177 m!207235))

(declare-fun m!208221 () Bool)

(assert (=> b!136177 m!208221))

(declare-fun m!208223 () Bool)

(assert (=> b!136177 m!208223))

(declare-fun m!208225 () Bool)

(assert (=> b!136177 m!208225))

(assert (=> b!136177 m!208207))

(declare-fun m!208227 () Bool)

(assert (=> b!136177 m!208227))

(declare-fun m!208229 () Bool)

(assert (=> b!136177 m!208229))

(declare-fun m!208231 () Bool)

(assert (=> b!136177 m!208231))

(declare-fun m!208233 () Bool)

(assert (=> b!136177 m!208233))

(declare-fun m!208235 () Bool)

(assert (=> b!136177 m!208235))

(declare-fun m!208237 () Bool)

(assert (=> b!136177 m!208237))

(declare-fun m!208239 () Bool)

(assert (=> b!136177 m!208239))

(assert (=> b!136177 m!207235))

(declare-fun m!208241 () Bool)

(assert (=> b!136177 m!208241))

(declare-fun m!208243 () Bool)

(assert (=> bm!1780 m!208243))

(assert (=> bm!1779 m!208225))

(declare-fun m!208245 () Bool)

(assert (=> bm!1779 m!208245))

(declare-fun m!208247 () Bool)

(assert (=> bm!1781 m!208247))

(assert (=> d!43700 d!43814))

(declare-fun d!43816 () Bool)

(declare-fun res!113315 () Bool)

(declare-fun e!90421 () Bool)

(assert (=> d!43816 (=> res!113315 e!90421)))

(assert (=> d!43816 (= res!113315 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!43816 (= (arrayRangesEq!207 (_2!6233 lt!210692) (_2!6233 lt!210701) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!90421)))

(declare-fun b!136179 () Bool)

(declare-fun e!90422 () Bool)

(assert (=> b!136179 (= e!90421 e!90422)))

(declare-fun res!113316 () Bool)

(assert (=> b!136179 (=> (not res!113316) (not e!90422))))

(assert (=> b!136179 (= res!113316 (= (select (arr!3469 (_2!6233 lt!210692)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3469 (_2!6233 lt!210701)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!136180 () Bool)

(assert (=> b!136180 (= e!90422 (arrayRangesEq!207 (_2!6233 lt!210692) (_2!6233 lt!210701) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!43816 (not res!113315)) b!136179))

(assert (= (and b!136179 res!113316) b!136180))

(assert (=> b!136179 m!208145))

(declare-fun m!208249 () Bool)

(assert (=> b!136179 m!208249))

(declare-fun m!208251 () Bool)

(assert (=> b!136180 m!208251))

(assert (=> b!136026 d!43816))

(assert (=> d!43619 d!43617))

(declare-fun d!43818 () Bool)

(assert (=> d!43818 (validate_offset_bits!1 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!210693)))) ((_ sign_extend 32) (currentByte!5994 (_2!6230 lt!210687))) ((_ sign_extend 32) (currentBit!5989 (_2!6230 lt!210687))) lt!210710)))

(assert (=> d!43818 true))

(declare-fun _$6!289 () Unit!8446)

(assert (=> d!43818 (= (choose!9 (_2!6230 lt!210687) (buf!3197 (_2!6230 lt!210693)) lt!210710 (BitStream!4873 (buf!3197 (_2!6230 lt!210693)) (currentByte!5994 (_2!6230 lt!210687)) (currentBit!5989 (_2!6230 lt!210687)))) _$6!289)))

(declare-fun bs!10683 () Bool)

(assert (= bs!10683 d!43818))

(assert (=> bs!10683 m!207173))

(assert (=> d!43619 d!43818))

(declare-fun d!43820 () Bool)

(declare-fun res!113318 () Bool)

(declare-fun e!90424 () Bool)

(assert (=> d!43820 (=> (not res!113318) (not e!90424))))

(assert (=> d!43820 (= res!113318 (= (size!2804 (buf!3197 (_2!6232 lt!211358))) (size!2804 (buf!3197 (_2!6230 lt!210693)))))))

(assert (=> d!43820 (= (isPrefixOf!0 (_2!6232 lt!211358) (_2!6230 lt!210693)) e!90424)))

(declare-fun b!136181 () Bool)

(declare-fun res!113319 () Bool)

(assert (=> b!136181 (=> (not res!113319) (not e!90424))))

(assert (=> b!136181 (= res!113319 (bvsle (bitIndex!0 (size!2804 (buf!3197 (_2!6232 lt!211358))) (currentByte!5994 (_2!6232 lt!211358)) (currentBit!5989 (_2!6232 lt!211358))) (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!210693))) (currentByte!5994 (_2!6230 lt!210693)) (currentBit!5989 (_2!6230 lt!210693)))))))

(declare-fun b!136182 () Bool)

(declare-fun e!90423 () Bool)

(assert (=> b!136182 (= e!90424 e!90423)))

(declare-fun res!113317 () Bool)

(assert (=> b!136182 (=> res!113317 e!90423)))

(assert (=> b!136182 (= res!113317 (= (size!2804 (buf!3197 (_2!6232 lt!211358))) #b00000000000000000000000000000000))))

(declare-fun b!136183 () Bool)

(assert (=> b!136183 (= e!90423 (arrayBitRangesEq!0 (buf!3197 (_2!6232 lt!211358)) (buf!3197 (_2!6230 lt!210693)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2804 (buf!3197 (_2!6232 lt!211358))) (currentByte!5994 (_2!6232 lt!211358)) (currentBit!5989 (_2!6232 lt!211358)))))))

(assert (= (and d!43820 res!113318) b!136181))

(assert (= (and b!136181 res!113319) b!136182))

(assert (= (and b!136182 (not res!113317)) b!136183))

(declare-fun m!208253 () Bool)

(assert (=> b!136181 m!208253))

(assert (=> b!136181 m!207203))

(assert (=> b!136183 m!208253))

(assert (=> b!136183 m!208253))

(declare-fun m!208255 () Bool)

(assert (=> b!136183 m!208255))

(assert (=> b!135980 d!43820))

(declare-fun b!136184 () Bool)

(declare-fun res!113320 () Bool)

(declare-fun lt!211771 () (_ BitVec 32))

(assert (=> b!136184 (= res!113320 (= lt!211771 #b00000000000000000000000000000000))))

(declare-fun e!90427 () Bool)

(assert (=> b!136184 (=> res!113320 e!90427)))

(declare-fun e!90430 () Bool)

(assert (=> b!136184 (= e!90430 e!90427)))

(declare-fun lt!211770 () tuple4!118)

(declare-fun e!90429 () Bool)

(declare-fun b!136185 () Bool)

(assert (=> b!136185 (= e!90429 (arrayRangesEq!207 (buf!3197 thiss!1634) (buf!3197 (_2!6230 lt!210687)) (_1!6244 lt!211770) (_2!6244 lt!211770)))))

(declare-fun b!136186 () Bool)

(declare-fun call!1785 () Bool)

(assert (=> b!136186 (= e!90427 call!1785)))

(declare-fun d!43822 () Bool)

(declare-fun res!113323 () Bool)

(declare-fun e!90428 () Bool)

(assert (=> d!43822 (=> res!113323 e!90428)))

(assert (=> d!43822 (= res!113323 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2804 (buf!3197 thiss!1634)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634))))))

(assert (=> d!43822 (= (arrayBitRangesEq!0 (buf!3197 thiss!1634) (buf!3197 (_2!6230 lt!210687)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2804 (buf!3197 thiss!1634)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634))) e!90428)))

(declare-fun b!136187 () Bool)

(declare-fun e!90426 () Bool)

(assert (=> b!136187 (= e!90428 e!90426)))

(declare-fun res!113324 () Bool)

(assert (=> b!136187 (=> (not res!113324) (not e!90426))))

(assert (=> b!136187 (= res!113324 e!90429)))

(declare-fun res!113321 () Bool)

(assert (=> b!136187 (=> res!113321 e!90429)))

(assert (=> b!136187 (= res!113321 (bvsge (_1!6244 lt!211770) (_2!6244 lt!211770)))))

(assert (=> b!136187 (= lt!211771 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2804 (buf!3197 thiss!1634)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!211769 () (_ BitVec 32))

(assert (=> b!136187 (= lt!211769 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!136187 (= lt!211770 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2804 (buf!3197 thiss!1634)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634))))))

(declare-fun b!136188 () Bool)

(declare-fun e!90425 () Bool)

(assert (=> b!136188 (= e!90426 e!90425)))

(declare-fun c!7703 () Bool)

(assert (=> b!136188 (= c!7703 (= (_3!319 lt!211770) (_4!59 lt!211770)))))

(declare-fun b!136189 () Bool)

(assert (=> b!136189 (= e!90425 e!90430)))

(declare-fun res!113322 () Bool)

(assert (=> b!136189 (= res!113322 (byteRangesEq!0 (select (arr!3469 (buf!3197 thiss!1634)) (_3!319 lt!211770)) (select (arr!3469 (buf!3197 (_2!6230 lt!210687))) (_3!319 lt!211770)) lt!211769 #b00000000000000000000000000001000))))

(assert (=> b!136189 (=> (not res!113322) (not e!90430))))

(declare-fun bm!1782 () Bool)

(assert (=> bm!1782 (= call!1785 (byteRangesEq!0 (ite c!7703 (select (arr!3469 (buf!3197 thiss!1634)) (_3!319 lt!211770)) (select (arr!3469 (buf!3197 thiss!1634)) (_4!59 lt!211770))) (ite c!7703 (select (arr!3469 (buf!3197 (_2!6230 lt!210687))) (_3!319 lt!211770)) (select (arr!3469 (buf!3197 (_2!6230 lt!210687))) (_4!59 lt!211770))) (ite c!7703 lt!211769 #b00000000000000000000000000000000) lt!211771))))

(declare-fun b!136190 () Bool)

(assert (=> b!136190 (= e!90425 call!1785)))

(assert (= (and d!43822 (not res!113323)) b!136187))

(assert (= (and b!136187 (not res!113321)) b!136185))

(assert (= (and b!136187 res!113324) b!136188))

(assert (= (and b!136188 c!7703) b!136190))

(assert (= (and b!136188 (not c!7703)) b!136189))

(assert (= (and b!136189 res!113322) b!136184))

(assert (= (and b!136184 (not res!113320)) b!136186))

(assert (= (or b!136190 b!136186) bm!1782))

(declare-fun m!208257 () Bool)

(assert (=> b!136185 m!208257))

(assert (=> b!136187 m!207197))

(assert (=> b!136187 m!208039))

(declare-fun m!208259 () Bool)

(assert (=> b!136189 m!208259))

(declare-fun m!208261 () Bool)

(assert (=> b!136189 m!208261))

(assert (=> b!136189 m!208259))

(assert (=> b!136189 m!208261))

(declare-fun m!208263 () Bool)

(assert (=> b!136189 m!208263))

(declare-fun m!208265 () Bool)

(assert (=> bm!1782 m!208265))

(declare-fun m!208267 () Bool)

(assert (=> bm!1782 m!208267))

(assert (=> bm!1782 m!208259))

(declare-fun m!208269 () Bool)

(assert (=> bm!1782 m!208269))

(assert (=> bm!1782 m!208261))

(assert (=> b!135999 d!43822))

(assert (=> b!135999 d!43611))

(declare-fun d!43824 () Bool)

(declare-fun res!113326 () Bool)

(declare-fun e!90432 () Bool)

(assert (=> d!43824 (=> (not res!113326) (not e!90432))))

(assert (=> d!43824 (= res!113326 (= (size!2804 (buf!3197 (_2!6232 lt!211387))) (size!2804 (buf!3197 (_2!6230 lt!210687)))))))

(assert (=> d!43824 (= (isPrefixOf!0 (_2!6232 lt!211387) (_2!6230 lt!210687)) e!90432)))

(declare-fun b!136191 () Bool)

(declare-fun res!113327 () Bool)

(assert (=> b!136191 (=> (not res!113327) (not e!90432))))

(assert (=> b!136191 (= res!113327 (bvsle (bitIndex!0 (size!2804 (buf!3197 (_2!6232 lt!211387))) (currentByte!5994 (_2!6232 lt!211387)) (currentBit!5989 (_2!6232 lt!211387))) (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!210687))) (currentByte!5994 (_2!6230 lt!210687)) (currentBit!5989 (_2!6230 lt!210687)))))))

(declare-fun b!136192 () Bool)

(declare-fun e!90431 () Bool)

(assert (=> b!136192 (= e!90432 e!90431)))

(declare-fun res!113325 () Bool)

(assert (=> b!136192 (=> res!113325 e!90431)))

(assert (=> b!136192 (= res!113325 (= (size!2804 (buf!3197 (_2!6232 lt!211387))) #b00000000000000000000000000000000))))

(declare-fun b!136193 () Bool)

(assert (=> b!136193 (= e!90431 (arrayBitRangesEq!0 (buf!3197 (_2!6232 lt!211387)) (buf!3197 (_2!6230 lt!210687)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2804 (buf!3197 (_2!6232 lt!211387))) (currentByte!5994 (_2!6232 lt!211387)) (currentBit!5989 (_2!6232 lt!211387)))))))

(assert (= (and d!43824 res!113326) b!136191))

(assert (= (and b!136191 res!113327) b!136192))

(assert (= (and b!136192 (not res!113325)) b!136193))

(assert (=> b!136191 m!208081))

(assert (=> b!136191 m!207195))

(assert (=> b!136193 m!208081))

(assert (=> b!136193 m!208081))

(declare-fun m!208271 () Bool)

(assert (=> b!136193 m!208271))

(assert (=> b!135993 d!43824))

(declare-fun d!43826 () Bool)

(declare-fun e!90433 () Bool)

(assert (=> d!43826 e!90433))

(declare-fun res!113328 () Bool)

(assert (=> d!43826 (=> (not res!113328) (not e!90433))))

(declare-fun lt!211773 () (_ BitVec 64))

(declare-fun lt!211777 () (_ BitVec 64))

(declare-fun lt!211775 () (_ BitVec 64))

(assert (=> d!43826 (= res!113328 (= lt!211777 (bvsub lt!211775 lt!211773)))))

(assert (=> d!43826 (or (= (bvand lt!211775 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!211773 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!211775 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!211775 lt!211773) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!43826 (= lt!211773 (remainingBits!0 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!211513)))) ((_ sign_extend 32) (currentByte!5994 (_2!6230 lt!211513))) ((_ sign_extend 32) (currentBit!5989 (_2!6230 lt!211513)))))))

(declare-fun lt!211772 () (_ BitVec 64))

(declare-fun lt!211774 () (_ BitVec 64))

(assert (=> d!43826 (= lt!211775 (bvmul lt!211772 lt!211774))))

(assert (=> d!43826 (or (= lt!211772 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!211774 (bvsdiv (bvmul lt!211772 lt!211774) lt!211772)))))

(assert (=> d!43826 (= lt!211774 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!43826 (= lt!211772 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!211513)))))))

(assert (=> d!43826 (= lt!211777 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5994 (_2!6230 lt!211513))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5989 (_2!6230 lt!211513)))))))

(assert (=> d!43826 (invariant!0 (currentBit!5989 (_2!6230 lt!211513)) (currentByte!5994 (_2!6230 lt!211513)) (size!2804 (buf!3197 (_2!6230 lt!211513))))))

(assert (=> d!43826 (= (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!211513))) (currentByte!5994 (_2!6230 lt!211513)) (currentBit!5989 (_2!6230 lt!211513))) lt!211777)))

(declare-fun b!136194 () Bool)

(declare-fun res!113329 () Bool)

(assert (=> b!136194 (=> (not res!113329) (not e!90433))))

(assert (=> b!136194 (= res!113329 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!211777))))

(declare-fun b!136195 () Bool)

(declare-fun lt!211776 () (_ BitVec 64))

(assert (=> b!136195 (= e!90433 (bvsle lt!211777 (bvmul lt!211776 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!136195 (or (= lt!211776 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!211776 #b0000000000000000000000000000000000000000000000000000000000001000) lt!211776)))))

(assert (=> b!136195 (= lt!211776 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!211513)))))))

(assert (= (and d!43826 res!113328) b!136194))

(assert (= (and b!136194 res!113329) b!136195))

(declare-fun m!208273 () Bool)

(assert (=> d!43826 m!208273))

(declare-fun m!208275 () Bool)

(assert (=> d!43826 m!208275))

(assert (=> b!136043 d!43826))

(assert (=> b!136043 d!43609))

(declare-fun b!136196 () Bool)

(declare-fun res!113330 () Bool)

(declare-fun lt!211780 () (_ BitVec 32))

(assert (=> b!136196 (= res!113330 (= lt!211780 #b00000000000000000000000000000000))))

(declare-fun e!90436 () Bool)

(assert (=> b!136196 (=> res!113330 e!90436)))

(declare-fun e!90439 () Bool)

(assert (=> b!136196 (= e!90439 e!90436)))

(declare-fun b!136197 () Bool)

(declare-fun lt!211779 () tuple4!118)

(declare-fun e!90438 () Bool)

(assert (=> b!136197 (= e!90438 (arrayRangesEq!207 (buf!3197 (_2!6230 lt!210687)) (buf!3197 (_2!6230 lt!210693)) (_1!6244 lt!211779) (_2!6244 lt!211779)))))

(declare-fun b!136198 () Bool)

(declare-fun call!1786 () Bool)

(assert (=> b!136198 (= e!90436 call!1786)))

(declare-fun d!43828 () Bool)

(declare-fun res!113333 () Bool)

(declare-fun e!90437 () Bool)

(assert (=> d!43828 (=> res!113333 e!90437)))

(assert (=> d!43828 (= res!113333 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!210687))) (currentByte!5994 (_2!6230 lt!210687)) (currentBit!5989 (_2!6230 lt!210687)))))))

(assert (=> d!43828 (= (arrayBitRangesEq!0 (buf!3197 (_2!6230 lt!210687)) (buf!3197 (_2!6230 lt!210693)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!210687))) (currentByte!5994 (_2!6230 lt!210687)) (currentBit!5989 (_2!6230 lt!210687)))) e!90437)))

(declare-fun b!136199 () Bool)

(declare-fun e!90435 () Bool)

(assert (=> b!136199 (= e!90437 e!90435)))

(declare-fun res!113334 () Bool)

(assert (=> b!136199 (=> (not res!113334) (not e!90435))))

(assert (=> b!136199 (= res!113334 e!90438)))

(declare-fun res!113331 () Bool)

(assert (=> b!136199 (=> res!113331 e!90438)))

(assert (=> b!136199 (= res!113331 (bvsge (_1!6244 lt!211779) (_2!6244 lt!211779)))))

(assert (=> b!136199 (= lt!211780 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!210687))) (currentByte!5994 (_2!6230 lt!210687)) (currentBit!5989 (_2!6230 lt!210687))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!211778 () (_ BitVec 32))

(assert (=> b!136199 (= lt!211778 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!136199 (= lt!211779 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!210687))) (currentByte!5994 (_2!6230 lt!210687)) (currentBit!5989 (_2!6230 lt!210687)))))))

(declare-fun b!136200 () Bool)

(declare-fun e!90434 () Bool)

(assert (=> b!136200 (= e!90435 e!90434)))

(declare-fun c!7704 () Bool)

(assert (=> b!136200 (= c!7704 (= (_3!319 lt!211779) (_4!59 lt!211779)))))

(declare-fun b!136201 () Bool)

(assert (=> b!136201 (= e!90434 e!90439)))

(declare-fun res!113332 () Bool)

(assert (=> b!136201 (= res!113332 (byteRangesEq!0 (select (arr!3469 (buf!3197 (_2!6230 lt!210687))) (_3!319 lt!211779)) (select (arr!3469 (buf!3197 (_2!6230 lt!210693))) (_3!319 lt!211779)) lt!211778 #b00000000000000000000000000001000))))

(assert (=> b!136201 (=> (not res!113332) (not e!90439))))

(declare-fun bm!1783 () Bool)

(assert (=> bm!1783 (= call!1786 (byteRangesEq!0 (ite c!7704 (select (arr!3469 (buf!3197 (_2!6230 lt!210687))) (_3!319 lt!211779)) (select (arr!3469 (buf!3197 (_2!6230 lt!210687))) (_4!59 lt!211779))) (ite c!7704 (select (arr!3469 (buf!3197 (_2!6230 lt!210693))) (_3!319 lt!211779)) (select (arr!3469 (buf!3197 (_2!6230 lt!210693))) (_4!59 lt!211779))) (ite c!7704 lt!211778 #b00000000000000000000000000000000) lt!211780))))

(declare-fun b!136202 () Bool)

(assert (=> b!136202 (= e!90434 call!1786)))

(assert (= (and d!43828 (not res!113333)) b!136199))

(assert (= (and b!136199 (not res!113331)) b!136197))

(assert (= (and b!136199 res!113334) b!136200))

(assert (= (and b!136200 c!7704) b!136202))

(assert (= (and b!136200 (not c!7704)) b!136201))

(assert (= (and b!136201 res!113332) b!136196))

(assert (= (and b!136196 (not res!113330)) b!136198))

(assert (= (or b!136202 b!136198) bm!1783))

(declare-fun m!208277 () Bool)

(assert (=> b!136197 m!208277))

(assert (=> b!136199 m!207195))

(declare-fun m!208279 () Bool)

(assert (=> b!136199 m!208279))

(declare-fun m!208281 () Bool)

(assert (=> b!136201 m!208281))

(declare-fun m!208283 () Bool)

(assert (=> b!136201 m!208283))

(assert (=> b!136201 m!208281))

(assert (=> b!136201 m!208283))

(declare-fun m!208285 () Bool)

(assert (=> b!136201 m!208285))

(declare-fun m!208287 () Bool)

(assert (=> bm!1783 m!208287))

(declare-fun m!208289 () Bool)

(assert (=> bm!1783 m!208289))

(assert (=> bm!1783 m!208281))

(declare-fun m!208291 () Bool)

(assert (=> bm!1783 m!208291))

(assert (=> bm!1783 m!208283))

(assert (=> b!135968 d!43828))

(assert (=> b!135968 d!43609))

(declare-fun c!7705 () Bool)

(declare-fun lt!211796 () tuple2!11848)

(declare-fun call!1788 () Bool)

(declare-fun bm!1784 () Bool)

(assert (=> bm!1784 (= call!1788 (arrayRangesEq!207 arr!237 (ite c!7705 (array!6193 (store (arr!3469 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6243 lt!211796)) (size!2804 arr!237)) arr!237) #b00000000000000000000000000000000 (ite c!7705 (bvadd #b00000000000000000000000000000001 from!447) (size!2804 arr!237))))))

(declare-fun e!90440 () tuple3!518)

(declare-fun lt!211799 () Unit!8446)

(declare-fun b!136203 () Bool)

(assert (=> b!136203 (= e!90440 (tuple3!519 lt!211799 (_1!6232 lt!210706) arr!237))))

(declare-fun call!1789 () (_ BitVec 64))

(assert (=> b!136203 (= call!1789 call!1789)))

(declare-fun lt!211789 () Unit!8446)

(declare-fun Unit!8485 () Unit!8446)

(assert (=> b!136203 (= lt!211789 Unit!8485)))

(declare-fun lt!211795 () Unit!8446)

(assert (=> b!136203 (= lt!211795 (arrayRangesEqReflexiveLemma!5 arr!237))))

(assert (=> b!136203 call!1788))

(declare-fun lt!211782 () Unit!8446)

(assert (=> b!136203 (= lt!211782 lt!211795)))

(declare-fun lt!211793 () array!6192)

(assert (=> b!136203 (= lt!211793 arr!237)))

(declare-fun lt!211813 () array!6192)

(assert (=> b!136203 (= lt!211813 arr!237)))

(declare-fun lt!211812 () (_ BitVec 32))

(assert (=> b!136203 (= lt!211812 #b00000000000000000000000000000000)))

(declare-fun lt!211798 () (_ BitVec 32))

(assert (=> b!136203 (= lt!211798 (size!2804 arr!237))))

(declare-fun lt!211810 () (_ BitVec 32))

(assert (=> b!136203 (= lt!211810 #b00000000000000000000000000000000)))

(declare-fun lt!211807 () (_ BitVec 32))

(assert (=> b!136203 (= lt!211807 (bvadd #b00000000000000000000000000000001 from!447))))

(assert (=> b!136203 (= lt!211799 (arrayRangesEqSlicedLemma!5 lt!211793 lt!211813 lt!211812 lt!211798 lt!211810 lt!211807))))

(declare-fun call!1787 () Bool)

(assert (=> b!136203 call!1787))

(declare-fun d!43830 () Bool)

(declare-fun e!90442 () Bool)

(assert (=> d!43830 e!90442))

(declare-fun res!113335 () Bool)

(assert (=> d!43830 (=> res!113335 e!90442)))

(assert (=> d!43830 (= res!113335 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!211785 () Bool)

(declare-fun e!90441 () Bool)

(assert (=> d!43830 (= lt!211785 e!90441)))

(declare-fun res!113336 () Bool)

(assert (=> d!43830 (=> (not res!113336) (not e!90441))))

(declare-fun lt!211781 () tuple3!518)

(declare-fun lt!211809 () (_ BitVec 64))

(declare-fun lt!211806 () (_ BitVec 64))

(assert (=> d!43830 (= res!113336 (= (bvadd lt!211806 lt!211809) (bitIndex!0 (size!2804 (buf!3197 (_2!6242 lt!211781))) (currentByte!5994 (_2!6242 lt!211781)) (currentBit!5989 (_2!6242 lt!211781)))))))

(assert (=> d!43830 (or (not (= (bvand lt!211806 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!211809 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!211806 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!211806 lt!211809) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!211803 () (_ BitVec 64))

(assert (=> d!43830 (= lt!211809 (bvmul lt!211803 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!43830 (or (= lt!211803 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!211803 #b0000000000000000000000000000000000000000000000000000000000001000) lt!211803)))))

(assert (=> d!43830 (= lt!211803 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!43830 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!43830 (= lt!211806 (bitIndex!0 (size!2804 (buf!3197 (_1!6232 lt!210706))) (currentByte!5994 (_1!6232 lt!210706)) (currentBit!5989 (_1!6232 lt!210706))))))

(assert (=> d!43830 (= lt!211781 e!90440)))

(assert (=> d!43830 (= c!7705 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!43830 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2804 arr!237)))))

(assert (=> d!43830 (= (readByteArrayLoop!0 (_1!6232 lt!210706) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!211781)))

(declare-fun b!136204 () Bool)

(declare-fun res!113337 () Bool)

(assert (=> b!136204 (=> (not res!113337) (not e!90441))))

(assert (=> b!136204 (= res!113337 (and (= (buf!3197 (_1!6232 lt!210706)) (buf!3197 (_2!6242 lt!211781))) (= (size!2804 arr!237) (size!2804 (_3!318 lt!211781)))))))

(declare-fun b!136205 () Bool)

(assert (=> b!136205 (= e!90442 (= (select (arr!3469 (_3!318 lt!211781)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6231 (readBytePure!0 (_1!6232 lt!210706)))))))

(assert (=> b!136205 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!2804 (_3!318 lt!211781))))))

(declare-fun bm!1785 () Bool)

(declare-fun lt!211791 () tuple3!518)

(assert (=> bm!1785 (= call!1789 (bitIndex!0 (ite c!7705 (size!2804 (buf!3197 (_2!6242 lt!211791))) (size!2804 (buf!3197 (_1!6232 lt!210706)))) (ite c!7705 (currentByte!5994 (_2!6242 lt!211791)) (currentByte!5994 (_1!6232 lt!210706))) (ite c!7705 (currentBit!5989 (_2!6242 lt!211791)) (currentBit!5989 (_1!6232 lt!210706)))))))

(declare-fun b!136206 () Bool)

(declare-fun lt!211790 () Unit!8446)

(assert (=> b!136206 (= e!90440 (tuple3!519 lt!211790 (_2!6242 lt!211791) (_3!318 lt!211791)))))

(assert (=> b!136206 (= lt!211796 (readByte!0 (_1!6232 lt!210706)))))

(declare-fun lt!211783 () array!6192)

(assert (=> b!136206 (= lt!211783 (array!6193 (store (arr!3469 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6243 lt!211796)) (size!2804 arr!237)))))

(declare-fun lt!211808 () (_ BitVec 64))

(assert (=> b!136206 (= lt!211808 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!211784 () (_ BitVec 32))

(assert (=> b!136206 (= lt!211784 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!211804 () Unit!8446)

(assert (=> b!136206 (= lt!211804 (validateOffsetBytesFromBitIndexLemma!0 (_1!6232 lt!210706) (_2!6243 lt!211796) lt!211808 lt!211784))))

(assert (=> b!136206 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6243 lt!211796)))) ((_ sign_extend 32) (currentByte!5994 (_2!6243 lt!211796))) ((_ sign_extend 32) (currentBit!5989 (_2!6243 lt!211796))) (bvsub lt!211784 ((_ extract 31 0) (bvsdiv (bvadd lt!211808 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!211805 () Unit!8446)

(assert (=> b!136206 (= lt!211805 lt!211804)))

(assert (=> b!136206 (= lt!211791 (readByteArrayLoop!0 (_2!6243 lt!211796) lt!211783 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!136206 (= (bitIndex!0 (size!2804 (buf!3197 (_2!6243 lt!211796))) (currentByte!5994 (_2!6243 lt!211796)) (currentBit!5989 (_2!6243 lt!211796))) (bvadd (bitIndex!0 (size!2804 (buf!3197 (_1!6232 lt!210706))) (currentByte!5994 (_1!6232 lt!210706)) (currentBit!5989 (_1!6232 lt!210706))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!211792 () Unit!8446)

(declare-fun Unit!8486 () Unit!8446)

(assert (=> b!136206 (= lt!211792 Unit!8486)))

(assert (=> b!136206 (= (bvadd (bitIndex!0 (size!2804 (buf!3197 (_2!6243 lt!211796))) (currentByte!5994 (_2!6243 lt!211796)) (currentBit!5989 (_2!6243 lt!211796))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!1789)))

(declare-fun lt!211802 () Unit!8446)

(declare-fun Unit!8487 () Unit!8446)

(assert (=> b!136206 (= lt!211802 Unit!8487)))

(assert (=> b!136206 (= (bvadd (bitIndex!0 (size!2804 (buf!3197 (_1!6232 lt!210706))) (currentByte!5994 (_1!6232 lt!210706)) (currentBit!5989 (_1!6232 lt!210706))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!1789)))

(declare-fun lt!211787 () Unit!8446)

(declare-fun Unit!8488 () Unit!8446)

(assert (=> b!136206 (= lt!211787 Unit!8488)))

(assert (=> b!136206 (and (= (buf!3197 (_1!6232 lt!210706)) (buf!3197 (_2!6242 lt!211791))) (= (size!2804 arr!237) (size!2804 (_3!318 lt!211791))))))

(declare-fun lt!211794 () Unit!8446)

(declare-fun Unit!8489 () Unit!8446)

(assert (=> b!136206 (= lt!211794 Unit!8489)))

(declare-fun lt!211815 () Unit!8446)

(assert (=> b!136206 (= lt!211815 (arrayUpdatedAtPrefixLemma!5 arr!237 (bvadd #b00000000000000000000000000000001 from!447) (_1!6243 lt!211796)))))

(assert (=> b!136206 call!1788))

(declare-fun lt!211814 () Unit!8446)

(assert (=> b!136206 (= lt!211814 lt!211815)))

(declare-fun lt!211797 () (_ BitVec 32))

(assert (=> b!136206 (= lt!211797 #b00000000000000000000000000000000)))

(declare-fun lt!211816 () Unit!8446)

(assert (=> b!136206 (= lt!211816 (arrayRangesEqTransitive!9 arr!237 lt!211783 (_3!318 lt!211791) lt!211797 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!136206 (arrayRangesEq!207 arr!237 (_3!318 lt!211791) lt!211797 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!211788 () Unit!8446)

(assert (=> b!136206 (= lt!211788 lt!211816)))

(assert (=> b!136206 call!1787))

(declare-fun lt!211811 () Unit!8446)

(declare-fun Unit!8490 () Unit!8446)

(assert (=> b!136206 (= lt!211811 Unit!8490)))

(declare-fun lt!211800 () Unit!8446)

(assert (=> b!136206 (= lt!211800 (arrayRangesEqImpliesEq!5 lt!211783 (_3!318 lt!211791) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!136206 (= (select (store (arr!3469 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6243 lt!211796)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3469 (_3!318 lt!211791)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!211801 () Unit!8446)

(assert (=> b!136206 (= lt!211801 lt!211800)))

(declare-fun lt!211786 () Bool)

(assert (=> b!136206 (= lt!211786 (= (select (arr!3469 (_3!318 lt!211791)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6243 lt!211796)))))

(declare-fun Unit!8491 () Unit!8446)

(assert (=> b!136206 (= lt!211790 Unit!8491)))

(assert (=> b!136206 lt!211786))

(declare-fun b!136207 () Bool)

(assert (=> b!136207 (= e!90441 (arrayRangesEq!207 arr!237 (_3!318 lt!211781) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun bm!1786 () Bool)

(assert (=> bm!1786 (= call!1787 (arrayRangesEq!207 (ite c!7705 arr!237 lt!211793) (ite c!7705 (_3!318 lt!211791) lt!211813) (ite c!7705 #b00000000000000000000000000000000 lt!211810) (ite c!7705 (bvadd #b00000000000000000000000000000001 from!447) lt!211807)))))

(assert (= (and d!43830 c!7705) b!136206))

(assert (= (and d!43830 (not c!7705)) b!136203))

(assert (= (or b!136206 b!136203) bm!1784))

(assert (= (or b!136206 b!136203) bm!1786))

(assert (= (or b!136206 b!136203) bm!1785))

(assert (= (and d!43830 res!113336) b!136204))

(assert (= (and b!136204 res!113337) b!136207))

(assert (= (and d!43830 (not res!113335)) b!136205))

(declare-fun m!208293 () Bool)

(assert (=> d!43830 m!208293))

(declare-fun m!208295 () Bool)

(assert (=> d!43830 m!208295))

(declare-fun m!208297 () Bool)

(assert (=> b!136205 m!208297))

(declare-fun m!208299 () Bool)

(assert (=> b!136205 m!208299))

(assert (=> b!136203 m!208165))

(declare-fun m!208301 () Bool)

(assert (=> b!136203 m!208301))

(declare-fun m!208303 () Bool)

(assert (=> b!136207 m!208303))

(declare-fun m!208305 () Bool)

(assert (=> b!136206 m!208305))

(declare-fun m!208307 () Bool)

(assert (=> b!136206 m!208307))

(declare-fun m!208309 () Bool)

(assert (=> b!136206 m!208309))

(declare-fun m!208311 () Bool)

(assert (=> b!136206 m!208311))

(assert (=> b!136206 m!208295))

(declare-fun m!208313 () Bool)

(assert (=> b!136206 m!208313))

(declare-fun m!208315 () Bool)

(assert (=> b!136206 m!208315))

(declare-fun m!208317 () Bool)

(assert (=> b!136206 m!208317))

(declare-fun m!208319 () Bool)

(assert (=> b!136206 m!208319))

(declare-fun m!208321 () Bool)

(assert (=> b!136206 m!208321))

(declare-fun m!208323 () Bool)

(assert (=> b!136206 m!208323))

(declare-fun m!208325 () Bool)

(assert (=> b!136206 m!208325))

(declare-fun m!208327 () Bool)

(assert (=> b!136206 m!208327))

(declare-fun m!208329 () Bool)

(assert (=> bm!1785 m!208329))

(assert (=> bm!1784 m!208311))

(declare-fun m!208331 () Bool)

(assert (=> bm!1784 m!208331))

(declare-fun m!208333 () Bool)

(assert (=> bm!1786 m!208333))

(assert (=> d!43615 d!43830))

(declare-fun c!7706 () Bool)

(declare-fun call!1791 () Bool)

(declare-fun bm!1787 () Bool)

(declare-fun lt!211832 () tuple2!11848)

(assert (=> bm!1787 (= call!1791 (arrayRangesEq!207 lt!210686 (ite c!7706 (array!6193 (store (arr!3469 lt!210686) (bvadd #b00000000000000000000000000000001 from!447) (_1!6243 lt!211832)) (size!2804 lt!210686)) lt!210686) #b00000000000000000000000000000000 (ite c!7706 (bvadd #b00000000000000000000000000000001 from!447) (size!2804 lt!210686))))))

(declare-fun e!90443 () tuple3!518)

(declare-fun lt!211835 () Unit!8446)

(declare-fun b!136208 () Bool)

(assert (=> b!136208 (= e!90443 (tuple3!519 lt!211835 (_1!6232 lt!210688) lt!210686))))

(declare-fun call!1792 () (_ BitVec 64))

(assert (=> b!136208 (= call!1792 call!1792)))

(declare-fun lt!211825 () Unit!8446)

(declare-fun Unit!8492 () Unit!8446)

(assert (=> b!136208 (= lt!211825 Unit!8492)))

(declare-fun lt!211831 () Unit!8446)

(assert (=> b!136208 (= lt!211831 (arrayRangesEqReflexiveLemma!5 lt!210686))))

(assert (=> b!136208 call!1791))

(declare-fun lt!211818 () Unit!8446)

(assert (=> b!136208 (= lt!211818 lt!211831)))

(declare-fun lt!211829 () array!6192)

(assert (=> b!136208 (= lt!211829 lt!210686)))

(declare-fun lt!211849 () array!6192)

(assert (=> b!136208 (= lt!211849 lt!210686)))

(declare-fun lt!211848 () (_ BitVec 32))

(assert (=> b!136208 (= lt!211848 #b00000000000000000000000000000000)))

(declare-fun lt!211834 () (_ BitVec 32))

(assert (=> b!136208 (= lt!211834 (size!2804 lt!210686))))

(declare-fun lt!211846 () (_ BitVec 32))

(assert (=> b!136208 (= lt!211846 #b00000000000000000000000000000000)))

(declare-fun lt!211843 () (_ BitVec 32))

(assert (=> b!136208 (= lt!211843 (bvadd #b00000000000000000000000000000001 from!447))))

(assert (=> b!136208 (= lt!211835 (arrayRangesEqSlicedLemma!5 lt!211829 lt!211849 lt!211848 lt!211834 lt!211846 lt!211843))))

(declare-fun call!1790 () Bool)

(assert (=> b!136208 call!1790))

(declare-fun d!43832 () Bool)

(declare-fun e!90445 () Bool)

(assert (=> d!43832 e!90445))

(declare-fun res!113338 () Bool)

(assert (=> d!43832 (=> res!113338 e!90445)))

(assert (=> d!43832 (= res!113338 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!211821 () Bool)

(declare-fun e!90444 () Bool)

(assert (=> d!43832 (= lt!211821 e!90444)))

(declare-fun res!113339 () Bool)

(assert (=> d!43832 (=> (not res!113339) (not e!90444))))

(declare-fun lt!211842 () (_ BitVec 64))

(declare-fun lt!211845 () (_ BitVec 64))

(declare-fun lt!211817 () tuple3!518)

(assert (=> d!43832 (= res!113339 (= (bvadd lt!211842 lt!211845) (bitIndex!0 (size!2804 (buf!3197 (_2!6242 lt!211817))) (currentByte!5994 (_2!6242 lt!211817)) (currentBit!5989 (_2!6242 lt!211817)))))))

(assert (=> d!43832 (or (not (= (bvand lt!211842 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!211845 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!211842 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!211842 lt!211845) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!211839 () (_ BitVec 64))

(assert (=> d!43832 (= lt!211845 (bvmul lt!211839 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!43832 (or (= lt!211839 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!211839 #b0000000000000000000000000000000000000000000000000000000000001000) lt!211839)))))

(assert (=> d!43832 (= lt!211839 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!43832 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!43832 (= lt!211842 (bitIndex!0 (size!2804 (buf!3197 (_1!6232 lt!210688))) (currentByte!5994 (_1!6232 lt!210688)) (currentBit!5989 (_1!6232 lt!210688))))))

(assert (=> d!43832 (= lt!211817 e!90443)))

(assert (=> d!43832 (= c!7706 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!43832 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2804 lt!210686)))))

(assert (=> d!43832 (= (readByteArrayLoop!0 (_1!6232 lt!210688) lt!210686 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!211817)))

(declare-fun b!136209 () Bool)

(declare-fun res!113340 () Bool)

(assert (=> b!136209 (=> (not res!113340) (not e!90444))))

(assert (=> b!136209 (= res!113340 (and (= (buf!3197 (_1!6232 lt!210688)) (buf!3197 (_2!6242 lt!211817))) (= (size!2804 lt!210686) (size!2804 (_3!318 lt!211817)))))))

(declare-fun b!136210 () Bool)

(assert (=> b!136210 (= e!90445 (= (select (arr!3469 (_3!318 lt!211817)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6231 (readBytePure!0 (_1!6232 lt!210688)))))))

(assert (=> b!136210 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!2804 (_3!318 lt!211817))))))

(declare-fun lt!211827 () tuple3!518)

(declare-fun bm!1788 () Bool)

(assert (=> bm!1788 (= call!1792 (bitIndex!0 (ite c!7706 (size!2804 (buf!3197 (_2!6242 lt!211827))) (size!2804 (buf!3197 (_1!6232 lt!210688)))) (ite c!7706 (currentByte!5994 (_2!6242 lt!211827)) (currentByte!5994 (_1!6232 lt!210688))) (ite c!7706 (currentBit!5989 (_2!6242 lt!211827)) (currentBit!5989 (_1!6232 lt!210688)))))))

(declare-fun b!136211 () Bool)

(declare-fun lt!211826 () Unit!8446)

(assert (=> b!136211 (= e!90443 (tuple3!519 lt!211826 (_2!6242 lt!211827) (_3!318 lt!211827)))))

(assert (=> b!136211 (= lt!211832 (readByte!0 (_1!6232 lt!210688)))))

(declare-fun lt!211819 () array!6192)

(assert (=> b!136211 (= lt!211819 (array!6193 (store (arr!3469 lt!210686) (bvadd #b00000000000000000000000000000001 from!447) (_1!6243 lt!211832)) (size!2804 lt!210686)))))

(declare-fun lt!211844 () (_ BitVec 64))

(assert (=> b!136211 (= lt!211844 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!211820 () (_ BitVec 32))

(assert (=> b!136211 (= lt!211820 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!211840 () Unit!8446)

(assert (=> b!136211 (= lt!211840 (validateOffsetBytesFromBitIndexLemma!0 (_1!6232 lt!210688) (_2!6243 lt!211832) lt!211844 lt!211820))))

(assert (=> b!136211 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6243 lt!211832)))) ((_ sign_extend 32) (currentByte!5994 (_2!6243 lt!211832))) ((_ sign_extend 32) (currentBit!5989 (_2!6243 lt!211832))) (bvsub lt!211820 ((_ extract 31 0) (bvsdiv (bvadd lt!211844 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!211841 () Unit!8446)

(assert (=> b!136211 (= lt!211841 lt!211840)))

(assert (=> b!136211 (= lt!211827 (readByteArrayLoop!0 (_2!6243 lt!211832) lt!211819 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!136211 (= (bitIndex!0 (size!2804 (buf!3197 (_2!6243 lt!211832))) (currentByte!5994 (_2!6243 lt!211832)) (currentBit!5989 (_2!6243 lt!211832))) (bvadd (bitIndex!0 (size!2804 (buf!3197 (_1!6232 lt!210688))) (currentByte!5994 (_1!6232 lt!210688)) (currentBit!5989 (_1!6232 lt!210688))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!211828 () Unit!8446)

(declare-fun Unit!8493 () Unit!8446)

(assert (=> b!136211 (= lt!211828 Unit!8493)))

(assert (=> b!136211 (= (bvadd (bitIndex!0 (size!2804 (buf!3197 (_2!6243 lt!211832))) (currentByte!5994 (_2!6243 lt!211832)) (currentBit!5989 (_2!6243 lt!211832))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!1792)))

(declare-fun lt!211838 () Unit!8446)

(declare-fun Unit!8494 () Unit!8446)

(assert (=> b!136211 (= lt!211838 Unit!8494)))

(assert (=> b!136211 (= (bvadd (bitIndex!0 (size!2804 (buf!3197 (_1!6232 lt!210688))) (currentByte!5994 (_1!6232 lt!210688)) (currentBit!5989 (_1!6232 lt!210688))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!1792)))

(declare-fun lt!211823 () Unit!8446)

(declare-fun Unit!8495 () Unit!8446)

(assert (=> b!136211 (= lt!211823 Unit!8495)))

(assert (=> b!136211 (and (= (buf!3197 (_1!6232 lt!210688)) (buf!3197 (_2!6242 lt!211827))) (= (size!2804 lt!210686) (size!2804 (_3!318 lt!211827))))))

(declare-fun lt!211830 () Unit!8446)

(declare-fun Unit!8496 () Unit!8446)

(assert (=> b!136211 (= lt!211830 Unit!8496)))

(declare-fun lt!211851 () Unit!8446)

(assert (=> b!136211 (= lt!211851 (arrayUpdatedAtPrefixLemma!5 lt!210686 (bvadd #b00000000000000000000000000000001 from!447) (_1!6243 lt!211832)))))

(assert (=> b!136211 call!1791))

(declare-fun lt!211850 () Unit!8446)

(assert (=> b!136211 (= lt!211850 lt!211851)))

(declare-fun lt!211833 () (_ BitVec 32))

(assert (=> b!136211 (= lt!211833 #b00000000000000000000000000000000)))

(declare-fun lt!211852 () Unit!8446)

(assert (=> b!136211 (= lt!211852 (arrayRangesEqTransitive!9 lt!210686 lt!211819 (_3!318 lt!211827) lt!211833 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!136211 (arrayRangesEq!207 lt!210686 (_3!318 lt!211827) lt!211833 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!211824 () Unit!8446)

(assert (=> b!136211 (= lt!211824 lt!211852)))

(assert (=> b!136211 call!1790))

(declare-fun lt!211847 () Unit!8446)

(declare-fun Unit!8497 () Unit!8446)

(assert (=> b!136211 (= lt!211847 Unit!8497)))

(declare-fun lt!211836 () Unit!8446)

(assert (=> b!136211 (= lt!211836 (arrayRangesEqImpliesEq!5 lt!211819 (_3!318 lt!211827) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!136211 (= (select (store (arr!3469 lt!210686) (bvadd #b00000000000000000000000000000001 from!447) (_1!6243 lt!211832)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3469 (_3!318 lt!211827)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!211837 () Unit!8446)

(assert (=> b!136211 (= lt!211837 lt!211836)))

(declare-fun lt!211822 () Bool)

(assert (=> b!136211 (= lt!211822 (= (select (arr!3469 (_3!318 lt!211827)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6243 lt!211832)))))

(declare-fun Unit!8498 () Unit!8446)

(assert (=> b!136211 (= lt!211826 Unit!8498)))

(assert (=> b!136211 lt!211822))

(declare-fun b!136212 () Bool)

(assert (=> b!136212 (= e!90444 (arrayRangesEq!207 lt!210686 (_3!318 lt!211817) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun bm!1789 () Bool)

(assert (=> bm!1789 (= call!1790 (arrayRangesEq!207 (ite c!7706 lt!210686 lt!211829) (ite c!7706 (_3!318 lt!211827) lt!211849) (ite c!7706 #b00000000000000000000000000000000 lt!211846) (ite c!7706 (bvadd #b00000000000000000000000000000001 from!447) lt!211843)))))

(assert (= (and d!43832 c!7706) b!136211))

(assert (= (and d!43832 (not c!7706)) b!136208))

(assert (= (or b!136211 b!136208) bm!1787))

(assert (= (or b!136211 b!136208) bm!1789))

(assert (= (or b!136211 b!136208) bm!1788))

(assert (= (and d!43832 res!113339) b!136209))

(assert (= (and b!136209 res!113340) b!136212))

(assert (= (and d!43832 (not res!113338)) b!136210))

(declare-fun m!208335 () Bool)

(assert (=> d!43832 m!208335))

(declare-fun m!208337 () Bool)

(assert (=> d!43832 m!208337))

(declare-fun m!208339 () Bool)

(assert (=> b!136210 m!208339))

(declare-fun m!208341 () Bool)

(assert (=> b!136210 m!208341))

(assert (=> b!136208 m!208213))

(declare-fun m!208343 () Bool)

(assert (=> b!136208 m!208343))

(declare-fun m!208345 () Bool)

(assert (=> b!136212 m!208345))

(declare-fun m!208347 () Bool)

(assert (=> b!136211 m!208347))

(declare-fun m!208349 () Bool)

(assert (=> b!136211 m!208349))

(declare-fun m!208351 () Bool)

(assert (=> b!136211 m!208351))

(declare-fun m!208353 () Bool)

(assert (=> b!136211 m!208353))

(assert (=> b!136211 m!208337))

(declare-fun m!208355 () Bool)

(assert (=> b!136211 m!208355))

(declare-fun m!208357 () Bool)

(assert (=> b!136211 m!208357))

(declare-fun m!208359 () Bool)

(assert (=> b!136211 m!208359))

(declare-fun m!208361 () Bool)

(assert (=> b!136211 m!208361))

(declare-fun m!208363 () Bool)

(assert (=> b!136211 m!208363))

(declare-fun m!208365 () Bool)

(assert (=> b!136211 m!208365))

(declare-fun m!208367 () Bool)

(assert (=> b!136211 m!208367))

(declare-fun m!208369 () Bool)

(assert (=> b!136211 m!208369))

(declare-fun m!208371 () Bool)

(assert (=> bm!1788 m!208371))

(assert (=> bm!1787 m!208353))

(declare-fun m!208373 () Bool)

(assert (=> bm!1787 m!208373))

(declare-fun m!208375 () Bool)

(assert (=> bm!1789 m!208375))

(assert (=> d!43673 d!43832))

(declare-fun lt!211853 () tuple3!518)

(declare-fun d!43834 () Bool)

(assert (=> d!43834 (= lt!211853 (readByteArrayLoop!0 (_1!6232 lt!211509) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!43834 (= (readByteArrayLoopPure!0 (_1!6232 lt!211509) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11835 (_2!6242 lt!211853) (_3!318 lt!211853)))))

(declare-fun bs!10684 () Bool)

(assert (= bs!10684 d!43834))

(declare-fun m!208377 () Bool)

(assert (=> bs!10684 m!208377))

(assert (=> b!136045 d!43834))

(declare-fun d!43836 () Bool)

(assert (=> d!43836 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!211513)))) ((_ sign_extend 32) (currentByte!5994 (_2!6230 lt!210687))) ((_ sign_extend 32) (currentBit!5989 (_2!6230 lt!210687))) lt!211514) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!211513)))) ((_ sign_extend 32) (currentByte!5994 (_2!6230 lt!210687))) ((_ sign_extend 32) (currentBit!5989 (_2!6230 lt!210687)))) lt!211514))))

(declare-fun bs!10685 () Bool)

(assert (= bs!10685 d!43836))

(declare-fun m!208379 () Bool)

(assert (=> bs!10685 m!208379))

(assert (=> b!136045 d!43836))

(declare-fun d!43838 () Bool)

(assert (=> d!43838 (validate_offset_bits!1 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!211513)))) ((_ sign_extend 32) (currentByte!5994 (_2!6230 lt!210687))) ((_ sign_extend 32) (currentBit!5989 (_2!6230 lt!210687))) lt!211514)))

(declare-fun lt!211854 () Unit!8446)

(assert (=> d!43838 (= lt!211854 (choose!9 (_2!6230 lt!210687) (buf!3197 (_2!6230 lt!211513)) lt!211514 (BitStream!4873 (buf!3197 (_2!6230 lt!211513)) (currentByte!5994 (_2!6230 lt!210687)) (currentBit!5989 (_2!6230 lt!210687)))))))

(assert (=> d!43838 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6230 lt!210687) (buf!3197 (_2!6230 lt!211513)) lt!211514) lt!211854)))

(declare-fun bs!10686 () Bool)

(assert (= bs!10686 d!43838))

(assert (=> bs!10686 m!207957))

(declare-fun m!208381 () Bool)

(assert (=> bs!10686 m!208381))

(assert (=> b!136045 d!43838))

(declare-fun b!136213 () Bool)

(declare-fun e!90446 () Unit!8446)

(declare-fun lt!211864 () Unit!8446)

(assert (=> b!136213 (= e!90446 lt!211864)))

(declare-fun lt!211857 () (_ BitVec 64))

(assert (=> b!136213 (= lt!211857 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!211863 () (_ BitVec 64))

(assert (=> b!136213 (= lt!211863 (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!210687))) (currentByte!5994 (_2!6230 lt!210687)) (currentBit!5989 (_2!6230 lt!210687))))))

(assert (=> b!136213 (= lt!211864 (arrayBitRangesEqSymmetric!0 (buf!3197 (_2!6230 lt!210687)) (buf!3197 (_2!6230 lt!211513)) lt!211857 lt!211863))))

(assert (=> b!136213 (arrayBitRangesEq!0 (buf!3197 (_2!6230 lt!211513)) (buf!3197 (_2!6230 lt!210687)) lt!211857 lt!211863)))

(declare-fun b!136214 () Bool)

(declare-fun res!113342 () Bool)

(declare-fun e!90447 () Bool)

(assert (=> b!136214 (=> (not res!113342) (not e!90447))))

(declare-fun lt!211859 () tuple2!11832)

(assert (=> b!136214 (= res!113342 (isPrefixOf!0 (_2!6232 lt!211859) (_2!6230 lt!211513)))))

(declare-fun b!136215 () Bool)

(declare-fun res!113341 () Bool)

(assert (=> b!136215 (=> (not res!113341) (not e!90447))))

(assert (=> b!136215 (= res!113341 (isPrefixOf!0 (_1!6232 lt!211859) (_2!6230 lt!210687)))))

(declare-fun b!136216 () Bool)

(declare-fun Unit!8499 () Unit!8446)

(assert (=> b!136216 (= e!90446 Unit!8499)))

(declare-fun d!43840 () Bool)

(assert (=> d!43840 e!90447))

(declare-fun res!113343 () Bool)

(assert (=> d!43840 (=> (not res!113343) (not e!90447))))

(assert (=> d!43840 (= res!113343 (isPrefixOf!0 (_1!6232 lt!211859) (_2!6232 lt!211859)))))

(declare-fun lt!211870 () BitStream!4872)

(assert (=> d!43840 (= lt!211859 (tuple2!11833 lt!211870 (_2!6230 lt!211513)))))

(declare-fun lt!211873 () Unit!8446)

(declare-fun lt!211874 () Unit!8446)

(assert (=> d!43840 (= lt!211873 lt!211874)))

(assert (=> d!43840 (isPrefixOf!0 lt!211870 (_2!6230 lt!211513))))

(assert (=> d!43840 (= lt!211874 (lemmaIsPrefixTransitive!0 lt!211870 (_2!6230 lt!211513) (_2!6230 lt!211513)))))

(declare-fun lt!211861 () Unit!8446)

(declare-fun lt!211866 () Unit!8446)

(assert (=> d!43840 (= lt!211861 lt!211866)))

(assert (=> d!43840 (isPrefixOf!0 lt!211870 (_2!6230 lt!211513))))

(assert (=> d!43840 (= lt!211866 (lemmaIsPrefixTransitive!0 lt!211870 (_2!6230 lt!210687) (_2!6230 lt!211513)))))

(declare-fun lt!211855 () Unit!8446)

(assert (=> d!43840 (= lt!211855 e!90446)))

(declare-fun c!7707 () Bool)

(assert (=> d!43840 (= c!7707 (not (= (size!2804 (buf!3197 (_2!6230 lt!210687))) #b00000000000000000000000000000000)))))

(declare-fun lt!211868 () Unit!8446)

(declare-fun lt!211856 () Unit!8446)

(assert (=> d!43840 (= lt!211868 lt!211856)))

(assert (=> d!43840 (isPrefixOf!0 (_2!6230 lt!211513) (_2!6230 lt!211513))))

(assert (=> d!43840 (= lt!211856 (lemmaIsPrefixRefl!0 (_2!6230 lt!211513)))))

(declare-fun lt!211869 () Unit!8446)

(declare-fun lt!211867 () Unit!8446)

(assert (=> d!43840 (= lt!211869 lt!211867)))

(assert (=> d!43840 (= lt!211867 (lemmaIsPrefixRefl!0 (_2!6230 lt!211513)))))

(declare-fun lt!211865 () Unit!8446)

(declare-fun lt!211872 () Unit!8446)

(assert (=> d!43840 (= lt!211865 lt!211872)))

(assert (=> d!43840 (isPrefixOf!0 lt!211870 lt!211870)))

(assert (=> d!43840 (= lt!211872 (lemmaIsPrefixRefl!0 lt!211870))))

(declare-fun lt!211862 () Unit!8446)

(declare-fun lt!211871 () Unit!8446)

(assert (=> d!43840 (= lt!211862 lt!211871)))

(assert (=> d!43840 (isPrefixOf!0 (_2!6230 lt!210687) (_2!6230 lt!210687))))

(assert (=> d!43840 (= lt!211871 (lemmaIsPrefixRefl!0 (_2!6230 lt!210687)))))

(assert (=> d!43840 (= lt!211870 (BitStream!4873 (buf!3197 (_2!6230 lt!211513)) (currentByte!5994 (_2!6230 lt!210687)) (currentBit!5989 (_2!6230 lt!210687))))))

(assert (=> d!43840 (isPrefixOf!0 (_2!6230 lt!210687) (_2!6230 lt!211513))))

(assert (=> d!43840 (= (reader!0 (_2!6230 lt!210687) (_2!6230 lt!211513)) lt!211859)))

(declare-fun lt!211858 () (_ BitVec 64))

(declare-fun lt!211860 () (_ BitVec 64))

(declare-fun b!136217 () Bool)

(assert (=> b!136217 (= e!90447 (= (_1!6232 lt!211859) (withMovedBitIndex!0 (_2!6232 lt!211859) (bvsub lt!211858 lt!211860))))))

(assert (=> b!136217 (or (= (bvand lt!211858 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!211860 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!211858 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!211858 lt!211860) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!136217 (= lt!211860 (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!211513))) (currentByte!5994 (_2!6230 lt!211513)) (currentBit!5989 (_2!6230 lt!211513))))))

(assert (=> b!136217 (= lt!211858 (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!210687))) (currentByte!5994 (_2!6230 lt!210687)) (currentBit!5989 (_2!6230 lt!210687))))))

(assert (= (and d!43840 c!7707) b!136213))

(assert (= (and d!43840 (not c!7707)) b!136216))

(assert (= (and d!43840 res!113343) b!136215))

(assert (= (and b!136215 res!113341) b!136214))

(assert (= (and b!136214 res!113342) b!136217))

(declare-fun m!208383 () Bool)

(assert (=> b!136214 m!208383))

(declare-fun m!208385 () Bool)

(assert (=> d!43840 m!208385))

(declare-fun m!208387 () Bool)

(assert (=> d!43840 m!208387))

(declare-fun m!208389 () Bool)

(assert (=> d!43840 m!208389))

(declare-fun m!208391 () Bool)

(assert (=> d!43840 m!208391))

(assert (=> d!43840 m!207791))

(declare-fun m!208393 () Bool)

(assert (=> d!43840 m!208393))

(declare-fun m!208395 () Bool)

(assert (=> d!43840 m!208395))

(declare-fun m!208397 () Bool)

(assert (=> d!43840 m!208397))

(assert (=> d!43840 m!207947))

(declare-fun m!208399 () Bool)

(assert (=> d!43840 m!208399))

(assert (=> d!43840 m!207801))

(assert (=> b!136213 m!207195))

(declare-fun m!208401 () Bool)

(assert (=> b!136213 m!208401))

(declare-fun m!208403 () Bool)

(assert (=> b!136213 m!208403))

(declare-fun m!208405 () Bool)

(assert (=> b!136217 m!208405))

(assert (=> b!136217 m!207951))

(assert (=> b!136217 m!207195))

(declare-fun m!208407 () Bool)

(assert (=> b!136215 m!208407))

(assert (=> b!136045 d!43840))

(assert (=> d!43693 d!43766))

(assert (=> d!43641 d!43625))

(declare-fun d!43842 () Bool)

(declare-fun res!113345 () Bool)

(declare-fun e!90449 () Bool)

(assert (=> d!43842 (=> (not res!113345) (not e!90449))))

(assert (=> d!43842 (= res!113345 (= (size!2804 (buf!3197 (_1!6232 lt!211414))) (size!2804 (buf!3197 thiss!1634))))))

(assert (=> d!43842 (= (isPrefixOf!0 (_1!6232 lt!211414) thiss!1634) e!90449)))

(declare-fun b!136218 () Bool)

(declare-fun res!113346 () Bool)

(assert (=> b!136218 (=> (not res!113346) (not e!90449))))

(assert (=> b!136218 (= res!113346 (bvsle (bitIndex!0 (size!2804 (buf!3197 (_1!6232 lt!211414))) (currentByte!5994 (_1!6232 lt!211414)) (currentBit!5989 (_1!6232 lt!211414))) (bitIndex!0 (size!2804 (buf!3197 thiss!1634)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634))))))

(declare-fun b!136219 () Bool)

(declare-fun e!90448 () Bool)

(assert (=> b!136219 (= e!90449 e!90448)))

(declare-fun res!113344 () Bool)

(assert (=> b!136219 (=> res!113344 e!90448)))

(assert (=> b!136219 (= res!113344 (= (size!2804 (buf!3197 (_1!6232 lt!211414))) #b00000000000000000000000000000000))))

(declare-fun b!136220 () Bool)

(assert (=> b!136220 (= e!90448 (arrayBitRangesEq!0 (buf!3197 (_1!6232 lt!211414)) (buf!3197 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2804 (buf!3197 (_1!6232 lt!211414))) (currentByte!5994 (_1!6232 lt!211414)) (currentBit!5989 (_1!6232 lt!211414)))))))

(assert (= (and d!43842 res!113345) b!136218))

(assert (= (and b!136218 res!113346) b!136219))

(assert (= (and b!136219 (not res!113344)) b!136220))

(assert (=> b!136218 m!208009))

(assert (=> b!136218 m!207197))

(assert (=> b!136220 m!208009))

(assert (=> b!136220 m!208009))

(declare-fun m!208409 () Bool)

(assert (=> b!136220 m!208409))

(assert (=> b!136006 d!43842))

(declare-fun d!43844 () Bool)

(assert (=> d!43844 (= (remainingBits!0 ((_ sign_extend 32) (size!2804 (buf!3197 (_1!6231 lt!210704)))) ((_ sign_extend 32) (currentByte!5994 (_1!6231 lt!210704))) ((_ sign_extend 32) (currentBit!5989 (_1!6231 lt!210704)))) (bvsub (bvmul ((_ sign_extend 32) (size!2804 (buf!3197 (_1!6231 lt!210704)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5994 (_1!6231 lt!210704))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5989 (_1!6231 lt!210704))))))))

(assert (=> d!43669 d!43844))

(declare-fun d!43846 () Bool)

(assert (=> d!43846 (= (invariant!0 (currentBit!5989 (_1!6231 lt!210704)) (currentByte!5994 (_1!6231 lt!210704)) (size!2804 (buf!3197 (_1!6231 lt!210704)))) (and (bvsge (currentBit!5989 (_1!6231 lt!210704)) #b00000000000000000000000000000000) (bvslt (currentBit!5989 (_1!6231 lt!210704)) #b00000000000000000000000000001000) (bvsge (currentByte!5994 (_1!6231 lt!210704)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5994 (_1!6231 lt!210704)) (size!2804 (buf!3197 (_1!6231 lt!210704)))) (and (= (currentBit!5989 (_1!6231 lt!210704)) #b00000000000000000000000000000000) (= (currentByte!5994 (_1!6231 lt!210704)) (size!2804 (buf!3197 (_1!6231 lt!210704))))))))))

(assert (=> d!43669 d!43846))

(declare-fun d!43848 () Bool)

(declare-fun res!113348 () Bool)

(declare-fun e!90451 () Bool)

(assert (=> d!43848 (=> (not res!113348) (not e!90451))))

(assert (=> d!43848 (= res!113348 (= (size!2804 (buf!3197 (_1!6232 lt!211358))) (size!2804 (buf!3197 (_2!6232 lt!211358)))))))

(assert (=> d!43848 (= (isPrefixOf!0 (_1!6232 lt!211358) (_2!6232 lt!211358)) e!90451)))

(declare-fun b!136221 () Bool)

(declare-fun res!113349 () Bool)

(assert (=> b!136221 (=> (not res!113349) (not e!90451))))

(assert (=> b!136221 (= res!113349 (bvsle (bitIndex!0 (size!2804 (buf!3197 (_1!6232 lt!211358))) (currentByte!5994 (_1!6232 lt!211358)) (currentBit!5989 (_1!6232 lt!211358))) (bitIndex!0 (size!2804 (buf!3197 (_2!6232 lt!211358))) (currentByte!5994 (_2!6232 lt!211358)) (currentBit!5989 (_2!6232 lt!211358)))))))

(declare-fun b!136222 () Bool)

(declare-fun e!90450 () Bool)

(assert (=> b!136222 (= e!90451 e!90450)))

(declare-fun res!113347 () Bool)

(assert (=> b!136222 (=> res!113347 e!90450)))

(assert (=> b!136222 (= res!113347 (= (size!2804 (buf!3197 (_1!6232 lt!211358))) #b00000000000000000000000000000000))))

(declare-fun b!136223 () Bool)

(assert (=> b!136223 (= e!90450 (arrayBitRangesEq!0 (buf!3197 (_1!6232 lt!211358)) (buf!3197 (_2!6232 lt!211358)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2804 (buf!3197 (_1!6232 lt!211358))) (currentByte!5994 (_1!6232 lt!211358)) (currentBit!5989 (_1!6232 lt!211358)))))))

(assert (= (and d!43848 res!113348) b!136221))

(assert (= (and b!136221 res!113349) b!136222))

(assert (= (and b!136222 (not res!113347)) b!136223))

(assert (=> b!136221 m!208033))

(assert (=> b!136221 m!208253))

(assert (=> b!136223 m!208033))

(assert (=> b!136223 m!208033))

(declare-fun m!208411 () Bool)

(assert (=> b!136223 m!208411))

(assert (=> d!43621 d!43848))

(declare-fun d!43850 () Bool)

(assert (=> d!43850 (isPrefixOf!0 lt!211369 (_2!6230 lt!210693))))

(declare-fun lt!211875 () Unit!8446)

(assert (=> d!43850 (= lt!211875 (choose!30 lt!211369 (_2!6230 lt!210693) (_2!6230 lt!210693)))))

(assert (=> d!43850 (isPrefixOf!0 lt!211369 (_2!6230 lt!210693))))

(assert (=> d!43850 (= (lemmaIsPrefixTransitive!0 lt!211369 (_2!6230 lt!210693) (_2!6230 lt!210693)) lt!211875)))

(declare-fun bs!10687 () Bool)

(assert (= bs!10687 d!43850))

(assert (=> bs!10687 m!207795))

(declare-fun m!208413 () Bool)

(assert (=> bs!10687 m!208413))

(assert (=> bs!10687 m!207795))

(assert (=> d!43621 d!43850))

(declare-fun d!43852 () Bool)

(declare-fun res!113351 () Bool)

(declare-fun e!90453 () Bool)

(assert (=> d!43852 (=> (not res!113351) (not e!90453))))

(assert (=> d!43852 (= res!113351 (= (size!2804 (buf!3197 lt!211369)) (size!2804 (buf!3197 (_2!6230 lt!210693)))))))

(assert (=> d!43852 (= (isPrefixOf!0 lt!211369 (_2!6230 lt!210693)) e!90453)))

(declare-fun b!136224 () Bool)

(declare-fun res!113352 () Bool)

(assert (=> b!136224 (=> (not res!113352) (not e!90453))))

(assert (=> b!136224 (= res!113352 (bvsle (bitIndex!0 (size!2804 (buf!3197 lt!211369)) (currentByte!5994 lt!211369) (currentBit!5989 lt!211369)) (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!210693))) (currentByte!5994 (_2!6230 lt!210693)) (currentBit!5989 (_2!6230 lt!210693)))))))

(declare-fun b!136225 () Bool)

(declare-fun e!90452 () Bool)

(assert (=> b!136225 (= e!90453 e!90452)))

(declare-fun res!113350 () Bool)

(assert (=> b!136225 (=> res!113350 e!90452)))

(assert (=> b!136225 (= res!113350 (= (size!2804 (buf!3197 lt!211369)) #b00000000000000000000000000000000))))

(declare-fun b!136226 () Bool)

(assert (=> b!136226 (= e!90452 (arrayBitRangesEq!0 (buf!3197 lt!211369) (buf!3197 (_2!6230 lt!210693)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2804 (buf!3197 lt!211369)) (currentByte!5994 lt!211369) (currentBit!5989 lt!211369))))))

(assert (= (and d!43852 res!113351) b!136224))

(assert (= (and b!136224 res!113352) b!136225))

(assert (= (and b!136225 (not res!113350)) b!136226))

(declare-fun m!208415 () Bool)

(assert (=> b!136224 m!208415))

(assert (=> b!136224 m!207203))

(assert (=> b!136226 m!208415))

(assert (=> b!136226 m!208415))

(declare-fun m!208417 () Bool)

(assert (=> b!136226 m!208417))

(assert (=> d!43621 d!43852))

(declare-fun d!43854 () Bool)

(declare-fun res!113354 () Bool)

(declare-fun e!90455 () Bool)

(assert (=> d!43854 (=> (not res!113354) (not e!90455))))

(assert (=> d!43854 (= res!113354 (= (size!2804 (buf!3197 lt!211369)) (size!2804 (buf!3197 lt!211369))))))

(assert (=> d!43854 (= (isPrefixOf!0 lt!211369 lt!211369) e!90455)))

(declare-fun b!136227 () Bool)

(declare-fun res!113355 () Bool)

(assert (=> b!136227 (=> (not res!113355) (not e!90455))))

(assert (=> b!136227 (= res!113355 (bvsle (bitIndex!0 (size!2804 (buf!3197 lt!211369)) (currentByte!5994 lt!211369) (currentBit!5989 lt!211369)) (bitIndex!0 (size!2804 (buf!3197 lt!211369)) (currentByte!5994 lt!211369) (currentBit!5989 lt!211369))))))

(declare-fun b!136228 () Bool)

(declare-fun e!90454 () Bool)

(assert (=> b!136228 (= e!90455 e!90454)))

(declare-fun res!113353 () Bool)

(assert (=> b!136228 (=> res!113353 e!90454)))

(assert (=> b!136228 (= res!113353 (= (size!2804 (buf!3197 lt!211369)) #b00000000000000000000000000000000))))

(declare-fun b!136229 () Bool)

(assert (=> b!136229 (= e!90454 (arrayBitRangesEq!0 (buf!3197 lt!211369) (buf!3197 lt!211369) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2804 (buf!3197 lt!211369)) (currentByte!5994 lt!211369) (currentBit!5989 lt!211369))))))

(assert (= (and d!43854 res!113354) b!136227))

(assert (= (and b!136227 res!113355) b!136228))

(assert (= (and b!136228 (not res!113353)) b!136229))

(assert (=> b!136227 m!208415))

(assert (=> b!136227 m!208415))

(assert (=> b!136229 m!208415))

(assert (=> b!136229 m!208415))

(declare-fun m!208419 () Bool)

(assert (=> b!136229 m!208419))

(assert (=> d!43621 d!43854))

(assert (=> d!43621 d!43774))

(assert (=> d!43621 d!43728))

(assert (=> d!43621 d!43732))

(declare-fun d!43856 () Bool)

(assert (=> d!43856 (isPrefixOf!0 lt!211369 (_2!6230 lt!210693))))

(declare-fun lt!211876 () Unit!8446)

(assert (=> d!43856 (= lt!211876 (choose!30 lt!211369 (_2!6230 lt!210687) (_2!6230 lt!210693)))))

(assert (=> d!43856 (isPrefixOf!0 lt!211369 (_2!6230 lt!210687))))

(assert (=> d!43856 (= (lemmaIsPrefixTransitive!0 lt!211369 (_2!6230 lt!210687) (_2!6230 lt!210693)) lt!211876)))

(declare-fun bs!10688 () Bool)

(assert (= bs!10688 d!43856))

(assert (=> bs!10688 m!207795))

(declare-fun m!208421 () Bool)

(assert (=> bs!10688 m!208421))

(declare-fun m!208423 () Bool)

(assert (=> bs!10688 m!208423))

(assert (=> d!43621 d!43856))

(assert (=> d!43621 d!43772))

(assert (=> d!43621 d!43613))

(declare-fun d!43858 () Bool)

(assert (=> d!43858 (isPrefixOf!0 lt!211369 lt!211369)))

(declare-fun lt!211877 () Unit!8446)

(assert (=> d!43858 (= lt!211877 (choose!11 lt!211369))))

(assert (=> d!43858 (= (lemmaIsPrefixRefl!0 lt!211369) lt!211877)))

(declare-fun bs!10689 () Bool)

(assert (= bs!10689 d!43858))

(assert (=> bs!10689 m!207799))

(declare-fun m!208425 () Bool)

(assert (=> bs!10689 m!208425))

(assert (=> d!43621 d!43858))

(declare-fun b!136240 () Bool)

(declare-fun res!113364 () Bool)

(declare-fun e!90467 () Bool)

(assert (=> b!136240 (=> (not res!113364) (not e!90467))))

(declare-fun _$39!27 () tuple2!11828)

(assert (=> b!136240 (= res!113364 (isPrefixOf!0 (_2!6230 lt!210687) (_2!6230 _$39!27)))))

(declare-fun b!136242 () Bool)

(declare-fun res!113367 () Bool)

(assert (=> b!136242 (=> (not res!113367) (not e!90467))))

(assert (=> b!136242 (= res!113367 (= (bitIndex!0 (size!2804 (buf!3197 (_2!6230 _$39!27))) (currentByte!5994 (_2!6230 _$39!27)) (currentBit!5989 (_2!6230 _$39!27))) (bvadd (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!210687))) (currentByte!5994 (_2!6230 lt!210687)) (currentBit!5989 (_2!6230 lt!210687))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!136243 () Bool)

(declare-fun e!90466 () Bool)

(assert (=> b!136243 (= e!90466 (array_inv!2593 (buf!3197 (_2!6230 _$39!27))))))

(declare-fun e!90464 () Bool)

(declare-fun lt!211891 () tuple2!11834)

(declare-fun b!136244 () Bool)

(assert (=> b!136244 (= e!90464 (arrayRangesEq!207 arr!237 (_2!6233 lt!211891) #b00000000000000000000000000000000 to!404))))

(declare-fun b!136241 () Bool)

(assert (=> b!136241 (= e!90467 e!90464)))

(declare-fun res!113366 () Bool)

(assert (=> b!136241 (=> (not res!113366) (not e!90464))))

(declare-fun lt!211889 () tuple2!11832)

(assert (=> b!136241 (= res!113366 (and (= (size!2804 (_2!6233 lt!211891)) (size!2804 arr!237)) (= (_1!6233 lt!211891) (_2!6232 lt!211889))))))

(assert (=> b!136241 (= lt!211891 (readByteArrayLoopPure!0 (_1!6232 lt!211889) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!211888 () Unit!8446)

(declare-fun lt!211892 () Unit!8446)

(assert (=> b!136241 (= lt!211888 lt!211892)))

(declare-fun lt!211890 () (_ BitVec 64))

(assert (=> b!136241 (validate_offset_bits!1 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 _$39!27)))) ((_ sign_extend 32) (currentByte!5994 (_2!6230 lt!210687))) ((_ sign_extend 32) (currentBit!5989 (_2!6230 lt!210687))) lt!211890)))

(assert (=> b!136241 (= lt!211892 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6230 lt!210687) (buf!3197 (_2!6230 _$39!27)) lt!211890))))

(assert (=> b!136241 (= lt!211890 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!136241 (= lt!211889 (reader!0 (_2!6230 lt!210687) (_2!6230 _$39!27)))))

(declare-fun d!43860 () Bool)

(assert (=> d!43860 e!90467))

(declare-fun res!113365 () Bool)

(assert (=> d!43860 (=> (not res!113365) (not e!90467))))

(assert (=> d!43860 (= res!113365 (= (size!2804 (buf!3197 (_2!6230 lt!210687))) (size!2804 (buf!3197 (_2!6230 _$39!27)))))))

(assert (=> d!43860 (and (inv!12 (_2!6230 _$39!27)) e!90466)))

(assert (=> d!43860 (= (choose!64 (_2!6230 lt!210687) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) _$39!27)))

(assert (= d!43860 b!136243))

(assert (= (and d!43860 res!113365) b!136242))

(assert (= (and b!136242 res!113367) b!136240))

(assert (= (and b!136240 res!113364) b!136241))

(assert (= (and b!136241 res!113366) b!136244))

(declare-fun m!208427 () Bool)

(assert (=> b!136244 m!208427))

(declare-fun m!208429 () Bool)

(assert (=> b!136240 m!208429))

(declare-fun m!208431 () Bool)

(assert (=> d!43860 m!208431))

(declare-fun m!208433 () Bool)

(assert (=> b!136242 m!208433))

(assert (=> b!136242 m!207195))

(declare-fun m!208435 () Bool)

(assert (=> b!136243 m!208435))

(declare-fun m!208437 () Bool)

(assert (=> b!136241 m!208437))

(declare-fun m!208439 () Bool)

(assert (=> b!136241 m!208439))

(declare-fun m!208441 () Bool)

(assert (=> b!136241 m!208441))

(declare-fun m!208443 () Bool)

(assert (=> b!136241 m!208443))

(assert (=> d!43691 d!43860))

(declare-fun d!43862 () Bool)

(declare-fun e!90468 () Bool)

(assert (=> d!43862 e!90468))

(declare-fun res!113368 () Bool)

(assert (=> d!43862 (=> (not res!113368) (not e!90468))))

(declare-fun lt!211893 () BitStream!4872)

(declare-fun lt!211894 () (_ BitVec 64))

(assert (=> d!43862 (= res!113368 (= (bvadd lt!211894 (bvsub lt!211413 lt!211415)) (bitIndex!0 (size!2804 (buf!3197 lt!211893)) (currentByte!5994 lt!211893) (currentBit!5989 lt!211893))))))

(assert (=> d!43862 (or (not (= (bvand lt!211894 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!211413 lt!211415) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!211894 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!211894 (bvsub lt!211413 lt!211415)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!43862 (= lt!211894 (bitIndex!0 (size!2804 (buf!3197 (_2!6232 lt!211414))) (currentByte!5994 (_2!6232 lt!211414)) (currentBit!5989 (_2!6232 lt!211414))))))

(assert (=> d!43862 (= lt!211893 (_2!6230 (moveBitIndex!0 (_2!6232 lt!211414) (bvsub lt!211413 lt!211415))))))

(assert (=> d!43862 (moveBitIndexPrecond!0 (_2!6232 lt!211414) (bvsub lt!211413 lt!211415))))

(assert (=> d!43862 (= (withMovedBitIndex!0 (_2!6232 lt!211414) (bvsub lt!211413 lt!211415)) lt!211893)))

(declare-fun b!136245 () Bool)

(assert (=> b!136245 (= e!90468 (= (size!2804 (buf!3197 (_2!6232 lt!211414))) (size!2804 (buf!3197 lt!211893))))))

(assert (= (and d!43862 res!113368) b!136245))

(declare-fun m!208445 () Bool)

(assert (=> d!43862 m!208445))

(assert (=> d!43862 m!208011))

(declare-fun m!208447 () Bool)

(assert (=> d!43862 m!208447))

(declare-fun m!208449 () Bool)

(assert (=> d!43862 m!208449))

(assert (=> b!136008 d!43862))

(assert (=> b!136008 d!43645))

(assert (=> b!136008 d!43611))

(assert (=> d!43698 d!43677))

(declare-fun d!43864 () Bool)

(assert (=> d!43864 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!210693)))) ((_ sign_extend 32) (currentByte!5994 thiss!1634)) ((_ sign_extend 32) (currentBit!5989 thiss!1634)) (bvsub to!404 from!447))))

(assert (=> d!43864 true))

(declare-fun _$5!45 () Unit!8446)

(assert (=> d!43864 (= (choose!26 thiss!1634 (buf!3197 (_2!6230 lt!210693)) (bvsub to!404 from!447) (BitStream!4873 (buf!3197 (_2!6230 lt!210693)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634))) _$5!45)))

(declare-fun bs!10690 () Bool)

(assert (= bs!10690 d!43864))

(assert (=> bs!10690 m!207241))

(assert (=> d!43698 d!43864))

(assert (=> b!135966 d!43609))

(assert (=> b!135966 d!43645))

(declare-fun lt!211899 () (_ BitVec 8))

(declare-fun lt!211900 () (_ BitVec 8))

(declare-fun d!43866 () Bool)

(assert (=> d!43866 (= lt!211899 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3469 (buf!3197 (BitStream!4873 (buf!3197 (_2!6230 lt!210693)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634)))) (currentByte!5994 (BitStream!4873 (buf!3197 (_2!6230 lt!210693)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634))))) ((_ sign_extend 24) lt!211900))))))

(assert (=> d!43866 (= lt!211900 ((_ extract 7 0) (currentBit!5989 (BitStream!4873 (buf!3197 (_2!6230 lt!210693)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634)))))))

(declare-fun e!90470 () Bool)

(assert (=> d!43866 e!90470))

(declare-fun res!113370 () Bool)

(assert (=> d!43866 (=> (not res!113370) (not e!90470))))

(assert (=> d!43866 (= res!113370 (validate_offset_bits!1 ((_ sign_extend 32) (size!2804 (buf!3197 (BitStream!4873 (buf!3197 (_2!6230 lt!210693)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634))))) ((_ sign_extend 32) (currentByte!5994 (BitStream!4873 (buf!3197 (_2!6230 lt!210693)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634)))) ((_ sign_extend 32) (currentBit!5989 (BitStream!4873 (buf!3197 (_2!6230 lt!210693)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634)))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!8500 () Unit!8446)

(declare-fun Unit!8501 () Unit!8446)

(assert (=> d!43866 (= (readByte!0 (BitStream!4873 (buf!3197 (_2!6230 lt!210693)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634))) (tuple2!11849 (_2!6245 (ite (bvsgt ((_ sign_extend 24) lt!211900) #b00000000000000000000000000000000) (tuple2!11851 Unit!8500 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!211899) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3469 (buf!3197 (BitStream!4873 (buf!3197 (_2!6230 lt!210693)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634)))) (bvadd (currentByte!5994 (BitStream!4873 (buf!3197 (_2!6230 lt!210693)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!211900)))))))) (tuple2!11851 Unit!8501 lt!211899))) (BitStream!4873 (buf!3197 (BitStream!4873 (buf!3197 (_2!6230 lt!210693)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634))) (bvadd (currentByte!5994 (BitStream!4873 (buf!3197 (_2!6230 lt!210693)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634))) #b00000000000000000000000000000001) (currentBit!5989 (BitStream!4873 (buf!3197 (_2!6230 lt!210693)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634))))))))

(declare-fun b!136246 () Bool)

(declare-fun e!90469 () Bool)

(assert (=> b!136246 (= e!90470 e!90469)))

(declare-fun res!113369 () Bool)

(assert (=> b!136246 (=> (not res!113369) (not e!90469))))

(declare-fun lt!211898 () tuple2!11848)

(assert (=> b!136246 (= res!113369 (= (buf!3197 (_2!6243 lt!211898)) (buf!3197 (BitStream!4873 (buf!3197 (_2!6230 lt!210693)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634)))))))

(declare-fun lt!211901 () (_ BitVec 8))

(declare-fun lt!211897 () (_ BitVec 8))

(declare-fun Unit!8502 () Unit!8446)

(declare-fun Unit!8503 () Unit!8446)

(assert (=> b!136246 (= lt!211898 (tuple2!11849 (_2!6245 (ite (bvsgt ((_ sign_extend 24) lt!211897) #b00000000000000000000000000000000) (tuple2!11851 Unit!8502 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!211901) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3469 (buf!3197 (BitStream!4873 (buf!3197 (_2!6230 lt!210693)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634)))) (bvadd (currentByte!5994 (BitStream!4873 (buf!3197 (_2!6230 lt!210693)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!211897)))))))) (tuple2!11851 Unit!8503 lt!211901))) (BitStream!4873 (buf!3197 (BitStream!4873 (buf!3197 (_2!6230 lt!210693)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634))) (bvadd (currentByte!5994 (BitStream!4873 (buf!3197 (_2!6230 lt!210693)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634))) #b00000000000000000000000000000001) (currentBit!5989 (BitStream!4873 (buf!3197 (_2!6230 lt!210693)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634))))))))

(assert (=> b!136246 (= lt!211901 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3469 (buf!3197 (BitStream!4873 (buf!3197 (_2!6230 lt!210693)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634)))) (currentByte!5994 (BitStream!4873 (buf!3197 (_2!6230 lt!210693)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634))))) ((_ sign_extend 24) lt!211897))))))

(assert (=> b!136246 (= lt!211897 ((_ extract 7 0) (currentBit!5989 (BitStream!4873 (buf!3197 (_2!6230 lt!210693)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634)))))))

(declare-fun lt!211895 () (_ BitVec 64))

(declare-fun b!136247 () Bool)

(declare-fun lt!211896 () (_ BitVec 64))

(assert (=> b!136247 (= e!90469 (= (bitIndex!0 (size!2804 (buf!3197 (_2!6243 lt!211898))) (currentByte!5994 (_2!6243 lt!211898)) (currentBit!5989 (_2!6243 lt!211898))) (bvadd lt!211896 lt!211895)))))

(assert (=> b!136247 (or (not (= (bvand lt!211896 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!211895 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!211896 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!211896 lt!211895) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!136247 (= lt!211895 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!136247 (= lt!211896 (bitIndex!0 (size!2804 (buf!3197 (BitStream!4873 (buf!3197 (_2!6230 lt!210693)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634)))) (currentByte!5994 (BitStream!4873 (buf!3197 (_2!6230 lt!210693)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634))) (currentBit!5989 (BitStream!4873 (buf!3197 (_2!6230 lt!210693)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634)))))))

(assert (= (and d!43866 res!113370) b!136246))

(assert (= (and b!136246 res!113369) b!136247))

(declare-fun m!208451 () Bool)

(assert (=> d!43866 m!208451))

(declare-fun m!208453 () Bool)

(assert (=> d!43866 m!208453))

(declare-fun m!208455 () Bool)

(assert (=> d!43866 m!208455))

(assert (=> b!136246 m!208455))

(assert (=> b!136246 m!208451))

(declare-fun m!208457 () Bool)

(assert (=> b!136247 m!208457))

(declare-fun m!208459 () Bool)

(assert (=> b!136247 m!208459))

(assert (=> d!43661 d!43866))

(declare-fun d!43868 () Bool)

(declare-fun e!90473 () Bool)

(assert (=> d!43868 e!90473))

(declare-fun res!113373 () Bool)

(assert (=> d!43868 (=> (not res!113373) (not e!90473))))

(declare-fun moveByteIndexPrecond!0 (BitStream!4872 (_ BitVec 32)) Bool)

(assert (=> d!43868 (= res!113373 (moveByteIndexPrecond!0 (_1!6232 lt!210690) #b00000000000000000000000000000001))))

(declare-fun Unit!8504 () Unit!8446)

(assert (=> d!43868 (= (moveByteIndex!0 (_1!6232 lt!210690) #b00000000000000000000000000000001) (tuple2!11829 Unit!8504 (BitStream!4873 (buf!3197 (_1!6232 lt!210690)) (bvadd (currentByte!5994 (_1!6232 lt!210690)) #b00000000000000000000000000000001) (currentBit!5989 (_1!6232 lt!210690)))))))

(declare-fun b!136250 () Bool)

(assert (=> b!136250 (= e!90473 (and (or (not (= (bvand (currentByte!5994 (_1!6232 lt!210690)) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!5994 (_1!6232 lt!210690)) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!5994 (_1!6232 lt!210690)) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!5994 (_1!6232 lt!210690)) #b00000000000000000000000000000001) (bvadd (currentByte!5994 (_1!6232 lt!210690)) #b00000000000000000000000000000001))))))

(assert (= (and d!43868 res!113373) b!136250))

(declare-fun m!208461 () Bool)

(assert (=> d!43868 m!208461))

(assert (=> d!43685 d!43868))

(declare-fun d!43870 () Bool)

(declare-fun e!90474 () Bool)

(assert (=> d!43870 e!90474))

(declare-fun res!113374 () Bool)

(assert (=> d!43870 (=> (not res!113374) (not e!90474))))

(declare-fun lt!211903 () (_ BitVec 64))

(declare-fun lt!211902 () BitStream!4872)

(assert (=> d!43870 (= res!113374 (= (bvadd lt!211903 (bvsub lt!211357 lt!211359)) (bitIndex!0 (size!2804 (buf!3197 lt!211902)) (currentByte!5994 lt!211902) (currentBit!5989 lt!211902))))))

(assert (=> d!43870 (or (not (= (bvand lt!211903 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!211357 lt!211359) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!211903 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!211903 (bvsub lt!211357 lt!211359)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!43870 (= lt!211903 (bitIndex!0 (size!2804 (buf!3197 (_2!6232 lt!211358))) (currentByte!5994 (_2!6232 lt!211358)) (currentBit!5989 (_2!6232 lt!211358))))))

(assert (=> d!43870 (= lt!211902 (_2!6230 (moveBitIndex!0 (_2!6232 lt!211358) (bvsub lt!211357 lt!211359))))))

(assert (=> d!43870 (moveBitIndexPrecond!0 (_2!6232 lt!211358) (bvsub lt!211357 lt!211359))))

(assert (=> d!43870 (= (withMovedBitIndex!0 (_2!6232 lt!211358) (bvsub lt!211357 lt!211359)) lt!211902)))

(declare-fun b!136251 () Bool)

(assert (=> b!136251 (= e!90474 (= (size!2804 (buf!3197 (_2!6232 lt!211358))) (size!2804 (buf!3197 lt!211902))))))

(assert (= (and d!43870 res!113374) b!136251))

(declare-fun m!208463 () Bool)

(assert (=> d!43870 m!208463))

(assert (=> d!43870 m!208253))

(declare-fun m!208465 () Bool)

(assert (=> d!43870 m!208465))

(declare-fun m!208467 () Bool)

(assert (=> d!43870 m!208467))

(assert (=> b!135983 d!43870))

(assert (=> b!135983 d!43645))

(assert (=> b!135983 d!43609))

(assert (=> d!43659 d!43675))

(declare-fun d!43872 () Bool)

(assert (=> d!43872 (arrayRangesEq!207 (_2!6233 (readByteArrayLoopPure!0 (_1!6232 lt!210690) arr!237 from!447 to!404)) (_2!6233 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6232 lt!210690) #b00000000000000000000000000000001) (array!6193 (store (arr!3469 arr!237) from!447 (_2!6231 (readBytePure!0 (_1!6232 lt!210690)))) (size!2804 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404)) #b00000000000000000000000000000000 to!404)))

(assert (=> d!43872 true))

(declare-fun _$13!46 () Unit!8446)

(assert (=> d!43872 (= (choose!35 (_1!6232 lt!210690) arr!237 from!447 to!404 lt!211438 (_2!6233 lt!211438) lt!211439 lt!211440 (_2!6233 lt!211440)) _$13!46)))

(declare-fun bs!10692 () Bool)

(assert (= bs!10692 d!43872))

(assert (=> bs!10692 m!207245))

(assert (=> bs!10692 m!207239))

(declare-fun m!208469 () Bool)

(assert (=> bs!10692 m!208469))

(assert (=> bs!10692 m!207235))

(assert (=> bs!10692 m!207891))

(assert (=> bs!10692 m!207235))

(declare-fun m!208471 () Bool)

(assert (=> bs!10692 m!208471))

(assert (=> d!43659 d!43872))

(assert (=> d!43659 d!43685))

(assert (=> d!43659 d!43687))

(declare-fun d!43874 () Bool)

(declare-fun lt!211904 () tuple3!518)

(assert (=> d!43874 (= lt!211904 (readByteArrayLoop!0 lt!211439 (array!6193 (store (arr!3469 arr!237) from!447 (_2!6231 (readBytePure!0 (_1!6232 lt!210690)))) (size!2804 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!43874 (= (readByteArrayLoopPure!0 lt!211439 (array!6193 (store (arr!3469 arr!237) from!447 (_2!6231 (readBytePure!0 (_1!6232 lt!210690)))) (size!2804 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404) (tuple2!11835 (_2!6242 lt!211904) (_3!318 lt!211904)))))

(declare-fun bs!10693 () Bool)

(assert (= bs!10693 d!43874))

(declare-fun m!208473 () Bool)

(assert (=> bs!10693 m!208473))

(assert (=> d!43659 d!43874))

(declare-fun d!43876 () Bool)

(declare-fun res!113375 () Bool)

(declare-fun e!90475 () Bool)

(assert (=> d!43876 (=> res!113375 e!90475)))

(assert (=> d!43876 (= res!113375 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!43876 (= (arrayRangesEq!207 (_2!6233 lt!211438) (_2!6233 lt!211440) #b00000000000000000000000000000000 to!404) e!90475)))

(declare-fun b!136252 () Bool)

(declare-fun e!90476 () Bool)

(assert (=> b!136252 (= e!90475 e!90476)))

(declare-fun res!113376 () Bool)

(assert (=> b!136252 (=> (not res!113376) (not e!90476))))

(assert (=> b!136252 (= res!113376 (= (select (arr!3469 (_2!6233 lt!211438)) #b00000000000000000000000000000000) (select (arr!3469 (_2!6233 lt!211440)) #b00000000000000000000000000000000)))))

(declare-fun b!136253 () Bool)

(assert (=> b!136253 (= e!90476 (arrayRangesEq!207 (_2!6233 lt!211438) (_2!6233 lt!211440) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!43876 (not res!113375)) b!136252))

(assert (= (and b!136252 res!113376) b!136253))

(declare-fun m!208475 () Bool)

(assert (=> b!136252 m!208475))

(declare-fun m!208477 () Bool)

(assert (=> b!136252 m!208477))

(declare-fun m!208479 () Bool)

(assert (=> b!136253 m!208479))

(assert (=> d!43659 d!43876))

(declare-fun d!43878 () Bool)

(declare-fun lt!211905 () tuple2!11848)

(assert (=> d!43878 (= lt!211905 (readByte!0 (_1!6232 lt!211469)))))

(assert (=> d!43878 (= (readBytePure!0 (_1!6232 lt!211469)) (tuple2!11831 (_2!6243 lt!211905) (_1!6243 lt!211905)))))

(declare-fun bs!10694 () Bool)

(assert (= bs!10694 d!43878))

(declare-fun m!208481 () Bool)

(assert (=> bs!10694 m!208481))

(assert (=> b!136024 d!43878))

(declare-fun b!136254 () Bool)

(declare-fun e!90477 () Unit!8446)

(declare-fun lt!211915 () Unit!8446)

(assert (=> b!136254 (= e!90477 lt!211915)))

(declare-fun lt!211908 () (_ BitVec 64))

(assert (=> b!136254 (= lt!211908 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!211914 () (_ BitVec 64))

(assert (=> b!136254 (= lt!211914 (bitIndex!0 (size!2804 (buf!3197 thiss!1634)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634)))))

(assert (=> b!136254 (= lt!211915 (arrayBitRangesEqSymmetric!0 (buf!3197 thiss!1634) (buf!3197 (_2!6230 lt!211466)) lt!211908 lt!211914))))

(assert (=> b!136254 (arrayBitRangesEq!0 (buf!3197 (_2!6230 lt!211466)) (buf!3197 thiss!1634) lt!211908 lt!211914)))

(declare-fun b!136255 () Bool)

(declare-fun res!113378 () Bool)

(declare-fun e!90478 () Bool)

(assert (=> b!136255 (=> (not res!113378) (not e!90478))))

(declare-fun lt!211910 () tuple2!11832)

(assert (=> b!136255 (= res!113378 (isPrefixOf!0 (_2!6232 lt!211910) (_2!6230 lt!211466)))))

(declare-fun b!136256 () Bool)

(declare-fun res!113377 () Bool)

(assert (=> b!136256 (=> (not res!113377) (not e!90478))))

(assert (=> b!136256 (= res!113377 (isPrefixOf!0 (_1!6232 lt!211910) thiss!1634))))

(declare-fun b!136257 () Bool)

(declare-fun Unit!8505 () Unit!8446)

(assert (=> b!136257 (= e!90477 Unit!8505)))

(declare-fun d!43880 () Bool)

(assert (=> d!43880 e!90478))

(declare-fun res!113379 () Bool)

(assert (=> d!43880 (=> (not res!113379) (not e!90478))))

(assert (=> d!43880 (= res!113379 (isPrefixOf!0 (_1!6232 lt!211910) (_2!6232 lt!211910)))))

(declare-fun lt!211921 () BitStream!4872)

(assert (=> d!43880 (= lt!211910 (tuple2!11833 lt!211921 (_2!6230 lt!211466)))))

(declare-fun lt!211924 () Unit!8446)

(declare-fun lt!211925 () Unit!8446)

(assert (=> d!43880 (= lt!211924 lt!211925)))

(assert (=> d!43880 (isPrefixOf!0 lt!211921 (_2!6230 lt!211466))))

(assert (=> d!43880 (= lt!211925 (lemmaIsPrefixTransitive!0 lt!211921 (_2!6230 lt!211466) (_2!6230 lt!211466)))))

(declare-fun lt!211912 () Unit!8446)

(declare-fun lt!211917 () Unit!8446)

(assert (=> d!43880 (= lt!211912 lt!211917)))

(assert (=> d!43880 (isPrefixOf!0 lt!211921 (_2!6230 lt!211466))))

(assert (=> d!43880 (= lt!211917 (lemmaIsPrefixTransitive!0 lt!211921 thiss!1634 (_2!6230 lt!211466)))))

(declare-fun lt!211906 () Unit!8446)

(assert (=> d!43880 (= lt!211906 e!90477)))

(declare-fun c!7708 () Bool)

(assert (=> d!43880 (= c!7708 (not (= (size!2804 (buf!3197 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!211919 () Unit!8446)

(declare-fun lt!211907 () Unit!8446)

(assert (=> d!43880 (= lt!211919 lt!211907)))

(assert (=> d!43880 (isPrefixOf!0 (_2!6230 lt!211466) (_2!6230 lt!211466))))

(assert (=> d!43880 (= lt!211907 (lemmaIsPrefixRefl!0 (_2!6230 lt!211466)))))

(declare-fun lt!211920 () Unit!8446)

(declare-fun lt!211918 () Unit!8446)

(assert (=> d!43880 (= lt!211920 lt!211918)))

(assert (=> d!43880 (= lt!211918 (lemmaIsPrefixRefl!0 (_2!6230 lt!211466)))))

(declare-fun lt!211916 () Unit!8446)

(declare-fun lt!211923 () Unit!8446)

(assert (=> d!43880 (= lt!211916 lt!211923)))

(assert (=> d!43880 (isPrefixOf!0 lt!211921 lt!211921)))

(assert (=> d!43880 (= lt!211923 (lemmaIsPrefixRefl!0 lt!211921))))

(declare-fun lt!211913 () Unit!8446)

(declare-fun lt!211922 () Unit!8446)

(assert (=> d!43880 (= lt!211913 lt!211922)))

(assert (=> d!43880 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!43880 (= lt!211922 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!43880 (= lt!211921 (BitStream!4873 (buf!3197 (_2!6230 lt!211466)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634)))))

(assert (=> d!43880 (isPrefixOf!0 thiss!1634 (_2!6230 lt!211466))))

(assert (=> d!43880 (= (reader!0 thiss!1634 (_2!6230 lt!211466)) lt!211910)))

(declare-fun lt!211911 () (_ BitVec 64))

(declare-fun lt!211909 () (_ BitVec 64))

(declare-fun b!136258 () Bool)

(assert (=> b!136258 (= e!90478 (= (_1!6232 lt!211910) (withMovedBitIndex!0 (_2!6232 lt!211910) (bvsub lt!211909 lt!211911))))))

(assert (=> b!136258 (or (= (bvand lt!211909 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!211911 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!211909 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!211909 lt!211911) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!136258 (= lt!211911 (bitIndex!0 (size!2804 (buf!3197 (_2!6230 lt!211466))) (currentByte!5994 (_2!6230 lt!211466)) (currentBit!5989 (_2!6230 lt!211466))))))

(assert (=> b!136258 (= lt!211909 (bitIndex!0 (size!2804 (buf!3197 thiss!1634)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634)))))

(assert (= (and d!43880 c!7708) b!136254))

(assert (= (and d!43880 (not c!7708)) b!136257))

(assert (= (and d!43880 res!113379) b!136256))

(assert (= (and b!136256 res!113377) b!136255))

(assert (= (and b!136255 res!113378) b!136258))

(declare-fun m!208483 () Bool)

(assert (=> b!136255 m!208483))

(declare-fun m!208485 () Bool)

(assert (=> d!43880 m!208485))

(declare-fun m!208487 () Bool)

(assert (=> d!43880 m!208487))

(declare-fun m!208489 () Bool)

(assert (=> d!43880 m!208489))

(declare-fun m!208491 () Bool)

(assert (=> d!43880 m!208491))

(assert (=> d!43880 m!207835))

(declare-fun m!208493 () Bool)

(assert (=> d!43880 m!208493))

(declare-fun m!208495 () Bool)

(assert (=> d!43880 m!208495))

(declare-fun m!208497 () Bool)

(assert (=> d!43880 m!208497))

(assert (=> d!43880 m!207915))

(declare-fun m!208499 () Bool)

(assert (=> d!43880 m!208499))

(assert (=> d!43880 m!207843))

(assert (=> b!136254 m!207197))

(declare-fun m!208501 () Bool)

(assert (=> b!136254 m!208501))

(declare-fun m!208503 () Bool)

(assert (=> b!136254 m!208503))

(declare-fun m!208505 () Bool)

(assert (=> b!136258 m!208505))

(assert (=> b!136258 m!207913))

(assert (=> b!136258 m!207197))

(declare-fun m!208507 () Bool)

(assert (=> b!136256 m!208507))

(assert (=> b!136024 d!43880))

(assert (=> b!136004 d!43611))

(declare-fun d!43882 () Bool)

(assert (=> d!43882 (arrayBitRangesEq!0 (buf!3197 (_2!6230 lt!210693)) (buf!3197 thiss!1634) lt!211412 lt!211418)))

(declare-fun lt!211926 () Unit!8446)

(assert (=> d!43882 (= lt!211926 (choose!8 (buf!3197 thiss!1634) (buf!3197 (_2!6230 lt!210693)) lt!211412 lt!211418))))

(assert (=> d!43882 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!211412) (bvsle lt!211412 lt!211418))))

(assert (=> d!43882 (= (arrayBitRangesEqSymmetric!0 (buf!3197 thiss!1634) (buf!3197 (_2!6230 lt!210693)) lt!211412 lt!211418) lt!211926)))

(declare-fun bs!10695 () Bool)

(assert (= bs!10695 d!43882))

(assert (=> bs!10695 m!207881))

(declare-fun m!208509 () Bool)

(assert (=> bs!10695 m!208509))

(assert (=> b!136004 d!43882))

(declare-fun b!136259 () Bool)

(declare-fun res!113380 () Bool)

(declare-fun lt!211929 () (_ BitVec 32))

(assert (=> b!136259 (= res!113380 (= lt!211929 #b00000000000000000000000000000000))))

(declare-fun e!90481 () Bool)

(assert (=> b!136259 (=> res!113380 e!90481)))

(declare-fun e!90484 () Bool)

(assert (=> b!136259 (= e!90484 e!90481)))

(declare-fun lt!211928 () tuple4!118)

(declare-fun e!90483 () Bool)

(declare-fun b!136260 () Bool)

(assert (=> b!136260 (= e!90483 (arrayRangesEq!207 (buf!3197 (_2!6230 lt!210693)) (buf!3197 thiss!1634) (_1!6244 lt!211928) (_2!6244 lt!211928)))))

(declare-fun b!136261 () Bool)

(declare-fun call!1793 () Bool)

(assert (=> b!136261 (= e!90481 call!1793)))

(declare-fun d!43884 () Bool)

(declare-fun res!113383 () Bool)

(declare-fun e!90482 () Bool)

(assert (=> d!43884 (=> res!113383 e!90482)))

(assert (=> d!43884 (= res!113383 (bvsge lt!211412 lt!211418))))

(assert (=> d!43884 (= (arrayBitRangesEq!0 (buf!3197 (_2!6230 lt!210693)) (buf!3197 thiss!1634) lt!211412 lt!211418) e!90482)))

(declare-fun b!136262 () Bool)

(declare-fun e!90480 () Bool)

(assert (=> b!136262 (= e!90482 e!90480)))

(declare-fun res!113384 () Bool)

(assert (=> b!136262 (=> (not res!113384) (not e!90480))))

(assert (=> b!136262 (= res!113384 e!90483)))

(declare-fun res!113381 () Bool)

(assert (=> b!136262 (=> res!113381 e!90483)))

(assert (=> b!136262 (= res!113381 (bvsge (_1!6244 lt!211928) (_2!6244 lt!211928)))))

(assert (=> b!136262 (= lt!211929 ((_ extract 31 0) (bvsrem lt!211418 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!211927 () (_ BitVec 32))

(assert (=> b!136262 (= lt!211927 ((_ extract 31 0) (bvsrem lt!211412 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!136262 (= lt!211928 (arrayBitIndices!0 lt!211412 lt!211418))))

(declare-fun b!136263 () Bool)

(declare-fun e!90479 () Bool)

(assert (=> b!136263 (= e!90480 e!90479)))

(declare-fun c!7709 () Bool)

(assert (=> b!136263 (= c!7709 (= (_3!319 lt!211928) (_4!59 lt!211928)))))

(declare-fun b!136264 () Bool)

(assert (=> b!136264 (= e!90479 e!90484)))

(declare-fun res!113382 () Bool)

(assert (=> b!136264 (= res!113382 (byteRangesEq!0 (select (arr!3469 (buf!3197 (_2!6230 lt!210693))) (_3!319 lt!211928)) (select (arr!3469 (buf!3197 thiss!1634)) (_3!319 lt!211928)) lt!211927 #b00000000000000000000000000001000))))

(assert (=> b!136264 (=> (not res!113382) (not e!90484))))

(declare-fun bm!1790 () Bool)

(assert (=> bm!1790 (= call!1793 (byteRangesEq!0 (ite c!7709 (select (arr!3469 (buf!3197 (_2!6230 lt!210693))) (_3!319 lt!211928)) (select (arr!3469 (buf!3197 (_2!6230 lt!210693))) (_4!59 lt!211928))) (ite c!7709 (select (arr!3469 (buf!3197 thiss!1634)) (_3!319 lt!211928)) (select (arr!3469 (buf!3197 thiss!1634)) (_4!59 lt!211928))) (ite c!7709 lt!211927 #b00000000000000000000000000000000) lt!211929))))

(declare-fun b!136265 () Bool)

(assert (=> b!136265 (= e!90479 call!1793)))

(assert (= (and d!43884 (not res!113383)) b!136262))

(assert (= (and b!136262 (not res!113381)) b!136260))

(assert (= (and b!136262 res!113384) b!136263))

(assert (= (and b!136263 c!7709) b!136265))

(assert (= (and b!136263 (not c!7709)) b!136264))

(assert (= (and b!136264 res!113382) b!136259))

(assert (= (and b!136259 (not res!113380)) b!136261))

(assert (= (or b!136265 b!136261) bm!1790))

(declare-fun m!208511 () Bool)

(assert (=> b!136260 m!208511))

(declare-fun m!208513 () Bool)

(assert (=> b!136262 m!208513))

(declare-fun m!208515 () Bool)

(assert (=> b!136264 m!208515))

(declare-fun m!208517 () Bool)

(assert (=> b!136264 m!208517))

(assert (=> b!136264 m!208515))

(assert (=> b!136264 m!208517))

(declare-fun m!208519 () Bool)

(assert (=> b!136264 m!208519))

(declare-fun m!208521 () Bool)

(assert (=> bm!1790 m!208521))

(declare-fun m!208523 () Bool)

(assert (=> bm!1790 m!208523))

(assert (=> bm!1790 m!208515))

(declare-fun m!208525 () Bool)

(assert (=> bm!1790 m!208525))

(assert (=> bm!1790 m!208517))

(assert (=> b!136004 d!43884))

(declare-fun d!43886 () Bool)

(assert (=> d!43886 (= (remainingBits!0 ((_ sign_extend 32) (size!2804 (buf!3197 (_1!6231 lt!210697)))) ((_ sign_extend 32) (currentByte!5994 (_1!6231 lt!210697))) ((_ sign_extend 32) (currentBit!5989 (_1!6231 lt!210697)))) (bvsub (bvmul ((_ sign_extend 32) (size!2804 (buf!3197 (_1!6231 lt!210697)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5994 (_1!6231 lt!210697))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5989 (_1!6231 lt!210697))))))))

(assert (=> d!43683 d!43886))

(declare-fun d!43888 () Bool)

(assert (=> d!43888 (= (invariant!0 (currentBit!5989 (_1!6231 lt!210697)) (currentByte!5994 (_1!6231 lt!210697)) (size!2804 (buf!3197 (_1!6231 lt!210697)))) (and (bvsge (currentBit!5989 (_1!6231 lt!210697)) #b00000000000000000000000000000000) (bvslt (currentBit!5989 (_1!6231 lt!210697)) #b00000000000000000000000000001000) (bvsge (currentByte!5994 (_1!6231 lt!210697)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5994 (_1!6231 lt!210697)) (size!2804 (buf!3197 (_1!6231 lt!210697)))) (and (= (currentBit!5989 (_1!6231 lt!210697)) #b00000000000000000000000000000000) (= (currentByte!5994 (_1!6231 lt!210697)) (size!2804 (buf!3197 (_1!6231 lt!210697))))))))))

(assert (=> d!43683 d!43888))

(declare-fun b!136274 () Bool)

(declare-fun e!90493 () Bool)

(declare-fun _$37!23 () tuple2!11828)

(assert (=> b!136274 (= e!90493 (array_inv!2593 (buf!3197 (_2!6230 _$37!23))))))

(declare-fun b!136275 () Bool)

(declare-fun res!113392 () Bool)

(declare-fun e!90492 () Bool)

(assert (=> b!136275 (=> (not res!113392) (not e!90492))))

(assert (=> b!136275 (= res!113392 (= (bitIndex!0 (size!2804 (buf!3197 (_2!6230 _$37!23))) (currentByte!5994 (_2!6230 _$37!23)) (currentBit!5989 (_2!6230 _$37!23))) (bvadd (bitIndex!0 (size!2804 (buf!3197 thiss!1634)) (currentByte!5994 thiss!1634) (currentBit!5989 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!136276 () Bool)

(declare-fun res!113391 () Bool)

(assert (=> b!136276 (=> (not res!113391) (not e!90492))))

(assert (=> b!136276 (= res!113391 (isPrefixOf!0 thiss!1634 (_2!6230 _$37!23)))))

(declare-fun d!43890 () Bool)

(assert (=> d!43890 e!90492))

(declare-fun res!113393 () Bool)

(assert (=> d!43890 (=> (not res!113393) (not e!90492))))

(assert (=> d!43890 (= res!113393 (= (size!2804 (buf!3197 thiss!1634)) (size!2804 (buf!3197 (_2!6230 _$37!23)))))))

(assert (=> d!43890 (and (inv!12 (_2!6230 _$37!23)) e!90493)))

(assert (=> d!43890 (= (choose!6 thiss!1634 (select (arr!3469 arr!237) from!447)) _$37!23)))

(declare-fun lt!211934 () tuple2!11830)

(declare-fun b!136277 () Bool)

(declare-fun lt!211935 () tuple2!11832)

(assert (=> b!136277 (= e!90492 (and (= (_2!6231 lt!211934) (select (arr!3469 arr!237) from!447)) (= (_1!6231 lt!211934) (_2!6232 lt!211935))))))

(assert (=> b!136277 (= lt!211934 (readBytePure!0 (_1!6232 lt!211935)))))

(assert (=> b!136277 (= lt!211935 (reader!0 thiss!1634 (_2!6230 _$37!23)))))

(assert (= d!43890 b!136274))

(assert (= (and d!43890 res!113393) b!136275))

(assert (= (and b!136275 res!113392) b!136276))

(assert (= (and b!136276 res!113391) b!136277))

(declare-fun m!208527 () Bool)

(assert (=> d!43890 m!208527))

(declare-fun m!208529 () Bool)

(assert (=> b!136277 m!208529))

(declare-fun m!208531 () Bool)

(assert (=> b!136277 m!208531))

(declare-fun m!208533 () Bool)

(assert (=> b!136275 m!208533))

(assert (=> b!136275 m!207197))

(declare-fun m!208535 () Bool)

(assert (=> b!136276 m!208535))

(declare-fun m!208537 () Bool)

(assert (=> b!136274 m!208537))

(assert (=> d!43671 d!43890))

(declare-fun d!43892 () Bool)

(assert (=> d!43892 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!2804 (buf!3197 thiss!1634))) ((_ sign_extend 32) (currentByte!5994 thiss!1634)) ((_ sign_extend 32) (currentBit!5989 thiss!1634))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2804 (buf!3197 thiss!1634))) ((_ sign_extend 32) (currentByte!5994 thiss!1634)) ((_ sign_extend 32) (currentBit!5989 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!10696 () Bool)

(assert (= bs!10696 d!43892))

(assert (=> bs!10696 m!207771))

(assert (=> d!43671 d!43892))

(declare-fun d!43894 () Bool)

(assert (=> d!43894 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!210687)))) ((_ sign_extend 32) (currentByte!5994 (_2!6230 lt!210687))) ((_ sign_extend 32) (currentBit!5989 (_2!6230 lt!210687))) (bvsub (bvsub to!404 from!447) lt!211524)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) lt!211524)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2804 (buf!3197 (_2!6230 lt!210687)))) ((_ sign_extend 32) (currentByte!5994 (_2!6230 lt!210687))) ((_ sign_extend 32) (currentBit!5989 (_2!6230 lt!210687)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10697 () Bool)

(assert (= bs!10697 d!43894))

(assert (=> bs!10697 m!207767))

(assert (=> b!136049 d!43894))

(check-sat (not bm!1786) (not b!136176) (not d!43728) (not d!43880) (not d!43754) (not b!136191) (not b!136086) (not b!136224) (not d!43850) (not b!136121) (not b!136139) (not b!136260) (not b!136149) (not b!136083) (not b!136226) (not b!136211) (not b!136277) (not b!136229) (not b!136133) (not d!43834) (not d!43868) (not b!136220) (not d!43892) (not b!136208) (not d!43862) (not bm!1778) (not d!43858) (not d!43748) (not b!136276) (not bm!1767) (not d!43866) (not bm!1777) (not d!43702) (not d!43762) (not b!136223) (not d!43874) (not bm!1768) (not bm!1788) (not d!43776) (not bm!1784) (not bm!1781) (not d!43778) (not b!136145) (not b!136147) (not b!136154) (not d!43808) (not b!136071) (not b!136088) (not b!136082) (not d!43750) (not d!43772) (not b!136227) (not d!43864) (not b!136115) (not b!136203) (not d!43840) (not d!43794) (not b!136085) (not d!43872) (not bm!1785) (not b!136199) (not d!43712) (not b!136167) (not b!136165) (not b!136240) (not bm!1782) (not d!43782) (not bm!1789) (not d!43878) (not d!43890) (not b!136244) (not d!43730) (not b!136212) (not b!136193) (not d!43818) (not b!136253) (not b!136094) (not b!136221) (not b!136217) (not b!136131) (not d!43724) (not b!136099) (not bm!1790) (not d!43836) (not b!136214) (not d!43756) (not b!136089) (not b!136274) (not d!43720) (not bm!1769) (not b!136247) (not bm!1776) (not b!136180) (not b!136197) (not b!136140) (not b!136207) (not b!136095) (not b!136242) (not b!136256) (not b!136181) (not b!136258) (not d!43838) (not b!136168) (not bm!1780) (not d!43832) (not b!136079) (not b!136137) (not d!43738) (not b!136174) (not b!136092) (not b!136189) (not b!136103) (not b!136069) (not b!136097) (not b!136185) (not d!43860) (not d!43870) (not b!136187) (not b!136073) (not d!43758) (not b!136152) (not d!43710) (not b!136215) (not b!136210) (not b!136205) (not b!136177) (not d!43830) (not b!136241) (not b!136142) (not d!43814) (not b!136134) (not b!136213) (not b!136110) (not d!43742) (not d!43708) (not b!136112) (not d!43722) (not d!43798) (not d!43882) (not b!136178) (not b!136108) (not b!136218) (not b!136183) (not b!136264) (not b!136254) (not b!136080) (not b!136255) (not bm!1787) (not b!136173) (not b!136151) (not b!136130) (not b!136091) (not b!136119) (not b!136243) (not b!136065) (not bm!1783) (not d!43826) (not bm!1779) (not b!136275) (not b!136171) (not d!43856) (not d!43760) (not d!43800) (not d!43894) (not b!136136) (not b!136101) (not b!136169) (not b!136206) (not b!136262) (not b!136143) (not b!136067) (not b!136201) (not d!43812))
(check-sat)
