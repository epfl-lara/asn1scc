; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65354 () Bool)

(assert start!65354)

(declare-fun b!293227 () Bool)

(declare-fun res!242148 () Bool)

(declare-fun e!209361 () Bool)

(assert (=> b!293227 (=> (not res!242148) (not e!209361))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!293227 (= res!242148 (bvslt from!505 to!474))))

(declare-fun b!293228 () Bool)

(declare-fun lt!425219 () (_ BitVec 32))

(declare-datatypes ((array!17502 0))(
  ( (array!17503 (arr!8610 (Array (_ BitVec 32) (_ BitVec 8))) (size!7584 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17502)

(assert (=> b!293228 (= e!209361 (or (bvslt lt!425219 #b00000000000000000000000000000000) (bvsge lt!425219 (size!7584 arr!273))))))

(assert (=> b!293228 (= lt!425219 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-datatypes ((BitStream!13172 0))(
  ( (BitStream!13173 (buf!7647 array!17502) (currentByte!14111 (_ BitVec 32)) (currentBit!14106 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22998 0))(
  ( (tuple2!22999 (_1!12804 Bool) (_2!12804 BitStream!13172)) )
))
(declare-fun lt!425220 () tuple2!22998)

(declare-fun thiss!1728 () BitStream!13172)

(declare-fun readBit!0 (BitStream!13172) tuple2!22998)

(assert (=> b!293228 (= lt!425220 (readBit!0 thiss!1728))))

(declare-fun b!293229 () Bool)

(declare-fun e!209362 () Bool)

(declare-fun array_inv!7196 (array!17502) Bool)

(assert (=> b!293229 (= e!209362 (array_inv!7196 (buf!7647 thiss!1728)))))

(declare-fun b!293226 () Bool)

(declare-fun res!242149 () Bool)

(assert (=> b!293226 (=> (not res!242149) (not e!209361))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293226 (= res!242149 (validate_offset_bits!1 ((_ sign_extend 32) (size!7584 (buf!7647 thiss!1728))) ((_ sign_extend 32) (currentByte!14111 thiss!1728)) ((_ sign_extend 32) (currentBit!14106 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!242150 () Bool)

(assert (=> start!65354 (=> (not res!242150) (not e!209361))))

(assert (=> start!65354 (= res!242150 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7584 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65354 e!209361))

(declare-fun inv!12 (BitStream!13172) Bool)

(assert (=> start!65354 (and (inv!12 thiss!1728) e!209362)))

(assert (=> start!65354 true))

(assert (=> start!65354 (array_inv!7196 arr!273)))

(assert (= (and start!65354 res!242150) b!293226))

(assert (= (and b!293226 res!242149) b!293227))

(assert (= (and b!293227 res!242148) b!293228))

(assert (= start!65354 b!293229))

(declare-fun m!428775 () Bool)

(assert (=> b!293228 m!428775))

(declare-fun m!428777 () Bool)

(assert (=> b!293229 m!428777))

(declare-fun m!428779 () Bool)

(assert (=> b!293226 m!428779))

(declare-fun m!428781 () Bool)

(assert (=> start!65354 m!428781))

(declare-fun m!428783 () Bool)

(assert (=> start!65354 m!428783))

(push 1)

(assert (not b!293228))

(assert (not start!65354))

(assert (not b!293226))

(assert (not b!293229))

(check-sat)

(pop 1)

(push 1)

(check-sat)

