; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65360 () Bool)

(assert start!65360)

(declare-fun b!293264 () Bool)

(declare-fun e!209397 () Bool)

(declare-fun lt!425237 () (_ BitVec 32))

(assert (=> b!293264 (= e!209397 (or (bvslt lt!425237 #b00000000000000000000000000000000) (bvsge lt!425237 #b00000000000000000000000000001000)))))

(declare-fun from!505 () (_ BitVec 64))

(assert (=> b!293264 (= lt!425237 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-datatypes ((array!17508 0))(
  ( (array!17509 (arr!8613 (Array (_ BitVec 32) (_ BitVec 8))) (size!7587 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13178 0))(
  ( (BitStream!13179 (buf!7650 array!17508) (currentByte!14114 (_ BitVec 32)) (currentBit!14109 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!23004 0))(
  ( (tuple2!23005 (_1!12807 Bool) (_2!12807 BitStream!13178)) )
))
(declare-fun lt!425238 () tuple2!23004)

(declare-fun thiss!1728 () BitStream!13178)

(declare-fun readBit!0 (BitStream!13178) tuple2!23004)

(assert (=> b!293264 (= lt!425238 (readBit!0 thiss!1728))))

(declare-fun b!293262 () Bool)

(declare-fun res!242176 () Bool)

(assert (=> b!293262 (=> (not res!242176) (not e!209397))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293262 (= res!242176 (validate_offset_bits!1 ((_ sign_extend 32) (size!7587 (buf!7650 thiss!1728))) ((_ sign_extend 32) (currentByte!14114 thiss!1728)) ((_ sign_extend 32) (currentBit!14109 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!293265 () Bool)

(declare-fun e!209399 () Bool)

(declare-fun array_inv!7199 (array!17508) Bool)

(assert (=> b!293265 (= e!209399 (array_inv!7199 (buf!7650 thiss!1728)))))

(declare-fun res!242177 () Bool)

(assert (=> start!65360 (=> (not res!242177) (not e!209397))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17508)

(assert (=> start!65360 (= res!242177 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7587 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65360 e!209397))

(declare-fun inv!12 (BitStream!13178) Bool)

(assert (=> start!65360 (and (inv!12 thiss!1728) e!209399)))

(assert (=> start!65360 true))

(assert (=> start!65360 (array_inv!7199 arr!273)))

(declare-fun b!293263 () Bool)

(declare-fun res!242175 () Bool)

(assert (=> b!293263 (=> (not res!242175) (not e!209397))))

(assert (=> b!293263 (= res!242175 (bvslt from!505 to!474))))

(assert (= (and start!65360 res!242177) b!293262))

(assert (= (and b!293262 res!242176) b!293263))

(assert (= (and b!293263 res!242175) b!293264))

(assert (= start!65360 b!293265))

(declare-fun m!428805 () Bool)

(assert (=> b!293264 m!428805))

(declare-fun m!428807 () Bool)

(assert (=> b!293262 m!428807))

(declare-fun m!428809 () Bool)

(assert (=> b!293265 m!428809))

(declare-fun m!428811 () Bool)

(assert (=> start!65360 m!428811))

(declare-fun m!428813 () Bool)

(assert (=> start!65360 m!428813))

(push 1)

(assert (not b!293265))

(assert (not b!293264))

(assert (not start!65360))

(assert (not b!293262))

(check-sat)

(pop 1)

(push 1)

(check-sat)

