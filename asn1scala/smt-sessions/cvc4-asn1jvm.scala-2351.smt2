; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59976 () Bool)

(assert start!59976)

(declare-fun res!227533 () Bool)

(declare-fun e!193254 () Bool)

(assert (=> start!59976 (=> (not res!227533) (not e!193254))))

(declare-datatypes ((array!15324 0))(
  ( (array!15325 (arr!7647 (Array (_ BitVec 32) (_ BitVec 8))) (size!6660 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12134 0))(
  ( (BitStream!12135 (buf!7128 array!15324) (currentByte!13150 (_ BitVec 32)) (currentBit!13145 (_ BitVec 32))) )
))
(declare-fun thiss!890 () BitStream!12134)

(declare-fun diffInBits!18 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12134 (_ BitVec 64)) Bool)

(assert (=> start!59976 (= res!227533 (moveBitIndexPrecond!0 thiss!890 diffInBits!18))))

(assert (=> start!59976 e!193254))

(declare-fun e!193255 () Bool)

(declare-fun inv!12 (BitStream!12134) Bool)

(assert (=> start!59976 (and (inv!12 thiss!890) e!193255)))

(assert (=> start!59976 true))

(declare-fun b!273367 () Bool)

(declare-fun lt!411310 () (_ BitVec 64))

(declare-fun lt!411311 () (_ BitVec 64))

(assert (=> b!273367 (= e!193254 (and (= lt!411310 (bvand diffInBits!18 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!411310 (bvand (bvadd lt!411311 diffInBits!18) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!273367 (= lt!411310 (bvand lt!411311 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273367 (= lt!411311 (bitIndex!0 (size!6660 (buf!7128 thiss!890)) (currentByte!13150 thiss!890) (currentBit!13145 thiss!890)))))

(declare-datatypes ((Unit!19317 0))(
  ( (Unit!19318) )
))
(declare-datatypes ((tuple2!22422 0))(
  ( (tuple2!22423 (_1!12243 Unit!19317) (_2!12243 BitStream!12134)) )
))
(declare-fun lt!411309 () tuple2!22422)

(declare-fun moveBitIndex!0 (BitStream!12134 (_ BitVec 64)) tuple2!22422)

(assert (=> b!273367 (= lt!411309 (moveBitIndex!0 thiss!890 diffInBits!18))))

(declare-fun b!273368 () Bool)

(declare-fun array_inv!6384 (array!15324) Bool)

(assert (=> b!273368 (= e!193255 (array_inv!6384 (buf!7128 thiss!890)))))

(assert (= (and start!59976 res!227533) b!273367))

(assert (= start!59976 b!273368))

(declare-fun m!406239 () Bool)

(assert (=> start!59976 m!406239))

(declare-fun m!406241 () Bool)

(assert (=> start!59976 m!406241))

(declare-fun m!406243 () Bool)

(assert (=> b!273367 m!406243))

(declare-fun m!406245 () Bool)

(assert (=> b!273367 m!406245))

(declare-fun m!406247 () Bool)

(assert (=> b!273368 m!406247))

(push 1)

(assert (not start!59976))

(assert (not b!273368))

(assert (not b!273367))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93538 () Bool)

(declare-fun res!227536 () Bool)

(declare-fun e!193258 () Bool)

(assert (=> d!93538 (=> (not res!227536) (not e!193258))))

(assert (=> d!93538 (= res!227536 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6660 (buf!7128 thiss!890)))) diffInBits!18) (bvsle diffInBits!18 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6660 (buf!7128 thiss!890)))))))))

(assert (=> d!93538 (= (moveBitIndexPrecond!0 thiss!890 diffInBits!18) e!193258)))

(declare-fun b!273372 () Bool)

(declare-fun lt!411314 () (_ BitVec 64))

(assert (=> b!273372 (= e!193258 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411314) (bvsle lt!411314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6660 (buf!7128 thiss!890)))))))))

(assert (=> b!273372 (= lt!411314 (bvadd (bitIndex!0 (size!6660 (buf!7128 thiss!890)) (currentByte!13150 thiss!890) (currentBit!13145 thiss!890)) diffInBits!18))))

(assert (= (and d!93538 res!227536) b!273372))

(assert (=> b!273372 m!406243))

(assert (=> start!59976 d!93538))

