; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65324 () Bool)

(assert start!65324)

(declare-fun b!293039 () Bool)

(declare-fun e!209172 () Bool)

(declare-fun from!505 () (_ BitVec 64))

(assert (=> b!293039 (= e!209172 (and (bvslt (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000)))))

(declare-datatypes ((array!17472 0))(
  ( (array!17473 (arr!8595 (Array (_ BitVec 32) (_ BitVec 8))) (size!7569 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13142 0))(
  ( (BitStream!13143 (buf!7632 array!17472) (currentByte!14096 (_ BitVec 32)) (currentBit!14091 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22968 0))(
  ( (tuple2!22969 (_1!12789 Bool) (_2!12789 BitStream!13142)) )
))
(declare-fun lt!425166 () tuple2!22968)

(declare-fun thiss!1728 () BitStream!13142)

(declare-fun readBit!0 (BitStream!13142) tuple2!22968)

(assert (=> b!293039 (= lt!425166 (readBit!0 thiss!1728))))

(declare-fun b!293038 () Bool)

(declare-fun res!242005 () Bool)

(assert (=> b!293038 (=> (not res!242005) (not e!209172))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!293038 (= res!242005 (bvslt from!505 to!474))))

(declare-fun b!293037 () Bool)

(declare-fun res!242006 () Bool)

(assert (=> b!293037 (=> (not res!242006) (not e!209172))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293037 (= res!242006 (validate_offset_bits!1 ((_ sign_extend 32) (size!7569 (buf!7632 thiss!1728))) ((_ sign_extend 32) (currentByte!14096 thiss!1728)) ((_ sign_extend 32) (currentBit!14091 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!293040 () Bool)

(declare-fun e!209175 () Bool)

(declare-fun array_inv!7181 (array!17472) Bool)

(assert (=> b!293040 (= e!209175 (array_inv!7181 (buf!7632 thiss!1728)))))

(declare-fun res!242004 () Bool)

(assert (=> start!65324 (=> (not res!242004) (not e!209172))))

(declare-fun arr!273 () array!17472)

(assert (=> start!65324 (= res!242004 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7569 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65324 e!209172))

(declare-fun inv!12 (BitStream!13142) Bool)

(assert (=> start!65324 (and (inv!12 thiss!1728) e!209175)))

(assert (=> start!65324 true))

(assert (=> start!65324 (array_inv!7181 arr!273)))

(assert (= (and start!65324 res!242004) b!293037))

(assert (= (and b!293037 res!242006) b!293038))

(assert (= (and b!293038 res!242005) b!293039))

(assert (= start!65324 b!293040))

(declare-fun m!428625 () Bool)

(assert (=> b!293039 m!428625))

(declare-fun m!428627 () Bool)

(assert (=> b!293037 m!428627))

(declare-fun m!428629 () Bool)

(assert (=> b!293040 m!428629))

(declare-fun m!428631 () Bool)

(assert (=> start!65324 m!428631))

(declare-fun m!428633 () Bool)

(assert (=> start!65324 m!428633))

(push 1)

(assert (not b!293039))

(assert (not b!293040))

(assert (not start!65324))

(assert (not b!293037))

(check-sat)

(pop 1)

(push 1)

(check-sat)

