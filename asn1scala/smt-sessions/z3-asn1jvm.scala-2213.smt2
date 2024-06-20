; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56122 () Bool)

(assert start!56122)

(declare-fun res!218014 () Bool)

(declare-fun e!180825 () Bool)

(assert (=> start!56122 (=> (not res!218014) (not e!180825))))

(declare-datatypes ((array!14271 0))(
  ( (array!14272 (arr!7232 (Array (_ BitVec 32) (_ BitVec 8))) (size!6245 (_ BitVec 32))) )
))
(declare-fun buf!79 () array!14271)

(declare-datatypes ((BitStream!11412 0))(
  ( (BitStream!11413 (buf!6767 array!14271) (currentByte!12444 (_ BitVec 32)) (currentBit!12439 (_ BitVec 32))) )
))
(declare-fun b1!100 () BitStream!11412)

(declare-fun bits!81 () (_ BitVec 64))

(assert (=> start!56122 (= res!218014 (and (= (size!6245 (buf!6767 b1!100)) (size!6245 buf!79)) (bvsge bits!81 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!56122 e!180825))

(declare-fun e!180826 () Bool)

(declare-fun inv!12 (BitStream!11412) Bool)

(assert (=> start!56122 (and (inv!12 b1!100) e!180826)))

(declare-fun array_inv!5986 (array!14271) Bool)

(assert (=> start!56122 (array_inv!5986 buf!79)))

(assert (=> start!56122 true))

(declare-fun b!260393 () Bool)

(declare-fun res!218013 () Bool)

(assert (=> b!260393 (=> (not res!218013) (not e!180825))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!260393 (= res!218013 (validate_offset_bits!1 ((_ sign_extend 32) (size!6245 (buf!6767 b1!100))) ((_ sign_extend 32) (currentByte!12444 b1!100)) ((_ sign_extend 32) (currentBit!12439 b1!100)) bits!81))))

(declare-fun b!260394 () Bool)

(assert (=> b!260394 (= e!180825 (and (bvsle ((_ sign_extend 32) (size!6245 buf!79)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!12444 b1!100)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!12439 b1!100)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!6245 buf!79)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!12444 b1!100)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!12439 b1!100)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!260395 () Bool)

(assert (=> b!260395 (= e!180826 (array_inv!5986 (buf!6767 b1!100)))))

(assert (= (and start!56122 res!218014) b!260393))

(assert (= (and b!260393 res!218013) b!260394))

(assert (= start!56122 b!260395))

(declare-fun m!389653 () Bool)

(assert (=> start!56122 m!389653))

(declare-fun m!389655 () Bool)

(assert (=> start!56122 m!389655))

(declare-fun m!389657 () Bool)

(assert (=> b!260393 m!389657))

(declare-fun m!389659 () Bool)

(assert (=> b!260395 m!389659))

(check-sat (not b!260393) (not b!260395) (not start!56122))
(check-sat)
(get-model)

(declare-fun d!87348 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87348 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6245 (buf!6767 b1!100))) ((_ sign_extend 32) (currentByte!12444 b1!100)) ((_ sign_extend 32) (currentBit!12439 b1!100)) bits!81) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6245 (buf!6767 b1!100))) ((_ sign_extend 32) (currentByte!12444 b1!100)) ((_ sign_extend 32) (currentBit!12439 b1!100))) bits!81))))

(declare-fun bs!22131 () Bool)

(assert (= bs!22131 d!87348))

(declare-fun m!389669 () Bool)

(assert (=> bs!22131 m!389669))

(assert (=> b!260393 d!87348))

(declare-fun d!87350 () Bool)

(assert (=> d!87350 (= (array_inv!5986 (buf!6767 b1!100)) (bvsge (size!6245 (buf!6767 b1!100)) #b00000000000000000000000000000000))))

(assert (=> b!260395 d!87350))

(declare-fun d!87352 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87352 (= (inv!12 b1!100) (invariant!0 (currentBit!12439 b1!100) (currentByte!12444 b1!100) (size!6245 (buf!6767 b1!100))))))

(declare-fun bs!22132 () Bool)

(assert (= bs!22132 d!87352))

(declare-fun m!389671 () Bool)

(assert (=> bs!22132 m!389671))

(assert (=> start!56122 d!87352))

(declare-fun d!87354 () Bool)

(assert (=> d!87354 (= (array_inv!5986 buf!79) (bvsge (size!6245 buf!79) #b00000000000000000000000000000000))))

(assert (=> start!56122 d!87354))

(check-sat (not d!87352) (not d!87348))
(check-sat)
(get-model)

(declare-fun d!87364 () Bool)

(assert (=> d!87364 (= (invariant!0 (currentBit!12439 b1!100) (currentByte!12444 b1!100) (size!6245 (buf!6767 b1!100))) (and (bvsge (currentBit!12439 b1!100) #b00000000000000000000000000000000) (bvslt (currentBit!12439 b1!100) #b00000000000000000000000000001000) (bvsge (currentByte!12444 b1!100) #b00000000000000000000000000000000) (or (bvslt (currentByte!12444 b1!100) (size!6245 (buf!6767 b1!100))) (and (= (currentBit!12439 b1!100) #b00000000000000000000000000000000) (= (currentByte!12444 b1!100) (size!6245 (buf!6767 b1!100)))))))))

(assert (=> d!87352 d!87364))

(declare-fun d!87368 () Bool)

(assert (=> d!87368 (= (remainingBits!0 ((_ sign_extend 32) (size!6245 (buf!6767 b1!100))) ((_ sign_extend 32) (currentByte!12444 b1!100)) ((_ sign_extend 32) (currentBit!12439 b1!100))) (bvsub (bvmul ((_ sign_extend 32) (size!6245 (buf!6767 b1!100))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12444 b1!100)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12439 b1!100)))))))

(assert (=> d!87348 d!87368))

(check-sat)
