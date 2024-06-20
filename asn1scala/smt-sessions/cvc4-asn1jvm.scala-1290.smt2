; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36680 () Bool)

(assert start!36680)

(declare-fun b!168334 () Bool)

(declare-fun res!140100 () Bool)

(declare-fun e!116949 () Bool)

(assert (=> b!168334 (=> (not res!140100) (not e!116949))))

(declare-datatypes ((array!8752 0))(
  ( (array!8753 (arr!4806 (Array (_ BitVec 32) (_ BitVec 8))) (size!3885 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6926 0))(
  ( (BitStream!6927 (buf!4337 array!8752) (currentByte!8201 (_ BitVec 32)) (currentBit!8196 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6926)

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> b!168334 (= res!140100 (bvsle (bvadd (currentBit!8196 thiss!1894) nBits!600) #b00000000000000000000000000001000))))

(declare-fun b!168335 () Bool)

(declare-fun moveBitIndexPrecond!0 (BitStream!6926 (_ BitVec 64)) Bool)

(assert (=> b!168335 (= e!116949 (not (moveBitIndexPrecond!0 thiss!1894 ((_ sign_extend 32) nBits!600))))))

(declare-fun b!168336 () Bool)

(declare-fun e!116948 () Bool)

(declare-fun array_inv!3626 (array!8752) Bool)

(assert (=> b!168336 (= e!116948 (array_inv!3626 (buf!4337 thiss!1894)))))

(declare-fun b!168333 () Bool)

(declare-fun res!140101 () Bool)

(assert (=> b!168333 (=> (not res!140101) (not e!116949))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168333 (= res!140101 (validate_offset_bits!1 ((_ sign_extend 32) (size!3885 (buf!4337 thiss!1894))) ((_ sign_extend 32) (currentByte!8201 thiss!1894)) ((_ sign_extend 32) (currentBit!8196 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun res!140102 () Bool)

(assert (=> start!36680 (=> (not res!140102) (not e!116949))))

(assert (=> start!36680 (= res!140102 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!36680 e!116949))

(assert (=> start!36680 true))

(declare-fun inv!12 (BitStream!6926) Bool)

(assert (=> start!36680 (and (inv!12 thiss!1894) e!116948)))

(assert (= (and start!36680 res!140102) b!168333))

(assert (= (and b!168333 res!140101) b!168334))

(assert (= (and b!168334 res!140100) b!168335))

(assert (= start!36680 b!168336))

(declare-fun m!267955 () Bool)

(assert (=> b!168335 m!267955))

(declare-fun m!267957 () Bool)

(assert (=> b!168336 m!267957))

(declare-fun m!267959 () Bool)

(assert (=> b!168333 m!267959))

(declare-fun m!267961 () Bool)

(assert (=> start!36680 m!267961))

(push 1)

(assert (not start!36680))

(assert (not b!168333))

(assert (not b!168335))

(assert (not b!168336))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59259 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59259 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8196 thiss!1894) (currentByte!8201 thiss!1894) (size!3885 (buf!4337 thiss!1894))))))

(declare-fun bs!14685 () Bool)

(assert (= bs!14685 d!59259))

(declare-fun m!267963 () Bool)

(assert (=> bs!14685 m!267963))

(assert (=> start!36680 d!59259))

(declare-fun d!59261 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59261 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3885 (buf!4337 thiss!1894))) ((_ sign_extend 32) (currentByte!8201 thiss!1894)) ((_ sign_extend 32) (currentBit!8196 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3885 (buf!4337 thiss!1894))) ((_ sign_extend 32) (currentByte!8201 thiss!1894)) ((_ sign_extend 32) (currentBit!8196 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14686 () Bool)

(assert (= bs!14686 d!59261))

(declare-fun m!267965 () Bool)

(assert (=> bs!14686 m!267965))

(assert (=> b!168333 d!59261))

(declare-fun d!59263 () Bool)

(declare-fun res!140110 () Bool)

(declare-fun e!116957 () Bool)

(assert (=> d!59263 (=> (not res!140110) (not e!116957))))

(assert (=> d!59263 (= res!140110 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!3885 (buf!4337 thiss!1894)))) ((_ sign_extend 32) nBits!600)) (bvsle ((_ sign_extend 32) nBits!600) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3885 (buf!4337 thiss!1894)))))))))

(assert (=> d!59263 (= (moveBitIndexPrecond!0 thiss!1894 ((_ sign_extend 32) nBits!600)) e!116957)))

(declare-fun b!168347 () Bool)

(declare-fun lt!261597 () (_ BitVec 64))

(assert (=> b!168347 (= e!116957 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261597) (bvsle lt!261597 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3885 (buf!4337 thiss!1894)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!168347 (= lt!261597 (bvadd (bitIndex!0 (size!3885 (buf!4337 thiss!1894)) (currentByte!8201 thiss!1894) (currentBit!8196 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(assert (= (and d!59263 res!140110) b!168347))

(declare-fun m!267971 () Bool)

(assert (=> b!168347 m!267971))

(assert (=> b!168335 d!59263))

(declare-fun d!59271 () Bool)

(assert (=> d!59271 (= (array_inv!3626 (buf!4337 thiss!1894)) (bvsge (size!3885 (buf!4337 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168336 d!59271))

(push 1)

(assert (not b!168347))

(assert (not d!59259))

(assert (not d!59261))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59287 () Bool)

(declare-fun e!116967 () Bool)

(assert (=> d!59287 e!116967))

(declare-fun res!140128 () Bool)

(assert (=> d!59287 (=> (not res!140128) (not e!116967))))

(declare-fun lt!261650 () (_ BitVec 64))

(declare-fun lt!261648 () (_ BitVec 64))

(declare-fun lt!261647 () (_ BitVec 64))

(assert (=> d!59287 (= res!140128 (= lt!261650 (bvsub lt!261648 lt!261647)))))

(assert (=> d!59287 (or (= (bvand lt!261648 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261647 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!261648 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261648 lt!261647) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59287 (= lt!261647 (remainingBits!0 ((_ sign_extend 32) (size!3885 (buf!4337 thiss!1894))) ((_ sign_extend 32) (currentByte!8201 thiss!1894)) ((_ sign_extend 32) (currentBit!8196 thiss!1894))))))

(declare-fun lt!261651 () (_ BitVec 64))

(declare-fun lt!261649 () (_ BitVec 64))

(assert (=> d!59287 (= lt!261648 (bvmul lt!261651 lt!261649))))

(assert (=> d!59287 (or (= lt!261651 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!261649 (bvsdiv (bvmul lt!261651 lt!261649) lt!261651)))))

(assert (=> d!59287 (= lt!261649 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!59287 (= lt!261651 ((_ sign_extend 32) (size!3885 (buf!4337 thiss!1894))))))

(assert (=> d!59287 (= lt!261650 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8201 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8196 thiss!1894))))))

(assert (=> d!59287 (invariant!0 (currentBit!8196 thiss!1894) (currentByte!8201 thiss!1894) (size!3885 (buf!4337 thiss!1894)))))

(assert (=> d!59287 (= (bitIndex!0 (size!3885 (buf!4337 thiss!1894)) (currentByte!8201 thiss!1894) (currentBit!8196 thiss!1894)) lt!261650)))

(declare-fun b!168365 () Bool)

(declare-fun res!140129 () Bool)

(assert (=> b!168365 (=> (not res!140129) (not e!116967))))

(assert (=> b!168365 (= res!140129 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261650))))

(declare-fun b!168366 () Bool)

(declare-fun lt!261652 () (_ BitVec 64))

(assert (=> b!168366 (= e!116967 (bvsle lt!261650 (bvmul lt!261652 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168366 (or (= lt!261652 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!261652 #b0000000000000000000000000000000000000000000000000000000000001000) lt!261652)))))

(assert (=> b!168366 (= lt!261652 ((_ sign_extend 32) (size!3885 (buf!4337 thiss!1894))))))

(assert (= (and d!59287 res!140128) b!168365))

(assert (= (and b!168365 res!140129) b!168366))

(assert (=> d!59287 m!267965))

(assert (=> d!59287 m!267963))

(assert (=> b!168347 d!59287))

(declare-fun d!59293 () Bool)

(assert (=> d!59293 (= (invariant!0 (currentBit!8196 thiss!1894) (currentByte!8201 thiss!1894) (size!3885 (buf!4337 thiss!1894))) (and (bvsge (currentBit!8196 thiss!1894) #b00000000000000000000000000000000) (bvslt (currentBit!8196 thiss!1894) #b00000000000000000000000000001000) (bvsge (currentByte!8201 thiss!1894) #b00000000000000000000000000000000) (or (bvslt (currentByte!8201 thiss!1894) (size!3885 (buf!4337 thiss!1894))) (and (= (currentBit!8196 thiss!1894) #b00000000000000000000000000000000) (= (currentByte!8201 thiss!1894) (size!3885 (buf!4337 thiss!1894)))))))))

(assert (=> d!59259 d!59293))

(declare-fun d!59295 () Bool)

(assert (=> d!59295 (= (remainingBits!0 ((_ sign_extend 32) (size!3885 (buf!4337 thiss!1894))) ((_ sign_extend 32) (currentByte!8201 thiss!1894)) ((_ sign_extend 32) (currentBit!8196 thiss!1894))) (bvsub (bvmul ((_ sign_extend 32) (size!3885 (buf!4337 thiss!1894))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8201 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8196 thiss!1894)))))))

(assert (=> d!59261 d!59295))

(push 1)

(assert (not d!59287))

(check-sat)

(pop 1)

(push 1)

(check-sat)

