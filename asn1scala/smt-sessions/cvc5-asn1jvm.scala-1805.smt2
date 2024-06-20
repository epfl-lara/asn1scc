; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48942 () Bool)

(assert start!48942)

(declare-fun res!194168 () Bool)

(declare-fun e!159537 () Bool)

(assert (=> start!48942 (=> (not res!194168) (not e!159537))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!11911 0))(
  ( (array!11912 (arr!6208 (Array (_ BitVec 32) (_ BitVec 8))) (size!5221 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9538 0))(
  ( (BitStream!9539 (buf!5762 array!11911) (currentByte!10769 (_ BitVec 32)) (currentBit!10764 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9538)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9538)

(assert (=> start!48942 (= res!194168 (and (= (size!5221 (buf!5762 b1!101)) (size!5221 (buf!5762 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48942 e!159537))

(declare-fun e!159538 () Bool)

(declare-fun inv!12 (BitStream!9538) Bool)

(assert (=> start!48942 (and (inv!12 b1!101) e!159538)))

(declare-fun e!159535 () Bool)

(assert (=> start!48942 (and (inv!12 b2!99) e!159535)))

(assert (=> start!48942 true))

(declare-fun b!231881 () Bool)

(declare-fun lt!368792 () (_ BitVec 64))

(declare-fun e!159534 () Bool)

(declare-fun lt!368793 () (_ BitVec 64))

(assert (=> b!231881 (= e!159534 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5221 (buf!5762 b1!101)))) lt!368793) #b0000000000000000000000000000000000000000000000000000000000001000)) (= lt!368792 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10769 b2!99))) ((_ sign_extend 32) (currentBit!10764 b2!99)))) (= (bvsub lt!368792 bits!86) lt!368793) (not (= ((_ sign_extend 32) (size!5221 (buf!5762 b2!99))) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5221 (buf!5762 b2!99)))) ((_ sign_extend 32) (size!5221 (buf!5762 b2!99))))))))))

(assert (=> b!231881 (= lt!368793 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10769 b1!101))) ((_ sign_extend 32) (currentBit!10764 b1!101))))))

(declare-fun b!231882 () Bool)

(declare-fun array_inv!4962 (array!11911) Bool)

(assert (=> b!231882 (= e!159538 (array_inv!4962 (buf!5762 b1!101)))))

(declare-fun b!231883 () Bool)

(declare-fun res!194167 () Bool)

(assert (=> b!231883 (=> (not res!194167) (not e!159534))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231883 (= res!194167 (= lt!368792 (bvadd (bitIndex!0 (size!5221 (buf!5762 b1!101)) (currentByte!10769 b1!101) (currentBit!10764 b1!101)) bits!86)))))

(declare-fun b!231884 () Bool)

(assert (=> b!231884 (= e!159537 e!159534)))

(declare-fun res!194169 () Bool)

(assert (=> b!231884 (=> (not res!194169) (not e!159534))))

(assert (=> b!231884 (= res!194169 (and (bvsle bits!86 lt!368792) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(assert (=> b!231884 (= lt!368792 (bitIndex!0 (size!5221 (buf!5762 b2!99)) (currentByte!10769 b2!99) (currentBit!10764 b2!99)))))

(declare-fun b!231885 () Bool)

(declare-fun res!194166 () Bool)

(assert (=> b!231885 (=> (not res!194166) (not e!159534))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231885 (= res!194166 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5221 (buf!5762 b1!101))) ((_ sign_extend 32) (currentByte!10769 b1!101)) ((_ sign_extend 32) (currentBit!10764 b1!101)) bytes!19))))

(declare-fun b!231886 () Bool)

(declare-fun res!194165 () Bool)

(assert (=> b!231886 (=> (not res!194165) (not e!159534))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!231886 (= res!194165 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5221 (buf!5762 b1!101))) ((_ sign_extend 32) (currentByte!10769 b1!101)) ((_ sign_extend 32) (currentBit!10764 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!231887 () Bool)

(assert (=> b!231887 (= e!159535 (array_inv!4962 (buf!5762 b2!99)))))

(assert (= (and start!48942 res!194168) b!231884))

(assert (= (and b!231884 res!194169) b!231885))

(assert (= (and b!231885 res!194166) b!231883))

(assert (= (and b!231883 res!194167) b!231886))

(assert (= (and b!231886 res!194165) b!231881))

(assert (= start!48942 b!231882))

(assert (= start!48942 b!231887))

(declare-fun m!354899 () Bool)

(assert (=> b!231883 m!354899))

(declare-fun m!354901 () Bool)

(assert (=> b!231887 m!354901))

(declare-fun m!354903 () Bool)

(assert (=> b!231884 m!354903))

(declare-fun m!354905 () Bool)

(assert (=> b!231886 m!354905))

(declare-fun m!354907 () Bool)

(assert (=> b!231885 m!354907))

(declare-fun m!354909 () Bool)

(assert (=> start!48942 m!354909))

(declare-fun m!354911 () Bool)

(assert (=> start!48942 m!354911))

(declare-fun m!354913 () Bool)

(assert (=> b!231882 m!354913))

(push 1)

(assert (not b!231882))

(assert (not b!231883))

(assert (not b!231885))

(assert (not b!231886))

(assert (not b!231884))

(assert (not start!48942))

(assert (not b!231887))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

