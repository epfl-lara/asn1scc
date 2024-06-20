; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66344 () Bool)

(assert start!66344)

(declare-fun b!297299 () Bool)

(declare-fun e!212790 () Bool)

(assert (=> b!297299 (= e!212790 (not true))))

(declare-datatypes ((array!17781 0))(
  ( (array!17782 (arr!8784 (Array (_ BitVec 32) (_ BitVec 8))) (size!7704 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17781)

(declare-fun arrayBitRangesEq!0 (array!17781 array!17781 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297299 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7704 arr!273))))))

(declare-datatypes ((Unit!20729 0))(
  ( (Unit!20730) )
))
(declare-fun lt!433644 () Unit!20729)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17781) Unit!20729)

(assert (=> b!297299 (= lt!433644 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!297297 () Bool)

(declare-fun res!245387 () Bool)

(assert (=> b!297297 (=> (not res!245387) (not e!212790))))

(declare-datatypes ((BitStream!13412 0))(
  ( (BitStream!13413 (buf!7767 array!17781) (currentByte!14309 (_ BitVec 32)) (currentBit!14304 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13412)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297297 (= res!245387 (validate_offset_bits!1 ((_ sign_extend 32) (size!7704 (buf!7767 thiss!1728))) ((_ sign_extend 32) (currentByte!14309 thiss!1728)) ((_ sign_extend 32) (currentBit!14304 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!245385 () Bool)

(assert (=> start!66344 (=> (not res!245385) (not e!212790))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> start!66344 (= res!245385 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7704 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66344 e!212790))

(declare-fun e!212789 () Bool)

(declare-fun inv!12 (BitStream!13412) Bool)

(assert (=> start!66344 (and (inv!12 thiss!1728) e!212789)))

(assert (=> start!66344 true))

(declare-fun array_inv!7316 (array!17781) Bool)

(assert (=> start!66344 (array_inv!7316 arr!273)))

(declare-fun b!297300 () Bool)

(assert (=> b!297300 (= e!212789 (array_inv!7316 (buf!7767 thiss!1728)))))

(declare-fun b!297298 () Bool)

(declare-fun res!245386 () Bool)

(assert (=> b!297298 (=> (not res!245386) (not e!212790))))

(assert (=> b!297298 (= res!245386 (bvsge from!505 to!474))))

(assert (= (and start!66344 res!245385) b!297297))

(assert (= (and b!297297 res!245387) b!297298))

(assert (= (and b!297298 res!245386) b!297299))

(assert (= start!66344 b!297300))

(declare-fun m!436117 () Bool)

(assert (=> b!297299 m!436117))

(declare-fun m!436119 () Bool)

(assert (=> b!297299 m!436119))

(declare-fun m!436121 () Bool)

(assert (=> b!297297 m!436121))

(declare-fun m!436123 () Bool)

(assert (=> start!66344 m!436123))

(declare-fun m!436125 () Bool)

(assert (=> start!66344 m!436125))

(declare-fun m!436127 () Bool)

(assert (=> b!297300 m!436127))

(push 1)

(assert (not start!66344))

(assert (not b!297297))

(assert (not b!297299))

