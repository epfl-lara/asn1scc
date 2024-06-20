; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56082 () Bool)

(assert start!56082)

(declare-datatypes ((array!14249 0))(
  ( (array!14250 (arr!7223 (Array (_ BitVec 32) (_ BitVec 8))) (size!6236 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11394 0))(
  ( (BitStream!11395 (buf!6758 array!14249) (currentByte!12432 (_ BitVec 32)) (currentBit!12427 (_ BitVec 32))) )
))
(declare-fun b1!100 () BitStream!11394)

(declare-fun buf!79 () array!14249)

(declare-fun bits!81 () (_ BitVec 64))

(assert (=> start!56082 (and (= (size!6236 (buf!6758 b1!100)) (size!6236 buf!79)) (bvsge bits!81 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle ((_ sign_extend 32) (size!6236 (buf!6758 b1!100))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!12432 b1!100)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!12427 b1!100)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!6236 (buf!6758 b1!100))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!12432 b1!100)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!12427 b1!100)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!180719 () Bool)

(declare-fun inv!12 (BitStream!11394) Bool)

(assert (=> start!56082 (and (inv!12 b1!100) e!180719)))

(declare-fun array_inv!5977 (array!14249) Bool)

(assert (=> start!56082 (array_inv!5977 buf!79)))

(assert (=> start!56082 true))

(declare-fun b!260329 () Bool)

(assert (=> b!260329 (= e!180719 (array_inv!5977 (buf!6758 b1!100)))))

(assert (= start!56082 b!260329))

(declare-fun m!389579 () Bool)

(assert (=> start!56082 m!389579))

(declare-fun m!389581 () Bool)

(assert (=> start!56082 m!389581))

(declare-fun m!389583 () Bool)

(assert (=> b!260329 m!389583))

(check-sat (not b!260329) (not start!56082))
(check-sat)
(get-model)

(declare-fun d!87314 () Bool)

(assert (=> d!87314 (= (array_inv!5977 (buf!6758 b1!100)) (bvsge (size!6236 (buf!6758 b1!100)) #b00000000000000000000000000000000))))

(assert (=> b!260329 d!87314))

(declare-fun d!87316 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87316 (= (inv!12 b1!100) (invariant!0 (currentBit!12427 b1!100) (currentByte!12432 b1!100) (size!6236 (buf!6758 b1!100))))))

(declare-fun bs!22119 () Bool)

(assert (= bs!22119 d!87316))

(declare-fun m!389591 () Bool)

(assert (=> bs!22119 m!389591))

(assert (=> start!56082 d!87316))

(declare-fun d!87318 () Bool)

(assert (=> d!87318 (= (array_inv!5977 buf!79) (bvsge (size!6236 buf!79) #b00000000000000000000000000000000))))

(assert (=> start!56082 d!87318))

(check-sat (not d!87316))
(check-sat)
(get-model)

(declare-fun d!87320 () Bool)

(assert (=> d!87320 (= (invariant!0 (currentBit!12427 b1!100) (currentByte!12432 b1!100) (size!6236 (buf!6758 b1!100))) (and (bvsge (currentBit!12427 b1!100) #b00000000000000000000000000000000) (bvslt (currentBit!12427 b1!100) #b00000000000000000000000000001000) (bvsge (currentByte!12432 b1!100) #b00000000000000000000000000000000) (or (bvslt (currentByte!12432 b1!100) (size!6236 (buf!6758 b1!100))) (and (= (currentBit!12427 b1!100) #b00000000000000000000000000000000) (= (currentByte!12432 b1!100) (size!6236 (buf!6758 b1!100)))))))))

(assert (=> d!87316 d!87320))

(check-sat)
