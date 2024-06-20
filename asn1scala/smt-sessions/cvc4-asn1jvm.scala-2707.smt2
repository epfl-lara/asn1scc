; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66362 () Bool)

(assert start!66362)

(declare-fun b!297406 () Bool)

(declare-fun res!245466 () Bool)

(declare-fun e!212895 () Bool)

(assert (=> b!297406 (=> (not res!245466) (not e!212895))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!297406 (= res!245466 (bvsge from!505 to!474))))

(declare-fun res!245468 () Bool)

(assert (=> start!66362 (=> (not res!245468) (not e!212895))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-datatypes ((array!17799 0))(
  ( (array!17800 (arr!8793 (Array (_ BitVec 32) (_ BitVec 8))) (size!7713 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17799)

(assert (=> start!66362 (= res!245468 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7713 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66362 e!212895))

(declare-datatypes ((BitStream!13430 0))(
  ( (BitStream!13431 (buf!7776 array!17799) (currentByte!14318 (_ BitVec 32)) (currentBit!14313 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13430)

(declare-fun e!212896 () Bool)

(declare-fun inv!12 (BitStream!13430) Bool)

(assert (=> start!66362 (and (inv!12 thiss!1728) e!212896)))

(assert (=> start!66362 true))

(declare-fun array_inv!7325 (array!17799) Bool)

(assert (=> start!66362 (array_inv!7325 arr!273)))

(declare-fun b!297407 () Bool)

(assert (=> b!297407 (= e!212895 (not true))))

(declare-fun arrayBitRangesEq!0 (array!17799 array!17799 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297407 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7713 arr!273))))))

(declare-datatypes ((Unit!20747 0))(
  ( (Unit!20748) )
))
(declare-fun lt!433680 () Unit!20747)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17799) Unit!20747)

(assert (=> b!297407 (= lt!433680 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!297405 () Bool)

(declare-fun res!245467 () Bool)

(assert (=> b!297405 (=> (not res!245467) (not e!212895))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297405 (= res!245467 (validate_offset_bits!1 ((_ sign_extend 32) (size!7713 (buf!7776 thiss!1728))) ((_ sign_extend 32) (currentByte!14318 thiss!1728)) ((_ sign_extend 32) (currentBit!14313 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!297408 () Bool)

(assert (=> b!297408 (= e!212896 (array_inv!7325 (buf!7776 thiss!1728)))))

(assert (= (and start!66362 res!245468) b!297405))

(assert (= (and b!297405 res!245467) b!297406))

(assert (= (and b!297406 res!245466) b!297407))

(assert (= start!66362 b!297408))

(declare-fun m!436225 () Bool)

(assert (=> start!66362 m!436225))

(declare-fun m!436227 () Bool)

(assert (=> start!66362 m!436227))

(declare-fun m!436229 () Bool)

(assert (=> b!297407 m!436229))

(declare-fun m!436231 () Bool)

(assert (=> b!297407 m!436231))

(declare-fun m!436233 () Bool)

(assert (=> b!297405 m!436233))

(declare-fun m!436235 () Bool)

(assert (=> b!297408 m!436235))

(push 1)

