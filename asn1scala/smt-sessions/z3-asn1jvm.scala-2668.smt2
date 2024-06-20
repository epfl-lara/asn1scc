; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65376 () Bool)

(assert start!65376)

(declare-fun res!242249 () Bool)

(declare-fun e!209495 () Bool)

(assert (=> start!65376 (=> (not res!242249) (not e!209495))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17524 0))(
  ( (array!17525 (arr!8621 (Array (_ BitVec 32) (_ BitVec 8))) (size!7595 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17524)

(assert (=> start!65376 (= res!242249 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7595 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65376 e!209495))

(declare-datatypes ((BitStream!13194 0))(
  ( (BitStream!13195 (buf!7658 array!17524) (currentByte!14122 (_ BitVec 32)) (currentBit!14117 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13194)

(declare-fun e!209496 () Bool)

(declare-fun inv!12 (BitStream!13194) Bool)

(assert (=> start!65376 (and (inv!12 thiss!1728) e!209496)))

(assert (=> start!65376 true))

(declare-fun array_inv!7207 (array!17524) Bool)

(assert (=> start!65376 (array_inv!7207 arr!273)))

(declare-fun b!293360 () Bool)

(assert (=> b!293360 (= e!209495 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)))))

(declare-datatypes ((tuple2!23020 0))(
  ( (tuple2!23021 (_1!12815 Bool) (_2!12815 BitStream!13194)) )
))
(declare-fun lt!425271 () tuple2!23020)

(declare-fun readBit!0 (BitStream!13194) tuple2!23020)

(assert (=> b!293360 (= lt!425271 (readBit!0 thiss!1728))))

(declare-fun b!293361 () Bool)

(assert (=> b!293361 (= e!209496 (array_inv!7207 (buf!7658 thiss!1728)))))

(declare-fun b!293359 () Bool)

(declare-fun res!242248 () Bool)

(assert (=> b!293359 (=> (not res!242248) (not e!209495))))

(assert (=> b!293359 (= res!242248 (bvslt from!505 to!474))))

(declare-fun b!293358 () Bool)

(declare-fun res!242247 () Bool)

(assert (=> b!293358 (=> (not res!242247) (not e!209495))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293358 (= res!242247 (validate_offset_bits!1 ((_ sign_extend 32) (size!7595 (buf!7658 thiss!1728))) ((_ sign_extend 32) (currentByte!14122 thiss!1728)) ((_ sign_extend 32) (currentBit!14117 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!65376 res!242249) b!293358))

(assert (= (and b!293358 res!242247) b!293359))

(assert (= (and b!293359 res!242248) b!293360))

(assert (= start!65376 b!293361))

(declare-fun m!428885 () Bool)

(assert (=> start!65376 m!428885))

(declare-fun m!428887 () Bool)

(assert (=> start!65376 m!428887))

(declare-fun m!428889 () Bool)

(assert (=> b!293360 m!428889))

(declare-fun m!428891 () Bool)

(assert (=> b!293361 m!428891))

(declare-fun m!428893 () Bool)

(assert (=> b!293358 m!428893))

(check-sat (not b!293361) (not b!293360) (not b!293358) (not start!65376))
(check-sat)
