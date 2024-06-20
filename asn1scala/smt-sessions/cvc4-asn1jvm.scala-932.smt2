; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26370 () Bool)

(assert start!26370)

(declare-fun b!135201 () Bool)

(declare-fun e!89744 () Bool)

(declare-datatypes ((array!6170 0))(
  ( (array!6171 (arr!3458 (Array (_ BitVec 32) (_ BitVec 8))) (size!2793 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4850 0))(
  ( (BitStream!4851 (buf!3186 array!6170) (currentByte!5983 (_ BitVec 32)) (currentBit!5978 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!11740 0))(
  ( (tuple2!11741 (_1!6186 BitStream!4850) (_2!6186 (_ BitVec 8))) )
))
(declare-fun lt!209829 () tuple2!11740)

(declare-fun lt!209834 () tuple2!11740)

(assert (=> b!135201 (= e!89744 (= (_2!6186 lt!209829) (_2!6186 lt!209834)))))

(declare-fun b!135202 () Bool)

(declare-fun e!89746 () Bool)

(declare-fun e!89739 () Bool)

(assert (=> b!135202 (= e!89746 e!89739)))

(declare-fun res!112427 () Bool)

(assert (=> b!135202 (=> (not res!112427) (not e!89739))))

(declare-fun lt!209822 () (_ BitVec 64))

(declare-datatypes ((Unit!8424 0))(
  ( (Unit!8425) )
))
(declare-datatypes ((tuple2!11742 0))(
  ( (tuple2!11743 (_1!6187 Unit!8424) (_2!6187 BitStream!4850)) )
))
(declare-fun lt!209837 () tuple2!11742)

(declare-fun lt!209839 () tuple2!11742)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!135202 (= res!112427 (= (bitIndex!0 (size!2793 (buf!3186 (_2!6187 lt!209839))) (currentByte!5983 (_2!6187 lt!209839)) (currentBit!5978 (_2!6187 lt!209839))) (bvadd (bitIndex!0 (size!2793 (buf!3186 (_2!6187 lt!209837))) (currentByte!5983 (_2!6187 lt!209837)) (currentBit!5978 (_2!6187 lt!209837))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!209822))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!135202 (= lt!209822 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!135203 () Bool)

(declare-fun res!112433 () Bool)

(declare-fun e!89748 () Bool)

(assert (=> b!135203 (=> (not res!112433) (not e!89748))))

(assert (=> b!135203 (= res!112433 (bvslt from!447 to!404))))

(declare-fun e!89738 () Bool)

(declare-fun b!135204 () Bool)

(declare-datatypes ((tuple2!11744 0))(
  ( (tuple2!11745 (_1!6188 BitStream!4850) (_2!6188 BitStream!4850)) )
))
(declare-fun lt!209820 () tuple2!11744)

(declare-fun lt!209838 () tuple2!11740)

(declare-fun arr!237 () array!6170)

(assert (=> b!135204 (= e!89738 (and (= (_2!6186 lt!209838) (select (arr!3458 arr!237) from!447)) (= (_1!6186 lt!209838) (_2!6188 lt!209820))))))

(declare-fun readBytePure!0 (BitStream!4850) tuple2!11740)

(assert (=> b!135204 (= lt!209838 (readBytePure!0 (_1!6188 lt!209820)))))

(declare-fun thiss!1634 () BitStream!4850)

(declare-fun reader!0 (BitStream!4850 BitStream!4850) tuple2!11744)

(assert (=> b!135204 (= lt!209820 (reader!0 thiss!1634 (_2!6187 lt!209837)))))

(declare-fun b!135205 () Bool)

(declare-fun res!112424 () Bool)

(assert (=> b!135205 (=> (not res!112424) (not e!89748))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!135205 (= res!112424 (invariant!0 (currentBit!5978 thiss!1634) (currentByte!5983 thiss!1634) (size!2793 (buf!3186 thiss!1634))))))

(declare-fun b!135206 () Bool)

(declare-fun res!112432 () Bool)

(assert (=> b!135206 (=> (not res!112432) (not e!89738))))

(assert (=> b!135206 (= res!112432 (= (bitIndex!0 (size!2793 (buf!3186 (_2!6187 lt!209837))) (currentByte!5983 (_2!6187 lt!209837)) (currentBit!5978 (_2!6187 lt!209837))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2793 (buf!3186 thiss!1634)) (currentByte!5983 thiss!1634) (currentBit!5978 thiss!1634)))))))

(declare-fun res!112434 () Bool)

(assert (=> start!26370 (=> (not res!112434) (not e!89748))))

(assert (=> start!26370 (= res!112434 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2793 arr!237))))))

(assert (=> start!26370 e!89748))

(assert (=> start!26370 true))

(declare-fun array_inv!2582 (array!6170) Bool)

(assert (=> start!26370 (array_inv!2582 arr!237)))

(declare-fun e!89740 () Bool)

(declare-fun inv!12 (BitStream!4850) Bool)

(assert (=> start!26370 (and (inv!12 thiss!1634) e!89740)))

(declare-fun b!135207 () Bool)

(declare-fun res!112422 () Bool)

(assert (=> b!135207 (=> (not res!112422) (not e!89739))))

(declare-fun isPrefixOf!0 (BitStream!4850 BitStream!4850) Bool)

(assert (=> b!135207 (= res!112422 (isPrefixOf!0 (_2!6187 lt!209837) (_2!6187 lt!209839)))))

(declare-fun b!135208 () Bool)

(declare-fun res!112430 () Bool)

(assert (=> b!135208 (=> (not res!112430) (not e!89738))))

(assert (=> b!135208 (= res!112430 (isPrefixOf!0 thiss!1634 (_2!6187 lt!209837)))))

(declare-fun b!135209 () Bool)

(declare-fun e!89747 () Bool)

(assert (=> b!135209 (= e!89739 (not e!89747))))

(declare-fun res!112423 () Bool)

(assert (=> b!135209 (=> res!112423 e!89747)))

(declare-datatypes ((tuple2!11746 0))(
  ( (tuple2!11747 (_1!6189 BitStream!4850) (_2!6189 array!6170)) )
))
(declare-fun lt!209824 () tuple2!11746)

(declare-fun lt!209836 () tuple2!11744)

(assert (=> b!135209 (= res!112423 (or (not (= (size!2793 (_2!6189 lt!209824)) (size!2793 arr!237))) (not (= (_1!6189 lt!209824) (_2!6188 lt!209836)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4850 array!6170 (_ BitVec 32) (_ BitVec 32)) tuple2!11746)

(assert (=> b!135209 (= lt!209824 (readByteArrayLoopPure!0 (_1!6188 lt!209836) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!135209 (validate_offset_bits!1 ((_ sign_extend 32) (size!2793 (buf!3186 (_2!6187 lt!209839)))) ((_ sign_extend 32) (currentByte!5983 (_2!6187 lt!209837))) ((_ sign_extend 32) (currentBit!5978 (_2!6187 lt!209837))) lt!209822)))

(declare-fun lt!209833 () Unit!8424)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4850 array!6170 (_ BitVec 64)) Unit!8424)

(assert (=> b!135209 (= lt!209833 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6187 lt!209837) (buf!3186 (_2!6187 lt!209839)) lt!209822))))

(assert (=> b!135209 (= lt!209836 (reader!0 (_2!6187 lt!209837) (_2!6187 lt!209839)))))

(declare-fun b!135210 () Bool)

(declare-fun e!89745 () Bool)

(assert (=> b!135210 (= e!89745 true)))

(declare-fun lt!209825 () tuple2!11746)

(declare-fun lt!209814 () tuple2!11746)

(declare-fun arrayRangesEq!196 (array!6170 array!6170 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!135210 (arrayRangesEq!196 (_2!6189 lt!209825) (_2!6189 lt!209814) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!209828 () Unit!8424)

(declare-fun arrayRangesEqSymmetricLemma!9 (array!6170 array!6170 (_ BitVec 32) (_ BitVec 32)) Unit!8424)

(assert (=> b!135210 (= lt!209828 (arrayRangesEqSymmetricLemma!9 (_2!6189 lt!209814) (_2!6189 lt!209825) #b00000000000000000000000000000000 to!404))))

(declare-fun b!135211 () Bool)

(declare-fun e!89742 () Bool)

(assert (=> b!135211 (= e!89742 (invariant!0 (currentBit!5978 thiss!1634) (currentByte!5983 thiss!1634) (size!2793 (buf!3186 (_2!6187 lt!209837)))))))

(declare-fun b!135212 () Bool)

(assert (=> b!135212 (= e!89747 (not (arrayRangesEq!196 arr!237 (_2!6189 lt!209824) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!135213 () Bool)

(declare-fun res!112431 () Bool)

(assert (=> b!135213 (=> (not res!112431) (not e!89748))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!135213 (= res!112431 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2793 (buf!3186 thiss!1634))) ((_ sign_extend 32) (currentByte!5983 thiss!1634)) ((_ sign_extend 32) (currentBit!5978 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!135214 () Bool)

(assert (=> b!135214 (= e!89740 (array_inv!2582 (buf!3186 thiss!1634)))))

(declare-fun b!135215 () Bool)

(assert (=> b!135215 (= e!89748 (not e!89745))))

(declare-fun res!112429 () Bool)

(assert (=> b!135215 (=> res!112429 e!89745)))

(assert (=> b!135215 (= res!112429 (not (arrayRangesEq!196 (_2!6189 lt!209814) (_2!6189 lt!209825) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!209819 () tuple2!11746)

(assert (=> b!135215 (arrayRangesEq!196 (_2!6189 lt!209814) (_2!6189 lt!209819) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!209823 () tuple2!11744)

(declare-fun lt!209827 () Unit!8424)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4850 array!6170 (_ BitVec 32) (_ BitVec 32)) Unit!8424)

(assert (=> b!135215 (= lt!209827 (readByteArrayLoopArrayPrefixLemma!0 (_1!6188 lt!209823) arr!237 from!447 to!404))))

(declare-fun lt!209831 () array!6170)

(declare-fun withMovedByteIndex!0 (BitStream!4850 (_ BitVec 32)) BitStream!4850)

(assert (=> b!135215 (= lt!209819 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6188 lt!209823) #b00000000000000000000000000000001) lt!209831 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!209815 () tuple2!11744)

(assert (=> b!135215 (= lt!209825 (readByteArrayLoopPure!0 (_1!6188 lt!209815) lt!209831 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!209816 () tuple2!11740)

(assert (=> b!135215 (= lt!209831 (array!6171 (store (arr!3458 arr!237) from!447 (_2!6186 lt!209816)) (size!2793 arr!237)))))

(declare-fun lt!209830 () (_ BitVec 32))

(assert (=> b!135215 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2793 (buf!3186 (_2!6187 lt!209839)))) ((_ sign_extend 32) (currentByte!5983 (_2!6187 lt!209837))) ((_ sign_extend 32) (currentBit!5978 (_2!6187 lt!209837))) lt!209830)))

(declare-fun lt!209835 () Unit!8424)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4850 array!6170 (_ BitVec 32)) Unit!8424)

(assert (=> b!135215 (= lt!209835 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6187 lt!209837) (buf!3186 (_2!6187 lt!209839)) lt!209830))))

(assert (=> b!135215 (= (_1!6189 lt!209814) (_2!6188 lt!209823))))

(assert (=> b!135215 (= lt!209814 (readByteArrayLoopPure!0 (_1!6188 lt!209823) arr!237 from!447 to!404))))

(assert (=> b!135215 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2793 (buf!3186 (_2!6187 lt!209839)))) ((_ sign_extend 32) (currentByte!5983 thiss!1634)) ((_ sign_extend 32) (currentBit!5978 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!209818 () Unit!8424)

(assert (=> b!135215 (= lt!209818 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3186 (_2!6187 lt!209839)) (bvsub to!404 from!447)))))

(assert (=> b!135215 (= (_2!6186 lt!209816) (select (arr!3458 arr!237) from!447))))

(assert (=> b!135215 (= lt!209816 (readBytePure!0 (_1!6188 lt!209823)))))

(assert (=> b!135215 (= lt!209815 (reader!0 (_2!6187 lt!209837) (_2!6187 lt!209839)))))

(assert (=> b!135215 (= lt!209823 (reader!0 thiss!1634 (_2!6187 lt!209839)))))

(assert (=> b!135215 e!89744))

(declare-fun res!112425 () Bool)

(assert (=> b!135215 (=> (not res!112425) (not e!89744))))

(assert (=> b!135215 (= res!112425 (= (bitIndex!0 (size!2793 (buf!3186 (_1!6186 lt!209829))) (currentByte!5983 (_1!6186 lt!209829)) (currentBit!5978 (_1!6186 lt!209829))) (bitIndex!0 (size!2793 (buf!3186 (_1!6186 lt!209834))) (currentByte!5983 (_1!6186 lt!209834)) (currentBit!5978 (_1!6186 lt!209834)))))))

(declare-fun lt!209817 () Unit!8424)

(declare-fun lt!209821 () BitStream!4850)

(declare-fun readBytePrefixLemma!0 (BitStream!4850 BitStream!4850) Unit!8424)

(assert (=> b!135215 (= lt!209817 (readBytePrefixLemma!0 lt!209821 (_2!6187 lt!209839)))))

(assert (=> b!135215 (= lt!209834 (readBytePure!0 (BitStream!4851 (buf!3186 (_2!6187 lt!209839)) (currentByte!5983 thiss!1634) (currentBit!5978 thiss!1634))))))

(assert (=> b!135215 (= lt!209829 (readBytePure!0 lt!209821))))

(assert (=> b!135215 (= lt!209821 (BitStream!4851 (buf!3186 (_2!6187 lt!209837)) (currentByte!5983 thiss!1634) (currentBit!5978 thiss!1634)))))

(assert (=> b!135215 e!89742))

(declare-fun res!112426 () Bool)

(assert (=> b!135215 (=> (not res!112426) (not e!89742))))

(assert (=> b!135215 (= res!112426 (isPrefixOf!0 thiss!1634 (_2!6187 lt!209839)))))

(declare-fun lt!209832 () Unit!8424)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4850 BitStream!4850 BitStream!4850) Unit!8424)

(assert (=> b!135215 (= lt!209832 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6187 lt!209837) (_2!6187 lt!209839)))))

(assert (=> b!135215 e!89746))

(declare-fun res!112428 () Bool)

(assert (=> b!135215 (=> (not res!112428) (not e!89746))))

(assert (=> b!135215 (= res!112428 (= (size!2793 (buf!3186 (_2!6187 lt!209837))) (size!2793 (buf!3186 (_2!6187 lt!209839)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4850 array!6170 (_ BitVec 32) (_ BitVec 32)) tuple2!11742)

(assert (=> b!135215 (= lt!209839 (appendByteArrayLoop!0 (_2!6187 lt!209837) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!135215 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2793 (buf!3186 (_2!6187 lt!209837)))) ((_ sign_extend 32) (currentByte!5983 (_2!6187 lt!209837))) ((_ sign_extend 32) (currentBit!5978 (_2!6187 lt!209837))) lt!209830)))

(assert (=> b!135215 (= lt!209830 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!209826 () Unit!8424)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4850 BitStream!4850 (_ BitVec 64) (_ BitVec 32)) Unit!8424)

(assert (=> b!135215 (= lt!209826 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6187 lt!209837) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!135215 e!89738))

(declare-fun res!112421 () Bool)

(assert (=> b!135215 (=> (not res!112421) (not e!89738))))

(assert (=> b!135215 (= res!112421 (= (size!2793 (buf!3186 thiss!1634)) (size!2793 (buf!3186 (_2!6187 lt!209837)))))))

(declare-fun appendByte!0 (BitStream!4850 (_ BitVec 8)) tuple2!11742)

(assert (=> b!135215 (= lt!209837 (appendByte!0 thiss!1634 (select (arr!3458 arr!237) from!447)))))

(assert (= (and start!26370 res!112434) b!135213))

(assert (= (and b!135213 res!112431) b!135203))

(assert (= (and b!135203 res!112433) b!135205))

(assert (= (and b!135205 res!112424) b!135215))

(assert (= (and b!135215 res!112421) b!135206))

(assert (= (and b!135206 res!112432) b!135208))

(assert (= (and b!135208 res!112430) b!135204))

(assert (= (and b!135215 res!112428) b!135202))

(assert (= (and b!135202 res!112427) b!135207))

(assert (= (and b!135207 res!112422) b!135209))

(assert (= (and b!135209 (not res!112423)) b!135212))

(assert (= (and b!135215 res!112426) b!135211))

(assert (= (and b!135215 res!112425) b!135201))

(assert (= (and b!135215 (not res!112429)) b!135210))

(assert (= start!26370 b!135214))

(declare-fun m!206135 () Bool)

(assert (=> b!135215 m!206135))

(declare-fun m!206137 () Bool)

(assert (=> b!135215 m!206137))

(declare-fun m!206139 () Bool)

(assert (=> b!135215 m!206139))

(declare-fun m!206141 () Bool)

(assert (=> b!135215 m!206141))

(declare-fun m!206143 () Bool)

(assert (=> b!135215 m!206143))

(declare-fun m!206145 () Bool)

(assert (=> b!135215 m!206145))

(declare-fun m!206147 () Bool)

(assert (=> b!135215 m!206147))

(declare-fun m!206149 () Bool)

(assert (=> b!135215 m!206149))

(declare-fun m!206151 () Bool)

(assert (=> b!135215 m!206151))

(declare-fun m!206153 () Bool)

(assert (=> b!135215 m!206153))

(declare-fun m!206155 () Bool)

(assert (=> b!135215 m!206155))

(declare-fun m!206157 () Bool)

(assert (=> b!135215 m!206157))

(declare-fun m!206159 () Bool)

(assert (=> b!135215 m!206159))

(declare-fun m!206161 () Bool)

(assert (=> b!135215 m!206161))

(assert (=> b!135215 m!206147))

(declare-fun m!206163 () Bool)

(assert (=> b!135215 m!206163))

(declare-fun m!206165 () Bool)

(assert (=> b!135215 m!206165))

(declare-fun m!206167 () Bool)

(assert (=> b!135215 m!206167))

(declare-fun m!206169 () Bool)

(assert (=> b!135215 m!206169))

(declare-fun m!206171 () Bool)

(assert (=> b!135215 m!206171))

(declare-fun m!206173 () Bool)

(assert (=> b!135215 m!206173))

(declare-fun m!206175 () Bool)

(assert (=> b!135215 m!206175))

(declare-fun m!206177 () Bool)

(assert (=> b!135215 m!206177))

(declare-fun m!206179 () Bool)

(assert (=> b!135215 m!206179))

(declare-fun m!206181 () Bool)

(assert (=> b!135215 m!206181))

(declare-fun m!206183 () Bool)

(assert (=> b!135215 m!206183))

(declare-fun m!206185 () Bool)

(assert (=> b!135215 m!206185))

(assert (=> b!135215 m!206145))

(declare-fun m!206187 () Bool)

(assert (=> b!135215 m!206187))

(declare-fun m!206189 () Bool)

(assert (=> b!135206 m!206189))

(declare-fun m!206191 () Bool)

(assert (=> b!135206 m!206191))

(declare-fun m!206193 () Bool)

(assert (=> b!135211 m!206193))

(declare-fun m!206195 () Bool)

(assert (=> start!26370 m!206195))

(declare-fun m!206197 () Bool)

(assert (=> start!26370 m!206197))

(declare-fun m!206199 () Bool)

(assert (=> b!135210 m!206199))

(declare-fun m!206201 () Bool)

(assert (=> b!135210 m!206201))

(declare-fun m!206203 () Bool)

(assert (=> b!135205 m!206203))

(assert (=> b!135204 m!206145))

(declare-fun m!206205 () Bool)

(assert (=> b!135204 m!206205))

(declare-fun m!206207 () Bool)

(assert (=> b!135204 m!206207))

(declare-fun m!206209 () Bool)

(assert (=> b!135209 m!206209))

(declare-fun m!206211 () Bool)

(assert (=> b!135209 m!206211))

(declare-fun m!206213 () Bool)

(assert (=> b!135209 m!206213))

(assert (=> b!135209 m!206141))

(declare-fun m!206215 () Bool)

(assert (=> b!135208 m!206215))

(declare-fun m!206217 () Bool)

(assert (=> b!135207 m!206217))

(declare-fun m!206219 () Bool)

(assert (=> b!135214 m!206219))

(declare-fun m!206221 () Bool)

(assert (=> b!135202 m!206221))

(assert (=> b!135202 m!206189))

(declare-fun m!206223 () Bool)

(assert (=> b!135213 m!206223))

(declare-fun m!206225 () Bool)

(assert (=> b!135212 m!206225))

(push 1)

(assert (not b!135207))

(assert (not start!26370))

(assert (not b!135206))

(assert (not b!135204))

(assert (not b!135205))

(assert (not b!135208))

(assert (not b!135211))

(assert (not b!135209))

(assert (not b!135210))

(assert (not b!135212))

(assert (not b!135215))

(assert (not b!135213))

(assert (not b!135202))

(assert (not b!135214))

(check-sat)