(declare-fun d!93540 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!93540 (= (inv!12 thiss!890) (invariant!0 (currentBit!13145 thiss!890) (currentByte!13150 thiss!890) (size!6660 (buf!7128 thiss!890))))))

(declare-fun bs!23584 () Bool)

(assert (= bs!23584 d!93540))

(declare-fun m!406249 () Bool)

(assert (=> bs!23584 m!406249))

(assert (=> start!59976 d!93540))

(declare-fun d!93542 () Bool)

(assert (=> d!93542 (= (array_inv!6384 (buf!7128 thiss!890)) (bvsge (size!6660 (buf!7128 thiss!890)) #b00000000000000000000000000000000))))

(assert (=> b!273368 d!93542))

(declare-fun d!93544 () Bool)

(declare-fun e!193264 () Bool)

(assert (=> d!93544 e!193264))

(declare-fun res!227548 () Bool)

(assert (=> d!93544 (=> (not res!227548) (not e!193264))))

(declare-fun lt!411350 () (_ BitVec 64))

(declare-fun lt!411348 () (_ BitVec 64))

(declare-fun lt!411347 () (_ BitVec 64))

(assert (=> d!93544 (= res!227548 (= lt!411347 (bvsub lt!411348 lt!411350)))))

(assert (=> d!93544 (or (= (bvand lt!411348 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!411350 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!411348 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!411348 lt!411350) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93544 (= lt!411350 (remainingBits!0 ((_ sign_extend 32) (size!6660 (buf!7128 thiss!890))) ((_ sign_extend 32) (currentByte!13150 thiss!890)) ((_ sign_extend 32) (currentBit!13145 thiss!890))))))

(declare-fun lt!411345 () (_ BitVec 64))

(declare-fun lt!411346 () (_ BitVec 64))

(assert (=> d!93544 (= lt!411348 (bvmul lt!411345 lt!411346))))

(assert (=> d!93544 (or (= lt!411345 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!411346 (bvsdiv (bvmul lt!411345 lt!411346) lt!411345)))))

(assert (=> d!93544 (= lt!411346 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93544 (= lt!411345 ((_ sign_extend 32) (size!6660 (buf!7128 thiss!890))))))

(assert (=> d!93544 (= lt!411347 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13150 thiss!890)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13145 thiss!890))))))

(assert (=> d!93544 (invariant!0 (currentBit!13145 thiss!890) (currentByte!13150 thiss!890) (size!6660 (buf!7128 thiss!890)))))

(assert (=> d!93544 (= (bitIndex!0 (size!6660 (buf!7128 thiss!890)) (currentByte!13150 thiss!890) (currentBit!13145 thiss!890)) lt!411347)))

(declare-fun b!273383 () Bool)

(declare-fun res!227547 () Bool)

(assert (=> b!273383 (=> (not res!227547) (not e!193264))))

(assert (=> b!273383 (= res!227547 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411347))))

(declare-fun b!273384 () Bool)

(declare-fun lt!411349 () (_ BitVec 64))

(assert (=> b!273384 (= e!193264 (bvsle lt!411347 (bvmul lt!411349 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273384 (or (= lt!411349 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!411349 #b0000000000000000000000000000000000000000000000000000000000001000) lt!411349)))))

(assert (=> b!273384 (= lt!411349 ((_ sign_extend 32) (size!6660 (buf!7128 thiss!890))))))

(assert (= (and d!93544 res!227548) b!273383))

(assert (= (and b!273383 res!227547) b!273384))

(declare-fun m!406255 () Bool)

(assert (=> d!93544 m!406255))

(assert (=> d!93544 m!406249))

(assert (=> b!273367 d!93544))

(declare-fun d!93554 () Bool)

(declare-fun lt!411402 () (_ BitVec 32))

(assert (=> d!93554 (= lt!411402 ((_ extract 31 0) (bvsrem diffInBits!18 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!411405 () (_ BitVec 32))

(assert (=> d!93554 (= lt!411405 ((_ extract 31 0) (bvsdiv diffInBits!18 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!193281 () Bool)

(assert (=> d!93554 e!193281))

(declare-fun res!227568 () Bool)

(assert (=> d!93554 (=> (not res!227568) (not e!193281))))

(assert (=> d!93554 (= res!227568 (moveBitIndexPrecond!0 thiss!890 diffInBits!18))))

(declare-fun Unit!19325 () Unit!19317)

(declare-fun Unit!19326 () Unit!19317)

(declare-fun Unit!19327 () Unit!19317)

(assert (=> d!93554 (= (moveBitIndex!0 thiss!890 diffInBits!18) (ite (bvslt (bvadd (currentBit!13145 thiss!890) lt!411402) #b00000000000000000000000000000000) (tuple2!22423 Unit!19325 (BitStream!12135 (buf!7128 thiss!890) (bvsub (bvadd (currentByte!13150 thiss!890) lt!411405) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!411402 (currentBit!13145 thiss!890)))) (ite (bvsge (bvadd (currentBit!13145 thiss!890) lt!411402) #b00000000000000000000000000001000) (tuple2!22423 Unit!19326 (BitStream!12135 (buf!7128 thiss!890) (bvadd (currentByte!13150 thiss!890) lt!411405 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!13145 thiss!890) lt!411402) #b00000000000000000000000000001000))) (tuple2!22423 Unit!19327 (BitStream!12135 (buf!7128 thiss!890) (bvadd (currentByte!13150 thiss!890) lt!411405) (bvadd (currentBit!13145 thiss!890) lt!411402))))))))

(declare-fun b!273405 () Bool)

(declare-fun e!193282 () Bool)

(assert (=> b!273405 (= e!193281 e!193282)))

(declare-fun res!227569 () Bool)

(assert (=> b!273405 (=> (not res!227569) (not e!193282))))

(declare-fun lt!411407 () tuple2!22422)

(declare-fun lt!411406 () (_ BitVec 64))

(assert (=> b!273405 (= res!227569 (= (bvadd lt!411406 diffInBits!18) (bitIndex!0 (size!6660 (buf!7128 (_2!12243 lt!411407))) (currentByte!13150 (_2!12243 lt!411407)) (currentBit!13145 (_2!12243 lt!411407)))))))

(assert (=> b!273405 (or (not (= (bvand lt!411406 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand diffInBits!18 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!411406 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!411406 diffInBits!18) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!273405 (= lt!411406 (bitIndex!0 (size!6660 (buf!7128 thiss!890)) (currentByte!13150 thiss!890) (currentBit!13145 thiss!890)))))

(declare-fun lt!411404 () (_ BitVec 32))

(declare-fun lt!411403 () (_ BitVec 32))

(declare-fun Unit!19328 () Unit!19317)

(declare-fun Unit!19329 () Unit!19317)

(declare-fun Unit!19330 () Unit!19317)

(assert (=> b!273405 (= lt!411407 (ite (bvslt (bvadd (currentBit!13145 thiss!890) lt!411404) #b00000000000000000000000000000000) (tuple2!22423 Unit!19328 (BitStream!12135 (buf!7128 thiss!890) (bvsub (bvadd (currentByte!13150 thiss!890) lt!411403) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!411404 (currentBit!13145 thiss!890)))) (ite (bvsge (bvadd (currentBit!13145 thiss!890) lt!411404) #b00000000000000000000000000001000) (tuple2!22423 Unit!19329 (BitStream!12135 (buf!7128 thiss!890) (bvadd (currentByte!13150 thiss!890) lt!411403 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!13145 thiss!890) lt!411404) #b00000000000000000000000000001000))) (tuple2!22423 Unit!19330 (BitStream!12135 (buf!7128 thiss!890) (bvadd (currentByte!13150 thiss!890) lt!411403) (bvadd (currentBit!13145 thiss!890) lt!411404))))))))

(assert (=> b!273405 (= lt!411404 ((_ extract 31 0) (bvsrem diffInBits!18 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273405 (= lt!411403 ((_ extract 31 0) (bvsdiv diffInBits!18 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!273406 () Bool)

(assert (=> b!273406 (= e!193282 (and (= (size!6660 (buf!7128 thiss!890)) (size!6660 (buf!7128 (_2!12243 lt!411407)))) (= (buf!7128 thiss!890) (buf!7128 (_2!12243 lt!411407)))))))

(assert (= (and d!93554 res!227568) b!273405))

(assert (= (and b!273405 res!227569) b!273406))

(assert (=> d!93554 m!406239))

(declare-fun m!406263 () Bool)

(assert (=> b!273405 m!406263))

(assert (=> b!273405 m!406243))

(assert (=> b!273367 d!93554))

(push 1)

