; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37124 () Bool)

(assert start!37124)

(declare-fun res!140504 () Bool)

(declare-fun e!117456 () Bool)

(assert (=> start!37124 (=> (not res!140504) (not e!117456))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!37124 (= res!140504 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!37124 e!117456))

(assert (=> start!37124 true))

(declare-datatypes ((array!8875 0))(
  ( (array!8876 (arr!4851 (Array (_ BitVec 32) (_ BitVec 8))) (size!3930 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7016 0))(
  ( (BitStream!7017 (buf!4382 array!8875) (currentByte!8345 (_ BitVec 32)) (currentBit!8340 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!7016)

(declare-fun e!117455 () Bool)

(declare-fun inv!12 (BitStream!7016) Bool)

(assert (=> start!37124 (and (inv!12 thiss!1894) e!117455)))

(declare-fun b!168912 () Bool)

(declare-fun res!140502 () Bool)

(assert (=> b!168912 (=> (not res!140502) (not e!117456))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168912 (= res!140502 (validate_offset_bits!1 ((_ sign_extend 32) (size!3930 (buf!4382 thiss!1894))) ((_ sign_extend 32) (currentByte!8345 thiss!1894)) ((_ sign_extend 32) (currentBit!8340 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168915 () Bool)

(declare-fun array_inv!3671 (array!8875) Bool)

(assert (=> b!168915 (= e!117455 (array_inv!3671 (buf!4382 thiss!1894)))))

(declare-fun b!168914 () Bool)

(assert (=> b!168914 (= e!117456 (not (inv!12 (BitStream!7017 (buf!4382 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8345 thiss!1894)) (bvsub (bvadd (currentBit!8340 thiss!1894) nBits!600) #b00000000000000000000000000001000)))))))

(declare-fun b!168913 () Bool)

(declare-fun res!140503 () Bool)

(assert (=> b!168913 (=> (not res!140503) (not e!117456))))

(assert (=> b!168913 (= res!140503 (bvsgt (bvadd (currentBit!8340 thiss!1894) nBits!600) #b00000000000000000000000000001000))))

(assert (= (and start!37124 res!140504) b!168912))

(assert (= (and b!168912 res!140502) b!168913))

(assert (= (and b!168913 res!140503) b!168914))

(assert (= start!37124 b!168915))

(declare-fun m!268483 () Bool)

(assert (=> start!37124 m!268483))

(declare-fun m!268485 () Bool)

(assert (=> b!168912 m!268485))

(declare-fun m!268487 () Bool)

(assert (=> b!168915 m!268487))

(declare-fun m!268489 () Bool)

(assert (=> b!168914 m!268489))

(push 1)

(assert (not b!168912))

(assert (not start!37124))

(assert (not b!168915))

(assert (not b!168914))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59687 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59687 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3930 (buf!4382 thiss!1894))) ((_ sign_extend 32) (currentByte!8345 thiss!1894)) ((_ sign_extend 32) (currentBit!8340 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3930 (buf!4382 thiss!1894))) ((_ sign_extend 32) (currentByte!8345 thiss!1894)) ((_ sign_extend 32) (currentBit!8340 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14803 () Bool)

(assert (= bs!14803 d!59687))

(declare-fun m!268499 () Bool)

(assert (=> bs!14803 m!268499))

(assert (=> b!168912 d!59687))

(declare-fun d!59691 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59691 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8340 thiss!1894) (currentByte!8345 thiss!1894) (size!3930 (buf!4382 thiss!1894))))))

(declare-fun bs!14806 () Bool)

(assert (= bs!14806 d!59691))

(declare-fun m!268505 () Bool)

(assert (=> bs!14806 m!268505))

(assert (=> start!37124 d!59691))

(declare-fun d!59695 () Bool)

(assert (=> d!59695 (= (array_inv!3671 (buf!4382 thiss!1894)) (bvsge (size!3930 (buf!4382 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168915 d!59695))

(declare-fun d!59697 () Bool)

(assert (=> d!59697 (= (inv!12 (BitStream!7017 (buf!4382 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8345 thiss!1894)) (bvsub (bvadd (currentBit!8340 thiss!1894) nBits!600) #b00000000000000000000000000001000))) (invariant!0 (currentBit!8340 (BitStream!7017 (buf!4382 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8345 thiss!1894)) (bvsub (bvadd (currentBit!8340 thiss!1894) nBits!600) #b00000000000000000000000000001000))) (currentByte!8345 (BitStream!7017 (buf!4382 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8345 thiss!1894)) (bvsub (bvadd (currentBit!8340 thiss!1894) nBits!600) #b00000000000000000000000000001000))) (size!3930 (buf!4382 (BitStream!7017 (buf!4382 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8345 thiss!1894)) (bvsub (bvadd (currentBit!8340 thiss!1894) nBits!600) #b00000000000000000000000000001000))))))))

(declare-fun bs!14807 () Bool)

(assert (= bs!14807 d!59697))

(declare-fun m!268507 () Bool)

(assert (=> bs!14807 m!268507))

(assert (=> b!168914 d!59697))

(push 1)

(assert (not d!59697))

(assert (not d!59691))

(assert (not d!59687))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59711 () Bool)

(assert (=> d!59711 (= (invariant!0 (currentBit!8340 (BitStream!7017 (buf!4382 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8345 thiss!1894)) (bvsub (bvadd (currentBit!8340 thiss!1894) nBits!600) #b00000000000000000000000000001000))) (currentByte!8345 (BitStream!7017 (buf!4382 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8345 thiss!1894)) (bvsub (bvadd (currentBit!8340 thiss!1894) nBits!600) #b00000000000000000000000000001000))) (size!3930 (buf!4382 (BitStream!7017 (buf!4382 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8345 thiss!1894)) (bvsub (bvadd (currentBit!8340 thiss!1894) nBits!600) #b00000000000000000000000000001000))))) (and (bvsge (currentBit!8340 (BitStream!7017 (buf!4382 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8345 thiss!1894)) (bvsub (bvadd (currentBit!8340 thiss!1894) nBits!600) #b00000000000000000000000000001000))) #b00000000000000000000000000000000) (bvslt (currentBit!8340 (BitStream!7017 (buf!4382 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8345 thiss!1894)) (bvsub (bvadd (currentBit!8340 thiss!1894) nBits!600) #b00000000000000000000000000001000))) #b00000000000000000000000000001000) (bvsge (currentByte!8345 (BitStream!7017 (buf!4382 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8345 thiss!1894)) (bvsub (bvadd (currentBit!8340 thiss!1894) nBits!600) #b00000000000000000000000000001000))) #b00000000000000000000000000000000) (or (bvslt (currentByte!8345 (BitStream!7017 (buf!4382 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8345 thiss!1894)) (bvsub (bvadd (currentBit!8340 thiss!1894) nBits!600) #b00000000000000000000000000001000))) (size!3930 (buf!4382 (BitStream!7017 (buf!4382 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8345 thiss!1894)) (bvsub (bvadd (currentBit!8340 thiss!1894) nBits!600) #b00000000000000000000000000001000))))) (and (= (currentBit!8340 (BitStream!7017 (buf!4382 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8345 thiss!1894)) (bvsub (bvadd (currentBit!8340 thiss!1894) nBits!600) #b00000000000000000000000000001000))) #b00000000000000000000000000000000) (= (currentByte!8345 (BitStream!7017 (buf!4382 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8345 thiss!1894)) (bvsub (bvadd (currentBit!8340 thiss!1894) nBits!600) #b00000000000000000000000000001000))) (size!3930 (buf!4382 (BitStream!7017 (buf!4382 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8345 thiss!1894)) (bvsub (bvadd (currentBit!8340 thiss!1894) nBits!600) #b00000000000000000000000000001000)))))))))))

(assert (=> d!59697 d!59711))

(declare-fun d!59713 () Bool)

(assert (=> d!59713 (= (invariant!0 (currentBit!8340 thiss!1894) (currentByte!8345 thiss!1894) (size!3930 (buf!4382 thiss!1894))) (and (bvsge (currentBit!8340 thiss!1894) #b00000000000000000000000000000000) (bvslt (currentBit!8340 thiss!1894) #b00000000000000000000000000001000) (bvsge (currentByte!8345 thiss!1894) #b00000000000000000000000000000000) (or (bvslt (currentByte!8345 thiss!1894) (size!3930 (buf!4382 thiss!1894))) (and (= (currentBit!8340 thiss!1894) #b00000000000000000000000000000000) (= (currentByte!8345 thiss!1894) (size!3930 (buf!4382 thiss!1894)))))))))

(assert (=> d!59691 d!59713))

(declare-fun d!59715 () Bool)

(assert (=> d!59715 (= (remainingBits!0 ((_ sign_extend 32) (size!3930 (buf!4382 thiss!1894))) ((_ sign_extend 32) (currentByte!8345 thiss!1894)) ((_ sign_extend 32) (currentBit!8340 thiss!1894))) (bvsub (bvmul ((_ sign_extend 32) (size!3930 (buf!4382 thiss!1894))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8345 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8340 thiss!1894)))))))

(assert (=> d!59687 d!59715))

(push 1)

(check-sat)

(pop 1)

