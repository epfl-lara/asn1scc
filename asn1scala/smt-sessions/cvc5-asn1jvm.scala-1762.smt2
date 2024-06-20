; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48188 () Bool)

(assert start!48188)

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun b!228871 () Bool)

(declare-fun e!157000 () Bool)

(declare-datatypes ((array!11600 0))(
  ( (array!11601 (arr!6079 (Array (_ BitVec 32) (_ BitVec 8))) (size!5092 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9280 0))(
  ( (BitStream!9281 (buf!5633 array!11600) (currentByte!10498 (_ BitVec 32)) (currentBit!10493 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9280)

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!228871 (= e!157000 (and (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19) (bvsle ((_ sign_extend 32) (size!5092 (buf!5633 b1!101))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!10498 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!10493 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!5092 (buf!5633 b1!101))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!10498 b1!101)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!10493 b1!101)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!228873 () Bool)

(declare-fun e!157002 () Bool)

(declare-fun b2!99 () BitStream!9280)

(declare-fun array_inv!4833 (array!11600) Bool)

(assert (=> b!228873 (= e!157002 (array_inv!4833 (buf!5633 b2!99)))))

(declare-fun b!228872 () Bool)

(declare-fun e!157001 () Bool)

(assert (=> b!228872 (= e!157001 (array_inv!4833 (buf!5633 b1!101)))))

(declare-fun b!228870 () Bool)

(declare-fun res!191928 () Bool)

(assert (=> b!228870 (=> (not res!191928) (not e!157000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228870 (= res!191928 (bvsle bits!86 (bitIndex!0 (size!5092 (buf!5633 b2!99)) (currentByte!10498 b2!99) (currentBit!10493 b2!99))))))

(declare-fun res!191929 () Bool)

(assert (=> start!48188 (=> (not res!191929) (not e!157000))))

(assert (=> start!48188 (= res!191929 (and (= (size!5092 (buf!5633 b1!101)) (size!5092 (buf!5633 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48188 e!157000))

(declare-fun inv!12 (BitStream!9280) Bool)

(assert (=> start!48188 (and (inv!12 b1!101) e!157001)))

(assert (=> start!48188 (and (inv!12 b2!99) e!157002)))

(assert (=> start!48188 true))

(assert (= (and start!48188 res!191929) b!228870))

(assert (= (and b!228870 res!191928) b!228871))

(assert (= start!48188 b!228872))

(assert (= start!48188 b!228873))

(declare-fun m!352669 () Bool)

(assert (=> b!228873 m!352669))

(declare-fun m!352671 () Bool)

(assert (=> b!228872 m!352671))

(declare-fun m!352673 () Bool)

(assert (=> b!228870 m!352673))

(declare-fun m!352675 () Bool)

(assert (=> start!48188 m!352675))

(declare-fun m!352677 () Bool)

(assert (=> start!48188 m!352677))

(push 1)

(assert (not b!228870))

(assert (not b!228873))

(assert (not b!228872))

(assert (not start!48188))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77612 () Bool)

(declare-fun e!157036 () Bool)

(assert (=> d!77612 e!157036))

(declare-fun res!191947 () Bool)

(assert (=> d!77612 (=> (not res!191947) (not e!157036))))

(declare-fun lt!366996 () (_ BitVec 64))

(declare-fun lt!366998 () (_ BitVec 64))

(declare-fun lt!366999 () (_ BitVec 64))

(assert (=> d!77612 (= res!191947 (= lt!366999 (bvsub lt!366996 lt!366998)))))

(assert (=> d!77612 (or (= (bvand lt!366996 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!366998 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!366996 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!366996 lt!366998) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!77612 (= lt!366998 (remainingBits!0 ((_ sign_extend 32) (size!5092 (buf!5633 b2!99))) ((_ sign_extend 32) (currentByte!10498 b2!99)) ((_ sign_extend 32) (currentBit!10493 b2!99))))))

(declare-fun lt!366994 () (_ BitVec 64))

(declare-fun lt!366997 () (_ BitVec 64))

(assert (=> d!77612 (= lt!366996 (bvmul lt!366994 lt!366997))))

(assert (=> d!77612 (or (= lt!366994 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!366997 (bvsdiv (bvmul lt!366994 lt!366997) lt!366994)))))

(assert (=> d!77612 (= lt!366997 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77612 (= lt!366994 ((_ sign_extend 32) (size!5092 (buf!5633 b2!99))))))

(assert (=> d!77612 (= lt!366999 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10498 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10493 b2!99))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!77612 (invariant!0 (currentBit!10493 b2!99) (currentByte!10498 b2!99) (size!5092 (buf!5633 b2!99)))))

(assert (=> d!77612 (= (bitIndex!0 (size!5092 (buf!5633 b2!99)) (currentByte!10498 b2!99) (currentBit!10493 b2!99)) lt!366999)))

(declare-fun b!228902 () Bool)

(declare-fun res!191946 () Bool)

(assert (=> b!228902 (=> (not res!191946) (not e!157036))))

(assert (=> b!228902 (= res!191946 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!366999))))

(declare-fun b!228903 () Bool)

(declare-fun lt!366995 () (_ BitVec 64))

(assert (=> b!228903 (= e!157036 (bvsle lt!366999 (bvmul lt!366995 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!228903 (or (= lt!366995 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!366995 #b0000000000000000000000000000000000000000000000000000000000001000) lt!366995)))))

(assert (=> b!228903 (= lt!366995 ((_ sign_extend 32) (size!5092 (buf!5633 b2!99))))))

(assert (= (and d!77612 res!191947) b!228902))

(assert (= (and b!228902 res!191946) b!228903))

(declare-fun m!352703 () Bool)

(assert (=> d!77612 m!352703))

(declare-fun m!352705 () Bool)

(assert (=> d!77612 m!352705))

(assert (=> b!228870 d!77612))

(declare-fun d!77616 () Bool)

(assert (=> d!77616 (= (array_inv!4833 (buf!5633 b2!99)) (bvsge (size!5092 (buf!5633 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!228873 d!77616))

(declare-fun d!77618 () Bool)

(assert (=> d!77618 (= (array_inv!4833 (buf!5633 b1!101)) (bvsge (size!5092 (buf!5633 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!228872 d!77618))

(declare-fun d!77620 () Bool)

(assert (=> d!77620 (= (inv!12 b1!101) (invariant!0 (currentBit!10493 b1!101) (currentByte!10498 b1!101) (size!5092 (buf!5633 b1!101))))))

(declare-fun bs!19007 () Bool)

(assert (= bs!19007 d!77620))

(declare-fun m!352707 () Bool)

(assert (=> bs!19007 m!352707))

(assert (=> start!48188 d!77620))

(declare-fun d!77622 () Bool)

(assert (=> d!77622 (= (inv!12 b2!99) (invariant!0 (currentBit!10493 b2!99) (currentByte!10498 b2!99) (size!5092 (buf!5633 b2!99))))))

(declare-fun bs!19008 () Bool)

(assert (= bs!19008 d!77622))

(assert (=> bs!19008 m!352705))

(assert (=> start!48188 d!77622))

(push 1)

(assert (not d!77622))

(assert (not d!77620))

(assert (not d!77612))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77632 () Bool)

(assert (=> d!77632 (= (invariant!0 (currentBit!10493 b2!99) (currentByte!10498 b2!99) (size!5092 (buf!5633 b2!99))) (and (bvsge (currentBit!10493 b2!99) #b00000000000000000000000000000000) (bvslt (currentBit!10493 b2!99) #b00000000000000000000000000001000) (bvsge (currentByte!10498 b2!99) #b00000000000000000000000000000000) (or (bvslt (currentByte!10498 b2!99) (size!5092 (buf!5633 b2!99))) (and (= (currentBit!10493 b2!99) #b00000000000000000000000000000000) (= (currentByte!10498 b2!99) (size!5092 (buf!5633 b2!99)))))))))

(assert (=> d!77622 d!77632))

(declare-fun d!77634 () Bool)

(assert (=> d!77634 (= (invariant!0 (currentBit!10493 b1!101) (currentByte!10498 b1!101) (size!5092 (buf!5633 b1!101))) (and (bvsge (currentBit!10493 b1!101) #b00000000000000000000000000000000) (bvslt (currentBit!10493 b1!101) #b00000000000000000000000000001000) (bvsge (currentByte!10498 b1!101) #b00000000000000000000000000000000) (or (bvslt (currentByte!10498 b1!101) (size!5092 (buf!5633 b1!101))) (and (= (currentBit!10493 b1!101) #b00000000000000000000000000000000) (= (currentByte!10498 b1!101) (size!5092 (buf!5633 b1!101)))))))))

(assert (=> d!77620 d!77634))

(declare-fun d!77636 () Bool)

(assert (=> d!77636 (= (remainingBits!0 ((_ sign_extend 32) (size!5092 (buf!5633 b2!99))) ((_ sign_extend 32) (currentByte!10498 b2!99)) ((_ sign_extend 32) (currentBit!10493 b2!99))) (bvsub (bvmul ((_ sign_extend 32) (size!5092 (buf!5633 b2!99))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10498 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10493 b2!99)))))))

(assert (=> d!77612 d!77636))

(assert (=> d!77612 d!77632))

(push 1)

(check-sat)

(pop 1)

