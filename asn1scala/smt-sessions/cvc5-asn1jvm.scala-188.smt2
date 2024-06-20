; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3940 () Bool)

(assert start!3940)

(declare-fun res!15319 () Bool)

(declare-fun e!10748 () Bool)

(assert (=> start!3940 (=> (not res!15319) (not e!10748))))

(declare-fun origOffset!1 () (_ BitVec 64))

(declare-datatypes ((array!992 0))(
  ( (array!993 (arr!850 (Array (_ BitVec 32) (_ BitVec 8))) (size!421 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!802 0))(
  ( (BitStream!803 (buf!784 array!992) (currentByte!1956 (_ BitVec 32)) (currentBit!1951 (_ BitVec 32))) )
))
(declare-fun b!162 () BitStream!802)

(declare-fun newOffset!1 () (_ BitVec 64))

(assert (=> start!3940 (= res!15319 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 newOffset!1) (bvsle newOffset!1 origOffset!1) (bvsle ((_ sign_extend 32) (size!421 (buf!784 b!162))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1956 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1951 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!421 (buf!784 b!162))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!1956 b!162)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!1951 b!162)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!3940 e!10748))

(assert (=> start!3940 true))

(declare-fun e!10749 () Bool)

(declare-fun inv!12 (BitStream!802) Bool)

(assert (=> start!3940 (and (inv!12 b!162) e!10749)))

(declare-fun b!17013 () Bool)

(declare-fun res!15320 () Bool)

(assert (=> b!17013 (=> (not res!15320) (not e!10748))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!17013 (= res!15320 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1951 b!162))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1956 b!162))) ((_ extract 31 0) ((_ sign_extend 32) (size!421 (buf!784 b!162))))))))

(declare-fun b!17014 () Bool)

(assert (=> b!17014 (= e!10748 (bvslt origOffset!1 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!17015 () Bool)

(declare-fun array_inv!410 (array!992) Bool)

(assert (=> b!17015 (= e!10749 (array_inv!410 (buf!784 b!162)))))

(assert (= (and start!3940 res!15319) b!17013))

(assert (= (and b!17013 res!15320) b!17014))

(assert (= start!3940 b!17015))

(declare-fun m!23211 () Bool)

(assert (=> start!3940 m!23211))

(declare-fun m!23213 () Bool)

(assert (=> b!17013 m!23213))

(declare-fun m!23215 () Bool)

(assert (=> b!17015 m!23215))

(push 1)

(assert (not b!17013))

(assert (not start!3940))

(assert (not b!17015))

(check-sat)

(pop 1)

(push 1)

(check-sat)

