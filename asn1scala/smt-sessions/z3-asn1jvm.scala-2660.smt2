; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65328 () Bool)

(assert start!65328)

(declare-fun b!293063 () Bool)

(declare-fun e!209198 () Bool)

(assert (=> b!293063 (= e!209198 false)))

(declare-datatypes ((array!17476 0))(
  ( (array!17477 (arr!8597 (Array (_ BitVec 32) (_ BitVec 8))) (size!7571 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13146 0))(
  ( (BitStream!13147 (buf!7634 array!17476) (currentByte!14098 (_ BitVec 32)) (currentBit!14093 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22972 0))(
  ( (tuple2!22973 (_1!12791 Bool) (_2!12791 BitStream!13146)) )
))
(declare-fun lt!425172 () tuple2!22972)

(declare-fun thiss!1728 () BitStream!13146)

(declare-fun readBit!0 (BitStream!13146) tuple2!22972)

(assert (=> b!293063 (= lt!425172 (readBit!0 thiss!1728))))

(declare-fun b!293061 () Bool)

(declare-fun res!242022 () Bool)

(assert (=> b!293061 (=> (not res!242022) (not e!209198))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293061 (= res!242022 (validate_offset_bits!1 ((_ sign_extend 32) (size!7571 (buf!7634 thiss!1728))) ((_ sign_extend 32) (currentByte!14098 thiss!1728)) ((_ sign_extend 32) (currentBit!14093 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!242023 () Bool)

(assert (=> start!65328 (=> (not res!242023) (not e!209198))))

(declare-fun arr!273 () array!17476)

(declare-fun to!474 () (_ BitVec 64))

(assert (=> start!65328 (= res!242023 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7571 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65328 e!209198))

(declare-fun e!209196 () Bool)

(declare-fun inv!12 (BitStream!13146) Bool)

(assert (=> start!65328 (and (inv!12 thiss!1728) e!209196)))

(assert (=> start!65328 true))

(declare-fun array_inv!7183 (array!17476) Bool)

(assert (=> start!65328 (array_inv!7183 arr!273)))

(declare-fun b!293062 () Bool)

(declare-fun res!242024 () Bool)

(assert (=> b!293062 (=> (not res!242024) (not e!209198))))

(assert (=> b!293062 (= res!242024 (bvslt from!505 to!474))))

(declare-fun b!293064 () Bool)

(assert (=> b!293064 (= e!209196 (array_inv!7183 (buf!7634 thiss!1728)))))

(assert (= (and start!65328 res!242023) b!293061))

(assert (= (and b!293061 res!242022) b!293062))

(assert (= (and b!293062 res!242024) b!293063))

(assert (= start!65328 b!293064))

(declare-fun m!428645 () Bool)

(assert (=> b!293063 m!428645))

(declare-fun m!428647 () Bool)

(assert (=> b!293061 m!428647))

(declare-fun m!428649 () Bool)

(assert (=> start!65328 m!428649))

(declare-fun m!428651 () Bool)

(assert (=> start!65328 m!428651))

(declare-fun m!428653 () Bool)

(assert (=> b!293064 m!428653))

(check-sat (not b!293061) (not b!293063) (not b!293064) (not start!65328))
