; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65362 () Bool)

(assert start!65362)

(declare-fun b!293274 () Bool)

(declare-fun res!242185 () Bool)

(declare-fun e!209411 () Bool)

(assert (=> b!293274 (=> (not res!242185) (not e!209411))))

(declare-datatypes ((array!17510 0))(
  ( (array!17511 (arr!8614 (Array (_ BitVec 32) (_ BitVec 8))) (size!7588 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13180 0))(
  ( (BitStream!13181 (buf!7651 array!17510) (currentByte!14115 (_ BitVec 32)) (currentBit!14110 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13180)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293274 (= res!242185 (validate_offset_bits!1 ((_ sign_extend 32) (size!7588 (buf!7651 thiss!1728))) ((_ sign_extend 32) (currentByte!14115 thiss!1728)) ((_ sign_extend 32) (currentBit!14110 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!293277 () Bool)

(declare-fun e!209409 () Bool)

(declare-fun array_inv!7200 (array!17510) Bool)

(assert (=> b!293277 (= e!209409 (array_inv!7200 (buf!7651 thiss!1728)))))

(declare-fun res!242184 () Bool)

(assert (=> start!65362 (=> (not res!242184) (not e!209411))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17510)

(assert (=> start!65362 (= res!242184 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7588 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65362 e!209411))

(declare-fun inv!12 (BitStream!13180) Bool)

(assert (=> start!65362 (and (inv!12 thiss!1728) e!209409)))

(assert (=> start!65362 true))

(assert (=> start!65362 (array_inv!7200 arr!273)))

(declare-fun b!293276 () Bool)

(declare-fun lt!425243 () (_ BitVec 32))

(assert (=> b!293276 (= e!209411 (or (bvslt lt!425243 #b00000000000000000000000000000000) (bvsge lt!425243 (size!7588 arr!273))))))

(assert (=> b!293276 (= lt!425243 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-datatypes ((tuple2!23006 0))(
  ( (tuple2!23007 (_1!12808 Bool) (_2!12808 BitStream!13180)) )
))
(declare-fun lt!425244 () tuple2!23006)

(declare-fun readBit!0 (BitStream!13180) tuple2!23006)

(assert (=> b!293276 (= lt!425244 (readBit!0 thiss!1728))))

(declare-fun b!293275 () Bool)

(declare-fun res!242186 () Bool)

(assert (=> b!293275 (=> (not res!242186) (not e!209411))))

(assert (=> b!293275 (= res!242186 (bvslt from!505 to!474))))

(assert (= (and start!65362 res!242184) b!293274))

(assert (= (and b!293274 res!242185) b!293275))

(assert (= (and b!293275 res!242186) b!293276))

(assert (= start!65362 b!293277))

(declare-fun m!428815 () Bool)

(assert (=> b!293274 m!428815))

(declare-fun m!428817 () Bool)

(assert (=> b!293277 m!428817))

(declare-fun m!428819 () Bool)

(assert (=> start!65362 m!428819))

(declare-fun m!428821 () Bool)

(assert (=> start!65362 m!428821))

(declare-fun m!428823 () Bool)

(assert (=> b!293276 m!428823))

(push 1)

(assert (not start!65362))

(assert (not b!293274))

(assert (not b!293277))

(assert (not b!293276))

(check-sat)

(pop 1)

(push 1)

(check-sat)

