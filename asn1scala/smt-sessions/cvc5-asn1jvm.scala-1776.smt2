; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48544 () Bool)

(assert start!48544)

(declare-fun b!229933 () Bool)

(declare-fun e!157867 () Bool)

(declare-datatypes ((array!11711 0))(
  ( (array!11712 (arr!6121 (Array (_ BitVec 32) (_ BitVec 8))) (size!5134 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9364 0))(
  ( (BitStream!9365 (buf!5675 array!11711) (currentByte!10622 (_ BitVec 32)) (currentBit!10617 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9364)

(declare-fun array_inv!4875 (array!11711) Bool)

(assert (=> b!229933 (= e!157867 (array_inv!4875 (buf!5675 b1!101)))))

(declare-fun b!229934 () Bool)

(declare-fun res!192742 () Bool)

(declare-fun e!157869 () Bool)

(assert (=> b!229934 (=> (not res!192742) (not e!157869))))

(declare-fun lt!367723 () (_ BitVec 32))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9364)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229934 (= res!192742 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5134 (buf!5675 b2!99))) ((_ sign_extend 32) (currentByte!10622 b2!99)) ((_ sign_extend 32) (currentBit!10617 b2!99)) (bvsub bytes!19 lt!367723)))))

(declare-fun b!229935 () Bool)

(declare-fun e!157870 () Bool)

(declare-fun e!157868 () Bool)

(assert (=> b!229935 (= e!157870 e!157868)))

(declare-fun res!192748 () Bool)

(assert (=> b!229935 (=> (not res!192748) (not e!157868))))

(declare-fun lt!367724 () (_ BitVec 64))

(assert (=> b!229935 (= res!192748 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5134 (buf!5675 b1!101)))) lt!367724) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!229935 (= lt!367724 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10622 b1!101))) ((_ sign_extend 32) (currentBit!10617 b1!101))))))

(declare-fun b!229936 () Bool)

(declare-fun e!157864 () Bool)

(assert (=> b!229936 (= e!157864 (array_inv!4875 (buf!5675 b2!99)))))

(declare-fun b!229937 () Bool)

(declare-fun e!157861 () Bool)

(assert (=> b!229937 (= e!157868 e!157861)))

(declare-fun res!192740 () Bool)

(assert (=> b!229937 (=> (not res!192740) (not e!157861))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!367728 () (_ BitVec 64))

(declare-fun lt!367726 () (_ BitVec 64))

(assert (=> b!229937 (= res!192740 (and (= lt!367728 lt!367726) (= (bvsub lt!367728 bits!86) lt!367724)))))

(assert (=> b!229937 (= lt!367726 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10622 b2!99))) ((_ sign_extend 32) (currentBit!10617 b2!99))))))

(declare-fun b!229938 () Bool)

(declare-fun res!192744 () Bool)

(assert (=> b!229938 (=> (not res!192744) (not e!157870))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!229938 (= res!192744 (= lt!367728 (bvadd (bitIndex!0 (size!5134 (buf!5675 b1!101)) (currentByte!10622 b1!101) (currentBit!10617 b1!101)) bits!86)))))

(declare-fun res!192739 () Bool)

(declare-fun e!157866 () Bool)

(assert (=> start!48544 (=> (not res!192739) (not e!157866))))

