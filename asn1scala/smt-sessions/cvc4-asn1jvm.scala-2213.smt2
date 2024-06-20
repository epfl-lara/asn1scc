; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56124 () Bool)

(assert start!56124)

(declare-fun res!218020 () Bool)

(declare-fun e!180838 () Bool)

(assert (=> start!56124 (=> (not res!218020) (not e!180838))))

(declare-datatypes ((array!14273 0))(
  ( (array!14274 (arr!7233 (Array (_ BitVec 32) (_ BitVec 8))) (size!6246 (_ BitVec 32))) )
))
(declare-fun buf!79 () array!14273)

(declare-datatypes ((BitStream!11414 0))(
  ( (BitStream!11415 (buf!6768 array!14273) (currentByte!12445 (_ BitVec 32)) (currentBit!12440 (_ BitVec 32))) )
))
(declare-fun b1!100 () BitStream!11414)

(declare-fun bits!81 () (_ BitVec 64))

(assert (=> start!56124 (= res!218020 (and (= (size!6246 (buf!6768 b1!100)) (size!6246 buf!79)) (bvsge bits!81 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!56124 e!180838))

(declare-fun e!180837 () Bool)

(declare-fun inv!12 (BitStream!11414) Bool)

(assert (=> start!56124 (and (inv!12 b1!100) e!180837)))

(declare-fun array_inv!5987 (array!14273) Bool)

(assert (=> start!56124 (array_inv!5987 buf!79)))

(assert (=> start!56124 true))

(declare-fun b!260402 () Bool)

(declare-fun res!218019 () Bool)

(assert (=> b!260402 (=> (not res!218019) (not e!180838))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!260402 (= res!218019 (validate_offset_bits!1 ((_ sign_extend 32) (size!6246 (buf!6768 b1!100))) ((_ sign_extend 32) (currentByte!12445 b1!100)) ((_ sign_extend 32) (currentBit!12440 b1!100)) bits!81))))

(declare-fun b!260403 () Bool)

(assert (=> b!260403 (= e!180838 (and (bvsle ((_ sign_extend 32) (size!6246 buf!79)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!12445 b1!100)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!12440 b1!100)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!6246 buf!79)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!12445 b1!100)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!12440 b1!100)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!260404 () Bool)

(assert (=> b!260404 (= e!180837 (array_inv!5987 (buf!6768 b1!100)))))

(assert (= (and start!56124 res!218020) b!260402))

(assert (= (and b!260402 res!218019) b!260403))

(assert (= start!56124 b!260404))

(declare-fun m!389661 () Bool)

(assert (=> start!56124 m!389661))

(declare-fun m!389663 () Bool)

(assert (=> start!56124 m!389663))

(declare-fun m!389665 () Bool)

(assert (=> b!260402 m!389665))

(declare-fun m!389667 () Bool)

(assert (=> b!260404 m!389667))

(push 1)

(assert (not start!56124))

(assert (not b!260404))

(assert (not b!260402))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87366 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87366 (= (inv!12 b1!100) (invariant!0 (currentBit!12440 b1!100) (currentByte!12445 b1!100) (size!6246 (buf!6768 b1!100))))))

(declare-fun bs!22135 () Bool)

(assert (= bs!22135 d!87366))

(declare-fun m!389677 () Bool)

(assert (=> bs!22135 m!389677))

(assert (=> start!56124 d!87366))

(declare-fun d!87370 () Bool)

(assert (=> d!87370 (= (array_inv!5987 buf!79) (bvsge (size!6246 buf!79) #b00000000000000000000000000000000))))

(assert (=> start!56124 d!87370))

(declare-fun d!87372 () Bool)

(assert (=> d!87372 (= (array_inv!5987 (buf!6768 b1!100)) (bvsge (size!6246 (buf!6768 b1!100)) #b00000000000000000000000000000000))))

(assert (=> b!260404 d!87372))

(declare-fun d!87374 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87374 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6246 (buf!6768 b1!100))) ((_ sign_extend 32) (currentByte!12445 b1!100)) ((_ sign_extend 32) (currentBit!12440 b1!100)) bits!81) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6246 (buf!6768 b1!100))) ((_ sign_extend 32) (currentByte!12445 b1!100)) ((_ sign_extend 32) (currentBit!12440 b1!100))) bits!81))))

(declare-fun bs!22136 () Bool)

(assert (= bs!22136 d!87374))

(declare-fun m!389679 () Bool)

(assert (=> bs!22136 m!389679))

(assert (=> b!260402 d!87374))

(push 1)

(assert (not d!87366))

(assert (not d!87374))

(check-sat)

(pop 1)

(push 1)

(check-sat)

