; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48780 () Bool)

(assert start!48780)

(declare-fun res!193467 () Bool)

(declare-fun e!158659 () Bool)

(assert (=> start!48780 (=> (not res!193467) (not e!158659))))

(declare-datatypes ((array!11800 0))(
  ( (array!11801 (arr!6157 (Array (_ BitVec 32) (_ BitVec 8))) (size!5170 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9436 0))(
  ( (BitStream!9437 (buf!5711 array!11800) (currentByte!10706 (_ BitVec 32)) (currentBit!10701 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9436)

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9436)

(assert (=> start!48780 (= res!193467 (and (= (size!5170 (buf!5711 b1!101)) (size!5170 (buf!5711 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48780 e!158659))

(declare-fun e!158657 () Bool)

(declare-fun inv!12 (BitStream!9436) Bool)

(assert (=> start!48780 (and (inv!12 b1!101) e!158657)))

(declare-fun e!158660 () Bool)

(assert (=> start!48780 (and (inv!12 b2!99) e!158660)))

(assert (=> start!48780 true))

(declare-fun b!230877 () Bool)

(assert (=> b!230877 (= e!158659 false)))

(declare-fun lt!368385 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230877 (= lt!368385 (bitIndex!0 (size!5170 (buf!5711 b2!99)) (currentByte!10706 b2!99) (currentBit!10701 b2!99)))))

(declare-fun b!230878 () Bool)

(declare-fun array_inv!4911 (array!11800) Bool)

(assert (=> b!230878 (= e!158657 (array_inv!4911 (buf!5711 b1!101)))))

(declare-fun b!230879 () Bool)

(assert (=> b!230879 (= e!158660 (array_inv!4911 (buf!5711 b2!99)))))

(assert (= (and start!48780 res!193467) b!230877))

(assert (= start!48780 b!230878))

(assert (= start!48780 b!230879))

(declare-fun m!354107 () Bool)

(assert (=> start!48780 m!354107))

(declare-fun m!354109 () Bool)

(assert (=> start!48780 m!354109))

(declare-fun m!354111 () Bool)

(assert (=> b!230877 m!354111))

(declare-fun m!354113 () Bool)

(assert (=> b!230878 m!354113))

(declare-fun m!354115 () Bool)

(assert (=> b!230879 m!354115))

(push 1)

(assert (not b!230877))

(assert (not start!48780))

(assert (not b!230878))

(assert (not b!230879))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

