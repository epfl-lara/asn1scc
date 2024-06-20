; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45680 () Bool)

(assert start!45680)

(declare-fun b!220899 () Bool)

(declare-fun res!186046 () Bool)

(declare-fun e!149997 () Bool)

(assert (=> b!220899 (=> (not res!186046) (not e!149997))))

(declare-datatypes ((array!10793 0))(
  ( (array!10794 (arr!5670 (Array (_ BitVec 32) (_ BitVec 8))) (size!4740 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8588 0))(
  ( (BitStream!8589 (buf!5287 array!10793) (currentByte!9923 (_ BitVec 32)) (currentBit!9918 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8588)

(declare-fun nBits!265 () (_ BitVec 32))

(declare-fun i!541 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220899 (= res!186046 (validate_offset_bits!1 ((_ sign_extend 32) (size!4740 (buf!5287 bs!62))) ((_ sign_extend 32) (currentByte!9923 bs!62)) ((_ sign_extend 32) (currentBit!9918 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun res!186045 () Bool)

(assert (=> start!45680 (=> (not res!186045) (not e!149997))))

(assert (=> start!45680 (= res!186045 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45680 e!149997))

(assert (=> start!45680 true))

(declare-fun e!150000 () Bool)

(declare-fun inv!12 (BitStream!8588) Bool)

(assert (=> start!45680 (and (inv!12 bs!62) e!150000)))

(declare-fun b!220900 () Bool)

(declare-fun e!149998 () (_ BitVec 64))

(assert (=> b!220900 (= e!149998 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!541)))))

(declare-fun b!220901 () Bool)

(declare-fun res!186047 () Bool)

(assert (=> b!220901 (=> (not res!186047) (not e!149997))))

(declare-fun acc!113 () (_ BitVec 64))

(assert (=> b!220901 (= res!186047 (= (bvand acc!113 #b1111111111111111111111111111111111111111111111111111111111111111) acc!113))))

(declare-fun b!220902 () Bool)

(declare-fun array_inv!4481 (array!10793) Bool)

(assert (=> b!220902 (= e!150000 (array_inv!4481 (buf!5287 bs!62)))))

(declare-fun b!220903 () Bool)

(declare-fun res!186044 () Bool)

(assert (=> b!220903 (=> (not res!186044) (not e!149997))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220903 (= res!186044 (= (bvand acc!113 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220904 () Bool)

(assert (=> b!220904 (= e!149998 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!220905 () Bool)

(assert (=> b!220905 (= e!149997 (bvslt (bvsub nBits!265 i!541) #b00000000000000000000000000000000))))

(declare-datatypes ((tuple2!18952 0))(
  ( (tuple2!18953 (_1!10134 BitStream!8588) (_2!10134 (_ BitVec 64))) )
))
(declare-fun lt!348661 () tuple2!18952)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8588 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18952)

(declare-fun withMovedBitIndex!0 (BitStream!8588 (_ BitVec 64)) BitStream!8588)

(assert (=> b!220905 (= lt!348661 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!265 (bvadd #b00000000000000000000000000000001 i!541) (bvor acc!113 e!149998)))))

(declare-fun c!10694 () Bool)

(declare-datatypes ((tuple2!18954 0))(
  ( (tuple2!18955 (_1!10135 BitStream!8588) (_2!10135 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!8588) tuple2!18954)

(assert (=> b!220905 (= c!10694 (_2!10135 (readBitPure!0 bs!62)))))

(declare-fun lt!348662 () tuple2!18952)

(assert (=> b!220905 (= lt!348662 (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113))))

(assert (= (and start!45680 res!186045) b!220899))

(assert (= (and b!220899 res!186046) b!220903))

(assert (= (and b!220903 res!186044) b!220901))

(assert (= (and b!220901 res!186047) b!220905))

(assert (= (and b!220905 c!10694) b!220900))

(assert (= (and b!220905 (not c!10694)) b!220904))

(assert (= start!45680 b!220902))

(declare-fun m!339555 () Bool)

(assert (=> b!220905 m!339555))

(assert (=> b!220905 m!339555))

(declare-fun m!339557 () Bool)

(assert (=> b!220905 m!339557))

(declare-fun m!339559 () Bool)

(assert (=> b!220905 m!339559))

(declare-fun m!339561 () Bool)

(assert (=> b!220905 m!339561))

(declare-fun m!339563 () Bool)

(assert (=> b!220903 m!339563))

(declare-fun m!339565 () Bool)

(assert (=> start!45680 m!339565))

(declare-fun m!339567 () Bool)

(assert (=> b!220899 m!339567))

(declare-fun m!339569 () Bool)

(assert (=> b!220902 m!339569))

(push 1)

(assert (not b!220903))

(assert (not start!45680))

(assert (not b!220899))

(assert (not b!220902))

(assert (not b!220905))

(check-sat)

(pop 1)

(push 1)

(check-sat)

