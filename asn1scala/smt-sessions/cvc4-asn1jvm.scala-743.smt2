; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21010 () Bool)

(assert start!21010)

(declare-fun b!106108 () Bool)

(declare-fun e!69482 () Bool)

(declare-datatypes ((array!4897 0))(
  ( (array!4898 (arr!2825 (Array (_ BitVec 32) (_ BitVec 8))) (size!2232 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3938 0))(
  ( (BitStream!3939 (buf!2608 array!4897) (currentByte!5114 (_ BitVec 32)) (currentBit!5109 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8734 0))(
  ( (tuple2!8735 (_1!4624 BitStream!3938) (_2!4624 Bool)) )
))
(declare-fun lt!157225 () tuple2!8734)

(declare-fun lt!157221 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!106108 (= e!69482 (= (bitIndex!0 (size!2232 (buf!2608 (_1!4624 lt!157225))) (currentByte!5114 (_1!4624 lt!157225)) (currentBit!5109 (_1!4624 lt!157225))) lt!157221))))

(declare-fun b!106109 () Bool)

(declare-fun res!87405 () Bool)

(declare-fun e!69488 () Bool)

(assert (=> b!106109 (=> (not res!87405) (not e!69488))))

(declare-fun thiss!1305 () BitStream!3938)

(declare-datatypes ((Unit!6502 0))(
  ( (Unit!6503) )
))
(declare-datatypes ((tuple2!8736 0))(
  ( (tuple2!8737 (_1!4625 Unit!6502) (_2!4625 BitStream!3938)) )
))
(declare-fun lt!157224 () tuple2!8736)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!106109 (= res!87405 (invariant!0 (currentBit!5109 thiss!1305) (currentByte!5114 thiss!1305) (size!2232 (buf!2608 (_2!4625 lt!157224)))))))

(declare-fun b!106110 () Bool)

(declare-fun e!69486 () Bool)

(declare-fun e!69483 () Bool)

(assert (=> b!106110 (= e!69486 (not e!69483))))

(declare-fun res!87396 () Bool)

(assert (=> b!106110 (=> res!87396 e!69483)))

(declare-datatypes ((tuple2!8738 0))(
  ( (tuple2!8739 (_1!4626 BitStream!3938) (_2!4626 BitStream!3938)) )
))
(declare-fun lt!157215 () tuple2!8738)

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun lt!157216 () (_ BitVec 64))

(declare-datatypes ((tuple2!8740 0))(
  ( (tuple2!8741 (_1!4627 BitStream!3938) (_2!4627 (_ BitVec 64))) )
))
(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3938 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8740)

(assert (=> b!106110 (= res!87396 (not (= (_1!4627 (readNLeastSignificantBitsLoopPure!0 (_1!4626 lt!157215) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!157216)) (_2!4626 lt!157215))))))

(declare-fun lt!157204 () tuple2!8736)

(declare-fun lt!157214 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!106110 (validate_offset_bits!1 ((_ sign_extend 32) (size!2232 (buf!2608 (_2!4625 lt!157204)))) ((_ sign_extend 32) (currentByte!5114 (_2!4625 lt!157224))) ((_ sign_extend 32) (currentBit!5109 (_2!4625 lt!157224))) lt!157214)))

(declare-fun lt!157212 () Unit!6502)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3938 array!4897 (_ BitVec 64)) Unit!6502)

(assert (=> b!106110 (= lt!157212 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4625 lt!157224) (buf!2608 (_2!4625 lt!157204)) lt!157214))))

