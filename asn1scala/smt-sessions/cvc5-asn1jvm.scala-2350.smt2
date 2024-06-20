; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59930 () Bool)

(assert start!59930)

(declare-fun res!227467 () Bool)

(declare-fun e!193169 () Bool)

(assert (=> start!59930 (=> (not res!227467) (not e!193169))))

(declare-datatypes ((array!15311 0))(
  ( (array!15312 (arr!7642 (Array (_ BitVec 32) (_ BitVec 8))) (size!6655 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12124 0))(
  ( (BitStream!12125 (buf!7123 array!15311) (currentByte!13139 (_ BitVec 32)) (currentBit!13134 (_ BitVec 32))) )
))
(declare-fun thiss!890 () BitStream!12124)

(declare-fun diffInBits!18 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12124 (_ BitVec 64)) Bool)

(assert (=> start!59930 (= res!227467 (moveBitIndexPrecond!0 thiss!890 diffInBits!18))))

(assert (=> start!59930 e!193169))

(declare-fun e!193170 () Bool)

(declare-fun inv!12 (BitStream!12124) Bool)

(assert (=> start!59930 (and (inv!12 thiss!890) e!193170)))

(assert (=> start!59930 true))

(declare-fun b!273283 () Bool)

(declare-datatypes ((Unit!19289 0))(
  ( (Unit!19290) )
))
(declare-datatypes ((tuple2!22412 0))(
  ( (tuple2!22413 (_1!12238 Unit!19289) (_2!12238 BitStream!12124)) )
))
(declare-fun lt!411143 () tuple2!22412)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!273283 (= e!193169 (not (invariant!0 (currentBit!13134 (_2!12238 lt!411143)) (currentByte!13139 (_2!12238 lt!411143)) (size!6655 (buf!7123 (_2!12238 lt!411143))))))))

(declare-fun moveBitIndex!0 (BitStream!12124 (_ BitVec 64)) tuple2!22412)

(assert (=> b!273283 (= lt!411143 (moveBitIndex!0 thiss!890 diffInBits!18))))

(declare-fun b!273284 () Bool)

(declare-fun array_inv!6379 (array!15311) Bool)

(assert (=> b!273284 (= e!193170 (array_inv!6379 (buf!7123 thiss!890)))))

(assert (= (and start!59930 res!227467) b!273283))

(assert (= start!59930 b!273284))

(declare-fun m!406153 () Bool)

(assert (=> start!59930 m!406153))

(declare-fun m!406155 () Bool)

(assert (=> start!59930 m!406155))

(declare-fun m!406157 () Bool)

(assert (=> b!273283 m!406157))

(declare-fun m!406159 () Bool)

(assert (=> b!273283 m!406159))

(declare-fun m!406161 () Bool)

(assert (=> b!273284 m!406161))

(push 1)

(assert (not b!273283))

(assert (not b!273284))

(assert (not start!59930))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93482 () Bool)

