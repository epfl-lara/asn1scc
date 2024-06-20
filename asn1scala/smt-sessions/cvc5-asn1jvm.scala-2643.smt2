; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65176 () Bool)

(assert start!65176)

(declare-fun b!292392 () Bool)

(declare-fun e!208557 () Bool)

(declare-datatypes ((array!17381 0))(
  ( (array!17382 (arr!8551 (Array (_ BitVec 32) (_ BitVec 8))) (size!7525 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13060 0))(
  ( (BitStream!13061 (buf!7591 array!17381) (currentByte!14046 (_ BitVec 32)) (currentBit!14041 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13060)

(declare-fun array_inv!7137 (array!17381) Bool)

(assert (=> b!292392 (= e!208557 (array_inv!7137 (buf!7591 thiss!1728)))))

(declare-fun b!292389 () Bool)

(declare-fun res!241505 () Bool)

(declare-fun e!208554 () Bool)

(assert (=> b!292389 (=> (not res!241505) (not e!208554))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292389 (= res!241505 (validate_offset_bits!1 ((_ sign_extend 32) (size!7525 (buf!7591 thiss!1728))) ((_ sign_extend 32) (currentByte!14046 thiss!1728)) ((_ sign_extend 32) (currentBit!14041 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!292390 () Bool)

(declare-fun res!241503 () Bool)

(assert (=> b!292390 (=> (not res!241503) (not e!208554))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!292390 (= res!241503 (bvsge from!505 to!474))))

(declare-fun res!241504 () Bool)

(assert (=> start!65176 (=> (not res!241504) (not e!208554))))

(declare-fun arr!273 () array!17381)

(assert (=> start!65176 (= res!241504 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7525 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65176 e!208554))

(declare-fun inv!12 (BitStream!13060) Bool)

(assert (=> start!65176 (and (inv!12 thiss!1728) e!208557)))

(assert (=> start!65176 true))

(assert (=> start!65176 (array_inv!7137 arr!273)))

(declare-fun b!292391 () Bool)

(declare-fun lt!424700 () (_ BitVec 64))

(declare-fun lt!424698 () (_ BitVec 64))

(assert (=> b!292391 (= e!208554 (not (or (not (= (bvsub (bvadd lt!424700 to!474) from!505) lt!424700)) (bvsle from!505 lt!424698))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!292391 (= lt!424700 (bitIndex!0 (size!7525 (buf!7591 thiss!1728)) (currentByte!14046 thiss!1728) (currentBit!14041 thiss!1728)))))

(declare-fun arrayBitRangesEq!0 (array!17381 array!17381 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292391 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20339 0))(
  ( (Unit!20340) )
))
(declare-fun lt!424701 () Unit!20339)

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17381 array!17381 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20339)

(assert (=> b!292391 (= lt!424701 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424698 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!292391 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424698)))

(assert (=> b!292391 (= lt!424698 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7525 arr!273))))))

(declare-fun lt!424699 () Unit!20339)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17381) Unit!20339)

(assert (=> b!292391 (= lt!424699 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(assert (= (and start!65176 res!241504) b!292389))

(assert (= (and b!292389 res!241505) b!292390))

(assert (= (and b!292390 res!241503) b!292391))

(assert (= start!65176 b!292392))

(declare-fun m!427879 () Bool)

(assert (=> b!292392 m!427879))

(declare-fun m!427881 () Bool)

(assert (=> b!292389 m!427881))

(declare-fun m!427883 () Bool)

(assert (=> start!65176 m!427883))

(declare-fun m!427885 () Bool)

(assert (=> start!65176 m!427885))

(declare-fun m!427887 () Bool)

(assert (=> b!292391 m!427887))

(declare-fun m!427889 () Bool)

(assert (=> b!292391 m!427889))

(declare-fun m!427891 () Bool)

(assert (=> b!292391 m!427891))

(declare-fun m!427893 () Bool)

(assert (=> b!292391 m!427893))

(declare-fun m!427895 () Bool)

(assert (=> b!292391 m!427895))

(push 1)

(assert (not start!65176))

(assert (not b!292389))

(assert (not b!292392))

(assert (not b!292391))

(check-sat)

(pop 1)

(push 1)

(check-sat)

