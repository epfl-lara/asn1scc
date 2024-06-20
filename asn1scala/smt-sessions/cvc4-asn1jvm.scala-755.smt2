; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21620 () Bool)

(assert start!21620)

(declare-fun b!109254 () Bool)

(declare-fun res!90146 () Bool)

(declare-fun e!71590 () Bool)

(assert (=> b!109254 (=> (not res!90146) (not e!71590))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!109254 (= res!90146 (bvslt i!615 nBits!396))))

(declare-fun b!109255 () Bool)

(declare-fun e!71589 () Bool)

(assert (=> b!109255 (= e!71590 (not e!71589))))

(declare-fun res!90147 () Bool)

(assert (=> b!109255 (=> res!90147 e!71589)))

(declare-datatypes ((array!4983 0))(
  ( (array!4984 (arr!2861 (Array (_ BitVec 32) (_ BitVec 8))) (size!2268 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4010 0))(
  ( (BitStream!4011 (buf!2659 array!4983) (currentByte!5195 (_ BitVec 32)) (currentBit!5190 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!9076 0))(
  ( (tuple2!9077 (_1!4795 BitStream!4010) (_2!4795 (_ BitVec 64))) )
))
(declare-fun lt!165089 () tuple2!9076)

(declare-datatypes ((tuple2!9078 0))(
  ( (tuple2!9079 (_1!4796 BitStream!4010) (_2!4796 BitStream!4010)) )
))
(declare-fun lt!165097 () tuple2!9078)

(assert (=> b!109255 (= res!90147 (not (= (_1!4795 lt!165089) (_2!4796 lt!165097))))))

(declare-fun lt!165090 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4010 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9076)

(assert (=> b!109255 (= lt!165089 (readNLeastSignificantBitsLoopPure!0 (_1!4796 lt!165097) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!165090))))

(declare-datatypes ((Unit!6677 0))(
  ( (Unit!6678) )
))
(declare-datatypes ((tuple2!9080 0))(
  ( (tuple2!9081 (_1!4797 Unit!6677) (_2!4797 BitStream!4010)) )
))
(declare-fun lt!165092 () tuple2!9080)

(declare-fun lt!165101 () tuple2!9080)

(declare-fun lt!165106 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!109255 (validate_offset_bits!1 ((_ sign_extend 32) (size!2268 (buf!2659 (_2!4797 lt!165092)))) ((_ sign_extend 32) (currentByte!5195 (_2!4797 lt!165101))) ((_ sign_extend 32) (currentBit!5190 (_2!4797 lt!165101))) lt!165106)))

(declare-fun lt!165080 () Unit!6677)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4010 array!4983 (_ BitVec 64)) Unit!6677)

(assert (=> b!109255 (= lt!165080 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4797 lt!165101) (buf!2659 (_2!4797 lt!165092)) lt!165106))))

(assert (=> b!109255 (= lt!165106 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!9082 0))(
  ( (tuple2!9083 (_1!4798 BitStream!4010) (_2!4798 Bool)) )
))
(declare-fun lt!165091 () tuple2!9082)

(declare-fun lt!165102 () (_ BitVec 64))

(declare-fun lt!165098 () (_ BitVec 64))

