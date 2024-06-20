; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49026 () Bool)

(assert start!49026)

(declare-fun b!232725 () Bool)

(declare-fun e!160256 () Bool)

(assert (=> b!232725 (= e!160256 false)))

(declare-fun lt!369006 () (_ BitVec 64))

(declare-datatypes ((array!11995 0))(
  ( (array!11996 (arr!6250 (Array (_ BitVec 32) (_ BitVec 8))) (size!5263 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9622 0))(
  ( (BitStream!9623 (buf!5804 array!11995) (currentByte!10811 (_ BitVec 32)) (currentBit!10806 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9622)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232725 (= lt!369006 (bitIndex!0 (size!5263 (buf!5804 b1!101)) (currentByte!10811 b1!101) (currentBit!10806 b1!101)))))

(declare-fun b!232726 () Bool)

(declare-fun e!160252 () Bool)

(declare-fun array_inv!5004 (array!11995) Bool)

(assert (=> b!232726 (= e!160252 (array_inv!5004 (buf!5804 b1!101)))))

(declare-fun b!232727 () Bool)

(declare-fun res!194757 () Bool)

(assert (=> b!232727 (=> (not res!194757) (not e!160256))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun b2!99 () BitStream!9622)

(assert (=> b!232727 (= res!194757 (bvsle bits!86 (bitIndex!0 (size!5263 (buf!5804 b2!99)) (currentByte!10811 b2!99) (currentBit!10806 b2!99))))))

(declare-fun b!232728 () Bool)

(declare-fun res!194759 () Bool)

(assert (=> b!232728 (=> (not res!194759) (not e!160256))))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!232728 (= res!194759 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!232729 () Bool)

(declare-fun res!194760 () Bool)

(assert (=> b!232729 (=> (not res!194760) (not e!160256))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232729 (= res!194760 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5263 (buf!5804 b1!101))) ((_ sign_extend 32) (currentByte!10811 b1!101)) ((_ sign_extend 32) (currentBit!10806 b1!101)) bytes!19))))

(declare-fun res!194758 () Bool)

(assert (=> start!49026 (=> (not res!194758) (not e!160256))))

(assert (=> start!49026 (= res!194758 (and (= (size!5263 (buf!5804 b1!101)) (size!5263 (buf!5804 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49026 e!160256))

(declare-fun inv!12 (BitStream!9622) Bool)

(assert (=> start!49026 (and (inv!12 b1!101) e!160252)))

(declare-fun e!160253 () Bool)

(assert (=> start!49026 (and (inv!12 b2!99) e!160253)))

(assert (=> start!49026 true))

(declare-fun b!232730 () Bool)

(assert (=> b!232730 (= e!160253 (array_inv!5004 (buf!5804 b2!99)))))

(assert (= (and start!49026 res!194758) b!232727))

(assert (= (and b!232727 res!194757) b!232728))

(assert (= (and b!232728 res!194759) b!232729))

(assert (= (and b!232729 res!194760) b!232725))

(assert (= start!49026 b!232726))

(assert (= start!49026 b!232730))

(declare-fun m!355547 () Bool)

(assert (=> b!232730 m!355547))

(declare-fun m!355549 () Bool)

(assert (=> b!232726 m!355549))

(declare-fun m!355551 () Bool)

(assert (=> b!232729 m!355551))

(declare-fun m!355553 () Bool)

(assert (=> start!49026 m!355553))

(declare-fun m!355555 () Bool)

(assert (=> start!49026 m!355555))

(declare-fun m!355557 () Bool)

(assert (=> b!232725 m!355557))

(declare-fun m!355559 () Bool)

(assert (=> b!232727 m!355559))

(push 1)

(assert (not b!232726))

(assert (not b!232727))

(assert (not b!232725))

(assert (not start!49026))

(assert (not b!232729))

(assert (not b!232730))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

