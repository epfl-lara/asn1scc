; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65182 () Bool)

(assert start!65182)

(declare-fun b!292427 () Bool)

(declare-fun e!208592 () Bool)

(assert (=> b!292427 (= e!208592 (not true))))

(declare-fun lt!424735 () (_ BitVec 64))

(declare-datatypes ((array!17387 0))(
  ( (array!17388 (arr!8554 (Array (_ BitVec 32) (_ BitVec 8))) (size!7528 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13066 0))(
  ( (BitStream!13067 (buf!7594 array!17387) (currentByte!14049 (_ BitVec 32)) (currentBit!14044 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13066)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!292427 (= lt!424735 (bitIndex!0 (size!7528 (buf!7594 thiss!1728)) (currentByte!14049 thiss!1728) (currentBit!14044 thiss!1728)))))

(declare-fun arr!273 () array!17387)

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!17387 array!17387 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292427 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!424734 () (_ BitVec 64))

(declare-datatypes ((Unit!20345 0))(
  ( (Unit!20346) )
))
(declare-fun lt!424736 () Unit!20345)

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17387 array!17387 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20345)

(assert (=> b!292427 (= lt!424736 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424734 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!292427 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424734)))

(assert (=> b!292427 (= lt!424734 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7528 arr!273))))))

(declare-fun lt!424737 () Unit!20345)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17387) Unit!20345)

(assert (=> b!292427 (= lt!424737 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!292428 () Bool)

(declare-fun e!208593 () Bool)

(declare-fun array_inv!7140 (array!17387) Bool)

(assert (=> b!292428 (= e!208593 (array_inv!7140 (buf!7594 thiss!1728)))))

(declare-fun res!241531 () Bool)

(assert (=> start!65182 (=> (not res!241531) (not e!208592))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> start!65182 (= res!241531 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7528 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65182 e!208592))

(declare-fun inv!12 (BitStream!13066) Bool)

(assert (=> start!65182 (and (inv!12 thiss!1728) e!208593)))

(assert (=> start!65182 true))

(assert (=> start!65182 (array_inv!7140 arr!273)))

(declare-fun b!292426 () Bool)

(declare-fun res!241532 () Bool)

(assert (=> b!292426 (=> (not res!241532) (not e!208592))))

(assert (=> b!292426 (= res!241532 (bvsge from!505 to!474))))

(declare-fun b!292425 () Bool)

(declare-fun res!241530 () Bool)

(assert (=> b!292425 (=> (not res!241530) (not e!208592))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292425 (= res!241530 (validate_offset_bits!1 ((_ sign_extend 32) (size!7528 (buf!7594 thiss!1728))) ((_ sign_extend 32) (currentByte!14049 thiss!1728)) ((_ sign_extend 32) (currentBit!14044 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!65182 res!241531) b!292425))

(assert (= (and b!292425 res!241530) b!292426))

(assert (= (and b!292426 res!241532) b!292427))

(assert (= start!65182 b!292428))

(declare-fun m!427933 () Bool)

(assert (=> b!292427 m!427933))

(declare-fun m!427935 () Bool)

(assert (=> b!292427 m!427935))

(declare-fun m!427937 () Bool)

(assert (=> b!292427 m!427937))

(declare-fun m!427939 () Bool)

(assert (=> b!292427 m!427939))

(declare-fun m!427941 () Bool)

(assert (=> b!292427 m!427941))

(declare-fun m!427943 () Bool)

(assert (=> b!292428 m!427943))

(declare-fun m!427945 () Bool)

(assert (=> start!65182 m!427945))

(declare-fun m!427947 () Bool)

(assert (=> start!65182 m!427947))

(declare-fun m!427949 () Bool)

(assert (=> b!292425 m!427949))

(push 1)

(assert (not b!292425))

(assert (not start!65182))

(assert (not b!292428))

(assert (not b!292427))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

