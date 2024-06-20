; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59934 () Bool)

(assert start!59934)

(declare-fun res!227473 () Bool)

(declare-fun e!193189 () Bool)

(assert (=> start!59934 (=> (not res!227473) (not e!193189))))

(declare-datatypes ((array!15315 0))(
  ( (array!15316 (arr!7644 (Array (_ BitVec 32) (_ BitVec 8))) (size!6657 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12128 0))(
  ( (BitStream!12129 (buf!7125 array!15315) (currentByte!13141 (_ BitVec 32)) (currentBit!13136 (_ BitVec 32))) )
))
(declare-fun thiss!890 () BitStream!12128)

(declare-fun diffInBits!18 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12128 (_ BitVec 64)) Bool)

(assert (=> start!59934 (= res!227473 (moveBitIndexPrecond!0 thiss!890 diffInBits!18))))

(assert (=> start!59934 e!193189))

(declare-fun e!193188 () Bool)

(declare-fun inv!12 (BitStream!12128) Bool)

(assert (=> start!59934 (and (inv!12 thiss!890) e!193188)))

(assert (=> start!59934 true))

(declare-fun b!273295 () Bool)

(declare-datatypes ((Unit!19293 0))(
  ( (Unit!19294) )
))
(declare-datatypes ((tuple2!22416 0))(
  ( (tuple2!22417 (_1!12240 Unit!19293) (_2!12240 BitStream!12128)) )
))
(declare-fun lt!411149 () tuple2!22416)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!273295 (= e!193189 (not (invariant!0 (currentBit!13136 (_2!12240 lt!411149)) (currentByte!13141 (_2!12240 lt!411149)) (size!6657 (buf!7125 (_2!12240 lt!411149))))))))

(declare-fun moveBitIndex!0 (BitStream!12128 (_ BitVec 64)) tuple2!22416)

(assert (=> b!273295 (= lt!411149 (moveBitIndex!0 thiss!890 diffInBits!18))))

(declare-fun b!273296 () Bool)

(declare-fun array_inv!6381 (array!15315) Bool)

(assert (=> b!273296 (= e!193188 (array_inv!6381 (buf!7125 thiss!890)))))

(assert (= (and start!59934 res!227473) b!273295))

(assert (= start!59934 b!273296))

(declare-fun m!406173 () Bool)

(assert (=> start!59934 m!406173))

(declare-fun m!406175 () Bool)

(assert (=> start!59934 m!406175))

(declare-fun m!406177 () Bool)

(assert (=> b!273295 m!406177))

(declare-fun m!406179 () Bool)

(assert (=> b!273295 m!406179))

(declare-fun m!406181 () Bool)

(assert (=> b!273296 m!406181))

(push 1)

(assert (not start!59934))

(assert (not b!273295))

(assert (not b!273296))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93480 () Bool)

(declare-fun res!227476 () Bool)

(declare-fun e!193192 () Bool)

(assert (=> d!93480 (=> (not res!227476) (not e!193192))))

(assert (=> d!93480 (= res!227476 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6657 (buf!7125 thiss!890)))) diffInBits!18) (bvsle diffInBits!18 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6657 (buf!7125 thiss!890)))))))))

(assert (=> d!93480 (= (moveBitIndexPrecond!0 thiss!890 diffInBits!18) e!193192)))

(declare-fun b!273300 () Bool)

(declare-fun lt!411152 () (_ BitVec 64))

