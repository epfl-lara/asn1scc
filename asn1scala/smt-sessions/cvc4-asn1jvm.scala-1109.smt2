; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31838 () Bool)

(assert start!31838)

(declare-fun res!132473 () Bool)

(declare-fun e!107936 () Bool)

(assert (=> start!31838 (=> (not res!132473) (not e!107936))))

(declare-datatypes ((array!7422 0))(
  ( (array!7423 (arr!4287 (Array (_ BitVec 32) (_ BitVec 8))) (size!3366 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5900 0))(
  ( (BitStream!5901 (buf!3824 array!7422) (currentByte!7027 (_ BitVec 32)) (currentBit!7022 (_ BitVec 32))) )
))
(declare-fun b1!99 () BitStream!5900)

(declare-fun buf!77 () array!7422)

(declare-fun bytes!14 () (_ BitVec 32))

(assert (=> start!31838 (= res!132473 (and (= (size!3366 (buf!3824 b1!99)) (size!3366 buf!77)) (bvsge bytes!14 #b00000000000000000000000000000000)))))

(assert (=> start!31838 e!107936))

(declare-fun e!107935 () Bool)

(declare-fun inv!12 (BitStream!5900) Bool)

(assert (=> start!31838 (and (inv!12 b1!99) e!107935)))

(declare-fun array_inv!3113 (array!7422) Bool)

(assert (=> start!31838 (array_inv!3113 buf!77)))

(assert (=> start!31838 true))

(declare-fun b!158620 () Bool)

(declare-fun res!132472 () Bool)

(assert (=> b!158620 (=> (not res!132472) (not e!107936))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158620 (= res!132472 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3366 (buf!3824 b1!99))) ((_ sign_extend 32) (currentByte!7027 b1!99)) ((_ sign_extend 32) (currentBit!7022 b1!99)) bytes!14))))

(declare-fun b!158621 () Bool)

(assert (=> b!158621 (= e!107936 (not (inv!12 (BitStream!5901 buf!77 (currentByte!7027 b1!99) (currentBit!7022 b1!99)))))))

(declare-fun b!158622 () Bool)

(assert (=> b!158622 (= e!107935 (array_inv!3113 (buf!3824 b1!99)))))

(assert (= (and start!31838 res!132473) b!158620))

(assert (= (and b!158620 res!132472) b!158621))

(assert (= start!31838 b!158622))

(declare-fun m!249127 () Bool)

(assert (=> start!31838 m!249127))

(declare-fun m!249129 () Bool)

(assert (=> start!31838 m!249129))

(declare-fun m!249131 () Bool)

(assert (=> b!158620 m!249131))

(declare-fun m!249133 () Bool)

(assert (=> b!158621 m!249133))

(declare-fun m!249135 () Bool)

(assert (=> b!158622 m!249135))

(push 1)

(assert (not b!158621))

(assert (not b!158620))

(assert (not b!158622))

(assert (not start!31838))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!53261 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!53261 (= (inv!12 (BitStream!5901 buf!77 (currentByte!7027 b1!99) (currentBit!7022 b1!99))) (invariant!0 (currentBit!7022 (BitStream!5901 buf!77 (currentByte!7027 b1!99) (currentBit!7022 b1!99))) (currentByte!7027 (BitStream!5901 buf!77 (currentByte!7027 b1!99) (currentBit!7022 b1!99))) (size!3366 (buf!3824 (BitStream!5901 buf!77 (currentByte!7027 b1!99) (currentBit!7022 b1!99))))))))

(declare-fun bs!13139 () Bool)

(assert (= bs!13139 d!53261))

(declare-fun m!249149 () Bool)

(assert (=> bs!13139 m!249149))

(assert (=> b!158621 d!53261))

(declare-fun d!53263 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!53263 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3366 (buf!3824 b1!99))) ((_ sign_extend 32) (currentByte!7027 b1!99)) ((_ sign_extend 32) (currentBit!7022 b1!99)) bytes!14) (bvsle ((_ sign_extend 32) bytes!14) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3366 (buf!3824 b1!99))) ((_ sign_extend 32) (currentByte!7027 b1!99)) ((_ sign_extend 32) (currentBit!7022 b1!99))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!13140 () Bool)

(assert (= bs!13140 d!53263))

(declare-fun m!249151 () Bool)

(assert (=> bs!13140 m!249151))

(assert (=> b!158620 d!53263))

(declare-fun d!53265 () Bool)

(assert (=> d!53265 (= (array_inv!3113 (buf!3824 b1!99)) (bvsge (size!3366 (buf!3824 b1!99)) #b00000000000000000000000000000000))))

(assert (=> b!158622 d!53265))

(declare-fun d!53267 () Bool)

(assert (=> d!53267 (= (inv!12 b1!99) (invariant!0 (currentBit!7022 b1!99) (currentByte!7027 b1!99) (size!3366 (buf!3824 b1!99))))))

(declare-fun bs!13141 () Bool)

(assert (= bs!13141 d!53267))

(declare-fun m!249153 () Bool)

(assert (=> bs!13141 m!249153))

(assert (=> start!31838 d!53267))

(declare-fun d!53269 () Bool)

(assert (=> d!53269 (= (array_inv!3113 buf!77) (bvsge (size!3366 buf!77) #b00000000000000000000000000000000))))

(assert (=> start!31838 d!53269))

(push 1)

