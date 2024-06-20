; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60976 () Bool)

(assert start!60976)

(declare-fun res!228742 () Bool)

(declare-fun e!194861 () Bool)

(assert (=> start!60976 (=> (not res!228742) (not e!194861))))

(declare-datatypes ((array!15627 0))(
  ( (array!15628 (arr!7756 (Array (_ BitVec 32) (_ BitVec 8))) (size!6769 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12352 0))(
  ( (BitStream!12353 (buf!7237 array!15627) (currentByte!13390 (_ BitVec 32)) (currentBit!13385 (_ BitVec 32))) )
))
(declare-fun b!177 () BitStream!12352)

(declare-fun diffInBits!14 () (_ BitVec 64))

(assert (=> start!60976 (= res!228742 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6769 (buf!7237 b!177)))) diffInBits!14) (bvsle diffInBits!14 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6769 (buf!7237 b!177)))))))))

(assert (=> start!60976 e!194861))

(declare-fun e!194862 () Bool)

(declare-fun inv!12 (BitStream!12352) Bool)

(assert (=> start!60976 (and (inv!12 b!177) e!194862)))

(assert (=> start!60976 true))

(declare-fun b!274988 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!274988 (= e!194861 (not (invariant!0 (currentBit!13385 b!177) (currentByte!13390 b!177) (size!6769 (buf!7237 b!177)))))))

(declare-fun b!274989 () Bool)

(declare-fun array_inv!6493 (array!15627) Bool)

(assert (=> b!274989 (= e!194862 (array_inv!6493 (buf!7237 b!177)))))

(assert (= (and start!60976 res!228742) b!274988))

(assert (= start!60976 b!274989))

(declare-fun m!407555 () Bool)

(assert (=> start!60976 m!407555))

(declare-fun m!407557 () Bool)

(assert (=> b!274988 m!407557))

(declare-fun m!407559 () Bool)

(assert (=> b!274989 m!407559))

(push 1)

(assert (not b!274989))

(assert (not b!274988))

(assert (not start!60976))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94526 () Bool)

(assert (=> d!94526 (= (array_inv!6493 (buf!7237 b!177)) (bvsge (size!6769 (buf!7237 b!177)) #b00000000000000000000000000000000))))

(assert (=> b!274989 d!94526))

(declare-fun d!94528 () Bool)

(assert (=> d!94528 (= (invariant!0 (currentBit!13385 b!177) (currentByte!13390 b!177) (size!6769 (buf!7237 b!177))) (and (bvsge (currentBit!13385 b!177) #b00000000000000000000000000000000) (bvslt (currentBit!13385 b!177) #b00000000000000000000000000001000) (bvsge (currentByte!13390 b!177) #b00000000000000000000000000000000) (or (bvslt (currentByte!13390 b!177) (size!6769 (buf!7237 b!177))) (and (= (currentBit!13385 b!177) #b00000000000000000000000000000000) (= (currentByte!13390 b!177) (size!6769 (buf!7237 b!177)))))))))

(assert (=> b!274988 d!94528))

(declare-fun d!94532 () Bool)

(assert (=> d!94532 (= (inv!12 b!177) (invariant!0 (currentBit!13385 b!177) (currentByte!13390 b!177) (size!6769 (buf!7237 b!177))))))

(declare-fun bs!23796 () Bool)

(assert (= bs!23796 d!94532))

(assert (=> bs!23796 m!407557))

(assert (=> start!60976 d!94532))

(push 1)

(assert (not d!94532))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

