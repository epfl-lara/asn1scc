; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48976 () Bool)

(assert start!48976)

(declare-fun res!194415 () Bool)

(declare-fun e!159834 () Bool)

(assert (=> start!48976 (=> (not res!194415) (not e!159834))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!11945 0))(
  ( (array!11946 (arr!6225 (Array (_ BitVec 32) (_ BitVec 8))) (size!5238 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9572 0))(
  ( (BitStream!9573 (buf!5779 array!11945) (currentByte!10786 (_ BitVec 32)) (currentBit!10781 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9572)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9572)

(assert (=> start!48976 (= res!194415 (and (= (size!5238 (buf!5779 b1!101)) (size!5238 (buf!5779 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48976 e!159834))

(declare-fun e!159836 () Bool)

(declare-fun inv!12 (BitStream!9572) Bool)

(assert (=> start!48976 (and (inv!12 b1!101) e!159836)))

(declare-fun e!159835 () Bool)

(assert (=> start!48976 (and (inv!12 b2!99) e!159835)))

(assert (=> start!48976 true))

(declare-fun b!232230 () Bool)

(declare-fun array_inv!4979 (array!11945) Bool)

(assert (=> b!232230 (= e!159836 (array_inv!4979 (buf!5779 b1!101)))))

(declare-fun b!232231 () Bool)

(declare-fun res!194412 () Bool)

(assert (=> b!232231 (=> (not res!194412) (not e!159834))))

(assert (=> b!232231 (= res!194412 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!232232 () Bool)

(declare-fun res!194413 () Bool)

(assert (=> b!232232 (=> (not res!194413) (not e!159834))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232232 (= res!194413 (bvsle bits!86 (bitIndex!0 (size!5238 (buf!5779 b2!99)) (currentByte!10786 b2!99) (currentBit!10781 b2!99))))))

(declare-fun b!232233 () Bool)

(assert (=> b!232233 (= e!159834 false)))

(declare-fun lt!368886 () (_ BitVec 64))

(assert (=> b!232233 (= lt!368886 (bitIndex!0 (size!5238 (buf!5779 b1!101)) (currentByte!10786 b1!101) (currentBit!10781 b1!101)))))

(declare-fun b!232234 () Bool)

(declare-fun res!194414 () Bool)

(assert (=> b!232234 (=> (not res!194414) (not e!159834))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232234 (= res!194414 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5238 (buf!5779 b1!101))) ((_ sign_extend 32) (currentByte!10786 b1!101)) ((_ sign_extend 32) (currentBit!10781 b1!101)) bytes!19))))

(declare-fun b!232235 () Bool)

(assert (=> b!232235 (= e!159835 (array_inv!4979 (buf!5779 b2!99)))))

(assert (= (and start!48976 res!194415) b!232232))

(assert (= (and b!232232 res!194413) b!232231))

(assert (= (and b!232231 res!194412) b!232234))

(assert (= (and b!232234 res!194414) b!232233))

(assert (= start!48976 b!232230))

(assert (= start!48976 b!232235))

(declare-fun m!355167 () Bool)

(assert (=> b!232230 m!355167))

(declare-fun m!355169 () Bool)

(assert (=> b!232235 m!355169))

(declare-fun m!355171 () Bool)

(assert (=> b!232233 m!355171))

(declare-fun m!355173 () Bool)

(assert (=> b!232232 m!355173))

(declare-fun m!355175 () Bool)

(assert (=> start!48976 m!355175))

(declare-fun m!355177 () Bool)

(assert (=> start!48976 m!355177))

(declare-fun m!355179 () Bool)

(assert (=> b!232234 m!355179))

(push 1)

(assert (not start!48976))

(assert (not b!232235))

(assert (not b!232230))

(assert (not b!232234))

(assert (not b!232232))

(assert (not b!232233))

(check-sat)

(pop 1)

(push 1)

(check-sat)

