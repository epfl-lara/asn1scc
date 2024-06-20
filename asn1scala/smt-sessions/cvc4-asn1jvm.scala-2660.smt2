; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65330 () Bool)

(assert start!65330)

(declare-fun b!293073 () Bool)

(declare-fun res!242031 () Bool)

(declare-fun e!209208 () Bool)

(assert (=> b!293073 (=> (not res!242031) (not e!209208))))

(declare-datatypes ((array!17478 0))(
  ( (array!17479 (arr!8598 (Array (_ BitVec 32) (_ BitVec 8))) (size!7572 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13148 0))(
  ( (BitStream!13149 (buf!7635 array!17478) (currentByte!14099 (_ BitVec 32)) (currentBit!14094 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13148)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293073 (= res!242031 (validate_offset_bits!1 ((_ sign_extend 32) (size!7572 (buf!7635 thiss!1728))) ((_ sign_extend 32) (currentByte!14099 thiss!1728)) ((_ sign_extend 32) (currentBit!14094 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!293076 () Bool)

(declare-fun e!209211 () Bool)

(declare-fun array_inv!7184 (array!17478) Bool)

(assert (=> b!293076 (= e!209211 (array_inv!7184 (buf!7635 thiss!1728)))))

(declare-fun b!293074 () Bool)

(declare-fun res!242033 () Bool)

(assert (=> b!293074 (=> (not res!242033) (not e!209208))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!293074 (= res!242033 (bvslt from!505 to!474))))

(declare-fun res!242032 () Bool)

(assert (=> start!65330 (=> (not res!242032) (not e!209208))))

(declare-fun arr!273 () array!17478)

(assert (=> start!65330 (= res!242032 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7572 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65330 e!209208))

(declare-fun inv!12 (BitStream!13148) Bool)

(assert (=> start!65330 (and (inv!12 thiss!1728) e!209211)))

(assert (=> start!65330 true))

(assert (=> start!65330 (array_inv!7184 arr!273)))

(declare-fun b!293075 () Bool)

(assert (=> b!293075 (= e!209208 false)))

(declare-datatypes ((tuple2!22974 0))(
  ( (tuple2!22975 (_1!12792 Bool) (_2!12792 BitStream!13148)) )
))
(declare-fun lt!425175 () tuple2!22974)

(declare-fun readBit!0 (BitStream!13148) tuple2!22974)

(assert (=> b!293075 (= lt!425175 (readBit!0 thiss!1728))))

(assert (= (and start!65330 res!242032) b!293073))

(assert (= (and b!293073 res!242031) b!293074))

(assert (= (and b!293074 res!242033) b!293075))

(assert (= start!65330 b!293076))

(declare-fun m!428655 () Bool)

(assert (=> b!293073 m!428655))

(declare-fun m!428657 () Bool)

(assert (=> b!293076 m!428657))

(declare-fun m!428659 () Bool)

(assert (=> start!65330 m!428659))

(declare-fun m!428661 () Bool)

(assert (=> start!65330 m!428661))

(declare-fun m!428663 () Bool)

(assert (=> b!293075 m!428663))

(push 1)

(assert (not b!293075))

(assert (not b!293076))

(assert (not start!65330))

(assert (not b!293073))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

