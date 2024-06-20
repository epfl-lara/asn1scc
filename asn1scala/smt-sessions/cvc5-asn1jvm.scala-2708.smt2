; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66364 () Bool)

(assert start!66364)

(declare-fun b!297420 () Bool)

(declare-fun e!212910 () Bool)

(declare-datatypes ((array!17801 0))(
  ( (array!17802 (arr!8794 (Array (_ BitVec 32) (_ BitVec 8))) (size!7714 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13432 0))(
  ( (BitStream!13433 (buf!7777 array!17801) (currentByte!14319 (_ BitVec 32)) (currentBit!14314 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13432)

(declare-fun array_inv!7326 (array!17801) Bool)

(assert (=> b!297420 (= e!212910 (array_inv!7326 (buf!7777 thiss!1728)))))

(declare-fun b!297417 () Bool)

(declare-fun res!245476 () Bool)

(declare-fun e!212909 () Bool)

(assert (=> b!297417 (=> (not res!245476) (not e!212909))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297417 (= res!245476 (validate_offset_bits!1 ((_ sign_extend 32) (size!7714 (buf!7777 thiss!1728))) ((_ sign_extend 32) (currentByte!14319 thiss!1728)) ((_ sign_extend 32) (currentBit!14314 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!297418 () Bool)

(declare-fun res!245477 () Bool)

(assert (=> b!297418 (=> (not res!245477) (not e!212909))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!297418 (= res!245477 (bvsge from!505 to!474))))

(declare-fun b!297419 () Bool)

(declare-fun lt!433686 () (_ BitVec 64))

(assert (=> b!297419 (= e!212909 (not (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!433686) (bvsle from!505 lt!433686))))))

(declare-fun arr!273 () array!17801)

(declare-fun arrayBitRangesEq!0 (array!17801 array!17801 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297419 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433686)))

(assert (=> b!297419 (= lt!433686 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7714 arr!273))))))

(declare-datatypes ((Unit!20749 0))(
  ( (Unit!20750) )
))
(declare-fun lt!433685 () Unit!20749)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17801) Unit!20749)

(assert (=> b!297419 (= lt!433685 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun res!245475 () Bool)

(assert (=> start!66364 (=> (not res!245475) (not e!212909))))

(assert (=> start!66364 (= res!245475 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7714 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66364 e!212909))

(declare-fun inv!12 (BitStream!13432) Bool)

(assert (=> start!66364 (and (inv!12 thiss!1728) e!212910)))

(assert (=> start!66364 true))

(assert (=> start!66364 (array_inv!7326 arr!273)))

(assert (= (and start!66364 res!245475) b!297417))

(assert (= (and b!297417 res!245476) b!297418))

(assert (= (and b!297418 res!245477) b!297419))

(assert (= start!66364 b!297420))

(declare-fun m!436237 () Bool)

(assert (=> b!297420 m!436237))

(declare-fun m!436239 () Bool)

(assert (=> b!297417 m!436239))

(declare-fun m!436241 () Bool)

(assert (=> b!297419 m!436241))

(declare-fun m!436243 () Bool)

(assert (=> b!297419 m!436243))

(declare-fun m!436245 () Bool)

(assert (=> start!66364 m!436245))

(declare-fun m!436247 () Bool)

(assert (=> start!66364 m!436247))

(push 1)

(assert (not b!297420))

(assert (not b!297417))

(assert (not start!66364))

(assert (not b!297419))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

