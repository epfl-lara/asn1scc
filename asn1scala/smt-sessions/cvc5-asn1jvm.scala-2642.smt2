; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65170 () Bool)

(assert start!65170)

(declare-fun b!292353 () Bool)

(declare-fun res!241478 () Bool)

(declare-fun e!208520 () Bool)

(assert (=> b!292353 (=> (not res!241478) (not e!208520))))

(declare-datatypes ((array!17375 0))(
  ( (array!17376 (arr!8548 (Array (_ BitVec 32) (_ BitVec 8))) (size!7522 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13054 0))(
  ( (BitStream!13055 (buf!7588 array!17375) (currentByte!14043 (_ BitVec 32)) (currentBit!14038 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13054)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292353 (= res!241478 (validate_offset_bits!1 ((_ sign_extend 32) (size!7522 (buf!7588 thiss!1728))) ((_ sign_extend 32) (currentByte!14043 thiss!1728)) ((_ sign_extend 32) (currentBit!14038 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!292356 () Bool)

(declare-fun e!208521 () Bool)

(declare-fun array_inv!7134 (array!17375) Bool)

(assert (=> b!292356 (= e!208521 (array_inv!7134 (buf!7588 thiss!1728)))))

(declare-fun res!241477 () Bool)

(assert (=> start!65170 (=> (not res!241477) (not e!208520))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17375)

(assert (=> start!65170 (= res!241477 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7522 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65170 e!208520))

(declare-fun inv!12 (BitStream!13054) Bool)

(assert (=> start!65170 (and (inv!12 thiss!1728) e!208521)))

(assert (=> start!65170 true))

(assert (=> start!65170 (array_inv!7134 arr!273)))

(declare-fun b!292354 () Bool)

(declare-fun res!241476 () Bool)

(assert (=> b!292354 (=> (not res!241476) (not e!208520))))

(assert (=> b!292354 (= res!241476 (bvsge from!505 to!474))))

(declare-fun b!292355 () Bool)

(assert (=> b!292355 (= e!208520 (not true))))

(declare-fun lt!424665 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!292355 (= lt!424665 (bitIndex!0 (size!7522 (buf!7588 thiss!1728)) (currentByte!14043 thiss!1728) (currentBit!14038 thiss!1728)))))

(declare-fun arrayBitRangesEq!0 (array!17375 array!17375 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292355 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20333 0))(
  ( (Unit!20334) )
))
(declare-fun lt!424664 () Unit!20333)

(declare-fun lt!424663 () (_ BitVec 64))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17375 array!17375 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20333)

(assert (=> b!292355 (= lt!424664 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424663 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!292355 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424663)))

(assert (=> b!292355 (= lt!424663 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7522 arr!273))))))

(declare-fun lt!424662 () Unit!20333)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17375) Unit!20333)

(assert (=> b!292355 (= lt!424662 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(assert (= (and start!65170 res!241477) b!292353))

(assert (= (and b!292353 res!241478) b!292354))

(assert (= (and b!292354 res!241476) b!292355))

(assert (= start!65170 b!292356))

(declare-fun m!427825 () Bool)

(assert (=> b!292353 m!427825))

(declare-fun m!427827 () Bool)

(assert (=> b!292356 m!427827))

(declare-fun m!427829 () Bool)

(assert (=> start!65170 m!427829))

(declare-fun m!427831 () Bool)

(assert (=> start!65170 m!427831))

(declare-fun m!427833 () Bool)

(assert (=> b!292355 m!427833))

(declare-fun m!427835 () Bool)

(assert (=> b!292355 m!427835))

(declare-fun m!427837 () Bool)

(assert (=> b!292355 m!427837))

(declare-fun m!427839 () Bool)

(assert (=> b!292355 m!427839))

(declare-fun m!427841 () Bool)

(assert (=> b!292355 m!427841))

(push 1)

(assert (not b!292353))

(assert (not b!292356))

(assert (not b!292355))

(assert (not start!65170))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

