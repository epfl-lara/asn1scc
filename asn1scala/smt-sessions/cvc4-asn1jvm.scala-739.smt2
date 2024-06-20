; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20606 () Bool)

(assert start!20606)

(declare-fun b!104183 () Bool)

(declare-fun e!68255 () Bool)

(declare-datatypes ((array!4864 0))(
  ( (array!4865 (arr!2813 (Array (_ BitVec 32) (_ BitVec 8))) (size!2220 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3914 0))(
  ( (BitStream!3915 (buf!2586 array!4864) (currentByte!5071 (_ BitVec 32)) (currentBit!5066 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3914)

(declare-fun array_inv!2022 (array!4864) Bool)

(assert (=> b!104183 (= e!68255 (array_inv!2022 (buf!2586 thiss!1305)))))

(declare-fun b!104184 () Bool)

(declare-fun res!85774 () Bool)

(declare-fun e!68250 () Bool)

(assert (=> b!104184 (=> (not res!85774) (not e!68250))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!104184 (= res!85774 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!104185 () Bool)

(declare-fun e!68249 () Bool)

(declare-datatypes ((tuple2!8606 0))(
  ( (tuple2!8607 (_1!4558 BitStream!3914) (_2!4558 Bool)) )
))
(declare-fun lt!152663 () tuple2!8606)

(declare-fun lt!152669 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!104185 (= e!68249 (= (bitIndex!0 (size!2220 (buf!2586 (_1!4558 lt!152663))) (currentByte!5071 (_1!4558 lt!152663)) (currentBit!5066 (_1!4558 lt!152663))) lt!152669))))

(declare-fun b!104186 () Bool)

(declare-fun e!68251 () Bool)

(assert (=> b!104186 (= e!68250 (not e!68251))))

(declare-fun res!85783 () Bool)

(assert (=> b!104186 (=> res!85783 e!68251)))

(declare-fun lt!152661 () (_ BitVec 64))

(declare-fun i!615 () (_ BitVec 32))

(declare-datatypes ((tuple2!8608 0))(
  ( (tuple2!8609 (_1!4559 BitStream!3914) (_2!4559 BitStream!3914)) )
))
(declare-fun lt!152666 () tuple2!8608)

(declare-datatypes ((tuple2!8610 0))(
  ( (tuple2!8611 (_1!4560 BitStream!3914) (_2!4560 (_ BitVec 64))) )
))
(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3914 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8610)

(assert (=> b!104186 (= res!85783 (not (= (_1!4560 (readNLeastSignificantBitsLoopPure!0 (_1!4559 lt!152666) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152661)) (_2!4559 lt!152666))))))

(declare-datatypes ((Unit!6384 0))(
  ( (Unit!6385) )
))
(declare-datatypes ((tuple2!8612 0))(
  ( (tuple2!8613 (_1!4561 Unit!6384) (_2!4561 BitStream!3914)) )
))
(declare-fun lt!152680 () tuple2!8612)

(declare-fun lt!152672 () tuple2!8612)

(declare-fun lt!152668 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!104186 (validate_offset_bits!1 ((_ sign_extend 32) (size!2220 (buf!2586 (_2!4561 lt!152680)))) ((_ sign_extend 32) (currentByte!5071 (_2!4561 lt!152672))) ((_ sign_extend 32) (currentBit!5066 (_2!4561 lt!152672))) lt!152668)))

(declare-fun lt!152660 () Unit!6384)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3914 array!4864 (_ BitVec 64)) Unit!6384)

(assert (=> b!104186 (= lt!152660 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4561 lt!152672) (buf!2586 (_2!4561 lt!152680)) lt!152668))))

(assert (=> b!104186 (= lt!152668 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!152657 () tuple2!8606)

(declare-fun lt!152664 () (_ BitVec 64))

(declare-fun lt!152677 () (_ BitVec 64))

(assert (=> b!104186 (= lt!152661 (bvor lt!152677 (ite (_2!4558 lt!152657) lt!152664 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!152670 () tuple2!8608)

(declare-fun lt!152675 () tuple2!8610)

(assert (=> b!104186 (= lt!152675 (readNLeastSignificantBitsLoopPure!0 (_1!4559 lt!152670) nBits!396 i!615 lt!152677))))

(declare-fun lt!152659 () (_ BitVec 64))

(assert (=> b!104186 (validate_offset_bits!1 ((_ sign_extend 32) (size!2220 (buf!2586 (_2!4561 lt!152680)))) ((_ sign_extend 32) (currentByte!5071 thiss!1305)) ((_ sign_extend 32) (currentBit!5066 thiss!1305)) lt!152659)))

(declare-fun lt!152667 () Unit!6384)

(assert (=> b!104186 (= lt!152667 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2586 (_2!4561 lt!152680)) lt!152659))))

(assert (=> b!104186 (= lt!152677 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!152674 () Bool)

(assert (=> b!104186 (= (_2!4558 lt!152657) lt!152674)))

(declare-fun readBitPure!0 (BitStream!3914) tuple2!8606)

(assert (=> b!104186 (= lt!152657 (readBitPure!0 (_1!4559 lt!152670)))))

(declare-fun reader!0 (BitStream!3914 BitStream!3914) tuple2!8608)

(assert (=> b!104186 (= lt!152666 (reader!0 (_2!4561 lt!152672) (_2!4561 lt!152680)))))

(assert (=> b!104186 (= lt!152670 (reader!0 thiss!1305 (_2!4561 lt!152680)))))

(declare-fun e!68252 () Bool)

(assert (=> b!104186 e!68252))

(declare-fun res!85776 () Bool)

(assert (=> b!104186 (=> (not res!85776) (not e!68252))))

(declare-fun lt!152673 () tuple2!8606)

(declare-fun lt!152658 () tuple2!8606)

(assert (=> b!104186 (= res!85776 (= (bitIndex!0 (size!2220 (buf!2586 (_1!4558 lt!152673))) (currentByte!5071 (_1!4558 lt!152673)) (currentBit!5066 (_1!4558 lt!152673))) (bitIndex!0 (size!2220 (buf!2586 (_1!4558 lt!152658))) (currentByte!5071 (_1!4558 lt!152658)) (currentBit!5066 (_1!4558 lt!152658)))))))

(declare-fun lt!152676 () Unit!6384)

(declare-fun lt!152679 () BitStream!3914)

(declare-fun readBitPrefixLemma!0 (BitStream!3914 BitStream!3914) Unit!6384)

(assert (=> b!104186 (= lt!152676 (readBitPrefixLemma!0 lt!152679 (_2!4561 lt!152680)))))

(assert (=> b!104186 (= lt!152658 (readBitPure!0 (BitStream!3915 (buf!2586 (_2!4561 lt!152680)) (currentByte!5071 thiss!1305) (currentBit!5066 thiss!1305))))))

(assert (=> b!104186 (= lt!152673 (readBitPure!0 lt!152679))))

(assert (=> b!104186 (= lt!152679 (BitStream!3915 (buf!2586 (_2!4561 lt!152672)) (currentByte!5071 thiss!1305) (currentBit!5066 thiss!1305)))))

(declare-fun e!68254 () Bool)

(assert (=> b!104186 e!68254))

(declare-fun res!85779 () Bool)

(assert (=> b!104186 (=> (not res!85779) (not e!68254))))

(declare-fun isPrefixOf!0 (BitStream!3914 BitStream!3914) Bool)

(assert (=> b!104186 (= res!85779 (isPrefixOf!0 thiss!1305 (_2!4561 lt!152680)))))

(declare-fun lt!152665 () Unit!6384)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3914 BitStream!3914 BitStream!3914) Unit!6384)

(assert (=> b!104186 (= lt!152665 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4561 lt!152672) (_2!4561 lt!152680)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3914 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8612)

(assert (=> b!104186 (= lt!152680 (appendNLeastSignificantBitsLoop!0 (_2!4561 lt!152672) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!68248 () Bool)

(assert (=> b!104186 e!68248))

(declare-fun res!85784 () Bool)

(assert (=> b!104186 (=> (not res!85784) (not e!68248))))

(assert (=> b!104186 (= res!85784 (= (size!2220 (buf!2586 thiss!1305)) (size!2220 (buf!2586 (_2!4561 lt!152672)))))))

(declare-fun appendBit!0 (BitStream!3914 Bool) tuple2!8612)

(assert (=> b!104186 (= lt!152672 (appendBit!0 thiss!1305 lt!152674))))

(assert (=> b!104186 (= lt!152674 (not (= (bvand v!199 lt!152664) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104186 (= lt!152664 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!104187 () Bool)

(declare-fun res!85782 () Bool)

(declare-fun e!68256 () Bool)

(assert (=> b!104187 (=> (not res!85782) (not e!68256))))

(assert (=> b!104187 (= res!85782 (isPrefixOf!0 thiss!1305 (_2!4561 lt!152672)))))

(declare-fun b!104188 () Bool)

(declare-fun res!85778 () Bool)

(assert (=> b!104188 (=> (not res!85778) (not e!68254))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!104188 (= res!85778 (invariant!0 (currentBit!5066 thiss!1305) (currentByte!5071 thiss!1305) (size!2220 (buf!2586 (_2!4561 lt!152672)))))))

(declare-fun res!85780 () Bool)

(declare-fun e!68247 () Bool)

(assert (=> start!20606 (=> (not res!85780) (not e!68247))))

(assert (=> start!20606 (= res!85780 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20606 e!68247))

(assert (=> start!20606 true))

(declare-fun inv!12 (BitStream!3914) Bool)

(assert (=> start!20606 (and (inv!12 thiss!1305) e!68255)))

(declare-fun b!104189 () Bool)

(assert (=> b!104189 (= e!68252 (= (_2!4558 lt!152673) (_2!4558 lt!152658)))))

(declare-fun b!104190 () Bool)

(assert (=> b!104190 (= e!68256 e!68249)))

(declare-fun res!85773 () Bool)

(assert (=> b!104190 (=> (not res!85773) (not e!68249))))

(assert (=> b!104190 (= res!85773 (and (= (_2!4558 lt!152663) lt!152674) (= (_1!4558 lt!152663) (_2!4561 lt!152672))))))

(declare-fun readerFrom!0 (BitStream!3914 (_ BitVec 32) (_ BitVec 32)) BitStream!3914)

(assert (=> b!104190 (= lt!152663 (readBitPure!0 (readerFrom!0 (_2!4561 lt!152672) (currentBit!5066 thiss!1305) (currentByte!5071 thiss!1305))))))

(declare-fun b!104191 () Bool)

(assert (=> b!104191 (= e!68248 e!68256)))

(declare-fun res!85775 () Bool)

(assert (=> b!104191 (=> (not res!85775) (not e!68256))))

(declare-fun lt!152662 () (_ BitVec 64))

(assert (=> b!104191 (= res!85775 (= lt!152669 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!152662)))))

(assert (=> b!104191 (= lt!152669 (bitIndex!0 (size!2220 (buf!2586 (_2!4561 lt!152672))) (currentByte!5071 (_2!4561 lt!152672)) (currentBit!5066 (_2!4561 lt!152672))))))

(assert (=> b!104191 (= lt!152662 (bitIndex!0 (size!2220 (buf!2586 thiss!1305)) (currentByte!5071 thiss!1305) (currentBit!5066 thiss!1305)))))

(declare-fun b!104192 () Bool)

(assert (=> b!104192 (= e!68247 e!68250)))

(declare-fun res!85777 () Bool)

(assert (=> b!104192 (=> (not res!85777) (not e!68250))))

(assert (=> b!104192 (= res!85777 (validate_offset_bits!1 ((_ sign_extend 32) (size!2220 (buf!2586 thiss!1305))) ((_ sign_extend 32) (currentByte!5071 thiss!1305)) ((_ sign_extend 32) (currentBit!5066 thiss!1305)) lt!152659))))

(assert (=> b!104192 (= lt!152659 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!104193 () Bool)

(assert (=> b!104193 (= e!68251 (invariant!0 (currentBit!5066 thiss!1305) (currentByte!5071 thiss!1305) (size!2220 (buf!2586 thiss!1305))))))

(declare-fun lt!152678 () tuple2!8610)

(assert (=> b!104193 (and (= (_2!4560 lt!152675) (_2!4560 lt!152678)) (= (_1!4560 lt!152675) (_1!4560 lt!152678)))))

(declare-fun lt!152671 () Unit!6384)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3914 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6384)

(assert (=> b!104193 (= lt!152671 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4559 lt!152670) nBits!396 i!615 lt!152677))))

(declare-fun withMovedBitIndex!0 (BitStream!3914 (_ BitVec 64)) BitStream!3914)

(assert (=> b!104193 (= lt!152678 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4559 lt!152670) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152661))))

(declare-fun b!104194 () Bool)

(assert (=> b!104194 (= e!68254 (invariant!0 (currentBit!5066 thiss!1305) (currentByte!5071 thiss!1305) (size!2220 (buf!2586 (_2!4561 lt!152680)))))))

(declare-fun b!104195 () Bool)

(declare-fun res!85781 () Bool)

(assert (=> b!104195 (=> (not res!85781) (not e!68250))))

(assert (=> b!104195 (= res!85781 (bvslt i!615 nBits!396))))

(assert (= (and start!20606 res!85780) b!104192))

(assert (= (and b!104192 res!85777) b!104184))

(assert (= (and b!104184 res!85774) b!104195))

(assert (= (and b!104195 res!85781) b!104186))

(assert (= (and b!104186 res!85784) b!104191))

(assert (= (and b!104191 res!85775) b!104187))

(assert (= (and b!104187 res!85782) b!104190))

(assert (= (and b!104190 res!85773) b!104185))

(assert (= (and b!104186 res!85779) b!104188))

(assert (= (and b!104188 res!85778) b!104194))

(assert (= (and b!104186 res!85776) b!104189))

(assert (= (and b!104186 (not res!85783)) b!104193))

(assert (= start!20606 b!104183))

(declare-fun m!152253 () Bool)

(assert (=> b!104185 m!152253))

(declare-fun m!152255 () Bool)

(assert (=> b!104192 m!152255))

(declare-fun m!152257 () Bool)

(assert (=> b!104184 m!152257))

(declare-fun m!152259 () Bool)

(assert (=> b!104194 m!152259))

(declare-fun m!152261 () Bool)

(assert (=> b!104188 m!152261))

(declare-fun m!152263 () Bool)

(assert (=> b!104191 m!152263))

(declare-fun m!152265 () Bool)

(assert (=> b!104191 m!152265))

(declare-fun m!152267 () Bool)

(assert (=> b!104187 m!152267))

(declare-fun m!152269 () Bool)

(assert (=> b!104183 m!152269))

(declare-fun m!152271 () Bool)

(assert (=> b!104190 m!152271))

(assert (=> b!104190 m!152271))

(declare-fun m!152273 () Bool)

(assert (=> b!104190 m!152273))

(declare-fun m!152275 () Bool)

(assert (=> b!104186 m!152275))

(declare-fun m!152277 () Bool)

(assert (=> b!104186 m!152277))

(declare-fun m!152279 () Bool)

(assert (=> b!104186 m!152279))

(declare-fun m!152281 () Bool)

(assert (=> b!104186 m!152281))

(declare-fun m!152283 () Bool)

(assert (=> b!104186 m!152283))

(declare-fun m!152285 () Bool)

(assert (=> b!104186 m!152285))

(declare-fun m!152287 () Bool)

(assert (=> b!104186 m!152287))

(declare-fun m!152289 () Bool)

(assert (=> b!104186 m!152289))

(declare-fun m!152291 () Bool)

(assert (=> b!104186 m!152291))

(declare-fun m!152293 () Bool)

(assert (=> b!104186 m!152293))

(declare-fun m!152295 () Bool)

(assert (=> b!104186 m!152295))

(declare-fun m!152297 () Bool)

(assert (=> b!104186 m!152297))

(declare-fun m!152299 () Bool)

(assert (=> b!104186 m!152299))

(declare-fun m!152301 () Bool)

(assert (=> b!104186 m!152301))

(declare-fun m!152303 () Bool)

(assert (=> b!104186 m!152303))

(declare-fun m!152305 () Bool)

(assert (=> b!104186 m!152305))

(declare-fun m!152307 () Bool)

(assert (=> b!104186 m!152307))

(declare-fun m!152309 () Bool)

(assert (=> b!104186 m!152309))

(declare-fun m!152311 () Bool)

(assert (=> b!104186 m!152311))

(declare-fun m!152313 () Bool)

(assert (=> b!104193 m!152313))

(declare-fun m!152315 () Bool)

(assert (=> b!104193 m!152315))

(declare-fun m!152317 () Bool)

(assert (=> b!104193 m!152317))

(assert (=> b!104193 m!152317))

(declare-fun m!152319 () Bool)

(assert (=> b!104193 m!152319))

(declare-fun m!152321 () Bool)

(assert (=> start!20606 m!152321))

(push 1)

(assert (not b!104184))

(assert (not start!20606))

(assert (not b!104191))

(assert (not b!104190))

(assert (not b!104193))

(assert (not b!104187))

(assert (not b!104186))

(assert (not b!104194))

(assert (not b!104188))

(assert (not b!104185))

(assert (not b!104183))

(assert (not b!104192))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

