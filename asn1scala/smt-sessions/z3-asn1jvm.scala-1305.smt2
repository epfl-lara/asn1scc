; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37122 () Bool)

(assert start!37122)

(declare-fun res!140495 () Bool)

(declare-fun e!117445 () Bool)

(assert (=> start!37122 (=> (not res!140495) (not e!117445))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!37122 (= res!140495 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!37122 e!117445))

(assert (=> start!37122 true))

(declare-datatypes ((array!8873 0))(
  ( (array!8874 (arr!4850 (Array (_ BitVec 32) (_ BitVec 8))) (size!3929 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7014 0))(
  ( (BitStream!7015 (buf!4381 array!8873) (currentByte!8344 (_ BitVec 32)) (currentBit!8339 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!7014)

(declare-fun e!117446 () Bool)

(declare-fun inv!12 (BitStream!7014) Bool)

(assert (=> start!37122 (and (inv!12 thiss!1894) e!117446)))

(declare-fun b!168903 () Bool)

(declare-fun array_inv!3670 (array!8873) Bool)

(assert (=> b!168903 (= e!117446 (array_inv!3670 (buf!4381 thiss!1894)))))

(declare-fun b!168901 () Bool)

(declare-fun res!140493 () Bool)

(assert (=> b!168901 (=> (not res!140493) (not e!117445))))

(assert (=> b!168901 (= res!140493 (bvsgt (bvadd (currentBit!8339 thiss!1894) nBits!600) #b00000000000000000000000000001000))))

(declare-fun b!168902 () Bool)

(assert (=> b!168902 (= e!117445 (not (inv!12 (BitStream!7015 (buf!4381 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8344 thiss!1894)) (bvsub (bvadd (currentBit!8339 thiss!1894) nBits!600) #b00000000000000000000000000001000)))))))

(declare-fun b!168900 () Bool)

(declare-fun res!140494 () Bool)

(assert (=> b!168900 (=> (not res!140494) (not e!117445))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168900 (= res!140494 (validate_offset_bits!1 ((_ sign_extend 32) (size!3929 (buf!4381 thiss!1894))) ((_ sign_extend 32) (currentByte!8344 thiss!1894)) ((_ sign_extend 32) (currentBit!8339 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(assert (= (and start!37122 res!140495) b!168900))

(assert (= (and b!168900 res!140494) b!168901))

(assert (= (and b!168901 res!140493) b!168902))

(assert (= start!37122 b!168903))

(declare-fun m!268475 () Bool)

(assert (=> start!37122 m!268475))

(declare-fun m!268477 () Bool)

(assert (=> b!168903 m!268477))

(declare-fun m!268479 () Bool)

(assert (=> b!168902 m!268479))

(declare-fun m!268481 () Bool)

(assert (=> b!168900 m!268481))

(check-sat (not b!168902) (not b!168900) (not start!37122) (not b!168903))
(check-sat)
(get-model)

(declare-fun d!59675 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59675 (= (inv!12 (BitStream!7015 (buf!4381 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8344 thiss!1894)) (bvsub (bvadd (currentBit!8339 thiss!1894) nBits!600) #b00000000000000000000000000001000))) (invariant!0 (currentBit!8339 (BitStream!7015 (buf!4381 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8344 thiss!1894)) (bvsub (bvadd (currentBit!8339 thiss!1894) nBits!600) #b00000000000000000000000000001000))) (currentByte!8344 (BitStream!7015 (buf!4381 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8344 thiss!1894)) (bvsub (bvadd (currentBit!8339 thiss!1894) nBits!600) #b00000000000000000000000000001000))) (size!3929 (buf!4381 (BitStream!7015 (buf!4381 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8344 thiss!1894)) (bvsub (bvadd (currentBit!8339 thiss!1894) nBits!600) #b00000000000000000000000000001000))))))))

(declare-fun bs!14799 () Bool)

(assert (= bs!14799 d!59675))

(declare-fun m!268491 () Bool)

(assert (=> bs!14799 m!268491))

(assert (=> b!168902 d!59675))

(declare-fun d!59679 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59679 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3929 (buf!4381 thiss!1894))) ((_ sign_extend 32) (currentByte!8344 thiss!1894)) ((_ sign_extend 32) (currentBit!8339 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3929 (buf!4381 thiss!1894))) ((_ sign_extend 32) (currentByte!8344 thiss!1894)) ((_ sign_extend 32) (currentBit!8339 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14800 () Bool)

(assert (= bs!14800 d!59679))

(declare-fun m!268493 () Bool)

(assert (=> bs!14800 m!268493))

(assert (=> b!168900 d!59679))

(declare-fun d!59683 () Bool)

(assert (=> d!59683 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8339 thiss!1894) (currentByte!8344 thiss!1894) (size!3929 (buf!4381 thiss!1894))))))

(declare-fun bs!14801 () Bool)

(assert (= bs!14801 d!59683))

(declare-fun m!268495 () Bool)

(assert (=> bs!14801 m!268495))

(assert (=> start!37122 d!59683))

(declare-fun d!59685 () Bool)

(assert (=> d!59685 (= (array_inv!3670 (buf!4381 thiss!1894)) (bvsge (size!3929 (buf!4381 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168903 d!59685))

(check-sat (not d!59675) (not d!59683) (not d!59679))
(check-sat)
(get-model)

(declare-fun d!59699 () Bool)

(assert (=> d!59699 (= (invariant!0 (currentBit!8339 (BitStream!7015 (buf!4381 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8344 thiss!1894)) (bvsub (bvadd (currentBit!8339 thiss!1894) nBits!600) #b00000000000000000000000000001000))) (currentByte!8344 (BitStream!7015 (buf!4381 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8344 thiss!1894)) (bvsub (bvadd (currentBit!8339 thiss!1894) nBits!600) #b00000000000000000000000000001000))) (size!3929 (buf!4381 (BitStream!7015 (buf!4381 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8344 thiss!1894)) (bvsub (bvadd (currentBit!8339 thiss!1894) nBits!600) #b00000000000000000000000000001000))))) (and (bvsge (currentBit!8339 (BitStream!7015 (buf!4381 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8344 thiss!1894)) (bvsub (bvadd (currentBit!8339 thiss!1894) nBits!600) #b00000000000000000000000000001000))) #b00000000000000000000000000000000) (bvslt (currentBit!8339 (BitStream!7015 (buf!4381 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8344 thiss!1894)) (bvsub (bvadd (currentBit!8339 thiss!1894) nBits!600) #b00000000000000000000000000001000))) #b00000000000000000000000000001000) (bvsge (currentByte!8344 (BitStream!7015 (buf!4381 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8344 thiss!1894)) (bvsub (bvadd (currentBit!8339 thiss!1894) nBits!600) #b00000000000000000000000000001000))) #b00000000000000000000000000000000) (or (bvslt (currentByte!8344 (BitStream!7015 (buf!4381 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8344 thiss!1894)) (bvsub (bvadd (currentBit!8339 thiss!1894) nBits!600) #b00000000000000000000000000001000))) (size!3929 (buf!4381 (BitStream!7015 (buf!4381 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8344 thiss!1894)) (bvsub (bvadd (currentBit!8339 thiss!1894) nBits!600) #b00000000000000000000000000001000))))) (and (= (currentBit!8339 (BitStream!7015 (buf!4381 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8344 thiss!1894)) (bvsub (bvadd (currentBit!8339 thiss!1894) nBits!600) #b00000000000000000000000000001000))) #b00000000000000000000000000000000) (= (currentByte!8344 (BitStream!7015 (buf!4381 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8344 thiss!1894)) (bvsub (bvadd (currentBit!8339 thiss!1894) nBits!600) #b00000000000000000000000000001000))) (size!3929 (buf!4381 (BitStream!7015 (buf!4381 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8344 thiss!1894)) (bvsub (bvadd (currentBit!8339 thiss!1894) nBits!600) #b00000000000000000000000000001000)))))))))))

(assert (=> d!59675 d!59699))

(declare-fun d!59701 () Bool)

(assert (=> d!59701 (= (invariant!0 (currentBit!8339 thiss!1894) (currentByte!8344 thiss!1894) (size!3929 (buf!4381 thiss!1894))) (and (bvsge (currentBit!8339 thiss!1894) #b00000000000000000000000000000000) (bvslt (currentBit!8339 thiss!1894) #b00000000000000000000000000001000) (bvsge (currentByte!8344 thiss!1894) #b00000000000000000000000000000000) (or (bvslt (currentByte!8344 thiss!1894) (size!3929 (buf!4381 thiss!1894))) (and (= (currentBit!8339 thiss!1894) #b00000000000000000000000000000000) (= (currentByte!8344 thiss!1894) (size!3929 (buf!4381 thiss!1894)))))))))

(assert (=> d!59683 d!59701))

(declare-fun d!59703 () Bool)

(assert (=> d!59703 (= (remainingBits!0 ((_ sign_extend 32) (size!3929 (buf!4381 thiss!1894))) ((_ sign_extend 32) (currentByte!8344 thiss!1894)) ((_ sign_extend 32) (currentBit!8339 thiss!1894))) (bvsub (bvmul ((_ sign_extend 32) (size!3929 (buf!4381 thiss!1894))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8344 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8339 thiss!1894)))))))

(assert (=> d!59679 d!59703))

(check-sat)
