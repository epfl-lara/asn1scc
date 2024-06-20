; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65352 () Bool)

(assert start!65352)

(declare-fun b!293214 () Bool)

(declare-fun res!242139 () Bool)

(declare-fun e!209351 () Bool)

(assert (=> b!293214 (=> (not res!242139) (not e!209351))))

(declare-datatypes ((array!17500 0))(
  ( (array!17501 (arr!8609 (Array (_ BitVec 32) (_ BitVec 8))) (size!7583 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13170 0))(
  ( (BitStream!13171 (buf!7646 array!17500) (currentByte!14110 (_ BitVec 32)) (currentBit!14105 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13170)

(declare-fun from!505 () (_ BitVec 64))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293214 (= res!242139 (validate_offset_bits!1 ((_ sign_extend 32) (size!7583 (buf!7646 thiss!1728))) ((_ sign_extend 32) (currentByte!14110 thiss!1728)) ((_ sign_extend 32) (currentBit!14105 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!293217 () Bool)

(declare-fun e!209350 () Bool)

(declare-fun array_inv!7195 (array!17500) Bool)

(assert (=> b!293217 (= e!209350 (array_inv!7195 (buf!7646 thiss!1728)))))

(declare-fun b!293216 () Bool)

(declare-fun lt!425213 () (_ BitVec 32))

(declare-fun arr!273 () array!17500)

(assert (=> b!293216 (= e!209351 (or (bvslt lt!425213 #b00000000000000000000000000000000) (bvsge lt!425213 (size!7583 arr!273))))))

(assert (=> b!293216 (= lt!425213 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-datatypes ((tuple2!22996 0))(
  ( (tuple2!22997 (_1!12803 Bool) (_2!12803 BitStream!13170)) )
))
(declare-fun lt!425214 () tuple2!22996)

(declare-fun readBit!0 (BitStream!13170) tuple2!22996)

(assert (=> b!293216 (= lt!425214 (readBit!0 thiss!1728))))

(declare-fun res!242141 () Bool)

(assert (=> start!65352 (=> (not res!242141) (not e!209351))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> start!65352 (= res!242141 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7583 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65352 e!209351))

(declare-fun inv!12 (BitStream!13170) Bool)

(assert (=> start!65352 (and (inv!12 thiss!1728) e!209350)))

(assert (=> start!65352 true))

(assert (=> start!65352 (array_inv!7195 arr!273)))

(declare-fun b!293215 () Bool)

(declare-fun res!242140 () Bool)

(assert (=> b!293215 (=> (not res!242140) (not e!209351))))

(assert (=> b!293215 (= res!242140 (bvslt from!505 to!474))))

(assert (= (and start!65352 res!242141) b!293214))

(assert (= (and b!293214 res!242139) b!293215))

(assert (= (and b!293215 res!242140) b!293216))

(assert (= start!65352 b!293217))

(declare-fun m!428765 () Bool)

(assert (=> b!293214 m!428765))

(declare-fun m!428767 () Bool)

(assert (=> b!293217 m!428767))

(declare-fun m!428769 () Bool)

(assert (=> b!293216 m!428769))

(declare-fun m!428771 () Bool)

(assert (=> start!65352 m!428771))

(declare-fun m!428773 () Bool)

(assert (=> start!65352 m!428773))

(check-sat (not b!293217) (not b!293216) (not start!65352) (not b!293214))
(check-sat)
