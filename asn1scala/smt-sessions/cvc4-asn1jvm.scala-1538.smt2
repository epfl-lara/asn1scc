; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42910 () Bool)

(assert start!42910)

(declare-fun b!202262 () Bool)

(declare-fun res!169407 () Bool)

(declare-fun e!138702 () Bool)

(assert (=> b!202262 (=> (not res!169407) (not e!138702))))

(declare-datatypes ((array!10284 0))(
  ( (array!10285 (arr!5457 (Array (_ BitVec 32) (_ BitVec 8))) (size!4527 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8162 0))(
  ( (BitStream!8163 (buf!5032 array!10284) (currentByte!9463 (_ BitVec 32)) (currentBit!9458 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8162)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!202262 (= res!169407 (invariant!0 (currentBit!9458 thiss!1204) (currentByte!9463 thiss!1204) (size!4527 (buf!5032 thiss!1204))))))

(declare-fun b!202263 () Bool)

(declare-fun e!138701 () Bool)

(declare-datatypes ((Unit!14347 0))(
  ( (Unit!14348) )
))
(declare-datatypes ((tuple2!17308 0))(
  ( (tuple2!17309 (_1!9306 Unit!14347) (_2!9306 BitStream!8162)) )
))
(declare-fun lt!314954 () tuple2!17308)

(declare-fun lt!314949 () tuple2!17308)

(declare-fun isPrefixOf!0 (BitStream!8162 BitStream!8162) Bool)

(assert (=> b!202263 (= e!138701 (isPrefixOf!0 (_2!9306 lt!314954) (_2!9306 lt!314949)))))

(declare-fun b!202264 () Bool)

(declare-fun e!138704 () Bool)

(assert (=> b!202264 (= e!138702 (not e!138704))))

(declare-fun res!169408 () Bool)

(assert (=> b!202264 (=> res!169408 e!138704)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!202264 (= res!169408 (not (= (bitIndex!0 (size!4527 (buf!5032 (_2!9306 lt!314954))) (currentByte!9463 (_2!9306 lt!314954)) (currentBit!9458 (_2!9306 lt!314954))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4527 (buf!5032 thiss!1204)) (currentByte!9463 thiss!1204) (currentBit!9458 thiss!1204))))))))

(declare-fun e!138700 () Bool)

(assert (=> b!202264 e!138700))

(declare-fun res!169411 () Bool)

(assert (=> b!202264 (=> (not res!169411) (not e!138700))))

(assert (=> b!202264 (= res!169411 (= (size!4527 (buf!5032 thiss!1204)) (size!4527 (buf!5032 (_2!9306 lt!314954)))))))

(declare-fun lt!314953 () Bool)

(declare-fun appendBit!0 (BitStream!8162 Bool) tuple2!17308)

(assert (=> b!202264 (= lt!314954 (appendBit!0 thiss!1204 lt!314953))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!202264 (= lt!314953 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!202265 () Bool)

(declare-fun e!138705 () Bool)

(declare-datatypes ((tuple2!17310 0))(
  ( (tuple2!17311 (_1!9307 BitStream!8162) (_2!9307 Bool)) )
))
(declare-fun lt!314952 () tuple2!17310)

(declare-fun lt!314951 () (_ BitVec 64))

(assert (=> b!202265 (= e!138705 (= (bitIndex!0 (size!4527 (buf!5032 (_1!9307 lt!314952))) (currentByte!9463 (_1!9307 lt!314952)) (currentBit!9458 (_1!9307 lt!314952))) lt!314951))))

(declare-fun b!202266 () Bool)

(declare-fun res!169405 () Bool)

(assert (=> b!202266 (=> (not res!169405) (not e!138702))))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!202266 (= res!169405 (not (= i!590 nBits!348)))))

(declare-fun b!202267 () Bool)

(declare-fun e!138703 () Bool)

(assert (=> b!202267 (= e!138703 e!138705)))

(declare-fun res!169409 () Bool)

(assert (=> b!202267 (=> (not res!169409) (not e!138705))))

(assert (=> b!202267 (= res!169409 (and (= (_2!9307 lt!314952) lt!314953) (= (_1!9307 lt!314952) (_2!9306 lt!314954))))))

(declare-fun readBitPure!0 (BitStream!8162) tuple2!17310)

(declare-fun readerFrom!0 (BitStream!8162 (_ BitVec 32) (_ BitVec 32)) BitStream!8162)

(assert (=> b!202267 (= lt!314952 (readBitPure!0 (readerFrom!0 (_2!9306 lt!314954) (currentBit!9458 thiss!1204) (currentByte!9463 thiss!1204))))))

(declare-fun b!202268 () Bool)

(assert (=> b!202268 (= e!138704 e!138701)))

(declare-fun res!169406 () Bool)

(assert (=> b!202268 (=> res!169406 e!138701)))

(assert (=> b!202268 (= res!169406 (not (isPrefixOf!0 thiss!1204 (_2!9306 lt!314954))))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8162 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17308)

(assert (=> b!202268 (= lt!314949 (appendBitsLSBFirstLoopTR!0 (_2!9306 lt!314954) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!202270 () Bool)

(declare-fun e!138699 () Bool)

(declare-fun array_inv!4268 (array!10284) Bool)

(assert (=> b!202270 (= e!138699 (array_inv!4268 (buf!5032 thiss!1204)))))

(declare-fun b!202271 () Bool)

(declare-fun res!169404 () Bool)

(assert (=> b!202271 (=> (not res!169404) (not e!138703))))

(assert (=> b!202271 (= res!169404 (isPrefixOf!0 thiss!1204 (_2!9306 lt!314954)))))

(declare-fun b!202272 () Bool)

(declare-fun res!169412 () Bool)

(assert (=> b!202272 (=> (not res!169412) (not e!138702))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!202272 (= res!169412 (validate_offset_bits!1 ((_ sign_extend 32) (size!4527 (buf!5032 thiss!1204))) ((_ sign_extend 32) (currentByte!9463 thiss!1204)) ((_ sign_extend 32) (currentBit!9458 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun res!169403 () Bool)

(assert (=> start!42910 (=> (not res!169403) (not e!138702))))

(assert (=> start!42910 (= res!169403 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42910 e!138702))

(assert (=> start!42910 true))

(declare-fun inv!12 (BitStream!8162) Bool)

(assert (=> start!42910 (and (inv!12 thiss!1204) e!138699)))

(declare-fun b!202269 () Bool)

(assert (=> b!202269 (= e!138700 e!138703)))

(declare-fun res!169410 () Bool)

(assert (=> b!202269 (=> (not res!169410) (not e!138703))))

(declare-fun lt!314950 () (_ BitVec 64))

(assert (=> b!202269 (= res!169410 (= lt!314951 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!314950)))))

(assert (=> b!202269 (= lt!314951 (bitIndex!0 (size!4527 (buf!5032 (_2!9306 lt!314954))) (currentByte!9463 (_2!9306 lt!314954)) (currentBit!9458 (_2!9306 lt!314954))))))

(assert (=> b!202269 (= lt!314950 (bitIndex!0 (size!4527 (buf!5032 thiss!1204)) (currentByte!9463 thiss!1204) (currentBit!9458 thiss!1204)))))

(assert (= (and start!42910 res!169403) b!202272))

(assert (= (and b!202272 res!169412) b!202262))

(assert (= (and b!202262 res!169407) b!202266))

(assert (= (and b!202266 res!169405) b!202264))

(assert (= (and b!202264 res!169411) b!202269))

(assert (= (and b!202269 res!169410) b!202271))

(assert (= (and b!202271 res!169404) b!202267))

(assert (= (and b!202267 res!169409) b!202265))

(assert (= (and b!202264 (not res!169408)) b!202268))

(assert (= (and b!202268 (not res!169406)) b!202263))

(assert (= start!42910 b!202270))

(declare-fun m!312691 () Bool)

(assert (=> b!202272 m!312691))

(declare-fun m!312693 () Bool)

(assert (=> b!202269 m!312693))

(declare-fun m!312695 () Bool)

(assert (=> b!202269 m!312695))

(assert (=> b!202264 m!312693))

(assert (=> b!202264 m!312695))

(declare-fun m!312697 () Bool)

(assert (=> b!202264 m!312697))

(declare-fun m!312699 () Bool)

(assert (=> b!202270 m!312699))

(declare-fun m!312701 () Bool)

(assert (=> b!202271 m!312701))

(declare-fun m!312703 () Bool)

(assert (=> b!202262 m!312703))

(assert (=> b!202268 m!312701))

(declare-fun m!312705 () Bool)

(assert (=> b!202268 m!312705))

(declare-fun m!312707 () Bool)

(assert (=> b!202265 m!312707))

(declare-fun m!312709 () Bool)

(assert (=> start!42910 m!312709))

(declare-fun m!312711 () Bool)

(assert (=> b!202263 m!312711))

(declare-fun m!312713 () Bool)

(assert (=> b!202267 m!312713))

(assert (=> b!202267 m!312713))

(declare-fun m!312715 () Bool)

(assert (=> b!202267 m!312715))

(push 1)

(assert (not b!202264))

(assert (not b!202267))

(assert (not b!202271))

(assert (not b!202268))

(assert (not b!202269))

(assert (not b!202263))

(assert (not start!42910))

(assert (not b!202262))

(assert (not b!202265))

(assert (not b!202272))

(assert (not b!202270))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!69231 () Bool)

(declare-fun res!169453 () Bool)

(declare-fun e!138732 () Bool)

(assert (=> d!69231 (=> (not res!169453) (not e!138732))))

(assert (=> d!69231 (= res!169453 (= (size!4527 (buf!5032 thiss!1204)) (size!4527 (buf!5032 (_2!9306 lt!314954)))))))

(assert (=> d!69231 (= (isPrefixOf!0 thiss!1204 (_2!9306 lt!314954)) e!138732)))

(declare-fun b!202311 () Bool)

(declare-fun res!169452 () Bool)

(assert (=> b!202311 (=> (not res!169452) (not e!138732))))

(assert (=> b!202311 (= res!169452 (bvsle (bitIndex!0 (size!4527 (buf!5032 thiss!1204)) (currentByte!9463 thiss!1204) (currentBit!9458 thiss!1204)) (bitIndex!0 (size!4527 (buf!5032 (_2!9306 lt!314954))) (currentByte!9463 (_2!9306 lt!314954)) (currentBit!9458 (_2!9306 lt!314954)))))))

(declare-fun b!202312 () Bool)

(declare-fun e!138731 () Bool)

(assert (=> b!202312 (= e!138732 e!138731)))

(declare-fun res!169454 () Bool)

(assert (=> b!202312 (=> res!169454 e!138731)))

(assert (=> b!202312 (= res!169454 (= (size!4527 (buf!5032 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!202313 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10284 array!10284 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!202313 (= e!138731 (arrayBitRangesEq!0 (buf!5032 thiss!1204) (buf!5032 (_2!9306 lt!314954)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4527 (buf!5032 thiss!1204)) (currentByte!9463 thiss!1204) (currentBit!9458 thiss!1204))))))

(assert (= (and d!69231 res!169453) b!202311))

(assert (= (and b!202311 res!169452) b!202312))

(assert (= (and b!202312 (not res!169454)) b!202313))

(assert (=> b!202311 m!312695))

(assert (=> b!202311 m!312693))

(assert (=> b!202313 m!312695))

(assert (=> b!202313 m!312695))

(declare-fun m!312737 () Bool)

(assert (=> b!202313 m!312737))

(assert (=> b!202268 d!69231))

(declare-fun b!202373 () Bool)

(declare-fun e!138768 () Bool)

(declare-fun lt!315184 () tuple2!17310)

(declare-fun lt!315139 () tuple2!17310)

(assert (=> b!202373 (= e!138768 (= (_2!9307 lt!315184) (_2!9307 lt!315139)))))

(declare-fun b!202374 () Bool)

(declare-fun e!138774 () Bool)

(declare-datatypes ((tuple2!17312 0))(
  ( (tuple2!17313 (_1!9308 BitStream!8162) (_2!9308 (_ BitVec 64))) )
))
(declare-fun lt!315147 () tuple2!17312)

(declare-datatypes ((tuple2!17314 0))(
  ( (tuple2!17315 (_1!9309 BitStream!8162) (_2!9309 BitStream!8162)) )
))
(declare-fun lt!315176 () tuple2!17314)

(assert (=> b!202374 (= e!138774 (= (_1!9308 lt!315147) (_2!9309 lt!315176)))))

(declare-fun b!202375 () Bool)

(declare-fun e!138772 () Bool)

(declare-fun lt!315158 () (_ BitVec 64))

(assert (=> b!202375 (= e!138772 (validate_offset_bits!1 ((_ sign_extend 32) (size!4527 (buf!5032 (_2!9306 lt!314954)))) ((_ sign_extend 32) (currentByte!9463 (_2!9306 lt!314954))) ((_ sign_extend 32) (currentBit!9458 (_2!9306 lt!314954))) lt!315158))))

(declare-fun d!69235 () Bool)

(declare-fun e!138770 () Bool)

(assert (=> d!69235 e!138770))

(declare-fun res!169507 () Bool)

(assert (=> d!69235 (=> (not res!169507) (not e!138770))))

(declare-fun lt!315143 () tuple2!17308)

(assert (=> d!69235 (= res!169507 (invariant!0 (currentBit!9458 (_2!9306 lt!315143)) (currentByte!9463 (_2!9306 lt!315143)) (size!4527 (buf!5032 (_2!9306 lt!315143)))))))

(declare-fun e!138769 () tuple2!17308)

(assert (=> d!69235 (= lt!315143 e!138769)))

(declare-fun c!10031 () Bool)

(assert (=> d!69235 (= c!10031 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!69235 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!69235 (= (appendBitsLSBFirstLoopTR!0 (_2!9306 lt!314954) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!315143)))

(declare-fun b!202376 () Bool)

(declare-fun res!169513 () Bool)

(assert (=> b!202376 (=> (not res!169513) (not e!138770))))

(declare-fun lt!315157 () (_ BitVec 64))

(declare-fun lt!315164 () (_ BitVec 64))

(assert (=> b!202376 (= res!169513 (= (bitIndex!0 (size!4527 (buf!5032 (_2!9306 lt!315143))) (currentByte!9463 (_2!9306 lt!315143)) (currentBit!9458 (_2!9306 lt!315143))) (bvsub lt!315164 lt!315157)))))

(assert (=> b!202376 (or (= (bvand lt!315164 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!315157 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!315164 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!315164 lt!315157) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!202376 (= lt!315157 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!315167 () (_ BitVec 64))

(declare-fun lt!315136 () (_ BitVec 64))

(assert (=> b!202376 (= lt!315164 (bvadd lt!315167 lt!315136))))

(assert (=> b!202376 (or (not (= (bvand lt!315167 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!315136 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!315167 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!315167 lt!315136) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!202376 (= lt!315136 ((_ sign_extend 32) nBits!348))))

(assert (=> b!202376 (= lt!315167 (bitIndex!0 (size!4527 (buf!5032 (_2!9306 lt!314954))) (currentByte!9463 (_2!9306 lt!314954)) (currentBit!9458 (_2!9306 lt!314954))))))

(declare-fun b!202377 () Bool)

(declare-fun res!169516 () Bool)

(declare-fun call!3183 () Bool)

(assert (=> b!202377 (= res!169516 call!3183)))

(declare-fun e!138773 () Bool)

(assert (=> b!202377 (=> (not res!169516) (not e!138773))))

(declare-fun b!202378 () Bool)

(declare-fun res!169511 () Bool)

(assert (=> b!202378 (=> (not res!169511) (not e!138770))))

(assert (=> b!202378 (= res!169511 (isPrefixOf!0 (_2!9306 lt!314954) (_2!9306 lt!315143)))))

(declare-fun b!202379 () Bool)

(declare-fun lt!315154 () tuple2!17310)

(declare-fun lt!315182 () tuple2!17308)

(assert (=> b!202379 (= lt!315154 (readBitPure!0 (readerFrom!0 (_2!9306 lt!315182) (currentBit!9458 (_2!9306 lt!314954)) (currentByte!9463 (_2!9306 lt!314954)))))))

(declare-fun lt!315166 () Bool)

(declare-fun res!169508 () Bool)

(assert (=> b!202379 (= res!169508 (and (= (_2!9307 lt!315154) lt!315166) (= (_1!9307 lt!315154) (_2!9306 lt!315182))))))

(declare-fun e!138767 () Bool)

(assert (=> b!202379 (=> (not res!169508) (not e!138767))))

(assert (=> b!202379 (= e!138773 e!138767)))

(declare-fun b!202380 () Bool)

(declare-fun e!138766 () (_ BitVec 64))

(assert (=> b!202380 (= e!138766 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!202381 () Bool)

(declare-fun lt!315187 () tuple2!17308)

(assert (=> b!202381 (= e!138769 (tuple2!17309 (_1!9306 lt!315187) (_2!9306 lt!315187)))))

(assert (=> b!202381 (= lt!315166 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!202381 (= lt!315182 (appendBit!0 (_2!9306 lt!314954) lt!315166))))

(declare-fun res!169514 () Bool)

(assert (=> b!202381 (= res!169514 (= (size!4527 (buf!5032 (_2!9306 lt!314954))) (size!4527 (buf!5032 (_2!9306 lt!315182)))))))

(assert (=> b!202381 (=> (not res!169514) (not e!138773))))

(assert (=> b!202381 e!138773))

(declare-fun lt!315140 () tuple2!17308)

(assert (=> b!202381 (= lt!315140 lt!315182)))

(assert (=> b!202381 (= lt!315187 (appendBitsLSBFirstLoopTR!0 (_2!9306 lt!315140) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!315186 () Unit!14347)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8162 BitStream!8162 BitStream!8162) Unit!14347)

(assert (=> b!202381 (= lt!315186 (lemmaIsPrefixTransitive!0 (_2!9306 lt!314954) (_2!9306 lt!315140) (_2!9306 lt!315187)))))

(assert (=> b!202381 (isPrefixOf!0 (_2!9306 lt!314954) (_2!9306 lt!315187))))

(declare-fun lt!315177 () Unit!14347)

(assert (=> b!202381 (= lt!315177 lt!315186)))

(assert (=> b!202381 (invariant!0 (currentBit!9458 (_2!9306 lt!314954)) (currentByte!9463 (_2!9306 lt!314954)) (size!4527 (buf!5032 (_2!9306 lt!315140))))))

(declare-fun lt!315173 () BitStream!8162)

(assert (=> b!202381 (= lt!315173 (BitStream!8163 (buf!5032 (_2!9306 lt!315140)) (currentByte!9463 (_2!9306 lt!314954)) (currentBit!9458 (_2!9306 lt!314954))))))

(assert (=> b!202381 (invariant!0 (currentBit!9458 lt!315173) (currentByte!9463 lt!315173) (size!4527 (buf!5032 (_2!9306 lt!315187))))))

(declare-fun lt!315178 () BitStream!8162)

(assert (=> b!202381 (= lt!315178 (BitStream!8163 (buf!5032 (_2!9306 lt!315187)) (currentByte!9463 lt!315173) (currentBit!9458 lt!315173)))))

(assert (=> b!202381 (= lt!315184 (readBitPure!0 lt!315173))))

(assert (=> b!202381 (= lt!315139 (readBitPure!0 lt!315178))))

(declare-fun lt!315142 () Unit!14347)

(declare-fun readBitPrefixLemma!0 (BitStream!8162 BitStream!8162) Unit!14347)

(assert (=> b!202381 (= lt!315142 (readBitPrefixLemma!0 lt!315173 (_2!9306 lt!315187)))))

(declare-fun res!169510 () Bool)

(assert (=> b!202381 (= res!169510 (= (bitIndex!0 (size!4527 (buf!5032 (_1!9307 lt!315184))) (currentByte!9463 (_1!9307 lt!315184)) (currentBit!9458 (_1!9307 lt!315184))) (bitIndex!0 (size!4527 (buf!5032 (_1!9307 lt!315139))) (currentByte!9463 (_1!9307 lt!315139)) (currentBit!9458 (_1!9307 lt!315139)))))))

(assert (=> b!202381 (=> (not res!169510) (not e!138768))))

(assert (=> b!202381 e!138768))

(declare-fun lt!315168 () Unit!14347)

(assert (=> b!202381 (= lt!315168 lt!315142)))

(declare-fun lt!315138 () tuple2!17314)

(declare-fun reader!0 (BitStream!8162 BitStream!8162) tuple2!17314)

(assert (=> b!202381 (= lt!315138 (reader!0 (_2!9306 lt!314954) (_2!9306 lt!315187)))))

(declare-fun lt!315174 () tuple2!17314)

(assert (=> b!202381 (= lt!315174 (reader!0 (_2!9306 lt!315140) (_2!9306 lt!315187)))))

(declare-fun lt!315162 () tuple2!17310)

(assert (=> b!202381 (= lt!315162 (readBitPure!0 (_1!9309 lt!315138)))))

(assert (=> b!202381 (= (_2!9307 lt!315162) lt!315166)))

(declare-fun lt!315172 () Unit!14347)

(declare-fun Unit!14349 () Unit!14347)

(assert (=> b!202381 (= lt!315172 Unit!14349)))

(declare-fun lt!315141 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!202381 (= lt!315141 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!315151 () (_ BitVec 64))

(assert (=> b!202381 (= lt!315151 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!315165 () Unit!14347)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8162 array!10284 (_ BitVec 64)) Unit!14347)

(assert (=> b!202381 (= lt!315165 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9306 lt!314954) (buf!5032 (_2!9306 lt!315187)) lt!315151))))

(assert (=> b!202381 (validate_offset_bits!1 ((_ sign_extend 32) (size!4527 (buf!5032 (_2!9306 lt!315187)))) ((_ sign_extend 32) (currentByte!9463 (_2!9306 lt!314954))) ((_ sign_extend 32) (currentBit!9458 (_2!9306 lt!314954))) lt!315151)))

(declare-fun lt!315180 () Unit!14347)

(assert (=> b!202381 (= lt!315180 lt!315165)))

(declare-fun lt!315152 () tuple2!17312)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8162 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17312)

(assert (=> b!202381 (= lt!315152 (readNBitsLSBFirstsLoopPure!0 (_1!9309 lt!315138) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!315141))))

(declare-fun lt!315133 () (_ BitVec 64))

(assert (=> b!202381 (= lt!315133 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!315144 () Unit!14347)

(assert (=> b!202381 (= lt!315144 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9306 lt!315140) (buf!5032 (_2!9306 lt!315187)) lt!315133))))

(assert (=> b!202381 (validate_offset_bits!1 ((_ sign_extend 32) (size!4527 (buf!5032 (_2!9306 lt!315187)))) ((_ sign_extend 32) (currentByte!9463 (_2!9306 lt!315140))) ((_ sign_extend 32) (currentBit!9458 (_2!9306 lt!315140))) lt!315133)))

(declare-fun lt!315156 () Unit!14347)

(assert (=> b!202381 (= lt!315156 lt!315144)))

(declare-fun lt!315161 () tuple2!17312)

(assert (=> b!202381 (= lt!315161 (readNBitsLSBFirstsLoopPure!0 (_1!9309 lt!315174) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!315141 (ite (_2!9307 lt!315162) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!315163 () tuple2!17312)

(assert (=> b!202381 (= lt!315163 (readNBitsLSBFirstsLoopPure!0 (_1!9309 lt!315138) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!315141))))

(declare-fun c!10030 () Bool)

(assert (=> b!202381 (= c!10030 (_2!9307 (readBitPure!0 (_1!9309 lt!315138))))))

(declare-fun lt!315188 () tuple2!17312)

(declare-fun withMovedBitIndex!0 (BitStream!8162 (_ BitVec 64)) BitStream!8162)

(assert (=> b!202381 (= lt!315188 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9309 lt!315138) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!315141 e!138766)))))

(declare-fun lt!315181 () Unit!14347)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8162 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14347)

(assert (=> b!202381 (= lt!315181 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9309 lt!315138) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!315141))))

(assert (=> b!202381 (and (= (_2!9308 lt!315163) (_2!9308 lt!315188)) (= (_1!9308 lt!315163) (_1!9308 lt!315188)))))

(declare-fun lt!315175 () Unit!14347)

(assert (=> b!202381 (= lt!315175 lt!315181)))

(assert (=> b!202381 (= (_1!9309 lt!315138) (withMovedBitIndex!0 (_2!9309 lt!315138) (bvsub (bitIndex!0 (size!4527 (buf!5032 (_2!9306 lt!314954))) (currentByte!9463 (_2!9306 lt!314954)) (currentBit!9458 (_2!9306 lt!314954))) (bitIndex!0 (size!4527 (buf!5032 (_2!9306 lt!315187))) (currentByte!9463 (_2!9306 lt!315187)) (currentBit!9458 (_2!9306 lt!315187))))))))

(declare-fun lt!315185 () Unit!14347)

(declare-fun Unit!14350 () Unit!14347)

(assert (=> b!202381 (= lt!315185 Unit!14350)))

(assert (=> b!202381 (= (_1!9309 lt!315174) (withMovedBitIndex!0 (_2!9309 lt!315174) (bvsub (bitIndex!0 (size!4527 (buf!5032 (_2!9306 lt!315140))) (currentByte!9463 (_2!9306 lt!315140)) (currentBit!9458 (_2!9306 lt!315140))) (bitIndex!0 (size!4527 (buf!5032 (_2!9306 lt!315187))) (currentByte!9463 (_2!9306 lt!315187)) (currentBit!9458 (_2!9306 lt!315187))))))))

(declare-fun lt!315155 () Unit!14347)

(declare-fun Unit!14351 () Unit!14347)

(assert (=> b!202381 (= lt!315155 Unit!14351)))

(assert (=> b!202381 (= (bitIndex!0 (size!4527 (buf!5032 (_2!9306 lt!314954))) (currentByte!9463 (_2!9306 lt!314954)) (currentBit!9458 (_2!9306 lt!314954))) (bvsub (bitIndex!0 (size!4527 (buf!5032 (_2!9306 lt!315140))) (currentByte!9463 (_2!9306 lt!315140)) (currentBit!9458 (_2!9306 lt!315140))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!315160 () Unit!14347)

(declare-fun Unit!14352 () Unit!14347)

(assert (=> b!202381 (= lt!315160 Unit!14352)))

(assert (=> b!202381 (= (_2!9308 lt!315152) (_2!9308 lt!315161))))

(declare-fun lt!315134 () Unit!14347)

(declare-fun Unit!14353 () Unit!14347)

(assert (=> b!202381 (= lt!315134 Unit!14353)))

(assert (=> b!202381 (invariant!0 (currentBit!9458 (_2!9306 lt!315187)) (currentByte!9463 (_2!9306 lt!315187)) (size!4527 (buf!5032 (_2!9306 lt!315187))))))

(declare-fun lt!315146 () Unit!14347)

(declare-fun Unit!14354 () Unit!14347)

(assert (=> b!202381 (= lt!315146 Unit!14354)))

(assert (=> b!202381 (= (size!4527 (buf!5032 (_2!9306 lt!314954))) (size!4527 (buf!5032 (_2!9306 lt!315187))))))

(declare-fun lt!315137 () Unit!14347)

(declare-fun Unit!14355 () Unit!14347)

(assert (=> b!202381 (= lt!315137 Unit!14355)))

(assert (=> b!202381 (= (bitIndex!0 (size!4527 (buf!5032 (_2!9306 lt!315187))) (currentByte!9463 (_2!9306 lt!315187)) (currentBit!9458 (_2!9306 lt!315187))) (bvsub (bvadd (bitIndex!0 (size!4527 (buf!5032 (_2!9306 lt!314954))) (currentByte!9463 (_2!9306 lt!314954)) (currentBit!9458 (_2!9306 lt!314954))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!315145 () Unit!14347)

(declare-fun Unit!14356 () Unit!14347)

(assert (=> b!202381 (= lt!315145 Unit!14356)))

(declare-fun lt!315150 () Unit!14347)

(declare-fun Unit!14357 () Unit!14347)

(assert (=> b!202381 (= lt!315150 Unit!14357)))

(declare-fun lt!315179 () tuple2!17314)

(assert (=> b!202381 (= lt!315179 (reader!0 (_2!9306 lt!314954) (_2!9306 lt!315187)))))

(declare-fun lt!315153 () (_ BitVec 64))

(assert (=> b!202381 (= lt!315153 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!315159 () Unit!14347)

(assert (=> b!202381 (= lt!315159 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9306 lt!314954) (buf!5032 (_2!9306 lt!315187)) lt!315153))))

(assert (=> b!202381 (validate_offset_bits!1 ((_ sign_extend 32) (size!4527 (buf!5032 (_2!9306 lt!315187)))) ((_ sign_extend 32) (currentByte!9463 (_2!9306 lt!314954))) ((_ sign_extend 32) (currentBit!9458 (_2!9306 lt!314954))) lt!315153)))

(declare-fun lt!315135 () Unit!14347)

(assert (=> b!202381 (= lt!315135 lt!315159)))

(declare-fun lt!315183 () tuple2!17312)

(assert (=> b!202381 (= lt!315183 (readNBitsLSBFirstsLoopPure!0 (_1!9309 lt!315179) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!169509 () Bool)

(assert (=> b!202381 (= res!169509 (= (_2!9308 lt!315183) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!138771 () Bool)

(assert (=> b!202381 (=> (not res!169509) (not e!138771))))

(assert (=> b!202381 e!138771))

(declare-fun lt!315171 () Unit!14347)

(declare-fun Unit!14358 () Unit!14347)

(assert (=> b!202381 (= lt!315171 Unit!14358)))

(declare-fun b!202382 () Bool)

(assert (=> b!202382 (= e!138766 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun bm!3180 () Bool)

(assert (=> bm!3180 (= call!3183 (isPrefixOf!0 (_2!9306 lt!314954) (ite c!10031 (_2!9306 lt!314954) (_2!9306 lt!315182))))))

(declare-fun b!202383 () Bool)

(declare-fun Unit!14359 () Unit!14347)

(assert (=> b!202383 (= e!138769 (tuple2!17309 Unit!14359 (_2!9306 lt!314954)))))

(declare-fun lt!315169 () Unit!14347)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8162) Unit!14347)

(assert (=> b!202383 (= lt!315169 (lemmaIsPrefixRefl!0 (_2!9306 lt!314954)))))

(assert (=> b!202383 call!3183))

(declare-fun lt!315148 () Unit!14347)

(assert (=> b!202383 (= lt!315148 lt!315169)))

(declare-fun b!202384 () Bool)

(assert (=> b!202384 (= e!138771 (= (_1!9308 lt!315183) (_2!9309 lt!315179)))))

(declare-fun b!202385 () Bool)

(declare-fun res!169517 () Bool)

(assert (=> b!202385 (= res!169517 (= (bitIndex!0 (size!4527 (buf!5032 (_2!9306 lt!315182))) (currentByte!9463 (_2!9306 lt!315182)) (currentBit!9458 (_2!9306 lt!315182))) (bvadd (bitIndex!0 (size!4527 (buf!5032 (_2!9306 lt!314954))) (currentByte!9463 (_2!9306 lt!314954)) (currentBit!9458 (_2!9306 lt!314954))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!202385 (=> (not res!169517) (not e!138773))))

(declare-fun b!202386 () Bool)

(assert (=> b!202386 (= e!138767 (= (bitIndex!0 (size!4527 (buf!5032 (_1!9307 lt!315154))) (currentByte!9463 (_1!9307 lt!315154)) (currentBit!9458 (_1!9307 lt!315154))) (bitIndex!0 (size!4527 (buf!5032 (_2!9306 lt!315182))) (currentByte!9463 (_2!9306 lt!315182)) (currentBit!9458 (_2!9306 lt!315182)))))))

(declare-fun b!202387 () Bool)

(declare-fun res!169512 () Bool)

(assert (=> b!202387 (=> (not res!169512) (not e!138770))))

(assert (=> b!202387 (= res!169512 (= (size!4527 (buf!5032 (_2!9306 lt!314954))) (size!4527 (buf!5032 (_2!9306 lt!315143)))))))

(declare-fun b!202388 () Bool)

(assert (=> b!202388 (= e!138770 e!138774)))

(declare-fun res!169506 () Bool)

(assert (=> b!202388 (=> (not res!169506) (not e!138774))))

(assert (=> b!202388 (= res!169506 (= (_2!9308 lt!315147) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!202388 (= lt!315147 (readNBitsLSBFirstsLoopPure!0 (_1!9309 lt!315176) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!315170 () Unit!14347)

(declare-fun lt!315149 () Unit!14347)

(assert (=> b!202388 (= lt!315170 lt!315149)))

(assert (=> b!202388 (validate_offset_bits!1 ((_ sign_extend 32) (size!4527 (buf!5032 (_2!9306 lt!315143)))) ((_ sign_extend 32) (currentByte!9463 (_2!9306 lt!314954))) ((_ sign_extend 32) (currentBit!9458 (_2!9306 lt!314954))) lt!315158)))

(assert (=> b!202388 (= lt!315149 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9306 lt!314954) (buf!5032 (_2!9306 lt!315143)) lt!315158))))

(assert (=> b!202388 e!138772))

(declare-fun res!169515 () Bool)

(assert (=> b!202388 (=> (not res!169515) (not e!138772))))

(assert (=> b!202388 (= res!169515 (and (= (size!4527 (buf!5032 (_2!9306 lt!314954))) (size!4527 (buf!5032 (_2!9306 lt!315143)))) (bvsge lt!315158 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!202388 (= lt!315158 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!202388 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!202388 (= lt!315176 (reader!0 (_2!9306 lt!314954) (_2!9306 lt!315143)))))

(assert (= (and d!69235 c!10031) b!202383))

(assert (= (and d!69235 (not c!10031)) b!202381))

(assert (= (and b!202381 res!169514) b!202385))

(assert (= (and b!202385 res!169517) b!202377))

(assert (= (and b!202377 res!169516) b!202379))

(assert (= (and b!202379 res!169508) b!202386))

(assert (= (and b!202381 res!169510) b!202373))

(assert (= (and b!202381 c!10030) b!202380))

(assert (= (and b!202381 (not c!10030)) b!202382))

(assert (= (and b!202381 res!169509) b!202384))

(assert (= (or b!202383 b!202377) bm!3180))

(assert (= (and d!69235 res!169507) b!202387))

(assert (= (and b!202387 res!169512) b!202376))

(assert (= (and b!202376 res!169513) b!202378))

(assert (= (and b!202378 res!169511) b!202388))

(assert (= (and b!202388 res!169515) b!202375))

(assert (= (and b!202388 res!169506) b!202374))

(declare-fun m!312765 () Bool)

(assert (=> b!202378 m!312765))

(declare-fun m!312767 () Bool)

(assert (=> b!202376 m!312767))

(assert (=> b!202376 m!312693))

(declare-fun m!312769 () Bool)

(assert (=> b!202379 m!312769))

(assert (=> b!202379 m!312769))

(declare-fun m!312771 () Bool)

(assert (=> b!202379 m!312771))

(declare-fun m!312773 () Bool)

(assert (=> bm!3180 m!312773))

(declare-fun m!312775 () Bool)

(assert (=> b!202385 m!312775))

(assert (=> b!202385 m!312693))

(declare-fun m!312777 () Bool)

(assert (=> b!202381 m!312777))

(declare-fun m!312779 () Bool)

(assert (=> b!202381 m!312779))

(declare-fun m!312781 () Bool)

(assert (=> b!202381 m!312781))

(declare-fun m!312783 () Bool)

(assert (=> b!202381 m!312783))

(assert (=> b!202381 m!312693))

(declare-fun m!312785 () Bool)

(assert (=> b!202381 m!312785))

(declare-fun m!312787 () Bool)

(assert (=> b!202381 m!312787))

(assert (=> b!202381 m!312783))

(declare-fun m!312789 () Bool)

(assert (=> b!202381 m!312789))

(declare-fun m!312791 () Bool)

(assert (=> b!202381 m!312791))

(declare-fun m!312793 () Bool)

(assert (=> b!202381 m!312793))

(declare-fun m!312795 () Bool)

(assert (=> b!202381 m!312795))

(declare-fun m!312797 () Bool)

(assert (=> b!202381 m!312797))

(declare-fun m!312799 () Bool)

(assert (=> b!202381 m!312799))

(declare-fun m!312801 () Bool)

(assert (=> b!202381 m!312801))

(declare-fun m!312803 () Bool)

(assert (=> b!202381 m!312803))

(declare-fun m!312805 () Bool)

(assert (=> b!202381 m!312805))

(declare-fun m!312807 () Bool)

(assert (=> b!202381 m!312807))

(declare-fun m!312809 () Bool)

(assert (=> b!202381 m!312809))

(declare-fun m!312811 () Bool)

(assert (=> b!202381 m!312811))

(declare-fun m!312813 () Bool)

(assert (=> b!202381 m!312813))

(declare-fun m!312815 () Bool)

(assert (=> b!202381 m!312815))

(declare-fun m!312817 () Bool)

(assert (=> b!202381 m!312817))

(declare-fun m!312819 () Bool)

(assert (=> b!202381 m!312819))

(declare-fun m!312821 () Bool)

(assert (=> b!202381 m!312821))

(declare-fun m!312823 () Bool)

(assert (=> b!202381 m!312823))

(declare-fun m!312825 () Bool)

(assert (=> b!202381 m!312825))

(declare-fun m!312827 () Bool)

(assert (=> b!202381 m!312827))

(declare-fun m!312829 () Bool)

(assert (=> b!202381 m!312829))

(declare-fun m!312831 () Bool)

(assert (=> b!202381 m!312831))

(declare-fun m!312833 () Bool)

(assert (=> b!202381 m!312833))

(declare-fun m!312835 () Bool)

(assert (=> b!202381 m!312835))

(declare-fun m!312837 () Bool)

(assert (=> b!202381 m!312837))

(declare-fun m!312839 () Bool)

(assert (=> b!202381 m!312839))

(declare-fun m!312841 () Bool)

(assert (=> b!202381 m!312841))

(declare-fun m!312843 () Bool)

(assert (=> b!202383 m!312843))

(declare-fun m!312845 () Bool)

(assert (=> b!202386 m!312845))

(assert (=> b!202386 m!312775))

(declare-fun m!312847 () Bool)

(assert (=> b!202375 m!312847))

(declare-fun m!312849 () Bool)

(assert (=> b!202388 m!312849))

(declare-fun m!312851 () Bool)

(assert (=> b!202388 m!312851))

(assert (=> b!202388 m!312823))

(declare-fun m!312853 () Bool)

(assert (=> b!202388 m!312853))

(assert (=> b!202388 m!312833))

(declare-fun m!312855 () Bool)

(assert (=> b!202388 m!312855))

(declare-fun m!312857 () Bool)

(assert (=> d!69235 m!312857))

(assert (=> b!202268 d!69235))

(declare-fun d!69251 () Bool)

(assert (=> d!69251 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9458 thiss!1204) (currentByte!9463 thiss!1204) (size!4527 (buf!5032 thiss!1204))))))

(declare-fun bs!17085 () Bool)

(assert (= bs!17085 d!69251))

(assert (=> bs!17085 m!312703))

(assert (=> start!42910 d!69251))

(declare-fun d!69253 () Bool)

(declare-fun res!169519 () Bool)

(declare-fun e!138776 () Bool)

(assert (=> d!69253 (=> (not res!169519) (not e!138776))))

(assert (=> d!69253 (= res!169519 (= (size!4527 (buf!5032 (_2!9306 lt!314954))) (size!4527 (buf!5032 (_2!9306 lt!314949)))))))

(assert (=> d!69253 (= (isPrefixOf!0 (_2!9306 lt!314954) (_2!9306 lt!314949)) e!138776)))

(declare-fun b!202389 () Bool)

(declare-fun res!169518 () Bool)

(assert (=> b!202389 (=> (not res!169518) (not e!138776))))

(assert (=> b!202389 (= res!169518 (bvsle (bitIndex!0 (size!4527 (buf!5032 (_2!9306 lt!314954))) (currentByte!9463 (_2!9306 lt!314954)) (currentBit!9458 (_2!9306 lt!314954))) (bitIndex!0 (size!4527 (buf!5032 (_2!9306 lt!314949))) (currentByte!9463 (_2!9306 lt!314949)) (currentBit!9458 (_2!9306 lt!314949)))))))

(declare-fun b!202390 () Bool)

(declare-fun e!138775 () Bool)

(assert (=> b!202390 (= e!138776 e!138775)))

(declare-fun res!169520 () Bool)

(assert (=> b!202390 (=> res!169520 e!138775)))

(assert (=> b!202390 (= res!169520 (= (size!4527 (buf!5032 (_2!9306 lt!314954))) #b00000000000000000000000000000000))))

(declare-fun b!202391 () Bool)

(assert (=> b!202391 (= e!138775 (arrayBitRangesEq!0 (buf!5032 (_2!9306 lt!314954)) (buf!5032 (_2!9306 lt!314949)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4527 (buf!5032 (_2!9306 lt!314954))) (currentByte!9463 (_2!9306 lt!314954)) (currentBit!9458 (_2!9306 lt!314954)))))))

(assert (= (and d!69253 res!169519) b!202389))

(assert (= (and b!202389 res!169518) b!202390))

(assert (= (and b!202390 (not res!169520)) b!202391))

(assert (=> b!202389 m!312693))

(declare-fun m!312859 () Bool)

(assert (=> b!202389 m!312859))

(assert (=> b!202391 m!312693))

(assert (=> b!202391 m!312693))

(declare-fun m!312861 () Bool)

(assert (=> b!202391 m!312861))

(assert (=> b!202263 d!69253))

(declare-fun d!69255 () Bool)

(assert (=> d!69255 (= (invariant!0 (currentBit!9458 thiss!1204) (currentByte!9463 thiss!1204) (size!4527 (buf!5032 thiss!1204))) (and (bvsge (currentBit!9458 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9458 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9463 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9463 thiss!1204) (size!4527 (buf!5032 thiss!1204))) (and (= (currentBit!9458 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9463 thiss!1204) (size!4527 (buf!5032 thiss!1204)))))))))

(assert (=> b!202262 d!69255))

(declare-fun d!69257 () Bool)

(declare-fun e!138779 () Bool)

(assert (=> d!69257 e!138779))

(declare-fun res!169525 () Bool)

(assert (=> d!69257 (=> (not res!169525) (not e!138779))))

(declare-fun lt!315205 () (_ BitVec 64))

(declare-fun lt!315203 () (_ BitVec 64))

(declare-fun lt!315206 () (_ BitVec 64))

(assert (=> d!69257 (= res!169525 (= lt!315206 (bvsub lt!315205 lt!315203)))))

(assert (=> d!69257 (or (= (bvand lt!315205 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!315203 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!315205 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!315205 lt!315203) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!69257 (= lt!315203 (remainingBits!0 ((_ sign_extend 32) (size!4527 (buf!5032 (_2!9306 lt!314954)))) ((_ sign_extend 32) (currentByte!9463 (_2!9306 lt!314954))) ((_ sign_extend 32) (currentBit!9458 (_2!9306 lt!314954)))))))

(declare-fun lt!315201 () (_ BitVec 64))

(declare-fun lt!315202 () (_ BitVec 64))

(assert (=> d!69257 (= lt!315205 (bvmul lt!315201 lt!315202))))

(assert (=> d!69257 (or (= lt!315201 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!315202 (bvsdiv (bvmul lt!315201 lt!315202) lt!315201)))))

(assert (=> d!69257 (= lt!315202 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69257 (= lt!315201 ((_ sign_extend 32) (size!4527 (buf!5032 (_2!9306 lt!314954)))))))

(assert (=> d!69257 (= lt!315206 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9463 (_2!9306 lt!314954))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9458 (_2!9306 lt!314954)))))))

(assert (=> d!69257 (invariant!0 (currentBit!9458 (_2!9306 lt!314954)) (currentByte!9463 (_2!9306 lt!314954)) (size!4527 (buf!5032 (_2!9306 lt!314954))))))

(assert (=> d!69257 (= (bitIndex!0 (size!4527 (buf!5032 (_2!9306 lt!314954))) (currentByte!9463 (_2!9306 lt!314954)) (currentBit!9458 (_2!9306 lt!314954))) lt!315206)))

(declare-fun b!202396 () Bool)

(declare-fun res!169526 () Bool)

(assert (=> b!202396 (=> (not res!169526) (not e!138779))))

(assert (=> b!202396 (= res!169526 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!315206))))

(declare-fun b!202397 () Bool)

(declare-fun lt!315204 () (_ BitVec 64))

(assert (=> b!202397 (= e!138779 (bvsle lt!315206 (bvmul lt!315204 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!202397 (or (= lt!315204 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!315204 #b0000000000000000000000000000000000000000000000000000000000001000) lt!315204)))))

(assert (=> b!202397 (= lt!315204 ((_ sign_extend 32) (size!4527 (buf!5032 (_2!9306 lt!314954)))))))

(assert (= (and d!69257 res!169525) b!202396))

(assert (= (and b!202396 res!169526) b!202397))

(declare-fun m!312863 () Bool)

(assert (=> d!69257 m!312863))

(declare-fun m!312865 () Bool)

(assert (=> d!69257 m!312865))

(assert (=> b!202264 d!69257))

(declare-fun d!69259 () Bool)

(declare-fun e!138780 () Bool)

(assert (=> d!69259 e!138780))

(declare-fun res!169527 () Bool)

(assert (=> d!69259 (=> (not res!169527) (not e!138780))))

(declare-fun lt!315212 () (_ BitVec 64))

(declare-fun lt!315211 () (_ BitVec 64))

(declare-fun lt!315209 () (_ BitVec 64))

(assert (=> d!69259 (= res!169527 (= lt!315212 (bvsub lt!315211 lt!315209)))))

(assert (=> d!69259 (or (= (bvand lt!315211 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!315209 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!315211 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!315211 lt!315209) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69259 (= lt!315209 (remainingBits!0 ((_ sign_extend 32) (size!4527 (buf!5032 thiss!1204))) ((_ sign_extend 32) (currentByte!9463 thiss!1204)) ((_ sign_extend 32) (currentBit!9458 thiss!1204))))))

(declare-fun lt!315207 () (_ BitVec 64))

(declare-fun lt!315208 () (_ BitVec 64))

(assert (=> d!69259 (= lt!315211 (bvmul lt!315207 lt!315208))))

(assert (=> d!69259 (or (= lt!315207 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!315208 (bvsdiv (bvmul lt!315207 lt!315208) lt!315207)))))

(assert (=> d!69259 (= lt!315208 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69259 (= lt!315207 ((_ sign_extend 32) (size!4527 (buf!5032 thiss!1204))))))

(assert (=> d!69259 (= lt!315212 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9463 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9458 thiss!1204))))))

(assert (=> d!69259 (invariant!0 (currentBit!9458 thiss!1204) (currentByte!9463 thiss!1204) (size!4527 (buf!5032 thiss!1204)))))

(assert (=> d!69259 (= (bitIndex!0 (size!4527 (buf!5032 thiss!1204)) (currentByte!9463 thiss!1204) (currentBit!9458 thiss!1204)) lt!315212)))

(declare-fun b!202398 () Bool)

(declare-fun res!169528 () Bool)

(assert (=> b!202398 (=> (not res!169528) (not e!138780))))

(assert (=> b!202398 (= res!169528 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!315212))))

(declare-fun b!202399 () Bool)

(declare-fun lt!315210 () (_ BitVec 64))

(assert (=> b!202399 (= e!138780 (bvsle lt!315212 (bvmul lt!315210 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!202399 (or (= lt!315210 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!315210 #b0000000000000000000000000000000000000000000000000000000000001000) lt!315210)))))

(assert (=> b!202399 (= lt!315210 ((_ sign_extend 32) (size!4527 (buf!5032 thiss!1204))))))

(assert (= (and d!69259 res!169527) b!202398))

(assert (= (and b!202398 res!169528) b!202399))

(declare-fun m!312867 () Bool)

(assert (=> d!69259 m!312867))

(assert (=> d!69259 m!312703))

(assert (=> b!202264 d!69259))

(declare-fun b!202411 () Bool)

(declare-fun e!138785 () Bool)

(declare-fun e!138786 () Bool)

(assert (=> b!202411 (= e!138785 e!138786)))

(declare-fun res!169537 () Bool)

(assert (=> b!202411 (=> (not res!169537) (not e!138786))))

(declare-fun lt!315221 () tuple2!17308)

(declare-fun lt!315223 () tuple2!17310)

(assert (=> b!202411 (= res!169537 (and (= (_2!9307 lt!315223) lt!314953) (= (_1!9307 lt!315223) (_2!9306 lt!315221))))))

(assert (=> b!202411 (= lt!315223 (readBitPure!0 (readerFrom!0 (_2!9306 lt!315221) (currentBit!9458 thiss!1204) (currentByte!9463 thiss!1204))))))

(declare-fun b!202409 () Bool)

(declare-fun res!169539 () Bool)

(assert (=> b!202409 (=> (not res!169539) (not e!138785))))

(declare-fun lt!315224 () (_ BitVec 64))

(declare-fun lt!315222 () (_ BitVec 64))

(assert (=> b!202409 (= res!169539 (= (bitIndex!0 (size!4527 (buf!5032 (_2!9306 lt!315221))) (currentByte!9463 (_2!9306 lt!315221)) (currentBit!9458 (_2!9306 lt!315221))) (bvadd lt!315222 lt!315224)))))

(assert (=> b!202409 (or (not (= (bvand lt!315222 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!315224 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!315222 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!315222 lt!315224) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!202409 (= lt!315224 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!202409 (= lt!315222 (bitIndex!0 (size!4527 (buf!5032 thiss!1204)) (currentByte!9463 thiss!1204) (currentBit!9458 thiss!1204)))))

(declare-fun d!69261 () Bool)

(assert (=> d!69261 e!138785))

(declare-fun res!169538 () Bool)

(assert (=> d!69261 (=> (not res!169538) (not e!138785))))

(assert (=> d!69261 (= res!169538 (= (size!4527 (buf!5032 thiss!1204)) (size!4527 (buf!5032 (_2!9306 lt!315221)))))))

(declare-fun choose!16 (BitStream!8162 Bool) tuple2!17308)

(assert (=> d!69261 (= lt!315221 (choose!16 thiss!1204 lt!314953))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!69261 (validate_offset_bit!0 ((_ sign_extend 32) (size!4527 (buf!5032 thiss!1204))) ((_ sign_extend 32) (currentByte!9463 thiss!1204)) ((_ sign_extend 32) (currentBit!9458 thiss!1204)))))

(assert (=> d!69261 (= (appendBit!0 thiss!1204 lt!314953) lt!315221)))

(declare-fun b!202410 () Bool)

(declare-fun res!169540 () Bool)

(assert (=> b!202410 (=> (not res!169540) (not e!138785))))

(assert (=> b!202410 (= res!169540 (isPrefixOf!0 thiss!1204 (_2!9306 lt!315221)))))

(declare-fun b!202412 () Bool)

(assert (=> b!202412 (= e!138786 (= (bitIndex!0 (size!4527 (buf!5032 (_1!9307 lt!315223))) (currentByte!9463 (_1!9307 lt!315223)) (currentBit!9458 (_1!9307 lt!315223))) (bitIndex!0 (size!4527 (buf!5032 (_2!9306 lt!315221))) (currentByte!9463 (_2!9306 lt!315221)) (currentBit!9458 (_2!9306 lt!315221)))))))

(assert (= (and d!69261 res!169538) b!202409))

(assert (= (and b!202409 res!169539) b!202410))

(assert (= (and b!202410 res!169540) b!202411))

(assert (= (and b!202411 res!169537) b!202412))

(declare-fun m!312869 () Bool)

(assert (=> b!202411 m!312869))

(assert (=> b!202411 m!312869))

(declare-fun m!312871 () Bool)

(assert (=> b!202411 m!312871))

(declare-fun m!312873 () Bool)

(assert (=> b!202412 m!312873))

(declare-fun m!312875 () Bool)

(assert (=> b!202412 m!312875))

(assert (=> b!202409 m!312875))

(assert (=> b!202409 m!312695))

(declare-fun m!312877 () Bool)

(assert (=> d!69261 m!312877))

(declare-fun m!312879 () Bool)

(assert (=> d!69261 m!312879))

(declare-fun m!312881 () Bool)

(assert (=> b!202410 m!312881))

(assert (=> b!202264 d!69261))

(assert (=> b!202269 d!69257))

(assert (=> b!202269 d!69259))

(assert (=> b!202271 d!69231))

(declare-fun d!69263 () Bool)

(assert (=> d!69263 (= (array_inv!4268 (buf!5032 thiss!1204)) (bvsge (size!4527 (buf!5032 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!202270 d!69263))

(declare-fun d!69265 () Bool)

(declare-fun e!138789 () Bool)

(assert (=> d!69265 e!138789))

(declare-fun res!169541 () Bool)

(assert (=> d!69265 (=> (not res!169541) (not e!138789))))

(declare-fun lt!315237 () (_ BitVec 64))

(declare-fun lt!315235 () (_ BitVec 64))

(declare-fun lt!315238 () (_ BitVec 64))

(assert (=> d!69265 (= res!169541 (= lt!315238 (bvsub lt!315237 lt!315235)))))

(assert (=> d!69265 (or (= (bvand lt!315237 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!315235 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!315237 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!315237 lt!315235) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69265 (= lt!315235 (remainingBits!0 ((_ sign_extend 32) (size!4527 (buf!5032 (_1!9307 lt!314952)))) ((_ sign_extend 32) (currentByte!9463 (_1!9307 lt!314952))) ((_ sign_extend 32) (currentBit!9458 (_1!9307 lt!314952)))))))

(declare-fun lt!315233 () (_ BitVec 64))

(declare-fun lt!315234 () (_ BitVec 64))

(assert (=> d!69265 (= lt!315237 (bvmul lt!315233 lt!315234))))

(assert (=> d!69265 (or (= lt!315233 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!315234 (bvsdiv (bvmul lt!315233 lt!315234) lt!315233)))))

(assert (=> d!69265 (= lt!315234 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69265 (= lt!315233 ((_ sign_extend 32) (size!4527 (buf!5032 (_1!9307 lt!314952)))))))

(assert (=> d!69265 (= lt!315238 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9463 (_1!9307 lt!314952))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9458 (_1!9307 lt!314952)))))))

(assert (=> d!69265 (invariant!0 (currentBit!9458 (_1!9307 lt!314952)) (currentByte!9463 (_1!9307 lt!314952)) (size!4527 (buf!5032 (_1!9307 lt!314952))))))

(assert (=> d!69265 (= (bitIndex!0 (size!4527 (buf!5032 (_1!9307 lt!314952))) (currentByte!9463 (_1!9307 lt!314952)) (currentBit!9458 (_1!9307 lt!314952))) lt!315238)))

(declare-fun b!202417 () Bool)

(declare-fun res!169542 () Bool)

(assert (=> b!202417 (=> (not res!169542) (not e!138789))))

(assert (=> b!202417 (= res!169542 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!315238))))

(declare-fun b!202418 () Bool)

(declare-fun lt!315236 () (_ BitVec 64))

(assert (=> b!202418 (= e!138789 (bvsle lt!315238 (bvmul lt!315236 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!202418 (or (= lt!315236 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!315236 #b0000000000000000000000000000000000000000000000000000000000001000) lt!315236)))))

(assert (=> b!202418 (= lt!315236 ((_ sign_extend 32) (size!4527 (buf!5032 (_1!9307 lt!314952)))))))

(assert (= (and d!69265 res!169541) b!202417))

(assert (= (and b!202417 res!169542) b!202418))

(declare-fun m!312883 () Bool)

(assert (=> d!69265 m!312883))

(declare-fun m!312885 () Bool)

(assert (=> d!69265 m!312885))

(assert (=> b!202265 d!69265))

(declare-fun d!69267 () Bool)

(assert (=> d!69267 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4527 (buf!5032 thiss!1204))) ((_ sign_extend 32) (currentByte!9463 thiss!1204)) ((_ sign_extend 32) (currentBit!9458 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4527 (buf!5032 thiss!1204))) ((_ sign_extend 32) (currentByte!9463 thiss!1204)) ((_ sign_extend 32) (currentBit!9458 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!17086 () Bool)

(assert (= bs!17086 d!69267))

(assert (=> bs!17086 m!312867))

(assert (=> b!202272 d!69267))

(declare-fun d!69269 () Bool)

(declare-datatypes ((tuple2!17328 0))(
  ( (tuple2!17329 (_1!9316 Bool) (_2!9316 BitStream!8162)) )
))
(declare-fun lt!315265 () tuple2!17328)

(declare-fun readBit!0 (BitStream!8162) tuple2!17328)

(assert (=> d!69269 (= lt!315265 (readBit!0 (readerFrom!0 (_2!9306 lt!314954) (currentBit!9458 thiss!1204) (currentByte!9463 thiss!1204))))))

(assert (=> d!69269 (= (readBitPure!0 (readerFrom!0 (_2!9306 lt!314954) (currentBit!9458 thiss!1204) (currentByte!9463 thiss!1204))) (tuple2!17311 (_2!9316 lt!315265) (_1!9316 lt!315265)))))

(declare-fun bs!17087 () Bool)

(assert (= bs!17087 d!69269))

(assert (=> bs!17087 m!312713))

(declare-fun m!312887 () Bool)

(assert (=> bs!17087 m!312887))

(assert (=> b!202267 d!69269))

(declare-fun d!69271 () Bool)

(declare-fun e!138800 () Bool)

(assert (=> d!69271 e!138800))

(declare-fun res!169556 () Bool)

(assert (=> d!69271 (=> (not res!169556) (not e!138800))))

(assert (=> d!69271 (= res!169556 (invariant!0 (currentBit!9458 (_2!9306 lt!314954)) (currentByte!9463 (_2!9306 lt!314954)) (size!4527 (buf!5032 (_2!9306 lt!314954)))))))

(assert (=> d!69271 (= (readerFrom!0 (_2!9306 lt!314954) (currentBit!9458 thiss!1204) (currentByte!9463 thiss!1204)) (BitStream!8163 (buf!5032 (_2!9306 lt!314954)) (currentByte!9463 thiss!1204) (currentBit!9458 thiss!1204)))))

(declare-fun b!202435 () Bool)

(assert (=> b!202435 (= e!138800 (invariant!0 (currentBit!9458 thiss!1204) (currentByte!9463 thiss!1204) (size!4527 (buf!5032 (_2!9306 lt!314954)))))))

(assert (= (and d!69271 res!169556) b!202435))

(assert (=> d!69271 m!312865))

(declare-fun m!312889 () Bool)

(assert (=> b!202435 m!312889))

(assert (=> b!202267 d!69271))

(push 1)

(assert (not b!202376))

(assert (not b!202388))

(assert (not d!69257))

(assert (not d!69269))

(assert (not b!202411))

(assert (not b!202375))

(assert (not d!69251))

(assert (not d!69267))

(assert (not b!202412))

(assert (not d!69265))

(assert (not b!202410))

(assert (not d!69235))

(assert (not d!69259))

(assert (not b!202391))

(assert (not d!69261))

(assert (not b!202381))

(assert (not b!202389))

(assert (not b!202385))

(assert (not b!202378))

(assert (not d!69271))

(assert (not b!202311))

(assert (not b!202409))

(assert (not b!202379))

(assert (not b!202435))

(assert (not b!202383))

(assert (not b!202386))

(assert (not b!202313))

(assert (not bm!3180))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

