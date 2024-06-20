; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65188 () Bool)

(assert start!65188)

(declare-fun res!241557 () Bool)

(declare-fun e!208628 () Bool)

(assert (=> start!65188 (=> (not res!241557) (not e!208628))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17393 0))(
  ( (array!17394 (arr!8557 (Array (_ BitVec 32) (_ BitVec 8))) (size!7531 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17393)

(assert (=> start!65188 (= res!241557 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7531 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65188 e!208628))

(declare-datatypes ((BitStream!13072 0))(
  ( (BitStream!13073 (buf!7597 array!17393) (currentByte!14052 (_ BitVec 32)) (currentBit!14047 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13072)

(declare-fun e!208629 () Bool)

(declare-fun inv!12 (BitStream!13072) Bool)

(assert (=> start!65188 (and (inv!12 thiss!1728) e!208629)))

(assert (=> start!65188 true))

(declare-fun array_inv!7143 (array!17393) Bool)

(assert (=> start!65188 (array_inv!7143 arr!273)))

(declare-fun b!292464 () Bool)

(assert (=> b!292464 (= e!208629 (array_inv!7143 (buf!7597 thiss!1728)))))

(declare-fun b!292463 () Bool)

(assert (=> b!292463 (= e!208628 (not true))))

(declare-fun lt!424771 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!292463 (= lt!424771 (bitIndex!0 (size!7531 (buf!7597 thiss!1728)) (currentByte!14052 thiss!1728) (currentBit!14047 thiss!1728)))))

(declare-fun arrayBitRangesEq!0 (array!17393 array!17393 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292463 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20351 0))(
  ( (Unit!20352) )
))
(declare-fun lt!424772 () Unit!20351)

(declare-fun lt!424773 () (_ BitVec 64))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17393 array!17393 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20351)

(assert (=> b!292463 (= lt!424772 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424773 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!292463 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424773)))

(assert (=> b!292463 (= lt!424773 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7531 arr!273))))))

(declare-fun lt!424770 () Unit!20351)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17393) Unit!20351)

(assert (=> b!292463 (= lt!424770 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!292462 () Bool)

(declare-fun res!241559 () Bool)

(assert (=> b!292462 (=> (not res!241559) (not e!208628))))

(assert (=> b!292462 (= res!241559 (bvsge from!505 to!474))))

(declare-fun b!292461 () Bool)

(declare-fun res!241558 () Bool)

(assert (=> b!292461 (=> (not res!241558) (not e!208628))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292461 (= res!241558 (validate_offset_bits!1 ((_ sign_extend 32) (size!7531 (buf!7597 thiss!1728))) ((_ sign_extend 32) (currentByte!14052 thiss!1728)) ((_ sign_extend 32) (currentBit!14047 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!65188 res!241557) b!292461))

(assert (= (and b!292461 res!241558) b!292462))

(assert (= (and b!292462 res!241559) b!292463))

(assert (= start!65188 b!292464))

(declare-fun m!427987 () Bool)

(assert (=> start!65188 m!427987))

(declare-fun m!427989 () Bool)

(assert (=> start!65188 m!427989))

(declare-fun m!427991 () Bool)

(assert (=> b!292464 m!427991))

(declare-fun m!427993 () Bool)

(assert (=> b!292463 m!427993))

(declare-fun m!427995 () Bool)

(assert (=> b!292463 m!427995))

(declare-fun m!427997 () Bool)

(assert (=> b!292463 m!427997))

(declare-fun m!427999 () Bool)

(assert (=> b!292463 m!427999))

(declare-fun m!428001 () Bool)

(assert (=> b!292463 m!428001))

(declare-fun m!428003 () Bool)

(assert (=> b!292461 m!428003))

(push 1)

(assert (not start!65188))

(assert (not b!292461))

(assert (not b!292464))

(assert (not b!292463))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

