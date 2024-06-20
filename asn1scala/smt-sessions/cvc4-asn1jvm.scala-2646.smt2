; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65198 () Bool)

(assert start!65198)

(declare-fun b!292523 () Bool)

(declare-fun e!208689 () Bool)

(assert (=> b!292523 (= e!208689 (not true))))

(declare-fun lt!424832 () (_ BitVec 64))

(declare-datatypes ((array!17403 0))(
  ( (array!17404 (arr!8562 (Array (_ BitVec 32) (_ BitVec 8))) (size!7536 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13082 0))(
  ( (BitStream!13083 (buf!7602 array!17403) (currentByte!14057 (_ BitVec 32)) (currentBit!14052 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13082)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!292523 (= lt!424832 (bitIndex!0 (size!7536 (buf!7602 thiss!1728)) (currentByte!14057 thiss!1728) (currentBit!14052 thiss!1728)))))

(declare-fun arr!273 () array!17403)

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!17403 array!17403 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292523 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!424833 () (_ BitVec 64))

(declare-datatypes ((Unit!20361 0))(
  ( (Unit!20362) )
))
(declare-fun lt!424831 () Unit!20361)

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17403 array!17403 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20361)

(assert (=> b!292523 (= lt!424831 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424833 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!292523 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424833)))

(assert (=> b!292523 (= lt!424833 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7536 arr!273))))))

(declare-fun lt!424830 () Unit!20361)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17403) Unit!20361)

(assert (=> b!292523 (= lt!424830 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!292521 () Bool)

(declare-fun res!241604 () Bool)

(assert (=> b!292521 (=> (not res!241604) (not e!208689))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292521 (= res!241604 (validate_offset_bits!1 ((_ sign_extend 32) (size!7536 (buf!7602 thiss!1728))) ((_ sign_extend 32) (currentByte!14057 thiss!1728)) ((_ sign_extend 32) (currentBit!14052 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!292522 () Bool)

(declare-fun res!241603 () Bool)

(assert (=> b!292522 (=> (not res!241603) (not e!208689))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!292522 (= res!241603 (bvsge from!505 to!474))))

(declare-fun b!292524 () Bool)

(declare-fun e!208687 () Bool)

(declare-fun array_inv!7148 (array!17403) Bool)

(assert (=> b!292524 (= e!208687 (array_inv!7148 (buf!7602 thiss!1728)))))

(declare-fun res!241602 () Bool)

(assert (=> start!65198 (=> (not res!241602) (not e!208689))))

(assert (=> start!65198 (= res!241602 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7536 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65198 e!208689))

(declare-fun inv!12 (BitStream!13082) Bool)

(assert (=> start!65198 (and (inv!12 thiss!1728) e!208687)))

(assert (=> start!65198 true))

(assert (=> start!65198 (array_inv!7148 arr!273)))

(assert (= (and start!65198 res!241602) b!292521))

(assert (= (and b!292521 res!241604) b!292522))

(assert (= (and b!292522 res!241603) b!292523))

(assert (= start!65198 b!292524))

(declare-fun m!428077 () Bool)

(assert (=> b!292523 m!428077))

(declare-fun m!428079 () Bool)

(assert (=> b!292523 m!428079))

(declare-fun m!428081 () Bool)

(assert (=> b!292523 m!428081))

(declare-fun m!428083 () Bool)

(assert (=> b!292523 m!428083))

(declare-fun m!428085 () Bool)

(assert (=> b!292523 m!428085))

(declare-fun m!428087 () Bool)

(assert (=> b!292521 m!428087))

(declare-fun m!428089 () Bool)

(assert (=> b!292524 m!428089))

(declare-fun m!428091 () Bool)

(assert (=> start!65198 m!428091))

(declare-fun m!428093 () Bool)

(assert (=> start!65198 m!428093))

(push 1)

(assert (not b!292523))

(assert (not b!292521))

(assert (not start!65198))

(assert (not b!292524))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

