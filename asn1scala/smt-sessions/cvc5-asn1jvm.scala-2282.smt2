; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57864 () Bool)

(assert start!57864)

(declare-fun res!221920 () Bool)

(declare-fun e!185556 () Bool)

(assert (=> start!57864 (=> (not res!221920) (not e!185556))))

(declare-datatypes ((array!14792 0))(
  ( (array!14793 (arr!7438 (Array (_ BitVec 32) (_ BitVec 8))) (size!6451 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11716 0))(
  ( (BitStream!11717 (buf!6919 array!14792) (currentByte!12804 (_ BitVec 32)) (currentBit!12799 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11716)

(declare-fun w2!580 () BitStream!11716)

(declare-fun isPrefixOf!0 (BitStream!11716 BitStream!11716) Bool)

(assert (=> start!57864 (= res!221920 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57864 e!185556))

(declare-fun e!185555 () Bool)

(declare-fun inv!12 (BitStream!11716) Bool)

(assert (=> start!57864 (and (inv!12 w1!584) e!185555)))

(declare-fun e!185559 () Bool)

(assert (=> start!57864 (and (inv!12 w2!580) e!185559)))

(declare-fun b!265572 () Bool)

(assert (=> b!265572 (= e!185556 (not (inv!12 (BitStream!11717 (buf!6919 w2!580) (currentByte!12804 w1!584) (currentBit!12799 w1!584)))))))

(declare-fun b!265573 () Bool)

(declare-fun array_inv!6175 (array!14792) Bool)

(assert (=> b!265573 (= e!185555 (array_inv!6175 (buf!6919 w1!584)))))

(declare-fun b!265574 () Bool)

(assert (=> b!265574 (= e!185559 (array_inv!6175 (buf!6919 w2!580)))))

(assert (= (and start!57864 res!221920) b!265572))

(assert (= start!57864 b!265573))

(assert (= start!57864 b!265574))

(declare-fun m!396317 () Bool)

(assert (=> start!57864 m!396317))

(declare-fun m!396319 () Bool)

(assert (=> start!57864 m!396319))

(declare-fun m!396321 () Bool)

(assert (=> start!57864 m!396321))

(declare-fun m!396323 () Bool)

(assert (=> b!265572 m!396323))

(declare-fun m!396325 () Bool)

(assert (=> b!265573 m!396325))

(declare-fun m!396327 () Bool)

(assert (=> b!265574 m!396327))

(push 1)

(assert (not b!265574))

(assert (not start!57864))

(assert (not b!265573))

(assert (not b!265572))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!89666 () Bool)

(assert (=> d!89666 (= (array_inv!6175 (buf!6919 w2!580)) (bvsge (size!6451 (buf!6919 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!265574 d!89666))

(declare-fun d!89670 () Bool)

(declare-fun res!221949 () Bool)

(declare-fun e!185605 () Bool)

(assert (=> d!89670 (=> (not res!221949) (not e!185605))))

(assert (=> d!89670 (= res!221949 (= (size!6451 (buf!6919 w1!584)) (size!6451 (buf!6919 w2!580))))))

(assert (=> d!89670 (= (isPrefixOf!0 w1!584 w2!580) e!185605)))

(declare-fun b!265614 () Bool)

(declare-fun res!221948 () Bool)

(assert (=> b!265614 (=> (not res!221948) (not e!185605))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!265614 (= res!221948 (bvsle (bitIndex!0 (size!6451 (buf!6919 w1!584)) (currentByte!12804 w1!584) (currentBit!12799 w1!584)) (bitIndex!0 (size!6451 (buf!6919 w2!580)) (currentByte!12804 w2!580) (currentBit!12799 w2!580))))))

(declare-fun b!265615 () Bool)

(declare-fun e!185604 () Bool)

(assert (=> b!265615 (= e!185605 e!185604)))

(declare-fun res!221950 () Bool)

(assert (=> b!265615 (=> res!221950 e!185604)))

(assert (=> b!265615 (= res!221950 (= (size!6451 (buf!6919 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!265616 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14792 array!14792 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!265616 (= e!185604 (arrayBitRangesEq!0 (buf!6919 w1!584) (buf!6919 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6451 (buf!6919 w1!584)) (currentByte!12804 w1!584) (currentBit!12799 w1!584))))))

(assert (= (and d!89670 res!221949) b!265614))

(assert (= (and b!265614 res!221948) b!265615))

(assert (= (and b!265615 (not res!221950)) b!265616))

(declare-fun m!396365 () Bool)

(assert (=> b!265614 m!396365))

(declare-fun m!396367 () Bool)

(assert (=> b!265614 m!396367))

(assert (=> b!265616 m!396365))

(assert (=> b!265616 m!396365))

(declare-fun m!396369 () Bool)

(assert (=> b!265616 m!396369))

(assert (=> start!57864 d!89670))

(declare-fun d!89682 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!89682 (= (inv!12 w1!584) (invariant!0 (currentBit!12799 w1!584) (currentByte!12804 w1!584) (size!6451 (buf!6919 w1!584))))))

(declare-fun bs!22758 () Bool)

(assert (= bs!22758 d!89682))

(declare-fun m!396371 () Bool)

(assert (=> bs!22758 m!396371))

(assert (=> start!57864 d!89682))

(declare-fun d!89686 () Bool)

(assert (=> d!89686 (= (inv!12 w2!580) (invariant!0 (currentBit!12799 w2!580) (currentByte!12804 w2!580) (size!6451 (buf!6919 w2!580))))))

(declare-fun bs!22759 () Bool)

(assert (= bs!22759 d!89686))

(declare-fun m!396377 () Bool)

(assert (=> bs!22759 m!396377))

(assert (=> start!57864 d!89686))

(declare-fun d!89688 () Bool)

(assert (=> d!89688 (= (array_inv!6175 (buf!6919 w1!584)) (bvsge (size!6451 (buf!6919 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!265573 d!89688))

(declare-fun d!89692 () Bool)

(assert (=> d!89692 (= (inv!12 (BitStream!11717 (buf!6919 w2!580) (currentByte!12804 w1!584) (currentBit!12799 w1!584))) (invariant!0 (currentBit!12799 (BitStream!11717 (buf!6919 w2!580) (currentByte!12804 w1!584) (currentBit!12799 w1!584))) (currentByte!12804 (BitStream!11717 (buf!6919 w2!580) (currentByte!12804 w1!584) (currentBit!12799 w1!584))) (size!6451 (buf!6919 (BitStream!11717 (buf!6919 w2!580) (currentByte!12804 w1!584) (currentBit!12799 w1!584))))))))

(declare-fun bs!22760 () Bool)

(assert (= bs!22760 d!89692))

(declare-fun m!396381 () Bool)

(assert (=> bs!22760 m!396381))

(assert (=> b!265572 d!89692))

