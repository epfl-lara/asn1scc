; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48746 () Bool)

(assert start!48746)

(declare-fun b!230758 () Bool)

(declare-fun e!158523 () Bool)

(declare-datatypes ((array!11781 0))(
  ( (array!11782 (arr!6149 (Array (_ BitVec 32) (_ BitVec 8))) (size!5162 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9420 0))(
  ( (BitStream!9421 (buf!5703 array!11781) (currentByte!10695 (_ BitVec 32)) (currentBit!10690 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9420)

(declare-fun array_inv!4903 (array!11781) Bool)

(assert (=> b!230758 (= e!158523 (array_inv!4903 (buf!5703 b1!101)))))

(declare-fun b!230759 () Bool)

(declare-fun e!158525 () Bool)

(declare-fun e!158522 () Bool)

(assert (=> b!230759 (= e!158525 e!158522)))

(declare-fun res!193400 () Bool)

(assert (=> b!230759 (=> (not res!193400) (not e!158522))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!368309 () (_ BitVec 64))

(assert (=> b!230759 (= res!193400 (bvsle bits!86 lt!368309))))

(declare-fun b2!99 () BitStream!9420)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230759 (= lt!368309 (bitIndex!0 (size!5162 (buf!5703 b2!99)) (currentByte!10695 b2!99) (currentBit!10690 b2!99)))))

(declare-fun b!230761 () Bool)

(declare-fun res!193396 () Bool)

(declare-fun e!158519 () Bool)

(assert (=> b!230761 (=> (not res!193396) (not e!158519))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230761 (= res!193396 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5162 (buf!5703 b1!101))) ((_ sign_extend 32) (currentByte!10695 b1!101)) ((_ sign_extend 32) (currentBit!10690 b1!101)) bytes!19))))

(declare-fun b!230762 () Bool)

(declare-fun e!158524 () Bool)

(assert (=> b!230762 (= e!158524 (array_inv!4903 (buf!5703 b2!99)))))

(declare-fun lt!368310 () (_ BitVec 64))

(declare-fun lt!368308 () (_ BitVec 64))

(declare-fun b!230763 () Bool)

(assert (=> b!230763 (= e!158519 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5162 (buf!5703 b1!101)))) lt!368310) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14301 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10695 b2!99))) ((_ sign_extend 32) (currentBit!10690 b2!99))))) (and (= lt!368309 bdg!14301) (= (bvsub lt!368309 bits!86) lt!368310) (let ((bdg!14302 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5162 (buf!5703 b2!99)))))) (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub bdg!14302 (bvsub bdg!14301 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsgt ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub bdg!14302 bdg!14301) #b0000000000000000000000000000000000000000000000000000000000001000) lt!368308))))))))))

(assert (=> b!230763 (= lt!368310 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10695 b1!101))) ((_ sign_extend 32) (currentBit!10690 b1!101))))))

(declare-fun b!230764 () Bool)

(assert (=> b!230764 (= e!158522 e!158519)))

(declare-fun res!193399 () Bool)

(assert (=> b!230764 (=> (not res!193399) (not e!158519))))

(assert (=> b!230764 (= res!193399 (bvsle ((_ extract 31 0) lt!368308) bytes!19))))

(assert (=> b!230764 (= lt!368308 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!230765 () Bool)

(declare-fun res!193397 () Bool)

(assert (=> b!230765 (=> (not res!193397) (not e!158519))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!230765 (= res!193397 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5162 (buf!5703 b1!101))) ((_ sign_extend 32) (currentByte!10695 b1!101)) ((_ sign_extend 32) (currentBit!10690 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!230760 () Bool)

(declare-fun res!193401 () Bool)

(assert (=> b!230760 (=> (not res!193401) (not e!158519))))

(assert (=> b!230760 (= res!193401 (= lt!368309 (bvadd (bitIndex!0 (size!5162 (buf!5703 b1!101)) (currentByte!10695 b1!101) (currentBit!10690 b1!101)) bits!86)))))

(declare-fun res!193398 () Bool)

(assert (=> start!48746 (=> (not res!193398) (not e!158525))))

(assert (=> start!48746 (= res!193398 (and (= (size!5162 (buf!5703 b1!101)) (size!5162 (buf!5703 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48746 e!158525))

(declare-fun inv!12 (BitStream!9420) Bool)

(assert (=> start!48746 (and (inv!12 b1!101) e!158523)))

(assert (=> start!48746 (and (inv!12 b2!99) e!158524)))

(assert (=> start!48746 true))

(assert (= (and start!48746 res!193398) b!230759))

(assert (= (and b!230759 res!193400) b!230764))

(assert (= (and b!230764 res!193399) b!230761))

(assert (= (and b!230761 res!193396) b!230760))

(assert (= (and b!230760 res!193401) b!230765))

(assert (= (and b!230765 res!193397) b!230763))

(assert (= start!48746 b!230758))

(assert (= start!48746 b!230762))

(declare-fun m!353997 () Bool)

(assert (=> b!230762 m!353997))

(declare-fun m!353999 () Bool)

(assert (=> b!230758 m!353999))

(declare-fun m!354001 () Bool)

(assert (=> b!230765 m!354001))

(declare-fun m!354003 () Bool)

(assert (=> start!48746 m!354003))

(declare-fun m!354005 () Bool)

(assert (=> start!48746 m!354005))

(declare-fun m!354007 () Bool)

(assert (=> b!230759 m!354007))

(declare-fun m!354009 () Bool)

(assert (=> b!230761 m!354009))

(declare-fun m!354011 () Bool)

(assert (=> b!230760 m!354011))

(check-sat (not b!230759) (not b!230762) (not b!230758) (not b!230761) (not b!230760) (not b!230765) (not start!48746))
(check-sat)
