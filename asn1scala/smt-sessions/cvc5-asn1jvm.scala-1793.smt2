; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48870 () Bool)

(assert start!48870)

(declare-fun b!231150 () Bool)

(declare-fun e!158915 () Bool)

(declare-datatypes ((array!11839 0))(
  ( (array!11840 (arr!6172 (Array (_ BitVec 32) (_ BitVec 8))) (size!5185 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9466 0))(
  ( (BitStream!9467 (buf!5726 array!11839) (currentByte!10733 (_ BitVec 32)) (currentBit!10728 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9466)

(declare-fun array_inv!4926 (array!11839) Bool)

(assert (=> b!231150 (= e!158915 (array_inv!4926 (buf!5726 b1!101)))))

(declare-fun b!231151 () Bool)

(declare-fun e!158913 () Bool)

(assert (=> b!231151 (= e!158913 false)))

(declare-fun lt!368610 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231151 (= lt!368610 (bitIndex!0 (size!5185 (buf!5726 b1!101)) (currentByte!10733 b1!101) (currentBit!10728 b1!101)))))

(declare-fun b!231152 () Bool)

(declare-fun e!158912 () Bool)

(declare-fun b2!99 () BitStream!9466)

(assert (=> b!231152 (= e!158912 (array_inv!4926 (buf!5726 b2!99)))))

(declare-fun b!231153 () Bool)

(declare-fun res!193652 () Bool)

(assert (=> b!231153 (=> (not res!193652) (not e!158913))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231153 (= res!193652 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5185 (buf!5726 b1!101))) ((_ sign_extend 32) (currentByte!10733 b1!101)) ((_ sign_extend 32) (currentBit!10728 b1!101)) bytes!19))))

(declare-fun b!231154 () Bool)

(declare-fun res!193650 () Bool)

(assert (=> b!231154 (=> (not res!193650) (not e!158913))))

(declare-fun bits!86 () (_ BitVec 64))

(assert (=> b!231154 (= res!193650 (bvsle bits!86 (bitIndex!0 (size!5185 (buf!5726 b2!99)) (currentByte!10733 b2!99) (currentBit!10728 b2!99))))))

(declare-fun res!193653 () Bool)

(assert (=> start!48870 (=> (not res!193653) (not e!158913))))

(assert (=> start!48870 (= res!193653 (and (= (size!5185 (buf!5726 b1!101)) (size!5185 (buf!5726 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48870 e!158913))

(declare-fun inv!12 (BitStream!9466) Bool)

(assert (=> start!48870 (and (inv!12 b1!101) e!158915)))

(assert (=> start!48870 (and (inv!12 b2!99) e!158912)))

(assert (=> start!48870 true))

(declare-fun b!231155 () Bool)

(declare-fun res!193651 () Bool)

(assert (=> b!231155 (=> (not res!193651) (not e!158913))))

(assert (=> b!231155 (= res!193651 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(assert (= (and start!48870 res!193653) b!231154))

(assert (= (and b!231154 res!193650) b!231155))

(assert (= (and b!231155 res!193651) b!231153))

(assert (= (and b!231153 res!193652) b!231151))

(assert (= start!48870 b!231150))

(assert (= start!48870 b!231152))

(declare-fun m!354341 () Bool)

(assert (=> start!48870 m!354341))

(declare-fun m!354343 () Bool)

(assert (=> start!48870 m!354343))

(declare-fun m!354345 () Bool)

(assert (=> b!231154 m!354345))

(declare-fun m!354347 () Bool)

(assert (=> b!231153 m!354347))

(declare-fun m!354349 () Bool)

(assert (=> b!231151 m!354349))

(declare-fun m!354351 () Bool)

(assert (=> b!231150 m!354351))

(declare-fun m!354353 () Bool)

(assert (=> b!231152 m!354353))

(push 1)

(assert (not b!231153))

(assert (not b!231151))

(assert (not b!231154))

(assert (not start!48870))

(assert (not b!231150))

(assert (not b!231152))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

