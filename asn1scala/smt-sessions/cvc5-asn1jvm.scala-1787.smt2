; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48774 () Bool)

(assert start!48774)

(declare-fun res!193458 () Bool)

(declare-fun e!158613 () Bool)

(assert (=> start!48774 (=> (not res!193458) (not e!158613))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!11794 0))(
  ( (array!11795 (arr!6154 (Array (_ BitVec 32) (_ BitVec 8))) (size!5167 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9430 0))(
  ( (BitStream!9431 (buf!5708 array!11794) (currentByte!10703 (_ BitVec 32)) (currentBit!10698 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9430)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9430)

(assert (=> start!48774 (= res!193458 (and (= (size!5167 (buf!5708 b1!101)) (size!5167 (buf!5708 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48774 e!158613))

(declare-fun e!158614 () Bool)

(declare-fun inv!12 (BitStream!9430) Bool)

(assert (=> start!48774 (and (inv!12 b1!101) e!158614)))

(declare-fun e!158612 () Bool)

(assert (=> start!48774 (and (inv!12 b2!99) e!158612)))

(assert (=> start!48774 true))

(declare-fun b!230850 () Bool)

(assert (=> b!230850 (= e!158613 false)))

(declare-fun lt!368376 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230850 (= lt!368376 (bitIndex!0 (size!5167 (buf!5708 b2!99)) (currentByte!10703 b2!99) (currentBit!10698 b2!99)))))

(declare-fun b!230851 () Bool)

(declare-fun array_inv!4908 (array!11794) Bool)

(assert (=> b!230851 (= e!158614 (array_inv!4908 (buf!5708 b1!101)))))

(declare-fun b!230852 () Bool)

(assert (=> b!230852 (= e!158612 (array_inv!4908 (buf!5708 b2!99)))))

(assert (= (and start!48774 res!193458) b!230850))

(assert (= start!48774 b!230851))

(assert (= start!48774 b!230852))

(declare-fun m!354077 () Bool)

(assert (=> start!48774 m!354077))

(declare-fun m!354079 () Bool)

(assert (=> start!48774 m!354079))

(declare-fun m!354081 () Bool)

(assert (=> b!230850 m!354081))

(declare-fun m!354083 () Bool)

(assert (=> b!230851 m!354083))

(declare-fun m!354085 () Bool)

(assert (=> b!230852 m!354085))

(push 1)

(assert (not b!230852))

(assert (not b!230850))

(assert (not b!230851))

(assert (not start!48774))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

