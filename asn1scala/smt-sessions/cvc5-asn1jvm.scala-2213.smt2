; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56120 () Bool)

(assert start!56120)

(declare-fun res!218007 () Bool)

(declare-fun e!180813 () Bool)

(assert (=> start!56120 (=> (not res!218007) (not e!180813))))

(declare-datatypes ((array!14269 0))(
  ( (array!14270 (arr!7231 (Array (_ BitVec 32) (_ BitVec 8))) (size!6244 (_ BitVec 32))) )
))
(declare-fun buf!79 () array!14269)

(declare-datatypes ((BitStream!11410 0))(
  ( (BitStream!11411 (buf!6766 array!14269) (currentByte!12443 (_ BitVec 32)) (currentBit!12438 (_ BitVec 32))) )
))
(declare-fun b1!100 () BitStream!11410)

(declare-fun bits!81 () (_ BitVec 64))

(assert (=> start!56120 (= res!218007 (and (= (size!6244 (buf!6766 b1!100)) (size!6244 buf!79)) (bvsge bits!81 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!56120 e!180813))

(declare-fun e!180811 () Bool)

(declare-fun inv!12 (BitStream!11410) Bool)

(assert (=> start!56120 (and (inv!12 b1!100) e!180811)))

(declare-fun array_inv!5985 (array!14269) Bool)

(assert (=> start!56120 (array_inv!5985 buf!79)))

(assert (=> start!56120 true))

(declare-fun b!260384 () Bool)

(declare-fun res!218008 () Bool)

(assert (=> b!260384 (=> (not res!218008) (not e!180813))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!260384 (= res!218008 (validate_offset_bits!1 ((_ sign_extend 32) (size!6244 (buf!6766 b1!100))) ((_ sign_extend 32) (currentByte!12443 b1!100)) ((_ sign_extend 32) (currentBit!12438 b1!100)) bits!81))))

(declare-fun b!260385 () Bool)

(assert (=> b!260385 (= e!180813 (and (bvsle ((_ sign_extend 32) (size!6244 buf!79)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!12443 b1!100)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!12438 b1!100)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!6244 buf!79)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!12443 b1!100)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!12438 b1!100)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!260386 () Bool)

(assert (=> b!260386 (= e!180811 (array_inv!5985 (buf!6766 b1!100)))))

(assert (= (and start!56120 res!218007) b!260384))

(assert (= (and b!260384 res!218008) b!260385))

(assert (= start!56120 b!260386))

(declare-fun m!389645 () Bool)

(assert (=> start!56120 m!389645))

(declare-fun m!389647 () Bool)

(assert (=> start!56120 m!389647))

(declare-fun m!389649 () Bool)

(assert (=> b!260384 m!389649))

(declare-fun m!389651 () Bool)

(assert (=> b!260386 m!389651))

(push 1)

(assert (not b!260384))

(assert (not b!260386))

(assert (not start!56120))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87356 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87356 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6244 (buf!6766 b1!100))) ((_ sign_extend 32) (currentByte!12443 b1!100)) ((_ sign_extend 32) (currentBit!12438 b1!100)) bits!81) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6244 (buf!6766 b1!100))) ((_ sign_extend 32) (currentByte!12443 b1!100)) ((_ sign_extend 32) (currentBit!12438 b1!100))) bits!81))))

(declare-fun bs!22133 () Bool)

(assert (= bs!22133 d!87356))

(declare-fun m!389673 () Bool)

(assert (=> bs!22133 m!389673))

(assert (=> b!260384 d!87356))

(declare-fun d!87358 () Bool)

(assert (=> d!87358 (= (array_inv!5985 (buf!6766 b1!100)) (bvsge (size!6244 (buf!6766 b1!100)) #b00000000000000000000000000000000))))

(assert (=> b!260386 d!87358))

(declare-fun d!87360 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87360 (= (inv!12 b1!100) (invariant!0 (currentBit!12438 b1!100) (currentByte!12443 b1!100) (size!6244 (buf!6766 b1!100))))))

(declare-fun bs!22134 () Bool)

(assert (= bs!22134 d!87360))

(declare-fun m!389675 () Bool)

(assert (=> bs!22134 m!389675))

(assert (=> start!56120 d!87360))

(declare-fun d!87362 () Bool)

(assert (=> d!87362 (= (array_inv!5985 buf!79) (bvsge (size!6244 buf!79) #b00000000000000000000000000000000))))

(assert (=> start!56120 d!87362))

(push 1)

(assert (not d!87360))

(assert (not d!87356))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87376 () Bool)

