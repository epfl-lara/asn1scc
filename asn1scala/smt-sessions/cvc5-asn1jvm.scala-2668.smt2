; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65374 () Bool)

(assert start!65374)

(declare-fun b!293349 () Bool)

(declare-fun e!209483 () Bool)

(declare-datatypes ((array!17522 0))(
  ( (array!17523 (arr!8620 (Array (_ BitVec 32) (_ BitVec 8))) (size!7594 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13192 0))(
  ( (BitStream!13193 (buf!7657 array!17522) (currentByte!14121 (_ BitVec 32)) (currentBit!14116 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13192)

(declare-fun array_inv!7206 (array!17522) Bool)

(assert (=> b!293349 (= e!209483 (array_inv!7206 (buf!7657 thiss!1728)))))

(declare-fun b!293348 () Bool)

(declare-fun e!209482 () Bool)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(assert (=> b!293348 (= e!209482 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)))))

(declare-datatypes ((tuple2!23018 0))(
  ( (tuple2!23019 (_1!12814 Bool) (_2!12814 BitStream!13192)) )
))
(declare-fun lt!425268 () tuple2!23018)

(declare-fun readBit!0 (BitStream!13192) tuple2!23018)

(assert (=> b!293348 (= lt!425268 (readBit!0 thiss!1728))))

(declare-fun b!293346 () Bool)

(declare-fun res!242240 () Bool)

(assert (=> b!293346 (=> (not res!242240) (not e!209482))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293346 (= res!242240 (validate_offset_bits!1 ((_ sign_extend 32) (size!7594 (buf!7657 thiss!1728))) ((_ sign_extend 32) (currentByte!14121 thiss!1728)) ((_ sign_extend 32) (currentBit!14116 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!242238 () Bool)

(assert (=> start!65374 (=> (not res!242238) (not e!209482))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17522)

(assert (=> start!65374 (= res!242238 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7594 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65374 e!209482))

(declare-fun inv!12 (BitStream!13192) Bool)

(assert (=> start!65374 (and (inv!12 thiss!1728) e!209483)))

(assert (=> start!65374 true))

(assert (=> start!65374 (array_inv!7206 arr!273)))

(declare-fun b!293347 () Bool)

(declare-fun res!242239 () Bool)

(assert (=> b!293347 (=> (not res!242239) (not e!209482))))

(assert (=> b!293347 (= res!242239 (bvslt from!505 to!474))))

(assert (= (and start!65374 res!242238) b!293346))

(assert (= (and b!293346 res!242240) b!293347))

(assert (= (and b!293347 res!242239) b!293348))

(assert (= start!65374 b!293349))

(declare-fun m!428875 () Bool)

(assert (=> b!293349 m!428875))

(declare-fun m!428877 () Bool)

(assert (=> b!293348 m!428877))

(declare-fun m!428879 () Bool)

(assert (=> b!293346 m!428879))

(declare-fun m!428881 () Bool)

(assert (=> start!65374 m!428881))

(declare-fun m!428883 () Bool)

(assert (=> start!65374 m!428883))

(push 1)

(assert (not start!65374))

(assert (not b!293346))

(assert (not b!293349))

(assert (not b!293348))

(check-sat)

(pop 1)

(push 1)

(check-sat)

