; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66346 () Bool)

(assert start!66346)

(declare-fun b!297309 () Bool)

(declare-fun res!245394 () Bool)

(declare-fun e!212801 () Bool)

(assert (=> b!297309 (=> (not res!245394) (not e!212801))))

(declare-datatypes ((array!17783 0))(
  ( (array!17784 (arr!8785 (Array (_ BitVec 32) (_ BitVec 8))) (size!7705 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13414 0))(
  ( (BitStream!13415 (buf!7768 array!17783) (currentByte!14310 (_ BitVec 32)) (currentBit!14305 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13414)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297309 (= res!245394 (validate_offset_bits!1 ((_ sign_extend 32) (size!7705 (buf!7768 thiss!1728))) ((_ sign_extend 32) (currentByte!14310 thiss!1728)) ((_ sign_extend 32) (currentBit!14305 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!297310 () Bool)

(declare-fun res!245395 () Bool)

(assert (=> b!297310 (=> (not res!245395) (not e!212801))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!297310 (= res!245395 (bvsge from!505 to!474))))

(declare-fun b!297311 () Bool)

(declare-fun lt!433649 () (_ BitVec 64))

(assert (=> b!297311 (= e!212801 (not (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!433649)))))

(declare-fun arr!273 () array!17783)

(declare-fun arrayBitRangesEq!0 (array!17783 array!17783 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297311 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433649)))

(assert (=> b!297311 (= lt!433649 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7705 arr!273))))))

(declare-datatypes ((Unit!20731 0))(
  ( (Unit!20732) )
))
(declare-fun lt!433650 () Unit!20731)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17783) Unit!20731)

(assert (=> b!297311 (= lt!433650 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun res!245396 () Bool)

(assert (=> start!66346 (=> (not res!245396) (not e!212801))))

(assert (=> start!66346 (= res!245396 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7705 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66346 e!212801))

(declare-fun e!212802 () Bool)

(declare-fun inv!12 (BitStream!13414) Bool)

(assert (=> start!66346 (and (inv!12 thiss!1728) e!212802)))

(assert (=> start!66346 true))

(declare-fun array_inv!7317 (array!17783) Bool)

(assert (=> start!66346 (array_inv!7317 arr!273)))

(declare-fun b!297312 () Bool)

(assert (=> b!297312 (= e!212802 (array_inv!7317 (buf!7768 thiss!1728)))))

(assert (= (and start!66346 res!245396) b!297309))

(assert (= (and b!297309 res!245394) b!297310))

(assert (= (and b!297310 res!245395) b!297311))

(assert (= start!66346 b!297312))

(declare-fun m!436129 () Bool)

(assert (=> b!297309 m!436129))

(declare-fun m!436131 () Bool)

(assert (=> b!297311 m!436131))

(declare-fun m!436133 () Bool)

(assert (=> b!297311 m!436133))

(declare-fun m!436135 () Bool)

(assert (=> start!66346 m!436135))

(declare-fun m!436137 () Bool)

(assert (=> start!66346 m!436137))

(declare-fun m!436139 () Bool)

(assert (=> b!297312 m!436139))

(push 1)

(assert (not start!66346))

(assert (not b!297311))

(assert (not b!297312))

(assert (not b!297309))

(check-sat)

(pop 1)

(push 1)

(check-sat)

