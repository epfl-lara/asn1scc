; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21598 () Bool)

(assert start!21598)

(declare-fun b!108792 () Bool)

(declare-fun res!89710 () Bool)

(declare-fun e!71229 () Bool)

(assert (=> b!108792 (=> (not res!89710) (not e!71229))))

(declare-datatypes ((array!4961 0))(
  ( (array!4962 (arr!2850 (Array (_ BitVec 32) (_ BitVec 8))) (size!2257 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3988 0))(
  ( (BitStream!3989 (buf!2648 array!4961) (currentByte!5184 (_ BitVec 32)) (currentBit!5179 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3988)

(declare-datatypes ((Unit!6655 0))(
  ( (Unit!6656) )
))
(declare-datatypes ((tuple2!8988 0))(
  ( (tuple2!8989 (_1!4751 Unit!6655) (_2!4751 BitStream!3988)) )
))
(declare-fun lt!164143 () tuple2!8988)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!108792 (= res!89710 (invariant!0 (currentBit!5179 thiss!1305) (currentByte!5184 thiss!1305) (size!2257 (buf!2648 (_2!4751 lt!164143)))))))

(declare-fun b!108793 () Bool)

(declare-fun e!71231 () Bool)

(assert (=> b!108793 (= e!71231 true)))

(declare-fun e!71224 () Bool)

(assert (=> b!108793 e!71224))

(declare-fun res!89717 () Bool)

(assert (=> b!108793 (=> (not res!89717) (not e!71224))))

(declare-fun lt!164145 () (_ BitVec 64))

(declare-fun lt!164126 () (_ BitVec 64))

(declare-datatypes ((tuple2!8990 0))(
  ( (tuple2!8991 (_1!4752 BitStream!3988) (_2!4752 BitStream!3988)) )
))
(declare-fun lt!164146 () tuple2!8990)

(declare-fun withMovedBitIndex!0 (BitStream!3988 (_ BitVec 64)) BitStream!3988)

(assert (=> b!108793 (= res!89717 (= (_1!4752 lt!164146) (withMovedBitIndex!0 (_2!4752 lt!164146) (bvsub lt!164126 lt!164145))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!108793 (= lt!164126 (bitIndex!0 (size!2257 (buf!2648 (_2!4751 lt!164143))) (currentByte!5184 (_2!4751 lt!164143)) (currentBit!5179 (_2!4751 lt!164143))))))

(declare-fun lt!164136 () tuple2!8990)

(declare-fun lt!164140 () (_ BitVec 64))

(assert (=> b!108793 (= (_1!4752 lt!164136) (withMovedBitIndex!0 (_2!4752 lt!164136) (bvsub lt!164140 lt!164145)))))

(declare-fun lt!164133 () tuple2!8988)

(assert (=> b!108793 (= lt!164145 (bitIndex!0 (size!2257 (buf!2648 (_2!4751 lt!164133))) (currentByte!5184 (_2!4751 lt!164133)) (currentBit!5179 (_2!4751 lt!164133))))))

(assert (=> b!108793 (= lt!164140 (bitIndex!0 (size!2257 (buf!2648 thiss!1305)) (currentByte!5184 thiss!1305) (currentBit!5179 thiss!1305)))))

(declare-datatypes ((tuple2!8992 0))(
  ( (tuple2!8993 (_1!4753 BitStream!3988) (_2!4753 (_ BitVec 64))) )
))
(declare-fun lt!164132 () tuple2!8992)

(declare-fun lt!164148 () tuple2!8992)

(assert (=> b!108793 (and (= (_2!4753 lt!164132) (_2!4753 lt!164148)) (= (_1!4753 lt!164132) (_1!4753 lt!164148)))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun lt!164147 () Unit!6655)

(declare-fun i!615 () (_ BitVec 32))

(declare-fun lt!164124 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3988 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6655)

(assert (=> b!108793 (= lt!164147 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4752 lt!164136) nBits!396 i!615 lt!164124))))

(declare-fun lt!164125 () (_ BitVec 64))

(declare-fun lt!164135 () BitStream!3988)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3988 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8992)

(assert (=> b!108793 (= lt!164148 (readNLeastSignificantBitsLoopPure!0 lt!164135 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!164125))))

(assert (=> b!108793 (= lt!164135 (withMovedBitIndex!0 (_1!4752 lt!164136) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!108794 () Bool)

(assert (=> b!108794 (= e!71229 (invariant!0 (currentBit!5179 thiss!1305) (currentByte!5184 thiss!1305) (size!2257 (buf!2648 (_2!4751 lt!164133)))))))

(declare-fun res!89714 () Bool)

(declare-fun e!71230 () Bool)

(assert (=> start!21598 (=> (not res!89714) (not e!71230))))

(assert (=> start!21598 (= res!89714 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21598 e!71230))

(assert (=> start!21598 true))

(declare-fun e!71225 () Bool)

(declare-fun inv!12 (BitStream!3988) Bool)

(assert (=> start!21598 (and (inv!12 thiss!1305) e!71225)))

(declare-fun b!108795 () Bool)

(declare-fun res!89716 () Bool)

(declare-fun e!71232 () Bool)

(assert (=> b!108795 (=> (not res!89716) (not e!71232))))

(declare-fun isPrefixOf!0 (BitStream!3988 BitStream!3988) Bool)

(assert (=> b!108795 (= res!89716 (isPrefixOf!0 thiss!1305 (_2!4751 lt!164143)))))

(declare-fun b!108796 () Bool)

(declare-fun array_inv!2059 (array!4961) Bool)

(assert (=> b!108796 (= e!71225 (array_inv!2059 (buf!2648 thiss!1305)))))

(declare-fun b!108797 () Bool)

(declare-fun res!89708 () Bool)

(declare-fun e!71227 () Bool)

(assert (=> b!108797 (=> (not res!89708) (not e!71227))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!108797 (= res!89708 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!108798 () Bool)

(assert (=> b!108798 (= e!71227 (not e!71231))))

(declare-fun res!89718 () Bool)

(assert (=> b!108798 (=> res!89718 e!71231)))

(declare-fun lt!164149 () tuple2!8992)

(assert (=> b!108798 (= res!89718 (not (= (_1!4753 lt!164149) (_2!4752 lt!164146))))))

(assert (=> b!108798 (= lt!164149 (readNLeastSignificantBitsLoopPure!0 (_1!4752 lt!164146) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!164125))))

(declare-fun lt!164127 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!108798 (validate_offset_bits!1 ((_ sign_extend 32) (size!2257 (buf!2648 (_2!4751 lt!164133)))) ((_ sign_extend 32) (currentByte!5184 (_2!4751 lt!164143))) ((_ sign_extend 32) (currentBit!5179 (_2!4751 lt!164143))) lt!164127)))

(declare-fun lt!164134 () Unit!6655)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3988 array!4961 (_ BitVec 64)) Unit!6655)

(assert (=> b!108798 (= lt!164134 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4751 lt!164143) (buf!2648 (_2!4751 lt!164133)) lt!164127))))

(assert (=> b!108798 (= lt!164127 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!8994 0))(
  ( (tuple2!8995 (_1!4754 BitStream!3988) (_2!4754 Bool)) )
))
(declare-fun lt!164150 () tuple2!8994)

(declare-fun lt!164129 () (_ BitVec 64))

(assert (=> b!108798 (= lt!164125 (bvor lt!164124 (ite (_2!4754 lt!164150) lt!164129 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108798 (= lt!164132 (readNLeastSignificantBitsLoopPure!0 (_1!4752 lt!164136) nBits!396 i!615 lt!164124))))

(declare-fun lt!164138 () (_ BitVec 64))

(assert (=> b!108798 (validate_offset_bits!1 ((_ sign_extend 32) (size!2257 (buf!2648 (_2!4751 lt!164133)))) ((_ sign_extend 32) (currentByte!5184 thiss!1305)) ((_ sign_extend 32) (currentBit!5179 thiss!1305)) lt!164138)))

(declare-fun lt!164122 () Unit!6655)

(assert (=> b!108798 (= lt!164122 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2648 (_2!4751 lt!164133)) lt!164138))))

(assert (=> b!108798 (= lt!164124 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!164142 () Bool)

(assert (=> b!108798 (= (_2!4754 lt!164150) lt!164142)))

(declare-fun readBitPure!0 (BitStream!3988) tuple2!8994)

(assert (=> b!108798 (= lt!164150 (readBitPure!0 (_1!4752 lt!164136)))))

(declare-fun reader!0 (BitStream!3988 BitStream!3988) tuple2!8990)

(assert (=> b!108798 (= lt!164146 (reader!0 (_2!4751 lt!164143) (_2!4751 lt!164133)))))

(assert (=> b!108798 (= lt!164136 (reader!0 thiss!1305 (_2!4751 lt!164133)))))

(declare-fun e!71226 () Bool)

(assert (=> b!108798 e!71226))

(declare-fun res!89711 () Bool)

(assert (=> b!108798 (=> (not res!89711) (not e!71226))))

(declare-fun lt!164131 () tuple2!8994)

(declare-fun lt!164128 () tuple2!8994)

(assert (=> b!108798 (= res!89711 (= (bitIndex!0 (size!2257 (buf!2648 (_1!4754 lt!164131))) (currentByte!5184 (_1!4754 lt!164131)) (currentBit!5179 (_1!4754 lt!164131))) (bitIndex!0 (size!2257 (buf!2648 (_1!4754 lt!164128))) (currentByte!5184 (_1!4754 lt!164128)) (currentBit!5179 (_1!4754 lt!164128)))))))

(declare-fun lt!164144 () Unit!6655)

(declare-fun lt!164141 () BitStream!3988)

(declare-fun readBitPrefixLemma!0 (BitStream!3988 BitStream!3988) Unit!6655)

(assert (=> b!108798 (= lt!164144 (readBitPrefixLemma!0 lt!164141 (_2!4751 lt!164133)))))

(assert (=> b!108798 (= lt!164128 (readBitPure!0 (BitStream!3989 (buf!2648 (_2!4751 lt!164133)) (currentByte!5184 thiss!1305) (currentBit!5179 thiss!1305))))))

(assert (=> b!108798 (= lt!164131 (readBitPure!0 lt!164141))))

(assert (=> b!108798 (= lt!164141 (BitStream!3989 (buf!2648 (_2!4751 lt!164143)) (currentByte!5184 thiss!1305) (currentBit!5179 thiss!1305)))))

(assert (=> b!108798 e!71229))

(declare-fun res!89713 () Bool)

(assert (=> b!108798 (=> (not res!89713) (not e!71229))))

(assert (=> b!108798 (= res!89713 (isPrefixOf!0 thiss!1305 (_2!4751 lt!164133)))))

(declare-fun lt!164123 () Unit!6655)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3988 BitStream!3988 BitStream!3988) Unit!6655)

(assert (=> b!108798 (= lt!164123 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4751 lt!164143) (_2!4751 lt!164133)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3988 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8988)

(assert (=> b!108798 (= lt!164133 (appendNLeastSignificantBitsLoop!0 (_2!4751 lt!164143) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!71228 () Bool)

(assert (=> b!108798 e!71228))

(declare-fun res!89715 () Bool)

(assert (=> b!108798 (=> (not res!89715) (not e!71228))))

(assert (=> b!108798 (= res!89715 (= (size!2257 (buf!2648 thiss!1305)) (size!2257 (buf!2648 (_2!4751 lt!164143)))))))

(declare-fun appendBit!0 (BitStream!3988 Bool) tuple2!8988)

(assert (=> b!108798 (= lt!164143 (appendBit!0 thiss!1305 lt!164142))))

(assert (=> b!108798 (= lt!164142 (not (= (bvand v!199 lt!164129) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108798 (= lt!164129 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!108799 () Bool)

(declare-fun res!89709 () Bool)

(assert (=> b!108799 (=> (not res!89709) (not e!71227))))

(assert (=> b!108799 (= res!89709 (bvslt i!615 nBits!396))))

(declare-fun b!108800 () Bool)

(assert (=> b!108800 (= e!71228 e!71232)))

(declare-fun res!89707 () Bool)

(assert (=> b!108800 (=> (not res!89707) (not e!71232))))

(declare-fun lt!164139 () (_ BitVec 64))

(declare-fun lt!164130 () (_ BitVec 64))

(assert (=> b!108800 (= res!89707 (= lt!164139 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!164130)))))

(assert (=> b!108800 (= lt!164139 (bitIndex!0 (size!2257 (buf!2648 (_2!4751 lt!164143))) (currentByte!5184 (_2!4751 lt!164143)) (currentBit!5179 (_2!4751 lt!164143))))))

(assert (=> b!108800 (= lt!164130 (bitIndex!0 (size!2257 (buf!2648 thiss!1305)) (currentByte!5184 thiss!1305) (currentBit!5179 thiss!1305)))))

(declare-fun b!108801 () Bool)

(assert (=> b!108801 (= e!71226 (= (_2!4754 lt!164131) (_2!4754 lt!164128)))))

(declare-fun b!108802 () Bool)

(declare-fun e!71234 () Bool)

(declare-fun lt!164137 () tuple2!8994)

(assert (=> b!108802 (= e!71234 (= (bitIndex!0 (size!2257 (buf!2648 (_1!4754 lt!164137))) (currentByte!5184 (_1!4754 lt!164137)) (currentBit!5179 (_1!4754 lt!164137))) lt!164139))))

(declare-fun b!108803 () Bool)

(assert (=> b!108803 (= e!71230 e!71227)))

(declare-fun res!89719 () Bool)

(assert (=> b!108803 (=> (not res!89719) (not e!71227))))

(assert (=> b!108803 (= res!89719 (validate_offset_bits!1 ((_ sign_extend 32) (size!2257 (buf!2648 thiss!1305))) ((_ sign_extend 32) (currentByte!5184 thiss!1305)) ((_ sign_extend 32) (currentBit!5179 thiss!1305)) lt!164138))))

(assert (=> b!108803 (= lt!164138 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!108804 () Bool)

(assert (=> b!108804 (= e!71224 (and (= lt!164140 (bvsub lt!164126 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!4752 lt!164146) lt!164135)) (and (= (_2!4753 lt!164132) (_2!4753 lt!164149)) (= (_1!4753 lt!164132) (_2!4752 lt!164136))))))))

(declare-fun b!108805 () Bool)

(assert (=> b!108805 (= e!71232 e!71234)))

(declare-fun res!89712 () Bool)

(assert (=> b!108805 (=> (not res!89712) (not e!71234))))

(assert (=> b!108805 (= res!89712 (and (= (_2!4754 lt!164137) lt!164142) (= (_1!4754 lt!164137) (_2!4751 lt!164143))))))

(declare-fun readerFrom!0 (BitStream!3988 (_ BitVec 32) (_ BitVec 32)) BitStream!3988)

(assert (=> b!108805 (= lt!164137 (readBitPure!0 (readerFrom!0 (_2!4751 lt!164143) (currentBit!5179 thiss!1305) (currentByte!5184 thiss!1305))))))

(assert (= (and start!21598 res!89714) b!108803))

(assert (= (and b!108803 res!89719) b!108797))

(assert (= (and b!108797 res!89708) b!108799))

(assert (= (and b!108799 res!89709) b!108798))

(assert (= (and b!108798 res!89715) b!108800))

(assert (= (and b!108800 res!89707) b!108795))

(assert (= (and b!108795 res!89716) b!108805))

(assert (= (and b!108805 res!89712) b!108802))

(assert (= (and b!108798 res!89713) b!108792))

(assert (= (and b!108792 res!89710) b!108794))

(assert (= (and b!108798 res!89711) b!108801))

(assert (= (and b!108798 (not res!89718)) b!108793))

(assert (= (and b!108793 res!89717) b!108804))

(assert (= start!21598 b!108796))

(declare-fun m!161321 () Bool)

(assert (=> b!108792 m!161321))

(declare-fun m!161323 () Bool)

(assert (=> b!108794 m!161323))

(declare-fun m!161325 () Bool)

(assert (=> b!108797 m!161325))

(declare-fun m!161327 () Bool)

(assert (=> b!108798 m!161327))

(declare-fun m!161329 () Bool)

(assert (=> b!108798 m!161329))

(declare-fun m!161331 () Bool)

(assert (=> b!108798 m!161331))

(declare-fun m!161333 () Bool)

(assert (=> b!108798 m!161333))

(declare-fun m!161335 () Bool)

(assert (=> b!108798 m!161335))

(declare-fun m!161337 () Bool)

(assert (=> b!108798 m!161337))

(declare-fun m!161339 () Bool)

(assert (=> b!108798 m!161339))

(declare-fun m!161341 () Bool)

(assert (=> b!108798 m!161341))

(declare-fun m!161343 () Bool)

(assert (=> b!108798 m!161343))

(declare-fun m!161345 () Bool)

(assert (=> b!108798 m!161345))

(declare-fun m!161347 () Bool)

(assert (=> b!108798 m!161347))

(declare-fun m!161349 () Bool)

(assert (=> b!108798 m!161349))

(declare-fun m!161351 () Bool)

(assert (=> b!108798 m!161351))

(declare-fun m!161353 () Bool)

(assert (=> b!108798 m!161353))

(declare-fun m!161355 () Bool)

(assert (=> b!108798 m!161355))

(declare-fun m!161357 () Bool)

(assert (=> b!108798 m!161357))

(declare-fun m!161359 () Bool)

(assert (=> b!108798 m!161359))

(declare-fun m!161361 () Bool)

(assert (=> b!108798 m!161361))

(declare-fun m!161363 () Bool)

(assert (=> b!108798 m!161363))

(declare-fun m!161365 () Bool)

(assert (=> b!108802 m!161365))

(declare-fun m!161367 () Bool)

(assert (=> b!108793 m!161367))

(declare-fun m!161369 () Bool)

(assert (=> b!108793 m!161369))

(declare-fun m!161371 () Bool)

(assert (=> b!108793 m!161371))

(declare-fun m!161373 () Bool)

(assert (=> b!108793 m!161373))

(declare-fun m!161375 () Bool)

(assert (=> b!108793 m!161375))

(declare-fun m!161377 () Bool)

(assert (=> b!108793 m!161377))

(declare-fun m!161379 () Bool)

(assert (=> b!108793 m!161379))

(declare-fun m!161381 () Bool)

(assert (=> b!108793 m!161381))

(declare-fun m!161383 () Bool)

(assert (=> b!108795 m!161383))

(assert (=> b!108800 m!161375))

(assert (=> b!108800 m!161381))

(declare-fun m!161385 () Bool)

(assert (=> b!108796 m!161385))

(declare-fun m!161387 () Bool)

(assert (=> start!21598 m!161387))

(declare-fun m!161389 () Bool)

(assert (=> b!108803 m!161389))

(declare-fun m!161391 () Bool)

(assert (=> b!108805 m!161391))

(assert (=> b!108805 m!161391))

(declare-fun m!161393 () Bool)

(assert (=> b!108805 m!161393))

(push 1)

(assert (not b!108805))

(assert (not b!108793))

(assert (not b!108802))

(assert (not b!108795))

(assert (not b!108796))

(assert (not b!108794))

(assert (not start!21598))

(assert (not b!108797))

(assert (not b!108803))

(assert (not b!108800))

(assert (not b!108792))

(assert (not b!108798))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

