; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65364 () Bool)

(assert start!65364)

(declare-fun b!293289 () Bool)

(declare-fun e!209421 () Bool)

(declare-datatypes ((array!17512 0))(
  ( (array!17513 (arr!8615 (Array (_ BitVec 32) (_ BitVec 8))) (size!7589 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13182 0))(
  ( (BitStream!13183 (buf!7652 array!17512) (currentByte!14116 (_ BitVec 32)) (currentBit!14111 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13182)

(declare-fun array_inv!7201 (array!17512) Bool)

(assert (=> b!293289 (= e!209421 (array_inv!7201 (buf!7652 thiss!1728)))))

(declare-fun res!242195 () Bool)

(declare-fun e!209423 () Bool)

(assert (=> start!65364 (=> (not res!242195) (not e!209423))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arr!273 () array!17512)

(assert (=> start!65364 (= res!242195 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7589 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65364 e!209423))

(declare-fun inv!12 (BitStream!13182) Bool)

(assert (=> start!65364 (and (inv!12 thiss!1728) e!209421)))

(assert (=> start!65364 true))

(assert (=> start!65364 (array_inv!7201 arr!273)))

(declare-fun b!293287 () Bool)

(declare-fun res!242194 () Bool)

(assert (=> b!293287 (=> (not res!242194) (not e!209423))))

(assert (=> b!293287 (= res!242194 (bvslt from!505 to!474))))

(declare-fun b!293288 () Bool)

(declare-fun lt!425249 () (_ BitVec 32))

(assert (=> b!293288 (= e!209423 (or (bvslt lt!425249 #b00000000000000000000000000000000) (bvsge lt!425249 (size!7589 arr!273))))))

(assert (=> b!293288 (= lt!425249 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-datatypes ((tuple2!23008 0))(
  ( (tuple2!23009 (_1!12809 Bool) (_2!12809 BitStream!13182)) )
))
(declare-fun lt!425250 () tuple2!23008)

(declare-fun readBit!0 (BitStream!13182) tuple2!23008)

(assert (=> b!293288 (= lt!425250 (readBit!0 thiss!1728))))

(declare-fun b!293286 () Bool)

(declare-fun res!242193 () Bool)

(assert (=> b!293286 (=> (not res!242193) (not e!209423))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293286 (= res!242193 (validate_offset_bits!1 ((_ sign_extend 32) (size!7589 (buf!7652 thiss!1728))) ((_ sign_extend 32) (currentByte!14116 thiss!1728)) ((_ sign_extend 32) (currentBit!14111 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!65364 res!242195) b!293286))

(assert (= (and b!293286 res!242193) b!293287))

(assert (= (and b!293287 res!242194) b!293288))

(assert (= start!65364 b!293289))

(declare-fun m!428825 () Bool)

(assert (=> b!293289 m!428825))

(declare-fun m!428827 () Bool)

(assert (=> start!65364 m!428827))

(declare-fun m!428829 () Bool)

(assert (=> start!65364 m!428829))

(declare-fun m!428831 () Bool)

(assert (=> b!293288 m!428831))

(declare-fun m!428833 () Bool)

(assert (=> b!293286 m!428833))

(check-sat (not b!293286) (not b!293289) (not b!293288) (not start!65364))
(check-sat)
