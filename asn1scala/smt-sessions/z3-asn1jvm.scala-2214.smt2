; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56154 () Bool)

(assert start!56154)

(declare-fun b!260426 () Bool)

(declare-fun res!218038 () Bool)

(declare-fun e!180861 () Bool)

(assert (=> b!260426 (=> (not res!218038) (not e!180861))))

(declare-datatypes ((array!14280 0))(
  ( (array!14281 (arr!7235 (Array (_ BitVec 32) (_ BitVec 8))) (size!6248 (_ BitVec 32))) )
))
(declare-fun buf!79 () array!14280)

(declare-datatypes ((BitStream!11418 0))(
  ( (BitStream!11419 (buf!6770 array!14280) (currentByte!12454 (_ BitVec 32)) (currentBit!12449 (_ BitVec 32))) )
))
(declare-fun b1!100 () BitStream!11418)

(assert (=> b!260426 (= res!218038 (and (bvsle ((_ sign_extend 32) (size!6248 buf!79)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!12454 b1!100)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!12449 b1!100)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!6248 buf!79)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!12454 b1!100)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!12449 b1!100)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!260428 () Bool)

(declare-fun e!180859 () Bool)

(declare-fun array_inv!5989 (array!14280) Bool)

(assert (=> b!260428 (= e!180859 (array_inv!5989 (buf!6770 b1!100)))))

(declare-fun res!218036 () Bool)

(assert (=> start!56154 (=> (not res!218036) (not e!180861))))

(declare-fun bits!81 () (_ BitVec 64))

(assert (=> start!56154 (= res!218036 (and (= (size!6248 (buf!6770 b1!100)) (size!6248 buf!79)) (bvsge bits!81 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!56154 e!180861))

(declare-fun inv!12 (BitStream!11418) Bool)

(assert (=> start!56154 (and (inv!12 b1!100) e!180859)))

(assert (=> start!56154 (array_inv!5989 buf!79)))

(assert (=> start!56154 true))

(declare-fun b!260425 () Bool)

(declare-fun res!218037 () Bool)

(assert (=> b!260425 (=> (not res!218037) (not e!180861))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!260425 (= res!218037 (validate_offset_bits!1 ((_ sign_extend 32) (size!6248 (buf!6770 b1!100))) ((_ sign_extend 32) (currentByte!12454 b1!100)) ((_ sign_extend 32) (currentBit!12449 b1!100)) bits!81))))

(declare-fun b!260427 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!260427 (= e!180861 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!12449 b1!100))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!12454 b1!100))) ((_ extract 31 0) ((_ sign_extend 32) (size!6248 buf!79))))))))

(assert (= (and start!56154 res!218036) b!260425))

(assert (= (and b!260425 res!218037) b!260426))

(assert (= (and b!260426 res!218038) b!260427))

(assert (= start!56154 b!260428))

(declare-fun m!389691 () Bool)

(assert (=> b!260428 m!389691))

(declare-fun m!389693 () Bool)

(assert (=> start!56154 m!389693))

(declare-fun m!389695 () Bool)

(assert (=> start!56154 m!389695))

(declare-fun m!389697 () Bool)

(assert (=> b!260425 m!389697))

(declare-fun m!389699 () Bool)

(assert (=> b!260427 m!389699))

(check-sat (not b!260428) (not b!260427) (not start!56154) (not b!260425))
(check-sat)
(get-model)

(declare-fun d!87382 () Bool)

(assert (=> d!87382 (= (array_inv!5989 (buf!6770 b1!100)) (bvsge (size!6248 (buf!6770 b1!100)) #b00000000000000000000000000000000))))

(assert (=> b!260428 d!87382))

(declare-fun d!87384 () Bool)

(assert (=> d!87384 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!12449 b1!100))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!12454 b1!100))) ((_ extract 31 0) ((_ sign_extend 32) (size!6248 buf!79)))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!12449 b1!100))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!12449 b1!100))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!12454 b1!100))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!12454 b1!100))) ((_ extract 31 0) ((_ sign_extend 32) (size!6248 buf!79)))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!12449 b1!100))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!12454 b1!100))) ((_ extract 31 0) ((_ sign_extend 32) (size!6248 buf!79))))))))))

(assert (=> b!260427 d!87384))

(declare-fun d!87386 () Bool)

(assert (=> d!87386 (= (inv!12 b1!100) (invariant!0 (currentBit!12449 b1!100) (currentByte!12454 b1!100) (size!6248 (buf!6770 b1!100))))))

(declare-fun bs!22140 () Bool)

(assert (= bs!22140 d!87386))

(declare-fun m!389711 () Bool)

(assert (=> bs!22140 m!389711))

(assert (=> start!56154 d!87386))

(declare-fun d!87388 () Bool)

(assert (=> d!87388 (= (array_inv!5989 buf!79) (bvsge (size!6248 buf!79) #b00000000000000000000000000000000))))

(assert (=> start!56154 d!87388))

(declare-fun d!87390 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87390 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6248 (buf!6770 b1!100))) ((_ sign_extend 32) (currentByte!12454 b1!100)) ((_ sign_extend 32) (currentBit!12449 b1!100)) bits!81) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6248 (buf!6770 b1!100))) ((_ sign_extend 32) (currentByte!12454 b1!100)) ((_ sign_extend 32) (currentBit!12449 b1!100))) bits!81))))

(declare-fun bs!22141 () Bool)

(assert (= bs!22141 d!87390))

(declare-fun m!389713 () Bool)

(assert (=> bs!22141 m!389713))

(assert (=> b!260425 d!87390))

(check-sat (not d!87386) (not d!87390))
(check-sat)
