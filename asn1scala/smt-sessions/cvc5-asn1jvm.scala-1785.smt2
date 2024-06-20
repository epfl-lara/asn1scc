; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48744 () Bool)

(assert start!48744)

(declare-fun res!193379 () Bool)

(declare-fun e!158501 () Bool)

(assert (=> start!48744 (=> (not res!193379) (not e!158501))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!11779 0))(
  ( (array!11780 (arr!6148 (Array (_ BitVec 32) (_ BitVec 8))) (size!5161 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9418 0))(
  ( (BitStream!9419 (buf!5702 array!11779) (currentByte!10694 (_ BitVec 32)) (currentBit!10689 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9418)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9418)

(assert (=> start!48744 (= res!193379 (and (= (size!5161 (buf!5702 b1!101)) (size!5161 (buf!5702 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48744 e!158501))

(declare-fun e!158498 () Bool)

(declare-fun inv!12 (BitStream!9418) Bool)

(assert (=> start!48744 (and (inv!12 b1!101) e!158498)))

(declare-fun e!158502 () Bool)

(assert (=> start!48744 (and (inv!12 b2!99) e!158502)))

(assert (=> start!48744 true))

(declare-fun b!230734 () Bool)

(declare-fun res!193380 () Bool)

(declare-fun e!158503 () Bool)

(assert (=> b!230734 (=> (not res!193380) (not e!158503))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230734 (= res!193380 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5161 (buf!5702 b1!101))) ((_ sign_extend 32) (currentByte!10694 b1!101)) ((_ sign_extend 32) (currentBit!10689 b1!101)) bytes!19))))

(declare-fun lt!368299 () (_ BitVec 64))

(declare-fun lt!368301 () (_ BitVec 64))

(declare-fun b!230735 () Bool)

(declare-fun lt!368300 () (_ BitVec 64))

(assert (=> b!230735 (= e!158503 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5161 (buf!5702 b1!101)))) lt!368300) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14301 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10694 b2!99))) ((_ sign_extend 32) (currentBit!10689 b2!99))))) (and (= lt!368301 bdg!14301) (= (bvsub lt!368301 bits!86) lt!368300) (let ((bdg!14302 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5161 (buf!5702 b2!99)))))) (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub bdg!14302 (bvsub bdg!14301 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsgt ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub bdg!14302 bdg!14301) #b0000000000000000000000000000000000000000000000000000000000001000) lt!368299))))))))))

(assert (=> b!230735 (= lt!368300 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10694 b1!101))) ((_ sign_extend 32) (currentBit!10689 b1!101))))))

(declare-fun b!230736 () Bool)

(declare-fun e!158499 () Bool)

(assert (=> b!230736 (= e!158501 e!158499)))

(declare-fun res!193382 () Bool)

(assert (=> b!230736 (=> (not res!193382) (not e!158499))))

(assert (=> b!230736 (= res!193382 (bvsle bits!86 lt!368301))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230736 (= lt!368301 (bitIndex!0 (size!5161 (buf!5702 b2!99)) (currentByte!10694 b2!99) (currentBit!10689 b2!99)))))

(declare-fun b!230737 () Bool)

(declare-fun res!193383 () Bool)

(assert (=> b!230737 (=> (not res!193383) (not e!158503))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!230737 (= res!193383 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5161 (buf!5702 b1!101))) ((_ sign_extend 32) (currentByte!10694 b1!101)) ((_ sign_extend 32) (currentBit!10689 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!230738 () Bool)

(declare-fun res!193378 () Bool)

(assert (=> b!230738 (=> (not res!193378) (not e!158503))))

(assert (=> b!230738 (= res!193378 (= lt!368301 (bvadd (bitIndex!0 (size!5161 (buf!5702 b1!101)) (currentByte!10694 b1!101) (currentBit!10689 b1!101)) bits!86)))))

(declare-fun b!230739 () Bool)

(assert (=> b!230739 (= e!158499 e!158503)))

(declare-fun res!193381 () Bool)

(assert (=> b!230739 (=> (not res!193381) (not e!158503))))

(assert (=> b!230739 (= res!193381 (bvsle ((_ extract 31 0) lt!368299) bytes!19))))

(assert (=> b!230739 (= lt!368299 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!230740 () Bool)

(declare-fun array_inv!4902 (array!11779) Bool)

(assert (=> b!230740 (= e!158502 (array_inv!4902 (buf!5702 b2!99)))))

(declare-fun b!230741 () Bool)

(assert (=> b!230741 (= e!158498 (array_inv!4902 (buf!5702 b1!101)))))

(assert (= (and start!48744 res!193379) b!230736))

(assert (= (and b!230736 res!193382) b!230739))

(assert (= (and b!230739 res!193381) b!230734))

(assert (= (and b!230734 res!193380) b!230738))

(assert (= (and b!230738 res!193378) b!230737))

(assert (= (and b!230737 res!193383) b!230735))

(assert (= start!48744 b!230741))

(assert (= start!48744 b!230740))

(declare-fun m!353981 () Bool)

(assert (=> b!230736 m!353981))

(declare-fun m!353983 () Bool)

(assert (=> b!230738 m!353983))

(declare-fun m!353985 () Bool)

(assert (=> start!48744 m!353985))

(declare-fun m!353987 () Bool)

(assert (=> start!48744 m!353987))

(declare-fun m!353989 () Bool)

(assert (=> b!230737 m!353989))

(declare-fun m!353991 () Bool)

(assert (=> b!230741 m!353991))

(declare-fun m!353993 () Bool)

(assert (=> b!230734 m!353993))

(declare-fun m!353995 () Bool)

(assert (=> b!230740 m!353995))

(push 1)

(assert (not b!230737))

(assert (not b!230741))

(assert (not b!230740))

(assert (not start!48744))

(assert (not b!230738))

(assert (not b!230734))

(assert (not b!230736))

(check-sat)

(pop 1)

(push 1)

(check-sat)

