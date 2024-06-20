; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57866 () Bool)

(assert start!57866)

(declare-fun res!221923 () Bool)

(declare-fun e!185574 () Bool)

(assert (=> start!57866 (=> (not res!221923) (not e!185574))))

(declare-datatypes ((array!14794 0))(
  ( (array!14795 (arr!7439 (Array (_ BitVec 32) (_ BitVec 8))) (size!6452 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11718 0))(
  ( (BitStream!11719 (buf!6920 array!14794) (currentByte!12805 (_ BitVec 32)) (currentBit!12800 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11718)

(declare-fun w2!580 () BitStream!11718)

(declare-fun isPrefixOf!0 (BitStream!11718 BitStream!11718) Bool)

(assert (=> start!57866 (= res!221923 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57866 e!185574))

(declare-fun e!185572 () Bool)

(declare-fun inv!12 (BitStream!11718) Bool)

(assert (=> start!57866 (and (inv!12 w1!584) e!185572)))

(declare-fun e!185573 () Bool)

(assert (=> start!57866 (and (inv!12 w2!580) e!185573)))

(declare-fun b!265581 () Bool)

(assert (=> b!265581 (= e!185574 (not (inv!12 (BitStream!11719 (buf!6920 w2!580) (currentByte!12805 w1!584) (currentBit!12800 w1!584)))))))

(declare-fun b!265582 () Bool)

(declare-fun array_inv!6176 (array!14794) Bool)

(assert (=> b!265582 (= e!185572 (array_inv!6176 (buf!6920 w1!584)))))

(declare-fun b!265583 () Bool)

(assert (=> b!265583 (= e!185573 (array_inv!6176 (buf!6920 w2!580)))))

(assert (= (and start!57866 res!221923) b!265581))

(assert (= start!57866 b!265582))

(assert (= start!57866 b!265583))

(declare-fun m!396329 () Bool)

(assert (=> start!57866 m!396329))

(declare-fun m!396331 () Bool)

(assert (=> start!57866 m!396331))

(declare-fun m!396333 () Bool)

(assert (=> start!57866 m!396333))

(declare-fun m!396335 () Bool)

(assert (=> b!265581 m!396335))

(declare-fun m!396337 () Bool)

(assert (=> b!265582 m!396337))

(declare-fun m!396339 () Bool)

(assert (=> b!265583 m!396339))

(check-sat (not b!265581) (not start!57866) (not b!265582) (not b!265583))
(check-sat)
(get-model)

(declare-fun d!89662 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!89662 (= (inv!12 (BitStream!11719 (buf!6920 w2!580) (currentByte!12805 w1!584) (currentBit!12800 w1!584))) (invariant!0 (currentBit!12800 (BitStream!11719 (buf!6920 w2!580) (currentByte!12805 w1!584) (currentBit!12800 w1!584))) (currentByte!12805 (BitStream!11719 (buf!6920 w2!580) (currentByte!12805 w1!584) (currentBit!12800 w1!584))) (size!6452 (buf!6920 (BitStream!11719 (buf!6920 w2!580) (currentByte!12805 w1!584) (currentBit!12800 w1!584))))))))

(declare-fun bs!22755 () Bool)

(assert (= bs!22755 d!89662))

(declare-fun m!396353 () Bool)

(assert (=> bs!22755 m!396353))

(assert (=> b!265581 d!89662))

(declare-fun d!89668 () Bool)

(declare-fun res!221945 () Bool)

(declare-fun e!185603 () Bool)

(assert (=> d!89668 (=> (not res!221945) (not e!185603))))

(assert (=> d!89668 (= res!221945 (= (size!6452 (buf!6920 w1!584)) (size!6452 (buf!6920 w2!580))))))

(assert (=> d!89668 (= (isPrefixOf!0 w1!584 w2!580) e!185603)))

(declare-fun b!265611 () Bool)

(declare-fun res!221946 () Bool)

(assert (=> b!265611 (=> (not res!221946) (not e!185603))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!265611 (= res!221946 (bvsle (bitIndex!0 (size!6452 (buf!6920 w1!584)) (currentByte!12805 w1!584) (currentBit!12800 w1!584)) (bitIndex!0 (size!6452 (buf!6920 w2!580)) (currentByte!12805 w2!580) (currentBit!12800 w2!580))))))

(declare-fun b!265612 () Bool)

(declare-fun e!185602 () Bool)

(assert (=> b!265612 (= e!185603 e!185602)))

(declare-fun res!221947 () Bool)

(assert (=> b!265612 (=> res!221947 e!185602)))

(assert (=> b!265612 (= res!221947 (= (size!6452 (buf!6920 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!265613 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14794 array!14794 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!265613 (= e!185602 (arrayBitRangesEq!0 (buf!6920 w1!584) (buf!6920 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6452 (buf!6920 w1!584)) (currentByte!12805 w1!584) (currentBit!12800 w1!584))))))

(assert (= (and d!89668 res!221945) b!265611))

(assert (= (and b!265611 res!221946) b!265612))

(assert (= (and b!265612 (not res!221947)) b!265613))

(declare-fun m!396355 () Bool)

(assert (=> b!265611 m!396355))

(declare-fun m!396357 () Bool)

(assert (=> b!265611 m!396357))

(assert (=> b!265613 m!396355))

(assert (=> b!265613 m!396355))

(declare-fun m!396359 () Bool)

(assert (=> b!265613 m!396359))

(assert (=> start!57866 d!89668))

(declare-fun d!89676 () Bool)

(assert (=> d!89676 (= (inv!12 w1!584) (invariant!0 (currentBit!12800 w1!584) (currentByte!12805 w1!584) (size!6452 (buf!6920 w1!584))))))

(declare-fun bs!22756 () Bool)

(assert (= bs!22756 d!89676))

(declare-fun m!396361 () Bool)

(assert (=> bs!22756 m!396361))

(assert (=> start!57866 d!89676))

(declare-fun d!89678 () Bool)

(assert (=> d!89678 (= (inv!12 w2!580) (invariant!0 (currentBit!12800 w2!580) (currentByte!12805 w2!580) (size!6452 (buf!6920 w2!580))))))

(declare-fun bs!22757 () Bool)

(assert (= bs!22757 d!89678))

(declare-fun m!396363 () Bool)

(assert (=> bs!22757 m!396363))

(assert (=> start!57866 d!89678))

(declare-fun d!89680 () Bool)

(assert (=> d!89680 (= (array_inv!6176 (buf!6920 w1!584)) (bvsge (size!6452 (buf!6920 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!265582 d!89680))

(declare-fun d!89684 () Bool)

(assert (=> d!89684 (= (array_inv!6176 (buf!6920 w2!580)) (bvsge (size!6452 (buf!6920 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!265583 d!89684))

(check-sat (not d!89676) (not d!89678) (not b!265611) (not d!89662) (not b!265613))
(check-sat)
