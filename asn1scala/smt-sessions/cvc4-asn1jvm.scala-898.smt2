; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25466 () Bool)

(assert start!25466)

(declare-fun b!128718 () Bool)

(declare-fun res!106546 () Bool)

(declare-fun e!85325 () Bool)

(assert (=> b!128718 (=> (not res!106546) (not e!85325))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!5951 0))(
  ( (array!5952 (arr!3308 (Array (_ BitVec 32) (_ BitVec 8))) (size!2691 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4646 0))(
  ( (BitStream!4647 (buf!3049 array!5951) (currentByte!5810 (_ BitVec 32)) (currentBit!5805 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4646)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!128718 (= res!106546 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2691 (buf!3049 thiss!1634))) ((_ sign_extend 32) (currentByte!5810 thiss!1634)) ((_ sign_extend 32) (currentBit!5805 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!128719 () Bool)

(declare-fun res!106548 () Bool)

(assert (=> b!128719 (=> (not res!106548) (not e!85325))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!128719 (= res!106548 (invariant!0 (currentBit!5805 thiss!1634) (currentByte!5810 thiss!1634) (size!2691 (buf!3049 thiss!1634))))))

(declare-fun res!106545 () Bool)

(assert (=> start!25466 (=> (not res!106545) (not e!85325))))

(declare-fun arr!237 () array!5951)

(assert (=> start!25466 (= res!106545 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2691 arr!237))))))

(assert (=> start!25466 e!85325))

(assert (=> start!25466 true))

(declare-fun array_inv!2480 (array!5951) Bool)

(assert (=> start!25466 (array_inv!2480 arr!237)))

(declare-fun e!85323 () Bool)

(declare-fun inv!12 (BitStream!4646) Bool)

(assert (=> start!25466 (and (inv!12 thiss!1634) e!85323)))

(declare-fun b!128720 () Bool)

(declare-fun res!106543 () Bool)

(declare-fun e!85328 () Bool)

(assert (=> b!128720 (=> (not res!106543) (not e!85328))))

(declare-datatypes ((Unit!7987 0))(
  ( (Unit!7988) )
))
(declare-datatypes ((tuple2!10912 0))(
  ( (tuple2!10913 (_1!5753 Unit!7987) (_2!5753 BitStream!4646)) )
))
(declare-fun lt!199553 () tuple2!10912)

(declare-fun isPrefixOf!0 (BitStream!4646 BitStream!4646) Bool)

(assert (=> b!128720 (= res!106543 (isPrefixOf!0 thiss!1634 (_2!5753 lt!199553)))))

(declare-fun b!128721 () Bool)

(declare-fun e!85324 () Bool)

(assert (=> b!128721 (= e!85325 (not e!85324))))

(declare-fun res!106547 () Bool)

(assert (=> b!128721 (=> res!106547 e!85324)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!128721 (= res!106547 (bvsgt #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2691 (buf!3049 (_2!5753 lt!199553))) (currentByte!5810 (_2!5753 lt!199553)) (currentBit!5805 (_2!5753 lt!199553)))))))

(assert (=> b!128721 e!85328))

(declare-fun res!106549 () Bool)

(assert (=> b!128721 (=> (not res!106549) (not e!85328))))

(assert (=> b!128721 (= res!106549 (= (size!2691 (buf!3049 thiss!1634)) (size!2691 (buf!3049 (_2!5753 lt!199553)))))))

(declare-fun appendByte!0 (BitStream!4646 (_ BitVec 8)) tuple2!10912)

(assert (=> b!128721 (= lt!199553 (appendByte!0 thiss!1634 (select (arr!3308 arr!237) from!447)))))

(declare-datatypes ((tuple2!10914 0))(
  ( (tuple2!10915 (_1!5754 BitStream!4646) (_2!5754 BitStream!4646)) )
))
(declare-fun lt!199554 () tuple2!10914)

(declare-datatypes ((tuple2!10916 0))(
  ( (tuple2!10917 (_1!5755 BitStream!4646) (_2!5755 (_ BitVec 8))) )
))
(declare-fun lt!199556 () tuple2!10916)

(declare-fun b!128722 () Bool)

(assert (=> b!128722 (= e!85328 (and (= (_2!5755 lt!199556) (select (arr!3308 arr!237) from!447)) (= (_1!5755 lt!199556) (_2!5754 lt!199554))))))

(declare-fun readBytePure!0 (BitStream!4646) tuple2!10916)

(assert (=> b!128722 (= lt!199556 (readBytePure!0 (_1!5754 lt!199554)))))

(declare-fun reader!0 (BitStream!4646 BitStream!4646) tuple2!10914)

(assert (=> b!128722 (= lt!199554 (reader!0 thiss!1634 (_2!5753 lt!199553)))))

(declare-fun b!128723 () Bool)

(declare-fun res!106544 () Bool)

(assert (=> b!128723 (=> (not res!106544) (not e!85328))))

(assert (=> b!128723 (= res!106544 (= (bitIndex!0 (size!2691 (buf!3049 (_2!5753 lt!199553))) (currentByte!5810 (_2!5753 lt!199553)) (currentBit!5805 (_2!5753 lt!199553))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2691 (buf!3049 thiss!1634)) (currentByte!5810 thiss!1634) (currentBit!5805 thiss!1634)))))))

(declare-fun b!128724 () Bool)

(assert (=> b!128724 (= e!85324 true)))

(declare-fun lt!199555 () (_ BitVec 64))

(assert (=> b!128724 (= lt!199555 (bitIndex!0 (size!2691 (buf!3049 thiss!1634)) (currentByte!5810 thiss!1634) (currentBit!5805 thiss!1634)))))

(declare-fun b!128725 () Bool)

(declare-fun res!106542 () Bool)

(assert (=> b!128725 (=> (not res!106542) (not e!85325))))

(assert (=> b!128725 (= res!106542 (bvslt from!447 to!404))))

(declare-fun b!128726 () Bool)

(assert (=> b!128726 (= e!85323 (array_inv!2480 (buf!3049 thiss!1634)))))

(assert (= (and start!25466 res!106545) b!128718))

(assert (= (and b!128718 res!106546) b!128725))

(assert (= (and b!128725 res!106542) b!128719))

(assert (= (and b!128719 res!106548) b!128721))

(assert (= (and b!128721 res!106549) b!128723))

(assert (= (and b!128723 res!106544) b!128720))

(assert (= (and b!128720 res!106543) b!128722))

(assert (= (and b!128721 (not res!106547)) b!128724))

(assert (= start!25466 b!128726))

(declare-fun m!194485 () Bool)

(assert (=> b!128722 m!194485))

(declare-fun m!194487 () Bool)

(assert (=> b!128722 m!194487))

(declare-fun m!194489 () Bool)

(assert (=> b!128722 m!194489))

(declare-fun m!194491 () Bool)

(assert (=> b!128721 m!194491))

(assert (=> b!128721 m!194485))

(assert (=> b!128721 m!194485))

(declare-fun m!194493 () Bool)

(assert (=> b!128721 m!194493))

(declare-fun m!194495 () Bool)

(assert (=> b!128720 m!194495))

(declare-fun m!194497 () Bool)

(assert (=> b!128724 m!194497))

(declare-fun m!194499 () Bool)

(assert (=> start!25466 m!194499))

(declare-fun m!194501 () Bool)

(assert (=> start!25466 m!194501))

(declare-fun m!194503 () Bool)

(assert (=> b!128718 m!194503))

(declare-fun m!194505 () Bool)

(assert (=> b!128719 m!194505))

(assert (=> b!128723 m!194491))

(assert (=> b!128723 m!194497))

(declare-fun m!194507 () Bool)

(assert (=> b!128726 m!194507))

(push 1)

