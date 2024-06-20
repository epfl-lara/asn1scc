; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48934 () Bool)

(assert start!48934)

(declare-fun b!231797 () Bool)

(declare-fun e!159467 () Bool)

(declare-datatypes ((array!11903 0))(
  ( (array!11904 (arr!6204 (Array (_ BitVec 32) (_ BitVec 8))) (size!5217 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9530 0))(
  ( (BitStream!9531 (buf!5758 array!11903) (currentByte!10765 (_ BitVec 32)) (currentBit!10760 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9530)

(declare-fun array_inv!4958 (array!11903) Bool)

(assert (=> b!231797 (= e!159467 (array_inv!4958 (buf!5758 b1!101)))))

(declare-fun b!231798 () Bool)

(declare-fun e!159466 () Bool)

(declare-fun lt!368759 () (_ BitVec 64))

(declare-fun lt!368760 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9530)

(assert (=> b!231798 (= e!159466 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5217 (buf!5758 b1!101)))) (bvadd lt!368759 ((_ sign_extend 32) (currentBit!10760 b1!101)))) #b0000000000000000000000000000000000000000000000000000000000001000)) (= lt!368760 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10765 b2!99))) ((_ sign_extend 32) (currentBit!10760 b2!99)))) (not (= ((_ sign_extend 32) (currentByte!10765 b1!101)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!368759 ((_ sign_extend 32) (currentByte!10765 b1!101)))))))))

(assert (=> b!231798 (= lt!368759 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10765 b1!101))))))

(declare-fun b!231799 () Bool)

(declare-fun res!194108 () Bool)

(assert (=> b!231799 (=> (not res!194108) (not e!159466))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!231799 (= res!194108 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5217 (buf!5758 b1!101))) ((_ sign_extend 32) (currentByte!10765 b1!101)) ((_ sign_extend 32) (currentBit!10760 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!231800 () Bool)

(declare-fun e!159465 () Bool)

(assert (=> b!231800 (= e!159465 e!159466)))

(declare-fun res!194106 () Bool)

(assert (=> b!231800 (=> (not res!194106) (not e!159466))))

(declare-fun bits!86 () (_ BitVec 64))

(assert (=> b!231800 (= res!194106 (and (bvsle bits!86 lt!368760) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231800 (= lt!368760 (bitIndex!0 (size!5217 (buf!5758 b2!99)) (currentByte!10765 b2!99) (currentBit!10760 b2!99)))))

(declare-fun b!231801 () Bool)

(declare-fun res!194107 () Bool)

(assert (=> b!231801 (=> (not res!194107) (not e!159466))))

(assert (=> b!231801 (= res!194107 (= lt!368760 (bvadd (bitIndex!0 (size!5217 (buf!5758 b1!101)) (currentByte!10765 b1!101) (currentBit!10760 b1!101)) bits!86)))))

(declare-fun b!231803 () Bool)

(declare-fun e!159462 () Bool)

(assert (=> b!231803 (= e!159462 (array_inv!4958 (buf!5758 b2!99)))))

(declare-fun res!194109 () Bool)

(assert (=> start!48934 (=> (not res!194109) (not e!159465))))

(assert (=> start!48934 (= res!194109 (and (= (size!5217 (buf!5758 b1!101)) (size!5217 (buf!5758 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48934 e!159465))

(declare-fun inv!12 (BitStream!9530) Bool)

(assert (=> start!48934 (and (inv!12 b1!101) e!159467)))

(assert (=> start!48934 (and (inv!12 b2!99) e!159462)))

(assert (=> start!48934 true))

(declare-fun b!231802 () Bool)

(declare-fun res!194105 () Bool)

(assert (=> b!231802 (=> (not res!194105) (not e!159466))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231802 (= res!194105 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5217 (buf!5758 b1!101))) ((_ sign_extend 32) (currentByte!10765 b1!101)) ((_ sign_extend 32) (currentBit!10760 b1!101)) bytes!19))))

(assert (= (and start!48934 res!194109) b!231800))

(assert (= (and b!231800 res!194106) b!231802))

(assert (= (and b!231802 res!194105) b!231801))

(assert (= (and b!231801 res!194107) b!231799))

(assert (= (and b!231799 res!194108) b!231798))

(assert (= start!48934 b!231797))

(assert (= start!48934 b!231803))

(declare-fun m!354835 () Bool)

(assert (=> b!231802 m!354835))

(declare-fun m!354837 () Bool)

(assert (=> b!231803 m!354837))

(declare-fun m!354839 () Bool)

(assert (=> b!231799 m!354839))

(declare-fun m!354841 () Bool)

(assert (=> start!48934 m!354841))

(declare-fun m!354843 () Bool)

(assert (=> start!48934 m!354843))

(declare-fun m!354845 () Bool)

(assert (=> b!231800 m!354845))

(declare-fun m!354847 () Bool)

(assert (=> b!231797 m!354847))

(declare-fun m!354849 () Bool)

(assert (=> b!231801 m!354849))

(push 1)

(assert (not start!48934))

(assert (not b!231799))

(assert (not b!231803))

(assert (not b!231797))

(assert (not b!231802))

(assert (not b!231801))

(assert (not b!231800))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

