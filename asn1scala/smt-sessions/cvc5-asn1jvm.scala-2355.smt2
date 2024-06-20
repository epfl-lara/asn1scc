; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60104 () Bool)

(assert start!60104)

(declare-fun res!227725 () Bool)

(declare-fun e!193468 () Bool)

(assert (=> start!60104 (=> (not res!227725) (not e!193468))))

(declare-datatypes ((array!15355 0))(
  ( (array!15356 (arr!7657 (Array (_ BitVec 32) (_ BitVec 8))) (size!6670 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12154 0))(
  ( (BitStream!12155 (buf!7138 array!15355) (currentByte!13174 (_ BitVec 32)) (currentBit!13169 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12154)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12154 (_ BitVec 64)) Bool)

(assert (=> start!60104 (= res!227725 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60104 e!193468))

(declare-fun e!193465 () Bool)

(declare-fun inv!12 (BitStream!12154) Bool)

(assert (=> start!60104 (and (inv!12 thiss!882) e!193465)))

(assert (=> start!60104 true))

(declare-fun b!273600 () Bool)

(declare-fun e!193466 () Bool)

(assert (=> b!273600 (= e!193468 e!193466)))

(declare-fun res!227724 () Bool)

(assert (=> b!273600 (=> (not res!227724) (not e!193466))))

(declare-fun lt!411656 () (_ BitVec 32))

(assert (=> b!273600 (= res!227724 (and (bvsge lt!411656 #b00000000000000000000000000000000) (bvsge lt!411656 #b00000000000000000000000000001000)))))

(assert (=> b!273600 (= lt!411656 (bvadd (currentBit!13169 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!273601 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!273601 (= e!193466 (not (invariant!0 (currentBit!13169 thiss!882) (currentByte!13174 thiss!882) (size!6670 (buf!7138 thiss!882)))))))

(declare-fun b!273602 () Bool)

(declare-fun array_inv!6394 (array!15355) Bool)

(assert (=> b!273602 (= e!193465 (array_inv!6394 (buf!7138 thiss!882)))))

(assert (= (and start!60104 res!227725) b!273600))

(assert (= (and b!273600 res!227724) b!273601))

(assert (= start!60104 b!273602))

(declare-fun m!406403 () Bool)

(assert (=> start!60104 m!406403))

(declare-fun m!406405 () Bool)

(assert (=> start!60104 m!406405))

(declare-fun m!406407 () Bool)

(assert (=> b!273601 m!406407))

(declare-fun m!406409 () Bool)

(assert (=> b!273602 m!406409))

(push 1)

(assert (not b!273601))

(assert (not b!273602))

(assert (not start!60104))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93678 () Bool)

(assert (=> d!93678 (= (invariant!0 (currentBit!13169 thiss!882) (currentByte!13174 thiss!882) (size!6670 (buf!7138 thiss!882))) (and (bvsge (currentBit!13169 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13169 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13174 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13174 thiss!882) (size!6670 (buf!7138 thiss!882))) (and (= (currentBit!13169 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13174 thiss!882) (size!6670 (buf!7138 thiss!882)))))))))

(assert (=> b!273601 d!93678))

(declare-fun d!93680 () Bool)

(assert (=> d!93680 (= (array_inv!6394 (buf!7138 thiss!882)) (bvsge (size!6670 (buf!7138 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!273602 d!93680))

(declare-fun d!93682 () Bool)

(declare-fun res!227743 () Bool)

(declare-fun e!193498 () Bool)

(assert (=> d!93682 (=> (not res!227743) (not e!193498))))

(assert (=> d!93682 (= res!227743 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6670 (buf!7138 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6670 (buf!7138 thiss!882)))))))))

(assert (=> d!93682 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!193498)))

(declare-fun b!273628 () Bool)

(declare-fun lt!411668 () (_ BitVec 64))

(assert (=> b!273628 (= e!193498 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411668) (bvsle lt!411668 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6670 (buf!7138 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273628 (= lt!411668 (bvadd (bitIndex!0 (size!6670 (buf!7138 thiss!882)) (currentByte!13174 thiss!882) (currentBit!13169 thiss!882)) diffInBits!15))))

(assert (= (and d!93682 res!227743) b!273628))

(declare-fun m!406429 () Bool)

(assert (=> b!273628 m!406429))

(assert (=> start!60104 d!93682))

(declare-fun d!93692 () Bool)

(assert (=> d!93692 (= (inv!12 thiss!882) (invariant!0 (currentBit!13169 thiss!882) (currentByte!13174 thiss!882) (size!6670 (buf!7138 thiss!882))))))

(declare-fun bs!23607 () Bool)

(assert (= bs!23607 d!93692))

(assert (=> bs!23607 m!406407))

(assert (=> start!60104 d!93692))

(push 1)

(assert (not d!93692))

(assert (not b!273628))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

