; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26394 () Bool)

(assert start!26394)

(declare-fun res!112930 () Bool)

(declare-fun e!90137 () Bool)

(assert (=> start!26394 (=> (not res!112930) (not e!90137))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6194 0))(
  ( (array!6195 (arr!3470 (Array (_ BitVec 32) (_ BitVec 8))) (size!2805 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6194)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!26394 (= res!112930 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2805 arr!237))))))

(assert (=> start!26394 e!90137))

(assert (=> start!26394 true))

(declare-fun array_inv!2594 (array!6194) Bool)

(assert (=> start!26394 (array_inv!2594 arr!237)))

(declare-datatypes ((BitStream!4874 0))(
  ( (BitStream!4875 (buf!3198 array!6194) (currentByte!5995 (_ BitVec 32)) (currentBit!5990 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4874)

(declare-fun e!90143 () Bool)

(declare-fun inv!12 (BitStream!4874) Bool)

(assert (=> start!26394 (and (inv!12 thiss!1634) e!90143)))

(declare-fun b!135741 () Bool)

(assert (=> b!135741 (= e!90143 (array_inv!2594 (buf!3198 thiss!1634)))))

(declare-fun b!135742 () Bool)

(declare-fun res!112927 () Bool)

(assert (=> b!135742 (=> (not res!112927) (not e!90137))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!135742 (= res!112927 (invariant!0 (currentBit!5990 thiss!1634) (currentByte!5995 thiss!1634) (size!2805 (buf!3198 thiss!1634))))))

(declare-fun b!135743 () Bool)

(declare-fun e!90141 () Bool)

(declare-datatypes ((Unit!8448 0))(
  ( (Unit!8449) )
))
(declare-datatypes ((tuple2!11836 0))(
  ( (tuple2!11837 (_1!6234 Unit!8448) (_2!6234 BitStream!4874)) )
))
(declare-fun lt!210768 () tuple2!11836)

(assert (=> b!135743 (= e!90141 (invariant!0 (currentBit!5990 thiss!1634) (currentByte!5995 thiss!1634) (size!2805 (buf!3198 (_2!6234 lt!210768)))))))

(declare-fun b!135744 () Bool)

(declare-fun res!112937 () Bool)

(declare-fun e!90144 () Bool)

(assert (=> b!135744 (=> (not res!112937) (not e!90144))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!135744 (= res!112937 (= (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!210768))) (currentByte!5995 (_2!6234 lt!210768)) (currentBit!5990 (_2!6234 lt!210768))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2805 (buf!3198 thiss!1634)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634)))))))

(declare-fun b!135745 () Bool)

(declare-fun res!112929 () Bool)

(declare-fun e!90142 () Bool)

(assert (=> b!135745 (=> (not res!112929) (not e!90142))))

(declare-fun lt!210775 () tuple2!11836)

(declare-fun isPrefixOf!0 (BitStream!4874 BitStream!4874) Bool)

(assert (=> b!135745 (= res!112929 (isPrefixOf!0 (_2!6234 lt!210768) (_2!6234 lt!210775)))))

(declare-fun b!135746 () Bool)

(declare-fun res!112932 () Bool)

(assert (=> b!135746 (=> (not res!112932) (not e!90137))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!135746 (= res!112932 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2805 (buf!3198 thiss!1634))) ((_ sign_extend 32) (currentByte!5995 thiss!1634)) ((_ sign_extend 32) (currentBit!5990 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!135747 () Bool)

(declare-fun e!90134 () Bool)

(declare-datatypes ((tuple2!11838 0))(
  ( (tuple2!11839 (_1!6235 BitStream!4874) (_2!6235 (_ BitVec 8))) )
))
(declare-fun lt!210777 () tuple2!11838)

(declare-fun lt!210772 () tuple2!11838)

(assert (=> b!135747 (= e!90134 (= (_2!6235 lt!210777) (_2!6235 lt!210772)))))

(declare-fun b!135748 () Bool)

(declare-fun res!112925 () Bool)

(assert (=> b!135748 (=> (not res!112925) (not e!90144))))

(assert (=> b!135748 (= res!112925 (isPrefixOf!0 thiss!1634 (_2!6234 lt!210768)))))

(declare-fun b!135749 () Bool)

(declare-fun e!90138 () Bool)

(assert (=> b!135749 (= e!90138 e!90142)))

(declare-fun res!112934 () Bool)

(assert (=> b!135749 (=> (not res!112934) (not e!90142))))

(declare-fun lt!210778 () (_ BitVec 64))

(assert (=> b!135749 (= res!112934 (= (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!210775))) (currentByte!5995 (_2!6234 lt!210775)) (currentBit!5990 (_2!6234 lt!210775))) (bvadd (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!210768))) (currentByte!5995 (_2!6234 lt!210768)) (currentBit!5990 (_2!6234 lt!210768))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!210778))))))

(assert (=> b!135749 (= lt!210778 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!135750 () Bool)

(declare-fun e!90140 () Bool)

(declare-datatypes ((tuple2!11840 0))(
  ( (tuple2!11841 (_1!6236 BitStream!4874) (_2!6236 array!6194)) )
))
(declare-fun lt!210791 () tuple2!11840)

(assert (=> b!135750 (= e!90140 (or (bvsgt #b00000000000000000000000000000000 to!404) (bvsle (size!2805 arr!237) (size!2805 (_2!6236 lt!210791)))))))

(declare-fun arrayRangesEq!208 (array!6194 array!6194 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!135750 (arrayRangesEq!208 arr!237 (_2!6236 lt!210791) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!210779 () Unit!8448)

(declare-fun lt!210780 () tuple2!11840)

(declare-fun arrayRangesEqTransitive!10 (array!6194 array!6194 array!6194 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8448)

(assert (=> b!135750 (= lt!210779 (arrayRangesEqTransitive!10 arr!237 (_2!6236 lt!210780) (_2!6236 lt!210791) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!135750 (arrayRangesEq!208 (_2!6236 lt!210780) (_2!6236 lt!210791) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!210783 () Unit!8448)

(declare-fun arrayRangesEqSymmetricLemma!21 (array!6194 array!6194 (_ BitVec 32) (_ BitVec 32)) Unit!8448)

(assert (=> b!135750 (= lt!210783 (arrayRangesEqSymmetricLemma!21 (_2!6236 lt!210791) (_2!6236 lt!210780) #b00000000000000000000000000000000 to!404))))

(declare-fun e!90139 () Bool)

(declare-fun lt!210789 () tuple2!11840)

(declare-fun b!135751 () Bool)

(assert (=> b!135751 (= e!90139 (not (arrayRangesEq!208 arr!237 (_2!6236 lt!210789) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!135752 () Bool)

(assert (=> b!135752 (= e!90142 (not e!90139))))

(declare-fun res!112928 () Bool)

(assert (=> b!135752 (=> res!112928 e!90139)))

(declare-datatypes ((tuple2!11842 0))(
  ( (tuple2!11843 (_1!6237 BitStream!4874) (_2!6237 BitStream!4874)) )
))
(declare-fun lt!210793 () tuple2!11842)

(assert (=> b!135752 (= res!112928 (or (not (= (size!2805 (_2!6236 lt!210789)) (size!2805 arr!237))) (not (= (_1!6236 lt!210789) (_2!6237 lt!210793)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4874 array!6194 (_ BitVec 32) (_ BitVec 32)) tuple2!11840)

(assert (=> b!135752 (= lt!210789 (readByteArrayLoopPure!0 (_1!6237 lt!210793) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!135752 (validate_offset_bits!1 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!210775)))) ((_ sign_extend 32) (currentByte!5995 (_2!6234 lt!210768))) ((_ sign_extend 32) (currentBit!5990 (_2!6234 lt!210768))) lt!210778)))

(declare-fun lt!210773 () Unit!8448)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4874 array!6194 (_ BitVec 64)) Unit!8448)

(assert (=> b!135752 (= lt!210773 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6234 lt!210768) (buf!3198 (_2!6234 lt!210775)) lt!210778))))

(declare-fun reader!0 (BitStream!4874 BitStream!4874) tuple2!11842)

(assert (=> b!135752 (= lt!210793 (reader!0 (_2!6234 lt!210768) (_2!6234 lt!210775)))))

(declare-fun lt!210767 () tuple2!11838)

(declare-fun lt!210782 () tuple2!11842)

(declare-fun b!135753 () Bool)

(assert (=> b!135753 (= e!90144 (and (= (_2!6235 lt!210767) (select (arr!3470 arr!237) from!447)) (= (_1!6235 lt!210767) (_2!6237 lt!210782))))))

(declare-fun readBytePure!0 (BitStream!4874) tuple2!11838)

(assert (=> b!135753 (= lt!210767 (readBytePure!0 (_1!6237 lt!210782)))))

(assert (=> b!135753 (= lt!210782 (reader!0 thiss!1634 (_2!6234 lt!210768)))))

(declare-fun b!135754 () Bool)

(assert (=> b!135754 (= e!90137 (not e!90140))))

(declare-fun res!112931 () Bool)

(assert (=> b!135754 (=> res!112931 e!90140)))

(assert (=> b!135754 (= res!112931 (not (arrayRangesEq!208 (_2!6236 lt!210791) (_2!6236 lt!210780) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!210776 () tuple2!11840)

(assert (=> b!135754 (arrayRangesEq!208 (_2!6236 lt!210791) (_2!6236 lt!210776) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!210786 () Unit!8448)

(declare-fun lt!210787 () tuple2!11842)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4874 array!6194 (_ BitVec 32) (_ BitVec 32)) Unit!8448)

(assert (=> b!135754 (= lt!210786 (readByteArrayLoopArrayPrefixLemma!0 (_1!6237 lt!210787) arr!237 from!447 to!404))))

(declare-fun lt!210781 () array!6194)

(declare-fun withMovedByteIndex!0 (BitStream!4874 (_ BitVec 32)) BitStream!4874)

(assert (=> b!135754 (= lt!210776 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6237 lt!210787) #b00000000000000000000000000000001) lt!210781 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!210790 () tuple2!11842)

(assert (=> b!135754 (= lt!210780 (readByteArrayLoopPure!0 (_1!6237 lt!210790) lt!210781 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!210769 () tuple2!11838)

(assert (=> b!135754 (= lt!210781 (array!6195 (store (arr!3470 arr!237) from!447 (_2!6235 lt!210769)) (size!2805 arr!237)))))

(declare-fun lt!210784 () (_ BitVec 32))

(assert (=> b!135754 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!210775)))) ((_ sign_extend 32) (currentByte!5995 (_2!6234 lt!210768))) ((_ sign_extend 32) (currentBit!5990 (_2!6234 lt!210768))) lt!210784)))

(declare-fun lt!210771 () Unit!8448)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4874 array!6194 (_ BitVec 32)) Unit!8448)

(assert (=> b!135754 (= lt!210771 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6234 lt!210768) (buf!3198 (_2!6234 lt!210775)) lt!210784))))

(assert (=> b!135754 (= (_1!6236 lt!210791) (_2!6237 lt!210787))))

(assert (=> b!135754 (= lt!210791 (readByteArrayLoopPure!0 (_1!6237 lt!210787) arr!237 from!447 to!404))))

(assert (=> b!135754 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!210775)))) ((_ sign_extend 32) (currentByte!5995 thiss!1634)) ((_ sign_extend 32) (currentBit!5990 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!210774 () Unit!8448)

(assert (=> b!135754 (= lt!210774 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3198 (_2!6234 lt!210775)) (bvsub to!404 from!447)))))

(assert (=> b!135754 (= (_2!6235 lt!210769) (select (arr!3470 arr!237) from!447))))

(assert (=> b!135754 (= lt!210769 (readBytePure!0 (_1!6237 lt!210787)))))

(assert (=> b!135754 (= lt!210790 (reader!0 (_2!6234 lt!210768) (_2!6234 lt!210775)))))

(assert (=> b!135754 (= lt!210787 (reader!0 thiss!1634 (_2!6234 lt!210775)))))

(assert (=> b!135754 e!90134))

(declare-fun res!112936 () Bool)

(assert (=> b!135754 (=> (not res!112936) (not e!90134))))

(assert (=> b!135754 (= res!112936 (= (bitIndex!0 (size!2805 (buf!3198 (_1!6235 lt!210777))) (currentByte!5995 (_1!6235 lt!210777)) (currentBit!5990 (_1!6235 lt!210777))) (bitIndex!0 (size!2805 (buf!3198 (_1!6235 lt!210772))) (currentByte!5995 (_1!6235 lt!210772)) (currentBit!5990 (_1!6235 lt!210772)))))))

(declare-fun lt!210770 () Unit!8448)

(declare-fun lt!210792 () BitStream!4874)

(declare-fun readBytePrefixLemma!0 (BitStream!4874 BitStream!4874) Unit!8448)

(assert (=> b!135754 (= lt!210770 (readBytePrefixLemma!0 lt!210792 (_2!6234 lt!210775)))))

(assert (=> b!135754 (= lt!210772 (readBytePure!0 (BitStream!4875 (buf!3198 (_2!6234 lt!210775)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634))))))

(assert (=> b!135754 (= lt!210777 (readBytePure!0 lt!210792))))

(assert (=> b!135754 (= lt!210792 (BitStream!4875 (buf!3198 (_2!6234 lt!210768)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634)))))

(assert (=> b!135754 e!90141))

(declare-fun res!112933 () Bool)

(assert (=> b!135754 (=> (not res!112933) (not e!90141))))

(assert (=> b!135754 (= res!112933 (isPrefixOf!0 thiss!1634 (_2!6234 lt!210775)))))

(declare-fun lt!210785 () Unit!8448)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4874 BitStream!4874 BitStream!4874) Unit!8448)

(assert (=> b!135754 (= lt!210785 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6234 lt!210768) (_2!6234 lt!210775)))))

(assert (=> b!135754 e!90138))

(declare-fun res!112938 () Bool)

(assert (=> b!135754 (=> (not res!112938) (not e!90138))))

(assert (=> b!135754 (= res!112938 (= (size!2805 (buf!3198 (_2!6234 lt!210768))) (size!2805 (buf!3198 (_2!6234 lt!210775)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4874 array!6194 (_ BitVec 32) (_ BitVec 32)) tuple2!11836)

(assert (=> b!135754 (= lt!210775 (appendByteArrayLoop!0 (_2!6234 lt!210768) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!135754 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!210768)))) ((_ sign_extend 32) (currentByte!5995 (_2!6234 lt!210768))) ((_ sign_extend 32) (currentBit!5990 (_2!6234 lt!210768))) lt!210784)))

(assert (=> b!135754 (= lt!210784 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!210788 () Unit!8448)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4874 BitStream!4874 (_ BitVec 64) (_ BitVec 32)) Unit!8448)

(assert (=> b!135754 (= lt!210788 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6234 lt!210768) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!135754 e!90144))

(declare-fun res!112935 () Bool)

(assert (=> b!135754 (=> (not res!112935) (not e!90144))))

(assert (=> b!135754 (= res!112935 (= (size!2805 (buf!3198 thiss!1634)) (size!2805 (buf!3198 (_2!6234 lt!210768)))))))

(declare-fun appendByte!0 (BitStream!4874 (_ BitVec 8)) tuple2!11836)

(assert (=> b!135754 (= lt!210768 (appendByte!0 thiss!1634 (select (arr!3470 arr!237) from!447)))))

(declare-fun b!135755 () Bool)

(declare-fun res!112926 () Bool)

(assert (=> b!135755 (=> (not res!112926) (not e!90137))))

(assert (=> b!135755 (= res!112926 (bvslt from!447 to!404))))

(assert (= (and start!26394 res!112930) b!135746))

(assert (= (and b!135746 res!112932) b!135755))

(assert (= (and b!135755 res!112926) b!135742))

(assert (= (and b!135742 res!112927) b!135754))

(assert (= (and b!135754 res!112935) b!135744))

(assert (= (and b!135744 res!112937) b!135748))

(assert (= (and b!135748 res!112925) b!135753))

(assert (= (and b!135754 res!112938) b!135749))

(assert (= (and b!135749 res!112934) b!135745))

(assert (= (and b!135745 res!112929) b!135752))

(assert (= (and b!135752 (not res!112928)) b!135751))

(assert (= (and b!135754 res!112933) b!135743))

(assert (= (and b!135754 res!112936) b!135747))

(assert (= (and b!135754 (not res!112931)) b!135750))

(assert (= start!26394 b!135741))

(declare-fun m!207259 () Bool)

(assert (=> b!135746 m!207259))

(declare-fun m!207261 () Bool)

(assert (=> b!135741 m!207261))

(declare-fun m!207263 () Bool)

(assert (=> b!135742 m!207263))

(declare-fun m!207265 () Bool)

(assert (=> b!135745 m!207265))

(declare-fun m!207267 () Bool)

(assert (=> b!135753 m!207267))

(declare-fun m!207269 () Bool)

(assert (=> b!135753 m!207269))

(declare-fun m!207271 () Bool)

(assert (=> b!135753 m!207271))

(declare-fun m!207273 () Bool)

(assert (=> start!26394 m!207273))

(declare-fun m!207275 () Bool)

(assert (=> start!26394 m!207275))

(declare-fun m!207277 () Bool)

(assert (=> b!135750 m!207277))

(declare-fun m!207279 () Bool)

(assert (=> b!135750 m!207279))

(declare-fun m!207281 () Bool)

(assert (=> b!135750 m!207281))

(declare-fun m!207283 () Bool)

(assert (=> b!135750 m!207283))

(declare-fun m!207285 () Bool)

(assert (=> b!135744 m!207285))

(declare-fun m!207287 () Bool)

(assert (=> b!135744 m!207287))

(declare-fun m!207289 () Bool)

(assert (=> b!135743 m!207289))

(declare-fun m!207291 () Bool)

(assert (=> b!135749 m!207291))

(assert (=> b!135749 m!207285))

(declare-fun m!207293 () Bool)

(assert (=> b!135754 m!207293))

(declare-fun m!207295 () Bool)

(assert (=> b!135754 m!207295))

(declare-fun m!207297 () Bool)

(assert (=> b!135754 m!207297))

(declare-fun m!207299 () Bool)

(assert (=> b!135754 m!207299))

(declare-fun m!207301 () Bool)

(assert (=> b!135754 m!207301))

(declare-fun m!207303 () Bool)

(assert (=> b!135754 m!207303))

(declare-fun m!207305 () Bool)

(assert (=> b!135754 m!207305))

(declare-fun m!207307 () Bool)

(assert (=> b!135754 m!207307))

(declare-fun m!207309 () Bool)

(assert (=> b!135754 m!207309))

(declare-fun m!207311 () Bool)

(assert (=> b!135754 m!207311))

(declare-fun m!207313 () Bool)

(assert (=> b!135754 m!207313))

(declare-fun m!207315 () Bool)

(assert (=> b!135754 m!207315))

(declare-fun m!207317 () Bool)

(assert (=> b!135754 m!207317))

(declare-fun m!207319 () Bool)

(assert (=> b!135754 m!207319))

(declare-fun m!207321 () Bool)

(assert (=> b!135754 m!207321))

(declare-fun m!207323 () Bool)

(assert (=> b!135754 m!207323))

(declare-fun m!207325 () Bool)

(assert (=> b!135754 m!207325))

(declare-fun m!207327 () Bool)

(assert (=> b!135754 m!207327))

(declare-fun m!207329 () Bool)

(assert (=> b!135754 m!207329))

(declare-fun m!207331 () Bool)

(assert (=> b!135754 m!207331))

(declare-fun m!207333 () Bool)

(assert (=> b!135754 m!207333))

(assert (=> b!135754 m!207327))

(declare-fun m!207335 () Bool)

(assert (=> b!135754 m!207335))

(assert (=> b!135754 m!207267))

(declare-fun m!207337 () Bool)

(assert (=> b!135754 m!207337))

(declare-fun m!207339 () Bool)

(assert (=> b!135754 m!207339))

(declare-fun m!207341 () Bool)

(assert (=> b!135754 m!207341))

(declare-fun m!207343 () Bool)

(assert (=> b!135754 m!207343))

(assert (=> b!135754 m!207267))

(declare-fun m!207345 () Bool)

(assert (=> b!135751 m!207345))

(declare-fun m!207347 () Bool)

(assert (=> b!135752 m!207347))

(declare-fun m!207349 () Bool)

(assert (=> b!135752 m!207349))

(declare-fun m!207351 () Bool)

(assert (=> b!135752 m!207351))

(assert (=> b!135752 m!207307))

(declare-fun m!207353 () Bool)

(assert (=> b!135748 m!207353))

(push 1)

(assert (not start!26394))

(assert (not b!135753))

(assert (not b!135745))

(assert (not b!135751))

(assert (not b!135749))

(assert (not b!135748))

(assert (not b!135750))

(assert (not b!135752))

(assert (not b!135754))

(assert (not b!135744))

(assert (not b!135746))

(assert (not b!135741))

(assert (not b!135743))

(assert (not b!135742))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!43502 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!43502 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!210775)))) ((_ sign_extend 32) (currentByte!5995 (_2!6234 lt!210768))) ((_ sign_extend 32) (currentBit!5990 (_2!6234 lt!210768))) lt!210784) (bvsle ((_ sign_extend 32) lt!210784) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!210775)))) ((_ sign_extend 32) (currentByte!5995 (_2!6234 lt!210768))) ((_ sign_extend 32) (currentBit!5990 (_2!6234 lt!210768)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10613 () Bool)

(assert (= bs!10613 d!43502))

(declare-fun m!207541 () Bool)

(assert (=> bs!10613 m!207541))

(assert (=> b!135754 d!43502))

(declare-fun d!43504 () Bool)

(declare-fun e!90206 () Bool)

(assert (=> d!43504 e!90206))

(declare-fun res!113029 () Bool)

(assert (=> d!43504 (=> (not res!113029) (not e!90206))))

(declare-fun lt!211044 () tuple2!11838)

(declare-fun lt!211046 () tuple2!11838)

(assert (=> d!43504 (= res!113029 (= (bitIndex!0 (size!2805 (buf!3198 (_1!6235 lt!211044))) (currentByte!5995 (_1!6235 lt!211044)) (currentBit!5990 (_1!6235 lt!211044))) (bitIndex!0 (size!2805 (buf!3198 (_1!6235 lt!211046))) (currentByte!5995 (_1!6235 lt!211046)) (currentBit!5990 (_1!6235 lt!211046)))))))

(declare-fun lt!211045 () Unit!8448)

(declare-fun lt!211043 () BitStream!4874)

(declare-fun choose!14 (BitStream!4874 BitStream!4874 BitStream!4874 tuple2!11838 tuple2!11838 BitStream!4874 (_ BitVec 8) tuple2!11838 tuple2!11838 BitStream!4874 (_ BitVec 8)) Unit!8448)

(assert (=> d!43504 (= lt!211045 (choose!14 lt!210792 (_2!6234 lt!210775) lt!211043 lt!211044 (tuple2!11839 (_1!6235 lt!211044) (_2!6235 lt!211044)) (_1!6235 lt!211044) (_2!6235 lt!211044) lt!211046 (tuple2!11839 (_1!6235 lt!211046) (_2!6235 lt!211046)) (_1!6235 lt!211046) (_2!6235 lt!211046)))))

(assert (=> d!43504 (= lt!211046 (readBytePure!0 lt!211043))))

(assert (=> d!43504 (= lt!211044 (readBytePure!0 lt!210792))))

(assert (=> d!43504 (= lt!211043 (BitStream!4875 (buf!3198 (_2!6234 lt!210775)) (currentByte!5995 lt!210792) (currentBit!5990 lt!210792)))))

(assert (=> d!43504 (= (readBytePrefixLemma!0 lt!210792 (_2!6234 lt!210775)) lt!211045)))

(declare-fun b!135856 () Bool)

(assert (=> b!135856 (= e!90206 (= (_2!6235 lt!211044) (_2!6235 lt!211046)))))

(assert (= (and d!43504 res!113029) b!135856))

(declare-fun m!207561 () Bool)

(assert (=> d!43504 m!207561))

(declare-fun m!207563 () Bool)

(assert (=> d!43504 m!207563))

(declare-fun m!207565 () Bool)

(assert (=> d!43504 m!207565))

(assert (=> d!43504 m!207333))

(declare-fun m!207567 () Bool)

(assert (=> d!43504 m!207567))

(assert (=> b!135754 d!43504))

(declare-fun d!43520 () Bool)

(declare-datatypes ((tuple2!11846 0))(
  ( (tuple2!11847 (_1!6240 (_ BitVec 8)) (_2!6240 BitStream!4874)) )
))
(declare-fun lt!211053 () tuple2!11846)

(declare-fun readByte!0 (BitStream!4874) tuple2!11846)

(assert (=> d!43520 (= lt!211053 (readByte!0 lt!210792))))

(assert (=> d!43520 (= (readBytePure!0 lt!210792) (tuple2!11839 (_2!6240 lt!211053) (_1!6240 lt!211053)))))

(declare-fun bs!10619 () Bool)

(assert (= bs!10619 d!43520))

(declare-fun m!207571 () Bool)

(assert (=> bs!10619 m!207571))

(assert (=> b!135754 d!43520))

(declare-fun d!43522 () Bool)

(declare-fun res!113034 () Bool)

(declare-fun e!90211 () Bool)

(assert (=> d!43522 (=> res!113034 e!90211)))

(assert (=> d!43522 (= res!113034 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!43522 (= (arrayRangesEq!208 (_2!6236 lt!210791) (_2!6236 lt!210780) #b00000000000000000000000000000000 to!404) e!90211)))

(declare-fun b!135861 () Bool)

(declare-fun e!90212 () Bool)

(assert (=> b!135861 (= e!90211 e!90212)))

(declare-fun res!113035 () Bool)

(assert (=> b!135861 (=> (not res!113035) (not e!90212))))

(assert (=> b!135861 (= res!113035 (= (select (arr!3470 (_2!6236 lt!210791)) #b00000000000000000000000000000000) (select (arr!3470 (_2!6236 lt!210780)) #b00000000000000000000000000000000)))))

(declare-fun b!135862 () Bool)

(assert (=> b!135862 (= e!90212 (arrayRangesEq!208 (_2!6236 lt!210791) (_2!6236 lt!210780) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!43522 (not res!113034)) b!135861))

(assert (= (and b!135861 res!113035) b!135862))

(declare-fun m!207573 () Bool)

(assert (=> b!135861 m!207573))

(declare-fun m!207575 () Bool)

(assert (=> b!135861 m!207575))

(declare-fun m!207577 () Bool)

(assert (=> b!135862 m!207577))

(assert (=> b!135754 d!43522))

(declare-fun d!43524 () Bool)

(declare-fun e!90215 () Bool)

(assert (=> d!43524 e!90215))

(declare-fun res!113041 () Bool)

(assert (=> d!43524 (=> (not res!113041) (not e!90215))))

(declare-fun lt!211068 () (_ BitVec 64))

(declare-fun lt!211066 () (_ BitVec 64))

(declare-fun lt!211069 () (_ BitVec 64))

(assert (=> d!43524 (= res!113041 (= lt!211068 (bvsub lt!211069 lt!211066)))))

(assert (=> d!43524 (or (= (bvand lt!211069 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!211066 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!211069 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!211069 lt!211066) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!43524 (= lt!211066 (remainingBits!0 ((_ sign_extend 32) (size!2805 (buf!3198 (_1!6235 lt!210772)))) ((_ sign_extend 32) (currentByte!5995 (_1!6235 lt!210772))) ((_ sign_extend 32) (currentBit!5990 (_1!6235 lt!210772)))))))

(declare-fun lt!211071 () (_ BitVec 64))

(declare-fun lt!211067 () (_ BitVec 64))

(assert (=> d!43524 (= lt!211069 (bvmul lt!211071 lt!211067))))

(assert (=> d!43524 (or (= lt!211071 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!211067 (bvsdiv (bvmul lt!211071 lt!211067) lt!211071)))))

(assert (=> d!43524 (= lt!211067 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!43524 (= lt!211071 ((_ sign_extend 32) (size!2805 (buf!3198 (_1!6235 lt!210772)))))))

(assert (=> d!43524 (= lt!211068 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5995 (_1!6235 lt!210772))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5990 (_1!6235 lt!210772)))))))

(assert (=> d!43524 (invariant!0 (currentBit!5990 (_1!6235 lt!210772)) (currentByte!5995 (_1!6235 lt!210772)) (size!2805 (buf!3198 (_1!6235 lt!210772))))))

(assert (=> d!43524 (= (bitIndex!0 (size!2805 (buf!3198 (_1!6235 lt!210772))) (currentByte!5995 (_1!6235 lt!210772)) (currentBit!5990 (_1!6235 lt!210772))) lt!211068)))

(declare-fun b!135867 () Bool)

(declare-fun res!113040 () Bool)

(assert (=> b!135867 (=> (not res!113040) (not e!90215))))

(assert (=> b!135867 (= res!113040 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!211068))))

(declare-fun b!135868 () Bool)

(declare-fun lt!211070 () (_ BitVec 64))

(assert (=> b!135868 (= e!90215 (bvsle lt!211068 (bvmul lt!211070 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!135868 (or (= lt!211070 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!211070 #b0000000000000000000000000000000000000000000000000000000000001000) lt!211070)))))

(assert (=> b!135868 (= lt!211070 ((_ sign_extend 32) (size!2805 (buf!3198 (_1!6235 lt!210772)))))))

(assert (= (and d!43524 res!113041) b!135867))

(assert (= (and b!135867 res!113040) b!135868))

(declare-fun m!207579 () Bool)

(assert (=> d!43524 m!207579))

(declare-fun m!207581 () Bool)

(assert (=> d!43524 m!207581))

(assert (=> b!135754 d!43524))

(declare-fun d!43526 () Bool)

(declare-fun res!113042 () Bool)

(declare-fun e!90216 () Bool)

(assert (=> d!43526 (=> res!113042 e!90216)))

(assert (=> d!43526 (= res!113042 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!43526 (= (arrayRangesEq!208 (_2!6236 lt!210791) (_2!6236 lt!210776) #b00000000000000000000000000000000 to!404) e!90216)))

(declare-fun b!135869 () Bool)

(declare-fun e!90217 () Bool)

(assert (=> b!135869 (= e!90216 e!90217)))

(declare-fun res!113043 () Bool)

(assert (=> b!135869 (=> (not res!113043) (not e!90217))))

(assert (=> b!135869 (= res!113043 (= (select (arr!3470 (_2!6236 lt!210791)) #b00000000000000000000000000000000) (select (arr!3470 (_2!6236 lt!210776)) #b00000000000000000000000000000000)))))

(declare-fun b!135870 () Bool)

(assert (=> b!135870 (= e!90217 (arrayRangesEq!208 (_2!6236 lt!210791) (_2!6236 lt!210776) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!43526 (not res!113042)) b!135869))

(assert (= (and b!135869 res!113043) b!135870))

(assert (=> b!135869 m!207573))

(declare-fun m!207583 () Bool)

(assert (=> b!135869 m!207583))

(declare-fun m!207585 () Bool)

(assert (=> b!135870 m!207585))

(assert (=> b!135754 d!43526))

(declare-fun b!135881 () Bool)

(declare-fun res!113052 () Bool)

(declare-fun e!90223 () Bool)

(assert (=> b!135881 (=> (not res!113052) (not e!90223))))

(declare-fun lt!211114 () tuple2!11842)

(assert (=> b!135881 (= res!113052 (isPrefixOf!0 (_2!6237 lt!211114) (_2!6234 lt!210775)))))

(declare-fun d!43528 () Bool)

(assert (=> d!43528 e!90223))

(declare-fun res!113051 () Bool)

(assert (=> d!43528 (=> (not res!113051) (not e!90223))))

(assert (=> d!43528 (= res!113051 (isPrefixOf!0 (_1!6237 lt!211114) (_2!6237 lt!211114)))))

(declare-fun lt!211121 () BitStream!4874)

(assert (=> d!43528 (= lt!211114 (tuple2!11843 lt!211121 (_2!6234 lt!210775)))))

(declare-fun lt!211113 () Unit!8448)

(declare-fun lt!211118 () Unit!8448)

(assert (=> d!43528 (= lt!211113 lt!211118)))

(assert (=> d!43528 (isPrefixOf!0 lt!211121 (_2!6234 lt!210775))))

(assert (=> d!43528 (= lt!211118 (lemmaIsPrefixTransitive!0 lt!211121 (_2!6234 lt!210775) (_2!6234 lt!210775)))))

(declare-fun lt!211126 () Unit!8448)

(declare-fun lt!211125 () Unit!8448)

(assert (=> d!43528 (= lt!211126 lt!211125)))

(assert (=> d!43528 (isPrefixOf!0 lt!211121 (_2!6234 lt!210775))))

(assert (=> d!43528 (= lt!211125 (lemmaIsPrefixTransitive!0 lt!211121 (_2!6234 lt!210768) (_2!6234 lt!210775)))))

(declare-fun lt!211128 () Unit!8448)

(declare-fun e!90222 () Unit!8448)

(assert (=> d!43528 (= lt!211128 e!90222)))

(declare-fun c!7686 () Bool)

(assert (=> d!43528 (= c!7686 (not (= (size!2805 (buf!3198 (_2!6234 lt!210768))) #b00000000000000000000000000000000)))))

(declare-fun lt!211130 () Unit!8448)

(declare-fun lt!211117 () Unit!8448)

(assert (=> d!43528 (= lt!211130 lt!211117)))

(assert (=> d!43528 (isPrefixOf!0 (_2!6234 lt!210775) (_2!6234 lt!210775))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4874) Unit!8448)

(assert (=> d!43528 (= lt!211117 (lemmaIsPrefixRefl!0 (_2!6234 lt!210775)))))

(declare-fun lt!211119 () Unit!8448)

(declare-fun lt!211131 () Unit!8448)

(assert (=> d!43528 (= lt!211119 lt!211131)))

(assert (=> d!43528 (= lt!211131 (lemmaIsPrefixRefl!0 (_2!6234 lt!210775)))))

(declare-fun lt!211112 () Unit!8448)

(declare-fun lt!211122 () Unit!8448)

(assert (=> d!43528 (= lt!211112 lt!211122)))

(assert (=> d!43528 (isPrefixOf!0 lt!211121 lt!211121)))

(assert (=> d!43528 (= lt!211122 (lemmaIsPrefixRefl!0 lt!211121))))

(declare-fun lt!211127 () Unit!8448)

(declare-fun lt!211116 () Unit!8448)

(assert (=> d!43528 (= lt!211127 lt!211116)))

(assert (=> d!43528 (isPrefixOf!0 (_2!6234 lt!210768) (_2!6234 lt!210768))))

(assert (=> d!43528 (= lt!211116 (lemmaIsPrefixRefl!0 (_2!6234 lt!210768)))))

(assert (=> d!43528 (= lt!211121 (BitStream!4875 (buf!3198 (_2!6234 lt!210775)) (currentByte!5995 (_2!6234 lt!210768)) (currentBit!5990 (_2!6234 lt!210768))))))

(assert (=> d!43528 (isPrefixOf!0 (_2!6234 lt!210768) (_2!6234 lt!210775))))

(assert (=> d!43528 (= (reader!0 (_2!6234 lt!210768) (_2!6234 lt!210775)) lt!211114)))

(declare-fun b!135882 () Bool)

(declare-fun lt!211120 () (_ BitVec 64))

(declare-fun lt!211115 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4874 (_ BitVec 64)) BitStream!4874)

(assert (=> b!135882 (= e!90223 (= (_1!6237 lt!211114) (withMovedBitIndex!0 (_2!6237 lt!211114) (bvsub lt!211120 lt!211115))))))

(assert (=> b!135882 (or (= (bvand lt!211120 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!211115 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!211120 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!211120 lt!211115) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!135882 (= lt!211115 (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!210775))) (currentByte!5995 (_2!6234 lt!210775)) (currentBit!5990 (_2!6234 lt!210775))))))

(assert (=> b!135882 (= lt!211120 (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!210768))) (currentByte!5995 (_2!6234 lt!210768)) (currentBit!5990 (_2!6234 lt!210768))))))

(declare-fun b!135883 () Bool)

(declare-fun lt!211123 () Unit!8448)

(assert (=> b!135883 (= e!90222 lt!211123)))

(declare-fun lt!211129 () (_ BitVec 64))

(assert (=> b!135883 (= lt!211129 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!211124 () (_ BitVec 64))

(assert (=> b!135883 (= lt!211124 (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!210768))) (currentByte!5995 (_2!6234 lt!210768)) (currentBit!5990 (_2!6234 lt!210768))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6194 array!6194 (_ BitVec 64) (_ BitVec 64)) Unit!8448)

(assert (=> b!135883 (= lt!211123 (arrayBitRangesEqSymmetric!0 (buf!3198 (_2!6234 lt!210768)) (buf!3198 (_2!6234 lt!210775)) lt!211129 lt!211124))))

(declare-fun arrayBitRangesEq!0 (array!6194 array!6194 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!135883 (arrayBitRangesEq!0 (buf!3198 (_2!6234 lt!210775)) (buf!3198 (_2!6234 lt!210768)) lt!211129 lt!211124)))

(declare-fun b!135884 () Bool)

(declare-fun res!113050 () Bool)

(assert (=> b!135884 (=> (not res!113050) (not e!90223))))

(assert (=> b!135884 (= res!113050 (isPrefixOf!0 (_1!6237 lt!211114) (_2!6234 lt!210768)))))

(declare-fun b!135885 () Bool)

(declare-fun Unit!8453 () Unit!8448)

(assert (=> b!135885 (= e!90222 Unit!8453)))

(assert (= (and d!43528 c!7686) b!135883))

(assert (= (and d!43528 (not c!7686)) b!135885))

(assert (= (and d!43528 res!113051) b!135884))

(assert (= (and b!135884 res!113050) b!135881))

(assert (= (and b!135881 res!113052) b!135882))

(declare-fun m!207587 () Bool)

(assert (=> b!135882 m!207587))

(assert (=> b!135882 m!207291))

(assert (=> b!135882 m!207285))

(declare-fun m!207589 () Bool)

(assert (=> b!135881 m!207589))

(declare-fun m!207591 () Bool)

(assert (=> d!43528 m!207591))

(declare-fun m!207593 () Bool)

(assert (=> d!43528 m!207593))

(declare-fun m!207595 () Bool)

(assert (=> d!43528 m!207595))

(declare-fun m!207597 () Bool)

(assert (=> d!43528 m!207597))

(assert (=> d!43528 m!207265))

(declare-fun m!207599 () Bool)

(assert (=> d!43528 m!207599))

(declare-fun m!207601 () Bool)

(assert (=> d!43528 m!207601))

(declare-fun m!207603 () Bool)

(assert (=> d!43528 m!207603))

(declare-fun m!207605 () Bool)

(assert (=> d!43528 m!207605))

(declare-fun m!207607 () Bool)

(assert (=> d!43528 m!207607))

(declare-fun m!207609 () Bool)

(assert (=> d!43528 m!207609))

(declare-fun m!207611 () Bool)

(assert (=> b!135884 m!207611))

(assert (=> b!135883 m!207285))

(declare-fun m!207613 () Bool)

(assert (=> b!135883 m!207613))

(declare-fun m!207615 () Bool)

(assert (=> b!135883 m!207615))

(assert (=> b!135754 d!43528))

(declare-fun d!43530 () Bool)

(assert (=> d!43530 (isPrefixOf!0 thiss!1634 (_2!6234 lt!210775))))

(declare-fun lt!211134 () Unit!8448)

(declare-fun choose!30 (BitStream!4874 BitStream!4874 BitStream!4874) Unit!8448)

(assert (=> d!43530 (= lt!211134 (choose!30 thiss!1634 (_2!6234 lt!210768) (_2!6234 lt!210775)))))

(assert (=> d!43530 (isPrefixOf!0 thiss!1634 (_2!6234 lt!210768))))

(assert (=> d!43530 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6234 lt!210768) (_2!6234 lt!210775)) lt!211134)))

(declare-fun bs!10620 () Bool)

(assert (= bs!10620 d!43530))

(assert (=> bs!10620 m!207309))

(declare-fun m!207617 () Bool)

(assert (=> bs!10620 m!207617))

(assert (=> bs!10620 m!207353))

(assert (=> b!135754 d!43530))

(declare-fun d!43532 () Bool)

(declare-fun e!90224 () Bool)

(assert (=> d!43532 e!90224))

(declare-fun res!113054 () Bool)

(assert (=> d!43532 (=> (not res!113054) (not e!90224))))

(declare-fun lt!211137 () (_ BitVec 64))

(declare-fun lt!211138 () (_ BitVec 64))

(declare-fun lt!211135 () (_ BitVec 64))

(assert (=> d!43532 (= res!113054 (= lt!211137 (bvsub lt!211138 lt!211135)))))

(assert (=> d!43532 (or (= (bvand lt!211138 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!211135 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!211138 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!211138 lt!211135) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!43532 (= lt!211135 (remainingBits!0 ((_ sign_extend 32) (size!2805 (buf!3198 (_1!6235 lt!210777)))) ((_ sign_extend 32) (currentByte!5995 (_1!6235 lt!210777))) ((_ sign_extend 32) (currentBit!5990 (_1!6235 lt!210777)))))))

(declare-fun lt!211140 () (_ BitVec 64))

(declare-fun lt!211136 () (_ BitVec 64))

(assert (=> d!43532 (= lt!211138 (bvmul lt!211140 lt!211136))))

(assert (=> d!43532 (or (= lt!211140 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!211136 (bvsdiv (bvmul lt!211140 lt!211136) lt!211140)))))

(assert (=> d!43532 (= lt!211136 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!43532 (= lt!211140 ((_ sign_extend 32) (size!2805 (buf!3198 (_1!6235 lt!210777)))))))

(assert (=> d!43532 (= lt!211137 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5995 (_1!6235 lt!210777))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5990 (_1!6235 lt!210777)))))))

(assert (=> d!43532 (invariant!0 (currentBit!5990 (_1!6235 lt!210777)) (currentByte!5995 (_1!6235 lt!210777)) (size!2805 (buf!3198 (_1!6235 lt!210777))))))

(assert (=> d!43532 (= (bitIndex!0 (size!2805 (buf!3198 (_1!6235 lt!210777))) (currentByte!5995 (_1!6235 lt!210777)) (currentBit!5990 (_1!6235 lt!210777))) lt!211137)))

(declare-fun b!135886 () Bool)

(declare-fun res!113053 () Bool)

(assert (=> b!135886 (=> (not res!113053) (not e!90224))))

(assert (=> b!135886 (= res!113053 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!211137))))

(declare-fun b!135887 () Bool)

(declare-fun lt!211139 () (_ BitVec 64))

(assert (=> b!135887 (= e!90224 (bvsle lt!211137 (bvmul lt!211139 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!135887 (or (= lt!211139 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!211139 #b0000000000000000000000000000000000000000000000000000000000001000) lt!211139)))))

(assert (=> b!135887 (= lt!211139 ((_ sign_extend 32) (size!2805 (buf!3198 (_1!6235 lt!210777)))))))

(assert (= (and d!43532 res!113054) b!135886))

(assert (= (and b!135886 res!113053) b!135887))

(declare-fun m!207619 () Bool)

(assert (=> d!43532 m!207619))

(declare-fun m!207621 () Bool)

(assert (=> d!43532 m!207621))

(assert (=> b!135754 d!43532))

(declare-fun d!43534 () Bool)

(declare-datatypes ((tuple3!516 0))(
  ( (tuple3!517 (_1!6241 Unit!8448) (_2!6241 BitStream!4874) (_3!317 array!6194)) )
))
(declare-fun lt!211143 () tuple3!516)

(declare-fun readByteArrayLoop!0 (BitStream!4874 array!6194 (_ BitVec 32) (_ BitVec 32)) tuple3!516)

(assert (=> d!43534 (= lt!211143 (readByteArrayLoop!0 (_1!6237 lt!210787) arr!237 from!447 to!404))))

(assert (=> d!43534 (= (readByteArrayLoopPure!0 (_1!6237 lt!210787) arr!237 from!447 to!404) (tuple2!11841 (_2!6241 lt!211143) (_3!317 lt!211143)))))

(declare-fun bs!10621 () Bool)

(assert (= bs!10621 d!43534))

(declare-fun m!207623 () Bool)

(assert (=> bs!10621 m!207623))

(assert (=> b!135754 d!43534))

(declare-fun d!43536 () Bool)

(declare-fun e!90227 () Bool)

(assert (=> d!43536 e!90227))

(declare-fun res!113063 () Bool)

(assert (=> d!43536 (=> (not res!113063) (not e!90227))))

(declare-fun lt!211156 () tuple2!11836)

(assert (=> d!43536 (= res!113063 (= (size!2805 (buf!3198 thiss!1634)) (size!2805 (buf!3198 (_2!6234 lt!211156)))))))

(declare-fun choose!6 (BitStream!4874 (_ BitVec 8)) tuple2!11836)

(assert (=> d!43536 (= lt!211156 (choose!6 thiss!1634 (select (arr!3470 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!43536 (validate_offset_byte!0 ((_ sign_extend 32) (size!2805 (buf!3198 thiss!1634))) ((_ sign_extend 32) (currentByte!5995 thiss!1634)) ((_ sign_extend 32) (currentBit!5990 thiss!1634)))))

(assert (=> d!43536 (= (appendByte!0 thiss!1634 (select (arr!3470 arr!237) from!447)) lt!211156)))

(declare-fun b!135894 () Bool)

(declare-fun res!113061 () Bool)

(assert (=> b!135894 (=> (not res!113061) (not e!90227))))

(declare-fun lt!211154 () (_ BitVec 64))

(declare-fun lt!211158 () (_ BitVec 64))

(assert (=> b!135894 (= res!113061 (= (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!211156))) (currentByte!5995 (_2!6234 lt!211156)) (currentBit!5990 (_2!6234 lt!211156))) (bvadd lt!211158 lt!211154)))))

(assert (=> b!135894 (or (not (= (bvand lt!211158 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!211154 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!211158 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!211158 lt!211154) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!135894 (= lt!211154 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!135894 (= lt!211158 (bitIndex!0 (size!2805 (buf!3198 thiss!1634)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634)))))

(declare-fun b!135895 () Bool)

(declare-fun res!113062 () Bool)

(assert (=> b!135895 (=> (not res!113062) (not e!90227))))

(assert (=> b!135895 (= res!113062 (isPrefixOf!0 thiss!1634 (_2!6234 lt!211156)))))

(declare-fun b!135896 () Bool)

(declare-fun lt!211157 () tuple2!11842)

(declare-fun lt!211155 () tuple2!11838)

(assert (=> b!135896 (= e!90227 (and (= (_2!6235 lt!211155) (select (arr!3470 arr!237) from!447)) (= (_1!6235 lt!211155) (_2!6237 lt!211157))))))

(assert (=> b!135896 (= lt!211155 (readBytePure!0 (_1!6237 lt!211157)))))

(assert (=> b!135896 (= lt!211157 (reader!0 thiss!1634 (_2!6234 lt!211156)))))

(assert (= (and d!43536 res!113063) b!135894))

(assert (= (and b!135894 res!113061) b!135895))

(assert (= (and b!135895 res!113062) b!135896))

(assert (=> d!43536 m!207267))

(declare-fun m!207625 () Bool)

(assert (=> d!43536 m!207625))

(declare-fun m!207627 () Bool)

(assert (=> d!43536 m!207627))

(declare-fun m!207629 () Bool)

(assert (=> b!135894 m!207629))

(assert (=> b!135894 m!207287))

(declare-fun m!207631 () Bool)

(assert (=> b!135895 m!207631))

(declare-fun m!207633 () Bool)

(assert (=> b!135896 m!207633))

(declare-fun m!207635 () Bool)

(assert (=> b!135896 m!207635))

(assert (=> b!135754 d!43536))

(declare-fun lt!211159 () tuple3!516)

(declare-fun d!43538 () Bool)

(assert (=> d!43538 (= lt!211159 (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!6237 lt!210787) #b00000000000000000000000000000001) lt!210781 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!43538 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6237 lt!210787) #b00000000000000000000000000000001) lt!210781 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11841 (_2!6241 lt!211159) (_3!317 lt!211159)))))

(declare-fun bs!10622 () Bool)

(assert (= bs!10622 d!43538))

(assert (=> bs!10622 m!207327))

(declare-fun m!207637 () Bool)

(assert (=> bs!10622 m!207637))

(assert (=> b!135754 d!43538))

(declare-fun d!43540 () Bool)

(declare-fun lt!211160 () tuple2!11846)

(assert (=> d!43540 (= lt!211160 (readByte!0 (BitStream!4875 (buf!3198 (_2!6234 lt!210775)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634))))))

(assert (=> d!43540 (= (readBytePure!0 (BitStream!4875 (buf!3198 (_2!6234 lt!210775)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634))) (tuple2!11839 (_2!6240 lt!211160) (_1!6240 lt!211160)))))

(declare-fun bs!10623 () Bool)

(assert (= bs!10623 d!43540))

(declare-fun m!207639 () Bool)

(assert (=> bs!10623 m!207639))

(assert (=> b!135754 d!43540))

(declare-fun d!43542 () Bool)

(declare-fun lt!211161 () tuple2!11846)

(assert (=> d!43542 (= lt!211161 (readByte!0 (_1!6237 lt!210787)))))

(assert (=> d!43542 (= (readBytePure!0 (_1!6237 lt!210787)) (tuple2!11839 (_2!6240 lt!211161) (_1!6240 lt!211161)))))

(declare-fun bs!10624 () Bool)

(assert (= bs!10624 d!43542))

(declare-fun m!207641 () Bool)

(assert (=> bs!10624 m!207641))

(assert (=> b!135754 d!43542))

(declare-fun d!43544 () Bool)

(assert (=> d!43544 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!210775)))) ((_ sign_extend 32) (currentByte!5995 thiss!1634)) ((_ sign_extend 32) (currentBit!5990 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!210775)))) ((_ sign_extend 32) (currentByte!5995 thiss!1634)) ((_ sign_extend 32) (currentBit!5990 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10625 () Bool)

(assert (= bs!10625 d!43544))

(declare-fun m!207643 () Bool)

(assert (=> bs!10625 m!207643))

(assert (=> b!135754 d!43544))

(declare-fun d!43546 () Bool)

(assert (=> d!43546 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!210775)))) ((_ sign_extend 32) (currentByte!5995 (_2!6234 lt!210768))) ((_ sign_extend 32) (currentBit!5990 (_2!6234 lt!210768))) lt!210784)))

(declare-fun lt!211164 () Unit!8448)

(declare-fun choose!26 (BitStream!4874 array!6194 (_ BitVec 32) BitStream!4874) Unit!8448)

(assert (=> d!43546 (= lt!211164 (choose!26 (_2!6234 lt!210768) (buf!3198 (_2!6234 lt!210775)) lt!210784 (BitStream!4875 (buf!3198 (_2!6234 lt!210775)) (currentByte!5995 (_2!6234 lt!210768)) (currentBit!5990 (_2!6234 lt!210768)))))))

(assert (=> d!43546 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6234 lt!210768) (buf!3198 (_2!6234 lt!210775)) lt!210784) lt!211164)))

(declare-fun bs!10626 () Bool)

(assert (= bs!10626 d!43546))

(assert (=> bs!10626 m!207315))

(declare-fun m!207645 () Bool)

(assert (=> bs!10626 m!207645))

(assert (=> b!135754 d!43546))

(declare-fun d!43548 () Bool)

(assert (=> d!43548 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!210768)))) ((_ sign_extend 32) (currentByte!5995 (_2!6234 lt!210768))) ((_ sign_extend 32) (currentBit!5990 (_2!6234 lt!210768))) lt!210784) (bvsle ((_ sign_extend 32) lt!210784) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!210768)))) ((_ sign_extend 32) (currentByte!5995 (_2!6234 lt!210768))) ((_ sign_extend 32) (currentBit!5990 (_2!6234 lt!210768)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10627 () Bool)

(assert (= bs!10627 d!43548))

(declare-fun m!207647 () Bool)

(assert (=> bs!10627 m!207647))

(assert (=> b!135754 d!43548))

(declare-fun d!43550 () Bool)

(assert (=> d!43550 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!210775)))) ((_ sign_extend 32) (currentByte!5995 thiss!1634)) ((_ sign_extend 32) (currentBit!5990 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!211165 () Unit!8448)

(assert (=> d!43550 (= lt!211165 (choose!26 thiss!1634 (buf!3198 (_2!6234 lt!210775)) (bvsub to!404 from!447) (BitStream!4875 (buf!3198 (_2!6234 lt!210775)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634))))))

(assert (=> d!43550 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3198 (_2!6234 lt!210775)) (bvsub to!404 from!447)) lt!211165)))

(declare-fun bs!10628 () Bool)

(assert (= bs!10628 d!43550))

(assert (=> bs!10628 m!207335))

(declare-fun m!207649 () Bool)

(assert (=> bs!10628 m!207649))

(assert (=> b!135754 d!43550))

(declare-fun d!43552 () Bool)

(declare-fun moveByteIndex!0 (BitStream!4874 (_ BitVec 32)) tuple2!11836)

(assert (=> d!43552 (= (withMovedByteIndex!0 (_1!6237 lt!210787) #b00000000000000000000000000000001) (_2!6234 (moveByteIndex!0 (_1!6237 lt!210787) #b00000000000000000000000000000001)))))

(declare-fun bs!10629 () Bool)

(assert (= bs!10629 d!43552))

(declare-fun m!207651 () Bool)

(assert (=> bs!10629 m!207651))

(assert (=> b!135754 d!43552))

(declare-fun d!43554 () Bool)

(declare-fun res!113072 () Bool)

(declare-fun e!90233 () Bool)

(assert (=> d!43554 (=> (not res!113072) (not e!90233))))

(assert (=> d!43554 (= res!113072 (= (size!2805 (buf!3198 thiss!1634)) (size!2805 (buf!3198 (_2!6234 lt!210775)))))))

(assert (=> d!43554 (= (isPrefixOf!0 thiss!1634 (_2!6234 lt!210775)) e!90233)))

(declare-fun b!135903 () Bool)

(declare-fun res!113071 () Bool)

(assert (=> b!135903 (=> (not res!113071) (not e!90233))))

(assert (=> b!135903 (= res!113071 (bvsle (bitIndex!0 (size!2805 (buf!3198 thiss!1634)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634)) (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!210775))) (currentByte!5995 (_2!6234 lt!210775)) (currentBit!5990 (_2!6234 lt!210775)))))))

(declare-fun b!135904 () Bool)

(declare-fun e!90232 () Bool)

(assert (=> b!135904 (= e!90233 e!90232)))

(declare-fun res!113070 () Bool)

(assert (=> b!135904 (=> res!113070 e!90232)))

(assert (=> b!135904 (= res!113070 (= (size!2805 (buf!3198 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!135905 () Bool)

(assert (=> b!135905 (= e!90232 (arrayBitRangesEq!0 (buf!3198 thiss!1634) (buf!3198 (_2!6234 lt!210775)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2805 (buf!3198 thiss!1634)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634))))))

(assert (= (and d!43554 res!113072) b!135903))

(assert (= (and b!135903 res!113071) b!135904))

(assert (= (and b!135904 (not res!113070)) b!135905))

(assert (=> b!135903 m!207287))

(assert (=> b!135903 m!207291))

(assert (=> b!135905 m!207287))

(assert (=> b!135905 m!207287))

(declare-fun m!207653 () Bool)

(assert (=> b!135905 m!207653))

(assert (=> b!135754 d!43554))

(declare-fun b!135916 () Bool)

(declare-fun lt!211186 () tuple2!11840)

(declare-fun e!90242 () Bool)

(assert (=> b!135916 (= e!90242 (arrayRangesEq!208 arr!237 (_2!6236 lt!211186) #b00000000000000000000000000000000 to!404))))

(declare-fun b!135917 () Bool)

(declare-fun e!90241 () Bool)

(assert (=> b!135917 (= e!90241 e!90242)))

(declare-fun res!113083 () Bool)

(assert (=> b!135917 (=> (not res!113083) (not e!90242))))

(declare-fun lt!211188 () tuple2!11842)

(assert (=> b!135917 (= res!113083 (and (= (size!2805 (_2!6236 lt!211186)) (size!2805 arr!237)) (= (_1!6236 lt!211186) (_2!6237 lt!211188))))))

(assert (=> b!135917 (= lt!211186 (readByteArrayLoopPure!0 (_1!6237 lt!211188) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!211190 () Unit!8448)

(declare-fun lt!211189 () Unit!8448)

(assert (=> b!135917 (= lt!211190 lt!211189)))

(declare-fun lt!211191 () tuple2!11836)

(declare-fun lt!211187 () (_ BitVec 64))

(assert (=> b!135917 (validate_offset_bits!1 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!211191)))) ((_ sign_extend 32) (currentByte!5995 (_2!6234 lt!210768))) ((_ sign_extend 32) (currentBit!5990 (_2!6234 lt!210768))) lt!211187)))

(assert (=> b!135917 (= lt!211189 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6234 lt!210768) (buf!3198 (_2!6234 lt!211191)) lt!211187))))

(declare-fun e!90240 () Bool)

(assert (=> b!135917 e!90240))

(declare-fun res!113087 () Bool)

(assert (=> b!135917 (=> (not res!113087) (not e!90240))))

(assert (=> b!135917 (= res!113087 (and (= (size!2805 (buf!3198 (_2!6234 lt!210768))) (size!2805 (buf!3198 (_2!6234 lt!211191)))) (bvsge lt!211187 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!135917 (= lt!211187 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!135917 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!135917 (= lt!211188 (reader!0 (_2!6234 lt!210768) (_2!6234 lt!211191)))))

(declare-fun b!135918 () Bool)

(declare-fun res!113084 () Bool)

(assert (=> b!135918 (=> (not res!113084) (not e!90241))))

(assert (=> b!135918 (= res!113084 (isPrefixOf!0 (_2!6234 lt!210768) (_2!6234 lt!211191)))))

(declare-fun d!43556 () Bool)

(assert (=> d!43556 e!90241))

(declare-fun res!113085 () Bool)

(assert (=> d!43556 (=> (not res!113085) (not e!90241))))

(assert (=> d!43556 (= res!113085 (= (size!2805 (buf!3198 (_2!6234 lt!210768))) (size!2805 (buf!3198 (_2!6234 lt!211191)))))))

(declare-fun choose!64 (BitStream!4874 array!6194 (_ BitVec 32) (_ BitVec 32)) tuple2!11836)

(assert (=> d!43556 (= lt!211191 (choose!64 (_2!6234 lt!210768) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!43556 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2805 arr!237)))))

(assert (=> d!43556 (= (appendByteArrayLoop!0 (_2!6234 lt!210768) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!211191)))

(declare-fun b!135919 () Bool)

(assert (=> b!135919 (= e!90240 (validate_offset_bits!1 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!210768)))) ((_ sign_extend 32) (currentByte!5995 (_2!6234 lt!210768))) ((_ sign_extend 32) (currentBit!5990 (_2!6234 lt!210768))) lt!211187))))

(declare-fun b!135920 () Bool)

(declare-fun res!113086 () Bool)

(assert (=> b!135920 (=> (not res!113086) (not e!90241))))

(declare-fun lt!211184 () (_ BitVec 64))

(declare-fun lt!211192 () (_ BitVec 64))

(assert (=> b!135920 (= res!113086 (= (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!211191))) (currentByte!5995 (_2!6234 lt!211191)) (currentBit!5990 (_2!6234 lt!211191))) (bvadd lt!211192 lt!211184)))))

(assert (=> b!135920 (or (not (= (bvand lt!211192 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!211184 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!211192 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!211192 lt!211184) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!211185 () (_ BitVec 64))

(assert (=> b!135920 (= lt!211184 (bvmul lt!211185 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!135920 (or (= lt!211185 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!211185 #b0000000000000000000000000000000000000000000000000000000000001000) lt!211185)))))

(assert (=> b!135920 (= lt!211185 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!135920 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!135920 (= lt!211192 (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!210768))) (currentByte!5995 (_2!6234 lt!210768)) (currentBit!5990 (_2!6234 lt!210768))))))

(assert (= (and d!43556 res!113085) b!135920))

(assert (= (and b!135920 res!113086) b!135918))

(assert (= (and b!135918 res!113084) b!135917))

(assert (= (and b!135917 res!113087) b!135919))

(assert (= (and b!135917 res!113083) b!135916))

(declare-fun m!207655 () Bool)

(assert (=> b!135919 m!207655))

(declare-fun m!207657 () Bool)

(assert (=> b!135916 m!207657))

(declare-fun m!207659 () Bool)

(assert (=> b!135918 m!207659))

(declare-fun m!207661 () Bool)

(assert (=> b!135917 m!207661))

(declare-fun m!207663 () Bool)

(assert (=> b!135917 m!207663))

(declare-fun m!207665 () Bool)

(assert (=> b!135917 m!207665))

(declare-fun m!207667 () Bool)

(assert (=> b!135917 m!207667))

(declare-fun m!207669 () Bool)

(assert (=> b!135920 m!207669))

(assert (=> b!135920 m!207285))

(declare-fun m!207671 () Bool)

(assert (=> d!43556 m!207671))

(assert (=> b!135754 d!43556))

(declare-fun d!43558 () Bool)

(declare-fun lt!211201 () tuple2!11840)

(declare-fun lt!211203 () tuple2!11840)

(assert (=> d!43558 (arrayRangesEq!208 (_2!6236 lt!211201) (_2!6236 lt!211203) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!211204 () Unit!8448)

(declare-fun lt!211202 () BitStream!4874)

(declare-fun choose!35 (BitStream!4874 array!6194 (_ BitVec 32) (_ BitVec 32) tuple2!11840 array!6194 BitStream!4874 tuple2!11840 array!6194) Unit!8448)

(assert (=> d!43558 (= lt!211204 (choose!35 (_1!6237 lt!210787) arr!237 from!447 to!404 lt!211201 (_2!6236 lt!211201) lt!211202 lt!211203 (_2!6236 lt!211203)))))

(assert (=> d!43558 (= lt!211203 (readByteArrayLoopPure!0 lt!211202 (array!6195 (store (arr!3470 arr!237) from!447 (_2!6235 (readBytePure!0 (_1!6237 lt!210787)))) (size!2805 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!43558 (= lt!211202 (withMovedByteIndex!0 (_1!6237 lt!210787) #b00000000000000000000000000000001))))

(assert (=> d!43558 (= lt!211201 (readByteArrayLoopPure!0 (_1!6237 lt!210787) arr!237 from!447 to!404))))

(assert (=> d!43558 (= (readByteArrayLoopArrayPrefixLemma!0 (_1!6237 lt!210787) arr!237 from!447 to!404) lt!211204)))

(declare-fun bs!10631 () Bool)

(assert (= bs!10631 d!43558))

(declare-fun m!207673 () Bool)

(assert (=> bs!10631 m!207673))

(declare-fun m!207675 () Bool)

(assert (=> bs!10631 m!207675))

(assert (=> bs!10631 m!207303))

(assert (=> bs!10631 m!207301))

(declare-fun m!207677 () Bool)

(assert (=> bs!10631 m!207677))

(assert (=> bs!10631 m!207327))

(declare-fun m!207679 () Bool)

(assert (=> bs!10631 m!207679))

(assert (=> b!135754 d!43558))

(declare-fun d!43560 () Bool)

(declare-fun e!90245 () Bool)

(assert (=> d!43560 e!90245))

(declare-fun res!113090 () Bool)

(assert (=> d!43560 (=> (not res!113090) (not e!90245))))

(assert (=> d!43560 (= res!113090 (and (or (let ((rhs!3134 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3134 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3134) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!43561 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!43561 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!43561 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3133 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3133 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3133) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!211212 () Unit!8448)

(declare-fun choose!57 (BitStream!4874 BitStream!4874 (_ BitVec 64) (_ BitVec 32)) Unit!8448)

(assert (=> d!43560 (= lt!211212 (choose!57 thiss!1634 (_2!6234 lt!210768) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!43560 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6234 lt!210768) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!211212)))

(declare-fun b!135923 () Bool)

(declare-fun lt!211211 () (_ BitVec 32))

(assert (=> b!135923 (= e!90245 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!210768)))) ((_ sign_extend 32) (currentByte!5995 (_2!6234 lt!210768))) ((_ sign_extend 32) (currentBit!5990 (_2!6234 lt!210768))) (bvsub (bvsub to!404 from!447) lt!211211)))))

(assert (=> b!135923 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!211211 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!211211) #b10000000000000000000000000000000)))))

(declare-fun lt!211213 () (_ BitVec 64))

(assert (=> b!135923 (= lt!211211 ((_ extract 31 0) lt!211213))))

(assert (=> b!135923 (and (bvslt lt!211213 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!211213 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!135923 (= lt!211213 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!43560 res!113090) b!135923))

(declare-fun m!207681 () Bool)

(assert (=> d!43560 m!207681))

(declare-fun m!207683 () Bool)

(assert (=> b!135923 m!207683))

(assert (=> b!135754 d!43560))

(declare-fun b!135924 () Bool)

(declare-fun res!113093 () Bool)

(declare-fun e!90247 () Bool)

(assert (=> b!135924 (=> (not res!113093) (not e!90247))))

(declare-fun lt!211216 () tuple2!11842)

(assert (=> b!135924 (= res!113093 (isPrefixOf!0 (_2!6237 lt!211216) (_2!6234 lt!210775)))))

(declare-fun d!43563 () Bool)

(assert (=> d!43563 e!90247))

(declare-fun res!113092 () Bool)

(assert (=> d!43563 (=> (not res!113092) (not e!90247))))

(assert (=> d!43563 (= res!113092 (isPrefixOf!0 (_1!6237 lt!211216) (_2!6237 lt!211216)))))

(declare-fun lt!211223 () BitStream!4874)

(assert (=> d!43563 (= lt!211216 (tuple2!11843 lt!211223 (_2!6234 lt!210775)))))

(declare-fun lt!211215 () Unit!8448)

(declare-fun lt!211220 () Unit!8448)

(assert (=> d!43563 (= lt!211215 lt!211220)))

(assert (=> d!43563 (isPrefixOf!0 lt!211223 (_2!6234 lt!210775))))

(assert (=> d!43563 (= lt!211220 (lemmaIsPrefixTransitive!0 lt!211223 (_2!6234 lt!210775) (_2!6234 lt!210775)))))

(declare-fun lt!211228 () Unit!8448)

(declare-fun lt!211227 () Unit!8448)

(assert (=> d!43563 (= lt!211228 lt!211227)))

(assert (=> d!43563 (isPrefixOf!0 lt!211223 (_2!6234 lt!210775))))

(assert (=> d!43563 (= lt!211227 (lemmaIsPrefixTransitive!0 lt!211223 thiss!1634 (_2!6234 lt!210775)))))

(declare-fun lt!211230 () Unit!8448)

(declare-fun e!90246 () Unit!8448)

(assert (=> d!43563 (= lt!211230 e!90246)))

(declare-fun c!7687 () Bool)

(assert (=> d!43563 (= c!7687 (not (= (size!2805 (buf!3198 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!211232 () Unit!8448)

(declare-fun lt!211219 () Unit!8448)

(assert (=> d!43563 (= lt!211232 lt!211219)))

(assert (=> d!43563 (isPrefixOf!0 (_2!6234 lt!210775) (_2!6234 lt!210775))))

(assert (=> d!43563 (= lt!211219 (lemmaIsPrefixRefl!0 (_2!6234 lt!210775)))))

(declare-fun lt!211221 () Unit!8448)

(declare-fun lt!211233 () Unit!8448)

(assert (=> d!43563 (= lt!211221 lt!211233)))

(assert (=> d!43563 (= lt!211233 (lemmaIsPrefixRefl!0 (_2!6234 lt!210775)))))

(declare-fun lt!211214 () Unit!8448)

(declare-fun lt!211224 () Unit!8448)

(assert (=> d!43563 (= lt!211214 lt!211224)))

(assert (=> d!43563 (isPrefixOf!0 lt!211223 lt!211223)))

(assert (=> d!43563 (= lt!211224 (lemmaIsPrefixRefl!0 lt!211223))))

(declare-fun lt!211229 () Unit!8448)

(declare-fun lt!211218 () Unit!8448)

(assert (=> d!43563 (= lt!211229 lt!211218)))

(assert (=> d!43563 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!43563 (= lt!211218 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!43563 (= lt!211223 (BitStream!4875 (buf!3198 (_2!6234 lt!210775)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634)))))

(assert (=> d!43563 (isPrefixOf!0 thiss!1634 (_2!6234 lt!210775))))

(assert (=> d!43563 (= (reader!0 thiss!1634 (_2!6234 lt!210775)) lt!211216)))

(declare-fun lt!211222 () (_ BitVec 64))

(declare-fun lt!211217 () (_ BitVec 64))

(declare-fun b!135925 () Bool)

(assert (=> b!135925 (= e!90247 (= (_1!6237 lt!211216) (withMovedBitIndex!0 (_2!6237 lt!211216) (bvsub lt!211222 lt!211217))))))

(assert (=> b!135925 (or (= (bvand lt!211222 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!211217 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!211222 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!211222 lt!211217) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!135925 (= lt!211217 (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!210775))) (currentByte!5995 (_2!6234 lt!210775)) (currentBit!5990 (_2!6234 lt!210775))))))

(assert (=> b!135925 (= lt!211222 (bitIndex!0 (size!2805 (buf!3198 thiss!1634)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634)))))

(declare-fun b!135926 () Bool)

(declare-fun lt!211225 () Unit!8448)

(assert (=> b!135926 (= e!90246 lt!211225)))

(declare-fun lt!211231 () (_ BitVec 64))

(assert (=> b!135926 (= lt!211231 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!211226 () (_ BitVec 64))

(assert (=> b!135926 (= lt!211226 (bitIndex!0 (size!2805 (buf!3198 thiss!1634)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634)))))

(assert (=> b!135926 (= lt!211225 (arrayBitRangesEqSymmetric!0 (buf!3198 thiss!1634) (buf!3198 (_2!6234 lt!210775)) lt!211231 lt!211226))))

(assert (=> b!135926 (arrayBitRangesEq!0 (buf!3198 (_2!6234 lt!210775)) (buf!3198 thiss!1634) lt!211231 lt!211226)))

(declare-fun b!135927 () Bool)

(declare-fun res!113091 () Bool)

(assert (=> b!135927 (=> (not res!113091) (not e!90247))))

(assert (=> b!135927 (= res!113091 (isPrefixOf!0 (_1!6237 lt!211216) thiss!1634))))

(declare-fun b!135928 () Bool)

(declare-fun Unit!8454 () Unit!8448)

(assert (=> b!135928 (= e!90246 Unit!8454)))

(assert (= (and d!43563 c!7687) b!135926))

(assert (= (and d!43563 (not c!7687)) b!135928))

(assert (= (and d!43563 res!113092) b!135927))

(assert (= (and b!135927 res!113091) b!135924))

(assert (= (and b!135924 res!113093) b!135925))

(declare-fun m!207685 () Bool)

(assert (=> b!135925 m!207685))

(assert (=> b!135925 m!207291))

(assert (=> b!135925 m!207287))

(declare-fun m!207687 () Bool)

(assert (=> b!135924 m!207687))

(declare-fun m!207689 () Bool)

(assert (=> d!43563 m!207689))

(declare-fun m!207691 () Bool)

(assert (=> d!43563 m!207691))

(declare-fun m!207693 () Bool)

(assert (=> d!43563 m!207693))

(declare-fun m!207695 () Bool)

(assert (=> d!43563 m!207695))

(assert (=> d!43563 m!207309))

(assert (=> d!43563 m!207599))

(declare-fun m!207697 () Bool)

(assert (=> d!43563 m!207697))

(assert (=> d!43563 m!207603))

(declare-fun m!207699 () Bool)

(assert (=> d!43563 m!207699))

(declare-fun m!207701 () Bool)

(assert (=> d!43563 m!207701))

(declare-fun m!207703 () Bool)

(assert (=> d!43563 m!207703))

(declare-fun m!207705 () Bool)

(assert (=> b!135927 m!207705))

(assert (=> b!135926 m!207287))

(declare-fun m!207707 () Bool)

(assert (=> b!135926 m!207707))

(declare-fun m!207709 () Bool)

(assert (=> b!135926 m!207709))

(assert (=> b!135754 d!43563))

(declare-fun d!43565 () Bool)

(declare-fun lt!211234 () tuple3!516)

(assert (=> d!43565 (= lt!211234 (readByteArrayLoop!0 (_1!6237 lt!210790) lt!210781 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!43565 (= (readByteArrayLoopPure!0 (_1!6237 lt!210790) lt!210781 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11841 (_2!6241 lt!211234) (_3!317 lt!211234)))))

(declare-fun bs!10632 () Bool)

(assert (= bs!10632 d!43565))

(declare-fun m!207711 () Bool)

(assert (=> bs!10632 m!207711))

(assert (=> b!135754 d!43565))

(declare-fun d!43567 () Bool)

(assert (=> d!43567 (= (invariant!0 (currentBit!5990 thiss!1634) (currentByte!5995 thiss!1634) (size!2805 (buf!3198 (_2!6234 lt!210768)))) (and (bvsge (currentBit!5990 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5990 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5995 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5995 thiss!1634) (size!2805 (buf!3198 (_2!6234 lt!210768)))) (and (= (currentBit!5990 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5995 thiss!1634) (size!2805 (buf!3198 (_2!6234 lt!210768))))))))))

(assert (=> b!135743 d!43567))

(declare-fun d!43569 () Bool)

(assert (=> d!43569 (= (invariant!0 (currentBit!5990 thiss!1634) (currentByte!5995 thiss!1634) (size!2805 (buf!3198 thiss!1634))) (and (bvsge (currentBit!5990 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5990 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5995 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5995 thiss!1634) (size!2805 (buf!3198 thiss!1634))) (and (= (currentBit!5990 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5995 thiss!1634) (size!2805 (buf!3198 thiss!1634)))))))))

(assert (=> b!135742 d!43569))

(declare-fun d!43571 () Bool)

(declare-fun lt!211235 () tuple2!11846)

(assert (=> d!43571 (= lt!211235 (readByte!0 (_1!6237 lt!210782)))))

(assert (=> d!43571 (= (readBytePure!0 (_1!6237 lt!210782)) (tuple2!11839 (_2!6240 lt!211235) (_1!6240 lt!211235)))))

(declare-fun bs!10633 () Bool)

(assert (= bs!10633 d!43571))

(declare-fun m!207713 () Bool)

(assert (=> bs!10633 m!207713))

(assert (=> b!135753 d!43571))

(declare-fun b!135929 () Bool)

(declare-fun res!113096 () Bool)

(declare-fun e!90249 () Bool)

(assert (=> b!135929 (=> (not res!113096) (not e!90249))))

(declare-fun lt!211238 () tuple2!11842)

(assert (=> b!135929 (= res!113096 (isPrefixOf!0 (_2!6237 lt!211238) (_2!6234 lt!210768)))))

(declare-fun d!43573 () Bool)

(assert (=> d!43573 e!90249))

(declare-fun res!113095 () Bool)

(assert (=> d!43573 (=> (not res!113095) (not e!90249))))

(assert (=> d!43573 (= res!113095 (isPrefixOf!0 (_1!6237 lt!211238) (_2!6237 lt!211238)))))

(declare-fun lt!211245 () BitStream!4874)

(assert (=> d!43573 (= lt!211238 (tuple2!11843 lt!211245 (_2!6234 lt!210768)))))

(declare-fun lt!211237 () Unit!8448)

(declare-fun lt!211242 () Unit!8448)

(assert (=> d!43573 (= lt!211237 lt!211242)))

(assert (=> d!43573 (isPrefixOf!0 lt!211245 (_2!6234 lt!210768))))

(assert (=> d!43573 (= lt!211242 (lemmaIsPrefixTransitive!0 lt!211245 (_2!6234 lt!210768) (_2!6234 lt!210768)))))

(declare-fun lt!211250 () Unit!8448)

(declare-fun lt!211249 () Unit!8448)

(assert (=> d!43573 (= lt!211250 lt!211249)))

(assert (=> d!43573 (isPrefixOf!0 lt!211245 (_2!6234 lt!210768))))

(assert (=> d!43573 (= lt!211249 (lemmaIsPrefixTransitive!0 lt!211245 thiss!1634 (_2!6234 lt!210768)))))

(declare-fun lt!211252 () Unit!8448)

(declare-fun e!90248 () Unit!8448)

(assert (=> d!43573 (= lt!211252 e!90248)))

(declare-fun c!7688 () Bool)

(assert (=> d!43573 (= c!7688 (not (= (size!2805 (buf!3198 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!211254 () Unit!8448)

(declare-fun lt!211241 () Unit!8448)

(assert (=> d!43573 (= lt!211254 lt!211241)))

(assert (=> d!43573 (isPrefixOf!0 (_2!6234 lt!210768) (_2!6234 lt!210768))))

(assert (=> d!43573 (= lt!211241 (lemmaIsPrefixRefl!0 (_2!6234 lt!210768)))))

(declare-fun lt!211243 () Unit!8448)

(declare-fun lt!211255 () Unit!8448)

(assert (=> d!43573 (= lt!211243 lt!211255)))

(assert (=> d!43573 (= lt!211255 (lemmaIsPrefixRefl!0 (_2!6234 lt!210768)))))

(declare-fun lt!211236 () Unit!8448)

(declare-fun lt!211246 () Unit!8448)

(assert (=> d!43573 (= lt!211236 lt!211246)))

(assert (=> d!43573 (isPrefixOf!0 lt!211245 lt!211245)))

(assert (=> d!43573 (= lt!211246 (lemmaIsPrefixRefl!0 lt!211245))))

(declare-fun lt!211251 () Unit!8448)

(declare-fun lt!211240 () Unit!8448)

(assert (=> d!43573 (= lt!211251 lt!211240)))

(assert (=> d!43573 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!43573 (= lt!211240 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!43573 (= lt!211245 (BitStream!4875 (buf!3198 (_2!6234 lt!210768)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634)))))

(assert (=> d!43573 (isPrefixOf!0 thiss!1634 (_2!6234 lt!210768))))

(assert (=> d!43573 (= (reader!0 thiss!1634 (_2!6234 lt!210768)) lt!211238)))

(declare-fun lt!211239 () (_ BitVec 64))

(declare-fun lt!211244 () (_ BitVec 64))

(declare-fun b!135930 () Bool)

(assert (=> b!135930 (= e!90249 (= (_1!6237 lt!211238) (withMovedBitIndex!0 (_2!6237 lt!211238) (bvsub lt!211244 lt!211239))))))

(assert (=> b!135930 (or (= (bvand lt!211244 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!211239 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!211244 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!211244 lt!211239) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!135930 (= lt!211239 (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!210768))) (currentByte!5995 (_2!6234 lt!210768)) (currentBit!5990 (_2!6234 lt!210768))))))

(assert (=> b!135930 (= lt!211244 (bitIndex!0 (size!2805 (buf!3198 thiss!1634)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634)))))

(declare-fun b!135931 () Bool)

(declare-fun lt!211247 () Unit!8448)

(assert (=> b!135931 (= e!90248 lt!211247)))

(declare-fun lt!211253 () (_ BitVec 64))

(assert (=> b!135931 (= lt!211253 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!211248 () (_ BitVec 64))

(assert (=> b!135931 (= lt!211248 (bitIndex!0 (size!2805 (buf!3198 thiss!1634)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634)))))

(assert (=> b!135931 (= lt!211247 (arrayBitRangesEqSymmetric!0 (buf!3198 thiss!1634) (buf!3198 (_2!6234 lt!210768)) lt!211253 lt!211248))))

(assert (=> b!135931 (arrayBitRangesEq!0 (buf!3198 (_2!6234 lt!210768)) (buf!3198 thiss!1634) lt!211253 lt!211248)))

(declare-fun b!135932 () Bool)

(declare-fun res!113094 () Bool)

(assert (=> b!135932 (=> (not res!113094) (not e!90249))))

(assert (=> b!135932 (= res!113094 (isPrefixOf!0 (_1!6237 lt!211238) thiss!1634))))

(declare-fun b!135933 () Bool)

(declare-fun Unit!8455 () Unit!8448)

(assert (=> b!135933 (= e!90248 Unit!8455)))

(assert (= (and d!43573 c!7688) b!135931))

(assert (= (and d!43573 (not c!7688)) b!135933))

(assert (= (and d!43573 res!113095) b!135932))

(assert (= (and b!135932 res!113094) b!135929))

(assert (= (and b!135929 res!113096) b!135930))

(declare-fun m!207715 () Bool)

(assert (=> b!135930 m!207715))

(assert (=> b!135930 m!207285))

(assert (=> b!135930 m!207287))

(declare-fun m!207717 () Bool)

(assert (=> b!135929 m!207717))

(declare-fun m!207719 () Bool)

(assert (=> d!43573 m!207719))

(declare-fun m!207721 () Bool)

(assert (=> d!43573 m!207721))

(declare-fun m!207723 () Bool)

(assert (=> d!43573 m!207723))

(assert (=> d!43573 m!207695))

(assert (=> d!43573 m!207353))

(assert (=> d!43573 m!207605))

(declare-fun m!207725 () Bool)

(assert (=> d!43573 m!207725))

(assert (=> d!43573 m!207597))

(assert (=> d!43573 m!207699))

(declare-fun m!207727 () Bool)

(assert (=> d!43573 m!207727))

(declare-fun m!207729 () Bool)

(assert (=> d!43573 m!207729))

(declare-fun m!207731 () Bool)

(assert (=> b!135932 m!207731))

(assert (=> b!135931 m!207287))

(declare-fun m!207733 () Bool)

(assert (=> b!135931 m!207733))

(declare-fun m!207735 () Bool)

(assert (=> b!135931 m!207735))

(assert (=> b!135753 d!43573))

(declare-fun d!43575 () Bool)

(declare-fun lt!211256 () tuple3!516)

(assert (=> d!43575 (= lt!211256 (readByteArrayLoop!0 (_1!6237 lt!210793) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!43575 (= (readByteArrayLoopPure!0 (_1!6237 lt!210793) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11841 (_2!6241 lt!211256) (_3!317 lt!211256)))))

(declare-fun bs!10634 () Bool)

(assert (= bs!10634 d!43575))

(declare-fun m!207737 () Bool)

(assert (=> bs!10634 m!207737))

(assert (=> b!135752 d!43575))

(declare-fun d!43577 () Bool)

(assert (=> d!43577 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!210775)))) ((_ sign_extend 32) (currentByte!5995 (_2!6234 lt!210768))) ((_ sign_extend 32) (currentBit!5990 (_2!6234 lt!210768))) lt!210778) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!210775)))) ((_ sign_extend 32) (currentByte!5995 (_2!6234 lt!210768))) ((_ sign_extend 32) (currentBit!5990 (_2!6234 lt!210768)))) lt!210778))))

(declare-fun bs!10635 () Bool)

(assert (= bs!10635 d!43577))

(assert (=> bs!10635 m!207541))

(assert (=> b!135752 d!43577))

(declare-fun d!43579 () Bool)

(assert (=> d!43579 (validate_offset_bits!1 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!210775)))) ((_ sign_extend 32) (currentByte!5995 (_2!6234 lt!210768))) ((_ sign_extend 32) (currentBit!5990 (_2!6234 lt!210768))) lt!210778)))

(declare-fun lt!211259 () Unit!8448)

(declare-fun choose!9 (BitStream!4874 array!6194 (_ BitVec 64) BitStream!4874) Unit!8448)

(assert (=> d!43579 (= lt!211259 (choose!9 (_2!6234 lt!210768) (buf!3198 (_2!6234 lt!210775)) lt!210778 (BitStream!4875 (buf!3198 (_2!6234 lt!210775)) (currentByte!5995 (_2!6234 lt!210768)) (currentBit!5990 (_2!6234 lt!210768)))))))

(assert (=> d!43579 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6234 lt!210768) (buf!3198 (_2!6234 lt!210775)) lt!210778) lt!211259)))

(declare-fun bs!10636 () Bool)

(assert (= bs!10636 d!43579))

(assert (=> bs!10636 m!207349))

(declare-fun m!207739 () Bool)

(assert (=> bs!10636 m!207739))

(assert (=> b!135752 d!43579))

(assert (=> b!135752 d!43528))

(declare-fun d!43581 () Bool)

(assert (=> d!43581 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2805 (buf!3198 thiss!1634))) ((_ sign_extend 32) (currentByte!5995 thiss!1634)) ((_ sign_extend 32) (currentBit!5990 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2805 (buf!3198 thiss!1634))) ((_ sign_extend 32) (currentByte!5995 thiss!1634)) ((_ sign_extend 32) (currentBit!5990 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10637 () Bool)

(assert (= bs!10637 d!43581))

(declare-fun m!207741 () Bool)

(assert (=> bs!10637 m!207741))

(assert (=> b!135746 d!43581))

(declare-fun d!43583 () Bool)

(declare-fun res!113099 () Bool)

(declare-fun e!90251 () Bool)

(assert (=> d!43583 (=> (not res!113099) (not e!90251))))

(assert (=> d!43583 (= res!113099 (= (size!2805 (buf!3198 (_2!6234 lt!210768))) (size!2805 (buf!3198 (_2!6234 lt!210775)))))))

(assert (=> d!43583 (= (isPrefixOf!0 (_2!6234 lt!210768) (_2!6234 lt!210775)) e!90251)))

(declare-fun b!135934 () Bool)

(declare-fun res!113098 () Bool)

(assert (=> b!135934 (=> (not res!113098) (not e!90251))))

(assert (=> b!135934 (= res!113098 (bvsle (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!210768))) (currentByte!5995 (_2!6234 lt!210768)) (currentBit!5990 (_2!6234 lt!210768))) (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!210775))) (currentByte!5995 (_2!6234 lt!210775)) (currentBit!5990 (_2!6234 lt!210775)))))))

(declare-fun b!135935 () Bool)

(declare-fun e!90250 () Bool)

(assert (=> b!135935 (= e!90251 e!90250)))

(declare-fun res!113097 () Bool)

(assert (=> b!135935 (=> res!113097 e!90250)))

(assert (=> b!135935 (= res!113097 (= (size!2805 (buf!3198 (_2!6234 lt!210768))) #b00000000000000000000000000000000))))

(declare-fun b!135936 () Bool)

(assert (=> b!135936 (= e!90250 (arrayBitRangesEq!0 (buf!3198 (_2!6234 lt!210768)) (buf!3198 (_2!6234 lt!210775)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!210768))) (currentByte!5995 (_2!6234 lt!210768)) (currentBit!5990 (_2!6234 lt!210768)))))))

(assert (= (and d!43583 res!113099) b!135934))

(assert (= (and b!135934 res!113098) b!135935))

(assert (= (and b!135935 (not res!113097)) b!135936))

(assert (=> b!135934 m!207285))

(assert (=> b!135934 m!207291))

(assert (=> b!135936 m!207285))

(assert (=> b!135936 m!207285))

(declare-fun m!207743 () Bool)

(assert (=> b!135936 m!207743))

(assert (=> b!135745 d!43583))

(declare-fun d!43585 () Bool)

(assert (=> d!43585 (= (array_inv!2594 arr!237) (bvsge (size!2805 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!26394 d!43585))

(declare-fun d!43587 () Bool)

(assert (=> d!43587 (= (inv!12 thiss!1634) (invariant!0 (currentBit!5990 thiss!1634) (currentByte!5995 thiss!1634) (size!2805 (buf!3198 thiss!1634))))))

(declare-fun bs!10638 () Bool)

(assert (= bs!10638 d!43587))

(assert (=> bs!10638 m!207263))

(assert (=> start!26394 d!43587))

(declare-fun d!43589 () Bool)

(declare-fun e!90252 () Bool)

(assert (=> d!43589 e!90252))

(declare-fun res!113101 () Bool)

(assert (=> d!43589 (=> (not res!113101) (not e!90252))))

(declare-fun lt!211260 () (_ BitVec 64))

(declare-fun lt!211263 () (_ BitVec 64))

(declare-fun lt!211262 () (_ BitVec 64))

(assert (=> d!43589 (= res!113101 (= lt!211262 (bvsub lt!211263 lt!211260)))))

(assert (=> d!43589 (or (= (bvand lt!211263 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!211260 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!211263 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!211263 lt!211260) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!43589 (= lt!211260 (remainingBits!0 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!210768)))) ((_ sign_extend 32) (currentByte!5995 (_2!6234 lt!210768))) ((_ sign_extend 32) (currentBit!5990 (_2!6234 lt!210768)))))))

(declare-fun lt!211265 () (_ BitVec 64))

(declare-fun lt!211261 () (_ BitVec 64))

(assert (=> d!43589 (= lt!211263 (bvmul lt!211265 lt!211261))))

(assert (=> d!43589 (or (= lt!211265 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!211261 (bvsdiv (bvmul lt!211265 lt!211261) lt!211265)))))

(assert (=> d!43589 (= lt!211261 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!43589 (= lt!211265 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!210768)))))))

(assert (=> d!43589 (= lt!211262 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5995 (_2!6234 lt!210768))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5990 (_2!6234 lt!210768)))))))

(assert (=> d!43589 (invariant!0 (currentBit!5990 (_2!6234 lt!210768)) (currentByte!5995 (_2!6234 lt!210768)) (size!2805 (buf!3198 (_2!6234 lt!210768))))))

(assert (=> d!43589 (= (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!210768))) (currentByte!5995 (_2!6234 lt!210768)) (currentBit!5990 (_2!6234 lt!210768))) lt!211262)))

(declare-fun b!135937 () Bool)

(declare-fun res!113100 () Bool)

(assert (=> b!135937 (=> (not res!113100) (not e!90252))))

(assert (=> b!135937 (= res!113100 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!211262))))

(declare-fun b!135938 () Bool)

(declare-fun lt!211264 () (_ BitVec 64))

(assert (=> b!135938 (= e!90252 (bvsle lt!211262 (bvmul lt!211264 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!135938 (or (= lt!211264 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!211264 #b0000000000000000000000000000000000000000000000000000000000001000) lt!211264)))))

(assert (=> b!135938 (= lt!211264 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!210768)))))))

(assert (= (and d!43589 res!113101) b!135937))

(assert (= (and b!135937 res!113100) b!135938))

(assert (=> d!43589 m!207647))

(declare-fun m!207745 () Bool)

(assert (=> d!43589 m!207745))

(assert (=> b!135744 d!43589))

(declare-fun d!43591 () Bool)

(declare-fun e!90253 () Bool)

(assert (=> d!43591 e!90253))

(declare-fun res!113103 () Bool)

(assert (=> d!43591 (=> (not res!113103) (not e!90253))))

(declare-fun lt!211268 () (_ BitVec 64))

(declare-fun lt!211266 () (_ BitVec 64))

(declare-fun lt!211269 () (_ BitVec 64))

(assert (=> d!43591 (= res!113103 (= lt!211268 (bvsub lt!211269 lt!211266)))))

(assert (=> d!43591 (or (= (bvand lt!211269 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!211266 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!211269 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!211269 lt!211266) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!43591 (= lt!211266 (remainingBits!0 ((_ sign_extend 32) (size!2805 (buf!3198 thiss!1634))) ((_ sign_extend 32) (currentByte!5995 thiss!1634)) ((_ sign_extend 32) (currentBit!5990 thiss!1634))))))

(declare-fun lt!211271 () (_ BitVec 64))

(declare-fun lt!211267 () (_ BitVec 64))

(assert (=> d!43591 (= lt!211269 (bvmul lt!211271 lt!211267))))

(assert (=> d!43591 (or (= lt!211271 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!211267 (bvsdiv (bvmul lt!211271 lt!211267) lt!211271)))))

(assert (=> d!43591 (= lt!211267 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!43591 (= lt!211271 ((_ sign_extend 32) (size!2805 (buf!3198 thiss!1634))))))

(assert (=> d!43591 (= lt!211268 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5995 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5990 thiss!1634))))))

(assert (=> d!43591 (invariant!0 (currentBit!5990 thiss!1634) (currentByte!5995 thiss!1634) (size!2805 (buf!3198 thiss!1634)))))

(assert (=> d!43591 (= (bitIndex!0 (size!2805 (buf!3198 thiss!1634)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634)) lt!211268)))

(declare-fun b!135939 () Bool)

(declare-fun res!113102 () Bool)

(assert (=> b!135939 (=> (not res!113102) (not e!90253))))

(assert (=> b!135939 (= res!113102 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!211268))))

(declare-fun b!135940 () Bool)

(declare-fun lt!211270 () (_ BitVec 64))

(assert (=> b!135940 (= e!90253 (bvsle lt!211268 (bvmul lt!211270 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!135940 (or (= lt!211270 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!211270 #b0000000000000000000000000000000000000000000000000000000000001000) lt!211270)))))

(assert (=> b!135940 (= lt!211270 ((_ sign_extend 32) (size!2805 (buf!3198 thiss!1634))))))

(assert (= (and d!43591 res!113103) b!135939))

(assert (= (and b!135939 res!113102) b!135940))

(assert (=> d!43591 m!207741))

(assert (=> d!43591 m!207263))

(assert (=> b!135744 d!43591))

(declare-fun d!43593 () Bool)

(declare-fun e!90254 () Bool)

(assert (=> d!43593 e!90254))

(declare-fun res!113105 () Bool)

(assert (=> d!43593 (=> (not res!113105) (not e!90254))))

(declare-fun lt!211272 () (_ BitVec 64))

(declare-fun lt!211275 () (_ BitVec 64))

(declare-fun lt!211274 () (_ BitVec 64))

(assert (=> d!43593 (= res!113105 (= lt!211274 (bvsub lt!211275 lt!211272)))))

(assert (=> d!43593 (or (= (bvand lt!211275 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!211272 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!211275 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!211275 lt!211272) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!43593 (= lt!211272 (remainingBits!0 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!210775)))) ((_ sign_extend 32) (currentByte!5995 (_2!6234 lt!210775))) ((_ sign_extend 32) (currentBit!5990 (_2!6234 lt!210775)))))))

(declare-fun lt!211277 () (_ BitVec 64))

(declare-fun lt!211273 () (_ BitVec 64))

(assert (=> d!43593 (= lt!211275 (bvmul lt!211277 lt!211273))))

(assert (=> d!43593 (or (= lt!211277 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!211273 (bvsdiv (bvmul lt!211277 lt!211273) lt!211277)))))

(assert (=> d!43593 (= lt!211273 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!43593 (= lt!211277 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!210775)))))))

(assert (=> d!43593 (= lt!211274 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5995 (_2!6234 lt!210775))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5990 (_2!6234 lt!210775)))))))

(assert (=> d!43593 (invariant!0 (currentBit!5990 (_2!6234 lt!210775)) (currentByte!5995 (_2!6234 lt!210775)) (size!2805 (buf!3198 (_2!6234 lt!210775))))))

(assert (=> d!43593 (= (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!210775))) (currentByte!5995 (_2!6234 lt!210775)) (currentBit!5990 (_2!6234 lt!210775))) lt!211274)))

(declare-fun b!135941 () Bool)

(declare-fun res!113104 () Bool)

(assert (=> b!135941 (=> (not res!113104) (not e!90254))))

(assert (=> b!135941 (= res!113104 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!211274))))

(declare-fun b!135942 () Bool)

(declare-fun lt!211276 () (_ BitVec 64))

(assert (=> b!135942 (= e!90254 (bvsle lt!211274 (bvmul lt!211276 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!135942 (or (= lt!211276 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!211276 #b0000000000000000000000000000000000000000000000000000000000001000) lt!211276)))))

(assert (=> b!135942 (= lt!211276 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!210775)))))))

(assert (= (and d!43593 res!113105) b!135941))

(assert (= (and b!135941 res!113104) b!135942))

(declare-fun m!207747 () Bool)

(assert (=> d!43593 m!207747))

(declare-fun m!207749 () Bool)

(assert (=> d!43593 m!207749))

(assert (=> b!135749 d!43593))

(assert (=> b!135749 d!43589))

(declare-fun d!43595 () Bool)

(declare-fun res!113108 () Bool)

(declare-fun e!90256 () Bool)

(assert (=> d!43595 (=> (not res!113108) (not e!90256))))

(assert (=> d!43595 (= res!113108 (= (size!2805 (buf!3198 thiss!1634)) (size!2805 (buf!3198 (_2!6234 lt!210768)))))))

(assert (=> d!43595 (= (isPrefixOf!0 thiss!1634 (_2!6234 lt!210768)) e!90256)))

(declare-fun b!135943 () Bool)

(declare-fun res!113107 () Bool)

(assert (=> b!135943 (=> (not res!113107) (not e!90256))))

(assert (=> b!135943 (= res!113107 (bvsle (bitIndex!0 (size!2805 (buf!3198 thiss!1634)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634)) (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!210768))) (currentByte!5995 (_2!6234 lt!210768)) (currentBit!5990 (_2!6234 lt!210768)))))))

(declare-fun b!135944 () Bool)

(declare-fun e!90255 () Bool)

(assert (=> b!135944 (= e!90256 e!90255)))

(declare-fun res!113106 () Bool)

(assert (=> b!135944 (=> res!113106 e!90255)))

(assert (=> b!135944 (= res!113106 (= (size!2805 (buf!3198 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!135945 () Bool)

(assert (=> b!135945 (= e!90255 (arrayBitRangesEq!0 (buf!3198 thiss!1634) (buf!3198 (_2!6234 lt!210768)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2805 (buf!3198 thiss!1634)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634))))))

(assert (= (and d!43595 res!113108) b!135943))

(assert (= (and b!135943 res!113107) b!135944))

(assert (= (and b!135944 (not res!113106)) b!135945))

(assert (=> b!135943 m!207287))

(assert (=> b!135943 m!207285))

(assert (=> b!135945 m!207287))

(assert (=> b!135945 m!207287))

(declare-fun m!207751 () Bool)

(assert (=> b!135945 m!207751))

(assert (=> b!135748 d!43595))

(declare-fun d!43597 () Bool)

(assert (=> d!43597 (= (array_inv!2594 (buf!3198 thiss!1634)) (bvsge (size!2805 (buf!3198 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!135741 d!43597))

(declare-fun d!43599 () Bool)

(declare-fun res!113109 () Bool)

(declare-fun e!90257 () Bool)

(assert (=> d!43599 (=> res!113109 e!90257)))

(assert (=> d!43599 (= res!113109 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!43599 (= (arrayRangesEq!208 arr!237 (_2!6236 lt!210789) #b00000000000000000000000000000000 to!404) e!90257)))

(declare-fun b!135946 () Bool)

(declare-fun e!90258 () Bool)

(assert (=> b!135946 (= e!90257 e!90258)))

(declare-fun res!113110 () Bool)

(assert (=> b!135946 (=> (not res!113110) (not e!90258))))

(assert (=> b!135946 (= res!113110 (= (select (arr!3470 arr!237) #b00000000000000000000000000000000) (select (arr!3470 (_2!6236 lt!210789)) #b00000000000000000000000000000000)))))

(declare-fun b!135947 () Bool)

(assert (=> b!135947 (= e!90258 (arrayRangesEq!208 arr!237 (_2!6236 lt!210789) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!43599 (not res!113109)) b!135946))

(assert (= (and b!135946 res!113110) b!135947))

(declare-fun m!207753 () Bool)

(assert (=> b!135946 m!207753))

(declare-fun m!207755 () Bool)

(assert (=> b!135946 m!207755))

(declare-fun m!207757 () Bool)

(assert (=> b!135947 m!207757))

(assert (=> b!135751 d!43599))

(declare-fun d!43601 () Bool)

(declare-fun res!113111 () Bool)

(declare-fun e!90259 () Bool)

(assert (=> d!43601 (=> res!113111 e!90259)))

(assert (=> d!43601 (= res!113111 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!43601 (= (arrayRangesEq!208 arr!237 (_2!6236 lt!210791) #b00000000000000000000000000000000 to!404) e!90259)))

(declare-fun b!135948 () Bool)

(declare-fun e!90260 () Bool)

(assert (=> b!135948 (= e!90259 e!90260)))

(declare-fun res!113112 () Bool)

(assert (=> b!135948 (=> (not res!113112) (not e!90260))))

(assert (=> b!135948 (= res!113112 (= (select (arr!3470 arr!237) #b00000000000000000000000000000000) (select (arr!3470 (_2!6236 lt!210791)) #b00000000000000000000000000000000)))))

(declare-fun b!135949 () Bool)

(assert (=> b!135949 (= e!90260 (arrayRangesEq!208 arr!237 (_2!6236 lt!210791) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!43601 (not res!113111)) b!135948))

(assert (= (and b!135948 res!113112) b!135949))

(assert (=> b!135948 m!207753))

(assert (=> b!135948 m!207573))

(declare-fun m!207759 () Bool)

(assert (=> b!135949 m!207759))

(assert (=> b!135750 d!43601))

(declare-fun d!43603 () Bool)

(assert (=> d!43603 (arrayRangesEq!208 arr!237 (_2!6236 lt!210791) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!211280 () Unit!8448)

(declare-fun choose!69 (array!6194 array!6194 array!6194 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8448)

(assert (=> d!43603 (= lt!211280 (choose!69 arr!237 (_2!6236 lt!210780) (_2!6236 lt!210791) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> d!43603 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 to!404) (bvsle to!404 to!404))))

(assert (=> d!43603 (= (arrayRangesEqTransitive!10 arr!237 (_2!6236 lt!210780) (_2!6236 lt!210791) #b00000000000000000000000000000000 to!404 to!404) lt!211280)))

(declare-fun bs!10639 () Bool)

(assert (= bs!10639 d!43603))

(assert (=> bs!10639 m!207277))

(declare-fun m!207761 () Bool)

(assert (=> bs!10639 m!207761))

(assert (=> b!135750 d!43603))

(declare-fun d!43605 () Bool)

(declare-fun res!113113 () Bool)

(declare-fun e!90261 () Bool)

(assert (=> d!43605 (=> res!113113 e!90261)))

(assert (=> d!43605 (= res!113113 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!43605 (= (arrayRangesEq!208 (_2!6236 lt!210780) (_2!6236 lt!210791) #b00000000000000000000000000000000 to!404) e!90261)))

(declare-fun b!135950 () Bool)

(declare-fun e!90262 () Bool)

(assert (=> b!135950 (= e!90261 e!90262)))

(declare-fun res!113114 () Bool)

(assert (=> b!135950 (=> (not res!113114) (not e!90262))))

(assert (=> b!135950 (= res!113114 (= (select (arr!3470 (_2!6236 lt!210780)) #b00000000000000000000000000000000) (select (arr!3470 (_2!6236 lt!210791)) #b00000000000000000000000000000000)))))

(declare-fun b!135951 () Bool)

(assert (=> b!135951 (= e!90262 (arrayRangesEq!208 (_2!6236 lt!210780) (_2!6236 lt!210791) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!43605 (not res!113113)) b!135950))

(assert (= (and b!135950 res!113114) b!135951))

(assert (=> b!135950 m!207575))

(assert (=> b!135950 m!207573))

(declare-fun m!207763 () Bool)

(assert (=> b!135951 m!207763))

(assert (=> b!135750 d!43605))

(declare-fun d!43607 () Bool)

(assert (=> d!43607 (arrayRangesEq!208 (_2!6236 lt!210780) (_2!6236 lt!210791) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!211283 () Unit!8448)

(declare-fun choose!70 (array!6194 array!6194 (_ BitVec 32) (_ BitVec 32)) Unit!8448)

(assert (=> d!43607 (= lt!211283 (choose!70 (_2!6236 lt!210791) (_2!6236 lt!210780) #b00000000000000000000000000000000 to!404))))

(assert (=> d!43607 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 to!404) (bvsle to!404 (size!2805 (_2!6236 lt!210791))))))

(assert (=> d!43607 (= (arrayRangesEqSymmetricLemma!21 (_2!6236 lt!210791) (_2!6236 lt!210780) #b00000000000000000000000000000000 to!404) lt!211283)))

(declare-fun bs!10640 () Bool)

(assert (= bs!10640 d!43607))

(assert (=> bs!10640 m!207281))

(declare-fun m!207765 () Bool)

(assert (=> bs!10640 m!207765))

(assert (=> b!135750 d!43607))

(push 1)

(assert (not d!43532))

(assert (not d!43589))

(assert (not d!43534))

(assert (not d!43536))

(assert (not d!43560))

(assert (not b!135862))

(assert (not b!135870))

(assert (not b!135947))

(assert (not b!135882))

(assert (not d!43581))

(assert (not d!43540))

(assert (not d!43577))

(assert (not d!43520))

(assert (not d!43579))

(assert (not b!135918))

(assert (not b!135951))

(assert (not d!43546))

(assert (not b!135943))

(assert (not b!135945))

(assert (not d!43603))

(assert (not d!43571))

(assert (not d!43563))

(assert (not d!43528))

(assert (not d!43565))

(assert (not d!43542))

(assert (not d!43504))

(assert (not d!43591))

(assert (not b!135894))

(assert (not b!135934))

(assert (not b!135926))

(assert (not d!43502))

(assert (not d!43544))

(assert (not d!43587))

(assert (not b!135936))

(assert (not b!135895))

(assert (not d!43530))

(assert (not b!135949))

(assert (not b!135923))

(assert (not b!135916))

(assert (not b!135905))

(assert (not b!135903))

(assert (not b!135884))

(assert (not b!135924))

(assert (not d!43538))

(assert (not d!43573))

(assert (not b!135881))

(assert (not d!43550))

(assert (not b!135930))

(assert (not d!43575))

(assert (not d!43548))

(assert (not b!135896))

(assert (not b!135932))

(assert (not d!43524))

(assert (not d!43593))

(assert (not b!135925))

(assert (not d!43558))

(assert (not b!135883))

(assert (not b!135917))

(assert (not d!43607))

(assert (not b!135931))

(assert (not d!43552))

(assert (not b!135927))

(assert (not b!135920))

(assert (not d!43556))

(assert (not b!135929))

(assert (not b!135919))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(assert (=> d!43573 d!43595))

(declare-fun d!43896 () Bool)

(declare-fun res!113396 () Bool)

(declare-fun e!90495 () Bool)

(assert (=> d!43896 (=> (not res!113396) (not e!90495))))

(assert (=> d!43896 (= res!113396 (= (size!2805 (buf!3198 lt!211245)) (size!2805 (buf!3198 (_2!6234 lt!210768)))))))

(assert (=> d!43896 (= (isPrefixOf!0 lt!211245 (_2!6234 lt!210768)) e!90495)))

(declare-fun b!136278 () Bool)

(declare-fun res!113395 () Bool)

(assert (=> b!136278 (=> (not res!113395) (not e!90495))))

(assert (=> b!136278 (= res!113395 (bvsle (bitIndex!0 (size!2805 (buf!3198 lt!211245)) (currentByte!5995 lt!211245) (currentBit!5990 lt!211245)) (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!210768))) (currentByte!5995 (_2!6234 lt!210768)) (currentBit!5990 (_2!6234 lt!210768)))))))

(declare-fun b!136279 () Bool)

(declare-fun e!90494 () Bool)

(assert (=> b!136279 (= e!90495 e!90494)))

(declare-fun res!113394 () Bool)

(assert (=> b!136279 (=> res!113394 e!90494)))

(assert (=> b!136279 (= res!113394 (= (size!2805 (buf!3198 lt!211245)) #b00000000000000000000000000000000))))

(declare-fun b!136280 () Bool)

(assert (=> b!136280 (= e!90494 (arrayBitRangesEq!0 (buf!3198 lt!211245) (buf!3198 (_2!6234 lt!210768)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2805 (buf!3198 lt!211245)) (currentByte!5995 lt!211245) (currentBit!5990 lt!211245))))))

(assert (= (and d!43896 res!113396) b!136278))

(assert (= (and b!136278 res!113395) b!136279))

(assert (= (and b!136279 (not res!113394)) b!136280))

(declare-fun m!208539 () Bool)

(assert (=> b!136278 m!208539))

(assert (=> b!136278 m!207285))

(assert (=> b!136280 m!208539))

(assert (=> b!136280 m!208539))

(declare-fun m!208541 () Bool)

(assert (=> b!136280 m!208541))

(assert (=> d!43573 d!43896))

(declare-fun d!43898 () Bool)

(declare-fun res!113399 () Bool)

(declare-fun e!90497 () Bool)

(assert (=> d!43898 (=> (not res!113399) (not e!90497))))

(assert (=> d!43898 (= res!113399 (= (size!2805 (buf!3198 (_1!6237 lt!211238))) (size!2805 (buf!3198 (_2!6237 lt!211238)))))))

(assert (=> d!43898 (= (isPrefixOf!0 (_1!6237 lt!211238) (_2!6237 lt!211238)) e!90497)))

(declare-fun b!136281 () Bool)

(declare-fun res!113398 () Bool)

(assert (=> b!136281 (=> (not res!113398) (not e!90497))))

(assert (=> b!136281 (= res!113398 (bvsle (bitIndex!0 (size!2805 (buf!3198 (_1!6237 lt!211238))) (currentByte!5995 (_1!6237 lt!211238)) (currentBit!5990 (_1!6237 lt!211238))) (bitIndex!0 (size!2805 (buf!3198 (_2!6237 lt!211238))) (currentByte!5995 (_2!6237 lt!211238)) (currentBit!5990 (_2!6237 lt!211238)))))))

(declare-fun b!136282 () Bool)

(declare-fun e!90496 () Bool)

(assert (=> b!136282 (= e!90497 e!90496)))

(declare-fun res!113397 () Bool)

(assert (=> b!136282 (=> res!113397 e!90496)))

(assert (=> b!136282 (= res!113397 (= (size!2805 (buf!3198 (_1!6237 lt!211238))) #b00000000000000000000000000000000))))

(declare-fun b!136283 () Bool)

(assert (=> b!136283 (= e!90496 (arrayBitRangesEq!0 (buf!3198 (_1!6237 lt!211238)) (buf!3198 (_2!6237 lt!211238)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2805 (buf!3198 (_1!6237 lt!211238))) (currentByte!5995 (_1!6237 lt!211238)) (currentBit!5990 (_1!6237 lt!211238)))))))

(assert (= (and d!43898 res!113399) b!136281))

(assert (= (and b!136281 res!113398) b!136282))

(assert (= (and b!136282 (not res!113397)) b!136283))

(declare-fun m!208543 () Bool)

(assert (=> b!136281 m!208543))

(declare-fun m!208545 () Bool)

(assert (=> b!136281 m!208545))

(assert (=> b!136283 m!208543))

(assert (=> b!136283 m!208543))

(declare-fun m!208547 () Bool)

(assert (=> b!136283 m!208547))

(assert (=> d!43573 d!43898))

(declare-fun d!43900 () Bool)

(assert (=> d!43900 (isPrefixOf!0 (_2!6234 lt!210768) (_2!6234 lt!210768))))

(declare-fun lt!211938 () Unit!8448)

(declare-fun choose!11 (BitStream!4874) Unit!8448)

(assert (=> d!43900 (= lt!211938 (choose!11 (_2!6234 lt!210768)))))

(assert (=> d!43900 (= (lemmaIsPrefixRefl!0 (_2!6234 lt!210768)) lt!211938)))

(declare-fun bs!10699 () Bool)

(assert (= bs!10699 d!43900))

(assert (=> bs!10699 m!207605))

(declare-fun m!208549 () Bool)

(assert (=> bs!10699 m!208549))

(assert (=> d!43573 d!43900))

(declare-fun d!43902 () Bool)

(assert (=> d!43902 (isPrefixOf!0 lt!211245 (_2!6234 lt!210768))))

(declare-fun lt!211939 () Unit!8448)

(assert (=> d!43902 (= lt!211939 (choose!30 lt!211245 thiss!1634 (_2!6234 lt!210768)))))

(assert (=> d!43902 (isPrefixOf!0 lt!211245 thiss!1634)))

(assert (=> d!43902 (= (lemmaIsPrefixTransitive!0 lt!211245 thiss!1634 (_2!6234 lt!210768)) lt!211939)))

(declare-fun bs!10700 () Bool)

(assert (= bs!10700 d!43902))

(assert (=> bs!10700 m!207729))

(declare-fun m!208551 () Bool)

(assert (=> bs!10700 m!208551))

(declare-fun m!208553 () Bool)

(assert (=> bs!10700 m!208553))

(assert (=> d!43573 d!43902))

(declare-fun d!43904 () Bool)

(declare-fun res!113402 () Bool)

(declare-fun e!90499 () Bool)

(assert (=> d!43904 (=> (not res!113402) (not e!90499))))

(assert (=> d!43904 (= res!113402 (= (size!2805 (buf!3198 thiss!1634)) (size!2805 (buf!3198 thiss!1634))))))

(assert (=> d!43904 (= (isPrefixOf!0 thiss!1634 thiss!1634) e!90499)))

(declare-fun b!136284 () Bool)

(declare-fun res!113401 () Bool)

(assert (=> b!136284 (=> (not res!113401) (not e!90499))))

(assert (=> b!136284 (= res!113401 (bvsle (bitIndex!0 (size!2805 (buf!3198 thiss!1634)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634)) (bitIndex!0 (size!2805 (buf!3198 thiss!1634)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634))))))

(declare-fun b!136285 () Bool)

(declare-fun e!90498 () Bool)

(assert (=> b!136285 (= e!90499 e!90498)))

(declare-fun res!113400 () Bool)

(assert (=> b!136285 (=> res!113400 e!90498)))

(assert (=> b!136285 (= res!113400 (= (size!2805 (buf!3198 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!136286 () Bool)

(assert (=> b!136286 (= e!90498 (arrayBitRangesEq!0 (buf!3198 thiss!1634) (buf!3198 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2805 (buf!3198 thiss!1634)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634))))))

(assert (= (and d!43904 res!113402) b!136284))

(assert (= (and b!136284 res!113401) b!136285))

(assert (= (and b!136285 (not res!113400)) b!136286))

(assert (=> b!136284 m!207287))

(assert (=> b!136284 m!207287))

(assert (=> b!136286 m!207287))

(assert (=> b!136286 m!207287))

(declare-fun m!208555 () Bool)

(assert (=> b!136286 m!208555))

(assert (=> d!43573 d!43904))

(declare-fun d!43906 () Bool)

(declare-fun res!113405 () Bool)

(declare-fun e!90501 () Bool)

(assert (=> d!43906 (=> (not res!113405) (not e!90501))))

(assert (=> d!43906 (= res!113405 (= (size!2805 (buf!3198 (_2!6234 lt!210768))) (size!2805 (buf!3198 (_2!6234 lt!210768)))))))

(assert (=> d!43906 (= (isPrefixOf!0 (_2!6234 lt!210768) (_2!6234 lt!210768)) e!90501)))

(declare-fun b!136287 () Bool)

(declare-fun res!113404 () Bool)

(assert (=> b!136287 (=> (not res!113404) (not e!90501))))

(assert (=> b!136287 (= res!113404 (bvsle (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!210768))) (currentByte!5995 (_2!6234 lt!210768)) (currentBit!5990 (_2!6234 lt!210768))) (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!210768))) (currentByte!5995 (_2!6234 lt!210768)) (currentBit!5990 (_2!6234 lt!210768)))))))

(declare-fun b!136288 () Bool)

(declare-fun e!90500 () Bool)

(assert (=> b!136288 (= e!90501 e!90500)))

(declare-fun res!113403 () Bool)

(assert (=> b!136288 (=> res!113403 e!90500)))

(assert (=> b!136288 (= res!113403 (= (size!2805 (buf!3198 (_2!6234 lt!210768))) #b00000000000000000000000000000000))))

(declare-fun b!136289 () Bool)

(assert (=> b!136289 (= e!90500 (arrayBitRangesEq!0 (buf!3198 (_2!6234 lt!210768)) (buf!3198 (_2!6234 lt!210768)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!210768))) (currentByte!5995 (_2!6234 lt!210768)) (currentBit!5990 (_2!6234 lt!210768)))))))

(assert (= (and d!43906 res!113405) b!136287))

(assert (= (and b!136287 res!113404) b!136288))

(assert (= (and b!136288 (not res!113403)) b!136289))

(assert (=> b!136287 m!207285))

(assert (=> b!136287 m!207285))

(assert (=> b!136289 m!207285))

(assert (=> b!136289 m!207285))

(declare-fun m!208557 () Bool)

(assert (=> b!136289 m!208557))

(assert (=> d!43573 d!43906))

(declare-fun d!43908 () Bool)

(declare-fun res!113408 () Bool)

(declare-fun e!90503 () Bool)

(assert (=> d!43908 (=> (not res!113408) (not e!90503))))

(assert (=> d!43908 (= res!113408 (= (size!2805 (buf!3198 lt!211245)) (size!2805 (buf!3198 lt!211245))))))

(assert (=> d!43908 (= (isPrefixOf!0 lt!211245 lt!211245) e!90503)))

(declare-fun b!136290 () Bool)

(declare-fun res!113407 () Bool)

(assert (=> b!136290 (=> (not res!113407) (not e!90503))))

(assert (=> b!136290 (= res!113407 (bvsle (bitIndex!0 (size!2805 (buf!3198 lt!211245)) (currentByte!5995 lt!211245) (currentBit!5990 lt!211245)) (bitIndex!0 (size!2805 (buf!3198 lt!211245)) (currentByte!5995 lt!211245) (currentBit!5990 lt!211245))))))

(declare-fun b!136291 () Bool)

(declare-fun e!90502 () Bool)

(assert (=> b!136291 (= e!90503 e!90502)))

(declare-fun res!113406 () Bool)

(assert (=> b!136291 (=> res!113406 e!90502)))

(assert (=> b!136291 (= res!113406 (= (size!2805 (buf!3198 lt!211245)) #b00000000000000000000000000000000))))

(declare-fun b!136292 () Bool)

(assert (=> b!136292 (= e!90502 (arrayBitRangesEq!0 (buf!3198 lt!211245) (buf!3198 lt!211245) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2805 (buf!3198 lt!211245)) (currentByte!5995 lt!211245) (currentBit!5990 lt!211245))))))

(assert (= (and d!43908 res!113408) b!136290))

(assert (= (and b!136290 res!113407) b!136291))

(assert (= (and b!136291 (not res!113406)) b!136292))

(assert (=> b!136290 m!208539))

(assert (=> b!136290 m!208539))

(assert (=> b!136292 m!208539))

(assert (=> b!136292 m!208539))

(declare-fun m!208559 () Bool)

(assert (=> b!136292 m!208559))

(assert (=> d!43573 d!43908))

(declare-fun d!43910 () Bool)

(assert (=> d!43910 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!211940 () Unit!8448)

(assert (=> d!43910 (= lt!211940 (choose!11 thiss!1634))))

(assert (=> d!43910 (= (lemmaIsPrefixRefl!0 thiss!1634) lt!211940)))

(declare-fun bs!10701 () Bool)

(assert (= bs!10701 d!43910))

(assert (=> bs!10701 m!207699))

(declare-fun m!208561 () Bool)

(assert (=> bs!10701 m!208561))

(assert (=> d!43573 d!43910))

(declare-fun d!43912 () Bool)

(assert (=> d!43912 (isPrefixOf!0 lt!211245 lt!211245)))

(declare-fun lt!211941 () Unit!8448)

(assert (=> d!43912 (= lt!211941 (choose!11 lt!211245))))

(assert (=> d!43912 (= (lemmaIsPrefixRefl!0 lt!211245) lt!211941)))

(declare-fun bs!10702 () Bool)

(assert (= bs!10702 d!43912))

(assert (=> bs!10702 m!207723))

(declare-fun m!208563 () Bool)

(assert (=> bs!10702 m!208563))

(assert (=> d!43573 d!43912))

(declare-fun d!43914 () Bool)

(assert (=> d!43914 (isPrefixOf!0 lt!211245 (_2!6234 lt!210768))))

(declare-fun lt!211942 () Unit!8448)

(assert (=> d!43914 (= lt!211942 (choose!30 lt!211245 (_2!6234 lt!210768) (_2!6234 lt!210768)))))

(assert (=> d!43914 (isPrefixOf!0 lt!211245 (_2!6234 lt!210768))))

(assert (=> d!43914 (= (lemmaIsPrefixTransitive!0 lt!211245 (_2!6234 lt!210768) (_2!6234 lt!210768)) lt!211942)))

(declare-fun bs!10703 () Bool)

(assert (= bs!10703 d!43914))

(assert (=> bs!10703 m!207729))

(declare-fun m!208565 () Bool)

(assert (=> bs!10703 m!208565))

(assert (=> bs!10703 m!207729))

(assert (=> d!43573 d!43914))

(declare-fun bm!1797 () Bool)

(declare-fun call!1801 () Bool)

(declare-fun c!7712 () Bool)

(declare-fun lt!212043 () tuple2!11846)

(assert (=> bm!1797 (= call!1801 (arrayRangesEq!208 lt!210781 (ite c!7712 (array!6195 (store (arr!3470 lt!210781) (bvadd #b00000000000000000000000000000001 from!447) (_1!6240 lt!212043)) (size!2805 lt!210781)) lt!210781) #b00000000000000000000000000000000 (ite c!7712 (bvadd #b00000000000000000000000000000001 from!447) (size!2805 lt!210781))))))

(declare-fun call!1800 () (_ BitVec 64))

(declare-fun lt!212044 () tuple3!516)

(declare-fun bm!1798 () Bool)

(assert (=> bm!1798 (= call!1800 (bitIndex!0 (ite c!7712 (size!2805 (buf!3198 (_2!6241 lt!212044))) (size!2805 (buf!3198 (_1!6237 lt!210790)))) (ite c!7712 (currentByte!5995 (_2!6241 lt!212044)) (currentByte!5995 (_1!6237 lt!210790))) (ite c!7712 (currentBit!5990 (_2!6241 lt!212044)) (currentBit!5990 (_1!6237 lt!210790)))))))

(declare-fun bm!1799 () Bool)

(declare-fun lt!212034 () array!6194)

(declare-fun lt!212047 () array!6194)

(declare-fun lt!212035 () (_ BitVec 32))

(declare-fun lt!212022 () (_ BitVec 32))

(declare-fun lt!212025 () (_ BitVec 32))

(declare-fun call!1802 () Bool)

(assert (=> bm!1799 (= call!1802 (arrayRangesEq!208 (ite c!7712 lt!210781 lt!212047) (ite c!7712 (_3!317 lt!212044) lt!212034) (ite c!7712 lt!212025 lt!212022) (ite c!7712 (bvadd #b00000000000000000000000000000001 from!447) lt!212035)))))

(declare-fun lt!212018 () tuple3!516)

(declare-fun e!90512 () Bool)

(declare-fun b!136303 () Bool)

(assert (=> b!136303 (= e!90512 (arrayRangesEq!208 lt!210781 (_3!317 lt!212018) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!212048 () Unit!8448)

(declare-fun b!136304 () Bool)

(declare-fun e!90511 () tuple3!516)

(assert (=> b!136304 (= e!90511 (tuple3!517 lt!212048 (_1!6237 lt!210790) lt!210781))))

(assert (=> b!136304 (= call!1800 call!1800)))

(declare-fun lt!212045 () Unit!8448)

(declare-fun Unit!8506 () Unit!8448)

(assert (=> b!136304 (= lt!212045 Unit!8506)))

(declare-fun lt!212029 () Unit!8448)

(declare-fun arrayRangesEqReflexiveLemma!6 (array!6194) Unit!8448)

(assert (=> b!136304 (= lt!212029 (arrayRangesEqReflexiveLemma!6 lt!210781))))

(assert (=> b!136304 call!1801))

(declare-fun lt!212020 () Unit!8448)

(assert (=> b!136304 (= lt!212020 lt!212029)))

(assert (=> b!136304 (= lt!212047 lt!210781)))

(assert (=> b!136304 (= lt!212034 lt!210781)))

(declare-fun lt!212028 () (_ BitVec 32))

(assert (=> b!136304 (= lt!212028 #b00000000000000000000000000000000)))

(declare-fun lt!212050 () (_ BitVec 32))

(assert (=> b!136304 (= lt!212050 (size!2805 lt!210781))))

(assert (=> b!136304 (= lt!212022 #b00000000000000000000000000000000)))

(assert (=> b!136304 (= lt!212035 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun arrayRangesEqSlicedLemma!6 (array!6194 array!6194 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8448)

(assert (=> b!136304 (= lt!212048 (arrayRangesEqSlicedLemma!6 lt!212047 lt!212034 lt!212028 lt!212050 lt!212022 lt!212035))))

(assert (=> b!136304 call!1802))

(declare-fun b!136305 () Bool)

(declare-fun res!113416 () Bool)

(assert (=> b!136305 (=> (not res!113416) (not e!90512))))

(assert (=> b!136305 (= res!113416 (and (= (buf!3198 (_1!6237 lt!210790)) (buf!3198 (_2!6241 lt!212018))) (= (size!2805 lt!210781) (size!2805 (_3!317 lt!212018)))))))

(declare-fun d!43916 () Bool)

(declare-fun e!90510 () Bool)

(assert (=> d!43916 e!90510))

(declare-fun res!113415 () Bool)

(assert (=> d!43916 (=> res!113415 e!90510)))

(assert (=> d!43916 (= res!113415 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!212041 () Bool)

(assert (=> d!43916 (= lt!212041 e!90512)))

(declare-fun res!113417 () Bool)

(assert (=> d!43916 (=> (not res!113417) (not e!90512))))

(declare-fun lt!212033 () (_ BitVec 64))

(declare-fun lt!212032 () (_ BitVec 64))

(assert (=> d!43916 (= res!113417 (= (bvadd lt!212033 lt!212032) (bitIndex!0 (size!2805 (buf!3198 (_2!6241 lt!212018))) (currentByte!5995 (_2!6241 lt!212018)) (currentBit!5990 (_2!6241 lt!212018)))))))

(assert (=> d!43916 (or (not (= (bvand lt!212033 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!212032 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!212033 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!212033 lt!212032) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!212026 () (_ BitVec 64))

(assert (=> d!43916 (= lt!212032 (bvmul lt!212026 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!43916 (or (= lt!212026 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!212026 #b0000000000000000000000000000000000000000000000000000000000001000) lt!212026)))))

(assert (=> d!43916 (= lt!212026 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!43916 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!43916 (= lt!212033 (bitIndex!0 (size!2805 (buf!3198 (_1!6237 lt!210790))) (currentByte!5995 (_1!6237 lt!210790)) (currentBit!5990 (_1!6237 lt!210790))))))

(assert (=> d!43916 (= lt!212018 e!90511)))

(assert (=> d!43916 (= c!7712 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!43916 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2805 lt!210781)))))

(assert (=> d!43916 (= (readByteArrayLoop!0 (_1!6237 lt!210790) lt!210781 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!212018)))

(declare-fun b!136306 () Bool)

(declare-fun lt!212015 () Unit!8448)

(assert (=> b!136306 (= e!90511 (tuple3!517 lt!212015 (_2!6241 lt!212044) (_3!317 lt!212044)))))

(assert (=> b!136306 (= lt!212043 (readByte!0 (_1!6237 lt!210790)))))

(declare-fun lt!212037 () array!6194)

(assert (=> b!136306 (= lt!212037 (array!6195 (store (arr!3470 lt!210781) (bvadd #b00000000000000000000000000000001 from!447) (_1!6240 lt!212043)) (size!2805 lt!210781)))))

(declare-fun lt!212038 () (_ BitVec 64))

(assert (=> b!136306 (= lt!212038 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!212040 () (_ BitVec 32))

(assert (=> b!136306 (= lt!212040 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!212049 () Unit!8448)

(assert (=> b!136306 (= lt!212049 (validateOffsetBytesFromBitIndexLemma!0 (_1!6237 lt!210790) (_2!6240 lt!212043) lt!212038 lt!212040))))

(assert (=> b!136306 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6240 lt!212043)))) ((_ sign_extend 32) (currentByte!5995 (_2!6240 lt!212043))) ((_ sign_extend 32) (currentBit!5990 (_2!6240 lt!212043))) (bvsub lt!212040 ((_ extract 31 0) (bvsdiv (bvadd lt!212038 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!212027 () Unit!8448)

(assert (=> b!136306 (= lt!212027 lt!212049)))

(assert (=> b!136306 (= lt!212044 (readByteArrayLoop!0 (_2!6240 lt!212043) lt!212037 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!136306 (= (bitIndex!0 (size!2805 (buf!3198 (_2!6240 lt!212043))) (currentByte!5995 (_2!6240 lt!212043)) (currentBit!5990 (_2!6240 lt!212043))) (bvadd (bitIndex!0 (size!2805 (buf!3198 (_1!6237 lt!210790))) (currentByte!5995 (_1!6237 lt!210790)) (currentBit!5990 (_1!6237 lt!210790))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!212046 () Unit!8448)

(declare-fun Unit!8507 () Unit!8448)

(assert (=> b!136306 (= lt!212046 Unit!8507)))

(assert (=> b!136306 (= (bvadd (bitIndex!0 (size!2805 (buf!3198 (_2!6240 lt!212043))) (currentByte!5995 (_2!6240 lt!212043)) (currentBit!5990 (_2!6240 lt!212043))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!1800)))

(declare-fun lt!212021 () Unit!8448)

(declare-fun Unit!8508 () Unit!8448)

(assert (=> b!136306 (= lt!212021 Unit!8508)))

(assert (=> b!136306 (= (bvadd (bitIndex!0 (size!2805 (buf!3198 (_1!6237 lt!210790))) (currentByte!5995 (_1!6237 lt!210790)) (currentBit!5990 (_1!6237 lt!210790))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!1800)))

(declare-fun lt!212031 () Unit!8448)

(declare-fun Unit!8509 () Unit!8448)

(assert (=> b!136306 (= lt!212031 Unit!8509)))

(assert (=> b!136306 (and (= (buf!3198 (_1!6237 lt!210790)) (buf!3198 (_2!6241 lt!212044))) (= (size!2805 lt!210781) (size!2805 (_3!317 lt!212044))))))

(declare-fun lt!212017 () Unit!8448)

(declare-fun Unit!8510 () Unit!8448)

(assert (=> b!136306 (= lt!212017 Unit!8510)))

(declare-fun lt!212023 () Unit!8448)

(declare-fun arrayUpdatedAtPrefixLemma!6 (array!6194 (_ BitVec 32) (_ BitVec 8)) Unit!8448)

(assert (=> b!136306 (= lt!212023 (arrayUpdatedAtPrefixLemma!6 lt!210781 (bvadd #b00000000000000000000000000000001 from!447) (_1!6240 lt!212043)))))

(assert (=> b!136306 call!1801))

(declare-fun lt!212036 () Unit!8448)

(assert (=> b!136306 (= lt!212036 lt!212023)))

(assert (=> b!136306 (= lt!212025 #b00000000000000000000000000000000)))

(declare-fun lt!212016 () Unit!8448)

(assert (=> b!136306 (= lt!212016 (arrayRangesEqTransitive!10 lt!210781 lt!212037 (_3!317 lt!212044) lt!212025 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!136306 call!1802))

(declare-fun lt!212030 () Unit!8448)

(assert (=> b!136306 (= lt!212030 lt!212016)))

(assert (=> b!136306 (arrayRangesEq!208 lt!210781 (_3!317 lt!212044) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!212039 () Unit!8448)

(declare-fun Unit!8511 () Unit!8448)

(assert (=> b!136306 (= lt!212039 Unit!8511)))

(declare-fun lt!212042 () Unit!8448)

(declare-fun arrayRangesEqImpliesEq!6 (array!6194 array!6194 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8448)

(assert (=> b!136306 (= lt!212042 (arrayRangesEqImpliesEq!6 lt!212037 (_3!317 lt!212044) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!136306 (= (select (store (arr!3470 lt!210781) (bvadd #b00000000000000000000000000000001 from!447) (_1!6240 lt!212043)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3470 (_3!317 lt!212044)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!212024 () Unit!8448)

(assert (=> b!136306 (= lt!212024 lt!212042)))

(declare-fun lt!212019 () Bool)

(assert (=> b!136306 (= lt!212019 (= (select (arr!3470 (_3!317 lt!212044)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6240 lt!212043)))))

(declare-fun Unit!8512 () Unit!8448)

(assert (=> b!136306 (= lt!212015 Unit!8512)))

(assert (=> b!136306 lt!212019))

(declare-fun b!136307 () Bool)

(assert (=> b!136307 (= e!90510 (= (select (arr!3470 (_3!317 lt!212018)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6235 (readBytePure!0 (_1!6237 lt!210790)))))))

(assert (=> b!136307 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!2805 (_3!317 lt!212018))))))

(assert (= (and d!43916 c!7712) b!136306))

(assert (= (and d!43916 (not c!7712)) b!136304))

(assert (= (or b!136306 b!136304) bm!1799))

(assert (= (or b!136306 b!136304) bm!1797))

(assert (= (or b!136306 b!136304) bm!1798))

(assert (= (and d!43916 res!113417) b!136305))

(assert (= (and b!136305 res!113416) b!136303))

(assert (= (and d!43916 (not res!113415)) b!136307))

(declare-fun m!208567 () Bool)

(assert (=> d!43916 m!208567))

(declare-fun m!208569 () Bool)

(assert (=> d!43916 m!208569))

(declare-fun m!208571 () Bool)

(assert (=> b!136304 m!208571))

(declare-fun m!208573 () Bool)

(assert (=> b!136304 m!208573))

(declare-fun m!208575 () Bool)

(assert (=> bm!1797 m!208575))

(declare-fun m!208577 () Bool)

(assert (=> bm!1797 m!208577))

(declare-fun m!208579 () Bool)

(assert (=> bm!1799 m!208579))

(declare-fun m!208581 () Bool)

(assert (=> b!136306 m!208581))

(declare-fun m!208583 () Bool)

(assert (=> b!136306 m!208583))

(declare-fun m!208585 () Bool)

(assert (=> b!136306 m!208585))

(declare-fun m!208587 () Bool)

(assert (=> b!136306 m!208587))

(declare-fun m!208589 () Bool)

(assert (=> b!136306 m!208589))

(assert (=> b!136306 m!208569))

(declare-fun m!208591 () Bool)

(assert (=> b!136306 m!208591))

(declare-fun m!208593 () Bool)

(assert (=> b!136306 m!208593))

(declare-fun m!208595 () Bool)

(assert (=> b!136306 m!208595))

(declare-fun m!208597 () Bool)

(assert (=> b!136306 m!208597))

(declare-fun m!208599 () Bool)

(assert (=> b!136306 m!208599))

(declare-fun m!208601 () Bool)

(assert (=> b!136306 m!208601))

(assert (=> b!136306 m!208575))

(declare-fun m!208603 () Bool)

(assert (=> b!136303 m!208603))

(declare-fun m!208605 () Bool)

(assert (=> bm!1798 m!208605))

(declare-fun m!208607 () Bool)

(assert (=> b!136307 m!208607))

(declare-fun m!208609 () Bool)

(assert (=> b!136307 m!208609))

(assert (=> d!43565 d!43916))

(declare-fun d!43918 () Bool)

(declare-fun lt!212067 () (_ BitVec 8))

(declare-fun lt!212071 () (_ BitVec 8))

(assert (=> d!43918 (= lt!212067 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3470 (buf!3198 (_1!6237 lt!210787))) (currentByte!5995 (_1!6237 lt!210787)))) ((_ sign_extend 24) lt!212071))))))

(assert (=> d!43918 (= lt!212071 ((_ extract 7 0) (currentBit!5990 (_1!6237 lt!210787))))))

(declare-fun e!90517 () Bool)

(assert (=> d!43918 e!90517))

(declare-fun res!113424 () Bool)

(assert (=> d!43918 (=> (not res!113424) (not e!90517))))

(assert (=> d!43918 (= res!113424 (validate_offset_bits!1 ((_ sign_extend 32) (size!2805 (buf!3198 (_1!6237 lt!210787)))) ((_ sign_extend 32) (currentByte!5995 (_1!6237 lt!210787))) ((_ sign_extend 32) (currentBit!5990 (_1!6237 lt!210787))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!11852 0))(
  ( (tuple2!11853 (_1!6246 Unit!8448) (_2!6246 (_ BitVec 8))) )
))
(declare-fun Unit!8513 () Unit!8448)

(declare-fun Unit!8514 () Unit!8448)

(assert (=> d!43918 (= (readByte!0 (_1!6237 lt!210787)) (tuple2!11847 (_2!6246 (ite (bvsgt ((_ sign_extend 24) lt!212071) #b00000000000000000000000000000000) (tuple2!11853 Unit!8513 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!212067) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3470 (buf!3198 (_1!6237 lt!210787))) (bvadd (currentByte!5995 (_1!6237 lt!210787)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!212071)))))))) (tuple2!11853 Unit!8514 lt!212067))) (BitStream!4875 (buf!3198 (_1!6237 lt!210787)) (bvadd (currentByte!5995 (_1!6237 lt!210787)) #b00000000000000000000000000000001) (currentBit!5990 (_1!6237 lt!210787)))))))

(declare-fun b!136312 () Bool)

(declare-fun e!90518 () Bool)

(assert (=> b!136312 (= e!90517 e!90518)))

(declare-fun res!113423 () Bool)

(assert (=> b!136312 (=> (not res!113423) (not e!90518))))

(declare-fun lt!212066 () tuple2!11846)

(assert (=> b!136312 (= res!113423 (= (buf!3198 (_2!6240 lt!212066)) (buf!3198 (_1!6237 lt!210787))))))

(declare-fun lt!212068 () (_ BitVec 8))

(declare-fun lt!212065 () (_ BitVec 8))

(declare-fun Unit!8515 () Unit!8448)

(declare-fun Unit!8516 () Unit!8448)

(assert (=> b!136312 (= lt!212066 (tuple2!11847 (_2!6246 (ite (bvsgt ((_ sign_extend 24) lt!212068) #b00000000000000000000000000000000) (tuple2!11853 Unit!8515 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!212065) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3470 (buf!3198 (_1!6237 lt!210787))) (bvadd (currentByte!5995 (_1!6237 lt!210787)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!212068)))))))) (tuple2!11853 Unit!8516 lt!212065))) (BitStream!4875 (buf!3198 (_1!6237 lt!210787)) (bvadd (currentByte!5995 (_1!6237 lt!210787)) #b00000000000000000000000000000001) (currentBit!5990 (_1!6237 lt!210787)))))))

(assert (=> b!136312 (= lt!212065 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3470 (buf!3198 (_1!6237 lt!210787))) (currentByte!5995 (_1!6237 lt!210787)))) ((_ sign_extend 24) lt!212068))))))

(assert (=> b!136312 (= lt!212068 ((_ extract 7 0) (currentBit!5990 (_1!6237 lt!210787))))))

(declare-fun lt!212070 () (_ BitVec 64))

(declare-fun lt!212069 () (_ BitVec 64))

(declare-fun b!136313 () Bool)

(assert (=> b!136313 (= e!90518 (= (bitIndex!0 (size!2805 (buf!3198 (_2!6240 lt!212066))) (currentByte!5995 (_2!6240 lt!212066)) (currentBit!5990 (_2!6240 lt!212066))) (bvadd lt!212070 lt!212069)))))

(assert (=> b!136313 (or (not (= (bvand lt!212070 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!212069 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!212070 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!212070 lt!212069) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!136313 (= lt!212069 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!136313 (= lt!212070 (bitIndex!0 (size!2805 (buf!3198 (_1!6237 lt!210787))) (currentByte!5995 (_1!6237 lt!210787)) (currentBit!5990 (_1!6237 lt!210787))))))

(assert (= (and d!43918 res!113424) b!136312))

(assert (= (and b!136312 res!113423) b!136313))

(declare-fun m!208611 () Bool)

(assert (=> d!43918 m!208611))

(declare-fun m!208613 () Bool)

(assert (=> d!43918 m!208613))

(declare-fun m!208615 () Bool)

(assert (=> d!43918 m!208615))

(assert (=> b!136312 m!208615))

(assert (=> b!136312 m!208611))

(declare-fun m!208617 () Bool)

(assert (=> b!136313 m!208617))

(declare-fun m!208619 () Bool)

(assert (=> b!136313 m!208619))

(assert (=> d!43542 d!43918))

(declare-fun d!43920 () Bool)

(assert (=> d!43920 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!210768)))) ((_ sign_extend 32) (currentByte!5995 (_2!6234 lt!210768))) ((_ sign_extend 32) (currentBit!5990 (_2!6234 lt!210768))) (bvsub (bvsub to!404 from!447) lt!211211)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) lt!211211)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!210768)))) ((_ sign_extend 32) (currentByte!5995 (_2!6234 lt!210768))) ((_ sign_extend 32) (currentBit!5990 (_2!6234 lt!210768)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10704 () Bool)

(assert (= bs!10704 d!43920))

(assert (=> bs!10704 m!207647))

(assert (=> b!135923 d!43920))

(declare-fun d!43922 () Bool)

(declare-fun res!113425 () Bool)

(declare-fun e!90519 () Bool)

(assert (=> d!43922 (=> res!113425 e!90519)))

(assert (=> d!43922 (= res!113425 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!43922 (= (arrayRangesEq!208 (_2!6236 lt!210780) (_2!6236 lt!210791) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!90519)))

(declare-fun b!136314 () Bool)

(declare-fun e!90520 () Bool)

(assert (=> b!136314 (= e!90519 e!90520)))

(declare-fun res!113426 () Bool)

(assert (=> b!136314 (=> (not res!113426) (not e!90520))))

(assert (=> b!136314 (= res!113426 (= (select (arr!3470 (_2!6236 lt!210780)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3470 (_2!6236 lt!210791)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!136315 () Bool)

(assert (=> b!136315 (= e!90520 (arrayRangesEq!208 (_2!6236 lt!210780) (_2!6236 lt!210791) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!43922 (not res!113425)) b!136314))

(assert (= (and b!136314 res!113426) b!136315))

(declare-fun m!208621 () Bool)

(assert (=> b!136314 m!208621))

(declare-fun m!208623 () Bool)

(assert (=> b!136314 m!208623))

(declare-fun m!208625 () Bool)

(assert (=> b!136315 m!208625))

(assert (=> b!135951 d!43922))

(declare-fun d!43924 () Bool)

(declare-fun res!113427 () Bool)

(declare-fun e!90521 () Bool)

(assert (=> d!43924 (=> res!113427 e!90521)))

(assert (=> d!43924 (= res!113427 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!43924 (= (arrayRangesEq!208 arr!237 (_2!6236 lt!211186) #b00000000000000000000000000000000 to!404) e!90521)))

(declare-fun b!136316 () Bool)

(declare-fun e!90522 () Bool)

(assert (=> b!136316 (= e!90521 e!90522)))

(declare-fun res!113428 () Bool)

(assert (=> b!136316 (=> (not res!113428) (not e!90522))))

(assert (=> b!136316 (= res!113428 (= (select (arr!3470 arr!237) #b00000000000000000000000000000000) (select (arr!3470 (_2!6236 lt!211186)) #b00000000000000000000000000000000)))))

(declare-fun b!136317 () Bool)

(assert (=> b!136317 (= e!90522 (arrayRangesEq!208 arr!237 (_2!6236 lt!211186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!43924 (not res!113427)) b!136316))

(assert (= (and b!136316 res!113428) b!136317))

(assert (=> b!136316 m!207753))

(declare-fun m!208627 () Bool)

(assert (=> b!136316 m!208627))

(declare-fun m!208629 () Bool)

(assert (=> b!136317 m!208629))

(assert (=> b!135916 d!43924))

(declare-fun lt!212078 () (_ BitVec 8))

(declare-fun d!43926 () Bool)

(declare-fun lt!212074 () (_ BitVec 8))

(assert (=> d!43926 (= lt!212074 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3470 (buf!3198 (BitStream!4875 (buf!3198 (_2!6234 lt!210775)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634)))) (currentByte!5995 (BitStream!4875 (buf!3198 (_2!6234 lt!210775)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634))))) ((_ sign_extend 24) lt!212078))))))

(assert (=> d!43926 (= lt!212078 ((_ extract 7 0) (currentBit!5990 (BitStream!4875 (buf!3198 (_2!6234 lt!210775)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634)))))))

(declare-fun e!90523 () Bool)

(assert (=> d!43926 e!90523))

(declare-fun res!113430 () Bool)

(assert (=> d!43926 (=> (not res!113430) (not e!90523))))

(assert (=> d!43926 (= res!113430 (validate_offset_bits!1 ((_ sign_extend 32) (size!2805 (buf!3198 (BitStream!4875 (buf!3198 (_2!6234 lt!210775)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634))))) ((_ sign_extend 32) (currentByte!5995 (BitStream!4875 (buf!3198 (_2!6234 lt!210775)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634)))) ((_ sign_extend 32) (currentBit!5990 (BitStream!4875 (buf!3198 (_2!6234 lt!210775)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634)))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!8517 () Unit!8448)

(declare-fun Unit!8518 () Unit!8448)

(assert (=> d!43926 (= (readByte!0 (BitStream!4875 (buf!3198 (_2!6234 lt!210775)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634))) (tuple2!11847 (_2!6246 (ite (bvsgt ((_ sign_extend 24) lt!212078) #b00000000000000000000000000000000) (tuple2!11853 Unit!8517 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!212074) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3470 (buf!3198 (BitStream!4875 (buf!3198 (_2!6234 lt!210775)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634)))) (bvadd (currentByte!5995 (BitStream!4875 (buf!3198 (_2!6234 lt!210775)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!212078)))))))) (tuple2!11853 Unit!8518 lt!212074))) (BitStream!4875 (buf!3198 (BitStream!4875 (buf!3198 (_2!6234 lt!210775)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634))) (bvadd (currentByte!5995 (BitStream!4875 (buf!3198 (_2!6234 lt!210775)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634))) #b00000000000000000000000000000001) (currentBit!5990 (BitStream!4875 (buf!3198 (_2!6234 lt!210775)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634))))))))

(declare-fun b!136318 () Bool)

(declare-fun e!90524 () Bool)

(assert (=> b!136318 (= e!90523 e!90524)))

(declare-fun res!113429 () Bool)

(assert (=> b!136318 (=> (not res!113429) (not e!90524))))

(declare-fun lt!212073 () tuple2!11846)

(assert (=> b!136318 (= res!113429 (= (buf!3198 (_2!6240 lt!212073)) (buf!3198 (BitStream!4875 (buf!3198 (_2!6234 lt!210775)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634)))))))

(declare-fun lt!212072 () (_ BitVec 8))

(declare-fun lt!212075 () (_ BitVec 8))

(declare-fun Unit!8519 () Unit!8448)

(declare-fun Unit!8520 () Unit!8448)

(assert (=> b!136318 (= lt!212073 (tuple2!11847 (_2!6246 (ite (bvsgt ((_ sign_extend 24) lt!212075) #b00000000000000000000000000000000) (tuple2!11853 Unit!8519 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!212072) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3470 (buf!3198 (BitStream!4875 (buf!3198 (_2!6234 lt!210775)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634)))) (bvadd (currentByte!5995 (BitStream!4875 (buf!3198 (_2!6234 lt!210775)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!212075)))))))) (tuple2!11853 Unit!8520 lt!212072))) (BitStream!4875 (buf!3198 (BitStream!4875 (buf!3198 (_2!6234 lt!210775)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634))) (bvadd (currentByte!5995 (BitStream!4875 (buf!3198 (_2!6234 lt!210775)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634))) #b00000000000000000000000000000001) (currentBit!5990 (BitStream!4875 (buf!3198 (_2!6234 lt!210775)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634))))))))

(assert (=> b!136318 (= lt!212072 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3470 (buf!3198 (BitStream!4875 (buf!3198 (_2!6234 lt!210775)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634)))) (currentByte!5995 (BitStream!4875 (buf!3198 (_2!6234 lt!210775)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634))))) ((_ sign_extend 24) lt!212075))))))

(assert (=> b!136318 (= lt!212075 ((_ extract 7 0) (currentBit!5990 (BitStream!4875 (buf!3198 (_2!6234 lt!210775)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634)))))))

(declare-fun lt!212077 () (_ BitVec 64))

(declare-fun b!136319 () Bool)

(declare-fun lt!212076 () (_ BitVec 64))

(assert (=> b!136319 (= e!90524 (= (bitIndex!0 (size!2805 (buf!3198 (_2!6240 lt!212073))) (currentByte!5995 (_2!6240 lt!212073)) (currentBit!5990 (_2!6240 lt!212073))) (bvadd lt!212077 lt!212076)))))

(assert (=> b!136319 (or (not (= (bvand lt!212077 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!212076 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!212077 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!212077 lt!212076) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!136319 (= lt!212076 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!136319 (= lt!212077 (bitIndex!0 (size!2805 (buf!3198 (BitStream!4875 (buf!3198 (_2!6234 lt!210775)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634)))) (currentByte!5995 (BitStream!4875 (buf!3198 (_2!6234 lt!210775)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634))) (currentBit!5990 (BitStream!4875 (buf!3198 (_2!6234 lt!210775)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634)))))))

(assert (= (and d!43926 res!113430) b!136318))

(assert (= (and b!136318 res!113429) b!136319))

(declare-fun m!208631 () Bool)

(assert (=> d!43926 m!208631))

(declare-fun m!208633 () Bool)

(assert (=> d!43926 m!208633))

(declare-fun m!208635 () Bool)

(assert (=> d!43926 m!208635))

(assert (=> b!136318 m!208635))

(assert (=> b!136318 m!208631))

(declare-fun m!208637 () Bool)

(assert (=> b!136319 m!208637))

(declare-fun m!208639 () Bool)

(assert (=> b!136319 m!208639))

(assert (=> d!43540 d!43926))

(declare-fun d!43928 () Bool)

(declare-fun res!113433 () Bool)

(declare-fun e!90526 () Bool)

(assert (=> d!43928 (=> (not res!113433) (not e!90526))))

(assert (=> d!43928 (= res!113433 (= (size!2805 (buf!3198 thiss!1634)) (size!2805 (buf!3198 (_2!6234 lt!211156)))))))

(assert (=> d!43928 (= (isPrefixOf!0 thiss!1634 (_2!6234 lt!211156)) e!90526)))

(declare-fun b!136320 () Bool)

(declare-fun res!113432 () Bool)

(assert (=> b!136320 (=> (not res!113432) (not e!90526))))

(assert (=> b!136320 (= res!113432 (bvsle (bitIndex!0 (size!2805 (buf!3198 thiss!1634)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634)) (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!211156))) (currentByte!5995 (_2!6234 lt!211156)) (currentBit!5990 (_2!6234 lt!211156)))))))

(declare-fun b!136321 () Bool)

(declare-fun e!90525 () Bool)

(assert (=> b!136321 (= e!90526 e!90525)))

(declare-fun res!113431 () Bool)

(assert (=> b!136321 (=> res!113431 e!90525)))

(assert (=> b!136321 (= res!113431 (= (size!2805 (buf!3198 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!136322 () Bool)

(assert (=> b!136322 (= e!90525 (arrayBitRangesEq!0 (buf!3198 thiss!1634) (buf!3198 (_2!6234 lt!211156)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2805 (buf!3198 thiss!1634)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634))))))

(assert (= (and d!43928 res!113433) b!136320))

(assert (= (and b!136320 res!113432) b!136321))

(assert (= (and b!136321 (not res!113431)) b!136322))

(assert (=> b!136320 m!207287))

(assert (=> b!136320 m!207629))

(assert (=> b!136322 m!207287))

(assert (=> b!136322 m!207287))

(declare-fun m!208641 () Bool)

(assert (=> b!136322 m!208641))

(assert (=> b!135895 d!43928))

(declare-fun b!136337 () Bool)

(declare-fun res!113448 () Bool)

(declare-fun lt!212085 () (_ BitVec 32))

(assert (=> b!136337 (= res!113448 (= lt!212085 #b00000000000000000000000000000000))))

(declare-fun e!90543 () Bool)

(assert (=> b!136337 (=> res!113448 e!90543)))

(declare-fun e!90540 () Bool)

(assert (=> b!136337 (= e!90540 e!90543)))

(declare-fun c!7715 () Bool)

(declare-fun call!1805 () Bool)

(declare-fun lt!212087 () (_ BitVec 32))

(declare-fun bm!1802 () Bool)

(declare-datatypes ((tuple4!120 0))(
  ( (tuple4!121 (_1!6247 (_ BitVec 32)) (_2!6247 (_ BitVec 32)) (_3!320 (_ BitVec 32)) (_4!60 (_ BitVec 32))) )
))
(declare-fun lt!212086 () tuple4!120)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!1802 (= call!1805 (byteRangesEq!0 (ite c!7715 (select (arr!3470 (buf!3198 thiss!1634)) (_3!320 lt!212086)) (select (arr!3470 (buf!3198 thiss!1634)) (_4!60 lt!212086))) (ite c!7715 (select (arr!3470 (buf!3198 (_2!6234 lt!210768))) (_3!320 lt!212086)) (select (arr!3470 (buf!3198 (_2!6234 lt!210768))) (_4!60 lt!212086))) (ite c!7715 lt!212087 #b00000000000000000000000000000000) lt!212085))))

(declare-fun b!136338 () Bool)

(declare-fun e!90541 () Bool)

(assert (=> b!136338 (= e!90541 call!1805)))

(declare-fun b!136339 () Bool)

(declare-fun e!90539 () Bool)

(declare-fun e!90542 () Bool)

(assert (=> b!136339 (= e!90539 e!90542)))

(declare-fun res!113446 () Bool)

(assert (=> b!136339 (=> (not res!113446) (not e!90542))))

(declare-fun e!90544 () Bool)

(assert (=> b!136339 (= res!113446 e!90544)))

(declare-fun res!113444 () Bool)

(assert (=> b!136339 (=> res!113444 e!90544)))

(assert (=> b!136339 (= res!113444 (bvsge (_1!6247 lt!212086) (_2!6247 lt!212086)))))

(assert (=> b!136339 (= lt!212085 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2805 (buf!3198 thiss!1634)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!136339 (= lt!212087 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!120)

(assert (=> b!136339 (= lt!212086 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2805 (buf!3198 thiss!1634)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634))))))

(declare-fun b!136340 () Bool)

(assert (=> b!136340 (= e!90543 call!1805)))

(declare-fun d!43930 () Bool)

(declare-fun res!113447 () Bool)

(assert (=> d!43930 (=> res!113447 e!90539)))

(assert (=> d!43930 (= res!113447 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2805 (buf!3198 thiss!1634)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634))))))

(assert (=> d!43930 (= (arrayBitRangesEq!0 (buf!3198 thiss!1634) (buf!3198 (_2!6234 lt!210768)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2805 (buf!3198 thiss!1634)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634))) e!90539)))

(declare-fun b!136341 () Bool)

(assert (=> b!136341 (= e!90541 e!90540)))

(declare-fun res!113445 () Bool)

(assert (=> b!136341 (= res!113445 (byteRangesEq!0 (select (arr!3470 (buf!3198 thiss!1634)) (_3!320 lt!212086)) (select (arr!3470 (buf!3198 (_2!6234 lt!210768))) (_3!320 lt!212086)) lt!212087 #b00000000000000000000000000001000))))

(assert (=> b!136341 (=> (not res!113445) (not e!90540))))

(declare-fun b!136342 () Bool)

(assert (=> b!136342 (= e!90542 e!90541)))

(assert (=> b!136342 (= c!7715 (= (_3!320 lt!212086) (_4!60 lt!212086)))))

(declare-fun b!136343 () Bool)

(assert (=> b!136343 (= e!90544 (arrayRangesEq!208 (buf!3198 thiss!1634) (buf!3198 (_2!6234 lt!210768)) (_1!6247 lt!212086) (_2!6247 lt!212086)))))

(assert (= (and d!43930 (not res!113447)) b!136339))

(assert (= (and b!136339 (not res!113444)) b!136343))

(assert (= (and b!136339 res!113446) b!136342))

(assert (= (and b!136342 c!7715) b!136338))

(assert (= (and b!136342 (not c!7715)) b!136341))

(assert (= (and b!136341 res!113445) b!136337))

(assert (= (and b!136337 (not res!113448)) b!136340))

(assert (= (or b!136338 b!136340) bm!1802))

(declare-fun m!208643 () Bool)

(assert (=> bm!1802 m!208643))

(declare-fun m!208645 () Bool)

(assert (=> bm!1802 m!208645))

(declare-fun m!208647 () Bool)

(assert (=> bm!1802 m!208647))

(declare-fun m!208649 () Bool)

(assert (=> bm!1802 m!208649))

(declare-fun m!208651 () Bool)

(assert (=> bm!1802 m!208651))

(assert (=> b!136339 m!207287))

(declare-fun m!208653 () Bool)

(assert (=> b!136339 m!208653))

(assert (=> b!136341 m!208647))

(assert (=> b!136341 m!208645))

(assert (=> b!136341 m!208647))

(assert (=> b!136341 m!208645))

(declare-fun m!208655 () Bool)

(assert (=> b!136341 m!208655))

(declare-fun m!208657 () Bool)

(assert (=> b!136343 m!208657))

(assert (=> b!135945 d!43930))

(assert (=> b!135945 d!43591))

(declare-fun d!43932 () Bool)

(declare-fun lt!212090 () (_ BitVec 8))

(declare-fun lt!212094 () (_ BitVec 8))

(assert (=> d!43932 (= lt!212090 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3470 (buf!3198 (_1!6237 lt!210782))) (currentByte!5995 (_1!6237 lt!210782)))) ((_ sign_extend 24) lt!212094))))))

(assert (=> d!43932 (= lt!212094 ((_ extract 7 0) (currentBit!5990 (_1!6237 lt!210782))))))

(declare-fun e!90545 () Bool)

(assert (=> d!43932 e!90545))

(declare-fun res!113450 () Bool)

(assert (=> d!43932 (=> (not res!113450) (not e!90545))))

(assert (=> d!43932 (= res!113450 (validate_offset_bits!1 ((_ sign_extend 32) (size!2805 (buf!3198 (_1!6237 lt!210782)))) ((_ sign_extend 32) (currentByte!5995 (_1!6237 lt!210782))) ((_ sign_extend 32) (currentBit!5990 (_1!6237 lt!210782))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!8521 () Unit!8448)

(declare-fun Unit!8522 () Unit!8448)

(assert (=> d!43932 (= (readByte!0 (_1!6237 lt!210782)) (tuple2!11847 (_2!6246 (ite (bvsgt ((_ sign_extend 24) lt!212094) #b00000000000000000000000000000000) (tuple2!11853 Unit!8521 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!212090) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3470 (buf!3198 (_1!6237 lt!210782))) (bvadd (currentByte!5995 (_1!6237 lt!210782)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!212094)))))))) (tuple2!11853 Unit!8522 lt!212090))) (BitStream!4875 (buf!3198 (_1!6237 lt!210782)) (bvadd (currentByte!5995 (_1!6237 lt!210782)) #b00000000000000000000000000000001) (currentBit!5990 (_1!6237 lt!210782)))))))

(declare-fun b!136344 () Bool)

(declare-fun e!90546 () Bool)

(assert (=> b!136344 (= e!90545 e!90546)))

(declare-fun res!113449 () Bool)

(assert (=> b!136344 (=> (not res!113449) (not e!90546))))

(declare-fun lt!212089 () tuple2!11846)

(assert (=> b!136344 (= res!113449 (= (buf!3198 (_2!6240 lt!212089)) (buf!3198 (_1!6237 lt!210782))))))

(declare-fun lt!212088 () (_ BitVec 8))

(declare-fun lt!212091 () (_ BitVec 8))

(declare-fun Unit!8523 () Unit!8448)

(declare-fun Unit!8524 () Unit!8448)

(assert (=> b!136344 (= lt!212089 (tuple2!11847 (_2!6246 (ite (bvsgt ((_ sign_extend 24) lt!212091) #b00000000000000000000000000000000) (tuple2!11853 Unit!8523 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!212088) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3470 (buf!3198 (_1!6237 lt!210782))) (bvadd (currentByte!5995 (_1!6237 lt!210782)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!212091)))))))) (tuple2!11853 Unit!8524 lt!212088))) (BitStream!4875 (buf!3198 (_1!6237 lt!210782)) (bvadd (currentByte!5995 (_1!6237 lt!210782)) #b00000000000000000000000000000001) (currentBit!5990 (_1!6237 lt!210782)))))))

(assert (=> b!136344 (= lt!212088 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3470 (buf!3198 (_1!6237 lt!210782))) (currentByte!5995 (_1!6237 lt!210782)))) ((_ sign_extend 24) lt!212091))))))

(assert (=> b!136344 (= lt!212091 ((_ extract 7 0) (currentBit!5990 (_1!6237 lt!210782))))))

(declare-fun lt!212092 () (_ BitVec 64))

(declare-fun b!136345 () Bool)

(declare-fun lt!212093 () (_ BitVec 64))

(assert (=> b!136345 (= e!90546 (= (bitIndex!0 (size!2805 (buf!3198 (_2!6240 lt!212089))) (currentByte!5995 (_2!6240 lt!212089)) (currentBit!5990 (_2!6240 lt!212089))) (bvadd lt!212093 lt!212092)))))

(assert (=> b!136345 (or (not (= (bvand lt!212093 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!212092 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!212093 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!212093 lt!212092) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!136345 (= lt!212092 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!136345 (= lt!212093 (bitIndex!0 (size!2805 (buf!3198 (_1!6237 lt!210782))) (currentByte!5995 (_1!6237 lt!210782)) (currentBit!5990 (_1!6237 lt!210782))))))

(assert (= (and d!43932 res!113450) b!136344))

(assert (= (and b!136344 res!113449) b!136345))

(declare-fun m!208659 () Bool)

(assert (=> d!43932 m!208659))

(declare-fun m!208661 () Bool)

(assert (=> d!43932 m!208661))

(declare-fun m!208663 () Bool)

(assert (=> d!43932 m!208663))

(assert (=> b!136344 m!208663))

(assert (=> b!136344 m!208659))

(declare-fun m!208665 () Bool)

(assert (=> b!136345 m!208665))

(declare-fun m!208667 () Bool)

(assert (=> b!136345 m!208667))

(assert (=> d!43571 d!43932))

(declare-fun d!43934 () Bool)

(assert (=> d!43934 (= (remainingBits!0 ((_ sign_extend 32) (size!2805 (buf!3198 (_1!6235 lt!210772)))) ((_ sign_extend 32) (currentByte!5995 (_1!6235 lt!210772))) ((_ sign_extend 32) (currentBit!5990 (_1!6235 lt!210772)))) (bvsub (bvmul ((_ sign_extend 32) (size!2805 (buf!3198 (_1!6235 lt!210772)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5995 (_1!6235 lt!210772))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5990 (_1!6235 lt!210772))))))))

(assert (=> d!43524 d!43934))

(declare-fun d!43936 () Bool)

(assert (=> d!43936 (= (invariant!0 (currentBit!5990 (_1!6235 lt!210772)) (currentByte!5995 (_1!6235 lt!210772)) (size!2805 (buf!3198 (_1!6235 lt!210772)))) (and (bvsge (currentBit!5990 (_1!6235 lt!210772)) #b00000000000000000000000000000000) (bvslt (currentBit!5990 (_1!6235 lt!210772)) #b00000000000000000000000000001000) (bvsge (currentByte!5995 (_1!6235 lt!210772)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5995 (_1!6235 lt!210772)) (size!2805 (buf!3198 (_1!6235 lt!210772)))) (and (= (currentBit!5990 (_1!6235 lt!210772)) #b00000000000000000000000000000000) (= (currentByte!5995 (_1!6235 lt!210772)) (size!2805 (buf!3198 (_1!6235 lt!210772))))))))))

(assert (=> d!43524 d!43936))

(declare-fun d!43938 () Bool)

(assert (=> d!43938 (= (remainingBits!0 ((_ sign_extend 32) (size!2805 (buf!3198 thiss!1634))) ((_ sign_extend 32) (currentByte!5995 thiss!1634)) ((_ sign_extend 32) (currentBit!5990 thiss!1634))) (bvsub (bvmul ((_ sign_extend 32) (size!2805 (buf!3198 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5995 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5990 thiss!1634)))))))

(assert (=> d!43591 d!43938))

(assert (=> d!43591 d!43569))

(assert (=> d!43587 d!43569))

(declare-fun d!43940 () Bool)

(declare-fun e!90549 () Bool)

(assert (=> d!43940 e!90549))

(declare-fun res!113453 () Bool)

(assert (=> d!43940 (=> (not res!113453) (not e!90549))))

(declare-fun moveByteIndexPrecond!0 (BitStream!4874 (_ BitVec 32)) Bool)

(assert (=> d!43940 (= res!113453 (moveByteIndexPrecond!0 (_1!6237 lt!210787) #b00000000000000000000000000000001))))

(declare-fun Unit!8525 () Unit!8448)

(assert (=> d!43940 (= (moveByteIndex!0 (_1!6237 lt!210787) #b00000000000000000000000000000001) (tuple2!11837 Unit!8525 (BitStream!4875 (buf!3198 (_1!6237 lt!210787)) (bvadd (currentByte!5995 (_1!6237 lt!210787)) #b00000000000000000000000000000001) (currentBit!5990 (_1!6237 lt!210787)))))))

(declare-fun b!136348 () Bool)

(assert (=> b!136348 (= e!90549 (and (or (not (= (bvand (currentByte!5995 (_1!6237 lt!210787)) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!5995 (_1!6237 lt!210787)) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!5995 (_1!6237 lt!210787)) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!5995 (_1!6237 lt!210787)) #b00000000000000000000000000000001) (bvadd (currentByte!5995 (_1!6237 lt!210787)) #b00000000000000000000000000000001))))))

(assert (= (and d!43940 res!113453) b!136348))

(declare-fun m!208669 () Bool)

(assert (=> d!43940 m!208669))

(assert (=> d!43552 d!43940))

(declare-fun d!43942 () Bool)

(assert (=> d!43942 (= (remainingBits!0 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!210775)))) ((_ sign_extend 32) (currentByte!5995 (_2!6234 lt!210768))) ((_ sign_extend 32) (currentBit!5990 (_2!6234 lt!210768)))) (bvsub (bvmul ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!210775)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5995 (_2!6234 lt!210768))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5990 (_2!6234 lt!210768))))))))

(assert (=> d!43577 d!43942))

(declare-fun d!43944 () Bool)

(declare-fun res!113454 () Bool)

(declare-fun e!90550 () Bool)

(assert (=> d!43944 (=> res!113454 e!90550)))

(assert (=> d!43944 (= res!113454 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!43944 (= (arrayRangesEq!208 (_2!6236 lt!210791) (_2!6236 lt!210780) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!90550)))

(declare-fun b!136349 () Bool)

(declare-fun e!90551 () Bool)

(assert (=> b!136349 (= e!90550 e!90551)))

(declare-fun res!113455 () Bool)

(assert (=> b!136349 (=> (not res!113455) (not e!90551))))

(assert (=> b!136349 (= res!113455 (= (select (arr!3470 (_2!6236 lt!210791)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3470 (_2!6236 lt!210780)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!136350 () Bool)

(assert (=> b!136350 (= e!90551 (arrayRangesEq!208 (_2!6236 lt!210791) (_2!6236 lt!210780) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!43944 (not res!113454)) b!136349))

(assert (= (and b!136349 res!113455) b!136350))

(assert (=> b!136349 m!208623))

(assert (=> b!136349 m!208621))

(declare-fun m!208671 () Bool)

(assert (=> b!136350 m!208671))

(assert (=> b!135862 d!43944))

(declare-fun d!43946 () Bool)

(assert (=> d!43946 (= (remainingBits!0 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!210775)))) ((_ sign_extend 32) (currentByte!5995 (_2!6234 lt!210775))) ((_ sign_extend 32) (currentBit!5990 (_2!6234 lt!210775)))) (bvsub (bvmul ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!210775)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5995 (_2!6234 lt!210775))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5990 (_2!6234 lt!210775))))))))

(assert (=> d!43593 d!43946))

(declare-fun d!43948 () Bool)

(assert (=> d!43948 (= (invariant!0 (currentBit!5990 (_2!6234 lt!210775)) (currentByte!5995 (_2!6234 lt!210775)) (size!2805 (buf!3198 (_2!6234 lt!210775)))) (and (bvsge (currentBit!5990 (_2!6234 lt!210775)) #b00000000000000000000000000000000) (bvslt (currentBit!5990 (_2!6234 lt!210775)) #b00000000000000000000000000001000) (bvsge (currentByte!5995 (_2!6234 lt!210775)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5995 (_2!6234 lt!210775)) (size!2805 (buf!3198 (_2!6234 lt!210775)))) (and (= (currentBit!5990 (_2!6234 lt!210775)) #b00000000000000000000000000000000) (= (currentByte!5995 (_2!6234 lt!210775)) (size!2805 (buf!3198 (_2!6234 lt!210775))))))))))

(assert (=> d!43593 d!43948))

(declare-fun call!1807 () Bool)

(declare-fun c!7716 () Bool)

(declare-fun lt!212123 () tuple2!11846)

(declare-fun bm!1803 () Bool)

(assert (=> bm!1803 (= call!1807 (arrayRangesEq!208 lt!210781 (ite c!7716 (array!6195 (store (arr!3470 lt!210781) (bvadd #b00000000000000000000000000000001 from!447) (_1!6240 lt!212123)) (size!2805 lt!210781)) lt!210781) #b00000000000000000000000000000000 (ite c!7716 (bvadd #b00000000000000000000000000000001 from!447) (size!2805 lt!210781))))))

(declare-fun lt!212124 () tuple3!516)

(declare-fun bm!1804 () Bool)

(declare-fun call!1806 () (_ BitVec 64))

(assert (=> bm!1804 (= call!1806 (bitIndex!0 (ite c!7716 (size!2805 (buf!3198 (_2!6241 lt!212124))) (size!2805 (buf!3198 (withMovedByteIndex!0 (_1!6237 lt!210787) #b00000000000000000000000000000001)))) (ite c!7716 (currentByte!5995 (_2!6241 lt!212124)) (currentByte!5995 (withMovedByteIndex!0 (_1!6237 lt!210787) #b00000000000000000000000000000001))) (ite c!7716 (currentBit!5990 (_2!6241 lt!212124)) (currentBit!5990 (withMovedByteIndex!0 (_1!6237 lt!210787) #b00000000000000000000000000000001)))))))

(declare-fun lt!212102 () (_ BitVec 32))

(declare-fun lt!212105 () (_ BitVec 32))

(declare-fun call!1808 () Bool)

(declare-fun lt!212115 () (_ BitVec 32))

(declare-fun bm!1805 () Bool)

(declare-fun lt!212127 () array!6194)

(declare-fun lt!212114 () array!6194)

(assert (=> bm!1805 (= call!1808 (arrayRangesEq!208 (ite c!7716 lt!210781 lt!212127) (ite c!7716 (_3!317 lt!212124) lt!212114) (ite c!7716 lt!212105 lt!212102) (ite c!7716 (bvadd #b00000000000000000000000000000001 from!447) lt!212115)))))

(declare-fun e!90554 () Bool)

(declare-fun lt!212098 () tuple3!516)

(declare-fun b!136351 () Bool)

(assert (=> b!136351 (= e!90554 (arrayRangesEq!208 lt!210781 (_3!317 lt!212098) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun e!90553 () tuple3!516)

(declare-fun lt!212128 () Unit!8448)

(declare-fun b!136352 () Bool)

(assert (=> b!136352 (= e!90553 (tuple3!517 lt!212128 (withMovedByteIndex!0 (_1!6237 lt!210787) #b00000000000000000000000000000001) lt!210781))))

(assert (=> b!136352 (= call!1806 call!1806)))

(declare-fun lt!212125 () Unit!8448)

(declare-fun Unit!8526 () Unit!8448)

(assert (=> b!136352 (= lt!212125 Unit!8526)))

(declare-fun lt!212109 () Unit!8448)

(assert (=> b!136352 (= lt!212109 (arrayRangesEqReflexiveLemma!6 lt!210781))))

(assert (=> b!136352 call!1807))

(declare-fun lt!212100 () Unit!8448)

(assert (=> b!136352 (= lt!212100 lt!212109)))

(assert (=> b!136352 (= lt!212127 lt!210781)))

(assert (=> b!136352 (= lt!212114 lt!210781)))

(declare-fun lt!212108 () (_ BitVec 32))

(assert (=> b!136352 (= lt!212108 #b00000000000000000000000000000000)))

(declare-fun lt!212130 () (_ BitVec 32))

(assert (=> b!136352 (= lt!212130 (size!2805 lt!210781))))

(assert (=> b!136352 (= lt!212102 #b00000000000000000000000000000000)))

(assert (=> b!136352 (= lt!212115 (bvadd #b00000000000000000000000000000001 from!447))))

(assert (=> b!136352 (= lt!212128 (arrayRangesEqSlicedLemma!6 lt!212127 lt!212114 lt!212108 lt!212130 lt!212102 lt!212115))))

(assert (=> b!136352 call!1808))

(declare-fun b!136353 () Bool)

(declare-fun res!113457 () Bool)

(assert (=> b!136353 (=> (not res!113457) (not e!90554))))

(assert (=> b!136353 (= res!113457 (and (= (buf!3198 (withMovedByteIndex!0 (_1!6237 lt!210787) #b00000000000000000000000000000001)) (buf!3198 (_2!6241 lt!212098))) (= (size!2805 lt!210781) (size!2805 (_3!317 lt!212098)))))))

(declare-fun d!43950 () Bool)

(declare-fun e!90552 () Bool)

(assert (=> d!43950 e!90552))

(declare-fun res!113456 () Bool)

(assert (=> d!43950 (=> res!113456 e!90552)))

(assert (=> d!43950 (= res!113456 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!212121 () Bool)

(assert (=> d!43950 (= lt!212121 e!90554)))

(declare-fun res!113458 () Bool)

(assert (=> d!43950 (=> (not res!113458) (not e!90554))))

(declare-fun lt!212113 () (_ BitVec 64))

(declare-fun lt!212112 () (_ BitVec 64))

(assert (=> d!43950 (= res!113458 (= (bvadd lt!212113 lt!212112) (bitIndex!0 (size!2805 (buf!3198 (_2!6241 lt!212098))) (currentByte!5995 (_2!6241 lt!212098)) (currentBit!5990 (_2!6241 lt!212098)))))))

(assert (=> d!43950 (or (not (= (bvand lt!212113 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!212112 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!212113 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!212113 lt!212112) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!212106 () (_ BitVec 64))

(assert (=> d!43950 (= lt!212112 (bvmul lt!212106 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!43950 (or (= lt!212106 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!212106 #b0000000000000000000000000000000000000000000000000000000000001000) lt!212106)))))

(assert (=> d!43950 (= lt!212106 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!43950 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!43950 (= lt!212113 (bitIndex!0 (size!2805 (buf!3198 (withMovedByteIndex!0 (_1!6237 lt!210787) #b00000000000000000000000000000001))) (currentByte!5995 (withMovedByteIndex!0 (_1!6237 lt!210787) #b00000000000000000000000000000001)) (currentBit!5990 (withMovedByteIndex!0 (_1!6237 lt!210787) #b00000000000000000000000000000001))))))

(assert (=> d!43950 (= lt!212098 e!90553)))

(assert (=> d!43950 (= c!7716 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!43950 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2805 lt!210781)))))

(assert (=> d!43950 (= (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!6237 lt!210787) #b00000000000000000000000000000001) lt!210781 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!212098)))

(declare-fun b!136354 () Bool)

(declare-fun lt!212095 () Unit!8448)

(assert (=> b!136354 (= e!90553 (tuple3!517 lt!212095 (_2!6241 lt!212124) (_3!317 lt!212124)))))

(assert (=> b!136354 (= lt!212123 (readByte!0 (withMovedByteIndex!0 (_1!6237 lt!210787) #b00000000000000000000000000000001)))))

(declare-fun lt!212117 () array!6194)

(assert (=> b!136354 (= lt!212117 (array!6195 (store (arr!3470 lt!210781) (bvadd #b00000000000000000000000000000001 from!447) (_1!6240 lt!212123)) (size!2805 lt!210781)))))

(declare-fun lt!212118 () (_ BitVec 64))

(assert (=> b!136354 (= lt!212118 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!212120 () (_ BitVec 32))

(assert (=> b!136354 (= lt!212120 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!212129 () Unit!8448)

(assert (=> b!136354 (= lt!212129 (validateOffsetBytesFromBitIndexLemma!0 (withMovedByteIndex!0 (_1!6237 lt!210787) #b00000000000000000000000000000001) (_2!6240 lt!212123) lt!212118 lt!212120))))

(assert (=> b!136354 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6240 lt!212123)))) ((_ sign_extend 32) (currentByte!5995 (_2!6240 lt!212123))) ((_ sign_extend 32) (currentBit!5990 (_2!6240 lt!212123))) (bvsub lt!212120 ((_ extract 31 0) (bvsdiv (bvadd lt!212118 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!212107 () Unit!8448)

(assert (=> b!136354 (= lt!212107 lt!212129)))

(assert (=> b!136354 (= lt!212124 (readByteArrayLoop!0 (_2!6240 lt!212123) lt!212117 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!136354 (= (bitIndex!0 (size!2805 (buf!3198 (_2!6240 lt!212123))) (currentByte!5995 (_2!6240 lt!212123)) (currentBit!5990 (_2!6240 lt!212123))) (bvadd (bitIndex!0 (size!2805 (buf!3198 (withMovedByteIndex!0 (_1!6237 lt!210787) #b00000000000000000000000000000001))) (currentByte!5995 (withMovedByteIndex!0 (_1!6237 lt!210787) #b00000000000000000000000000000001)) (currentBit!5990 (withMovedByteIndex!0 (_1!6237 lt!210787) #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!212126 () Unit!8448)

(declare-fun Unit!8527 () Unit!8448)

(assert (=> b!136354 (= lt!212126 Unit!8527)))

(assert (=> b!136354 (= (bvadd (bitIndex!0 (size!2805 (buf!3198 (_2!6240 lt!212123))) (currentByte!5995 (_2!6240 lt!212123)) (currentBit!5990 (_2!6240 lt!212123))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!1806)))

(declare-fun lt!212101 () Unit!8448)

(declare-fun Unit!8528 () Unit!8448)

(assert (=> b!136354 (= lt!212101 Unit!8528)))

(assert (=> b!136354 (= (bvadd (bitIndex!0 (size!2805 (buf!3198 (withMovedByteIndex!0 (_1!6237 lt!210787) #b00000000000000000000000000000001))) (currentByte!5995 (withMovedByteIndex!0 (_1!6237 lt!210787) #b00000000000000000000000000000001)) (currentBit!5990 (withMovedByteIndex!0 (_1!6237 lt!210787) #b00000000000000000000000000000001))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!1806)))

(declare-fun lt!212111 () Unit!8448)

(declare-fun Unit!8529 () Unit!8448)

(assert (=> b!136354 (= lt!212111 Unit!8529)))

(assert (=> b!136354 (and (= (buf!3198 (withMovedByteIndex!0 (_1!6237 lt!210787) #b00000000000000000000000000000001)) (buf!3198 (_2!6241 lt!212124))) (= (size!2805 lt!210781) (size!2805 (_3!317 lt!212124))))))

(declare-fun lt!212097 () Unit!8448)

(declare-fun Unit!8530 () Unit!8448)

(assert (=> b!136354 (= lt!212097 Unit!8530)))

(declare-fun lt!212103 () Unit!8448)

(assert (=> b!136354 (= lt!212103 (arrayUpdatedAtPrefixLemma!6 lt!210781 (bvadd #b00000000000000000000000000000001 from!447) (_1!6240 lt!212123)))))

(assert (=> b!136354 call!1807))

(declare-fun lt!212116 () Unit!8448)

(assert (=> b!136354 (= lt!212116 lt!212103)))

(assert (=> b!136354 (= lt!212105 #b00000000000000000000000000000000)))

(declare-fun lt!212096 () Unit!8448)

(assert (=> b!136354 (= lt!212096 (arrayRangesEqTransitive!10 lt!210781 lt!212117 (_3!317 lt!212124) lt!212105 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!136354 call!1808))

(declare-fun lt!212110 () Unit!8448)

(assert (=> b!136354 (= lt!212110 lt!212096)))

(assert (=> b!136354 (arrayRangesEq!208 lt!210781 (_3!317 lt!212124) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!212119 () Unit!8448)

(declare-fun Unit!8531 () Unit!8448)

(assert (=> b!136354 (= lt!212119 Unit!8531)))

(declare-fun lt!212122 () Unit!8448)

(assert (=> b!136354 (= lt!212122 (arrayRangesEqImpliesEq!6 lt!212117 (_3!317 lt!212124) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!136354 (= (select (store (arr!3470 lt!210781) (bvadd #b00000000000000000000000000000001 from!447) (_1!6240 lt!212123)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3470 (_3!317 lt!212124)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!212104 () Unit!8448)

(assert (=> b!136354 (= lt!212104 lt!212122)))

(declare-fun lt!212099 () Bool)

(assert (=> b!136354 (= lt!212099 (= (select (arr!3470 (_3!317 lt!212124)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6240 lt!212123)))))

(declare-fun Unit!8532 () Unit!8448)

(assert (=> b!136354 (= lt!212095 Unit!8532)))

(assert (=> b!136354 lt!212099))

(declare-fun b!136355 () Bool)

(assert (=> b!136355 (= e!90552 (= (select (arr!3470 (_3!317 lt!212098)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6235 (readBytePure!0 (withMovedByteIndex!0 (_1!6237 lt!210787) #b00000000000000000000000000000001)))))))

(assert (=> b!136355 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!2805 (_3!317 lt!212098))))))

(assert (= (and d!43950 c!7716) b!136354))

(assert (= (and d!43950 (not c!7716)) b!136352))

(assert (= (or b!136354 b!136352) bm!1805))

(assert (= (or b!136354 b!136352) bm!1803))

(assert (= (or b!136354 b!136352) bm!1804))

(assert (= (and d!43950 res!113458) b!136353))

(assert (= (and b!136353 res!113457) b!136351))

(assert (= (and d!43950 (not res!113456)) b!136355))

(declare-fun m!208673 () Bool)

(assert (=> d!43950 m!208673))

(declare-fun m!208675 () Bool)

(assert (=> d!43950 m!208675))

(assert (=> b!136352 m!208571))

(declare-fun m!208677 () Bool)

(assert (=> b!136352 m!208677))

(declare-fun m!208679 () Bool)

(assert (=> bm!1803 m!208679))

(declare-fun m!208681 () Bool)

(assert (=> bm!1803 m!208681))

(declare-fun m!208683 () Bool)

(assert (=> bm!1805 m!208683))

(declare-fun m!208685 () Bool)

(assert (=> b!136354 m!208685))

(declare-fun m!208687 () Bool)

(assert (=> b!136354 m!208687))

(declare-fun m!208689 () Bool)

(assert (=> b!136354 m!208689))

(declare-fun m!208691 () Bool)

(assert (=> b!136354 m!208691))

(declare-fun m!208693 () Bool)

(assert (=> b!136354 m!208693))

(assert (=> b!136354 m!208675))

(assert (=> b!136354 m!207327))

(declare-fun m!208695 () Bool)

(assert (=> b!136354 m!208695))

(assert (=> b!136354 m!207327))

(declare-fun m!208697 () Bool)

(assert (=> b!136354 m!208697))

(declare-fun m!208699 () Bool)

(assert (=> b!136354 m!208699))

(declare-fun m!208701 () Bool)

(assert (=> b!136354 m!208701))

(declare-fun m!208703 () Bool)

(assert (=> b!136354 m!208703))

(declare-fun m!208705 () Bool)

(assert (=> b!136354 m!208705))

(assert (=> b!136354 m!208679))

(declare-fun m!208707 () Bool)

(assert (=> b!136351 m!208707))

(declare-fun m!208709 () Bool)

(assert (=> bm!1804 m!208709))

(declare-fun m!208711 () Bool)

(assert (=> b!136355 m!208711))

(assert (=> b!136355 m!207327))

(declare-fun m!208713 () Bool)

(assert (=> b!136355 m!208713))

(assert (=> d!43538 d!43950))

(assert (=> d!43550 d!43544))

(declare-fun d!43952 () Bool)

(assert (=> d!43952 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!210775)))) ((_ sign_extend 32) (currentByte!5995 thiss!1634)) ((_ sign_extend 32) (currentBit!5990 thiss!1634)) (bvsub to!404 from!447))))

(assert (=> d!43952 true))

(declare-fun _$5!48 () Unit!8448)

(assert (=> d!43952 (= (choose!26 thiss!1634 (buf!3198 (_2!6234 lt!210775)) (bvsub to!404 from!447) (BitStream!4875 (buf!3198 (_2!6234 lt!210775)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634))) _$5!48)))

(declare-fun bs!10705 () Bool)

(assert (= bs!10705 d!43952))

(assert (=> bs!10705 m!207335))

(assert (=> d!43550 d!43952))

(declare-fun d!43954 () Bool)

(declare-fun res!113461 () Bool)

(declare-fun e!90556 () Bool)

(assert (=> d!43954 (=> (not res!113461) (not e!90556))))

(assert (=> d!43954 (= res!113461 (= (size!2805 (buf!3198 (_1!6237 lt!211216))) (size!2805 (buf!3198 thiss!1634))))))

(assert (=> d!43954 (= (isPrefixOf!0 (_1!6237 lt!211216) thiss!1634) e!90556)))

(declare-fun b!136356 () Bool)

(declare-fun res!113460 () Bool)

(assert (=> b!136356 (=> (not res!113460) (not e!90556))))

(assert (=> b!136356 (= res!113460 (bvsle (bitIndex!0 (size!2805 (buf!3198 (_1!6237 lt!211216))) (currentByte!5995 (_1!6237 lt!211216)) (currentBit!5990 (_1!6237 lt!211216))) (bitIndex!0 (size!2805 (buf!3198 thiss!1634)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634))))))

(declare-fun b!136357 () Bool)

(declare-fun e!90555 () Bool)

(assert (=> b!136357 (= e!90556 e!90555)))

(declare-fun res!113459 () Bool)

(assert (=> b!136357 (=> res!113459 e!90555)))

(assert (=> b!136357 (= res!113459 (= (size!2805 (buf!3198 (_1!6237 lt!211216))) #b00000000000000000000000000000000))))

(declare-fun b!136358 () Bool)

(assert (=> b!136358 (= e!90555 (arrayBitRangesEq!0 (buf!3198 (_1!6237 lt!211216)) (buf!3198 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2805 (buf!3198 (_1!6237 lt!211216))) (currentByte!5995 (_1!6237 lt!211216)) (currentBit!5990 (_1!6237 lt!211216)))))))

(assert (= (and d!43954 res!113461) b!136356))

(assert (= (and b!136356 res!113460) b!136357))

(assert (= (and b!136357 (not res!113459)) b!136358))

(declare-fun m!208715 () Bool)

(assert (=> b!136356 m!208715))

(assert (=> b!136356 m!207287))

(assert (=> b!136358 m!208715))

(assert (=> b!136358 m!208715))

(declare-fun m!208717 () Bool)

(assert (=> b!136358 m!208717))

(assert (=> b!135927 d!43954))

(declare-fun d!43956 () Bool)

(declare-fun e!90559 () Bool)

(assert (=> d!43956 e!90559))

(declare-fun res!113464 () Bool)

(assert (=> d!43956 (=> (not res!113464) (not e!90559))))

(declare-fun lt!212136 () (_ BitVec 64))

(declare-fun lt!212135 () BitStream!4874)

(assert (=> d!43956 (= res!113464 (= (bvadd lt!212136 (bvsub lt!211222 lt!211217)) (bitIndex!0 (size!2805 (buf!3198 lt!212135)) (currentByte!5995 lt!212135) (currentBit!5990 lt!212135))))))

(assert (=> d!43956 (or (not (= (bvand lt!212136 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!211222 lt!211217) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!212136 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!212136 (bvsub lt!211222 lt!211217)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!43956 (= lt!212136 (bitIndex!0 (size!2805 (buf!3198 (_2!6237 lt!211216))) (currentByte!5995 (_2!6237 lt!211216)) (currentBit!5990 (_2!6237 lt!211216))))))

(declare-fun moveBitIndex!0 (BitStream!4874 (_ BitVec 64)) tuple2!11836)

(assert (=> d!43956 (= lt!212135 (_2!6234 (moveBitIndex!0 (_2!6237 lt!211216) (bvsub lt!211222 lt!211217))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4874 (_ BitVec 64)) Bool)

(assert (=> d!43956 (moveBitIndexPrecond!0 (_2!6237 lt!211216) (bvsub lt!211222 lt!211217))))

(assert (=> d!43956 (= (withMovedBitIndex!0 (_2!6237 lt!211216) (bvsub lt!211222 lt!211217)) lt!212135)))

(declare-fun b!136361 () Bool)

(assert (=> b!136361 (= e!90559 (= (size!2805 (buf!3198 (_2!6237 lt!211216))) (size!2805 (buf!3198 lt!212135))))))

(assert (= (and d!43956 res!113464) b!136361))

(declare-fun m!208719 () Bool)

(assert (=> d!43956 m!208719))

(declare-fun m!208721 () Bool)

(assert (=> d!43956 m!208721))

(declare-fun m!208723 () Bool)

(assert (=> d!43956 m!208723))

(declare-fun m!208725 () Bool)

(assert (=> d!43956 m!208725))

(assert (=> b!135925 d!43956))

(assert (=> b!135925 d!43593))

(assert (=> b!135925 d!43591))

(assert (=> d!43546 d!43502))

(declare-fun d!43958 () Bool)

(assert (=> d!43958 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!210775)))) ((_ sign_extend 32) (currentByte!5995 (_2!6234 lt!210768))) ((_ sign_extend 32) (currentBit!5990 (_2!6234 lt!210768))) lt!210784)))

(assert (=> d!43958 true))

(declare-fun _$5!49 () Unit!8448)

(assert (=> d!43958 (= (choose!26 (_2!6234 lt!210768) (buf!3198 (_2!6234 lt!210775)) lt!210784 (BitStream!4875 (buf!3198 (_2!6234 lt!210775)) (currentByte!5995 (_2!6234 lt!210768)) (currentBit!5990 (_2!6234 lt!210768)))) _$5!49)))

(declare-fun bs!10706 () Bool)

(assert (= bs!10706 d!43958))

(assert (=> bs!10706 m!207315))

(assert (=> d!43546 d!43958))

(declare-fun lt!212165 () tuple2!11846)

(declare-fun c!7717 () Bool)

(declare-fun bm!1806 () Bool)

(declare-fun call!1810 () Bool)

(assert (=> bm!1806 (= call!1810 (arrayRangesEq!208 arr!237 (ite c!7717 (array!6195 (store (arr!3470 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6240 lt!212165)) (size!2805 arr!237)) arr!237) #b00000000000000000000000000000000 (ite c!7717 (bvadd #b00000000000000000000000000000001 from!447) (size!2805 arr!237))))))

(declare-fun call!1809 () (_ BitVec 64))

(declare-fun lt!212166 () tuple3!516)

(declare-fun bm!1807 () Bool)

(assert (=> bm!1807 (= call!1809 (bitIndex!0 (ite c!7717 (size!2805 (buf!3198 (_2!6241 lt!212166))) (size!2805 (buf!3198 (_1!6237 lt!210793)))) (ite c!7717 (currentByte!5995 (_2!6241 lt!212166)) (currentByte!5995 (_1!6237 lt!210793))) (ite c!7717 (currentBit!5990 (_2!6241 lt!212166)) (currentBit!5990 (_1!6237 lt!210793)))))))

(declare-fun lt!212144 () (_ BitVec 32))

(declare-fun lt!212147 () (_ BitVec 32))

(declare-fun call!1811 () Bool)

(declare-fun lt!212157 () (_ BitVec 32))

(declare-fun lt!212156 () array!6194)

(declare-fun bm!1808 () Bool)

(declare-fun lt!212169 () array!6194)

(assert (=> bm!1808 (= call!1811 (arrayRangesEq!208 (ite c!7717 arr!237 lt!212169) (ite c!7717 (_3!317 lt!212166) lt!212156) (ite c!7717 lt!212147 lt!212144) (ite c!7717 (bvadd #b00000000000000000000000000000001 from!447) lt!212157)))))

(declare-fun b!136362 () Bool)

(declare-fun e!90562 () Bool)

(declare-fun lt!212140 () tuple3!516)

(assert (=> b!136362 (= e!90562 (arrayRangesEq!208 arr!237 (_3!317 lt!212140) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun b!136363 () Bool)

(declare-fun lt!212170 () Unit!8448)

(declare-fun e!90561 () tuple3!516)

(assert (=> b!136363 (= e!90561 (tuple3!517 lt!212170 (_1!6237 lt!210793) arr!237))))

(assert (=> b!136363 (= call!1809 call!1809)))

(declare-fun lt!212167 () Unit!8448)

(declare-fun Unit!8533 () Unit!8448)

(assert (=> b!136363 (= lt!212167 Unit!8533)))

(declare-fun lt!212151 () Unit!8448)

(assert (=> b!136363 (= lt!212151 (arrayRangesEqReflexiveLemma!6 arr!237))))

(assert (=> b!136363 call!1810))

(declare-fun lt!212142 () Unit!8448)

(assert (=> b!136363 (= lt!212142 lt!212151)))

(assert (=> b!136363 (= lt!212169 arr!237)))

(assert (=> b!136363 (= lt!212156 arr!237)))

(declare-fun lt!212150 () (_ BitVec 32))

(assert (=> b!136363 (= lt!212150 #b00000000000000000000000000000000)))

(declare-fun lt!212172 () (_ BitVec 32))

(assert (=> b!136363 (= lt!212172 (size!2805 arr!237))))

(assert (=> b!136363 (= lt!212144 #b00000000000000000000000000000000)))

(assert (=> b!136363 (= lt!212157 (bvadd #b00000000000000000000000000000001 from!447))))

(assert (=> b!136363 (= lt!212170 (arrayRangesEqSlicedLemma!6 lt!212169 lt!212156 lt!212150 lt!212172 lt!212144 lt!212157))))

(assert (=> b!136363 call!1811))

(declare-fun b!136364 () Bool)

(declare-fun res!113466 () Bool)

(assert (=> b!136364 (=> (not res!113466) (not e!90562))))

(assert (=> b!136364 (= res!113466 (and (= (buf!3198 (_1!6237 lt!210793)) (buf!3198 (_2!6241 lt!212140))) (= (size!2805 arr!237) (size!2805 (_3!317 lt!212140)))))))

(declare-fun d!43960 () Bool)

(declare-fun e!90560 () Bool)

(assert (=> d!43960 e!90560))

(declare-fun res!113465 () Bool)

(assert (=> d!43960 (=> res!113465 e!90560)))

(assert (=> d!43960 (= res!113465 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!212163 () Bool)

(assert (=> d!43960 (= lt!212163 e!90562)))

(declare-fun res!113467 () Bool)

(assert (=> d!43960 (=> (not res!113467) (not e!90562))))

(declare-fun lt!212155 () (_ BitVec 64))

(declare-fun lt!212154 () (_ BitVec 64))

(assert (=> d!43960 (= res!113467 (= (bvadd lt!212155 lt!212154) (bitIndex!0 (size!2805 (buf!3198 (_2!6241 lt!212140))) (currentByte!5995 (_2!6241 lt!212140)) (currentBit!5990 (_2!6241 lt!212140)))))))

(assert (=> d!43960 (or (not (= (bvand lt!212155 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!212154 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!212155 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!212155 lt!212154) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!212148 () (_ BitVec 64))

(assert (=> d!43960 (= lt!212154 (bvmul lt!212148 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!43960 (or (= lt!212148 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!212148 #b0000000000000000000000000000000000000000000000000000000000001000) lt!212148)))))

(assert (=> d!43960 (= lt!212148 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!43960 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!43960 (= lt!212155 (bitIndex!0 (size!2805 (buf!3198 (_1!6237 lt!210793))) (currentByte!5995 (_1!6237 lt!210793)) (currentBit!5990 (_1!6237 lt!210793))))))

(assert (=> d!43960 (= lt!212140 e!90561)))

(assert (=> d!43960 (= c!7717 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!43960 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2805 arr!237)))))

(assert (=> d!43960 (= (readByteArrayLoop!0 (_1!6237 lt!210793) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!212140)))

(declare-fun b!136365 () Bool)

(declare-fun lt!212137 () Unit!8448)

(assert (=> b!136365 (= e!90561 (tuple3!517 lt!212137 (_2!6241 lt!212166) (_3!317 lt!212166)))))

(assert (=> b!136365 (= lt!212165 (readByte!0 (_1!6237 lt!210793)))))

(declare-fun lt!212159 () array!6194)

(assert (=> b!136365 (= lt!212159 (array!6195 (store (arr!3470 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6240 lt!212165)) (size!2805 arr!237)))))

(declare-fun lt!212160 () (_ BitVec 64))

(assert (=> b!136365 (= lt!212160 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!212162 () (_ BitVec 32))

(assert (=> b!136365 (= lt!212162 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!212171 () Unit!8448)

(assert (=> b!136365 (= lt!212171 (validateOffsetBytesFromBitIndexLemma!0 (_1!6237 lt!210793) (_2!6240 lt!212165) lt!212160 lt!212162))))

(assert (=> b!136365 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6240 lt!212165)))) ((_ sign_extend 32) (currentByte!5995 (_2!6240 lt!212165))) ((_ sign_extend 32) (currentBit!5990 (_2!6240 lt!212165))) (bvsub lt!212162 ((_ extract 31 0) (bvsdiv (bvadd lt!212160 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!212149 () Unit!8448)

(assert (=> b!136365 (= lt!212149 lt!212171)))

(assert (=> b!136365 (= lt!212166 (readByteArrayLoop!0 (_2!6240 lt!212165) lt!212159 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!136365 (= (bitIndex!0 (size!2805 (buf!3198 (_2!6240 lt!212165))) (currentByte!5995 (_2!6240 lt!212165)) (currentBit!5990 (_2!6240 lt!212165))) (bvadd (bitIndex!0 (size!2805 (buf!3198 (_1!6237 lt!210793))) (currentByte!5995 (_1!6237 lt!210793)) (currentBit!5990 (_1!6237 lt!210793))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!212168 () Unit!8448)

(declare-fun Unit!8534 () Unit!8448)

(assert (=> b!136365 (= lt!212168 Unit!8534)))

(assert (=> b!136365 (= (bvadd (bitIndex!0 (size!2805 (buf!3198 (_2!6240 lt!212165))) (currentByte!5995 (_2!6240 lt!212165)) (currentBit!5990 (_2!6240 lt!212165))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!1809)))

(declare-fun lt!212143 () Unit!8448)

(declare-fun Unit!8535 () Unit!8448)

(assert (=> b!136365 (= lt!212143 Unit!8535)))

(assert (=> b!136365 (= (bvadd (bitIndex!0 (size!2805 (buf!3198 (_1!6237 lt!210793))) (currentByte!5995 (_1!6237 lt!210793)) (currentBit!5990 (_1!6237 lt!210793))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!1809)))

(declare-fun lt!212153 () Unit!8448)

(declare-fun Unit!8536 () Unit!8448)

(assert (=> b!136365 (= lt!212153 Unit!8536)))

(assert (=> b!136365 (and (= (buf!3198 (_1!6237 lt!210793)) (buf!3198 (_2!6241 lt!212166))) (= (size!2805 arr!237) (size!2805 (_3!317 lt!212166))))))

(declare-fun lt!212139 () Unit!8448)

(declare-fun Unit!8537 () Unit!8448)

(assert (=> b!136365 (= lt!212139 Unit!8537)))

(declare-fun lt!212145 () Unit!8448)

(assert (=> b!136365 (= lt!212145 (arrayUpdatedAtPrefixLemma!6 arr!237 (bvadd #b00000000000000000000000000000001 from!447) (_1!6240 lt!212165)))))

(assert (=> b!136365 call!1810))

(declare-fun lt!212158 () Unit!8448)

(assert (=> b!136365 (= lt!212158 lt!212145)))

(assert (=> b!136365 (= lt!212147 #b00000000000000000000000000000000)))

(declare-fun lt!212138 () Unit!8448)

(assert (=> b!136365 (= lt!212138 (arrayRangesEqTransitive!10 arr!237 lt!212159 (_3!317 lt!212166) lt!212147 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!136365 call!1811))

(declare-fun lt!212152 () Unit!8448)

(assert (=> b!136365 (= lt!212152 lt!212138)))

(assert (=> b!136365 (arrayRangesEq!208 arr!237 (_3!317 lt!212166) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!212161 () Unit!8448)

(declare-fun Unit!8538 () Unit!8448)

(assert (=> b!136365 (= lt!212161 Unit!8538)))

(declare-fun lt!212164 () Unit!8448)

(assert (=> b!136365 (= lt!212164 (arrayRangesEqImpliesEq!6 lt!212159 (_3!317 lt!212166) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!136365 (= (select (store (arr!3470 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6240 lt!212165)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3470 (_3!317 lt!212166)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!212146 () Unit!8448)

(assert (=> b!136365 (= lt!212146 lt!212164)))

(declare-fun lt!212141 () Bool)

(assert (=> b!136365 (= lt!212141 (= (select (arr!3470 (_3!317 lt!212166)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6240 lt!212165)))))

(declare-fun Unit!8539 () Unit!8448)

(assert (=> b!136365 (= lt!212137 Unit!8539)))

(assert (=> b!136365 lt!212141))

(declare-fun b!136366 () Bool)

(assert (=> b!136366 (= e!90560 (= (select (arr!3470 (_3!317 lt!212140)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6235 (readBytePure!0 (_1!6237 lt!210793)))))))

(assert (=> b!136366 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!2805 (_3!317 lt!212140))))))

(assert (= (and d!43960 c!7717) b!136365))

(assert (= (and d!43960 (not c!7717)) b!136363))

(assert (= (or b!136365 b!136363) bm!1808))

(assert (= (or b!136365 b!136363) bm!1806))

(assert (= (or b!136365 b!136363) bm!1807))

(assert (= (and d!43960 res!113467) b!136364))

(assert (= (and b!136364 res!113466) b!136362))

(assert (= (and d!43960 (not res!113465)) b!136366))

(declare-fun m!208727 () Bool)

(assert (=> d!43960 m!208727))

(declare-fun m!208729 () Bool)

(assert (=> d!43960 m!208729))

(declare-fun m!208731 () Bool)

(assert (=> b!136363 m!208731))

(declare-fun m!208733 () Bool)

(assert (=> b!136363 m!208733))

(declare-fun m!208735 () Bool)

(assert (=> bm!1806 m!208735))

(declare-fun m!208737 () Bool)

(assert (=> bm!1806 m!208737))

(declare-fun m!208739 () Bool)

(assert (=> bm!1808 m!208739))

(declare-fun m!208741 () Bool)

(assert (=> b!136365 m!208741))

(declare-fun m!208743 () Bool)

(assert (=> b!136365 m!208743))

(declare-fun m!208745 () Bool)

(assert (=> b!136365 m!208745))

(declare-fun m!208747 () Bool)

(assert (=> b!136365 m!208747))

(declare-fun m!208749 () Bool)

(assert (=> b!136365 m!208749))

(assert (=> b!136365 m!208729))

(declare-fun m!208751 () Bool)

(assert (=> b!136365 m!208751))

(declare-fun m!208753 () Bool)

(assert (=> b!136365 m!208753))

(declare-fun m!208755 () Bool)

(assert (=> b!136365 m!208755))

(declare-fun m!208757 () Bool)

(assert (=> b!136365 m!208757))

(declare-fun m!208759 () Bool)

(assert (=> b!136365 m!208759))

(declare-fun m!208761 () Bool)

(assert (=> b!136365 m!208761))

(assert (=> b!136365 m!208735))

(declare-fun m!208763 () Bool)

(assert (=> b!136362 m!208763))

(declare-fun m!208765 () Bool)

(assert (=> bm!1807 m!208765))

(declare-fun m!208767 () Bool)

(assert (=> b!136366 m!208767))

(declare-fun m!208769 () Bool)

(assert (=> b!136366 m!208769))

(assert (=> d!43575 d!43960))

(assert (=> b!135943 d!43591))

(assert (=> b!135943 d!43589))

(declare-fun d!43962 () Bool)

(assert (=> d!43962 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!210768)))) ((_ sign_extend 32) (currentByte!5995 (_2!6234 lt!210768))) ((_ sign_extend 32) (currentBit!5990 (_2!6234 lt!210768))) (bvsub (bvsub to!404 from!447) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!43962 true))

(declare-fun _$7!61 () Unit!8448)

(assert (=> d!43962 (= (choose!57 thiss!1634 (_2!6234 lt!210768) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) _$7!61)))

(declare-fun bs!10707 () Bool)

(assert (= bs!10707 d!43962))

(declare-fun m!208771 () Bool)

(assert (=> bs!10707 m!208771))

(assert (=> d!43560 d!43962))

(assert (=> d!43558 d!43542))

(assert (=> d!43558 d!43552))

(declare-fun d!43964 () Bool)

(declare-fun res!113468 () Bool)

(declare-fun e!90563 () Bool)

(assert (=> d!43964 (=> res!113468 e!90563)))

(assert (=> d!43964 (= res!113468 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!43964 (= (arrayRangesEq!208 (_2!6236 lt!211201) (_2!6236 lt!211203) #b00000000000000000000000000000000 to!404) e!90563)))

(declare-fun b!136367 () Bool)

(declare-fun e!90564 () Bool)

(assert (=> b!136367 (= e!90563 e!90564)))

(declare-fun res!113469 () Bool)

(assert (=> b!136367 (=> (not res!113469) (not e!90564))))

(assert (=> b!136367 (= res!113469 (= (select (arr!3470 (_2!6236 lt!211201)) #b00000000000000000000000000000000) (select (arr!3470 (_2!6236 lt!211203)) #b00000000000000000000000000000000)))))

(declare-fun b!136368 () Bool)

(assert (=> b!136368 (= e!90564 (arrayRangesEq!208 (_2!6236 lt!211201) (_2!6236 lt!211203) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!43964 (not res!113468)) b!136367))

(assert (= (and b!136367 res!113469) b!136368))

(declare-fun m!208773 () Bool)

(assert (=> b!136367 m!208773))

(declare-fun m!208775 () Bool)

(assert (=> b!136367 m!208775))

(declare-fun m!208777 () Bool)

(assert (=> b!136368 m!208777))

(assert (=> d!43558 d!43964))

(declare-fun d!43966 () Bool)

(declare-fun lt!212173 () tuple3!516)

(assert (=> d!43966 (= lt!212173 (readByteArrayLoop!0 lt!211202 (array!6195 (store (arr!3470 arr!237) from!447 (_2!6235 (readBytePure!0 (_1!6237 lt!210787)))) (size!2805 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!43966 (= (readByteArrayLoopPure!0 lt!211202 (array!6195 (store (arr!3470 arr!237) from!447 (_2!6235 (readBytePure!0 (_1!6237 lt!210787)))) (size!2805 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404) (tuple2!11841 (_2!6241 lt!212173) (_3!317 lt!212173)))))

(declare-fun bs!10708 () Bool)

(assert (= bs!10708 d!43966))

(declare-fun m!208779 () Bool)

(assert (=> bs!10708 m!208779))

(assert (=> d!43558 d!43966))

(declare-fun d!43968 () Bool)

(assert (=> d!43968 (arrayRangesEq!208 (_2!6236 (readByteArrayLoopPure!0 (_1!6237 lt!210787) arr!237 from!447 to!404)) (_2!6236 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6237 lt!210787) #b00000000000000000000000000000001) (array!6195 (store (arr!3470 arr!237) from!447 (_2!6235 (readBytePure!0 (_1!6237 lt!210787)))) (size!2805 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404)) #b00000000000000000000000000000000 to!404)))

(assert (=> d!43968 true))

(declare-fun _$13!49 () Unit!8448)

(assert (=> d!43968 (= (choose!35 (_1!6237 lt!210787) arr!237 from!447 to!404 lt!211201 (_2!6236 lt!211201) lt!211202 lt!211203 (_2!6236 lt!211203)) _$13!49)))

(declare-fun bs!10710 () Bool)

(assert (= bs!10710 d!43968))

(assert (=> bs!10710 m!207679))

(assert (=> bs!10710 m!207301))

(assert (=> bs!10710 m!207303))

(declare-fun m!208781 () Bool)

(assert (=> bs!10710 m!208781))

(assert (=> bs!10710 m!207327))

(assert (=> bs!10710 m!207327))

(declare-fun m!208783 () Bool)

(assert (=> bs!10710 m!208783))

(assert (=> d!43558 d!43968))

(assert (=> d!43558 d!43534))

(declare-fun d!43970 () Bool)

(assert (=> d!43970 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!210768)))) ((_ sign_extend 32) (currentByte!5995 (_2!6234 lt!210768))) ((_ sign_extend 32) (currentBit!5990 (_2!6234 lt!210768))) lt!211187) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!210768)))) ((_ sign_extend 32) (currentByte!5995 (_2!6234 lt!210768))) ((_ sign_extend 32) (currentBit!5990 (_2!6234 lt!210768)))) lt!211187))))

(declare-fun bs!10711 () Bool)

(assert (= bs!10711 d!43970))

(assert (=> bs!10711 m!207647))

(assert (=> b!135919 d!43970))

(assert (=> b!135883 d!43589))

(declare-fun d!43972 () Bool)

(assert (=> d!43972 (arrayBitRangesEq!0 (buf!3198 (_2!6234 lt!210775)) (buf!3198 (_2!6234 lt!210768)) lt!211129 lt!211124)))

(declare-fun lt!212176 () Unit!8448)

(declare-fun choose!8 (array!6194 array!6194 (_ BitVec 64) (_ BitVec 64)) Unit!8448)

(assert (=> d!43972 (= lt!212176 (choose!8 (buf!3198 (_2!6234 lt!210768)) (buf!3198 (_2!6234 lt!210775)) lt!211129 lt!211124))))

(assert (=> d!43972 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!211129) (bvsle lt!211129 lt!211124))))

(assert (=> d!43972 (= (arrayBitRangesEqSymmetric!0 (buf!3198 (_2!6234 lt!210768)) (buf!3198 (_2!6234 lt!210775)) lt!211129 lt!211124) lt!212176)))

(declare-fun bs!10712 () Bool)

(assert (= bs!10712 d!43972))

(assert (=> bs!10712 m!207615))

(declare-fun m!208785 () Bool)

(assert (=> bs!10712 m!208785))

(assert (=> b!135883 d!43972))

(declare-fun b!136369 () Bool)

(declare-fun res!113474 () Bool)

(declare-fun lt!212177 () (_ BitVec 32))

(assert (=> b!136369 (= res!113474 (= lt!212177 #b00000000000000000000000000000000))))

(declare-fun e!90569 () Bool)

(assert (=> b!136369 (=> res!113474 e!90569)))

(declare-fun e!90566 () Bool)

(assert (=> b!136369 (= e!90566 e!90569)))

(declare-fun lt!212178 () tuple4!120)

(declare-fun c!7718 () Bool)

(declare-fun call!1812 () Bool)

(declare-fun lt!212179 () (_ BitVec 32))

(declare-fun bm!1809 () Bool)

(assert (=> bm!1809 (= call!1812 (byteRangesEq!0 (ite c!7718 (select (arr!3470 (buf!3198 (_2!6234 lt!210775))) (_3!320 lt!212178)) (select (arr!3470 (buf!3198 (_2!6234 lt!210775))) (_4!60 lt!212178))) (ite c!7718 (select (arr!3470 (buf!3198 (_2!6234 lt!210768))) (_3!320 lt!212178)) (select (arr!3470 (buf!3198 (_2!6234 lt!210768))) (_4!60 lt!212178))) (ite c!7718 lt!212179 #b00000000000000000000000000000000) lt!212177))))

(declare-fun b!136370 () Bool)

(declare-fun e!90567 () Bool)

(assert (=> b!136370 (= e!90567 call!1812)))

(declare-fun b!136371 () Bool)

(declare-fun e!90565 () Bool)

(declare-fun e!90568 () Bool)

(assert (=> b!136371 (= e!90565 e!90568)))

(declare-fun res!113472 () Bool)

(assert (=> b!136371 (=> (not res!113472) (not e!90568))))

(declare-fun e!90570 () Bool)

(assert (=> b!136371 (= res!113472 e!90570)))

(declare-fun res!113470 () Bool)

(assert (=> b!136371 (=> res!113470 e!90570)))

(assert (=> b!136371 (= res!113470 (bvsge (_1!6247 lt!212178) (_2!6247 lt!212178)))))

(assert (=> b!136371 (= lt!212177 ((_ extract 31 0) (bvsrem lt!211124 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!136371 (= lt!212179 ((_ extract 31 0) (bvsrem lt!211129 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!136371 (= lt!212178 (arrayBitIndices!0 lt!211129 lt!211124))))

(declare-fun b!136372 () Bool)

(assert (=> b!136372 (= e!90569 call!1812)))

(declare-fun d!43974 () Bool)

(declare-fun res!113473 () Bool)

(assert (=> d!43974 (=> res!113473 e!90565)))

(assert (=> d!43974 (= res!113473 (bvsge lt!211129 lt!211124))))

(assert (=> d!43974 (= (arrayBitRangesEq!0 (buf!3198 (_2!6234 lt!210775)) (buf!3198 (_2!6234 lt!210768)) lt!211129 lt!211124) e!90565)))

(declare-fun b!136373 () Bool)

(assert (=> b!136373 (= e!90567 e!90566)))

(declare-fun res!113471 () Bool)

(assert (=> b!136373 (= res!113471 (byteRangesEq!0 (select (arr!3470 (buf!3198 (_2!6234 lt!210775))) (_3!320 lt!212178)) (select (arr!3470 (buf!3198 (_2!6234 lt!210768))) (_3!320 lt!212178)) lt!212179 #b00000000000000000000000000001000))))

(assert (=> b!136373 (=> (not res!113471) (not e!90566))))

(declare-fun b!136374 () Bool)

(assert (=> b!136374 (= e!90568 e!90567)))

(assert (=> b!136374 (= c!7718 (= (_3!320 lt!212178) (_4!60 lt!212178)))))

(declare-fun b!136375 () Bool)

(assert (=> b!136375 (= e!90570 (arrayRangesEq!208 (buf!3198 (_2!6234 lt!210775)) (buf!3198 (_2!6234 lt!210768)) (_1!6247 lt!212178) (_2!6247 lt!212178)))))

(assert (= (and d!43974 (not res!113473)) b!136371))

(assert (= (and b!136371 (not res!113470)) b!136375))

(assert (= (and b!136371 res!113472) b!136374))

(assert (= (and b!136374 c!7718) b!136370))

(assert (= (and b!136374 (not c!7718)) b!136373))

(assert (= (and b!136373 res!113471) b!136369))

(assert (= (and b!136369 (not res!113474)) b!136372))

(assert (= (or b!136370 b!136372) bm!1809))

(declare-fun m!208787 () Bool)

(assert (=> bm!1809 m!208787))

(declare-fun m!208789 () Bool)

(assert (=> bm!1809 m!208789))

(declare-fun m!208791 () Bool)

(assert (=> bm!1809 m!208791))

(declare-fun m!208793 () Bool)

(assert (=> bm!1809 m!208793))

(declare-fun m!208795 () Bool)

(assert (=> bm!1809 m!208795))

(declare-fun m!208797 () Bool)

(assert (=> b!136371 m!208797))

(assert (=> b!136373 m!208791))

(assert (=> b!136373 m!208789))

(assert (=> b!136373 m!208791))

(assert (=> b!136373 m!208789))

(declare-fun m!208799 () Bool)

(assert (=> b!136373 m!208799))

(declare-fun m!208801 () Bool)

(assert (=> b!136375 m!208801))

(assert (=> b!135883 d!43974))

(assert (=> d!43579 d!43577))

(declare-fun d!43976 () Bool)

(assert (=> d!43976 (validate_offset_bits!1 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!210775)))) ((_ sign_extend 32) (currentByte!5995 (_2!6234 lt!210768))) ((_ sign_extend 32) (currentBit!5990 (_2!6234 lt!210768))) lt!210778)))

(assert (=> d!43976 true))

(declare-fun _$6!292 () Unit!8448)

(assert (=> d!43976 (= (choose!9 (_2!6234 lt!210768) (buf!3198 (_2!6234 lt!210775)) lt!210778 (BitStream!4875 (buf!3198 (_2!6234 lt!210775)) (currentByte!5995 (_2!6234 lt!210768)) (currentBit!5990 (_2!6234 lt!210768)))) _$6!292)))

(declare-fun bs!10713 () Bool)

(assert (= bs!10713 d!43976))

(assert (=> bs!10713 m!207349))

(assert (=> d!43579 d!43976))

(declare-fun d!43978 () Bool)

(declare-fun res!113477 () Bool)

(declare-fun e!90572 () Bool)

(assert (=> d!43978 (=> (not res!113477) (not e!90572))))

(assert (=> d!43978 (= res!113477 (= (size!2805 (buf!3198 (_2!6237 lt!211114))) (size!2805 (buf!3198 (_2!6234 lt!210775)))))))

(assert (=> d!43978 (= (isPrefixOf!0 (_2!6237 lt!211114) (_2!6234 lt!210775)) e!90572)))

(declare-fun b!136376 () Bool)

(declare-fun res!113476 () Bool)

(assert (=> b!136376 (=> (not res!113476) (not e!90572))))

(assert (=> b!136376 (= res!113476 (bvsle (bitIndex!0 (size!2805 (buf!3198 (_2!6237 lt!211114))) (currentByte!5995 (_2!6237 lt!211114)) (currentBit!5990 (_2!6237 lt!211114))) (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!210775))) (currentByte!5995 (_2!6234 lt!210775)) (currentBit!5990 (_2!6234 lt!210775)))))))

(declare-fun b!136377 () Bool)

(declare-fun e!90571 () Bool)

(assert (=> b!136377 (= e!90572 e!90571)))

(declare-fun res!113475 () Bool)

(assert (=> b!136377 (=> res!113475 e!90571)))

(assert (=> b!136377 (= res!113475 (= (size!2805 (buf!3198 (_2!6237 lt!211114))) #b00000000000000000000000000000000))))

(declare-fun b!136378 () Bool)

(assert (=> b!136378 (= e!90571 (arrayBitRangesEq!0 (buf!3198 (_2!6237 lt!211114)) (buf!3198 (_2!6234 lt!210775)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2805 (buf!3198 (_2!6237 lt!211114))) (currentByte!5995 (_2!6237 lt!211114)) (currentBit!5990 (_2!6237 lt!211114)))))))

(assert (= (and d!43978 res!113477) b!136376))

(assert (= (and b!136376 res!113476) b!136377))

(assert (= (and b!136377 (not res!113475)) b!136378))

(declare-fun m!208803 () Bool)

(assert (=> b!136376 m!208803))

(assert (=> b!136376 m!207291))

(assert (=> b!136378 m!208803))

(assert (=> b!136378 m!208803))

(declare-fun m!208805 () Bool)

(assert (=> b!136378 m!208805))

(assert (=> b!135881 d!43978))

(assert (=> d!43502 d!43942))

(declare-fun d!43980 () Bool)

(declare-fun res!113480 () Bool)

(declare-fun e!90574 () Bool)

(assert (=> d!43980 (=> (not res!113480) (not e!90574))))

(assert (=> d!43980 (= res!113480 (= (size!2805 (buf!3198 (_1!6237 lt!211238))) (size!2805 (buf!3198 thiss!1634))))))

(assert (=> d!43980 (= (isPrefixOf!0 (_1!6237 lt!211238) thiss!1634) e!90574)))

(declare-fun b!136379 () Bool)

(declare-fun res!113479 () Bool)

(assert (=> b!136379 (=> (not res!113479) (not e!90574))))

(assert (=> b!136379 (= res!113479 (bvsle (bitIndex!0 (size!2805 (buf!3198 (_1!6237 lt!211238))) (currentByte!5995 (_1!6237 lt!211238)) (currentBit!5990 (_1!6237 lt!211238))) (bitIndex!0 (size!2805 (buf!3198 thiss!1634)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634))))))

(declare-fun b!136380 () Bool)

(declare-fun e!90573 () Bool)

(assert (=> b!136380 (= e!90574 e!90573)))

(declare-fun res!113478 () Bool)

(assert (=> b!136380 (=> res!113478 e!90573)))

(assert (=> b!136380 (= res!113478 (= (size!2805 (buf!3198 (_1!6237 lt!211238))) #b00000000000000000000000000000000))))

(declare-fun b!136381 () Bool)

(assert (=> b!136381 (= e!90573 (arrayBitRangesEq!0 (buf!3198 (_1!6237 lt!211238)) (buf!3198 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2805 (buf!3198 (_1!6237 lt!211238))) (currentByte!5995 (_1!6237 lt!211238)) (currentBit!5990 (_1!6237 lt!211238)))))))

(assert (= (and d!43980 res!113480) b!136379))

(assert (= (and b!136379 res!113479) b!136380))

(assert (= (and b!136380 (not res!113478)) b!136381))

(assert (=> b!136379 m!208543))

(assert (=> b!136379 m!207287))

(assert (=> b!136381 m!208543))

(assert (=> b!136381 m!208543))

(declare-fun m!208807 () Bool)

(assert (=> b!136381 m!208807))

(assert (=> b!135932 d!43980))

(declare-fun d!43982 () Bool)

(declare-fun e!90575 () Bool)

(assert (=> d!43982 e!90575))

(declare-fun res!113481 () Bool)

(assert (=> d!43982 (=> (not res!113481) (not e!90575))))

(declare-fun lt!212180 () BitStream!4874)

(declare-fun lt!212181 () (_ BitVec 64))

(assert (=> d!43982 (= res!113481 (= (bvadd lt!212181 (bvsub lt!211244 lt!211239)) (bitIndex!0 (size!2805 (buf!3198 lt!212180)) (currentByte!5995 lt!212180) (currentBit!5990 lt!212180))))))

(assert (=> d!43982 (or (not (= (bvand lt!212181 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!211244 lt!211239) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!212181 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!212181 (bvsub lt!211244 lt!211239)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!43982 (= lt!212181 (bitIndex!0 (size!2805 (buf!3198 (_2!6237 lt!211238))) (currentByte!5995 (_2!6237 lt!211238)) (currentBit!5990 (_2!6237 lt!211238))))))

(assert (=> d!43982 (= lt!212180 (_2!6234 (moveBitIndex!0 (_2!6237 lt!211238) (bvsub lt!211244 lt!211239))))))

(assert (=> d!43982 (moveBitIndexPrecond!0 (_2!6237 lt!211238) (bvsub lt!211244 lt!211239))))

(assert (=> d!43982 (= (withMovedBitIndex!0 (_2!6237 lt!211238) (bvsub lt!211244 lt!211239)) lt!212180)))

(declare-fun b!136382 () Bool)

(assert (=> b!136382 (= e!90575 (= (size!2805 (buf!3198 (_2!6237 lt!211238))) (size!2805 (buf!3198 lt!212180))))))

(assert (= (and d!43982 res!113481) b!136382))

(declare-fun m!208809 () Bool)

(assert (=> d!43982 m!208809))

(assert (=> d!43982 m!208545))

(declare-fun m!208811 () Bool)

(assert (=> d!43982 m!208811))

(declare-fun m!208813 () Bool)

(assert (=> d!43982 m!208813))

(assert (=> b!135930 d!43982))

(assert (=> b!135930 d!43589))

(assert (=> b!135930 d!43591))

(declare-fun d!43984 () Bool)

(declare-fun lt!212184 () (_ BitVec 8))

(declare-fun lt!212188 () (_ BitVec 8))

(assert (=> d!43984 (= lt!212184 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3470 (buf!3198 lt!210792)) (currentByte!5995 lt!210792))) ((_ sign_extend 24) lt!212188))))))

(assert (=> d!43984 (= lt!212188 ((_ extract 7 0) (currentBit!5990 lt!210792)))))

(declare-fun e!90576 () Bool)

(assert (=> d!43984 e!90576))

(declare-fun res!113483 () Bool)

(assert (=> d!43984 (=> (not res!113483) (not e!90576))))

(assert (=> d!43984 (= res!113483 (validate_offset_bits!1 ((_ sign_extend 32) (size!2805 (buf!3198 lt!210792))) ((_ sign_extend 32) (currentByte!5995 lt!210792)) ((_ sign_extend 32) (currentBit!5990 lt!210792)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!8540 () Unit!8448)

(declare-fun Unit!8541 () Unit!8448)

(assert (=> d!43984 (= (readByte!0 lt!210792) (tuple2!11847 (_2!6246 (ite (bvsgt ((_ sign_extend 24) lt!212188) #b00000000000000000000000000000000) (tuple2!11853 Unit!8540 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!212184) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3470 (buf!3198 lt!210792)) (bvadd (currentByte!5995 lt!210792) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!212188)))))))) (tuple2!11853 Unit!8541 lt!212184))) (BitStream!4875 (buf!3198 lt!210792) (bvadd (currentByte!5995 lt!210792) #b00000000000000000000000000000001) (currentBit!5990 lt!210792))))))

(declare-fun b!136383 () Bool)

(declare-fun e!90577 () Bool)

(assert (=> b!136383 (= e!90576 e!90577)))

(declare-fun res!113482 () Bool)

(assert (=> b!136383 (=> (not res!113482) (not e!90577))))

(declare-fun lt!212183 () tuple2!11846)

(assert (=> b!136383 (= res!113482 (= (buf!3198 (_2!6240 lt!212183)) (buf!3198 lt!210792)))))

(declare-fun lt!212185 () (_ BitVec 8))

(declare-fun lt!212182 () (_ BitVec 8))

(declare-fun Unit!8542 () Unit!8448)

(declare-fun Unit!8543 () Unit!8448)

(assert (=> b!136383 (= lt!212183 (tuple2!11847 (_2!6246 (ite (bvsgt ((_ sign_extend 24) lt!212185) #b00000000000000000000000000000000) (tuple2!11853 Unit!8542 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!212182) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3470 (buf!3198 lt!210792)) (bvadd (currentByte!5995 lt!210792) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!212185)))))))) (tuple2!11853 Unit!8543 lt!212182))) (BitStream!4875 (buf!3198 lt!210792) (bvadd (currentByte!5995 lt!210792) #b00000000000000000000000000000001) (currentBit!5990 lt!210792))))))

(assert (=> b!136383 (= lt!212182 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3470 (buf!3198 lt!210792)) (currentByte!5995 lt!210792))) ((_ sign_extend 24) lt!212185))))))

(assert (=> b!136383 (= lt!212185 ((_ extract 7 0) (currentBit!5990 lt!210792)))))

(declare-fun lt!212187 () (_ BitVec 64))

(declare-fun b!136384 () Bool)

(declare-fun lt!212186 () (_ BitVec 64))

(assert (=> b!136384 (= e!90577 (= (bitIndex!0 (size!2805 (buf!3198 (_2!6240 lt!212183))) (currentByte!5995 (_2!6240 lt!212183)) (currentBit!5990 (_2!6240 lt!212183))) (bvadd lt!212187 lt!212186)))))

(assert (=> b!136384 (or (not (= (bvand lt!212187 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!212186 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!212187 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!212187 lt!212186) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!136384 (= lt!212186 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!136384 (= lt!212187 (bitIndex!0 (size!2805 (buf!3198 lt!210792)) (currentByte!5995 lt!210792) (currentBit!5990 lt!210792)))))

(assert (= (and d!43984 res!113483) b!136383))

(assert (= (and b!136383 res!113482) b!136384))

(declare-fun m!208815 () Bool)

(assert (=> d!43984 m!208815))

(declare-fun m!208817 () Bool)

(assert (=> d!43984 m!208817))

(declare-fun m!208819 () Bool)

(assert (=> d!43984 m!208819))

(assert (=> b!136383 m!208819))

(assert (=> b!136383 m!208815))

(declare-fun m!208821 () Bool)

(assert (=> b!136384 m!208821))

(declare-fun m!208823 () Bool)

(assert (=> b!136384 m!208823))

(assert (=> d!43520 d!43984))

(declare-fun d!43986 () Bool)

(declare-fun e!90586 () Bool)

(assert (=> d!43986 e!90586))

(declare-fun res!113491 () Bool)

(assert (=> d!43986 (=> (not res!113491) (not e!90586))))

(declare-fun _$37!26 () tuple2!11836)

(assert (=> d!43986 (= res!113491 (= (size!2805 (buf!3198 thiss!1634)) (size!2805 (buf!3198 (_2!6234 _$37!26)))))))

(declare-fun e!90585 () Bool)

(assert (=> d!43986 (and (inv!12 (_2!6234 _$37!26)) e!90585)))

(assert (=> d!43986 (= (choose!6 thiss!1634 (select (arr!3470 arr!237) from!447)) _$37!26)))

(declare-fun b!136396 () Bool)

(declare-fun lt!212193 () tuple2!11842)

(declare-fun lt!212194 () tuple2!11838)

(assert (=> b!136396 (= e!90586 (and (= (_2!6235 lt!212194) (select (arr!3470 arr!237) from!447)) (= (_1!6235 lt!212194) (_2!6237 lt!212193))))))

(assert (=> b!136396 (= lt!212194 (readBytePure!0 (_1!6237 lt!212193)))))

(assert (=> b!136396 (= lt!212193 (reader!0 thiss!1634 (_2!6234 _$37!26)))))

(declare-fun b!136393 () Bool)

(assert (=> b!136393 (= e!90585 (array_inv!2594 (buf!3198 (_2!6234 _$37!26))))))

(declare-fun b!136395 () Bool)

(declare-fun res!113492 () Bool)

(assert (=> b!136395 (=> (not res!113492) (not e!90586))))

(assert (=> b!136395 (= res!113492 (isPrefixOf!0 thiss!1634 (_2!6234 _$37!26)))))

(declare-fun b!136394 () Bool)

(declare-fun res!113490 () Bool)

(assert (=> b!136394 (=> (not res!113490) (not e!90586))))

(assert (=> b!136394 (= res!113490 (= (bitIndex!0 (size!2805 (buf!3198 (_2!6234 _$37!26))) (currentByte!5995 (_2!6234 _$37!26)) (currentBit!5990 (_2!6234 _$37!26))) (bvadd (bitIndex!0 (size!2805 (buf!3198 thiss!1634)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= d!43986 b!136393))

(assert (= (and d!43986 res!113491) b!136394))

(assert (= (and b!136394 res!113490) b!136395))

(assert (= (and b!136395 res!113492) b!136396))

(declare-fun m!208825 () Bool)

(assert (=> b!136395 m!208825))

(declare-fun m!208827 () Bool)

(assert (=> b!136393 m!208827))

(declare-fun m!208829 () Bool)

(assert (=> b!136396 m!208829))

(declare-fun m!208831 () Bool)

(assert (=> b!136396 m!208831))

(declare-fun m!208833 () Bool)

(assert (=> d!43986 m!208833))

(declare-fun m!208835 () Bool)

(assert (=> b!136394 m!208835))

(assert (=> b!136394 m!207287))

(assert (=> d!43536 d!43986))

(declare-fun d!43988 () Bool)

(assert (=> d!43988 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!2805 (buf!3198 thiss!1634))) ((_ sign_extend 32) (currentByte!5995 thiss!1634)) ((_ sign_extend 32) (currentBit!5990 thiss!1634))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2805 (buf!3198 thiss!1634))) ((_ sign_extend 32) (currentByte!5995 thiss!1634)) ((_ sign_extend 32) (currentBit!5990 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!10714 () Bool)

(assert (= bs!10714 d!43988))

(assert (=> bs!10714 m!207741))

(assert (=> d!43536 d!43988))

(declare-fun lt!212195 () tuple3!516)

(declare-fun d!43990 () Bool)

(assert (=> d!43990 (= lt!212195 (readByteArrayLoop!0 (_1!6237 lt!211188) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!43990 (= (readByteArrayLoopPure!0 (_1!6237 lt!211188) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11841 (_2!6241 lt!212195) (_3!317 lt!212195)))))

(declare-fun bs!10715 () Bool)

(assert (= bs!10715 d!43990))

(declare-fun m!208837 () Bool)

(assert (=> bs!10715 m!208837))

(assert (=> b!135917 d!43990))

(declare-fun d!43992 () Bool)

(assert (=> d!43992 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!211191)))) ((_ sign_extend 32) (currentByte!5995 (_2!6234 lt!210768))) ((_ sign_extend 32) (currentBit!5990 (_2!6234 lt!210768))) lt!211187) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!211191)))) ((_ sign_extend 32) (currentByte!5995 (_2!6234 lt!210768))) ((_ sign_extend 32) (currentBit!5990 (_2!6234 lt!210768)))) lt!211187))))

(declare-fun bs!10716 () Bool)

(assert (= bs!10716 d!43992))

(declare-fun m!208839 () Bool)

(assert (=> bs!10716 m!208839))

(assert (=> b!135917 d!43992))

(declare-fun d!43994 () Bool)

(assert (=> d!43994 (validate_offset_bits!1 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!211191)))) ((_ sign_extend 32) (currentByte!5995 (_2!6234 lt!210768))) ((_ sign_extend 32) (currentBit!5990 (_2!6234 lt!210768))) lt!211187)))

(declare-fun lt!212196 () Unit!8448)

(assert (=> d!43994 (= lt!212196 (choose!9 (_2!6234 lt!210768) (buf!3198 (_2!6234 lt!211191)) lt!211187 (BitStream!4875 (buf!3198 (_2!6234 lt!211191)) (currentByte!5995 (_2!6234 lt!210768)) (currentBit!5990 (_2!6234 lt!210768)))))))

(assert (=> d!43994 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6234 lt!210768) (buf!3198 (_2!6234 lt!211191)) lt!211187) lt!212196)))

(declare-fun bs!10717 () Bool)

(assert (= bs!10717 d!43994))

(assert (=> bs!10717 m!207663))

(declare-fun m!208841 () Bool)

(assert (=> bs!10717 m!208841))

(assert (=> b!135917 d!43994))

(declare-fun b!136397 () Bool)

(declare-fun res!113495 () Bool)

(declare-fun e!90588 () Bool)

(assert (=> b!136397 (=> (not res!113495) (not e!90588))))

(declare-fun lt!212199 () tuple2!11842)

(assert (=> b!136397 (= res!113495 (isPrefixOf!0 (_2!6237 lt!212199) (_2!6234 lt!211191)))))

(declare-fun d!43996 () Bool)

(assert (=> d!43996 e!90588))

(declare-fun res!113494 () Bool)

(assert (=> d!43996 (=> (not res!113494) (not e!90588))))

(assert (=> d!43996 (= res!113494 (isPrefixOf!0 (_1!6237 lt!212199) (_2!6237 lt!212199)))))

(declare-fun lt!212206 () BitStream!4874)

(assert (=> d!43996 (= lt!212199 (tuple2!11843 lt!212206 (_2!6234 lt!211191)))))

(declare-fun lt!212198 () Unit!8448)

(declare-fun lt!212203 () Unit!8448)

(assert (=> d!43996 (= lt!212198 lt!212203)))

(assert (=> d!43996 (isPrefixOf!0 lt!212206 (_2!6234 lt!211191))))

(assert (=> d!43996 (= lt!212203 (lemmaIsPrefixTransitive!0 lt!212206 (_2!6234 lt!211191) (_2!6234 lt!211191)))))

(declare-fun lt!212211 () Unit!8448)

(declare-fun lt!212210 () Unit!8448)

(assert (=> d!43996 (= lt!212211 lt!212210)))

(assert (=> d!43996 (isPrefixOf!0 lt!212206 (_2!6234 lt!211191))))

(assert (=> d!43996 (= lt!212210 (lemmaIsPrefixTransitive!0 lt!212206 (_2!6234 lt!210768) (_2!6234 lt!211191)))))

(declare-fun lt!212213 () Unit!8448)

(declare-fun e!90587 () Unit!8448)

(assert (=> d!43996 (= lt!212213 e!90587)))

(declare-fun c!7719 () Bool)

(assert (=> d!43996 (= c!7719 (not (= (size!2805 (buf!3198 (_2!6234 lt!210768))) #b00000000000000000000000000000000)))))

(declare-fun lt!212215 () Unit!8448)

(declare-fun lt!212202 () Unit!8448)

(assert (=> d!43996 (= lt!212215 lt!212202)))

(assert (=> d!43996 (isPrefixOf!0 (_2!6234 lt!211191) (_2!6234 lt!211191))))

(assert (=> d!43996 (= lt!212202 (lemmaIsPrefixRefl!0 (_2!6234 lt!211191)))))

(declare-fun lt!212204 () Unit!8448)

(declare-fun lt!212216 () Unit!8448)

(assert (=> d!43996 (= lt!212204 lt!212216)))

(assert (=> d!43996 (= lt!212216 (lemmaIsPrefixRefl!0 (_2!6234 lt!211191)))))

(declare-fun lt!212197 () Unit!8448)

(declare-fun lt!212207 () Unit!8448)

(assert (=> d!43996 (= lt!212197 lt!212207)))

(assert (=> d!43996 (isPrefixOf!0 lt!212206 lt!212206)))

(assert (=> d!43996 (= lt!212207 (lemmaIsPrefixRefl!0 lt!212206))))

(declare-fun lt!212212 () Unit!8448)

(declare-fun lt!212201 () Unit!8448)

(assert (=> d!43996 (= lt!212212 lt!212201)))

(assert (=> d!43996 (isPrefixOf!0 (_2!6234 lt!210768) (_2!6234 lt!210768))))

(assert (=> d!43996 (= lt!212201 (lemmaIsPrefixRefl!0 (_2!6234 lt!210768)))))

(assert (=> d!43996 (= lt!212206 (BitStream!4875 (buf!3198 (_2!6234 lt!211191)) (currentByte!5995 (_2!6234 lt!210768)) (currentBit!5990 (_2!6234 lt!210768))))))

(assert (=> d!43996 (isPrefixOf!0 (_2!6234 lt!210768) (_2!6234 lt!211191))))

(assert (=> d!43996 (= (reader!0 (_2!6234 lt!210768) (_2!6234 lt!211191)) lt!212199)))

(declare-fun b!136398 () Bool)

(declare-fun lt!212205 () (_ BitVec 64))

(declare-fun lt!212200 () (_ BitVec 64))

(assert (=> b!136398 (= e!90588 (= (_1!6237 lt!212199) (withMovedBitIndex!0 (_2!6237 lt!212199) (bvsub lt!212205 lt!212200))))))

(assert (=> b!136398 (or (= (bvand lt!212205 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!212200 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!212205 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!212205 lt!212200) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!136398 (= lt!212200 (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!211191))) (currentByte!5995 (_2!6234 lt!211191)) (currentBit!5990 (_2!6234 lt!211191))))))

(assert (=> b!136398 (= lt!212205 (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!210768))) (currentByte!5995 (_2!6234 lt!210768)) (currentBit!5990 (_2!6234 lt!210768))))))

(declare-fun b!136399 () Bool)

(declare-fun lt!212208 () Unit!8448)

(assert (=> b!136399 (= e!90587 lt!212208)))

(declare-fun lt!212214 () (_ BitVec 64))

(assert (=> b!136399 (= lt!212214 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!212209 () (_ BitVec 64))

(assert (=> b!136399 (= lt!212209 (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!210768))) (currentByte!5995 (_2!6234 lt!210768)) (currentBit!5990 (_2!6234 lt!210768))))))

(assert (=> b!136399 (= lt!212208 (arrayBitRangesEqSymmetric!0 (buf!3198 (_2!6234 lt!210768)) (buf!3198 (_2!6234 lt!211191)) lt!212214 lt!212209))))

(assert (=> b!136399 (arrayBitRangesEq!0 (buf!3198 (_2!6234 lt!211191)) (buf!3198 (_2!6234 lt!210768)) lt!212214 lt!212209)))

(declare-fun b!136400 () Bool)

(declare-fun res!113493 () Bool)

(assert (=> b!136400 (=> (not res!113493) (not e!90588))))

(assert (=> b!136400 (= res!113493 (isPrefixOf!0 (_1!6237 lt!212199) (_2!6234 lt!210768)))))

(declare-fun b!136401 () Bool)

(declare-fun Unit!8544 () Unit!8448)

(assert (=> b!136401 (= e!90587 Unit!8544)))

(assert (= (and d!43996 c!7719) b!136399))

(assert (= (and d!43996 (not c!7719)) b!136401))

(assert (= (and d!43996 res!113494) b!136400))

(assert (= (and b!136400 res!113493) b!136397))

(assert (= (and b!136397 res!113495) b!136398))

(declare-fun m!208843 () Bool)

(assert (=> b!136398 m!208843))

(assert (=> b!136398 m!207669))

(assert (=> b!136398 m!207285))

(declare-fun m!208845 () Bool)

(assert (=> b!136397 m!208845))

(declare-fun m!208847 () Bool)

(assert (=> d!43996 m!208847))

(declare-fun m!208849 () Bool)

(assert (=> d!43996 m!208849))

(declare-fun m!208851 () Bool)

(assert (=> d!43996 m!208851))

(assert (=> d!43996 m!207597))

(assert (=> d!43996 m!207659))

(declare-fun m!208853 () Bool)

(assert (=> d!43996 m!208853))

(declare-fun m!208855 () Bool)

(assert (=> d!43996 m!208855))

(declare-fun m!208857 () Bool)

(assert (=> d!43996 m!208857))

(assert (=> d!43996 m!207605))

(declare-fun m!208859 () Bool)

(assert (=> d!43996 m!208859))

(declare-fun m!208861 () Bool)

(assert (=> d!43996 m!208861))

(declare-fun m!208863 () Bool)

(assert (=> b!136400 m!208863))

(assert (=> b!136399 m!207285))

(declare-fun m!208865 () Bool)

(assert (=> b!136399 m!208865))

(declare-fun m!208867 () Bool)

(assert (=> b!136399 m!208867))

(assert (=> b!135917 d!43996))

(assert (=> d!43603 d!43601))

(declare-fun d!43998 () Bool)

(assert (=> d!43998 (arrayRangesEq!208 arr!237 (_2!6236 lt!210791) #b00000000000000000000000000000000 to!404)))

(assert (=> d!43998 true))

(declare-fun _$16!47 () Unit!8448)

(assert (=> d!43998 (= (choose!69 arr!237 (_2!6236 lt!210780) (_2!6236 lt!210791) #b00000000000000000000000000000000 to!404 to!404) _$16!47)))

(declare-fun bs!10718 () Bool)

(assert (= bs!10718 d!43998))

(assert (=> bs!10718 m!207277))

(assert (=> d!43603 d!43998))

(declare-fun d!44000 () Bool)

(assert (=> d!44000 (isPrefixOf!0 lt!211121 (_2!6234 lt!210775))))

(declare-fun lt!212217 () Unit!8448)

(assert (=> d!44000 (= lt!212217 (choose!30 lt!211121 (_2!6234 lt!210768) (_2!6234 lt!210775)))))

(assert (=> d!44000 (isPrefixOf!0 lt!211121 (_2!6234 lt!210768))))

(assert (=> d!44000 (= (lemmaIsPrefixTransitive!0 lt!211121 (_2!6234 lt!210768) (_2!6234 lt!210775)) lt!212217)))

(declare-fun bs!10719 () Bool)

(assert (= bs!10719 d!44000))

(assert (=> bs!10719 m!207609))

(declare-fun m!208869 () Bool)

(assert (=> bs!10719 m!208869))

(declare-fun m!208871 () Bool)

(assert (=> bs!10719 m!208871))

(assert (=> d!43528 d!44000))

(declare-fun d!44002 () Bool)

(declare-fun res!113498 () Bool)

(declare-fun e!90590 () Bool)

(assert (=> d!44002 (=> (not res!113498) (not e!90590))))

(assert (=> d!44002 (= res!113498 (= (size!2805 (buf!3198 (_2!6234 lt!210775))) (size!2805 (buf!3198 (_2!6234 lt!210775)))))))

(assert (=> d!44002 (= (isPrefixOf!0 (_2!6234 lt!210775) (_2!6234 lt!210775)) e!90590)))

(declare-fun b!136402 () Bool)

(declare-fun res!113497 () Bool)

(assert (=> b!136402 (=> (not res!113497) (not e!90590))))

(assert (=> b!136402 (= res!113497 (bvsle (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!210775))) (currentByte!5995 (_2!6234 lt!210775)) (currentBit!5990 (_2!6234 lt!210775))) (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!210775))) (currentByte!5995 (_2!6234 lt!210775)) (currentBit!5990 (_2!6234 lt!210775)))))))

(declare-fun b!136403 () Bool)

(declare-fun e!90589 () Bool)

(assert (=> b!136403 (= e!90590 e!90589)))

(declare-fun res!113496 () Bool)

(assert (=> b!136403 (=> res!113496 e!90589)))

(assert (=> b!136403 (= res!113496 (= (size!2805 (buf!3198 (_2!6234 lt!210775))) #b00000000000000000000000000000000))))

(declare-fun b!136404 () Bool)

(assert (=> b!136404 (= e!90589 (arrayBitRangesEq!0 (buf!3198 (_2!6234 lt!210775)) (buf!3198 (_2!6234 lt!210775)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!210775))) (currentByte!5995 (_2!6234 lt!210775)) (currentBit!5990 (_2!6234 lt!210775)))))))

(assert (= (and d!44002 res!113498) b!136402))

(assert (= (and b!136402 res!113497) b!136403))

(assert (= (and b!136403 (not res!113496)) b!136404))

(assert (=> b!136402 m!207291))

(assert (=> b!136402 m!207291))

(assert (=> b!136404 m!207291))

(assert (=> b!136404 m!207291))

(declare-fun m!208873 () Bool)

(assert (=> b!136404 m!208873))

(assert (=> d!43528 d!44002))

(declare-fun d!44004 () Bool)

(declare-fun res!113501 () Bool)

(declare-fun e!90592 () Bool)

(assert (=> d!44004 (=> (not res!113501) (not e!90592))))

(assert (=> d!44004 (= res!113501 (= (size!2805 (buf!3198 lt!211121)) (size!2805 (buf!3198 (_2!6234 lt!210775)))))))

(assert (=> d!44004 (= (isPrefixOf!0 lt!211121 (_2!6234 lt!210775)) e!90592)))

(declare-fun b!136405 () Bool)

(declare-fun res!113500 () Bool)

(assert (=> b!136405 (=> (not res!113500) (not e!90592))))

(assert (=> b!136405 (= res!113500 (bvsle (bitIndex!0 (size!2805 (buf!3198 lt!211121)) (currentByte!5995 lt!211121) (currentBit!5990 lt!211121)) (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!210775))) (currentByte!5995 (_2!6234 lt!210775)) (currentBit!5990 (_2!6234 lt!210775)))))))

(declare-fun b!136406 () Bool)

(declare-fun e!90591 () Bool)

(assert (=> b!136406 (= e!90592 e!90591)))

(declare-fun res!113499 () Bool)

(assert (=> b!136406 (=> res!113499 e!90591)))

(assert (=> b!136406 (= res!113499 (= (size!2805 (buf!3198 lt!211121)) #b00000000000000000000000000000000))))

(declare-fun b!136407 () Bool)

(assert (=> b!136407 (= e!90591 (arrayBitRangesEq!0 (buf!3198 lt!211121) (buf!3198 (_2!6234 lt!210775)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2805 (buf!3198 lt!211121)) (currentByte!5995 lt!211121) (currentBit!5990 lt!211121))))))

(assert (= (and d!44004 res!113501) b!136405))

(assert (= (and b!136405 res!113500) b!136406))

(assert (= (and b!136406 (not res!113499)) b!136407))

(declare-fun m!208875 () Bool)

(assert (=> b!136405 m!208875))

(assert (=> b!136405 m!207291))

(assert (=> b!136407 m!208875))

(assert (=> b!136407 m!208875))

(declare-fun m!208877 () Bool)

(assert (=> b!136407 m!208877))

(assert (=> d!43528 d!44004))

(declare-fun d!44006 () Bool)

(declare-fun res!113504 () Bool)

(declare-fun e!90594 () Bool)

(assert (=> d!44006 (=> (not res!113504) (not e!90594))))

(assert (=> d!44006 (= res!113504 (= (size!2805 (buf!3198 (_1!6237 lt!211114))) (size!2805 (buf!3198 (_2!6237 lt!211114)))))))

(assert (=> d!44006 (= (isPrefixOf!0 (_1!6237 lt!211114) (_2!6237 lt!211114)) e!90594)))

(declare-fun b!136408 () Bool)

(declare-fun res!113503 () Bool)

(assert (=> b!136408 (=> (not res!113503) (not e!90594))))

(assert (=> b!136408 (= res!113503 (bvsle (bitIndex!0 (size!2805 (buf!3198 (_1!6237 lt!211114))) (currentByte!5995 (_1!6237 lt!211114)) (currentBit!5990 (_1!6237 lt!211114))) (bitIndex!0 (size!2805 (buf!3198 (_2!6237 lt!211114))) (currentByte!5995 (_2!6237 lt!211114)) (currentBit!5990 (_2!6237 lt!211114)))))))

(declare-fun b!136409 () Bool)

(declare-fun e!90593 () Bool)

(assert (=> b!136409 (= e!90594 e!90593)))

(declare-fun res!113502 () Bool)

(assert (=> b!136409 (=> res!113502 e!90593)))

(assert (=> b!136409 (= res!113502 (= (size!2805 (buf!3198 (_1!6237 lt!211114))) #b00000000000000000000000000000000))))

(declare-fun b!136410 () Bool)

(assert (=> b!136410 (= e!90593 (arrayBitRangesEq!0 (buf!3198 (_1!6237 lt!211114)) (buf!3198 (_2!6237 lt!211114)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2805 (buf!3198 (_1!6237 lt!211114))) (currentByte!5995 (_1!6237 lt!211114)) (currentBit!5990 (_1!6237 lt!211114)))))))

(assert (= (and d!44006 res!113504) b!136408))

(assert (= (and b!136408 res!113503) b!136409))

(assert (= (and b!136409 (not res!113502)) b!136410))

(declare-fun m!208879 () Bool)

(assert (=> b!136408 m!208879))

(assert (=> b!136408 m!208803))

(assert (=> b!136410 m!208879))

(assert (=> b!136410 m!208879))

(declare-fun m!208881 () Bool)

(assert (=> b!136410 m!208881))

(assert (=> d!43528 d!44006))

(declare-fun d!44008 () Bool)

(assert (=> d!44008 (isPrefixOf!0 lt!211121 (_2!6234 lt!210775))))

(declare-fun lt!212218 () Unit!8448)

(assert (=> d!44008 (= lt!212218 (choose!30 lt!211121 (_2!6234 lt!210775) (_2!6234 lt!210775)))))

(assert (=> d!44008 (isPrefixOf!0 lt!211121 (_2!6234 lt!210775))))

(assert (=> d!44008 (= (lemmaIsPrefixTransitive!0 lt!211121 (_2!6234 lt!210775) (_2!6234 lt!210775)) lt!212218)))

(declare-fun bs!10720 () Bool)

(assert (= bs!10720 d!44008))

(assert (=> bs!10720 m!207609))

(declare-fun m!208883 () Bool)

(assert (=> bs!10720 m!208883))

(assert (=> bs!10720 m!207609))

(assert (=> d!43528 d!44008))

(declare-fun d!44010 () Bool)

(declare-fun res!113507 () Bool)

(declare-fun e!90596 () Bool)

(assert (=> d!44010 (=> (not res!113507) (not e!90596))))

(assert (=> d!44010 (= res!113507 (= (size!2805 (buf!3198 lt!211121)) (size!2805 (buf!3198 lt!211121))))))

(assert (=> d!44010 (= (isPrefixOf!0 lt!211121 lt!211121) e!90596)))

(declare-fun b!136411 () Bool)

(declare-fun res!113506 () Bool)

(assert (=> b!136411 (=> (not res!113506) (not e!90596))))

(assert (=> b!136411 (= res!113506 (bvsle (bitIndex!0 (size!2805 (buf!3198 lt!211121)) (currentByte!5995 lt!211121) (currentBit!5990 lt!211121)) (bitIndex!0 (size!2805 (buf!3198 lt!211121)) (currentByte!5995 lt!211121) (currentBit!5990 lt!211121))))))

(declare-fun b!136412 () Bool)

(declare-fun e!90595 () Bool)

(assert (=> b!136412 (= e!90596 e!90595)))

(declare-fun res!113505 () Bool)

(assert (=> b!136412 (=> res!113505 e!90595)))

(assert (=> b!136412 (= res!113505 (= (size!2805 (buf!3198 lt!211121)) #b00000000000000000000000000000000))))

(declare-fun b!136413 () Bool)

(assert (=> b!136413 (= e!90595 (arrayBitRangesEq!0 (buf!3198 lt!211121) (buf!3198 lt!211121) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2805 (buf!3198 lt!211121)) (currentByte!5995 lt!211121) (currentBit!5990 lt!211121))))))

(assert (= (and d!44010 res!113507) b!136411))

(assert (= (and b!136411 res!113506) b!136412))

(assert (= (and b!136412 (not res!113505)) b!136413))

(assert (=> b!136411 m!208875))

(assert (=> b!136411 m!208875))

(assert (=> b!136413 m!208875))

(assert (=> b!136413 m!208875))

(declare-fun m!208885 () Bool)

(assert (=> b!136413 m!208885))

(assert (=> d!43528 d!44010))

(declare-fun d!44012 () Bool)

(assert (=> d!44012 (isPrefixOf!0 (_2!6234 lt!210775) (_2!6234 lt!210775))))

(declare-fun lt!212219 () Unit!8448)

(assert (=> d!44012 (= lt!212219 (choose!11 (_2!6234 lt!210775)))))

(assert (=> d!44012 (= (lemmaIsPrefixRefl!0 (_2!6234 lt!210775)) lt!212219)))

(declare-fun bs!10721 () Bool)

(assert (= bs!10721 d!44012))

(assert (=> bs!10721 m!207599))

(declare-fun m!208887 () Bool)

(assert (=> bs!10721 m!208887))

(assert (=> d!43528 d!44012))

(assert (=> d!43528 d!43906))

(assert (=> d!43528 d!43583))

(assert (=> d!43528 d!43900))

(declare-fun d!44014 () Bool)

(assert (=> d!44014 (isPrefixOf!0 lt!211121 lt!211121)))

(declare-fun lt!212220 () Unit!8448)

(assert (=> d!44014 (= lt!212220 (choose!11 lt!211121))))

(assert (=> d!44014 (= (lemmaIsPrefixRefl!0 lt!211121) lt!212220)))

(declare-fun bs!10722 () Bool)

(assert (= bs!10722 d!44014))

(assert (=> bs!10722 m!207595))

(declare-fun m!208889 () Bool)

(assert (=> bs!10722 m!208889))

(assert (=> d!43528 d!44014))

(declare-fun d!44016 () Bool)

(declare-fun e!90597 () Bool)

(assert (=> d!44016 e!90597))

(declare-fun res!113509 () Bool)

(assert (=> d!44016 (=> (not res!113509) (not e!90597))))

(declare-fun lt!212221 () (_ BitVec 64))

(declare-fun lt!212223 () (_ BitVec 64))

(declare-fun lt!212224 () (_ BitVec 64))

(assert (=> d!44016 (= res!113509 (= lt!212223 (bvsub lt!212224 lt!212221)))))

(assert (=> d!44016 (or (= (bvand lt!212224 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!212221 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!212224 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!212224 lt!212221) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44016 (= lt!212221 (remainingBits!0 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!211156)))) ((_ sign_extend 32) (currentByte!5995 (_2!6234 lt!211156))) ((_ sign_extend 32) (currentBit!5990 (_2!6234 lt!211156)))))))

(declare-fun lt!212226 () (_ BitVec 64))

(declare-fun lt!212222 () (_ BitVec 64))

(assert (=> d!44016 (= lt!212224 (bvmul lt!212226 lt!212222))))

(assert (=> d!44016 (or (= lt!212226 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!212222 (bvsdiv (bvmul lt!212226 lt!212222) lt!212226)))))

(assert (=> d!44016 (= lt!212222 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44016 (= lt!212226 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!211156)))))))

(assert (=> d!44016 (= lt!212223 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5995 (_2!6234 lt!211156))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5990 (_2!6234 lt!211156)))))))

(assert (=> d!44016 (invariant!0 (currentBit!5990 (_2!6234 lt!211156)) (currentByte!5995 (_2!6234 lt!211156)) (size!2805 (buf!3198 (_2!6234 lt!211156))))))

(assert (=> d!44016 (= (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!211156))) (currentByte!5995 (_2!6234 lt!211156)) (currentBit!5990 (_2!6234 lt!211156))) lt!212223)))

(declare-fun b!136414 () Bool)

(declare-fun res!113508 () Bool)

(assert (=> b!136414 (=> (not res!113508) (not e!90597))))

(assert (=> b!136414 (= res!113508 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!212223))))

(declare-fun b!136415 () Bool)

(declare-fun lt!212225 () (_ BitVec 64))

(assert (=> b!136415 (= e!90597 (bvsle lt!212223 (bvmul lt!212225 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!136415 (or (= lt!212225 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!212225 #b0000000000000000000000000000000000000000000000000000000000001000) lt!212225)))))

(assert (=> b!136415 (= lt!212225 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!211156)))))))

(assert (= (and d!44016 res!113509) b!136414))

(assert (= (and b!136414 res!113508) b!136415))

(declare-fun m!208891 () Bool)

(assert (=> d!44016 m!208891))

(declare-fun m!208893 () Bool)

(assert (=> d!44016 m!208893))

(assert (=> b!135894 d!44016))

(assert (=> b!135894 d!43591))

(assert (=> d!43530 d!43554))

(declare-fun d!44018 () Bool)

(assert (=> d!44018 (isPrefixOf!0 thiss!1634 (_2!6234 lt!210775))))

(assert (=> d!44018 true))

(declare-fun _$15!216 () Unit!8448)

(assert (=> d!44018 (= (choose!30 thiss!1634 (_2!6234 lt!210768) (_2!6234 lt!210775)) _$15!216)))

(declare-fun bs!10723 () Bool)

(assert (= bs!10723 d!44018))

(assert (=> bs!10723 m!207309))

(assert (=> d!43530 d!44018))

(assert (=> d!43530 d!43595))

(assert (=> d!43504 d!43520))

(declare-fun d!44020 () Bool)

(declare-fun lt!212227 () tuple2!11846)

(assert (=> d!44020 (= lt!212227 (readByte!0 lt!211043))))

(assert (=> d!44020 (= (readBytePure!0 lt!211043) (tuple2!11839 (_2!6240 lt!212227) (_1!6240 lt!212227)))))

(declare-fun bs!10724 () Bool)

(assert (= bs!10724 d!44020))

(declare-fun m!208895 () Bool)

(assert (=> bs!10724 m!208895))

(assert (=> d!43504 d!44020))

(declare-fun d!44022 () Bool)

(declare-fun e!90598 () Bool)

(assert (=> d!44022 e!90598))

(declare-fun res!113511 () Bool)

(assert (=> d!44022 (=> (not res!113511) (not e!90598))))

(declare-fun lt!212228 () (_ BitVec 64))

(declare-fun lt!212230 () (_ BitVec 64))

(declare-fun lt!212231 () (_ BitVec 64))

(assert (=> d!44022 (= res!113511 (= lt!212230 (bvsub lt!212231 lt!212228)))))

(assert (=> d!44022 (or (= (bvand lt!212231 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!212228 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!212231 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!212231 lt!212228) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44022 (= lt!212228 (remainingBits!0 ((_ sign_extend 32) (size!2805 (buf!3198 (_1!6235 lt!211046)))) ((_ sign_extend 32) (currentByte!5995 (_1!6235 lt!211046))) ((_ sign_extend 32) (currentBit!5990 (_1!6235 lt!211046)))))))

(declare-fun lt!212233 () (_ BitVec 64))

(declare-fun lt!212229 () (_ BitVec 64))

(assert (=> d!44022 (= lt!212231 (bvmul lt!212233 lt!212229))))

(assert (=> d!44022 (or (= lt!212233 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!212229 (bvsdiv (bvmul lt!212233 lt!212229) lt!212233)))))

(assert (=> d!44022 (= lt!212229 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44022 (= lt!212233 ((_ sign_extend 32) (size!2805 (buf!3198 (_1!6235 lt!211046)))))))

(assert (=> d!44022 (= lt!212230 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5995 (_1!6235 lt!211046))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5990 (_1!6235 lt!211046)))))))

(assert (=> d!44022 (invariant!0 (currentBit!5990 (_1!6235 lt!211046)) (currentByte!5995 (_1!6235 lt!211046)) (size!2805 (buf!3198 (_1!6235 lt!211046))))))

(assert (=> d!44022 (= (bitIndex!0 (size!2805 (buf!3198 (_1!6235 lt!211046))) (currentByte!5995 (_1!6235 lt!211046)) (currentBit!5990 (_1!6235 lt!211046))) lt!212230)))

(declare-fun b!136416 () Bool)

(declare-fun res!113510 () Bool)

(assert (=> b!136416 (=> (not res!113510) (not e!90598))))

(assert (=> b!136416 (= res!113510 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!212230))))

(declare-fun b!136417 () Bool)

(declare-fun lt!212232 () (_ BitVec 64))

(assert (=> b!136417 (= e!90598 (bvsle lt!212230 (bvmul lt!212232 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!136417 (or (= lt!212232 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!212232 #b0000000000000000000000000000000000000000000000000000000000001000) lt!212232)))))

(assert (=> b!136417 (= lt!212232 ((_ sign_extend 32) (size!2805 (buf!3198 (_1!6235 lt!211046)))))))

(assert (= (and d!44022 res!113511) b!136416))

(assert (= (and b!136416 res!113510) b!136417))

(declare-fun m!208897 () Bool)

(assert (=> d!44022 m!208897))

(declare-fun m!208899 () Bool)

(assert (=> d!44022 m!208899))

(assert (=> d!43504 d!44022))

(declare-fun d!44024 () Bool)

(declare-fun e!90599 () Bool)

(assert (=> d!44024 e!90599))

(declare-fun res!113513 () Bool)

(assert (=> d!44024 (=> (not res!113513) (not e!90599))))

(declare-fun lt!212234 () (_ BitVec 64))

(declare-fun lt!212236 () (_ BitVec 64))

(declare-fun lt!212237 () (_ BitVec 64))

(assert (=> d!44024 (= res!113513 (= lt!212236 (bvsub lt!212237 lt!212234)))))

(assert (=> d!44024 (or (= (bvand lt!212237 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!212234 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!212237 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!212237 lt!212234) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44024 (= lt!212234 (remainingBits!0 ((_ sign_extend 32) (size!2805 (buf!3198 (_1!6235 lt!211044)))) ((_ sign_extend 32) (currentByte!5995 (_1!6235 lt!211044))) ((_ sign_extend 32) (currentBit!5990 (_1!6235 lt!211044)))))))

(declare-fun lt!212239 () (_ BitVec 64))

(declare-fun lt!212235 () (_ BitVec 64))

(assert (=> d!44024 (= lt!212237 (bvmul lt!212239 lt!212235))))

(assert (=> d!44024 (or (= lt!212239 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!212235 (bvsdiv (bvmul lt!212239 lt!212235) lt!212239)))))

(assert (=> d!44024 (= lt!212235 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44024 (= lt!212239 ((_ sign_extend 32) (size!2805 (buf!3198 (_1!6235 lt!211044)))))))

(assert (=> d!44024 (= lt!212236 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5995 (_1!6235 lt!211044))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5990 (_1!6235 lt!211044)))))))

(assert (=> d!44024 (invariant!0 (currentBit!5990 (_1!6235 lt!211044)) (currentByte!5995 (_1!6235 lt!211044)) (size!2805 (buf!3198 (_1!6235 lt!211044))))))

(assert (=> d!44024 (= (bitIndex!0 (size!2805 (buf!3198 (_1!6235 lt!211044))) (currentByte!5995 (_1!6235 lt!211044)) (currentBit!5990 (_1!6235 lt!211044))) lt!212236)))

(declare-fun b!136418 () Bool)

(declare-fun res!113512 () Bool)

(assert (=> b!136418 (=> (not res!113512) (not e!90599))))

(assert (=> b!136418 (= res!113512 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!212236))))

(declare-fun b!136419 () Bool)

(declare-fun lt!212238 () (_ BitVec 64))

(assert (=> b!136419 (= e!90599 (bvsle lt!212236 (bvmul lt!212238 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!136419 (or (= lt!212238 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!212238 #b0000000000000000000000000000000000000000000000000000000000001000) lt!212238)))))

(assert (=> b!136419 (= lt!212238 ((_ sign_extend 32) (size!2805 (buf!3198 (_1!6235 lt!211044)))))))

(assert (= (and d!44024 res!113513) b!136418))

(assert (= (and b!136418 res!113512) b!136419))

(declare-fun m!208901 () Bool)

(assert (=> d!44024 m!208901))

(declare-fun m!208903 () Bool)

(assert (=> d!44024 m!208903))

(assert (=> d!43504 d!44024))

(declare-fun d!44026 () Bool)

(declare-fun e!90602 () Bool)

(assert (=> d!44026 e!90602))

(declare-fun res!113516 () Bool)

(assert (=> d!44026 (=> (not res!113516) (not e!90602))))

(declare-fun lt!212244 () tuple2!11838)

(declare-fun lt!212245 () tuple2!11838)

(assert (=> d!44026 (= res!113516 (= (bitIndex!0 (size!2805 (buf!3198 (_1!6235 lt!212244))) (currentByte!5995 (_1!6235 lt!212244)) (currentBit!5990 (_1!6235 lt!212244))) (bitIndex!0 (size!2805 (buf!3198 (_1!6235 lt!212245))) (currentByte!5995 (_1!6235 lt!212245)) (currentBit!5990 (_1!6235 lt!212245)))))))

(assert (=> d!44026 (= lt!212245 (readBytePure!0 (BitStream!4875 (buf!3198 (_2!6234 lt!210775)) (currentByte!5995 lt!210792) (currentBit!5990 lt!210792))))))

(assert (=> d!44026 (= lt!212244 (readBytePure!0 lt!210792))))

(assert (=> d!44026 true))

(declare-fun _$8!69 () Unit!8448)

(assert (=> d!44026 (= (choose!14 lt!210792 (_2!6234 lt!210775) lt!211043 lt!211044 (tuple2!11839 (_1!6235 lt!211044) (_2!6235 lt!211044)) (_1!6235 lt!211044) (_2!6235 lt!211044) lt!211046 (tuple2!11839 (_1!6235 lt!211046) (_2!6235 lt!211046)) (_1!6235 lt!211046) (_2!6235 lt!211046)) _$8!69)))

(declare-fun b!136422 () Bool)

(assert (=> b!136422 (= e!90602 (= (_2!6235 lt!212244) (_2!6235 lt!212245)))))

(assert (= (and d!44026 res!113516) b!136422))

(declare-fun m!208905 () Bool)

(assert (=> d!44026 m!208905))

(declare-fun m!208907 () Bool)

(assert (=> d!44026 m!208907))

(declare-fun m!208909 () Bool)

(assert (=> d!44026 m!208909))

(assert (=> d!44026 m!207333))

(assert (=> d!43504 d!44026))

(assert (=> d!43581 d!43938))

(declare-fun d!44028 () Bool)

(declare-fun res!113517 () Bool)

(declare-fun e!90603 () Bool)

(assert (=> d!44028 (=> res!113517 e!90603)))

(assert (=> d!44028 (= res!113517 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!44028 (= (arrayRangesEq!208 arr!237 (_2!6236 lt!210791) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!90603)))

(declare-fun b!136423 () Bool)

(declare-fun e!90604 () Bool)

(assert (=> b!136423 (= e!90603 e!90604)))

(declare-fun res!113518 () Bool)

(assert (=> b!136423 (=> (not res!113518) (not e!90604))))

(assert (=> b!136423 (= res!113518 (= (select (arr!3470 arr!237) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3470 (_2!6236 lt!210791)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!136424 () Bool)

(assert (=> b!136424 (= e!90604 (arrayRangesEq!208 arr!237 (_2!6236 lt!210791) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!44028 (not res!113517)) b!136423))

(assert (= (and b!136423 res!113518) b!136424))

(declare-fun m!208911 () Bool)

(assert (=> b!136423 m!208911))

(assert (=> b!136423 m!208623))

(declare-fun m!208913 () Bool)

(assert (=> b!136424 m!208913))

(assert (=> b!135949 d!44028))

(declare-fun d!44030 () Bool)

(declare-fun lt!212246 () tuple2!11846)

(assert (=> d!44030 (= lt!212246 (readByte!0 (_1!6237 lt!211157)))))

(assert (=> d!44030 (= (readBytePure!0 (_1!6237 lt!211157)) (tuple2!11839 (_2!6240 lt!212246) (_1!6240 lt!212246)))))

(declare-fun bs!10725 () Bool)

(assert (= bs!10725 d!44030))

(declare-fun m!208915 () Bool)

(assert (=> bs!10725 m!208915))

(assert (=> b!135896 d!44030))

(declare-fun b!136425 () Bool)

(declare-fun res!113521 () Bool)

(declare-fun e!90606 () Bool)

(assert (=> b!136425 (=> (not res!113521) (not e!90606))))

(declare-fun lt!212249 () tuple2!11842)

(assert (=> b!136425 (= res!113521 (isPrefixOf!0 (_2!6237 lt!212249) (_2!6234 lt!211156)))))

(declare-fun d!44032 () Bool)

(assert (=> d!44032 e!90606))

(declare-fun res!113520 () Bool)

(assert (=> d!44032 (=> (not res!113520) (not e!90606))))

(assert (=> d!44032 (= res!113520 (isPrefixOf!0 (_1!6237 lt!212249) (_2!6237 lt!212249)))))

(declare-fun lt!212256 () BitStream!4874)

(assert (=> d!44032 (= lt!212249 (tuple2!11843 lt!212256 (_2!6234 lt!211156)))))

(declare-fun lt!212248 () Unit!8448)

(declare-fun lt!212253 () Unit!8448)

(assert (=> d!44032 (= lt!212248 lt!212253)))

(assert (=> d!44032 (isPrefixOf!0 lt!212256 (_2!6234 lt!211156))))

(assert (=> d!44032 (= lt!212253 (lemmaIsPrefixTransitive!0 lt!212256 (_2!6234 lt!211156) (_2!6234 lt!211156)))))

(declare-fun lt!212261 () Unit!8448)

(declare-fun lt!212260 () Unit!8448)

(assert (=> d!44032 (= lt!212261 lt!212260)))

(assert (=> d!44032 (isPrefixOf!0 lt!212256 (_2!6234 lt!211156))))

(assert (=> d!44032 (= lt!212260 (lemmaIsPrefixTransitive!0 lt!212256 thiss!1634 (_2!6234 lt!211156)))))

(declare-fun lt!212263 () Unit!8448)

(declare-fun e!90605 () Unit!8448)

(assert (=> d!44032 (= lt!212263 e!90605)))

(declare-fun c!7720 () Bool)

(assert (=> d!44032 (= c!7720 (not (= (size!2805 (buf!3198 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!212265 () Unit!8448)

(declare-fun lt!212252 () Unit!8448)

(assert (=> d!44032 (= lt!212265 lt!212252)))

(assert (=> d!44032 (isPrefixOf!0 (_2!6234 lt!211156) (_2!6234 lt!211156))))

(assert (=> d!44032 (= lt!212252 (lemmaIsPrefixRefl!0 (_2!6234 lt!211156)))))

(declare-fun lt!212254 () Unit!8448)

(declare-fun lt!212266 () Unit!8448)

(assert (=> d!44032 (= lt!212254 lt!212266)))

(assert (=> d!44032 (= lt!212266 (lemmaIsPrefixRefl!0 (_2!6234 lt!211156)))))

(declare-fun lt!212247 () Unit!8448)

(declare-fun lt!212257 () Unit!8448)

(assert (=> d!44032 (= lt!212247 lt!212257)))

(assert (=> d!44032 (isPrefixOf!0 lt!212256 lt!212256)))

(assert (=> d!44032 (= lt!212257 (lemmaIsPrefixRefl!0 lt!212256))))

(declare-fun lt!212262 () Unit!8448)

(declare-fun lt!212251 () Unit!8448)

(assert (=> d!44032 (= lt!212262 lt!212251)))

(assert (=> d!44032 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!44032 (= lt!212251 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!44032 (= lt!212256 (BitStream!4875 (buf!3198 (_2!6234 lt!211156)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634)))))

(assert (=> d!44032 (isPrefixOf!0 thiss!1634 (_2!6234 lt!211156))))

(assert (=> d!44032 (= (reader!0 thiss!1634 (_2!6234 lt!211156)) lt!212249)))

(declare-fun b!136426 () Bool)

(declare-fun lt!212255 () (_ BitVec 64))

(declare-fun lt!212250 () (_ BitVec 64))

(assert (=> b!136426 (= e!90606 (= (_1!6237 lt!212249) (withMovedBitIndex!0 (_2!6237 lt!212249) (bvsub lt!212255 lt!212250))))))

(assert (=> b!136426 (or (= (bvand lt!212255 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!212250 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!212255 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!212255 lt!212250) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!136426 (= lt!212250 (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!211156))) (currentByte!5995 (_2!6234 lt!211156)) (currentBit!5990 (_2!6234 lt!211156))))))

(assert (=> b!136426 (= lt!212255 (bitIndex!0 (size!2805 (buf!3198 thiss!1634)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634)))))

(declare-fun b!136427 () Bool)

(declare-fun lt!212258 () Unit!8448)

(assert (=> b!136427 (= e!90605 lt!212258)))

(declare-fun lt!212264 () (_ BitVec 64))

(assert (=> b!136427 (= lt!212264 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!212259 () (_ BitVec 64))

(assert (=> b!136427 (= lt!212259 (bitIndex!0 (size!2805 (buf!3198 thiss!1634)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634)))))

(assert (=> b!136427 (= lt!212258 (arrayBitRangesEqSymmetric!0 (buf!3198 thiss!1634) (buf!3198 (_2!6234 lt!211156)) lt!212264 lt!212259))))

(assert (=> b!136427 (arrayBitRangesEq!0 (buf!3198 (_2!6234 lt!211156)) (buf!3198 thiss!1634) lt!212264 lt!212259)))

(declare-fun b!136428 () Bool)

(declare-fun res!113519 () Bool)

(assert (=> b!136428 (=> (not res!113519) (not e!90606))))

(assert (=> b!136428 (= res!113519 (isPrefixOf!0 (_1!6237 lt!212249) thiss!1634))))

(declare-fun b!136429 () Bool)

(declare-fun Unit!8545 () Unit!8448)

(assert (=> b!136429 (= e!90605 Unit!8545)))

(assert (= (and d!44032 c!7720) b!136427))

(assert (= (and d!44032 (not c!7720)) b!136429))

(assert (= (and d!44032 res!113520) b!136428))

(assert (= (and b!136428 res!113519) b!136425))

(assert (= (and b!136425 res!113521) b!136426))

(declare-fun m!208917 () Bool)

(assert (=> b!136426 m!208917))

(assert (=> b!136426 m!207629))

(assert (=> b!136426 m!207287))

(declare-fun m!208919 () Bool)

(assert (=> b!136425 m!208919))

(declare-fun m!208921 () Bool)

(assert (=> d!44032 m!208921))

(declare-fun m!208923 () Bool)

(assert (=> d!44032 m!208923))

(declare-fun m!208925 () Bool)

(assert (=> d!44032 m!208925))

(assert (=> d!44032 m!207695))

(assert (=> d!44032 m!207631))

(declare-fun m!208927 () Bool)

(assert (=> d!44032 m!208927))

(declare-fun m!208929 () Bool)

(assert (=> d!44032 m!208929))

(declare-fun m!208931 () Bool)

(assert (=> d!44032 m!208931))

(assert (=> d!44032 m!207699))

(declare-fun m!208933 () Bool)

(assert (=> d!44032 m!208933))

(declare-fun m!208935 () Bool)

(assert (=> d!44032 m!208935))

(declare-fun m!208937 () Bool)

(assert (=> b!136428 m!208937))

(assert (=> b!136427 m!207287))

(declare-fun m!208939 () Bool)

(assert (=> b!136427 m!208939))

(declare-fun m!208941 () Bool)

(assert (=> b!136427 m!208941))

(assert (=> b!135896 d!44032))

(declare-fun d!44034 () Bool)

(declare-fun e!90616 () Bool)

(assert (=> d!44034 e!90616))

(declare-fun res!113532 () Bool)

(assert (=> d!44034 (=> (not res!113532) (not e!90616))))

(declare-fun _$39!30 () tuple2!11836)

(assert (=> d!44034 (= res!113532 (= (size!2805 (buf!3198 (_2!6234 lt!210768))) (size!2805 (buf!3198 (_2!6234 _$39!30)))))))

(declare-fun e!90615 () Bool)

(assert (=> d!44034 (and (inv!12 (_2!6234 _$39!30)) e!90615)))

(assert (=> d!44034 (= (choose!64 (_2!6234 lt!210768) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) _$39!30)))

(declare-fun b!136440 () Bool)

(declare-fun res!113531 () Bool)

(assert (=> b!136440 (=> (not res!113531) (not e!90616))))

(assert (=> b!136440 (= res!113531 (= (bitIndex!0 (size!2805 (buf!3198 (_2!6234 _$39!30))) (currentByte!5995 (_2!6234 _$39!30)) (currentBit!5990 (_2!6234 _$39!30))) (bvadd (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!210768))) (currentByte!5995 (_2!6234 lt!210768)) (currentBit!5990 (_2!6234 lt!210768))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!136441 () Bool)

(declare-fun e!90618 () Bool)

(assert (=> b!136441 (= e!90616 e!90618)))

(declare-fun res!113533 () Bool)

(assert (=> b!136441 (=> (not res!113533) (not e!90618))))

(declare-fun lt!212280 () tuple2!11842)

(declare-fun lt!212278 () tuple2!11840)

(assert (=> b!136441 (= res!113533 (and (= (size!2805 (_2!6236 lt!212278)) (size!2805 arr!237)) (= (_1!6236 lt!212278) (_2!6237 lt!212280))))))

(assert (=> b!136441 (= lt!212278 (readByteArrayLoopPure!0 (_1!6237 lt!212280) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!212279 () Unit!8448)

(declare-fun lt!212281 () Unit!8448)

(assert (=> b!136441 (= lt!212279 lt!212281)))

(declare-fun lt!212277 () (_ BitVec 64))

(assert (=> b!136441 (validate_offset_bits!1 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 _$39!30)))) ((_ sign_extend 32) (currentByte!5995 (_2!6234 lt!210768))) ((_ sign_extend 32) (currentBit!5990 (_2!6234 lt!210768))) lt!212277)))

(assert (=> b!136441 (= lt!212281 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6234 lt!210768) (buf!3198 (_2!6234 _$39!30)) lt!212277))))

(assert (=> b!136441 (= lt!212277 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!136441 (= lt!212280 (reader!0 (_2!6234 lt!210768) (_2!6234 _$39!30)))))

(declare-fun b!136442 () Bool)

(declare-fun res!113530 () Bool)

(assert (=> b!136442 (=> (not res!113530) (not e!90616))))

(assert (=> b!136442 (= res!113530 (isPrefixOf!0 (_2!6234 lt!210768) (_2!6234 _$39!30)))))

(declare-fun b!136443 () Bool)

(assert (=> b!136443 (= e!90615 (array_inv!2594 (buf!3198 (_2!6234 _$39!30))))))

(declare-fun b!136444 () Bool)

(assert (=> b!136444 (= e!90618 (arrayRangesEq!208 arr!237 (_2!6236 lt!212278) #b00000000000000000000000000000000 to!404))))

(assert (= d!44034 b!136443))

(assert (= (and d!44034 res!113532) b!136440))

(assert (= (and b!136440 res!113531) b!136442))

(assert (= (and b!136442 res!113530) b!136441))

(assert (= (and b!136441 res!113533) b!136444))

(declare-fun m!208943 () Bool)

(assert (=> b!136440 m!208943))

(assert (=> b!136440 m!207285))

(declare-fun m!208945 () Bool)

(assert (=> d!44034 m!208945))

(declare-fun m!208947 () Bool)

(assert (=> b!136442 m!208947))

(declare-fun m!208949 () Bool)

(assert (=> b!136444 m!208949))

(declare-fun m!208951 () Bool)

(assert (=> b!136443 m!208951))

(declare-fun m!208953 () Bool)

(assert (=> b!136441 m!208953))

(declare-fun m!208955 () Bool)

(assert (=> b!136441 m!208955))

(declare-fun m!208957 () Bool)

(assert (=> b!136441 m!208957))

(declare-fun m!208959 () Bool)

(assert (=> b!136441 m!208959))

(assert (=> d!43556 d!44034))

(declare-fun d!44036 () Bool)

(declare-fun res!113534 () Bool)

(declare-fun e!90619 () Bool)

(assert (=> d!44036 (=> res!113534 e!90619)))

(assert (=> d!44036 (= res!113534 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!44036 (= (arrayRangesEq!208 (_2!6236 lt!210791) (_2!6236 lt!210776) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!90619)))

(declare-fun b!136445 () Bool)

(declare-fun e!90620 () Bool)

(assert (=> b!136445 (= e!90619 e!90620)))

(declare-fun res!113535 () Bool)

(assert (=> b!136445 (=> (not res!113535) (not e!90620))))

(assert (=> b!136445 (= res!113535 (= (select (arr!3470 (_2!6236 lt!210791)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3470 (_2!6236 lt!210776)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!136446 () Bool)

(assert (=> b!136446 (= e!90620 (arrayRangesEq!208 (_2!6236 lt!210791) (_2!6236 lt!210776) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!44036 (not res!113534)) b!136445))

(assert (= (and b!136445 res!113535) b!136446))

(assert (=> b!136445 m!208623))

(declare-fun m!208961 () Bool)

(assert (=> b!136445 m!208961))

(declare-fun m!208963 () Bool)

(assert (=> b!136446 m!208963))

(assert (=> b!135870 d!44036))

(declare-fun b!136447 () Bool)

(declare-fun res!113540 () Bool)

(declare-fun lt!212282 () (_ BitVec 32))

(assert (=> b!136447 (= res!113540 (= lt!212282 #b00000000000000000000000000000000))))

(declare-fun e!90625 () Bool)

(assert (=> b!136447 (=> res!113540 e!90625)))

(declare-fun e!90622 () Bool)

(assert (=> b!136447 (= e!90622 e!90625)))

(declare-fun lt!212284 () (_ BitVec 32))

(declare-fun lt!212283 () tuple4!120)

(declare-fun c!7721 () Bool)

(declare-fun call!1813 () Bool)

(declare-fun bm!1810 () Bool)

(assert (=> bm!1810 (= call!1813 (byteRangesEq!0 (ite c!7721 (select (arr!3470 (buf!3198 (_2!6234 lt!210768))) (_3!320 lt!212283)) (select (arr!3470 (buf!3198 (_2!6234 lt!210768))) (_4!60 lt!212283))) (ite c!7721 (select (arr!3470 (buf!3198 (_2!6234 lt!210775))) (_3!320 lt!212283)) (select (arr!3470 (buf!3198 (_2!6234 lt!210775))) (_4!60 lt!212283))) (ite c!7721 lt!212284 #b00000000000000000000000000000000) lt!212282))))

(declare-fun b!136448 () Bool)

(declare-fun e!90623 () Bool)

(assert (=> b!136448 (= e!90623 call!1813)))

(declare-fun b!136449 () Bool)

(declare-fun e!90621 () Bool)

(declare-fun e!90624 () Bool)

(assert (=> b!136449 (= e!90621 e!90624)))

(declare-fun res!113538 () Bool)

(assert (=> b!136449 (=> (not res!113538) (not e!90624))))

(declare-fun e!90626 () Bool)

(assert (=> b!136449 (= res!113538 e!90626)))

(declare-fun res!113536 () Bool)

(assert (=> b!136449 (=> res!113536 e!90626)))

(assert (=> b!136449 (= res!113536 (bvsge (_1!6247 lt!212283) (_2!6247 lt!212283)))))

(assert (=> b!136449 (= lt!212282 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!210768))) (currentByte!5995 (_2!6234 lt!210768)) (currentBit!5990 (_2!6234 lt!210768))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!136449 (= lt!212284 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!136449 (= lt!212283 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!210768))) (currentByte!5995 (_2!6234 lt!210768)) (currentBit!5990 (_2!6234 lt!210768)))))))

(declare-fun b!136450 () Bool)

(assert (=> b!136450 (= e!90625 call!1813)))

(declare-fun d!44038 () Bool)

(declare-fun res!113539 () Bool)

(assert (=> d!44038 (=> res!113539 e!90621)))

(assert (=> d!44038 (= res!113539 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!210768))) (currentByte!5995 (_2!6234 lt!210768)) (currentBit!5990 (_2!6234 lt!210768)))))))

(assert (=> d!44038 (= (arrayBitRangesEq!0 (buf!3198 (_2!6234 lt!210768)) (buf!3198 (_2!6234 lt!210775)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!210768))) (currentByte!5995 (_2!6234 lt!210768)) (currentBit!5990 (_2!6234 lt!210768)))) e!90621)))

(declare-fun b!136451 () Bool)

(assert (=> b!136451 (= e!90623 e!90622)))

(declare-fun res!113537 () Bool)

(assert (=> b!136451 (= res!113537 (byteRangesEq!0 (select (arr!3470 (buf!3198 (_2!6234 lt!210768))) (_3!320 lt!212283)) (select (arr!3470 (buf!3198 (_2!6234 lt!210775))) (_3!320 lt!212283)) lt!212284 #b00000000000000000000000000001000))))

(assert (=> b!136451 (=> (not res!113537) (not e!90622))))

(declare-fun b!136452 () Bool)

(assert (=> b!136452 (= e!90624 e!90623)))

(assert (=> b!136452 (= c!7721 (= (_3!320 lt!212283) (_4!60 lt!212283)))))

(declare-fun b!136453 () Bool)

(assert (=> b!136453 (= e!90626 (arrayRangesEq!208 (buf!3198 (_2!6234 lt!210768)) (buf!3198 (_2!6234 lt!210775)) (_1!6247 lt!212283) (_2!6247 lt!212283)))))

(assert (= (and d!44038 (not res!113539)) b!136449))

(assert (= (and b!136449 (not res!113536)) b!136453))

(assert (= (and b!136449 res!113538) b!136452))

(assert (= (and b!136452 c!7721) b!136448))

(assert (= (and b!136452 (not c!7721)) b!136451))

(assert (= (and b!136451 res!113537) b!136447))

(assert (= (and b!136447 (not res!113540)) b!136450))

(assert (= (or b!136448 b!136450) bm!1810))

(declare-fun m!208965 () Bool)

(assert (=> bm!1810 m!208965))

(declare-fun m!208967 () Bool)

(assert (=> bm!1810 m!208967))

(declare-fun m!208969 () Bool)

(assert (=> bm!1810 m!208969))

(declare-fun m!208971 () Bool)

(assert (=> bm!1810 m!208971))

(declare-fun m!208973 () Bool)

(assert (=> bm!1810 m!208973))

(assert (=> b!136449 m!207285))

(declare-fun m!208975 () Bool)

(assert (=> b!136449 m!208975))

(assert (=> b!136451 m!208969))

(assert (=> b!136451 m!208967))

(assert (=> b!136451 m!208969))

(assert (=> b!136451 m!208967))

(declare-fun m!208977 () Bool)

(assert (=> b!136451 m!208977))

(declare-fun m!208979 () Bool)

(assert (=> b!136453 m!208979))

(assert (=> b!135936 d!44038))

(assert (=> b!135936 d!43589))

(declare-fun d!44040 () Bool)

(assert (=> d!44040 (= (remainingBits!0 ((_ sign_extend 32) (size!2805 (buf!3198 (_1!6235 lt!210777)))) ((_ sign_extend 32) (currentByte!5995 (_1!6235 lt!210777))) ((_ sign_extend 32) (currentBit!5990 (_1!6235 lt!210777)))) (bvsub (bvmul ((_ sign_extend 32) (size!2805 (buf!3198 (_1!6235 lt!210777)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5995 (_1!6235 lt!210777))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5990 (_1!6235 lt!210777))))))))

(assert (=> d!43532 d!44040))

(declare-fun d!44042 () Bool)

(assert (=> d!44042 (= (invariant!0 (currentBit!5990 (_1!6235 lt!210777)) (currentByte!5995 (_1!6235 lt!210777)) (size!2805 (buf!3198 (_1!6235 lt!210777)))) (and (bvsge (currentBit!5990 (_1!6235 lt!210777)) #b00000000000000000000000000000000) (bvslt (currentBit!5990 (_1!6235 lt!210777)) #b00000000000000000000000000001000) (bvsge (currentByte!5995 (_1!6235 lt!210777)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5995 (_1!6235 lt!210777)) (size!2805 (buf!3198 (_1!6235 lt!210777)))) (and (= (currentBit!5990 (_1!6235 lt!210777)) #b00000000000000000000000000000000) (= (currentByte!5995 (_1!6235 lt!210777)) (size!2805 (buf!3198 (_1!6235 lt!210777))))))))))

(assert (=> d!43532 d!44042))

(declare-fun d!44044 () Bool)

(declare-fun res!113543 () Bool)

(declare-fun e!90628 () Bool)

(assert (=> d!44044 (=> (not res!113543) (not e!90628))))

(assert (=> d!44044 (= res!113543 (= (size!2805 (buf!3198 (_2!6237 lt!211216))) (size!2805 (buf!3198 (_2!6234 lt!210775)))))))

(assert (=> d!44044 (= (isPrefixOf!0 (_2!6237 lt!211216) (_2!6234 lt!210775)) e!90628)))

(declare-fun b!136454 () Bool)

(declare-fun res!113542 () Bool)

(assert (=> b!136454 (=> (not res!113542) (not e!90628))))

(assert (=> b!136454 (= res!113542 (bvsle (bitIndex!0 (size!2805 (buf!3198 (_2!6237 lt!211216))) (currentByte!5995 (_2!6237 lt!211216)) (currentBit!5990 (_2!6237 lt!211216))) (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!210775))) (currentByte!5995 (_2!6234 lt!210775)) (currentBit!5990 (_2!6234 lt!210775)))))))

(declare-fun b!136455 () Bool)

(declare-fun e!90627 () Bool)

(assert (=> b!136455 (= e!90628 e!90627)))

(declare-fun res!113541 () Bool)

(assert (=> b!136455 (=> res!113541 e!90627)))

(assert (=> b!136455 (= res!113541 (= (size!2805 (buf!3198 (_2!6237 lt!211216))) #b00000000000000000000000000000000))))

(declare-fun b!136456 () Bool)

(assert (=> b!136456 (= e!90627 (arrayBitRangesEq!0 (buf!3198 (_2!6237 lt!211216)) (buf!3198 (_2!6234 lt!210775)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2805 (buf!3198 (_2!6237 lt!211216))) (currentByte!5995 (_2!6237 lt!211216)) (currentBit!5990 (_2!6237 lt!211216)))))))

(assert (= (and d!44044 res!113543) b!136454))

(assert (= (and b!136454 res!113542) b!136455))

(assert (= (and b!136455 (not res!113541)) b!136456))

(assert (=> b!136454 m!208721))

(assert (=> b!136454 m!207291))

(assert (=> b!136456 m!208721))

(assert (=> b!136456 m!208721))

(declare-fun m!208981 () Bool)

(assert (=> b!136456 m!208981))

(assert (=> b!135924 d!44044))

(declare-fun b!136457 () Bool)

(declare-fun res!113548 () Bool)

(declare-fun lt!212285 () (_ BitVec 32))

(assert (=> b!136457 (= res!113548 (= lt!212285 #b00000000000000000000000000000000))))

(declare-fun e!90633 () Bool)

(assert (=> b!136457 (=> res!113548 e!90633)))

(declare-fun e!90630 () Bool)

(assert (=> b!136457 (= e!90630 e!90633)))

(declare-fun call!1814 () Bool)

(declare-fun lt!212287 () (_ BitVec 32))

(declare-fun lt!212286 () tuple4!120)

(declare-fun c!7722 () Bool)

(declare-fun bm!1811 () Bool)

(assert (=> bm!1811 (= call!1814 (byteRangesEq!0 (ite c!7722 (select (arr!3470 (buf!3198 thiss!1634)) (_3!320 lt!212286)) (select (arr!3470 (buf!3198 thiss!1634)) (_4!60 lt!212286))) (ite c!7722 (select (arr!3470 (buf!3198 (_2!6234 lt!210775))) (_3!320 lt!212286)) (select (arr!3470 (buf!3198 (_2!6234 lt!210775))) (_4!60 lt!212286))) (ite c!7722 lt!212287 #b00000000000000000000000000000000) lt!212285))))

(declare-fun b!136458 () Bool)

(declare-fun e!90631 () Bool)

(assert (=> b!136458 (= e!90631 call!1814)))

(declare-fun b!136459 () Bool)

(declare-fun e!90629 () Bool)

(declare-fun e!90632 () Bool)

(assert (=> b!136459 (= e!90629 e!90632)))

(declare-fun res!113546 () Bool)

(assert (=> b!136459 (=> (not res!113546) (not e!90632))))

(declare-fun e!90634 () Bool)

(assert (=> b!136459 (= res!113546 e!90634)))

(declare-fun res!113544 () Bool)

(assert (=> b!136459 (=> res!113544 e!90634)))

(assert (=> b!136459 (= res!113544 (bvsge (_1!6247 lt!212286) (_2!6247 lt!212286)))))

(assert (=> b!136459 (= lt!212285 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2805 (buf!3198 thiss!1634)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!136459 (= lt!212287 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!136459 (= lt!212286 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2805 (buf!3198 thiss!1634)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634))))))

(declare-fun b!136460 () Bool)

(assert (=> b!136460 (= e!90633 call!1814)))

(declare-fun d!44046 () Bool)

(declare-fun res!113547 () Bool)

(assert (=> d!44046 (=> res!113547 e!90629)))

(assert (=> d!44046 (= res!113547 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2805 (buf!3198 thiss!1634)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634))))))

(assert (=> d!44046 (= (arrayBitRangesEq!0 (buf!3198 thiss!1634) (buf!3198 (_2!6234 lt!210775)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2805 (buf!3198 thiss!1634)) (currentByte!5995 thiss!1634) (currentBit!5990 thiss!1634))) e!90629)))

(declare-fun b!136461 () Bool)

(assert (=> b!136461 (= e!90631 e!90630)))

(declare-fun res!113545 () Bool)

(assert (=> b!136461 (= res!113545 (byteRangesEq!0 (select (arr!3470 (buf!3198 thiss!1634)) (_3!320 lt!212286)) (select (arr!3470 (buf!3198 (_2!6234 lt!210775))) (_3!320 lt!212286)) lt!212287 #b00000000000000000000000000001000))))

(assert (=> b!136461 (=> (not res!113545) (not e!90630))))

(declare-fun b!136462 () Bool)

(assert (=> b!136462 (= e!90632 e!90631)))

(assert (=> b!136462 (= c!7722 (= (_3!320 lt!212286) (_4!60 lt!212286)))))

(declare-fun b!136463 () Bool)

(assert (=> b!136463 (= e!90634 (arrayRangesEq!208 (buf!3198 thiss!1634) (buf!3198 (_2!6234 lt!210775)) (_1!6247 lt!212286) (_2!6247 lt!212286)))))

(assert (= (and d!44046 (not res!113547)) b!136459))

(assert (= (and b!136459 (not res!113544)) b!136463))

(assert (= (and b!136459 res!113546) b!136462))

(assert (= (and b!136462 c!7722) b!136458))

(assert (= (and b!136462 (not c!7722)) b!136461))

(assert (= (and b!136461 res!113545) b!136457))

(assert (= (and b!136457 (not res!113548)) b!136460))

(assert (= (or b!136458 b!136460) bm!1811))

(declare-fun m!208983 () Bool)

(assert (=> bm!1811 m!208983))

(declare-fun m!208985 () Bool)

(assert (=> bm!1811 m!208985))

(declare-fun m!208987 () Bool)

(assert (=> bm!1811 m!208987))

(declare-fun m!208989 () Bool)

(assert (=> bm!1811 m!208989))

(declare-fun m!208991 () Bool)

(assert (=> bm!1811 m!208991))

(assert (=> b!136459 m!207287))

(assert (=> b!136459 m!208653))

(assert (=> b!136461 m!208987))

(assert (=> b!136461 m!208985))

(assert (=> b!136461 m!208987))

(assert (=> b!136461 m!208985))

(declare-fun m!208993 () Bool)

(assert (=> b!136461 m!208993))

(declare-fun m!208995 () Bool)

(assert (=> b!136463 m!208995))

(assert (=> b!135905 d!44046))

(assert (=> b!135905 d!43591))

(assert (=> b!135903 d!43591))

(assert (=> b!135903 d!43593))

(assert (=> b!135926 d!43591))

(declare-fun d!44048 () Bool)

(assert (=> d!44048 (arrayBitRangesEq!0 (buf!3198 (_2!6234 lt!210775)) (buf!3198 thiss!1634) lt!211231 lt!211226)))

(declare-fun lt!212288 () Unit!8448)

(assert (=> d!44048 (= lt!212288 (choose!8 (buf!3198 thiss!1634) (buf!3198 (_2!6234 lt!210775)) lt!211231 lt!211226))))

(assert (=> d!44048 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!211231) (bvsle lt!211231 lt!211226))))

(assert (=> d!44048 (= (arrayBitRangesEqSymmetric!0 (buf!3198 thiss!1634) (buf!3198 (_2!6234 lt!210775)) lt!211231 lt!211226) lt!212288)))

(declare-fun bs!10726 () Bool)

(assert (= bs!10726 d!44048))

(assert (=> bs!10726 m!207709))

(declare-fun m!208997 () Bool)

(assert (=> bs!10726 m!208997))

(assert (=> b!135926 d!44048))

(declare-fun b!136464 () Bool)

(declare-fun res!113553 () Bool)

(declare-fun lt!212289 () (_ BitVec 32))

(assert (=> b!136464 (= res!113553 (= lt!212289 #b00000000000000000000000000000000))))

(declare-fun e!90639 () Bool)

(assert (=> b!136464 (=> res!113553 e!90639)))

(declare-fun e!90636 () Bool)

(assert (=> b!136464 (= e!90636 e!90639)))

(declare-fun call!1815 () Bool)

(declare-fun lt!212290 () tuple4!120)

(declare-fun c!7723 () Bool)

(declare-fun lt!212291 () (_ BitVec 32))

(declare-fun bm!1812 () Bool)

(assert (=> bm!1812 (= call!1815 (byteRangesEq!0 (ite c!7723 (select (arr!3470 (buf!3198 (_2!6234 lt!210775))) (_3!320 lt!212290)) (select (arr!3470 (buf!3198 (_2!6234 lt!210775))) (_4!60 lt!212290))) (ite c!7723 (select (arr!3470 (buf!3198 thiss!1634)) (_3!320 lt!212290)) (select (arr!3470 (buf!3198 thiss!1634)) (_4!60 lt!212290))) (ite c!7723 lt!212291 #b00000000000000000000000000000000) lt!212289))))

(declare-fun b!136465 () Bool)

(declare-fun e!90637 () Bool)

(assert (=> b!136465 (= e!90637 call!1815)))

(declare-fun b!136466 () Bool)

(declare-fun e!90635 () Bool)

(declare-fun e!90638 () Bool)

(assert (=> b!136466 (= e!90635 e!90638)))

(declare-fun res!113551 () Bool)

(assert (=> b!136466 (=> (not res!113551) (not e!90638))))

(declare-fun e!90640 () Bool)

(assert (=> b!136466 (= res!113551 e!90640)))

(declare-fun res!113549 () Bool)

(assert (=> b!136466 (=> res!113549 e!90640)))

(assert (=> b!136466 (= res!113549 (bvsge (_1!6247 lt!212290) (_2!6247 lt!212290)))))

(assert (=> b!136466 (= lt!212289 ((_ extract 31 0) (bvsrem lt!211226 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!136466 (= lt!212291 ((_ extract 31 0) (bvsrem lt!211231 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!136466 (= lt!212290 (arrayBitIndices!0 lt!211231 lt!211226))))

(declare-fun b!136467 () Bool)

(assert (=> b!136467 (= e!90639 call!1815)))

(declare-fun d!44050 () Bool)

(declare-fun res!113552 () Bool)

(assert (=> d!44050 (=> res!113552 e!90635)))

(assert (=> d!44050 (= res!113552 (bvsge lt!211231 lt!211226))))

(assert (=> d!44050 (= (arrayBitRangesEq!0 (buf!3198 (_2!6234 lt!210775)) (buf!3198 thiss!1634) lt!211231 lt!211226) e!90635)))

(declare-fun b!136468 () Bool)

(assert (=> b!136468 (= e!90637 e!90636)))

(declare-fun res!113550 () Bool)

(assert (=> b!136468 (= res!113550 (byteRangesEq!0 (select (arr!3470 (buf!3198 (_2!6234 lt!210775))) (_3!320 lt!212290)) (select (arr!3470 (buf!3198 thiss!1634)) (_3!320 lt!212290)) lt!212291 #b00000000000000000000000000001000))))

(assert (=> b!136468 (=> (not res!113550) (not e!90636))))

(declare-fun b!136469 () Bool)

(assert (=> b!136469 (= e!90638 e!90637)))

(assert (=> b!136469 (= c!7723 (= (_3!320 lt!212290) (_4!60 lt!212290)))))

(declare-fun b!136470 () Bool)

(assert (=> b!136470 (= e!90640 (arrayRangesEq!208 (buf!3198 (_2!6234 lt!210775)) (buf!3198 thiss!1634) (_1!6247 lt!212290) (_2!6247 lt!212290)))))

(assert (= (and d!44050 (not res!113552)) b!136466))

(assert (= (and b!136466 (not res!113549)) b!136470))

(assert (= (and b!136466 res!113551) b!136469))

(assert (= (and b!136469 c!7723) b!136465))

(assert (= (and b!136469 (not c!7723)) b!136468))

(assert (= (and b!136468 res!113550) b!136464))

(assert (= (and b!136464 (not res!113553)) b!136467))

(assert (= (or b!136465 b!136467) bm!1812))

(declare-fun m!208999 () Bool)

(assert (=> bm!1812 m!208999))

(declare-fun m!209001 () Bool)

(assert (=> bm!1812 m!209001))

(declare-fun m!209003 () Bool)

(assert (=> bm!1812 m!209003))

(declare-fun m!209005 () Bool)

(assert (=> bm!1812 m!209005))

(declare-fun m!209007 () Bool)

(assert (=> bm!1812 m!209007))

(declare-fun m!209009 () Bool)

(assert (=> b!136466 m!209009))

(assert (=> b!136468 m!209003))

(assert (=> b!136468 m!209001))

(assert (=> b!136468 m!209003))

(assert (=> b!136468 m!209001))

(declare-fun m!209011 () Bool)

(assert (=> b!136468 m!209011))

(declare-fun m!209013 () Bool)

(assert (=> b!136470 m!209013))

(assert (=> b!135926 d!44050))

(declare-fun d!44052 () Bool)

(declare-fun res!113554 () Bool)

(declare-fun e!90641 () Bool)

(assert (=> d!44052 (=> res!113554 e!90641)))

(assert (=> d!44052 (= res!113554 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!44052 (= (arrayRangesEq!208 arr!237 (_2!6236 lt!210789) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!90641)))

(declare-fun b!136471 () Bool)

(declare-fun e!90642 () Bool)

(assert (=> b!136471 (= e!90641 e!90642)))

(declare-fun res!113555 () Bool)

(assert (=> b!136471 (=> (not res!113555) (not e!90642))))

(assert (=> b!136471 (= res!113555 (= (select (arr!3470 arr!237) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3470 (_2!6236 lt!210789)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!136472 () Bool)

(assert (=> b!136472 (= e!90642 (arrayRangesEq!208 arr!237 (_2!6236 lt!210789) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!44052 (not res!113554)) b!136471))

(assert (= (and b!136471 res!113555) b!136472))

(assert (=> b!136471 m!208911))

(declare-fun m!209015 () Bool)

(assert (=> b!136471 m!209015))

(declare-fun m!209017 () Bool)

(assert (=> b!136472 m!209017))

(assert (=> b!135947 d!44052))

(declare-fun d!44054 () Bool)

(assert (=> d!44054 (isPrefixOf!0 lt!211223 (_2!6234 lt!210775))))

(declare-fun lt!212292 () Unit!8448)

(assert (=> d!44054 (= lt!212292 (choose!30 lt!211223 (_2!6234 lt!210775) (_2!6234 lt!210775)))))

(assert (=> d!44054 (isPrefixOf!0 lt!211223 (_2!6234 lt!210775))))

(assert (=> d!44054 (= (lemmaIsPrefixTransitive!0 lt!211223 (_2!6234 lt!210775) (_2!6234 lt!210775)) lt!212292)))

(declare-fun bs!10727 () Bool)

(assert (= bs!10727 d!44054))

(assert (=> bs!10727 m!207703))

(declare-fun m!209019 () Bool)

(assert (=> bs!10727 m!209019))

(assert (=> bs!10727 m!207703))

(assert (=> d!43563 d!44054))

(assert (=> d!43563 d!44002))

(declare-fun d!44056 () Bool)

(declare-fun res!113558 () Bool)

(declare-fun e!90644 () Bool)

(assert (=> d!44056 (=> (not res!113558) (not e!90644))))

(assert (=> d!44056 (= res!113558 (= (size!2805 (buf!3198 (_1!6237 lt!211216))) (size!2805 (buf!3198 (_2!6237 lt!211216)))))))

(assert (=> d!44056 (= (isPrefixOf!0 (_1!6237 lt!211216) (_2!6237 lt!211216)) e!90644)))

(declare-fun b!136473 () Bool)

(declare-fun res!113557 () Bool)

(assert (=> b!136473 (=> (not res!113557) (not e!90644))))

(assert (=> b!136473 (= res!113557 (bvsle (bitIndex!0 (size!2805 (buf!3198 (_1!6237 lt!211216))) (currentByte!5995 (_1!6237 lt!211216)) (currentBit!5990 (_1!6237 lt!211216))) (bitIndex!0 (size!2805 (buf!3198 (_2!6237 lt!211216))) (currentByte!5995 (_2!6237 lt!211216)) (currentBit!5990 (_2!6237 lt!211216)))))))

(declare-fun b!136474 () Bool)

(declare-fun e!90643 () Bool)

(assert (=> b!136474 (= e!90644 e!90643)))

(declare-fun res!113556 () Bool)

(assert (=> b!136474 (=> res!113556 e!90643)))

(assert (=> b!136474 (= res!113556 (= (size!2805 (buf!3198 (_1!6237 lt!211216))) #b00000000000000000000000000000000))))

(declare-fun b!136475 () Bool)

(assert (=> b!136475 (= e!90643 (arrayBitRangesEq!0 (buf!3198 (_1!6237 lt!211216)) (buf!3198 (_2!6237 lt!211216)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2805 (buf!3198 (_1!6237 lt!211216))) (currentByte!5995 (_1!6237 lt!211216)) (currentBit!5990 (_1!6237 lt!211216)))))))

(assert (= (and d!44056 res!113558) b!136473))

(assert (= (and b!136473 res!113557) b!136474))

(assert (= (and b!136474 (not res!113556)) b!136475))

(assert (=> b!136473 m!208715))

(assert (=> b!136473 m!208721))

(assert (=> b!136475 m!208715))

(assert (=> b!136475 m!208715))

(declare-fun m!209021 () Bool)

(assert (=> b!136475 m!209021))

(assert (=> d!43563 d!44056))

(assert (=> d!43563 d!43554))

(declare-fun d!44058 () Bool)

(declare-fun res!113561 () Bool)

(declare-fun e!90646 () Bool)

(assert (=> d!44058 (=> (not res!113561) (not e!90646))))

(assert (=> d!44058 (= res!113561 (= (size!2805 (buf!3198 lt!211223)) (size!2805 (buf!3198 lt!211223))))))

(assert (=> d!44058 (= (isPrefixOf!0 lt!211223 lt!211223) e!90646)))

(declare-fun b!136476 () Bool)

(declare-fun res!113560 () Bool)

(assert (=> b!136476 (=> (not res!113560) (not e!90646))))

(assert (=> b!136476 (= res!113560 (bvsle (bitIndex!0 (size!2805 (buf!3198 lt!211223)) (currentByte!5995 lt!211223) (currentBit!5990 lt!211223)) (bitIndex!0 (size!2805 (buf!3198 lt!211223)) (currentByte!5995 lt!211223) (currentBit!5990 lt!211223))))))

(declare-fun b!136477 () Bool)

(declare-fun e!90645 () Bool)

(assert (=> b!136477 (= e!90646 e!90645)))

(declare-fun res!113559 () Bool)

(assert (=> b!136477 (=> res!113559 e!90645)))

(assert (=> b!136477 (= res!113559 (= (size!2805 (buf!3198 lt!211223)) #b00000000000000000000000000000000))))

(declare-fun b!136478 () Bool)

(assert (=> b!136478 (= e!90645 (arrayBitRangesEq!0 (buf!3198 lt!211223) (buf!3198 lt!211223) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2805 (buf!3198 lt!211223)) (currentByte!5995 lt!211223) (currentBit!5990 lt!211223))))))

(assert (= (and d!44058 res!113561) b!136476))

(assert (= (and b!136476 res!113560) b!136477))

(assert (= (and b!136477 (not res!113559)) b!136478))

(declare-fun m!209023 () Bool)

(assert (=> b!136476 m!209023))

(assert (=> b!136476 m!209023))

(assert (=> b!136478 m!209023))

(assert (=> b!136478 m!209023))

(declare-fun m!209025 () Bool)

(assert (=> b!136478 m!209025))

(assert (=> d!43563 d!44058))

(declare-fun d!44060 () Bool)

(assert (=> d!44060 (isPrefixOf!0 lt!211223 (_2!6234 lt!210775))))

(declare-fun lt!212293 () Unit!8448)

(assert (=> d!44060 (= lt!212293 (choose!30 lt!211223 thiss!1634 (_2!6234 lt!210775)))))

(assert (=> d!44060 (isPrefixOf!0 lt!211223 thiss!1634)))

(assert (=> d!44060 (= (lemmaIsPrefixTransitive!0 lt!211223 thiss!1634 (_2!6234 lt!210775)) lt!212293)))

(declare-fun bs!10728 () Bool)

(assert (= bs!10728 d!44060))

(assert (=> bs!10728 m!207703))

(declare-fun m!209027 () Bool)

(assert (=> bs!10728 m!209027))

(declare-fun m!209029 () Bool)

(assert (=> bs!10728 m!209029))

(assert (=> d!43563 d!44060))

(assert (=> d!43563 d!43904))

(assert (=> d!43563 d!44012))

(assert (=> d!43563 d!43910))

(declare-fun d!44062 () Bool)

(declare-fun res!113564 () Bool)

(declare-fun e!90648 () Bool)

(assert (=> d!44062 (=> (not res!113564) (not e!90648))))

(assert (=> d!44062 (= res!113564 (= (size!2805 (buf!3198 lt!211223)) (size!2805 (buf!3198 (_2!6234 lt!210775)))))))

(assert (=> d!44062 (= (isPrefixOf!0 lt!211223 (_2!6234 lt!210775)) e!90648)))

(declare-fun b!136479 () Bool)

(declare-fun res!113563 () Bool)

(assert (=> b!136479 (=> (not res!113563) (not e!90648))))

(assert (=> b!136479 (= res!113563 (bvsle (bitIndex!0 (size!2805 (buf!3198 lt!211223)) (currentByte!5995 lt!211223) (currentBit!5990 lt!211223)) (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!210775))) (currentByte!5995 (_2!6234 lt!210775)) (currentBit!5990 (_2!6234 lt!210775)))))))

(declare-fun b!136480 () Bool)

(declare-fun e!90647 () Bool)

(assert (=> b!136480 (= e!90648 e!90647)))

(declare-fun res!113562 () Bool)

(assert (=> b!136480 (=> res!113562 e!90647)))

(assert (=> b!136480 (= res!113562 (= (size!2805 (buf!3198 lt!211223)) #b00000000000000000000000000000000))))

(declare-fun b!136481 () Bool)

(assert (=> b!136481 (= e!90647 (arrayBitRangesEq!0 (buf!3198 lt!211223) (buf!3198 (_2!6234 lt!210775)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2805 (buf!3198 lt!211223)) (currentByte!5995 lt!211223) (currentBit!5990 lt!211223))))))

(assert (= (and d!44062 res!113564) b!136479))

(assert (= (and b!136479 res!113563) b!136480))

(assert (= (and b!136480 (not res!113562)) b!136481))

(assert (=> b!136479 m!209023))

(assert (=> b!136479 m!207291))

(assert (=> b!136481 m!209023))

(assert (=> b!136481 m!209023))

(declare-fun m!209031 () Bool)

(assert (=> b!136481 m!209031))

(assert (=> d!43563 d!44062))

(declare-fun d!44064 () Bool)

(assert (=> d!44064 (isPrefixOf!0 lt!211223 lt!211223)))

(declare-fun lt!212294 () Unit!8448)

(assert (=> d!44064 (= lt!212294 (choose!11 lt!211223))))

(assert (=> d!44064 (= (lemmaIsPrefixRefl!0 lt!211223) lt!212294)))

(declare-fun bs!10729 () Bool)

(assert (= bs!10729 d!44064))

(assert (=> bs!10729 m!207693))

(declare-fun m!209033 () Bool)

(assert (=> bs!10729 m!209033))

(assert (=> d!43563 d!44064))

(declare-fun d!44066 () Bool)

(declare-fun e!90649 () Bool)

(assert (=> d!44066 e!90649))

(declare-fun res!113565 () Bool)

(assert (=> d!44066 (=> (not res!113565) (not e!90649))))

(declare-fun lt!212295 () BitStream!4874)

(declare-fun lt!212296 () (_ BitVec 64))

(assert (=> d!44066 (= res!113565 (= (bvadd lt!212296 (bvsub lt!211120 lt!211115)) (bitIndex!0 (size!2805 (buf!3198 lt!212295)) (currentByte!5995 lt!212295) (currentBit!5990 lt!212295))))))

(assert (=> d!44066 (or (not (= (bvand lt!212296 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!211120 lt!211115) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!212296 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!212296 (bvsub lt!211120 lt!211115)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44066 (= lt!212296 (bitIndex!0 (size!2805 (buf!3198 (_2!6237 lt!211114))) (currentByte!5995 (_2!6237 lt!211114)) (currentBit!5990 (_2!6237 lt!211114))))))

(assert (=> d!44066 (= lt!212295 (_2!6234 (moveBitIndex!0 (_2!6237 lt!211114) (bvsub lt!211120 lt!211115))))))

(assert (=> d!44066 (moveBitIndexPrecond!0 (_2!6237 lt!211114) (bvsub lt!211120 lt!211115))))

(assert (=> d!44066 (= (withMovedBitIndex!0 (_2!6237 lt!211114) (bvsub lt!211120 lt!211115)) lt!212295)))

(declare-fun b!136482 () Bool)

(assert (=> b!136482 (= e!90649 (= (size!2805 (buf!3198 (_2!6237 lt!211114))) (size!2805 (buf!3198 lt!212295))))))

(assert (= (and d!44066 res!113565) b!136482))

(declare-fun m!209035 () Bool)

(assert (=> d!44066 m!209035))

(assert (=> d!44066 m!208803))

(declare-fun m!209037 () Bool)

(assert (=> d!44066 m!209037))

(declare-fun m!209039 () Bool)

(assert (=> d!44066 m!209039))

(assert (=> b!135882 d!44066))

(assert (=> b!135882 d!43593))

(assert (=> b!135882 d!43589))

(declare-fun d!44068 () Bool)

(declare-fun res!113568 () Bool)

(declare-fun e!90651 () Bool)

(assert (=> d!44068 (=> (not res!113568) (not e!90651))))

(assert (=> d!44068 (= res!113568 (= (size!2805 (buf!3198 (_2!6237 lt!211238))) (size!2805 (buf!3198 (_2!6234 lt!210768)))))))

(assert (=> d!44068 (= (isPrefixOf!0 (_2!6237 lt!211238) (_2!6234 lt!210768)) e!90651)))

(declare-fun b!136483 () Bool)

(declare-fun res!113567 () Bool)

(assert (=> b!136483 (=> (not res!113567) (not e!90651))))

(assert (=> b!136483 (= res!113567 (bvsle (bitIndex!0 (size!2805 (buf!3198 (_2!6237 lt!211238))) (currentByte!5995 (_2!6237 lt!211238)) (currentBit!5990 (_2!6237 lt!211238))) (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!210768))) (currentByte!5995 (_2!6234 lt!210768)) (currentBit!5990 (_2!6234 lt!210768)))))))

(declare-fun b!136484 () Bool)

(declare-fun e!90650 () Bool)

(assert (=> b!136484 (= e!90651 e!90650)))

(declare-fun res!113566 () Bool)

(assert (=> b!136484 (=> res!113566 e!90650)))

(assert (=> b!136484 (= res!113566 (= (size!2805 (buf!3198 (_2!6237 lt!211238))) #b00000000000000000000000000000000))))

(declare-fun b!136485 () Bool)

(assert (=> b!136485 (= e!90650 (arrayBitRangesEq!0 (buf!3198 (_2!6237 lt!211238)) (buf!3198 (_2!6234 lt!210768)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2805 (buf!3198 (_2!6237 lt!211238))) (currentByte!5995 (_2!6237 lt!211238)) (currentBit!5990 (_2!6237 lt!211238)))))))

(assert (= (and d!44068 res!113568) b!136483))

(assert (= (and b!136483 res!113567) b!136484))

(assert (= (and b!136484 (not res!113566)) b!136485))

(assert (=> b!136483 m!208545))

(assert (=> b!136483 m!207285))

(assert (=> b!136485 m!208545))

(assert (=> b!136485 m!208545))

(declare-fun m!209041 () Bool)

(assert (=> b!136485 m!209041))

(assert (=> b!135929 d!44068))

(declare-fun bm!1813 () Bool)

(declare-fun lt!212325 () tuple2!11846)

(declare-fun c!7724 () Bool)

(declare-fun call!1817 () Bool)

(assert (=> bm!1813 (= call!1817 (arrayRangesEq!208 arr!237 (ite c!7724 (array!6195 (store (arr!3470 arr!237) from!447 (_1!6240 lt!212325)) (size!2805 arr!237)) arr!237) #b00000000000000000000000000000000 (ite c!7724 from!447 (size!2805 arr!237))))))

(declare-fun call!1816 () (_ BitVec 64))

(declare-fun lt!212326 () tuple3!516)

(declare-fun bm!1814 () Bool)

(assert (=> bm!1814 (= call!1816 (bitIndex!0 (ite c!7724 (size!2805 (buf!3198 (_2!6241 lt!212326))) (size!2805 (buf!3198 (_1!6237 lt!210787)))) (ite c!7724 (currentByte!5995 (_2!6241 lt!212326)) (currentByte!5995 (_1!6237 lt!210787))) (ite c!7724 (currentBit!5990 (_2!6241 lt!212326)) (currentBit!5990 (_1!6237 lt!210787)))))))

(declare-fun call!1818 () Bool)

(declare-fun lt!212304 () (_ BitVec 32))

(declare-fun lt!212329 () array!6194)

(declare-fun bm!1815 () Bool)

(declare-fun lt!212316 () array!6194)

(declare-fun lt!212317 () (_ BitVec 32))

(declare-fun lt!212307 () (_ BitVec 32))

(assert (=> bm!1815 (= call!1818 (arrayRangesEq!208 (ite c!7724 arr!237 lt!212329) (ite c!7724 (_3!317 lt!212326) lt!212316) (ite c!7724 lt!212307 lt!212304) (ite c!7724 from!447 lt!212317)))))

(declare-fun lt!212300 () tuple3!516)

(declare-fun e!90654 () Bool)

(declare-fun b!136486 () Bool)

(assert (=> b!136486 (= e!90654 (arrayRangesEq!208 arr!237 (_3!317 lt!212300) #b00000000000000000000000000000000 from!447))))

(declare-fun b!136487 () Bool)

(declare-fun lt!212330 () Unit!8448)

(declare-fun e!90653 () tuple3!516)

(assert (=> b!136487 (= e!90653 (tuple3!517 lt!212330 (_1!6237 lt!210787) arr!237))))

(assert (=> b!136487 (= call!1816 call!1816)))

(declare-fun lt!212327 () Unit!8448)

(declare-fun Unit!8546 () Unit!8448)

(assert (=> b!136487 (= lt!212327 Unit!8546)))

(declare-fun lt!212311 () Unit!8448)

(assert (=> b!136487 (= lt!212311 (arrayRangesEqReflexiveLemma!6 arr!237))))

(assert (=> b!136487 call!1817))

(declare-fun lt!212302 () Unit!8448)

(assert (=> b!136487 (= lt!212302 lt!212311)))

(assert (=> b!136487 (= lt!212329 arr!237)))

(assert (=> b!136487 (= lt!212316 arr!237)))

(declare-fun lt!212310 () (_ BitVec 32))

(assert (=> b!136487 (= lt!212310 #b00000000000000000000000000000000)))

(declare-fun lt!212332 () (_ BitVec 32))

(assert (=> b!136487 (= lt!212332 (size!2805 arr!237))))

(assert (=> b!136487 (= lt!212304 #b00000000000000000000000000000000)))

(assert (=> b!136487 (= lt!212317 from!447)))

(assert (=> b!136487 (= lt!212330 (arrayRangesEqSlicedLemma!6 lt!212329 lt!212316 lt!212310 lt!212332 lt!212304 lt!212317))))

(assert (=> b!136487 call!1818))

(declare-fun b!136488 () Bool)

(declare-fun res!113570 () Bool)

(assert (=> b!136488 (=> (not res!113570) (not e!90654))))

(assert (=> b!136488 (= res!113570 (and (= (buf!3198 (_1!6237 lt!210787)) (buf!3198 (_2!6241 lt!212300))) (= (size!2805 arr!237) (size!2805 (_3!317 lt!212300)))))))

(declare-fun d!44070 () Bool)

(declare-fun e!90652 () Bool)

(assert (=> d!44070 e!90652))

(declare-fun res!113569 () Bool)

(assert (=> d!44070 (=> res!113569 e!90652)))

(assert (=> d!44070 (= res!113569 (bvsge from!447 to!404))))

(declare-fun lt!212323 () Bool)

(assert (=> d!44070 (= lt!212323 e!90654)))

(declare-fun res!113571 () Bool)

(assert (=> d!44070 (=> (not res!113571) (not e!90654))))

(declare-fun lt!212315 () (_ BitVec 64))

(declare-fun lt!212314 () (_ BitVec 64))

(assert (=> d!44070 (= res!113571 (= (bvadd lt!212315 lt!212314) (bitIndex!0 (size!2805 (buf!3198 (_2!6241 lt!212300))) (currentByte!5995 (_2!6241 lt!212300)) (currentBit!5990 (_2!6241 lt!212300)))))))

(assert (=> d!44070 (or (not (= (bvand lt!212315 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!212314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!212315 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!212315 lt!212314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!212308 () (_ BitVec 64))

(assert (=> d!44070 (= lt!212314 (bvmul lt!212308 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!44070 (or (= lt!212308 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!212308 #b0000000000000000000000000000000000000000000000000000000000001000) lt!212308)))))

(assert (=> d!44070 (= lt!212308 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(assert (=> d!44070 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))

(assert (=> d!44070 (= lt!212315 (bitIndex!0 (size!2805 (buf!3198 (_1!6237 lt!210787))) (currentByte!5995 (_1!6237 lt!210787)) (currentBit!5990 (_1!6237 lt!210787))))))

(assert (=> d!44070 (= lt!212300 e!90653)))

(assert (=> d!44070 (= c!7724 (bvslt from!447 to!404))))

(assert (=> d!44070 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2805 arr!237)))))

(assert (=> d!44070 (= (readByteArrayLoop!0 (_1!6237 lt!210787) arr!237 from!447 to!404) lt!212300)))

(declare-fun b!136489 () Bool)

(declare-fun lt!212297 () Unit!8448)

(assert (=> b!136489 (= e!90653 (tuple3!517 lt!212297 (_2!6241 lt!212326) (_3!317 lt!212326)))))

(assert (=> b!136489 (= lt!212325 (readByte!0 (_1!6237 lt!210787)))))

(declare-fun lt!212319 () array!6194)

(assert (=> b!136489 (= lt!212319 (array!6195 (store (arr!3470 arr!237) from!447 (_1!6240 lt!212325)) (size!2805 arr!237)))))

(declare-fun lt!212320 () (_ BitVec 64))

(assert (=> b!136489 (= lt!212320 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!212322 () (_ BitVec 32))

(assert (=> b!136489 (= lt!212322 (bvsub to!404 from!447))))

(declare-fun lt!212331 () Unit!8448)

(assert (=> b!136489 (= lt!212331 (validateOffsetBytesFromBitIndexLemma!0 (_1!6237 lt!210787) (_2!6240 lt!212325) lt!212320 lt!212322))))

(assert (=> b!136489 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6240 lt!212325)))) ((_ sign_extend 32) (currentByte!5995 (_2!6240 lt!212325))) ((_ sign_extend 32) (currentBit!5990 (_2!6240 lt!212325))) (bvsub lt!212322 ((_ extract 31 0) (bvsdiv (bvadd lt!212320 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!212309 () Unit!8448)

(assert (=> b!136489 (= lt!212309 lt!212331)))

(assert (=> b!136489 (= lt!212326 (readByteArrayLoop!0 (_2!6240 lt!212325) lt!212319 (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!136489 (= (bitIndex!0 (size!2805 (buf!3198 (_2!6240 lt!212325))) (currentByte!5995 (_2!6240 lt!212325)) (currentBit!5990 (_2!6240 lt!212325))) (bvadd (bitIndex!0 (size!2805 (buf!3198 (_1!6237 lt!210787))) (currentByte!5995 (_1!6237 lt!210787)) (currentBit!5990 (_1!6237 lt!210787))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!212328 () Unit!8448)

(declare-fun Unit!8547 () Unit!8448)

(assert (=> b!136489 (= lt!212328 Unit!8547)))

(assert (=> b!136489 (= (bvadd (bitIndex!0 (size!2805 (buf!3198 (_2!6240 lt!212325))) (currentByte!5995 (_2!6240 lt!212325)) (currentBit!5990 (_2!6240 lt!212325))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!1816)))

(declare-fun lt!212303 () Unit!8448)

(declare-fun Unit!8548 () Unit!8448)

(assert (=> b!136489 (= lt!212303 Unit!8548)))

(assert (=> b!136489 (= (bvadd (bitIndex!0 (size!2805 (buf!3198 (_1!6237 lt!210787))) (currentByte!5995 (_1!6237 lt!210787)) (currentBit!5990 (_1!6237 lt!210787))) (bvmul ((_ sign_extend 32) (bvsub to!404 from!447)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!1816)))

(declare-fun lt!212313 () Unit!8448)

(declare-fun Unit!8549 () Unit!8448)

(assert (=> b!136489 (= lt!212313 Unit!8549)))

(assert (=> b!136489 (and (= (buf!3198 (_1!6237 lt!210787)) (buf!3198 (_2!6241 lt!212326))) (= (size!2805 arr!237) (size!2805 (_3!317 lt!212326))))))

(declare-fun lt!212299 () Unit!8448)

(declare-fun Unit!8550 () Unit!8448)

(assert (=> b!136489 (= lt!212299 Unit!8550)))

(declare-fun lt!212305 () Unit!8448)

(assert (=> b!136489 (= lt!212305 (arrayUpdatedAtPrefixLemma!6 arr!237 from!447 (_1!6240 lt!212325)))))

(assert (=> b!136489 call!1817))

(declare-fun lt!212318 () Unit!8448)

(assert (=> b!136489 (= lt!212318 lt!212305)))

(assert (=> b!136489 (= lt!212307 #b00000000000000000000000000000000)))

(declare-fun lt!212298 () Unit!8448)

(assert (=> b!136489 (= lt!212298 (arrayRangesEqTransitive!10 arr!237 lt!212319 (_3!317 lt!212326) lt!212307 from!447 (bvadd from!447 #b00000000000000000000000000000001)))))

(assert (=> b!136489 call!1818))

(declare-fun lt!212312 () Unit!8448)

(assert (=> b!136489 (= lt!212312 lt!212298)))

(assert (=> b!136489 (arrayRangesEq!208 arr!237 (_3!317 lt!212326) #b00000000000000000000000000000000 from!447)))

(declare-fun lt!212321 () Unit!8448)

(declare-fun Unit!8551 () Unit!8448)

(assert (=> b!136489 (= lt!212321 Unit!8551)))

(declare-fun lt!212324 () Unit!8448)

(assert (=> b!136489 (= lt!212324 (arrayRangesEqImpliesEq!6 lt!212319 (_3!317 lt!212326) #b00000000000000000000000000000000 from!447 (bvadd from!447 #b00000000000000000000000000000001)))))

(assert (=> b!136489 (= (select (store (arr!3470 arr!237) from!447 (_1!6240 lt!212325)) from!447) (select (arr!3470 (_3!317 lt!212326)) from!447))))

(declare-fun lt!212306 () Unit!8448)

(assert (=> b!136489 (= lt!212306 lt!212324)))

(declare-fun lt!212301 () Bool)

(assert (=> b!136489 (= lt!212301 (= (select (arr!3470 (_3!317 lt!212326)) from!447) (_1!6240 lt!212325)))))

(declare-fun Unit!8552 () Unit!8448)

(assert (=> b!136489 (= lt!212297 Unit!8552)))

(assert (=> b!136489 lt!212301))

(declare-fun b!136490 () Bool)

(assert (=> b!136490 (= e!90652 (= (select (arr!3470 (_3!317 lt!212300)) from!447) (_2!6235 (readBytePure!0 (_1!6237 lt!210787)))))))

(assert (=> b!136490 (and (bvsge from!447 #b00000000000000000000000000000000) (bvslt from!447 (size!2805 (_3!317 lt!212300))))))

(assert (= (and d!44070 c!7724) b!136489))

(assert (= (and d!44070 (not c!7724)) b!136487))

(assert (= (or b!136489 b!136487) bm!1815))

(assert (= (or b!136489 b!136487) bm!1813))

(assert (= (or b!136489 b!136487) bm!1814))

(assert (= (and d!44070 res!113571) b!136488))

(assert (= (and b!136488 res!113570) b!136486))

(assert (= (and d!44070 (not res!113569)) b!136490))

(declare-fun m!209043 () Bool)

(assert (=> d!44070 m!209043))

(assert (=> d!44070 m!208619))

(assert (=> b!136487 m!208731))

(declare-fun m!209045 () Bool)

(assert (=> b!136487 m!209045))

(declare-fun m!209047 () Bool)

(assert (=> bm!1813 m!209047))

(declare-fun m!209049 () Bool)

(assert (=> bm!1813 m!209049))

(declare-fun m!209051 () Bool)

(assert (=> bm!1815 m!209051))

(declare-fun m!209053 () Bool)

(assert (=> b!136489 m!209053))

(declare-fun m!209055 () Bool)

(assert (=> b!136489 m!209055))

(declare-fun m!209057 () Bool)

(assert (=> b!136489 m!209057))

(declare-fun m!209059 () Bool)

(assert (=> b!136489 m!209059))

(declare-fun m!209061 () Bool)

(assert (=> b!136489 m!209061))

(assert (=> b!136489 m!208619))

(assert (=> b!136489 m!207641))

(declare-fun m!209063 () Bool)

(assert (=> b!136489 m!209063))

(declare-fun m!209065 () Bool)

(assert (=> b!136489 m!209065))

(declare-fun m!209067 () Bool)

(assert (=> b!136489 m!209067))

(declare-fun m!209069 () Bool)

(assert (=> b!136489 m!209069))

(declare-fun m!209071 () Bool)

(assert (=> b!136489 m!209071))

(assert (=> b!136489 m!209047))

(declare-fun m!209073 () Bool)

(assert (=> b!136486 m!209073))

(declare-fun m!209075 () Bool)

(assert (=> bm!1814 m!209075))

(declare-fun m!209077 () Bool)

(assert (=> b!136490 m!209077))

(assert (=> b!136490 m!207301))

(assert (=> d!43534 d!44070))

(declare-fun d!44072 () Bool)

(assert (=> d!44072 (= (remainingBits!0 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!210768)))) ((_ sign_extend 32) (currentByte!5995 (_2!6234 lt!210768))) ((_ sign_extend 32) (currentBit!5990 (_2!6234 lt!210768)))) (bvsub (bvmul ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!210768)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5995 (_2!6234 lt!210768))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5990 (_2!6234 lt!210768))))))))

(assert (=> d!43589 d!44072))

(declare-fun d!44074 () Bool)

(assert (=> d!44074 (= (invariant!0 (currentBit!5990 (_2!6234 lt!210768)) (currentByte!5995 (_2!6234 lt!210768)) (size!2805 (buf!3198 (_2!6234 lt!210768)))) (and (bvsge (currentBit!5990 (_2!6234 lt!210768)) #b00000000000000000000000000000000) (bvslt (currentBit!5990 (_2!6234 lt!210768)) #b00000000000000000000000000001000) (bvsge (currentByte!5995 (_2!6234 lt!210768)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5995 (_2!6234 lt!210768)) (size!2805 (buf!3198 (_2!6234 lt!210768)))) (and (= (currentBit!5990 (_2!6234 lt!210768)) #b00000000000000000000000000000000) (= (currentByte!5995 (_2!6234 lt!210768)) (size!2805 (buf!3198 (_2!6234 lt!210768))))))))))

(assert (=> d!43589 d!44074))

(declare-fun d!44076 () Bool)

(declare-fun res!113574 () Bool)

(declare-fun e!90656 () Bool)

(assert (=> d!44076 (=> (not res!113574) (not e!90656))))

(assert (=> d!44076 (= res!113574 (= (size!2805 (buf!3198 (_2!6234 lt!210768))) (size!2805 (buf!3198 (_2!6234 lt!211191)))))))

(assert (=> d!44076 (= (isPrefixOf!0 (_2!6234 lt!210768) (_2!6234 lt!211191)) e!90656)))

(declare-fun b!136491 () Bool)

(declare-fun res!113573 () Bool)

(assert (=> b!136491 (=> (not res!113573) (not e!90656))))

(assert (=> b!136491 (= res!113573 (bvsle (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!210768))) (currentByte!5995 (_2!6234 lt!210768)) (currentBit!5990 (_2!6234 lt!210768))) (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!211191))) (currentByte!5995 (_2!6234 lt!211191)) (currentBit!5990 (_2!6234 lt!211191)))))))

(declare-fun b!136492 () Bool)

(declare-fun e!90655 () Bool)

(assert (=> b!136492 (= e!90656 e!90655)))

(declare-fun res!113572 () Bool)

(assert (=> b!136492 (=> res!113572 e!90655)))

(assert (=> b!136492 (= res!113572 (= (size!2805 (buf!3198 (_2!6234 lt!210768))) #b00000000000000000000000000000000))))

(declare-fun b!136493 () Bool)

(assert (=> b!136493 (= e!90655 (arrayBitRangesEq!0 (buf!3198 (_2!6234 lt!210768)) (buf!3198 (_2!6234 lt!211191)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!210768))) (currentByte!5995 (_2!6234 lt!210768)) (currentBit!5990 (_2!6234 lt!210768)))))))

(assert (= (and d!44076 res!113574) b!136491))

(assert (= (and b!136491 res!113573) b!136492))

(assert (= (and b!136492 (not res!113572)) b!136493))

(assert (=> b!136491 m!207285))

(assert (=> b!136491 m!207669))

(assert (=> b!136493 m!207285))

(assert (=> b!136493 m!207285))

(declare-fun m!209079 () Bool)

(assert (=> b!136493 m!209079))

(assert (=> b!135918 d!44076))

(assert (=> b!135934 d!43589))

(assert (=> b!135934 d!43593))

(assert (=> d!43548 d!44072))

(declare-fun d!44078 () Bool)

(assert (=> d!44078 (= (remainingBits!0 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!210775)))) ((_ sign_extend 32) (currentByte!5995 thiss!1634)) ((_ sign_extend 32) (currentBit!5990 thiss!1634))) (bvsub (bvmul ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!210775)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5995 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5990 thiss!1634)))))))

(assert (=> d!43544 d!44078))

(assert (=> d!43607 d!43605))

(declare-fun d!44080 () Bool)

(assert (=> d!44080 (arrayRangesEq!208 (_2!6236 lt!210780) (_2!6236 lt!210791) #b00000000000000000000000000000000 to!404)))

(assert (=> d!44080 true))

(declare-fun _$6!295 () Unit!8448)

(assert (=> d!44080 (= (choose!70 (_2!6236 lt!210791) (_2!6236 lt!210780) #b00000000000000000000000000000000 to!404) _$6!295)))

(declare-fun bs!10730 () Bool)

(assert (= bs!10730 d!44080))

(assert (=> bs!10730 m!207281))

(assert (=> d!43607 d!44080))

(declare-fun d!44082 () Bool)

(declare-fun e!90657 () Bool)

(assert (=> d!44082 e!90657))

(declare-fun res!113576 () Bool)

(assert (=> d!44082 (=> (not res!113576) (not e!90657))))

(declare-fun lt!212336 () (_ BitVec 64))

(declare-fun lt!212335 () (_ BitVec 64))

(declare-fun lt!212333 () (_ BitVec 64))

(assert (=> d!44082 (= res!113576 (= lt!212335 (bvsub lt!212336 lt!212333)))))

(assert (=> d!44082 (or (= (bvand lt!212336 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!212333 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!212336 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!212336 lt!212333) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44082 (= lt!212333 (remainingBits!0 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!211191)))) ((_ sign_extend 32) (currentByte!5995 (_2!6234 lt!211191))) ((_ sign_extend 32) (currentBit!5990 (_2!6234 lt!211191)))))))

(declare-fun lt!212338 () (_ BitVec 64))

(declare-fun lt!212334 () (_ BitVec 64))

(assert (=> d!44082 (= lt!212336 (bvmul lt!212338 lt!212334))))

(assert (=> d!44082 (or (= lt!212338 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!212334 (bvsdiv (bvmul lt!212338 lt!212334) lt!212338)))))

(assert (=> d!44082 (= lt!212334 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44082 (= lt!212338 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!211191)))))))

(assert (=> d!44082 (= lt!212335 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5995 (_2!6234 lt!211191))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5990 (_2!6234 lt!211191)))))))

(assert (=> d!44082 (invariant!0 (currentBit!5990 (_2!6234 lt!211191)) (currentByte!5995 (_2!6234 lt!211191)) (size!2805 (buf!3198 (_2!6234 lt!211191))))))

(assert (=> d!44082 (= (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!211191))) (currentByte!5995 (_2!6234 lt!211191)) (currentBit!5990 (_2!6234 lt!211191))) lt!212335)))

(declare-fun b!136494 () Bool)

(declare-fun res!113575 () Bool)

(assert (=> b!136494 (=> (not res!113575) (not e!90657))))

(assert (=> b!136494 (= res!113575 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!212335))))

(declare-fun b!136495 () Bool)

(declare-fun lt!212337 () (_ BitVec 64))

(assert (=> b!136495 (= e!90657 (bvsle lt!212335 (bvmul lt!212337 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!136495 (or (= lt!212337 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!212337 #b0000000000000000000000000000000000000000000000000000000000001000) lt!212337)))))

(assert (=> b!136495 (= lt!212337 ((_ sign_extend 32) (size!2805 (buf!3198 (_2!6234 lt!211191)))))))

(assert (= (and d!44082 res!113576) b!136494))

(assert (= (and b!136494 res!113575) b!136495))

(declare-fun m!209081 () Bool)

(assert (=> d!44082 m!209081))

(declare-fun m!209083 () Bool)

(assert (=> d!44082 m!209083))

(assert (=> b!135920 d!44082))

(assert (=> b!135920 d!43589))

(declare-fun d!44084 () Bool)

(declare-fun res!113579 () Bool)

(declare-fun e!90659 () Bool)

(assert (=> d!44084 (=> (not res!113579) (not e!90659))))

(assert (=> d!44084 (= res!113579 (= (size!2805 (buf!3198 (_1!6237 lt!211114))) (size!2805 (buf!3198 (_2!6234 lt!210768)))))))

(assert (=> d!44084 (= (isPrefixOf!0 (_1!6237 lt!211114) (_2!6234 lt!210768)) e!90659)))

(declare-fun b!136496 () Bool)

(declare-fun res!113578 () Bool)

(assert (=> b!136496 (=> (not res!113578) (not e!90659))))

(assert (=> b!136496 (= res!113578 (bvsle (bitIndex!0 (size!2805 (buf!3198 (_1!6237 lt!211114))) (currentByte!5995 (_1!6237 lt!211114)) (currentBit!5990 (_1!6237 lt!211114))) (bitIndex!0 (size!2805 (buf!3198 (_2!6234 lt!210768))) (currentByte!5995 (_2!6234 lt!210768)) (currentBit!5990 (_2!6234 lt!210768)))))))

(declare-fun b!136497 () Bool)

(declare-fun e!90658 () Bool)

(assert (=> b!136497 (= e!90659 e!90658)))

(declare-fun res!113577 () Bool)

(assert (=> b!136497 (=> res!113577 e!90658)))

(assert (=> b!136497 (= res!113577 (= (size!2805 (buf!3198 (_1!6237 lt!211114))) #b00000000000000000000000000000000))))

(declare-fun b!136498 () Bool)

(assert (=> b!136498 (= e!90658 (arrayBitRangesEq!0 (buf!3198 (_1!6237 lt!211114)) (buf!3198 (_2!6234 lt!210768)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2805 (buf!3198 (_1!6237 lt!211114))) (currentByte!5995 (_1!6237 lt!211114)) (currentBit!5990 (_1!6237 lt!211114)))))))

(assert (= (and d!44084 res!113579) b!136496))

(assert (= (and b!136496 res!113578) b!136497))

(assert (= (and b!136497 (not res!113577)) b!136498))

(assert (=> b!136496 m!208879))

(assert (=> b!136496 m!207285))

(assert (=> b!136498 m!208879))

(assert (=> b!136498 m!208879))

(declare-fun m!209085 () Bool)

(assert (=> b!136498 m!209085))

(assert (=> b!135884 d!44084))

(assert (=> b!135931 d!43591))

(declare-fun d!44086 () Bool)

(assert (=> d!44086 (arrayBitRangesEq!0 (buf!3198 (_2!6234 lt!210768)) (buf!3198 thiss!1634) lt!211253 lt!211248)))

(declare-fun lt!212339 () Unit!8448)

(assert (=> d!44086 (= lt!212339 (choose!8 (buf!3198 thiss!1634) (buf!3198 (_2!6234 lt!210768)) lt!211253 lt!211248))))

(assert (=> d!44086 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!211253) (bvsle lt!211253 lt!211248))))

(assert (=> d!44086 (= (arrayBitRangesEqSymmetric!0 (buf!3198 thiss!1634) (buf!3198 (_2!6234 lt!210768)) lt!211253 lt!211248) lt!212339)))

(declare-fun bs!10731 () Bool)

(assert (= bs!10731 d!44086))

(assert (=> bs!10731 m!207735))

(declare-fun m!209087 () Bool)

(assert (=> bs!10731 m!209087))

(assert (=> b!135931 d!44086))

(declare-fun b!136499 () Bool)

(declare-fun res!113584 () Bool)

(declare-fun lt!212340 () (_ BitVec 32))

(assert (=> b!136499 (= res!113584 (= lt!212340 #b00000000000000000000000000000000))))

(declare-fun e!90664 () Bool)

(assert (=> b!136499 (=> res!113584 e!90664)))

(declare-fun e!90661 () Bool)

(assert (=> b!136499 (= e!90661 e!90664)))

(declare-fun bm!1816 () Bool)

(declare-fun c!7725 () Bool)

(declare-fun call!1819 () Bool)

(declare-fun lt!212342 () (_ BitVec 32))

(declare-fun lt!212341 () tuple4!120)

(assert (=> bm!1816 (= call!1819 (byteRangesEq!0 (ite c!7725 (select (arr!3470 (buf!3198 (_2!6234 lt!210768))) (_3!320 lt!212341)) (select (arr!3470 (buf!3198 (_2!6234 lt!210768))) (_4!60 lt!212341))) (ite c!7725 (select (arr!3470 (buf!3198 thiss!1634)) (_3!320 lt!212341)) (select (arr!3470 (buf!3198 thiss!1634)) (_4!60 lt!212341))) (ite c!7725 lt!212342 #b00000000000000000000000000000000) lt!212340))))

(declare-fun b!136500 () Bool)

(declare-fun e!90662 () Bool)

(assert (=> b!136500 (= e!90662 call!1819)))

(declare-fun b!136501 () Bool)

(declare-fun e!90660 () Bool)

(declare-fun e!90663 () Bool)

(assert (=> b!136501 (= e!90660 e!90663)))

(declare-fun res!113582 () Bool)

(assert (=> b!136501 (=> (not res!113582) (not e!90663))))

(declare-fun e!90665 () Bool)

(assert (=> b!136501 (= res!113582 e!90665)))

(declare-fun res!113580 () Bool)

(assert (=> b!136501 (=> res!113580 e!90665)))

(assert (=> b!136501 (= res!113580 (bvsge (_1!6247 lt!212341) (_2!6247 lt!212341)))))

(assert (=> b!136501 (= lt!212340 ((_ extract 31 0) (bvsrem lt!211248 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!136501 (= lt!212342 ((_ extract 31 0) (bvsrem lt!211253 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!136501 (= lt!212341 (arrayBitIndices!0 lt!211253 lt!211248))))

(declare-fun b!136502 () Bool)

(assert (=> b!136502 (= e!90664 call!1819)))

(declare-fun d!44088 () Bool)

(declare-fun res!113583 () Bool)

(assert (=> d!44088 (=> res!113583 e!90660)))

(assert (=> d!44088 (= res!113583 (bvsge lt!211253 lt!211248))))

(assert (=> d!44088 (= (arrayBitRangesEq!0 (buf!3198 (_2!6234 lt!210768)) (buf!3198 thiss!1634) lt!211253 lt!211248) e!90660)))

(declare-fun b!136503 () Bool)

(assert (=> b!136503 (= e!90662 e!90661)))

(declare-fun res!113581 () Bool)

(assert (=> b!136503 (= res!113581 (byteRangesEq!0 (select (arr!3470 (buf!3198 (_2!6234 lt!210768))) (_3!320 lt!212341)) (select (arr!3470 (buf!3198 thiss!1634)) (_3!320 lt!212341)) lt!212342 #b00000000000000000000000000001000))))

(assert (=> b!136503 (=> (not res!113581) (not e!90661))))

(declare-fun b!136504 () Bool)

(assert (=> b!136504 (= e!90663 e!90662)))

(assert (=> b!136504 (= c!7725 (= (_3!320 lt!212341) (_4!60 lt!212341)))))

(declare-fun b!136505 () Bool)

(assert (=> b!136505 (= e!90665 (arrayRangesEq!208 (buf!3198 (_2!6234 lt!210768)) (buf!3198 thiss!1634) (_1!6247 lt!212341) (_2!6247 lt!212341)))))

(assert (= (and d!44088 (not res!113583)) b!136501))

(assert (= (and b!136501 (not res!113580)) b!136505))

(assert (= (and b!136501 res!113582) b!136504))

(assert (= (and b!136504 c!7725) b!136500))

(assert (= (and b!136504 (not c!7725)) b!136503))

(assert (= (and b!136503 res!113581) b!136499))

(assert (= (and b!136499 (not res!113584)) b!136502))

(assert (= (or b!136500 b!136502) bm!1816))

(declare-fun m!209089 () Bool)

(assert (=> bm!1816 m!209089))

(declare-fun m!209091 () Bool)

(assert (=> bm!1816 m!209091))

(declare-fun m!209093 () Bool)

(assert (=> bm!1816 m!209093))

(declare-fun m!209095 () Bool)

(assert (=> bm!1816 m!209095))

(declare-fun m!209097 () Bool)

(assert (=> bm!1816 m!209097))

(declare-fun m!209099 () Bool)

(assert (=> b!136501 m!209099))

(assert (=> b!136503 m!209093))

(assert (=> b!136503 m!209091))

(assert (=> b!136503 m!209093))

(assert (=> b!136503 m!209091))

(declare-fun m!209101 () Bool)

(assert (=> b!136503 m!209101))

(declare-fun m!209103 () Bool)

(assert (=> b!136505 m!209103))

(assert (=> b!135931 d!44088))

(push 1)

(assert (not d!43918))

(assert (not b!136446))

(assert (not b!136470))

(assert (not b!136405))

(assert (not b!136393))

(assert (not d!44082))

(assert (not d!44066))

(assert (not b!136352))

(assert (not b!136396))

(assert (not b!136381))

(assert (not b!136395))

(assert (not d!43912))

(assert (not d!43976))

(assert (not b!136341))

(assert (not b!136292))

(assert (not bm!1803))

(assert (not b!136424))

(assert (not b!136472))

(assert (not d!43914))

(assert (not d!43902))

(assert (not b!136461))

(assert (not b!136343))

(assert (not b!136475))

(assert (not b!136459))

(assert (not d!43932))

(assert (not bm!1809))

(assert (not b!136408))

(assert (not b!136319))

(assert (not b!136376))

(assert (not b!136351))

(assert (not d!43994))

(assert (not d!43986))

(assert (not b!136368))

(assert (not d!44022))

(assert (not d!43916))

(assert (not d!44000))

(assert (not b!136479))

(assert (not b!136426))

(assert (not bm!1807))

(assert (not b!136366))

(assert (not d!44014))

(assert (not b!136354))

(assert (not d!44080))

(assert (not d!43958))

(assert (not b!136303))

(assert (not b!136413))

(assert (not b!136427))

(assert (not d!43900))

(assert (not b!136404))

(assert (not bm!1816))

(assert (not bm!1815))

(assert (not d!44016))

(assert (not b!136378))

(assert (not b!136306))

(assert (not b!136473))

(assert (not d!44018))

(assert (not b!136281))

(assert (not b!136451))

(assert (not bm!1808))

(assert (not b!136320))

(assert (not b!136466))

(assert (not b!136428))

(assert (not d!44070))

(assert (not b!136280))

(assert (not b!136371))

(assert (not b!136278))

(assert (not d!43984))

(assert (not b!136283))

(assert (not d!43926))

(assert (not bm!1797))

(assert (not d!43988))

(assert (not d!43982))

(assert (not bm!1804))

(assert (not d!43920))

(assert (not d!44012))

(assert (not b!136454))

(assert (not b!136307))

(assert (not b!136505))

(assert (not bm!1814))

(assert (not b!136444))

(assert (not d!44060))

(assert (not b!136443))

(assert (not d!43910))

(assert (not d!43956))

(assert (not b!136481))

(assert (not b!136476))

(assert (not d!43962))

(assert (not b!136453))

(assert (not bm!1806))

(assert (not b!136400))

(assert (not d!44086))

(assert (not d!44024))

(assert (not d!44032))

(assert (not b!136490))

(assert (not b!136402))

(assert (not b!136363))

(assert (not b!136485))

(assert (not b!136449))

(assert (not bm!1812))

(assert (not b!136284))

(assert (not b!136339))

(assert (not b!136478))

(assert (not b!136355))

(assert (not b!136493))

(assert (not b!136350))

(assert (not b!136362))

(assert (not b!136304))

(assert (not b!136373))

(assert (not b!136496))

(assert (not b!136397))

(assert (not b!136501))

(assert (not b!136313))

(assert (not b!136411))

(assert (not d!44008))

(assert (not b!136487))

(assert (not b!136442))

(assert (not d!44026))

(assert (not b!136290))

(assert (not bm!1810))

(assert (not d!44034))

(assert (not b!136384))

(assert (not d!43972))

(assert (not b!136365))

(assert (not b!136410))

(assert (not b!136503))

(assert (not b!136289))

(assert (not b!136317))

(assert (not b!136456))

(assert (not b!136375))

(assert (not d!43990))

(assert (not b!136315))

(assert (not b!136356))

(assert (not b!136399))

(assert (not d!43970))

(assert (not d!43992))

(assert (not bm!1798))

(assert (not b!136322))

(assert (not b!136463))

(assert (not d!44064))

(assert (not b!136486))

(assert (not b!136379))

(assert (not b!136489))

(assert (not b!136468))

(assert (not b!136440))

(assert (not d!44054))

(assert (not d!43950))

(assert (not b!136491))

(assert (not d!43998))

(assert (not d!43960))

(assert (not d!44030))

(assert (not b!136287))

(assert (not b!136345))

(assert (not d!43996))

(assert (not bm!1813))

(assert (not bm!1811))

(assert (not bm!1802))

(assert (not d!43968))

(assert (not b!136441))

(assert (not bm!1805))

(assert (not b!136286))

(assert (not b!136498))

(assert (not d!44048))

(assert (not b!136358))

(assert (not d!44020))

(assert (not b!136398))

(assert (not b!136425))

(assert (not b!136394))

(assert (not d!43940))

(assert (not d!43952))

(assert (not b!136483))

(assert (not d!43966))

(assert (not bm!1799))

(assert (not b!136407))

(check-sat)

(pop 1)

(push 1)

(check-sat)

