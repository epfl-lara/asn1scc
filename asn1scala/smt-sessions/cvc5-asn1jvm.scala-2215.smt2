; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56180 () Bool)

(assert start!56180)

(declare-fun res!218052 () Bool)

(declare-fun e!180886 () Bool)

(assert (=> start!56180 (=> (not res!218052) (not e!180886))))

(declare-datatypes ((array!14286 0))(
  ( (array!14287 (arr!7237 (Array (_ BitVec 32) (_ BitVec 8))) (size!6250 (_ BitVec 32))) )
))
(declare-fun buf!79 () array!14286)

(declare-datatypes ((BitStream!11422 0))(
  ( (BitStream!11423 (buf!6772 array!14286) (currentByte!12462 (_ BitVec 32)) (currentBit!12457 (_ BitVec 32))) )
))
(declare-fun b1!100 () BitStream!11422)

(declare-fun bits!81 () (_ BitVec 64))

(assert (=> start!56180 (= res!218052 (and (= (size!6250 (buf!6772 b1!100)) (size!6250 buf!79)) (bvsge bits!81 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!56180 e!180886))

(declare-fun e!180883 () Bool)

(declare-fun inv!12 (BitStream!11422) Bool)

(assert (=> start!56180 (and (inv!12 b1!100) e!180883)))

(declare-fun array_inv!5991 (array!14286) Bool)

(assert (=> start!56180 (array_inv!5991 buf!79)))

(assert (=> start!56180 true))

(declare-fun b!260447 () Bool)

(declare-fun res!218053 () Bool)

(assert (=> b!260447 (=> (not res!218053) (not e!180886))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!260447 (= res!218053 (validate_offset_bits!1 ((_ sign_extend 32) (size!6250 (buf!6772 b1!100))) ((_ sign_extend 32) (currentByte!12462 b1!100)) ((_ sign_extend 32) (currentBit!12457 b1!100)) bits!81))))

(declare-fun b!260448 () Bool)

(assert (=> b!260448 (= e!180886 (not (inv!12 (BitStream!11423 buf!79 (currentByte!12462 b1!100) (currentBit!12457 b1!100)))))))

(declare-fun b!260449 () Bool)

(assert (=> b!260449 (= e!180883 (array_inv!5991 (buf!6772 b1!100)))))

(assert (= (and start!56180 res!218052) b!260447))

(assert (= (and b!260447 res!218053) b!260448))

(assert (= start!56180 b!260449))

(declare-fun m!389721 () Bool)

(assert (=> start!56180 m!389721))

(declare-fun m!389723 () Bool)

(assert (=> start!56180 m!389723))

(declare-fun m!389725 () Bool)

(assert (=> b!260447 m!389725))

(declare-fun m!389727 () Bool)

(assert (=> b!260448 m!389727))

(declare-fun m!389729 () Bool)

(assert (=> b!260449 m!389729))

(push 1)

(assert (not b!260448))

(assert (not start!56180))

(assert (not b!260449))

(assert (not b!260447))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87414 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87414 (= (inv!12 (BitStream!11423 buf!79 (currentByte!12462 b1!100) (currentBit!12457 b1!100))) (invariant!0 (currentBit!12457 (BitStream!11423 buf!79 (currentByte!12462 b1!100) (currentBit!12457 b1!100))) (currentByte!12462 (BitStream!11423 buf!79 (currentByte!12462 b1!100) (currentBit!12457 b1!100))) (size!6250 (buf!6772 (BitStream!11423 buf!79 (currentByte!12462 b1!100) (currentBit!12457 b1!100))))))))

(declare-fun bs!22152 () Bool)

(assert (= bs!22152 d!87414))

(declare-fun m!389759 () Bool)

(assert (=> bs!22152 m!389759))

(assert (=> b!260448 d!87414))

(declare-fun d!87424 () Bool)

(assert (=> d!87424 (= (inv!12 b1!100) (invariant!0 (currentBit!12457 b1!100) (currentByte!12462 b1!100) (size!6250 (buf!6772 b1!100))))))

(declare-fun bs!22153 () Bool)

(assert (= bs!22153 d!87424))

(declare-fun m!389761 () Bool)

(assert (=> bs!22153 m!389761))

(assert (=> start!56180 d!87424))

(declare-fun d!87426 () Bool)

(assert (=> d!87426 (= (array_inv!5991 buf!79) (bvsge (size!6250 buf!79) #b00000000000000000000000000000000))))

(assert (=> start!56180 d!87426))

(declare-fun d!87430 () Bool)

(assert (=> d!87430 (= (array_inv!5991 (buf!6772 b1!100)) (bvsge (size!6250 (buf!6772 b1!100)) #b00000000000000000000000000000000))))

(assert (=> b!260449 d!87430))

(declare-fun d!87432 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87432 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6250 (buf!6772 b1!100))) ((_ sign_extend 32) (currentByte!12462 b1!100)) ((_ sign_extend 32) (currentBit!12457 b1!100)) bits!81) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6250 (buf!6772 b1!100))) ((_ sign_extend 32) (currentByte!12462 b1!100)) ((_ sign_extend 32) (currentBit!12457 b1!100))) bits!81))))

(declare-fun bs!22155 () Bool)

(assert (= bs!22155 d!87432))

(declare-fun m!389765 () Bool)

(assert (=> bs!22155 m!389765))

(assert (=> b!260447 d!87432))

