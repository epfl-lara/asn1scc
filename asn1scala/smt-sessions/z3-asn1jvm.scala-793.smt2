; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22978 () Bool)

(assert start!22978)

(declare-fun b!116342 () Bool)

(declare-fun res!96186 () Bool)

(declare-fun e!76249 () Bool)

(assert (=> b!116342 (=> (not res!96186) (not e!76249))))

(declare-datatypes ((array!5242 0))(
  ( (array!5243 (arr!2971 (Array (_ BitVec 32) (_ BitVec 8))) (size!2378 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4230 0))(
  ( (BitStream!4231 (buf!2788 array!5242) (currentByte!5425 (_ BitVec 32)) (currentBit!5420 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4230)

(declare-datatypes ((Unit!7161 0))(
  ( (Unit!7162) )
))
(declare-datatypes ((tuple2!9624 0))(
  ( (tuple2!9625 (_1!5077 Unit!7161) (_2!5077 BitStream!4230)) )
))
(declare-fun lt!177797 () tuple2!9624)

(declare-fun isPrefixOf!0 (BitStream!4230 BitStream!4230) Bool)

(assert (=> b!116342 (= res!96186 (isPrefixOf!0 thiss!1305 (_2!5077 lt!177797)))))

(declare-fun b!116343 () Bool)

(declare-fun res!96190 () Bool)

(declare-fun e!76245 () Bool)

(assert (=> b!116343 (=> (not res!96190) (not e!76245))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116343 (= res!96190 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun res!96192 () Bool)

(declare-fun e!76246 () Bool)

(assert (=> start!22978 (=> (not res!96192) (not e!76246))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> start!22978 (= res!96192 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22978 e!76246))

(assert (=> start!22978 true))

(declare-fun e!76248 () Bool)

(declare-fun inv!12 (BitStream!4230) Bool)

(assert (=> start!22978 (and (inv!12 thiss!1305) e!76248)))

(declare-fun b!116344 () Bool)

(declare-fun e!76251 () Bool)

(declare-fun lt!177805 () tuple2!9624)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!116344 (= e!76251 (invariant!0 (currentBit!5420 thiss!1305) (currentByte!5425 thiss!1305) (size!2378 (buf!2788 (_2!5077 lt!177805)))))))

(declare-fun b!116345 () Bool)

(declare-fun array_inv!2180 (array!5242) Bool)

(assert (=> b!116345 (= e!76248 (array_inv!2180 (buf!2788 thiss!1305)))))

(declare-fun b!116346 () Bool)

(declare-fun e!76250 () Bool)

(assert (=> b!116346 (= e!76249 e!76250)))

(declare-fun res!96188 () Bool)

(assert (=> b!116346 (=> (not res!96188) (not e!76250))))

(declare-datatypes ((tuple2!9626 0))(
  ( (tuple2!9627 (_1!5078 BitStream!4230) (_2!5078 Bool)) )
))
(declare-fun lt!177808 () tuple2!9626)

(declare-fun lt!177798 () Bool)

(assert (=> b!116346 (= res!96188 (and (= (_2!5078 lt!177808) lt!177798) (= (_1!5078 lt!177808) (_2!5077 lt!177797))))))

(declare-fun readBitPure!0 (BitStream!4230) tuple2!9626)

(declare-fun readerFrom!0 (BitStream!4230 (_ BitVec 32) (_ BitVec 32)) BitStream!4230)

(assert (=> b!116346 (= lt!177808 (readBitPure!0 (readerFrom!0 (_2!5077 lt!177797) (currentBit!5420 thiss!1305) (currentByte!5425 thiss!1305))))))

(declare-fun b!116347 () Bool)

(declare-fun lt!177796 () (_ BitVec 32))

(declare-fun lt!177813 () tuple2!9626)

(assert (=> b!116347 (= e!76245 (not (or (not (_2!5078 lt!177813)) (let ((bdg!5751 (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (or (= bdg!5751 (bvand i!615 #b10000000000000000000000000000000)) (= bdg!5751 (bvand lt!177796 #b10000000000000000000000000000000)))))))))

(declare-datatypes ((tuple2!9628 0))(
  ( (tuple2!9629 (_1!5079 BitStream!4230) (_2!5079 BitStream!4230)) )
))
(declare-fun lt!177804 () tuple2!9628)

(declare-datatypes ((tuple2!9630 0))(
  ( (tuple2!9631 (_1!5080 BitStream!4230) (_2!5080 (_ BitVec 64))) )
))
(declare-fun lt!177799 () tuple2!9630)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4230 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9630)

(assert (=> b!116347 (= lt!177799 (readNLeastSignificantBitsLoopPure!0 (_1!5079 lt!177804) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(declare-fun lt!177802 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!116347 (validate_offset_bits!1 ((_ sign_extend 32) (size!2378 (buf!2788 (_2!5077 lt!177805)))) ((_ sign_extend 32) (currentByte!5425 thiss!1305)) ((_ sign_extend 32) (currentBit!5420 thiss!1305)) lt!177802)))

(declare-fun lt!177800 () Unit!7161)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4230 array!5242 (_ BitVec 64)) Unit!7161)

(assert (=> b!116347 (= lt!177800 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2788 (_2!5077 lt!177805)) lt!177802))))

(assert (=> b!116347 (= (_2!5078 lt!177813) lt!177798)))

(assert (=> b!116347 (= lt!177813 (readBitPure!0 (_1!5079 lt!177804)))))

(declare-fun lt!177812 () tuple2!9628)

(declare-fun reader!0 (BitStream!4230 BitStream!4230) tuple2!9628)

(assert (=> b!116347 (= lt!177812 (reader!0 (_2!5077 lt!177797) (_2!5077 lt!177805)))))

(assert (=> b!116347 (= lt!177804 (reader!0 thiss!1305 (_2!5077 lt!177805)))))

(declare-fun e!76247 () Bool)

(assert (=> b!116347 e!76247))

(declare-fun res!96183 () Bool)

(assert (=> b!116347 (=> (not res!96183) (not e!76247))))

(declare-fun lt!177810 () tuple2!9626)

(declare-fun lt!177809 () tuple2!9626)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116347 (= res!96183 (= (bitIndex!0 (size!2378 (buf!2788 (_1!5078 lt!177810))) (currentByte!5425 (_1!5078 lt!177810)) (currentBit!5420 (_1!5078 lt!177810))) (bitIndex!0 (size!2378 (buf!2788 (_1!5078 lt!177809))) (currentByte!5425 (_1!5078 lt!177809)) (currentBit!5420 (_1!5078 lt!177809)))))))

(declare-fun lt!177806 () Unit!7161)

(declare-fun lt!177811 () BitStream!4230)

(declare-fun readBitPrefixLemma!0 (BitStream!4230 BitStream!4230) Unit!7161)

(assert (=> b!116347 (= lt!177806 (readBitPrefixLemma!0 lt!177811 (_2!5077 lt!177805)))))

(assert (=> b!116347 (= lt!177809 (readBitPure!0 (BitStream!4231 (buf!2788 (_2!5077 lt!177805)) (currentByte!5425 thiss!1305) (currentBit!5420 thiss!1305))))))

(assert (=> b!116347 (= lt!177810 (readBitPure!0 lt!177811))))

(assert (=> b!116347 (= lt!177811 (BitStream!4231 (buf!2788 (_2!5077 lt!177797)) (currentByte!5425 thiss!1305) (currentBit!5420 thiss!1305)))))

(assert (=> b!116347 e!76251))

(declare-fun res!96189 () Bool)

(assert (=> b!116347 (=> (not res!96189) (not e!76251))))

(assert (=> b!116347 (= res!96189 (isPrefixOf!0 thiss!1305 (_2!5077 lt!177805)))))

(declare-fun lt!177801 () Unit!7161)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4230 BitStream!4230 BitStream!4230) Unit!7161)

(assert (=> b!116347 (= lt!177801 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5077 lt!177797) (_2!5077 lt!177805)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4230 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9624)

(assert (=> b!116347 (= lt!177805 (appendNLeastSignificantBitsLoop!0 (_2!5077 lt!177797) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!76244 () Bool)

(assert (=> b!116347 e!76244))

(declare-fun res!96185 () Bool)

(assert (=> b!116347 (=> (not res!96185) (not e!76244))))

(assert (=> b!116347 (= res!96185 (= (size!2378 (buf!2788 thiss!1305)) (size!2378 (buf!2788 (_2!5077 lt!177797)))))))

(declare-fun appendBit!0 (BitStream!4230 Bool) tuple2!9624)

(assert (=> b!116347 (= lt!177797 (appendBit!0 thiss!1305 lt!177798))))

(assert (=> b!116347 (= lt!177798 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) lt!177796))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!116347 (= lt!177796 (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))

(declare-fun b!116348 () Bool)

(declare-fun lt!177803 () (_ BitVec 64))

(assert (=> b!116348 (= e!76250 (= (bitIndex!0 (size!2378 (buf!2788 (_1!5078 lt!177808))) (currentByte!5425 (_1!5078 lt!177808)) (currentBit!5420 (_1!5078 lt!177808))) lt!177803))))

(declare-fun b!116349 () Bool)

(declare-fun res!96182 () Bool)

(assert (=> b!116349 (=> (not res!96182) (not e!76245))))

(assert (=> b!116349 (= res!96182 (bvslt i!615 nBits!396))))

(declare-fun b!116350 () Bool)

(assert (=> b!116350 (= e!76246 e!76245)))

(declare-fun res!96187 () Bool)

(assert (=> b!116350 (=> (not res!96187) (not e!76245))))

(assert (=> b!116350 (= res!96187 (validate_offset_bits!1 ((_ sign_extend 32) (size!2378 (buf!2788 thiss!1305))) ((_ sign_extend 32) (currentByte!5425 thiss!1305)) ((_ sign_extend 32) (currentBit!5420 thiss!1305)) lt!177802))))

(assert (=> b!116350 (= lt!177802 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!116351 () Bool)

(assert (=> b!116351 (= e!76247 (= (_2!5078 lt!177810) (_2!5078 lt!177809)))))

(declare-fun b!116352 () Bool)

(assert (=> b!116352 (= e!76244 e!76249)))

(declare-fun res!96191 () Bool)

(assert (=> b!116352 (=> (not res!96191) (not e!76249))))

(declare-fun lt!177807 () (_ BitVec 64))

(assert (=> b!116352 (= res!96191 (= lt!177803 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!177807)))))

(assert (=> b!116352 (= lt!177803 (bitIndex!0 (size!2378 (buf!2788 (_2!5077 lt!177797))) (currentByte!5425 (_2!5077 lt!177797)) (currentBit!5420 (_2!5077 lt!177797))))))

(assert (=> b!116352 (= lt!177807 (bitIndex!0 (size!2378 (buf!2788 thiss!1305)) (currentByte!5425 thiss!1305) (currentBit!5420 thiss!1305)))))

(declare-fun b!116353 () Bool)

(declare-fun res!96184 () Bool)

(assert (=> b!116353 (=> (not res!96184) (not e!76251))))

(assert (=> b!116353 (= res!96184 (invariant!0 (currentBit!5420 thiss!1305) (currentByte!5425 thiss!1305) (size!2378 (buf!2788 (_2!5077 lt!177797)))))))

(assert (= (and start!22978 res!96192) b!116350))

(assert (= (and b!116350 res!96187) b!116343))

(assert (= (and b!116343 res!96190) b!116349))

(assert (= (and b!116349 res!96182) b!116347))

(assert (= (and b!116347 res!96185) b!116352))

(assert (= (and b!116352 res!96191) b!116342))

(assert (= (and b!116342 res!96186) b!116346))

(assert (= (and b!116346 res!96188) b!116348))

(assert (= (and b!116347 res!96189) b!116353))

(assert (= (and b!116353 res!96184) b!116344))

(assert (= (and b!116347 res!96183) b!116351))

(assert (= start!22978 b!116345))

(declare-fun m!174211 () Bool)

(assert (=> b!116345 m!174211))

(declare-fun m!174213 () Bool)

(assert (=> b!116352 m!174213))

(declare-fun m!174215 () Bool)

(assert (=> b!116352 m!174215))

(declare-fun m!174217 () Bool)

(assert (=> b!116353 m!174217))

(declare-fun m!174219 () Bool)

(assert (=> b!116350 m!174219))

(declare-fun m!174221 () Bool)

(assert (=> b!116347 m!174221))

(declare-fun m!174223 () Bool)

(assert (=> b!116347 m!174223))

(declare-fun m!174225 () Bool)

(assert (=> b!116347 m!174225))

(declare-fun m!174227 () Bool)

(assert (=> b!116347 m!174227))

(declare-fun m!174229 () Bool)

(assert (=> b!116347 m!174229))

(declare-fun m!174231 () Bool)

(assert (=> b!116347 m!174231))

(declare-fun m!174233 () Bool)

(assert (=> b!116347 m!174233))

(declare-fun m!174235 () Bool)

(assert (=> b!116347 m!174235))

(declare-fun m!174237 () Bool)

(assert (=> b!116347 m!174237))

(declare-fun m!174239 () Bool)

(assert (=> b!116347 m!174239))

(declare-fun m!174241 () Bool)

(assert (=> b!116347 m!174241))

(declare-fun m!174243 () Bool)

(assert (=> b!116347 m!174243))

(declare-fun m!174245 () Bool)

(assert (=> b!116347 m!174245))

(declare-fun m!174247 () Bool)

(assert (=> b!116347 m!174247))

(declare-fun m!174249 () Bool)

(assert (=> b!116347 m!174249))

(declare-fun m!174251 () Bool)

(assert (=> b!116347 m!174251))

(declare-fun m!174253 () Bool)

(assert (=> b!116343 m!174253))

(declare-fun m!174255 () Bool)

(assert (=> start!22978 m!174255))

(declare-fun m!174257 () Bool)

(assert (=> b!116346 m!174257))

(assert (=> b!116346 m!174257))

(declare-fun m!174259 () Bool)

(assert (=> b!116346 m!174259))

(declare-fun m!174261 () Bool)

(assert (=> b!116344 m!174261))

(declare-fun m!174263 () Bool)

(assert (=> b!116348 m!174263))

(declare-fun m!174265 () Bool)

(assert (=> b!116342 m!174265))

(check-sat (not b!116353) (not b!116347) (not b!116342) (not b!116343) (not b!116346) (not b!116344) (not b!116352) (not b!116348) (not b!116345) (not b!116350) (not start!22978))
(check-sat)
