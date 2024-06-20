; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66370 () Bool)

(assert start!66370)

(declare-fun res!245504 () Bool)

(declare-fun e!212945 () Bool)

(assert (=> start!66370 (=> (not res!245504) (not e!212945))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17807 0))(
  ( (array!17808 (arr!8797 (Array (_ BitVec 32) (_ BitVec 8))) (size!7717 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17807)

(assert (=> start!66370 (= res!245504 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7717 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66370 e!212945))

(declare-datatypes ((BitStream!13438 0))(
  ( (BitStream!13439 (buf!7780 array!17807) (currentByte!14322 (_ BitVec 32)) (currentBit!14317 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13438)

(declare-fun e!212946 () Bool)

(declare-fun inv!12 (BitStream!13438) Bool)

(assert (=> start!66370 (and (inv!12 thiss!1728) e!212946)))

(assert (=> start!66370 true))

(declare-fun array_inv!7329 (array!17807) Bool)

(assert (=> start!66370 (array_inv!7329 arr!273)))

(declare-fun b!297453 () Bool)

(declare-fun res!245503 () Bool)

(assert (=> b!297453 (=> (not res!245503) (not e!212945))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297453 (= res!245503 (validate_offset_bits!1 ((_ sign_extend 32) (size!7717 (buf!7780 thiss!1728))) ((_ sign_extend 32) (currentByte!14322 thiss!1728)) ((_ sign_extend 32) (currentBit!14317 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!297454 () Bool)

(declare-fun res!245502 () Bool)

(assert (=> b!297454 (=> (not res!245502) (not e!212945))))

(assert (=> b!297454 (= res!245502 (bvsge from!505 to!474))))

(declare-fun b!297455 () Bool)

(assert (=> b!297455 (= e!212945 (not true))))

(declare-fun arrayBitRangesEq!0 (array!17807 array!17807 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297455 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7717 arr!273))))))

(declare-datatypes ((Unit!20755 0))(
  ( (Unit!20756) )
))
(declare-fun lt!433701 () Unit!20755)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17807) Unit!20755)

(assert (=> b!297455 (= lt!433701 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!297456 () Bool)

(assert (=> b!297456 (= e!212946 (array_inv!7329 (buf!7780 thiss!1728)))))

(assert (= (and start!66370 res!245504) b!297453))

(assert (= (and b!297453 res!245503) b!297454))

(assert (= (and b!297454 res!245502) b!297455))

(assert (= start!66370 b!297456))

(declare-fun m!436273 () Bool)

(assert (=> start!66370 m!436273))

(declare-fun m!436275 () Bool)

(assert (=> start!66370 m!436275))

(declare-fun m!436277 () Bool)

(assert (=> b!297453 m!436277))

(declare-fun m!436279 () Bool)

(assert (=> b!297455 m!436279))

(declare-fun m!436281 () Bool)

(assert (=> b!297455 m!436281))

(declare-fun m!436283 () Bool)

(assert (=> b!297456 m!436283))

(push 1)

(assert (not b!297456))

(assert (not start!66370))

(assert (not b!297453))

(assert (not b!297455))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

