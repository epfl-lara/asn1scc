; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57868 () Bool)

(assert start!57868)

(declare-fun res!221926 () Bool)

(declare-fun e!185587 () Bool)

(assert (=> start!57868 (=> (not res!221926) (not e!185587))))

(declare-datatypes ((array!14796 0))(
  ( (array!14797 (arr!7440 (Array (_ BitVec 32) (_ BitVec 8))) (size!6453 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11720 0))(
  ( (BitStream!11721 (buf!6921 array!14796) (currentByte!12806 (_ BitVec 32)) (currentBit!12801 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11720)

(declare-fun w2!580 () BitStream!11720)

(declare-fun isPrefixOf!0 (BitStream!11720 BitStream!11720) Bool)

(assert (=> start!57868 (= res!221926 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57868 e!185587))

(declare-fun e!185585 () Bool)

(declare-fun inv!12 (BitStream!11720) Bool)

(assert (=> start!57868 (and (inv!12 w1!584) e!185585)))

(declare-fun e!185588 () Bool)

(assert (=> start!57868 (and (inv!12 w2!580) e!185588)))

(declare-fun b!265590 () Bool)

(assert (=> b!265590 (= e!185587 (not (inv!12 (BitStream!11721 (buf!6921 w2!580) (currentByte!12806 w1!584) (currentBit!12801 w1!584)))))))

(declare-fun b!265591 () Bool)

(declare-fun array_inv!6177 (array!14796) Bool)

(assert (=> b!265591 (= e!185585 (array_inv!6177 (buf!6921 w1!584)))))

(declare-fun b!265592 () Bool)

(assert (=> b!265592 (= e!185588 (array_inv!6177 (buf!6921 w2!580)))))

(assert (= (and start!57868 res!221926) b!265590))

(assert (= start!57868 b!265591))

(assert (= start!57868 b!265592))

(declare-fun m!396341 () Bool)

(assert (=> start!57868 m!396341))

(declare-fun m!396343 () Bool)

(assert (=> start!57868 m!396343))

(declare-fun m!396345 () Bool)

(assert (=> start!57868 m!396345))

(declare-fun m!396347 () Bool)

(assert (=> b!265590 m!396347))

(declare-fun m!396349 () Bool)

(assert (=> b!265591 m!396349))

(declare-fun m!396351 () Bool)

(assert (=> b!265592 m!396351))

(push 1)

(assert (not b!265591))

(assert (not b!265592))

(assert (not start!57868))

(assert (not b!265590))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!89664 () Bool)

(assert (=> d!89664 (= (array_inv!6177 (buf!6921 w1!584)) (bvsge (size!6453 (buf!6921 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!265591 d!89664))

(declare-fun d!89672 () Bool)

(assert (=> d!89672 (= (array_inv!6177 (buf!6921 w2!580)) (bvsge (size!6453 (buf!6921 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!265592 d!89672))

(declare-fun d!89674 () Bool)

(declare-fun res!221953 () Bool)

(declare-fun e!185606 () Bool)

(assert (=> d!89674 (=> (not res!221953) (not e!185606))))

(assert (=> d!89674 (= res!221953 (= (size!6453 (buf!6921 w1!584)) (size!6453 (buf!6921 w2!580))))))

(assert (=> d!89674 (= (isPrefixOf!0 w1!584 w2!580) e!185606)))

(declare-fun b!265617 () Bool)

(declare-fun res!221952 () Bool)

(assert (=> b!265617 (=> (not res!221952) (not e!185606))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!265617 (= res!221952 (bvsle (bitIndex!0 (size!6453 (buf!6921 w1!584)) (currentByte!12806 w1!584) (currentBit!12801 w1!584)) (bitIndex!0 (size!6453 (buf!6921 w2!580)) (currentByte!12806 w2!580) (currentBit!12801 w2!580))))))

(declare-fun b!265618 () Bool)

(declare-fun e!185607 () Bool)

(assert (=> b!265618 (= e!185606 e!185607)))

(declare-fun res!221951 () Bool)

(assert (=> b!265618 (=> res!221951 e!185607)))

(assert (=> b!265618 (= res!221951 (= (size!6453 (buf!6921 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!265619 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14796 array!14796 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!265619 (= e!185607 (arrayBitRangesEq!0 (buf!6921 w1!584) (buf!6921 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6453 (buf!6921 w1!584)) (currentByte!12806 w1!584) (currentBit!12801 w1!584))))))