(assert (=> b!109255 (= lt!165090 (bvor lt!165102 (ite (_2!4798 lt!165091) lt!165098 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!165079 () tuple2!9078)

(declare-fun lt!165084 () tuple2!9076)

(assert (=> b!109255 (= lt!165084 (readNLeastSignificantBitsLoopPure!0 (_1!4796 lt!165079) nBits!396 i!615 lt!165102))))

(declare-fun thiss!1305 () BitStream!4010)

(declare-fun lt!165105 () (_ BitVec 64))

(assert (=> b!109255 (validate_offset_bits!1 ((_ sign_extend 32) (size!2268 (buf!2659 (_2!4797 lt!165092)))) ((_ sign_extend 32) (currentByte!5195 thiss!1305)) ((_ sign_extend 32) (currentBit!5190 thiss!1305)) lt!165105)))

(declare-fun lt!165096 () Unit!6677)

(assert (=> b!109255 (= lt!165096 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2659 (_2!4797 lt!165092)) lt!165105))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!109255 (= lt!165102 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!165104 () Bool)

(assert (=> b!109255 (= (_2!4798 lt!165091) lt!165104)))

(declare-fun readBitPure!0 (BitStream!4010) tuple2!9082)

(assert (=> b!109255 (= lt!165091 (readBitPure!0 (_1!4796 lt!165079)))))

(declare-fun reader!0 (BitStream!4010 BitStream!4010) tuple2!9078)

(assert (=> b!109255 (= lt!165097 (reader!0 (_2!4797 lt!165101) (_2!4797 lt!165092)))))

(assert (=> b!109255 (= lt!165079 (reader!0 thiss!1305 (_2!4797 lt!165092)))))

(declare-fun e!71594 () Bool)

(assert (=> b!109255 e!71594))

(declare-fun res!90143 () Bool)

(assert (=> b!109255 (=> (not res!90143) (not e!71594))))

(declare-fun lt!165085 () tuple2!9082)

(declare-fun lt!165087 () tuple2!9082)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!109255 (= res!90143 (= (bitIndex!0 (size!2268 (buf!2659 (_1!4798 lt!165085))) (currentByte!5195 (_1!4798 lt!165085)) (currentBit!5190 (_1!4798 lt!165085))) (bitIndex!0 (size!2268 (buf!2659 (_1!4798 lt!165087))) (currentByte!5195 (_1!4798 lt!165087)) (currentBit!5190 (_1!4798 lt!165087)))))))

(declare-fun lt!165099 () Unit!6677)

(declare-fun lt!165088 () BitStream!4010)

(declare-fun readBitPrefixLemma!0 (BitStream!4010 BitStream!4010) Unit!6677)

(assert (=> b!109255 (= lt!165099 (readBitPrefixLemma!0 lt!165088 (_2!4797 lt!165092)))))

(assert (=> b!109255 (= lt!165087 (readBitPure!0 (BitStream!4011 (buf!2659 (_2!4797 lt!165092)) (currentByte!5195 thiss!1305) (currentBit!5190 thiss!1305))))))

(assert (=> b!109255 (= lt!165085 (readBitPure!0 lt!165088))))

(assert (=> b!109255 (= lt!165088 (BitStream!4011 (buf!2659 (_2!4797 lt!165101)) (currentByte!5195 thiss!1305) (currentBit!5190 thiss!1305)))))

(declare-fun e!71592 () Bool)

(assert (=> b!109255 e!71592))

(declare-fun res!90148 () Bool)

(assert (=> b!109255 (=> (not res!90148) (not e!71592))))

(declare-fun isPrefixOf!0 (BitStream!4010 BitStream!4010) Bool)

(assert (=> b!109255 (= res!90148 (isPrefixOf!0 thiss!1305 (_2!4797 lt!165092)))))

(declare-fun lt!165082 () Unit!6677)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4010 BitStream!4010 BitStream!4010) Unit!6677)

