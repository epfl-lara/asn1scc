; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48868 () Bool)

(assert start!48868)

(declare-fun b!231132 () Bool)

(declare-fun e!158899 () Bool)

(assert (=> b!231132 (= e!158899 false)))

(declare-fun lt!368607 () (_ BitVec 64))

(declare-datatypes ((array!11837 0))(
  ( (array!11838 (arr!6171 (Array (_ BitVec 32) (_ BitVec 8))) (size!5184 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9464 0))(
  ( (BitStream!9465 (buf!5725 array!11837) (currentByte!10732 (_ BitVec 32)) (currentBit!10727 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9464)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231132 (= lt!368607 (bitIndex!0 (size!5184 (buf!5725 b1!101)) (currentByte!10732 b1!101) (currentBit!10727 b1!101)))))

(declare-fun b!231133 () Bool)

(declare-fun e!158898 () Bool)

(declare-fun array_inv!4925 (array!11837) Bool)

(assert (=> b!231133 (= e!158898 (array_inv!4925 (buf!5725 b1!101)))))

(declare-fun b!231134 () Bool)

(declare-fun res!193639 () Bool)

(assert (=> b!231134 (=> (not res!193639) (not e!158899))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!231134 (= res!193639 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!231135 () Bool)

(declare-fun res!193640 () Bool)

(assert (=> b!231135 (=> (not res!193640) (not e!158899))))

(declare-fun b2!99 () BitStream!9464)

(assert (=> b!231135 (= res!193640 (bvsle bits!86 (bitIndex!0 (size!5184 (buf!5725 b2!99)) (currentByte!10732 b2!99) (currentBit!10727 b2!99))))))

(declare-fun res!193641 () Bool)

(assert (=> start!48868 (=> (not res!193641) (not e!158899))))

(assert (=> start!48868 (= res!193641 (and (= (size!5184 (buf!5725 b1!101)) (size!5184 (buf!5725 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48868 e!158899))

(declare-fun inv!12 (BitStream!9464) Bool)

(assert (=> start!48868 (and (inv!12 b1!101) e!158898)))

(declare-fun e!158896 () Bool)

(assert (=> start!48868 (and (inv!12 b2!99) e!158896)))

(assert (=> start!48868 true))

(declare-fun b!231136 () Bool)

(assert (=> b!231136 (= e!158896 (array_inv!4925 (buf!5725 b2!99)))))

(declare-fun b!231137 () Bool)

(declare-fun res!193638 () Bool)

(assert (=> b!231137 (=> (not res!193638) (not e!158899))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231137 (= res!193638 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5184 (buf!5725 b1!101))) ((_ sign_extend 32) (currentByte!10732 b1!101)) ((_ sign_extend 32) (currentBit!10727 b1!101)) bytes!19))))

(assert (= (and start!48868 res!193641) b!231135))

(assert (= (and b!231135 res!193640) b!231134))

(assert (= (and b!231134 res!193639) b!231137))

(assert (= (and b!231137 res!193638) b!231132))

(assert (= start!48868 b!231133))

(assert (= start!48868 b!231136))

(declare-fun m!354327 () Bool)

(assert (=> b!231137 m!354327))

(declare-fun m!354329 () Bool)

(assert (=> b!231135 m!354329))

(declare-fun m!354331 () Bool)

(assert (=> start!48868 m!354331))

(declare-fun m!354333 () Bool)

(assert (=> start!48868 m!354333))

(declare-fun m!354335 () Bool)

(assert (=> b!231136 m!354335))

(declare-fun m!354337 () Bool)

(assert (=> b!231133 m!354337))

(declare-fun m!354339 () Bool)

(assert (=> b!231132 m!354339))

(push 1)

