; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45672 () Bool)

(assert start!45672)

(declare-fun b!220815 () Bool)

(declare-fun e!149952 () Bool)

(declare-fun nBits!265 () (_ BitVec 32))

(declare-fun i!541 () (_ BitVec 32))

(assert (=> b!220815 (= e!149952 (and (not (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand i!541 #b10000000000000000000000000000000))) (not (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand (bvsub nBits!265 i!541) #b10000000000000000000000000000000)))))))

(declare-fun e!149950 () (_ BitVec 64))

(declare-datatypes ((array!10785 0))(
  ( (array!10786 (arr!5666 (Array (_ BitVec 32) (_ BitVec 8))) (size!4736 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8580 0))(
  ( (BitStream!8581 (buf!5283 array!10785) (currentByte!9919 (_ BitVec 32)) (currentBit!9914 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!18936 0))(
  ( (tuple2!18937 (_1!10126 BitStream!8580) (_2!10126 (_ BitVec 64))) )
))
(declare-fun lt!348638 () tuple2!18936)

(declare-fun bs!62 () BitStream!8580)

(declare-fun acc!113 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8580 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18936)

(declare-fun withMovedBitIndex!0 (BitStream!8580 (_ BitVec 64)) BitStream!8580)

(assert (=> b!220815 (= lt!348638 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!265 (bvadd #b00000000000000000000000000000001 i!541) (bvor acc!113 e!149950)))))

(declare-fun c!10682 () Bool)

(declare-datatypes ((tuple2!18938 0))(
  ( (tuple2!18939 (_1!10127 BitStream!8580) (_2!10127 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!8580) tuple2!18938)

(assert (=> b!220815 (= c!10682 (_2!10127 (readBitPure!0 bs!62)))))

(declare-fun lt!348637 () tuple2!18936)

(assert (=> b!220815 (= lt!348637 (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113))))

(declare-fun b!220816 () Bool)

(declare-fun res!185996 () Bool)

(assert (=> b!220816 (=> (not res!185996) (not e!149952))))

(assert (=> b!220816 (= res!185996 (= (bvand acc!113 #b1111111111111111111111111111111111111111111111111111111111111111) acc!113))))

(declare-fun b!220817 () Bool)

(declare-fun res!185998 () Bool)

(assert (=> b!220817 (=> (not res!185998) (not e!149952))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220817 (= res!185998 (= (bvand acc!113 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!185999 () Bool)

(assert (=> start!45672 (=> (not res!185999) (not e!149952))))

(assert (=> start!45672 (= res!185999 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45672 e!149952))

(assert (=> start!45672 true))

(declare-fun e!149951 () Bool)

(declare-fun inv!12 (BitStream!8580) Bool)

(assert (=> start!45672 (and (inv!12 bs!62) e!149951)))

(declare-fun b!220818 () Bool)

(declare-fun array_inv!4477 (array!10785) Bool)

(assert (=> b!220818 (= e!149951 (array_inv!4477 (buf!5283 bs!62)))))

(declare-fun b!220819 () Bool)

(assert (=> b!220819 (= e!149950 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!220820 () Bool)

(assert (=> b!220820 (= e!149950 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!541)))))

(declare-fun b!220821 () Bool)

(declare-fun res!185997 () Bool)

(assert (=> b!220821 (=> (not res!185997) (not e!149952))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220821 (= res!185997 (validate_offset_bits!1 ((_ sign_extend 32) (size!4736 (buf!5283 bs!62))) ((_ sign_extend 32) (currentByte!9919 bs!62)) ((_ sign_extend 32) (currentBit!9914 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(assert (= (and start!45672 res!185999) b!220821))

(assert (= (and b!220821 res!185997) b!220817))

(assert (= (and b!220817 res!185998) b!220816))

(assert (= (and b!220816 res!185996) b!220815))

(assert (= (and b!220815 c!10682) b!220820))

(assert (= (and b!220815 (not c!10682)) b!220819))

(assert (= start!45672 b!220818))

(declare-fun m!339491 () Bool)

(assert (=> b!220821 m!339491))

(declare-fun m!339493 () Bool)

(assert (=> b!220817 m!339493))

(declare-fun m!339495 () Bool)

(assert (=> start!45672 m!339495))

(declare-fun m!339497 () Bool)

(assert (=> b!220818 m!339497))

(declare-fun m!339499 () Bool)

(assert (=> b!220815 m!339499))

(assert (=> b!220815 m!339499))

(declare-fun m!339501 () Bool)

(assert (=> b!220815 m!339501))

(declare-fun m!339503 () Bool)

(assert (=> b!220815 m!339503))

(declare-fun m!339505 () Bool)

(assert (=> b!220815 m!339505))

(check-sat (not b!220821) (not b!220815) (not start!45672) (not b!220817) (not b!220818))