(assert (=> start!48544 (= res!192739 (and (= (size!5134 (buf!5675 b1!101)) (size!5134 (buf!5675 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48544 e!157866))

(declare-fun inv!12 (BitStream!9364) Bool)

(assert (=> start!48544 (and (inv!12 b1!101) e!157867)))

(assert (=> start!48544 (and (inv!12 b2!99) e!157864)))

(assert (=> start!48544 true))

(declare-fun b!229939 () Bool)

(declare-fun res!192745 () Bool)

(assert (=> b!229939 (=> (not res!192745) (not e!157870))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!229939 (= res!192745 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5134 (buf!5675 b1!101))) ((_ sign_extend 32) (currentByte!10622 b1!101)) ((_ sign_extend 32) (currentBit!10617 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!229940 () Bool)

(declare-fun e!157862 () Bool)

(assert (=> b!229940 (= e!157862 e!157870)))

(declare-fun res!192747 () Bool)

(assert (=> b!229940 (=> (not res!192747) (not e!157870))))

(assert (=> b!229940 (= res!192747 (bvsle lt!367723 bytes!19))))

(declare-fun lt!367727 () (_ BitVec 64))

(assert (=> b!229940 (= lt!367723 ((_ extract 31 0) lt!367727))))

(assert (=> b!229940 (= lt!367727 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!229941 () Bool)

(assert (=> b!229941 (= e!157866 e!157862)))

(declare-fun res!192741 () Bool)

(assert (=> b!229941 (=> (not res!192741) (not e!157862))))

(assert (=> b!229941 (= res!192741 (bvsle bits!86 lt!367728))))

(assert (=> b!229941 (= lt!367728 (bitIndex!0 (size!5134 (buf!5675 b2!99)) (currentByte!10622 b2!99) (currentBit!10617 b2!99)))))

(declare-fun b!229942 () Bool)

(assert (=> b!229942 (= e!157869 (or (bvsgt ((_ sign_extend 32) (size!5134 (buf!5675 b2!99))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!10622 b2!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!10617 b2!99)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun b!229943 () Bool)

(declare-fun res!192746 () Bool)

(assert (=> b!229943 (=> (not res!192746) (not e!157870))))

(assert (=> b!229943 (= res!192746 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5134 (buf!5675 b1!101))) ((_ sign_extend 32) (currentByte!10622 b1!101)) ((_ sign_extend 32) (currentBit!10617 b1!101)) bytes!19))))

(declare-fun b!229944 () Bool)

(assert (=> b!229944 (= e!157861 e!157869)))

(declare-fun res!192743 () Bool)

(assert (=> b!229944 (=> (not res!192743) (not e!157869))))

(declare-fun lt!367725 () (_ BitVec 64))

(assert (=> b!229944 (= res!192743 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub lt!367725 (bvsub lt!367726 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub lt!367725 lt!367726) #b0000000000000000000000000000000000000000000000000000000000001000) lt!367727))))))

(assert (=> b!229944 (= lt!367725 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5134 (buf!5675 b2!99)))))))

(assert (= (and start!48544 res!192739) b!229941))

(assert (= (and b!229941 res!192741) b!229940))

(assert (= (and b!229940 res!192747) b!229943))

(assert (= (and b!229943 res!192746) b!229938))

(assert (= (and b!229938 res!192744) b!229939))

(assert (= (and b!229939 res!192745) b!229935))

(assert (= (and b!229935 res!192748) b!229937))

(assert (= (and b!229937 res!192740) b!229944))

(assert (= (and b!229944 res!192743) b!229934))

(assert (= (and b!229934 res!192742) b!229942))

(assert (= start!48544 b!229933))

(assert (= start!48544 b!229936))

(declare-fun m!353449 () Bool)

(assert (=> start!48544 m!353449))

(declare-fun m!353451 () Bool)

(assert (=> start!48544 m!353451))

(declare-fun m!353453 () Bool)

(assert (=> b!229939 m!353453))

(declare-fun m!353455 () Bool)

(assert (=> b!229938 m!353455))

(declare-fun m!353457 () Bool)

(assert (=> b!229943 m!353457))

(declare-fun m!353459 () Bool)

(assert (=> b!229936 m!353459))

(declare-fun m!353461 () Bool)

(assert (=> b!229934 m!353461))

(declare-fun m!353463 () Bool)

(assert (=> b!229941 m!353463))

(declare-fun m!353465 () Bool)

(assert (=> b!229933 m!353465))

(push 1)

(assert (not b!229939))

(assert (not b!229936))

(assert (not b!229938))

(assert (not b!229933))

(assert (not b!229943))

(assert (not b!229934))

(assert (not start!48544))

(assert (not b!229941))

(check-sat)

(pop 1)

(push 1)

(check-sat)

