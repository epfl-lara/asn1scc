; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66338 () Bool)

(assert start!66338)

(declare-fun b!297264 () Bool)

(declare-fun e!212751 () Bool)

(declare-datatypes ((array!17775 0))(
  ( (array!17776 (arr!8781 (Array (_ BitVec 32) (_ BitVec 8))) (size!7701 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13406 0))(
  ( (BitStream!13407 (buf!7764 array!17775) (currentByte!14306 (_ BitVec 32)) (currentBit!14301 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13406)

(declare-fun array_inv!7313 (array!17775) Bool)

(assert (=> b!297264 (= e!212751 (array_inv!7313 (buf!7764 thiss!1728)))))

(declare-fun res!245360 () Bool)

(declare-fun e!212753 () Bool)

(assert (=> start!66338 (=> (not res!245360) (not e!212753))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arr!273 () array!17775)

(assert (=> start!66338 (= res!245360 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7701 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66338 e!212753))

(declare-fun inv!12 (BitStream!13406) Bool)

(assert (=> start!66338 (and (inv!12 thiss!1728) e!212751)))

(assert (=> start!66338 true))

(assert (=> start!66338 (array_inv!7313 arr!273)))

(declare-fun b!297262 () Bool)

(declare-fun res!245358 () Bool)

(assert (=> b!297262 (=> (not res!245358) (not e!212753))))

(assert (=> b!297262 (= res!245358 (bvsge from!505 to!474))))

(declare-fun b!297261 () Bool)

(declare-fun res!245359 () Bool)

(assert (=> b!297261 (=> (not res!245359) (not e!212753))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297261 (= res!245359 (validate_offset_bits!1 ((_ sign_extend 32) (size!7701 (buf!7764 thiss!1728))) ((_ sign_extend 32) (currentByte!14306 thiss!1728)) ((_ sign_extend 32) (currentBit!14301 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!297263 () Bool)

(declare-fun lt!433635 () (_ BitVec 64))

(assert (=> b!297263 (= e!212753 (not (or (= ((_ sign_extend 32) (size!7701 arr!273)) #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!433635 ((_ sign_extend 32) (size!7701 arr!273)))))))))

(declare-fun arrayBitRangesEq!0 (array!17775 array!17775 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297263 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433635)))

(assert (=> b!297263 (= lt!433635 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7701 arr!273))))))

(declare-datatypes ((Unit!20723 0))(
  ( (Unit!20724) )
))
(declare-fun lt!433634 () Unit!20723)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17775) Unit!20723)

(assert (=> b!297263 (= lt!433634 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(assert (= (and start!66338 res!245360) b!297261))

(assert (= (and b!297261 res!245359) b!297262))

(assert (= (and b!297262 res!245358) b!297263))

(assert (= start!66338 b!297264))

(declare-fun m!436081 () Bool)

(assert (=> b!297264 m!436081))

(declare-fun m!436083 () Bool)

(assert (=> start!66338 m!436083))

(declare-fun m!436085 () Bool)

(assert (=> start!66338 m!436085))

(declare-fun m!436087 () Bool)

(assert (=> b!297261 m!436087))

(declare-fun m!436089 () Bool)

(assert (=> b!297263 m!436089))

(declare-fun m!436091 () Bool)

(assert (=> b!297263 m!436091))

(push 1)

(assert (not b!297264))

(assert (not b!297261))

(assert (not start!66338))

(assert (not b!297263))

(check-sat)

(pop 1)

(push 1)

(check-sat)

