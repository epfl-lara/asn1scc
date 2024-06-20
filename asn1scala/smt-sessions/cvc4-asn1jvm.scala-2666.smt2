; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65366 () Bool)

(assert start!65366)

(declare-fun b!293298 () Bool)

(declare-fun res!242204 () Bool)

(declare-fun e!209435 () Bool)

(assert (=> b!293298 (=> (not res!242204) (not e!209435))))

(declare-datatypes ((array!17514 0))(
  ( (array!17515 (arr!8616 (Array (_ BitVec 32) (_ BitVec 8))) (size!7590 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13184 0))(
  ( (BitStream!13185 (buf!7653 array!17514) (currentByte!14117 (_ BitVec 32)) (currentBit!14112 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13184)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293298 (= res!242204 (validate_offset_bits!1 ((_ sign_extend 32) (size!7590 (buf!7653 thiss!1728))) ((_ sign_extend 32) (currentByte!14117 thiss!1728)) ((_ sign_extend 32) (currentBit!14112 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!293301 () Bool)

(declare-fun e!209434 () Bool)

(declare-fun array_inv!7202 (array!17514) Bool)

(assert (=> b!293301 (= e!209434 (array_inv!7202 (buf!7653 thiss!1728)))))

(declare-fun b!293299 () Bool)

(declare-fun res!242203 () Bool)

(assert (=> b!293299 (=> (not res!242203) (not e!209435))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!293299 (= res!242203 (bvslt from!505 to!474))))

(declare-fun b!293300 () Bool)

(declare-fun lt!425255 () (_ BitVec 32))

(declare-fun arr!273 () array!17514)

(assert (=> b!293300 (= e!209435 (or (bvslt lt!425255 #b00000000000000000000000000000000) (bvsge lt!425255 (size!7590 arr!273))))))

(assert (=> b!293300 (= lt!425255 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-datatypes ((tuple2!23010 0))(
  ( (tuple2!23011 (_1!12810 Bool) (_2!12810 BitStream!13184)) )
))
(declare-fun lt!425256 () tuple2!23010)

(declare-fun readBit!0 (BitStream!13184) tuple2!23010)

(assert (=> b!293300 (= lt!425256 (readBit!0 thiss!1728))))

(declare-fun res!242202 () Bool)

(assert (=> start!65366 (=> (not res!242202) (not e!209435))))

(assert (=> start!65366 (= res!242202 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7590 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65366 e!209435))

(declare-fun inv!12 (BitStream!13184) Bool)

(assert (=> start!65366 (and (inv!12 thiss!1728) e!209434)))

(assert (=> start!65366 true))

(assert (=> start!65366 (array_inv!7202 arr!273)))

(assert (= (and start!65366 res!242202) b!293298))

(assert (= (and b!293298 res!242204) b!293299))

(assert (= (and b!293299 res!242203) b!293300))

(assert (= start!65366 b!293301))

(declare-fun m!428835 () Bool)

(assert (=> b!293298 m!428835))

(declare-fun m!428837 () Bool)

(assert (=> b!293301 m!428837))

(declare-fun m!428839 () Bool)

(assert (=> b!293300 m!428839))

(declare-fun m!428841 () Bool)

(assert (=> start!65366 m!428841))

(declare-fun m!428843 () Bool)

(assert (=> start!65366 m!428843))

(push 1)

(assert (not b!293301))

(assert (not b!293300))

(assert (not start!65366))

(assert (not b!293298))

(check-sat)

(pop 1)

(push 1)

(check-sat)

