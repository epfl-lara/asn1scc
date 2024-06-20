; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28012 () Bool)

(assert start!28012)

(declare-fun res!121269 () Bool)

(declare-fun e!96707 () Bool)

(assert (=> start!28012 (=> (not res!121269) (not e!96707))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6604 0))(
  ( (array!6605 (arr!3723 (Array (_ BitVec 32) (_ BitVec 8))) (size!2990 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6604)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!28012 (= res!121269 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2990 arr!237))))))

(assert (=> start!28012 e!96707))

(assert (=> start!28012 true))

(declare-fun array_inv!2779 (array!6604) Bool)

(assert (=> start!28012 (array_inv!2779 arr!237)))

(declare-datatypes ((BitStream!5238 0))(
  ( (BitStream!5239 (buf!3429 array!6604) (currentByte!6319 (_ BitVec 32)) (currentBit!6314 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5238)

(declare-fun e!96706 () Bool)

(declare-fun inv!12 (BitStream!5238) Bool)

(assert (=> start!28012 (and (inv!12 thiss!1634) e!96706)))

(declare-fun b!145070 () Bool)

(assert (=> b!145070 (= e!96707 (not (bvslt from!447 (size!2990 arr!237))))))

(declare-datatypes ((Unit!9053 0))(
  ( (Unit!9054) )
))
(declare-datatypes ((tuple2!12962 0))(
  ( (tuple2!12963 (_1!6827 Unit!9053) (_2!6827 BitStream!5238)) )
))
(declare-fun lt!224785 () tuple2!12962)

(declare-fun lt!224788 () tuple2!12962)

(declare-fun lt!224772 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!145070 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2990 (buf!3429 (_2!6827 lt!224785)))) ((_ sign_extend 32) (currentByte!6319 (_2!6827 lt!224788))) ((_ sign_extend 32) (currentBit!6314 (_2!6827 lt!224788))) lt!224772)))

(declare-fun lt!224774 () Unit!9053)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5238 array!6604 (_ BitVec 32)) Unit!9053)

(assert (=> b!145070 (= lt!224774 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6827 lt!224788) (buf!3429 (_2!6827 lt!224785)) lt!224772))))

(declare-fun e!96708 () Bool)

(assert (=> b!145070 e!96708))

(declare-fun res!121271 () Bool)

(assert (=> b!145070 (=> (not res!121271) (not e!96708))))

(assert (=> b!145070 (= res!121271 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2990 (buf!3429 (_2!6827 lt!224785)))) ((_ sign_extend 32) (currentByte!6319 thiss!1634)) ((_ sign_extend 32) (currentBit!6314 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!224787 () Unit!9053)

(assert (=> b!145070 (= lt!224787 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3429 (_2!6827 lt!224785)) (bvsub to!404 from!447)))))

(declare-datatypes ((tuple2!12964 0))(
  ( (tuple2!12965 (_1!6828 BitStream!5238) (_2!6828 BitStream!5238)) )
))
(declare-fun lt!224790 () tuple2!12964)

(declare-datatypes ((tuple2!12966 0))(
  ( (tuple2!12967 (_1!6829 BitStream!5238) (_2!6829 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5238) tuple2!12966)

(assert (=> b!145070 (= (_2!6829 (readBytePure!0 (_1!6828 lt!224790))) (select (arr!3723 arr!237) from!447))))

(declare-fun lt!224784 () tuple2!12964)

(declare-fun reader!0 (BitStream!5238 BitStream!5238) tuple2!12964)

(assert (=> b!145070 (= lt!224784 (reader!0 (_2!6827 lt!224788) (_2!6827 lt!224785)))))

(assert (=> b!145070 (= lt!224790 (reader!0 thiss!1634 (_2!6827 lt!224785)))))

(declare-fun e!96705 () Bool)

(assert (=> b!145070 e!96705))

(declare-fun res!121282 () Bool)

(assert (=> b!145070 (=> (not res!121282) (not e!96705))))

(declare-fun lt!224777 () tuple2!12966)

(declare-fun lt!224781 () tuple2!12966)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!145070 (= res!121282 (= (bitIndex!0 (size!2990 (buf!3429 (_1!6829 lt!224777))) (currentByte!6319 (_1!6829 lt!224777)) (currentBit!6314 (_1!6829 lt!224777))) (bitIndex!0 (size!2990 (buf!3429 (_1!6829 lt!224781))) (currentByte!6319 (_1!6829 lt!224781)) (currentBit!6314 (_1!6829 lt!224781)))))))

(declare-fun lt!224780 () Unit!9053)

(declare-fun lt!224778 () BitStream!5238)

(declare-fun readBytePrefixLemma!0 (BitStream!5238 BitStream!5238) Unit!9053)

(assert (=> b!145070 (= lt!224780 (readBytePrefixLemma!0 lt!224778 (_2!6827 lt!224785)))))

(assert (=> b!145070 (= lt!224781 (readBytePure!0 (BitStream!5239 (buf!3429 (_2!6827 lt!224785)) (currentByte!6319 thiss!1634) (currentBit!6314 thiss!1634))))))

(assert (=> b!145070 (= lt!224777 (readBytePure!0 lt!224778))))

(assert (=> b!145070 (= lt!224778 (BitStream!5239 (buf!3429 (_2!6827 lt!224788)) (currentByte!6319 thiss!1634) (currentBit!6314 thiss!1634)))))

(declare-fun e!96704 () Bool)

(assert (=> b!145070 e!96704))

(declare-fun res!121275 () Bool)

(assert (=> b!145070 (=> (not res!121275) (not e!96704))))

(declare-fun isPrefixOf!0 (BitStream!5238 BitStream!5238) Bool)

(assert (=> b!145070 (= res!121275 (isPrefixOf!0 thiss!1634 (_2!6827 lt!224785)))))

(declare-fun lt!224773 () Unit!9053)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5238 BitStream!5238 BitStream!5238) Unit!9053)

