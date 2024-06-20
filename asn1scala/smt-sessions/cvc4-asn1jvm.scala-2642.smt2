; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65174 () Bool)

(assert start!65174)

(declare-fun b!292377 () Bool)

(declare-fun res!241495 () Bool)

(declare-fun e!208544 () Bool)

(assert (=> b!292377 (=> (not res!241495) (not e!208544))))

(declare-datatypes ((array!17379 0))(
  ( (array!17380 (arr!8550 (Array (_ BitVec 32) (_ BitVec 8))) (size!7524 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13058 0))(
  ( (BitStream!13059 (buf!7590 array!17379) (currentByte!14045 (_ BitVec 32)) (currentBit!14040 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13058)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292377 (= res!241495 (validate_offset_bits!1 ((_ sign_extend 32) (size!7524 (buf!7590 thiss!1728))) ((_ sign_extend 32) (currentByte!14045 thiss!1728)) ((_ sign_extend 32) (currentBit!14040 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!292379 () Bool)

(assert (=> b!292379 (= e!208544 (not true))))

(declare-fun lt!424689 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!292379 (= lt!424689 (bitIndex!0 (size!7524 (buf!7590 thiss!1728)) (currentByte!14045 thiss!1728) (currentBit!14040 thiss!1728)))))

(declare-fun arr!273 () array!17379)

(declare-fun arrayBitRangesEq!0 (array!17379 array!17379 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292379 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!424688 () (_ BitVec 64))

(declare-datatypes ((Unit!20337 0))(
  ( (Unit!20338) )
))
(declare-fun lt!424686 () Unit!20337)

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17379 array!17379 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20337)

(assert (=> b!292379 (= lt!424686 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424688 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!292379 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424688)))

(assert (=> b!292379 (= lt!424688 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7524 arr!273))))))

(declare-fun lt!424687 () Unit!20337)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17379) Unit!20337)

(assert (=> b!292379 (= lt!424687 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun res!241496 () Bool)

(assert (=> start!65174 (=> (not res!241496) (not e!208544))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> start!65174 (= res!241496 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7524 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65174 e!208544))

(declare-fun e!208542 () Bool)

(declare-fun inv!12 (BitStream!13058) Bool)

(assert (=> start!65174 (and (inv!12 thiss!1728) e!208542)))

(assert (=> start!65174 true))

(declare-fun array_inv!7136 (array!17379) Bool)

(assert (=> start!65174 (array_inv!7136 arr!273)))

(declare-fun b!292380 () Bool)

(assert (=> b!292380 (= e!208542 (array_inv!7136 (buf!7590 thiss!1728)))))

(declare-fun b!292378 () Bool)

(declare-fun res!241494 () Bool)

(assert (=> b!292378 (=> (not res!241494) (not e!208544))))

(assert (=> b!292378 (= res!241494 (bvsge from!505 to!474))))

(assert (= (and start!65174 res!241496) b!292377))

(assert (= (and b!292377 res!241495) b!292378))

(assert (= (and b!292378 res!241494) b!292379))

(assert (= start!65174 b!292380))

(declare-fun m!427861 () Bool)

(assert (=> b!292377 m!427861))

(declare-fun m!427863 () Bool)

(assert (=> b!292379 m!427863))

(declare-fun m!427865 () Bool)

(assert (=> b!292379 m!427865))

(declare-fun m!427867 () Bool)

(assert (=> b!292379 m!427867))

(declare-fun m!427869 () Bool)

(assert (=> b!292379 m!427869))

(declare-fun m!427871 () Bool)

(assert (=> b!292379 m!427871))

(declare-fun m!427873 () Bool)

(assert (=> start!65174 m!427873))

(declare-fun m!427875 () Bool)

(assert (=> start!65174 m!427875))

(declare-fun m!427877 () Bool)

(assert (=> b!292380 m!427877))

(push 1)

(assert (not start!65174))

(assert (not b!292377))

(assert (not b!292380))

(assert (not b!292379))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

