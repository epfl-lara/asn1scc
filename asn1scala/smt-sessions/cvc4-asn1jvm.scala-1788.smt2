; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48784 () Bool)

(assert start!48784)

(declare-fun res!193473 () Bool)

(declare-fun e!158688 () Bool)

(assert (=> start!48784 (=> (not res!193473) (not e!158688))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!11804 0))(
  ( (array!11805 (arr!6159 (Array (_ BitVec 32) (_ BitVec 8))) (size!5172 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9440 0))(
  ( (BitStream!9441 (buf!5713 array!11804) (currentByte!10708 (_ BitVec 32)) (currentBit!10703 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9440)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9440)

(assert (=> start!48784 (= res!193473 (and (= (size!5172 (buf!5713 b1!101)) (size!5172 (buf!5713 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48784 e!158688))

(declare-fun e!158689 () Bool)

(declare-fun inv!12 (BitStream!9440) Bool)

(assert (=> start!48784 (and (inv!12 b1!101) e!158689)))

(declare-fun e!158687 () Bool)

(assert (=> start!48784 (and (inv!12 b2!99) e!158687)))

(assert (=> start!48784 true))

(declare-fun b!230895 () Bool)

(assert (=> b!230895 (= e!158688 false)))

(declare-fun lt!368391 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230895 (= lt!368391 (bitIndex!0 (size!5172 (buf!5713 b2!99)) (currentByte!10708 b2!99) (currentBit!10703 b2!99)))))

(declare-fun b!230896 () Bool)

(declare-fun array_inv!4913 (array!11804) Bool)

(assert (=> b!230896 (= e!158689 (array_inv!4913 (buf!5713 b1!101)))))

(declare-fun b!230897 () Bool)

(assert (=> b!230897 (= e!158687 (array_inv!4913 (buf!5713 b2!99)))))

(assert (= (and start!48784 res!193473) b!230895))

(assert (= start!48784 b!230896))

(assert (= start!48784 b!230897))

(declare-fun m!354127 () Bool)

(assert (=> start!48784 m!354127))

(declare-fun m!354129 () Bool)

(assert (=> start!48784 m!354129))

(declare-fun m!354131 () Bool)

(assert (=> b!230895 m!354131))

(declare-fun m!354133 () Bool)

(assert (=> b!230896 m!354133))

(declare-fun m!354135 () Bool)

(assert (=> b!230897 m!354135))

(push 1)

(assert (not b!230896))

(assert (not b!230897))

(assert (not b!230895))

(assert (not start!48784))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

