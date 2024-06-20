; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37082 () Bool)

(assert start!37082)

(declare-fun res!140459 () Bool)

(declare-fun e!117401 () Bool)

(assert (=> start!37082 (=> (not res!140459) (not e!117401))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!37082 (= res!140459 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!37082 e!117401))

(assert (=> start!37082 true))

(declare-datatypes ((array!8860 0))(
  ( (array!8861 (arr!4845 (Array (_ BitVec 32) (_ BitVec 8))) (size!3924 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7004 0))(
  ( (BitStream!7005 (buf!4376 array!8860) (currentByte!8330 (_ BitVec 32)) (currentBit!8325 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!7004)

(declare-fun e!117402 () Bool)

(declare-fun inv!12 (BitStream!7004) Bool)

(assert (=> start!37082 (and (inv!12 thiss!1894) e!117402)))

(declare-fun b!168850 () Bool)

(declare-fun res!140458 () Bool)

(assert (=> b!168850 (=> (not res!140458) (not e!117401))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168850 (= res!140458 (validate_offset_bits!1 ((_ sign_extend 32) (size!3924 (buf!4376 thiss!1894))) ((_ sign_extend 32) (currentByte!8330 thiss!1894)) ((_ sign_extend 32) (currentBit!8325 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168851 () Bool)

(assert (=> b!168851 (= e!117401 (and (bvsgt (bvadd (currentBit!8325 thiss!1894) nBits!600) #b00000000000000000000000000001000) (bvsle (bvsub #b00000000000000000000000000001000 (bvsub (bvadd (currentBit!8325 thiss!1894) nBits!600) #b00000000000000000000000000001000)) #b00000000000000000000000000100000) (or (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8330 thiss!1894)) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!8330 thiss!1894)) (size!3924 (buf!4376 thiss!1894))))))))

(declare-fun b!168852 () Bool)

(declare-fun array_inv!3665 (array!8860) Bool)

(assert (=> b!168852 (= e!117402 (array_inv!3665 (buf!4376 thiss!1894)))))

(assert (= (and start!37082 res!140459) b!168850))

(assert (= (and b!168850 res!140458) b!168851))

(assert (= start!37082 b!168852))

(declare-fun m!268431 () Bool)

(assert (=> start!37082 m!268431))

(declare-fun m!268433 () Bool)

(assert (=> b!168850 m!268433))

(declare-fun m!268435 () Bool)

(assert (=> b!168852 m!268435))

(push 1)

(assert (not start!37082))

(assert (not b!168850))

(assert (not b!168852))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59653 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59653 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8325 thiss!1894) (currentByte!8330 thiss!1894) (size!3924 (buf!4376 thiss!1894))))))

(declare-fun bs!14791 () Bool)

(assert (= bs!14791 d!59653))

(declare-fun m!268445 () Bool)

(assert (=> bs!14791 m!268445))

(assert (=> start!37082 d!59653))

(declare-fun d!59655 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59655 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3924 (buf!4376 thiss!1894))) ((_ sign_extend 32) (currentByte!8330 thiss!1894)) ((_ sign_extend 32) (currentBit!8325 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3924 (buf!4376 thiss!1894))) ((_ sign_extend 32) (currentByte!8330 thiss!1894)) ((_ sign_extend 32) (currentBit!8325 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14792 () Bool)

(assert (= bs!14792 d!59655))

(declare-fun m!268447 () Bool)

(assert (=> bs!14792 m!268447))

(assert (=> b!168850 d!59655))

(declare-fun d!59657 () Bool)

(assert (=> d!59657 (= (array_inv!3665 (buf!4376 thiss!1894)) (bvsge (size!3924 (buf!4376 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168852 d!59657))

(push 1)

(assert (not d!59653))

(assert (not d!59655))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59667 () Bool)

(assert (=> d!59667 (= (invariant!0 (currentBit!8325 thiss!1894) (currentByte!8330 thiss!1894) (size!3924 (buf!4376 thiss!1894))) (and (bvsge (currentBit!8325 thiss!1894) #b00000000000000000000000000000000) (bvslt (currentBit!8325 thiss!1894) #b00000000000000000000000000001000) (bvsge (currentByte!8330 thiss!1894) #b00000000000000000000000000000000) (or (bvslt (currentByte!8330 thiss!1894) (size!3924 (buf!4376 thiss!1894))) (and (= (currentBit!8325 thiss!1894) #b00000000000000000000000000000000) (= (currentByte!8330 thiss!1894) (size!3924 (buf!4376 thiss!1894)))))))))

(assert (=> d!59653 d!59667))

(declare-fun d!59669 () Bool)

(assert (=> d!59669 (= (remainingBits!0 ((_ sign_extend 32) (size!3924 (buf!4376 thiss!1894))) ((_ sign_extend 32) (currentByte!8330 thiss!1894)) ((_ sign_extend 32) (currentBit!8325 thiss!1894))) (bvsub (bvmul ((_ sign_extend 32) (size!3924 (buf!4376 thiss!1894))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8330 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8325 thiss!1894)))))))

(assert (=> d!59655 d!59669))

(push 1)

(check-sat)

(pop 1)

