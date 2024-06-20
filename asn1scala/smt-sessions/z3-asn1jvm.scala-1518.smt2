; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42424 () Bool)

(assert start!42424)

(declare-fun b!200491 () Bool)

(declare-fun res!167850 () Bool)

(declare-fun e!137529 () Bool)

(assert (=> b!200491 (=> (not res!167850) (not e!137529))))

(declare-datatypes ((array!10138 0))(
  ( (array!10139 (arr!5396 (Array (_ BitVec 32) (_ BitVec 8))) (size!4466 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8040 0))(
  ( (BitStream!8041 (buf!4967 array!10138) (currentByte!9329 (_ BitVec 32)) (currentBit!9324 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8040)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!200491 (= res!167850 (invariant!0 (currentBit!9324 thiss!1204) (currentByte!9329 thiss!1204) (size!4466 (buf!4967 thiss!1204))))))

(declare-fun b!200492 () Bool)

(declare-fun res!167849 () Bool)

(assert (=> b!200492 (=> (not res!167849) (not e!137529))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!200492 (= res!167849 (validate_offset_bits!1 ((_ sign_extend 32) (size!4466 (buf!4967 thiss!1204))) ((_ sign_extend 32) (currentByte!9329 thiss!1204)) ((_ sign_extend 32) (currentBit!9324 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun lt!313464 () (_ BitVec 64))

(declare-fun b!200493 () Bool)

(declare-fun lt!313465 () (_ BitVec 64))

(assert (=> b!200493 (= e!137529 (and (= lt!313464 (bvand ((_ sign_extend 32) nBits!348) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!313464 (bvand (bvadd lt!313465 ((_ sign_extend 32) nBits!348)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!200493 (= lt!313464 (bvand lt!313465 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!200493 (= lt!313465 (bitIndex!0 (size!4466 (buf!4967 thiss!1204)) (currentByte!9329 thiss!1204) (currentBit!9324 thiss!1204)))))

(declare-fun b!200494 () Bool)

(declare-fun e!137530 () Bool)

(declare-fun array_inv!4207 (array!10138) Bool)

(assert (=> b!200494 (= e!137530 (array_inv!4207 (buf!4967 thiss!1204)))))

(declare-fun res!167847 () Bool)

(assert (=> start!42424 (=> (not res!167847) (not e!137529))))

(assert (=> start!42424 (= res!167847 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42424 e!137529))

(assert (=> start!42424 true))

(declare-fun inv!12 (BitStream!8040) Bool)

(assert (=> start!42424 (and (inv!12 thiss!1204) e!137530)))

(declare-fun b!200495 () Bool)

(declare-fun res!167848 () Bool)

(assert (=> b!200495 (=> (not res!167848) (not e!137529))))

(assert (=> b!200495 (= res!167848 (= i!590 nBits!348))))

(assert (= (and start!42424 res!167847) b!200492))

(assert (= (and b!200492 res!167849) b!200491))

(assert (= (and b!200491 res!167850) b!200495))

(assert (= (and b!200495 res!167848) b!200493))

(assert (= start!42424 b!200494))

(declare-fun m!311297 () Bool)

(assert (=> b!200494 m!311297))

(declare-fun m!311299 () Bool)

(assert (=> start!42424 m!311299))

(declare-fun m!311301 () Bool)

(assert (=> b!200493 m!311301))

(declare-fun m!311303 () Bool)

(assert (=> b!200492 m!311303))

(declare-fun m!311305 () Bool)

(assert (=> b!200491 m!311305))

(check-sat (not b!200491) (not b!200494) (not start!42424) (not b!200493) (not b!200492))
(check-sat)
(get-model)

(declare-fun d!68761 () Bool)

(assert (=> d!68761 (= (invariant!0 (currentBit!9324 thiss!1204) (currentByte!9329 thiss!1204) (size!4466 (buf!4967 thiss!1204))) (and (bvsge (currentBit!9324 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9324 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9329 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9329 thiss!1204) (size!4466 (buf!4967 thiss!1204))) (and (= (currentBit!9324 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9329 thiss!1204) (size!4466 (buf!4967 thiss!1204)))))))))

(assert (=> b!200491 d!68761))

(declare-fun d!68763 () Bool)

(assert (=> d!68763 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9324 thiss!1204) (currentByte!9329 thiss!1204) (size!4466 (buf!4967 thiss!1204))))))

(declare-fun bs!16935 () Bool)

(assert (= bs!16935 d!68763))

(assert (=> bs!16935 m!311305))

(assert (=> start!42424 d!68763))

(declare-fun d!68769 () Bool)

(assert (=> d!68769 (= (array_inv!4207 (buf!4967 thiss!1204)) (bvsge (size!4466 (buf!4967 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!200494 d!68769))

(declare-fun d!68771 () Bool)

(declare-fun e!137543 () Bool)

(assert (=> d!68771 e!137543))

(declare-fun res!167867 () Bool)

(assert (=> d!68771 (=> (not res!167867) (not e!137543))))

(declare-fun lt!313487 () (_ BitVec 64))

(declare-fun lt!313486 () (_ BitVec 64))

(declare-fun lt!313489 () (_ BitVec 64))

(assert (=> d!68771 (= res!167867 (= lt!313489 (bvsub lt!313486 lt!313487)))))

(assert (=> d!68771 (or (= (bvand lt!313486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!313487 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!313486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!313486 lt!313487) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!68771 (= lt!313487 (remainingBits!0 ((_ sign_extend 32) (size!4466 (buf!4967 thiss!1204))) ((_ sign_extend 32) (currentByte!9329 thiss!1204)) ((_ sign_extend 32) (currentBit!9324 thiss!1204))))))

(declare-fun lt!313488 () (_ BitVec 64))

(declare-fun lt!313485 () (_ BitVec 64))

(assert (=> d!68771 (= lt!313486 (bvmul lt!313488 lt!313485))))

(assert (=> d!68771 (or (= lt!313488 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!313485 (bvsdiv (bvmul lt!313488 lt!313485) lt!313488)))))

(assert (=> d!68771 (= lt!313485 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68771 (= lt!313488 ((_ sign_extend 32) (size!4466 (buf!4967 thiss!1204))))))

(assert (=> d!68771 (= lt!313489 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9329 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9324 thiss!1204))))))

(assert (=> d!68771 (invariant!0 (currentBit!9324 thiss!1204) (currentByte!9329 thiss!1204) (size!4466 (buf!4967 thiss!1204)))))

(assert (=> d!68771 (= (bitIndex!0 (size!4466 (buf!4967 thiss!1204)) (currentByte!9329 thiss!1204) (currentBit!9324 thiss!1204)) lt!313489)))

(declare-fun b!200515 () Bool)

(declare-fun res!167868 () Bool)

(assert (=> b!200515 (=> (not res!167868) (not e!137543))))

(assert (=> b!200515 (= res!167868 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!313489))))

(declare-fun b!200516 () Bool)

(declare-fun lt!313484 () (_ BitVec 64))

(assert (=> b!200516 (= e!137543 (bvsle lt!313489 (bvmul lt!313484 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!200516 (or (= lt!313484 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!313484 #b0000000000000000000000000000000000000000000000000000000000001000) lt!313484)))))

(assert (=> b!200516 (= lt!313484 ((_ sign_extend 32) (size!4466 (buf!4967 thiss!1204))))))

(assert (= (and d!68771 res!167867) b!200515))

(assert (= (and b!200515 res!167868) b!200516))

(declare-fun m!311317 () Bool)

(assert (=> d!68771 m!311317))

(assert (=> d!68771 m!311305))

(assert (=> b!200493 d!68771))

(declare-fun d!68777 () Bool)

(assert (=> d!68777 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4466 (buf!4967 thiss!1204))) ((_ sign_extend 32) (currentByte!9329 thiss!1204)) ((_ sign_extend 32) (currentBit!9324 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4466 (buf!4967 thiss!1204))) ((_ sign_extend 32) (currentByte!9329 thiss!1204)) ((_ sign_extend 32) (currentBit!9324 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!16937 () Bool)

(assert (= bs!16937 d!68777))

(assert (=> bs!16937 m!311317))

(assert (=> b!200492 d!68777))

(check-sat (not d!68777) (not d!68771) (not d!68763))
