; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56098 () Bool)

(assert start!56098)

(declare-fun res!217981 () Bool)

(declare-fun e!180754 () Bool)

(assert (=> start!56098 (=> (not res!217981) (not e!180754))))

(declare-datatypes ((array!14257 0))(
  ( (array!14258 (arr!7226 (Array (_ BitVec 32) (_ BitVec 8))) (size!6239 (_ BitVec 32))) )
))
(declare-fun buf!79 () array!14257)

(declare-datatypes ((BitStream!11400 0))(
  ( (BitStream!11401 (buf!6761 array!14257) (currentByte!12436 (_ BitVec 32)) (currentBit!12431 (_ BitVec 32))) )
))
(declare-fun b1!100 () BitStream!11400)

(declare-fun bits!81 () (_ BitVec 64))

(assert (=> start!56098 (= res!217981 (and (= (size!6239 (buf!6761 b1!100)) (size!6239 buf!79)) (bvsge bits!81 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle ((_ sign_extend 32) (size!6239 (buf!6761 b1!100))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!12436 b1!100)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!12431 b1!100)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!6239 (buf!6761 b1!100))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!12436 b1!100)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!12431 b1!100)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!56098 e!180754))

(declare-fun e!180753 () Bool)

(declare-fun inv!12 (BitStream!11400) Bool)

(assert (=> start!56098 (and (inv!12 b1!100) e!180753)))

(declare-fun array_inv!5980 (array!14257) Bool)

(assert (=> start!56098 (array_inv!5980 buf!79)))

(assert (=> start!56098 true))

(declare-fun b!260343 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!260343 (= e!180754 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!12431 b1!100))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!12436 b1!100))) ((_ extract 31 0) ((_ sign_extend 32) (size!6239 (buf!6761 b1!100)))))))))

(declare-fun b!260344 () Bool)

(assert (=> b!260344 (= e!180753 (array_inv!5980 (buf!6761 b1!100)))))

(assert (= (and start!56098 res!217981) b!260343))

(assert (= start!56098 b!260344))

(declare-fun m!389603 () Bool)

(assert (=> start!56098 m!389603))

(declare-fun m!389605 () Bool)

(assert (=> start!56098 m!389605))

(declare-fun m!389607 () Bool)

(assert (=> b!260343 m!389607))

(declare-fun m!389609 () Bool)

(assert (=> b!260344 m!389609))

(check-sat (not start!56098) (not b!260344) (not b!260343))
(check-sat)
(get-model)

(declare-fun d!87330 () Bool)

(assert (=> d!87330 (= (inv!12 b1!100) (invariant!0 (currentBit!12431 b1!100) (currentByte!12436 b1!100) (size!6239 (buf!6761 b1!100))))))

(declare-fun bs!22124 () Bool)

(assert (= bs!22124 d!87330))

(declare-fun m!389619 () Bool)

(assert (=> bs!22124 m!389619))

(assert (=> start!56098 d!87330))

(declare-fun d!87332 () Bool)

(assert (=> d!87332 (= (array_inv!5980 buf!79) (bvsge (size!6239 buf!79) #b00000000000000000000000000000000))))

(assert (=> start!56098 d!87332))

(declare-fun d!87334 () Bool)

(assert (=> d!87334 (= (array_inv!5980 (buf!6761 b1!100)) (bvsge (size!6239 (buf!6761 b1!100)) #b00000000000000000000000000000000))))

(assert (=> b!260344 d!87334))

(declare-fun d!87336 () Bool)

(assert (=> d!87336 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!12431 b1!100))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!12436 b1!100))) ((_ extract 31 0) ((_ sign_extend 32) (size!6239 (buf!6761 b1!100))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!12431 b1!100))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!12431 b1!100))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!12436 b1!100))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!12436 b1!100))) ((_ extract 31 0) ((_ sign_extend 32) (size!6239 (buf!6761 b1!100))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!12431 b1!100))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!12436 b1!100))) ((_ extract 31 0) ((_ sign_extend 32) (size!6239 (buf!6761 b1!100)))))))))))

(assert (=> b!260343 d!87336))

(check-sat (not d!87330))
(check-sat)
