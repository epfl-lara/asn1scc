; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27480 () Bool)

(assert start!27480)

(declare-fun b!141566 () Bool)

(declare-fun e!94320 () Bool)

(assert (=> b!141566 (= e!94320 (not true))))

(declare-fun e!94312 () Bool)

(assert (=> b!141566 e!94312))

(declare-fun res!118101 () Bool)

(assert (=> b!141566 (=> (not res!118101) (not e!94312))))

(declare-datatypes ((array!6495 0))(
  ( (array!6496 (arr!3648 (Array (_ BitVec 32) (_ BitVec 8))) (size!2941 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5140 0))(
  ( (BitStream!5141 (buf!3362 array!6495) (currentByte!6222 (_ BitVec 32)) (currentBit!6217 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5140)

(declare-datatypes ((Unit!8864 0))(
  ( (Unit!8865) )
))
(declare-datatypes ((tuple2!12544 0))(
  ( (tuple2!12545 (_1!6602 Unit!8864) (_2!6602 BitStream!5140)) )
))
(declare-fun lt!219632 () tuple2!12544)

(declare-fun isPrefixOf!0 (BitStream!5140 BitStream!5140) Bool)

(assert (=> b!141566 (= res!118101 (isPrefixOf!0 thiss!1634 (_2!6602 lt!219632)))))

(declare-fun lt!219635 () Unit!8864)

(declare-fun lt!219630 () tuple2!12544)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5140 BitStream!5140 BitStream!5140) Unit!8864)

(assert (=> b!141566 (= lt!219635 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6602 lt!219630) (_2!6602 lt!219632)))))

(declare-fun e!94317 () Bool)

(assert (=> b!141566 e!94317))

(declare-fun res!118094 () Bool)

(assert (=> b!141566 (=> (not res!118094) (not e!94317))))

(assert (=> b!141566 (= res!118094 (= (size!2941 (buf!3362 (_2!6602 lt!219630))) (size!2941 (buf!3362 (_2!6602 lt!219632)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!6495)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun appendByteArrayLoop!0 (BitStream!5140 array!6495 (_ BitVec 32) (_ BitVec 32)) tuple2!12544)

(assert (=> b!141566 (= lt!219632 (appendByteArrayLoop!0 (_2!6602 lt!219630) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!141566 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2941 (buf!3362 (_2!6602 lt!219630)))) ((_ sign_extend 32) (currentByte!6222 (_2!6602 lt!219630))) ((_ sign_extend 32) (currentBit!6217 (_2!6602 lt!219630))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!219629 () Unit!8864)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5140 BitStream!5140 (_ BitVec 64) (_ BitVec 32)) Unit!8864)

(assert (=> b!141566 (= lt!219629 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6602 lt!219630) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!94319 () Bool)

(assert (=> b!141566 e!94319))

(declare-fun res!118103 () Bool)

(assert (=> b!141566 (=> (not res!118103) (not e!94319))))

(assert (=> b!141566 (= res!118103 (= (size!2941 (buf!3362 thiss!1634)) (size!2941 (buf!3362 (_2!6602 lt!219630)))))))

(declare-fun appendByte!0 (BitStream!5140 (_ BitVec 8)) tuple2!12544)

(assert (=> b!141566 (= lt!219630 (appendByte!0 thiss!1634 (select (arr!3648 arr!237) from!447)))))

(declare-fun b!141567 () Bool)

(declare-fun res!118102 () Bool)

(declare-fun e!94313 () Bool)

(assert (=> b!141567 (=> (not res!118102) (not e!94313))))

(assert (=> b!141567 (= res!118102 (isPrefixOf!0 (_2!6602 lt!219630) (_2!6602 lt!219632)))))

(declare-fun b!141569 () Bool)

(declare-fun res!118104 () Bool)

(assert (=> b!141569 (=> (not res!118104) (not e!94320))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!141569 (= res!118104 (invariant!0 (currentBit!6217 thiss!1634) (currentByte!6222 thiss!1634) (size!2941 (buf!3362 thiss!1634))))))

(declare-fun b!141570 () Bool)

(declare-fun e!94314 () Bool)

(assert (=> b!141570 (= e!94313 (not e!94314))))

(declare-fun res!118105 () Bool)

(assert (=> b!141570 (=> res!118105 e!94314)))

(declare-datatypes ((tuple2!12546 0))(
  ( (tuple2!12547 (_1!6603 BitStream!5140) (_2!6603 array!6495)) )
))
(declare-fun lt!219634 () tuple2!12546)

(declare-datatypes ((tuple2!12548 0))(
  ( (tuple2!12549 (_1!6604 BitStream!5140) (_2!6604 BitStream!5140)) )
))
(declare-fun lt!219636 () tuple2!12548)

(assert (=> b!141570 (= res!118105 (or (not (= (size!2941 (_2!6603 lt!219634)) (size!2941 arr!237))) (not (= (_1!6603 lt!219634) (_2!6604 lt!219636)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5140 array!6495 (_ BitVec 32) (_ BitVec 32)) tuple2!12546)

(assert (=> b!141570 (= lt!219634 (readByteArrayLoopPure!0 (_1!6604 lt!219636) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!219638 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!141570 (validate_offset_bits!1 ((_ sign_extend 32) (size!2941 (buf!3362 (_2!6602 lt!219632)))) ((_ sign_extend 32) (currentByte!6222 (_2!6602 lt!219630))) ((_ sign_extend 32) (currentBit!6217 (_2!6602 lt!219630))) lt!219638)))

(declare-fun lt!219633 () Unit!8864)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5140 array!6495 (_ BitVec 64)) Unit!8864)

(assert (=> b!141570 (= lt!219633 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6602 lt!219630) (buf!3362 (_2!6602 lt!219632)) lt!219638))))

(declare-fun reader!0 (BitStream!5140 BitStream!5140) tuple2!12548)

(assert (=> b!141570 (= lt!219636 (reader!0 (_2!6602 lt!219630) (_2!6602 lt!219632)))))

(declare-fun b!141571 () Bool)

(declare-fun res!118100 () Bool)

(assert (=> b!141571 (=> (not res!118100) (not e!94320))))

(assert (=> b!141571 (= res!118100 (bvslt from!447 to!404))))

(declare-fun b!141572 () Bool)

(assert (=> b!141572 (= e!94312 (invariant!0 (currentBit!6217 thiss!1634) (currentByte!6222 thiss!1634) (size!2941 (buf!3362 (_2!6602 lt!219630)))))))

(declare-fun b!141573 () Bool)

(declare-fun res!118096 () Bool)

(assert (=> b!141573 (=> (not res!118096) (not e!94319))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!141573 (= res!118096 (= (bitIndex!0 (size!2941 (buf!3362 (_2!6602 lt!219630))) (currentByte!6222 (_2!6602 lt!219630)) (currentBit!6217 (_2!6602 lt!219630))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2941 (buf!3362 thiss!1634)) (currentByte!6222 thiss!1634) (currentBit!6217 thiss!1634)))))))

(declare-fun b!141574 () Bool)

(declare-fun e!94315 () Bool)

(declare-fun array_inv!2730 (array!6495) Bool)

(assert (=> b!141574 (= e!94315 (array_inv!2730 (buf!3362 thiss!1634)))))

(declare-fun lt!219637 () tuple2!12548)

(declare-datatypes ((tuple2!12550 0))(
  ( (tuple2!12551 (_1!6605 BitStream!5140) (_2!6605 (_ BitVec 8))) )
))
(declare-fun lt!219631 () tuple2!12550)

(declare-fun b!141568 () Bool)

(assert (=> b!141568 (= e!94319 (and (= (_2!6605 lt!219631) (select (arr!3648 arr!237) from!447)) (= (_1!6605 lt!219631) (_2!6604 lt!219637))))))

(declare-fun readBytePure!0 (BitStream!5140) tuple2!12550)

(assert (=> b!141568 (= lt!219631 (readBytePure!0 (_1!6604 lt!219637)))))

(assert (=> b!141568 (= lt!219637 (reader!0 thiss!1634 (_2!6602 lt!219630)))))

(declare-fun res!118095 () Bool)

(assert (=> start!27480 (=> (not res!118095) (not e!94320))))

(assert (=> start!27480 (= res!118095 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2941 arr!237))))))

(assert (=> start!27480 e!94320))

(assert (=> start!27480 true))

(assert (=> start!27480 (array_inv!2730 arr!237)))

(declare-fun inv!12 (BitStream!5140) Bool)

(assert (=> start!27480 (and (inv!12 thiss!1634) e!94315)))

(declare-fun b!141575 () Bool)

(declare-fun arrayRangesEq!257 (array!6495 array!6495 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!141575 (= e!94314 (not (arrayRangesEq!257 arr!237 (_2!6603 lt!219634) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!141576 () Bool)

(assert (=> b!141576 (= e!94317 e!94313)))

(declare-fun res!118098 () Bool)

(assert (=> b!141576 (=> (not res!118098) (not e!94313))))

(assert (=> b!141576 (= res!118098 (= (bitIndex!0 (size!2941 (buf!3362 (_2!6602 lt!219632))) (currentByte!6222 (_2!6602 lt!219632)) (currentBit!6217 (_2!6602 lt!219632))) (bvadd (bitIndex!0 (size!2941 (buf!3362 (_2!6602 lt!219630))) (currentByte!6222 (_2!6602 lt!219630)) (currentBit!6217 (_2!6602 lt!219630))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!219638))))))

(assert (=> b!141576 (= lt!219638 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!141577 () Bool)

(declare-fun res!118097 () Bool)

(assert (=> b!141577 (=> (not res!118097) (not e!94319))))

(assert (=> b!141577 (= res!118097 (isPrefixOf!0 thiss!1634 (_2!6602 lt!219630)))))

(declare-fun b!141578 () Bool)

(declare-fun res!118099 () Bool)

(assert (=> b!141578 (=> (not res!118099) (not e!94320))))

(assert (=> b!141578 (= res!118099 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2941 (buf!3362 thiss!1634))) ((_ sign_extend 32) (currentByte!6222 thiss!1634)) ((_ sign_extend 32) (currentBit!6217 thiss!1634)) (bvsub to!404 from!447)))))

(assert (= (and start!27480 res!118095) b!141578))

(assert (= (and b!141578 res!118099) b!141571))

(assert (= (and b!141571 res!118100) b!141569))

(assert (= (and b!141569 res!118104) b!141566))

(assert (= (and b!141566 res!118103) b!141573))

(assert (= (and b!141573 res!118096) b!141577))

(assert (= (and b!141577 res!118097) b!141568))

(assert (= (and b!141566 res!118094) b!141576))

(assert (= (and b!141576 res!118098) b!141567))

(assert (= (and b!141567 res!118102) b!141570))

(assert (= (and b!141570 (not res!118105)) b!141575))

(assert (= (and b!141566 res!118101) b!141572))

(assert (= start!27480 b!141574))

(declare-fun m!217481 () Bool)

(assert (=> b!141578 m!217481))

(declare-fun m!217483 () Bool)

(assert (=> b!141576 m!217483))

(declare-fun m!217485 () Bool)

(assert (=> b!141576 m!217485))

(declare-fun m!217487 () Bool)

(assert (=> b!141575 m!217487))

(declare-fun m!217489 () Bool)

(assert (=> b!141574 m!217489))

(declare-fun m!217491 () Bool)

(assert (=> b!141572 m!217491))

(declare-fun m!217493 () Bool)

(assert (=> b!141567 m!217493))

(declare-fun m!217495 () Bool)

(assert (=> b!141566 m!217495))

(declare-fun m!217497 () Bool)

(assert (=> b!141566 m!217497))

(declare-fun m!217499 () Bool)

(assert (=> b!141566 m!217499))

(declare-fun m!217501 () Bool)

(assert (=> b!141566 m!217501))

(declare-fun m!217503 () Bool)

(assert (=> b!141566 m!217503))

(declare-fun m!217505 () Bool)

(assert (=> b!141566 m!217505))

(declare-fun m!217507 () Bool)

(assert (=> b!141566 m!217507))

(assert (=> b!141566 m!217505))

(assert (=> b!141573 m!217485))

(declare-fun m!217509 () Bool)

(assert (=> b!141573 m!217509))

(declare-fun m!217511 () Bool)

(assert (=> b!141569 m!217511))

(declare-fun m!217513 () Bool)

(assert (=> b!141570 m!217513))

(declare-fun m!217515 () Bool)

(assert (=> b!141570 m!217515))

(declare-fun m!217517 () Bool)

(assert (=> b!141570 m!217517))

(declare-fun m!217519 () Bool)

(assert (=> b!141570 m!217519))

(declare-fun m!217521 () Bool)

(assert (=> start!27480 m!217521))

(declare-fun m!217523 () Bool)

(assert (=> start!27480 m!217523))

(assert (=> b!141568 m!217505))

(declare-fun m!217525 () Bool)

(assert (=> b!141568 m!217525))

(declare-fun m!217527 () Bool)

(assert (=> b!141568 m!217527))

(declare-fun m!217529 () Bool)

(assert (=> b!141577 m!217529))

(push 1)

(assert (not b!141575))

(assert (not b!141569))

(assert (not b!141572))

(assert (not start!27480))

(assert (not b!141573))

(assert (not b!141577))

(assert (not b!141567))

(assert (not b!141566))

(assert (not b!141570))

(assert (not b!141576))

(assert (not b!141574))

(assert (not b!141568))

(assert (not b!141578))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

