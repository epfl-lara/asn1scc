; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65350 () Bool)

(assert start!65350)

(declare-fun b!293205 () Bool)

(declare-fun e!209337 () Bool)

(declare-datatypes ((array!17498 0))(
  ( (array!17499 (arr!8608 (Array (_ BitVec 32) (_ BitVec 8))) (size!7582 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13168 0))(
  ( (BitStream!13169 (buf!7645 array!17498) (currentByte!14109 (_ BitVec 32)) (currentBit!14104 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13168)

(declare-fun array_inv!7194 (array!17498) Bool)

(assert (=> b!293205 (= e!209337 (array_inv!7194 (buf!7645 thiss!1728)))))

(declare-fun res!242130 () Bool)

(declare-fun e!209338 () Bool)

(assert (=> start!65350 (=> (not res!242130) (not e!209338))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arr!273 () array!17498)

(declare-fun to!474 () (_ BitVec 64))

(assert (=> start!65350 (= res!242130 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7582 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65350 e!209338))

(declare-fun inv!12 (BitStream!13168) Bool)

(assert (=> start!65350 (and (inv!12 thiss!1728) e!209337)))

(assert (=> start!65350 true))

(assert (=> start!65350 (array_inv!7194 arr!273)))

(declare-fun b!293203 () Bool)

(declare-fun res!242131 () Bool)

(assert (=> b!293203 (=> (not res!242131) (not e!209338))))

(assert (=> b!293203 (= res!242131 (bvslt from!505 to!474))))

(declare-fun b!293202 () Bool)

(declare-fun res!242132 () Bool)

(assert (=> b!293202 (=> (not res!242132) (not e!209338))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293202 (= res!242132 (validate_offset_bits!1 ((_ sign_extend 32) (size!7582 (buf!7645 thiss!1728))) ((_ sign_extend 32) (currentByte!14109 thiss!1728)) ((_ sign_extend 32) (currentBit!14104 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!293204 () Bool)

(declare-fun lt!425207 () (_ BitVec 32))

(assert (=> b!293204 (= e!209338 (or (bvslt lt!425207 #b00000000000000000000000000000000) (bvsge lt!425207 (size!7582 arr!273))))))

(assert (=> b!293204 (= lt!425207 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-datatypes ((tuple2!22994 0))(
  ( (tuple2!22995 (_1!12802 Bool) (_2!12802 BitStream!13168)) )
))
(declare-fun lt!425208 () tuple2!22994)

(declare-fun readBit!0 (BitStream!13168) tuple2!22994)

(assert (=> b!293204 (= lt!425208 (readBit!0 thiss!1728))))

(assert (= (and start!65350 res!242130) b!293202))

(assert (= (and b!293202 res!242132) b!293203))

(assert (= (and b!293203 res!242131) b!293204))

(assert (= start!65350 b!293205))

(declare-fun m!428755 () Bool)

(assert (=> b!293205 m!428755))

(declare-fun m!428757 () Bool)

(assert (=> start!65350 m!428757))

(declare-fun m!428759 () Bool)

(assert (=> start!65350 m!428759))

(declare-fun m!428761 () Bool)

(assert (=> b!293202 m!428761))

(declare-fun m!428763 () Bool)

(assert (=> b!293204 m!428763))

(push 1)

(assert (not b!293205))

(assert (not b!293204))

(assert (not start!65350))

(assert (not b!293202))

(check-sat)

(pop 1)

(push 1)

(check-sat)

