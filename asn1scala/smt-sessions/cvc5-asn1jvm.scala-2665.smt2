; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65356 () Bool)

(assert start!65356)

(declare-fun b!293240 () Bool)

(declare-fun e!209373 () Bool)

(declare-fun lt!425226 () (_ BitVec 32))

(assert (=> b!293240 (= e!209373 (or (bvslt lt!425226 #b00000000000000000000000000000000) (bvsge lt!425226 #b00000000000000000000000000001000)))))

(declare-fun from!505 () (_ BitVec 64))

(assert (=> b!293240 (= lt!425226 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-datatypes ((array!17504 0))(
  ( (array!17505 (arr!8611 (Array (_ BitVec 32) (_ BitVec 8))) (size!7585 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13174 0))(
  ( (BitStream!13175 (buf!7648 array!17504) (currentByte!14112 (_ BitVec 32)) (currentBit!14107 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!23000 0))(
  ( (tuple2!23001 (_1!12805 Bool) (_2!12805 BitStream!13174)) )
))
(declare-fun lt!425225 () tuple2!23000)

(declare-fun thiss!1728 () BitStream!13174)

(declare-fun readBit!0 (BitStream!13174) tuple2!23000)

(assert (=> b!293240 (= lt!425225 (readBit!0 thiss!1728))))

(declare-fun b!293239 () Bool)

(declare-fun res!242159 () Bool)

(assert (=> b!293239 (=> (not res!242159) (not e!209373))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!293239 (= res!242159 (bvslt from!505 to!474))))

(declare-fun res!242158 () Bool)

(assert (=> start!65356 (=> (not res!242158) (not e!209373))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun arr!273 () array!17504)

(assert (=> start!65356 (= res!242158 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7585 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65356 e!209373))

(declare-fun e!209376 () Bool)

(declare-fun inv!12 (BitStream!13174) Bool)

(assert (=> start!65356 (and (inv!12 thiss!1728) e!209376)))

(assert (=> start!65356 true))

(declare-fun array_inv!7197 (array!17504) Bool)

(assert (=> start!65356 (array_inv!7197 arr!273)))

(declare-fun b!293241 () Bool)

(assert (=> b!293241 (= e!209376 (array_inv!7197 (buf!7648 thiss!1728)))))

(declare-fun b!293238 () Bool)

(declare-fun res!242157 () Bool)

(assert (=> b!293238 (=> (not res!242157) (not e!209373))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293238 (= res!242157 (validate_offset_bits!1 ((_ sign_extend 32) (size!7585 (buf!7648 thiss!1728))) ((_ sign_extend 32) (currentByte!14112 thiss!1728)) ((_ sign_extend 32) (currentBit!14107 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!65356 res!242158) b!293238))

(assert (= (and b!293238 res!242157) b!293239))

(assert (= (and b!293239 res!242159) b!293240))

(assert (= start!65356 b!293241))

(declare-fun m!428785 () Bool)

(assert (=> b!293240 m!428785))

(declare-fun m!428787 () Bool)

(assert (=> start!65356 m!428787))

(declare-fun m!428789 () Bool)

(assert (=> start!65356 m!428789))

(declare-fun m!428791 () Bool)

(assert (=> b!293241 m!428791))

(declare-fun m!428793 () Bool)

(assert (=> b!293238 m!428793))

(push 1)

(assert (not b!293238))

(assert (not b!293241))

(assert (not b!293240))

(assert (not start!65356))

(check-sat)

(pop 1)

(push 1)

(check-sat)

