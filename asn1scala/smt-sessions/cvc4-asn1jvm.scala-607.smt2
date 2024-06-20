; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17334 () Bool)

(assert start!17334)

(declare-datatypes ((array!3922 0))(
  ( (array!3923 (arr!2417 (Array (_ BitVec 32) (_ BitVec 8))) (size!1780 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3122 0))(
  ( (BitStream!3123 (buf!2170 array!3922) (currentByte!4313 (_ BitVec 32)) (currentBit!4308 (_ BitVec 32))) )
))
(declare-fun b!169 () BitStream!3122)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> start!17334 (not (invariant!0 (currentBit!4308 b!169) (currentByte!4313 b!169) (size!1780 (buf!2170 b!169))))))

(declare-fun e!56093 () Bool)

(declare-fun inv!12 (BitStream!3122) Bool)

(assert (=> start!17334 (and (inv!12 b!169) e!56093)))

(declare-fun b!84013 () Bool)

(declare-fun array_inv!1626 (array!3922) Bool)

(assert (=> b!84013 (= e!56093 (array_inv!1626 (buf!2170 b!169)))))

(assert (= start!17334 b!84013))

(declare-fun m!130701 () Bool)

(assert (=> start!17334 m!130701))

(declare-fun m!130703 () Bool)

(assert (=> start!17334 m!130703))

(declare-fun m!130705 () Bool)

(assert (=> b!84013 m!130705))

(push 1)

(assert (not start!17334))

(assert (not b!84013))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!27001 () Bool)

(assert (=> d!27001 (= (invariant!0 (currentBit!4308 b!169) (currentByte!4313 b!169) (size!1780 (buf!2170 b!169))) (and (bvsge (currentBit!4308 b!169) #b00000000000000000000000000000000) (bvslt (currentBit!4308 b!169) #b00000000000000000000000000001000) (bvsge (currentByte!4313 b!169) #b00000000000000000000000000000000) (or (bvslt (currentByte!4313 b!169) (size!1780 (buf!2170 b!169))) (and (= (currentBit!4308 b!169) #b00000000000000000000000000000000) (= (currentByte!4313 b!169) (size!1780 (buf!2170 b!169)))))))))

(assert (=> start!17334 d!27001))

(declare-fun d!27006 () Bool)

(assert (=> d!27006 (= (inv!12 b!169) (invariant!0 (currentBit!4308 b!169) (currentByte!4313 b!169) (size!1780 (buf!2170 b!169))))))

(declare-fun bs!6667 () Bool)

(assert (= bs!6667 d!27006))

(assert (=> bs!6667 m!130701))

(assert (=> start!17334 d!27006))

(declare-fun d!27012 () Bool)

(assert (=> d!27012 (= (array_inv!1626 (buf!2170 b!169)) (bvsge (size!1780 (buf!2170 b!169)) #b00000000000000000000000000000000))))

(assert (=> b!84013 d!27012))