(assert (=> d!93482 (= (invariant!0 (currentBit!13134 (_2!12238 lt!411143)) (currentByte!13139 (_2!12238 lt!411143)) (size!6655 (buf!7123 (_2!12238 lt!411143)))) (and (bvsge (currentBit!13134 (_2!12238 lt!411143)) #b00000000000000000000000000000000) (bvslt (currentBit!13134 (_2!12238 lt!411143)) #b00000000000000000000000000001000) (bvsge (currentByte!13139 (_2!12238 lt!411143)) #b00000000000000000000000000000000) (or (bvslt (currentByte!13139 (_2!12238 lt!411143)) (size!6655 (buf!7123 (_2!12238 lt!411143)))) (and (= (currentBit!13134 (_2!12238 lt!411143)) #b00000000000000000000000000000000) (= (currentByte!13139 (_2!12238 lt!411143)) (size!6655 (buf!7123 (_2!12238 lt!411143))))))))))

(assert (=> b!273283 d!93482))

(declare-fun d!93486 () Bool)

(declare-fun lt!411173 () (_ BitVec 32))

(assert (=> d!93486 (= lt!411173 ((_ extract 31 0) (bvsrem diffInBits!18 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!411171 () (_ BitVec 32))

(assert (=> d!93486 (= lt!411171 ((_ extract 31 0) (bvsdiv diffInBits!18 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!193200 () Bool)

(assert (=> d!93486 e!193200))

(declare-fun res!227484 () Bool)

(assert (=> d!93486 (=> (not res!227484) (not e!193200))))

(assert (=> d!93486 (= res!227484 (moveBitIndexPrecond!0 thiss!890 diffInBits!18))))

(declare-fun Unit!19295 () Unit!19289)

(declare-fun Unit!19296 () Unit!19289)

(declare-fun Unit!19297 () Unit!19289)

(assert (=> d!93486 (= (moveBitIndex!0 thiss!890 diffInBits!18) (ite (bvslt (bvadd (currentBit!13134 thiss!890) lt!411173) #b00000000000000000000000000000000) (tuple2!22413 Unit!19295 (BitStream!12125 (buf!7123 thiss!890) (bvsub (bvadd (currentByte!13139 thiss!890) lt!411171) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!411173 (currentBit!13134 thiss!890)))) (ite (bvsge (bvadd (currentBit!13134 thiss!890) lt!411173) #b00000000000000000000000000001000) (tuple2!22413 Unit!19296 (BitStream!12125 (buf!7123 thiss!890) (bvadd (currentByte!13139 thiss!890) lt!411171 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!13134 thiss!890) lt!411173) #b00000000000000000000000000001000))) (tuple2!22413 Unit!19297 (BitStream!12125 (buf!7123 thiss!890) (bvadd (currentByte!13139 thiss!890) lt!411171) (bvadd (currentBit!13134 thiss!890) lt!411173))))))))

(declare-fun b!273309 () Bool)

(declare-fun e!193201 () Bool)

(assert (=> b!273309 (= e!193200 e!193201)))

(declare-fun res!227485 () Bool)

(assert (=> b!273309 (=> (not res!227485) (not e!193201))))

(declare-fun lt!411168 () (_ BitVec 64))

(declare-fun lt!411172 () tuple2!22412)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273309 (= res!227485 (= (bvadd lt!411168 diffInBits!18) (bitIndex!0 (size!6655 (buf!7123 (_2!12238 lt!411172))) (currentByte!13139 (_2!12238 lt!411172)) (currentBit!13134 (_2!12238 lt!411172)))))))

(assert (=> b!273309 (or (not (= (bvand lt!411168 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand diffInBits!18 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!411168 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!411168 diffInBits!18) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!273309 (= lt!411168 (bitIndex!0 (size!6655 (buf!7123 thiss!890)) (currentByte!13139 thiss!890) (currentBit!13134 thiss!890)))))

(declare-fun lt!411169 () (_ BitVec 32))

(declare-fun lt!411170 () (_ BitVec 32))

(declare-fun Unit!19298 () Unit!19289)

(declare-fun Unit!19299 () Unit!19289)

(declare-fun Unit!19300 () Unit!19289)

(assert (=> b!273309 (= lt!411172 (ite (bvslt (bvadd (currentBit!13134 thiss!890) lt!411169) #b00000000000000000000000000000000) (tuple2!22413 Unit!19298 (BitStream!12125 (buf!7123 thiss!890) (bvsub (bvadd (currentByte!13139 thiss!890) lt!411170) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!411169 (currentBit!13134 thiss!890)))) (ite (bvsge (bvadd (currentBit!13134 thiss!890) lt!411169) #b00000000000000000000000000001000) (tuple2!22413 Unit!19299 (BitStream!12125 (buf!7123 thiss!890) (bvadd (currentByte!13139 thiss!890) lt!411170 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!13134 thiss!890) lt!411169) #b00000000000000000000000000001000))) (tuple2!22413 Unit!19300 (BitStream!12125 (buf!7123 thiss!890) (bvadd (currentByte!13139 thiss!890) lt!411170) (bvadd (currentBit!13134 thiss!890) lt!411169))))))))

(assert (=> b!273309 (= lt!411169 ((_ extract 31 0) (bvsrem diffInBits!18 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273309 (= lt!411170 ((_ extract 31 0) (bvsdiv diffInBits!18 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!273310 () Bool)

(assert (=> b!273310 (= e!193201 (and (= (size!6655 (buf!7123 thiss!890)) (size!6655 (buf!7123 (_2!12238 lt!411172)))) (= (buf!7123 thiss!890) (buf!7123 (_2!12238 lt!411172)))))))

(assert (= (and d!93486 res!227484) b!273309))

(assert (= (and b!273309 res!227485) b!273310))

(assert (=> d!93486 m!406153))

(declare-fun m!406191 () Bool)

(assert (=> b!273309 m!406191))

(declare-fun m!406193 () Bool)

(assert (=> b!273309 m!406193))

(assert (=> b!273283 d!93486))

(declare-fun d!93508 () Bool)

(assert (=> d!93508 (= (array_inv!6379 (buf!7123 thiss!890)) (bvsge (size!6655 (buf!7123 thiss!890)) #b00000000000000000000000000000000))))

(assert (=> b!273284 d!93508))

(declare-fun d!93510 () Bool)

(declare-fun res!227494 () Bool)

(declare-fun e!193210 () Bool)

(assert (=> d!93510 (=> (not res!227494) (not e!193210))))

(assert (=> d!93510 (= res!227494 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6655 (buf!7123 thiss!890)))) diffInBits!18) (bvsle diffInBits!18 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6655 (buf!7123 thiss!890)))))))))

(assert (=> d!93510 (= (moveBitIndexPrecond!0 thiss!890 diffInBits!18) e!193210)))

(declare-fun b!273320 () Bool)

(declare-fun lt!411194 () (_ BitVec 64))

(assert (=> b!273320 (= e!193210 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411194) (bvsle lt!411194 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6655 (buf!7123 thiss!890)))))))))

(assert (=> b!273320 (= lt!411194 (bvadd (bitIndex!0 (size!6655 (buf!7123 thiss!890)) (currentByte!13139 thiss!890) (currentBit!13134 thiss!890)) diffInBits!18))))

(assert (= (and d!93510 res!227494) b!273320))

(assert (=> b!273320 m!406193))

(assert (=> start!59930 d!93510))

(declare-fun d!93514 () Bool)

(assert (=> d!93514 (= (inv!12 thiss!890) (invariant!0 (currentBit!13134 thiss!890) (currentByte!13139 thiss!890) (size!6655 (buf!7123 thiss!890))))))

(declare-fun bs!23580 () Bool)

(assert (= bs!23580 d!93514))

(declare-fun m!406197 () Bool)

(assert (=> bs!23580 m!406197))

(assert (=> start!59930 d!93514))

(push 1)

(assert (not d!93486))

(assert (not d!93514))

(assert (not b!273320))

(assert (not b!273309))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(assert (=> d!93486 d!93510))

(declare-fun d!93522 () Bool)

(assert (=> d!93522 (= (invariant!0 (currentBit!13134 thiss!890) (currentByte!13139 thiss!890) (size!6655 (buf!7123 thiss!890))) (and (bvsge (currentBit!13134 thiss!890) #b00000000000000000000000000000000) (bvslt (currentBit!13134 thiss!890) #b00000000000000000000000000001000) (bvsge (currentByte!13139 thiss!890) #b00000000000000000000000000000000) (or (bvslt (currentByte!13139 thiss!890) (size!6655 (buf!7123 thiss!890))) (and (= (currentBit!13134 thiss!890) #b00000000000000000000000000000000) (= (currentByte!13139 thiss!890) (size!6655 (buf!7123 thiss!890)))))))))

(assert (=> d!93514 d!93522))

(declare-fun d!93524 () Bool)

(declare-fun e!193223 () Bool)

(assert (=> d!93524 e!193223))

(declare-fun res!227514 () Bool)

(assert (=> d!93524 (=> (not res!227514) (not e!193223))))

(declare-fun lt!411250 () (_ BitVec 64))

(declare-fun lt!411254 () (_ BitVec 64))

(declare-fun lt!411253 () (_ BitVec 64))

(assert (=> d!93524 (= res!227514 (= lt!411254 (bvsub lt!411250 lt!411253)))))

(assert (=> d!93524 (or (= (bvand lt!411250 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!411253 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!411250 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!411250 lt!411253) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93524 (= lt!411253 (remainingBits!0 ((_ sign_extend 32) (size!6655 (buf!7123 thiss!890))) ((_ sign_extend 32) (currentByte!13139 thiss!890)) ((_ sign_extend 32) (currentBit!13134 thiss!890))))))

(declare-fun lt!411249 () (_ BitVec 64))

(declare-fun lt!411251 () (_ BitVec 64))

(assert (=> d!93524 (= lt!411250 (bvmul lt!411249 lt!411251))))

(assert (=> d!93524 (or (= lt!411249 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!411251 (bvsdiv (bvmul lt!411249 lt!411251) lt!411249)))))

(assert (=> d!93524 (= lt!411251 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93524 (= lt!411249 ((_ sign_extend 32) (size!6655 (buf!7123 thiss!890))))))

(assert (=> d!93524 (= lt!411254 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13139 thiss!890)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13134 thiss!890))))))

(assert (=> d!93524 (invariant!0 (currentBit!13134 thiss!890) (currentByte!13139 thiss!890) (size!6655 (buf!7123 thiss!890)))))

(assert (=> d!93524 (= (bitIndex!0 (size!6655 (buf!7123 thiss!890)) (currentByte!13139 thiss!890) (currentBit!13134 thiss!890)) lt!411254)))

(declare-fun b!273339 () Bool)

(declare-fun res!227513 () Bool)

(assert (=> b!273339 (=> (not res!227513) (not e!193223))))

(assert (=> b!273339 (= res!227513 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411254))))

(declare-fun b!273340 () Bool)

(declare-fun lt!411252 () (_ BitVec 64))

(assert (=> b!273340 (= e!193223 (bvsle lt!411254 (bvmul lt!411252 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273340 (or (= lt!411252 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!411252 #b0000000000000000000000000000000000000000000000000000000000001000) lt!411252)))))

(assert (=> b!273340 (= lt!411252 ((_ sign_extend 32) (size!6655 (buf!7123 thiss!890))))))

(assert (= (and d!93524 res!227514) b!273339))

(assert (= (and b!273339 res!227513) b!273340))

(declare-fun m!406207 () Bool)

(assert (=> d!93524 m!406207))

(assert (=> d!93524 m!406197))

(assert (=> b!273320 d!93524))

(declare-fun d!93526 () Bool)

(declare-fun e!193224 () Bool)

(assert (=> d!93526 e!193224))

(declare-fun res!227516 () Bool)

(assert (=> d!93526 (=> (not res!227516) (not e!193224))))

(declare-fun lt!411256 () (_ BitVec 64))

(declare-fun lt!411259 () (_ BitVec 64))

(declare-fun lt!411260 () (_ BitVec 64))

(assert (=> d!93526 (= res!227516 (= lt!411260 (bvsub lt!411256 lt!411259)))))

(assert (=> d!93526 (or (= (bvand lt!411256 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!411259 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!411256 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!411256 lt!411259) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!93526 (= lt!411259 (remainingBits!0 ((_ sign_extend 32) (size!6655 (buf!7123 (_2!12238 lt!411172)))) ((_ sign_extend 32) (currentByte!13139 (_2!12238 lt!411172))) ((_ sign_extend 32) (currentBit!13134 (_2!12238 lt!411172)))))))

(declare-fun lt!411255 () (_ BitVec 64))

(declare-fun lt!411257 () (_ BitVec 64))

(assert (=> d!93526 (= lt!411256 (bvmul lt!411255 lt!411257))))

(assert (=> d!93526 (or (= lt!411255 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!411257 (bvsdiv (bvmul lt!411255 lt!411257) lt!411255)))))

(assert (=> d!93526 (= lt!411257 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93526 (= lt!411255 ((_ sign_extend 32) (size!6655 (buf!7123 (_2!12238 lt!411172)))))))

(assert (=> d!93526 (= lt!411260 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13139 (_2!12238 lt!411172))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13134 (_2!12238 lt!411172)))))))

(assert (=> d!93526 (invariant!0 (currentBit!13134 (_2!12238 lt!411172)) (currentByte!13139 (_2!12238 lt!411172)) (size!6655 (buf!7123 (_2!12238 lt!411172))))))

(assert (=> d!93526 (= (bitIndex!0 (size!6655 (buf!7123 (_2!12238 lt!411172))) (currentByte!13139 (_2!12238 lt!411172)) (currentBit!13134 (_2!12238 lt!411172))) lt!411260)))

(declare-fun b!273341 () Bool)

(declare-fun res!227515 () Bool)

(assert (=> b!273341 (=> (not res!227515) (not e!193224))))

(assert (=> b!273341 (= res!227515 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411260))))

(declare-fun b!273342 () Bool)

(declare-fun lt!411258 () (_ BitVec 64))

(assert (=> b!273342 (= e!193224 (bvsle lt!411260 (bvmul lt!411258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273342 (or (= lt!411258 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!411258 #b0000000000000000000000000000000000000000000000000000000000001000) lt!411258)))))

(assert (=> b!273342 (= lt!411258 ((_ sign_extend 32) (size!6655 (buf!7123 (_2!12238 lt!411172)))))))

(assert (= (and d!93526 res!227516) b!273341))

(assert (= (and b!273341 res!227515) b!273342))

(declare-fun m!406209 () Bool)

(assert (=> d!93526 m!406209))

(declare-fun m!406211 () Bool)

(assert (=> d!93526 m!406211))

(assert (=> b!273309 d!93526))

(assert (=> b!273309 d!93524))

(push 1)

(assert (not d!93526))

(assert (not d!93524))

(check-sat)

(pop 1)

(push 1)

(check-sat)

