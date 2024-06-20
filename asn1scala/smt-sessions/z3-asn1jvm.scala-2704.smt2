; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66342 () Bool)

(assert start!66342)

(declare-fun b!297287 () Bool)

(declare-fun e!212776 () Bool)

(assert (=> b!297287 (= e!212776 (not true))))

(declare-datatypes ((array!17779 0))(
  ( (array!17780 (arr!8783 (Array (_ BitVec 32) (_ BitVec 8))) (size!7703 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17779)

(declare-fun arrayBitRangesEq!0 (array!17779 array!17779 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297287 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7703 arr!273))))))

(declare-datatypes ((Unit!20727 0))(
  ( (Unit!20728) )
))
(declare-fun lt!433641 () Unit!20727)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17779) Unit!20727)

(assert (=> b!297287 (= lt!433641 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!297286 () Bool)

(declare-fun res!245376 () Bool)

(assert (=> b!297286 (=> (not res!245376) (not e!212776))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!297286 (= res!245376 (bvsge from!505 to!474))))

(declare-fun res!245378 () Bool)

(assert (=> start!66342 (=> (not res!245378) (not e!212776))))

(declare-fun nBits!523 () (_ BitVec 64))

(assert (=> start!66342 (= res!245378 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7703 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66342 e!212776))

(declare-datatypes ((BitStream!13410 0))(
  ( (BitStream!13411 (buf!7766 array!17779) (currentByte!14308 (_ BitVec 32)) (currentBit!14303 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13410)

(declare-fun e!212777 () Bool)

(declare-fun inv!12 (BitStream!13410) Bool)

(assert (=> start!66342 (and (inv!12 thiss!1728) e!212777)))

(assert (=> start!66342 true))

(declare-fun array_inv!7315 (array!17779) Bool)

(assert (=> start!66342 (array_inv!7315 arr!273)))

(declare-fun b!297285 () Bool)

(declare-fun res!245377 () Bool)

(assert (=> b!297285 (=> (not res!245377) (not e!212776))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297285 (= res!245377 (validate_offset_bits!1 ((_ sign_extend 32) (size!7703 (buf!7766 thiss!1728))) ((_ sign_extend 32) (currentByte!14308 thiss!1728)) ((_ sign_extend 32) (currentBit!14303 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!297288 () Bool)

(assert (=> b!297288 (= e!212777 (array_inv!7315 (buf!7766 thiss!1728)))))

(assert (= (and start!66342 res!245378) b!297285))

(assert (= (and b!297285 res!245377) b!297286))

(assert (= (and b!297286 res!245376) b!297287))

(assert (= start!66342 b!297288))

(declare-fun m!436105 () Bool)

(assert (=> b!297287 m!436105))

(declare-fun m!436107 () Bool)

(assert (=> b!297287 m!436107))

(declare-fun m!436109 () Bool)

(assert (=> start!66342 m!436109))

(declare-fun m!436111 () Bool)

(assert (=> start!66342 m!436111))

(declare-fun m!436113 () Bool)

(assert (=> b!297285 m!436113))

(declare-fun m!436115 () Bool)

(assert (=> b!297288 m!436115))

(check-sat (not b!297287) (not b!297288) (not start!66342) (not b!297285))
