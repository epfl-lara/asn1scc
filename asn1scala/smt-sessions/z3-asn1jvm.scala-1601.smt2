; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45498 () Bool)

(assert start!45498)

(declare-fun b!220310 () Bool)

(declare-fun res!185585 () Bool)

(declare-fun e!149615 () Bool)

(assert (=> b!220310 (=> (not res!185585) (not e!149615))))

(declare-fun nBits!265 () (_ BitVec 32))

(declare-fun i!541 () (_ BitVec 32))

(declare-datatypes ((array!10737 0))(
  ( (array!10738 (arr!5645 (Array (_ BitVec 32) (_ BitVec 8))) (size!4715 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8538 0))(
  ( (BitStream!8539 (buf!5262 array!10737) (currentByte!9883 (_ BitVec 32)) (currentBit!9878 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8538)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220310 (= res!185585 (validate_offset_bits!1 ((_ sign_extend 32) (size!4715 (buf!5262 bs!62))) ((_ sign_extend 32) (currentByte!9883 bs!62)) ((_ sign_extend 32) (currentBit!9878 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun b!220311 () Bool)

(declare-fun res!185587 () Bool)

(assert (=> b!220311 (=> (not res!185587) (not e!149615))))

(declare-fun acc!113 () (_ BitVec 64))

(assert (=> b!220311 (= res!185587 (= (bvand acc!113 #b1111111111111111111111111111111111111111111111111111111111111111) acc!113))))

(declare-fun b!220312 () Bool)

(declare-fun e!149616 () Bool)

(declare-fun array_inv!4456 (array!10737) Bool)

(assert (=> b!220312 (= e!149616 (array_inv!4456 (buf!5262 bs!62)))))

(declare-fun b!220313 () Bool)

(declare-fun res!185586 () Bool)

(assert (=> b!220313 (=> (not res!185586) (not e!149615))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220313 (= res!185586 (= (bvand acc!113 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!185588 () Bool)

(assert (=> start!45498 (=> (not res!185588) (not e!149615))))

(assert (=> start!45498 (= res!185588 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45498 e!149615))

(assert (=> start!45498 true))

(declare-fun inv!12 (BitStream!8538) Bool)

(assert (=> start!45498 (and (inv!12 bs!62) e!149616)))

(declare-fun b!220314 () Bool)

(assert (=> b!220314 (= e!149615 (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!541)))))

(declare-fun lt!348139 () BitStream!8538)

(declare-fun withMovedBitIndex!0 (BitStream!8538 (_ BitVec 64)) BitStream!8538)

(assert (=> b!220314 (= lt!348139 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!18828 0))(
  ( (tuple2!18829 (_1!10072 BitStream!8538) (_2!10072 Bool)) )
))
(declare-fun lt!348140 () tuple2!18828)

(declare-fun readBitPure!0 (BitStream!8538) tuple2!18828)

(assert (=> b!220314 (= lt!348140 (readBitPure!0 bs!62))))

(declare-datatypes ((tuple2!18830 0))(
  ( (tuple2!18831 (_1!10073 BitStream!8538) (_2!10073 (_ BitVec 64))) )
))
(declare-fun lt!348138 () tuple2!18830)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8538 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18830)

(assert (=> b!220314 (= lt!348138 (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113))))

(assert (= (and start!45498 res!185588) b!220310))

(assert (= (and b!220310 res!185585) b!220313))

(assert (= (and b!220313 res!185586) b!220311))

(assert (= (and b!220311 res!185587) b!220314))

(assert (= start!45498 b!220312))

(declare-fun m!339009 () Bool)

(assert (=> b!220313 m!339009))

(declare-fun m!339011 () Bool)

(assert (=> b!220314 m!339011))

(declare-fun m!339013 () Bool)

(assert (=> b!220314 m!339013))

(declare-fun m!339015 () Bool)

(assert (=> b!220314 m!339015))

(declare-fun m!339017 () Bool)

(assert (=> b!220310 m!339017))

(declare-fun m!339019 () Bool)

(assert (=> start!45498 m!339019))

(declare-fun m!339021 () Bool)

(assert (=> b!220312 m!339021))

(check-sat (not b!220310) (not start!45498) (not b!220313) (not b!220314) (not b!220312))
(check-sat)
