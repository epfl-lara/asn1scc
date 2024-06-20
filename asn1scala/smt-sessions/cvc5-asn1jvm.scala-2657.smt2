; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65308 () Bool)

(assert start!65308)

(declare-fun b!292941 () Bool)

(declare-fun res!241933 () Bool)

(declare-fun e!209078 () Bool)

(assert (=> b!292941 (=> (not res!241933) (not e!209078))))

(declare-datatypes ((array!17456 0))(
  ( (array!17457 (arr!8587 (Array (_ BitVec 32) (_ BitVec 8))) (size!7561 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13126 0))(
  ( (BitStream!13127 (buf!7624 array!17456) (currentByte!14088 (_ BitVec 32)) (currentBit!14083 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13126)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292941 (= res!241933 (validate_offset_bits!1 ((_ sign_extend 32) (size!7561 (buf!7624 thiss!1728))) ((_ sign_extend 32) (currentByte!14088 thiss!1728)) ((_ sign_extend 32) (currentBit!14083 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!292942 () Bool)

(declare-fun res!241932 () Bool)

(assert (=> b!292942 (=> (not res!241932) (not e!209078))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!292942 (= res!241932 (bvslt from!505 to!474))))

(declare-fun b!292944 () Bool)

(declare-fun e!209077 () Bool)

(declare-fun array_inv!7173 (array!17456) Bool)

(assert (=> b!292944 (= e!209077 (array_inv!7173 (buf!7624 thiss!1728)))))

(declare-fun b!292943 () Bool)

(assert (=> b!292943 (= e!209078 false)))

(declare-datatypes ((tuple2!22952 0))(
  ( (tuple2!22953 (_1!12781 Bool) (_2!12781 BitStream!13126)) )
))
(declare-fun lt!425142 () tuple2!22952)

(declare-fun readBit!0 (BitStream!13126) tuple2!22952)

(assert (=> b!292943 (= lt!425142 (readBit!0 thiss!1728))))

(declare-fun res!241934 () Bool)

(assert (=> start!65308 (=> (not res!241934) (not e!209078))))

(declare-fun arr!273 () array!17456)

(assert (=> start!65308 (= res!241934 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7561 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65308 e!209078))

(declare-fun inv!12 (BitStream!13126) Bool)

(assert (=> start!65308 (and (inv!12 thiss!1728) e!209077)))

(assert (=> start!65308 true))

(assert (=> start!65308 (array_inv!7173 arr!273)))

(assert (= (and start!65308 res!241934) b!292941))

(assert (= (and b!292941 res!241933) b!292942))

(assert (= (and b!292942 res!241932) b!292943))

(assert (= start!65308 b!292944))

(declare-fun m!428545 () Bool)

(assert (=> b!292941 m!428545))

(declare-fun m!428547 () Bool)

(assert (=> b!292944 m!428547))

(declare-fun m!428549 () Bool)

(assert (=> b!292943 m!428549))

(declare-fun m!428551 () Bool)

(assert (=> start!65308 m!428551))

(declare-fun m!428553 () Bool)

(assert (=> start!65308 m!428553))

(push 1)

(assert (not b!292943))

(assert (not b!292944))

(assert (not start!65308))

(assert (not b!292941))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

