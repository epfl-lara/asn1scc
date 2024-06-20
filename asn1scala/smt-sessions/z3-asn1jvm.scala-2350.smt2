; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59932 () Bool)

(assert start!59932)

(declare-fun res!227470 () Bool)

(declare-fun e!193180 () Bool)

(assert (=> start!59932 (=> (not res!227470) (not e!193180))))

(declare-datatypes ((array!15313 0))(
  ( (array!15314 (arr!7643 (Array (_ BitVec 32) (_ BitVec 8))) (size!6656 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12126 0))(
  ( (BitStream!12127 (buf!7124 array!15313) (currentByte!13140 (_ BitVec 32)) (currentBit!13135 (_ BitVec 32))) )
))
(declare-fun thiss!890 () BitStream!12126)

(declare-fun diffInBits!18 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12126 (_ BitVec 64)) Bool)

(assert (=> start!59932 (= res!227470 (moveBitIndexPrecond!0 thiss!890 diffInBits!18))))

(assert (=> start!59932 e!193180))

(declare-fun e!193178 () Bool)

(declare-fun inv!12 (BitStream!12126) Bool)

(assert (=> start!59932 (and (inv!12 thiss!890) e!193178)))

(assert (=> start!59932 true))

(declare-fun b!273289 () Bool)

(declare-datatypes ((Unit!19291 0))(
  ( (Unit!19292) )
))
(declare-datatypes ((tuple2!22414 0))(
  ( (tuple2!22415 (_1!12239 Unit!19291) (_2!12239 BitStream!12126)) )
))
(declare-fun lt!411146 () tuple2!22414)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!273289 (= e!193180 (not (invariant!0 (currentBit!13135 (_2!12239 lt!411146)) (currentByte!13140 (_2!12239 lt!411146)) (size!6656 (buf!7124 (_2!12239 lt!411146))))))))

(declare-fun moveBitIndex!0 (BitStream!12126 (_ BitVec 64)) tuple2!22414)

(assert (=> b!273289 (= lt!411146 (moveBitIndex!0 thiss!890 diffInBits!18))))

(declare-fun b!273290 () Bool)

(declare-fun array_inv!6380 (array!15313) Bool)

(assert (=> b!273290 (= e!193178 (array_inv!6380 (buf!7124 thiss!890)))))

(assert (= (and start!59932 res!227470) b!273289))

(assert (= start!59932 b!273290))

(declare-fun m!406163 () Bool)

(assert (=> start!59932 m!406163))

(declare-fun m!406165 () Bool)

(assert (=> start!59932 m!406165))

(declare-fun m!406167 () Bool)

(assert (=> b!273289 m!406167))

(declare-fun m!406169 () Bool)

(assert (=> b!273289 m!406169))

(declare-fun m!406171 () Bool)

(assert (=> b!273290 m!406171))

(check-sat (not start!59932) (not b!273290) (not b!273289))
(check-sat)
(get-model)

(declare-fun d!93484 () Bool)

(declare-fun res!227479 () Bool)

(declare-fun e!193195 () Bool)

(assert (=> d!93484 (=> (not res!227479) (not e!193195))))

(assert (=> d!93484 (= res!227479 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6656 (buf!7124 thiss!890)))) diffInBits!18) (bvsle diffInBits!18 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6656 (buf!7124 thiss!890)))))))))

(assert (=> d!93484 (= (moveBitIndexPrecond!0 thiss!890 diffInBits!18) e!193195)))

(declare-fun b!273304 () Bool)

(declare-fun lt!411155 () (_ BitVec 64))

