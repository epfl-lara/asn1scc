; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3952 () Bool)

(assert start!3952)

(declare-fun res!15355 () Bool)

(declare-fun e!10802 () Bool)

(assert (=> start!3952 (=> (not res!15355) (not e!10802))))

(declare-fun newOffset!1 () (_ BitVec 64))

(declare-fun origOffset!1 () (_ BitVec 64))

(assert (=> start!3952 (= res!15355 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 newOffset!1) (bvsle newOffset!1 origOffset!1)))))

(assert (=> start!3952 e!10802))

(assert (=> start!3952 true))

(declare-datatypes ((array!1004 0))(
  ( (array!1005 (arr!856 (Array (_ BitVec 32) (_ BitVec 8))) (size!427 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!814 0))(
  ( (BitStream!815 (buf!790 array!1004) (currentByte!1962 (_ BitVec 32)) (currentBit!1957 (_ BitVec 32))) )
))
(declare-fun b!162 () BitStream!814)

(declare-fun e!10803 () Bool)

(declare-fun inv!12 (BitStream!814) Bool)

(assert (=> start!3952 (and (inv!12 b!162) e!10803)))

(declare-fun b!17067 () Bool)

(declare-fun res!15356 () Bool)

(assert (=> b!17067 (=> (not res!15356) (not e!10802))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!17067 (= res!15356 (validate_offset_bits!1 ((_ sign_extend 32) (size!427 (buf!790 b!162))) ((_ sign_extend 32) (currentByte!1962 b!162)) ((_ sign_extend 32) (currentBit!1957 b!162)) origOffset!1))))

(declare-fun b!17068 () Bool)

(assert (=> b!17068 (= e!10802 (and (bvsle ((_ sign_extend 32) (size!427 (buf!790 b!162))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1962 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1957 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!427 (buf!790 b!162))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!1962 b!162)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!1957 b!162)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!17069 () Bool)

(declare-fun array_inv!416 (array!1004) Bool)

(assert (=> b!17069 (= e!10803 (array_inv!416 (buf!790 b!162)))))

(assert (= (and start!3952 res!15355) b!17067))

(assert (= (and b!17067 res!15356) b!17068))

(assert (= start!3952 b!17069))

(declare-fun m!23247 () Bool)

(assert (=> start!3952 m!23247))

(declare-fun m!23249 () Bool)

(assert (=> b!17067 m!23249))

(declare-fun m!23251 () Bool)

(assert (=> b!17069 m!23251))

(push 1)

(assert (not b!17067))

(assert (not start!3952))

(assert (not b!17069))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5552 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!5552 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!427 (buf!790 b!162))) ((_ sign_extend 32) (currentByte!1962 b!162)) ((_ sign_extend 32) (currentBit!1957 b!162)) origOffset!1) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!427 (buf!790 b!162))) ((_ sign_extend 32) (currentByte!1962 b!162)) ((_ sign_extend 32) (currentBit!1957 b!162))) origOffset!1))))

(declare-fun bs!1551 () Bool)

(assert (= bs!1551 d!5552))

(declare-fun m!23269 () Bool)

(assert (=> bs!1551 m!23269))

(assert (=> b!17067 d!5552))

(declare-fun d!5554 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!5554 (= (inv!12 b!162) (invariant!0 (currentBit!1957 b!162) (currentByte!1962 b!162) (size!427 (buf!790 b!162))))))

(declare-fun bs!1552 () Bool)

(assert (= bs!1552 d!5554))

(declare-fun m!23271 () Bool)

(assert (=> bs!1552 m!23271))

(assert (=> start!3952 d!5554))

(declare-fun d!5556 () Bool)

(assert (=> d!5556 (= (array_inv!416 (buf!790 b!162)) (bvsge (size!427 (buf!790 b!162)) #b00000000000000000000000000000000))))

(assert (=> b!17069 d!5556))

(push 1)

(assert (not d!5552))

(assert (not d!5554))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5568 () Bool)

(assert (=> d!5568 (= (remainingBits!0 ((_ sign_extend 32) (size!427 (buf!790 b!162))) ((_ sign_extend 32) (currentByte!1962 b!162)) ((_ sign_extend 32) (currentBit!1957 b!162))) (bvsub (bvmul ((_ sign_extend 32) (size!427 (buf!790 b!162))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!1962 b!162)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1957 b!162)))))))

(assert (=> d!5552 d!5568))

(declare-fun d!5570 () Bool)

(assert (=> d!5570 (= (invariant!0 (currentBit!1957 b!162) (currentByte!1962 b!162) (size!427 (buf!790 b!162))) (and (bvsge (currentBit!1957 b!162) #b00000000000000000000000000000000) (bvslt (currentBit!1957 b!162) #b00000000000000000000000000001000) (bvsge (currentByte!1962 b!162) #b00000000000000000000000000000000) (or (bvslt (currentByte!1962 b!162) (size!427 (buf!790 b!162))) (and (= (currentBit!1957 b!162) #b00000000000000000000000000000000) (= (currentByte!1962 b!162) (size!427 (buf!790 b!162)))))))))

(assert (=> d!5554 d!5570))

(push 1)

(check-sat)

