; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66354 () Bool)

(assert start!66354)

(declare-fun res!245431 () Bool)

(declare-fun e!212850 () Bool)

(assert (=> start!66354 (=> (not res!245431) (not e!212850))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17791 0))(
  ( (array!17792 (arr!8789 (Array (_ BitVec 32) (_ BitVec 8))) (size!7709 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17791)

(assert (=> start!66354 (= res!245431 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7709 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66354 e!212850))

(declare-datatypes ((BitStream!13422 0))(
  ( (BitStream!13423 (buf!7772 array!17791) (currentByte!14314 (_ BitVec 32)) (currentBit!14309 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13422)

(declare-fun e!212848 () Bool)

(declare-fun inv!12 (BitStream!13422) Bool)

(assert (=> start!66354 (and (inv!12 thiss!1728) e!212848)))

(assert (=> start!66354 true))

(declare-fun array_inv!7321 (array!17791) Bool)

(assert (=> start!66354 (array_inv!7321 arr!273)))

(declare-fun b!297360 () Bool)

(assert (=> b!297360 (= e!212848 (array_inv!7321 (buf!7772 thiss!1728)))))

(declare-fun b!297357 () Bool)

(declare-fun res!245430 () Bool)

(assert (=> b!297357 (=> (not res!245430) (not e!212850))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297357 (= res!245430 (validate_offset_bits!1 ((_ sign_extend 32) (size!7709 (buf!7772 thiss!1728))) ((_ sign_extend 32) (currentByte!14314 thiss!1728)) ((_ sign_extend 32) (currentBit!14309 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!297358 () Bool)

(declare-fun res!245432 () Bool)

(assert (=> b!297358 (=> (not res!245432) (not e!212850))))

(assert (=> b!297358 (= res!245432 (bvsge from!505 to!474))))

(declare-fun b!297359 () Bool)

(assert (=> b!297359 (= e!212850 (not true))))

(declare-fun arrayBitRangesEq!0 (array!17791 array!17791 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297359 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7709 arr!273))))))

(declare-datatypes ((Unit!20739 0))(
  ( (Unit!20740) )
))
(declare-fun lt!433668 () Unit!20739)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17791) Unit!20739)

(assert (=> b!297359 (= lt!433668 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(assert (= (and start!66354 res!245431) b!297357))

(assert (= (and b!297357 res!245430) b!297358))

(assert (= (and b!297358 res!245432) b!297359))

(assert (= start!66354 b!297360))

(declare-fun m!436177 () Bool)

(assert (=> start!66354 m!436177))

(declare-fun m!436179 () Bool)

(assert (=> start!66354 m!436179))

(declare-fun m!436181 () Bool)

(assert (=> b!297360 m!436181))

(declare-fun m!436183 () Bool)

(assert (=> b!297357 m!436183))

(declare-fun m!436185 () Bool)

(assert (=> b!297359 m!436185))

(declare-fun m!436187 () Bool)

(assert (=> b!297359 m!436187))

(check-sat (not b!297360) (not start!66354) (not b!297357) (not b!297359))
