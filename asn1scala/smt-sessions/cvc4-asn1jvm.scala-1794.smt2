; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48880 () Bool)

(assert start!48880)

(declare-fun b!231248 () Bool)

(declare-fun e!158998 () Bool)

(declare-datatypes ((array!11849 0))(
  ( (array!11850 (arr!6177 (Array (_ BitVec 32) (_ BitVec 8))) (size!5190 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9476 0))(
  ( (BitStream!9477 (buf!5731 array!11849) (currentByte!10738 (_ BitVec 32)) (currentBit!10733 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9476)

(assert (=> b!231248 (= e!158998 (and (not (= ((_ sign_extend 32) (size!5190 (buf!5731 b1!101))) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5190 (buf!5731 b1!101)))) ((_ sign_extend 32) (size!5190 (buf!5731 b1!101))))))))))

(declare-fun b!231249 () Bool)

(declare-fun e!158997 () Bool)

(declare-fun array_inv!4931 (array!11849) Bool)

(assert (=> b!231249 (= e!158997 (array_inv!4931 (buf!5731 b1!101)))))

(declare-fun b!231250 () Bool)

(declare-fun res!193718 () Bool)

(assert (=> b!231250 (=> (not res!193718) (not e!158998))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231250 (= res!193718 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5190 (buf!5731 b1!101))) ((_ sign_extend 32) (currentByte!10738 b1!101)) ((_ sign_extend 32) (currentBit!10733 b1!101)) bytes!19))))

(declare-fun res!193720 () Bool)

(declare-fun e!158995 () Bool)

(assert (=> start!48880 (=> (not res!193720) (not e!158995))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun b2!99 () BitStream!9476)

(assert (=> start!48880 (= res!193720 (and (= (size!5190 (buf!5731 b1!101)) (size!5190 (buf!5731 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48880 e!158995))

(declare-fun inv!12 (BitStream!9476) Bool)

(assert (=> start!48880 (and (inv!12 b1!101) e!158997)))

(declare-fun e!158994 () Bool)

(assert (=> start!48880 (and (inv!12 b2!99) e!158994)))

(assert (=> start!48880 true))

(declare-fun b!231251 () Bool)

(assert (=> b!231251 (= e!158995 e!158998)))

(declare-fun res!193722 () Bool)

(assert (=> b!231251 (=> (not res!193722) (not e!158998))))

(declare-fun lt!368625 () (_ BitVec 64))

(assert (=> b!231251 (= res!193722 (and (bvsle bits!86 lt!368625) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231251 (= lt!368625 (bitIndex!0 (size!5190 (buf!5731 b2!99)) (currentByte!10738 b2!99) (currentBit!10733 b2!99)))))

(declare-fun b!231252 () Bool)

(declare-fun res!193721 () Bool)

(assert (=> b!231252 (=> (not res!193721) (not e!158998))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!231252 (= res!193721 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5190 (buf!5731 b1!101))) ((_ sign_extend 32) (currentByte!10738 b1!101)) ((_ sign_extend 32) (currentBit!10733 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!231253 () Bool)

(assert (=> b!231253 (= e!158994 (array_inv!4931 (buf!5731 b2!99)))))

(declare-fun b!231254 () Bool)

(declare-fun res!193719 () Bool)

(assert (=> b!231254 (=> (not res!193719) (not e!158998))))

(assert (=> b!231254 (= res!193719 (= lt!368625 (bvadd (bitIndex!0 (size!5190 (buf!5731 b1!101)) (currentByte!10738 b1!101) (currentBit!10733 b1!101)) bits!86)))))

(assert (= (and start!48880 res!193720) b!231251))

(assert (= (and b!231251 res!193722) b!231250))

(assert (= (and b!231250 res!193718) b!231254))

(assert (= (and b!231254 res!193719) b!231252))

(assert (= (and b!231252 res!193721) b!231248))

(assert (= start!48880 b!231249))

(assert (= start!48880 b!231253))

(declare-fun m!354415 () Bool)

(assert (=> b!231252 m!354415))

(declare-fun m!354417 () Bool)

(assert (=> b!231249 m!354417))

(declare-fun m!354419 () Bool)

(assert (=> b!231254 m!354419))

(declare-fun m!354421 () Bool)

(assert (=> b!231250 m!354421))

(declare-fun m!354423 () Bool)

(assert (=> start!48880 m!354423))

(declare-fun m!354425 () Bool)

(assert (=> start!48880 m!354425))

(declare-fun m!354427 () Bool)

(assert (=> b!231251 m!354427))

(declare-fun m!354429 () Bool)

(assert (=> b!231253 m!354429))

(push 1)

(assert (not b!231254))

(assert (not b!231249))

(assert (not b!231252))

(assert (not start!48880))

(assert (not b!231250))

(assert (not b!231253))

(assert (not b!231251))

(check-sat)

(pop 1)

(push 1)

(check-sat)

