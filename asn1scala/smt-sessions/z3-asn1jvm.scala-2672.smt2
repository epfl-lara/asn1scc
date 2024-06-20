; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65454 () Bool)

(assert start!65454)

(declare-fun res!242406 () Bool)

(declare-fun e!209700 () Bool)

(assert (=> start!65454 (=> (not res!242406) (not e!209700))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17554 0))(
  ( (array!17555 (arr!8633 (Array (_ BitVec 32) (_ BitVec 8))) (size!7607 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17554)

(declare-fun to!474 () (_ BitVec 64))

(assert (=> start!65454 (= res!242406 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7607 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65454 e!209700))

(declare-datatypes ((BitStream!13218 0))(
  ( (BitStream!13219 (buf!7670 array!17554) (currentByte!14143 (_ BitVec 32)) (currentBit!14138 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13218)

(declare-fun e!209702 () Bool)

(declare-fun inv!12 (BitStream!13218) Bool)

(assert (=> start!65454 (and (inv!12 thiss!1728) e!209702)))

(assert (=> start!65454 true))

(declare-fun array_inv!7219 (array!17554) Bool)

(assert (=> start!65454 (array_inv!7219 arr!273)))

(declare-fun b!293556 () Bool)

(assert (=> b!293556 (= e!209702 (array_inv!7219 (buf!7670 thiss!1728)))))

(declare-fun b!293555 () Bool)

(assert (=> b!293555 (= e!209700 (not (or (not (= (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!23052 0))(
  ( (tuple2!23053 (_1!12831 Bool) (_2!12831 BitStream!13218)) )
))
(declare-fun lt!425510 () tuple2!23052)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293555 (validate_offset_bits!1 ((_ sign_extend 32) (size!7607 (buf!7670 (_2!12831 lt!425510)))) ((_ sign_extend 32) (currentByte!14143 (_2!12831 lt!425510))) ((_ sign_extend 32) (currentBit!14138 (_2!12831 lt!425510))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!20403 0))(
  ( (Unit!20404) )
))
(declare-fun lt!425511 () Unit!20403)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13218 BitStream!13218 (_ BitVec 64) (_ BitVec 64)) Unit!20403)

(assert (=> b!293555 (= lt!425511 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12831 lt!425510) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBit!0 (BitStream!13218) tuple2!23052)

(assert (=> b!293555 (= lt!425510 (readBit!0 thiss!1728))))

(declare-fun b!293554 () Bool)

(declare-fun res!242408 () Bool)

(assert (=> b!293554 (=> (not res!242408) (not e!209700))))

(assert (=> b!293554 (= res!242408 (bvslt from!505 to!474))))

(declare-fun b!293553 () Bool)

(declare-fun res!242407 () Bool)

(assert (=> b!293553 (=> (not res!242407) (not e!209700))))

(assert (=> b!293553 (= res!242407 (validate_offset_bits!1 ((_ sign_extend 32) (size!7607 (buf!7670 thiss!1728))) ((_ sign_extend 32) (currentByte!14143 thiss!1728)) ((_ sign_extend 32) (currentBit!14138 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!65454 res!242406) b!293553))

(assert (= (and b!293553 res!242407) b!293554))

(assert (= (and b!293554 res!242408) b!293555))

(assert (= start!65454 b!293556))

(declare-fun m!429099 () Bool)

(assert (=> start!65454 m!429099))

(declare-fun m!429101 () Bool)

(assert (=> start!65454 m!429101))

(declare-fun m!429103 () Bool)

(assert (=> b!293556 m!429103))

(declare-fun m!429105 () Bool)

(assert (=> b!293555 m!429105))

(declare-fun m!429107 () Bool)

(assert (=> b!293555 m!429107))

(declare-fun m!429109 () Bool)

(assert (=> b!293555 m!429109))

(declare-fun m!429111 () Bool)

(assert (=> b!293553 m!429111))

(check-sat (not b!293555) (not start!65454) (not b!293556) (not b!293553))
(check-sat)
