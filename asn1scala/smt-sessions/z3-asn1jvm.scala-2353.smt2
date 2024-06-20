; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60046 () Bool)

(assert start!60046)

(declare-fun res!227659 () Bool)

(declare-fun e!193384 () Bool)

(assert (=> start!60046 (=> (not res!227659) (not e!193384))))

(declare-datatypes ((array!15340 0))(
  ( (array!15341 (arr!7652 (Array (_ BitVec 32) (_ BitVec 8))) (size!6665 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12144 0))(
  ( (BitStream!12145 (buf!7133 array!15340) (currentByte!13161 (_ BitVec 32)) (currentBit!13156 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12144)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12144 (_ BitVec 64)) Bool)

(assert (=> start!60046 (= res!227659 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60046 e!193384))

(declare-fun e!193383 () Bool)

(declare-fun inv!12 (BitStream!12144) Bool)

(assert (=> start!60046 (and (inv!12 thiss!882) e!193383)))

(assert (=> start!60046 true))

(declare-fun b!273513 () Bool)

(declare-fun res!227658 () Bool)

(assert (=> b!273513 (=> (not res!227658) (not e!193384))))

(assert (=> b!273513 (= res!227658 (bvslt (bvadd (currentBit!13156 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000000))))

(declare-fun b!273514 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!273514 (= e!193384 (not (invariant!0 (currentBit!13156 thiss!882) (currentByte!13161 thiss!882) (size!6665 (buf!7133 thiss!882)))))))

(declare-fun b!273515 () Bool)

(declare-fun array_inv!6389 (array!15340) Bool)

(assert (=> b!273515 (= e!193383 (array_inv!6389 (buf!7133 thiss!882)))))

(assert (= (and start!60046 res!227659) b!273513))

(assert (= (and b!273513 res!227658) b!273514))

(assert (= start!60046 b!273515))

(declare-fun m!406341 () Bool)

(assert (=> start!60046 m!406341))

(declare-fun m!406343 () Bool)

(assert (=> start!60046 m!406343))

(declare-fun m!406345 () Bool)

(assert (=> b!273514 m!406345))

(declare-fun m!406347 () Bool)

(assert (=> b!273515 m!406347))

(check-sat (not start!60046) (not b!273514) (not b!273515))
(check-sat)
(get-model)

(declare-fun d!93618 () Bool)

(declare-fun res!227668 () Bool)

(declare-fun e!193396 () Bool)

(assert (=> d!93618 (=> (not res!227668) (not e!193396))))

(assert (=> d!93618 (= res!227668 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6665 (buf!7133 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6665 (buf!7133 thiss!882)))))))))

(assert (=> d!93618 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!193396)))

(declare-fun b!273528 () Bool)

(declare-fun lt!411575 () (_ BitVec 64))

(assert (=> b!273528 (= e!193396 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411575) (bvsle lt!411575 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6665 (buf!7133 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273528 (= lt!411575 (bvadd (bitIndex!0 (size!6665 (buf!7133 thiss!882)) (currentByte!13161 thiss!882) (currentBit!13156 thiss!882)) diffInBits!15))))

(assert (= (and d!93618 res!227668) b!273528))

(declare-fun m!406357 () Bool)

(assert (=> b!273528 m!406357))

(assert (=> start!60046 d!93618))

(declare-fun d!93620 () Bool)

(assert (=> d!93620 (= (inv!12 thiss!882) (invariant!0 (currentBit!13156 thiss!882) (currentByte!13161 thiss!882) (size!6665 (buf!7133 thiss!882))))))

(declare-fun bs!23595 () Bool)

(assert (= bs!23595 d!93620))

(assert (=> bs!23595 m!406345))

(assert (=> start!60046 d!93620))

(declare-fun d!93622 () Bool)

(assert (=> d!93622 (= (invariant!0 (currentBit!13156 thiss!882) (currentByte!13161 thiss!882) (size!6665 (buf!7133 thiss!882))) (and (bvsge (currentBit!13156 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13156 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13161 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13161 thiss!882) (size!6665 (buf!7133 thiss!882))) (and (= (currentBit!13156 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13161 thiss!882) (size!6665 (buf!7133 thiss!882)))))))))

(assert (=> b!273514 d!93622))

(declare-fun d!93624 () Bool)

(assert (=> d!93624 (= (array_inv!6389 (buf!7133 thiss!882)) (bvsge (size!6665 (buf!7133 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!273515 d!93624))

(check-sat (not d!93620) (not b!273528))
(check-sat)
