; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31776 () Bool)

(assert start!31776)

(declare-fun res!132415 () Bool)

(declare-fun e!107840 () Bool)

(assert (=> start!31776 (=> (not res!132415) (not e!107840))))

(declare-datatypes ((array!7400 0))(
  ( (array!7401 (arr!4279 (Array (_ BitVec 32) (_ BitVec 8))) (size!3358 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5884 0))(
  ( (BitStream!5885 (buf!3816 array!7400) (currentByte!7008 (_ BitVec 32)) (currentBit!7003 (_ BitVec 32))) )
))
(declare-fun b1!99 () BitStream!5884)

(declare-fun buf!77 () array!7400)

(declare-fun bytes!14 () (_ BitVec 32))

(assert (=> start!31776 (= res!132415 (and (= (size!3358 (buf!3816 b1!99)) (size!3358 buf!77)) (bvsge bytes!14 #b00000000000000000000000000000000)))))

(assert (=> start!31776 e!107840))

(declare-fun e!107841 () Bool)

(declare-fun inv!12 (BitStream!5884) Bool)

(assert (=> start!31776 (and (inv!12 b1!99) e!107841)))

(declare-fun array_inv!3105 (array!7400) Bool)

(assert (=> start!31776 (array_inv!3105 buf!77)))

(assert (=> start!31776 true))

(declare-fun b!158539 () Bool)

(declare-fun res!132416 () Bool)

(assert (=> b!158539 (=> (not res!132416) (not e!107840))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158539 (= res!132416 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3358 (buf!3816 b1!99))) ((_ sign_extend 32) (currentByte!7008 b1!99)) ((_ sign_extend 32) (currentBit!7003 b1!99)) bytes!14))))

(declare-fun b!158540 () Bool)

(assert (=> b!158540 (= e!107840 (and (bvsle ((_ sign_extend 32) (size!3358 buf!77)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!7008 b1!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!7003 b1!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!3358 buf!77)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!7008 b1!99)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!7003 b1!99)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!158541 () Bool)

(assert (=> b!158541 (= e!107841 (array_inv!3105 (buf!3816 b1!99)))))

(assert (= (and start!31776 res!132415) b!158539))

(assert (= (and b!158539 res!132416) b!158540))

(assert (= start!31776 b!158541))

(declare-fun m!249029 () Bool)

(assert (=> start!31776 m!249029))

(declare-fun m!249031 () Bool)

(assert (=> start!31776 m!249031))

(declare-fun m!249033 () Bool)

(assert (=> b!158539 m!249033))

(declare-fun m!249035 () Bool)

(assert (=> b!158541 m!249035))

(push 1)

(assert (not start!31776))

(assert (not b!158541))

(assert (not b!158539))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!53187 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!53187 (= (inv!12 b1!99) (invariant!0 (currentBit!7003 b1!99) (currentByte!7008 b1!99) (size!3358 (buf!3816 b1!99))))))

(declare-fun bs!13117 () Bool)

(assert (= bs!13117 d!53187))

(declare-fun m!249057 () Bool)

(assert (=> bs!13117 m!249057))

(assert (=> start!31776 d!53187))

(declare-fun d!53189 () Bool)

(assert (=> d!53189 (= (array_inv!3105 buf!77) (bvsge (size!3358 buf!77) #b00000000000000000000000000000000))))

(assert (=> start!31776 d!53189))

(declare-fun d!53191 () Bool)

(assert (=> d!53191 (= (array_inv!3105 (buf!3816 b1!99)) (bvsge (size!3358 (buf!3816 b1!99)) #b00000000000000000000000000000000))))

(assert (=> b!158541 d!53191))

(declare-fun d!53193 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!53193 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3358 (buf!3816 b1!99))) ((_ sign_extend 32) (currentByte!7008 b1!99)) ((_ sign_extend 32) (currentBit!7003 b1!99)) bytes!14) (bvsle ((_ sign_extend 32) bytes!14) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3358 (buf!3816 b1!99))) ((_ sign_extend 32) (currentByte!7008 b1!99)) ((_ sign_extend 32) (currentBit!7003 b1!99))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!13118 () Bool)

(assert (= bs!13118 d!53193))

(declare-fun m!249059 () Bool)

(assert (=> bs!13118 m!249059))

(assert (=> b!158539 d!53193))

(push 1)

(assert (not d!53193))

(assert (not d!53187))

(check-sat)

(pop 1)

(push 1)

(check-sat)

