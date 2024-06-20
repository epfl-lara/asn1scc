; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66350 () Bool)

(assert start!66350)

(declare-fun b!297334 () Bool)

(declare-fun res!245412 () Bool)

(declare-fun e!212825 () Bool)

(assert (=> b!297334 (=> (not res!245412) (not e!212825))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!297334 (= res!245412 (bvsge from!505 to!474))))

(declare-fun b!297333 () Bool)

(declare-fun res!245413 () Bool)

(assert (=> b!297333 (=> (not res!245413) (not e!212825))))

(declare-datatypes ((array!17787 0))(
  ( (array!17788 (arr!8787 (Array (_ BitVec 32) (_ BitVec 8))) (size!7707 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13418 0))(
  ( (BitStream!13419 (buf!7770 array!17787) (currentByte!14312 (_ BitVec 32)) (currentBit!14307 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13418)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297333 (= res!245413 (validate_offset_bits!1 ((_ sign_extend 32) (size!7707 (buf!7770 thiss!1728))) ((_ sign_extend 32) (currentByte!14312 thiss!1728)) ((_ sign_extend 32) (currentBit!14307 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!245414 () Bool)

(assert (=> start!66350 (=> (not res!245414) (not e!212825))))

(declare-fun arr!273 () array!17787)

(assert (=> start!66350 (= res!245414 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7707 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66350 e!212825))

(declare-fun e!212824 () Bool)

(declare-fun inv!12 (BitStream!13418) Bool)

(assert (=> start!66350 (and (inv!12 thiss!1728) e!212824)))

(assert (=> start!66350 true))

(declare-fun array_inv!7319 (array!17787) Bool)

(assert (=> start!66350 (array_inv!7319 arr!273)))

(declare-fun b!297336 () Bool)

(assert (=> b!297336 (= e!212824 (array_inv!7319 (buf!7770 thiss!1728)))))

(declare-fun b!297335 () Bool)

(declare-fun lt!433661 () (_ BitVec 64))

(assert (=> b!297335 (= e!212825 (not (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!433661)))))

(declare-fun arrayBitRangesEq!0 (array!17787 array!17787 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297335 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433661)))

(assert (=> b!297335 (= lt!433661 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7707 arr!273))))))

(declare-datatypes ((Unit!20735 0))(
  ( (Unit!20736) )
))
(declare-fun lt!433662 () Unit!20735)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17787) Unit!20735)

(assert (=> b!297335 (= lt!433662 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(assert (= (and start!66350 res!245414) b!297333))

(assert (= (and b!297333 res!245413) b!297334))

(assert (= (and b!297334 res!245412) b!297335))

(assert (= start!66350 b!297336))

(declare-fun m!436153 () Bool)

(assert (=> b!297333 m!436153))

(declare-fun m!436155 () Bool)

(assert (=> start!66350 m!436155))

(declare-fun m!436157 () Bool)

(assert (=> start!66350 m!436157))

(declare-fun m!436159 () Bool)

(assert (=> b!297336 m!436159))

(declare-fun m!436161 () Bool)

(assert (=> b!297335 m!436161))

(declare-fun m!436163 () Bool)

(assert (=> b!297335 m!436163))

(push 1)

(assert (not b!297333))

(assert (not start!66350))

(assert (not b!297335))

(assert (not b!297336))

(check-sat)

(pop 1)

(push 1)

(check-sat)

