; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25454 () Bool)

(assert start!25454)

(declare-fun res!106399 () Bool)

(declare-fun e!85217 () Bool)

(assert (=> start!25454 (=> (not res!106399) (not e!85217))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!5939 0))(
  ( (array!5940 (arr!3302 (Array (_ BitVec 32) (_ BitVec 8))) (size!2685 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!5939)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!25454 (= res!106399 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2685 arr!237))))))

(assert (=> start!25454 e!85217))

(assert (=> start!25454 true))

(declare-fun array_inv!2474 (array!5939) Bool)

(assert (=> start!25454 (array_inv!2474 arr!237)))

(declare-datatypes ((BitStream!4634 0))(
  ( (BitStream!4635 (buf!3043 array!5939) (currentByte!5804 (_ BitVec 32)) (currentBit!5799 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4634)

(declare-fun e!85215 () Bool)

(declare-fun inv!12 (BitStream!4634) Bool)

(assert (=> start!25454 (and (inv!12 thiss!1634) e!85215)))

(declare-fun b!128556 () Bool)

(declare-fun e!85220 () Bool)

(assert (=> b!128556 (= e!85220 true)))

(declare-fun lt!199484 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!128556 (= lt!199484 (bitIndex!0 (size!2685 (buf!3043 thiss!1634)) (currentByte!5804 thiss!1634) (currentBit!5799 thiss!1634)))))

(declare-fun b!128557 () Bool)

(declare-fun res!106400 () Bool)

(assert (=> b!128557 (=> (not res!106400) (not e!85217))))

(assert (=> b!128557 (= res!106400 (bvslt from!447 to!404))))

(declare-datatypes ((tuple2!10876 0))(
  ( (tuple2!10877 (_1!5735 BitStream!4634) (_2!5735 (_ BitVec 8))) )
))
(declare-fun lt!199483 () tuple2!10876)

(declare-fun e!85216 () Bool)

(declare-fun b!128558 () Bool)

(declare-datatypes ((tuple2!10878 0))(
  ( (tuple2!10879 (_1!5736 BitStream!4634) (_2!5736 BitStream!4634)) )
))
(declare-fun lt!199481 () tuple2!10878)

(assert (=> b!128558 (= e!85216 (and (= (_2!5735 lt!199483) (select (arr!3302 arr!237) from!447)) (= (_1!5735 lt!199483) (_2!5736 lt!199481))))))

(declare-fun readBytePure!0 (BitStream!4634) tuple2!10876)

(assert (=> b!128558 (= lt!199483 (readBytePure!0 (_1!5736 lt!199481)))))

(declare-datatypes ((Unit!7975 0))(
  ( (Unit!7976) )
))
(declare-datatypes ((tuple2!10880 0))(
  ( (tuple2!10881 (_1!5737 Unit!7975) (_2!5737 BitStream!4634)) )
))
(declare-fun lt!199482 () tuple2!10880)

(declare-fun reader!0 (BitStream!4634 BitStream!4634) tuple2!10878)

(assert (=> b!128558 (= lt!199481 (reader!0 thiss!1634 (_2!5737 lt!199482)))))

(declare-fun b!128559 () Bool)

(assert (=> b!128559 (= e!85215 (array_inv!2474 (buf!3043 thiss!1634)))))

(declare-fun b!128560 () Bool)

(declare-fun res!106402 () Bool)

(assert (=> b!128560 (=> (not res!106402) (not e!85217))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!128560 (= res!106402 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2685 (buf!3043 thiss!1634))) ((_ sign_extend 32) (currentByte!5804 thiss!1634)) ((_ sign_extend 32) (currentBit!5799 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!128561 () Bool)

(declare-fun res!106401 () Bool)

(assert (=> b!128561 (=> (not res!106401) (not e!85216))))

(assert (=> b!128561 (= res!106401 (= (bitIndex!0 (size!2685 (buf!3043 (_2!5737 lt!199482))) (currentByte!5804 (_2!5737 lt!199482)) (currentBit!5799 (_2!5737 lt!199482))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2685 (buf!3043 thiss!1634)) (currentByte!5804 thiss!1634) (currentBit!5799 thiss!1634)))))))

(declare-fun b!128562 () Bool)

(assert (=> b!128562 (= e!85217 (not e!85220))))

(declare-fun res!106404 () Bool)

(assert (=> b!128562 (=> res!106404 e!85220)))

(assert (=> b!128562 (= res!106404 (bvsgt #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2685 (buf!3043 (_2!5737 lt!199482))) (currentByte!5804 (_2!5737 lt!199482)) (currentBit!5799 (_2!5737 lt!199482)))))))

(assert (=> b!128562 e!85216))

(declare-fun res!106398 () Bool)

(assert (=> b!128562 (=> (not res!106398) (not e!85216))))

(assert (=> b!128562 (= res!106398 (= (size!2685 (buf!3043 thiss!1634)) (size!2685 (buf!3043 (_2!5737 lt!199482)))))))

(declare-fun appendByte!0 (BitStream!4634 (_ BitVec 8)) tuple2!10880)

(assert (=> b!128562 (= lt!199482 (appendByte!0 thiss!1634 (select (arr!3302 arr!237) from!447)))))

(declare-fun b!128563 () Bool)

(declare-fun res!106405 () Bool)

(assert (=> b!128563 (=> (not res!106405) (not e!85216))))

(declare-fun isPrefixOf!0 (BitStream!4634 BitStream!4634) Bool)

(assert (=> b!128563 (= res!106405 (isPrefixOf!0 thiss!1634 (_2!5737 lt!199482)))))

(declare-fun b!128564 () Bool)

(declare-fun res!106403 () Bool)

(assert (=> b!128564 (=> (not res!106403) (not e!85217))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!128564 (= res!106403 (invariant!0 (currentBit!5799 thiss!1634) (currentByte!5804 thiss!1634) (size!2685 (buf!3043 thiss!1634))))))

(assert (= (and start!25454 res!106399) b!128560))

(assert (= (and b!128560 res!106402) b!128557))

(assert (= (and b!128557 res!106400) b!128564))

(assert (= (and b!128564 res!106403) b!128562))

(assert (= (and b!128562 res!106398) b!128561))

(assert (= (and b!128561 res!106401) b!128563))

(assert (= (and b!128563 res!106405) b!128558))

(assert (= (and b!128562 (not res!106404)) b!128556))

(assert (= start!25454 b!128559))

(declare-fun m!194341 () Bool)

(assert (=> b!128561 m!194341))

(declare-fun m!194343 () Bool)

(assert (=> b!128561 m!194343))

(declare-fun m!194345 () Bool)

(assert (=> b!128558 m!194345))

(declare-fun m!194347 () Bool)

(assert (=> b!128558 m!194347))

(declare-fun m!194349 () Bool)

(assert (=> b!128558 m!194349))

(declare-fun m!194351 () Bool)

(assert (=> b!128560 m!194351))

(declare-fun m!194353 () Bool)

(assert (=> start!25454 m!194353))

(declare-fun m!194355 () Bool)

(assert (=> start!25454 m!194355))

(declare-fun m!194357 () Bool)

(assert (=> b!128559 m!194357))

(declare-fun m!194359 () Bool)

(assert (=> b!128564 m!194359))

(assert (=> b!128562 m!194341))

(assert (=> b!128562 m!194345))

(assert (=> b!128562 m!194345))

(declare-fun m!194361 () Bool)

(assert (=> b!128562 m!194361))

(assert (=> b!128556 m!194343))

(declare-fun m!194363 () Bool)

(assert (=> b!128563 m!194363))

(push 1)

(assert (not b!128558))

(assert (not b!128564))

(assert (not start!25454))

(assert (not b!128560))

(assert (not b!128561))

(assert (not b!128563))

(assert (not b!128559))

(assert (not b!128556))

(assert (not b!128562))

(check-sat)