(assert (=> b!273304 (= e!193195 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411155) (bvsle lt!411155 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6656 (buf!7124 thiss!890)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273304 (= lt!411155 (bvadd (bitIndex!0 (size!6656 (buf!7124 thiss!890)) (currentByte!13140 thiss!890) (currentBit!13135 thiss!890)) diffInBits!18))))

(assert (= (and d!93484 res!227479) b!273304))

(declare-fun m!406187 () Bool)

(assert (=> b!273304 m!406187))

(assert (=> start!59932 d!93484))

(declare-fun d!93494 () Bool)

(assert (=> d!93494 (= (inv!12 thiss!890) (invariant!0 (currentBit!13135 thiss!890) (currentByte!13140 thiss!890) (size!6656 (buf!7124 thiss!890))))))

(declare-fun bs!23579 () Bool)

(assert (= bs!23579 d!93494))

(declare-fun m!406189 () Bool)

(assert (=> bs!23579 m!406189))

(assert (=> start!59932 d!93494))

(declare-fun d!93498 () Bool)

(assert (=> d!93498 (= (array_inv!6380 (buf!7124 thiss!890)) (bvsge (size!6656 (buf!7124 thiss!890)) #b00000000000000000000000000000000))))

(assert (=> b!273290 d!93498))

(declare-fun d!93500 () Bool)

(assert (=> d!93500 (= (invariant!0 (currentBit!13135 (_2!12239 lt!411146)) (currentByte!13140 (_2!12239 lt!411146)) (size!6656 (buf!7124 (_2!12239 lt!411146)))) (and (bvsge (currentBit!13135 (_2!12239 lt!411146)) #b00000000000000000000000000000000) (bvslt (currentBit!13135 (_2!12239 lt!411146)) #b00000000000000000000000000001000) (bvsge (currentByte!13140 (_2!12239 lt!411146)) #b00000000000000000000000000000000) (or (bvslt (currentByte!13140 (_2!12239 lt!411146)) (size!6656 (buf!7124 (_2!12239 lt!411146)))) (and (= (currentBit!13135 (_2!12239 lt!411146)) #b00000000000000000000000000000000) (= (currentByte!13140 (_2!12239 lt!411146)) (size!6656 (buf!7124 (_2!12239 lt!411146))))))))))

(assert (=> b!273289 d!93500))

(declare-fun d!93502 () Bool)

(declare-fun lt!411207 () (_ BitVec 32))

(assert (=> d!93502 (= lt!411207 ((_ extract 31 0) (bvsrem diffInBits!18 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!411208 () (_ BitVec 32))

(assert (=> d!93502 (= lt!411208 ((_ extract 31 0) (bvsdiv diffInBits!18 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!193215 () Bool)

(assert (=> d!93502 e!193215))

(declare-fun res!227499 () Bool)

(assert (=> d!93502 (=> (not res!227499) (not e!193215))))

(assert (=> d!93502 (= res!227499 (moveBitIndexPrecond!0 thiss!890 diffInBits!18))))

(declare-fun Unit!19307 () Unit!19291)

(declare-fun Unit!19308 () Unit!19291)

(declare-fun Unit!19309 () Unit!19291)

(assert (=> d!93502 (= (moveBitIndex!0 thiss!890 diffInBits!18) (ite (bvslt (bvadd (currentBit!13135 thiss!890) lt!411207) #b00000000000000000000000000000000) (tuple2!22415 Unit!19307 (BitStream!12127 (buf!7124 thiss!890) (bvsub (bvadd (currentByte!13140 thiss!890) lt!411208) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!411207 (currentBit!13135 thiss!890)))) (ite (bvsge (bvadd (currentBit!13135 thiss!890) lt!411207) #b00000000000000000000000000001000) (tuple2!22415 Unit!19308 (BitStream!12127 (buf!7124 thiss!890) (bvadd (currentByte!13140 thiss!890) lt!411208 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!13135 thiss!890) lt!411207) #b00000000000000000000000000001000))) (tuple2!22415 Unit!19309 (BitStream!12127 (buf!7124 thiss!890) (bvadd (currentByte!13140 thiss!890) lt!411208) (bvadd (currentBit!13135 thiss!890) lt!411207))))))))

(declare-fun b!273325 () Bool)

(declare-fun e!193216 () Bool)

(assert (=> b!273325 (= e!193215 e!193216)))

(declare-fun res!227500 () Bool)

(assert (=> b!273325 (=> (not res!227500) (not e!193216))))

(declare-fun lt!411210 () tuple2!22414)

(declare-fun lt!411209 () (_ BitVec 64))

(assert (=> b!273325 (= res!227500 (= (bvadd lt!411209 diffInBits!18) (bitIndex!0 (size!6656 (buf!7124 (_2!12239 lt!411210))) (currentByte!13140 (_2!12239 lt!411210)) (currentBit!13135 (_2!12239 lt!411210)))))))

(assert (=> b!273325 (or (not (= (bvand lt!411209 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand diffInBits!18 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!411209 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!411209 diffInBits!18) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!273325 (= lt!411209 (bitIndex!0 (size!6656 (buf!7124 thiss!890)) (currentByte!13140 thiss!890) (currentBit!13135 thiss!890)))))

(declare-fun lt!411211 () (_ BitVec 32))

(declare-fun lt!411212 () (_ BitVec 32))

(declare-fun Unit!19310 () Unit!19291)

(declare-fun Unit!19311 () Unit!19291)

(declare-fun Unit!19312 () Unit!19291)

(assert (=> b!273325 (= lt!411210 (ite (bvslt (bvadd (currentBit!13135 thiss!890) lt!411212) #b00000000000000000000000000000000) (tuple2!22415 Unit!19310 (BitStream!12127 (buf!7124 thiss!890) (bvsub (bvadd (currentByte!13140 thiss!890) lt!411211) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!411212 (currentBit!13135 thiss!890)))) (ite (bvsge (bvadd (currentBit!13135 thiss!890) lt!411212) #b00000000000000000000000000001000) (tuple2!22415 Unit!19311 (BitStream!12127 (buf!7124 thiss!890) (bvadd (currentByte!13140 thiss!890) lt!411211 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!13135 thiss!890) lt!411212) #b00000000000000000000000000001000))) (tuple2!22415 Unit!19312 (BitStream!12127 (buf!7124 thiss!890) (bvadd (currentByte!13140 thiss!890) lt!411211) (bvadd (currentBit!13135 thiss!890) lt!411212))))))))

(assert (=> b!273325 (= lt!411212 ((_ extract 31 0) (bvsrem diffInBits!18 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273325 (= lt!411211 ((_ extract 31 0) (bvsdiv diffInBits!18 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!273326 () Bool)

(assert (=> b!273326 (= e!193216 (and (= (size!6656 (buf!7124 thiss!890)) (size!6656 (buf!7124 (_2!12239 lt!411210)))) (= (buf!7124 thiss!890) (buf!7124 (_2!12239 lt!411210)))))))

(assert (= (and d!93502 res!227499) b!273325))

(assert (= (and b!273325 res!227500) b!273326))

(assert (=> d!93502 m!406163))

(declare-fun m!406199 () Bool)

(assert (=> b!273325 m!406199))

(assert (=> b!273325 m!406187))

(assert (=> b!273289 d!93502))

(check-sat (not d!93502) (not b!273304) (not b!273325) (not d!93494))
(check-sat)
(get-model)

(assert (=> d!93502 d!93484))

(declare-fun d!93516 () Bool)

(declare-fun e!193219 () Bool)

(assert (=> d!93516 e!193219))

(declare-fun res!227505 () Bool)

(assert (=> d!93516 (=> (not res!227505) (not e!193219))))

(declare-fun lt!411230 () (_ BitVec 64))

(declare-fun lt!411226 () (_ BitVec 64))

(declare-fun lt!411225 () (_ BitVec 64))

(assert (=> d!93516 (= res!227505 (= lt!411226 (bvsub lt!411230 lt!411225)))))

(assert (=> d!93516 (or (= (bvand lt!411230 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!411225 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!411230 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!411230 lt!411225) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93516 (= lt!411225 (remainingBits!0 ((_ sign_extend 32) (size!6656 (buf!7124 thiss!890))) ((_ sign_extend 32) (currentByte!13140 thiss!890)) ((_ sign_extend 32) (currentBit!13135 thiss!890))))))

(declare-fun lt!411227 () (_ BitVec 64))

(declare-fun lt!411228 () (_ BitVec 64))

(assert (=> d!93516 (= lt!411230 (bvmul lt!411227 lt!411228))))

(assert (=> d!93516 (or (= lt!411227 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!411228 (bvsdiv (bvmul lt!411227 lt!411228) lt!411227)))))

(assert (=> d!93516 (= lt!411228 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93516 (= lt!411227 ((_ sign_extend 32) (size!6656 (buf!7124 thiss!890))))))

(assert (=> d!93516 (= lt!411226 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13140 thiss!890)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13135 thiss!890))))))

(assert (=> d!93516 (invariant!0 (currentBit!13135 thiss!890) (currentByte!13140 thiss!890) (size!6656 (buf!7124 thiss!890)))))

(assert (=> d!93516 (= (bitIndex!0 (size!6656 (buf!7124 thiss!890)) (currentByte!13140 thiss!890) (currentBit!13135 thiss!890)) lt!411226)))

(declare-fun b!273331 () Bool)

(declare-fun res!227506 () Bool)

(assert (=> b!273331 (=> (not res!227506) (not e!193219))))

(assert (=> b!273331 (= res!227506 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411226))))

(declare-fun b!273332 () Bool)

(declare-fun lt!411229 () (_ BitVec 64))

(assert (=> b!273332 (= e!193219 (bvsle lt!411226 (bvmul lt!411229 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273332 (or (= lt!411229 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!411229 #b0000000000000000000000000000000000000000000000000000000000001000) lt!411229)))))

(assert (=> b!273332 (= lt!411229 ((_ sign_extend 32) (size!6656 (buf!7124 thiss!890))))))

(assert (= (and d!93516 res!227505) b!273331))

(assert (= (and b!273331 res!227506) b!273332))

(declare-fun m!406201 () Bool)

(assert (=> d!93516 m!406201))

(assert (=> d!93516 m!406189))

(assert (=> b!273304 d!93516))

(declare-fun d!93518 () Bool)

(declare-fun e!193220 () Bool)

(assert (=> d!93518 e!193220))

(declare-fun res!227507 () Bool)

(assert (=> d!93518 (=> (not res!227507) (not e!193220))))

(declare-fun lt!411232 () (_ BitVec 64))

(declare-fun lt!411231 () (_ BitVec 64))

(declare-fun lt!411236 () (_ BitVec 64))

(assert (=> d!93518 (= res!227507 (= lt!411232 (bvsub lt!411236 lt!411231)))))

(assert (=> d!93518 (or (= (bvand lt!411236 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!411231 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!411236 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!411236 lt!411231) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!93518 (= lt!411231 (remainingBits!0 ((_ sign_extend 32) (size!6656 (buf!7124 (_2!12239 lt!411210)))) ((_ sign_extend 32) (currentByte!13140 (_2!12239 lt!411210))) ((_ sign_extend 32) (currentBit!13135 (_2!12239 lt!411210)))))))

(declare-fun lt!411233 () (_ BitVec 64))

(declare-fun lt!411234 () (_ BitVec 64))

(assert (=> d!93518 (= lt!411236 (bvmul lt!411233 lt!411234))))

(assert (=> d!93518 (or (= lt!411233 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!411234 (bvsdiv (bvmul lt!411233 lt!411234) lt!411233)))))

(assert (=> d!93518 (= lt!411234 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93518 (= lt!411233 ((_ sign_extend 32) (size!6656 (buf!7124 (_2!12239 lt!411210)))))))

(assert (=> d!93518 (= lt!411232 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13140 (_2!12239 lt!411210))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13135 (_2!12239 lt!411210)))))))

(assert (=> d!93518 (invariant!0 (currentBit!13135 (_2!12239 lt!411210)) (currentByte!13140 (_2!12239 lt!411210)) (size!6656 (buf!7124 (_2!12239 lt!411210))))))

(assert (=> d!93518 (= (bitIndex!0 (size!6656 (buf!7124 (_2!12239 lt!411210))) (currentByte!13140 (_2!12239 lt!411210)) (currentBit!13135 (_2!12239 lt!411210))) lt!411232)))

(declare-fun b!273333 () Bool)

(declare-fun res!227508 () Bool)

(assert (=> b!273333 (=> (not res!227508) (not e!193220))))

(assert (=> b!273333 (= res!227508 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411232))))

(declare-fun b!273334 () Bool)

(declare-fun lt!411235 () (_ BitVec 64))

(assert (=> b!273334 (= e!193220 (bvsle lt!411232 (bvmul lt!411235 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273334 (or (= lt!411235 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!411235 #b0000000000000000000000000000000000000000000000000000000000001000) lt!411235)))))

(assert (=> b!273334 (= lt!411235 ((_ sign_extend 32) (size!6656 (buf!7124 (_2!12239 lt!411210)))))))

(assert (= (and d!93518 res!227507) b!273333))

(assert (= (and b!273333 res!227508) b!273334))

(declare-fun m!406203 () Bool)

(assert (=> d!93518 m!406203))

(declare-fun m!406205 () Bool)

(assert (=> d!93518 m!406205))

(assert (=> b!273325 d!93518))

(assert (=> b!273325 d!93516))

(declare-fun d!93520 () Bool)

(assert (=> d!93520 (= (invariant!0 (currentBit!13135 thiss!890) (currentByte!13140 thiss!890) (size!6656 (buf!7124 thiss!890))) (and (bvsge (currentBit!13135 thiss!890) #b00000000000000000000000000000000) (bvslt (currentBit!13135 thiss!890) #b00000000000000000000000000001000) (bvsge (currentByte!13140 thiss!890) #b00000000000000000000000000000000) (or (bvslt (currentByte!13140 thiss!890) (size!6656 (buf!7124 thiss!890))) (and (= (currentBit!13135 thiss!890) #b00000000000000000000000000000000) (= (currentByte!13140 thiss!890) (size!6656 (buf!7124 thiss!890)))))))))

(assert (=> d!93494 d!93520))

(check-sat (not d!93518) (not d!93516))
(check-sat)