(assert (=> b!145070 (= lt!224773 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6827 lt!224788) (_2!6827 lt!224785)))))

(declare-fun e!96701 () Bool)

(assert (=> b!145070 e!96701))

(declare-fun res!121270 () Bool)

(assert (=> b!145070 (=> (not res!121270) (not e!96701))))

(assert (=> b!145070 (= res!121270 (= (size!2990 (buf!3429 (_2!6827 lt!224788))) (size!2990 (buf!3429 (_2!6827 lt!224785)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5238 array!6604 (_ BitVec 32) (_ BitVec 32)) tuple2!12962)

(assert (=> b!145070 (= lt!224785 (appendByteArrayLoop!0 (_2!6827 lt!224788) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!145070 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2990 (buf!3429 (_2!6827 lt!224788)))) ((_ sign_extend 32) (currentByte!6319 (_2!6827 lt!224788))) ((_ sign_extend 32) (currentBit!6314 (_2!6827 lt!224788))) lt!224772)))

(assert (=> b!145070 (= lt!224772 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!224783 () Unit!9053)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5238 BitStream!5238 (_ BitVec 64) (_ BitVec 32)) Unit!9053)

(assert (=> b!145070 (= lt!224783 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6827 lt!224788) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!96711 () Bool)

(assert (=> b!145070 e!96711))

(declare-fun res!121281 () Bool)

(assert (=> b!145070 (=> (not res!121281) (not e!96711))))

(assert (=> b!145070 (= res!121281 (= (size!2990 (buf!3429 thiss!1634)) (size!2990 (buf!3429 (_2!6827 lt!224788)))))))

(declare-fun appendByte!0 (BitStream!5238 (_ BitVec 8)) tuple2!12962)

(assert (=> b!145070 (= lt!224788 (appendByte!0 thiss!1634 (select (arr!3723 arr!237) from!447)))))

(declare-fun b!145071 () Bool)

(assert (=> b!145071 (= e!96706 (array_inv!2779 (buf!3429 thiss!1634)))))

(declare-fun b!145072 () Bool)

(declare-fun res!121278 () Bool)

(assert (=> b!145072 (=> (not res!121278) (not e!96707))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!145072 (= res!121278 (invariant!0 (currentBit!6314 thiss!1634) (currentByte!6319 thiss!1634) (size!2990 (buf!3429 thiss!1634))))))

(declare-fun b!145073 () Bool)

(declare-fun res!121279 () Bool)

(assert (=> b!145073 (=> (not res!121279) (not e!96707))))

(assert (=> b!145073 (= res!121279 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2990 (buf!3429 thiss!1634))) ((_ sign_extend 32) (currentByte!6319 thiss!1634)) ((_ sign_extend 32) (currentBit!6314 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!145074 () Bool)

(declare-fun res!121273 () Bool)

(declare-fun e!96702 () Bool)

(assert (=> b!145074 (=> (not res!121273) (not e!96702))))

(assert (=> b!145074 (= res!121273 (isPrefixOf!0 (_2!6827 lt!224788) (_2!6827 lt!224785)))))

(declare-fun b!145075 () Bool)

(declare-fun res!121274 () Bool)

(assert (=> b!145075 (=> (not res!121274) (not e!96707))))

(assert (=> b!145075 (= res!121274 (bvslt from!447 to!404))))

(declare-fun b!145076 () Bool)

(assert (=> b!145076 (= e!96705 (= (_2!6829 lt!224777) (_2!6829 lt!224781)))))

(declare-fun b!145077 () Bool)

(assert (=> b!145077 (= e!96701 e!96702)))

(declare-fun res!121272 () Bool)

(assert (=> b!145077 (=> (not res!121272) (not e!96702))))

(declare-fun lt!224775 () (_ BitVec 64))

(assert (=> b!145077 (= res!121272 (= (bitIndex!0 (size!2990 (buf!3429 (_2!6827 lt!224785))) (currentByte!6319 (_2!6827 lt!224785)) (currentBit!6314 (_2!6827 lt!224785))) (bvadd (bitIndex!0 (size!2990 (buf!3429 (_2!6827 lt!224788))) (currentByte!6319 (_2!6827 lt!224788)) (currentBit!6314 (_2!6827 lt!224788))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!224775))))))

(assert (=> b!145077 (= lt!224775 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!145078 () Bool)

(declare-fun e!96703 () Bool)

(assert (=> b!145078 (= e!96702 (not e!96703))))

(declare-fun res!121276 () Bool)

(assert (=> b!145078 (=> res!121276 e!96703)))

(declare-fun lt!224789 () tuple2!12964)

(declare-datatypes ((tuple2!12968 0))(
  ( (tuple2!12969 (_1!6830 BitStream!5238) (_2!6830 array!6604)) )
))
(declare-fun lt!224782 () tuple2!12968)

(assert (=> b!145078 (= res!121276 (or (not (= (size!2990 (_2!6830 lt!224782)) (size!2990 arr!237))) (not (= (_1!6830 lt!224782) (_2!6828 lt!224789)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5238 array!6604 (_ BitVec 32) (_ BitVec 32)) tuple2!12968)

(assert (=> b!145078 (= lt!224782 (readByteArrayLoopPure!0 (_1!6828 lt!224789) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!145078 (validate_offset_bits!1 ((_ sign_extend 32) (size!2990 (buf!3429 (_2!6827 lt!224785)))) ((_ sign_extend 32) (currentByte!6319 (_2!6827 lt!224788))) ((_ sign_extend 32) (currentBit!6314 (_2!6827 lt!224788))) lt!224775)))

(declare-fun lt!224779 () Unit!9053)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5238 array!6604 (_ BitVec 64)) Unit!9053)

(assert (=> b!145078 (= lt!224779 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6827 lt!224788) (buf!3429 (_2!6827 lt!224785)) lt!224775))))

(assert (=> b!145078 (= lt!224789 (reader!0 (_2!6827 lt!224788) (_2!6827 lt!224785)))))

(declare-fun b!145079 () Bool)

(declare-fun res!121277 () Bool)

(assert (=> b!145079 (=> (not res!121277) (not e!96711))))

(assert (=> b!145079 (= res!121277 (= (bitIndex!0 (size!2990 (buf!3429 (_2!6827 lt!224788))) (currentByte!6319 (_2!6827 lt!224788)) (currentBit!6314 (_2!6827 lt!224788))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2990 (buf!3429 thiss!1634)) (currentByte!6319 thiss!1634) (currentBit!6314 thiss!1634)))))))

(declare-fun b!145080 () Bool)

(declare-fun res!121280 () Bool)

(assert (=> b!145080 (=> (not res!121280) (not e!96711))))

(assert (=> b!145080 (= res!121280 (isPrefixOf!0 thiss!1634 (_2!6827 lt!224788)))))

(declare-fun lt!224786 () tuple2!12966)

(declare-fun b!145081 () Bool)

(declare-fun lt!224776 () tuple2!12964)

(assert (=> b!145081 (= e!96711 (and (= (_2!6829 lt!224786) (select (arr!3723 arr!237) from!447)) (= (_1!6829 lt!224786) (_2!6828 lt!224776))))))

(assert (=> b!145081 (= lt!224786 (readBytePure!0 (_1!6828 lt!224776)))))

(assert (=> b!145081 (= lt!224776 (reader!0 thiss!1634 (_2!6827 lt!224788)))))

(declare-fun b!145082 () Bool)

(assert (=> b!145082 (= e!96704 (invariant!0 (currentBit!6314 thiss!1634) (currentByte!6319 thiss!1634) (size!2990 (buf!3429 (_2!6827 lt!224788)))))))

(declare-fun b!145083 () Bool)

(assert (=> b!145083 (= e!96708 (= (_1!6830 (readByteArrayLoopPure!0 (_1!6828 lt!224790) arr!237 from!447 to!404)) (_2!6828 lt!224790)))))

(declare-fun b!145084 () Bool)

(declare-fun arrayRangesEq!306 (array!6604 array!6604 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!145084 (= e!96703 (not (arrayRangesEq!306 arr!237 (_2!6830 lt!224782) #b00000000000000000000000000000000 to!404)))))

(assert (= (and start!28012 res!121269) b!145073))

(assert (= (and b!145073 res!121279) b!145075))

(assert (= (and b!145075 res!121274) b!145072))

(assert (= (and b!145072 res!121278) b!145070))

(assert (= (and b!145070 res!121281) b!145079))

(assert (= (and b!145079 res!121277) b!145080))

(assert (= (and b!145080 res!121280) b!145081))

(assert (= (and b!145070 res!121270) b!145077))

(assert (= (and b!145077 res!121272) b!145074))

(assert (= (and b!145074 res!121273) b!145078))

(assert (= (and b!145078 (not res!121276)) b!145084))

(assert (= (and b!145070 res!121275) b!145082))

(assert (= (and b!145070 res!121282) b!145076))

(assert (= (and b!145070 res!121271) b!145083))

(assert (= start!28012 b!145071))

(declare-fun m!223135 () Bool)

(assert (=> b!145070 m!223135))

(declare-fun m!223137 () Bool)

(assert (=> b!145070 m!223137))

(declare-fun m!223139 () Bool)

(assert (=> b!145070 m!223139))

(declare-fun m!223141 () Bool)

(assert (=> b!145070 m!223141))

(declare-fun m!223143 () Bool)

(assert (=> b!145070 m!223143))

(declare-fun m!223145 () Bool)

(assert (=> b!145070 m!223145))

(declare-fun m!223147 () Bool)

(assert (=> b!145070 m!223147))

(declare-fun m!223149 () Bool)

(assert (=> b!145070 m!223149))

(declare-fun m!223151 () Bool)

(assert (=> b!145070 m!223151))

(declare-fun m!223153 () Bool)

(assert (=> b!145070 m!223153))

(declare-fun m!223155 () Bool)

(assert (=> b!145070 m!223155))

(declare-fun m!223157 () Bool)

(assert (=> b!145070 m!223157))

(declare-fun m!223159 () Bool)

(assert (=> b!145070 m!223159))

(declare-fun m!223161 () Bool)

(assert (=> b!145070 m!223161))

(declare-fun m!223163 () Bool)

(assert (=> b!145070 m!223163))

(declare-fun m!223165 () Bool)

(assert (=> b!145070 m!223165))

(declare-fun m!223167 () Bool)

(assert (=> b!145070 m!223167))

(declare-fun m!223169 () Bool)

(assert (=> b!145070 m!223169))

(declare-fun m!223171 () Bool)

(assert (=> b!145070 m!223171))

(assert (=> b!145070 m!223165))

(declare-fun m!223173 () Bool)

(assert (=> b!145083 m!223173))

(declare-fun m!223175 () Bool)

(assert (=> b!145082 m!223175))

(declare-fun m!223177 () Bool)

(assert (=> b!145071 m!223177))

(declare-fun m!223179 () Bool)

(assert (=> b!145074 m!223179))

(declare-fun m!223181 () Bool)

(assert (=> b!145077 m!223181))

(declare-fun m!223183 () Bool)

(assert (=> b!145077 m!223183))

(declare-fun m!223185 () Bool)

(assert (=> start!28012 m!223185))

(declare-fun m!223187 () Bool)

(assert (=> start!28012 m!223187))

(declare-fun m!223189 () Bool)

(assert (=> b!145078 m!223189))

(declare-fun m!223191 () Bool)

(assert (=> b!145078 m!223191))

(declare-fun m!223193 () Bool)

(assert (=> b!145078 m!223193))

(assert (=> b!145078 m!223153))

(assert (=> b!145081 m!223165))

(declare-fun m!223195 () Bool)

(assert (=> b!145081 m!223195))

(declare-fun m!223197 () Bool)

(assert (=> b!145081 m!223197))

(declare-fun m!223199 () Bool)

(assert (=> b!145084 m!223199))

(declare-fun m!223201 () Bool)

(assert (=> b!145072 m!223201))

(assert (=> b!145079 m!223183))

(declare-fun m!223203 () Bool)

(assert (=> b!145079 m!223203))

(declare-fun m!223205 () Bool)

(assert (=> b!145080 m!223205))

(declare-fun m!223207 () Bool)

(assert (=> b!145073 m!223207))

(check-sat (not b!145080) (not b!145073) (not b!145078) (not b!145077) (not b!145074) (not b!145071) (not start!28012) (not b!145072) (not b!145070) (not b!145081) (not b!145084) (not b!145083) (not b!145082) (not b!145079))
(check-sat)
