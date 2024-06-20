; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37120 () Bool)

(assert start!37120)

(declare-fun b!168888 () Bool)

(declare-fun res!140485 () Bool)

(declare-fun e!117436 () Bool)

(assert (=> b!168888 (=> (not res!140485) (not e!117436))))

(declare-datatypes ((array!8871 0))(
  ( (array!8872 (arr!4849 (Array (_ BitVec 32) (_ BitVec 8))) (size!3928 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7012 0))(
  ( (BitStream!7013 (buf!4380 array!8871) (currentByte!8343 (_ BitVec 32)) (currentBit!8338 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!7012)

(declare-fun nBits!600 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168888 (= res!140485 (validate_offset_bits!1 ((_ sign_extend 32) (size!3928 (buf!4380 thiss!1894))) ((_ sign_extend 32) (currentByte!8343 thiss!1894)) ((_ sign_extend 32) (currentBit!8338 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168891 () Bool)

(declare-fun e!117438 () Bool)

(declare-fun array_inv!3669 (array!8871) Bool)

(assert (=> b!168891 (= e!117438 (array_inv!3669 (buf!4380 thiss!1894)))))

(declare-fun b!168890 () Bool)

(declare-fun inv!12 (BitStream!7012) Bool)

(assert (=> b!168890 (= e!117436 (not (inv!12 (BitStream!7013 (buf!4380 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8343 thiss!1894)) (bvsub (bvadd (currentBit!8338 thiss!1894) nBits!600) #b00000000000000000000000000001000)))))))

(declare-fun res!140484 () Bool)

(assert (=> start!37120 (=> (not res!140484) (not e!117436))))

(assert (=> start!37120 (= res!140484 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!37120 e!117436))

(assert (=> start!37120 true))

(assert (=> start!37120 (and (inv!12 thiss!1894) e!117438)))

(declare-fun b!168889 () Bool)

(declare-fun res!140486 () Bool)

(assert (=> b!168889 (=> (not res!140486) (not e!117436))))

(assert (=> b!168889 (= res!140486 (bvsgt (bvadd (currentBit!8338 thiss!1894) nBits!600) #b00000000000000000000000000001000))))

(assert (= (and start!37120 res!140484) b!168888))

(assert (= (and b!168888 res!140485) b!168889))

(assert (= (and b!168889 res!140486) b!168890))

(assert (= start!37120 b!168891))

(declare-fun m!268467 () Bool)

(assert (=> b!168888 m!268467))

(declare-fun m!268469 () Bool)

(assert (=> b!168891 m!268469))

(declare-fun m!268471 () Bool)

(assert (=> b!168890 m!268471))

(declare-fun m!268473 () Bool)

(assert (=> start!37120 m!268473))

(push 1)

(assert (not b!168891))

(assert (not b!168890))

(assert (not b!168888))

(assert (not start!37120))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59677 () Bool)

(assert (=> d!59677 (= (array_inv!3669 (buf!4380 thiss!1894)) (bvsge (size!3928 (buf!4380 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168891 d!59677))

(declare-fun d!59681 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59681 (= (inv!12 (BitStream!7013 (buf!4380 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8343 thiss!1894)) (bvsub (bvadd (currentBit!8338 thiss!1894) nBits!600) #b00000000000000000000000000001000))) (invariant!0 (currentBit!8338 (BitStream!7013 (buf!4380 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8343 thiss!1894)) (bvsub (bvadd (currentBit!8338 thiss!1894) nBits!600) #b00000000000000000000000000001000))) (currentByte!8343 (BitStream!7013 (buf!4380 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8343 thiss!1894)) (bvsub (bvadd (currentBit!8338 thiss!1894) nBits!600) #b00000000000000000000000000001000))) (size!3928 (buf!4380 (BitStream!7013 (buf!4380 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8343 thiss!1894)) (bvsub (bvadd (currentBit!8338 thiss!1894) nBits!600) #b00000000000000000000000000001000))))))))

(declare-fun bs!14802 () Bool)

(assert (= bs!14802 d!59681))

(declare-fun m!268497 () Bool)

(assert (=> bs!14802 m!268497))

(assert (=> b!168890 d!59681))

(declare-fun d!59689 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59689 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3928 (buf!4380 thiss!1894))) ((_ sign_extend 32) (currentByte!8343 thiss!1894)) ((_ sign_extend 32) (currentBit!8338 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3928 (buf!4380 thiss!1894))) ((_ sign_extend 32) (currentByte!8343 thiss!1894)) ((_ sign_extend 32) (currentBit!8338 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14804 () Bool)

(assert (= bs!14804 d!59689))

(declare-fun m!268501 () Bool)

(assert (=> bs!14804 m!268501))

(assert (=> b!168888 d!59689))

(declare-fun d!59693 () Bool)

(assert (=> d!59693 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8338 thiss!1894) (currentByte!8343 thiss!1894) (size!3928 (buf!4380 thiss!1894))))))

(declare-fun bs!14805 () Bool)

(assert (= bs!14805 d!59693))

(declare-fun m!268503 () Bool)

(assert (=> bs!14805 m!268503))

(assert (=> start!37120 d!59693))

(push 1)

(assert (not d!59693))

(assert (not d!59689))

(assert (not d!59681))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59705 () Bool)

(assert (=> d!59705 (= (invariant!0 (currentBit!8338 thiss!1894) (currentByte!8343 thiss!1894) (size!3928 (buf!4380 thiss!1894))) (and (bvsge (currentBit!8338 thiss!1894) #b00000000000000000000000000000000) (bvslt (currentBit!8338 thiss!1894) #b00000000000000000000000000001000) (bvsge (currentByte!8343 thiss!1894) #b00000000000000000000000000000000) (or (bvslt (currentByte!8343 thiss!1894) (size!3928 (buf!4380 thiss!1894))) (and (= (currentBit!8338 thiss!1894) #b00000000000000000000000000000000) (= (currentByte!8343 thiss!1894) (size!3928 (buf!4380 thiss!1894)))))))))

(assert (=> d!59693 d!59705))

(declare-fun d!59707 () Bool)

(assert (=> d!59707 (= (remainingBits!0 ((_ sign_extend 32) (size!3928 (buf!4380 thiss!1894))) ((_ sign_extend 32) (currentByte!8343 thiss!1894)) ((_ sign_extend 32) (currentBit!8338 thiss!1894))) (bvsub (bvmul ((_ sign_extend 32) (size!3928 (buf!4380 thiss!1894))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8343 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8338 thiss!1894)))))))

(assert (=> d!59689 d!59707))

(declare-fun d!59709 () Bool)

(assert (=> d!59709 (= (invariant!0 (currentBit!8338 (BitStream!7013 (buf!4380 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8343 thiss!1894)) (bvsub (bvadd (currentBit!8338 thiss!1894) nBits!600) #b00000000000000000000000000001000))) (currentByte!8343 (BitStream!7013 (buf!4380 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8343 thiss!1894)) (bvsub (bvadd (currentBit!8338 thiss!1894) nBits!600) #b00000000000000000000000000001000))) (size!3928 (buf!4380 (BitStream!7013 (buf!4380 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8343 thiss!1894)) (bvsub (bvadd (currentBit!8338 thiss!1894) nBits!600) #b00000000000000000000000000001000))))) (and (bvsge (currentBit!8338 (BitStream!7013 (buf!4380 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8343 thiss!1894)) (bvsub (bvadd (currentBit!8338 thiss!1894) nBits!600) #b00000000000000000000000000001000))) #b00000000000000000000000000000000) (bvslt (currentBit!8338 (BitStream!7013 (buf!4380 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8343 thiss!1894)) (bvsub (bvadd (currentBit!8338 thiss!1894) nBits!600) #b00000000000000000000000000001000))) #b00000000000000000000000000001000) (bvsge (currentByte!8343 (BitStream!7013 (buf!4380 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8343 thiss!1894)) (bvsub (bvadd (currentBit!8338 thiss!1894) nBits!600) #b00000000000000000000000000001000))) #b00000000000000000000000000000000) (or (bvslt (currentByte!8343 (BitStream!7013 (buf!4380 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8343 thiss!1894)) (bvsub (bvadd (currentBit!8338 thiss!1894) nBits!600) #b00000000000000000000000000001000))) (size!3928 (buf!4380 (BitStream!7013 (buf!4380 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8343 thiss!1894)) (bvsub (bvadd (currentBit!8338 thiss!1894) nBits!600) #b00000000000000000000000000001000))))) (and (= (currentBit!8338 (BitStream!7013 (buf!4380 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8343 thiss!1894)) (bvsub (bvadd (currentBit!8338 thiss!1894) nBits!600) #b00000000000000000000000000001000))) #b00000000000000000000000000000000) (= (currentByte!8343 (BitStream!7013 (buf!4380 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8343 thiss!1894)) (bvsub (bvadd (currentBit!8338 thiss!1894) nBits!600) #b00000000000000000000000000001000))) (size!3928 (buf!4380 (BitStream!7013 (buf!4380 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8343 thiss!1894)) (bvsub (bvadd (currentBit!8338 thiss!1894) nBits!600) #b00000000000000000000000000001000)))))))))))

(assert (=> d!59681 d!59709))

(push 1)

(check-sat)

