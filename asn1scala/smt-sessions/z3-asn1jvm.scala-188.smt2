; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3942 () Bool)

(assert start!3942)

(declare-fun res!15325 () Bool)

(declare-fun e!10756 () Bool)

(assert (=> start!3942 (=> (not res!15325) (not e!10756))))

(declare-fun origOffset!1 () (_ BitVec 64))

(declare-datatypes ((array!994 0))(
  ( (array!995 (arr!851 (Array (_ BitVec 32) (_ BitVec 8))) (size!422 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!804 0))(
  ( (BitStream!805 (buf!785 array!994) (currentByte!1957 (_ BitVec 32)) (currentBit!1952 (_ BitVec 32))) )
))
(declare-fun b!162 () BitStream!804)

(declare-fun newOffset!1 () (_ BitVec 64))

(assert (=> start!3942 (= res!15325 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 newOffset!1) (bvsle newOffset!1 origOffset!1) (bvsle ((_ sign_extend 32) (size!422 (buf!785 b!162))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1957 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1952 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!422 (buf!785 b!162))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!1957 b!162)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!1952 b!162)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!3942 e!10756))

(assert (=> start!3942 true))

(declare-fun e!10758 () Bool)

(declare-fun inv!12 (BitStream!804) Bool)

(assert (=> start!3942 (and (inv!12 b!162) e!10758)))

(declare-fun b!17022 () Bool)

(declare-fun res!15326 () Bool)

(assert (=> b!17022 (=> (not res!15326) (not e!10756))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!17022 (= res!15326 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1952 b!162))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1957 b!162))) ((_ extract 31 0) ((_ sign_extend 32) (size!422 (buf!785 b!162))))))))

(declare-fun b!17023 () Bool)

(assert (=> b!17023 (= e!10756 (bvslt origOffset!1 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!17024 () Bool)

(declare-fun array_inv!411 (array!994) Bool)

(assert (=> b!17024 (= e!10758 (array_inv!411 (buf!785 b!162)))))

(assert (= (and start!3942 res!15325) b!17022))

(assert (= (and b!17022 res!15326) b!17023))

(assert (= start!3942 b!17024))

(declare-fun m!23217 () Bool)

(assert (=> start!3942 m!23217))

(declare-fun m!23219 () Bool)

(assert (=> b!17022 m!23219))

(declare-fun m!23221 () Bool)

(assert (=> b!17024 m!23221))

(check-sat (not b!17022) (not b!17024) (not start!3942))
(check-sat)
