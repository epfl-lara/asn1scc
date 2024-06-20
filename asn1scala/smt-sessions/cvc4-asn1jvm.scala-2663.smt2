; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65348 () Bool)

(assert start!65348)

(declare-fun b!293189 () Bool)

(declare-fun e!209328 () Bool)

(declare-fun e!209327 () Bool)

(assert (=> b!293189 (= e!209328 e!209327)))

(declare-fun res!242121 () Bool)

(assert (=> b!293189 (=> (not res!242121) (not e!209327))))

(declare-datatypes ((array!17496 0))(
  ( (array!17497 (arr!8607 (Array (_ BitVec 32) (_ BitVec 8))) (size!7581 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13166 0))(
  ( (BitStream!13167 (buf!7644 array!17496) (currentByte!14108 (_ BitVec 32)) (currentBit!14103 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13166)

(declare-datatypes ((tuple2!22992 0))(
  ( (tuple2!22993 (_1!12801 Bool) (_2!12801 BitStream!13166)) )
))
(declare-fun readBit!0 (BitStream!13166) tuple2!22992)

(assert (=> b!293189 (= res!242121 (_1!12801 (readBit!0 thiss!1728)))))

(declare-fun lt!425202 () (_ BitVec 32))

(declare-fun from!505 () (_ BitVec 64))

(assert (=> b!293189 (= lt!425202 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun res!242122 () Bool)

(assert (=> start!65348 (=> (not res!242122) (not e!209328))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17496)

(assert (=> start!65348 (= res!242122 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7581 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65348 e!209328))

(declare-fun e!209326 () Bool)

(declare-fun inv!12 (BitStream!13166) Bool)

(assert (=> start!65348 (and (inv!12 thiss!1728) e!209326)))

(assert (=> start!65348 true))

(declare-fun array_inv!7193 (array!17496) Bool)

(assert (=> start!65348 (array_inv!7193 arr!273)))

(declare-fun b!293190 () Bool)

(declare-fun res!242120 () Bool)

(assert (=> b!293190 (=> (not res!242120) (not e!209328))))

(assert (=> b!293190 (= res!242120 (bvslt from!505 to!474))))

(declare-fun b!293191 () Bool)

(assert (=> b!293191 (= e!209326 (array_inv!7193 (buf!7644 thiss!1728)))))

(declare-fun b!293192 () Bool)

(declare-fun res!242123 () Bool)

(assert (=> b!293192 (=> (not res!242123) (not e!209328))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293192 (= res!242123 (validate_offset_bits!1 ((_ sign_extend 32) (size!7581 (buf!7644 thiss!1728))) ((_ sign_extend 32) (currentByte!14108 thiss!1728)) ((_ sign_extend 32) (currentBit!14103 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!293193 () Bool)

(assert (=> b!293193 (= e!209327 (or (bvslt lt!425202 #b00000000000000000000000000000000) (bvsge lt!425202 #b00000000000000000000000000001000)))))

(assert (= (and start!65348 res!242122) b!293192))

(assert (= (and b!293192 res!242123) b!293190))

(assert (= (and b!293190 res!242120) b!293189))

(assert (= (and b!293189 res!242121) b!293193))

(assert (= start!65348 b!293191))

(declare-fun m!428745 () Bool)

(assert (=> b!293189 m!428745))

(declare-fun m!428747 () Bool)

(assert (=> start!65348 m!428747))

(declare-fun m!428749 () Bool)

(assert (=> start!65348 m!428749))

(declare-fun m!428751 () Bool)

(assert (=> b!293191 m!428751))

(declare-fun m!428753 () Bool)

(assert (=> b!293192 m!428753))

(push 1)

(assert (not b!293191))

(assert (not start!65348))

(assert (not b!293189))

(assert (not b!293192))

(check-sat)

(pop 1)

(push 1)

(check-sat)

