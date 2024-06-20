; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65184 () Bool)

(assert start!65184)

(declare-fun b!292438 () Bool)

(declare-fun res!241541 () Bool)

(declare-fun e!208603 () Bool)

(assert (=> b!292438 (=> (not res!241541) (not e!208603))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!292438 (= res!241541 (bvsge from!505 to!474))))

(declare-fun b!292437 () Bool)

(declare-fun res!241540 () Bool)

(assert (=> b!292437 (=> (not res!241540) (not e!208603))))

(declare-datatypes ((array!17389 0))(
  ( (array!17390 (arr!8555 (Array (_ BitVec 32) (_ BitVec 8))) (size!7529 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13068 0))(
  ( (BitStream!13069 (buf!7595 array!17389) (currentByte!14050 (_ BitVec 32)) (currentBit!14045 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13068)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292437 (= res!241540 (validate_offset_bits!1 ((_ sign_extend 32) (size!7529 (buf!7595 thiss!1728))) ((_ sign_extend 32) (currentByte!14050 thiss!1728)) ((_ sign_extend 32) (currentBit!14045 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!292439 () Bool)

(assert (=> b!292439 (= e!208603 (not true))))

(declare-fun lt!424747 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!292439 (= lt!424747 (bitIndex!0 (size!7529 (buf!7595 thiss!1728)) (currentByte!14050 thiss!1728) (currentBit!14045 thiss!1728)))))

(declare-fun arr!273 () array!17389)

(declare-fun arrayBitRangesEq!0 (array!17389 array!17389 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292439 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20347 0))(
  ( (Unit!20348) )
))
(declare-fun lt!424746 () Unit!20347)

(declare-fun lt!424748 () (_ BitVec 64))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17389 array!17389 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20347)

(assert (=> b!292439 (= lt!424746 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424748 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!292439 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424748)))

(assert (=> b!292439 (= lt!424748 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7529 arr!273))))))

(declare-fun lt!424749 () Unit!20347)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17389) Unit!20347)

(assert (=> b!292439 (= lt!424749 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun res!241539 () Bool)

(assert (=> start!65184 (=> (not res!241539) (not e!208603))))

(assert (=> start!65184 (= res!241539 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7529 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65184 e!208603))

(declare-fun e!208605 () Bool)

(declare-fun inv!12 (BitStream!13068) Bool)

(assert (=> start!65184 (and (inv!12 thiss!1728) e!208605)))

(assert (=> start!65184 true))

(declare-fun array_inv!7141 (array!17389) Bool)

(assert (=> start!65184 (array_inv!7141 arr!273)))

(declare-fun b!292440 () Bool)

(assert (=> b!292440 (= e!208605 (array_inv!7141 (buf!7595 thiss!1728)))))

(assert (= (and start!65184 res!241539) b!292437))

(assert (= (and b!292437 res!241540) b!292438))

(assert (= (and b!292438 res!241541) b!292439))

(assert (= start!65184 b!292440))

(declare-fun m!427951 () Bool)

(assert (=> b!292437 m!427951))

(declare-fun m!427953 () Bool)

(assert (=> b!292439 m!427953))

(declare-fun m!427955 () Bool)

(assert (=> b!292439 m!427955))

(declare-fun m!427957 () Bool)

(assert (=> b!292439 m!427957))

(declare-fun m!427959 () Bool)

(assert (=> b!292439 m!427959))

(declare-fun m!427961 () Bool)

(assert (=> b!292439 m!427961))

(declare-fun m!427963 () Bool)

(assert (=> start!65184 m!427963))

(declare-fun m!427965 () Bool)

(assert (=> start!65184 m!427965))

(declare-fun m!427967 () Bool)

(assert (=> b!292440 m!427967))

(check-sat (not b!292440) (not b!292439) (not start!65184) (not b!292437))