(assert (=> b!273300 (= e!193192 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411152) (bvsle lt!411152 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6657 (buf!7125 thiss!890)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273300 (= lt!411152 (bvadd (bitIndex!0 (size!6657 (buf!7125 thiss!890)) (currentByte!13141 thiss!890) (currentBit!13136 thiss!890)) diffInBits!18))))

(assert (= (and d!93480 res!227476) b!273300))

(declare-fun m!406183 () Bool)

(assert (=> b!273300 m!406183))

(assert (=> start!59934 d!93480))

(declare-fun d!93490 () Bool)

(assert (=> d!93490 (= (inv!12 thiss!890) (invariant!0 (currentBit!13136 thiss!890) (currentByte!13141 thiss!890) (size!6657 (buf!7125 thiss!890))))))

(declare-fun bs!23578 () Bool)

(assert (= bs!23578 d!93490))

(declare-fun m!406185 () Bool)

(assert (=> bs!23578 m!406185))

(assert (=> start!59934 d!93490))

(declare-fun d!93492 () Bool)

(assert (=> d!93492 (= (invariant!0 (currentBit!13136 (_2!12240 lt!411149)) (currentByte!13141 (_2!12240 lt!411149)) (size!6657 (buf!7125 (_2!12240 lt!411149)))) (and (bvsge (currentBit!13136 (_2!12240 lt!411149)) #b00000000000000000000000000000000) (bvslt (currentBit!13136 (_2!12240 lt!411149)) #b00000000000000000000000000001000) (bvsge (currentByte!13141 (_2!12240 lt!411149)) #b00000000000000000000000000000000) (or (bvslt (currentByte!13141 (_2!12240 lt!411149)) (size!6657 (buf!7125 (_2!12240 lt!411149)))) (and (= (currentBit!13136 (_2!12240 lt!411149)) #b00000000000000000000000000000000) (= (currentByte!13141 (_2!12240 lt!411149)) (size!6657 (buf!7125 (_2!12240 lt!411149))))))))))

(assert (=> b!273295 d!93492))

(declare-fun d!93496 () Bool)

(declare-fun lt!411189 () (_ BitVec 32))

(assert (=> d!93496 (= lt!411189 ((_ extract 31 0) (bvsrem diffInBits!18 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!411186 () (_ BitVec 32))

(assert (=> d!93496 (= lt!411186 ((_ extract 31 0) (bvsdiv diffInBits!18 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!193207 () Bool)

(assert (=> d!93496 e!193207))

(declare-fun res!227490 () Bool)

(assert (=> d!93496 (=> (not res!227490) (not e!193207))))

(assert (=> d!93496 (= res!227490 (moveBitIndexPrecond!0 thiss!890 diffInBits!18))))

(declare-fun Unit!19301 () Unit!19293)

(declare-fun Unit!19302 () Unit!19293)

(declare-fun Unit!19303 () Unit!19293)

(assert (=> d!93496 (= (moveBitIndex!0 thiss!890 diffInBits!18) (ite (bvslt (bvadd (currentBit!13136 thiss!890) lt!411189) #b00000000000000000000000000000000) (tuple2!22417 Unit!19301 (BitStream!12129 (buf!7125 thiss!890) (bvsub (bvadd (currentByte!13141 thiss!890) lt!411186) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!411189 (currentBit!13136 thiss!890)))) (ite (bvsge (bvadd (currentBit!13136 thiss!890) lt!411189) #b00000000000000000000000000001000) (tuple2!22417 Unit!19302 (BitStream!12129 (buf!7125 thiss!890) (bvadd (currentByte!13141 thiss!890) lt!411186 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!13136 thiss!890) lt!411189) #b00000000000000000000000000001000))) (tuple2!22417 Unit!19303 (BitStream!12129 (buf!7125 thiss!890) (bvadd (currentByte!13141 thiss!890) lt!411186) (bvadd (currentBit!13136 thiss!890) lt!411189))))))))

(declare-fun b!273315 () Bool)

(declare-fun e!193206 () Bool)

(assert (=> b!273315 (= e!193207 e!193206)))

(declare-fun res!227491 () Bool)

(assert (=> b!273315 (=> (not res!227491) (not e!193206))))

(declare-fun lt!411191 () (_ BitVec 64))

(declare-fun lt!411188 () tuple2!22416)

(assert (=> b!273315 (= res!227491 (= (bvadd lt!411191 diffInBits!18) (bitIndex!0 (size!6657 (buf!7125 (_2!12240 lt!411188))) (currentByte!13141 (_2!12240 lt!411188)) (currentBit!13136 (_2!12240 lt!411188)))))))

(assert (=> b!273315 (or (not (= (bvand lt!411191 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand diffInBits!18 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!411191 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!411191 diffInBits!18) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!273315 (= lt!411191 (bitIndex!0 (size!6657 (buf!7125 thiss!890)) (currentByte!13141 thiss!890) (currentBit!13136 thiss!890)))))

(declare-fun lt!411187 () (_ BitVec 32))

(declare-fun lt!411190 () (_ BitVec 32))

(declare-fun Unit!19304 () Unit!19293)

(declare-fun Unit!19305 () Unit!19293)

(declare-fun Unit!19306 () Unit!19293)

(assert (=> b!273315 (= lt!411188 (ite (bvslt (bvadd (currentBit!13136 thiss!890) lt!411190) #b00000000000000000000000000000000) (tuple2!22417 Unit!19304 (BitStream!12129 (buf!7125 thiss!890) (bvsub (bvadd (currentByte!13141 thiss!890) lt!411187) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!411190 (currentBit!13136 thiss!890)))) (ite (bvsge (bvadd (currentBit!13136 thiss!890) lt!411190) #b00000000000000000000000000001000) (tuple2!22417 Unit!19305 (BitStream!12129 (buf!7125 thiss!890) (bvadd (currentByte!13141 thiss!890) lt!411187 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!13136 thiss!890) lt!411190) #b00000000000000000000000000001000))) (tuple2!22417 Unit!19306 (BitStream!12129 (buf!7125 thiss!890) (bvadd (currentByte!13141 thiss!890) lt!411187) (bvadd (currentBit!13136 thiss!890) lt!411190))))))))

(assert (=> b!273315 (= lt!411190 ((_ extract 31 0) (bvsrem diffInBits!18 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273315 (= lt!411187 ((_ extract 31 0) (bvsdiv diffInBits!18 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!273316 () Bool)

(assert (=> b!273316 (= e!193206 (and (= (size!6657 (buf!7125 thiss!890)) (size!6657 (buf!7125 (_2!12240 lt!411188)))) (= (buf!7125 thiss!890) (buf!7125 (_2!12240 lt!411188)))))))

(assert (= (and d!93496 res!227490) b!273315))

(assert (= (and b!273315 res!227491) b!273316))

(assert (=> d!93496 m!406173))

(declare-fun m!406195 () Bool)

(assert (=> b!273315 m!406195))

(assert (=> b!273315 m!406183))

(assert (=> b!273295 d!93496))

(declare-fun d!93512 () Bool)

(assert (=> d!93512 (= (array_inv!6381 (buf!7125 thiss!890)) (bvsge (size!6657 (buf!7125 thiss!890)) #b00000000000000000000000000000000))))

(assert (=> b!273296 d!93512))

(push 1)

(assert (not b!273315))

(assert (not d!93496))

(assert (not b!273300))

(assert (not d!93490))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93528 () Bool)

(declare-fun e!193227 () Bool)

(assert (=> d!93528 e!193227))

(declare-fun res!227522 () Bool)

(assert (=> d!93528 (=> (not res!227522) (not e!193227))))

(declare-fun lt!411275 () (_ BitVec 64))

(declare-fun lt!411273 () (_ BitVec 64))

(declare-fun lt!411278 () (_ BitVec 64))

(assert (=> d!93528 (= res!227522 (= lt!411278 (bvsub lt!411275 lt!411273)))))

(assert (=> d!93528 (or (= (bvand lt!411275 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!411273 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!411275 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!411275 lt!411273) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93528 (= lt!411273 (remainingBits!0 ((_ sign_extend 32) (size!6657 (buf!7125 (_2!12240 lt!411188)))) ((_ sign_extend 32) (currentByte!13141 (_2!12240 lt!411188))) ((_ sign_extend 32) (currentBit!13136 (_2!12240 lt!411188)))))))

(declare-fun lt!411277 () (_ BitVec 64))

(declare-fun lt!411276 () (_ BitVec 64))

(assert (=> d!93528 (= lt!411275 (bvmul lt!411277 lt!411276))))

(assert (=> d!93528 (or (= lt!411277 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!411276 (bvsdiv (bvmul lt!411277 lt!411276) lt!411277)))))

(assert (=> d!93528 (= lt!411276 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93528 (= lt!411277 ((_ sign_extend 32) (size!6657 (buf!7125 (_2!12240 lt!411188)))))))

(assert (=> d!93528 (= lt!411278 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13141 (_2!12240 lt!411188))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13136 (_2!12240 lt!411188)))))))

(assert (=> d!93528 (invariant!0 (currentBit!13136 (_2!12240 lt!411188)) (currentByte!13141 (_2!12240 lt!411188)) (size!6657 (buf!7125 (_2!12240 lt!411188))))))

(assert (=> d!93528 (= (bitIndex!0 (size!6657 (buf!7125 (_2!12240 lt!411188))) (currentByte!13141 (_2!12240 lt!411188)) (currentBit!13136 (_2!12240 lt!411188))) lt!411278)))

(declare-fun b!273347 () Bool)

(declare-fun res!227521 () Bool)

(assert (=> b!273347 (=> (not res!227521) (not e!193227))))

(assert (=> b!273347 (= res!227521 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411278))))

(declare-fun b!273348 () Bool)

(declare-fun lt!411274 () (_ BitVec 64))

(assert (=> b!273348 (= e!193227 (bvsle lt!411278 (bvmul lt!411274 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273348 (or (= lt!411274 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!411274 #b0000000000000000000000000000000000000000000000000000000000001000) lt!411274)))))

(assert (=> b!273348 (= lt!411274 ((_ sign_extend 32) (size!6657 (buf!7125 (_2!12240 lt!411188)))))))

(assert (= (and d!93528 res!227522) b!273347))

(assert (= (and b!273347 res!227521) b!273348))

(declare-fun m!406213 () Bool)

(assert (=> d!93528 m!406213))

(declare-fun m!406215 () Bool)

(assert (=> d!93528 m!406215))

(assert (=> b!273315 d!93528))

(declare-fun d!93530 () Bool)

(declare-fun e!193228 () Bool)

(assert (=> d!93530 e!193228))

(declare-fun res!227524 () Bool)

(assert (=> d!93530 (=> (not res!227524) (not e!193228))))

(declare-fun lt!411281 () (_ BitVec 64))

(declare-fun lt!411279 () (_ BitVec 64))

(declare-fun lt!411284 () (_ BitVec 64))

(assert (=> d!93530 (= res!227524 (= lt!411284 (bvsub lt!411281 lt!411279)))))

(assert (=> d!93530 (or (= (bvand lt!411281 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!411279 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!411281 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!411281 lt!411279) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!93530 (= lt!411279 (remainingBits!0 ((_ sign_extend 32) (size!6657 (buf!7125 thiss!890))) ((_ sign_extend 32) (currentByte!13141 thiss!890)) ((_ sign_extend 32) (currentBit!13136 thiss!890))))))

(declare-fun lt!411283 () (_ BitVec 64))

(declare-fun lt!411282 () (_ BitVec 64))

(assert (=> d!93530 (= lt!411281 (bvmul lt!411283 lt!411282))))

(assert (=> d!93530 (or (= lt!411283 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!411282 (bvsdiv (bvmul lt!411283 lt!411282) lt!411283)))))

(assert (=> d!93530 (= lt!411282 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93530 (= lt!411283 ((_ sign_extend 32) (size!6657 (buf!7125 thiss!890))))))

(assert (=> d!93530 (= lt!411284 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13141 thiss!890)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13136 thiss!890))))))

(assert (=> d!93530 (invariant!0 (currentBit!13136 thiss!890) (currentByte!13141 thiss!890) (size!6657 (buf!7125 thiss!890)))))

(assert (=> d!93530 (= (bitIndex!0 (size!6657 (buf!7125 thiss!890)) (currentByte!13141 thiss!890) (currentBit!13136 thiss!890)) lt!411284)))

(declare-fun b!273349 () Bool)

(declare-fun res!227523 () Bool)

(assert (=> b!273349 (=> (not res!227523) (not e!193228))))

(assert (=> b!273349 (= res!227523 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411284))))

(declare-fun b!273350 () Bool)

(declare-fun lt!411280 () (_ BitVec 64))

(assert (=> b!273350 (= e!193228 (bvsle lt!411284 (bvmul lt!411280 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273350 (or (= lt!411280 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!411280 #b0000000000000000000000000000000000000000000000000000000000001000) lt!411280)))))

(assert (=> b!273350 (= lt!411280 ((_ sign_extend 32) (size!6657 (buf!7125 thiss!890))))))

(assert (= (and d!93530 res!227524) b!273349))

(assert (= (and b!273349 res!227523) b!273350))

(declare-fun m!406217 () Bool)

(assert (=> d!93530 m!406217))

(assert (=> d!93530 m!406185))

(assert (=> b!273315 d!93530))

(assert (=> d!93496 d!93480))

(assert (=> b!273300 d!93530))

(declare-fun d!93532 () Bool)

(assert (=> d!93532 (= (invariant!0 (currentBit!13136 thiss!890) (currentByte!13141 thiss!890) (size!6657 (buf!7125 thiss!890))) (and (bvsge (currentBit!13136 thiss!890) #b00000000000000000000000000000000) (bvslt (currentBit!13136 thiss!890) #b00000000000000000000000000001000) (bvsge (currentByte!13141 thiss!890) #b00000000000000000000000000000000) (or (bvslt (currentByte!13141 thiss!890) (size!6657 (buf!7125 thiss!890))) (and (= (currentBit!13136 thiss!890) #b00000000000000000000000000000000) (= (currentByte!13141 thiss!890) (size!6657 (buf!7125 thiss!890)))))))))

(assert (=> d!93490 d!93532))

(push 1)

(assert (not d!93530))

(assert (not d!93528))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

