; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49060 () Bool)

(assert start!49060)

(declare-fun b!233067 () Bool)

(declare-fun res!195000 () Bool)

(declare-fun e!160544 () Bool)

(assert (=> b!233067 (=> (not res!195000) (not e!160544))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!233067 (= res!195000 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!233069 () Bool)

(declare-fun res!194999 () Bool)

(assert (=> b!233069 (=> (not res!194999) (not e!160544))))

(declare-datatypes ((array!12029 0))(
  ( (array!12030 (arr!6267 (Array (_ BitVec 32) (_ BitVec 8))) (size!5280 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9656 0))(
  ( (BitStream!9657 (buf!5821 array!12029) (currentByte!10828 (_ BitVec 32)) (currentBit!10823 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9656)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!233069 (= res!194999 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5280 (buf!5821 b1!101))) ((_ sign_extend 32) (currentByte!10828 b1!101)) ((_ sign_extend 32) (currentBit!10823 b1!101)) bytes!19))))

(declare-fun b!233070 () Bool)

(assert (=> b!233070 (= e!160544 false)))

(declare-fun lt!369093 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!233070 (= lt!369093 (bitIndex!0 (size!5280 (buf!5821 b1!101)) (currentByte!10828 b1!101) (currentBit!10823 b1!101)))))

(declare-fun b!233071 () Bool)

(declare-fun e!160545 () Bool)

(declare-fun array_inv!5021 (array!12029) Bool)

(assert (=> b!233071 (= e!160545 (array_inv!5021 (buf!5821 b1!101)))))

(declare-fun b!233072 () Bool)

(declare-fun res!194998 () Bool)

(assert (=> b!233072 (=> (not res!194998) (not e!160544))))

(declare-fun b2!99 () BitStream!9656)

(assert (=> b!233072 (= res!194998 (bvsle bits!86 (bitIndex!0 (size!5280 (buf!5821 b2!99)) (currentByte!10828 b2!99) (currentBit!10823 b2!99))))))

(declare-fun b!233068 () Bool)

(declare-fun e!160546 () Bool)

(assert (=> b!233068 (= e!160546 (array_inv!5021 (buf!5821 b2!99)))))

(declare-fun res!194997 () Bool)

(assert (=> start!49060 (=> (not res!194997) (not e!160544))))

(assert (=> start!49060 (= res!194997 (and (= (size!5280 (buf!5821 b1!101)) (size!5280 (buf!5821 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49060 e!160544))

(declare-fun inv!12 (BitStream!9656) Bool)

(assert (=> start!49060 (and (inv!12 b1!101) e!160545)))

(assert (=> start!49060 (and (inv!12 b2!99) e!160546)))

(assert (=> start!49060 true))

(assert (= (and start!49060 res!194997) b!233072))

(assert (= (and b!233072 res!194998) b!233067))

(assert (= (and b!233067 res!195000) b!233069))

(assert (= (and b!233069 res!194999) b!233070))

(assert (= start!49060 b!233071))

(assert (= start!49060 b!233068))

(declare-fun m!355797 () Bool)

(assert (=> start!49060 m!355797))

(declare-fun m!355799 () Bool)

(assert (=> start!49060 m!355799))

(declare-fun m!355801 () Bool)

(assert (=> b!233071 m!355801))

(declare-fun m!355803 () Bool)

(assert (=> b!233070 m!355803))

(declare-fun m!355805 () Bool)

(assert (=> b!233069 m!355805))

(declare-fun m!355807 () Bool)

(assert (=> b!233068 m!355807))

(declare-fun m!355809 () Bool)

(assert (=> b!233072 m!355809))

(push 1)

(assert (not b!233070))

(assert (not b!233069))

(assert (not b!233068))

(assert (not b!233071))

(assert (not start!49060))

(assert (not b!233072))

(check-sat)

(pop 1)

(push 1)

(check-sat)

