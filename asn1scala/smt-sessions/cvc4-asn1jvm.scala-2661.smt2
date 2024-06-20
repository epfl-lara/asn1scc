; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65336 () Bool)

(assert start!65336)

(declare-fun b!293109 () Bool)

(declare-fun res!242058 () Bool)

(declare-fun e!209246 () Bool)

(assert (=> b!293109 (=> (not res!242058) (not e!209246))))

(declare-datatypes ((array!17484 0))(
  ( (array!17485 (arr!8601 (Array (_ BitVec 32) (_ BitVec 8))) (size!7575 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13154 0))(
  ( (BitStream!13155 (buf!7638 array!17484) (currentByte!14102 (_ BitVec 32)) (currentBit!14097 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13154)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293109 (= res!242058 (validate_offset_bits!1 ((_ sign_extend 32) (size!7575 (buf!7638 thiss!1728))) ((_ sign_extend 32) (currentByte!14102 thiss!1728)) ((_ sign_extend 32) (currentBit!14097 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!293111 () Bool)

(assert (=> b!293111 (= e!209246 (bvsge (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(declare-datatypes ((tuple2!22980 0))(
  ( (tuple2!22981 (_1!12795 Bool) (_2!12795 BitStream!13154)) )
))
(declare-fun lt!425184 () tuple2!22980)

(declare-fun readBit!0 (BitStream!13154) tuple2!22980)

(assert (=> b!293111 (= lt!425184 (readBit!0 thiss!1728))))

(declare-fun b!293112 () Bool)

(declare-fun e!209247 () Bool)

(declare-fun array_inv!7187 (array!17484) Bool)

(assert (=> b!293112 (= e!209247 (array_inv!7187 (buf!7638 thiss!1728)))))

(declare-fun res!242059 () Bool)

(assert (=> start!65336 (=> (not res!242059) (not e!209246))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17484)

(assert (=> start!65336 (= res!242059 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7575 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65336 e!209246))

(declare-fun inv!12 (BitStream!13154) Bool)

(assert (=> start!65336 (and (inv!12 thiss!1728) e!209247)))

(assert (=> start!65336 true))

(assert (=> start!65336 (array_inv!7187 arr!273)))

(declare-fun b!293110 () Bool)

(declare-fun res!242060 () Bool)

(assert (=> b!293110 (=> (not res!242060) (not e!209246))))

(assert (=> b!293110 (= res!242060 (bvslt from!505 to!474))))

(assert (= (and start!65336 res!242059) b!293109))

(assert (= (and b!293109 res!242058) b!293110))

(assert (= (and b!293110 res!242060) b!293111))

(assert (= start!65336 b!293112))

(declare-fun m!428685 () Bool)

(assert (=> b!293109 m!428685))

(declare-fun m!428687 () Bool)

(assert (=> b!293111 m!428687))

(declare-fun m!428689 () Bool)

(assert (=> b!293112 m!428689))

(declare-fun m!428691 () Bool)

(assert (=> start!65336 m!428691))

(declare-fun m!428693 () Bool)

(assert (=> start!65336 m!428693))

(push 1)

(assert (not b!293109))

(assert (not start!65336))

(assert (not b!293112))

(assert (not b!293111))

(check-sat)

(pop 1)

(push 1)

(check-sat)

