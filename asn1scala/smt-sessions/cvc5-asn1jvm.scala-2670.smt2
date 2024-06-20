; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65410 () Bool)

(assert start!65410)

(declare-fun b!293429 () Bool)

(declare-fun e!209577 () Bool)

(assert (=> b!293429 (= e!209577 false)))

(declare-datatypes ((array!17537 0))(
  ( (array!17538 (arr!8626 (Array (_ BitVec 32) (_ BitVec 8))) (size!7600 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13204 0))(
  ( (BitStream!13205 (buf!7663 array!17537) (currentByte!14130 (_ BitVec 32)) (currentBit!14125 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!23032 0))(
  ( (tuple2!23033 (_1!12821 Bool) (_2!12821 BitStream!13204)) )
))
(declare-fun lt!425349 () tuple2!23032)

(declare-fun thiss!1728 () BitStream!13204)

(declare-fun readBit!0 (BitStream!13204) tuple2!23032)

(assert (=> b!293429 (= lt!425349 (readBit!0 thiss!1728))))

(declare-fun b!293427 () Bool)

(declare-fun res!242303 () Bool)

(assert (=> b!293427 (=> (not res!242303) (not e!209577))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293427 (= res!242303 (validate_offset_bits!1 ((_ sign_extend 32) (size!7600 (buf!7663 thiss!1728))) ((_ sign_extend 32) (currentByte!14130 thiss!1728)) ((_ sign_extend 32) (currentBit!14125 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!293428 () Bool)

(declare-fun res!242301 () Bool)

(assert (=> b!293428 (=> (not res!242301) (not e!209577))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!293428 (= res!242301 (bvslt from!505 to!474))))

(declare-fun b!293430 () Bool)

(declare-fun e!209575 () Bool)

(declare-fun array_inv!7212 (array!17537) Bool)

(assert (=> b!293430 (= e!209575 (array_inv!7212 (buf!7663 thiss!1728)))))

(declare-fun res!242302 () Bool)

(assert (=> start!65410 (=> (not res!242302) (not e!209577))))

(declare-fun arr!273 () array!17537)

(assert (=> start!65410 (= res!242302 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7600 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65410 e!209577))

(declare-fun inv!12 (BitStream!13204) Bool)

(assert (=> start!65410 (and (inv!12 thiss!1728) e!209575)))

(assert (=> start!65410 true))

(assert (=> start!65410 (array_inv!7212 arr!273)))

(assert (= (and start!65410 res!242302) b!293427))

(assert (= (and b!293427 res!242303) b!293428))

(assert (= (and b!293428 res!242301) b!293429))

(assert (= start!65410 b!293430))

(declare-fun m!428959 () Bool)

(assert (=> b!293429 m!428959))

(declare-fun m!428961 () Bool)

(assert (=> b!293427 m!428961))

(declare-fun m!428963 () Bool)

(assert (=> b!293430 m!428963))

(declare-fun m!428965 () Bool)

(assert (=> start!65410 m!428965))

(declare-fun m!428967 () Bool)

(assert (=> start!65410 m!428967))

(push 1)

(assert (not b!293429))

(assert (not b!293427))

(assert (not start!65410))

(assert (not b!293430))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

