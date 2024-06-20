; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65358 () Bool)

(assert start!65358)

(declare-fun res!242168 () Bool)

(declare-fun e!209388 () Bool)

(assert (=> start!65358 (=> (not res!242168) (not e!209388))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17506 0))(
  ( (array!17507 (arr!8612 (Array (_ BitVec 32) (_ BitVec 8))) (size!7586 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17506)

(assert (=> start!65358 (= res!242168 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7586 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65358 e!209388))

(declare-datatypes ((BitStream!13176 0))(
  ( (BitStream!13177 (buf!7649 array!17506) (currentByte!14113 (_ BitVec 32)) (currentBit!14108 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13176)

(declare-fun e!209387 () Bool)

(declare-fun inv!12 (BitStream!13176) Bool)

(assert (=> start!65358 (and (inv!12 thiss!1728) e!209387)))

(assert (=> start!65358 true))

(declare-fun array_inv!7198 (array!17506) Bool)

(assert (=> start!65358 (array_inv!7198 arr!273)))

(declare-fun b!293250 () Bool)

(declare-fun res!242167 () Bool)

(assert (=> b!293250 (=> (not res!242167) (not e!209388))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293250 (= res!242167 (validate_offset_bits!1 ((_ sign_extend 32) (size!7586 (buf!7649 thiss!1728))) ((_ sign_extend 32) (currentByte!14113 thiss!1728)) ((_ sign_extend 32) (currentBit!14108 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!293251 () Bool)

(declare-fun res!242166 () Bool)

(assert (=> b!293251 (=> (not res!242166) (not e!209388))))

(assert (=> b!293251 (= res!242166 (bvslt from!505 to!474))))

(declare-fun b!293252 () Bool)

(declare-fun lt!425231 () (_ BitVec 32))

(assert (=> b!293252 (= e!209388 (or (bvslt lt!425231 #b00000000000000000000000000000000) (bvsge lt!425231 #b00000000000000000000000000001000)))))

(assert (=> b!293252 (= lt!425231 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-datatypes ((tuple2!23002 0))(
  ( (tuple2!23003 (_1!12806 Bool) (_2!12806 BitStream!13176)) )
))
(declare-fun lt!425232 () tuple2!23002)

(declare-fun readBit!0 (BitStream!13176) tuple2!23002)

(assert (=> b!293252 (= lt!425232 (readBit!0 thiss!1728))))

(declare-fun b!293253 () Bool)

(assert (=> b!293253 (= e!209387 (array_inv!7198 (buf!7649 thiss!1728)))))

(assert (= (and start!65358 res!242168) b!293250))

(assert (= (and b!293250 res!242167) b!293251))

(assert (= (and b!293251 res!242166) b!293252))

(assert (= start!65358 b!293253))

(declare-fun m!428795 () Bool)

(assert (=> start!65358 m!428795))

(declare-fun m!428797 () Bool)

(assert (=> start!65358 m!428797))

(declare-fun m!428799 () Bool)

(assert (=> b!293250 m!428799))

(declare-fun m!428801 () Bool)

(assert (=> b!293252 m!428801))

(declare-fun m!428803 () Bool)

(assert (=> b!293253 m!428803))

(check-sat (not b!293253) (not b!293252) (not start!65358) (not b!293250))
(check-sat)
