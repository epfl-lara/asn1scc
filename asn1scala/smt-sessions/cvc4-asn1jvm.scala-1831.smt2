; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49192 () Bool)

(assert start!49192)

(declare-fun b!233670 () Bool)

(declare-fun e!161038 () Bool)

(assert (=> b!233670 (= e!161038 false)))

(declare-fun lt!369525 () (_ BitVec 64))

(declare-datatypes ((array!12080 0))(
  ( (array!12081 (arr!6288 (Array (_ BitVec 32) (_ BitVec 8))) (size!5301 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9698 0))(
  ( (BitStream!9699 (buf!5842 array!12080) (currentByte!10876 (_ BitVec 32)) (currentBit!10871 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9698)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!233670 (= lt!369525 (bitIndex!0 (size!5301 (buf!5842 b1!101)) (currentByte!10876 b1!101) (currentBit!10871 b1!101)))))

(declare-fun res!195477 () Bool)

(assert (=> start!49192 (=> (not res!195477) (not e!161038))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9698)

(assert (=> start!49192 (= res!195477 (and (= (size!5301 (buf!5842 b1!101)) (size!5301 (buf!5842 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49192 e!161038))

(declare-fun e!161040 () Bool)

(declare-fun inv!12 (BitStream!9698) Bool)

(assert (=> start!49192 (and (inv!12 b1!101) e!161040)))

(declare-fun e!161039 () Bool)

(assert (=> start!49192 (and (inv!12 b2!99) e!161039)))

(assert (=> start!49192 true))

(declare-fun b!233671 () Bool)

(declare-fun array_inv!5042 (array!12080) Bool)

(assert (=> b!233671 (= e!161039 (array_inv!5042 (buf!5842 b2!99)))))

(declare-fun b!233672 () Bool)

(declare-fun res!195476 () Bool)

(assert (=> b!233672 (=> (not res!195476) (not e!161038))))

(assert (=> b!233672 (= res!195476 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!233673 () Bool)

(declare-fun res!195474 () Bool)

(assert (=> b!233673 (=> (not res!195474) (not e!161038))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!233673 (= res!195474 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5301 (buf!5842 b1!101))) ((_ sign_extend 32) (currentByte!10876 b1!101)) ((_ sign_extend 32) (currentBit!10871 b1!101)) bytes!19))))

(declare-fun b!233674 () Bool)

(declare-fun res!195475 () Bool)

(assert (=> b!233674 (=> (not res!195475) (not e!161038))))

(assert (=> b!233674 (= res!195475 (bvsle bits!86 (bitIndex!0 (size!5301 (buf!5842 b2!99)) (currentByte!10876 b2!99) (currentBit!10871 b2!99))))))

(declare-fun b!233675 () Bool)

(assert (=> b!233675 (= e!161040 (array_inv!5042 (buf!5842 b1!101)))))

(assert (= (and start!49192 res!195477) b!233674))

(assert (= (and b!233674 res!195475) b!233672))

(assert (= (and b!233672 res!195476) b!233673))

(assert (= (and b!233673 res!195474) b!233670))

(assert (= start!49192 b!233675))

(assert (= start!49192 b!233671))

(declare-fun m!356187 () Bool)

(assert (=> start!49192 m!356187))

(declare-fun m!356189 () Bool)

(assert (=> start!49192 m!356189))

(declare-fun m!356191 () Bool)

(assert (=> b!233675 m!356191))

(declare-fun m!356193 () Bool)

(assert (=> b!233671 m!356193))

(declare-fun m!356195 () Bool)

(assert (=> b!233670 m!356195))

(declare-fun m!356197 () Bool)

(assert (=> b!233673 m!356197))

(declare-fun m!356199 () Bool)

(assert (=> b!233674 m!356199))

(push 1)

(assert (not b!233671))

(assert (not b!233674))

(assert (not b!233675))

(assert (not start!49192))

(assert (not b!233670))

(assert (not b!233673))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

