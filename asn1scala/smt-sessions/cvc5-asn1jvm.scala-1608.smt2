; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45664 () Bool)

(assert start!45664)

(declare-fun b!220745 () Bool)

(declare-fun res!185950 () Bool)

(declare-fun e!149908 () Bool)

(assert (=> b!220745 (=> (not res!185950) (not e!149908))))

(declare-datatypes ((array!10777 0))(
  ( (array!10778 (arr!5662 (Array (_ BitVec 32) (_ BitVec 8))) (size!4732 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8572 0))(
  ( (BitStream!8573 (buf!5279 array!10777) (currentByte!9915 (_ BitVec 32)) (currentBit!9910 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8572)

(declare-fun nBits!265 () (_ BitVec 32))

(declare-fun i!541 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220745 (= res!185950 (validate_offset_bits!1 ((_ sign_extend 32) (size!4732 (buf!5279 bs!62))) ((_ sign_extend 32) (currentByte!9915 bs!62)) ((_ sign_extend 32) (currentBit!9910 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun b!220746 () Bool)

(declare-fun res!185951 () Bool)

(assert (=> b!220746 (=> (not res!185951) (not e!149908))))

(declare-fun acc!113 () (_ BitVec 64))

(assert (=> b!220746 (= res!185951 (= (bvand acc!113 #b1111111111111111111111111111111111111111111111111111111111111111) acc!113))))

(declare-fun res!185948 () Bool)

(assert (=> start!45664 (=> (not res!185948) (not e!149908))))

(assert (=> start!45664 (= res!185948 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45664 e!149908))

(assert (=> start!45664 true))

(declare-fun e!149909 () Bool)

(declare-fun inv!12 (BitStream!8572) Bool)

(assert (=> start!45664 (and (inv!12 bs!62) e!149909)))

(declare-fun b!220747 () Bool)

(declare-fun array_inv!4473 (array!10777) Bool)

(assert (=> b!220747 (= e!149909 (array_inv!4473 (buf!5279 bs!62)))))

(declare-fun b!220748 () Bool)

(assert (=> b!220748 (= e!149908 (and (= (bvand i!541 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand i!541 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!541) #b10000000000000000000000000000000)))))))

(declare-fun lt!348608 () BitStream!8572)

(declare-fun withMovedBitIndex!0 (BitStream!8572 (_ BitVec 64)) BitStream!8572)

(assert (=> b!220748 (= lt!348608 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!18920 0))(
  ( (tuple2!18921 (_1!10118 BitStream!8572) (_2!10118 Bool)) )
))
(declare-fun lt!348607 () tuple2!18920)

(declare-fun readBitPure!0 (BitStream!8572) tuple2!18920)

(assert (=> b!220748 (= lt!348607 (readBitPure!0 bs!62))))

(declare-datatypes ((tuple2!18922 0))(
  ( (tuple2!18923 (_1!10119 BitStream!8572) (_2!10119 (_ BitVec 64))) )
))
(declare-fun lt!348606 () tuple2!18922)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8572 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18922)

(assert (=> b!220748 (= lt!348606 (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113))))

(declare-fun b!220749 () Bool)

(declare-fun res!185949 () Bool)

(assert (=> b!220749 (=> (not res!185949) (not e!149908))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220749 (= res!185949 (= (bvand acc!113 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!45664 res!185948) b!220745))

(assert (= (and b!220745 res!185950) b!220749))

(assert (= (and b!220749 res!185949) b!220746))

(assert (= (and b!220746 res!185951) b!220748))

(assert (= start!45664 b!220747))

(declare-fun m!339433 () Bool)

(assert (=> b!220748 m!339433))

(declare-fun m!339435 () Bool)

(assert (=> b!220748 m!339435))

(declare-fun m!339437 () Bool)

(assert (=> b!220748 m!339437))

(declare-fun m!339439 () Bool)

(assert (=> start!45664 m!339439))

(declare-fun m!339441 () Bool)

(assert (=> b!220745 m!339441))

(declare-fun m!339443 () Bool)

(assert (=> b!220749 m!339443))

(declare-fun m!339445 () Bool)

(assert (=> b!220747 m!339445))

(push 1)

(assert (not b!220745))

(assert (not b!220749))

(assert (not start!45664))

(assert (not b!220748))

(assert (not b!220747))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

