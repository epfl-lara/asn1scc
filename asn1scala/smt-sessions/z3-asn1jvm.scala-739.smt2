; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20604 () Bool)

(assert start!20604)

(declare-fun b!104144 () Bool)

(declare-fun e!68217 () Bool)

(declare-datatypes ((array!4862 0))(
  ( (array!4863 (arr!2812 (Array (_ BitVec 32) (_ BitVec 8))) (size!2219 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3912 0))(
  ( (BitStream!3913 (buf!2585 array!4862) (currentByte!5070 (_ BitVec 32)) (currentBit!5065 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8598 0))(
  ( (tuple2!8599 (_1!4554 BitStream!3912) (_2!4554 Bool)) )
))
(declare-fun lt!152586 () tuple2!8598)

(declare-fun lt!152591 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!104144 (= e!68217 (= (bitIndex!0 (size!2219 (buf!2585 (_1!4554 lt!152586))) (currentByte!5070 (_1!4554 lt!152586)) (currentBit!5065 (_1!4554 lt!152586))) lt!152591))))

(declare-fun b!104146 () Bool)

(declare-fun res!85747 () Bool)

(declare-fun e!68219 () Bool)

(assert (=> b!104146 (=> (not res!85747) (not e!68219))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!104146 (= res!85747 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!104147 () Bool)

(declare-fun res!85738 () Bool)

(declare-fun e!68218 () Bool)

(assert (=> b!104147 (=> (not res!85738) (not e!68218))))

(declare-fun thiss!1305 () BitStream!3912)

(declare-datatypes ((Unit!6382 0))(
  ( (Unit!6383) )
))
(declare-datatypes ((tuple2!8600 0))(
  ( (tuple2!8601 (_1!4555 Unit!6382) (_2!4555 BitStream!3912)) )
))
(declare-fun lt!152595 () tuple2!8600)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!104147 (= res!85738 (invariant!0 (currentBit!5065 thiss!1305) (currentByte!5070 thiss!1305) (size!2219 (buf!2585 (_2!4555 lt!152595)))))))

(declare-fun b!104148 () Bool)

(declare-fun res!85740 () Bool)

(assert (=> b!104148 (=> (not res!85740) (not e!68219))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!104148 (= res!85740 (bvslt i!615 nBits!396))))

(declare-fun b!104149 () Bool)

(declare-fun e!68222 () Bool)

(assert (=> b!104149 (= e!68219 (not e!68222))))

(declare-fun res!85739 () Bool)

(assert (=> b!104149 (=> res!85739 e!68222)))

(declare-fun lt!152602 () (_ BitVec 64))

(declare-datatypes ((tuple2!8602 0))(
  ( (tuple2!8603 (_1!4556 BitStream!3912) (_2!4556 BitStream!3912)) )
))
(declare-fun lt!152585 () tuple2!8602)

(declare-datatypes ((tuple2!8604 0))(
  ( (tuple2!8605 (_1!4557 BitStream!3912) (_2!4557 (_ BitVec 64))) )
))
(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3912 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8604)

(assert (=> b!104149 (= res!85739 (not (= (_1!4557 (readNLeastSignificantBitsLoopPure!0 (_1!4556 lt!152585) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152602)) (_2!4556 lt!152585))))))

(declare-fun lt!152608 () tuple2!8600)

(declare-fun lt!152606 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!104149 (validate_offset_bits!1 ((_ sign_extend 32) (size!2219 (buf!2585 (_2!4555 lt!152608)))) ((_ sign_extend 32) (currentByte!5070 (_2!4555 lt!152595))) ((_ sign_extend 32) (currentBit!5065 (_2!4555 lt!152595))) lt!152606)))

(declare-fun lt!152587 () Unit!6382)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3912 array!4862 (_ BitVec 64)) Unit!6382)

(assert (=> b!104149 (= lt!152587 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4555 lt!152595) (buf!2585 (_2!4555 lt!152608)) lt!152606))))

