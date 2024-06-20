; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48982 () Bool)

(assert start!48982)

(declare-fun res!194451 () Bool)

(declare-fun e!159878 () Bool)

(assert (=> start!48982 (=> (not res!194451) (not e!159878))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!11951 0))(
  ( (array!11952 (arr!6228 (Array (_ BitVec 32) (_ BitVec 8))) (size!5241 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9578 0))(
  ( (BitStream!9579 (buf!5782 array!11951) (currentByte!10789 (_ BitVec 32)) (currentBit!10784 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9578)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9578)

(assert (=> start!48982 (= res!194451 (and (= (size!5241 (buf!5782 b1!101)) (size!5241 (buf!5782 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48982 e!159878))

(declare-fun e!159879 () Bool)

(declare-fun inv!12 (BitStream!9578) Bool)

(assert (=> start!48982 (and (inv!12 b1!101) e!159879)))

(declare-fun e!159881 () Bool)

(assert (=> start!48982 (and (inv!12 b2!99) e!159881)))

(assert (=> start!48982 true))

(declare-fun b!232284 () Bool)

(declare-fun array_inv!4982 (array!11951) Bool)

(assert (=> b!232284 (= e!159879 (array_inv!4982 (buf!5782 b1!101)))))

(declare-fun b!232285 () Bool)

(declare-fun res!194450 () Bool)

(assert (=> b!232285 (=> (not res!194450) (not e!159878))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232285 (= res!194450 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5241 (buf!5782 b1!101))) ((_ sign_extend 32) (currentByte!10789 b1!101)) ((_ sign_extend 32) (currentBit!10784 b1!101)) bytes!19))))

(declare-fun b!232286 () Bool)

(assert (=> b!232286 (= e!159881 (array_inv!4982 (buf!5782 b2!99)))))

(declare-fun b!232287 () Bool)

(declare-fun res!194449 () Bool)

(assert (=> b!232287 (=> (not res!194449) (not e!159878))))

(assert (=> b!232287 (= res!194449 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!232288 () Bool)

(declare-fun res!194448 () Bool)

(assert (=> b!232288 (=> (not res!194448) (not e!159878))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232288 (= res!194448 (bvsle bits!86 (bitIndex!0 (size!5241 (buf!5782 b2!99)) (currentByte!10789 b2!99) (currentBit!10784 b2!99))))))

(declare-fun b!232289 () Bool)

(assert (=> b!232289 (= e!159878 false)))

(declare-fun lt!368895 () (_ BitVec 64))

(assert (=> b!232289 (= lt!368895 (bitIndex!0 (size!5241 (buf!5782 b1!101)) (currentByte!10789 b1!101) (currentBit!10784 b1!101)))))

(assert (= (and start!48982 res!194451) b!232288))

(assert (= (and b!232288 res!194448) b!232287))

(assert (= (and b!232287 res!194449) b!232285))

(assert (= (and b!232285 res!194450) b!232289))

(assert (= start!48982 b!232284))

(assert (= start!48982 b!232286))

(declare-fun m!355209 () Bool)

(assert (=> b!232286 m!355209))

(declare-fun m!355211 () Bool)

(assert (=> start!48982 m!355211))

(declare-fun m!355213 () Bool)

(assert (=> start!48982 m!355213))

(declare-fun m!355215 () Bool)

(assert (=> b!232288 m!355215))

(declare-fun m!355217 () Bool)

(assert (=> b!232284 m!355217))

(declare-fun m!355219 () Bool)

(assert (=> b!232289 m!355219))

(declare-fun m!355221 () Bool)

(assert (=> b!232285 m!355221))

(push 1)

(assert (not b!232289))

(assert (not b!232286))

(assert (not start!48982))

(assert (not b!232288))

(assert (not b!232285))

(assert (not b!232284))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

