; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65340 () Bool)

(assert start!65340)

(declare-fun res!242077 () Bool)

(declare-fun e!209269 () Bool)

(assert (=> start!65340 (=> (not res!242077) (not e!209269))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17488 0))(
  ( (array!17489 (arr!8603 (Array (_ BitVec 32) (_ BitVec 8))) (size!7577 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17488)

(assert (=> start!65340 (= res!242077 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7577 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65340 e!209269))

(declare-datatypes ((BitStream!13158 0))(
  ( (BitStream!13159 (buf!7640 array!17488) (currentByte!14104 (_ BitVec 32)) (currentBit!14099 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13158)

(declare-fun e!209270 () Bool)

(declare-fun inv!12 (BitStream!13158) Bool)

(assert (=> start!65340 (and (inv!12 thiss!1728) e!209270)))

(assert (=> start!65340 true))

(declare-fun array_inv!7189 (array!17488) Bool)

(assert (=> start!65340 (array_inv!7189 arr!273)))

(declare-fun b!293136 () Bool)

(assert (=> b!293136 (= e!209270 (array_inv!7189 (buf!7640 thiss!1728)))))

(declare-fun b!293133 () Bool)

(declare-fun res!242076 () Bool)

(assert (=> b!293133 (=> (not res!242076) (not e!209269))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293133 (= res!242076 (validate_offset_bits!1 ((_ sign_extend 32) (size!7577 (buf!7640 thiss!1728))) ((_ sign_extend 32) (currentByte!14104 thiss!1728)) ((_ sign_extend 32) (currentBit!14099 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!293135 () Bool)

(assert (=> b!293135 (= e!209269 (and (bvslt (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000)))))

(declare-datatypes ((tuple2!22984 0))(
  ( (tuple2!22985 (_1!12797 Bool) (_2!12797 BitStream!13158)) )
))
(declare-fun lt!425190 () tuple2!22984)

(declare-fun readBit!0 (BitStream!13158) tuple2!22984)

(assert (=> b!293135 (= lt!425190 (readBit!0 thiss!1728))))

(declare-fun b!293134 () Bool)

(declare-fun res!242078 () Bool)

(assert (=> b!293134 (=> (not res!242078) (not e!209269))))

(assert (=> b!293134 (= res!242078 (bvslt from!505 to!474))))

(assert (= (and start!65340 res!242077) b!293133))

(assert (= (and b!293133 res!242076) b!293134))

(assert (= (and b!293134 res!242078) b!293135))

(assert (= start!65340 b!293136))

(declare-fun m!428705 () Bool)

(assert (=> start!65340 m!428705))

(declare-fun m!428707 () Bool)

(assert (=> start!65340 m!428707))

(declare-fun m!428709 () Bool)

(assert (=> b!293136 m!428709))

(declare-fun m!428711 () Bool)

(assert (=> b!293133 m!428711))

(declare-fun m!428713 () Bool)

(assert (=> b!293135 m!428713))

(check-sat (not start!65340) (not b!293136) (not b!293135) (not b!293133))
(check-sat)
