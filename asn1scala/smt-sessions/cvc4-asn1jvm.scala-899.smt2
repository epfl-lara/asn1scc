; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25472 () Bool)

(assert start!25472)

(declare-fun res!106616 () Bool)

(declare-fun e!85377 () Bool)

(assert (=> start!25472 (=> (not res!106616) (not e!85377))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!5957 0))(
  ( (array!5958 (arr!3311 (Array (_ BitVec 32) (_ BitVec 8))) (size!2694 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!5957)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!25472 (= res!106616 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2694 arr!237))))))

(assert (=> start!25472 e!85377))

(assert (=> start!25472 true))

(declare-fun array_inv!2483 (array!5957) Bool)

(assert (=> start!25472 (array_inv!2483 arr!237)))

(declare-datatypes ((BitStream!4652 0))(
  ( (BitStream!4653 (buf!3052 array!5957) (currentByte!5813 (_ BitVec 32)) (currentBit!5808 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4652)

(declare-fun e!85380 () Bool)

(declare-fun inv!12 (BitStream!4652) Bool)

(assert (=> start!25472 (and (inv!12 thiss!1634) e!85380)))

(declare-fun b!128799 () Bool)

(declare-fun res!106617 () Bool)

(assert (=> b!128799 (=> (not res!106617) (not e!85377))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!128799 (= res!106617 (invariant!0 (currentBit!5808 thiss!1634) (currentByte!5813 thiss!1634) (size!2694 (buf!3052 thiss!1634))))))

(declare-fun e!85379 () Bool)

(declare-datatypes ((tuple2!10930 0))(
  ( (tuple2!10931 (_1!5762 BitStream!4652) (_2!5762 BitStream!4652)) )
))
(declare-fun lt!199590 () tuple2!10930)

(declare-datatypes ((tuple2!10932 0))(
  ( (tuple2!10933 (_1!5763 BitStream!4652) (_2!5763 (_ BitVec 8))) )
))
(declare-fun lt!199589 () tuple2!10932)

(declare-fun b!128800 () Bool)

(assert (=> b!128800 (= e!85379 (and (= (_2!5763 lt!199589) (select (arr!3311 arr!237) from!447)) (= (_1!5763 lt!199589) (_2!5762 lt!199590))))))

(declare-fun readBytePure!0 (BitStream!4652) tuple2!10932)

(assert (=> b!128800 (= lt!199589 (readBytePure!0 (_1!5762 lt!199590)))))

(declare-datatypes ((Unit!7993 0))(
  ( (Unit!7994) )
))
(declare-datatypes ((tuple2!10934 0))(
  ( (tuple2!10935 (_1!5764 Unit!7993) (_2!5764 BitStream!4652)) )
))
(declare-fun lt!199592 () tuple2!10934)

(declare-fun reader!0 (BitStream!4652 BitStream!4652) tuple2!10930)

(assert (=> b!128800 (= lt!199590 (reader!0 thiss!1634 (_2!5764 lt!199592)))))

(declare-fun b!128801 () Bool)

(declare-fun res!106620 () Bool)

(assert (=> b!128801 (=> (not res!106620) (not e!85379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!128801 (= res!106620 (= (bitIndex!0 (size!2694 (buf!3052 (_2!5764 lt!199592))) (currentByte!5813 (_2!5764 lt!199592)) (currentBit!5808 (_2!5764 lt!199592))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2694 (buf!3052 thiss!1634)) (currentByte!5813 thiss!1634) (currentBit!5808 thiss!1634)))))))

(declare-fun b!128802 () Bool)

(declare-fun res!106615 () Bool)

(assert (=> b!128802 (=> (not res!106615) (not e!85377))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!128802 (= res!106615 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2694 (buf!3052 thiss!1634))) ((_ sign_extend 32) (currentByte!5813 thiss!1634)) ((_ sign_extend 32) (currentBit!5808 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!128803 () Bool)

(assert (=> b!128803 (= e!85380 (array_inv!2483 (buf!3052 thiss!1634)))))

(declare-fun b!128804 () Bool)

(declare-fun res!106618 () Bool)

(assert (=> b!128804 (=> (not res!106618) (not e!85377))))

(assert (=> b!128804 (= res!106618 (bvslt from!447 to!404))))

(declare-fun b!128805 () Bool)

(declare-fun e!85382 () Bool)

(assert (=> b!128805 (= e!85382 true)))

(declare-fun lt!199591 () (_ BitVec 64))

(assert (=> b!128805 (= lt!199591 (bitIndex!0 (size!2694 (buf!3052 thiss!1634)) (currentByte!5813 thiss!1634) (currentBit!5808 thiss!1634)))))

(declare-fun b!128806 () Bool)

(declare-fun res!106614 () Bool)

(assert (=> b!128806 (=> (not res!106614) (not e!85379))))

(declare-fun isPrefixOf!0 (BitStream!4652 BitStream!4652) Bool)

(assert (=> b!128806 (= res!106614 (isPrefixOf!0 thiss!1634 (_2!5764 lt!199592)))))

(declare-fun b!128807 () Bool)

(assert (=> b!128807 (= e!85377 (not e!85382))))

(declare-fun res!106619 () Bool)

(assert (=> b!128807 (=> res!106619 e!85382)))

(assert (=> b!128807 (= res!106619 (bvsgt #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2694 (buf!3052 (_2!5764 lt!199592))) (currentByte!5813 (_2!5764 lt!199592)) (currentBit!5808 (_2!5764 lt!199592)))))))

(assert (=> b!128807 e!85379))

(declare-fun res!106621 () Bool)

(assert (=> b!128807 (=> (not res!106621) (not e!85379))))

(assert (=> b!128807 (= res!106621 (= (size!2694 (buf!3052 thiss!1634)) (size!2694 (buf!3052 (_2!5764 lt!199592)))))))

(declare-fun appendByte!0 (BitStream!4652 (_ BitVec 8)) tuple2!10934)

(assert (=> b!128807 (= lt!199592 (appendByte!0 thiss!1634 (select (arr!3311 arr!237) from!447)))))

(assert (= (and start!25472 res!106616) b!128802))

(assert (= (and b!128802 res!106615) b!128804))

(assert (= (and b!128804 res!106618) b!128799))

(assert (= (and b!128799 res!106617) b!128807))

(assert (= (and b!128807 res!106621) b!128801))

(assert (= (and b!128801 res!106620) b!128806))

(assert (= (and b!128806 res!106614) b!128800))

(assert (= (and b!128807 (not res!106619)) b!128805))

(assert (= start!25472 b!128803))

(declare-fun m!194557 () Bool)

(assert (=> b!128802 m!194557))

(declare-fun m!194559 () Bool)

(assert (=> b!128807 m!194559))

(declare-fun m!194561 () Bool)

(assert (=> b!128807 m!194561))

(assert (=> b!128807 m!194561))

(declare-fun m!194563 () Bool)

(assert (=> b!128807 m!194563))

(declare-fun m!194565 () Bool)

(assert (=> b!128803 m!194565))

(declare-fun m!194567 () Bool)

(assert (=> b!128805 m!194567))

(assert (=> b!128800 m!194561))

(declare-fun m!194569 () Bool)

(assert (=> b!128800 m!194569))

(declare-fun m!194571 () Bool)

(assert (=> b!128800 m!194571))

(declare-fun m!194573 () Bool)

(assert (=> start!25472 m!194573))

(declare-fun m!194575 () Bool)

(assert (=> start!25472 m!194575))

(declare-fun m!194577 () Bool)

(assert (=> b!128799 m!194577))

(declare-fun m!194579 () Bool)

(assert (=> b!128806 m!194579))

(assert (=> b!128801 m!194559))

(assert (=> b!128801 m!194567))

(push 1)

(assert (not b!128807))

(assert (not b!128805))

(assert (not b!128799))

(assert (not b!128802))

(assert (not b!128803))

(assert (not b!128801))

(assert (not b!128800))

(assert (not start!25472))

(assert (not b!128806))

(check-sat)

(pop 1)

