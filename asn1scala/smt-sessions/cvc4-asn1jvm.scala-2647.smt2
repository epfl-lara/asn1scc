; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65204 () Bool)

(assert start!65204)

(declare-fun b!292557 () Bool)

(declare-fun res!241629 () Bool)

(declare-fun e!208722 () Bool)

(assert (=> b!292557 (=> (not res!241629) (not e!208722))))

(declare-datatypes ((array!17409 0))(
  ( (array!17410 (arr!8565 (Array (_ BitVec 32) (_ BitVec 8))) (size!7539 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13088 0))(
  ( (BitStream!13089 (buf!7605 array!17409) (currentByte!14060 (_ BitVec 32)) (currentBit!14055 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13088)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292557 (= res!241629 (validate_offset_bits!1 ((_ sign_extend 32) (size!7539 (buf!7605 thiss!1728))) ((_ sign_extend 32) (currentByte!14060 thiss!1728)) ((_ sign_extend 32) (currentBit!14055 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!292558 () Bool)

(declare-fun res!241630 () Bool)

(assert (=> b!292558 (=> (not res!241630) (not e!208722))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!292558 (= res!241630 (bvsge from!505 to!474))))

(declare-fun b!292560 () Bool)

(declare-fun e!208725 () Bool)

(declare-fun array_inv!7151 (array!17409) Bool)

(assert (=> b!292560 (= e!208725 (array_inv!7151 (buf!7605 thiss!1728)))))

(declare-fun b!292559 () Bool)

(assert (=> b!292559 (= e!208722 (not true))))

(declare-fun lt!424869 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!292559 (= lt!424869 (bitIndex!0 (size!7539 (buf!7605 thiss!1728)) (currentByte!14060 thiss!1728) (currentBit!14055 thiss!1728)))))

(declare-fun arr!273 () array!17409)

(declare-fun arrayBitRangesEq!0 (array!17409 array!17409 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292559 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!424868 () (_ BitVec 64))

(declare-datatypes ((Unit!20367 0))(
  ( (Unit!20368) )
))
(declare-fun lt!424867 () Unit!20367)

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17409 array!17409 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20367)

(assert (=> b!292559 (= lt!424867 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424868 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!292559 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424868)))

(assert (=> b!292559 (= lt!424868 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7539 arr!273))))))

(declare-fun lt!424866 () Unit!20367)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17409) Unit!20367)

(assert (=> b!292559 (= lt!424866 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun res!241631 () Bool)

(assert (=> start!65204 (=> (not res!241631) (not e!208722))))

(assert (=> start!65204 (= res!241631 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7539 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65204 e!208722))

(declare-fun inv!12 (BitStream!13088) Bool)

(assert (=> start!65204 (and (inv!12 thiss!1728) e!208725)))

(assert (=> start!65204 true))

(assert (=> start!65204 (array_inv!7151 arr!273)))

(assert (= (and start!65204 res!241631) b!292557))

(assert (= (and b!292557 res!241629) b!292558))

(assert (= (and b!292558 res!241630) b!292559))

(assert (= start!65204 b!292560))

(declare-fun m!428131 () Bool)

(assert (=> b!292557 m!428131))

(declare-fun m!428133 () Bool)

(assert (=> b!292560 m!428133))

(declare-fun m!428135 () Bool)

(assert (=> b!292559 m!428135))

(declare-fun m!428137 () Bool)

(assert (=> b!292559 m!428137))

(declare-fun m!428139 () Bool)

(assert (=> b!292559 m!428139))

(declare-fun m!428141 () Bool)

(assert (=> b!292559 m!428141))

(declare-fun m!428143 () Bool)

(assert (=> b!292559 m!428143))

(declare-fun m!428145 () Bool)

(assert (=> start!65204 m!428145))

(declare-fun m!428147 () Bool)

(assert (=> start!65204 m!428147))

(push 1)

(assert (not b!292559))

(assert (not start!65204))

(assert (not b!292557))

(assert (not b!292560))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

