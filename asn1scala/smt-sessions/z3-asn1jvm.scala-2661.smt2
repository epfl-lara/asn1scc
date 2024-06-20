; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65334 () Bool)

(assert start!65334)

(declare-fun b!293098 () Bool)

(declare-fun res!242050 () Bool)

(declare-fun e!209234 () Bool)

(assert (=> b!293098 (=> (not res!242050) (not e!209234))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!293098 (= res!242050 (bvslt from!505 to!474))))

(declare-fun b!293099 () Bool)

(assert (=> b!293099 (= e!209234 (bvsge (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(declare-datatypes ((array!17482 0))(
  ( (array!17483 (arr!8600 (Array (_ BitVec 32) (_ BitVec 8))) (size!7574 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13152 0))(
  ( (BitStream!13153 (buf!7637 array!17482) (currentByte!14101 (_ BitVec 32)) (currentBit!14096 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22978 0))(
  ( (tuple2!22979 (_1!12794 Bool) (_2!12794 BitStream!13152)) )
))
(declare-fun lt!425181 () tuple2!22978)

(declare-fun thiss!1728 () BitStream!13152)

(declare-fun readBit!0 (BitStream!13152) tuple2!22978)

(assert (=> b!293099 (= lt!425181 (readBit!0 thiss!1728))))

(declare-fun b!293097 () Bool)

(declare-fun res!242051 () Bool)

(assert (=> b!293097 (=> (not res!242051) (not e!209234))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293097 (= res!242051 (validate_offset_bits!1 ((_ sign_extend 32) (size!7574 (buf!7637 thiss!1728))) ((_ sign_extend 32) (currentByte!14101 thiss!1728)) ((_ sign_extend 32) (currentBit!14096 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!293100 () Bool)

(declare-fun e!209233 () Bool)

(declare-fun array_inv!7186 (array!17482) Bool)

(assert (=> b!293100 (= e!209233 (array_inv!7186 (buf!7637 thiss!1728)))))

(declare-fun res!242049 () Bool)

(assert (=> start!65334 (=> (not res!242049) (not e!209234))))

(declare-fun arr!273 () array!17482)

(assert (=> start!65334 (= res!242049 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7574 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65334 e!209234))

(declare-fun inv!12 (BitStream!13152) Bool)

(assert (=> start!65334 (and (inv!12 thiss!1728) e!209233)))

(assert (=> start!65334 true))

(assert (=> start!65334 (array_inv!7186 arr!273)))

(assert (= (and start!65334 res!242049) b!293097))

(assert (= (and b!293097 res!242051) b!293098))

(assert (= (and b!293098 res!242050) b!293099))

(assert (= start!65334 b!293100))

(declare-fun m!428675 () Bool)

(assert (=> b!293099 m!428675))

(declare-fun m!428677 () Bool)

(assert (=> b!293097 m!428677))

(declare-fun m!428679 () Bool)

(assert (=> b!293100 m!428679))

(declare-fun m!428681 () Bool)

(assert (=> start!65334 m!428681))

(declare-fun m!428683 () Bool)

(assert (=> start!65334 m!428683))

(check-sat (not start!65334) (not b!293100) (not b!293099) (not b!293097))
(check-sat)
