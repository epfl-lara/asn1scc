; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65342 () Bool)

(assert start!65342)

(declare-fun b!293147 () Bool)

(declare-fun e!209282 () Bool)

(declare-fun from!505 () (_ BitVec 64))

(assert (=> b!293147 (= e!209282 (and (bvslt (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000)))))

(declare-datatypes ((array!17490 0))(
  ( (array!17491 (arr!8604 (Array (_ BitVec 32) (_ BitVec 8))) (size!7578 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13160 0))(
  ( (BitStream!13161 (buf!7641 array!17490) (currentByte!14105 (_ BitVec 32)) (currentBit!14100 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22986 0))(
  ( (tuple2!22987 (_1!12798 Bool) (_2!12798 BitStream!13160)) )
))
(declare-fun lt!425193 () tuple2!22986)

(declare-fun thiss!1728 () BitStream!13160)

(declare-fun readBit!0 (BitStream!13160) tuple2!22986)

(assert (=> b!293147 (= lt!425193 (readBit!0 thiss!1728))))

(declare-fun b!293145 () Bool)

(declare-fun res!242085 () Bool)

(assert (=> b!293145 (=> (not res!242085) (not e!209282))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293145 (= res!242085 (validate_offset_bits!1 ((_ sign_extend 32) (size!7578 (buf!7641 thiss!1728))) ((_ sign_extend 32) (currentByte!14105 thiss!1728)) ((_ sign_extend 32) (currentBit!14100 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!293148 () Bool)

(declare-fun e!209283 () Bool)

(declare-fun array_inv!7190 (array!17490) Bool)

(assert (=> b!293148 (= e!209283 (array_inv!7190 (buf!7641 thiss!1728)))))

(declare-fun res!242087 () Bool)

(assert (=> start!65342 (=> (not res!242087) (not e!209282))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17490)

(assert (=> start!65342 (= res!242087 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7578 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65342 e!209282))

(declare-fun inv!12 (BitStream!13160) Bool)

(assert (=> start!65342 (and (inv!12 thiss!1728) e!209283)))

(assert (=> start!65342 true))

(assert (=> start!65342 (array_inv!7190 arr!273)))

(declare-fun b!293146 () Bool)

(declare-fun res!242086 () Bool)

(assert (=> b!293146 (=> (not res!242086) (not e!209282))))

(assert (=> b!293146 (= res!242086 (bvslt from!505 to!474))))

(assert (= (and start!65342 res!242087) b!293145))

(assert (= (and b!293145 res!242085) b!293146))

(assert (= (and b!293146 res!242086) b!293147))

(assert (= start!65342 b!293148))

(declare-fun m!428715 () Bool)

(assert (=> b!293147 m!428715))

(declare-fun m!428717 () Bool)

(assert (=> b!293145 m!428717))

(declare-fun m!428719 () Bool)

(assert (=> b!293148 m!428719))

(declare-fun m!428721 () Bool)

(assert (=> start!65342 m!428721))

(declare-fun m!428723 () Bool)

(assert (=> start!65342 m!428723))

(push 1)

(assert (not b!293145))

(assert (not start!65342))

(assert (not b!293148))

(assert (not b!293147))

(check-sat)

(pop 1)

(push 1)

(check-sat)