(assert (=> b!106110 (= lt!157214 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!157208 () (_ BitVec 64))

(declare-fun lt!157213 () (_ BitVec 64))

(declare-fun lt!157211 () tuple2!8734)

(assert (=> b!106110 (= lt!157216 (bvor lt!157208 (ite (_2!4624 lt!157211) lt!157213 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!157220 () tuple2!8740)

(declare-fun lt!157217 () tuple2!8738)

(assert (=> b!106110 (= lt!157220 (readNLeastSignificantBitsLoopPure!0 (_1!4626 lt!157217) nBits!396 i!615 lt!157208))))

(declare-fun lt!157203 () (_ BitVec 64))

(assert (=> b!106110 (validate_offset_bits!1 ((_ sign_extend 32) (size!2232 (buf!2608 (_2!4625 lt!157204)))) ((_ sign_extend 32) (currentByte!5114 thiss!1305)) ((_ sign_extend 32) (currentBit!5109 thiss!1305)) lt!157203)))

(declare-fun lt!157210 () Unit!6502)

(assert (=> b!106110 (= lt!157210 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2608 (_2!4625 lt!157204)) lt!157203))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!106110 (= lt!157208 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!157219 () Bool)

(assert (=> b!106110 (= (_2!4624 lt!157211) lt!157219)))

(declare-fun readBitPure!0 (BitStream!3938) tuple2!8734)

(assert (=> b!106110 (= lt!157211 (readBitPure!0 (_1!4626 lt!157217)))))

(declare-fun reader!0 (BitStream!3938 BitStream!3938) tuple2!8738)

(assert (=> b!106110 (= lt!157215 (reader!0 (_2!4625 lt!157224) (_2!4625 lt!157204)))))

(assert (=> b!106110 (= lt!157217 (reader!0 thiss!1305 (_2!4625 lt!157204)))))

(declare-fun e!69489 () Bool)

(assert (=> b!106110 e!69489))

(declare-fun res!87398 () Bool)

(assert (=> b!106110 (=> (not res!87398) (not e!69489))))

(declare-fun lt!157202 () tuple2!8734)

(declare-fun lt!157201 () tuple2!8734)

(assert (=> b!106110 (= res!87398 (= (bitIndex!0 (size!2232 (buf!2608 (_1!4624 lt!157202))) (currentByte!5114 (_1!4624 lt!157202)) (currentBit!5109 (_1!4624 lt!157202))) (bitIndex!0 (size!2232 (buf!2608 (_1!4624 lt!157201))) (currentByte!5114 (_1!4624 lt!157201)) (currentBit!5109 (_1!4624 lt!157201)))))))

(declare-fun lt!157205 () Unit!6502)

(declare-fun lt!157218 () BitStream!3938)

(declare-fun readBitPrefixLemma!0 (BitStream!3938 BitStream!3938) Unit!6502)

(assert (=> b!106110 (= lt!157205 (readBitPrefixLemma!0 lt!157218 (_2!4625 lt!157204)))))

(assert (=> b!106110 (= lt!157201 (readBitPure!0 (BitStream!3939 (buf!2608 (_2!4625 lt!157204)) (currentByte!5114 thiss!1305) (currentBit!5109 thiss!1305))))))

(assert (=> b!106110 (= lt!157202 (readBitPure!0 lt!157218))))

(assert (=> b!106110 (= lt!157218 (BitStream!3939 (buf!2608 (_2!4625 lt!157224)) (currentByte!5114 thiss!1305) (currentBit!5109 thiss!1305)))))

(assert (=> b!106110 e!69488))

(declare-fun res!87404 () Bool)

(assert (=> b!106110 (=> (not res!87404) (not e!69488))))

(declare-fun isPrefixOf!0 (BitStream!3938 BitStream!3938) Bool)

(assert (=> b!106110 (= res!87404 (isPrefixOf!0 thiss!1305 (_2!4625 lt!157204)))))

(declare-fun lt!157223 () Unit!6502)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3938 BitStream!3938 BitStream!3938) Unit!6502)

(assert (=> b!106110 (= lt!157223 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4625 lt!157224) (_2!4625 lt!157204)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3938 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8736)

(assert (=> b!106110 (= lt!157204 (appendNLeastSignificantBitsLoop!0 (_2!4625 lt!157224) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!69487 () Bool)

(assert (=> b!106110 e!69487))

(declare-fun res!87408 () Bool)

(assert (=> b!106110 (=> (not res!87408) (not e!69487))))

(assert (=> b!106110 (= res!87408 (= (size!2232 (buf!2608 thiss!1305)) (size!2232 (buf!2608 (_2!4625 lt!157224)))))))

(declare-fun appendBit!0 (BitStream!3938 Bool) tuple2!8736)

(assert (=> b!106110 (= lt!157224 (appendBit!0 thiss!1305 lt!157219))))

(assert (=> b!106110 (= lt!157219 (not (= (bvand v!199 lt!157213) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106110 (= lt!157213 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun res!87400 () Bool)

(declare-fun e!69480 () Bool)

(assert (=> start!21010 (=> (not res!87400) (not e!69480))))

(assert (=> start!21010 (= res!87400 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21010 e!69480))

(assert (=> start!21010 true))

(declare-fun e!69485 () Bool)

(declare-fun inv!12 (BitStream!3938) Bool)

(assert (=> start!21010 (and (inv!12 thiss!1305) e!69485)))

(declare-fun b!106111 () Bool)

(assert (=> b!106111 (= e!69483 (invariant!0 (currentBit!5109 (_2!4625 lt!157204)) (currentByte!5114 (_2!4625 lt!157204)) (size!2232 (buf!2608 (_2!4625 lt!157204)))))))

(declare-fun lt!157206 () (_ BitVec 64))

(assert (=> b!106111 (= lt!157206 (bitIndex!0 (size!2232 (buf!2608 (_2!4625 lt!157224))) (currentByte!5114 (_2!4625 lt!157224)) (currentBit!5109 (_2!4625 lt!157224))))))

(declare-fun e!69479 () Bool)

(assert (=> b!106111 e!69479))

(declare-fun res!87402 () Bool)

(assert (=> b!106111 (=> (not res!87402) (not e!69479))))

(declare-fun lt!157207 () tuple2!8740)

(assert (=> b!106111 (= res!87402 (and (= (_2!4627 lt!157220) (_2!4627 lt!157207)) (= (_1!4627 lt!157220) (_1!4627 lt!157207))))))

(declare-fun lt!157222 () Unit!6502)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3938 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6502)

(assert (=> b!106111 (= lt!157222 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4626 lt!157217) nBits!396 i!615 lt!157208))))

(declare-fun withMovedBitIndex!0 (BitStream!3938 (_ BitVec 64)) BitStream!3938)

(assert (=> b!106111 (= lt!157207 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4626 lt!157217) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!157216))))

(declare-fun b!106112 () Bool)

(assert (=> b!106112 (= e!69480 e!69486)))

(declare-fun res!87399 () Bool)

(assert (=> b!106112 (=> (not res!87399) (not e!69486))))

(assert (=> b!106112 (= res!87399 (validate_offset_bits!1 ((_ sign_extend 32) (size!2232 (buf!2608 thiss!1305))) ((_ sign_extend 32) (currentByte!5114 thiss!1305)) ((_ sign_extend 32) (currentBit!5109 thiss!1305)) lt!157203))))

(assert (=> b!106112 (= lt!157203 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!106113 () Bool)

(declare-fun res!87401 () Bool)

(assert (=> b!106113 (=> (not res!87401) (not e!69486))))

(assert (=> b!106113 (= res!87401 (bvslt i!615 nBits!396))))

(declare-fun b!106114 () Bool)

(declare-fun e!69481 () Bool)

(assert (=> b!106114 (= e!69487 e!69481)))

(declare-fun res!87403 () Bool)

(assert (=> b!106114 (=> (not res!87403) (not e!69481))))

(declare-fun lt!157209 () (_ BitVec 64))

(assert (=> b!106114 (= res!87403 (= lt!157221 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!157209)))))

(assert (=> b!106114 (= lt!157221 (bitIndex!0 (size!2232 (buf!2608 (_2!4625 lt!157224))) (currentByte!5114 (_2!4625 lt!157224)) (currentBit!5109 (_2!4625 lt!157224))))))

(assert (=> b!106114 (= lt!157209 (bitIndex!0 (size!2232 (buf!2608 thiss!1305)) (currentByte!5114 thiss!1305) (currentBit!5109 thiss!1305)))))

(declare-fun b!106115 () Bool)

(assert (=> b!106115 (= e!69488 (invariant!0 (currentBit!5109 thiss!1305) (currentByte!5114 thiss!1305) (size!2232 (buf!2608 (_2!4625 lt!157204)))))))

(declare-fun b!106116 () Bool)

(declare-fun array_inv!2034 (array!4897) Bool)

(assert (=> b!106116 (= e!69485 (array_inv!2034 (buf!2608 thiss!1305)))))

(declare-fun b!106117 () Bool)

(assert (=> b!106117 (= e!69489 (= (_2!4624 lt!157202) (_2!4624 lt!157201)))))

(declare-fun b!106118 () Bool)

(assert (=> b!106118 (= e!69479 (= (_1!4626 lt!157217) (withMovedBitIndex!0 (_2!4626 lt!157217) (bvsub (bitIndex!0 (size!2232 (buf!2608 thiss!1305)) (currentByte!5114 thiss!1305) (currentBit!5109 thiss!1305)) (bitIndex!0 (size!2232 (buf!2608 (_2!4625 lt!157204))) (currentByte!5114 (_2!4625 lt!157204)) (currentBit!5109 (_2!4625 lt!157204)))))))))

(declare-fun b!106119 () Bool)

(declare-fun res!87407 () Bool)

(assert (=> b!106119 (=> (not res!87407) (not e!69486))))

(assert (=> b!106119 (= res!87407 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!106120 () Bool)

(assert (=> b!106120 (= e!69481 e!69482)))

(declare-fun res!87397 () Bool)

(assert (=> b!106120 (=> (not res!87397) (not e!69482))))

(assert (=> b!106120 (= res!87397 (and (= (_2!4624 lt!157225) lt!157219) (= (_1!4624 lt!157225) (_2!4625 lt!157224))))))

(declare-fun readerFrom!0 (BitStream!3938 (_ BitVec 32) (_ BitVec 32)) BitStream!3938)

(assert (=> b!106120 (= lt!157225 (readBitPure!0 (readerFrom!0 (_2!4625 lt!157224) (currentBit!5109 thiss!1305) (currentByte!5114 thiss!1305))))))

(declare-fun b!106121 () Bool)

(declare-fun res!87406 () Bool)

(assert (=> b!106121 (=> (not res!87406) (not e!69481))))

(assert (=> b!106121 (= res!87406 (isPrefixOf!0 thiss!1305 (_2!4625 lt!157224)))))

(assert (= (and start!21010 res!87400) b!106112))

(assert (= (and b!106112 res!87399) b!106119))

(assert (= (and b!106119 res!87407) b!106113))

(assert (= (and b!106113 res!87401) b!106110))

(assert (= (and b!106110 res!87408) b!106114))

(assert (= (and b!106114 res!87403) b!106121))

(assert (= (and b!106121 res!87406) b!106120))

(assert (= (and b!106120 res!87397) b!106108))

(assert (= (and b!106110 res!87404) b!106109))

(assert (= (and b!106109 res!87405) b!106115))

(assert (= (and b!106110 res!87398) b!106117))

(assert (= (and b!106110 (not res!87396)) b!106111))

(assert (= (and b!106111 res!87402) b!106118))

(assert (= start!21010 b!106116))

(declare-fun m!156143 () Bool)

(assert (=> b!106120 m!156143))

(assert (=> b!106120 m!156143))

(declare-fun m!156145 () Bool)

(assert (=> b!106120 m!156145))

(declare-fun m!156147 () Bool)

(assert (=> b!106118 m!156147))

(declare-fun m!156149 () Bool)

(assert (=> b!106118 m!156149))

(declare-fun m!156151 () Bool)

(assert (=> b!106118 m!156151))

(declare-fun m!156153 () Bool)

(assert (=> b!106109 m!156153))

(declare-fun m!156155 () Bool)

(assert (=> b!106110 m!156155))

(declare-fun m!156157 () Bool)

(assert (=> b!106110 m!156157))

(declare-fun m!156159 () Bool)

(assert (=> b!106110 m!156159))

(declare-fun m!156161 () Bool)

(assert (=> b!106110 m!156161))

(declare-fun m!156163 () Bool)

(assert (=> b!106110 m!156163))

(declare-fun m!156165 () Bool)

(assert (=> b!106110 m!156165))

(declare-fun m!156167 () Bool)

(assert (=> b!106110 m!156167))

(declare-fun m!156169 () Bool)

(assert (=> b!106110 m!156169))

(declare-fun m!156171 () Bool)

(assert (=> b!106110 m!156171))

(declare-fun m!156173 () Bool)

(assert (=> b!106110 m!156173))

(declare-fun m!156175 () Bool)

(assert (=> b!106110 m!156175))

(declare-fun m!156177 () Bool)

(assert (=> b!106110 m!156177))

(declare-fun m!156179 () Bool)

(assert (=> b!106110 m!156179))

(declare-fun m!156181 () Bool)

(assert (=> b!106110 m!156181))

(declare-fun m!156183 () Bool)

(assert (=> b!106110 m!156183))

(declare-fun m!156185 () Bool)

(assert (=> b!106110 m!156185))

(declare-fun m!156187 () Bool)

(assert (=> b!106110 m!156187))

(declare-fun m!156189 () Bool)

(assert (=> b!106110 m!156189))

(declare-fun m!156191 () Bool)

(assert (=> b!106110 m!156191))

(declare-fun m!156193 () Bool)

(assert (=> b!106108 m!156193))

(declare-fun m!156195 () Bool)

(assert (=> b!106116 m!156195))

(declare-fun m!156197 () Bool)

(assert (=> b!106115 m!156197))

(declare-fun m!156199 () Bool)

(assert (=> start!21010 m!156199))

(declare-fun m!156201 () Bool)

(assert (=> b!106119 m!156201))

(declare-fun m!156203 () Bool)

(assert (=> b!106114 m!156203))

(assert (=> b!106114 m!156147))

(declare-fun m!156205 () Bool)

(assert (=> b!106112 m!156205))

(declare-fun m!156207 () Bool)

(assert (=> b!106111 m!156207))

(assert (=> b!106111 m!156207))

(declare-fun m!156209 () Bool)

(assert (=> b!106111 m!156209))

(declare-fun m!156211 () Bool)

(assert (=> b!106111 m!156211))

(declare-fun m!156213 () Bool)

(assert (=> b!106111 m!156213))

(assert (=> b!106111 m!156203))

(declare-fun m!156215 () Bool)

(assert (=> b!106121 m!156215))

(push 1)

(assert (not b!106108))

(assert (not b!106118))

(assert (not b!106119))

(assert (not start!21010))

(assert (not b!106115))

(assert (not b!106116))

(assert (not b!106109))

(assert (not b!106120))

(assert (not b!106110))

(assert (not b!106121))

(assert (not b!106114))

(assert (not b!106112))

(assert (not b!106111))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!33334 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!33334 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2232 (buf!2608 thiss!1305))) ((_ sign_extend 32) (currentByte!5114 thiss!1305)) ((_ sign_extend 32) (currentBit!5109 thiss!1305)) lt!157203) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2232 (buf!2608 thiss!1305))) ((_ sign_extend 32) (currentByte!5114 thiss!1305)) ((_ sign_extend 32) (currentBit!5109 thiss!1305))) lt!157203))))

(declare-fun bs!8140 () Bool)

(assert (= bs!8140 d!33334))

(declare-fun m!156227 () Bool)

(assert (=> bs!8140 m!156227))

(assert (=> b!106112 d!33334))

(declare-fun d!33336 () Bool)

(declare-fun lt!157284 () tuple2!8740)

(declare-fun lt!157281 () tuple2!8740)

(assert (=> d!33336 (and (= (_2!4627 lt!157284) (_2!4627 lt!157281)) (= (_1!4627 lt!157284) (_1!4627 lt!157281)))))

(declare-fun lt!157280 () (_ BitVec 64))

(declare-fun lt!157285 () Unit!6502)

(declare-fun lt!157282 () Bool)

(declare-fun lt!157283 () BitStream!3938)

(declare-fun choose!45 (BitStream!3938 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!8740 tuple2!8740 BitStream!3938 (_ BitVec 64) Bool BitStream!3938 (_ BitVec 64) tuple2!8740 tuple2!8740 BitStream!3938 (_ BitVec 64)) Unit!6502)

(assert (=> d!33336 (= lt!157285 (choose!45 (_1!4626 lt!157217) nBits!396 i!615 lt!157208 lt!157284 (tuple2!8741 (_1!4627 lt!157284) (_2!4627 lt!157284)) (_1!4627 lt!157284) (_2!4627 lt!157284) lt!157282 lt!157283 lt!157280 lt!157281 (tuple2!8741 (_1!4627 lt!157281) (_2!4627 lt!157281)) (_1!4627 lt!157281) (_2!4627 lt!157281)))))

(assert (=> d!33336 (= lt!157281 (readNLeastSignificantBitsLoopPure!0 lt!157283 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!157280))))

(assert (=> d!33336 (= lt!157280 (bvor lt!157208 (ite lt!157282 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33336 (= lt!157283 (withMovedBitIndex!0 (_1!4626 lt!157217) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!33336 (= lt!157282 (_2!4624 (readBitPure!0 (_1!4626 lt!157217))))))

(assert (=> d!33336 (= lt!157284 (readNLeastSignificantBitsLoopPure!0 (_1!4626 lt!157217) nBits!396 i!615 lt!157208))))

(assert (=> d!33336 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4626 lt!157217) nBits!396 i!615 lt!157208) lt!157285)))

(declare-fun bs!8145 () Bool)

(assert (= bs!8145 d!33336))

(declare-fun m!156247 () Bool)

(assert (=> bs!8145 m!156247))

(assert (=> bs!8145 m!156207))

(assert (=> bs!8145 m!156187))

(assert (=> bs!8145 m!156181))

(declare-fun m!156249 () Bool)

(assert (=> bs!8145 m!156249))

(assert (=> b!106111 d!33336))

(declare-fun d!33354 () Bool)

(assert (=> d!33354 (= (invariant!0 (currentBit!5109 (_2!4625 lt!157204)) (currentByte!5114 (_2!4625 lt!157204)) (size!2232 (buf!2608 (_2!4625 lt!157204)))) (and (bvsge (currentBit!5109 (_2!4625 lt!157204)) #b00000000000000000000000000000000) (bvslt (currentBit!5109 (_2!4625 lt!157204)) #b00000000000000000000000000001000) (bvsge (currentByte!5114 (_2!4625 lt!157204)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5114 (_2!4625 lt!157204)) (size!2232 (buf!2608 (_2!4625 lt!157204)))) (and (= (currentBit!5109 (_2!4625 lt!157204)) #b00000000000000000000000000000000) (= (currentByte!5114 (_2!4625 lt!157204)) (size!2232 (buf!2608 (_2!4625 lt!157204))))))))))

(assert (=> b!106111 d!33354))

(declare-fun d!33356 () Bool)

(declare-fun e!69512 () Bool)

(assert (=> d!33356 e!69512))

(declare-fun res!87442 () Bool)

(assert (=> d!33356 (=> (not res!87442) (not e!69512))))

(declare-fun lt!157316 () (_ BitVec 64))

(declare-fun lt!157313 () (_ BitVec 64))

(declare-fun lt!157314 () (_ BitVec 64))

(assert (=> d!33356 (= res!87442 (= lt!157313 (bvsub lt!157314 lt!157316)))))

(assert (=> d!33356 (or (= (bvand lt!157314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!157316 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!157314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!157314 lt!157316) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33356 (= lt!157316 (remainingBits!0 ((_ sign_extend 32) (size!2232 (buf!2608 (_2!4625 lt!157224)))) ((_ sign_extend 32) (currentByte!5114 (_2!4625 lt!157224))) ((_ sign_extend 32) (currentBit!5109 (_2!4625 lt!157224)))))))

(declare-fun lt!157312 () (_ BitVec 64))

(declare-fun lt!157315 () (_ BitVec 64))

(assert (=> d!33356 (= lt!157314 (bvmul lt!157312 lt!157315))))

(assert (=> d!33356 (or (= lt!157312 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!157315 (bvsdiv (bvmul lt!157312 lt!157315) lt!157312)))))

(assert (=> d!33356 (= lt!157315 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33356 (= lt!157312 ((_ sign_extend 32) (size!2232 (buf!2608 (_2!4625 lt!157224)))))))

(assert (=> d!33356 (= lt!157313 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5114 (_2!4625 lt!157224))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5109 (_2!4625 lt!157224)))))))

(assert (=> d!33356 (invariant!0 (currentBit!5109 (_2!4625 lt!157224)) (currentByte!5114 (_2!4625 lt!157224)) (size!2232 (buf!2608 (_2!4625 lt!157224))))))

(assert (=> d!33356 (= (bitIndex!0 (size!2232 (buf!2608 (_2!4625 lt!157224))) (currentByte!5114 (_2!4625 lt!157224)) (currentBit!5109 (_2!4625 lt!157224))) lt!157313)))

(declare-fun b!106154 () Bool)

(declare-fun res!87443 () Bool)

(assert (=> b!106154 (=> (not res!87443) (not e!69512))))

(assert (=> b!106154 (= res!87443 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!157313))))

(declare-fun b!106155 () Bool)

(declare-fun lt!157311 () (_ BitVec 64))

(assert (=> b!106155 (= e!69512 (bvsle lt!157313 (bvmul lt!157311 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!106155 (or (= lt!157311 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!157311 #b0000000000000000000000000000000000000000000000000000000000001000) lt!157311)))))

(assert (=> b!106155 (= lt!157311 ((_ sign_extend 32) (size!2232 (buf!2608 (_2!4625 lt!157224)))))))

(assert (= (and d!33356 res!87442) b!106154))

(assert (= (and b!106154 res!87443) b!106155))

(declare-fun m!156261 () Bool)

(assert (=> d!33356 m!156261))

(declare-fun m!156263 () Bool)

(assert (=> d!33356 m!156263))

(assert (=> b!106111 d!33356))

(declare-datatypes ((tuple2!8744 0))(
  ( (tuple2!8745 (_1!4629 (_ BitVec 64)) (_2!4629 BitStream!3938)) )
))
(declare-fun lt!157319 () tuple2!8744)

(declare-fun d!33360 () Bool)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!3938 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8744)

(assert (=> d!33360 (= lt!157319 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!4626 lt!157217) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!157216))))

(assert (=> d!33360 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4626 lt!157217) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!157216) (tuple2!8741 (_2!4629 lt!157319) (_1!4629 lt!157319)))))

(declare-fun bs!8146 () Bool)

(assert (= bs!8146 d!33360))

(assert (=> bs!8146 m!156207))

(declare-fun m!156265 () Bool)

(assert (=> bs!8146 m!156265))

(assert (=> b!106111 d!33360))

(declare-fun d!33362 () Bool)

(declare-fun e!69515 () Bool)

(assert (=> d!33362 e!69515))

(declare-fun res!87446 () Bool)

(assert (=> d!33362 (=> (not res!87446) (not e!69515))))

(declare-fun lt!157325 () (_ BitVec 64))

(declare-fun lt!157324 () BitStream!3938)

(assert (=> d!33362 (= res!87446 (= (bvadd lt!157325 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2232 (buf!2608 lt!157324)) (currentByte!5114 lt!157324) (currentBit!5109 lt!157324))))))

(assert (=> d!33362 (or (not (= (bvand lt!157325 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!157325 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!157325 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33362 (= lt!157325 (bitIndex!0 (size!2232 (buf!2608 (_1!4626 lt!157217))) (currentByte!5114 (_1!4626 lt!157217)) (currentBit!5109 (_1!4626 lt!157217))))))

(declare-fun moveBitIndex!0 (BitStream!3938 (_ BitVec 64)) tuple2!8736)

(assert (=> d!33362 (= lt!157324 (_2!4625 (moveBitIndex!0 (_1!4626 lt!157217) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!3938 (_ BitVec 64)) Bool)

(assert (=> d!33362 (moveBitIndexPrecond!0 (_1!4626 lt!157217) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!33362 (= (withMovedBitIndex!0 (_1!4626 lt!157217) #b0000000000000000000000000000000000000000000000000000000000000001) lt!157324)))

(declare-fun b!106158 () Bool)

(assert (=> b!106158 (= e!69515 (= (size!2232 (buf!2608 (_1!4626 lt!157217))) (size!2232 (buf!2608 lt!157324))))))

(assert (= (and d!33362 res!87446) b!106158))

(declare-fun m!156267 () Bool)

(assert (=> d!33362 m!156267))

(declare-fun m!156269 () Bool)

(assert (=> d!33362 m!156269))

(declare-fun m!156271 () Bool)

(assert (=> d!33362 m!156271))

(declare-fun m!156273 () Bool)

(assert (=> d!33362 m!156273))

(assert (=> b!106111 d!33362))

(declare-fun d!33364 () Bool)

(declare-fun res!87455 () Bool)

(declare-fun e!69521 () Bool)

(assert (=> d!33364 (=> (not res!87455) (not e!69521))))

(assert (=> d!33364 (= res!87455 (= (size!2232 (buf!2608 thiss!1305)) (size!2232 (buf!2608 (_2!4625 lt!157224)))))))

(assert (=> d!33364 (= (isPrefixOf!0 thiss!1305 (_2!4625 lt!157224)) e!69521)))

(declare-fun b!106165 () Bool)

(declare-fun res!87454 () Bool)

(assert (=> b!106165 (=> (not res!87454) (not e!69521))))

(assert (=> b!106165 (= res!87454 (bvsle (bitIndex!0 (size!2232 (buf!2608 thiss!1305)) (currentByte!5114 thiss!1305) (currentBit!5109 thiss!1305)) (bitIndex!0 (size!2232 (buf!2608 (_2!4625 lt!157224))) (currentByte!5114 (_2!4625 lt!157224)) (currentBit!5109 (_2!4625 lt!157224)))))))

(declare-fun b!106166 () Bool)

(declare-fun e!69520 () Bool)

(assert (=> b!106166 (= e!69521 e!69520)))

(declare-fun res!87453 () Bool)

(assert (=> b!106166 (=> res!87453 e!69520)))

(assert (=> b!106166 (= res!87453 (= (size!2232 (buf!2608 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!106167 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4897 array!4897 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!106167 (= e!69520 (arrayBitRangesEq!0 (buf!2608 thiss!1305) (buf!2608 (_2!4625 lt!157224)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2232 (buf!2608 thiss!1305)) (currentByte!5114 thiss!1305) (currentBit!5109 thiss!1305))))))

(assert (= (and d!33364 res!87455) b!106165))

(assert (= (and b!106165 res!87454) b!106166))

(assert (= (and b!106166 (not res!87453)) b!106167))

(assert (=> b!106165 m!156147))

(assert (=> b!106165 m!156203))

(assert (=> b!106167 m!156147))

(assert (=> b!106167 m!156147))

(declare-fun m!156275 () Bool)

(assert (=> b!106167 m!156275))

(assert (=> b!106121 d!33364))

(declare-fun d!33366 () Bool)

(assert (=> d!33366 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!106110 d!33366))

(declare-fun d!33368 () Bool)

(assert (=> d!33368 (validate_offset_bits!1 ((_ sign_extend 32) (size!2232 (buf!2608 (_2!4625 lt!157204)))) ((_ sign_extend 32) (currentByte!5114 (_2!4625 lt!157224))) ((_ sign_extend 32) (currentBit!5109 (_2!4625 lt!157224))) lt!157214)))

(declare-fun lt!157328 () Unit!6502)

(declare-fun choose!9 (BitStream!3938 array!4897 (_ BitVec 64) BitStream!3938) Unit!6502)

(assert (=> d!33368 (= lt!157328 (choose!9 (_2!4625 lt!157224) (buf!2608 (_2!4625 lt!157204)) lt!157214 (BitStream!3939 (buf!2608 (_2!4625 lt!157204)) (currentByte!5114 (_2!4625 lt!157224)) (currentBit!5109 (_2!4625 lt!157224)))))))

(assert (=> d!33368 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4625 lt!157224) (buf!2608 (_2!4625 lt!157204)) lt!157214) lt!157328)))

(declare-fun bs!8147 () Bool)

(assert (= bs!8147 d!33368))

(assert (=> bs!8147 m!156169))

(declare-fun m!156277 () Bool)

(assert (=> bs!8147 m!156277))

(assert (=> b!106110 d!33368))

(declare-fun d!33370 () Bool)

(declare-datatypes ((tuple2!8748 0))(
  ( (tuple2!8749 (_1!4631 Bool) (_2!4631 BitStream!3938)) )
))
(declare-fun lt!157331 () tuple2!8748)

(declare-fun readBit!0 (BitStream!3938) tuple2!8748)

(assert (=> d!33370 (= lt!157331 (readBit!0 (_1!4626 lt!157217)))))

(assert (=> d!33370 (= (readBitPure!0 (_1!4626 lt!157217)) (tuple2!8735 (_2!4631 lt!157331) (_1!4631 lt!157331)))))

(declare-fun bs!8148 () Bool)

(assert (= bs!8148 d!33370))

(declare-fun m!156279 () Bool)

(assert (=> bs!8148 m!156279))

(assert (=> b!106110 d!33370))

(declare-fun b!106232 () Bool)

(declare-fun e!69556 () Bool)

(declare-fun lt!157552 () tuple2!8734)

(declare-fun lt!157553 () tuple2!8736)

(assert (=> b!106232 (= e!69556 (= (bitIndex!0 (size!2232 (buf!2608 (_1!4624 lt!157552))) (currentByte!5114 (_1!4624 lt!157552)) (currentBit!5109 (_1!4624 lt!157552))) (bitIndex!0 (size!2232 (buf!2608 (_2!4625 lt!157553))) (currentByte!5114 (_2!4625 lt!157553)) (currentBit!5109 (_2!4625 lt!157553)))))))

(declare-fun b!106233 () Bool)

(declare-fun e!69557 () (_ BitVec 64))

(assert (=> b!106233 (= e!69557 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun c!6554 () Bool)

(declare-fun lt!157589 () tuple2!8736)

(declare-fun call!1335 () Bool)

(declare-fun bm!1332 () Bool)

(declare-fun lt!157558 () BitStream!3938)

(assert (=> bm!1332 (= call!1335 (isPrefixOf!0 (ite c!6554 (_2!4625 lt!157224) lt!157558) (ite c!6554 (_2!4625 lt!157589) lt!157558)))))

(declare-fun b!106235 () Bool)

(declare-fun res!87507 () Bool)

(assert (=> b!106235 (= res!87507 (= (bitIndex!0 (size!2232 (buf!2608 (_2!4625 lt!157553))) (currentByte!5114 (_2!4625 lt!157553)) (currentBit!5109 (_2!4625 lt!157553))) (bvadd (bitIndex!0 (size!2232 (buf!2608 (_2!4625 lt!157224))) (currentByte!5114 (_2!4625 lt!157224)) (currentBit!5109 (_2!4625 lt!157224))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!69558 () Bool)

(assert (=> b!106235 (=> (not res!87507) (not e!69558))))

(declare-fun b!106236 () Bool)

(declare-fun e!69560 () tuple2!8736)

(declare-fun lt!157555 () Unit!6502)

(assert (=> b!106236 (= e!69560 (tuple2!8737 lt!157555 (_2!4625 lt!157224)))))

(assert (=> b!106236 (= lt!157558 (_2!4625 lt!157224))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3938) Unit!6502)

(assert (=> b!106236 (= lt!157555 (lemmaIsPrefixRefl!0 lt!157558))))

(assert (=> b!106236 call!1335))

(declare-fun b!106237 () Bool)

(declare-fun Unit!6505 () Unit!6502)

(assert (=> b!106237 (= e!69560 (tuple2!8737 Unit!6505 (_2!4625 lt!157589)))))

(declare-fun lt!157585 () Bool)

(assert (=> b!106237 (= lt!157585 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106237 (= lt!157553 (appendBit!0 (_2!4625 lt!157224) lt!157585))))

(declare-fun res!87510 () Bool)

(assert (=> b!106237 (= res!87510 (= (size!2232 (buf!2608 (_2!4625 lt!157224))) (size!2232 (buf!2608 (_2!4625 lt!157553)))))))

(assert (=> b!106237 (=> (not res!87510) (not e!69558))))

(assert (=> b!106237 e!69558))

(declare-fun lt!157551 () tuple2!8736)

(assert (=> b!106237 (= lt!157551 lt!157553)))

(assert (=> b!106237 (= lt!157589 (appendNLeastSignificantBitsLoop!0 (_2!4625 lt!157551) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!157556 () Unit!6502)

(assert (=> b!106237 (= lt!157556 (lemmaIsPrefixTransitive!0 (_2!4625 lt!157224) (_2!4625 lt!157551) (_2!4625 lt!157589)))))

(assert (=> b!106237 call!1335))

(declare-fun lt!157580 () Unit!6502)

(assert (=> b!106237 (= lt!157580 lt!157556)))

(assert (=> b!106237 (invariant!0 (currentBit!5109 (_2!4625 lt!157224)) (currentByte!5114 (_2!4625 lt!157224)) (size!2232 (buf!2608 (_2!4625 lt!157551))))))

(declare-fun lt!157562 () BitStream!3938)

(assert (=> b!106237 (= lt!157562 (BitStream!3939 (buf!2608 (_2!4625 lt!157551)) (currentByte!5114 (_2!4625 lt!157224)) (currentBit!5109 (_2!4625 lt!157224))))))

(assert (=> b!106237 (invariant!0 (currentBit!5109 lt!157562) (currentByte!5114 lt!157562) (size!2232 (buf!2608 (_2!4625 lt!157589))))))

(declare-fun lt!157582 () BitStream!3938)

(assert (=> b!106237 (= lt!157582 (BitStream!3939 (buf!2608 (_2!4625 lt!157589)) (currentByte!5114 lt!157562) (currentBit!5109 lt!157562)))))

(declare-fun lt!157567 () tuple2!8734)

(assert (=> b!106237 (= lt!157567 (readBitPure!0 lt!157562))))

(declare-fun lt!157573 () tuple2!8734)

(assert (=> b!106237 (= lt!157573 (readBitPure!0 lt!157582))))

(declare-fun lt!157549 () Unit!6502)

(assert (=> b!106237 (= lt!157549 (readBitPrefixLemma!0 lt!157562 (_2!4625 lt!157589)))))

(declare-fun res!87505 () Bool)

(assert (=> b!106237 (= res!87505 (= (bitIndex!0 (size!2232 (buf!2608 (_1!4624 lt!157567))) (currentByte!5114 (_1!4624 lt!157567)) (currentBit!5109 (_1!4624 lt!157567))) (bitIndex!0 (size!2232 (buf!2608 (_1!4624 lt!157573))) (currentByte!5114 (_1!4624 lt!157573)) (currentBit!5109 (_1!4624 lt!157573)))))))

(declare-fun e!69559 () Bool)

(assert (=> b!106237 (=> (not res!87505) (not e!69559))))

(assert (=> b!106237 e!69559))

(declare-fun lt!157554 () Unit!6502)

(assert (=> b!106237 (= lt!157554 lt!157549)))

(declare-fun lt!157583 () tuple2!8738)

(assert (=> b!106237 (= lt!157583 (reader!0 (_2!4625 lt!157224) (_2!4625 lt!157589)))))

(declare-fun lt!157576 () tuple2!8738)

(assert (=> b!106237 (= lt!157576 (reader!0 (_2!4625 lt!157551) (_2!4625 lt!157589)))))

(declare-fun lt!157566 () tuple2!8734)

(assert (=> b!106237 (= lt!157566 (readBitPure!0 (_1!4626 lt!157583)))))

(assert (=> b!106237 (= (_2!4624 lt!157566) lt!157585)))

(declare-fun lt!157561 () Unit!6502)

(declare-fun Unit!6507 () Unit!6502)

(assert (=> b!106237 (= lt!157561 Unit!6507)))

(declare-fun lt!157570 () (_ BitVec 64))

(assert (=> b!106237 (= lt!157570 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!157574 () (_ BitVec 64))

(assert (=> b!106237 (= lt!157574 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!157579 () Unit!6502)

(assert (=> b!106237 (= lt!157579 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4625 lt!157224) (buf!2608 (_2!4625 lt!157589)) lt!157574))))

(assert (=> b!106237 (validate_offset_bits!1 ((_ sign_extend 32) (size!2232 (buf!2608 (_2!4625 lt!157589)))) ((_ sign_extend 32) (currentByte!5114 (_2!4625 lt!157224))) ((_ sign_extend 32) (currentBit!5109 (_2!4625 lt!157224))) lt!157574)))

(declare-fun lt!157547 () Unit!6502)

(assert (=> b!106237 (= lt!157547 lt!157579)))

(declare-fun lt!157584 () tuple2!8740)

(assert (=> b!106237 (= lt!157584 (readNLeastSignificantBitsLoopPure!0 (_1!4626 lt!157583) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!157570))))

(declare-fun lt!157559 () (_ BitVec 64))

(assert (=> b!106237 (= lt!157559 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!157568 () Unit!6502)

(assert (=> b!106237 (= lt!157568 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4625 lt!157551) (buf!2608 (_2!4625 lt!157589)) lt!157559))))

(assert (=> b!106237 (validate_offset_bits!1 ((_ sign_extend 32) (size!2232 (buf!2608 (_2!4625 lt!157589)))) ((_ sign_extend 32) (currentByte!5114 (_2!4625 lt!157551))) ((_ sign_extend 32) (currentBit!5109 (_2!4625 lt!157551))) lt!157559)))

(declare-fun lt!157571 () Unit!6502)

(assert (=> b!106237 (= lt!157571 lt!157568)))

(declare-fun lt!157565 () tuple2!8740)

(assert (=> b!106237 (= lt!157565 (readNLeastSignificantBitsLoopPure!0 (_1!4626 lt!157576) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!157570 (ite (_2!4624 lt!157566) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!157563 () tuple2!8740)

(assert (=> b!106237 (= lt!157563 (readNLeastSignificantBitsLoopPure!0 (_1!4626 lt!157583) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!157570))))

(declare-fun c!6553 () Bool)

(assert (=> b!106237 (= c!6553 (_2!4624 (readBitPure!0 (_1!4626 lt!157583))))))

(declare-fun lt!157550 () tuple2!8740)

(assert (=> b!106237 (= lt!157550 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4626 lt!157583) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!157570 e!69557)))))

(declare-fun lt!157572 () Unit!6502)

(assert (=> b!106237 (= lt!157572 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4626 lt!157583) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!157570))))

(assert (=> b!106237 (and (= (_2!4627 lt!157563) (_2!4627 lt!157550)) (= (_1!4627 lt!157563) (_1!4627 lt!157550)))))

(declare-fun lt!157578 () Unit!6502)

(assert (=> b!106237 (= lt!157578 lt!157572)))

(assert (=> b!106237 (= (_1!4626 lt!157583) (withMovedBitIndex!0 (_2!4626 lt!157583) (bvsub (bitIndex!0 (size!2232 (buf!2608 (_2!4625 lt!157224))) (currentByte!5114 (_2!4625 lt!157224)) (currentBit!5109 (_2!4625 lt!157224))) (bitIndex!0 (size!2232 (buf!2608 (_2!4625 lt!157589))) (currentByte!5114 (_2!4625 lt!157589)) (currentBit!5109 (_2!4625 lt!157589))))))))

(declare-fun lt!157548 () Unit!6502)

(declare-fun Unit!6511 () Unit!6502)

(assert (=> b!106237 (= lt!157548 Unit!6511)))

(assert (=> b!106237 (= (_1!4626 lt!157576) (withMovedBitIndex!0 (_2!4626 lt!157576) (bvsub (bitIndex!0 (size!2232 (buf!2608 (_2!4625 lt!157551))) (currentByte!5114 (_2!4625 lt!157551)) (currentBit!5109 (_2!4625 lt!157551))) (bitIndex!0 (size!2232 (buf!2608 (_2!4625 lt!157589))) (currentByte!5114 (_2!4625 lt!157589)) (currentBit!5109 (_2!4625 lt!157589))))))))

(declare-fun lt!157588 () Unit!6502)

(declare-fun Unit!6514 () Unit!6502)

(assert (=> b!106237 (= lt!157588 Unit!6514)))

(assert (=> b!106237 (= (bitIndex!0 (size!2232 (buf!2608 (_2!4625 lt!157224))) (currentByte!5114 (_2!4625 lt!157224)) (currentBit!5109 (_2!4625 lt!157224))) (bvsub (bitIndex!0 (size!2232 (buf!2608 (_2!4625 lt!157551))) (currentByte!5114 (_2!4625 lt!157551)) (currentBit!5109 (_2!4625 lt!157551))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!157560 () Unit!6502)

(declare-fun Unit!6515 () Unit!6502)

(assert (=> b!106237 (= lt!157560 Unit!6515)))

(assert (=> b!106237 (= (_2!4627 lt!157584) (_2!4627 lt!157565))))

(declare-fun lt!157586 () Unit!6502)

(declare-fun Unit!6516 () Unit!6502)

(assert (=> b!106237 (= lt!157586 Unit!6516)))

(assert (=> b!106237 (= (_1!4627 lt!157584) (_2!4626 lt!157583))))

(declare-fun b!106238 () Bool)

(declare-fun res!87504 () Bool)

(assert (=> b!106238 (= res!87504 (isPrefixOf!0 (_2!4625 lt!157224) (_2!4625 lt!157553)))))

(assert (=> b!106238 (=> (not res!87504) (not e!69558))))

(declare-fun b!106239 () Bool)

(assert (=> b!106239 (= lt!157552 (readBitPure!0 (readerFrom!0 (_2!4625 lt!157553) (currentBit!5109 (_2!4625 lt!157224)) (currentByte!5114 (_2!4625 lt!157224)))))))

(declare-fun res!87506 () Bool)

(assert (=> b!106239 (= res!87506 (and (= (_2!4624 lt!157552) lt!157585) (= (_1!4624 lt!157552) (_2!4625 lt!157553))))))

(assert (=> b!106239 (=> (not res!87506) (not e!69556))))

(assert (=> b!106239 (= e!69558 e!69556)))

(declare-fun b!106240 () Bool)

(assert (=> b!106240 (= e!69557 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun d!33372 () Bool)

(declare-fun e!69555 () Bool)

(assert (=> d!33372 e!69555))

(declare-fun res!87502 () Bool)

(assert (=> d!33372 (=> (not res!87502) (not e!69555))))

(declare-fun lt!157575 () tuple2!8736)

(assert (=> d!33372 (= res!87502 (= (size!2232 (buf!2608 (_2!4625 lt!157224))) (size!2232 (buf!2608 (_2!4625 lt!157575)))))))

(assert (=> d!33372 (= lt!157575 e!69560)))

(assert (=> d!33372 (= c!6554 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!33372 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!33372 (= (appendNLeastSignificantBitsLoop!0 (_2!4625 lt!157224) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!157575)))

(declare-fun b!106234 () Bool)

(declare-fun e!69561 () Bool)

(declare-fun lt!157581 () (_ BitVec 64))

(assert (=> b!106234 (= e!69561 (validate_offset_bits!1 ((_ sign_extend 32) (size!2232 (buf!2608 (_2!4625 lt!157224)))) ((_ sign_extend 32) (currentByte!5114 (_2!4625 lt!157224))) ((_ sign_extend 32) (currentBit!5109 (_2!4625 lt!157224))) lt!157581))))

(declare-fun b!106241 () Bool)

(declare-fun lt!157557 () tuple2!8740)

(declare-fun lt!157564 () tuple2!8738)

(assert (=> b!106241 (= e!69555 (and (= (_2!4627 lt!157557) v!199) (= (_1!4627 lt!157557) (_2!4626 lt!157564))))))

(declare-fun lt!157545 () (_ BitVec 64))

(assert (=> b!106241 (= lt!157557 (readNLeastSignificantBitsLoopPure!0 (_1!4626 lt!157564) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!157545))))

(declare-fun lt!157587 () Unit!6502)

(declare-fun lt!157577 () Unit!6502)

(assert (=> b!106241 (= lt!157587 lt!157577)))

(assert (=> b!106241 (validate_offset_bits!1 ((_ sign_extend 32) (size!2232 (buf!2608 (_2!4625 lt!157575)))) ((_ sign_extend 32) (currentByte!5114 (_2!4625 lt!157224))) ((_ sign_extend 32) (currentBit!5109 (_2!4625 lt!157224))) lt!157581)))

(assert (=> b!106241 (= lt!157577 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4625 lt!157224) (buf!2608 (_2!4625 lt!157575)) lt!157581))))

(assert (=> b!106241 e!69561))

(declare-fun res!87508 () Bool)

(assert (=> b!106241 (=> (not res!87508) (not e!69561))))

(assert (=> b!106241 (= res!87508 (and (= (size!2232 (buf!2608 (_2!4625 lt!157224))) (size!2232 (buf!2608 (_2!4625 lt!157575)))) (bvsge lt!157581 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106241 (= lt!157581 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!106241 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!106241 (= lt!157545 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!106241 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!106241 (= lt!157564 (reader!0 (_2!4625 lt!157224) (_2!4625 lt!157575)))))

(declare-fun b!106242 () Bool)

(declare-fun res!87503 () Bool)

(assert (=> b!106242 (=> (not res!87503) (not e!69555))))

(assert (=> b!106242 (= res!87503 (isPrefixOf!0 (_2!4625 lt!157224) (_2!4625 lt!157575)))))

(declare-fun b!106243 () Bool)

(assert (=> b!106243 (= e!69559 (= (_2!4624 lt!157567) (_2!4624 lt!157573)))))

(declare-fun b!106244 () Bool)

(declare-fun res!87509 () Bool)

(assert (=> b!106244 (=> (not res!87509) (not e!69555))))

(declare-fun lt!157546 () (_ BitVec 64))

(declare-fun lt!157569 () (_ BitVec 64))

(assert (=> b!106244 (= res!87509 (= (bitIndex!0 (size!2232 (buf!2608 (_2!4625 lt!157575))) (currentByte!5114 (_2!4625 lt!157575)) (currentBit!5109 (_2!4625 lt!157575))) (bvadd lt!157546 lt!157569)))))

(assert (=> b!106244 (or (not (= (bvand lt!157546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!157569 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!157546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!157546 lt!157569) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106244 (= lt!157569 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!106244 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!106244 (= lt!157546 (bitIndex!0 (size!2232 (buf!2608 (_2!4625 lt!157224))) (currentByte!5114 (_2!4625 lt!157224)) (currentBit!5109 (_2!4625 lt!157224))))))

(assert (= (and d!33372 c!6554) b!106237))

(assert (= (and d!33372 (not c!6554)) b!106236))

(assert (= (and b!106237 res!87510) b!106235))

(assert (= (and b!106235 res!87507) b!106238))

(assert (= (and b!106238 res!87504) b!106239))

(assert (= (and b!106239 res!87506) b!106232))

(assert (= (and b!106237 res!87505) b!106243))

(assert (= (and b!106237 c!6553) b!106233))

(assert (= (and b!106237 (not c!6553)) b!106240))

(assert (= (or b!106237 b!106236) bm!1332))

(assert (= (and d!33372 res!87502) b!106244))

(assert (= (and b!106244 res!87509) b!106242))

(assert (= (and b!106242 res!87503) b!106241))

(assert (= (and b!106241 res!87508) b!106234))

(declare-fun m!156339 () Bool)

(assert (=> b!106239 m!156339))

(assert (=> b!106239 m!156339))

(declare-fun m!156341 () Bool)

(assert (=> b!106239 m!156341))

(declare-fun m!156343 () Bool)

(assert (=> b!106237 m!156343))

(declare-fun m!156345 () Bool)

(assert (=> b!106237 m!156345))

(declare-fun m!156347 () Bool)

(assert (=> b!106237 m!156347))

(declare-fun m!156349 () Bool)

(assert (=> b!106237 m!156349))

(declare-fun m!156351 () Bool)

(assert (=> b!106237 m!156351))

(declare-fun m!156353 () Bool)

(assert (=> b!106237 m!156353))

(declare-fun m!156355 () Bool)

(assert (=> b!106237 m!156355))

(declare-fun m!156357 () Bool)

(assert (=> b!106237 m!156357))

(declare-fun m!156359 () Bool)

(assert (=> b!106237 m!156359))

(declare-fun m!156361 () Bool)

(assert (=> b!106237 m!156361))

(declare-fun m!156363 () Bool)

(assert (=> b!106237 m!156363))

(declare-fun m!156365 () Bool)

(assert (=> b!106237 m!156365))

(declare-fun m!156367 () Bool)

(assert (=> b!106237 m!156367))

(declare-fun m!156369 () Bool)

(assert (=> b!106237 m!156369))

(assert (=> b!106237 m!156353))

(declare-fun m!156371 () Bool)

(assert (=> b!106237 m!156371))

(assert (=> b!106237 m!156203))

(declare-fun m!156373 () Bool)

(assert (=> b!106237 m!156373))

(declare-fun m!156375 () Bool)

(assert (=> b!106237 m!156375))

(declare-fun m!156377 () Bool)

(assert (=> b!106237 m!156377))

(declare-fun m!156379 () Bool)

(assert (=> b!106237 m!156379))

(declare-fun m!156381 () Bool)

(assert (=> b!106237 m!156381))

(declare-fun m!156383 () Bool)

(assert (=> b!106237 m!156383))

(declare-fun m!156385 () Bool)

(assert (=> b!106237 m!156385))

(declare-fun m!156387 () Bool)

(assert (=> b!106237 m!156387))

(declare-fun m!156389 () Bool)

(assert (=> b!106237 m!156389))

(declare-fun m!156391 () Bool)

(assert (=> b!106237 m!156391))

(declare-fun m!156393 () Bool)

(assert (=> b!106237 m!156393))

(declare-fun m!156395 () Bool)

(assert (=> b!106237 m!156395))

(declare-fun m!156397 () Bool)

(assert (=> b!106232 m!156397))

(declare-fun m!156399 () Bool)

(assert (=> b!106232 m!156399))

(declare-fun m!156401 () Bool)

(assert (=> b!106242 m!156401))

(declare-fun m!156403 () Bool)

(assert (=> b!106236 m!156403))

(declare-fun m!156405 () Bool)

(assert (=> b!106241 m!156405))

(declare-fun m!156407 () Bool)

(assert (=> b!106241 m!156407))

(declare-fun m!156409 () Bool)

(assert (=> b!106241 m!156409))

(assert (=> b!106241 m!156343))

(declare-fun m!156411 () Bool)

(assert (=> b!106241 m!156411))

(declare-fun m!156413 () Bool)

(assert (=> b!106234 m!156413))

(declare-fun m!156415 () Bool)

(assert (=> b!106244 m!156415))

(assert (=> b!106244 m!156203))

(assert (=> b!106235 m!156399))

(assert (=> b!106235 m!156203))

(declare-fun m!156417 () Bool)

(assert (=> bm!1332 m!156417))

(declare-fun m!156419 () Bool)

(assert (=> b!106238 m!156419))

(assert (=> b!106110 d!33372))

(declare-fun d!33396 () Bool)

(declare-fun e!69572 () Bool)

(assert (=> d!33396 e!69572))

(declare-fun res!87522 () Bool)

(assert (=> d!33396 (=> (not res!87522) (not e!69572))))

(declare-fun lt!157662 () (_ BitVec 64))

(declare-fun lt!157667 () (_ BitVec 64))

(declare-fun lt!157664 () (_ BitVec 64))

(assert (=> d!33396 (= res!87522 (= lt!157662 (bvsub lt!157664 lt!157667)))))

(assert (=> d!33396 (or (= (bvand lt!157664 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!157667 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!157664 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!157664 lt!157667) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33396 (= lt!157667 (remainingBits!0 ((_ sign_extend 32) (size!2232 (buf!2608 (_1!4624 lt!157202)))) ((_ sign_extend 32) (currentByte!5114 (_1!4624 lt!157202))) ((_ sign_extend 32) (currentBit!5109 (_1!4624 lt!157202)))))))

(declare-fun lt!157659 () (_ BitVec 64))

(declare-fun lt!157665 () (_ BitVec 64))

(assert (=> d!33396 (= lt!157664 (bvmul lt!157659 lt!157665))))

(assert (=> d!33396 (or (= lt!157659 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!157665 (bvsdiv (bvmul lt!157659 lt!157665) lt!157659)))))

(assert (=> d!33396 (= lt!157665 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33396 (= lt!157659 ((_ sign_extend 32) (size!2232 (buf!2608 (_1!4624 lt!157202)))))))

(assert (=> d!33396 (= lt!157662 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5114 (_1!4624 lt!157202))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5109 (_1!4624 lt!157202)))))))

(assert (=> d!33396 (invariant!0 (currentBit!5109 (_1!4624 lt!157202)) (currentByte!5114 (_1!4624 lt!157202)) (size!2232 (buf!2608 (_1!4624 lt!157202))))))

(assert (=> d!33396 (= (bitIndex!0 (size!2232 (buf!2608 (_1!4624 lt!157202))) (currentByte!5114 (_1!4624 lt!157202)) (currentBit!5109 (_1!4624 lt!157202))) lt!157662)))

(declare-fun b!106260 () Bool)

(declare-fun res!87524 () Bool)

(assert (=> b!106260 (=> (not res!87524) (not e!69572))))

(assert (=> b!106260 (= res!87524 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!157662))))

(declare-fun b!106262 () Bool)

(declare-fun lt!157658 () (_ BitVec 64))

(assert (=> b!106262 (= e!69572 (bvsle lt!157662 (bvmul lt!157658 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!106262 (or (= lt!157658 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!157658 #b0000000000000000000000000000000000000000000000000000000000001000) lt!157658)))))

(assert (=> b!106262 (= lt!157658 ((_ sign_extend 32) (size!2232 (buf!2608 (_1!4624 lt!157202)))))))

(assert (= (and d!33396 res!87522) b!106260))

(assert (= (and b!106260 res!87524) b!106262))

(declare-fun m!156427 () Bool)

(assert (=> d!33396 m!156427))

(declare-fun m!156429 () Bool)

(assert (=> d!33396 m!156429))

(assert (=> b!106110 d!33396))

(declare-fun b!106301 () Bool)

(declare-fun res!87561 () Bool)

(declare-fun e!69595 () Bool)

(assert (=> b!106301 (=> (not res!87561) (not e!69595))))

(declare-fun lt!157759 () tuple2!8736)

(assert (=> b!106301 (= res!87561 (isPrefixOf!0 thiss!1305 (_2!4625 lt!157759)))))

(declare-fun b!106300 () Bool)

(declare-fun res!87559 () Bool)

(assert (=> b!106300 (=> (not res!87559) (not e!69595))))

(declare-fun lt!157757 () (_ BitVec 64))

(declare-fun lt!157758 () (_ BitVec 64))

(assert (=> b!106300 (= res!87559 (= (bitIndex!0 (size!2232 (buf!2608 (_2!4625 lt!157759))) (currentByte!5114 (_2!4625 lt!157759)) (currentBit!5109 (_2!4625 lt!157759))) (bvadd lt!157757 lt!157758)))))

(assert (=> b!106300 (or (not (= (bvand lt!157757 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!157758 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!157757 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!157757 lt!157758) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106300 (= lt!157758 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!106300 (= lt!157757 (bitIndex!0 (size!2232 (buf!2608 thiss!1305)) (currentByte!5114 thiss!1305) (currentBit!5109 thiss!1305)))))

(declare-fun b!106302 () Bool)

(declare-fun e!69596 () Bool)

(assert (=> b!106302 (= e!69595 e!69596)))

(declare-fun res!87560 () Bool)

(assert (=> b!106302 (=> (not res!87560) (not e!69596))))

(declare-fun lt!157756 () tuple2!8734)

(assert (=> b!106302 (= res!87560 (and (= (_2!4624 lt!157756) lt!157219) (= (_1!4624 lt!157756) (_2!4625 lt!157759))))))

(assert (=> b!106302 (= lt!157756 (readBitPure!0 (readerFrom!0 (_2!4625 lt!157759) (currentBit!5109 thiss!1305) (currentByte!5114 thiss!1305))))))

(declare-fun b!106303 () Bool)

(assert (=> b!106303 (= e!69596 (= (bitIndex!0 (size!2232 (buf!2608 (_1!4624 lt!157756))) (currentByte!5114 (_1!4624 lt!157756)) (currentBit!5109 (_1!4624 lt!157756))) (bitIndex!0 (size!2232 (buf!2608 (_2!4625 lt!157759))) (currentByte!5114 (_2!4625 lt!157759)) (currentBit!5109 (_2!4625 lt!157759)))))))

(declare-fun d!33402 () Bool)

(assert (=> d!33402 e!69595))

(declare-fun res!87558 () Bool)

(assert (=> d!33402 (=> (not res!87558) (not e!69595))))

(assert (=> d!33402 (= res!87558 (= (size!2232 (buf!2608 thiss!1305)) (size!2232 (buf!2608 (_2!4625 lt!157759)))))))

(declare-fun choose!16 (BitStream!3938 Bool) tuple2!8736)

(assert (=> d!33402 (= lt!157759 (choose!16 thiss!1305 lt!157219))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!33402 (validate_offset_bit!0 ((_ sign_extend 32) (size!2232 (buf!2608 thiss!1305))) ((_ sign_extend 32) (currentByte!5114 thiss!1305)) ((_ sign_extend 32) (currentBit!5109 thiss!1305)))))

(assert (=> d!33402 (= (appendBit!0 thiss!1305 lt!157219) lt!157759)))

(assert (= (and d!33402 res!87558) b!106300))

(assert (= (and b!106300 res!87559) b!106301))

(assert (= (and b!106301 res!87561) b!106302))

(assert (= (and b!106302 res!87560) b!106303))

(declare-fun m!156453 () Bool)

(assert (=> b!106303 m!156453))

(declare-fun m!156455 () Bool)

(assert (=> b!106303 m!156455))

(declare-fun m!156457 () Bool)

(assert (=> d!33402 m!156457))

(declare-fun m!156459 () Bool)

(assert (=> d!33402 m!156459))

(declare-fun m!156461 () Bool)

(assert (=> b!106301 m!156461))

(assert (=> b!106300 m!156455))

(assert (=> b!106300 m!156147))

(declare-fun m!156467 () Bool)

(assert (=> b!106302 m!156467))

(assert (=> b!106302 m!156467))

(declare-fun m!156471 () Bool)

(assert (=> b!106302 m!156471))

(assert (=> b!106110 d!33402))

(declare-fun d!33426 () Bool)

(declare-fun lt!157762 () tuple2!8748)

(assert (=> d!33426 (= lt!157762 (readBit!0 lt!157218))))

(assert (=> d!33426 (= (readBitPure!0 lt!157218) (tuple2!8735 (_2!4631 lt!157762) (_1!4631 lt!157762)))))

(declare-fun bs!8161 () Bool)

(assert (= bs!8161 d!33426))

(declare-fun m!156477 () Bool)

(assert (=> bs!8161 m!156477))

(assert (=> b!106110 d!33426))

(declare-fun d!33428 () Bool)

(assert (=> d!33428 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2232 (buf!2608 (_2!4625 lt!157204)))) ((_ sign_extend 32) (currentByte!5114 (_2!4625 lt!157224))) ((_ sign_extend 32) (currentBit!5109 (_2!4625 lt!157224))) lt!157214) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2232 (buf!2608 (_2!4625 lt!157204)))) ((_ sign_extend 32) (currentByte!5114 (_2!4625 lt!157224))) ((_ sign_extend 32) (currentBit!5109 (_2!4625 lt!157224)))) lt!157214))))

(declare-fun bs!8163 () Bool)

(assert (= bs!8163 d!33428))

(declare-fun m!156491 () Bool)

(assert (=> bs!8163 m!156491))

(assert (=> b!106110 d!33428))

(declare-fun d!33430 () Bool)

(declare-fun e!69601 () Bool)

(assert (=> d!33430 e!69601))

(declare-fun res!87567 () Bool)

(assert (=> d!33430 (=> (not res!87567) (not e!69601))))

(declare-fun lt!157773 () tuple2!8734)

(declare-fun lt!157774 () tuple2!8734)

(assert (=> d!33430 (= res!87567 (= (bitIndex!0 (size!2232 (buf!2608 (_1!4624 lt!157773))) (currentByte!5114 (_1!4624 lt!157773)) (currentBit!5109 (_1!4624 lt!157773))) (bitIndex!0 (size!2232 (buf!2608 (_1!4624 lt!157774))) (currentByte!5114 (_1!4624 lt!157774)) (currentBit!5109 (_1!4624 lt!157774)))))))

(declare-fun lt!157775 () BitStream!3938)

(declare-fun lt!157776 () Unit!6502)

(declare-fun choose!50 (BitStream!3938 BitStream!3938 BitStream!3938 tuple2!8734 tuple2!8734 BitStream!3938 Bool tuple2!8734 tuple2!8734 BitStream!3938 Bool) Unit!6502)

(assert (=> d!33430 (= lt!157776 (choose!50 lt!157218 (_2!4625 lt!157204) lt!157775 lt!157773 (tuple2!8735 (_1!4624 lt!157773) (_2!4624 lt!157773)) (_1!4624 lt!157773) (_2!4624 lt!157773) lt!157774 (tuple2!8735 (_1!4624 lt!157774) (_2!4624 lt!157774)) (_1!4624 lt!157774) (_2!4624 lt!157774)))))

(assert (=> d!33430 (= lt!157774 (readBitPure!0 lt!157775))))

(assert (=> d!33430 (= lt!157773 (readBitPure!0 lt!157218))))

(assert (=> d!33430 (= lt!157775 (BitStream!3939 (buf!2608 (_2!4625 lt!157204)) (currentByte!5114 lt!157218) (currentBit!5109 lt!157218)))))

(assert (=> d!33430 (invariant!0 (currentBit!5109 lt!157218) (currentByte!5114 lt!157218) (size!2232 (buf!2608 (_2!4625 lt!157204))))))

(assert (=> d!33430 (= (readBitPrefixLemma!0 lt!157218 (_2!4625 lt!157204)) lt!157776)))

(declare-fun b!106309 () Bool)

(assert (=> b!106309 (= e!69601 (= (_2!4624 lt!157773) (_2!4624 lt!157774)))))

(assert (= (and d!33430 res!87567) b!106309))

(assert (=> d!33430 m!156191))

(declare-fun m!156559 () Bool)

(assert (=> d!33430 m!156559))

(declare-fun m!156561 () Bool)

(assert (=> d!33430 m!156561))

(declare-fun m!156563 () Bool)

(assert (=> d!33430 m!156563))

(declare-fun m!156565 () Bool)

(assert (=> d!33430 m!156565))

(declare-fun m!156567 () Bool)

(assert (=> d!33430 m!156567))

(assert (=> b!106110 d!33430))

(declare-fun d!33440 () Bool)

(assert (=> d!33440 (validate_offset_bits!1 ((_ sign_extend 32) (size!2232 (buf!2608 (_2!4625 lt!157204)))) ((_ sign_extend 32) (currentByte!5114 thiss!1305)) ((_ sign_extend 32) (currentBit!5109 thiss!1305)) lt!157203)))

(declare-fun lt!157777 () Unit!6502)

(assert (=> d!33440 (= lt!157777 (choose!9 thiss!1305 (buf!2608 (_2!4625 lt!157204)) lt!157203 (BitStream!3939 (buf!2608 (_2!4625 lt!157204)) (currentByte!5114 thiss!1305) (currentBit!5109 thiss!1305))))))

(assert (=> d!33440 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2608 (_2!4625 lt!157204)) lt!157203) lt!157777)))

(declare-fun bs!8165 () Bool)

(assert (= bs!8165 d!33440))

(assert (=> bs!8165 m!156179))

(declare-fun m!156569 () Bool)

(assert (=> bs!8165 m!156569))

(assert (=> b!106110 d!33440))

(declare-fun d!33442 () Bool)

(assert (=> d!33442 (isPrefixOf!0 thiss!1305 (_2!4625 lt!157204))))

(declare-fun lt!157780 () Unit!6502)

(declare-fun choose!30 (BitStream!3938 BitStream!3938 BitStream!3938) Unit!6502)

(assert (=> d!33442 (= lt!157780 (choose!30 thiss!1305 (_2!4625 lt!157224) (_2!4625 lt!157204)))))

(assert (=> d!33442 (isPrefixOf!0 thiss!1305 (_2!4625 lt!157224))))

(assert (=> d!33442 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4625 lt!157224) (_2!4625 lt!157204)) lt!157780)))

(declare-fun bs!8166 () Bool)

(assert (= bs!8166 d!33442))

(assert (=> bs!8166 m!156157))

(declare-fun m!156571 () Bool)

(assert (=> bs!8166 m!156571))

(assert (=> bs!8166 m!156215))

(assert (=> b!106110 d!33442))

(declare-fun lt!157781 () tuple2!8744)

(declare-fun d!33444 () Bool)

(assert (=> d!33444 (= lt!157781 (readNLeastSignificantBitsLoop!0 (_1!4626 lt!157215) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!157216))))

(assert (=> d!33444 (= (readNLeastSignificantBitsLoopPure!0 (_1!4626 lt!157215) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!157216) (tuple2!8741 (_2!4629 lt!157781) (_1!4629 lt!157781)))))

(declare-fun bs!8167 () Bool)

(assert (= bs!8167 d!33444))

(declare-fun m!156573 () Bool)

(assert (=> bs!8167 m!156573))

(assert (=> b!106110 d!33444))

(declare-fun d!33446 () Bool)

(declare-fun e!69602 () Bool)

(assert (=> d!33446 e!69602))

(declare-fun res!87568 () Bool)

(assert (=> d!33446 (=> (not res!87568) (not e!69602))))

(declare-fun lt!157785 () (_ BitVec 64))

(declare-fun lt!157784 () (_ BitVec 64))

(declare-fun lt!157787 () (_ BitVec 64))

(assert (=> d!33446 (= res!87568 (= lt!157784 (bvsub lt!157785 lt!157787)))))

(assert (=> d!33446 (or (= (bvand lt!157785 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!157787 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!157785 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!157785 lt!157787) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33446 (= lt!157787 (remainingBits!0 ((_ sign_extend 32) (size!2232 (buf!2608 (_1!4624 lt!157201)))) ((_ sign_extend 32) (currentByte!5114 (_1!4624 lt!157201))) ((_ sign_extend 32) (currentBit!5109 (_1!4624 lt!157201)))))))

(declare-fun lt!157783 () (_ BitVec 64))

(declare-fun lt!157786 () (_ BitVec 64))

(assert (=> d!33446 (= lt!157785 (bvmul lt!157783 lt!157786))))

(assert (=> d!33446 (or (= lt!157783 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!157786 (bvsdiv (bvmul lt!157783 lt!157786) lt!157783)))))

(assert (=> d!33446 (= lt!157786 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33446 (= lt!157783 ((_ sign_extend 32) (size!2232 (buf!2608 (_1!4624 lt!157201)))))))

(assert (=> d!33446 (= lt!157784 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5114 (_1!4624 lt!157201))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5109 (_1!4624 lt!157201)))))))

(assert (=> d!33446 (invariant!0 (currentBit!5109 (_1!4624 lt!157201)) (currentByte!5114 (_1!4624 lt!157201)) (size!2232 (buf!2608 (_1!4624 lt!157201))))))

(assert (=> d!33446 (= (bitIndex!0 (size!2232 (buf!2608 (_1!4624 lt!157201))) (currentByte!5114 (_1!4624 lt!157201)) (currentBit!5109 (_1!4624 lt!157201))) lt!157784)))

(declare-fun b!106310 () Bool)

(declare-fun res!87569 () Bool)

(assert (=> b!106310 (=> (not res!87569) (not e!69602))))

(assert (=> b!106310 (= res!87569 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!157784))))

(declare-fun b!106311 () Bool)

(declare-fun lt!157782 () (_ BitVec 64))

(assert (=> b!106311 (= e!69602 (bvsle lt!157784 (bvmul lt!157782 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!106311 (or (= lt!157782 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!157782 #b0000000000000000000000000000000000000000000000000000000000001000) lt!157782)))))

(assert (=> b!106311 (= lt!157782 ((_ sign_extend 32) (size!2232 (buf!2608 (_1!4624 lt!157201)))))))

(assert (= (and d!33446 res!87568) b!106310))

(assert (= (and b!106310 res!87569) b!106311))

(declare-fun m!156575 () Bool)

(assert (=> d!33446 m!156575))

(declare-fun m!156577 () Bool)

(assert (=> d!33446 m!156577))

(assert (=> b!106110 d!33446))

(declare-fun d!33448 () Bool)

(declare-fun lt!157788 () tuple2!8748)

(assert (=> d!33448 (= lt!157788 (readBit!0 (BitStream!3939 (buf!2608 (_2!4625 lt!157204)) (currentByte!5114 thiss!1305) (currentBit!5109 thiss!1305))))))

(assert (=> d!33448 (= (readBitPure!0 (BitStream!3939 (buf!2608 (_2!4625 lt!157204)) (currentByte!5114 thiss!1305) (currentBit!5109 thiss!1305))) (tuple2!8735 (_2!4631 lt!157788) (_1!4631 lt!157788)))))

(declare-fun bs!8168 () Bool)

(assert (= bs!8168 d!33448))

(declare-fun m!156579 () Bool)

(assert (=> bs!8168 m!156579))

(assert (=> b!106110 d!33448))

(declare-fun d!33450 () Bool)

(assert (=> d!33450 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2232 (buf!2608 (_2!4625 lt!157204)))) ((_ sign_extend 32) (currentByte!5114 thiss!1305)) ((_ sign_extend 32) (currentBit!5109 thiss!1305)) lt!157203) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2232 (buf!2608 (_2!4625 lt!157204)))) ((_ sign_extend 32) (currentByte!5114 thiss!1305)) ((_ sign_extend 32) (currentBit!5109 thiss!1305))) lt!157203))))

(declare-fun bs!8169 () Bool)

(assert (= bs!8169 d!33450))

(declare-fun m!156581 () Bool)

(assert (=> bs!8169 m!156581))

(assert (=> b!106110 d!33450))

(declare-fun b!106345 () Bool)

(declare-fun e!69619 () Unit!6502)

(declare-fun Unit!6518 () Unit!6502)

(assert (=> b!106345 (= e!69619 Unit!6518)))

(declare-fun d!33452 () Bool)

(declare-fun e!69618 () Bool)

(assert (=> d!33452 e!69618))

(declare-fun res!87597 () Bool)

(assert (=> d!33452 (=> (not res!87597) (not e!69618))))

(declare-fun lt!157898 () tuple2!8738)

(assert (=> d!33452 (= res!87597 (isPrefixOf!0 (_1!4626 lt!157898) (_2!4626 lt!157898)))))

(declare-fun lt!157900 () BitStream!3938)

(assert (=> d!33452 (= lt!157898 (tuple2!8739 lt!157900 (_2!4625 lt!157204)))))

(declare-fun lt!157906 () Unit!6502)

(declare-fun lt!157908 () Unit!6502)

(assert (=> d!33452 (= lt!157906 lt!157908)))

(assert (=> d!33452 (isPrefixOf!0 lt!157900 (_2!4625 lt!157204))))

(assert (=> d!33452 (= lt!157908 (lemmaIsPrefixTransitive!0 lt!157900 (_2!4625 lt!157204) (_2!4625 lt!157204)))))

(declare-fun lt!157899 () Unit!6502)

(declare-fun lt!157911 () Unit!6502)

(assert (=> d!33452 (= lt!157899 lt!157911)))

(assert (=> d!33452 (isPrefixOf!0 lt!157900 (_2!4625 lt!157204))))

(assert (=> d!33452 (= lt!157911 (lemmaIsPrefixTransitive!0 lt!157900 thiss!1305 (_2!4625 lt!157204)))))

(declare-fun lt!157905 () Unit!6502)

(assert (=> d!33452 (= lt!157905 e!69619)))

(declare-fun c!6562 () Bool)

(assert (=> d!33452 (= c!6562 (not (= (size!2232 (buf!2608 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!157912 () Unit!6502)

(declare-fun lt!157907 () Unit!6502)

(assert (=> d!33452 (= lt!157912 lt!157907)))

(assert (=> d!33452 (isPrefixOf!0 (_2!4625 lt!157204) (_2!4625 lt!157204))))

(assert (=> d!33452 (= lt!157907 (lemmaIsPrefixRefl!0 (_2!4625 lt!157204)))))

(declare-fun lt!157914 () Unit!6502)

(declare-fun lt!157916 () Unit!6502)

(assert (=> d!33452 (= lt!157914 lt!157916)))

(assert (=> d!33452 (= lt!157916 (lemmaIsPrefixRefl!0 (_2!4625 lt!157204)))))

(declare-fun lt!157917 () Unit!6502)

(declare-fun lt!157913 () Unit!6502)

(assert (=> d!33452 (= lt!157917 lt!157913)))

(assert (=> d!33452 (isPrefixOf!0 lt!157900 lt!157900)))

(assert (=> d!33452 (= lt!157913 (lemmaIsPrefixRefl!0 lt!157900))))

(declare-fun lt!157909 () Unit!6502)

(declare-fun lt!157910 () Unit!6502)

(assert (=> d!33452 (= lt!157909 lt!157910)))

(assert (=> d!33452 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!33452 (= lt!157910 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!33452 (= lt!157900 (BitStream!3939 (buf!2608 (_2!4625 lt!157204)) (currentByte!5114 thiss!1305) (currentBit!5109 thiss!1305)))))

(assert (=> d!33452 (isPrefixOf!0 thiss!1305 (_2!4625 lt!157204))))

(assert (=> d!33452 (= (reader!0 thiss!1305 (_2!4625 lt!157204)) lt!157898)))

(declare-fun b!106346 () Bool)

(declare-fun lt!157903 () Unit!6502)

(assert (=> b!106346 (= e!69619 lt!157903)))

(declare-fun lt!157915 () (_ BitVec 64))

(assert (=> b!106346 (= lt!157915 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!157904 () (_ BitVec 64))

(assert (=> b!106346 (= lt!157904 (bitIndex!0 (size!2232 (buf!2608 thiss!1305)) (currentByte!5114 thiss!1305) (currentBit!5109 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4897 array!4897 (_ BitVec 64) (_ BitVec 64)) Unit!6502)

(assert (=> b!106346 (= lt!157903 (arrayBitRangesEqSymmetric!0 (buf!2608 thiss!1305) (buf!2608 (_2!4625 lt!157204)) lt!157915 lt!157904))))

(assert (=> b!106346 (arrayBitRangesEq!0 (buf!2608 (_2!4625 lt!157204)) (buf!2608 thiss!1305) lt!157915 lt!157904)))

(declare-fun b!106347 () Bool)

(declare-fun lt!157901 () (_ BitVec 64))

(declare-fun lt!157902 () (_ BitVec 64))

(assert (=> b!106347 (= e!69618 (= (_1!4626 lt!157898) (withMovedBitIndex!0 (_2!4626 lt!157898) (bvsub lt!157901 lt!157902))))))

(assert (=> b!106347 (or (= (bvand lt!157901 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!157902 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!157901 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!157901 lt!157902) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106347 (= lt!157902 (bitIndex!0 (size!2232 (buf!2608 (_2!4625 lt!157204))) (currentByte!5114 (_2!4625 lt!157204)) (currentBit!5109 (_2!4625 lt!157204))))))

(assert (=> b!106347 (= lt!157901 (bitIndex!0 (size!2232 (buf!2608 thiss!1305)) (currentByte!5114 thiss!1305) (currentBit!5109 thiss!1305)))))

(declare-fun b!106348 () Bool)

(declare-fun res!87598 () Bool)

(assert (=> b!106348 (=> (not res!87598) (not e!69618))))

(assert (=> b!106348 (= res!87598 (isPrefixOf!0 (_1!4626 lt!157898) thiss!1305))))

(declare-fun b!106349 () Bool)

(declare-fun res!87596 () Bool)

(assert (=> b!106349 (=> (not res!87596) (not e!69618))))

(assert (=> b!106349 (= res!87596 (isPrefixOf!0 (_2!4626 lt!157898) (_2!4625 lt!157204)))))

(assert (= (and d!33452 c!6562) b!106346))

(assert (= (and d!33452 (not c!6562)) b!106345))

(assert (= (and d!33452 res!87597) b!106348))

(assert (= (and b!106348 res!87598) b!106349))

(assert (= (and b!106349 res!87596) b!106347))

(declare-fun m!156655 () Bool)

(assert (=> d!33452 m!156655))

(declare-fun m!156657 () Bool)

(assert (=> d!33452 m!156657))

(assert (=> d!33452 m!156157))

(declare-fun m!156659 () Bool)

(assert (=> d!33452 m!156659))

(declare-fun m!156661 () Bool)

(assert (=> d!33452 m!156661))

(declare-fun m!156663 () Bool)

(assert (=> d!33452 m!156663))

(declare-fun m!156665 () Bool)

(assert (=> d!33452 m!156665))

(declare-fun m!156667 () Bool)

(assert (=> d!33452 m!156667))

(declare-fun m!156669 () Bool)

(assert (=> d!33452 m!156669))

(declare-fun m!156671 () Bool)

(assert (=> d!33452 m!156671))

(declare-fun m!156673 () Bool)

(assert (=> d!33452 m!156673))

(declare-fun m!156675 () Bool)

(assert (=> b!106349 m!156675))

(assert (=> b!106346 m!156147))

(declare-fun m!156677 () Bool)

(assert (=> b!106346 m!156677))

(declare-fun m!156679 () Bool)

(assert (=> b!106346 m!156679))

(declare-fun m!156681 () Bool)

(assert (=> b!106347 m!156681))

(assert (=> b!106347 m!156149))

(assert (=> b!106347 m!156147))

(declare-fun m!156683 () Bool)

(assert (=> b!106348 m!156683))

(assert (=> b!106110 d!33452))

(declare-fun b!106350 () Bool)

(declare-fun e!69621 () Unit!6502)

(declare-fun Unit!6519 () Unit!6502)

(assert (=> b!106350 (= e!69621 Unit!6519)))

(declare-fun d!33484 () Bool)

(declare-fun e!69620 () Bool)

(assert (=> d!33484 e!69620))

(declare-fun res!87600 () Bool)

(assert (=> d!33484 (=> (not res!87600) (not e!69620))))

(declare-fun lt!157918 () tuple2!8738)

(assert (=> d!33484 (= res!87600 (isPrefixOf!0 (_1!4626 lt!157918) (_2!4626 lt!157918)))))

(declare-fun lt!157920 () BitStream!3938)

(assert (=> d!33484 (= lt!157918 (tuple2!8739 lt!157920 (_2!4625 lt!157204)))))

(declare-fun lt!157926 () Unit!6502)

(declare-fun lt!157928 () Unit!6502)

(assert (=> d!33484 (= lt!157926 lt!157928)))

(assert (=> d!33484 (isPrefixOf!0 lt!157920 (_2!4625 lt!157204))))

(assert (=> d!33484 (= lt!157928 (lemmaIsPrefixTransitive!0 lt!157920 (_2!4625 lt!157204) (_2!4625 lt!157204)))))

(declare-fun lt!157919 () Unit!6502)

(declare-fun lt!157931 () Unit!6502)

(assert (=> d!33484 (= lt!157919 lt!157931)))

(assert (=> d!33484 (isPrefixOf!0 lt!157920 (_2!4625 lt!157204))))

(assert (=> d!33484 (= lt!157931 (lemmaIsPrefixTransitive!0 lt!157920 (_2!4625 lt!157224) (_2!4625 lt!157204)))))

(declare-fun lt!157925 () Unit!6502)

(assert (=> d!33484 (= lt!157925 e!69621)))

(declare-fun c!6563 () Bool)

(assert (=> d!33484 (= c!6563 (not (= (size!2232 (buf!2608 (_2!4625 lt!157224))) #b00000000000000000000000000000000)))))

(declare-fun lt!157932 () Unit!6502)

(declare-fun lt!157927 () Unit!6502)

(assert (=> d!33484 (= lt!157932 lt!157927)))

(assert (=> d!33484 (isPrefixOf!0 (_2!4625 lt!157204) (_2!4625 lt!157204))))

(assert (=> d!33484 (= lt!157927 (lemmaIsPrefixRefl!0 (_2!4625 lt!157204)))))

(declare-fun lt!157934 () Unit!6502)

(declare-fun lt!157936 () Unit!6502)

(assert (=> d!33484 (= lt!157934 lt!157936)))

(assert (=> d!33484 (= lt!157936 (lemmaIsPrefixRefl!0 (_2!4625 lt!157204)))))

(declare-fun lt!157937 () Unit!6502)

(declare-fun lt!157933 () Unit!6502)

(assert (=> d!33484 (= lt!157937 lt!157933)))

(assert (=> d!33484 (isPrefixOf!0 lt!157920 lt!157920)))

(assert (=> d!33484 (= lt!157933 (lemmaIsPrefixRefl!0 lt!157920))))

(declare-fun lt!157929 () Unit!6502)

(declare-fun lt!157930 () Unit!6502)

(assert (=> d!33484 (= lt!157929 lt!157930)))

(assert (=> d!33484 (isPrefixOf!0 (_2!4625 lt!157224) (_2!4625 lt!157224))))

(assert (=> d!33484 (= lt!157930 (lemmaIsPrefixRefl!0 (_2!4625 lt!157224)))))

(assert (=> d!33484 (= lt!157920 (BitStream!3939 (buf!2608 (_2!4625 lt!157204)) (currentByte!5114 (_2!4625 lt!157224)) (currentBit!5109 (_2!4625 lt!157224))))))

(assert (=> d!33484 (isPrefixOf!0 (_2!4625 lt!157224) (_2!4625 lt!157204))))

(assert (=> d!33484 (= (reader!0 (_2!4625 lt!157224) (_2!4625 lt!157204)) lt!157918)))

(declare-fun b!106351 () Bool)

(declare-fun lt!157923 () Unit!6502)

(assert (=> b!106351 (= e!69621 lt!157923)))

(declare-fun lt!157935 () (_ BitVec 64))

(assert (=> b!106351 (= lt!157935 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!157924 () (_ BitVec 64))

(assert (=> b!106351 (= lt!157924 (bitIndex!0 (size!2232 (buf!2608 (_2!4625 lt!157224))) (currentByte!5114 (_2!4625 lt!157224)) (currentBit!5109 (_2!4625 lt!157224))))))

(assert (=> b!106351 (= lt!157923 (arrayBitRangesEqSymmetric!0 (buf!2608 (_2!4625 lt!157224)) (buf!2608 (_2!4625 lt!157204)) lt!157935 lt!157924))))

(assert (=> b!106351 (arrayBitRangesEq!0 (buf!2608 (_2!4625 lt!157204)) (buf!2608 (_2!4625 lt!157224)) lt!157935 lt!157924)))

(declare-fun b!106352 () Bool)

(declare-fun lt!157921 () (_ BitVec 64))

(declare-fun lt!157922 () (_ BitVec 64))

(assert (=> b!106352 (= e!69620 (= (_1!4626 lt!157918) (withMovedBitIndex!0 (_2!4626 lt!157918) (bvsub lt!157921 lt!157922))))))

(assert (=> b!106352 (or (= (bvand lt!157921 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!157922 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!157921 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!157921 lt!157922) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106352 (= lt!157922 (bitIndex!0 (size!2232 (buf!2608 (_2!4625 lt!157204))) (currentByte!5114 (_2!4625 lt!157204)) (currentBit!5109 (_2!4625 lt!157204))))))

(assert (=> b!106352 (= lt!157921 (bitIndex!0 (size!2232 (buf!2608 (_2!4625 lt!157224))) (currentByte!5114 (_2!4625 lt!157224)) (currentBit!5109 (_2!4625 lt!157224))))))

(declare-fun b!106353 () Bool)

(declare-fun res!87601 () Bool)

(assert (=> b!106353 (=> (not res!87601) (not e!69620))))

(assert (=> b!106353 (= res!87601 (isPrefixOf!0 (_1!4626 lt!157918) (_2!4625 lt!157224)))))

(declare-fun b!106354 () Bool)

(declare-fun res!87599 () Bool)

(assert (=> b!106354 (=> (not res!87599) (not e!69620))))

(assert (=> b!106354 (= res!87599 (isPrefixOf!0 (_2!4626 lt!157918) (_2!4625 lt!157204)))))

(assert (= (and d!33484 c!6563) b!106351))

(assert (= (and d!33484 (not c!6563)) b!106350))

(assert (= (and d!33484 res!87600) b!106353))

(assert (= (and b!106353 res!87601) b!106354))

(assert (= (and b!106354 res!87599) b!106352))

(declare-fun m!156685 () Bool)

(assert (=> d!33484 m!156685))

(declare-fun m!156687 () Bool)

(assert (=> d!33484 m!156687))

(declare-fun m!156689 () Bool)

(assert (=> d!33484 m!156689))

(declare-fun m!156691 () Bool)

(assert (=> d!33484 m!156691))

(declare-fun m!156693 () Bool)

(assert (=> d!33484 m!156693))

(declare-fun m!156695 () Bool)

(assert (=> d!33484 m!156695))

(assert (=> d!33484 m!156665))

(declare-fun m!156697 () Bool)

(assert (=> d!33484 m!156697))

(declare-fun m!156699 () Bool)

(assert (=> d!33484 m!156699))

(declare-fun m!156701 () Bool)

(assert (=> d!33484 m!156701))

(assert (=> d!33484 m!156673))

(declare-fun m!156703 () Bool)

(assert (=> b!106354 m!156703))

(assert (=> b!106351 m!156203))

(declare-fun m!156705 () Bool)

(assert (=> b!106351 m!156705))

(declare-fun m!156707 () Bool)

(assert (=> b!106351 m!156707))

(declare-fun m!156709 () Bool)

(assert (=> b!106352 m!156709))

(assert (=> b!106352 m!156149))

(assert (=> b!106352 m!156203))

(declare-fun m!156711 () Bool)

(assert (=> b!106353 m!156711))

(assert (=> b!106110 d!33484))

(declare-fun d!33486 () Bool)

(declare-fun res!87604 () Bool)

(declare-fun e!69623 () Bool)

(assert (=> d!33486 (=> (not res!87604) (not e!69623))))

(assert (=> d!33486 (= res!87604 (= (size!2232 (buf!2608 thiss!1305)) (size!2232 (buf!2608 (_2!4625 lt!157204)))))))

(assert (=> d!33486 (= (isPrefixOf!0 thiss!1305 (_2!4625 lt!157204)) e!69623)))

(declare-fun b!106355 () Bool)

(declare-fun res!87603 () Bool)

(assert (=> b!106355 (=> (not res!87603) (not e!69623))))

(assert (=> b!106355 (= res!87603 (bvsle (bitIndex!0 (size!2232 (buf!2608 thiss!1305)) (currentByte!5114 thiss!1305) (currentBit!5109 thiss!1305)) (bitIndex!0 (size!2232 (buf!2608 (_2!4625 lt!157204))) (currentByte!5114 (_2!4625 lt!157204)) (currentBit!5109 (_2!4625 lt!157204)))))))

(declare-fun b!106356 () Bool)

(declare-fun e!69622 () Bool)

(assert (=> b!106356 (= e!69623 e!69622)))

(declare-fun res!87602 () Bool)

(assert (=> b!106356 (=> res!87602 e!69622)))

(assert (=> b!106356 (= res!87602 (= (size!2232 (buf!2608 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!106357 () Bool)

(assert (=> b!106357 (= e!69622 (arrayBitRangesEq!0 (buf!2608 thiss!1305) (buf!2608 (_2!4625 lt!157204)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2232 (buf!2608 thiss!1305)) (currentByte!5114 thiss!1305) (currentBit!5109 thiss!1305))))))

(assert (= (and d!33486 res!87604) b!106355))

(assert (= (and b!106355 res!87603) b!106356))

(assert (= (and b!106356 (not res!87602)) b!106357))

(assert (=> b!106355 m!156147))

(assert (=> b!106355 m!156149))

(assert (=> b!106357 m!156147))

(assert (=> b!106357 m!156147))

(declare-fun m!156713 () Bool)

(assert (=> b!106357 m!156713))

(assert (=> b!106110 d!33486))

(declare-fun lt!157938 () tuple2!8744)

(declare-fun d!33488 () Bool)

(assert (=> d!33488 (= lt!157938 (readNLeastSignificantBitsLoop!0 (_1!4626 lt!157217) nBits!396 i!615 lt!157208))))

(assert (=> d!33488 (= (readNLeastSignificantBitsLoopPure!0 (_1!4626 lt!157217) nBits!396 i!615 lt!157208) (tuple2!8741 (_2!4629 lt!157938) (_1!4629 lt!157938)))))

(declare-fun bs!8178 () Bool)

(assert (= bs!8178 d!33488))

(declare-fun m!156715 () Bool)

(assert (=> bs!8178 m!156715))

(assert (=> b!106110 d!33488))

(declare-fun d!33490 () Bool)

(declare-fun lt!157939 () tuple2!8748)

(assert (=> d!33490 (= lt!157939 (readBit!0 (readerFrom!0 (_2!4625 lt!157224) (currentBit!5109 thiss!1305) (currentByte!5114 thiss!1305))))))

(assert (=> d!33490 (= (readBitPure!0 (readerFrom!0 (_2!4625 lt!157224) (currentBit!5109 thiss!1305) (currentByte!5114 thiss!1305))) (tuple2!8735 (_2!4631 lt!157939) (_1!4631 lt!157939)))))

(declare-fun bs!8179 () Bool)

(assert (= bs!8179 d!33490))

(assert (=> bs!8179 m!156143))

(declare-fun m!156717 () Bool)

(assert (=> bs!8179 m!156717))

(assert (=> b!106120 d!33490))

(declare-fun d!33492 () Bool)

(declare-fun e!69626 () Bool)

(assert (=> d!33492 e!69626))

(declare-fun res!87608 () Bool)

(assert (=> d!33492 (=> (not res!87608) (not e!69626))))

(assert (=> d!33492 (= res!87608 (invariant!0 (currentBit!5109 (_2!4625 lt!157224)) (currentByte!5114 (_2!4625 lt!157224)) (size!2232 (buf!2608 (_2!4625 lt!157224)))))))

(assert (=> d!33492 (= (readerFrom!0 (_2!4625 lt!157224) (currentBit!5109 thiss!1305) (currentByte!5114 thiss!1305)) (BitStream!3939 (buf!2608 (_2!4625 lt!157224)) (currentByte!5114 thiss!1305) (currentBit!5109 thiss!1305)))))

(declare-fun b!106360 () Bool)

(assert (=> b!106360 (= e!69626 (invariant!0 (currentBit!5109 thiss!1305) (currentByte!5114 thiss!1305) (size!2232 (buf!2608 (_2!4625 lt!157224)))))))

(assert (= (and d!33492 res!87608) b!106360))

(assert (=> d!33492 m!156263))

(assert (=> b!106360 m!156153))

(assert (=> b!106120 d!33492))

(declare-fun d!33494 () Bool)

(assert (=> d!33494 (= (invariant!0 (currentBit!5109 thiss!1305) (currentByte!5114 thiss!1305) (size!2232 (buf!2608 (_2!4625 lt!157224)))) (and (bvsge (currentBit!5109 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5109 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5114 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5114 thiss!1305) (size!2232 (buf!2608 (_2!4625 lt!157224)))) (and (= (currentBit!5109 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5114 thiss!1305) (size!2232 (buf!2608 (_2!4625 lt!157224))))))))))

(assert (=> b!106109 d!33494))

(declare-fun d!33496 () Bool)

(assert (=> d!33496 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!106119 d!33496))

(declare-fun d!33498 () Bool)

(declare-fun e!69627 () Bool)

(assert (=> d!33498 e!69627))

(declare-fun res!87609 () Bool)

(assert (=> d!33498 (=> (not res!87609) (not e!69627))))

(declare-fun lt!157945 () (_ BitVec 64))

(declare-fun lt!157942 () (_ BitVec 64))

(declare-fun lt!157943 () (_ BitVec 64))

(assert (=> d!33498 (= res!87609 (= lt!157942 (bvsub lt!157943 lt!157945)))))

(assert (=> d!33498 (or (= (bvand lt!157943 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!157945 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!157943 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!157943 lt!157945) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33498 (= lt!157945 (remainingBits!0 ((_ sign_extend 32) (size!2232 (buf!2608 (_1!4624 lt!157225)))) ((_ sign_extend 32) (currentByte!5114 (_1!4624 lt!157225))) ((_ sign_extend 32) (currentBit!5109 (_1!4624 lt!157225)))))))

(declare-fun lt!157941 () (_ BitVec 64))

(declare-fun lt!157944 () (_ BitVec 64))

(assert (=> d!33498 (= lt!157943 (bvmul lt!157941 lt!157944))))

(assert (=> d!33498 (or (= lt!157941 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!157944 (bvsdiv (bvmul lt!157941 lt!157944) lt!157941)))))

(assert (=> d!33498 (= lt!157944 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33498 (= lt!157941 ((_ sign_extend 32) (size!2232 (buf!2608 (_1!4624 lt!157225)))))))

(assert (=> d!33498 (= lt!157942 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5114 (_1!4624 lt!157225))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5109 (_1!4624 lt!157225)))))))

(assert (=> d!33498 (invariant!0 (currentBit!5109 (_1!4624 lt!157225)) (currentByte!5114 (_1!4624 lt!157225)) (size!2232 (buf!2608 (_1!4624 lt!157225))))))

(assert (=> d!33498 (= (bitIndex!0 (size!2232 (buf!2608 (_1!4624 lt!157225))) (currentByte!5114 (_1!4624 lt!157225)) (currentBit!5109 (_1!4624 lt!157225))) lt!157942)))

(declare-fun b!106361 () Bool)

(declare-fun res!87610 () Bool)

(assert (=> b!106361 (=> (not res!87610) (not e!69627))))

(assert (=> b!106361 (= res!87610 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!157942))))

(declare-fun b!106362 () Bool)

(declare-fun lt!157940 () (_ BitVec 64))

(assert (=> b!106362 (= e!69627 (bvsle lt!157942 (bvmul lt!157940 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!106362 (or (= lt!157940 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!157940 #b0000000000000000000000000000000000000000000000000000000000001000) lt!157940)))))

(assert (=> b!106362 (= lt!157940 ((_ sign_extend 32) (size!2232 (buf!2608 (_1!4624 lt!157225)))))))

(assert (= (and d!33498 res!87609) b!106361))

(assert (= (and b!106361 res!87610) b!106362))

(declare-fun m!156719 () Bool)

(assert (=> d!33498 m!156719))

(declare-fun m!156721 () Bool)

(assert (=> d!33498 m!156721))

(assert (=> b!106108 d!33498))

(declare-fun d!33500 () Bool)

(declare-fun e!69628 () Bool)

(assert (=> d!33500 e!69628))

(declare-fun res!87611 () Bool)

(assert (=> d!33500 (=> (not res!87611) (not e!69628))))

(declare-fun lt!157946 () BitStream!3938)

(declare-fun lt!157947 () (_ BitVec 64))

(assert (=> d!33500 (= res!87611 (= (bvadd lt!157947 (bvsub (bitIndex!0 (size!2232 (buf!2608 thiss!1305)) (currentByte!5114 thiss!1305) (currentBit!5109 thiss!1305)) (bitIndex!0 (size!2232 (buf!2608 (_2!4625 lt!157204))) (currentByte!5114 (_2!4625 lt!157204)) (currentBit!5109 (_2!4625 lt!157204))))) (bitIndex!0 (size!2232 (buf!2608 lt!157946)) (currentByte!5114 lt!157946) (currentBit!5109 lt!157946))))))

(assert (=> d!33500 (or (not (= (bvand lt!157947 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2232 (buf!2608 thiss!1305)) (currentByte!5114 thiss!1305) (currentBit!5109 thiss!1305)) (bitIndex!0 (size!2232 (buf!2608 (_2!4625 lt!157204))) (currentByte!5114 (_2!4625 lt!157204)) (currentBit!5109 (_2!4625 lt!157204)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!157947 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!157947 (bvsub (bitIndex!0 (size!2232 (buf!2608 thiss!1305)) (currentByte!5114 thiss!1305) (currentBit!5109 thiss!1305)) (bitIndex!0 (size!2232 (buf!2608 (_2!4625 lt!157204))) (currentByte!5114 (_2!4625 lt!157204)) (currentBit!5109 (_2!4625 lt!157204))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33500 (= lt!157947 (bitIndex!0 (size!2232 (buf!2608 (_2!4626 lt!157217))) (currentByte!5114 (_2!4626 lt!157217)) (currentBit!5109 (_2!4626 lt!157217))))))

(assert (=> d!33500 (= lt!157946 (_2!4625 (moveBitIndex!0 (_2!4626 lt!157217) (bvsub (bitIndex!0 (size!2232 (buf!2608 thiss!1305)) (currentByte!5114 thiss!1305) (currentBit!5109 thiss!1305)) (bitIndex!0 (size!2232 (buf!2608 (_2!4625 lt!157204))) (currentByte!5114 (_2!4625 lt!157204)) (currentBit!5109 (_2!4625 lt!157204)))))))))

(assert (=> d!33500 (moveBitIndexPrecond!0 (_2!4626 lt!157217) (bvsub (bitIndex!0 (size!2232 (buf!2608 thiss!1305)) (currentByte!5114 thiss!1305) (currentBit!5109 thiss!1305)) (bitIndex!0 (size!2232 (buf!2608 (_2!4625 lt!157204))) (currentByte!5114 (_2!4625 lt!157204)) (currentBit!5109 (_2!4625 lt!157204)))))))

(assert (=> d!33500 (= (withMovedBitIndex!0 (_2!4626 lt!157217) (bvsub (bitIndex!0 (size!2232 (buf!2608 thiss!1305)) (currentByte!5114 thiss!1305) (currentBit!5109 thiss!1305)) (bitIndex!0 (size!2232 (buf!2608 (_2!4625 lt!157204))) (currentByte!5114 (_2!4625 lt!157204)) (currentBit!5109 (_2!4625 lt!157204))))) lt!157946)))

(declare-fun b!106363 () Bool)

(assert (=> b!106363 (= e!69628 (= (size!2232 (buf!2608 (_2!4626 lt!157217))) (size!2232 (buf!2608 lt!157946))))))

(assert (= (and d!33500 res!87611) b!106363))

(declare-fun m!156723 () Bool)

(assert (=> d!33500 m!156723))

(declare-fun m!156725 () Bool)

(assert (=> d!33500 m!156725))

(declare-fun m!156727 () Bool)

(assert (=> d!33500 m!156727))

(declare-fun m!156729 () Bool)

(assert (=> d!33500 m!156729))

(assert (=> b!106118 d!33500))

(declare-fun d!33502 () Bool)

(declare-fun e!69629 () Bool)

(assert (=> d!33502 e!69629))

(declare-fun res!87612 () Bool)

(assert (=> d!33502 (=> (not res!87612) (not e!69629))))

(declare-fun lt!157953 () (_ BitVec 64))

(declare-fun lt!157951 () (_ BitVec 64))

(declare-fun lt!157950 () (_ BitVec 64))

(assert (=> d!33502 (= res!87612 (= lt!157950 (bvsub lt!157951 lt!157953)))))

(assert (=> d!33502 (or (= (bvand lt!157951 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!157953 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!157951 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!157951 lt!157953) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33502 (= lt!157953 (remainingBits!0 ((_ sign_extend 32) (size!2232 (buf!2608 thiss!1305))) ((_ sign_extend 32) (currentByte!5114 thiss!1305)) ((_ sign_extend 32) (currentBit!5109 thiss!1305))))))

(declare-fun lt!157949 () (_ BitVec 64))

(declare-fun lt!157952 () (_ BitVec 64))

(assert (=> d!33502 (= lt!157951 (bvmul lt!157949 lt!157952))))

(assert (=> d!33502 (or (= lt!157949 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!157952 (bvsdiv (bvmul lt!157949 lt!157952) lt!157949)))))

(assert (=> d!33502 (= lt!157952 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33502 (= lt!157949 ((_ sign_extend 32) (size!2232 (buf!2608 thiss!1305))))))

(assert (=> d!33502 (= lt!157950 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5114 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5109 thiss!1305))))))

(assert (=> d!33502 (invariant!0 (currentBit!5109 thiss!1305) (currentByte!5114 thiss!1305) (size!2232 (buf!2608 thiss!1305)))))

(assert (=> d!33502 (= (bitIndex!0 (size!2232 (buf!2608 thiss!1305)) (currentByte!5114 thiss!1305) (currentBit!5109 thiss!1305)) lt!157950)))

(declare-fun b!106364 () Bool)

(declare-fun res!87613 () Bool)

(assert (=> b!106364 (=> (not res!87613) (not e!69629))))

(assert (=> b!106364 (= res!87613 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!157950))))

(declare-fun b!106365 () Bool)

(declare-fun lt!157948 () (_ BitVec 64))

(assert (=> b!106365 (= e!69629 (bvsle lt!157950 (bvmul lt!157948 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!106365 (or (= lt!157948 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!157948 #b0000000000000000000000000000000000000000000000000000000000001000) lt!157948)))))

(assert (=> b!106365 (= lt!157948 ((_ sign_extend 32) (size!2232 (buf!2608 thiss!1305))))))

(assert (= (and d!33502 res!87612) b!106364))

(assert (= (and b!106364 res!87613) b!106365))

(assert (=> d!33502 m!156227))

(declare-fun m!156731 () Bool)

(assert (=> d!33502 m!156731))

(assert (=> b!106118 d!33502))

(declare-fun d!33504 () Bool)

(declare-fun e!69630 () Bool)

(assert (=> d!33504 e!69630))

(declare-fun res!87614 () Bool)

(assert (=> d!33504 (=> (not res!87614) (not e!69630))))

(declare-fun lt!157959 () (_ BitVec 64))

(declare-fun lt!157956 () (_ BitVec 64))

(declare-fun lt!157957 () (_ BitVec 64))

(assert (=> d!33504 (= res!87614 (= lt!157956 (bvsub lt!157957 lt!157959)))))

(assert (=> d!33504 (or (= (bvand lt!157957 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!157959 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!157957 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!157957 lt!157959) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33504 (= lt!157959 (remainingBits!0 ((_ sign_extend 32) (size!2232 (buf!2608 (_2!4625 lt!157204)))) ((_ sign_extend 32) (currentByte!5114 (_2!4625 lt!157204))) ((_ sign_extend 32) (currentBit!5109 (_2!4625 lt!157204)))))))

(declare-fun lt!157955 () (_ BitVec 64))

(declare-fun lt!157958 () (_ BitVec 64))

(assert (=> d!33504 (= lt!157957 (bvmul lt!157955 lt!157958))))

(assert (=> d!33504 (or (= lt!157955 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!157958 (bvsdiv (bvmul lt!157955 lt!157958) lt!157955)))))

(assert (=> d!33504 (= lt!157958 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33504 (= lt!157955 ((_ sign_extend 32) (size!2232 (buf!2608 (_2!4625 lt!157204)))))))

(assert (=> d!33504 (= lt!157956 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5114 (_2!4625 lt!157204))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5109 (_2!4625 lt!157204)))))))

(assert (=> d!33504 (invariant!0 (currentBit!5109 (_2!4625 lt!157204)) (currentByte!5114 (_2!4625 lt!157204)) (size!2232 (buf!2608 (_2!4625 lt!157204))))))

(assert (=> d!33504 (= (bitIndex!0 (size!2232 (buf!2608 (_2!4625 lt!157204))) (currentByte!5114 (_2!4625 lt!157204)) (currentBit!5109 (_2!4625 lt!157204))) lt!157956)))

(declare-fun b!106366 () Bool)

(declare-fun res!87615 () Bool)

(assert (=> b!106366 (=> (not res!87615) (not e!69630))))

(assert (=> b!106366 (= res!87615 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!157956))))

(declare-fun b!106367 () Bool)

(declare-fun lt!157954 () (_ BitVec 64))

(assert (=> b!106367 (= e!69630 (bvsle lt!157956 (bvmul lt!157954 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!106367 (or (= lt!157954 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!157954 #b0000000000000000000000000000000000000000000000000000000000001000) lt!157954)))))

(assert (=> b!106367 (= lt!157954 ((_ sign_extend 32) (size!2232 (buf!2608 (_2!4625 lt!157204)))))))

(assert (= (and d!33504 res!87614) b!106366))

(assert (= (and b!106366 res!87615) b!106367))

(declare-fun m!156733 () Bool)

(assert (=> d!33504 m!156733))

(assert (=> d!33504 m!156213))

(assert (=> b!106118 d!33504))

(declare-fun d!33506 () Bool)

(assert (=> d!33506 (= (array_inv!2034 (buf!2608 thiss!1305)) (bvsge (size!2232 (buf!2608 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!106116 d!33506))

(declare-fun d!33508 () Bool)

(assert (=> d!33508 (= (invariant!0 (currentBit!5109 thiss!1305) (currentByte!5114 thiss!1305) (size!2232 (buf!2608 (_2!4625 lt!157204)))) (and (bvsge (currentBit!5109 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5109 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5114 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5114 thiss!1305) (size!2232 (buf!2608 (_2!4625 lt!157204)))) (and (= (currentBit!5109 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5114 thiss!1305) (size!2232 (buf!2608 (_2!4625 lt!157204))))))))))

(assert (=> b!106115 d!33508))

(assert (=> b!106114 d!33356))

(assert (=> b!106114 d!33502))

(declare-fun d!33510 () Bool)

(assert (=> d!33510 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5109 thiss!1305) (currentByte!5114 thiss!1305) (size!2232 (buf!2608 thiss!1305))))))

(declare-fun bs!8180 () Bool)

(assert (= bs!8180 d!33510))

(assert (=> bs!8180 m!156731))

(assert (=> start!21010 d!33510))

(push 1)

(assert (not d!33448))

(assert (not d!33500))

(assert (not b!106234))

(assert (not b!106348))

(assert (not d!33510))

(assert (not d!33488))

(assert (not d!33428))

(assert (not d!33504))

(assert (not d!33334))

(assert (not d!33444))

(assert (not b!106244))

(assert (not b!106237))

(assert (not b!106352))

(assert (not b!106242))

(assert (not d!33452))

(assert (not b!106300))

(assert (not d!33440))

(assert (not b!106347))

(assert (not b!106360))

(assert (not b!106301))

(assert (not b!106165))

(assert (not b!106357))

(assert (not d!33498))

(assert (not d!33368))

(assert (not b!106239))

(assert (not d!33396))

(assert (not b!106167))

(assert (not b!106353))

(assert (not d!33370))

(assert (not d!33356))

(assert (not b!106355))

(assert (not d!33450))

(assert (not d!33502))

(assert (not bm!1332))

(assert (not b!106235))

(assert (not d!33492))

