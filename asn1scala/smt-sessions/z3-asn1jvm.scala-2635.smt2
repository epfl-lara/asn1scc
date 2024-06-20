; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65046 () Bool)

(assert start!65046)

(declare-fun b!291929 () Bool)

(declare-fun e!208117 () Bool)

(assert (=> b!291929 (= e!208117 (not true))))

(declare-datatypes ((array!17329 0))(
  ( (array!17330 (arr!8528 (Array (_ BitVec 32) (_ BitVec 8))) (size!7502 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17329)

(declare-fun arrayBitRangesEq!0 (array!17329 array!17329 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291929 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7502 arr!273))))))

(declare-datatypes ((Unit!20293 0))(
  ( (Unit!20294) )
))
(declare-fun lt!424434 () Unit!20293)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17329) Unit!20293)

(assert (=> b!291929 (= lt!424434 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!291930 () Bool)

(declare-fun e!208116 () Bool)

(declare-datatypes ((BitStream!13014 0))(
  ( (BitStream!13015 (buf!7568 array!17329) (currentByte!14011 (_ BitVec 32)) (currentBit!14006 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13014)

(declare-fun array_inv!7114 (array!17329) Bool)

(assert (=> b!291930 (= e!208116 (array_inv!7114 (buf!7568 thiss!1728)))))

(declare-fun b!291927 () Bool)

(declare-fun res!241159 () Bool)

(assert (=> b!291927 (=> (not res!241159) (not e!208117))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291927 (= res!241159 (validate_offset_bits!1 ((_ sign_extend 32) (size!7502 (buf!7568 thiss!1728))) ((_ sign_extend 32) (currentByte!14011 thiss!1728)) ((_ sign_extend 32) (currentBit!14006 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!291928 () Bool)

(declare-fun res!241158 () Bool)

(assert (=> b!291928 (=> (not res!241158) (not e!208117))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!291928 (= res!241158 (bvsge from!505 to!474))))

(declare-fun res!241160 () Bool)

(assert (=> start!65046 (=> (not res!241160) (not e!208117))))

(assert (=> start!65046 (= res!241160 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7502 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65046 e!208117))

(declare-fun inv!12 (BitStream!13014) Bool)

(assert (=> start!65046 (and (inv!12 thiss!1728) e!208116)))

(assert (=> start!65046 true))

(assert (=> start!65046 (array_inv!7114 arr!273)))

(assert (= (and start!65046 res!241160) b!291927))

(assert (= (and b!291927 res!241159) b!291928))

(assert (= (and b!291928 res!241158) b!291929))

(assert (= start!65046 b!291930))

(declare-fun m!427357 () Bool)

(assert (=> b!291929 m!427357))

(declare-fun m!427359 () Bool)

(assert (=> b!291929 m!427359))

(declare-fun m!427361 () Bool)

(assert (=> b!291930 m!427361))

(declare-fun m!427363 () Bool)

(assert (=> b!291927 m!427363))

(declare-fun m!427365 () Bool)

(assert (=> start!65046 m!427365))

(declare-fun m!427367 () Bool)

(assert (=> start!65046 m!427367))

(check-sat (not start!65046) (not b!291927) (not b!291929) (not b!291930))
