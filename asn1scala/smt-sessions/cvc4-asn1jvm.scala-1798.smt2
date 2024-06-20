; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48904 () Bool)

(assert start!48904)

(declare-fun res!193892 () Bool)

(declare-fun e!159202 () Bool)

(assert (=> start!48904 (=> (not res!193892) (not e!159202))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!11873 0))(
  ( (array!11874 (arr!6189 (Array (_ BitVec 32) (_ BitVec 8))) (size!5202 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9500 0))(
  ( (BitStream!9501 (buf!5743 array!11873) (currentByte!10750 (_ BitVec 32)) (currentBit!10745 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9500)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9500)

(assert (=> start!48904 (= res!193892 (and (= (size!5202 (buf!5743 b1!101)) (size!5202 (buf!5743 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48904 e!159202))

(declare-fun e!159205 () Bool)

(declare-fun inv!12 (BitStream!9500) Bool)

(assert (=> start!48904 (and (inv!12 b1!101) e!159205)))

(declare-fun e!159206 () Bool)

(assert (=> start!48904 (and (inv!12 b2!99) e!159206)))

(assert (=> start!48904 true))

(declare-fun b!231492 () Bool)

(declare-fun res!193893 () Bool)

(assert (=> b!231492 (=> (not res!193893) (not e!159202))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231492 (= res!193893 (bvsle bits!86 (bitIndex!0 (size!5202 (buf!5743 b2!99)) (currentByte!10750 b2!99) (currentBit!10745 b2!99))))))

(declare-fun b!231493 () Bool)

(declare-fun res!193890 () Bool)

(assert (=> b!231493 (=> (not res!193890) (not e!159202))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231493 (= res!193890 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5202 (buf!5743 b1!101))) ((_ sign_extend 32) (currentByte!10750 b1!101)) ((_ sign_extend 32) (currentBit!10745 b1!101)) bytes!19))))

(declare-fun b!231494 () Bool)

(assert (=> b!231494 (= e!159202 false)))

(declare-fun lt!368706 () (_ BitVec 64))

(assert (=> b!231494 (= lt!368706 (bitIndex!0 (size!5202 (buf!5743 b1!101)) (currentByte!10750 b1!101) (currentBit!10745 b1!101)))))

(declare-fun b!231495 () Bool)

(declare-fun res!193891 () Bool)

(assert (=> b!231495 (=> (not res!193891) (not e!159202))))

(assert (=> b!231495 (= res!193891 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!231496 () Bool)

(declare-fun array_inv!4943 (array!11873) Bool)

(assert (=> b!231496 (= e!159205 (array_inv!4943 (buf!5743 b1!101)))))

(declare-fun b!231497 () Bool)

(assert (=> b!231497 (= e!159206 (array_inv!4943 (buf!5743 b2!99)))))

(assert (= (and start!48904 res!193892) b!231492))

(assert (= (and b!231492 res!193893) b!231495))

(assert (= (and b!231495 res!193891) b!231493))

(assert (= (and b!231493 res!193890) b!231494))

(assert (= start!48904 b!231496))

(assert (= start!48904 b!231497))

(declare-fun m!354603 () Bool)

(assert (=> b!231494 m!354603))

(declare-fun m!354605 () Bool)

(assert (=> b!231492 m!354605))

(declare-fun m!354607 () Bool)

(assert (=> start!48904 m!354607))

(declare-fun m!354609 () Bool)

(assert (=> start!48904 m!354609))

(declare-fun m!354611 () Bool)

(assert (=> b!231496 m!354611))

(declare-fun m!354613 () Bool)

(assert (=> b!231493 m!354613))

(declare-fun m!354615 () Bool)

(assert (=> b!231497 m!354615))

(push 1)

(assert (not b!231492))

(assert (not b!231493))

(assert (not b!231497))

(assert (not start!48904))

(assert (not b!231496))

(assert (not b!231494))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