(assert (=> b!104149 (= lt!152606 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!152590 () tuple2!8598)

(declare-fun lt!152598 () (_ BitVec 64))

(declare-fun lt!152592 () (_ BitVec 64))

(assert (=> b!104149 (= lt!152602 (bvor lt!152592 (ite (_2!4554 lt!152590) lt!152598 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!152600 () tuple2!8602)

(declare-fun lt!152589 () tuple2!8604)

(assert (=> b!104149 (= lt!152589 (readNLeastSignificantBitsLoopPure!0 (_1!4556 lt!152600) nBits!396 i!615 lt!152592))))

(declare-fun lt!152588 () (_ BitVec 64))

(assert (=> b!104149 (validate_offset_bits!1 ((_ sign_extend 32) (size!2219 (buf!2585 (_2!4555 lt!152608)))) ((_ sign_extend 32) (currentByte!5070 thiss!1305)) ((_ sign_extend 32) (currentBit!5065 thiss!1305)) lt!152588)))

(declare-fun lt!152596 () Unit!6382)

(assert (=> b!104149 (= lt!152596 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2585 (_2!4555 lt!152608)) lt!152588))))

(assert (=> b!104149 (= lt!152592 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!152594 () Bool)

(assert (=> b!104149 (= (_2!4554 lt!152590) lt!152594)))

(declare-fun readBitPure!0 (BitStream!3912) tuple2!8598)

(assert (=> b!104149 (= lt!152590 (readBitPure!0 (_1!4556 lt!152600)))))

(declare-fun reader!0 (BitStream!3912 BitStream!3912) tuple2!8602)

(assert (=> b!104149 (= lt!152585 (reader!0 (_2!4555 lt!152595) (_2!4555 lt!152608)))))

(assert (=> b!104149 (= lt!152600 (reader!0 thiss!1305 (_2!4555 lt!152608)))))

(declare-fun e!68223 () Bool)

(assert (=> b!104149 e!68223))

(declare-fun res!85741 () Bool)

(assert (=> b!104149 (=> (not res!85741) (not e!68223))))

(declare-fun lt!152597 () tuple2!8598)

(declare-fun lt!152604 () tuple2!8598)

(assert (=> b!104149 (= res!85741 (= (bitIndex!0 (size!2219 (buf!2585 (_1!4554 lt!152597))) (currentByte!5070 (_1!4554 lt!152597)) (currentBit!5065 (_1!4554 lt!152597))) (bitIndex!0 (size!2219 (buf!2585 (_1!4554 lt!152604))) (currentByte!5070 (_1!4554 lt!152604)) (currentBit!5065 (_1!4554 lt!152604)))))))

(declare-fun lt!152607 () Unit!6382)

(declare-fun lt!152593 () BitStream!3912)

(declare-fun readBitPrefixLemma!0 (BitStream!3912 BitStream!3912) Unit!6382)

(assert (=> b!104149 (= lt!152607 (readBitPrefixLemma!0 lt!152593 (_2!4555 lt!152608)))))

(assert (=> b!104149 (= lt!152604 (readBitPure!0 (BitStream!3913 (buf!2585 (_2!4555 lt!152608)) (currentByte!5070 thiss!1305) (currentBit!5065 thiss!1305))))))

(assert (=> b!104149 (= lt!152597 (readBitPure!0 lt!152593))))

(assert (=> b!104149 (= lt!152593 (BitStream!3913 (buf!2585 (_2!4555 lt!152595)) (currentByte!5070 thiss!1305) (currentBit!5065 thiss!1305)))))

(assert (=> b!104149 e!68218))

(declare-fun res!85737 () Bool)

(assert (=> b!104149 (=> (not res!85737) (not e!68218))))

(declare-fun isPrefixOf!0 (BitStream!3912 BitStream!3912) Bool)

(assert (=> b!104149 (= res!85737 (isPrefixOf!0 thiss!1305 (_2!4555 lt!152608)))))

(declare-fun lt!152603 () Unit!6382)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3912 BitStream!3912 BitStream!3912) Unit!6382)

(assert (=> b!104149 (= lt!152603 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4555 lt!152595) (_2!4555 lt!152608)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3912 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8600)

(assert (=> b!104149 (= lt!152608 (appendNLeastSignificantBitsLoop!0 (_2!4555 lt!152595) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!68224 () Bool)

(assert (=> b!104149 e!68224))

(declare-fun res!85748 () Bool)

(assert (=> b!104149 (=> (not res!85748) (not e!68224))))

(assert (=> b!104149 (= res!85748 (= (size!2219 (buf!2585 thiss!1305)) (size!2219 (buf!2585 (_2!4555 lt!152595)))))))

(declare-fun appendBit!0 (BitStream!3912 Bool) tuple2!8600)

(assert (=> b!104149 (= lt!152595 (appendBit!0 thiss!1305 lt!152594))))

(assert (=> b!104149 (= lt!152594 (not (= (bvand v!199 lt!152598) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104149 (= lt!152598 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!104150 () Bool)

(declare-fun e!68220 () Bool)

(declare-fun array_inv!2021 (array!4862) Bool)

(assert (=> b!104150 (= e!68220 (array_inv!2021 (buf!2585 thiss!1305)))))

(declare-fun res!85742 () Bool)

(declare-fun e!68225 () Bool)

(assert (=> start!20604 (=> (not res!85742) (not e!68225))))

(assert (=> start!20604 (= res!85742 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20604 e!68225))

(assert (=> start!20604 true))

(declare-fun inv!12 (BitStream!3912) Bool)

(assert (=> start!20604 (and (inv!12 thiss!1305) e!68220)))

(declare-fun b!104145 () Bool)

(assert (=> b!104145 (= e!68223 (= (_2!4554 lt!152597) (_2!4554 lt!152604)))))

(declare-fun b!104151 () Bool)

(assert (=> b!104151 (= e!68218 (invariant!0 (currentBit!5065 thiss!1305) (currentByte!5070 thiss!1305) (size!2219 (buf!2585 (_2!4555 lt!152608)))))))

(declare-fun b!104152 () Bool)

(declare-fun e!68221 () Bool)

(assert (=> b!104152 (= e!68221 e!68217)))

(declare-fun res!85743 () Bool)

(assert (=> b!104152 (=> (not res!85743) (not e!68217))))

(assert (=> b!104152 (= res!85743 (and (= (_2!4554 lt!152586) lt!152594) (= (_1!4554 lt!152586) (_2!4555 lt!152595))))))

(declare-fun readerFrom!0 (BitStream!3912 (_ BitVec 32) (_ BitVec 32)) BitStream!3912)

(assert (=> b!104152 (= lt!152586 (readBitPure!0 (readerFrom!0 (_2!4555 lt!152595) (currentBit!5065 thiss!1305) (currentByte!5070 thiss!1305))))))

(declare-fun b!104153 () Bool)

(assert (=> b!104153 (= e!68222 (invariant!0 (currentBit!5065 thiss!1305) (currentByte!5070 thiss!1305) (size!2219 (buf!2585 thiss!1305))))))

(declare-fun lt!152605 () tuple2!8604)

(assert (=> b!104153 (and (= (_2!4557 lt!152589) (_2!4557 lt!152605)) (= (_1!4557 lt!152589) (_1!4557 lt!152605)))))

(declare-fun lt!152601 () Unit!6382)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3912 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6382)

(assert (=> b!104153 (= lt!152601 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4556 lt!152600) nBits!396 i!615 lt!152592))))

(declare-fun withMovedBitIndex!0 (BitStream!3912 (_ BitVec 64)) BitStream!3912)

(assert (=> b!104153 (= lt!152605 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4556 lt!152600) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152602))))

(declare-fun b!104154 () Bool)

(assert (=> b!104154 (= e!68225 e!68219)))

(declare-fun res!85745 () Bool)

(assert (=> b!104154 (=> (not res!85745) (not e!68219))))

(assert (=> b!104154 (= res!85745 (validate_offset_bits!1 ((_ sign_extend 32) (size!2219 (buf!2585 thiss!1305))) ((_ sign_extend 32) (currentByte!5070 thiss!1305)) ((_ sign_extend 32) (currentBit!5065 thiss!1305)) lt!152588))))

(assert (=> b!104154 (= lt!152588 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!104155 () Bool)

(declare-fun res!85746 () Bool)

(assert (=> b!104155 (=> (not res!85746) (not e!68221))))

(assert (=> b!104155 (= res!85746 (isPrefixOf!0 thiss!1305 (_2!4555 lt!152595)))))

(declare-fun b!104156 () Bool)

(assert (=> b!104156 (= e!68224 e!68221)))

(declare-fun res!85744 () Bool)

(assert (=> b!104156 (=> (not res!85744) (not e!68221))))

(declare-fun lt!152599 () (_ BitVec 64))

(assert (=> b!104156 (= res!85744 (= lt!152591 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!152599)))))

(assert (=> b!104156 (= lt!152591 (bitIndex!0 (size!2219 (buf!2585 (_2!4555 lt!152595))) (currentByte!5070 (_2!4555 lt!152595)) (currentBit!5065 (_2!4555 lt!152595))))))

(assert (=> b!104156 (= lt!152599 (bitIndex!0 (size!2219 (buf!2585 thiss!1305)) (currentByte!5070 thiss!1305) (currentBit!5065 thiss!1305)))))

(assert (= (and start!20604 res!85742) b!104154))

(assert (= (and b!104154 res!85745) b!104146))

(assert (= (and b!104146 res!85747) b!104148))

(assert (= (and b!104148 res!85740) b!104149))

(assert (= (and b!104149 res!85748) b!104156))

(assert (= (and b!104156 res!85744) b!104155))

(assert (= (and b!104155 res!85746) b!104152))

(assert (= (and b!104152 res!85743) b!104144))

(assert (= (and b!104149 res!85737) b!104147))

(assert (= (and b!104147 res!85738) b!104151))

(assert (= (and b!104149 res!85741) b!104145))

(assert (= (and b!104149 (not res!85739)) b!104153))

(assert (= start!20604 b!104150))

(declare-fun m!152183 () Bool)

(assert (=> b!104156 m!152183))

(declare-fun m!152185 () Bool)

(assert (=> b!104156 m!152185))

(declare-fun m!152187 () Bool)

(assert (=> b!104151 m!152187))

(declare-fun m!152189 () Bool)

(assert (=> b!104146 m!152189))

(declare-fun m!152191 () Bool)

(assert (=> b!104150 m!152191))

(declare-fun m!152193 () Bool)

(assert (=> b!104144 m!152193))

(declare-fun m!152195 () Bool)

(assert (=> start!20604 m!152195))

(declare-fun m!152197 () Bool)

(assert (=> b!104152 m!152197))

(assert (=> b!104152 m!152197))

(declare-fun m!152199 () Bool)

(assert (=> b!104152 m!152199))

(declare-fun m!152201 () Bool)

(assert (=> b!104153 m!152201))

(declare-fun m!152203 () Bool)

(assert (=> b!104153 m!152203))

(declare-fun m!152205 () Bool)

(assert (=> b!104153 m!152205))

(assert (=> b!104153 m!152205))

(declare-fun m!152207 () Bool)

(assert (=> b!104153 m!152207))

(declare-fun m!152209 () Bool)

(assert (=> b!104149 m!152209))

(declare-fun m!152211 () Bool)

(assert (=> b!104149 m!152211))

(declare-fun m!152213 () Bool)

(assert (=> b!104149 m!152213))

(declare-fun m!152215 () Bool)

(assert (=> b!104149 m!152215))

(declare-fun m!152217 () Bool)

(assert (=> b!104149 m!152217))

(declare-fun m!152219 () Bool)

(assert (=> b!104149 m!152219))

(declare-fun m!152221 () Bool)

(assert (=> b!104149 m!152221))

(declare-fun m!152223 () Bool)

(assert (=> b!104149 m!152223))

(declare-fun m!152225 () Bool)

(assert (=> b!104149 m!152225))

(declare-fun m!152227 () Bool)

(assert (=> b!104149 m!152227))

(declare-fun m!152229 () Bool)

(assert (=> b!104149 m!152229))

(declare-fun m!152231 () Bool)

(assert (=> b!104149 m!152231))

(declare-fun m!152233 () Bool)

(assert (=> b!104149 m!152233))

(declare-fun m!152235 () Bool)

(assert (=> b!104149 m!152235))

(declare-fun m!152237 () Bool)

(assert (=> b!104149 m!152237))

(declare-fun m!152239 () Bool)

(assert (=> b!104149 m!152239))

(declare-fun m!152241 () Bool)

(assert (=> b!104149 m!152241))

(declare-fun m!152243 () Bool)

(assert (=> b!104149 m!152243))

(declare-fun m!152245 () Bool)

(assert (=> b!104149 m!152245))

(declare-fun m!152247 () Bool)

(assert (=> b!104154 m!152247))

(declare-fun m!152249 () Bool)

(assert (=> b!104147 m!152249))

(declare-fun m!152251 () Bool)

(assert (=> b!104155 m!152251))

(check-sat (not start!20604) (not b!104152) (not b!104154) (not b!104147) (not b!104155) (not b!104149) (not b!104150) (not b!104146) (not b!104151) (not b!104153) (not b!104156) (not b!104144))
