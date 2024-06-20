; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45666 () Bool)

(assert start!45666)

(declare-fun b!220760 () Bool)

(declare-fun res!185963 () Bool)

(declare-fun e!149919 () Bool)

(assert (=> b!220760 (=> (not res!185963) (not e!149919))))

(declare-fun acc!113 () (_ BitVec 64))

(declare-fun i!541 () (_ BitVec 32))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220760 (= res!185963 (= (bvand acc!113 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220761 () Bool)

(declare-fun e!149917 () Bool)

(declare-datatypes ((array!10779 0))(
  ( (array!10780 (arr!5663 (Array (_ BitVec 32) (_ BitVec 8))) (size!4733 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8574 0))(
  ( (BitStream!8575 (buf!5280 array!10779) (currentByte!9916 (_ BitVec 32)) (currentBit!9911 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8574)

(declare-fun array_inv!4474 (array!10779) Bool)

(assert (=> b!220761 (= e!149917 (array_inv!4474 (buf!5280 bs!62)))))

(declare-fun b!220762 () Bool)

(declare-fun res!185962 () Bool)

(assert (=> b!220762 (=> (not res!185962) (not e!149919))))

(declare-fun nBits!265 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220762 (= res!185962 (validate_offset_bits!1 ((_ sign_extend 32) (size!4733 (buf!5280 bs!62))) ((_ sign_extend 32) (currentByte!9916 bs!62)) ((_ sign_extend 32) (currentBit!9911 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun b!220763 () Bool)

(declare-fun res!185961 () Bool)

(assert (=> b!220763 (=> (not res!185961) (not e!149919))))

(assert (=> b!220763 (= res!185961 (= (bvand acc!113 #b1111111111111111111111111111111111111111111111111111111111111111) acc!113))))

(declare-fun b!220764 () Bool)

(assert (=> b!220764 (= e!149919 (and (= (bvand i!541 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand i!541 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!541) #b10000000000000000000000000000000)))))))

(declare-fun lt!348615 () BitStream!8574)

(declare-fun withMovedBitIndex!0 (BitStream!8574 (_ BitVec 64)) BitStream!8574)

(assert (=> b!220764 (= lt!348615 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!18924 0))(
  ( (tuple2!18925 (_1!10120 BitStream!8574) (_2!10120 Bool)) )
))
(declare-fun lt!348617 () tuple2!18924)

(declare-fun readBitPure!0 (BitStream!8574) tuple2!18924)

(assert (=> b!220764 (= lt!348617 (readBitPure!0 bs!62))))

(declare-datatypes ((tuple2!18926 0))(
  ( (tuple2!18927 (_1!10121 BitStream!8574) (_2!10121 (_ BitVec 64))) )
))
(declare-fun lt!348616 () tuple2!18926)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8574 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18926)

(assert (=> b!220764 (= lt!348616 (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113))))

(declare-fun res!185960 () Bool)

(assert (=> start!45666 (=> (not res!185960) (not e!149919))))

(assert (=> start!45666 (= res!185960 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45666 e!149919))

(assert (=> start!45666 true))

(declare-fun inv!12 (BitStream!8574) Bool)

(assert (=> start!45666 (and (inv!12 bs!62) e!149917)))

(assert (= (and start!45666 res!185960) b!220762))

(assert (= (and b!220762 res!185962) b!220760))

(assert (= (and b!220760 res!185963) b!220763))

(assert (= (and b!220763 res!185961) b!220764))

(assert (= start!45666 b!220761))

(declare-fun m!339447 () Bool)

(assert (=> start!45666 m!339447))

(declare-fun m!339449 () Bool)

(assert (=> b!220761 m!339449))

(declare-fun m!339451 () Bool)

(assert (=> b!220760 m!339451))

(declare-fun m!339453 () Bool)

(assert (=> b!220762 m!339453))

(declare-fun m!339455 () Bool)

(assert (=> b!220764 m!339455))

(declare-fun m!339457 () Bool)

(assert (=> b!220764 m!339457))

(declare-fun m!339459 () Bool)

(assert (=> b!220764 m!339459))

(check-sat (not b!220762) (not b!220761) (not b!220760) (not b!220764) (not start!45666))
