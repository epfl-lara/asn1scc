; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11790 () Bool)

(assert start!11790)

(declare-datatypes ((array!2647 0))(
  ( (array!2648 (arr!1763 (Array (_ BitVec 32) (_ BitVec 8))) (size!1199 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2647)

(declare-fun b!58194 () Bool)

(declare-datatypes ((BitStream!2086 0))(
  ( (BitStream!2087 (buf!1580 array!2647) (currentByte!3198 (_ BitVec 32)) (currentBit!3193 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4021 0))(
  ( (Unit!4022) )
))
(declare-datatypes ((tuple2!5294 0))(
  ( (tuple2!5295 (_1!2758 Unit!4021) (_2!2758 BitStream!2086)) )
))
(declare-fun lt!92170 () tuple2!5294)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((tuple2!5296 0))(
  ( (tuple2!5297 (_1!2759 BitStream!2086) (_2!2759 BitStream!2086)) )
))
(declare-fun lt!92165 () tuple2!5296)

(declare-fun e!38576 () Bool)

(declare-datatypes ((List!618 0))(
  ( (Nil!615) (Cons!614 (h!733 Bool) (t!1368 List!618)) )
))
(declare-fun head!437 (List!618) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2086 array!2647 (_ BitVec 64) (_ BitVec 64)) List!618)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2086 BitStream!2086 (_ BitVec 64)) List!618)

(assert (=> b!58194 (= e!38576 (= (head!437 (byteArrayBitContentToList!0 (_2!2758 lt!92170) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!437 (bitStreamReadBitsIntoList!0 (_2!2758 lt!92170) (_1!2759 lt!92165) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!58195 () Bool)

(declare-fun res!48316 () Bool)

(declare-fun e!38566 () Bool)

(assert (=> b!58195 (=> res!48316 e!38566)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!58195 (= res!48316 (not (invariant!0 (currentBit!3193 (_2!2758 lt!92170)) (currentByte!3198 (_2!2758 lt!92170)) (size!1199 (buf!1580 (_2!2758 lt!92170))))))))

(declare-fun res!48310 () Bool)

(declare-fun e!38575 () Bool)

(assert (=> start!11790 (=> (not res!48310) (not e!38575))))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!11790 (= res!48310 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1199 srcBuffer!2))))))))

(assert (=> start!11790 e!38575))

(assert (=> start!11790 true))

(declare-fun array_inv!1102 (array!2647) Bool)

(assert (=> start!11790 (array_inv!1102 srcBuffer!2)))

(declare-fun thiss!1379 () BitStream!2086)

(declare-fun e!38573 () Bool)

(declare-fun inv!12 (BitStream!2086) Bool)

(assert (=> start!11790 (and (inv!12 thiss!1379) e!38573)))

(declare-fun lt!92166 () (_ BitVec 64))

(declare-fun b!58196 () Bool)

(declare-fun e!38574 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!58196 (= e!38574 (= lt!92166 (bvsub (bvsub (bvadd (bitIndex!0 (size!1199 (buf!1580 (_2!2758 lt!92170))) (currentByte!3198 (_2!2758 lt!92170)) (currentBit!3193 (_2!2758 lt!92170))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!58197 () Bool)

(assert (=> b!58197 (= e!38573 (array_inv!1102 (buf!1580 thiss!1379)))))

(declare-fun b!58198 () Bool)

(assert (=> b!58198 (= e!38566 true)))

(declare-fun lt!92162 () tuple2!5296)

(declare-fun lt!92161 () tuple2!5294)

(declare-fun reader!0 (BitStream!2086 BitStream!2086) tuple2!5296)

(assert (=> b!58198 (= lt!92162 (reader!0 thiss!1379 (_2!2758 lt!92161)))))

(declare-fun b!58199 () Bool)

(declare-fun res!48309 () Bool)

(assert (=> b!58199 (=> (not res!48309) (not e!38575))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!58199 (= res!48309 (validate_offset_bits!1 ((_ sign_extend 32) (size!1199 (buf!1580 thiss!1379))) ((_ sign_extend 32) (currentByte!3198 thiss!1379)) ((_ sign_extend 32) (currentBit!3193 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!58200 () Bool)

(declare-fun e!38571 () Bool)

(assert (=> b!58200 (= e!38571 e!38566)))

(declare-fun res!48314 () Bool)

(assert (=> b!58200 (=> res!48314 e!38566)))

(assert (=> b!58200 (= res!48314 (not (= (size!1199 (buf!1580 (_2!2758 lt!92170))) (size!1199 (buf!1580 (_2!2758 lt!92161))))))))

(assert (=> b!58200 e!38574))

(declare-fun res!48311 () Bool)

(assert (=> b!58200 (=> (not res!48311) (not e!38574))))

(assert (=> b!58200 (= res!48311 (= (size!1199 (buf!1580 (_2!2758 lt!92161))) (size!1199 (buf!1580 thiss!1379))))))

(declare-fun b!58201 () Bool)

(declare-fun e!38567 () Bool)

(assert (=> b!58201 (= e!38567 e!38571)))

(declare-fun res!48313 () Bool)

(assert (=> b!58201 (=> res!48313 e!38571)))

(declare-fun lt!92169 () (_ BitVec 64))

(assert (=> b!58201 (= res!48313 (not (= lt!92166 (bvsub (bvadd lt!92169 to!314) i!635))))))

(assert (=> b!58201 (= lt!92166 (bitIndex!0 (size!1199 (buf!1580 (_2!2758 lt!92161))) (currentByte!3198 (_2!2758 lt!92161)) (currentBit!3193 (_2!2758 lt!92161))))))

(declare-fun b!58202 () Bool)

(declare-fun e!38572 () Bool)

(assert (=> b!58202 (= e!38575 (not e!38572))))

(declare-fun res!48320 () Bool)

(assert (=> b!58202 (=> res!48320 e!38572)))

(assert (=> b!58202 (= res!48320 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2086 BitStream!2086) Bool)

(assert (=> b!58202 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!92164 () Unit!4021)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2086) Unit!4021)

(assert (=> b!58202 (= lt!92164 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!58202 (= lt!92169 (bitIndex!0 (size!1199 (buf!1580 thiss!1379)) (currentByte!3198 thiss!1379) (currentBit!3193 thiss!1379)))))

(declare-fun b!58203 () Bool)

(declare-fun res!48317 () Bool)

(assert (=> b!58203 (=> res!48317 e!38566)))

(assert (=> b!58203 (= res!48317 (not (invariant!0 (currentBit!3193 (_2!2758 lt!92170)) (currentByte!3198 (_2!2758 lt!92170)) (size!1199 (buf!1580 (_2!2758 lt!92161))))))))

(declare-fun b!58204 () Bool)

(declare-fun res!48319 () Bool)

(assert (=> b!58204 (=> res!48319 e!38571)))

(assert (=> b!58204 (= res!48319 (not (invariant!0 (currentBit!3193 (_2!2758 lt!92161)) (currentByte!3198 (_2!2758 lt!92161)) (size!1199 (buf!1580 (_2!2758 lt!92161))))))))

(declare-fun b!58205 () Bool)

(declare-fun e!38570 () Bool)

(assert (=> b!58205 (= e!38572 e!38570)))

(declare-fun res!48318 () Bool)

(assert (=> b!58205 (=> res!48318 e!38570)))

(assert (=> b!58205 (= res!48318 (not (isPrefixOf!0 thiss!1379 (_2!2758 lt!92170))))))

(assert (=> b!58205 (validate_offset_bits!1 ((_ sign_extend 32) (size!1199 (buf!1580 (_2!2758 lt!92170)))) ((_ sign_extend 32) (currentByte!3198 (_2!2758 lt!92170))) ((_ sign_extend 32) (currentBit!3193 (_2!2758 lt!92170))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92163 () Unit!4021)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2086 BitStream!2086 (_ BitVec 64) (_ BitVec 64)) Unit!4021)

(assert (=> b!58205 (= lt!92163 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2758 lt!92170) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2086 (_ BitVec 8) (_ BitVec 32)) tuple2!5294)

(assert (=> b!58205 (= lt!92170 (appendBitFromByte!0 thiss!1379 (select (arr!1763 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!58206 () Bool)

(assert (=> b!58206 (= e!38570 e!38567)))

(declare-fun res!48312 () Bool)

(assert (=> b!58206 (=> res!48312 e!38567)))

(assert (=> b!58206 (= res!48312 (not (isPrefixOf!0 (_2!2758 lt!92170) (_2!2758 lt!92161))))))

(assert (=> b!58206 (isPrefixOf!0 thiss!1379 (_2!2758 lt!92161))))

(declare-fun lt!92168 () Unit!4021)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2086 BitStream!2086 BitStream!2086) Unit!4021)

(assert (=> b!58206 (= lt!92168 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2758 lt!92170) (_2!2758 lt!92161)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2086 array!2647 (_ BitVec 64) (_ BitVec 64)) tuple2!5294)

(assert (=> b!58206 (= lt!92161 (appendBitsMSBFirstLoop!0 (_2!2758 lt!92170) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!58206 e!38576))

(declare-fun res!48321 () Bool)

(assert (=> b!58206 (=> (not res!48321) (not e!38576))))

(assert (=> b!58206 (= res!48321 (validate_offset_bits!1 ((_ sign_extend 32) (size!1199 (buf!1580 (_2!2758 lt!92170)))) ((_ sign_extend 32) (currentByte!3198 thiss!1379)) ((_ sign_extend 32) (currentBit!3193 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92167 () Unit!4021)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2086 array!2647 (_ BitVec 64)) Unit!4021)

(assert (=> b!58206 (= lt!92167 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1580 (_2!2758 lt!92170)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!58206 (= lt!92165 (reader!0 thiss!1379 (_2!2758 lt!92170)))))

(declare-fun b!58207 () Bool)

(declare-fun res!48315 () Bool)

(assert (=> b!58207 (=> res!48315 e!38571)))

(assert (=> b!58207 (= res!48315 (not (= (size!1199 (buf!1580 thiss!1379)) (size!1199 (buf!1580 (_2!2758 lt!92161))))))))

(assert (= (and start!11790 res!48310) b!58199))

(assert (= (and b!58199 res!48309) b!58202))

(assert (= (and b!58202 (not res!48320)) b!58205))

(assert (= (and b!58205 (not res!48318)) b!58206))

(assert (= (and b!58206 res!48321) b!58194))

(assert (= (and b!58206 (not res!48312)) b!58201))

(assert (= (and b!58201 (not res!48313)) b!58204))

(assert (= (and b!58204 (not res!48319)) b!58207))

(assert (= (and b!58207 (not res!48315)) b!58200))

(assert (= (and b!58200 res!48311) b!58196))

(assert (= (and b!58200 (not res!48314)) b!58195))

(assert (= (and b!58195 (not res!48316)) b!58203))

(assert (= (and b!58203 (not res!48317)) b!58198))

(assert (= start!11790 b!58197))

(declare-fun m!91735 () Bool)

(assert (=> b!58197 m!91735))

(declare-fun m!91737 () Bool)

(assert (=> b!58203 m!91737))

(declare-fun m!91739 () Bool)

(assert (=> b!58196 m!91739))

(declare-fun m!91741 () Bool)

(assert (=> b!58206 m!91741))

(declare-fun m!91743 () Bool)

(assert (=> b!58206 m!91743))

(declare-fun m!91745 () Bool)

(assert (=> b!58206 m!91745))

(declare-fun m!91747 () Bool)

(assert (=> b!58206 m!91747))

(declare-fun m!91749 () Bool)

(assert (=> b!58206 m!91749))

(declare-fun m!91751 () Bool)

(assert (=> b!58206 m!91751))

(declare-fun m!91753 () Bool)

(assert (=> b!58206 m!91753))

(declare-fun m!91755 () Bool)

(assert (=> b!58199 m!91755))

(declare-fun m!91757 () Bool)

(assert (=> b!58202 m!91757))

(declare-fun m!91759 () Bool)

(assert (=> b!58202 m!91759))

(declare-fun m!91761 () Bool)

(assert (=> b!58202 m!91761))

(declare-fun m!91763 () Bool)

(assert (=> b!58195 m!91763))

(declare-fun m!91765 () Bool)

(assert (=> b!58194 m!91765))

(assert (=> b!58194 m!91765))

(declare-fun m!91767 () Bool)

(assert (=> b!58194 m!91767))

(declare-fun m!91769 () Bool)

(assert (=> b!58194 m!91769))

(assert (=> b!58194 m!91769))

(declare-fun m!91771 () Bool)

(assert (=> b!58194 m!91771))

(declare-fun m!91773 () Bool)

(assert (=> b!58201 m!91773))

(declare-fun m!91775 () Bool)

(assert (=> b!58198 m!91775))

(declare-fun m!91777 () Bool)

(assert (=> b!58204 m!91777))

(declare-fun m!91779 () Bool)

(assert (=> b!58205 m!91779))

(declare-fun m!91781 () Bool)

(assert (=> b!58205 m!91781))

(declare-fun m!91783 () Bool)

(assert (=> b!58205 m!91783))

(declare-fun m!91785 () Bool)

(assert (=> b!58205 m!91785))

(declare-fun m!91787 () Bool)

(assert (=> b!58205 m!91787))

(assert (=> b!58205 m!91781))

(declare-fun m!91789 () Bool)

(assert (=> start!11790 m!91789))

(declare-fun m!91791 () Bool)

(assert (=> start!11790 m!91791))

(push 1)

