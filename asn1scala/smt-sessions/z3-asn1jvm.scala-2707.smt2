; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66360 () Bool)

(assert start!66360)

(declare-fun b!297394 () Bool)

(declare-fun res!245458 () Bool)

(declare-fun e!212883 () Bool)

(assert (=> b!297394 (=> (not res!245458) (not e!212883))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!297394 (= res!245458 (bvsge from!505 to!474))))

(declare-fun b!297393 () Bool)

(declare-fun res!245457 () Bool)

(assert (=> b!297393 (=> (not res!245457) (not e!212883))))

(declare-datatypes ((array!17797 0))(
  ( (array!17798 (arr!8792 (Array (_ BitVec 32) (_ BitVec 8))) (size!7712 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13428 0))(
  ( (BitStream!13429 (buf!7775 array!17797) (currentByte!14317 (_ BitVec 32)) (currentBit!14312 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13428)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297393 (= res!245457 (validate_offset_bits!1 ((_ sign_extend 32) (size!7712 (buf!7775 thiss!1728))) ((_ sign_extend 32) (currentByte!14317 thiss!1728)) ((_ sign_extend 32) (currentBit!14312 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!297395 () Bool)

(assert (=> b!297395 (= e!212883 (not true))))

(declare-fun arr!273 () array!17797)

(declare-fun arrayBitRangesEq!0 (array!17797 array!17797 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297395 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7712 arr!273))))))

(declare-datatypes ((Unit!20745 0))(
  ( (Unit!20746) )
))
(declare-fun lt!433677 () Unit!20745)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17797) Unit!20745)

(assert (=> b!297395 (= lt!433677 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun res!245459 () Bool)

(assert (=> start!66360 (=> (not res!245459) (not e!212883))))

(assert (=> start!66360 (= res!245459 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7712 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66360 e!212883))

(declare-fun e!212885 () Bool)

(declare-fun inv!12 (BitStream!13428) Bool)

(assert (=> start!66360 (and (inv!12 thiss!1728) e!212885)))

(assert (=> start!66360 true))

(declare-fun array_inv!7324 (array!17797) Bool)

(assert (=> start!66360 (array_inv!7324 arr!273)))

(declare-fun b!297396 () Bool)

(assert (=> b!297396 (= e!212885 (array_inv!7324 (buf!7775 thiss!1728)))))

(assert (= (and start!66360 res!245459) b!297393))

(assert (= (and b!297393 res!245457) b!297394))

(assert (= (and b!297394 res!245458) b!297395))

(assert (= start!66360 b!297396))

(declare-fun m!436213 () Bool)

(assert (=> b!297393 m!436213))

(declare-fun m!436215 () Bool)

(assert (=> b!297395 m!436215))

(declare-fun m!436217 () Bool)

(assert (=> b!297395 m!436217))

(declare-fun m!436219 () Bool)

(assert (=> start!66360 m!436219))

(declare-fun m!436221 () Bool)

(assert (=> start!66360 m!436221))

(declare-fun m!436223 () Bool)

(assert (=> b!297396 m!436223))

(check-sat (not b!297396) (not start!66360) (not b!297393) (not b!297395))
