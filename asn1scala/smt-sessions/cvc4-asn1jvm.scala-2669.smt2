; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65384 () Bool)

(assert start!65384)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun e!209541 () Bool)

(declare-fun b!293408 () Bool)

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17532 0))(
  ( (array!17533 (arr!8625 (Array (_ BitVec 32) (_ BitVec 8))) (size!7599 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13202 0))(
  ( (BitStream!13203 (buf!7662 array!17532) (currentByte!14126 (_ BitVec 32)) (currentBit!14121 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!23028 0))(
  ( (tuple2!23029 (_1!12819 Bool) (_2!12819 BitStream!13202)) )
))
(declare-fun lt!425283 () tuple2!23028)

(declare-fun thiss!1728 () BitStream!13202)

(assert (=> b!293408 (= e!209541 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)) (not (= (size!7599 (buf!7662 thiss!1728)) (size!7599 (buf!7662 (_2!12819 lt!425283)))))))))

(declare-fun readBit!0 (BitStream!13202) tuple2!23028)

(assert (=> b!293408 (= lt!425283 (readBit!0 thiss!1728))))

(declare-fun res!242283 () Bool)

(assert (=> start!65384 (=> (not res!242283) (not e!209541))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17532)

(assert (=> start!65384 (= res!242283 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7599 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65384 e!209541))

(declare-fun e!209544 () Bool)

(declare-fun inv!12 (BitStream!13202) Bool)

(assert (=> start!65384 (and (inv!12 thiss!1728) e!209544)))

(assert (=> start!65384 true))

(declare-fun array_inv!7211 (array!17532) Bool)

(assert (=> start!65384 (array_inv!7211 arr!273)))

(declare-fun b!293409 () Bool)

(assert (=> b!293409 (= e!209544 (array_inv!7211 (buf!7662 thiss!1728)))))

(declare-fun b!293407 () Bool)

(declare-fun res!242284 () Bool)

(assert (=> b!293407 (=> (not res!242284) (not e!209541))))

(assert (=> b!293407 (= res!242284 (bvslt from!505 to!474))))

(declare-fun b!293406 () Bool)

(declare-fun res!242285 () Bool)

(assert (=> b!293406 (=> (not res!242285) (not e!209541))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293406 (= res!242285 (validate_offset_bits!1 ((_ sign_extend 32) (size!7599 (buf!7662 thiss!1728))) ((_ sign_extend 32) (currentByte!14126 thiss!1728)) ((_ sign_extend 32) (currentBit!14121 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!65384 res!242283) b!293406))

(assert (= (and b!293406 res!242285) b!293407))

(assert (= (and b!293407 res!242284) b!293408))

(assert (= start!65384 b!293409))

(declare-fun m!428925 () Bool)

(assert (=> b!293408 m!428925))

(declare-fun m!428927 () Bool)

(assert (=> start!65384 m!428927))

(declare-fun m!428929 () Bool)

(assert (=> start!65384 m!428929))

(declare-fun m!428931 () Bool)

(assert (=> b!293409 m!428931))

(declare-fun m!428933 () Bool)

(assert (=> b!293406 m!428933))

(push 1)

(assert (not b!293406))

(assert (not start!65384))

(assert (not b!293408))

(assert (not b!293409))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