(assert (=> b!109255 (= lt!165082 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4797 lt!165101) (_2!4797 lt!165092)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4010 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9080)

(assert (=> b!109255 (= lt!165092 (appendNLeastSignificantBitsLoop!0 (_2!4797 lt!165101) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!71588 () Bool)

(assert (=> b!109255 e!71588))

(declare-fun res!90139 () Bool)

(assert (=> b!109255 (=> (not res!90139) (not e!71588))))

(assert (=> b!109255 (= res!90139 (= (size!2268 (buf!2659 thiss!1305)) (size!2268 (buf!2659 (_2!4797 lt!165101)))))))

(declare-fun appendBit!0 (BitStream!4010 Bool) tuple2!9080)

(assert (=> b!109255 (= lt!165101 (appendBit!0 thiss!1305 lt!165104))))

(assert (=> b!109255 (= lt!165104 (not (= (bvand v!199 lt!165098) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109255 (= lt!165098 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!109256 () Bool)

(assert (=> b!109256 (= e!71589 true)))

(declare-fun e!71597 () Bool)

(assert (=> b!109256 e!71597))

(declare-fun res!90142 () Bool)

(assert (=> b!109256 (=> (not res!90142) (not e!71597))))

(declare-fun lt!165093 () (_ BitVec 64))

(declare-fun lt!165107 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4010 (_ BitVec 64)) BitStream!4010)

(assert (=> b!109256 (= res!90142 (= (_1!4796 lt!165097) (withMovedBitIndex!0 (_2!4796 lt!165097) (bvsub lt!165093 lt!165107))))))

(assert (=> b!109256 (= lt!165093 (bitIndex!0 (size!2268 (buf!2659 (_2!4797 lt!165101))) (currentByte!5195 (_2!4797 lt!165101)) (currentBit!5190 (_2!4797 lt!165101))))))

(declare-fun lt!165086 () (_ BitVec 64))

(assert (=> b!109256 (= (_1!4796 lt!165079) (withMovedBitIndex!0 (_2!4796 lt!165079) (bvsub lt!165086 lt!165107)))))

(assert (=> b!109256 (= lt!165107 (bitIndex!0 (size!2268 (buf!2659 (_2!4797 lt!165092))) (currentByte!5195 (_2!4797 lt!165092)) (currentBit!5190 (_2!4797 lt!165092))))))

(assert (=> b!109256 (= lt!165086 (bitIndex!0 (size!2268 (buf!2659 thiss!1305)) (currentByte!5195 thiss!1305) (currentBit!5190 thiss!1305)))))

(declare-fun lt!165083 () tuple2!9076)

(assert (=> b!109256 (and (= (_2!4795 lt!165084) (_2!4795 lt!165083)) (= (_1!4795 lt!165084) (_1!4795 lt!165083)))))

(declare-fun lt!165081 () Unit!6677)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4010 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6677)

(assert (=> b!109256 (= lt!165081 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4796 lt!165079) nBits!396 i!615 lt!165102))))

(declare-fun lt!165095 () BitStream!4010)

(assert (=> b!109256 (= lt!165083 (readNLeastSignificantBitsLoopPure!0 lt!165095 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!165090))))

(assert (=> b!109256 (= lt!165095 (withMovedBitIndex!0 (_1!4796 lt!165079) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun res!90140 () Bool)

(declare-fun e!71593 () Bool)

(assert (=> start!21620 (=> (not res!90140) (not e!71593))))

(assert (=> start!21620 (= res!90140 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21620 e!71593))

(assert (=> start!21620 true))

(declare-fun e!71596 () Bool)

(declare-fun inv!12 (BitStream!4010) Bool)

(assert (=> start!21620 (and (inv!12 thiss!1305) e!71596)))

(declare-fun b!109257 () Bool)

(declare-fun res!90136 () Bool)

(assert (=> b!109257 (=> (not res!90136) (not e!71590))))

(assert (=> b!109257 (= res!90136 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!109258 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!109258 (= e!71592 (invariant!0 (currentBit!5190 thiss!1305) (currentByte!5195 thiss!1305) (size!2268 (buf!2659 (_2!4797 lt!165092)))))))

(declare-fun b!109259 () Bool)

(declare-fun e!71587 () Bool)

(assert (=> b!109259 (= e!71588 e!71587)))

(declare-fun res!90144 () Bool)

(assert (=> b!109259 (=> (not res!90144) (not e!71587))))

(declare-fun lt!165100 () (_ BitVec 64))

(declare-fun lt!165103 () (_ BitVec 64))

(assert (=> b!109259 (= res!90144 (= lt!165100 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!165103)))))

(assert (=> b!109259 (= lt!165100 (bitIndex!0 (size!2268 (buf!2659 (_2!4797 lt!165101))) (currentByte!5195 (_2!4797 lt!165101)) (currentBit!5190 (_2!4797 lt!165101))))))

(assert (=> b!109259 (= lt!165103 (bitIndex!0 (size!2268 (buf!2659 thiss!1305)) (currentByte!5195 thiss!1305) (currentBit!5190 thiss!1305)))))

(declare-fun b!109260 () Bool)

(declare-fun e!71591 () Bool)

(assert (=> b!109260 (= e!71587 e!71591)))

(declare-fun res!90137 () Bool)

(assert (=> b!109260 (=> (not res!90137) (not e!71591))))

(declare-fun lt!165094 () tuple2!9082)

(assert (=> b!109260 (= res!90137 (and (= (_2!4798 lt!165094) lt!165104) (= (_1!4798 lt!165094) (_2!4797 lt!165101))))))

(declare-fun readerFrom!0 (BitStream!4010 (_ BitVec 32) (_ BitVec 32)) BitStream!4010)

(assert (=> b!109260 (= lt!165094 (readBitPure!0 (readerFrom!0 (_2!4797 lt!165101) (currentBit!5190 thiss!1305) (currentByte!5195 thiss!1305))))))

(declare-fun b!109261 () Bool)

(declare-fun array_inv!2070 (array!4983) Bool)

(assert (=> b!109261 (= e!71596 (array_inv!2070 (buf!2659 thiss!1305)))))

(declare-fun b!109262 () Bool)

(assert (=> b!109262 (= e!71591 (= (bitIndex!0 (size!2268 (buf!2659 (_1!4798 lt!165094))) (currentByte!5195 (_1!4798 lt!165094)) (currentBit!5190 (_1!4798 lt!165094))) lt!165100))))

(declare-fun b!109263 () Bool)

(declare-fun res!90141 () Bool)

(assert (=> b!109263 (=> (not res!90141) (not e!71587))))

(assert (=> b!109263 (= res!90141 (isPrefixOf!0 thiss!1305 (_2!4797 lt!165101)))))

(declare-fun b!109264 () Bool)

(declare-fun res!90138 () Bool)

(assert (=> b!109264 (=> (not res!90138) (not e!71592))))

(assert (=> b!109264 (= res!90138 (invariant!0 (currentBit!5190 thiss!1305) (currentByte!5195 thiss!1305) (size!2268 (buf!2659 (_2!4797 lt!165101)))))))

(declare-fun b!109265 () Bool)

(assert (=> b!109265 (= e!71594 (= (_2!4798 lt!165085) (_2!4798 lt!165087)))))

(declare-fun b!109266 () Bool)

(assert (=> b!109266 (= e!71593 e!71590)))

(declare-fun res!90145 () Bool)

(assert (=> b!109266 (=> (not res!90145) (not e!71590))))

(assert (=> b!109266 (= res!90145 (validate_offset_bits!1 ((_ sign_extend 32) (size!2268 (buf!2659 thiss!1305))) ((_ sign_extend 32) (currentByte!5195 thiss!1305)) ((_ sign_extend 32) (currentBit!5190 thiss!1305)) lt!165105))))

(assert (=> b!109266 (= lt!165105 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!109267 () Bool)

(assert (=> b!109267 (= e!71597 (and (= lt!165086 (bvsub lt!165093 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!4796 lt!165097) lt!165095)) (and (= (_2!4795 lt!165084) (_2!4795 lt!165089)) (= (_1!4795 lt!165084) (_2!4796 lt!165079))))))))

(assert (= (and start!21620 res!90140) b!109266))

(assert (= (and b!109266 res!90145) b!109257))

(assert (= (and b!109257 res!90136) b!109254))

(assert (= (and b!109254 res!90146) b!109255))

(assert (= (and b!109255 res!90139) b!109259))

(assert (= (and b!109259 res!90144) b!109263))

(assert (= (and b!109263 res!90141) b!109260))

(assert (= (and b!109260 res!90137) b!109262))

(assert (= (and b!109255 res!90148) b!109264))

(assert (= (and b!109264 res!90138) b!109258))

(assert (= (and b!109255 res!90143) b!109265))

(assert (= (and b!109255 (not res!90147)) b!109256))

(assert (= (and b!109256 res!90142) b!109267))

(assert (= start!21620 b!109261))

(declare-fun m!162135 () Bool)

(assert (=> b!109255 m!162135))

(declare-fun m!162137 () Bool)

(assert (=> b!109255 m!162137))

(declare-fun m!162139 () Bool)

(assert (=> b!109255 m!162139))

(declare-fun m!162141 () Bool)

(assert (=> b!109255 m!162141))

(declare-fun m!162143 () Bool)

(assert (=> b!109255 m!162143))

(declare-fun m!162145 () Bool)

(assert (=> b!109255 m!162145))

(declare-fun m!162147 () Bool)

(assert (=> b!109255 m!162147))

(declare-fun m!162149 () Bool)

(assert (=> b!109255 m!162149))

(declare-fun m!162151 () Bool)

(assert (=> b!109255 m!162151))

(declare-fun m!162153 () Bool)

(assert (=> b!109255 m!162153))

(declare-fun m!162155 () Bool)

(assert (=> b!109255 m!162155))

(declare-fun m!162157 () Bool)

(assert (=> b!109255 m!162157))

(declare-fun m!162159 () Bool)

(assert (=> b!109255 m!162159))

(declare-fun m!162161 () Bool)

(assert (=> b!109255 m!162161))

(declare-fun m!162163 () Bool)

(assert (=> b!109255 m!162163))

(declare-fun m!162165 () Bool)

(assert (=> b!109255 m!162165))

(declare-fun m!162167 () Bool)

(assert (=> b!109255 m!162167))

(declare-fun m!162169 () Bool)

(assert (=> b!109255 m!162169))

(declare-fun m!162171 () Bool)

(assert (=> b!109255 m!162171))

(declare-fun m!162173 () Bool)

(assert (=> b!109260 m!162173))

(assert (=> b!109260 m!162173))

(declare-fun m!162175 () Bool)

(assert (=> b!109260 m!162175))

(declare-fun m!162177 () Bool)

(assert (=> b!109263 m!162177))

(declare-fun m!162179 () Bool)

(assert (=> b!109258 m!162179))

(declare-fun m!162181 () Bool)

(assert (=> b!109256 m!162181))

(declare-fun m!162183 () Bool)

(assert (=> b!109256 m!162183))

(declare-fun m!162185 () Bool)

(assert (=> b!109256 m!162185))

(declare-fun m!162187 () Bool)

(assert (=> b!109256 m!162187))

(declare-fun m!162189 () Bool)

(assert (=> b!109256 m!162189))

(declare-fun m!162191 () Bool)

(assert (=> b!109256 m!162191))

(declare-fun m!162193 () Bool)

(assert (=> b!109256 m!162193))

(declare-fun m!162195 () Bool)

(assert (=> b!109256 m!162195))

(declare-fun m!162197 () Bool)

(assert (=> b!109257 m!162197))

(assert (=> b!109259 m!162195))

(assert (=> b!109259 m!162183))

(declare-fun m!162199 () Bool)

(assert (=> b!109266 m!162199))

(declare-fun m!162201 () Bool)

(assert (=> b!109262 m!162201))

(declare-fun m!162203 () Bool)

(assert (=> start!21620 m!162203))

(declare-fun m!162205 () Bool)

(assert (=> b!109264 m!162205))

(declare-fun m!162207 () Bool)

(assert (=> b!109261 m!162207))

(push 1)

