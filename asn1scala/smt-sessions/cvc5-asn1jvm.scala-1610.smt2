; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45676 () Bool)

(assert start!45676)

(declare-fun b!220857 () Bool)

(declare-fun res!186022 () Bool)

(declare-fun e!149975 () Bool)

(assert (=> b!220857 (=> (not res!186022) (not e!149975))))

(declare-fun acc!113 () (_ BitVec 64))

(assert (=> b!220857 (= res!186022 (= (bvand acc!113 #b1111111111111111111111111111111111111111111111111111111111111111) acc!113))))

(declare-fun res!186023 () Bool)

(assert (=> start!45676 (=> (not res!186023) (not e!149975))))

(declare-fun i!541 () (_ BitVec 32))

(declare-fun nBits!265 () (_ BitVec 32))

(assert (=> start!45676 (= res!186023 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45676 e!149975))

(assert (=> start!45676 true))

(declare-datatypes ((array!10789 0))(
  ( (array!10790 (arr!5668 (Array (_ BitVec 32) (_ BitVec 8))) (size!4738 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8584 0))(
  ( (BitStream!8585 (buf!5285 array!10789) (currentByte!9921 (_ BitVec 32)) (currentBit!9916 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8584)

(declare-fun e!149973 () Bool)

(declare-fun inv!12 (BitStream!8584) Bool)

(assert (=> start!45676 (and (inv!12 bs!62) e!149973)))

(declare-fun b!220858 () Bool)

(declare-fun array_inv!4479 (array!10789) Bool)

(assert (=> b!220858 (= e!149973 (array_inv!4479 (buf!5285 bs!62)))))

(declare-fun b!220859 () Bool)

(declare-fun e!149976 () (_ BitVec 64))

(assert (=> b!220859 (= e!149976 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!541)))))

(declare-fun b!220860 () Bool)

(declare-fun res!186020 () Bool)

(assert (=> b!220860 (=> (not res!186020) (not e!149975))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220860 (= res!186020 (= (bvand acc!113 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220861 () Bool)

(assert (=> b!220861 (= e!149976 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!220862 () Bool)

(declare-fun res!186021 () Bool)

(assert (=> b!220862 (=> (not res!186021) (not e!149975))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220862 (= res!186021 (validate_offset_bits!1 ((_ sign_extend 32) (size!4738 (buf!5285 bs!62))) ((_ sign_extend 32) (currentByte!9921 bs!62)) ((_ sign_extend 32) (currentBit!9916 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun b!220863 () Bool)

(assert (=> b!220863 (= e!149975 (bvslt (bvsub nBits!265 i!541) #b00000000000000000000000000000000))))

(declare-datatypes ((tuple2!18944 0))(
  ( (tuple2!18945 (_1!10130 BitStream!8584) (_2!10130 (_ BitVec 64))) )
))
(declare-fun lt!348650 () tuple2!18944)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8584 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18944)

(declare-fun withMovedBitIndex!0 (BitStream!8584 (_ BitVec 64)) BitStream!8584)

(assert (=> b!220863 (= lt!348650 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!265 (bvadd #b00000000000000000000000000000001 i!541) (bvor acc!113 e!149976)))))

(declare-fun c!10688 () Bool)

(declare-datatypes ((tuple2!18946 0))(
  ( (tuple2!18947 (_1!10131 BitStream!8584) (_2!10131 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!8584) tuple2!18946)

(assert (=> b!220863 (= c!10688 (_2!10131 (readBitPure!0 bs!62)))))

(declare-fun lt!348649 () tuple2!18944)

(assert (=> b!220863 (= lt!348649 (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113))))

(assert (= (and start!45676 res!186023) b!220862))

(assert (= (and b!220862 res!186021) b!220860))

(assert (= (and b!220860 res!186020) b!220857))

(assert (= (and b!220857 res!186022) b!220863))

(assert (= (and b!220863 c!10688) b!220859))

(assert (= (and b!220863 (not c!10688)) b!220861))

(assert (= start!45676 b!220858))

(declare-fun m!339523 () Bool)

(assert (=> b!220860 m!339523))

(declare-fun m!339525 () Bool)

(assert (=> b!220863 m!339525))

(assert (=> b!220863 m!339525))

(declare-fun m!339527 () Bool)

(assert (=> b!220863 m!339527))

(declare-fun m!339529 () Bool)

(assert (=> b!220863 m!339529))

(declare-fun m!339531 () Bool)

(assert (=> b!220863 m!339531))

(declare-fun m!339533 () Bool)

(assert (=> b!220862 m!339533))

(declare-fun m!339535 () Bool)

(assert (=> start!45676 m!339535))

(declare-fun m!339537 () Bool)

(assert (=> b!220858 m!339537))

(push 1)

(assert (not b!220860))

(assert (not b!220858))

(assert (not b!220862))

(assert (not start!45676))

(assert (not b!220863))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

