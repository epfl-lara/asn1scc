; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3924 () Bool)

(assert start!3924)

(declare-fun res!15314 () Bool)

(declare-fun e!10738 () Bool)

(assert (=> start!3924 (=> (not res!15314) (not e!10738))))

(declare-fun origOffset!1 () (_ BitVec 64))

(declare-datatypes ((array!987 0))(
  ( (array!988 (arr!849 (Array (_ BitVec 32) (_ BitVec 8))) (size!420 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!800 0))(
  ( (BitStream!801 (buf!783 array!987) (currentByte!1953 (_ BitVec 32)) (currentBit!1948 (_ BitVec 32))) )
))
(declare-fun b!162 () BitStream!800)

(declare-fun newOffset!1 () (_ BitVec 64))

(assert (=> start!3924 (= res!15314 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 newOffset!1) (bvsle newOffset!1 origOffset!1) (bvsle ((_ sign_extend 32) (size!420 (buf!783 b!162))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1953 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1948 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!420 (buf!783 b!162))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!1953 b!162)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!1948 b!162)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!3924 e!10738))

(assert (=> start!3924 true))

(declare-fun e!10739 () Bool)

(declare-fun inv!12 (BitStream!800) Bool)

(assert (=> start!3924 (and (inv!12 b!162) e!10739)))

(declare-fun b!17005 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!17005 (= e!10738 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1948 b!162))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1953 b!162))) ((_ extract 31 0) ((_ sign_extend 32) (size!420 (buf!783 b!162)))))))))

(declare-fun b!17006 () Bool)

(declare-fun array_inv!409 (array!987) Bool)

(assert (=> b!17006 (= e!10739 (array_inv!409 (buf!783 b!162)))))

(assert (= (and start!3924 res!15314) b!17005))

(assert (= start!3924 b!17006))

(declare-fun m!23201 () Bool)

(assert (=> start!3924 m!23201))

(declare-fun m!23203 () Bool)

(assert (=> b!17005 m!23203))

(declare-fun m!23205 () Bool)

(assert (=> b!17006 m!23205))

(push 1)

(assert (not b!17006))

(assert (not start!3924))

(assert (not b!17005))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

