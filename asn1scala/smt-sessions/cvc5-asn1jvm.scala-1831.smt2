; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49188 () Bool)

(assert start!49188)

(declare-fun b!233634 () Bool)

(declare-fun e!161008 () Bool)

(declare-datatypes ((array!12076 0))(
  ( (array!12077 (arr!6286 (Array (_ BitVec 32) (_ BitVec 8))) (size!5299 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9694 0))(
  ( (BitStream!9695 (buf!5840 array!12076) (currentByte!10874 (_ BitVec 32)) (currentBit!10869 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9694)

(declare-fun array_inv!5040 (array!12076) Bool)

(assert (=> b!233634 (= e!161008 (array_inv!5040 (buf!5840 b1!101)))))

(declare-fun b!233635 () Bool)

(declare-fun e!161010 () Bool)

(assert (=> b!233635 (= e!161010 false)))

(declare-fun lt!369519 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!233635 (= lt!369519 (bitIndex!0 (size!5299 (buf!5840 b1!101)) (currentByte!10874 b1!101) (currentBit!10869 b1!101)))))

(declare-fun b!233636 () Bool)

(declare-fun res!195453 () Bool)

(assert (=> b!233636 (=> (not res!195453) (not e!161010))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!233636 (= res!195453 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5299 (buf!5840 b1!101))) ((_ sign_extend 32) (currentByte!10874 b1!101)) ((_ sign_extend 32) (currentBit!10869 b1!101)) bytes!19))))

(declare-fun b!233637 () Bool)

(declare-fun res!195452 () Bool)

(assert (=> b!233637 (=> (not res!195452) (not e!161010))))

(declare-fun bits!86 () (_ BitVec 64))

(assert (=> b!233637 (= res!195452 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!233638 () Bool)

(declare-fun res!195451 () Bool)

(assert (=> b!233638 (=> (not res!195451) (not e!161010))))

(declare-fun b2!99 () BitStream!9694)

(assert (=> b!233638 (= res!195451 (bvsle bits!86 (bitIndex!0 (size!5299 (buf!5840 b2!99)) (currentByte!10874 b2!99) (currentBit!10869 b2!99))))))

(declare-fun b!233639 () Bool)

(declare-fun e!161009 () Bool)

(assert (=> b!233639 (= e!161009 (array_inv!5040 (buf!5840 b2!99)))))

(declare-fun res!195450 () Bool)

(assert (=> start!49188 (=> (not res!195450) (not e!161010))))

(assert (=> start!49188 (= res!195450 (and (= (size!5299 (buf!5840 b1!101)) (size!5299 (buf!5840 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49188 e!161010))

(declare-fun inv!12 (BitStream!9694) Bool)

(assert (=> start!49188 (and (inv!12 b1!101) e!161008)))

(assert (=> start!49188 (and (inv!12 b2!99) e!161009)))

(assert (=> start!49188 true))

(assert (= (and start!49188 res!195450) b!233638))

(assert (= (and b!233638 res!195451) b!233637))

(assert (= (and b!233637 res!195452) b!233636))

(assert (= (and b!233636 res!195453) b!233635))

(assert (= start!49188 b!233634))

(assert (= start!49188 b!233639))

(declare-fun m!356159 () Bool)

(assert (=> b!233636 m!356159))

(declare-fun m!356161 () Bool)

(assert (=> b!233634 m!356161))

(declare-fun m!356163 () Bool)

(assert (=> b!233639 m!356163))

(declare-fun m!356165 () Bool)

(assert (=> b!233635 m!356165))

(declare-fun m!356167 () Bool)

(assert (=> b!233638 m!356167))

(declare-fun m!356169 () Bool)

(assert (=> start!49188 m!356169))

(declare-fun m!356171 () Bool)

(assert (=> start!49188 m!356171))

(push 1)

(assert (not b!233636))

(assert (not b!233639))

(assert (not start!49188))

(assert (not b!233634))

(assert (not b!233635))

(assert (not b!233638))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

